Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB48A27D0F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 22:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6181310E03B;
	Tue,  4 Feb 2025 21:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="rUMyxT+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20C510E03B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 21:09:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4368a293339so69909165e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1738703364; x=1739308164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
 b=rUMyxT+k+8xP2lzhRtjpJjDyTTP3wWYyNRGZPrEgvLqX5M+fsD/FX/+P8/+yStYCQR
 CaIuRW6liKNA94dEyP0JfyB/U3+vGRjf9CFMCfHSY8sDFc3aqcN/0uq73DCClreCs6b0
 rpoQ8BZrhVt4ox70oDKBRmHugq8o1NtNQ4+sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738703364; x=1739308164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hU4QrAbDQR1o2bnoBznVmRjsUjgFoPERHNCe0D3R9dg=;
 b=c5otzJ81CY2s5BwtvJAngzp71nxmIkdmPZFlCvZRJOHzMrbyoKRgFT8fPeuMYfM9xP
 DVWsNCiViEWA8v+c3nysorruSMRKREwksjFpuAYk68P0ouTB/9QmtTs0ZvRZKAxA1Q9V
 lMeHExQ4ihoCNCTObyODwuGLL2eGW7L9zCBD9EcK55HYdeh851OvJhY3E9gDldigGKEr
 cDk/P9iUemSPAxNdqBt8BAPBFEtHpccsZa0iqk1T6uDeSrAzcush8vt4WLTWcfkSXuNT
 t2hJPozBK6j/mcaP5kBHCj5iHr/yXR1EsMq+SVeYuI3dy+NKJEMbkWFAOrp/v0VnTPTQ
 MsSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqKjbluovrBIhDgapjST1PFcA85sGTkUslew0dVnkA7vwm4rVAsoZpG9Oe+6QHKU6otHA2MxwVlh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0wcKjjKfDLWer77LQM7FkhKezByPNyJqgsX/0oLXvJaB+826M
 f2KMSRZklsAe+6OPwPlEGRaSR1sUBayem6WQo7j7M4/S91RBqJrqDV7SLbc/iSJyL+162aAftCf
 hclZfRAOxJXwyJgxDsfUpBR7CP1juVYZdbr+f8A==
X-Gm-Gg: ASbGnct8STRuSr7DD6wUb7M7Ed6r8HwFvgSKqtoMAsH22YojXXqZ/sY4r9K2inUgfD9
 9uv3Mu9XKstdVvhIopf+UUjv4UaB7V7kRd5scKnTzs5/k3HP8xHtr+FV5h7lEM0m/b3nPFXJW
X-Google-Smtp-Source: AGHT+IG1wU/phrvdmWOZ6gg4Qkaj9tiLGHlTlII39K2KsIGA/7PJCQGdfM9Y7R/VJVyH/LBFDX1pLGfA1F+6yTJrKno=
X-Received: by 2002:a05:600c:5492:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-4390d5697b4mr753735e9.21.1738703363904; Tue, 04 Feb 2025
 13:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2> <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
In-Reply-To: <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 4 Feb 2025 16:09:13 -0500
X-Gm-Features: AWEUYZmCOUkLm9MpjL2MDd5EZQ1gMNJEykz-KDiUu51t6tTmXr73ZDfIU09FM3Q
Message-ID: <CAEXW_YQQey_QweH+favrXPhrEkVwyqCXRG+UBn-oG6wb+n4+gA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
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

On Tue, Feb 4, 2025 at 1:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon, Feb 03, 2025 at 03:24:10PM -0500, Joel Fernandes wrote:
> > Hi Danilo,
> >
> > On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > > +#[pin_data]
> > > +pub(crate) struct NovaCore {
> > > +    #[pin]
> > > +    pub(crate) gpu: Gpu,
> > > +}
> >
> > I am curious what is the need for pinning here in the patch in its curr=
ent
> > form, is it for future-proofing?
>
> Yes, it is.
>
> It's not always needed, but since I know that further down the road we'll=
 need
> at least a few mutexes, it seemed reasonable to already consider it.

It seems reasonable to me as well, I would probably also add a code
comment there about what is expected to be unmovable in the future
(Just in case any code readers don't raise the same question I was
raising).

The source of the confusion for a reader could be the documentation
expecting a #[pin].

 - Joel
