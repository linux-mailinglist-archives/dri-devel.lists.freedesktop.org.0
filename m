Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B88BA7E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D8610E9C2;
	Fri,  3 May 2024 07:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gigaio-com.20230601.gappssmtp.com header.i=@gigaio-com.20230601.gappssmtp.com header.b="ZZj4d8Js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EB210EDD8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 01:22:39 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6ee32bb9c8eso2586378a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 18:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gigaio-com.20230601.gappssmtp.com; s=20230601; t=1714699359; x=1715304159;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3nkCSoTperPlX+PtC8qWAin0Hv01DoPF7+bPAgfSgA=;
 b=ZZj4d8JseZXXiICswGinGCT9GsNv7nEC0rD5ufcM7JleyXmYYKuzXu6Gs/bLr1zX34
 LXZPQtFn2PvklLuJSt78vJ33MmaxVZoGtS83WN1V4b9y52yE82TcDkML86hc1zA/p4Yw
 ZFQ/VzTU39QjrrDs1KwbRppUHGHAYXFWL40ZFBQ06ZwIPjRM2ataVvwiTDAOix9VVAOX
 4giSroQS4fj9RAqf3oKLRzZm0PDo/jlJL7eId2K5vszV0/8FvYB/2ec1GrzpxnxeUAQ3
 2K2yRjJ2gQf6NoDSexox7z7beBI9qAnZdI2uy5kjIj+uM21m3LO/IFR7k689+uQ4xfQm
 B6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714699359; x=1715304159;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3nkCSoTperPlX+PtC8qWAin0Hv01DoPF7+bPAgfSgA=;
 b=ws33ylkYBO1d36zO9ytOSdMHW5vB9jkP7dYUOMKkIrlHIdcrqGHdQl9dWyuZZ7gYOL
 mdeSQqor/yExljPg06eF2E/XbmaKXnYmOs3rg4lpoVaCSxxJFtjZP98AenxIQxLRhLv3
 vdRYpSJUKPpSh5EsEFOT7UrJIbRv12NNcyuHNCDEVrYQxps4PSNI6rxn0OAxNzcqRy2u
 7kSa08JTAzpUSPqnyg6+oDdMqamo5NezugHKcxoygtZv7aTFLCJsFf35pFjnNOAsl2F0
 L83YAqAgZcCEXJW2IxTaolSxHW0QiXGQIoxwc+J2T4VOARUYG6T5ex8lG6wj43aw8FIF
 4VfA==
X-Gm-Message-State: AOJu0YyeEEdoYfxflTc/jh5ZL4C/AnbYmIH4p0lPVmnX/9gUuhXqMkkF
 EPH7aSI98h1sckNDoINQc50/vr1k5vKbjmHkbtrVDxh+iaTYpZh7aZOyGZInTjY=
X-Google-Smtp-Source: AGHT+IGYuWQGoJVifB5ByXnZOOtnc0jo+Gwcp8Ftoa0rZdJC9qXcD/CvZftAT0HRvOGe4Jw7d7sdMw==
X-Received: by 2002:a05:6830:3490:b0:6ea:30bc:a6b5 with SMTP id
 c16-20020a056830349000b006ea30bca6b5mr1921224otu.22.1714699358803; 
 Thu, 02 May 2024 18:22:38 -0700 (PDT)
Received: from smtpclient.apple (45-31-42-85.lightspeed.sndgca.sbcglobal.net.
 [45.31.42.85]) by smtp.gmail.com with ESMTPSA id
 d11-20020a656b8b000000b005f7ff496050sm1699721pgw.76.2024.05.02.18.22.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2024 18:22:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
From: Eric Pilmore <epilmore@gigaio.com>
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
Date: Thu, 2 May 2024 18:22:26 -0700
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>,
 Matthew Wilcox <willy@infradead.org>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <83E51798-5335-49AA-8211-60EC29577617@gigaio.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
To: =?utf-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Fri, 03 May 2024 07:37:28 +0000
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



> On Jul 24, 2023, at 2:14=E2=80=AFPM, Micha=C5=82 Winiarski =
<michal.winiarski@intel.com> wrote:
>=20
> 64 DRM device nodes is not enough for everyone.
> Upgrade it to ~512K (which definitely is more than enough).
>=20
> To allow testing userspace support for >64 devices, add additional DRM
> modparam (force_extended_minors) which causes DRM to skip allocating =
minors
> in 0-192 range.
> Additionally - convert minors to use XArray instead of IDR to simplify =
the
> locking.
>=20
> v1 -> v2:
> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>=20
> v2 -> v3:
> Don't use legacy scheme for >=3D192 minor range (Dave Airlie)
> Add modparam for testing (Dave Airlie)
> Add lockdep annotation for IDR (Daniel Vetter)
>=20
> v3 -> v4:
> Convert from IDR to XArray (Matthew Wilcox)
>=20
> v4 -> v5:
> Fixup IDR to XArray conversion (Matthew Wilcox)
>=20
> v5 -> v6:
> Also convert Accel to XArray
> Rename skip_legacy_minors to force_extended_minors
>=20
> Micha=C5=82 Winiarski (4):
>  drm: Use XArray instead of IDR for minors
>  accel: Use XArray instead of IDR for minors
>  drm: Expand max DRM device number to full MINORBITS
>  drm: Introduce force_extended_minors modparam
>=20
> drivers/accel/drm_accel.c      | 110 +++------------------------------
> drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
> drivers/gpu/drm/drm_file.c     |   2 +-
> drivers/gpu/drm/drm_internal.h |   4 --
> include/drm/drm_accel.h        |  18 +-----
> include/drm/drm_file.h         |   5 ++
> 6 files changed, 69 insertions(+), 175 deletions(-)
>=20
> --=20
> 2.41.0
>=20


Hi Michal,

What is the status on this patch? Did it ever get accepted upstream?
If so, what release? I don=E2=80=99t see the changes in the latest Linux =
kernel.
I am working on a system that involves a large number of GPUs, where
each GPU consumes a number of DRM devices. As such, I=E2=80=99m easily
exceeding the current limit of 64 in the (6.6) kernel. To workaround =
this issue,
I have temporarily picked up this patch which is doing the trick, but =
now
I=E2=80=99m wondering if this patch has seen the light of day in the =
Linux kernel.

Thanks for any info!

Regards,
Eric

