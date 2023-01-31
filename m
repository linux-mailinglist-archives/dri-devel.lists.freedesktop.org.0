Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41E68378D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B0D10E39D;
	Tue, 31 Jan 2023 20:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DE010E2AE;
 Tue, 31 Jan 2023 20:29:16 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id s17so2946251ois.10;
 Tue, 31 Jan 2023 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JyJiFrqlivKEOyPItCa/SIst048Kihh8brktiCySABY=;
 b=nT4rh+4mNbrdzN78oDtmdY0IN+QTuwS3kW/OZkUARoYNmPa0+FGxN0vfl0KGlLU26t
 8xReagXvODlDwloR3rSYisE5btbXbHKkeWRI8ZkTW0W9vHX5kkqgUJjkkavaueCquDzX
 nlPEaJKoCYBSI3q3ugUQGP5jOCvGtTVs52HF02X5R6dLl9OY2HheAF89CrOCuADOR5aM
 a2MVgUShq6E25OfanBZ8GBUvT4MRaW8xB2GgsF/RLxjCMnmmZbj61iKiQjiDOYzHg4uS
 TlPAKAHRwm75Yv/MGOdQ+mjUTflvlGldxld24R6INhB0ugVGNHjO2vJcGJNw1x9AJiQt
 T4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JyJiFrqlivKEOyPItCa/SIst048Kihh8brktiCySABY=;
 b=bIOlECFVqqVV+kO8ZM7n86rCoci108VYtZVlm10fuKYson0Zuaqe9YkgYB2Q6jeYlI
 E0KtJrcALjKTdJO3ppqG0E5ekaaTeBDNKGHKLn4lwm7hvddUHuJFXLEZr3gDBE1S7BXB
 S54NEMmMY4Rv8xQodLNsr3GciG3v1ENDsuInXioYRCedQQc/6MHj1XkBZCHpuz3Zrdyr
 nMPVBhX88RZ/DJCBrevQ4jEN6VulsQM9YNBss84WBi+52XSIQBXEHc7SRouEZmwhPhDE
 OqS7uxAvJaMUgttS1zDoyZ6ri0ogSz4fptMoajFOXrfyF78cf8bPL9AdRRfjmDl7+vbP
 vVlg==
X-Gm-Message-State: AO0yUKWPjHVFwHbHoFLX1P5y/ziwWuhn6wjamWcly59CiMpO/GXvae/l
 s6TliBNnM5NIoo+NsVui/WV5CAThQcN3J785kuJMriIO
X-Google-Smtp-Source: AK7set8N4CZbnT/X3wmWeb1Es9Kzep/A3FY6oNiN6/fN0DvjQS2PcqSJv0WE9M0vC3XgSxJ0cGKwL719RAMd8+Zk0Ag=
X-Received: by 2002:a05:6808:2394:b0:378:4edd:a89c with SMTP id
 bp20-20020a056808239400b003784edda89cmr6481oib.46.1675196956046; Tue, 31 Jan
 2023 12:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20230131150030.1250104-1-sashal@kernel.org>
 <20230131150030.1250104-12-sashal@kernel.org>
In-Reply-To: <20230131150030.1250104-12-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 15:29:04 -0500
Message-ID: <CADnq5_M=WvEf6N9my2cjX1=aQdweKfrshyU+Q8Ohuo5=DBtf+w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.15 12/12] amdgpu: fix build on non-DCN platforms.
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, roman.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Dave Airlie <airlied@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 10:01 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> [ Upstream commit f439a959dcfb6b39d6fd4b85ca1110a1d1de1587 ]
>
> This fixes the build here locally on my 32-bit arm build.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This patch is only applicable to kernel 6.1 and newer.

Alex


> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ee238a16572e..0f0dd9b0d84a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10769,6 +10769,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>         bool lock_and_validation_needed = false;
>         struct dm_crtc_state *dm_old_crtc_state;
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +       struct drm_dp_mst_topology_mgr *mgr;
> +       struct drm_dp_mst_topology_state *mst_state;
>         struct dsc_mst_fairness_vars vars[MAX_PIPES];
>  #endif
>
> --
> 2.39.0
>
