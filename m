Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A995046CD
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 08:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0510E515;
	Sun, 17 Apr 2022 06:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70E10E515;
 Sun, 17 Apr 2022 06:18:46 +0000 (UTC)
Received: from [192.168.1.11]
 (dynamic-077-011-140-085.77.11.pool.telefonica.de [77.11.140.85])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 51CD061EA192D;
 Sun, 17 Apr 2022 08:18:44 +0200 (CEST)
Message-ID: <cb824b43-4812-f794-80dd-9ad8f7b35be0@molgen.mpg.de>
Date: Sun, 17 Apr 2022 08:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] Documentation/gpu: Add entries to amdgpu glossary
Content-Language: en-US
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
References: <20220415195027.305019-1-tales.aparecida@gmail.com>
 <20220415195027.305019-2-tales.aparecida@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220415195027.305019-2-tales.aparecida@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, andrealmeid@riseup.net,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Tales,


Thank you for your patch.

Am 15.04.22 um 21:50 schrieb Tales Lelo da Aparecida:
> Add missing acronyms to the amdgppu glossary.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/1939#note_1309737
> Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
> ---
>   Documentation/gpu/amdgpu/amdgpu-glossary.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> index 859dcec6c6f9..48829d097f40 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -8,12 +8,19 @@ we have a dedicated glossary for Display Core at
>   
>   .. glossary::
>   
> +    active_cu_number
> +      The number of CUs that are active on the system.  The number of active
> +      CUs may be less than SE * SH * CU depending on the board configuration.
> +
>       CP
>         Command Processor
>   
>       CPLIB
>         Content Protection Library
>   
> +    CU
> +      Compute unit

Capitalize the U in *unit* as seems to be done in the rest of the files?

> +
>       DFS
>         Digital Frequency Synthesizer
>   
> @@ -74,6 +81,12 @@ we have a dedicated glossary for Display Core at
>       SDMA
>         System DMA
>   
> +    SE
> +      Shader Engine
> +
> +    SH
> +      SHader array

No idea if the H should be capitalized.

> +
>       SMU
>         System Management Unit
>   


Kind regards,

Paul
