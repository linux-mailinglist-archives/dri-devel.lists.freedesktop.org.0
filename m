Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7274CFE5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6B10E21E;
	Mon, 10 Jul 2023 08:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B15B10E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:26:56 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzxtj3VH8zBHXhF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 16:26:53 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688977613; x=1691569614; bh=5Vej+dXMd1ZoKmxJ2xQ73LD2u5v
 65N0RUybJgRNbepE=; b=PU50xK1vmhNd6ANYnwm68oL8AGrTs00gHkm458ai71P
 2XcQxiMyhua1stxu0sv4Zt2ocNrD63DZrDEENwU5XMKgMQPUtVO8fj2mMeEWO3qb
 z5+36ufFc0eGfpGxcI0u2PsccqjzT2MtTR8eCUiSJsEutz3Y6aplmMIf7l34xGTI
 hKtHQtDTC2hb/5jxkmzxv2AQJtry12t7wWT4HVcwPt4r1f6bDh0McDxEA1/aUqN6
 1PKhHx4sj1aJdPmjpggal0Nm16VrOhPG0x30RoWvD+jX2PJe1G7nzTyCGiXeVn9c
 PrkiKxnTzVW3hoM4rAZk52AT0AJu4p6xro8VDKuUblA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Y4LYSu2nmXxR for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 16:26:53 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzxtj14DnzBHXgt;
 Mon, 10 Jul 2023 16:26:53 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 16:26:53 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
In-Reply-To: <20230710082515.54604-1-xujianghui@cdjrlc.com>
References: <20230710082515.54604-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <0cd737878affc60b7b34d58ea9e10e50@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix four occurrences of the checkpatch.pl error:
ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_atombios.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c 
b/drivers/gpu/drm/radeon/radeon_atombios.c
index bf3c411a55c5..85c4bb186203 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -1389,7 +1389,7 @@ bool radeon_atombios_get_ppll_ss_info(struct 
radeon_device *rdev,

          num_indices = (size - sizeof(ATOM_COMMON_TABLE_HEADER)) /
              sizeof(ATOM_SPREAD_SPECTRUM_ASSIGNMENT);
-        ss_assign = (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT*)
+        ss_assign = (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT *)
              ((u8 *)&ss_info->asSS_Info[0]);
          for (i = 0; i < num_indices; i++) {
              if (ss_assign->ucSS_Id == id) {
@@ -1402,7 +1402,7 @@ bool radeon_atombios_get_ppll_ss_info(struct 
radeon_device *rdev,
                  ss->refdiv = ss_assign->ucRecommendedRef_Div;
                  return true;
              }
-            ss_assign = (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT*)
+            ss_assign = (struct _ATOM_SPREAD_SPECTRUM_ASSIGNMENT *)
                  ((u8 *)ss_assign + sizeof(struct 
_ATOM_SPREAD_SPECTRUM_ASSIGNMENT));
          }
      }
@@ -3406,7 +3406,7 @@ static ATOM_VOLTAGE_OBJECT_V2 
*atom_lookup_voltage_object_v2(ATOM_VOLTAGE_OBJECT
  {
      u32 size = le16_to_cpu(v2->sHeader.usStructureSize);
      u32 offset = offsetof(ATOM_VOLTAGE_OBJECT_INFO_V2, 
asVoltageObj[0]);
-    u8 *start = (u8*)v2;
+    u8 *start = (u8 *)v2;

      while (offset < size) {
          ATOM_VOLTAGE_OBJECT_V2 *vo = (ATOM_VOLTAGE_OBJECT_V2 *)(start + 
offset);
@@ -3423,7 +3423,7 @@ static ATOM_VOLTAGE_OBJECT_V3 
*atom_lookup_voltage_object_v3(ATOM_VOLTAGE_OBJECT
  {
      u32 size = le16_to_cpu(v3->sHeader.usStructureSize);
      u32 offset = offsetof(ATOM_VOLTAGE_OBJECT_INFO_V3_1, 
asVoltageObj[0]);
-    u8 *start = (u8*)v3;
+    u8 *start = (u8 *)v3;

      while (offset < size) {
          ATOM_VOLTAGE_OBJECT_V3 *vo = (ATOM_VOLTAGE_OBJECT_V3 *)(start + 
offset);
