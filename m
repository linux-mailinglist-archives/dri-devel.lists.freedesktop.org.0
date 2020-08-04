Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1223B2DE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A286E270;
	Tue,  4 Aug 2020 02:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB246E270
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:56:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-VykFNPfIOluF06ouYDdUTw-1; Mon, 03 Aug 2020 22:56:41 -0400
X-MC-Unique: VykFNPfIOluF06ouYDdUTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC061015DA2;
 Tue,  4 Aug 2020 02:56:40 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F57390E76;
 Tue,  4 Aug 2020 02:56:35 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [00/59] ttm misc cleanups, mem refactoring, rename objects. (v2)
Date: Tue,  4 Aug 2020 12:55:33 +1000
Message-Id: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've decided to repost the whole queue this time, it has a few driver
patches up front that are just cleanups.

I've reorodered things a little since the first posting, but not much.

misc core/driver cleanups
mem type manager debug callback cleanup (reordered)
new mem type manager init path
new mem type manager cleanup path
new wrapper to access managers
driver managed mem type allocations
cleanup after all of that
rename ttm_bo_manager to ttm_range_manager (new)
rename ttm_mem_type_manager to ttm_resource_manager (new)
rename ttm_mem_reg to ttm_resource (new)

I've marked most things with v2 that have changed, again I'd really
like to land this in drm-misc sooner rather than later, so it would be
good to get driver acks from qxl, vmwgfx and nouveau. (all cc'ed).

I've also commented on the list on any outstanding comments from previous
review that I disagree with or need more discussion.

Dave.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
