Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C096A6625D4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 13:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02E10E413;
	Mon,  9 Jan 2023 12:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94110E414
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 12:50:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso2416292wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OwZ7m6tA/I7tqsHoGdb3tVqan4AavH0yuZk5xNJc1Kk=;
 b=jjrQj/zmDS8Pug/7xzrgv5TkvIrPhzts0GGGPTpzJ3484QV/tE8j1c9BTT8Yn+h1VT
 HdlLTKipVS9TFrAVmAStgv3Jyj5so5vRNP2h58vceUssUF1AhH8WqX97GQUD6NLSgVQA
 t1QZ82NZkpz8jqsejBLZwMHytTj6kv7Uo7DZqDDU+hA3WN6ZaM2o6Mn2n3JZY9O2oUtB
 eROI2vDQklpghZw8LALRRF0Dic30G0HIoTr1QbqnHFQgU/2voe6srdI+NCluvzgD73UK
 f6KI7OxsnZ+pDCsED3hSsdWtqUbp52cPNfuAT+HTmQAoPGdxbT1Xt+xLF9HphvEJdpgk
 fw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OwZ7m6tA/I7tqsHoGdb3tVqan4AavH0yuZk5xNJc1Kk=;
 b=3DZ7XvZcCAz67X1kvRVXPOjZw9Dqp94vHFAGUsfikwERgiAxga3BYb2dR7J3p8Fl96
 FsmGECwSVN3QVNqk/JBmOcz1hkf10/Gx/C7lIHPYsSC0bm+DVUzhFIZmx48p6ZZwHif1
 iwjJnGjAuywXRv5ceHGFmqu78LxODX0iG9C3rnV8WI58mfRWbWDuebKtbcPlSeqCvxcX
 UBriLyQ2/2r8aW7y5z8j5qhe4ej6J2Mxhl5cdR9D8Ku2SjNuJEEvdNNuwcP81xTGkBp6
 Ua2aBPngCkbpNJGQ4QtIExlJuMBB6ENH/lPcDcId988lbg8rR8Hn774wCJcPYe87sjyC
 n3xA==
X-Gm-Message-State: AFqh2kohNE/3b18jCcaPSr9hrZsaPFS4vqMs41NxfvTzwx3g0VRl41Sy
 nFNYnzaLPTn/6VkrI51SYbguow==
X-Google-Smtp-Source: AMrXdXtl89GZOaLtnX+eQkRYvFBrKoBDlMfwzE2UW1Fi7vYJ5Tpb3cOSeBYrQNYa1PFBg+nF9gx4jA==
X-Received: by 2002:a05:600c:5128:b0:3c6:e62e:2e67 with SMTP id
 o40-20020a05600c512800b003c6e62e2e67mr47468345wms.2.1673268633947; 
 Mon, 09 Jan 2023 04:50:33 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm2889322wms.17.2023.01.09.04.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:50:33 -0800 (PST)
Message-ID: <d00cf1c5-b95b-f8f8-4782-2cfc64bec969@froggi.es>
Date: Mon, 9 Jan 2023 12:50:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Melissa Wen <mwen@igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com> <Yrmf+mWk13qkcsfs@intel.com>
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <Yrmf+mWk13qkcsfs@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 nikola.cornij@amd.com, sunpeng.li@amd.com, alex.hung@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, seanpaul@chromium.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/27/22 13:18, Ville Syrjälä wrote:
> On Sun, Jun 19, 2022 at 09:31:03PM -0100, Melissa Wen wrote:
>> Add 3D LUT for gammar correction using a 3D lookup table.  The position
>> in the color correction pipeline where 3D LUT is applied depends on hw
>> design, being after CTM or gamma. If just after CTM, a shaper lut must
>> be set to shape the content for a non-linear space. That details should
>> be handled by the driver according to its color capabilities.
> 
> I also cooked up a WIP 3D LUT support some time ago for Intel hw:
> https://github.com/vsyrjala/linux/commits/3dlut
> But that dried up due to having no userspace for it.
> 
> I also cooked up some basic igts for it:
> https://patchwork.freedesktop.org/series/90165/
> 
> <snip>
>> + * “LUT3D”:
>> + *	Blob property to set the 3D LUT mapping pixel data after the color
>> + *	transformation matrix and before gamma 1D lut correction.
> 
> On Intel hw the 3DLUT is after the gamma LUT in the pipeline, which is
> where I placed it in my branch.
> 

If the problem here in getting stuff moving for 3D LUT support in DRM is 
lack of a userspace that wants to use it, I would like to just make 
people aware that we are planning on shipping support for this in 
Gamescope/SteamOS.
(It is hooked up right now in the current Gamescope main branch).

We have pulled the patches for AMDGPU by Melissa into our tree and 
hooked it up (with a prefix VALVE1_ before the properties for now as 
stuff is not upstream in the kernel yet) and it seems to be working well 
right now.

I know that the work here not final, and we will definitely change it 
and update our kernel and userspace impl to accomodate that and are more 
than happy to provide testing for this work and other color work.

I understand there is a lot moving right now, with the new color API 
being proposed, etc; but I don't think this should necessarily require 
us blocking any 3D LUT, shaper LUT or other color work on the 
"legacy"(?) path while stuff there is being planned out.

I think it's really important that we keep moving with color support on 
the legacy path while the new one is being planned out to ensure we 
don't accidentally miss something later or end up with something 
suboptimal for a specific vendor.

- Joshie 🐸✨


> There is now some discussion happening about exposing some
> kind of color pipeline description/configuration properties:
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11
> 

