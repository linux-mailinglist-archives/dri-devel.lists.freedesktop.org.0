Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC6442492
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 01:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045976EE3D;
	Tue,  2 Nov 2021 00:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320098.outbound.protection.outlook.com [40.107.132.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FF26EE3D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 00:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu647KHDsgiZym3dRXJh8pptXBogAJtQLe/zL/Dmut0rZqiWWr5POPczyMqrQyOBdd/HVt9309KXOhx1g3aDpe0JI64pW+7yIWwTCr8qelaz4/Y4ITS/1hSZTBIlkRseig2fTEQB58R8yLDc477yfm9+sy4NCyd0epUQ2zVQ8+K8In5Z4R7PBVeHVcyDkR121tL8VfeP6vmK3iblC4JUMqGDkr+RD+jHagFGsU9Co5sjd306xW4g+gq4kf2elvTgLyucSJt4TLBOe8f9BsSrabCZiuK9xnFF1sUihk6efwfyhg8g23VsBDm7jFqshNQw5L5UBtguUtZuPnJU81KNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mupaFHBilGRHTj8l++Gsew04Xqsoly8j4E2cJdKmP90=;
 b=civIvEKfCtnYnlXiKVe1ARH1s0PCs3CFn8HWoK7ahtO4XOXDk+LZ7kvSJN6VP6DqwPOOjfmlWuE1rtU451D362FHvTHh8EMm9gK20K5y9lc8FIlj8MCPWXn4AKliKI4T/eyyXhdwAUlEC/OIQqOLpWEPLHl0LaR+bKBONkvDs2HpkO47DWspKG5HnHTNPNVUG/7nXhfcyYumxYRnIJTRO0g1vIHBbOsZ3wFIaYYHPDVFkMcSVqtuOP8DOPL9bAOoQBhkr5e2jiILKfwkzxZYYvCJdtRVEOHzInors1c3Pg4IdRK2VM+iIq0e7fv+MkBa54QR5yHZYY0x+Mlz79xmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mupaFHBilGRHTj8l++Gsew04Xqsoly8j4E2cJdKmP90=;
 b=LoesGTsFQ08SXBaWGopB8BwYtXgJ/oz953sPQgoStZJmQ/CLG82uvmOxTvOb8soEcsvSeE8REsah277psO+h8tFZ4Iw9zWSiNGoV6ceLdF4MkbiM3+Q9ODkosfwVCdbsmxnMXa+nUfcFyxfd/l6+hRziNoMoRd1YImNmcp6f9s8evOSdm0psOuVS56dA9u5uahMLfedOGJzMDpCx38ZVkh9Qj6/yJw92Ez2jiTUhNzD7+s7AJ+1uXbEmL+joeBLva14LTIe37iPwq0UHqrsXRbnUesD6SuIysC3X76krBi+sCmAEcwz03O8wVWeBuDB8E/uoZfpfIydo712FNq5MWQ==
Received: from HK2PR0601MB2033.apcprd06.prod.outlook.com (10.170.148.16) by
 HK0PR06MB2353.apcprd06.prod.outlook.com (52.133.151.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Tue, 2 Nov 2021 00:20:38 +0000
Received: from HK2PR0601MB2033.apcprd06.prod.outlook.com
 ([fe80::2979:fa3:bd14:dc6f]) by HK2PR0601MB2033.apcprd06.prod.outlook.com
 ([fe80::2979:fa3:bd14:dc6f%9]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 00:20:38 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: gpu: Add ASPEED GFX bindings document
Thread-Topic: [PATCH 4/4] dt-bindings: gpu: Add ASPEED GFX bindings document
Thread-Index: AQHXzw/RgDHov3SmFEyde5AY8QXfAqvvGIOAgABH2WA=
Date: Tue, 2 Nov 2021 00:20:38 +0000
Message-ID: <HK2PR0601MB20338733A2D74609492388FAE18B9@HK2PR0601MB2033.apcprd06.prod.outlook.com>
References: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
 <20211101110107.29010-5-tommy_huang@aspeedtech.com>
 <YYBHsy3Ed3Ss9281@robh.at.kernel.org>
In-Reply-To: <YYBHsy3Ed3Ss9281@robh.at.kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c1ffd7e-c100-4114-0fed-08d99d9698f7
x-ms-traffictypediagnostic: HK0PR06MB2353:
x-microsoft-antispam-prvs: <HK0PR06MB235342AC4E3E530509F7D7CEE18B9@HK0PR06MB2353.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3dxKRrgsHhzpltot1ETBM61ZO8nymAT7xZpHVmDJ9nlQBo225cUUokaqDr3uNyWOpgn7g++ybzrDlrPMAZgIEv9Dtxc3vAAVkS1Yp16TYTd/yJbVMo3QwXq+QYnKNruwHeWVgzYX1WLx/H6KTZxGGLLGTpKSxFm9hPm3+/3KPA2tKynkMIERLnTiiee9ED1b+C439blvt7XnWib0g8jdbFaQJpsyJtyKw9NyhlpEklkAN9JFcQkpec348eIrzcfkFgEZANAL/KOLSY9rXglP3QoAfFuR6zp6v+yu/Uu+wsJFdXJho9+AUsx9nxPFn+b8zTKyJma/qAHgrg8/ifcxVfDVLXX0iAfO2oJZ1x7jJ4slDHPq4ezBDH9EInEK9Vnzx2iJLrzRsUHMvwemoi/nHdR3bw443ZRN/4oDiR7T7ZBJUlZtjWGesOoyVYGfCyA5NtkqbaABAlVIe+FR9CJXcgiiGrF8Rcweo5w0KbKERxbBp0Mpz6I+cvZe+hDFPklJPb/ktJuLcl8/o0+jQOg3UOXf09jBjxtaeGqEmQ6wmLCI7ucq9VKxArWjFcuradEYQHchRv3WmvFklI4Vr2I+XTLRtgh7nn/9g5/Io2amL6D4COUTenJdHrpAA56pqclG0ZWSoXL9/8lHdhACPrRz7RiAamhnoqTkkDWUcmmyNr+uCPpFCUY49SRHl6nhxsn/lbY1V4H+y7M+tjoUYfASA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR0601MB2033.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39840400004)(71200400001)(2906002)(86362001)(55016002)(38100700002)(76116006)(7696005)(4326008)(66946007)(5660300002)(6916009)(33656002)(83380400001)(508600001)(9686003)(7416002)(66446008)(122000001)(8676002)(26005)(52536014)(64756008)(38070700005)(54906003)(316002)(8936002)(66476007)(6506007)(53546011)(186003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tehIwXBa1Z+keS6NEJRjhOvNisGw2Ct/3hrlcB2MHiic3JdpIFWZRL90UxOl?=
 =?us-ascii?Q?ACi5Ak4frjQ68kz+/yz0kzToKG5AISnioh7mL3hFlVGlnbv0Ev+hG8uqYkwo?=
 =?us-ascii?Q?HecJ6Y+oUvSnkdSNWKstAxU8487Kx3r6GrxA93RA/ag+SidagFY3ZW0e1g0I?=
 =?us-ascii?Q?baRUbTwHhxuHPtBXdXy9cSCyB+X6mkVg61cx5iVJmokRvDWU4CCXekqR3ya6?=
 =?us-ascii?Q?vo3uUcSpoBxZGpNg34lRuygL3Koudf1WiDrCWTI/qUT/KEdjdBmSiSuaZqe4?=
 =?us-ascii?Q?3RJeT3T4Yb8nLMdaiRERXBUvbzbX8nQ8ppXTZpcFdzmO3txKV5Af2sP7TpEA?=
 =?us-ascii?Q?a2z3go2aTrJij7lo40ZaFe0MOLKjAQQRmh0a/583Cf0pXIogMc86L7ZUhd4k?=
 =?us-ascii?Q?fi1k/drIo76Z7sa+BVodshD/2xQQ4FIEblgcbNkuAt7TQ6O8+DeQQeD7CQAb?=
 =?us-ascii?Q?73M3zLqrdTjNpljtRAT1tXaRdKktKPmVlToywE2UZAoURC+/5PyfJcPdzmVE?=
 =?us-ascii?Q?VkKcpls+9YzjyG5evBxZcQvLAz911+lgvR+Qj8FQGAufl0o/YJBh8wuuFgct?=
 =?us-ascii?Q?UwOBsghCeu21zJtPhw3lnl2bpinS6f2fEUweq3m+84b0YxQnTZd91pvj78UF?=
 =?us-ascii?Q?hEPesB5eRohy/EyTmWSVz/GSPF2c8Xm5IRQjyv83kpQiQi74Al77n+Vastpi?=
 =?us-ascii?Q?VweuVRmJ4LcHHA5HHRpStkBixQolPHdkYQ7Ka2a2MVznS5f31PigJxeU+WeB?=
 =?us-ascii?Q?59IZN4Q45vv/y4KinKSEiTm0Or3siDt5FETFb+YCZgdYZK7IlrI6NMFKUQJs?=
 =?us-ascii?Q?swC4Rdsq+69vxHTTinTEohtVSXRqrrPwSAKlUL6afZZJ5SyCCUWLuJjOCmR2?=
 =?us-ascii?Q?7Lx+g6bkXyIiAHRZ2ZVd/wa3Cf2746ZODb1GlAxiJZEkPiS8UPq6TBq6u6Ev?=
 =?us-ascii?Q?lVXEfZ5DBm3kqDTleg8l5BoVGEiW0C0SyF+PfECI3Ca4l3BR0sJ4UafU7MPy?=
 =?us-ascii?Q?UGtz8EwnDLYrnCR/O1oSIFT4TwcnLpw2NwdXCQKjontratedXCOXpTIdNxJd?=
 =?us-ascii?Q?p5XH3BZ5vPr/8Xq9L4nJvGTMzn3MRDMeWIqkSwGaKOmNswTbtBsaCl/HJyCG?=
 =?us-ascii?Q?pnmxz6JpWSfiojD6ZXcga9f+nKvgJT4r3EiLzR76O4l4tH1TtSHIo3gw6KDB?=
 =?us-ascii?Q?TNh/m7iV7nePB4jpfKpwDAwF/Gi6lvucnerwIuJb9w+t7ubuPAe9lO0OA8LQ?=
 =?us-ascii?Q?efJGsFPaDhn1LkRf3YnWTZCnDVc9ZCA0E1XGWk5z1A/aDqgfuDLGxnNUWH4f?=
 =?us-ascii?Q?ez08AeGvqP3rQ5G9xTjx+5ItHm2tyQkqTo0G2qjD8ojsmcb5yJUklWinZL6r?=
 =?us-ascii?Q?H6a6yzjMczWWyuK8I5lNdVw5kwnMMQAUJDNFSjTfz/GZRJj/SaQ6EYyOkrz2?=
 =?us-ascii?Q?jqEwHk6JGbdPElURvCjwlOPts1yj94BTtS84OijhanZum/RVlt1vIy9O3Uzi?=
 =?us-ascii?Q?sIrdQyLwp1gTvSQ1Bq6I33zIvDqBLPUd/Vgk0VHzL89H6iaB/bpOdzITGcIq?=
 =?us-ascii?Q?z7bxui1yvNI4S43Q7ZhXpaDkMP0fJd3t0NuV5YsCpPpi1AafrrDwiiLJrlDo?=
 =?us-ascii?Q?fufWgmOrNRo576UlxXodic5s5kuXVtQTBuYCcK/Wod1yPrPGX90WrKIIH/uE?=
 =?us-ascii?Q?v8WQTA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR0601MB2033.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1ffd7e-c100-4114-0fed-08d99d9698f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 00:20:38.4710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JoOcHamxhfTB/50ZAcOL92xY8G+6Ssub4mPnek0anGEpKauk5yC22pFdNijdKpq2pYYMpLPdxLzWmVeiJcMAnAK2IKUzAK47eh6IbOWN+2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2353
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

	Thanks for your comments.
	I got it.

	By Tommy

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, November 2, 2021 4:02 AM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org=
;
> linux-aspeed@lists.ozlabs.org; daniel@ffwll.ch; BMC-SW
> <BMC-SW@aspeedtech.com>; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; robh+dt@kernel.org; joel@jms.id.au;
> andrew@aj.id.au; airlied@linux.ie
> Subject: Re: [PATCH 4/4] dt-bindings: gpu: Add ASPEED GFX bindings docume=
nt
>=20
> On Mon, 01 Nov 2021 19:01:07 +0800, tommy-huang wrote:
> > Add ast2600-gfx description for gfx driver.
> >
> > Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> > ---
> >  Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
>=20
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.

