Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87366291942
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 21:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D106E3EE;
	Sun, 18 Oct 2020 19:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0856E3EE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1603048518;
 bh=daqsyzmQCdzKGXw2nUQjSZqmuRUaLw6f49gW9tZwBXI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=TcQ3q090xB4chGr1DMUKshlFnAorLx+4j70sRg2SGws6/lpkuTmQn8eC5PBT3K1YM
 RwLVaU4a3JdiKWjQQi1hAtJbLv8Wo80uTw5bsUjspkidzWpepC2IrJl2DXxd5QDvt0
 qiM9I9XRuUMyzdyPylZMEC6szzPj/jCSpFe3Rhqg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [173.228.6.223] ([173.228.6.223]) by web-mail.gmx.net
 (3c-app-mailcom-bs08.server.lan [172.19.170.176]) (via HTTP); Sun, 18 Oct
 2020 21:15:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Subject: It appears drm-next TTM cleanup broke something . . .
Date: Sun, 18 Oct 2020 21:15:17 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:vCdj+0Nfd6TxqPoGHzixpEQcRmrwPe0R2S6aZOphqQ/LMbKesPO8eHERcHvDcsuaSonWn
 ZJxYVK9spiPZW1w2DcnPKg8UJEVLIpt+6qDHsH4Aj6v1019e7eaaORKzc2L1yxZXDgCltN4b9s4T
 jsq65WNwsWRGt6e9YhZ4e9i8ldD33E6so+kOC51kfhrhFcTrlLJUNjIiXdIwUJ+kibLneJPnVIme
 Trxj44O/B/sdibiKYYQQWWPy0ZRpHAeiLPoOo3Jfiwwwmrdx/po2vMlcfTW6Ise8Snob4cGNmYup
 MM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bhdOpXXQ/pg=:L7Eph/i93lP5LEfqqauIEO
 Yd5ctZz/zBr7Ki5/ZxQr5eQirkHgb1UBurARLMh1t+L8KgUD0Z0nfVUaTBE9lSehgj+5yRT9R
 7KJEW8wlqSBYnRfwSY4GEvVi8ntM/kjbkqG5MuRWI5gZHWMls8iXJ4OvmwwabbanitxAXJLbv
 CqA/c19g2RMqlnNwkDwxG8MHze3A+lhydDYBJ8XfmDYtUpYqxsPO6ekoY5IuymMcPB5QtuiXK
 y6/87fPXQzZUIQ20Ynfn01wo50i1kK0eqnvLxpx2JLBvjbLtH1z69nKzPX8RUyquKwEJoEKnz
 YyCYQ95nwFsA1NyvjT4CTTT7R+cx8U0KHAuheLt+OPNyDrug/Yx9TQSJ3zWYskGwoQO7Lzig4
 mWz078Iq86ljMDVtNQ3+rNttI/x+hsO8MbOtHH6TNRtqRumQysr5COYEWT31todArA1ZgSE6Y
 OS+3h8fyQ4xok2BVIl9X8AanI/SYWqOv3hfBjckSOgUwvtQrd4d33/aDTTudpjy2cDKfOyo+p
 RDeBxxcmMyerUT8P9PQyA5eJ+EtxKk1XmJyXIEt5yVbFM+6VOkF1WYv/S/ymkd1hpRd2x9Sl0
 7IQEGNN/u/uU8=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

It is a little urgent, so I am writing this right now.
As usual, I pulled in DRM repository code for an out of tree OpenChrome DRM repository a few days ago.
While going through the changes I need to make to OpenChrome DRM to compile with the latest Linux kernel, I noticed that ttm_bo_init_mm() was discontinued, and it was replaced with ttm_range_man_init().
ttm_range_man_init() has a parameter called "bool use_tt", but honestly, I do not think it is functioning correctly.
If I keep "ttm_tt_create" member of ttm_bo_driver struct null by not specifying it, TTM still tries to call it, and crashes due to a null pointer access.
The workaround I found so far is to specify the "ttm_tt_create" member by copying bo_driver_ttm_tt_create() from drm/drm_gem_vram_helper.c.
This is what the call trace looks like without specifying the "ttm_tt_create" member (i.e., this member is null).

_______________________________________________
. . .
kernel: [   34.310674] [drm:openchrome_bo_create [openchrome]] Entered openchrome_bo_create.
kernel: [   34.310697] [drm:openchrome_ttm_domain_to_placement [openchrome]] Entered openchrome_ttm_domain_to_placement.
kernel: [   34.310706] [drm:openchrome_ttm_domain_to_placement [openchrome]] Exiting openchrome_ttm_domain_to_placement.
kernel: [   34.310737] BUG: kernel NULL pointer dereference, address: 0000000000000000
kernel: [   34.310742] #PF: supervisor instruction fetch in kernel mode
kernel: [   34.310745] #PF: error_code(0x0010) - not-present page
. . .
kernel: [   34.310807] Call Trace:
kernel: [   34.310827]  ttm_tt_create+0x5f/0xa0 [ttm]
kernel: [   34.310839]  ttm_bo_validate+0xb8/0x140 [ttm]
kernel: [   34.310886]  ? drm_vma_offset_add+0x56/0x70 [drm]
kernel: [   34.310897]  ? openchrome_gem_create_ioctl+0x150/0x150 [openchrome]
. . .
_______________________________________________

The erroneous call to  "ttm_tt_create" member happens right after TTM placement is performed (openchrome_ttm_domain_to_placement()).
Currently, OpenChrome DRM's TTM implementation does not use "ttm_tt_create" member, and this arrangement worked fine until Linux 5.9's drm-next code.
It appears that Linux 5.10's drm-next code broke the code.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
