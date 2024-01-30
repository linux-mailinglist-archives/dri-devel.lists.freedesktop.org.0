Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB2842477
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 13:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB51113030;
	Tue, 30 Jan 2024 12:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97F113030;
 Tue, 30 Jan 2024 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706616424;
 bh=B6iwBYIZoWW6c9yKintIHFhedIlhHS48/Se7dv5QbdQ=;
 h=Date:To:Cc:From:Subject:From;
 b=1Py6NNdIm1F2NK5TI+wyvJ9c4RUemFmn/eElE2DuAJb82bGZPJhQP5kmcdFB3ZM6x
 lye//EPCWncckCYGEbcF5Xm4J7MHM0l6JFBYUGr6UQ7qhC41aY95wPp3LphgoY/blF
 QcoZ3ksoma9vSwFzODnjp01d2ylmqDDERqpfarj/UhemXy/iyAqVcd7jNEu7fS6cMS
 F2fBEXZbQ2I+ZbsQkfc+E/VSICtQOuZWCgEvmqNpCNWBAOwQLkePyUiPRvrhiVJVqz
 fBrUEsqs+PjEhpbFY3ATZqPUXKQy9M/t1FVuNfRjv6Cxdv2w4tOs7OdKM5i3ckLVnW
 vaENe/urEO/3w==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6DDD73781182;
 Tue, 30 Jan 2024 12:07:01 +0000 (UTC)
Message-ID: <903b01f7-3f0d-18b7-a4b7-301c118c9321@collabora.com>
Date: Tue, 30 Jan 2024 17:36:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Flaky tests for amdgpu
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
Cc: Daniel Stone <daniels@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>, Xinhui.Pan@amd.com,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

There are some flaky tests reported for amdgpu driver testing in drm-ci.

# Board Name: hp-11A-G6-EE-grunt
# IGT Version: 1.28-gb0cc8160e
# Linux Version: 6.7.0-rc3

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/54373774

# Reported by deqp-runner
amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo

Will add these tests in 
drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
