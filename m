Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D69726B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 03:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72A410E55D;
	Tue, 10 Sep 2024 01:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="Dep+z9gD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4810E55D;
 Tue, 10 Sep 2024 01:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725933032; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fIPdJk+6J18vJCJUi1Pyl8+n/91d2Ts5crRnF9ntW2PILiQjafsn6eB248X6Ml/iFKESTpnbCHjGuLtOUfxfh3bs7vU25jcFJ5JHo7mAfZ4Q0+0fS1NmD+nhfYzYZGEW4lthkU2EolWcPLsAj4mHI2oI3GEsb91hzevG0GkJTnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725933032;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vPytkYFUSSd+BWTuELtYnmazpfLpeTZTeQ2mw3v85wE=; 
 b=jiKuw9O0DELOn89lTjjVPPEJkZdVmbgXPIvWnhLbGOdiXAGlurb1XO0BgKAAkkW9qAV8DuD9rKocJ5pRl+lLh/58Gz4DF1IQ4qOTzwszHkVnKS8UuWRIsmW1knmrsZk9IRPU+qsQS+gEutO9B1ffJxJF2H9ZIgE3M5u9aWcHgOQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725933032; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vPytkYFUSSd+BWTuELtYnmazpfLpeTZTeQ2mw3v85wE=;
 b=Dep+z9gDdIA9oNdWvqeKcjVTjU8GGJMHIoqSqAErlmxPPHGof+AyX4ZZREzht3A2
 QE6Cvis8XkzhjngOQFrHkSUXDcpehxpEPLfDMSS/YGGJeLGY3a4LgNRI3cjbDWHFcId
 H7pWIFKgBC1ZLADi3pKW8Wrkf/O9k3PLyjHqMItM=
Received: by mx.zohomail.com with SMTPS id 1725933029424493.8684684871224;
 Mon, 9 Sep 2024 18:50:29 -0700 (PDT)
Message-ID: <09ee1862-3a0e-4085-ac1b-262601b1122b@collabora.com>
Date: Tue, 10 Sep 2024 07:20:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for amdgpu driver testing
From: Vignesh Raman <vignesh.raman@collabora.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 lijo.lazar@amd.com, felix.kuehling@amd.com, srinivasan.shanmugam@amd.com,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>
References: <3542730f-b8d7-404d-a947-b7a5e95d661c@collabora.com>
Content-Language: en-US
In-Reply-To: <3542730f-b8d7-404d-a947-b7a5e95d661c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Maintainers,

On 28/05/24 10:19, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for amdgpu driver testing in drm-ci.
> 
> # Board Name: hp-11A-G6-EE-grunt
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_async_flips@async-flip-with-page-flip-events
> kms_async_flips@crc
> kms_plane@pixel-format-source-clamping
> 
> Will add these tests in 
> drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for amdgpu driver testing in drm-ci.

# Board Name: hp-11A-G6-EE-grunt
# Failure Rate: 100
# IGT Version: 1.28-ga73311079
# Linux Version: 6.11.0-rc2
kms_async_flips@async-flip-with-page-flip-events

Will add these tests in 
drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
