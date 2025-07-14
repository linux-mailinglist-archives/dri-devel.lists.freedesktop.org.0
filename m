Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDB0B04239
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 16:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DB210E214;
	Mon, 14 Jul 2025 14:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qNtw+AIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B05F10E214
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:53:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b2c4331c50eso4075919a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752504825; x=1753109625;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRS7KVxRS0W+fx13p1N+pmmO7RXDwXvW5xZaAlDLlWI=;
 b=qNtw+AIFNrPa+cfebJq8NhG7sakttcmCyWeeHPdeRqYbLpzQTfo2+HNDCMDU+YEare
 xp04JDVY/pM3+r9IjASgt8nY1pEQqgbstRm7Yl12E5+9dh7LQMcsl9SE9On09CqLvESy
 W9/FICwj7KkDZdWioga2aJ82FEn/tnpbezPiDFudPi0QSW9O51aB0/xn2eI+jWIrQCbp
 miY5RCs/tMtOMD55bs5srHfRV14TrzlPbjBFhwrlTcv5f4ZIewMFEUgKU0K0x+9qg/Wf
 oWS/BqQ7ofWRKlD8AQ6b+aTTUIXfE4MZD2Yc/58ZDj/2nhBVfcc6qXGHXv/CKLWQvawN
 aiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752504825; x=1753109625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRS7KVxRS0W+fx13p1N+pmmO7RXDwXvW5xZaAlDLlWI=;
 b=MVLszvMtC+W7sE+16mZwBjqW0Y8rffc5eXFgwa8cI4z6agblmF0IAjhiX7Yp3TKIZ2
 vi3+Dpi5NUFzCaQfWAfB0jAUiX5ddZ+B8/R2rVxgvubJifolKuWBfpXeSaRgzoUZNVn6
 w16z6E+dJ5b0cMreynoJn5tajxhvVNiCiWfv7T08PRZG50RPw4PyhGXlne6RWQHobXv6
 WPWO6wghNWntSaD22w42A/bBjXingNZG74qzIPyhvXNNh+kH1T1FkhOBM2mx6b2QTuaD
 /pJWgszdchi/hjdBhA1w5sE4sPq1eudImEsdIbnYvGYp/krSxM74nOLBbRax4Ivl9t4U
 uYpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4lPsKLZ0DoVwVrH05WzVZvBE6dVe/yVueS+QVNOQswfZKBJTXMRiDkK3X3jJvmMGs1HueWqOy/Tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy34LlFLZetg2lKlJ8NDh3xsmmz89YUW+pGN+HkXr6nSF4IgW4Y
 4/V3vVmwMHrP9cc2+fMMUnLjjnYXmvtE7XWui0pYDjrqYhO2/5w8OmLUmsdpbShY5QkrGls9tbC
 CtxbpXVJFzudeftUqUfIv/YaqiGVbTUUVdUv8sHR8
X-Gm-Gg: ASbGnctAPUgcqtumj6Hw5VqkdQcxzAc6CBUru7aCb1fGsmP52QJ3Vn+Nycp31GvGReY
 9+lvgJDebfQgQ+EYhkoweAqKHZzx/2sckxHKTZ8AVkwYiYGfJaYdv2PW56QCQF2JvRDxYZrXc+Y
 C710+I09bKqq4JmdTkBO7x+drkWUIczDLFzUEWovCWaAGtL94o7yYq9nCjlfyUmLPsw/UU6Om1+
 rtucDp1bo4+qTIZ/PXL6wBrR5XZ8CbYfNLBIg==
X-Google-Smtp-Source: AGHT+IEmImtWKne0fXh/9EoZheSYc9ViDZzryJZ8eda866NF14PYMINb7G149CT3MobK1jQkkMisymqVEAyEM83YC5M=
X-Received: by 2002:a17:90b:54cd:b0:313:d6d9:8891 with SMTP id
 98e67ed59e1d1-31c4cca42e0mr19743605a91.3.1752504824807; Mon, 14 Jul 2025
 07:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250714110229.141221-1-krakow20@gmail.com>
 <20250714144837.GA2996266@joelnvbox>
In-Reply-To: <20250714144837.GA2996266@joelnvbox>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Jul 2025 16:53:28 +0200
X-Gm-Features: Ac12FXyf7w4PNNBTUqz17dhSkzaXwGCVMM7xX5_IyWW7AMetiwQzySVecf0ZfGo
Message-ID: <CAH5fLgiFOFm+Lh0K_PDZ2eCFa0EAOMk9GRh0Cgh2sm8fay=qnA@mail.gmail.com>
Subject: Re: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Rhys Lloyd <krakow20@gmail.com>, acourbot@nvidia.com, dakr@kernel.org, 
 rust-for-linux@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 14, 2025 at 4:49=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Hello, Rhys,
>
> On Mon, Jul 14, 2025 at 04:02:23AM -0700, Rhys Lloyd wrote:
> > Instead of the data field containing a u32 and changing the alignment,
> > change data to [u8; 4] and convert to u32 with a helper function.
> > Removes another magic number by making the struct the same size as
> > the data it needs to read, allowing the use of
> > `size_of::<PmuLookupTableEntry>()`
> >
> > Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> > ---
> > Changes in v2:
> > - get_data helper function renamed to data
> >
> > ---
> >  drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbi=
os.rs
> > index 5b5d9f38cbb3..339c66e63c7e 100644
> > --- a/drivers/gpu/nova-core/vbios.rs
> > +++ b/drivers/gpu/nova-core/vbios.rs
> > @@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self> =
{
> >  struct PmuLookupTableEntry {
> >      application_id: u8,
> >      target_id: u8,
> > -    data: u32,
> > +    data: [u8; 4],
>
> Instead of this, could we make the struct as #repr[(C, packed)] or does t=
hat
> not work for some reason?

It would probably, but packed structs aren't very nice to work with
because Rust has to be really careful to never generate a reference to
unaligned fields.

Alice
