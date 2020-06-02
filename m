Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA451EB9AD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 12:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B99B89D3E;
	Tue,  2 Jun 2020 10:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2ED89D3E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 10:37:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200602103729euoutp0147d5fc84151e793013292a6fdfa11b86~Us8ofRJdX0347303473euoutp01I
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 10:37:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200602103729euoutp0147d5fc84151e793013292a6fdfa11b86~Us8ofRJdX0347303473euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1591094249;
 bh=4vUewRLzHeFYoroLdqGpNGuPNMeJGx5ZvKq8Qs7i8ug=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=M8+hQaQFsd3TD9YQH56v3iYt1haKgPY7V78GF/ZJ7mflbbWT8Nyg8z2xjSsUWacK6
 XUcomYvoxwhHtdCWc7qgkhPRHttXA+iX41nj/XEW8KVebxrUpPYuZ/JJ4b+0g5WEe6
 fyvLKxwjFEdCDMyXKg2L98n8kUVvm5gyFH5wMTV4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200602103728eucas1p1412c7a16e2c124de609493d6af81ec2c~Us8oHFc1m2606626066eucas1p1l;
 Tue,  2 Jun 2020 10:37:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2D.FF.60698.8EB26DE5; Tue,  2
 Jun 2020 11:37:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200602103728eucas1p14557b8b4c33dbc82b0351f58e2a4140d~Us8nxlVUX1571015710eucas1p1A;
 Tue,  2 Jun 2020 10:37:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200602103728eusmtrp2f9a8f6736e923eff4bf707d32c238b35~Us8nw_IWx1363813638eusmtrp26;
 Tue,  2 Jun 2020 10:37:28 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-0a-5ed62be82fee
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.29.07950.8EB26DE5; Tue,  2
 Jun 2020 11:37:28 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200602103727eusmtip2d2687492ceec67a96c797c4c247892d1~Us8nY_3Oj2214522145eusmtip2P;
 Tue,  2 Jun 2020 10:37:27 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] video: fbdev: amifb: remove dead APUS support
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <839133dd-8ed4-5fec-c311-ce9f8abf3d5f@samsung.com>
Date: Tue, 2 Jun 2020 12:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRze933fe+9lTl9H80nFuqn1E01/3MoMNZ0tldpobX6cvGH5cd2h
 +KPZSkmYXzGXIr+zye0yji10mmM4FaubWfrjGOYoh5ZF9XpZ/nue5/t8ns/z2b4MKa4RuDDx
 SSmsMkmeIKFtqba+XyMnZo59jvBqfHNQOraySEunx98S0v787wLpaGcFLW0wN5PSkXWDwI+W
 6XuzkWzyiYGQDWStUjKr1lWmNVuIy4Lrtj4xbEJ8Gqv09I2yjTPlzgsVBYfvWjq9MpHRNQfZ
 MIBPwZDpJ5GDbBkxbkQwv5Ar5MkygkJjKc0TK4KXOg2xPdJi7dlyNSCYWisieWJBMNFXS3Mu
 Gp+GwkdNKAcxjCMOgNplxMlO2A9KTAVCDpO4CkGr/ixnEWFfaHofzMkUdoeayVKSw7vxNVj6
 1ivgsAg7wEC5meKwDQ4CXd4owcc4w7i5cgu7QbulYrMOYK0QvkzN0Vw+4HNQZkB8f0eYM7QK
 ebwP/nRUErz/NYL17Jmt4XYEDcUbNO86AxPGtc0gEh+Blk5PXvaHoQ+zBJ9vDyaLA9/BHora
 ykheFkH2QzHvPgSaeg29vTan4xVZgCTqHZepd1yj3nGN+v/eKkQ1IWc2VZUYy6q8k9g7Hip5
 oio1KdbjRnKiFv37OoMbhhUd6vodrUeYQRI7kWZyLEIskKep0hP1CBhS4iQKGB6MEIti5OkZ
 rDI5UpmawKr0aC9DSZxF3tWz4WIcK09hb7GsglVuvxKMjUsm0jlE+oQfFxy46d/oUr3LqtEN
 hHU/KLdraAtZLbwnGw4LVSqKv65UmJpv3++/uGipyHsWFVJJPcbpQ8/rQv3nYd5YHWi0xqeX
 qD9e8X13Va0IMkxr3LoUwcH5WVrqx3LPxNKLDLt6h5UL7rj0fKDxky6Y7Oluia67FPR0Yc/+
 UgmlipOfPEoqVfK/qa7VBDYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7ovtK/FGRx8xmNx5et7Notnt/Yy
 WZzo+8BqcXnXHDaL5U/WMluc/3uc1YHN49DhDkaP+93HmTxOtn5j8fi8Sc5j05O3TAGsUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZN3resBdM
 0Kh4u8uggfGcXBcjJ4eEgInE+s8H2LsYuTiEBJYySlz8e4C1i5EDKCEjcXx9GUSNsMSfa11s
 EDWvGSVOL+xgA0mwCVhJTGxfxQhSLyzgJLHkCyNIWETAQWLKjQlgM5kFFjBKnG07yArRPIdR
 YserG2ANvAJ2EquO+II0sAioSCy+P40ZxBYViJA4vGMW2CBeAUGJkzOfsIDYnAKeEjt6LzOB
 2MwC6hJ/5l1ihrDFJW49mQ8Vl5fY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OL
 jfSKE3OLS/PS9ZLzczcxAuNs27GfW3Ywdr0LPsQowMGoxMO74f6VOCHWxLLiytxDjBIczEoi
 vE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wBeSVxBuaGppbWBqaG5sbm1koifN2
 CByMERJITyxJzU5NLUgtgulj4uCUamBUlHngcfbqER79o8Ut935HX//Fe+Z6n8iLzs+p77rq
 ck8u3Onye5Nm214p0ak3Pqt62MWoB28r+BJhuDNJUyfYbqu48i+mmf5OB8I/NT9aeL96tSrv
 o65bjS67pjPF2HT8b/0o0ZZereHup8PJ/Nt5pqho/8L3HXq9dxoOKFefuXqyy3BpIY8SS3FG
 oqEWc1FxIgDIacQmyQIAAA==
X-CMS-MailID: 20200602103728eucas1p14557b8b4c33dbc82b0351f58e2a4140d
X-Msg-Generator: CA
X-RootMTR: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504232908eucas1p296927bc7c736ad924cefaea9a546459d
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/14/20 10:21 PM, Geert Uytterhoeven wrote:

> These #ifdefs are relics from APUS (Amiga Power-Up System), which
> added a PPC board.  APUS support was killed off a long time ago,
> when arch/ppc/ was still king, but these #ifdefs were missed, because
> they didn't test for CONFIG_APUS.

Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/amifb.c |   63 --------------------------------------------
 1 file changed, 63 deletions(-)

Index: b/drivers/video/fbdev/amifb.c
===================================================================
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -576,14 +576,8 @@ static u_short maxfmode, chipset;
 #define modx(x, v)	((v) & ((x) - 1))
 
 /* if x1 is not a constant, this macro won't make real sense :-) */
-#ifdef __mc68000__
 #define DIVUL(x1, x2) ({int res; asm("divul %1,%2,%3": "=d" (res): \
 	"d" (x2), "d" ((long)((x1) / 0x100000000ULL)), "0" ((long)(x1))); res;})
-#else
-/* We know a bit about the numbers, so we can do it this way */
-#define DIVUL(x1, x2) ((((long)((unsigned long long)x1 >> 8) / x2) << 8) + \
-	((((long)((unsigned long long)x1 >> 8) % x2) << 8) / x2))
-#endif
 
 #define highw(x)	((u_long)(x)>>16 & 0xffff)
 #define loww(x)		((u_long)(x) & 0xffff)
@@ -1837,11 +1831,7 @@ static int ami_get_var_cursorinfo(struct
 				  const struct amifb_par *par)
 {
 	register u_short *lspr, *sspr;
-#ifdef __mc68000__
 	register u_long datawords asm ("d2");
-#else
-	register u_long datawords;
-#endif
 	register short delta;
 	register u_char color;
 	short height, width, bits, words;
@@ -1868,24 +1858,14 @@ static int ami_get_var_cursorinfo(struct
 		for (width = (short)var->width - 1; width >= 0; width--) {
 			if (bits == 0) {
 				bits = 16; --words;
-#ifdef __mc68000__
 				asm volatile ("movew %1@(%3:w:2),%0 ; swap %0 ; movew %1@+,%0"
 					: "=d" (datawords), "=a" (lspr) : "1" (lspr), "d" (delta));
-#else
-				datawords = (*(lspr + delta) << 16) | (*lspr++);
-#endif
 			}
 			--bits;
-#ifdef __mc68000__
 			asm volatile (
 				"clrb %0 ; swap %1 ; lslw #1,%1 ; roxlb #1,%0 ; "
 				"swap %1 ; lslw #1,%1 ; roxlb #1,%0"
 				: "=d" (color), "=d" (datawords) : "1" (datawords));
-#else
-			color = (((datawords >> 30) & 2)
-				 | ((datawords >> 15) & 1));
-			datawords <<= 1;
-#endif
 			put_user(color, data++);
 		}
 		if (bits > 0) {
@@ -1893,17 +1873,8 @@ static int ami_get_var_cursorinfo(struct
 		}
 		while (--words >= 0)
 			++lspr;
-#ifdef __mc68000__
 		asm volatile ("lea %0@(%4:w:2),%0 ; tstl %1 ; jeq 1f ; exg %0,%1\n1:"
 			: "=a" (lspr), "=a" (sspr) : "0" (lspr), "1" (sspr), "d" (delta));
-#else
-		lspr += delta;
-		if (sspr) {
-			u_short *tmp = lspr;
-			lspr = sspr;
-			sspr = tmp;
-		}
-#endif
 	}
 	return 0;
 }
@@ -1912,11 +1883,7 @@ static int ami_set_var_cursorinfo(struct
 				  u_char __user *data, struct amifb_par *par)
 {
 	register u_short *lspr, *sspr;
-#ifdef __mc68000__
 	register u_long datawords asm ("d2");
-#else
-	register u_long datawords;
-#endif
 	register short delta;
 	u_short fmode;
 	short height, width, bits, words;
@@ -1958,60 +1925,30 @@ static int ami_set_var_cursorinfo(struct
 			unsigned long tdata = 0;
 			get_user(tdata, data);
 			data++;
-#ifdef __mc68000__
 			asm volatile (
 				"lsrb #1,%2 ; roxlw #1,%0 ; swap %0 ; "
 				"lsrb #1,%2 ; roxlw #1,%0 ; swap %0"
 				: "=d" (datawords)
 				: "0" (datawords), "d" (tdata));
-#else
-			datawords = ((datawords << 1) & 0xfffefffe);
-			datawords |= tdata & 1;
-			datawords |= (tdata & 2) << (16 - 1);
-#endif
 			if (--bits == 0) {
 				bits = 16; --words;
-#ifdef __mc68000__
 				asm volatile ("swap %2 ; movew %2,%0@(%3:w:2) ; swap %2 ; movew %2,%0@+"
 					: "=a" (lspr) : "0" (lspr), "d" (datawords), "d" (delta));
-#else
-				*(lspr + delta) = (u_short) (datawords >> 16);
-				*lspr++ = (u_short) (datawords & 0xffff);
-#endif
 			}
 		}
 		if (bits < 16) {
 			--words;
-#ifdef __mc68000__
 			asm volatile (
 				"swap %2 ; lslw %4,%2 ; movew %2,%0@(%3:w:2) ; "
 				"swap %2 ; lslw %4,%2 ; movew %2,%0@+"
 				: "=a" (lspr) : "0" (lspr), "d" (datawords), "d" (delta), "d" (bits));
-#else
-			*(lspr + delta) = (u_short) (datawords >> (16 + bits));
-			*lspr++ = (u_short) ((datawords & 0x0000ffff) >> bits);
-#endif
 		}
 		while (--words >= 0) {
-#ifdef __mc68000__
 			asm volatile ("moveql #0,%%d0 ; movew %%d0,%0@(%2:w:2) ; movew %%d0,%0@+"
 				: "=a" (lspr) : "0" (lspr), "d" (delta) : "d0");
-#else
-			*(lspr + delta) = 0;
-			*lspr++ = 0;
-#endif
 		}
-#ifdef __mc68000__
 		asm volatile ("lea %0@(%4:w:2),%0 ; tstl %1 ; jeq 1f ; exg %0,%1\n1:"
 			: "=a" (lspr), "=a" (sspr) : "0" (lspr), "1" (sspr), "d" (delta));
-#else
-		lspr += delta;
-		if (sspr) {
-			u_short *tmp = lspr;
-			lspr = sspr;
-			sspr = tmp;
-		}
-#endif
 	}
 	par->crsr.height = var->height;
 	par->crsr.width = var->width;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
