Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38395905FC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 19:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5950F10E279;
	Thu, 11 Aug 2022 17:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF6210E86B;
 Thu, 11 Aug 2022 17:38:18 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id k12so29358572ybk.6;
 Thu, 11 Aug 2022 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+OaTTx4oKfd+EHTbl5rmEQCqRiCYo959iJOiqkKHNok=;
 b=HeB+hPTiJ1uZaiTO/ANwYnKPfTZ9ZMXOV9MM63aIOh9DHNP7A5h2dND4zSDYTwwNJc
 DbzipewVIURR6bWo/hcoL7NpVnIMllhIsAJE+Cskv9AQ7vSHQEuMX42oFjXpkUwJ3z76
 se5z4IAAN2kbb5PlJVWqYVYSrLEAKWY4+eSpJ34RFmYXNDN3fu1wkmC2BpTEVgygrgor
 710Hunf3AFu150hTCgXWrJk5OF/dvvznrs6JY7JpLF24vvc2UFOsw7CC6lRcTH/G5q1I
 PvkYg0xfBW7X7KH7Rdq/d9v+k13bOP6FcdXVK6j5vDv/f28js4CuJwdhKs3aQj4ihH6g
 g1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+OaTTx4oKfd+EHTbl5rmEQCqRiCYo959iJOiqkKHNok=;
 b=3f9WNBKmbRPcqVXF2r6UWR4qi7uKZC3XJeEHCckOxN6P4umzzn+ZPMvSua8g66ueDq
 aROn4C08DwVogyZtdF4+xTW6XyWdIJmrtesD39CF7+HAqn5rPi7moIN0dEVcPsSQjVIO
 76VfdXOtajTrlfb/5XfcxJlCY+r70nc4lnQCVYT0dlu06sVW+XgiVmh8yF8eMLxP3AeL
 wxrJFLyPBakTlIV7fde0uak3dZxQRJSpQoE/CHwnWV3/bcSkOTfFfb2Q9lXK2OHzqD1j
 IhzOdzxB9wB9ULuw8VsmvsrT2p/3ykRYiK9i5ihTnYQbnVM7+sOFfbBRhrIK/xnUZK+L
 uVCQ==
X-Gm-Message-State: ACgBeo0Ez2kIvV2dQVNnYxEGJ5fUZfpNUa0hEG0y5ekyTPgVmegHoID2
 Wab9xoR//aVX9sXLd2MvvRUkOlsoImp/rVK0i8Y=
X-Google-Smtp-Source: AA6agR5k04ip0oNeMAM5/9PWslkduulNrUTTzhzoDjAL3q9yQnZ0ey9WtWfVfrYgoweBZiqNzvIuNVsdnVb6mprdvys=
X-Received: by 2002:a25:ac92:0:b0:67b:ac46:5e43 with SMTP id
 x18-20020a25ac92000000b0067bac465e43mr361354ybi.183.1660239497180; Thu, 11
 Aug 2022 10:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <YvU4GD8HtZ1A4dhI@debian>
 <CADnq5_PwbwjmvvKedpZeeQHk7N+kawKpXywjNGqa=1jSKRcw0A@mail.gmail.com>
In-Reply-To: <CADnq5_PwbwjmvvKedpZeeQHk7N+kawKpXywjNGqa=1jSKRcw0A@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 11 Aug 2022 18:37:41 +0100
Message-ID: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
Subject: Re: build failure of next-20220811 due to b1a63a0b48ad
 ("drm/amd/display: consider DSC pass-through during mode validation")
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 linux-next <linux-next@vger.kernel.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 6:16 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Aug 11, 2022 at 1:11 PM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Hi All,
> >
> > Not sure if it has been reported, builds of riscv, alpha, s390, arm,
> > arm64, xtensa, mips, csky allmodconfig have failed to build next-20220811
> > with the error:
> >
> > ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> > ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >
> > git bisect pointed to b1a63a0b48ad ("drm/amd/display: consider DSC pass-through during mode validation")
> > And, reverting that commit has fixed the build failure.
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> https://patchwork.freedesktop.org/patch/497116/

Thanks, that has fixed this failure. But it has now caused these new
errors resulting in a build failure.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:
In function 'dm_dp_mst_is_port_support_mode':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1427:32:
error: unused variable 'bw_range' [-Werror=unused-variable]
 1427 |         struct dc_dsc_bw_range bw_range = {0};
      |                                ^~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1426:22:
error: unused variable 'max_compressed_bw_in_kbps'
[-Werror=unused-variable]
 1426 |         unsigned int max_compressed_bw_in_kbps = 0;
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1425:49:
error: unused variable 'down_link_bw_in_kbps'
[-Werror=unused-variable]
 1425 |         unsigned int upper_link_bw_in_kbps = 0,
down_link_bw_in_kbps = 0;
      |                                                 ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1425:22:
error: unused variable 'upper_link_bw_in_kbps'
[-Werror=unused-variable]
 1425 |         unsigned int upper_link_bw_in_kbps = 0,
down_link_bw_in_kbps = 0;
      |                      ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1424:22:
error: unused variable 'end_to_end_bw_in_kbps'
[-Werror=unused-variable]
 1424 |         unsigned int end_to_end_bw_in_kbps = 0;
      |                      ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1423:33:
error: unused variable 'cur_link_settings' [-Werror=unused-variable]
 1423 |         struct dc_link_settings cur_link_settings;



-- 
Regards
Sudip
