Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17C55A2A9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A8510F27D;
	Fri, 24 Jun 2022 20:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFC010F277
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102758;
 bh=Oe9uZ0F+U4XXW3uqveY1B/62faEGiSSeNt5Yqa1aqw4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iNAI7Q0KI7+sTVGwRqCFAhyRlNLdJVok/cqqXjxzaW+qsnu+uy9W+Q+H2148yM4BC
 KaO62hxHJnugYrmH8Vwnb441HTU5bnrhGDq1C1egpO6TMgRyyTYwtoXQJHAbdf1x5E
 2OPw6wYFcQqFQb1fhccEyhqtXaGTyLZff7V5BW4Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mv2xO-1nnRbi0tn6-00r1re; Fri, 24 Jun 2022 22:27:35 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/28] drm/via: Add via_regs.h
Date: Fri, 24 Jun 2022 15:26:10 -0500
Message-Id: <20220624202633.3978-6-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IY+GMIaj+4NZOGCdSGg0qVZmCoGFaJyhvAFxXhmK/sc6jDJti/z
 riPpGEKE7W0KR/wl7RzFZr+7QncHD40P9X6DrrTSfGFRZR7rwZJlOMJLExCH/Zqu5Pq+wVx
 Po4JHQBlVO9o+2UFpBjHyta2IRQCstss50IzUp/aPPrQpbNrh2qE3PC752sCZzr5665J1Np
 PYJRz7hPKW9qUovkONlNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:al3EyojzNTs=:2WkYbY/8gNTc+7BAvF4r8c
 BNXBK9R8GL7yefgz77alZvAnD7Na3mjpOo2Mm24A5ObVSD39mj/9bOyLRTt/mXaGkw5fP33l5
 DSmTfG/odUVN6VPmiJBYxpEfLSgQ009EjuoSdNMjWuJJv+vxTc2JlHJuC4XrQgFqVeei/StkV
 dIwUe5XQyvvx+3Mn9rgrkO+6+p0TkIuZf9mSdcSaCaqASbUY5AJ+V90VzvQGrJQoeuLJTGKm+
 e16Qs1fi5Ku5HxGJXM3pY1//YSxeGKPblyJrMvaCWDoFfB0k4G1uNoWJikPcHI30ERQbGzsJY
 3AG1/mStd0gAiYTF80x3zTLgccfKmy1fAQDAL1E4fOXJiHEOgoZjzbyxw0c11t6b//xyfHAzj
 0euyINJJ2ox+2Ql2FaJuKkeWKBSo6rpiouLBdPHbVwKwLenLmlyiQang6H2t5w5Fd7Xhlu2o7
 /bvYF+zrZ2b0PN/kvr2FazaEg+UFkZXZU5TVfJjnACFdK+le5PJfTEhHN6k6IQvgLPbJfhADL
 lNZ+FJOW/R3MNwgqsgsUm593Uu0v3HURemnO6Nm+2cKSzLQhxXdZqnNWisrZfBVuOjtVhJU70
 Rwo7lj9mBpVJtTbl7Tl9n6iCb33LZ+xDawp07pwY/ppe1duwEkyvtzhviwl4JDYKASfJz05qq
 X6eVACo7VFpq7ERh+pjzYGqTWjdeVZVtgJyyjdU51/g26aooi2EwIiLm6S4QuXikBaGT7RVS2
 3s8lu6TOlP8mIopP9Z4VQ19/N+6wGggQBadkjRgi1oxM4PFkaz95aUO9Kj0qZ5WHap8JpZTdA
 AjiLT2Th/2KNMXJY9Dsr1YzSLamKEfaJWmaYkRzpCDLIPIcIBcA0upD4FZi9p/zfrJyWDFkAD
 5XRoZVI9oPYAXfNK9n+x/Ox0ryMo3zmsPynk7CtAxw5t0runUYU+mmIOBWyjFmvFxwEoNDLpt
 LFBZY5EzjOCVPpNhFg8PCwjMUc85HfMnsZqZ2y3LzPRn1FtyS393FSUEKcj/wL0sBiQHeYB8v
 akH9DNUoWKtN5nJtsTYgANZM6hza2K7Q9L8ojNIqExPyD6wXtzpBY7myM8SyPQl9DmcNJwT93
 HxmmkImADgSqma2ykHa9n6idbAX5LMJhW02bhHvzcZCQUSJBXuvy9QgfA==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Likely originated from VIA Technologies.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_regs.h | 296 +++++++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_regs.h

diff --git a/drivers/gpu/drm/via/via_regs.h b/drivers/gpu/drm/via/via_regs=
.h
new file mode 100644
index 000000000000..5ac06d75f0b5
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_regs.h
@@ -0,0 +1,296 @@
+/*
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+/************************************************************************=
*
+ *
+ *  File:       via_regs.h
+ *  Content:    The defines of VIA Technologies Chrome registers.
+ *
+ ************************************************************************=
/
+
+#ifndef _VIA_REGS_H_
+#define _VIA_REGS_H_ 1
+
+#define BIOS_BSIZE              1024
+#define BIOS_BASE               0xc0000
+
+#define VIA_MMIO_REGSIZE        0xD000		/* DisplayPort:0xC610~0xC7D4 */
+#define VIA_MMIO_REGBASE        0x0
+#define VIA_MMIO_VGABASE        0x8000
+#define VIA_MMIO_BLTBASE        0x200000
+#define VIA_MMIO_BLTSIZE        0x200000
+
+/* defines for VIA 2D registers */
+#define VIA_REG_GECMD		0x000
+#define VIA_REG_GEMODE		0x004
+#define VIA_REG_GESTATUS	0x004	/* as same as VIA_REG_GEMODE */
+#define VIA_REG_SRCPOS		0x008
+#define VIA_REG_DSTPOS		0x00C
+#define VIA_REG_LINE_K1K2	0x008
+#define VIA_REG_LINE_XY		0x00C
+#define VIA_REG_DIMENSION	0x010	/* width and height */
+#define VIA_REG_PATADDR		0x014
+#define VIA_REG_FGCOLOR		0x018
+#define VIA_REG_DSTCOLORKEY	0x018	/* as same as VIA_REG_FG */
+#define VIA_REG_BGCOLOR		0x01C
+#define VIA_REG_SRCCOLORKEY	0x01C	/* as same as VIA_REG_BG */
+#define VIA_REG_CLIPTL		0x020	/* top and left of clipping */
+#define VIA_REG_CLIPBR		0x024	/* bottom and right of clipping */
+#define VIA_REG_OFFSET		0x028
+#define VIA_REG_LINE_ERROR	0x028
+#define VIA_REG_KEYCONTROL	0x02C	/* color key control */
+#define VIA_REG_SRCBASE		0x030
+#define VIA_REG_DSTBASE		0x034
+#define VIA_REG_PITCH		0x038	/* pitch of src and dst */
+#define VIA_REG_MONOPAT0	0x03C
+#define VIA_REG_MONOPAT1	0x040
+#define VIA_REG_COLORPAT	0x100	/* from 0x100 to 0x1ff */
+
+/* defineds vor VIA 2D registers for VT3353 (M1 engine) */
+#define VIA_REG_GECMD_M1	0x000
+#define VIA_REG_GEMODE_M1	0x004
+#define VIA_REG_GESTATUS_M1	0x004	/* as same as VIA_REG_GEMODE */
+#define VIA_REG_PITCH_M1	0x008	/* pitch of src and dst */
+#define VIA_REG_DIMENSION_M1	0x00C	/* width and height */
+#define VIA_REG_DSTPOS_M1	0x010
+#define VIA_REG_LINE_XY_M1	0x010
+#define VIA_REG_DSTBASE_M1	0x014
+#define VIA_REG_SRCPOS_M1	0x018
+#define VIA_REG_LINE_K1K2_M1	0x018
+#define VIA_REG_SRCBASE_M1	0x01C
+#define VIA_REG_PATADDR_M1	0x020
+#define VIA_REG_MONOPAT0_M1	0x024
+#define VIA_REG_MONOPAT1_M1	0x028
+#define VIA_REG_OFFSET_M1	0x02C
+#define VIA_REG_LINE_ERROR_M1	0x02C
+#define VIA_REG_CLIPTL_M1	0x040	/* top and left of clipping */
+#define VIA_REG_CLIPBR_M1	0x044	/* bottom and right of clipping */
+#define VIA_REG_KEYCONTROL_M1	0x048	/* color key control */
+#define VIA_REG_FGCOLOR_M1	0x04C
+#define VIA_REG_DSTCOLORKEY_M1	0x04C	/* as same as VIA_REG_FG */
+#define VIA_REG_BGCOLOR_M1	0x050
+#define VIA_REG_SRCCOLORKEY_M1	0x050	/* as same as VIA_REG_BG */
+#define VIA_REG_MONOPATFGC_M1	0x058	/* Add foreground color of Pattern */
+#define VIA_REG_MONOPATBGC_M1	0x05C	/* Add background color of Pattern */
+#define VIA_REG_COLORPAT_M1	0x100	/* from 0x100 to 0x1ff */
+
+/* defines for VIA video registers */
+#define VIA_REG_INTERRUPT	0x200
+#define VIA_REG_CRTCSTART	0x214
+
+/*CN400 and older Hardware Icon engine register*/
+#define HI_POSSTART		0x208
+#define HI_CENTEROFFSET		0x20C
+#define HI_FBOFFSET		0x224
+#define HI_CONTROL		0x260
+#define HI_TRANSPARENT_COLOR	0x270
+#define HI_INVTCOLOR		0x274
+/* VT3324 primary Hardware Icon engine register */
+#define PRIM_HI_POSEND		0x290
+#define V327_HI_INVTCOLOR	0x2E4
+#define PRIM_HI_FIFO		0x2E8
+#define PRIM_HI_TRANSCOLOR	0x2EC
+#define PRIM_HI_CTRL		0x2F0
+#define PRIM_HI_FBOFFSET	0x2F4
+#define PRIM_HI_POSSTART	0x2F8
+#define PRIM_HI_CENTEROFFSET	0x2FC
+#define PRIM_HI_INVTCOLOR	0x120C
+
+#define ALPHA_V3_PREFIFO_CONTROL	0x268
+#define ALPHA_V3_FIFO_CONTROL		0x278
+
+/* defines for VIA 3D registers */
+#define VIA_REG_STATUS		0x400
+#define VIA_REG_TRANSET		0x43C
+#define VIA_REG_TRANSPACE	0x440
+
+/* VIA_REG_STATUS(0x400): Engine Status */
+#define VIA_CMD_RGTR_BUSY	0x00000080	/* Command Regulator is busy */
+#define VIA_2D_ENG_BUSY		0x00000002	/* 2D Engine is busy */
+#define VIA_3D_ENG_BUSY		0x00000001	/* 3D Engine is busy */
+#define VIA_VR_QUEUE_EMPTY	0x00020000	/* Virtual Queue is busy */
+
+/* VIA_REG_STATUS(0x400): Egine Status */
+#define VIA_CMD_RGTR_BUSY_H5	0x00000010	/* Command Regulator is busy */
+#define VIA_2D_ENG_BUSY_H5	0x00000002	/* 2D Engine is busy */
+#define VIA_3D_ENG_BUSY_H5	0x00001FE1	/* 3D Engine is busy */
+#define VIA_VR_QUEUE_BUSY_H5	0x00000004	/* Virtual Queue is busy */
+
+/* VIA_REG_GECMD(0x00): 2D Engine Command  */
+#define VIA_GEC_NOOP		0x00000000
+#define VIA_GEC_BLT		0x00000001
+#define VIA_GEC_LINE		0x00000005
+
+#define VIA_GEC_SRC_XY		0x00000000
+#define VIA_GEC_SRC_LINEAR	0x00000010
+#define VIA_GEC_DST_XY		0x00000000
+#define VIA_GEC_DST_LINRAT	0x00000020
+
+#define VIA_GEC_SRC_FB		0x00000000
+#define VIA_GEC_SRC_SYS		0x00000040
+#define VIA_GEC_DST_FB		0x00000000
+#define VIA_GEC_DST_SYS		0x00000080
+
+#define VIA_GEC_SRC_MONO	0x00000100	/* source is mono */
+#define VIA_GEC_PAT_MONO	0x00000200	/* pattern is mono */
+
+#define VIA_GEC_MSRC_OPAQUE	0x00000000	/* mono src is opaque */
+#define VIA_GEC_MSRC_TRANS	0x00000400	/* mono src is transparent */
+
+#define VIA_GEC_PAT_FB		0x00000000	/* pattern is in frame buffer */
+#define VIA_GEC_PAT_REG		0x00000800	/* pattern is from reg setting */
+
+#define VIA_GEC_CLIP_DISABLE	0x00000000
+#define VIA_GEC_CLIP_ENABLE	0x00001000
+
+#define VIA_GEC_FIXCOLOR_PAT	0x00002000
+
+#define VIA_GEC_INCX		0x00000000
+#define VIA_GEC_DECY		0x00004000
+#define VIA_GEC_INCY		0x00000000
+#define VIA_GEC_DECX		0x00008000
+
+#define VIA_GEC_MPAT_OPAQUE	0x00000000	/* mono pattern is opaque */
+#define VIA_GEC_MPAT_TRANS	0x00010000	/* mono pattern is transparent */
+
+#define VIA_GEC_MONO_UNPACK	0x00000000
+#define VIA_GEC_MONO_PACK	0x00020000
+#define VIA_GEC_MONO_DWORD	0x00000000
+#define VIA_GEC_MONO_WORD	0x00040000
+#define VIA_GEC_MONO_BYTE	0x00080000
+
+#define VIA_GEC_LASTPIXEL_ON	0x00000000
+#define VIA_GEC_LASTPIXEL_OFF	0x00100000
+#define VIA_GEC_X_MAJOR		0x00000000
+#define VIA_GEC_Y_MAJOR		0x00200000
+#define VIA_GEC_QUICK_START	0x00800000
+
+
+/* VIA_REG_GEMODE(0x04): GE mode */
+#define VIA_GEM_8bpp		0x00000000
+#define VIA_GEM_16bpp		0x00000100
+#define VIA_GEM_32bpp		0x00000300
+
+#define VIA_GEM_640		0x00000000	/* 640*480 */
+#define VIA_GEM_800		0x00000400	/* 800*600 */
+#define VIA_GEM_1024		0x00000800	/* 1024*768 */
+#define VIA_GEM_1280		0x00000C00	/* 1280*1024 */
+#define VIA_GEM_1600		0x00001000	/* 1600*1200 */
+#define VIA_GEM_2048		0x00001400	/* 2048*1536 */
+
+/* VIA_REG_PITCH(0x38): Pitch Setting */
+#define VIA_PITCH_ENABLE	0x80000000
+
+/* CN400 HQV offset */
+#define REG_HQV1_INDEX		0x00001000
+
+/************************************************
+ *     DisplayPort Register
+ ************************************************/
+#define DP_DATA_PASS_ENABLE_REG 0xC000
+
+#define DP_ATTR_DATA_REG	0xC610
+#define DP_LINK_TRAINING_REG	0xC614
+#define DP_VIDEO_CTRL_REG	0xC618
+#define DP_VER_EXT_PKT_HEAD_REG	0xC61C
+
+/* DP Display Port Enable and InfoFrame Control */
+#define DP_ENABLE_IF_REG	0xC640
+#define DP_HWIDTH_TUSIZE_REG	0xC644
+#define DP_HLINE_DUR_REG	0xC648
+#define DP_MVID_MISC0_REG	0xC64C
+
+#define DP_H_ATTR_REG		0xC650
+#define DP_HV_START_REG		0xC654
+#define DP_POLARITY_WIDTH_REG	0xC658
+#define DP_ACITVE_WH_REG	0xC65C
+
+#define AUX_W_DATA0_REG		0xC710
+#define AUX_W_DATA1_REG		0xC714
+#define AUX_W_DATA2_REG		0xC718
+#define AUX_W_DATA3_REG		0xC71C
+
+#define AUX_R_DATA0_REG		0xC720
+#define AUX_R_DATA1_REG		0xC724
+#define AUX_R_DATA2_REG		0xC728
+#define AUX_R_DATA3_REG		0xC72C
+#define VIA_IRQ_DP_HOT_IRQ	0xC0000000
+#define VIA_IRQ_DP_HOT_UNPLUG	0x80000000
+#define VIA_IRQ_DP_HOT_PLUG	0x40000000
+#define VIA_IRQ_DP_NO_INT	0x00000000
+
+#define AUX_TIMER_REG		0xC730
+#define AUX_CMD_REG		0xC734
+#define DP_NAUD_MUTE_REG	0xC738
+
+#define DP_EPHY_PLL_REG		0xC740
+#define DP_EPHY_TX_PWR_REG	0xC744
+#define DP_EPHY_MISC_PWR_REG	0xC748
+
+/*************************************************
+ *     DisplayPort2 Register
+ *************************************************/
+#define DP2_NVID_MISC0_REG		0xC690
+#define DP2_LINK_TRAINING_REG		0xC694
+#define DP2_VIDEO_CTRL_REG		0xC698
+#define DP2_EXT_REG			0xC69C
+#define DP2_VER_EXT_PKT_HEAD_REG	0xC61C
+
+/* DP2 Display Port Enable and InfoFrame Control */
+#define DP2_ENABLE_IF_REG	0xC6C0
+#define DP2_HWIDTH_TUSIZE_REG	0xC6C4
+#define DP2_HLINE_DUR_REG	0xC6C8
+#define DP2_MVID_MISC0_REG	0xC6CC
+
+#define DP2_H_ATTR_REG		0xC6D0
+#define DP2_HV_START_REG	0xC6D4
+#define DP2_POLARITY_WIDTH_REG	0xC6D8
+#define DP2_ACITVE_WH_REG	0xC6DC
+
+/* the same with DP1 */
+#define DP2_EPHY_SSC_REG	0xC740
+/* the same with DP1 */
+#define DP2_EPHY_RT_REG		0xC744
+
+#define DP2_AUX_W_DATA0_REG	0xC790
+#define DP2_AUX_W_DATA1_REG	0xC794
+#define DP2_AUX_W_DATA2_REG	0xC798
+#define DP2_AUX_W_DATA3_REG	0xC79C
+
+#define DP2_AUX_R_DATA0_REG	0xC7A0
+#define DP2_AUX_R_DATA1_REG	0xC7A4
+#define DP2_AUX_R_DATA2_REG	0xC7A8
+#define DP2_AUX_R_DATA3_REG	0xC7AC
+
+#define DP2_AUX_TIMER_REG	0xC7B0
+#define DP2_AUX_CMD_REG		0xC7B4
+#define DP2_NAUD_MUTE_REG	0xC7B8
+
+#define DP2_EPHY_TX_PWR_REG2	0xC7C0
+#define DP2_EPHY_TX_IDLE_REG	0xC7C4
+#define DP2_EPHY_TX_PWR_REG	0xC7C8
+#define DP2_EPHY_PLL_REG	0xC7CC
+
+#endif /* _VIA_REGS_H_ */
=2D-
2.35.1

