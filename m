Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7314590632
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86F111AB51;
	Thu, 11 Aug 2022 18:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7611A1C4;
 Thu, 11 Aug 2022 18:11:52 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31f661b3f89so180529467b3.11; 
 Thu, 11 Aug 2022 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=y2QNTJtA+QkycDzAJ2gpgSvPbeV+rknwYt+wRwQVE9U=;
 b=DOL0/7BCufuS1Z5S25RF66e3W79quG1uKIMs+Et22SQVj9mUJ5Rr1OR1MkhErrjmbx
 XeeZVG1bK+ZCf6fI+B/vROHj/GkE3FxDrzW1+pdtb/yN+8jpJ+NitKHfIJ5sRgsz0p8e
 Fe/7ViKYvUdEVhAJX83sc4T4S9xx6AZbsagBU00EehxhO+bX3XN8GMGy1UdfAosvv+zD
 lPHZ3xGY5RdmpfBsjtapQ8k5zkLzBFNU0cNnIxS6TJ3/lbcbRp3MoVlwAyFmcUDlvNRs
 ZyYdUDmCaJQrjUsZKMFxRjOYAOppWnhkzNrcMaA/v9MlmnB2CyoZ63JCmQTMzl+PXIiN
 SrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=y2QNTJtA+QkycDzAJ2gpgSvPbeV+rknwYt+wRwQVE9U=;
 b=pf41MCQWLt9Zva0E1jtqxqryCuIhzwjaZx04JQvV7EGodfAwlaCVqWZ3Y9vXjpUV5n
 hm1hSM5o8z1IrnAcuuXKbZzqVlmnzg5T2wAB354jAI/BGh+ghx1beVvWYLv2OwmNpSmu
 9WSQvZJWCLZhcqWAzgoBLv5JL3j3Ru5Ganf1FtgNMoTZi5SGIPn4HlZpHGVFDD4/pbYV
 PzLkUQc8c3uKrKsX72SlVXooZi6X1J7CJ9omysQp19i0orWeAVb3zL6penpw8NgiZzKH
 Ry49qntWP9wO5f7xmtYdZk2U5Dhez9gjYVOgRDsPCC5zkPoi+14RHoNYBY+tPV8q9gZ/
 ilRg==
X-Gm-Message-State: ACgBeo2rYHxafgaXiwbgWqdPuEtBLkSOGZbEjx7AZvU5DocCLtPS5cb1
 zabtY0wrKF+YYzbYa2cwld++KNM+ywCg2gd21KXK5ecexp6+AA==
X-Google-Smtp-Source: AA6agR4SU1v+xBEONP5Zol2FeSnVE6WaQBbeKZ+bxN8tcA2+V/9UzSOZ2jG8TlaLq1mJcPPxaSGer5ZC+xkULYAUMIU=
X-Received: by 2002:a0d:f846:0:b0:324:cb8a:e0ff with SMTP id
 i67-20020a0df846000000b00324cb8ae0ffmr432591ywf.478.1660241511833; Thu, 11
 Aug 2022 11:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
 <20220811175759.1518840-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220811175759.1518840-1-hamza.mahfooz@amd.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 11 Aug 2022 19:11:15 +0100
Message-ID: <CADVatmM3PdWy-75qJD29Xm2ow48GV5xPsE26L1_ZPL7LFgJdfQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix DSC related non-x86/PPC64
 compilation issue
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 7:00 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Need to protect DSC code with CONFIG_DRM_AMD_DC_DCN.
> Fixes the following build errors on arm64:
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Fixes: 0087990a9f57 ("drm/amd/display: consider DSC pass-through during mode validation")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thanks, fixes the build failure for me,
Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip
