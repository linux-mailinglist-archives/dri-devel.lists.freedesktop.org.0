Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C29F4882
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D67410E0EB;
	Tue, 17 Dec 2024 10:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 10:08:59 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41D410E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:08:59 +0000 (UTC)
Received: internal info suppressed
Received: from akehat-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by akehat-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPS
 id 4BHA0eds079158
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 12:00:40 +0200
Received: (from akehat@localhost)
 by akehat-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 4BHA0d6i079143;
 Tue, 17 Dec 2024 12:00:39 +0200
From: Avri Kehat <avri.kehat@intel.com>
To: andrew@lunn.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, ogabbay@kernel.org,
 oshpigelman@habana.ai, sgoutham@marvell.com, zyehudai@habana.ai
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Date: Tue, 17 Dec 2024 12:00:39 +0200
Message-Id: <20241217100039.79132-1-avri.kehat@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
References: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Revisiting the comments regarding our use of debugfs as an interface for device configurations -
A big part of the non-statistics debugfs parameters are HW related debug-only capabilities, and not configurations required by the user.
Should these sort of parameters be part of devlink as well?
Is there another location where debug related configurations for development can reside in?

Avri

