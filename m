Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85595270BFA
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530F6E1B4;
	Sat, 19 Sep 2020 08:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8AC6ECB2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 07:27:37 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08I7Mlnx016285; Fri, 18 Sep 2020 00:27:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=wsPU3hc66u8IpuwgXH1fsin+m1ofmrgg4kaOzAS9gcM=;
 b=EBvyKc6gy9yKfMBnRS6rFfhIUfs1OgQ+DD1hFlc0A0fnfTrExSJkl7tPOR2aIIaym58W
 KNbJovrROr7FHVX8rU44vOF0jLXar88Kmmw0FOI5eF4mxxa9XzSOjkn/l+ENnkozLMJO
 RkDjo08T5RG1VGKg/fYwy1ZwSI0u0UdA34k6YiSlj7Fh4rf1krluZQRryRVIyJeCqeG9
 0MYvzkzAfaC/KgWdj2vnUrDgoE6WAG1+LYYv50hXNTMyS0ztnb+OXtZl72K1HG4YVGkV
 0ZjiZE7t6gESm0da5AtTVs3WrvtmWchTcpHHIqAKx6HgzhB8JMbruf3LD0wmOqqxR/GN rw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-0014ca01.pphosted.com with ESMTP id 33k5mmtym8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 00:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8+xwqdIAv44VULdYSJQo43+XAl/X8CTOnqaIJq5oDq2oQPyUdw/OHmf03qVwhHd7FjfLbHokorhEAExImJdk0EE9UN0xwQADqFm31Zk4ch6bpNwXDQaCPdrtLWDZ669i8EqKKv5H3wPMDZkFakLqmElMxEc0AxWSffe/tq3XNGTmY0zgOWMAL2RjYzQ7nsguNv7/Bn8Xr5ry8zDxz7+ikVA2tHMf45LzEqHEcpXRKAlyaSPM+gPWwkodBjsZwN9Fyv3aJrcNXpFj/1ad7Ps09H4Vqn2oRXLfSUIUoeCkLVz9jC1L9paFIRUwzBD27fxaSSnGoQyT1lLmlw9OsANGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsPU3hc66u8IpuwgXH1fsin+m1ofmrgg4kaOzAS9gcM=;
 b=kmHXYGEUHp6J5ltQBg0+c/Yma8x12qdtpwo4ee0U6Mj+OZD0U2ZVOTk+qT8Fq9d4NaQQa/h1GLIwO6RUsDcsCcFlTM8Gr/McX9HY6H9psZipyKxyUBKOpJoA0VYSrdxPch3Mmgv1KAuwq+hsYNBsNbN9khJH6R+nSc7hQ8awhMltcT2ju6T4/2zZsz34GodC0nO5BDNRgnsUxGPmiF7I95yOaEgcCd6H47bWPBEkzbLqEJfXa8fxt5A+VnUCGvv/+tFcJDIV2h3wghh+f1FqlUAk3TF1ZrZAmvkhqCGTtwC9SDSfMxsQEruJXwndBaJaab1jgTPAVcjh8cpoy7NXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsPU3hc66u8IpuwgXH1fsin+m1ofmrgg4kaOzAS9gcM=;
 b=nDAQMbvbd/4kx2Ujs6b2ZxURV/PUL5bcGsEatGT+/lM6issdSF0vykvjPNISvYXQ6agNw6r1wRi6Mmsg407XHkkNlTc73VDDl+VSdE5orGS3WreccAAohMNBhtvt5MSJps8UmB9f/hSaxtlbhrdAArqZOKqcPTEzGyD2vgaMhF0=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM5PR07MB3612.namprd07.prod.outlook.com (2603:10b6:4:67::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 07:27:23 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::c0af:c085:c7a8:4bb6]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::c0af:c085:c7a8:4bb6%5]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 07:27:23 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 1/3] dt-bindings: drm/bridge: Document Cadence
 MHDP8546 bridge bindings
Thread-Topic: [PATCH v10 1/3] dt-bindings: drm/bridge: Document Cadence
 MHDP8546 bridge bindings
Thread-Index: AQHWipVh6qfwktJm6E+lc6hSVjHO0KlrMaMAgALSlxA=
Date: Fri, 18 Sep 2020 07:27:23 +0000
Message-ID: <DM6PR07MB61541CC71AC926948802B753C53F0@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <1600087715-15729-1-git-send-email-sjakhade@cadence.com>
 <1600087715-15729-2-git-send-email-sjakhade@cadence.com>
 <37aacded-72e3-eaa9-f97e-488733da98ba@ti.com>
In-Reply-To: <37aacded-72e3-eaa9-f97e-488733da98ba@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy02MTg1NWNhZS1mOTgwLTExZWEtODUyZC1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcNjE4NTVjYjAtZjk4MC0xMWVhLTg1MmQtYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSIzMjI2IiB0PSIxMzI0NDg4NzYzODU2ODYxOTciIGg9ImxlbTk3bk4rQ0VNY1RxUkxzcFRTL1RmYWo5ST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5684c947-3ea5-46c8-464b-08d85ba44915
x-ms-traffictypediagnostic: DM5PR07MB3612:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR07MB361291BA972FBD28A1D59357C53F0@DM5PR07MB3612.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8PIREPTkl+Z98LmRVFeijj1OUHOSPLO5kx1SIQOL0+KbGKy/H58YMEhMGMx34fiCzXoAh1aLAtr6gHhqeXIdyk8CWgaifSkDs0MMgxi0bM8wcauYTSs5oXUFWz1pkqmmZ73PxtG7z8kSRu2p/Ux89IuibQJz4LhMW/dbaBByHOvQ87s35YDC9B3GRKcOQceVabR9ztXNYn4SvYEMyjG9OKPWEz++FEu3gDH/FCgBS8WAATz3Bizsd/vyJ+E8B+dzwCtV/vjQESNevUfbg4K8A5ukpLIOw6BhQMYPJeqOcBCcrHeAe82j6EnKOT31jQUQ5PrV02hSC4XpsODqU0d5DHd7Y7CtQBfDj1qZvWFN3CTohH0fB27o9605EOZrV8yEh57k01OVK70e+pkn247Yw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(36092001)(83380400001)(6506007)(186003)(71200400001)(66946007)(76116006)(53546011)(66556008)(55016002)(7696005)(66446008)(54906003)(2906002)(66476007)(64756008)(110136005)(316002)(8676002)(9686003)(8936002)(5660300002)(4326008)(26005)(52536014)(33656002)(7416002)(478600001)(86362001)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: P+/IQW0+aOw4kK731Sb4DiDTmuTNJwPZKMu8X5LZ1kjK2N1BH2KJVa4awNshKmZ5hQ331XrJioagP83iq3uQoQkqrPI+KHY1+2Ys51BZoevaq693aO2t4JMANJ1ds0FIjlDhOnxrVyl0CziDtSTxcc1SYueP4MHfn+zaSNJYsyrLvQG8AWqdZk2IkE0bcvSVTzBVyD11PHi3piEtSl0xC+WLNawICn60X5tHyDt7HWLlbdk73uAPQM2mzK9vruD0F3LwYjbHM8VChwpuCNWrBketyBXDhdSHmuy1iAfvfb0Rjlc4JrlbR9KbpZkNt7TY0EKWAY71Lt5NZRgPTUUxmRTfjWKOdDW7JNfG3/np5ciWJt26wFQmox0723tuwF2/ItyDSAV7PTJbugl5QCubRCGnCiMG0ahiHMLmSN4Yvt3fm+wZIDJK99hLg0yl5O5FM4FikJHCTuFjq/hUnnUAft6mDDH0Y23EYcBan6cMSp2W7hLRpGQc3QPHgYUyoBM/SWElGdOrXT/KELANRVJTHOWpJzGrnt4+GXcGvirs67z/xbB6RVRb59HPNnrbi+X4kkBoXDX86gwIU5cNar6BnCg04aTQ7z24QHl9E87YvZc/S9+7gIkAeib+k2v2Yud2bl+VJIRH6DqBlz+8yShjvQ==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5684c947-3ea5-46c8-464b-08d85ba44915
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 07:27:23.0631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tSMktkmUzn1pJphTAAcCfDTP17wDkXy1XGqhPl3IpsPbPJbA8tnemE6nJLyv0IRbgoXVojx5WERouznfE9UI/EYhRbiaUiWQcwN7pMX5frE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3612
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_06:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180061
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: Milind Parab <mparab@cadence.com>,
 Yuti Suresh Amonkar <yamonkar@cadence.com>,
 "praneeth@ti.com" <praneeth@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "nikhil.nd@ti.com" <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

> -----Original Message-----
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Sent: Wednesday, September 16, 2020 5:48 PM
> To: Swapnil Kashinath Jakhade <sjakhade@cadence.com>; airlied@linux.ie;
> daniel@ffwll.ch; Laurent.pinchart@ideasonboard.com; robh+dt@kernel.org;
> a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
> jernej.skrabec@siol.net; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Milind Parab <mparab@cadence.com>; Yuti Suresh Amonkar
> <yamonkar@cadence.com>; jsarha@ti.com; nsekhar@ti.com;
> praneeth@ti.com; nikhil.nd@ti.com
> Subject: Re: [PATCH v10 1/3] dt-bindings: drm/bridge: Document Cadence
> MHDP8546 bridge bindings
> 
> EXTERNAL MAIL
> 
> 
> Hi Swapnil, Yuti,
> 
> On 14/09/2020 15:48, Swapnil Jakhade wrote:
> > From: Yuti Amonkar <yamonkar@cadence.com>
> >
> > Document the bindings used for the Cadence MHDP8546 DPI/DP bridge in
> > yaml format.
> >
> > Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../display/bridge/cdns,mhdp8546.yaml         | 154 ++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> I was testing this on J7 EVM, and looking at the dts files and DT bindings. To
> get rid of the warnings from dtbs_check, I made the following changes.
> 
> I think the interrupt one is clear. The driver needs the interrupt, but it was
> not defined in the yaml file.
> 
> For phy-names, we had that in the out-of-tree dts file, so I added it here. The
> driver just looks for the PHY via index, but I guess we should require it.
> 
> The power-domain is not needed by the driver, but if I'm not mistaken, has
> to be defined here.
> 
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index a21a4bfe15cf..c5f5781c1ed6 100644
> ---
> a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++
> b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yam
> +++ l
> @@ -46,6 +46,16 @@ properties:
>      description:
>        phandle to the DisplayPort PHY.
> 
> +  phy-names:
> +    items:
> +      - const: dpphy
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
>    ports:
>      type: object
>      description:
> @@ -114,6 +124,8 @@ required:
>    - reg
>    - reg-names
>    - phys
> +  - phy-names
> +  - interrupts
>    - ports
> 

Okay. We will update the bindings as per above suggestions. Thanks for your inputs.

Thanks & regards,
Swapnil

>  additionalProperties: false
> 
>  Tomi
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
