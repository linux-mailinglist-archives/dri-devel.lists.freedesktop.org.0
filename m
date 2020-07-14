Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB932205A9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080956E43C;
	Wed, 15 Jul 2020 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 590 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jul 2020 09:23:01 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by gabe.freedesktop.org (Postfix) with ESMTP id A52BE6E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:23:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,350,1589212800"; d="scan'208";a="96309227"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Jul 2020 17:13:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id D7E984CE4BD9;
 Tue, 14 Jul 2020 17:13:05 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 14 Jul 2020 17:13:05 +0800
Received: from localhost.localdomain (10.167.226.132) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 14 Jul 2020 17:13:06 +0800
From: Gu Jinxiang <gujx@cn.fujitsu.com>
To: <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [drm/ttm] Memory corruption problem when ttm_tt_init() fails.
Date: Tue, 14 Jul 2020 17:13:05 +0800
Message-ID: <20200714091305.11255-1-gujx@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <201501212056.ACF39099.FLVMFOHOSQtFOJ@I-love.SAKURA.ne.jp>
References: <201501212056.ACF39099.FLVMFOHOSQtFOJ@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D7E984CE4BD9.A81ED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: gujx@cn.fujitsu.com
X-Spam-Status: No
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


hi

I've encountered [BUG: unable to handle kernel NULL pointer dereference at] which has call stack like your pattern2.
And before this happended, I got a lot of memory allocation failure warnings.
And my kernel is 3.10.0-327.62.1.el7.x86_64.

Since, you mentioned it may be a bug of drm/tmm. So, I checked drm/ttm for possible patch to fix this problem, but found nothing.
Could you please tell me is there any progress of this problem that you detected.

Best wished!

Jinxiang, Gu


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
