Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348019036FB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 10:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F5F10E170;
	Tue, 11 Jun 2024 08:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ezJzqcCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE910E170
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718095760;
 bh=4SHAseW1dQJcwP14a0bj0OY1Hdb2hQBDCdqAnldhJBs=;
 h=Date:From:Subject:To:Cc:From;
 b=ezJzqcCe0GAdKtK5iXSIfNDNEysosv09KeYyRD/wKphng7eQ6dmx4dUmsHVVQghDQ
 hoePF1rRjY+QIKX8UTNWZ1i0yOuiqoMVNYDmyAPs5daflUA4XNmOIVqVQnQX0sIL/Y
 BC8dDdtwkIuau2VrpSxBP8RogyP3kQySGwu05CpvAeuA8EiiHcGKv/hdb9stPX+ZOD
 iwwJSubqTzys4daF1hMyEMy5I4DjyOI0Mn8al+Z8Pmy77fJmI1WLiSbfz8A8b/S0KH
 GQg9RR8juAjWr4NPgQcP9dQyDJvcKu0AAkd9P9muIv+yT/e+NivI7dDb9qhRnXQSkT
 kiq8a+Wod1BSg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C1F923781013;
 Tue, 11 Jun 2024 08:49:17 +0000 (UTC)
Message-ID: <61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com>
Date: Tue, 11 Jun 2024 14:19:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for vkms driver testing
To: mairacanal@riseup.net, melissa.srw@gmail.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, Daniel Stone
 <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
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

There are some flaky tests reported for vkms driver testing in drm-ci.

# Board Name: vkms
# Failure Rate: 50
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
kms_flip@basic-flip-vs-wf_vblank
kms_flip@flip-vs-expired-vblank-interruptible
kms_flip@flip-vs-wf_vblank-interruptible
kms_flip@plain-flip-fb-recreate-interruptible
kms_flip@plain-flip-ts-check
kms_flip@plain-flip-ts-check-interruptible
kms_flip@flip-vs-absolute-wf_vblank
kms_flip@flip-vs-absolute-wf_vblank-interruptible
kms_flip@flip-vs-blocking-wf-vblank

Will add these tests in drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
