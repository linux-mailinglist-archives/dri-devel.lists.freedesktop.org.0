Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7BBE52FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011DE10EA69;
	Thu, 16 Oct 2025 19:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="qPVLdQgQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9F10E33D;
 Thu, 16 Oct 2025 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pbuY1HU0wdS06tBZAO3RvcBZ+maZX3BYDu2PnETeCdM=; b=qPVLdQgQ3SZP/kf7E/N3FVtQdh
 zhpZ56qukJVuSLc+HazUKU660DAW03PdCSowLG7S2aJqlHvgd0UCRSrUZWye+nz/4RfFzM+yqYoyp
 LRrqtYtbmZy64Vlsw3UwWUu1VM1gPewiJU1pHVQ3oElxxP+YZe9gMMn4rMbUtv/JwWjq3hUpJs7VK
 5HNiZovEdUAm16Fr+Db39bE/XNYrawMw4UtrU6BaU1uG4AWJDhORlE2j88+39wB0T70wnRMdVWMOq
 DxPt1pgymJiyRyCLOg+lt07ev3ZnUh4U5cr2UoAb1vToWfEC7sb7qA4Jxs+DgVJZZke40/F4SO0Du
 zvqhMf6Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v9TM5-00000005mFe-46yK; Thu, 16 Oct 2025 19:09:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <pvorel@suse.cz>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Date: Thu, 16 Oct 2025 12:09:39 -0700
Message-ID: <20251016190941.1306157-1-rdunlap@infradead.org>
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

Warning: intel_lb_mei_interface.h:55 Incorrect use of kernel-doc format:
 * push_payload - Sends a payload to the authentication firmware
Warning: intel_lb_mei_interface.h:67 Invalid param:
 * @dev: Device struct corresponding to the mei device
 * @type: Payload type (see &enum intel_lb_type)
 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
 * @payload: Pointer to payload buffer
 * @payload_size: Payload buffer size in bytes
 * * Return: 0 success, negative errno value on transport failure,
 *         positive status returned by firmware */
 int (*push_payload)(struct device *dev, u32 type, u32 flags, const void
 *payload, size_t payload_size)
Warning: intel_lb_mei_interface.h:67 struct member '* @dev: Device struct
 corresponding to the mei device * @type: Payload type (see &enum
 intel_lb_type' not described in 'intel_lb_component_ops'

Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
---
v2: reformat long kernel-doc warning lines to <= 75 chars. (Nitin)

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
