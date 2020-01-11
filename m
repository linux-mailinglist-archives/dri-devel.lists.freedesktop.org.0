Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F7138669
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E336E51D;
	Sun, 12 Jan 2020 12:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (unknown [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29016E175
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 01:07:39 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id F28A7DFCD9;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id C6196-rcrfaJ; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 329BBDFDFB;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EQCQNUOGurJh; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id BCBC2DFCD9;
 Sat, 11 Jan 2020 01:07:44 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 0/3] drm/armada: make it work on MMP2 and MMP3
Date: Sat, 11 Jan 2020 02:07:31 +0100
Message-Id: <20200111010734.286836-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

chained to this message are patches that are necessary to make the
Armada DRM driver useful on MMP2 and MMP3. They apply on top of
drm-armada-devel.

The first two patches were previously sent separately, around a year ago
or so. The v2 of the third one previosly only implemented only MMP2
support.

Thanks,
Lubo


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
