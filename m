Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3D58D426
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 09:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8A2C8A18;
	Tue,  9 Aug 2022 07:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9900C8A02
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 07:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGXiRMshTcSqiA2Zw9htQMcmb4I8Ckzc9YqELBDAJZ+EqY2IOt7fbOaLI7TAJ2NEIEKI1adCYORmZwn9J5+2hSw9yfQKK3TnNhVmSEmZ0g9DSNuvPSbiFoXsg0YNTb6xPY9jrHWkWn1OOKNU9/ZpkpJy+WxQ+zPWYuXa1+qPnVb7n8jeaNwo/GYJS7cAjyUNpVdyJgRq0RzUjC4/CXJPo9cZyQT5j9subtgXu8wsDc+GnES+7WyE1l8POgospknWKOicTPgShiqixpeKbItTLox1JYXK1NUKrZU55xmB1CVlY2NKOJYZNxPtd5VSpkIrntLGzXCuURTOKKjb0zyX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPMIV8kxt42N7lw7kOOwVK613/ek4jXsvi460jFtmeI=;
 b=i5leLGJxnIKFcuymHKSxc0In6O2DHxvTSkClW0QvID2S91NYHqdsjq/U4MhGyFuelAWSWjheXts6s4W0iqiwffDFpg6JZ9CgEvCVYuIKf6wrTbv22d8EPj3019AOkEv1epa5D2qrWe4bzlUiW0pIvwq7Vy+68ufBppjvKTVn5cz7l7/HSeJfVena0ZHvNwDDDFxyd/kaGf8zJCWyvopJmU2VtpyKOS1gGhqczi5PmotbAPcXDWnj26xUlVDQSUxbLB8BQ+2P5w8bc29bCCdwhS6vcS4skrI6qbxcHlFmUdrCODaV2SFfjkXUotszH4NroiKeaqPEvfjth0pzARGzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPMIV8kxt42N7lw7kOOwVK613/ek4jXsvi460jFtmeI=;
 b=hmWfN/KoHRi/SlUoins8OY4wm2z7INsQ/zv//71rbCSTyU54M1QA8hTT42OI8e5CiVTJ1RNLsNFwkwDALwJJn72eF+r3W58XZWhpvQHbH28lkhYfNPG1wH5+ImYBfolIlaXbbs0iixHmnCd1M4eHm87PK5OeFQs5GqlM0II+cvo=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 07:01:41 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9%5]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 07:01:41 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 2/3] dt-bindings: reserved-memory: add
 linaro,secure-heap
Thread-Topic: [EXT] Re: [PATCH 2/3] dt-bindings: reserved-memory: add
 linaro,secure-heap
Thread-Index: AQHYqNLEnjJonunwF0WOKfYz9B6iK62gc2IAgAW2aIA=
Date: Tue, 9 Aug 2022 07:01:41 +0000
Message-ID: <79c6672afa8aa7ebc1c56be6dc87641bccf6690f.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-3-olivier.masse@nxp.com>
 <20220805154624.qhrao5p3gwywl3xr@000377403353>
In-Reply-To: <20220805154624.qhrao5p3gwywl3xr@000377403353>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25dec40f-030d-488b-2c45-08da79d5033f
x-ms-traffictypediagnostic: PAXPR04MB9155:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fg1Mn95vOQRIcexMHhd8Du6OXhoonUXE41e5kjH3WDFDvPbMcXM/X9KGVE7FJ7VaOj4Ygu4FKJAGKmN5d5KjEIWJZVGaQVNwjJ8QmOGZAT3u0ij3caT8XCtMEuyU77eB8iwstHbt4/4rVb6mU4+F6opVmmA4vU2m3Ixut+aBA1LgVhEbfSBBM5DUbeiwZXRWa3BBajTNsWi9ybirXqQiB1UeEZkzPNUCNqaq0qJhYMIkKEzDUMkl2BAS1DkJ4Juirsy0uNHAfkRgMUvuAgFWXKFJJVNXQSW3RtDG3LRSCLeDT9nNpigvwkawbqwQLPfFheVqXEMwYNkH66XUA38JdMcEoOQ9HP9BGSVmnB3LLPbEXnviydWCYKQqJCekgdLFS3kiZAXeSkrsXrqG3CKB6gaRoukuoWhgoGQnYRPamN+QdOnZ3lfElf3TxwmYJg5jHzZolJ5RqkgWHyGd8XzpG8xu606O6MY4Z3QQQ3o2vk7hOSDC/DHyyBhkQgbrwiG+4i9L7kRVV2ZFDwpiqbdNQEs4FJ7XHXvPYjHc9uFKgEkGeM/eQqzxK5QnYqRUzZrNuvkQCYK+XXaA3ixEojbr6QZDz47i8navtXBEZC04FjAoqbbL1DJIXzIS7ZjFMoa01scwfs3WQQ6zhZgjKyNqFtQltsSMShHBNVxoVJiR7gfbxzbIaWpntIZB2pFkVB+OlILxHNitIMhxwe7Uta78zc15XNS22rx53Ph3tmM/bxjrhEQGVFzynHgor2KUjHd1pk/XCErN9/sx6Nob5fVM+Qwi4+Xl57fS2R3TKqNjXf1ebspPI7A6BeieZ+P2dgJv4PCcdJybx72lwzODjwUcemG51TEUx5JK56F5yED7AZCjKX/ExpfZWFVTktYXG1QAww0pv7Ivy9OCViFrWLShlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(71200400001)(36756003)(6506007)(478600001)(41300700001)(45080400002)(6486002)(966005)(38070700005)(86362001)(6512007)(83380400001)(2616005)(26005)(186003)(54906003)(316002)(66556008)(66476007)(66446008)(66946007)(76116006)(91956017)(64756008)(4326008)(8676002)(44832011)(2906002)(8936002)(7416002)(5660300002)(6916009)(122000001)(38100700002)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?JGnTliOtt8KpinXP4ZvT1O2PjJbwGhuA02YiJh5CXiCQyiB2RIYs6L8pl?=
 =?iso-8859-15?Q?AXFzrAtp8HrRjMncIPFgQ58h0n1gEzDK+ki+cTW+d7YofDhl5sNFWcjZA?=
 =?iso-8859-15?Q?/nbk1HPIWAI7xi1R4Z/HXHS3WpJSRI/ctwxEcKcdqCdlqjBIaG4SbMu0V?=
 =?iso-8859-15?Q?jAOaPDINVua9i2Ej6aCvXIc5k924+WaGiDcf3d1jsQizdDxF8SLhzPlqQ?=
 =?iso-8859-15?Q?h4Epu5MQviRwVCra0LUeKWayH9EASuhCeP23JqFJMRnOVniML+DscdQIk?=
 =?iso-8859-15?Q?sgQWnfCCUCynQM8g4sji94ObLnbgjoZegFzGPwXLqUFmDWKY1A11yhz39?=
 =?iso-8859-15?Q?z+X75RB3zUsZ8+4LWw2D+jZrKsEgUUqjk/NFlEcnHeHf76t7ZEsIkBk3E?=
 =?iso-8859-15?Q?/fO3piN+RPf8rog0LhnSKqqaJhM0Nflb/3hqy8txdA2vS5o+OYk9VNcqr?=
 =?iso-8859-15?Q?udH/Ie2yhgdOUBLy23uNLxlVNUOylvzTtRWiwLoj2C2Oe2mwj9BLyjYMQ?=
 =?iso-8859-15?Q?dzZnU77GLyLkJXQR9J3Qfxp/Y/vforgcm5K83K3w98kSAJQ7wWpR00j84?=
 =?iso-8859-15?Q?aJeeh20f/kZjRwwRsfSl16O0OjKkehXA2bH4pbnzV9mjwTLhkxXwHD9oe?=
 =?iso-8859-15?Q?JrGM3TPxtFReT75iYVcNsSf28PPX5vn3f2Vf/Gk2UtlmFZwMuBThSK1Zh?=
 =?iso-8859-15?Q?WySvAyk9fpSyzqbNGxEEUApufh0MSCbGepTPBI4v4H3Fh7j6PyUzGa7nM?=
 =?iso-8859-15?Q?6G4xPpNxDKTmmmO/KtyaCZegPy268KOZXZJVPtb41ZlLY8RvZShBAec4H?=
 =?iso-8859-15?Q?TW+llz3PK575BHPB4CbnRCiMH91Y6+KKS/LCBRrd9kqaHEUbDaZmjWUo6?=
 =?iso-8859-15?Q?mVBe0jaO2CizTrcDb7IB1O+C3o1L5jPpynYXzkkRsBNFdspE7/mmh4/uq?=
 =?iso-8859-15?Q?HHUNihx6tO58pgirnNYB8nCKd3NKyiIRtuol+hhIXQNUNqm83aDoWmpOc?=
 =?iso-8859-15?Q?PkvcdDszcv67jlOdPmOYl2yNf3EoMuXpyWFBE6tEDa8EckNuSCiuVmpXG?=
 =?iso-8859-15?Q?nuvHB96fFXP/0+BJUYz90yEy8YgzWynsaxLd4foIZDgliHhEHHvujwWbE?=
 =?iso-8859-15?Q?JXn1tg99JKp6wuJs9YLeGvmYSsuBQsQd8e4F6k+fqhFkbpmIzaHp2Hp2w?=
 =?iso-8859-15?Q?M+97fgO9CB61fI44Y+TSTMfsJ821/yDjStpB0280pVnZ4vLWfRtx7YcP+?=
 =?iso-8859-15?Q?VcGrxrasArKJzinAqhvzizl6aAwxc29NhOEfSvR9KXzDX/6tR2JaC9yFN?=
 =?iso-8859-15?Q?PVUnBUHji6gLdsegREVEkp3oU2s65R32F/eYbBR+6eZW4dQLtX9egQOb2?=
 =?iso-8859-15?Q?kqPffvFXiZqkkVQ4s1cp/KkvbKDrA5rSl6Ol7KNVl81eJZzJ30RRltHaw?=
 =?iso-8859-15?Q?2fCsIfmho+RtDd38h7d+aYzIgCE4qm1K6jBkwjLaStgewe3QdjOV+qYU5?=
 =?iso-8859-15?Q?sIgjdvc+6MUCd6jqP3GRIPNxRg58cum95w1ke69zDaVjHTJb8UaFJDObO?=
 =?iso-8859-15?Q?8z/SoiLoqBOM8pUNQxPbpmPtXldHBtS9Vy6XWxhODxXuV2N+BLr4BhS3T?=
 =?iso-8859-15?Q?k1gXAc887vbT7jNh7mglIuV/616QqteAXjSYeku1TC7G3rL980S8Lae4Q?=
 =?iso-8859-15?Q?3M5e?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <2290B54D7EA71D4A89DD95AED9E54C0E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dec40f-030d-488b-2c45-08da79d5033f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 07:01:41.5500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lmgv20HjL4BCOKSTXq5ThcUKaoGtd1q7DH11+NVybvQzhEHqID7y5N4YkjeDwBd0kjNpk3ckpCWZPFIOjFKyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155
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
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

It was part of a discussion during a Devicetree evolution meeting with
Bill Mills from Linaro.

I've done some modification to OPTEE OS and OPTEE TEST to support dma
buf:
OPTEE OS
https://github.com/OP-TEE/optee_os/commit/eb108a04369fbfaf60c03c0e00bbe9489=
a761c69
https://github.com/OP-TEE/optee_os/commit/513b0748d46e7eefa17dadb204289e49d=
c17f854

OPTEE TEST
https://github.com/OP-TEE/optee_test/commit/da5282a011b40621a2cf7a296c11a35=
c833ed91b

BR / Olivier

On ven., 2022-08-05 at 16:46 +0100, Brian Starkey wrote:
> Caution: EXT Email
>=20
> +Rob and devicetree list.
>=20
> I don't know if this should be "linaro" or something more generic,
> and also where previous discussions got to about DMA heaps in DT.
>=20
> Cheers,
> -Brian
>=20
> On Fri, Aug 05, 2022 at 03:53:29PM +0200, Olivier Masse wrote:
> > DMABUF Reserved memory definition for OP-TEE SDP feaure.
> >=20
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > ---
> >  .../reserved-memory/linaro,secure-heap.yaml   | 56
> > +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-
> > memory/linaro,secure-heap.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/reserved-
> > memory/linaro,secure-heap.yaml
> > b/Documentation/devicetree/bindings/reserved-memory/linaro,secure-
> > heap.yaml
> > new file mode 100644
> > index 000000000000..80522a4e2989
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-
> > memory/linaro,secure-heap.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:=20
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi=
cetree.org%2Fschemas%2Freserved-memory%2Flinaro%2Csecure-heap.yaml%23&amp;d=
ata=3D05%7C01%7Colivier.masse%40nxp.com%7C0a9e67bbd65446aa05e408da76f9b82a%=
7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637953112157450452%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000%7C%7C%7C&amp;sdata=3Dlb9U8Fnt1Y43UgObcgakAC%2FZx4je%2BCoNX5vhkF=
vgbdQ%3D&amp;reserved=3D0
> > +$schema:=20
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevi=
cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D05%7C01%7Colivier.masse=
%40nxp.com%7C0a9e67bbd65446aa05e408da76f9b82a%7C686ea1d3bc2b4c6fa92cd99c5c3=
01635%7C0%7C0%7C637953112157450452%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdat=
a=3DUVuVI%2FmUFj7jX7c6DY0rRi9lkZW7kqTJyQurQxvNvz8%3D&amp;reserved=3D0
> > +
> > +title: Linaro Secure DMABUF Heap
> > +
> > +maintainers:
> > +  - Olivier Masse <olivier.masse@nxp.com>
> > +
> > +description:
> > +  Linaro OP-TEE firmware needs a reserved memory for the
> > +  Secure Data Path feature (aka SDP).
> > +  The purpose is to provide a secure memory heap which allow
> > +  non-secure OS to allocate/free secure buffers.
> > +  The TEE is reponsible for protecting the SDP memory buffers.
> > +  TEE Trusted Application can access secure memory references
> > +  provided as parameters (DMABUF file descriptor).
> > +
> > +allOf:
> > +  - $ref: "reserved-memory.yaml"
> > +
> > +properties:
> > +  compatible:
> > +    const: linaro,secure-heap
> > +
> > +  reg:
> > +    description:
> > +      Region of memory reserved for OP-TEE SDP feature
> > +
> > +  no-map:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Avoid creating a virtual mapping of the region as part of
> > the OS'
> > +      standard mapping of system memory.
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - no-map
> > +
> > +examples:
> > +  - |
> > +  reserved-memory {
> > +    #address-cells =3D <2>;
> > +    #size-cells =3D <2>;
> > +
> > +    sdp@3e800000 {
> > +      compatible =3D "linaro,secure-heap";
> > +      no-map;
> > +      reg =3D <0 0x3E800000 0 0x00400000>;
> > +    };
> > +  };
> > --
> > 2.25.0
> >=20
