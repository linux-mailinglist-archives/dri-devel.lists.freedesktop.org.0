Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB42586AB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 06:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5C6E578;
	Tue,  1 Sep 2020 04:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663276E578
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:09:03 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200901040901epoutp013ba87f35df0bcf45a6c3a26ef0cb65bf~wjWcn0vSK0623306233epoutp01s
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:09:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200901040901epoutp013ba87f35df0bcf45a6c3a26ef0cb65bf~wjWcn0vSK0623306233epoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598933341;
 bh=iHQfb3qtW7lSUWGtt4riwSXRHVNT71MHvCk8OlOASjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YH9rI7+XgBCGsNYEAxst1eCmRUbgoy0S1tbfctWHsTusk3k9NwXW9E7snrvwyPKPG
 09IAffJ8muBGJQdHhXUKqprfKSr1hPZZQad1vpMKPes8CsTwGyJj7sXfWuHPTbvEHp
 8N98Mh5FTrDE+TpI+AdrkEjURhl8IbreQ4Upf7RI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200901040901epcas1p3822797b9a8406a8e31fe85404521ee9c~wjWcIj8Ep1718217182epcas1p34;
 Tue,  1 Sep 2020 04:09:01 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.155]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BgYTw1wxYzMqYkk; Tue,  1 Sep
 2020 04:08:52 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.E0.28578.459CD4F5; Tue,  1 Sep 2020 13:08:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200901040851epcas1p18d6757ed06d19c7fd68cbcd439672183~wjWTLhEXz1138411384epcas1p1M;
 Tue,  1 Sep 2020 04:08:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901040851epsmtrp1a6db328e3576dfcfbd5c9cb5e6fe4631~wjWTKtkJJ3200232002epsmtrp1A;
 Tue,  1 Sep 2020 04:08:51 +0000 (GMT)
X-AuditID: b6c32a39-8dfff70000006fa2-02-5f4dc9546808
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DE.03.08382.359CD4F5; Tue,  1 Sep 2020 13:08:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901040851epsmtip10befad98f02fa7a40afb06d9bf727306~wjWS0aXrp0442504425epsmtip16;
 Tue,  1 Sep 2020 04:08:51 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: nsaenzjulienne@suse.de, eric@anholt.net, maxime@cerno.tech,
 stefan.wahren@i2se.com, dave.stevenson@raspberrypi.com
Subject: [PATCH v2 4/4] ARM: dts: bcm2711: Add bvb clock for hdmi-pixel
Date: Tue,  1 Sep 2020 13:07:59 +0900
Message-Id: <20200901040759.29992-5-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1CTZRzv2d69e9m57r2B8LjrEHflCXdDJmw9eG5kmr2FJll5V/2xXuBt
 cMC227t1CmXTGiEMdBmiICAngaFMfsU5TnOSaIJQyPhxSKHAKNFJghPPiBrbvPrv8/1+P5/v
 z+chuKJLuJjI1BoZg5bOluACrP3HaKn03es71HFVbj5qLO7CkKfyFIaqr/TxkMs7iyPn/gGA
 ZusLceRwNWKoZXKIhx5af+OhgY4TOLLdauKjY0+WAOrvfg21l9fjyD56D0eWi1f4aGmo2Sc4
 PYKjidJx8EoodWD2Kk7Njlj4VPl4L06N9f2MU47yX/nU96NyqqXhIE6NF13jUK21n1OWrqcY
 VdLWAKjWnjxqviUyRfhB1qYMhk5nDFGMNk2XnqnVKCXJ76i3qOWKOJlUlohelkRp6RxGKdm6
 PUW6LTPbN6Yk6hM62+RzpdAsK1mv2mTQmYxMVIaONSoljD49W5+oj2XpHNak1cSm6XI2yuLi
 Nsh9xI+yMqZOzvD1Zv6eCWs/MAM3rxCEEJBMgM2jZ7FCICBE5HkA/3AvgIAxB+DVwT48YDwG
 sOHMHPZM0vG3hx8IXATQ/tMFTsCYB3BgzAKWWTgphV7rMGcZh5F74A+/D/vzcslSLnSfqPMH
 QsnX4eDDIXwZY+RLsGDpPncZC0klXDw3Fiy3Gp5pcvr9IaQKDtd6/N1CcoSAx83TnABpK/zy
 YA03gEPhzLU2fgCL4d1D+UHMQtfxmaDYDOAhW0UwEA8vfXvEl4jwtRcNz3WsD7jXQMdflf5p
 uOTz8IHXylumQFIIC/JFAcpaOG12Bjf5Auwurg+2Q8GpxdLgVm0Anh3yYodBZPl/FU4C0ADC
 GT2bo2FYmV7+/6O1AP9Ljkk8D8o8f8Z2Ag4BOgEkuJIwobMjWS0SptN7cxmDTm0wZTNsJ5D7
 tmfjilem6XxfQWtUy+Qb4uPjUYJMIZfJJBHCO6NRahGpoY1MFsPoGcMzHYcIEZs5lyPcCtqV
 qpicnbwX8oa3qq7RUvi1UvXNztT+nsTBiLLND/Yp9yv0JWGGrBeHPCb66XO311b0VLML62xP
 JqrC247d6Pk0+b2NS3N5Sfib4prHfSmtisq7Ow4U2W+uej8rqbiwSJx5Ux/z4aq3az3gUcGI
 UdXbhxy36hQVt7vVqYlyUjOvaW2J9vASdtu6brS5DN5d9pIewz/C0N4vtM66UO82x6vf1aou
 TzTlCt5asTosqa7eK9tctjBVPJo/9lkVc1+w+077dtO+lY1cW/iRpKN5A2m7rGUXiMM1v2zJ
 Lf9qYcplr95LFEcOX2+r4j1as5gusLZOrzj68YBDMLkzovm0BGMzaFkM18DS/wIQCmWOUgQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnG7wSd94g1u3NCzW9h5lsXg7dzGL
 xfwj51gtrnx9z2ZxoPEyo8X75V1sFjuvrGWx2PT4GqvFx557rBaXd81hs5h4ewO7xYwf/xgt
 Lp5ytdg2azmbxbpbr9ksWvceYbf4d20jUMOKG2wWj6beZ3QQ9mh6f4zN4/2NVnaPWffPsnnc
 OXeezWPnrLvsHltvmXpsWtXJ5nG/+ziTx+Yl9R6tR3+xePRtWcXosfl0tcfnTXIBvFFcNimp
 OZllqUX6dglcGU8WvGIvaGCveNRzkbGB8SlrFyMnh4SAicSuv2/Zuxi5OIQEdjNK7D58nhki
 ISOxqn8LUBEHkC0scfhwMUTNR0aJN0vfMoLUsAnoSnztuc4EYosI1Ek86WhkAbGZBZYyS7RM
 UgCxhQXcJa5+vMYGYrMIqEp0/HsDNp9XwFbiz/o7LBC75CVWbzgAFucUsJO4vuQtWFwIqOb4
 mw1sExj5FjAyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI4aLc0djNtXfdA7xMjE
 wXiIUYKDWUmE98Au73gh3pTEyqrUovz4otKc1OJDjNIcLErivDcKF8YJCaQnlqRmp6YWpBbB
 ZJk4OKUamKZ5nma82fcwe/bcnNmrlnxtTrwQcfvXRIfofsZT4otle/ULru+1FmjVWbTNOWKy
 /vb4w7Ifu5fN82uaLnVE+PTra9K1E89XX+m98pnT7dSqN5ddZduYDX2Wn+5l2WNy/vUi5hvl
 LT8WSqvO/JfscoDvc+2Kx9d4Lmbc2Ji88PWjH6lTObj1Q5sv7XlWlNP04yzbJOsmRtXeQwdm
 Pv/8QNkv65rJHyut2mqdTOND1yXUO36zawSkXrwUP9nvgaR4elSK/eGrs8v2fZrMuUb5oNGc
 t9Pu1U7e7Gwedpkt2tKy+UmS54o9NV3rq4+pvnWpK+a8Lvxlzmyl6wltsjP1D8nc+Pvsd7X1
 +2zrd3FX418osRRnJBpqMRcVJwIAZSIZbQkDAAA=
X-CMS-MailID: 20200901040851epcas1p18d6757ed06d19c7fd68cbcd439672183
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200901040851epcas1p18d6757ed06d19c7fd68cbcd439672183
References: <20200901040759.29992-1-hoegeun.kwon@samsung.com>
 <CGME20200901040851epcas1p18d6757ed06d19c7fd68cbcd439672183@epcas1p1.samsung.com>
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
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phil@raspberrypi.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 hoegeun.kwon@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is necessary to control the hdmi pixel bvb clock. Add bvb clock.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index b93eb30e1ddb..90dee4cb38bc 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -172,12 +172,14 @@
 };
 
 &hdmi0 {
-	clocks = <&firmware_clocks 13>, <&dvp 0>;
+	clocks = <&firmware_clocks 13>, <&dvp 0>, <&firmware_clocks 14>;
+	clock-names = "hdmi", "clk-108M", "bvb";
 	status = "okay";
 };
 
 &hdmi1 {
-	clocks = <&firmware_clocks 13>, <&dvp 1>;
+	clocks = <&firmware_clocks 13>, <&dvp 1>, <&firmware_clocks 14>;
+	clock-names = "hdmi", "clk-108M", "bvb";
 	status = "okay";
 };
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
