Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498124CEBB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807836EAB0;
	Fri, 21 Aug 2020 07:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A2F6EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:16:49 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200821071129epoutp03a39effd84204eb5b9610b942f056e677~tNvnPvkiO2272422724epoutp03n
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:11:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200821071129epoutp03a39effd84204eb5b9610b942f056e677~tNvnPvkiO2272422724epoutp03n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597993889;
 bh=4HNiRPvHIxvIrfu+Vr7XKCEWbAFVY5lm4GOrgQszxFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hCPfZoEFRz8uShSvZXy2Qz5F7cmD5Az4R89yN6Hv+bwxjblLbqS/8nMYDDMUZMD3s
 i89WfT9aUIPzHelDyU3iYKF21Wa7/7zXj+Pj+05gLF38jC272QInAefus/7LT3unqQ
 PkXQyTibXIv2D1RzmarqJ6QAaYH9VUjlUT+E10Ow=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200821071128epcas1p11cbbdbdf37b64cc859f26b907fd48962~tNvmtPc081679816798epcas1p1A;
 Fri, 21 Aug 2020 07:11:28 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4BXt3f1y4ZzMqYkt; Fri, 21 Aug
 2020 07:11:26 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.CB.19033.A937F3F5; Fri, 21 Aug 2020 16:11:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200821071121epcas1p20c13a4116d56072293b1d81d8e253218~tNvgYHSLB1822418224epcas1p2v;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200821071121epsmtrp21c8c40df7e678bc311786ad2fd7180df~tNvgXEHQr2521125211epsmtrp24;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
X-AuditID: b6c32a36-159ff70000004a59-db-5f3f739aa989
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5B.C1.08382.9937F3F5; Fri, 21 Aug 2020 16:11:21 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200821071121epsmtip25c56b59247250af5db5f4641cfcf7b17~tNvgABazm2482124821epsmtip2S;
 Fri, 21 Aug 2020 07:11:21 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech
Subject: [PATCH 1/3] clk: bcm: rpi: Add register to control pixel bvb clk
Date: Fri, 21 Aug 2020 16:10:43 +0900
Message-Id: <20200821071045.24501-2-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmge6sYvt4g8bTvBZre4+yWLydu5jF
 Yv6Rc6wWV76+Z7M40HiZ0eL98i42i51X1rJYbHp8jdXiY889VovLu+awWUy8vYHdYsaPf4wW
 F0+5WmybtZzNYt2t12wWrXuPsFv8u7aRxeLR1PuMDkIeTe+PsXm8v9HK7jHr/lk2jzvnzrN5
 7Jx1l91j06pONo/73ceZPDYvqfdoPfqLxaNvyypGj82nqz0+b5IL4InKtslITUxJLVJIzUvO
 T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB+k5JoSwxpxQoFJBYXKykb2dT
 lF9akqqQkV9cYquUWpCSU2BZoFecmFtcmpeul5yfa2VoYGBkClSYkJ3x9k4HW8FCtoqly14y
 NTDOY+1i5OSQEDCRONE2E8jm4hAS2MEo8W/xdiYI5xOjxIm9y9kgnG+MEuuvbGPsYuSAaPlS
 DRHfyyjx4/YFZgjnM6PEjSlzWUDmsgnoSnztuc4EYosI2Em09RxkBCliFtjOLHG9vZsdZJKw
 gKfE8S1WIDUsAqoSX3v3soPYvAK2Em/f7GSBuE9eYvWGA8wgNifQnMV3lrKAzJEQOMMhsWzH
 JiaIIheJLzsOQz0kLPHq+BZ2CFtK4vO7vWwQdrHElZmvoJobGCX6J86GKjKW2L90MhPIQcwC
 mhLrd+lDhBUldv6eywhiMwvwSbz72sMK8T2vREebEESJmsSzhgNQa2UkTvUuhzrHQ+LWslZo
 yE1klHi84jXzBEa5WQgbFjAyrmIUSy0ozk1PLTYsMEKOsk2M4OSrZbaDcdLbD3qHGJk4GA8x
 SnAwK4nw9u61jhfiTUmsrEotyo8vKs1JLT7EaAoMvYnMUqLJ+cD0n1cSb2hqZGxsbGFiaGZq
 aKgkzvvwlkK8kEB6YklqdmpqQWoRTB8TB6dUA1OLtJfjm5fbk39/S3QIrl5scU9oiuLGAL+e
 r4YeDP51F7In/fVJzJ0XKhVpwDz3z8WY989OPJz+xunf1WQ7mySPd5qRFuunteVZMO9Lcfsy
 R6BP+g3jXq/c8G9XO+xWsy1RnSz4lEFv94pZOrP2nGH1fM+jnu3Y4MJcskP5YU2n56nVKlNO
 n/MIT5iY9leiePKFn+u6z3/bcC8hK4X1eWNVV0K9Zr2JpHjogXMKMfpMOybpza8y3dCy7MN/
 htrQ0HzOmV+Oe0ryTPQKdCvaIuYslmXimzl7k7Yqy+6TGUzruXP1mdlczFuX79kfkpmx7tbm
 61vy4li3yAoz6J7fU5e77FqPgEnPRIMLKXEHlViKMxINtZiLihMB4t/T6EcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSvO7MYvt4gxUPDCzW9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20ji8WjqfcZHYQ8mt4fY/N4f6OV3WPW/bNsHnfOnWfz
 2DnrLrvHplWdbB73u48zeWxeUu/RevQXi0ffllWMHptPV3t83iQXwBPFZZOSmpNZllqkb5fA
 lfH2TgdbwUK2iqXLXjI1MM5j7WLk4JAQMJE48aW6i5GTQ0hgN6PElz1GILaEgIzEqv4tUCXC
 EocPF0OUfGSU+LQ1AsRmE9CV+NpznQnEFhFwknjwdx9zFyMXB7PAcWaJ6f0HwHqFBTwljm+x
 AqlhEVCV+Nq7lx3E5hWwlXj7ZicLxCp5idUbDjCD2JwCdhKL7yxlgdhlK3Gq4yPzBEa+BYwM
 qxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgqNDS3MH4/ZVH/QOMTJxMB5ilOBgVhLh
 7d1rHS/Em5JYWZValB9fVJqTWnyIUZqDRUmc90bhwjghgfTEktTs1NSC1CKYLBMHp1QDU+KK
 e7P+nJM+tUSru7dh7j6ByNb48wsuiJ1U2Nb2a8qGK+r617S/7/6r9NS1K2OdvUPKNIMWXY4j
 z7T2LN7p+vec2eKEgItK520r7i/0bGJed7Zvm1GM7KywQ/ZZSRVdlTlzbqY3x7WUr/jz8fim
 oGeHT4r6fDDyXpN9T2rDLUOF2JPFLNl5RRGFc6dXfhP5/fNY8iz1mTutxc5Pzd81u/UXk+yy
 M29XrfW3Fktm2370htiOuVtPZ2+Zu9x6AcOxSr6XVRf9X+2arLNqC+/X7N+Ldryc/376Wp3j
 p5kn6Ou0+yTW+fBMtzhj9W9j+/pPTzax/NxZk+QdM2vXlI9nRfouL/7Icbp13ufXv/kXZh5p
 UGIpzkg01GIuKk4EAApp4Qr9AgAA
X-CMS-MailID: 20200821071121epcas1p20c13a4116d56072293b1d81d8e253218
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200821071121epcas1p20c13a4116d56072293b1d81d8e253218
References: <20200821071045.24501-1-hoegeun.kwon@samsung.com>
 <CGME20200821071121epcas1p20c13a4116d56072293b1d81d8e253218@epcas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, tim.gover@raspberrypi.com, kdasu.kdev@gmail.com,
 sboyd@kernel.org, mturquette@baylibre.com, dave.stevenson@raspberrypi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hoegeun.kwon@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To use QHD or higher, we need to modify the pixel_bvb_clk value. So
add register to control this clock.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 5cc82954e1ce..f89b9cfc4309 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -271,6 +271,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 		case RPI_FIRMWARE_CORE_CLK_ID:
 		case RPI_FIRMWARE_M2MC_CLK_ID:
 		case RPI_FIRMWARE_V3D_CLK_ID:
+		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
 			hw = raspberrypi_clk_register(rpi, clks->parent,
 						      clks->id);
 			if (IS_ERR(hw))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
