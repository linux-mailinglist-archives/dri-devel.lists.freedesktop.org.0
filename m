Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B8618B55
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B40E10E00A;
	Thu,  3 Nov 2022 22:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6646D10E00A;
 Thu,  3 Nov 2022 22:22:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o4so4756858wrq.6;
 Thu, 03 Nov 2022 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWINOlKhJAkssXzcOhXO4HAUW0ow90/yx9bP7G1rGXs=;
 b=dJ7WU5ACz7c1mzpOTo4t5L1yluOsltb+7Wd5qhUUHWIn4jodJjq9DAF4tvOS749WKu
 24xBZA1Jvw338ujURsGnAsMRAeB9vNyoRo8MqbzAcp3INSQTRAO5SaKOlASS3iSJ4EMU
 PCZZZ8CdAcSKHb88A+ShL7sO7ISCCr3FHQ7Ep9GRu3mUF7sxabZONfbGHNf/m5ARL/6S
 UDj2KNKTpwhZgYCva9/JDlL05CoqqkqJD6A1lhC8kyRZ2GXrpG4If5htz3x9JRGQpECV
 0nJZCqU9M+KCC79jNTcm3HuRQcRuXRQ3jS9S3SydzkN1tAC7/haBPKMRjBmKgknSHqig
 icTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWINOlKhJAkssXzcOhXO4HAUW0ow90/yx9bP7G1rGXs=;
 b=FnEgxJZloHyR0tp+MFHy5ses57FHVwsfex+vD0ShtBQ+92VED6thkWM3TDPZBFWuQh
 7+CFbx7mfNq9TLOFWAJIXLEauhvUbwIxIy27Iqxx1FPdcgXZqm6Dc3a/L9978YbM9Q8m
 61soqS6aGPO8Uk1K2WYhv1Xs/lfUJCZ5y2jlbU2r8Xi2HwN3fJ2Kno5AiJd0WoT77MQM
 P2LmTIPrkiph78jgvhccgjRwwicpZFSmEDBfMMRJzO9HvTSdvQfqKD9whp9lR9PdmMjU
 5YEO/UmUsWid+Va7maqDzHOF+nmHltNGm/epFdLiAFqJyRagbAAA8SsbWatRg1KEVWt0
 FZ4w==
X-Gm-Message-State: ACrzQf17BMbYby2dsOxZDc/0WGQRwY55123AJFJlBpLzd4SJd8D1rDNZ
 uo+zkj34FSqAAHcvd3Rnc14=
X-Google-Smtp-Source: AMsMyM60DYhjs7F3Uyj0ZeQmy+UHCwQak/sdeBkfIVbqNJrtBCUsPE2zDmNgaEl4IKUwklj14BHw0g==
X-Received: by 2002:a5d:4ace:0:b0:236:6054:30f5 with SMTP id
 y14-20020a5d4ace000000b00236605430f5mr20014260wrs.19.1667514161785; 
 Thu, 03 Nov 2022 15:22:41 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 n25-20020a7bc5d9000000b003c6c5a5a651sm1015763wmk.28.2022.11.03.15.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:22:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhao Liu <zhao1.liu@linux.intel.com>
Subject: Re: [PATCH 3/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_shmem.c
Date: Thu, 03 Nov 2022 23:22:32 +0100
Message-ID: <1833466.tdWV9SEqCh@suse>
In-Reply-To: <20221017093726.2070674-4-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-4-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On luned=EC 17 ottobre 2022 11:37:19 CET Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].
>=20
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.
>=20
> In drm/i915/gem/i915_gem_shmem.c, the function shmem_pwrite() need to
> disable pagefault to eliminate the potential recursion fault[2]. But
> here __copy_from_user_inatomic() doesn't need to disable preemption and
> local mapping is valid for sched in/out.
> So it can use kmap_local_page() / kunmap_local() with
> pagefault_disable() / pagefault_enable() to replace atomic mapping.
>=20
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.=
com
> [2]: https://patchwork.freedesktop.org/patch/295840/
>=20
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Ira: Referred to his suggestions about keeping pagefault_disable().
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

The commit message explains clearly and the changes to the code look good. =
The=20
necessity to reuse pagefault_disable() / pagefault_enable() from the main=20
kmap_atomic() side effect is a nice catch.

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks!

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c index f42ca1179f37..e279a3e30=
c02=20
100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -472,11 +472,13 @@ shmem_pwrite(struct drm_i915_gem_object *obj,
>  		if (err < 0)
>  			return err;
>=20
> -		vaddr =3D kmap_atomic(page);
> +		vaddr =3D kmap_local_page(page);
> +		pagefault_disable();
>  		unwritten =3D __copy_from_user_inatomic(vaddr + pg,
>  						      user_data,
>  						      len);
> -		kunmap_atomic(vaddr);
> +		pagefault_enable();
> +		kunmap_local(vaddr);
>=20
>  		err =3D aops->write_end(obj->base.filp, mapping, offset,=20
len,
>  				      len - unwritten, page, data);



