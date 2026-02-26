Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACNINanen2kxegQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:48:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B921A1192
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 06:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621F10E021;
	Thu, 26 Feb 2026 05:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JizTHz3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40710E021
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772084898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XmBuIUiRXRrQAVnTvz1pwFbrKKXF4H4jHwutt43vaS0=;
 b=JizTHz3O+Yayen/7v7D61ILCr5B79U6fHYz/V3YaALrMX7MVoFhc3icsCLoXW07tfM2lCK
 VPNPIgteT6lQnIbZ23DUG4XQIfwibDwsGBbAgWur/FcrLlbTYzo8oQdpE7/DFcfusmHCLA
 AXPl8kDRH+y6DAcJPFKwNICszOuUaSU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-0M07zIAVNiCjDQ8TNkET-w-1; Thu, 26 Feb 2026 00:48:16 -0500
X-MC-Unique: 0M07zIAVNiCjDQ8TNkET-w-1
X-Mimecast-MFC-AGG-ID: 0M07zIAVNiCjDQ8TNkET-w_1772084895
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4836b7fbf4fso3158175e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 21:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772084894; x=1772689694;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XmBuIUiRXRrQAVnTvz1pwFbrKKXF4H4jHwutt43vaS0=;
 b=IDeEeBJtkVbvJu0plX6Qs3OAFgfDNyOMGRMGIQjOYk6cgR9OcaC/jXLiTWO8CNdd7H
 T4s0Bw9U6NPMc6qcRiUQ0zaPkO8vlpdHdgnViNq8EOD8LHp03UcJe2tvugBx9s7oyvhT
 2CHRiaR9Cu8hnvEDqiOYQL+I6Q5PRRFUmUozRGyyuYH7bRbd3N87Rjd7E5lqHP70jJ4Y
 0s8B4iLlWBPTMZ4BL+zabiiUL55F7XWwPKVEzQZnoi6y2nmq6ug2sPxO+GyHrgp7hb1P
 rvSAad9uECWxDCoYgaAefAQgrGd/lAsSOq2MveQBSghV5uwutXS+e6NbX3j/Xuq7Izew
 54XQ==
X-Gm-Message-State: AOJu0YyWgxD0tSZDPUuhmjvbldSdTlon9sMVIHHyfRrg8fMIq7JnKKxR
 3U6ZxBqLDDelDbQWjHgSXk2ZL0bhFdzxa+wi2CD5ufJ7wFRTao0jrWamTQhnzSjS5+RJkWt+cMV
 +u5f5xcThczki9b1Ap8rKkXASY0HW627wRF9DdWzbhzjMAV0/EkGgew95lu0KBuE19EjyGoVWmP
 D5xx2a6Yzo1nCVjUDyo6uF3djzK6UgJfu772xv5aBIAEdWdQPTyi7Y
X-Gm-Gg: ATEYQzyxwqCpHekeptCj9qOTkEgf7OpwrmLJKHAqs9R/DiEx9lT1qn3wWeur9D0QvSp
 /aakCFCQUxwYj/29euSaHXxd9DU9WCW+D3arTE6xa92RpOkgOZVrObKrmEENKkiiSp6qnW/6+MH
 e10vTEBqW2HvjtFdzQwCHZqMf3KOEf33oXYihIt6jMU0kl9ocuczmOJAWjbSzPXbBbaqX7J9V1T
 cOWWXg3oEe4Tqulb8vT5z3nzvrUyzSDSfG7Qg3LqrYmKsTPmYje2gRICZBNJISJYx93RPlQF/Ns
 cJ8wopzZ47AQNJSsyttOG7HWGF6fv280P8lXg9eG29pr52LoIwW45nKPldceiiQMytCdDSk/nhV
 DxtKrVVYCjFFDN98gfVNnaXAfEh3CQF2+6VNHdrzh8W7aAAg=
X-Received: by 2002:a05:600c:3e10:b0:480:5951:fc1e with SMTP id
 5b1f17b1804b1-483a95bd836mr306241225e9.11.1772084894191; 
 Wed, 25 Feb 2026 21:48:14 -0800 (PST)
X-Received: by 2002:a05:600c:3e10:b0:480:5951:fc1e with SMTP id
 5b1f17b1804b1-483a95bd836mr306240935e9.11.1772084893700; 
 Wed, 25 Feb 2026 21:48:13 -0800 (PST)
Received: from [192.168.1.86] (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c95dsm43151442f8f.33.2026.02.25.21.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 21:48:13 -0800 (PST)
Message-ID: <8c53f3c6-c6de-46fe-a8ca-d98dd52b3abe@redhat.com>
Date: Thu, 26 Feb 2026 07:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org
Cc: zack.rusin@broadcom.com
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
Subject: [regression] vmwgfx: kmemleak reports
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mWDKqtZ6OQLnENyfyK-lN5XkGVmCcamLZ7df3CnvPq4_1772084895
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.60 / 15.00];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mpenttil@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3B921A1192
X-Rspamd-Action: no action

Hi,

After 6.16, there has been lots of kmemleak splash like for instance:

cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff888107f05800 (size 1024):
comm "(udev-worker)", pid 1495, jiffies 4294719200
hex dump (first 32 bytes):
d8 48 88 c1 ff ff ff ff 00 80 3e 00 00 00 00 00 .H........>.....
00 80 3e 00 00 00 00 00 00 14 00 00 00 00 00 00 ..>.............
backtrace (crc adb46b12):
__kmalloc_node_noprof+0x45c/0x600
vmw_surface_dirty_alloc+0xfb/0x270 [vmwgfx]
vmw_gb_surface_define_internal.constprop.0+0xd0e/0x16c0 [vmwgfx]
vmw_dumb_create+0x2e5/0xae0 [vmwgfx]
drm_client_framebuffer_create+0x168/0x3a0
drm_fbdev_ttm_driver_fbdev_probe+0x1ef/0x660 [drm_ttm_helper]
drm_fb_helper_single_fb_probe+0x1de/0x570
__drm_fb_helper_initial_config_and_unlock+0xb8/0x240
drm_fbdev_client_hotplug+0x164/0x1e0
drm_client_register+0x16a/0x240
drm_fbdev_client_setup+0x114/0x370
drm_client_setup+0x10c/0x160
vmw_probe+0x117/0x370 [vmwgfx]
local_pci_probe+0xee/0x1a0
pci_call_probe+0x17d/0x4c0
pci_device_probe+0x177/0x2c0

It happens just booting up a graphical environment in a VM under vmware player or ESXi.

I have bisected it to:

965544150d1cadf0e8f5bb6c13c19697e46e1429 is the first bad commit
commit 965544150d1cadf0e8f5bb6c13c19697e46e1429
Author: Zack Rusin <zack.rusin@broadcom.com>
Date:   Fri Mar 7 07:57:38 2025 -0500

    drm/vmwgfx: Refactor cursor handling


And this seems to be present with 7.0-rc1 also. 


--Mika

