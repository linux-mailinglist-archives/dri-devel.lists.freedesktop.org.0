Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8CAEEF5C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 09:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EA610E508;
	Tue,  1 Jul 2025 07:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJPSQuDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2C10E508
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 07:04:29 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so6101952a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751353468; x=1751958268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtkdV26JdyrvlELIn9L73S5AOvwqd52zjPqfmNSwWoE=;
 b=TJPSQuDK8WT9bH4eRwS4Z/sRFiYDH5n1FgywaJmFW3uMKfbigWinVxmvrLp8cTmM0f
 pR7jC/OW8Gd+N3jOWfNBe99hB7pKHCCXGKqp/5IRpJUOjTkSo+LfZHAjUP7AiLmq4Y+e
 0ArssBQC27tgZvFUn6j5Om5IQ2v+E+mTlwWxKmAGD1jXCzLrbnvuVGhayU9r6ghPX4QR
 5JS+SO3McrVOQv2fyTxwBp3MmlGLnrnwUjBM6Z9JbcWR9a2pyS+W4FcSwIgHE+/ti3lG
 4wejQISzR4pqMBGDaJbrCxZB32lCNVXqcmo3nNpkb9mq9v5BO4NFKrBnXYASTdbl1mK2
 nlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751353468; x=1751958268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtkdV26JdyrvlELIn9L73S5AOvwqd52zjPqfmNSwWoE=;
 b=n/zVWV73+Q9LHjxr3m1chb+uzmI8JnVgmFixibH0NtaFr9sEY7qvIpm6CdLJzMtiEt
 NIf7nC1KBdZssKdqe3gnyRp+K6NvKNacaODS6Pb8o0k/mkn+9pvRAcZ0ml0IzlFAYLYc
 IZC6Cb7IGM3wiDYIPsGLepiXTShnL0ylEvVbcY6qgB+iSwOPOizYYGdof6akMfB/pnJL
 hnqLON/UVFvSaLhZ3hvxELUcrKDE75CtcxpkWXRzJSR72yaOUgP0JDUeibAnoW0F62/k
 eXrlPoVwlMAmTzOhDSE/7ror+y42Hb95On+oSGm4PCVZ5ubAVLoL/NuyZ4mq0FKxIrKK
 5J8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaQQOfdhqstIR0YL3h+lxd4DHDGI+m6gpWNhcYtmOJegmAR3SiBghU/RPNalWYtptGuAq3CoUz8Cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdwDi6qZolbYDKm4L+ykgGMw19wbeiku01P7bjuQTOG5vl0ITP
 FkCpn1TM3awdvGRc9FWd50mxA/8tNvqhb0mduEwIoOJCZspDEVHYJ2msoKSRF9mF6I5JFf9dYoa
 oggtWeQd5neGWcaCX9Ti9qt8gzRjQ/Jo=
X-Gm-Gg: ASbGnct07JUUsgG86/1b/9mDByXvagOL9I7FzmpFGD8jCXLWk3OIiZPlVlGrdEddC1I
 yoIaV1OiAfTsui/ng3AMtIJFSk9yqgRDSLGNFO1pwOoS/igg/gXuYqoBiY1R30wM/RDbjlTj082
 Kwz0CwNy4M+esJRvxj1EebOFU+ovor7iSxIQG4M0ZnkNs=
X-Google-Smtp-Source: AGHT+IF2+HM0p/+sceoU1c+3whqC05j4HvPLfZJnfenCjgGoYh8hMBXpjTFpo+2kGoTr2+M5pONrn+2q4hzQNoObX48=
X-Received: by 2002:a17:906:794e:b0:ae0:34d4:28a5 with SMTP id
 a640c23a62f3a-ae34fb3adbbmr1606500866b.0.1751353467351; Tue, 01 Jul 2025
 00:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
In-Reply-To: <2025070128-amplifier-hyphen-cb09@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 10:03:50 +0300
X-Gm-Features: Ac12FXxldltjux8AFKky_4Qin2Xh3bgbPQD68haJQAgS5edrcwzBqWRO4khaIHc
Message-ID: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 dan.carpenter@linaro.org, 
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
 willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
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

On Tue, Jul 1, 2025 at 8:14=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> On Tue, Jul 01, 2025 at 12:47:22AM +0530, Abdun Nihaal wrote:
> > On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> > > This patch does not apply to my tree, can you rebase and resend?
> >
> > I think you have added both the V1 patch and this current V3 patchset t=
o
> > your tree, that's why this patch does not apply.
> >
> > Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtf=
t_framebuffer_alloc()")
> > on staging-testing is an older version of this patchset, and so it has =
to be dropped.
>
> I can't "drop" patches as my tree can not be rebased.  Can you send a
> fix-up patch instead, OR a revert?

I think the cleaner solution will be revert and v3 patches together as
v4. Abdun, can you do that?


--=20
With Best Regards,
Andy Shevchenko
