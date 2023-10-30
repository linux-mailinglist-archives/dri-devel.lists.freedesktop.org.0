Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A67DB927
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26A10E29A;
	Mon, 30 Oct 2023 11:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3942610E275
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1698659825; x=1699264625; i=wahrenst@gmx.net;
 bh=37wKrp2qAD613kYLNSmDTKsnQ8XYuKyMJp4BMc7gfCE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=i5x7CbNG26Cpl9Cspo5frzRtCEYyoC0AMnKme3fUcDq5FtWhFcKEUSaRfNRY7QXS
 jeEbk0Pz2/UjC7gluN6FmwxNApX+w1kuMGfkBGZ6edpJy+QoG0/cRl4Daien4KYM1
 p4VzqUr5UxJ7qtCqSqszNEE1rIcrIXlrMfx3uOuPsYKgN4A4wH0PauK2rFFxsJR5c
 7rQnFyXNdBn9C3+uPhs5MGpGMCYq/Id312l5n7Te6iZB1ByGAUXiyGlwtDn004/f2
 1vDcLT26hMkxAbA/tQ1um1nHc6TwbDhx9dfi9Tir2mMDStozka9PYDYTPy7aFH79E
 2jjD1IJHNNuTYi3KkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1rZdUD3aUv-015bFd; Mon, 30
 Oct 2023 10:57:04 +0100
Message-ID: <1d926740-74d8-4114-85c7-30b2e986ba8a@gmx.net>
Date: Mon, 30 Oct 2023 10:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Content-Language: en-US
To: Iago Toral Quiroga <itoral@igalia.com>, Maira Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-4-itoral@igalia.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231030082858.30321-4-itoral@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P5vOFeltnGmiwgfcisSqbfWTHE3IClcRR8Sao7L+9KNXL1I92G6
 8ozw0A+qcx6L+/zg+Rf8GCYHtLJn3gpYoyCIqR/oHdrzdZCV3YeuEyFaYa+vpm5exbgBh+g
 5vexW1dlHUcKayiNyIsz9O1fcZrCDO8XIQVRA2HRb//SAzFc85G/YZD2eBwNOdfjUfVgJkD
 qNs32vBFoRMj8WRfsf0vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0e+d6N4NAYw=;G4N8tkw2Qo96+r6ZZg+lNVtPXzg
 gZnyEI4QO8V0pBaxO0ASwYRMR285t2uDZbX2uPv0Rs441jA/kNZ6PTx6kVxukNg9bKSNQOWDD
 EeFQMu9bBhtyk3IjkUd7qRa/Fi+ny0ZqIRHUBH0eYtzAaevThotFJtMxSAaVL6cRgaoZmp4zy
 g0I/+UBstK5duTwo1UI0WcsBpp68Y3ElMDp62WQCs//+hrnDXRKxATQo/eOArlI29miFM4L8l
 zeJ7wuay/OITiE91SwWljtt/17p1LVq0S/oHbed/DjgT8wR50f+h78K+UPHjJjGaz+FsnsBwh
 FiLybN8d2akUdshUQ6FxB7YKFvb5gOGtzggmiy4tumRucQ3bSJhjLwmy0zkh9R0bZ+B1L5y5+
 JX7L5BjG2+4xh+or3Q29USF7gULUwlNpoMsPlCDXe7uKsG1t5S0KBcGF4PB9ix0GmFTLl5Yfr
 rHwxQGl4dLoSrxzvZOXkMWYhNzOfy1IHpUnnFX3kyWH3Le82m2pMyJlf118C+4N0zijhAUsFn
 fQXOxl/E4tSouBrfPnlv1QR4EyMaKJfDVgu3kUY2juJi8PKQHthHUztdwe4txxP1Ifr5EsTix
 GmHgPfsj+YfV5TK+y1HszMRvt4k0ITxHuqHqUhzEBtX/RxY36bbKOZ3h9mfQKMPikPsbXLFdl
 oT8m1nHyTE8dSY3kOSCyEEEsPZV8FeLO4totiORoWLSxcHLGmVioy6s3WC7aP1UR6GTz5/LTn
 fyx/g4zQnOK2hcHptrz8KSm8SEtnDUx9IMl2EPDF5w+ybXsPjGvyb0Yu87xLu+3qKcV+oxBGO
 gPAkDoQvM13/a+Yfa+lMMaoC46kxA09sAvTL6TSFoCZvnCz5b2VZN010NOXvA4jMoTTEs0aO3
 BhhOla3jQNz/olWJ4b0fO37KjKcKhCtkcaXcXlpC+wzOs3zI/noPtIeuD7sEF15pM9JO3AA68
 /5MeZ9RnX7MnkQLLphl5YnSa++U=
X-Mailman-Approved-At: Mon, 30 Oct 2023 11:41:13 +0000
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
> BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
>
> v2: new, requested by Stefan Wahren.
Thanks for sending this but the line above belongs below --- since it's
not relevant after the patch has been applied.
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
Unfortunately this patch will be ignored because the relevant devicetree
people are missing to give their Ack.

Please use scripts/get_maintainers.pl

Best regards
> ---
>   Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/D=
ocumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> index dae55b8a267b..dc078ceeca9a 100644
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -17,6 +17,7 @@ properties:
>     compatible:
>       enum:
>         - brcm,2711-v3d
> +      - brcm,2712-v3d
>         - brcm,7268-v3d
>         - brcm,7278-v3d
>

