Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35483A85692
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D7E10EB33;
	Fri, 11 Apr 2025 08:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AGEwTr5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C4710EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744360347;
 bh=jDXgH9UOU6hxp0nNSex6a9gkLQoHlU/faUOtfQvaxI0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGEwTr5MjkPRpn05kVhygBv1XSLJfkqASuXh75Ac/qlbqv7D2aXUl/WlenrdHvH+J
 K3PBy9HY4NpnUOgRHL0Lf3447eMvXN+0w4rxNu1AAg18ApeVjwtm9F+g/8K3vdBbqV
 /ptaIWd210ap80ZNEMpXr3gCM/D7cCxsg7UbwYPxKf4jbklanCx5nVOcOqsJUdN0iu
 vEfnnmWQ0MC7RyfcN9YEhOWK9tg+yuzAzqzmxfur8IzY/HRyadOIAjXpkcGSGUDDoo
 sQwcMZUmheIDdPRdPxXCis2oBPJjoBNZF7B97SyDAFHTGYUSary6TtDOHs7lvaDWND
 ZVd2XVwvb9aVQ==
Received: from [192.168.50.250] (unknown [171.76.80.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E756A17E0EB8;
 Fri, 11 Apr 2025 10:32:23 +0200 (CEST)
Message-ID: <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
Date: Fri, 11 Apr 2025 14:02:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com>
 <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 11/04/25 01:02, Dmitry Baryshkov wrote:
> On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
>> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
>> exit with a non-zero error code while configuring them as warning in
>> the GitLab CI pipeline.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Use LLVM to build.
> 
> Why?

We are using LLVM/Clang instead of GCC to avoid architecture-specific 
toolchain for cross compiling. This is done to make the script generic 
and run only kunit tests. I will update this section.

> 
>>
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

Thanks.

Regards,
Vignesh

