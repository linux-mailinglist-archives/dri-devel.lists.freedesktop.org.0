Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBMiFjf7gmm6gAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:54:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D360E2D9C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7766C10E409;
	Wed,  4 Feb 2026 07:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6F010E409
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 07:54:25 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-05 (Coremail) with SMTP id zQCowAAHmQwg+4JppWN1Bw--.26555S2;
 Wed, 04 Feb 2026 15:54:08 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andy.yan@rock-chips.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, rgallaispou@gmail.com, luca.ceresoli@bootlin.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
Date: Wed,  4 Feb 2026 15:53:19 +0800
Message-Id: <20260204075319.1994814-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHmQwg+4JppWN1Bw--.26555S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKF1UJFy7Gw1xAF4xAFWUJwb_yoW8Jr1UpF
 4Iqa15tr9YqF43tayUAr18CFnxAa4DtFWrC3y7Xws2vwn3WF1qyw4qya43tr1DGF15Cr15
 Zrs8ur4fCF1jkF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRqYLgUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andy.yan@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-kernel@vger.kernel.org,m:nichen@iscas.ac.cn,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[iscas.ac.cn];
	FREEMAIL_TO(0.00)[rock-chips.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9D360E2D9C
X-Rspamd-Action: no action

Return the value of devm_drm_bridge_add() in order to propagate the
error properly, if it fails due to resource allocation failure or bridge
registration failure.

This ensures that the bind function fails safely rather than proceeding
with a potentially incomplete bridge setup.

Fixes: b726970486d8 ("drm/bridge: synopsys: dw-dp: add bridge before attaching")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 432342452484..b0007805f283 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2049,7 +2049,9 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 	bridge->ycbcr_420_allowed = true;
 
-	devm_drm_bridge_add(dev, bridge);
+	ret = devm_drm_bridge_add(dev, bridge);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret, "Failed to add bridge\n");
 
 	dp->aux.dev = dev;
 	dp->aux.drm_dev = encoder->dev;
-- 
2.25.1

