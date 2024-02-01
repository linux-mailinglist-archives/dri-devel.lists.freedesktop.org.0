Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BAB84523C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 08:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94B810E45E;
	Thu,  1 Feb 2024 07:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D8910E45E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 07:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706773698;
 bh=Fax2ctM5J6+Qo4iXa5ViJ/tr/9QQTzWoKESjaxpdmuI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=s2q+YPHy+pmUVd2kTe+0i8Khnj+MZF61nPZeFK7eSUKt66JeZgIXDaXcfHDsVUWhe
 ev4QohG6Lu9q9OtRwC3HBV4Iycp4o/qKJA5DhsTko0HGj6WzzhrfAQyCOXqc8RxVRb
 TBcPLen63snq3ELCeMl7KMsVF8sMu+g6kRwOirffKWjjzTY5OC677yLYxbPJDSxDt2
 4eCoRpIM8l6HOAPADzsZJV0BG+4o9YXyTwv8ZUt98aVcIlxTMAGFEha0wdNsuRzC+O
 cu13RvHOaaAJHweaaKUoXSILVALvR6n9mZzgk65kBBOCSJaRC7DQGKLAO6ySvhytlb
 JaVqIKe5RoWqg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7FA5837809D0;
 Thu,  1 Feb 2024 07:48:14 +0000 (UTC)
Message-ID: <d2cbf8b0-91e8-592f-092e-adef78aeb389@collabora.com>
Date: Thu, 1 Feb 2024 13:18:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Flaky tests for vkms
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net
References: <005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com>
In-Reply-To: <005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com>
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
Cc: hamohammed.sa@gmail.com, Daniel Stone <daniels@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 dri-devel@lists.freedesktop.org,
 David Heidelberg <david.heidelberg@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Helen Mae Koike Fornazier <helen.koike@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

vkms test patch 
(https://lore.kernel.org/dri-devel/20240201065346.801038-1-vignesh.raman@collabora.com/) 
was retested with latest drm-misc-next and xfails have been updated,

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/54431093
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/54446123

# Board Name: vkms
# Bug Report: 
https://lore.kernel.org/dri-devel/005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com/T/#u
# IGT Version: 1.28-gb0cc8160e
# Linux Version: 6.7.0-rc3
# Failure Rate: 50

# Reported by deqp-runner
kms_cursor_legacy@cursorA-vs-flipA-legacy
kms_cursor_legacy@cursorA-vs-flipA-varying-size
kms_flip@flip-vs-expired-vblank-interruptible
kms_flip@flip-vs-expired-vblank
kms_flip@plain-flip-fb-recreate
kms_flip@plain-flip-fb-recreate-interruptible
kms_flip@plain-flip-ts-check-interruptible

# The below test shows inconsistency across multiple runs,
# giving results of Pass and Fail alternately.
kms_cursor_legacy@cursorA-vs-flipA-toggle
kms_pipe_crc_basic@nonblocking-crc

Regards,
Vignesh


On 02/01/24 13:01, Vignesh Raman wrote:
> Hi Maintainers,
> 
> The patch introducing vkms driver testing in drm-ci has been submitted 
> upstream 
> (https://patchwork.kernel.org/project/dri-devel/patch/20230922171237.550762-3-helen.koike@collabora.com/)
> We will send an update to this patch with new test results from the 
> latest drm-misc-next.
> 
> There are some flaky tests reported for vkms with the latest tests.
> # Board Name: vkms
> # Failure Rate: 50
> # IGT Version: 1.28-gd2af13d9f
> # Linux Version: 6.7.0-rc3
> 
> Pipeline url:
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53081973
> 
> # Reported by deqp-runner
> kms_cursor_legacy@cursorA-vs-flipA-legacy
> kms_cursor_legacy@cursorA-vs-flipA-varying-size
> 
> Will add these tests in drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.
> 
> Regards,
> Vignesh
