Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4756084F6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B3B10E2CF;
	Sat, 22 Oct 2022 06:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Sat, 22 Oct 2022 06:10:04 UTC
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44010E2CF
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 06:10:04 +0000 (UTC)
X-QQ-mid: bizesmtp70t1666418995tiwrdkyn
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:09:54 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: RFp2QSjOiS6QmiDDKxdiLq0s+hEAd0pCWAwZ4O1D3n3zy6HZs3k051foEqJqU
 ZKJUDf06RY7iKw+Hja4nWiQhuYQ76perll8ekk1ufhP0lpSBtQ5y/j4zgkW7tXCP4X/KnUs
 /xgumMAtKoGkj/qc7LcpT3nXjeHphIf2Z3RVROm3764Rv30tZDKCoOksu2Tkylr7JYKTEEe
 98+uuU4V3lX6TVrn08p374R+LulzL2QFmwED0CfhEMLtm+Z+dtQXge4Rr4uowWZ8v35tE2C
 Lj/RS/Yzfs3tgmqx/H1NP/ZaoEsz5EMZjyhkZ5r66AXMQMzv1TV3m8FSyiEYazEiZGQ+tz2
 8FEFa8WcBQQ/Sa4Mz2TAEeAXaHY28wDaotC1O0WmxjwdE/oJqg=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] i915/display: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:09:47 +0800
Message-Id: <20221022060947.61179-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 6a3893c8ff22..fead011c87b5 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -1102,7 +1102,7 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
 	drm_connector_helper_add(connector, &intel_crt_connector_helper_funcs);
 
 	/*
-	 * TODO: find a proper way to discover whether we need to set the the
+	 * TODO: find a proper way to discover whether we need to set the
 	 * polarity and link reversal bits or not, instead of relying on the
 	 * BIOS.
 	 */
-- 
2.36.1

