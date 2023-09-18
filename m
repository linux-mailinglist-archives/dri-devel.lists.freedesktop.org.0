Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE17A54CE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 23:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E486010E0FF;
	Mon, 18 Sep 2023 21:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Mon, 18 Sep 2023 21:07:23 UTC
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ECB10E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:07:23 +0000 (UTC)
Received: from localhost.localdomain (178.176.74.219) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Mon, 18 Sep
 2023 23:52:15 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Fix sloppy typing in the area copy
Date: Mon, 18 Sep 2023 23:52:07 +0300
Message-ID: <20230918205209.11709-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.74.219]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/18/2023 20:36:01
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179936 [Sep 18 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.219 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.74.219 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.74.219
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/18/2023 20:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/18/2023 6:04:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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

Here are 2 patches against the 'master' branch of Linus' 'linux.git' repo...

In {cfb|sys}_copyarea(), when initializing *unsigned long const* bits_per_line
__u32 typed fb_fix_screeninfo::line_length gets multiplied by 8u which might
overflow __u32; this whole *struct* fb_fix_screeninfo seems to come from
userland (as it's declared in the UAPI header)... Also, that bits_per_line
constant is used to advance *unsigned* src_idx and dst_idx lccal variables
which might be overflowed as well...

These overflow possibilities were there from the very begining of the source
files in question, so I decided to just CC stable@vger.kernel.org, without
the Fixes tags...

Sergey Shtylyov (2):
  video: fbdev: core: cfbcopyarea: fix sloppy typing
  video: fbdev: core: syscopyarea: fix sloppy typing

 drivers/video/fbdev/core/cfbcopyarea.c | 5 +++--
 drivers/video/fbdev/core/syscopyarea.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.26.3

