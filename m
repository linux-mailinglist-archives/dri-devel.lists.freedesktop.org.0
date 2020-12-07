Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF42A2D1C64
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEBC6E8C9;
	Mon,  7 Dec 2020 21:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D96E6E8CD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:54:18 +0000 (UTC)
IronPort-SDR: p+kbgcNJeGHulJPhyGZuuHeMuBRzBpAejkPAidC88Nk+ZbUr6Mdx573a7gqrmEsPZ8ovMPVCQR
 P/C9xOCrlRDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173931979"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="173931979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 13:54:16 -0800
IronPort-SDR: LzRUKN/jDyxl3KNc6MKJ+VEP95NPBUq4fu+IoWKElsiJKcbdjCV7cBOlmaN9KhhR88Wg6B02Yj
 Ef/2NH7yXqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="374910198"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga007.jf.intel.com with ESMTP; 07 Dec 2020 13:54:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 21:54:14 +0000
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Mon, 7 Dec 2020 13:54:13 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dma-buf: Fix kerneldoc formatting
Thread-Topic: [PATCH] dma-buf: Fix kerneldoc formatting
Thread-Index: AQHWyniEqZD+bg8kAUGpMtVup4UbnqnsMZuA
Date: Mon, 7 Dec 2020 21:54:13 +0000
Message-ID: <10aa275c9f174a19816a913bc35d9910@intel.com>
References: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201204200242.2671481-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Daniel Vetter
>Sent: Friday, December 4, 2020 3:03 PM
>To: DRI Development <dri-devel@lists.freedesktop.org>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; Vetter, Daniel
><daniel.vetter@intel.com>
>Subject: [PATCH] dma-buf: Fix kerneldoc formatting
>
>I wanted to look up something and noticed the hyperlink doesn't work.
>While fixing that also noticed a trivial kerneldoc comment typo in the
>same section, fix that too.
>
>Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>---
> Documentation/driver-api/dma-buf.rst | 2 +-
> include/linux/dma-buf-map.h          | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-
>api/dma-buf.rst
>index d6b2a195dbed..a2133d69872c 100644
>--- a/Documentation/driver-api/dma-buf.rst
>+++ b/Documentation/driver-api/dma-buf.rst
>@@ -190,7 +190,7 @@ DMA Fence uABI/Sync File
> Indefinite DMA Fences
> ~~~~~~~~~~~~~~~~~~~~~
>
>-At various times &dma_fence with an indefinite time until dma_fence_wait()
>+At various times struct dma_fence with an indefinite time until
>dma_fence_wait()
> finishes have been proposed. Examples include:
>
> * Future fences, used in HWC1 to signal when a buffer isn't used by the
>display
>diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h

Ahh, something to do while compiling...

Both changes look good to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>index 583a3a1f9447..278d489e4bdd 100644
>--- a/include/linux/dma-buf-map.h
>+++ b/include/linux/dma-buf-map.h
>@@ -122,7 +122,7 @@ struct dma_buf_map {
>
> /**
>  * DMA_BUF_MAP_INIT_VADDR - Initializes struct dma_buf_map to an
>address in system memory
>- * @vaddr:	A system-memory address
>+ * @vaddr_:	A system-memory address
>  */
> #define DMA_BUF_MAP_INIT_VADDR(vaddr_) \
> 	{ \
>--
>2.29.2
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
