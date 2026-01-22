Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBkREBiAcmlElgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:52:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925536D469
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200010EA72;
	Thu, 22 Jan 2026 19:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jGTL2nvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E8810EA72
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 19:52:52 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2b7267ff06fso107682eec.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769111572; cv=none;
 d=google.com; s=arc-20240605;
 b=aKw+vk/fO4QVQMWaGf7cL3LNGu+8gkPAxghRFgV1e4Ut9LO2ssftC471z9zvM7Bqry
 t9ZboeIWY+zn0cbxMlV+PZu65afVNnAFcILPl688aVQrs4u4MdIF3AOivEnjojYXJHDt
 u2sEKY+xQW79krxLkMu1XRz6UEI57q864MmM3UxeRT0ZsfC54McPhSlCfAq+dpaWeluR
 PUc5u9I0NdV5KTnMkeu4ibj52VNNZavFrHsy9fV7P40pEPZ7Ob+clSiUJv0vL2OyAG6+
 /HPrQjW7/nfcWvi1LYjX7BmtTqTrz7u751XMHTHUKEReoONRgpVmomlNLBJDjkCn994P
 koCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xaMFit0Tb4xJygbdiK4hkfzlD0N/rHzeqbTVXcn+6qI=;
 fh=NMysaL6nLr5BCIPMpScGuGNA3ZsoFyPn7CLa43eYwNM=;
 b=jgc4ofm1+GW1ltJ3rIs4rd1bLh3Ftl9zzZpPBQ8suEZD3yIytPGZaZ+HDs7c2LqBfu
 hvJ2WF88FfxxtGCguSg9hEpI5aCMC0h8a7gzB7yNZfcJFPx/KcrW9TPnPyr4Cx7mNfqJ
 KX99NXspG5qWZvz7SGFP6h7pw5QwfDiKqyW3RGd2bLrNj/5Skhony9149PeiV/bcRXXb
 AN5TlezTR7LoVWZ8oBrNrXKEhnBO+cx/6XZ5ytgOpPUp/8HlHGBR9rl3/HJaUe/6Qq5V
 BX7rpoUwGbblDYWSGwpN6EmDFEWNOHOpP3cRZuZ9UZg//bh/hjKpI+aQst3hguIm5bWQ
 sIgg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769111572; x=1769716372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaMFit0Tb4xJygbdiK4hkfzlD0N/rHzeqbTVXcn+6qI=;
 b=jGTL2nvBpYQWJYvmUqRjldhm2mC+el5cGK30oUOIozQr8Lev9UPQNCt6tHDAQXUyeX
 wSU85Izm0Fjxz9V8NkI3I61e4cFML8dNdn0MbhJF8lgzcUxqMLA/ttQn7PRlbJPDH0A7
 0AGsyv0iKetZ9SVGHW0ay7DnC6uXZTarXNOl8zJCcMvTXRgsJGGoNgoihOMBxjVUnnQI
 9jS2JUP+qVrwy25NJkG5qGHalyTyNFouow1BiElDgwsVaoAXDPeXofuPOlMcIAq8G3iy
 l5gyQ32SWTHubwVQNmRyMP06IJYtc7cRCTzdJ2NjyFSJ8DMAKo+hTbIxo4L/o4ivghF4
 hqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769111572; x=1769716372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xaMFit0Tb4xJygbdiK4hkfzlD0N/rHzeqbTVXcn+6qI=;
 b=ffGSfkb2CTqHAuO2sfrVpgaJWodk4caXCLHcLhsm6g64BXQKvUtCJZ+DrOAnLggpuH
 rUg+ZOeg/JZrUFlw3xNUtajstEuU7v+vQq69Dxqzhz0WE5iYN0dxjFdG8PxVNjz1UGkh
 COqwOm6CmACMxHo2nKKB6qdcmI0KcNhRUEoSHvQi7vrVgcFnk+tS/PsnUISWsZLJ0fcS
 o4lSuXogVPZXo4MiENeNPSbwpIQBAcYo78g/efNnzYQukxLnkpnno7MY0+f6onWvvFh5
 xmldQf36pOpykG8LbDWjCTkyaortGchFEBoRFKuYObWSrN6ajvnpVY9AgnxYYuAzI//f
 IPTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX030aXHKlUNWvQkl0wQUwCHQg6bTcGhouzgbBSxovU7LYuLyn3MSWc2zf2RGwxJCnpMO2Di620xZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFfIgsTRqMIPGdr+VInJnUyrLx5NGdUkIJs4RzZcEEg5tVpBX0
 py+imV1AWug/uVEBNMYOEKaebAutqtRMJ33MYNtiUc+zsxEjNxcyt6f2aXcy8O0E66rG6ManW9e
 B6X3q48PIuq1M8mLuDEFn7blSgf55nus=
X-Gm-Gg: AZuq6aI69ezqaQRgpvOdYaZJA/rN6iw+4Do8M8e45Ngkga31XGkxQsM9CzyDsiWZpDs
 AAfMVuvgSzFxEUCO0mMsbUXZDz1P16J27EN/VJHIL/gLdAWCZCoNAlquiFummb04KmFJ3HtDPAI
 +1y7yukn8hy/wUgoZUq8bT+uIdsxu+yI6tEsDPsgeu9W9nQ46uTQPa/+MgPKuUpDUp79v18rrlC
 cjIibduEU97mi89OBkeOQFqOJw+GwRbu1b2qJH31oR07tZayeS1Gi5Y54pAqTZ/te/TU/hv
X-Received: by 2002:a05:7022:e10:b0:119:e56b:c3f1 with SMTP id
 a92af1059eb24-1247dbae784mr140953c88.1.1769111571754; Thu, 22 Jan 2026
 11:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-2-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260122170218.3077-2-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Jan 2026 14:52:39 -0500
X-Gm-Features: AZwV_QgDO4aDvgH3QpGF7ldVkfWjlAeaoZ3Prs-K3h3nGM9vUVZoMgemHp6YqlU
Message-ID: <CADnq5_O3dRsUKXiYG=twk+ccvMQVw0G_zt91xjeD1GV2p4fjwA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] drm/amdgpu: remove gart_window_lock usage from
 gmc v12_1
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 925536D469
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:17=E2=80=AFPM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Same as what was done in commit 904de683fa5f
> ("drm/amdgpu: remove gart_window_lock usage from gmc v12") for v12.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v12_1.c
> index ef6e550ce7c3..dc8865c5879c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> @@ -345,9 +345,7 @@ static void gmc_v12_1_flush_gpu_tlb(struct amdgpu_dev=
ice *adev, uint32_t vmid,
>                 return;
>         }
>
> -       mutex_lock(&adev->mman.gtt_window_lock);
>         gmc_v12_1_flush_vm_hub(adev, vmid, vmhub, 0);
> -       mutex_unlock(&adev->mman.gtt_window_lock);
>         return;
>  }
>
> --
> 2.43.0
>
