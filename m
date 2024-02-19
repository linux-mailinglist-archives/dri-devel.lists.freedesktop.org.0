Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D8859C66
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 07:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679E510E15B;
	Mon, 19 Feb 2024 06:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pRmfWBpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC8910E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708325678;
 bh=1NgcMtzPO0m3SO7u5i6Aa92xKwAGy2C4+8bSY9cjPYE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pRmfWBpHhI9zLfp2ryK8ApD+TEYRjegeILqiXYsaD3AUQLLfBmQM3KDz7M0yEBKtn
 m2vLXxrJ+XI+/44hgIZHndL/TFThnSyKY3b11KmNC4ZaNpiYL6CtUnumv7W8u+bRIz
 qzy5xpmJyJ9lmo4ceRaW8U/HMHL6a6TOeM9rPaBZ82uCz4AgG3d1vKhKeD5KivNGoJ
 vqXIFjloMTlEZisZ0hEe9J/MNdgtSfTj9UhZtEJ6d5pHywnlQBAvvafTSjl6iBDKli
 8b8ks2+KRVyua9rrmvkvlwpEgzBsHSC5/PXPksQytFrr5i7Do9frxGU0RHnZ3MTDFf
 zLFNWZz2e3zQg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C1A8A3781FE3;
 Mon, 19 Feb 2024 06:54:35 +0000 (UTC)
Message-ID: <bc7df152-51c1-0ba9-dbe4-8b571c199ad4@collabora.com>
Date: Mon, 19 Feb 2024 12:24:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] drm/ci: add tests on vkms
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: hamohammed.sa@gmail.com, daniels@collabora.com,
 rodrigosiqueiramelo@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 daniel@ffwll.ch
References: <20240201065346.801038-1-vignesh.raman@collabora.com>
 <ae4e612a-47d2-4190-8547-2c8dc13b2cd6@collabora.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ae4e612a-47d2-4190-8547-2c8dc13b2cd6@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 09/02/24 23:17, Helen Koike wrote:
> 
> 
> On 01/02/2024 03:53, Vignesh Raman wrote:
>> Add job that runs igt on top of vkms.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>> ---
>>
>> v2:
>> - do not mv modules to /lib/modules in the job definition, leave it to
>>    crosvm-runner.sh
>>
>> v3:
>> - Enable CONFIG_DRM_VKMS in x86_64.config and update xfails
>>
>> v3:
>> - Build vkms as module and test with latest IGT.
>>    This patch depends on 
>> https://lore.kernel.org/dri-devel/20240130150340.687871-1-vignesh.raman@collabora.com/
>>
> 
> Do you have a link of a pipeline with this job passing?

Here is the pipeline with the job passing,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1092194

Regards,
Vignesh
