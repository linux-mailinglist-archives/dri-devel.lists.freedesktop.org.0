Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C8194AA2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 22:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F112B6E939;
	Thu, 26 Mar 2020 21:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323BC6E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 09:50:26 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q7qfdq016674; Thu, 26 Mar 2020 03:57:34 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-00128a01.pphosted.com with ESMTP id 2ywfu5fu0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 03:57:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdBn+sC2Tb5tydML86Kh23cDRaQQaqChzl7pGBy19h5Xi1aVVem8VhoiXZKbcAxu1cYGsjBE43+9+b9lILmZeabTxKzT3w3eXW5RDo9w5C96qlY1MCWLi9styTAFKgFej3ugzStQQ/AHpWHOkM3gXLNwWOcLExeDaXrCYdp52LVGKVFhCF2aDBUwSi8wAfXl1/hVxeJFIR+tGQDmwHzwxycssCOvoSIYhK48eJgNLBtly+YQRwNeB5FUbNn2o/b38UXJq38s0U18JC1Omy5+x0TskZlmOcMNxCIIE5dow2pf1MwJx0CaMQSyR/h681W0jTf/U8j+h+cibpe3bkm4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJj6mHsRM8ZyZ0YjEAR1Z3YqAAK+NOPskXPs2S5GWBk=;
 b=iZZzLNp6f46J0jsB56HvKkmDMDwxYLRqO+wAx9nfftWGi5AW8GSSAQZExPv4FV6PtOy/Jxdct6PfDga5LHjBz3j4qnKBH0nX5io89H1OQZsjKzfwhcSBUkEbQQzTfmpsn/BgP7qpShVxagNaGh13AeKd+LCYUw5oNJNO5ol2V9oahe5bhzOi5HkhraxsES+zAVKesrnFGLVVe0EVZyHp5mMejMzGGxvG49U3HJjmrPX1K1Jgt5NKkeQ5HbH1LoaHdeUbZet5bNtBcf3MzRCiHsBRiWXK2vHQ+AgPjlzId7uzJyPNOailMoxDTT3twT72SGJWqkfaLoTbDWPgjT/Qdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJj6mHsRM8ZyZ0YjEAR1Z3YqAAK+NOPskXPs2S5GWBk=;
 b=j6WI87FIj/9GXIzmB1TspUzfgILyhJgVPzOrvG3jDb0uCkvjLsoLyEDHZm8ENR4r0me+pbZutk5eyiJdzC0qjiRM1zaD4Tw0Hxr/5yfFDzFcRoQcUopSl5FMRzN+dhrF5lamXRhtNxBsmyVBPHZ3BecGwTwIsxwJGiR4ok1waLU=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4762.namprd03.prod.outlook.com (2603:10b6:5:180::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 07:57:31 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f%3]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 07:57:31 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi, adxl345/6
 from trivial-devices.yaml
Thread-Topic: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi, adxl345/6
 from trivial-devices.yaml
Thread-Index: AQHWAvGRyh1nr3AmYUSmiHCWtT/kdahag2iA
Date: Thu, 26 Mar 2020 07:57:31 +0000
Message-ID: <ede75c098e3e354ff7e93e4e1d6191e35ea1fbd2.camel@analog.com>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-2-robh@kernel.org>
In-Reply-To: <20200325220542.19189-2-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.26.73.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ca15d55-1984-4079-b6a7-08d7d15b5643
x-ms-traffictypediagnostic: DM6PR03MB4762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB4762ED8CDD560DAB31C3B763F9CF0@DM6PR03MB4762.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(136003)(346002)(376002)(6512007)(66476007)(110136005)(6486002)(36756003)(76116006)(8936002)(316002)(66946007)(4326008)(66556008)(54906003)(6506007)(91956017)(66446008)(71200400001)(64756008)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(186003)(7406005)(7416002)(478600001)(86362001)(26005)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB4762;
 H:DM6PR03MB4411.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQ0XwLPE82pjmOfXN8D2upY4UOg52ChOHFRbAW/6OLBxFeZTSh/QUIWgjUubSmzuKNuHNhPUp4bgCgeVpOj60ipg3AyUvo3cj63kDMKOgnaGYxY3pfZStQDwWCnV25KefFP38pnfOarVl1/L2jR5+YLC2W2K6fRrbJIKuPU90sOUoohRM3RFdPYxBcDb6Hcyk3h4qrqj0yBXmFieyPnpA6AVqxxqmQQlwRBYwB16HbwIPIPo1zJAE37MxOAwkpewAzm/oMNOQiwYwcbesdF8z/6pgpOZPwmhN46xK5xBRp3N8vC3oIqwkcoJgwAipYyAczpS2LaWAMhLjaAhl2aS61bzszWnaZIWfHTKfEXpr1bAyrYCspQT0WtlRBHBhJjDtkspYHwZvdjxUt9rtBixqwLhK1ZOe/+4VzBpu/hIGuoOROH4e8Qr89mlA0MMPF6C0LzPbccR/v8E66aUZTPUfKNkYORspWARkvmdwaNFAb3jHp3qgFm9VCeNMhj2jNEG
x-ms-exchange-antispam-messagedata: wbXuKhkVQH9bp3R9WC5ntrX4kBK6uSrA3lrcL+2VZYxVhydA8vDjH9mvP7vCxR2FWxpwxTKm3G92nei98Dxs4+Ku63UiYsZcPTkB4fEYjsMdsF6swi9e7asZTOpGQWXwaN2ij8PI6sXEShjR+p0O0g==
Content-ID: <0AB7565D36DC2A49B1E7778675A10B25@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca15d55-1984-4079-b6a7-08d7d15b5643
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 07:57:31.4602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpT8Wp1jOAK2vWbTqa1ZE8ykXUiCVd2lUdIYEV7sqkVzuVQ8wmJVWLM/+pq1mbnkdsRGDni3xVACcsTIok52zSeYAS+W437RMUwyPq6Tszw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_15:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003260055
X-Mailman-Approved-At: Thu, 26 Mar 2020 21:34:52 +0000
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "glaroque@baylibre.com" <glaroque@baylibre.com>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Hennerich, 
 Michael" <Michael.Hennerich@analog.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "masneyb@onstation.org" <masneyb@onstation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-25 at 16:05 -0600, Rob Herring wrote:
> [External]
> 
> The 'adi,adxl345' definition is a duplicate as there's a full binding in:
> Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> 
> The trivial-devices binding doesn't capture that 'adi,adxl346' has a
> fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.
> 

Acked-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: linux-iio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
>  Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> index c602b6fe1c0c..d124eba1ce54 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> @@ -17,9 +17,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - adi,adxl345
> -      - adi,adxl375
> +    oneOf:
> +      - items:
> +          - const: adi,adxl346
> +          - const: adi,adxl345
> +      - enum:
> +          - adi,adxl345
> +          - adi,adxl375
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 978de7d37c66..51d1f6e43c02 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -42,10 +42,6 @@ properties:
>            - adi,adt7476
>              # +/-1C TDM Extended Temp Range I.C
>            - adi,adt7490
> -            # Three-Axis Digital Accelerometer
> -          - adi,adxl345
> -            # Three-Axis Digital Accelerometer (backward-compatibility value
> "adi,adxl345" must be listed too)
> -          - adi,adxl346
>              # AMS iAQ-Core VOC Sensor
>            - ams,iaq-core
>              # i2c serial eeprom  (24cxx)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
