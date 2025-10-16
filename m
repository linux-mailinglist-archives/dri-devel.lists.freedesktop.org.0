Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12CBE1665
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 06:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF1710E1DB;
	Thu, 16 Oct 2025 03:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="T4jCgUGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532E10E080;
 Thu, 16 Oct 2025 03:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vrYy6nu4I9KDvT5FqjGOiyRNpY2GNSHvkw08M/PmfjE=; b=T4jCgUGxkqDBal8GYtmso1JbXm
 l5pAppKDwBznXpNR1iBi8DgZK3Qh72/cYClMkPtoUnSFDsAX95hLUAhUlo+Mxwc9vvbyQupvi1EdQ
 u+5UMwb8dSVjHKbkXGhIm1W2tGQaCst9KdH/3Y3fSdK3vYcQP1pcE5j1gywIOpkdZTJzjKQywkewj
 2wL4aaej5F8HCcyQR41YRh/1Um+AWBNdDXJYwgD3mnlqOOQJQ1fWimLfBe/YWmm6FTiDQzN6Jtc9a
 ioe8YHvRRdmVZt/i8kL4WfG3reyWlO6DBfVMO6DIo8APh+qzKaN1qYYSe/3YtoLe+bg2utXFW2vRo
 iox52bWw==;
Received: from [50.53.43.113] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v9F9Y-00000006TG4-0wer; Thu, 16 Oct 2025 03:59:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Date: Wed, 15 Oct 2025 20:59:41 -0700
Message-ID: <20251016035942.1148176-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use correct kernel-doc notation to prevent 3 kernel-doc warnings.
@push_payload is a struct member here, not a function, so use '@'
and ':' in its description.

Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:          * push_payload - Sends a payload to the authentication firmware
Warning: intel_lb_mei_interface.h:67 Invalid param: * @dev: Device struct corresponding to the mei device * @type: Payload type (see &enum intel_lb_type) * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT) * @payload: Pointer to payload buffer * @payload_size: Payload buffer size in bytes * * Return: 0 success, negative errno value on transport failure, *         positive status returned by firmware */ int (*push_payload)(struct device *dev, u32 type, u32 flags, const void *payload, size_t payload_size)
Warning: intel_lb_mei_interface.h:67 struct member '* @dev: Device struct corresponding to the mei device * @type: Payload type (see &enum intel_lb_type' not described in 'intel_lb_component_ops'

Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/intel/intel_lb_mei_interface.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251013.orig/include/drm/intel/intel_lb_mei_interface.h
+++ linux-next-20251013/include/drm/intel/intel_lb_mei_interface.h
@@ -53,7 +53,7 @@ enum intel_lb_status {
  */
 struct intel_lb_component_ops {
 	/**
-	 * push_payload - Sends a payload to the authentication firmware
+	 * @push_payload: Sends a payload to the authentication firmware
 	 * @dev: Device struct corresponding to the mei device
 	 * @type: Payload type (see &enum intel_lb_type)
 	 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
