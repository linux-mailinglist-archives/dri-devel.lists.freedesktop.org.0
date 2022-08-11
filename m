Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D250758FDF8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 16:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24FF2A5D3;
	Thu, 11 Aug 2022 14:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1884A5026
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:02:54 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s9so18934229ljs.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc;
 bh=iwbijT25JOQabEJoAdZbUrL+K+nZlUlywCNjAPaRkPY=;
 b=Zwmv+zhwDMR2nSKdFJwP2quzKJ6loGMdS1t7skyjM7Np9UwvBEvxE06ihAie/nti4/
 diw7tb/KgC66OQQK6thMASgGBL0BBl5jJtfOlAFyaWnCzCsKUra2xCgo3eC6liJpPAlX
 iombHyCRKc/M6HnExt6By5qPTL9bSeEfccm4nS96YDwPAuj3qnRos8hU3C4VE09A+O0s
 OgyLJHo6Uq1ZGqoC+XdYzhesM/6b/GagdS7N6IYe/V3+fm5KMrMsOG5yrDi2RM6N4EU+
 ldv3wgvnqCU9DkoAzWQbGewePPsQ1LEKFFMG4HLp/o8Hmj+9EcuygvsNiQt0TNnN9ETn
 o7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=iwbijT25JOQabEJoAdZbUrL+K+nZlUlywCNjAPaRkPY=;
 b=s5tJTRCXfnw2J3/GUwR7ERUqV6UbVxTrLH6PZ7r/AEqzG8fy4FdCdHeENTt7B0AoSo
 th3QCPOPISPAj8bBd+wrnVDb1zDxemHwqpU790K7BZt4M21mYeFb/LeVIuVtcLVxtJON
 JkhSQvUP7Kp/rkxyXsu02CUA30+oNrIKhdTwa58V4HKQN1U2n5S99TIyLbp0hlO02nY1
 aPpZDumhSvCY05GG5XVk2s+ED2HkCYkFHZsfEwqeSrc4J7WY4p2e0CRnwZhfqyODD+Js
 Slb2qCZdHhWHqSlX+tJ0guQ4BZxWLSvje0pIB24qLctbEEYaKvDm1dpID1TRhcsSpvu5
 6CfA==
X-Gm-Message-State: ACgBeo1u+0bxIqEYCHxim98bOmllaxwRk7Q329K5fFa3ahA4WaQ66lR1
 up6f154ic0oCz9aol8ja367lvw==
X-Google-Smtp-Source: AA6agR4ykeceqsDPELylN8UCyzrVw8F81lb8BHUuAicXDhJl8e5U6VRW1MUnNOJMxICZLpwoZ8cc/A==
X-Received: by 2002:a05:651c:3d9:b0:25e:505f:2355 with SMTP id
 f25-20020a05651c03d900b0025e505f2355mr10669447ljp.453.1660215772980; 
 Thu, 11 Aug 2022 04:02:52 -0700 (PDT)
Received: from mutt (c-e429e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.41.228]) by smtp.gmail.com with ESMTPSA id
 q11-20020a2eb4ab000000b0025d75995a07sm781439ljm.24.2022.08.11.04.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 04:02:52 -0700 (PDT)
Date: Thu, 11 Aug 2022 13:02:50 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH v2 2/3] drm/amd/display: consider DSC pass-through during
 mode validation
Message-ID: <20220811110250.GA520@mutt>
References: <20220805211317.176672-1-hamza.mahfooz@amd.com>
 <20220805211317.176672-2-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220805211317.176672-2-hamza.mahfooz@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 11 Aug 2022 14:00:04 +0000
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
Cc: Ian Chen <ian.chen@amd.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Roman Li <Roman.Li@amd.com>, Imran Khan <imran.f.khan@oracle.com>,
 Kees Cook <keescook@chromium.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Leo Li <sunpeng.li@amd.com>,
 hersenxs.wu@amd.com, Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-08-05 17:13, Hamza Mahfooz wrote:
> Add a mode validation routine for DSC pass-through. Both the link from
> source to hub, and the link from hub to monitor are checked, according
> to the current link training result and full pbn returned by enum path
> resource sideband message.
> 
> Pick up the minimum value as the bandwidth bottleneck for the end to
> end link bandwidth constraint, and check if the maximum DSC decompression
> bandwidth can fit.
> 
> Co-authored-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Hi,

Building an arm64 allmodconfig kernel from todays next tag, next-20220811.
I can see the following build error.

ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

When I reverted this patch I was able to build an arm64 allmodconfig
kernel.


Cheers,
Anders
