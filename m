Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA63599A63
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 13:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AD410E883;
	Fri, 19 Aug 2022 11:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4945210E883
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:04:37 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VMg-lTI_1660907055; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VMg-lTI_1660907055) by smtp.aliyun-inc.com;
 Fri, 19 Aug 2022 19:04:34 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: thomas@winischhofer.net
Subject: [PATCH] video: fbdev: sis_main: Clean up some inconsistent indenting
Date: Fri, 19 Aug 2022 19:04:14 +0800
Message-Id: <20220819110414.107565-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-fbdev@vger.kernel.org, deller@gmx.de,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/video/fbdev/sis/sis_main.c:6165 sisfb_probe() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:4266 sisfb_post_300_rwtest() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:2388 SISDoSense() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:2531 SiS_Sense30x() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:2382 SISDoSense() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:2250 sisfb_sense_crt1() warn: inconsistent indenting.
drivers/video/fbdev/sis/sis_main.c:672 sisfb_validate_mode() warn: inconsistent indenting.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1934
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/video/fbdev/sis/sis_main.c | 274 +++++++++++++++--------------
 1 file changed, 141 insertions(+), 133 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 7114c5c17c91..ac4680a74d78 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -650,37 +650,37 @@ sisfb_validate_mode(struct sis_video_info *ivideo, int myindex, u32 vbflags)
 	u16 xres=0, yres, myres;
 
 #ifdef CONFIG_FB_SIS_300
-	if(ivideo->sisvga_engine == SIS_300_VGA) {
-		if(!(sisbios_mode[myindex].chipset & MD_SIS300))
+	if (ivideo->sisvga_engine == SIS_300_VGA) {
+		if (!(sisbios_mode[myindex].chipset & MD_SIS300))
 			return -1 ;
 	}
 #endif
 #ifdef CONFIG_FB_SIS_315
-	if(ivideo->sisvga_engine == SIS_315_VGA) {
-		if(!(sisbios_mode[myindex].chipset & MD_SIS315))
+	if (ivideo->sisvga_engine == SIS_315_VGA) {
+		if (!(sisbios_mode[myindex].chipset & MD_SIS315))
 			return -1;
 	}
 #endif
 
 	myres = sisbios_mode[myindex].yres;
 
-	switch(vbflags & VB_DISPTYPE_DISP2) {
+	switch (vbflags & VB_DISPTYPE_DISP2) {
 
 	case CRT2_LCD:
 		xres = ivideo->lcdxres; yres = ivideo->lcdyres;
 
-		if((ivideo->SiS_Pr.SiS_CustomT != CUT_PANEL848) &&
-		   (ivideo->SiS_Pr.SiS_CustomT != CUT_PANEL856)) {
-			if(sisbios_mode[myindex].xres > xres)
+		if ((ivideo->SiS_Pr.SiS_CustomT != CUT_PANEL848) &&
+		    (ivideo->SiS_Pr.SiS_CustomT != CUT_PANEL856)) {
+			if (sisbios_mode[myindex].xres > xres)
 				return -1;
-			if(myres > yres)
+			if (myres > yres)
 				return -1;
 		}
 
-		if(ivideo->sisfb_fstn) {
-			if(sisbios_mode[myindex].xres == 320) {
-				if(myres == 240) {
-					switch(sisbios_mode[myindex].mode_no[1]) {
+		if (ivideo->sisfb_fstn) {
+			if (sisbios_mode[myindex].xres == 320) {
+				if (myres == 240) {
+					switch (sisbios_mode[myindex].mode_no[1]) {
 						case 0x50: myindex = MODE_FSTN_8;  break;
 						case 0x56: myindex = MODE_FSTN_16; break;
 						case 0x53: return -1;
@@ -689,7 +689,7 @@ sisfb_validate_mode(struct sis_video_info *ivideo, int myindex, u32 vbflags)
 			}
 		}
 
-		if(SiS_GetModeID_LCD(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
+		if (SiS_GetModeID_LCD(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
 			 	sisbios_mode[myindex].yres, 0, ivideo->sisfb_fstn,
 			 	ivideo->SiS_Pr.SiS_CustomT, xres, yres, ivideo->vbflags2) < 0x14) {
 			return -1;
@@ -697,14 +697,14 @@ sisfb_validate_mode(struct sis_video_info *ivideo, int myindex, u32 vbflags)
 		break;
 
 	case CRT2_TV:
-		if(SiS_GetModeID_TV(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
+		if (SiS_GetModeID_TV(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
 				sisbios_mode[myindex].yres, 0, ivideo->vbflags2) < 0x14) {
 			return -1;
 		}
 		break;
 
 	case CRT2_VGA:
-		if(SiS_GetModeID_VGA2(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
+		if (SiS_GetModeID_VGA2(ivideo->sisvga_engine, vbflags, sisbios_mode[myindex].xres,
 				sisbios_mode[myindex].yres, 0, ivideo->vbflags2) < 0x14) {
 			return -1;
 		}
@@ -2205,82 +2205,88 @@ static bool sisfb_test_DDC1(struct sis_video_info *ivideo)
 
 static void sisfb_sense_crt1(struct sis_video_info *ivideo)
 {
-    bool mustwait = false;
-    u8  sr1F, cr17;
+	bool mustwait = false;
+	u8  sr1F, cr17;
 #ifdef CONFIG_FB_SIS_315
-    u8  cr63=0;
+	u8  cr63 = 0;
 #endif
-    u16 temp = 0xffff;
-    int i;
+	u16 temp = 0xffff;
+	int i;
+
+	sr1F = SiS_GetReg(SISSR, 0x1F);
+	SiS_SetRegOR(SISSR, 0x1F, 0x04);
+	SiS_SetRegAND(SISSR, 0x1F, 0x3F);
 
-    sr1F = SiS_GetReg(SISSR, 0x1F);
-    SiS_SetRegOR(SISSR, 0x1F, 0x04);
-    SiS_SetRegAND(SISSR, 0x1F, 0x3F);
-    if(sr1F & 0xc0) mustwait = true;
+	if (sr1F & 0xc0)
+		mustwait = true;
 
 #ifdef CONFIG_FB_SIS_315
-    if(ivideo->sisvga_engine == SIS_315_VGA) {
-       cr63 = SiS_GetReg(SISCR, ivideo->SiS_Pr.SiS_MyCR63);
-       cr63 &= 0x40;
-       SiS_SetRegAND(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF);
-    }
+	if (ivideo->sisvga_engine == SIS_315_VGA) {
+		cr63 = SiS_GetReg(SISCR, ivideo->SiS_Pr.SiS_MyCR63);
+		cr63 &= 0x40;
+		SiS_SetRegAND(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF);
+	}
 #endif
 
-    cr17 = SiS_GetReg(SISCR, 0x17);
-    cr17 &= 0x80;
-    if(!cr17) {
-       SiS_SetRegOR(SISCR, 0x17, 0x80);
-       mustwait = true;
-       SiS_SetReg(SISSR, 0x00, 0x01);
-       SiS_SetReg(SISSR, 0x00, 0x03);
-    }
+	cr17 = SiS_GetReg(SISCR, 0x17);
+	cr17 &= 0x80;
 
-    if(mustwait) {
-       for(i=0; i < 10; i++) sisfbwaitretracecrt1(ivideo);
-    }
+	if (!cr17) {
+		SiS_SetRegOR(SISCR, 0x17, 0x80);
+		mustwait = true;
+		SiS_SetReg(SISSR, 0x00, 0x01);
+		SiS_SetReg(SISSR, 0x00, 0x03);
+	}
 
+	if (mustwait) {
+		for (i = 0; i < 10; i++)
+			sisfbwaitretracecrt1(ivideo);
+	}
 #ifdef CONFIG_FB_SIS_315
-    if(ivideo->chip >= SIS_330) {
-       SiS_SetRegAND(SISCR, 0x32, ~0x20);
-       if(ivideo->chip >= SIS_340) {
-	   SiS_SetReg(SISCR, 0x57, 0x4a);
-       } else {
-	   SiS_SetReg(SISCR, 0x57, 0x5f);
-       }
-	SiS_SetRegOR(SISCR, 0x53, 0x02);
-	while ((SiS_GetRegByte(SISINPSTAT)) & 0x01)    break;
-	while (!((SiS_GetRegByte(SISINPSTAT)) & 0x01)) break;
-	if ((SiS_GetRegByte(SISMISCW)) & 0x10) temp = 1;
-	SiS_SetRegAND(SISCR, 0x53, 0xfd);
-	SiS_SetRegAND(SISCR, 0x57, 0x00);
-    }
+	if (ivideo->chip >= SIS_330) {
+		SiS_SetRegAND(SISCR, 0x32, ~0x20);
+		if (ivideo->chip >= SIS_340)
+			SiS_SetReg(SISCR, 0x57, 0x4a);
+		else
+			SiS_SetReg(SISCR, 0x57, 0x5f);
+
+		SiS_SetRegOR(SISCR, 0x53, 0x02);
+		while ((SiS_GetRegByte(SISINPSTAT)) & 0x01)
+			break;
+		while (!((SiS_GetRegByte(SISINPSTAT)) & 0x01))
+			break;
+		if ((SiS_GetRegByte(SISMISCW)) & 0x10)
+			temp = 1;
+
+		SiS_SetRegAND(SISCR, 0x53, 0xfd);
+		SiS_SetRegAND(SISCR, 0x57, 0x00);
+	}
 #endif
 
-    if(temp == 0xffff) {
-       i = 3;
-       do {
-	  temp = SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
-		ivideo->sisvga_engine, 0, 0, NULL, ivideo->vbflags2);
-       } while(((temp == 0) || (temp == 0xffff)) && i--);
+	if (temp == 0xffff) {
+		i = 3;
 
-       if((temp == 0) || (temp == 0xffff)) {
-          if(sisfb_test_DDC1(ivideo)) temp = 1;
-       }
-    }
+		do {
+			temp = SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
+			ivideo->sisvga_engine, 0, 0, NULL, ivideo->vbflags2);
+		} while (((temp == 0) || (temp == 0xffff)) && i--);
 
-    if((temp) && (temp != 0xffff)) {
-       SiS_SetRegOR(SISCR, 0x32, 0x20);
-    }
+		if ((temp == 0) || (temp == 0xffff)) {
+			if (sisfb_test_DDC1(ivideo))
+				temp = 1;
+		}
+	}
+
+	if ((temp) && (temp != 0xffff))
+		SiS_SetRegOR(SISCR, 0x32, 0x20);
 
 #ifdef CONFIG_FB_SIS_315
-    if(ivideo->sisvga_engine == SIS_315_VGA) {
-	SiS_SetRegANDOR(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF, cr63);
-    }
+	if (ivideo->sisvga_engine == SIS_315_VGA)
+		SiS_SetRegANDOR(SISCR, ivideo->SiS_Pr.SiS_MyCR63, 0xBF, cr63);
 #endif
 
-    SiS_SetRegANDOR(SISCR, 0x17, 0x7F, cr17);
-
-    SiS_SetReg(SISSR, 0x1F, sr1F);
+	SiS_SetRegANDOR(SISCR, 0x17, 0x7F, cr17);
+	SiS_SetReg(SISSR, 0x1F, sr1F);
 }
 
 /* Determine and detect attached devices on SiS30x */
@@ -2294,25 +2300,25 @@ static void SiS_SenseLCD(struct sis_video_info *ivideo)
 	ivideo->SiS_Pr.PanelSelfDetected = false;
 
 	/* LCD detection only for TMDS bridges */
-	if(!(ivideo->vbflags2 & VB2_SISTMDSBRIDGE))
+	if (!(ivideo->vbflags2 & VB2_SISTMDSBRIDGE))
 		return;
-	if(ivideo->vbflags2 & VB2_30xBDH)
+	if (ivideo->vbflags2 & VB2_30xBDH)
 		return;
 
 	/* If LCD already set up by BIOS, skip it */
 	reg = SiS_GetReg(SISCR, 0x32);
-	if(reg & 0x08)
+	if (reg & 0x08)
 		return;
 
 	realcrtno = 1;
-	if(ivideo->SiS_Pr.DDCPortMixup)
+	if (ivideo->SiS_Pr.DDCPortMixup)
 		realcrtno = 0;
 
 	/* Check DDC capabilities */
 	temp = SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags, ivideo->sisvga_engine,
 				realcrtno, 0, &buffer[0], ivideo->vbflags2);
 
-	if((!temp) || (temp == 0xffff) || (!(temp & 0x02)))
+	if ((!temp) || (temp == 0xffff) || (!(temp & 0x02)))
 		return;
 
 	/* Read DDC data */
@@ -2321,17 +2327,17 @@ static void SiS_SenseLCD(struct sis_video_info *ivideo)
 		temp = SiS_HandleDDC(&ivideo->SiS_Pr, ivideo->vbflags,
 				ivideo->sisvga_engine, realcrtno, 1,
 				&buffer[0], ivideo->vbflags2);
-	} while((temp) && i--);
+	} while ((temp) && i--);
 
-	if(temp)
+	if (temp)
 		return;
 
 	/* No digital device */
-	if(!(buffer[0x14] & 0x80))
+	if (!(buffer[0x14] & 0x80))
 		return;
 
 	/* First detailed timing preferred timing? */
-	if(!(buffer[0x18] & 0x02))
+	if (!(buffer[0x18] & 0x02))
 		return;
 
 	xres = buffer[0x38] | ((buffer[0x3a] & 0xf0) << 4);
@@ -2339,26 +2345,26 @@ static void SiS_SenseLCD(struct sis_video_info *ivideo)
 
 	switch(xres) {
 		case 1024:
-			if(yres == 768)
+			if (yres == 768)
 				paneltype = 0x02;
 			break;
 		case 1280:
-			if(yres == 1024)
+			if (yres == 1024)
 				paneltype = 0x03;
 			break;
 		case 1600:
-			if((yres == 1200) && (ivideo->vbflags2 & VB2_30xC))
+			if ((yres == 1200) && (ivideo->vbflags2 & VB2_30xC))
 				paneltype = 0x0b;
 			break;
 	}
 
-	if(!paneltype)
+	if (!paneltype)
 		return;
 
-	if(buffer[0x23])
+	if (buffer[0x23])
 		cr37 |= 0x10;
 
-	if((buffer[0x47] & 0x18) == 0x18)
+	if ((buffer[0x47] & 0x18) == 0x18)
 		cr37 |= ((((buffer[0x47] & 0x06) ^ 0x06) << 5) | 0x20);
 	else
 		cr37 |= 0xc0;
@@ -2373,31 +2379,34 @@ static void SiS_SenseLCD(struct sis_video_info *ivideo)
 
 static int SISDoSense(struct sis_video_info *ivideo, u16 type, u16 test)
 {
-    int temp, mytest, result, i, j;
-
-    for(j = 0; j < 10; j++) {
-       result = 0;
-       for(i = 0; i < 3; i++) {
-          mytest = test;
-	   SiS_SetReg(SISPART4, 0x11, (type & 0x00ff));
-          temp = (type >> 8) | (mytest & 0x00ff);
-	  SiS_SetRegANDOR(SISPART4, 0x10, 0xe0, temp);
-          SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1500);
-          mytest >>= 8;
-          mytest &= 0x7f;
-	   temp = SiS_GetReg(SISPART4, 0x03);
-          temp ^= 0x0e;
-          temp &= mytest;
-          if(temp == mytest) result++;
+	int temp, mytest, result, i, j;
+
+	for (j = 0; j < 10; j++) {
+		result = 0;
+		for (i = 0; i < 3; i++) {
+			mytest = test;
+			SiS_SetReg(SISPART4, 0x11, (type & 0x00ff));
+			temp = (type >> 8) | (mytest & 0x00ff);
+			SiS_SetRegANDOR(SISPART4, 0x10, 0xe0, temp);
+			SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1500);
+			mytest >>= 8;
+			mytest &= 0x7f;
+			temp = SiS_GetReg(SISPART4, 0x03);
+			temp ^= 0x0e;
+			temp &= mytest;
+			if (temp == mytest)
+				result++;
 #if 1
-	  SiS_SetReg(SISPART4, 0x11, 0x00);
-	  SiS_SetRegAND(SISPART4, 0x10, 0xe0);
-	  SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1000);
+			SiS_SetReg(SISPART4, 0x11, 0x00);
+			SiS_SetRegAND(SISPART4, 0x10, 0xe0);
+			SiS_DDC2Delay(&ivideo->SiS_Pr, 0x1000);
 #endif
-       }
-       if((result == 0) || (result >= 2)) break;
-    }
-    return result;
+		}
+
+		if ((result == 0) || (result >= 2))
+			break;
+	}
+	return result;
 }
 
 static void SiS_Sense30x(struct sis_video_info *ivideo)
@@ -4263,18 +4272,17 @@ static int sisfb_post_300_rwtest(struct sis_video_info *ivideo, int iteration,
 	unsigned int k, RankCapacity, PageCapacity, BankNumHigh, BankNumMid;
 	unsigned int PhysicalAdrOtherPage, PhysicalAdrHigh, PhysicalAdrHalfPage;
 
-	 for(k = 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
-
+	for (k = 0; k < ARRAY_SIZE(SiS_DRAMType); k++) {
 		RankCapacity = buswidth * SiS_DRAMType[k][3];
 
-		if(RankCapacity != PseudoRankCapacity)
+		if (RankCapacity != PseudoRankCapacity)
 			continue;
 
-		if((SiS_DRAMType[k][2] + SiS_DRAMType[k][0]) > PseudoAdrPinCount)
+		if ((SiS_DRAMType[k][2] + SiS_DRAMType[k][0]) > PseudoAdrPinCount)
 			continue;
 
 		BankNumHigh = RankCapacity * 16 * iteration - 1;
-		if(iteration == 3) {             /* Rank No */
+		if (iteration == 3) {             /* Rank No */
 			BankNumMid  = RankCapacity * 16 - 1;
 		} else {
 			BankNumMid  = RankCapacity * 16 * iteration / 2 - 1;
@@ -4288,18 +4296,22 @@ static int sisfb_post_300_rwtest(struct sis_video_info *ivideo, int iteration,
 		SiS_SetRegAND(SISSR, 0x15, 0xFB); /* Test */
 		SiS_SetRegOR(SISSR, 0x15, 0x04);  /* Test */
 		sr14 = (SiS_DRAMType[k][3] * buswidth) - 1;
-		if(buswidth == 4)      sr14 |= 0x80;
-		else if(buswidth == 2) sr14 |= 0x40;
+
+		if (buswidth == 4)
+			sr14 |= 0x80;
+		else if (buswidth == 2)
+			sr14 |= 0x40;
+
 		SiS_SetReg(SISSR, 0x13, SiS_DRAMType[k][4]);
 		SiS_SetReg(SISSR, 0x14, sr14);
 
 		BankNumHigh <<= 16;
 		BankNumMid <<= 16;
 
-		if((BankNumHigh + PhysicalAdrHigh      >= mapsize) ||
-		   (BankNumMid  + PhysicalAdrHigh      >= mapsize) ||
-		   (BankNumHigh + PhysicalAdrHalfPage  >= mapsize) ||
-		   (BankNumHigh + PhysicalAdrOtherPage >= mapsize))
+		if ((BankNumHigh + PhysicalAdrHigh >= mapsize) ||
+		    (BankNumMid  + PhysicalAdrHigh >= mapsize) ||
+		    (BankNumHigh + PhysicalAdrHalfPage  >= mapsize) ||
+		    (BankNumHigh + PhysicalAdrOtherPage >= mapsize))
 			continue;
 
 		/* Write data */
@@ -4313,7 +4325,7 @@ static int sisfb_post_300_rwtest(struct sis_video_info *ivideo, int iteration,
 				(FBAddr + BankNumHigh + PhysicalAdrOtherPage));
 
 		/* Read data */
-		if(readw(FBAddr + BankNumHigh + PhysicalAdrHigh) == PhysicalAdrHigh)
+		if (readw(FBAddr + BankNumHigh + PhysicalAdrHigh) == PhysicalAdrHigh)
 			return 1;
 	}
 
@@ -6155,24 +6167,20 @@ static int sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 #endif
 
 #ifdef CONFIG_FB_SIS_315
-		if(ivideo->sisvga_engine == SIS_315_VGA) {
+		if (ivideo->sisvga_engine == SIS_315_VGA) {
 			int result = 1;
-		/*	if((ivideo->chip == SIS_315H)   ||
-			   (ivideo->chip == SIS_315)    ||
-			   (ivideo->chip == SIS_315PRO) ||
-			   (ivideo->chip == SIS_330)) {
-				sisfb_post_sis315330(pdev);
-			} else */ if(ivideo->chip == XGI_20) {
+
+			if (ivideo->chip == XGI_20) {
 				result = sisfb_post_xgi(pdev);
 				ivideo->sisfb_can_post = 1;
-			} else if((ivideo->chip == XGI_40) && ivideo->haveXGIROM) {
+			} else if ((ivideo->chip == XGI_40) && ivideo->haveXGIROM) {
 				result = sisfb_post_xgi(pdev);
 				ivideo->sisfb_can_post = 1;
 			} else {
 				printk(KERN_INFO "sisfb: Card is not "
 					"POSTed and sisfb can't do this either.\n");
 			}
-			if(!result) {
+			if (!result) {
 				printk(KERN_ERR "sisfb: Failed to POST card\n");
 				ret = -ENODEV;
 				goto error_3;
-- 
2.20.1.7.g153144c

