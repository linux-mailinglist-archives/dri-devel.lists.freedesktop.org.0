Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADC896E6C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 13:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1784E112A3E;
	Wed,  3 Apr 2024 11:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Kfve3jVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1BB112A3E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 11:45:06 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-ddda842c399so4993439276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712144705; x=1712749505;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6ji7ukJRPmQhB2qcavC1ueRDs+bCKiR3kOICzSoFek=;
 b=Kfve3jVXRiIKyagHA1DNmouphsXeook7g33nPScs3I3XOcuV7ISrh627CbvN0V9LQq
 WlDQPLsRk/nhCxu0HbmoM6644MzycFruSUQpGM+3u56lm78sr1F+RqL8L6XH4NT2kQGZ
 vlqmvmyuu/Q0hLk/L0GU3X5U8/F/k4CyaxSXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712144705; x=1712749505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6ji7ukJRPmQhB2qcavC1ueRDs+bCKiR3kOICzSoFek=;
 b=AskKPKoB0/ysu6NJ3iwyKDdBDKxrvaks1SR68Hz4FkMM3g7Ij0c4QjppQYqwfQpVI5
 KmjDhpzn7GlmLrj7CsB2kat5FLYJ2lDJJmX+gPPlnsBxE2P5NFNaPpksX0GcbneVBJFp
 RKlYPK8rCq9I+3MNBqRqVhqbv9GTg+JKupYgtPxSpjMqQlnquZhb87APe8jc1VDo9RSK
 Gb0IhrMvXqO5hfQCRDKZ5AWA6o7ED1pxXVz+hEIbgOe2tWeS1MwtMP1+FJPbzSA6TRR/
 svInxcFs2mrbTmGf+iVgL9AgJACTASQEMzOKKWxFB4cFDN3SMcBWrlpkYs12CUemrT8v
 OqAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCd6TOUsVtsup/F9s3QUjc4sIZGmSpGGAj247oU8G2izp+9dJhLofO0VYr6AIVRJEsIdXO+9MqGFJp9tVRERoHeyQTCSJINniOLOwg25lC
X-Gm-Message-State: AOJu0YzW93Ol4eOGB6WRYQmL62NAFOXLgvYwXki2hKUrCawZKA8n9dOh
 eitsNTnSlevE8vBz9Z3CBv0XRga2WXuFXYe+Iws0t7RQS5QuOQU2n6d0kEz066r5fvwZPENXtRu
 rpaDfmr0erZtzEIBZxHsDDIhxsNKrj2luNV5I
X-Google-Smtp-Source: AGHT+IFKuYjWza+zXPjWPA5Q0rMCrbgx3HRhz5yHT+6Ft++wJj/e+mXelEtAPaLvU/P/29AJlfH7r0I4bvMQuFJPxtI=
X-Received: by 2002:a25:b84a:0:b0:dcd:65fa:ea06 with SMTP id
 b10-20020a25b84a000000b00dcd65faea06mr14285654ybm.24.1712144705293; Wed, 03
 Apr 2024 04:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-6-zack.rusin@broadcom.com>
 <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
In-Reply-To: <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 3 Apr 2024 07:44:54 -0400
Message-ID: <CABQX2QPW83H5T9Gc5yT8a277tNgjEvC-xK6wDGewq+vQEYZ=2A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 stable@vger.kernel.org
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

On Wed, Apr 3, 2024 at 3:43=E2=80=AFAM Pekka Paalanen
<pekka.paalanen@collabora.com> wrote:
>
> On Tue,  2 Apr 2024 19:28:13 -0400
> Zack Rusin <zack.rusin@broadcom.com> wrote:
>
> > The table of primary plane formats wasn't sorted at all, leading to
> > applications picking our least desirable formats by defaults.
> >
> > Sort the primary plane formats according to our order of preference.
>
> This is good.
>
> > Fixes IGT's kms_atomic plane-invalid-params which assumes that the
> > preferred format is a 32bpp format.
>
> That sounds strange, why would IGT depend on preferred format being
> 32bpp?
>
> That must be an oversight. IGT cannot dictate the format that hardware
> must prefer. XRGB8888 is strongly suggested to be supported in general,
> but why also preferred?

I think it's just a side-effect of the pixman's assert that's failing:
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/lib/igt_fb.c#n4190
i.e. pixman assumes everything is 4 byte aligned.
I should have rephrased the message as "IGT assumes that the preferred
fb format is 4 byte aligned because our 16bpp formats are packed and
pixman can't convert them".

z
