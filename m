Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557BA73C50D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 02:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ECD10E6E2;
	Sat, 24 Jun 2023 00:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E410E6E2;
 Sat, 24 Jun 2023 00:11:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1235471f8f.0; 
 Fri, 23 Jun 2023 17:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687565459; x=1690157459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juyXTwoXsD5mc3/9HxZ2a7x6dEyqzG8iNP0iF/NU/Ww=;
 b=MmN/SfQTVSwstgn9DyjaDtUGPN9gGSs1fKgJhKyBKThnqBlzJRMvrsZXPQhG7IZe6l
 Iol5bu6RICV3a7Kqq6nWPWp79EDI0fSs17/LPya2OphEWx0/r9XarsggkZW+1Uk+abec
 0EgxJvWiL3xLH5ZW89jXCzFzF9gaY0Q8rTnblSu5fBESLpe3k1XgFH9ijWHl3DAv69Rf
 uE9zuWu4Isj/VgmfQzMy0sh0KPHMbR2QzZMzAyM6n32bIAf8xcUPAr/nxTixnHPoCiJa
 TVoabV46gMriN1+rwOxHV3Kn7Mviu0ySlzK0u+mp4cHVFeJwhpsMdoOtPYSBEYe3zoix
 pwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687565459; x=1690157459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juyXTwoXsD5mc3/9HxZ2a7x6dEyqzG8iNP0iF/NU/Ww=;
 b=EmxG7VgRjBlRm75wDIBfmEi2TfyuALyVOjzH9MnyH/rieXhmTwlMEflQ/KWvMUJWpy
 gRiOsMgh7XgJAizgO8sSCoUpZAfMdzR6VLa+zFsxS7iuJHxLR51JOJ51sO4krIR5SZiY
 QosEtrixJ6fSLLLv91fGMUddLKt7ge8MZgjweQVtjFrMsnjt2e1Y7BurUOkZzf3D9BMR
 /ZtQ084+wpgx+m/1nIr32vay+6p5PHAp8uzq0sktNWy72WYwCKKZckjQdZ6KhZSfRiY5
 wP1JVcOAERTx6dujHNGsBOLnlXbMVs5ni0K7a6tAP+vHXR/G/7r9OjprIg6tgsK2J/4R
 HFaA==
X-Gm-Message-State: AC+VfDzldtMmFNOxFHf4qxD6QWH5HKvYtsIL+dJyfOLXTvbF43b06o0c
 8WDYh/h5Y0F+rq8z5rzHkc8=
X-Google-Smtp-Source: ACHHUZ6D9PWnBQdf3d3SThJ9JLZtU4v+kNtjDQQ2li9rSnIWX6+2xdfWvLrW/AnkbHXPW810+7mpQA==
X-Received: by 2002:adf:f847:0:b0:309:3af4:8c8c with SMTP id
 d7-20020adff847000000b003093af48c8cmr14124282wrq.54.1687565459046; 
 Fri, 23 Jun 2023 17:10:59 -0700 (PDT)
Received: from suse.localnet (host-79-23-105-164.retail.telecomitalia.it.
 [79.23.105.164]) by smtp.gmail.com with ESMTPSA id
 j9-20020a5d4649000000b0030aefa3a957sm653882wrs.28.2023.06.23.17.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 17:10:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Date: Sat, 24 Jun 2023 02:10:56 +0200
Message-ID: <3747290.kQq0lBPeGt@suse>
In-Reply-To: <20230617180420.GA410966@sumitra.com>
References: <20230617180420.GA410966@sumitra.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On sabato 17 giugno 2023 20:04:20 CEST Sumitra Sharma wrote:
> kmap() has been deprecated in favor of the kmap_local_page()
> due to high cost, restricted mapping space, the overhead of a
> global lock for synchronization, and making the process sleep
> in the absence of free slots.
>=20
> kmap_local_page() is faster than kmap() and offers thread-local
> and CPU-local mappings, take pagefaults in a local kmap region

NIT: _can_ take pagefaults in a local kmap region

> and preserves preemption by saving the mappings of outgoing tasks
> and restoring those of the incoming one during a context switch.
>=20
> The mapping is kept thread local in the function
> =E2=80=9Ci915_vma_coredump_create=E2=80=9D in i915_gpu_error.c
>=20
> Therefore, replace kmap() with kmap_local_page().
>=20
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
>=20
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>=20
> Changes in v2:
> 	- Replace kmap() with kmap_local_page().
> 	- Change commit subject and message.

With the changes that Ira suggested and the minor fix I'm proposing to the=
=20
commit message, it looks good to me too, so this patch is...=20

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

However, as far as I'm concerned, our nits don't necessarily require any ne=
wer=20
version, especially because Tvrtko has already sent this patch for their CI.

Thanks,

=46abio

P.S.: As Sumitra says both kmap() and kmap_local_page() allows preemption i=
n=20
non atomic context.=20

=46urthermore, Tvrtko confirmed that the pages can come from HIGHMEM, there=
fore=20
kmap_local_page for local temporary mapping is unavoidable.

Last thing... Thomas thinks he wants to make it run atomically (if I=20
understood one of his messages correctly). As I already responded, nothing=
=20
prevents someone does another patch just to disable preemption (or to enter=
=20
atomic context by other means) around the code marked by kmap_local_page() =
/=20
kunmap_local() because these functions work perfectly _also_ in atomic cont=
ext=20
(including interrupts). But this is not something that Sumitra should be=20
worried about.

>=20
>  drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
> b/drivers/gpu/drm/i915/i915_gpu_error.c index f020c0086fbc..bc41500eedf5
> 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1164,9 +1164,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>=20
>  			drm_clflush_pages(&page, 1);
>=20
> -			s =3D kmap(page);
> +			s =3D kmap_local_page(page);
>  			ret =3D compress_page(compress, s, dst, false);
> -			kunmap(page);
> +			kunmap_local(s);
>=20
>  			drm_clflush_pages(&page, 1);
>=20
> --
> 2.25.1




