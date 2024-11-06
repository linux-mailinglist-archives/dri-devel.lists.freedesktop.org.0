Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649B69BF198
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8A10E2F1;
	Wed,  6 Nov 2024 15:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MZPdnoV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC9610E2F1;
 Wed,  6 Nov 2024 15:27:32 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7ea7e2204d1so1125587a12.0; 
 Wed, 06 Nov 2024 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730906852; x=1731511652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N89Fo9DcmQh+49s/r11V+5uI0yB2KQxSET80sqWYF/M=;
 b=MZPdnoV8foKJVCoj9EVIX+YZ9wq0fSxySMVx8YoPV3e8Tvm/fjcA3ci9QlrZ6JwYk9
 cx9bqeKx5scZ1BKBQ7rcOhdwR0OJp/XGZOfigbTsKMD/BKI8NTB2OQfSZon7JjAwDbUM
 WnJqCMg+k2g6Gq3T9tAdLePUEico/VxULygI6e1k5GZ3cjjOTAHMsFDcUwhHeMtH4niO
 0uMwLGtu28yJtSMiZ5oKRTIfel6OsJu48fgqDy34eFCNKNRTe7poM9Ju19asTBXdDj/B
 aJZrg8dvfpCGcXUr1ut4iN1tem1fdElpbFheM7fVCjkIoN0gHG6s+rvisvSHNwFmVC4n
 6t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730906852; x=1731511652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N89Fo9DcmQh+49s/r11V+5uI0yB2KQxSET80sqWYF/M=;
 b=Q5+Bm1MFHgMgbXHadq5m3P11+tCE4TqdHykGVOcoFqNsuTBBB1G94YfJ7UPuZzsrmd
 Cpw2oQsem79DgEWeiOQUc6vbiSX5tlvpoun7z5GODmUs+CTT+iTucxNi0FExQ2TGhyrC
 2x2F9k/Ce2len5bBOE2ywFa17Mv11ZCXSLyySdfPRlyVXuOmJPaMQzydGiG+x2tBm6J7
 cEG2jW+cqVJnB9NhOL+3P5CdsTqCkHqrXenoP2YElBlxPRXdjl6+ly+WsFn1fVBBhTud
 WJTdv477yiZaWaWM0to/9RyxdcKjei9sIkTfpc/cqCZNK7vV558UESlYWZOjcviCNPAQ
 jrAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2MaR8ot2AIQclhCa5sma3vscN1qwDH/IEPZlQ4Jg5iLq6NgxVDtix6XSieePHIu9KeRuGp2PZykpl@lists.freedesktop.org,
 AJvYcCXI1mwRPVyyPhUkbwaYDQyc8ylj9JN0/GqbBgfADXA7EdLJP0OvHhMB5S9fOorioGdHr6UjKYXJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZd5QlmxAtKOtPjfvlVuxD3F947gUjJEqf1nBxzpuda7qxkGuK
 lNbI8zGhEZ0fJnAnYG8PjWFOOLo9Ppst5gxM3SqpibXOyWACB9grL9tyKOj8f24upRU8998dZou
 /TCrZTrQmbhCsXHWyWsqQe4f4do1bLw==
X-Google-Smtp-Source: AGHT+IGahZV2s0jrrFME50JPfqWlFbkg+b2gaupSacy0btnmiwh794Y0JPIA7PhyejD8rRMMkv2YE2ATPbPZgf2PcdU=
X-Received: by 2002:a17:90a:5205:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e8f104fc1emr19006356a91.2.1730906851873; Wed, 06 Nov 2024
 07:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20241105140256.2465614-1-quzicheng@huawei.com>
 <20241105140256.2465614-2-quzicheng@huawei.com>
In-Reply-To: <20241105140256.2465614-2-quzicheng@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Nov 2024 10:27:19 -0500
Message-ID: <CADnq5_OaH9e=4xX=ZJ1yH__EMo6x2Kzh1ZdD2rU+KG5x=4b_4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Fix incorrect power gating
 configuration for DOMAIN10
To: Zicheng Qu <quzicheng@huawei.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com, 
 chiahsuan.chung@amd.com, alex.hung@amd.com, wenjing.liu@amd.com, 
 Dillon.Varone@amd.com, george.shen@amd.com, mwen@igalia.com, yi-lchen@amd.com, 
 martin.leung@amd.com, yongqiang.sun@amd.com, tony.cheng@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, tanghui20@huawei.com, zhangqiao22@huawei.com, 
 judy.chenhui@huawei.com
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

On Wed, Nov 6, 2024 at 3:18=E2=80=AFAM Zicheng Qu <quzicheng@huawei.com> wr=
ote:
>
> The current implementation incorrectly updates DOMAIN10_PG_CONFIG with
> DOMAIN8_POWER_FORCEON, which is not the intended behavior. This patch
> corrects the power gating configuration by updating DOMAIN10_PG_CONFIG
> with DOMAIN10_POWER_FORCEON, preventing potential issues related to
> power management.

The bitfield is the same for both so there is no functional change.
This is just a cosmetic change to use the right bitfield macro.

Alex

>
> Fixes: 46825fcfbe16 ("drm/amd/display: avoid power gate domains that does=
n't exist")
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/dr=
ivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index a80c08582932..67a77274d813 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -317,7 +317,7 @@ void dcn20_enable_power_gating_plane(
>         if (REG(DOMAIN8_PG_CONFIG))
>                 REG_UPDATE(DOMAIN8_PG_CONFIG, DOMAIN8_POWER_FORCEON, forc=
e_on);
>         if (REG(DOMAIN10_PG_CONFIG))
> -               REG_UPDATE(DOMAIN10_PG_CONFIG, DOMAIN8_POWER_FORCEON, for=
ce_on);
> +               REG_UPDATE(DOMAIN10_PG_CONFIG, DOMAIN10_POWER_FORCEON, fo=
rce_on);
>
>         /* DPP0/1/2/3/4/5 */
>         REG_UPDATE(DOMAIN1_PG_CONFIG, DOMAIN1_POWER_FORCEON, force_on);
> --
> 2.34.1
>
