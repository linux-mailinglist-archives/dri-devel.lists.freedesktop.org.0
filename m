Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA38C5048FB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 20:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80510E23D;
	Sun, 17 Apr 2022 18:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3592110E8A2;
 Sat, 16 Apr 2022 05:47:59 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c23so8607155plo.0;
 Fri, 15 Apr 2022 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hZc9zcmo/JWKOyzC5RRU+RQ67f92+BjrAId5apbjxx4=;
 b=BTmnZpEXjDVfSLT1f+xWT1/xn6sYOGBXR8vnDdrxz72m3mLd5ZTISc8FjWEHxbnZ0Q
 kJ7JUbXOpyyCJhdDcNb1py4wsDmm7KpjIfQP6GR8yEcaOYKFQYFO+2vWcNvXpiZKLMr3
 q/e6QdW02QmpwPIlnbLe3oX4WWCYdm2n/JyeS+GEd0Hp93xNjUuUpiis8JhOFyd2SMFN
 ay7peWdqRl0rrxVRxMOEZ+V2dJeDYrI9zRG6DJgh5g+qK1wueWuxmR5pDbJZt8lPtBd3
 j/RdN9aum+gG4YDDb8b+7ttaSuryetMAh4wDVL2BAlRjdQfCShj0B6C35DBcPCbMdm1W
 78DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hZc9zcmo/JWKOyzC5RRU+RQ67f92+BjrAId5apbjxx4=;
 b=YgvXJkekjvzIpcJX+JVDZBzdNt3rOtmLbhBnFqqzp8g9eMg1VA3FL7N89dnmAx5SWe
 l/ADQ9tlJSk/Qjwde/+a0j+cRCSG2Qz5G1V1ycYQL/Trf20PSqRjl35tjz6m0PiKOPb6
 kCL0UDGLi8kiSP0IVQ4I0UfjvHaM+0nhn8imjadvs2ow/WDyCs7bSWCHA8D/Y6rDUCN3
 YgCZSRUPtzIOVma9H0dgLdj9LYAI6IqouAoO3Ot1mh72Xmy/93IUME2BfFsoaZv8W+XE
 NvELqeWl5GThECrXgFtRtvk76k8bsyfXMx6o3tkYcFWtRotrnFBjdtwScgtLENpVKCFg
 /QrQ==
X-Gm-Message-State: AOAM530EQhsHwoxZNB9YSXfv5S5ZQGFT/x7S1NuP06TpWQnQQQM7VEF1
 6m5FESc5YaSteZF3PPlx6bk=
X-Google-Smtp-Source: ABdhPJzdHPNlkXPAZkSmp1NrPiHL6M/Utpy+7qlfUa98UuKLz8IjuFuaODr3HigacXCm/YRRaKqAOw==
X-Received: by 2002:a17:90b:3889:b0:1c7:a31f:2a50 with SMTP id
 mu9-20020a17090b388900b001c7a31f2a50mr7764499pjb.193.1650088078753; 
 Fri, 15 Apr 2022 22:47:58 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-90.three.co.id.
 [180.214.233.90]) by smtp.gmail.com with ESMTPSA id
 u22-20020a17090a891600b001cd498dc152sm7993070pjn.2.2022.04.15.22.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 22:47:58 -0700 (PDT)
Message-ID: <4f4c8441-a144-6c2d-0f8b-b598905c2f3d@gmail.com>
Date: Sat, 16 Apr 2022 12:47:52 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] MAINTAINERS: add docs entry to AMDGPU
Content-Language: en-US
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
 <20220415195027.305019-3-tales.aparecida@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220415195027.305019-3-tales.aparecida@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 17 Apr 2022 18:40:14 +0000
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

On 4/16/22 02:50, Tales Lelo da Aparecida wrote:
> To make sure maintainers of amdgpu drivers are aware of any changes
>  in their documentation, add its entry to MAINTAINERS.
> 

Did you mean the Documentation/gpu/amdgpu/ is maintained by dri-devel?

-- 
An old man doll... just what I always wanted! - Clara
