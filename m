Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3BA6EEA9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09410E53E;
	Tue, 25 Mar 2025 11:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BDM6SVMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860D310E53C;
 Tue, 25 Mar 2025 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742900795;
 bh=D0N/mgLzCXi4oZJoUT9/lMZngBeCJnMRqCEe8RPVzCw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BDM6SVMILwPq70pCVbl5bItk8GC0tcw9Yf/34rYFw6mCnsN+0yUhfJ/hjiEeDmn72
 U/rtTB5SmTcJGgmK3BZgMDjTc0hOnJaukjn/UNzwgBnVk7brn9q0PkuiUIBfUuZDFV
 /zv/Zxa8KTIPQG2taIBBWZ5p/GXotmZq93q8rvpyMR3QhlH9TaqL4UWMJLUDFeiJav
 oaWEJjL7EdSh00MXLBQG9R/fO5qaK1ES5NL0feETn5ewOfDXhGrOCpSZC+OTwfLJOL
 KAzWvgqVBrQpvPHyVOUJI/5otjdYifxjbuAroFyqWGttAulvH7kZxZ+7Cd/mLVZAPr
 QrTihiq9olnjw==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8ED1117E09D6;
 Tue, 25 Mar 2025 12:06:30 +0100 (CET)
Message-ID: <c71855d0-2638-4f06-9b75-cdbd137837bb@collabora.com>
Date: Tue, 25 Mar 2025 16:36:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-2-vignesh.raman@collabora.com>
 <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
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


On 21/03/25 15:56, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 14 Mar 2025 at 08:59, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> LAVA was recently patched [1] with a fix on how parameters are parsed in
>> `lava-test-case`, so we don't need to repeat quotes to send the
>> arguments properly to it. Uprev mesa to fix this issue.
> 
> Thanks a lot; the series is:
> Acked-by: Daniel Stone <daniels@collabora.com>

Applied to drm-misc-next.

Regards,
Vignesh

> 
> Cheers,
> Daniel
> 

