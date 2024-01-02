Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD88217FE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 08:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1B010E067;
	Tue,  2 Jan 2024 07:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3104610E067
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 07:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704180691;
 bh=CbERXpmNHowZrmnKBk3cwy9kumXe/f2b5V7qaP5ZTTk=;
 h=Date:To:Cc:From:Subject:From;
 b=EjdzWffufAlAXbsxeDxQFYBrToVuM7d7Gdy39W6jWnZE6KEfRyA6qpmOVMwWL9VIc
 qtRCW9FVgDxgqeCWXx9t/q2tergoxi9H4h2h2mNTIJ95fYvdGVMJ3zhh6VFR8VRXN3
 ByA3jSvuYxUEAV9flXJQZfTUSULo5fJAUM/Ywl3cJ60JoH9cCEOlnh1bmVkXNAtQKx
 XW9903O0OUv/q5Bk9iVlNOgZRbvfcx89g2bJ98qxccPWJtfY551DIRp37trja5GajJ
 ymPsnjxgxkXkcfbVJM604dt7KDb/IwDJnHTN4RoVdLe9v030VCKAJJp8OZFLJ/oKIJ
 GgMr4hDoWfbgw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 40EBE3780029;
 Tue,  2 Jan 2024 07:31:27 +0000 (UTC)
Message-ID: <005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com>
Date: Tue, 2 Jan 2024 13:01:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mairacanal@riseup.net
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Flaky tests for vkms
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
 Helen Mae Koike Fornazier <helen.koike@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maintainers,

The patch introducing vkms driver testing in drm-ci has been submitted 
upstream 
(https://patchwork.kernel.org/project/dri-devel/patch/20230922171237.550762-3-helen.koike@collabora.com/)
We will send an update to this patch with new test results from the 
latest drm-misc-next.

There are some flaky tests reported for vkms with the latest tests.
# Board Name: vkms
# Failure Rate: 50
# IGT Version: 1.28-gd2af13d9f
# Linux Version: 6.7.0-rc3

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53081973

# Reported by deqp-runner
kms_cursor_legacy@cursorA-vs-flipA-legacy
kms_cursor_legacy@cursorA-vs-flipA-varying-size

Will add these tests in drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
