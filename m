Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81125F9F5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2C6E311;
	Mon,  7 Sep 2020 11:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469616E311
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:54:55 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200907115453epoutp01cac52a757cad91bd7f06c08d38b650c2~yfk6BDPAr1393513935epoutp01M
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:54:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200907115453epoutp01cac52a757cad91bd7f06c08d38b650c2~yfk6BDPAr1393513935epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599479693;
 bh=KRwUtUiZ7tnQz4pCXZYCye5aXvgfCKjktjPcj0x26dA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ncJUUkTfxDBRcxyQ9/eMtPiO5GFKcjQJiJm/QCjLQzfWIZgr+kyEhkVuTupy51ETt
 mTaOI7NrXyBlnSRQ1w7zKXMH3T2xtpe9VmvTXxV4mkScJCiDPFqj1+F4vI8wVvGaXN
 WQcvtzL5CWv7iV4GRpTgMHhENGYQe6djK3NR+oqo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200907115452epcas1p2a4062981eb718dc2a41b9a7b982b4393~yfk49TGSD2635926359epcas1p27;
 Mon,  7 Sep 2020 11:54:52 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BlRXm5xRLzMqYlt; Mon,  7 Sep
 2020 11:54:48 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.10.18978.88F165F5; Mon,  7 Sep 2020 20:54:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200907115448epcas1p1a4c93edeff229f293fd9798ec03f3db5~yfk1KqNKI0086500865epcas1p1M;
 Mon,  7 Sep 2020 11:54:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200907115448epsmtrp296b1374fc0f24f138a04ad33d738744c~yfk1J4yma1006610066epsmtrp2g;
 Mon,  7 Sep 2020 11:54:48 +0000 (GMT)
X-AuditID: b6c32a35-5edff70000004a22-bd-5f561f88ec96
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.3B.08382.78F165F5; Mon,  7 Sep 2020 20:54:47 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200907115447epsmtip1b3e8906243b264df0105f515eb0ccb6f~yfk02vjtY1352613526epsmtip14;
 Mon,  7 Sep 2020 11:54:47 +0000 (GMT)
Subject: Re: [PATCH v5 77/80] dt-bindings: display: vc4: hdmi: Add BCM2711
 HDMI controllers bindings
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <9cce50b3-15bf-d47c-70e8-9b933c52524b@samsung.com>
Date: Mon, 7 Sep 2020 20:54:29 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ecd686e9b2335275bfb1ccfe1878305367b34bf3.1599120059.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmvm6HfFi8wbN1uhZre4+yWFz/8pzV
 4u3cxSwWV76+Z7M40HiZ0eL98i42i02Pr7FaXN41h81i4u0N7BYzfvxjtNg2azmbxbpbr4Gy
 K26wWTyaep/Rgc+j6f0xNo9Z98+yedw5d57NY+stU4/73ceZPDYvqfdoPfqLxaNvyypGj82n
 qz0+b5IL4IrKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1
 y8wBul9JoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BZoFecmFtcmpeul5yfa2Vo
 YGBkClSYkJ1xdHd8wWLViluvXzI2MD6X6mLk4JAQMJFofK7ZxcjFISSwg1Hizsk1bF2MnEDO
 J0aJr2s4IRLfGCWeXWxhg2n4MTkLIr4XqGbHdiYI5y2jxNInHxhBuoUF0iS+Xm1nAbFFBMol
 2jv3M4MUMQtsZpZ4ueEx2Ao2AV2Jrz3XmUBsXgE7iZaZH8EaWARUJFrWfWIFsUUFIiV2Pn3J
 DlEjKHFy5hOwGk6BeInTi8+CLWMWkJfY/nYOM4QtLnHryXywiyQE7nBIzNl+EWyQhICLRMfq
 ZywQtrDEq+Nb2CFsKYnP7/ayQdjFEldmvmKBaG5glOifOBuqyFhi/9LJTCD/MwtoSqzfpQ8R
 VpTY+Xsu1BF8Eu++9rBCgohXoqNNCKJETeJZwwGoE2QkTvUuZ4Io8ZA43GI6gVFxFpLPZiH5
 ZhaSb2Yh7F3AyLKKUSy1oDg3PbXYsMAQOao3MYITtpbpDsaJbz/oHWJk4mA8xCjBwawkwtt1
 KDReiDclsbIqtSg/vqg0J7X4EKMpMKwnMkuJJucDc0ZeSbyhqZGxsbGFiaGZqaGhkjjvw1sK
 8UIC6YklqdmpqQWpRTB9TBycUg1MGc91l/1vYn79PqOndaabwU/OEqus01x9pflskxn1Hs7S
 nso0MeVw97O3NvwHNRjSeJatXakkem/6f4M1W8rFNNsreJ73nwre8iYu23lzt/2/3DabDVXx
 Eu826fyessm7ubojfMeTF3WZz38yf93O+ueu/68yoAtrWjXZo1MWma6Oi/y8PXIV28I9Mnx2
 HBz37CT/CQbyLS7vkDlhmO6urq3T2vZddt6n6JVM3/WSlXT8JxaVu0Vln311/SjrTTazh0lG
 2/0Ej2c1GpcflxJXZAq2q/pTaBJgqZfvnVPKVbplw5JZEsafoywb1rmtXmXrfvXulpZNRcxK
 6/hP2K65zttSeW3t2infes0ilViKMxINtZiLihMBSjJEwmEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCSnG67fFi8QesiK4u1vUdZLK5/ec5q
 8XbuYhaLK1/fs1kcaLzMaPF+eRebxabH11gtLu+aw2Yx8fYGdosZP/4xWmybtZzNYt2t10DZ
 FTfYLB5Nvc/owOfR9P4Ym8es+2fZPO6cO8/msfWWqcf97uNMHpuX1Hu0Hv3F4tG3ZRWjx+bT
 1R6fN8kFcEVx2aSk5mSWpRbp2yVwZRzdHV+wWLXi1uuXjA2Mz6W6GDk4JARMJH5Mzupi5OQQ
 EtjNKLFxXjGILSEgI7GqfwsrRImwxOHDQGEuoJLXjBL/Lt5iAqkRFkiT+Hq1nQXEFhGolPg8
 ZxczSBGzwGZmia2zljJBdPQySex91gtWxSagK/G15zpYN6+AnUTLzI9gcRYBFYmWdZ/AtokK
 RErs3GEJUSIocXLmE7ASToF4idOLzzKC2MwCZhLzNj9khrDlJba/nQNli0vcejKfaQKj0Cwk
 7bOQtMxC0jILScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBMaqluYNx+6oP
 eocYmTgYDzFKcDArifB2HQqNF+JNSaysSi3Kjy8qzUktPsQozcGiJM57o3BhnJBAemJJanZq
 akFqEUyWiYNTqoGJ47+N1t07Ii/8LprsmLpD4YTDvslMoc2a/eIT1f/2qzjZffpsccY89dTL
 JMFp+x4kiepZlfeb6m45xVfWbvnfi31LS7jDxOsPzv3x+/FkClfLhsz4+62sd9JXc5stf+6t
 WLR9BYutxc9Juu6ff2pd8Z2/ij/e5By/d+P/6ft3S7XOz/SZdX+N1aTzVzt+HJC5zxU7yel8
 1xObnO4ZE9PD7yz/rdRwzik3NCvk+W4PplTfujat4AzpHVO+GM5pWyV5bPWxbTOSp2+taFHy
 0mB3tJQtEAm/+r7lncLnt8cnXW6fFHA7zlbnicuVONFt5kHRVzveXD9vb3HSaoFlVegexx/7
 3ziYtcV/uNh7rv2IEktxRqKhFnNRcSIAMhF2ukADAAA=
X-CMS-MailID: 20200907115448epcas1p1a4c93edeff229f293fd9798ec03f3db5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200904071230epcas1p4a2ecfdd61f4028a7656b3fb9087d9ba3
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <CGME20200904071230epcas1p4a2ecfdd61f4028a7656b3fb9087d9ba3@epcas1p4.samsung.com>
 <ecd686e9b2335275bfb1ccfe1878305367b34bf3.1599120059.git-series.maxime@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/3/20 5:01 PM, Maxime Ripard wrote:
> The HDMI controllers found in the BCM2711 SoC need some adjustments to the
> bindings, especially since the registers have been shuffled around in more
> register ranges.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your v5 patch


Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>


Best regards,

Hoegeun

> ---
>   Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 117 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> new file mode 100644
> index 000000000000..03a76729d26c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: https://protect2.fireeye.com/v1/url?k=0b6f5f6c-56a4d852-0b6ed423-0cc47a31309a-d9c680091736128f&q=1&e=24b01bb3-08a1-4c21-9bf9-e1d1e9ffdc3e&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdisplay%2Fbrcm%2Cbcm2711-hdmi.yaml%23
> +$schema: https://protect2.fireeye.com/v1/url?k=a854ae90-f59f29ae-a85525df-0cc47a31309a-1160616098892a41&q=1&e=24b01bb3-08a1-4c21-9bf9-e1d1e9ffdc3e&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
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
> +    items:
> +      - description: The HDMI state machine clock
> +      - description: The Pixel BVB clock
> +      - description: The HDMI Audio parent clock
> +      - description: The HDMI CEC parent clock
> +
> +  clock-names:
> +    items:
> +      - const: hdmi
> +      - const: bvb
> +      - const: audio
> +      - const: cec
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
> +        clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
> +        clock-names = "hdmi", "bvb", "audio", "cec";
> +        resets = <&dvp 0>;
> +        ddc = <&ddc0>;
> +    };
> +
> +...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
