Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAA11C8A6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8E16ECC5;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B660D6EAFE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:36:38 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBAXYXZ010358; Wed, 11 Dec 2019 02:36:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=wSRFCypBagK0UYXoEGDISONjBdpj0wmYxZmkNKtXmkA=;
 b=KQUJe+Xj8m9Mvw/e57KcHYB9az9TEZ1JQAsJmEP5JoJWkLy9E/vObrQR1p8HH8VeWoyO
 2fYiFe4+oxOlA47uT3QkJSrulqB9EqIZlvGzfC0IooSKO+SsJAumHn0lV2NC0fFW+O3M
 7U5M3uz3d64Tj/+H5twJ9agIKq/ye1olXqgRuPwx2v2xCeXRBhfdFaCnYstUNpDKbzq0
 xsV0Gkta+Sf8Si6M890fWxUJH2B3GuwqqMrnSYgS5K9pTNohzeQIOiUKym5jCFawLIv6
 rmgP2zQZV4zUJ9FdN1zHB4VclrjTT/all7I2qn6Lt3h8nx90n2k6awmS25Bdu7bxnrnD RQ== 
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra70dppk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 02:36:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq1EevVDdw+4vKwahWoD2fL6P7jvsqziTGHA1+z1VgL513gN9YsxbIOgtmzuzdkq0eU+M+RDI9VyCyTMZPKCu95m8JN1ai4nzJxzpU6p8D7JRXVgfq2qCOGZ7tne2S6hYA+5UvBVZEPxwdbjmzBK/kA6s90S4SGAUcnIfmx6lbvHPdD9ApTsDf9bqiGpOxTCfaMfD1IA5J8dnZoJUUh9JkWNXRif1CpwrZq1BN8Jsa2UTGh81upEpoJsPZv4OCL/IC/pzyHtRFOVM3p8TvLKWXrIKi/mUu6BI1pfc9NsJzplAneY/7H3bcHFxGhgRNmnpoCDeHqCGOVt84GK6OsO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSRFCypBagK0UYXoEGDISONjBdpj0wmYxZmkNKtXmkA=;
 b=mNsbVUh6pAGCCCXIy7BzVakwf3CtHu2ByHVnWRtHRnuJy5kSBFKascrMXPrunzbOliacK9qvP8Yn+GZiv0pgJ9haRADq3KDU82laiMwlGCXpPcmV05RULinkTecAQmcm7pP7zlB8jiTQdYPzg7wtrQ4lSpOOgGbW9yu33zwMKr1Wy/wSFewOauGuJBctuEG6ikVgDXysMQNQqmnUsKSBAXTr3fGYMR8xlZnXDon/NBUZHPG1eKzJDbT5cTWrydc66S2cZgbODWzmlg5od6TQmh0JpuL1WE6HiClez3hNESxb+bHk8KGyq5E8H9gMuO+6YjPXlpQ7kiQUJX0XZlFgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSRFCypBagK0UYXoEGDISONjBdpj0wmYxZmkNKtXmkA=;
 b=UQ3aakvDZWOTj2idyJltMwN4pU4CPO5x3fSMmSL8xsVqL/5KhLgsBTaNWmnBg0OHsGahDejRKjy6HfQ5hdAymYfBB08tULeuqZVm/WhDH+rmggdPFjEIbBLxe4jElRSd92UqVNZXU7OU6V5VqaYYFJnyePOTXF7EgtEIlHelPgk=
Received: from BYAPR07MB5110.namprd07.prod.outlook.com (20.176.255.14) by
 BYAPR07MB4456.namprd07.prod.outlook.com (52.135.225.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Wed, 11 Dec 2019 10:36:34 +0000
Received: from BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd]) by BYAPR07MB5110.namprd07.prod.outlook.com
 ([fe80::e4c9:23b3:78c1:acdd%6]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 10:36:34 +0000
From: Yuti Suresh Amonkar <yamonkar@cadence.com>
To: "kishon@ti.com" <kishon@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY
 bindings to YAML.
Thread-Topic: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY
 bindings to YAML.
Thread-Index: AQHVqcJqypKP+mFPsUGHeAK0iomIoqexiAAAgANAZiA=
Date: Wed, 11 Dec 2019 10:36:34 +0000
Message-ID: <BYAPR07MB51104B0B5D645B2F9C50707FD25A0@BYAPR07MB5110.namprd07.prod.outlook.com>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-3-git-send-email-yamonkar@cadence.com>
 <637267ec-bff6-032a-e2f8-9fecb7d565be@ti.com>
In-Reply-To: <637267ec-bff6-032a-e2f8-9fecb7d565be@ti.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNceWFtb25rYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0xNzk3MDRhYi0xYzAyLTExZWEtYWU3MS0xNGFiYzUzOWE4NjNcYW1lLXRlc3RcMTc5NzA0YWMtMWMwMi0xMWVhLWFlNzEtMTRhYmM1MzlhODYzYm9keS50eHQiIHN6PSI1OTUzIiB0PSIxMzIyMDUzNDE5MTAwMjcwMzAiIGg9Im52VmUvbmZYME5UYnVNQUxTQU9YUUlkNGVjQT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-originating-ip: [14.143.9.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48c6a1b2-d0ea-445a-3645-08d77e25fe84
x-ms-traffictypediagnostic: BYAPR07MB4456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR07MB44561FC615570FE3317327C8D25A0@BYAPR07MB4456.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(36092001)(13464003)(199004)(189003)(316002)(55016002)(71200400001)(9686003)(7696005)(66946007)(66446008)(76116006)(107886003)(2906002)(52536014)(66476007)(54906003)(110136005)(4326008)(26005)(8936002)(66556008)(19627235002)(8676002)(33656002)(55236004)(64756008)(6506007)(5660300002)(53546011)(478600001)(81156014)(81166006)(186003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4456;
 H:BYAPR07MB5110.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvOVYPHua5sx0pFVkz+FlviXuB4uiPdMsNO1Zkhvvfyj4MPocQ7imXfi+1gnhLtT9GGIqHzMEUvnF8OcZaHercr4t9bod30wIGDgFkNp1HqWD15peBRv6UmPBLAsHxH9iDvqGG+LyXe+MB5ihMsmz5cb4Y3I3i6dQ3N/jEPeC/dD9HWsJrPPO/fjtjPkkes1+RC9KxsSGpUxJErH/9ToxUBuYE/r4k77Bo6Vd6SPTDjo4XwIsVVjxtJd2/XjloPcZLV3+WSp1VpaF8vAtg3IFqIDDG6fzk1895MbCdiDmbjNV66nnG6NcEQiVXLgXxMSAqUrJjC4yCmGNWYnJyNUSeL8DqZ1JrtOUqnPL2iNmTCwLBbHGWP3BG1PsYYUSY+xDomqX+VEqA6yDPAcOruBP7rr8WV2QM9f2oBSlii+sjDj7laeZ6tY08BYuqOsmn0IgTy62KpeVTzk5XTlOko0ff7Q07pSn96WGkMJ6gpqMewdJ5bKZ+543bOdMwlv6DF23G7eZH16ZQtyWofJBtA3TuSWqJOQ1MwP+c8sQyvZS09M0shcS41ukx5WRd3s1I+Q
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c6a1b2-d0ea-445a-3645-08d77e25fe84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 10:36:34.3912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zz9U+xkCnyIVTiiWhTAtzG2hd+gfMfbc1+2wWJfDEsKsQSI06gJyjv/TC6/n9JyiCE9Eq7zM918rnVFrkNSPE9LJuXTOmOXYluxnS7Yl9vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4456
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_02:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110093
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Milind Parab <mparab@cadence.com>, "praneeth@ti.com" <praneeth@ti.com>,
 Dhananjay Vilasrao Kangude <dkangude@cadence.com>,
 "jsarha@ti.com" <jsarha@ti.com>,
 "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Kishon Vijay Abraham I <kishon@ti.com>
> Sent: Monday, December 9, 2019 14:21
> To: Yuti Suresh Amonkar <yamonkar@cadence.com>; dri-
> devel@lists.freedesktop.org; Rob Herring <robh+dt@kernel.org>
> Cc: jsarha@ti.com; tomi.valkeinen@ti.com; praneeth@ti.com; Milind Parab
> <mparab@cadence.com>; Dhananjay Vilasrao Kangude
> <dkangude@cadence.com>; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>
> Subject: Re: [PATCH v1 02/15] dt-bindings:phy: Convert Cadence MHDP PHY
> bindings to YAML.
> 
> EXTERNAL MAIL
> 
> 
> +Rob
> 
> 
> 
> Hi,
> 
> 
> 
> On 03/12/19 3:43 pm, Yuti Amonkar wrote:
> 
> > - Convert the MHDP PHY devicetree bindings to yaml schemas.
> 
> > - Rename DP PHY to have generic Torrent PHY nomrnclature.
> 
> > - Rename compatible string from "cdns,dp-phy" to "cdns,torrent-phy".
> 
> >
> 
> > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> 
> > ---
> 
> >   .../devicetree/bindings/phy/phy-cadence-dp.txt     | 30 -------------
> 
> >   .../bindings/phy/phy-cadence-torrent.yaml          | 52
> ++++++++++++++++++++++
> 
> >   2 files changed, 52 insertions(+), 30 deletions(-)
> 
> >   delete mode 100644 Documentation/devicetree/bindings/phy/phy-
> cadence-dp.txt
> 
> >   create mode 100644 Documentation/devicetree/bindings/phy/phy-
> cadence-torrent.yaml
> 
> >
> 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
> b/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
> 
> > deleted file mode 100644
> 
> > index 7f49fd54e..0000000
> 
> > --- a/Documentation/devicetree/bindings/phy/phy-cadence-dp.txt
> 
> > +++ /dev/null
> 
> > @@ -1,30 +0,0 @@
> 
> > -Cadence MHDP DisplayPort SD0801 PHY binding
> 
> > -===========================================
> 
> > -
> 
> > -This binding describes the Cadence SD0801 PHY hardware included with
> 
> > -the Cadence MHDP DisplayPort controller.
> 
> > -
> 
> > --------------------------------------------------------------------------------
> 
> > -Required properties (controller (parent) node):
> 
> > -- compatible	: Should be "cdns,dp-phy"
> 
> > -- reg		: Defines the following sets of registers in the parent
> 
> > -		  mhdp device:
> 
> > -			- Offset of the DPTX PHY configuration registers
> 
> > -			- Offset of the SD0801 PHY configuration registers
> 
> > -- #phy-cells	: from the generic PHY bindings, must be 0.
> 
> > -
> 
> > -Optional properties:
> 
> > -- num_lanes	: Number of DisplayPort lanes to use (1, 2 or 4)
> 
> > -- max_bit_rate	: Maximum DisplayPort link bit rate to use, in Mbps
> (2160,
> 
> > -		  2430, 2700, 3240, 4320, 5400 or 8100)
> 
> > --------------------------------------------------------------------------------
> 
> > -
> 
> > -Example:
> 
> > -	dp_phy: phy@f0fb030a00 {
> 
> > -		compatible = "cdns,dp-phy";
> 
> > -		reg = <0xf0 0xfb030a00 0x0 0x00000040>,
> 
> > -		      <0xf0 0xfb500000 0x0 0x00100000>;
> 
> > -		num_lanes = <4>;
> 
> > -		max_bit_rate = <8100>;
> 
> > -		#phy-cells = <0>;
> 
> > -	};
> 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-cadence-
> torrent.yaml b/Documentation/devicetree/bindings/phy/phy-cadence-
> torrent.yaml
> 
> > new file mode 100644
> 
> > index 0000000..d0037bc
> 
> > --- /dev/null
> 
> > +++ b/Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> 
> > @@ -0,0 +1,52 @@
> 
> > +%YAML 1.2
> 
> > +---
> 
> > +$id: "https://urldefense.proofpoint.com/v2/url?u=http-
> 3A__devicetree.org_schemas_phy_phy-2Dcadence-2Dtorrent.yaml-
> 23&d=DwICaQ&c=aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-
> _haXqY&r=xythEVTj32hrXbonw_U5uD9n5Dh9J7TTTznvmGAGKo4&m=7Lsfbs
> we4WSrLOHdYWsEMjNHzy23kPJ6KPTggg6-8SU&s=jpJD4BVWnlZdjfrIyUu9E-
> NqOgIaq_idztPyQMeJlU0&e= "
> 
> > +$schema: "https://urldefense.proofpoint.com/v2/url?u=http-
> 3A__devicetree.org_meta-2Dschemas_core.yaml-
> 23&d=DwICaQ&c=aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-
> _haXqY&r=xythEVTj32hrXbonw_U5uD9n5Dh9J7TTTznvmGAGKo4&m=7Lsfbs
> we4WSrLOHdYWsEMjNHzy23kPJ6KPTggg6-
> 8SU&s=Jxp_SX84Yw0AHUVR90mknBvO23OsGXyqRMdcrJ3bpWc&e= "
> 
> > +
> 
> > +title: Cadence Torrent SD0801 PHY binding for DisplayPort
> 
> > +
> 
> > +description:
> 
> > +  This binding describes the Cadence SD0801 PHY hardware included with
> 
> > +  the Cadence MHDP DisplayPort controller.
> 
> > +
> 
> > +maintainers:
> 
> > +  - Kishon Vijay Abraham I <kishon@ti.com>
> 
> 
> 
> No, This shouldn't be me.

Ok. Will change this.

> 
> > +
> 
> > +properties:
> 
> > +  compatible:
> 
> > +    const: cdns,torrent-phy
> 
> > +
> 
> > +  reg:
> 
> > +    items:
> 
> > +      - description: Offset of the DPTX PHY configuration registers.
> 
> > +      - description: Offset of the SD0801 PHY configuration registers.
> 
> > +
> 
> > +  "#phy-cells":
> 
> > +    const: 0
> 
> > +
> 
> > +  num_lanes:
> 
> > +    maxItems: 1
> 
> > +    description:
> 
> > +      Number of DisplayPort lanes to use (1, 2 or 4)
> 
> 
> 
> If this is a dt property, why is it also part of struct
> 
> phy_configure_opts_dp?

Number of lanes field used in struct phy_configure_opts_dp is used during reconfiguration of link during link training, while dt property indicates initial max number of lanes supported. Number of lanes during reconfiguration can be less than or equal to max number of lanes.

> 
> > +
> 
> > +  max_bit_rate:
> 
> > +    maxItems: 1
> 
> > +    description:
> 
> > +      Maximum DisplayPort link bit rate to use, in Mbps (2160, 2430, 2700,
> 3240, 4320, 5400 or 8100)
> 
> 
> 
> Can't "enum" be used here to define the allowed bit rates?

Ok.

> 
> 
> 
> Thanks
> 
> Kishon

Thanks & Regards
Yuti Amonkar
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
