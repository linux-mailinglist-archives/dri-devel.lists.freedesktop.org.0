Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4sBGJ6oGn9kAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:52:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4351AB3F8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E803F10E9CE;
	Thu, 26 Feb 2026 16:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I48kEQ0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DEB10E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:52:44 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-124a7216c9cso71252c88.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124763; cv=none;
 d=google.com; s=arc-20240605;
 b=N4DLDX+hj3ptI0YgI+9XNYK8X12u+v3kuFH3elAb2qYlGKVBNyeXnWIYMV1sLoJURY
 z8PpAiIqCJ0S3pGQieDpa2vOJYZVPM319l5T0WEXo/Y+yeM2n4KeLg6MrQaezVRczhGm
 KHgzftaS2d8Cghhu3XyW4KH80P9xTU30zuYXgCz52VY66xArgG2lzuQuzNUveAq5ih/H
 o9WQQKqYOxtgy6MP+R19dFFZFz3yqnS/HBFp6uMK3U3mvmdDmh8LL5YseYUXPCXCBouA
 xTxhXsOFbARqScMxeoBhuwcHuh9HilJ/BTfakVBdQbeBuTWtSDirfmKXDW7YK3L/rALA
 uEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pZcazbR1DE/nxOEeZq1x5Zwqj0GPkDpZzY4fxC9HT/k=;
 fh=XsNZ8TZoljdHcWEO+VJLGh73zTOoJfRAAmrMxN39hTk=;
 b=GZgjJpsHclrcuInqwi8WBZXz0oK1ckq6N8ltQa3x69twwuLBkI+EjGwKnFNHF3ZC0E
 FajiLQzQrYcTB5zBN/Pk39MzB7wH8DN2s8GM+MirNfpq67DpB6YbON1YitilzybfTK2+
 rutKnRm0NYSNlXRocn/3tLoZLquXyzPQhuEiwhz4UM+dr2m6LWFJonnkDeH2TpIpP6SI
 eqnSfkkbUSxicC3PxrbMuehrZG9IZvbjvmUKK+XIlaocE6s/B0AD3+x46QeDa7BkuVLn
 HprtSRaiENT042DTap8NTzp/L690Aolv/7UkTL/q1Tuk3ZwLPdbGo0Z+4HiQki0GGK+h
 JJpA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124763; x=1772729563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZcazbR1DE/nxOEeZq1x5Zwqj0GPkDpZzY4fxC9HT/k=;
 b=I48kEQ0Xg6Vb2T2JhV7Ls4Q85cYsznVwUTqzNvViBBIGbC9A3Wian5OsxFO+WB5jgq
 wm4MDtdlMUT02G7c4sEFvkjfk8d2kJwdr8vtIu9u8172gDuC4AxcjxUehs2JZagGerzB
 APnmbRgPPeZbwgVmKOdxgWgint3zMkd2BNT8EkwEOyGp7yHTpdV1Rxi3TrpKMb2i9o3F
 pC/qpoTMWQEj+0Q0ut7W/yx/guxLX2BB7MG221q6qrWBLhfk3BjbYBrC47SAGHUxEp6h
 2SheJ0DPNFdTOmf3/KcRI6DsI0DHX1BBmmaTJjkzzySui+VQ9o29x/rBE6RiGdaFpmxw
 DIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124763; x=1772729563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pZcazbR1DE/nxOEeZq1x5Zwqj0GPkDpZzY4fxC9HT/k=;
 b=bUePXA2c5UzKcrJvmt4NYKjvS6U5rNhPjqRSI/KCUjYqeryyK1Ik6vmGNwtKEOly+c
 /SKe6CPHEJSpZ+fLxtBr/+UKERwYvnWJ/IrKt3q/UPMuS1/O3M7p7HwbgcWlzQNTeARp
 QDI8GO3Pe/pkYGDrFEygkyLt+3Lqqq0DlVmYTGwxGXcBiB40EFTmr9D+82g1J53Y0qp3
 yK8eDnwGwkwypLh4Xn1vSRSLYXKXsHAYgLZdbtxhfJyya9C6V+8u++HoQoo+nPQL3NH9
 sTxQ84GT2UNtisMKW4Vkxw+4ezWrnY59FjlheOzsz0NVisLNvstiLfKpdC1oJcF1MGJv
 qgzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTud+r2mlV3IDyAMgDhq3ye5rBKPYNE8m/qsaD5YtLghqk/mHeW8D26eGPBpKgwPHIyKW1SccRJ2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMdK4YCBLPYSXnRdviVeEcKcIU3L4lR1lUQln/7kqtPniIxvxR
 lNcHq7Ml7rZpitvhonvh3BFnPmwg4o/GyC9yBkTwvrIG/GHoucsno7W3NdQugJz0K49nGNu1Sb8
 CWIrsq5mVHucVagxvEdNaosXg89Y/rXM=
X-Gm-Gg: ATEYQzxcZjf6Aw66KL8kiqKVbUOTXH1eS2B00ERraDT5fb1UWpQ8zkk4G0YkOgiQlUX
 mgbUJfN073vHAi6tWHVXj84eMqdtCej9tsL22hgGvJRV/Fv6wZRAaeVVrozvWZ5nxM7y2aLAVPE
 u4g5mdK1lyvyblw50zr34WGzb512DhMp+bfJBtCnzelwU2z/KVfkIuJy4qG6TDFnHy0e80tB0Ge
 1xFuXdxgrHgmXuxMRKyGmo283buuSPZ+aqoMb4wdac7MQOpBJ2ko14w/75P7o1RPuJ8T432Zow+
 zVHnWtbF+0ZsQgpP0sl25+ZNrPmGXCXMpQyE87VkPbrHK7PnznUx+5vTktWwZRocctdzUg==
X-Received: by 2002:a05:7022:521:b0:11e:3e9:3e88 with SMTP id
 a92af1059eb24-1276ad1a953mr3949889c88.6.1772124763232; Thu, 26 Feb 2026
 08:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-5-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-5-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:52:31 -0500
X-Gm-Features: AaiRm52jUWhoVzS5sZVs0p1S_kaUAgI_vRYo0M4j1pIdWaWT3Go6larHclvpApA
Message-ID: <CADnq5_ObAojo6i2gwJR2Q6aL2gN3WEyxC5Uo_=yfW=9xqdndnQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/amdgpu: fix kernel-doc warning for
 amdgpu_ttm_alloc_mmio_remap_bo()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yujie.liu@intel.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:patrik.r.jakobsson@gmail.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:pierre-eric.pelloux-prayer@amd.com,m:srinivasan.shanmugam@amd.com,m:tvrtko.ursulin@igalia.com,m:sunil.khatri@amd.com,m:lijo.lazar@amd.com,m:asad.kamal@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,m:tao.zhou1@amd.com,m:ganglxie@amd.com,m:candice.li@amd.com,m:YiPeng.Chai@amd.com,m:matthew.auld@intel.com,m:luben.tuikov@amd.com,m:ville.syrjala@linux.intel.com,m:michal.winiarski@intel.com,m:michal.wajdeczko@intel.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8E4351AB3F8
X-Rspamd-Action: no action

Applied.  Thanks!

On Wed, Feb 25, 2026 at 10:09=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1923 expecting prototype=
 for amdgpu_ttm_mmio_remap_bo_init(). Prototype was for amdgpu_ttm_alloc_mm=
io_remap_bo() instead
>
> Fixes: 96e97a562d06 ("drm/amdgpu: Drop MMIO_REMAP domain bit and keep it =
Internal")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index eeaa56c8d129..9789b778d491 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1908,7 +1908,7 @@ static void amdgpu_ttm_pools_fini(struct amdgpu_dev=
ice *adev)
>  }
>
>  /**
> - * amdgpu_ttm_mmio_remap_bo_init - Allocate the singleton MMIO_REMAP BO
> + * amdgpu_ttm_alloc_mmio_remap_bo - Allocate the singleton MMIO_REMAP BO
>   * @adev: amdgpu device
>   *
>   * Allocates a global BO with backing AMDGPU_PL_MMIO_REMAP when the
> --
> 2.43.0
>
