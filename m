Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E29B6316
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 13:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3D10E79D;
	Wed, 30 Oct 2024 12:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J2fIeowd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F2210E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730291475;
 bh=7HgRtPNS8CUkBTCpmmeomtOUpIWKob4wQYR+p7sTdZE=;
 h=Date:To:Cc:From:Subject:From;
 b=J2fIeowdPu0wKw7clbC+LOJp1MXyYTIh+4ISDeeCgQEQaoalOo4jSxDplFWA8Xvt7
 Mn1eiht4VIGV0ce9wADf32t8V8QXMWnscP/hdPRSzIHc8Naxrl8ApN3wTL4mnvPZ42
 B/h/OdRKCC4Vyfjd2Cs73uc2iO9+mLTDwX6/vm5o+pkOfz2tcrF24H3G3iGm/4R7fF
 MW5j/Oga/EgplOOFmGRtWHT2VB+Wo3r50BWAaEcKRRGBbv0FRTOhsgYtCfJcMo/0tB
 qqHYXJLNZcuJnavmI/MPCyB7P63PMWa+c0ji2m/ekb1fjQSUM9VTvhzAZNpCs42lHe
 Av0dY8xe8g/Kg==
Received: from [192.168.50.250] (unknown [171.76.83.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2449C17E35D3;
 Wed, 30 Oct 2024 13:31:14 +0100 (CET)
Message-ID: <b7107a1c-d170-44d9-96c2-4f7051d0721f@collabora.com>
Date: Wed, 30 Oct 2024 18:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: INFO: task testdisplay:2546 blocked for more than 122 seconds
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

Hi,

Below issue was seen with drm-ci testing,

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/65859386
Linux version: 6.12-rc2
Branch: drm-misc-next

DEBUG - Begin test testdisplay
[ 1229.996702] INFO: task testdisplay:2546 blocked for more than 122 
seconds.
[ 1229.997303]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1229.997764] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1229.998816]
                Showing all locks held in the system:
[ 1229.998824] 1 lock held by khungtaskd/29:
[ 1229.998830]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1229.998870] 1 lock held by dmesg/66:
[ 1229.998875] 3 locks held by kworker/1:0/495:
[ 1229.998881] 2 locks held by kms_concurrent/1623:
[ 1229.998886]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1229.998915]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1229.998937] 1 lock held by testdisplay/2546:
[ 1229.998943]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1229.998968] =============================================

[ 1352.876639] INFO: task testdisplay:2546 blocked for more than 245 
seconds.
[ 1352.877238]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1352.877707] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1352.878582]
                Showing all locks held in the system:
[ 1352.878587] 1 lock held by khungtaskd/29:
[ 1352.878591]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1352.878613] 1 lock held by dmesg/66:
[ 1352.878618] 4 locks held by kworker/1:0/495:
[ 1352.878622] 2 locks held by kms_concurrent/1623:
[ 1352.878626]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1352.878647]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1352.878665] 1 lock held by testdisplay/2546:
[ 1352.878669]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1352.878689] =============================================

[ 1475.756731] INFO: task testdisplay:2546 blocked for more than 368 
seconds.
[ 1475.757311]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1475.757863] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1475.758884]
                Showing all locks held in the system:
[ 1475.758890] 1 lock held by khungtaskd/29:
[ 1475.758895]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1475.758921] 1 lock held by dmesg/66:
[ 1475.758927] 3 locks held by kworker/1:0/495:
[ 1475.758933] 2 locks held by kms_concurrent/1623:
[ 1475.758938]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1475.758963]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1475.758985] 1 lock held by testdisplay/2546:
[ 1475.758990]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1475.759016] =============================================

[ 1598.636617] INFO: task testdisplay:2546 blocked for more than 491 
seconds.
[ 1598.637199]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1598.637638] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1598.638466]
                Showing all locks held in the system:
[ 1598.638471] 1 lock held by khungtaskd/29:
[ 1598.638476]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1598.638498] 1 lock held by dmesg/66:
[ 1598.638502] 2 locks held by kworker/1:0/495:
[ 1598.638507] 2 locks held by kms_concurrent/1623:
[ 1598.638511]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1598.638531]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1598.638561] 1 lock held by testdisplay/2546:
[ 1598.638565]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1598.638586] =============================================

[ 1721.516713] INFO: task testdisplay:2546 blocked for more than 614 
seconds.
[ 1721.517446]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1721.518039] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1721.519117]
                Showing all locks held in the system:
[ 1721.519124] 1 lock held by khungtaskd/29:
[ 1721.519130]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1721.519160] 1 lock held by dmesg/66:
[ 1721.519167] 3 locks held by kworker/1:0/495:
[ 1721.519173] 2 locks held by kms_concurrent/1623:
[ 1721.519179]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1721.519207]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1721.519231] 1 lock held by testdisplay/2546:
[ 1721.519237]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1721.519267] =============================================

[ 1844.396721] INFO: task testdisplay:2546 blocked for more than 737 
seconds.
[ 1844.397422]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1844.397950] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1844.398996]
                Showing all locks held in the system:
[ 1844.399004] 1 lock held by khungtaskd/29:
[ 1844.399010]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1844.399041] 1 lock held by dmesg/66:
[ 1844.399048] 4 locks held by kworker/1:0/495:
[ 1844.399053] 2 locks held by kms_concurrent/1623:
[ 1844.399058]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1844.399084]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1844.399108] 1 lock held by testdisplay/2546:
[ 1844.399113]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1844.399141] =============================================

[ 1967.276701] INFO: task testdisplay:2546 blocked for more than 860 
seconds.
[ 1967.277282]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 1967.277735] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 1967.278559]
                Showing all locks held in the system:
[ 1967.278576] 1 lock held by khungtaskd/29:
[ 1967.278580]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 1967.278602] 1 lock held by dmesg/66:
[ 1967.278606] 2 locks held by kworker/1:0/495:
[ 1967.278610] 2 locks held by kms_concurrent/1623:
[ 1967.278614]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 1967.278633]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 1967.278650] 1 lock held by testdisplay/2546:
[ 1967.278654]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 1967.278674] =============================================

[ 2090.156642] INFO: task testdisplay:2546 blocked for more than 983 
seconds.
[ 2090.157632]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 2090.158241] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 2090.159102]
                Showing all locks held in the system:
[ 2090.159107] 1 lock held by khungtaskd/29:
[ 2090.159111]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 2090.159133] 1 lock held by dmesg/66:
[ 2090.159137] 3 locks held by kworker/1:0/495:
[ 2090.159141] 2 locks held by kms_concurrent/1623:
[ 2090.159145]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 2090.159165]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 2090.159182] 1 lock held by testdisplay/2546:
[ 2090.159189]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 2090.159209] =============================================

[ 2213.036658] INFO: task testdisplay:2546 blocked for more than 1105 
seconds.
[ 2213.037250]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 2213.037744] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 2213.038593]
                Showing all locks held in the system:
[ 2213.038598] 1 lock held by khungtaskd/29:
[ 2213.038602]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 2213.038624] 1 lock held by dmesg/66:
[ 2213.038629] 3 locks held by kworker/1:0/495:
[ 2213.038633] 2 locks held by kms_concurrent/1623:
[ 2213.038637]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 2213.038657]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 2213.038674] 1 lock held by testdisplay/2546:
[ 2213.038678]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 2213.038699] =============================================

[ 2335.916691] INFO: task testdisplay:2546 blocked for more than 1228 
seconds.
[ 2335.917751]       Not tainted 6.12.0-rc2-g13339fa4b45f #1
[ 2335.918166] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[ 2335.919035]
                Showing all locks held in the system:
[ 2335.919040] 1 lock held by khungtaskd/29:
[ 2335.919044]  #0: ffffffff93d5b2c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x36/0x1c0
[ 2335.919066] 1 lock held by dmesg/66:
[ 2335.919071] 3 locks held by kworker/1:0/495:
[ 2335.919075] 2 locks held by kms_concurrent/1623:
[ 2335.919079]  #0: ffffa9fe00b4fd20 
(crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x11b/0xc90
[ 2335.919099]  #1: ffff8cc9c140caf0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: modeset_lock+0x5c/0x1c0
[ 2335.919116] 1 lock held by testdisplay/2546:
[ 2335.919120]  #0: ffff8cc9c0a1f0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, 
at: drm_modeset_lock+0x1e/0x30

[ 2335.919140] =============================================

Regards,
Vignesh
