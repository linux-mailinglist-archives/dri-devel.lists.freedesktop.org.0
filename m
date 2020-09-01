Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F80258932
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3C6E5C0;
	Tue,  1 Sep 2020 07:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8990C6E598
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:32:51 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200901043249epoutp02d8565e717b35d3d882b4fad0b0279faf~wjrN6w-ej1125911259epoutp02d
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 04:32:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200901043249epoutp02d8565e717b35d3d882b4fad0b0279faf~wjrN6w-ej1125911259epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598934769;
 bh=WWEnX/WU8nabFgB1ALb/K0Y8k8pzzwAuMe9CZeMsv4Y=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=O6oqnZOlGhlywQ8vbSkDsV5LVyubs1IpP0GesWNXxMRPuIZB42DMhx1VJfVNCUBxY
 qeQxetxKc+cJj3BLGPDoHaE4qLXiBm0ev+C0xloj9FypIJXGdq9eicJbDuFsDELVyT
 UeRxom8dtov8VaGcVRy+GQMSjt8Nz74pSwpv11es=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200901043248epcas1p172dee8c8d4b5010df850acd841a745c4~wjrNn-T2w3152731527epcas1p1K;
 Tue,  1 Sep 2020 04:32:48 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BgZ1T1x15zMqYkw; Tue,  1 Sep
 2020 04:32:45 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 D0.D6.28578.7EECD4F5; Tue,  1 Sep 2020 13:32:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200901043239epcas1p45492888686a41403019bf6487705af31~wjrEfQsgh2108421084epcas1p4P;
 Tue,  1 Sep 2020 04:32:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200901043239epsmtrp20f77135dd77d51a3e5ef8e3f95359e31~wjrEebijR3147731477epsmtrp2c;
 Tue,  1 Sep 2020 04:32:39 +0000 (GMT)
X-AuditID: b6c32a39-8c9ff70000006fa2-5b-5f4dcee79ffe
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.D5.08382.6EECD4F5; Tue,  1 Sep 2020 13:32:38 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200901043238epsmtip24209c50ae0545e0895c388cf852a620f~wjrEKDz952786627866epsmtip2P;
 Tue,  1 Sep 2020 04:32:38 +0000 (GMT)
Subject: Re: [PATCH v4 75/78] dt-bindings: display: vc4: hdmi: Add BCM2711
 HDMI controllers bindings
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <94c5b8e4-a168-690d-2d60-93462585bef9@samsung.com>
Date: Tue, 1 Sep 2020 13:45:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <a174517d1f57b7a75eabd0361aef5365894d7c1a.1594230107.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmge7zc77xBhveKVqs7T3KYvF27mIW
 iytf37NZHGi8zGix6fE1VovLu+awWUy8vYHdYsaPf4wW22YtZ7NYd+s1m8X/PTvYLR5Nvc/o
 wOPR9P4Ym8es+2fZPO6cO8/msWlVJ5vH/e7jTB6bl9R7tB79xeKx+XS1x+dNcgGcUdk2GamJ
 KalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUAXKymUJeaUAoUC
 EouLlfTtbIryS0tSFTLyi0tslVILUnIKLAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM45dOslS
 0KRS8WtpL1sD42vJLkZODgkBE4lfc54ydzFycQgJ7GCUmHL4JBuE84lRYsOD+1CZb4wSZ8+1
 sMC0tC/byQiR2Mso8f7pRKiW94wSy+89YQapEhZIkzj16ycriC0iUC7R3rkfbBSzwHUmiebZ
 XxlBEmwCWhL7X9xgA7H5BRQlrv54DBbnFbCTWHX3LVicRUBF4tDdM2BxUYEwiZPbWqBqBCVO
 znwCdBIHB6dAvMSGpdUgYWYBcYlbT+YzQdjyEtvfzgHbKyFwh0Ni0c3HzBAvuEhsmruMEcIW
 lnh1fAs7hC0l8fndXjYIu1pi5ckjbBDNHYwSW/ZfYIVIGEvsXzqZCWQxs4CmxPpd+hBhRYmd
 v+cyQizmk3j3tYcVpERCgFeio00IokRZ4vKDu0wQtqTE4vZOtgmMSrOQfDMLyQuzkLwwC2HZ
 AkaWVYxiqQXFuempxYYFpsjRvYkRnJy1LHcwTn/7Qe8QIxMH4yFGCQ5mJRHeA7u844V4UxIr
 q1KL8uOLSnNSiw8xmgLDdyKzlGhyPjA/5JXEG5oaGRsbW5gYmpkaGiqJ8z68pRAvJJCeWJKa
 nZpakFoE08fEwSnVwGQbe23Wr/KGJSF7eezncDEvCqy4wR2eYn9t93SWv0vKHDx2Vn3LtfwS
 frzhm1TTEzm9C1v1p5dOWc8gX7XFZn5ZwteZP9tf6ezJiCxSP62455jZ7B9Bvhc880+EXH+/
 v3iVVYJSEePni0XX174/4PtayZBn/a7rVkbcbJOKApR+6eWULTrneJnjW7B90+d/s6Z/DCs8
 f8XzcYyw3uflH1KKKlpWHFrI9a5A9JKh3Ry/lQ8apq6NaHXc5K/ebOPEvLqup4q9oD3h43em
 ff3Rfc53v93x/LUpInnGm/MnrPtm6PZOlq7p0TBvf5ZwVPuyzj/hRlbNZ8sVD4jov+41XJO/
 60GgMcsM61vef1udLJVYijMSDbWYi4oTAawaIHhXBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvO6zc77xBv1PLC3W9h5lsXg7dzGL
 xZWv79ksDjReZrTY9Pgaq8XlXXPYLCbe3sBuMePHP0aLbbOWs1msu/WazeL/nh3sFo+m3md0
 4PFoen+MzWPW/bNsHnfOnWfz2LSqk83jfvdxJo/NS+o9Wo/+YvHYfLra4/MmuQDOKC6blNSc
 zLLUIn27BK6MY5dOshQ0qVT8WtrL1sD4WrKLkZNDQsBEon3ZTsYuRi4OIYHdjBI3/u5mg0hI
 Sky7eJS5i5EDyBaWOHy4GCQsJPCWUWLmGnkQW1ggTeLUr5+sILaIQKXE5zm7mEFsZoHrTBIz
 ttVBzOxlkji7eStYgk1AS2L/ixtg8/kFFCWu/njMCGLzCthJrLr7FizOIqAicejuGbC4qECY
 xM4lj5kgagQlTs58wgJyD6dAvMSGpdUQu9Ql/sy7BLVXXOLWk/lMELa8xPa3c5gnMArPQtI9
 C0nLLCQts5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyhWpo7GLev+qB3
 iJGJg/EQowQHs5II74Fd3vFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowTEkhPLEnNTk0t
 SC2CyTJxcEo1MJXM6f5qIbT9/0FTV7GTN1+/XnegzvzDpv97L7rNTv0efULY9J4K75aTUbrH
 3hp0c/MFrLmxPunZ9a2qKZdO2YVMWsKh5Mn6LKGiOEPgXUGLZsizlnMFugpzjqTv0fduiL/g
 zZYxY5kQx9+wX+vvXH3+87uekuC974mOEsyb5szaaCm3+9H7yjNOa293hal5/DqnLriCOy3b
 nOeN/aywdwUrVxo+yJ55pOikfZbulfnpFw8dv3bFZsFbJebPU/jT7a/KbPV5f2kPe/3hX5aS
 Zicuv51W78TEcPLkp7KLjNOlWP3ua9QHZsYX/Nvo4STJfX+LWMUe3e/7ubY/ctD7aCLE+vS9
 n3n6kzPPT7xb23tLiaU4I9FQi7moOBEA+/SlDD8DAAA=
X-CMS-MailID: 20200901043239epcas1p45492888686a41403019bf6487705af31
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174447epcas1p3c9582567617196b61495ee281b443b91
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <CGME20200708174447epcas1p3c9582567617196b61495ee281b443b91@epcas1p3.samsung.com>
 <a174517d1f57b7a75eabd0361aef5365894d7c1a.1594230107.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 01 Sep 2020 07:31:54 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/9/20 2:42 AM, Maxime Ripard wrote:
> The HDMI controllers found in the BCM2711 SoC need some adjustments to the
> bindings, especially since the registers have been shuffled around in more
> register ranges.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> new file mode 100644
> index 000000000000..6091fe3d315b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/url?k=556aeb05-08b8fda0-556b604a-0cc47a31bee8-c3a0ebd1d22c3183&q=1&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbrcm%2Cbcm2711-hdmi.yaml%23
> +$schema: https://protect2.fireeye.com/url?k=24fa660c-792870a9-24fbed43-0cc47a31bee8-0bf16f4fd60f0ab4&q=1&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> +
> +title: Broadcom BCM2711 HDMI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Eric Anholt <eric@anholt.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2711-hdmi0
> +      - brcm,bcm2711-hdmi1
> +
> +  reg:
> +    items:
> +      - description: HDMI controller register range
> +      - description: DVP register range
> +      - description: HDMI PHY register range
> +      - description: Rate Manager register range
> +      - description: Packet RAM register range
> +      - description: Metadata RAM register range
> +      - description: CSC register range
> +      - description: CEC register range
> +      - description: HD register range
> +
> +  reg-names:
> +    items:
> +      - const: hdmi
> +      - const: dvp
> +      - const: phy
> +      - const: rm
> +      - const: packet
> +      - const: metadata
> +      - const: csc
> +      - const: cec
> +      - const: hd
> +
> +  clocks:
> +    description: The HDMI state machine clock

I'm not sure the following description is correct.
But, this description doesn't contain the information of audio clock.

	description: The HDMI state machine and audio clock

> +
> +  clock-names:
> +    const: hdmi

This patch is missing the following clock information for audio clock.

	const: clk-108M

> +
> +  ddc:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +    description: >
> +      Phandle of the I2C controller used for DDC EDID probing
> +
> +  hpd-gpios:
> +    description: >
> +      The GPIO pin for the HDMI hotplug detect (if it doesn't appear
> +      as an interrupt/status bit in the HDMI controller itself)
> +
> +  dmas:
> +    maxItems: 1
> +    description: >
> +      Should contain one entry pointing to the DMA channel used to
> +      transfer audio data.
> +
> +  dma-names:
> +    const: audio-rx
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - resets
> +  - ddc
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi0: hdmi@7ef00700 {
> +        compatible = "brcm,bcm2711-hdmi0";
> +        reg = <0x7ef00700 0x300>,
> +              <0x7ef00300 0x200>,
> +              <0x7ef00f00 0x80>,
> +              <0x7ef00f80 0x80>,
> +              <0x7ef01b00 0x200>,
> +              <0x7ef01f00 0x400>,
> +              <0x7ef00200 0x80>,
> +              <0x7ef04300 0x100>,
> +              <0x7ef20000 0x100>;
> +        reg-names = "hdmi",
> +                    "dvp",
> +                    "phy",
> +                    "rm",
> +                    "packet",
> +                    "metadata",
> +                    "csc",
> +                    "cec",
> +                    "hd";
> +        clocks = <&firmware_clocks 13>;
> +        clock-names = "hdmi";

Also, this example doesn't include the instance of audio clock.
Need to edit them as following:

	clock-names = "hdmi", "clk-108M";
	clocks = <&firmware_clocks 13>, <&dvp 0>;


> +        resets = <&dvp 0>;
> +        ddc = <&ddc0>;
> +    };
> +
> +...
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
