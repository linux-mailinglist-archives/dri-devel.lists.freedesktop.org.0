Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF58D13D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 07:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8721C10E57A;
	Tue, 28 May 2024 05:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3PivAxFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDCB10E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 05:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716873946;
 bh=CyZTXXa2iMUonSsiilt2DD2P/g/+qRDX4b1zOC+LFI0=;
 h=Date:To:Cc:From:Subject:From;
 b=3PivAxFpNaXxBPWm95z+j1BvJMDiIxZP6s/4Gxy5vhUMsfqp2Dk80VefOv5W8qICT
 HChJ4U7IlVpmFAMz4MQvuGvhkpuNwfZDc68QGh4zY81ot6Dgpw/kza2M8IxPzP1WPY
 s6iNw5fFsGJ1zz91oXXr8RAgbriXw+bTfW8EAB/fTuX5H2YaO5ZOO1Ll01+WETceFv
 Pk3ABi0C+8ZKpkAvnVVEzJ3vEEtftNZHS8llSCXDzlBDOVOm1FGnikoVIXNIRquGYj
 uzoTAS9PEy8PUw08TAoAVBv59xyJ71G69KAgETpe5XzvNC4Q11aYrWjmDma9045GsJ
 XM5jb5znEhxyA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 15C113780480;
 Tue, 28 May 2024 05:25:43 +0000 (UTC)
Message-ID: <0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com>
Date: Tue, 28 May 2024 10:55:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for mediatek driver testing
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

There are some flaky tests reported for mediatek driver testing in drm-ci.

# Board Name: mt8173-elm-hana
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
core_setmaster_vs_auth
dumb_buffer@create-clear
fbdev@unaligned-write
fbdev@write
kms_cursor_legacy@cursor-vs-flip-atomic-transitions
kms_prop_blob@invalid-set-prop

Will add these tests in 
drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
