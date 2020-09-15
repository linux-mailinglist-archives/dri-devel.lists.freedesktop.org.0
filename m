Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6EA269F2D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997F6E842;
	Tue, 15 Sep 2020 07:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF276E83A;
 Tue, 15 Sep 2020 06:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7GQyzvsPNdx6LkvGaKVXt9QOCCneCCO6CGO2NXRuu6vNIU8bsHJEY308yZHMt/vGI+4vvab4xmwz9CbkMMgqG73YzdsSlEv2F4Ujzz2QH4bGZrcJClaKxoE7wRDm3Zb0dfnkOoLo1GRgZ7BmBzv+YbEw71E5R/VEQmGlADnazbGqtnveI6+wjrBI7W/6fRLQN5OpSBEwMLBgaEAJzPdWNMZQxyijKGEoaMPV8mIYLoHj02sUMJ/7cy0F9X/pxFazn9X1uBJqXfReBpum72RQjMUgJHBLrPb3qmZdnneSAv9ywcm8lAaxoX2XIowl7Flyd3ZhUE486FBUyFf+Iib0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtEmsleJgEIRNZzMnaCYVOW16njlB/IOMQpWuiMnEMk=;
 b=FOV0xAdTMtVqOLNYPzjzBbahOARuqnH8IAUiyZYcUyQy2dTisKZr9OqPOSGj2NLsuumNlvBMmFjXCRuAnxZ8x9m6E/cOife5H8hphs9vjx1iA9uwIDronlVo3xGvAS/5cAeK7lV17dSv6NT3zdQAajT6eGwn1xUQeCSuILkkdE96y38YKATw8qCn0rmjd0ajopeyFNpP8L3S4eZm3Bho9KaHGImJQj5IJOruDmpzeTrtQqwYHYp5+mQQYt5/DJ8Rxzff01CyCPz7R1pY2mhHuUv6OmvOYLLXL3ThBSGPXXlGJucSOrRXybqQRvUcXsMsgK7aP8Xg3L1hSLPce9pqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtEmsleJgEIRNZzMnaCYVOW16njlB/IOMQpWuiMnEMk=;
 b=fqzdWFrD7msgDu59mHpyv4VUnUFLMlqfoQweAHEPEUod3XYKHJ1M2L8o8Ev7fsYteLffj+AvNT/BAR/+v4z52jnMyBHe1ZnpNxwYQyNmQ9GT1+vC9UEDxvwAn/BPu93kjxCjiOvTTBVNDAwpuEFHyh69HfQSFlWzyYVjDYt5KGo=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2476.eurprd03.prod.outlook.com (2603:10a6:3:6e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Tue, 15 Sep 2020 06:34:46 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::88fd:1086:3253:3fcd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::88fd:1086:3253:3fcd%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 06:34:46 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH 06/13] dt-bindings: mfd: rohm,bd71837-pmic: Add common
 properties
Thread-Topic: [PATCH 06/13] dt-bindings: mfd: rohm,bd71837-pmic: Add common
 properties
Thread-Index: AQHWgss5NO4jUZlClkGJgvpiKmDktaloy4WAgACC0oA=
Date: Tue, 15 Sep 2020 06:34:46 +0000
Message-ID: <6bfa15383657ca38a28edac38b5e8adf891865e7.camel@fi.rohmeurope.com>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-7-krzk@kernel.org> <20200914224407.GA388924@bogus>
In-Reply-To: <20200914224407.GA388924@bogus>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acabe237-61b4-4f6a-557a-08d859417018
x-ms-traffictypediagnostic: HE1PR0301MB2476:
x-microsoft-antispam-prvs: <HE1PR0301MB247688FA7E134421BFB3F3ABAD200@HE1PR0301MB2476.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /YAPxcSeWyCsy4wHECLjJ2pw37qaccjSCvOwuO8fhzu/Sd/mIRLSnoTU2RvuTyulQAwFte9LKkf5TqYZyoQ87JUDc47yKeDI2zNZsqkmbBnVY0MhZ3STjg1Ao4y/vi3HPAY9etSeGiv6fpFVK4s0klSHRXsD1Jx/xX7aIygLAJraVdOD/mFrH1oS8mPGyH+m227vosWA7Ne69kjr2VxTrs98GH9iVt2AfXkBMoLlRMZ+Kid8xgn6m09vZTsYpsg+VwRdhyQOHRWQPV8sBGnQwlOne7hDnCZsuJJpQ1FJ4LYf7OO8wGDVjKbN6+QHiS+zhXMmLpohs+6jwGl1M29rCc9gUgPZOI8+aZHEmMMJcvX419S6SS0YVORVoCG9+JIn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(7416002)(2906002)(8676002)(316002)(478600001)(4326008)(110136005)(3450700001)(8936002)(54906003)(5660300002)(6512007)(2616005)(71200400001)(66446008)(26005)(6486002)(66556008)(64756008)(66476007)(76116006)(86362001)(83380400001)(6506007)(186003)(66946007)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dTZoALMawbX/QMYRtZa6eXACzD8MfZdE/9QoLiFa9Zu7EWYtNmMs1oYWYKxl7KnY+X8Y402XPLhAegolNGaLmZWwPX+i8iHV3q7elwmkAz8W5HFT1mxuctsP2anrhcOFhYnxFp75oqI5lcXtl9dynAJ5h9c/5YrMCZOW+M2zx11Xs+PquuLz7ngvkfGHTqXcThnho5e9ut+iX1VOCXnyf71aoRLc6acyqqN2usFT05tHPq83wk+VCNpLtlda1cfF4UUmHCw1BT8B9ywRyI2NRB0DCD3XeD9/YWsn/39ncphqk7iyeZxet7O4nvRecAV4ZOTxiU+zyv11Dt2qlqMxbbwvKrC07ftE5az7ChYF9WcwLK1+4iIzYyoYeEdt1IbVXe4YOC40lXAxoseuajovytr7WBkG0BSU4Q9CRLYMhBKjQH1QR4k67PO5UYGLKb6BNR1vns4rj1pmIVJfLSewazKtC8m9eGsKVprCsgWPCcAstOSwTSHdKdkvuHvm3MY94SCIxvWjtizEOhDgZ9G4VlGZLERaq2TWePTz+a6rrM7GSGgp4HeH+VMXq4fSUgtZz/omj5A4r+NmZyJEzZSTT9aipIeKf7fbhR/CJCul+a9DH+okcR6I8ZUQ9VlawXarIi0SwOkLFXDz2PWbSIV5Yg==
x-ms-exchange-transport-forked: True
Content-ID: <2757F9EFDD17A84A9DE0B10B51F84A28@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acabe237-61b4-4f6a-557a-08d859417018
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 06:34:46.0634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fuqz2DEnV+bJWtDVa8vhjX2ilB3awswg7e6RZ8yYoOOi9VLp47GtY4gQQrARallq6bPck80//SJcO2rUV31bXNSYJAohcnMnp2mkzncyph6BO+Vp5GzbkrQM+yHE0BTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2476
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "robert.chiras@nxp.com" <robert.chiras@nxp.com>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello All,

On Mon, 2020-09-14 at 16:44 -0600, Rob Herring wrote:
> On Fri, Sep 04, 2020 at 04:53:05PM +0200, Krzysztof Kozlowski wrote:
> > Add common properties appearing in DTSes (clock-names,
> > clock-output-names) to fix dtbs_check warnings like:
> > 
> >   arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml:
> >     pmic@4b: 'clock-names', 'clock-output-names', do not match any
> > of the regexes: 'pinctrl-[0-9]+'
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/rohm,bd71837-pmic.yaml          | 6
> > ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-
> > pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71837-
> > pmic.yaml
> > index 65018a019e1d..ecce0d5e3a95 100644
> > --- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.yaml
> > @@ -32,9 +32,15 @@ properties:
> >    clocks:
> >      maxItems: 1
> >  
> > +  clock-names:
> > +    maxItems: 1
> 
> Needs to define what the name is.

Someone once told me that "naming is hard".
Do we have some good common convention for 32K oscillator input naming?
Or should it just be dropped?

> 
> > +
> >    "#clock-cells":
> >      const: 0
> >  
> > +  clock-output-names:
> > +    maxItems: 1
> 
> Ideally this one too, but we've been more flexible on it.

Data-sheet for BD71837 uses pin name "C32k_OUT". So maybe this would be
good?

BD71838 uses "bd71828-32k-out" . so we could also go with this same
convention and use "bd71837-32k-out". Or - we could take a risk and
*assume* typical use case for this clk (as this is typically used with
i.MX8 I'd guess the 32k is used for RTC) and name it accordingly.

Br,
	Matti Vaittinen

--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland
SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
