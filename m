Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290F76A746
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 05:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5A10E301;
	Tue,  1 Aug 2023 03:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012BA10E301;
 Tue,  1 Aug 2023 03:03:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07467062|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0381289-0.00205072-0.95982;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5JFwAS_1690859016; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5JFwAS_1690859016) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 11:03:38 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm/powerplay/hwmgr/ppevvmath: Clean up errors in
 ppevvmath.h
Date: Tue,  1 Aug 2023 03:03:34 +0000
Message-Id: <20230801030334.5069-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: return is not a function, parentheses are not required
ERROR: space required after that ',' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: need consistent spacing around '-' (ctx:WxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
index dac29fe6cfc6..6f54c410c2f9 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
@@ -166,7 +166,7 @@ static fInt fNaturalLog(fInt value)
 
 	error_term = fAdd(fNegativeOne, value);
 
-	return (fAdd(solution, error_term));
+	return fAdd(solution, error_term);
 }
 
 static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_range, uint32_t bitlength)
@@ -230,7 +230,7 @@ static fInt ConvertToFraction(int X) /*Add all range checking here. Is it possib
 static fInt fNegate(fInt X)
 {
 	fInt CONSTANT_NEGONE = ConvertToFraction(-1);
-	return (fMultiply(X, CONSTANT_NEGONE));
+	return fMultiply(X, CONSTANT_NEGONE);
 }
 
 static fInt Convert_ULONG_ToFraction(uint32_t X)
@@ -382,14 +382,14 @@ static int ConvertBackToInteger (fInt A) /*THIS is the function that will be use
 
 	scaledDecimal.full = uGetScaledDecimal(A);
 
-	fullNumber = fAdd(scaledDecimal,scaledReal);
+	fullNumber = fAdd(scaledDecimal, scaledReal);
 
 	return fullNumber.full;
 }
 
 static fInt fGetSquare(fInt A)
 {
-	return fMultiply(A,A);
+	return fMultiply(A, A);
 }
 
 /* x_new = x_old - (x_old^2 - C) / (2 * x_old) */
@@ -447,7 +447,7 @@ static fInt fSqrt(fInt num)
 
 	} while (uAbs(error) > 0);
 
-	return (x_new);
+	return x_new;
 }
 
 static void SolveQuadracticEqn(fInt A, fInt B, fInt C, fInt Roots[])
@@ -459,7 +459,7 @@ static void SolveQuadracticEqn(fInt A, fInt B, fInt C, fInt Roots[])
 	f_CONSTANT100 = ConvertToFraction(100);
 	f_CONSTANT10 = ConvertToFraction(10);
 
-	while(GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT100) || GreaterThan(C, f_CONSTANT100)) {
+	while (GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT100) || GreaterThan(C, f_CONSTANT100)) {
 		A = fDivide(A, f_CONSTANT10);
 		B = fDivide(B, f_CONSTANT10);
 		C = fDivide(C, f_CONSTANT10);
@@ -515,7 +515,7 @@ static int uGetScaledDecimal (fInt A) /*Converts the fractional portion to whole
 		dec[i] = tmp / (1 << SHIFT_AMOUNT);
 		tmp = tmp - ((1 << SHIFT_AMOUNT)*dec[i]);
 		tmp *= 10;
-		scaledDecimal = scaledDecimal + dec[i]*uPow(10, PRECISION - 1 -i);
+		scaledDecimal = scaledDecimal + dec[i]*uPow(10, PRECISION - 1 - i);
 	}
 
 	return scaledDecimal;
-- 
2.17.1

