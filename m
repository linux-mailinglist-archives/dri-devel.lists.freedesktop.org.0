Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E58D13BC
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 07:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DAF10E689;
	Tue, 28 May 2024 05:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1yCbZPq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0267F10EF85
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 05:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716873319;
 bh=kbncBv0G++LEg5TbG8VCEGtL1M8slSrOe9lmbF7NEE4=;
 h=Date:To:Cc:From:Subject:From;
 b=1yCbZPq/zZuws2/cirWjfE03wWpmkbpeeEeA8PW+HLfiUzYsFZSqK7WD6OF/4tMKr
 YoWI/zsvVm7jmQ2PRULiPgNZbafipuzkM1DgjlfgMzKdBawiOttwZdceOXDFPYsttz
 Wzpx+ZNbOliFYZtQOmXos4xLHtLzRmRZcpoe4rjbRPbJLkC1eem7iUCPM9sDGG7+7N
 R2j4jvk0EaVkLLbMI2EuIWG+JLUZgedjKpkVvYqpzZKRtB1PO3PzK4ny7orXBRqqX7
 j6cDzkfv0kZHnd1dIWDEqIgQxkd1g7rkfZYhhOzPjexl46WtJO+gyTgNZPtnjke/i/
 HNb22knszqcbQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1470A3782137;
 Tue, 28 May 2024 05:15:16 +0000 (UTC)
Message-ID: <5cc34a8b-c1fa-4744-9031-2d33ecf41011@collabora.com>
Date: Tue, 28 May 2024 10:45:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, robh@kernel.org,
 steven.price@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for panfrost driver testing
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

Hi Maintainers,

There are some flaky tests reported for panfrost driver testing in drm-ci.

# Board Name: rk3399-gru-kevin
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
panfrost_submit@pan-unhandled-pagefault

Will add these tests in 
drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
