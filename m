Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FEA24B58
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B7310E2E7;
	Sat,  1 Feb 2025 18:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Q1Vodtig";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZlttZSdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6B10E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 18:50:13 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UH6iDX005785;
 Thu, 30 Jan 2025 18:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=gZOdrc5u2WAdPlM5+gBXXPAmZf4hZaYnZRgxGgNG8jg=; b=
 Q1VodtigXF1g9I9TJ1ozqhtqrEisC2XxfGrSXXLvkW77ZT0DkALr34fSZx2H1tnn
 E6xxfmrTPcL9UOX4O3K8BZnQ5zhqGzWXxBVp82qnCR7Lxlsc1t9VO4b1ZCroJBvq
 b//Jfr9ThYCe2sz9qlmkgtgDYiKXvD3gO4HLdc2PEraEYYj+g3O6WGCXDP3HdXdX
 A1TN8OsQdShxnNNCIFCks7cy2BMono9QEqfJw/+aiTmTvzcKRv28IHo99uaiqkzS
 F//m7hdc37wOINRGjCS1ZZGw9MJ3al897C//grIpuEwP97BC8UD40ESHbPMQH5WG
 JefoRHcieBPC5Sd+295kuQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gdher9wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 18:50:00 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50UHD6qu028276; Thu, 30 Jan 2025 18:49:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44g0vbfmdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 18:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tjk7j+rnA4SqKacBiMHDvVJtzBleOmiErcOU5Fa8R1fbYvmnf6e9HSCndsVOGbC6o7l5uUimPYOcSresSqjzccLAMywDdzy0NM+RIWxcF4HwUTT8M2A8eFyfxg52MKOHnpw0eP77MGE3+ZHySUJ6tJpAtnxPIcvLghyZ39sKttsHdEsMGJ5MlGK2azkRIrX2inh9X9C9InfdyPqnhGo35BB7SnVDfQQhPn83XclvL+SyNApMKYDWiV8xJko3I05ohugruh3O34P3JI/WHRFvY51zTtgmjffiR+MUfblvu9xmPXF3dhGSDCOCEw5IhGdGgw1JqJTx5Joi25xP8CPqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZOdrc5u2WAdPlM5+gBXXPAmZf4hZaYnZRgxGgNG8jg=;
 b=QNESvhsBHI0bq8uag8bYLzRyWeaazFRoY5n8oY8jLD/Ok6Xu69W2giVj3aWcZfdfiXrAh5cQ7JZIeC1WgoL6SNQa0gpPo190Eyz2QzUSpCSvjiAksEg5H3quHZvsqod2XV3/ElNGwSBa140fiBGPvrdEKLPRq3/jr8kOqVpO0KfdGwVAgVDIXzHE8YHr13HlhL0AT8qfuZEXAQA97RktdwDTiQ2zpiDat9uUw3yiaEXF+F8vP0+Auo1dbrqmtRAE/IE/CG6XnPoUU3rGzf4owviGXHVW2UXMFWsE20u99nbci785q4/tmE9BUWVKM+337x8kiz81ncQLtqUePLwBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZOdrc5u2WAdPlM5+gBXXPAmZf4hZaYnZRgxGgNG8jg=;
 b=ZlttZSdNoW9Yn4LMc/kO3zvzhplXTyFxs4rocTly58jP9nuN4iulB4+qMUMZ3QFjnzWwRpRAT8BLmr3ZYuXko4hLBlwqeCDbtOkD8ntLJe2AZUIHKhyIWeqHYc0E+dPSkPoznxvzHKGoDcWo8X4//bDRKliGLqPtd/o8JiI+HgU=
Received: from BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10)
 by LV3PR10MB7721.namprd10.prod.outlook.com (2603:10b6:408:1b7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 18:49:56 +0000
Received: from BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be]) by BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 18:49:56 +0000
From: Thomas Tai <thomas.tai@oracle.com>
To: "mhkelley58@gmail.com" <mhkelley58@gmail.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "javierm@redhat.com" <javierm@redhat.com>, Helge
 Deller <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwA
Date: Thu, 30 Jan 2025 18:49:56 +0000
Message-ID: <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
In-Reply-To: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BLAPR10MB5217:EE_|LV3PR10MB7721:EE_
x-ms-office365-filtering-correlation-id: 1788b4c4-d3d1-4cdb-a8ba-08dd415ee417
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018|7053199007|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sRKSQPpR/wwbda5QoEKP2w2Rp/+D2EaaXZD46TFLT4iwCOvRD++rXi1PfoM0?=
 =?us-ascii?Q?VGaYMQt01FDvQJTFwqAj3tEsW1h7bjwzMVKeuGsrKxc0iqnOTOoDz+LqEMqP?=
 =?us-ascii?Q?a5JHBM1cKRqUyTDYChnSIqmmJTQL2kI93WiNsAKHPpsEK6lW9j4T1tdB9o6j?=
 =?us-ascii?Q?H/vFrhtA7XuT/eXa2qJsrYABwM+qOz/iAXw9s9Vasbw8Iel5zoY6t7orW1Wh?=
 =?us-ascii?Q?WLVA9Ynt1k86j+52Mdo3JetOmTkMG+42dcp31gTIowTa/I9Ry0EgIr7WTjpC?=
 =?us-ascii?Q?cZX2uly9tKlWD+5i5cGIHr9GQqpbkScYgVxj8FzR0TKYQ0kUdMva/2npp7lv?=
 =?us-ascii?Q?V3F0WOoAjLGDzcZiKiVg2aFyIW3bbxlXZGV7amzL1ME5O5Nd+pbUqC861rEG?=
 =?us-ascii?Q?dJYp3LtBOPjdk0VA0aeFeU2hO4GWmvqnkRhpODpXCaCZOz6LbYiu9u2LsnML?=
 =?us-ascii?Q?hRNL0Irk0nqRRHsptg1OkYBqVP+rMm+xwG7w3NI4C2LK2IRe50mlh9AirKQ6?=
 =?us-ascii?Q?VoGJ/coEqvJalXZs9cei1IIXCLadVroesSBxBaIEYoWrhToHv514PXxqxPBM?=
 =?us-ascii?Q?HI/QhiRlgsxwmEz42UtRKmHGQ0rzGs973yOsZPlhDAvA8zlNDduzw1HDAun9?=
 =?us-ascii?Q?HP385lQAOKAUzi3M5jv+ZRMa9xFxEE/Y0OucRG08Acr6KGg/6vtK35CS+OQf?=
 =?us-ascii?Q?fun/Oy8uZvJvTED2uh8RTTvOefMfMPN4wVPvhkg/zNWcg/mHVwI6FF7nF0Nl?=
 =?us-ascii?Q?p/nUXBDJLtbPQO7cFOnfBcTa4zYFqKdqqymknxlnBV7bypm4GZjj6YWnag9b?=
 =?us-ascii?Q?rPRg3Y3WEZ14NBOLuIiq7TGVeCq9fqNpEFUZj1QUTqdoJ6rlyXlArTnsDKfX?=
 =?us-ascii?Q?hHzNgodh8mjpgKh207FzkaSJ0+g6OA7kY99+upRMWok3/i5VyHFZ05RuGW8C?=
 =?us-ascii?Q?iO72eiBeOavadLPdfMdzxH63J7t+fhOY4k4as12Mnzt35mXtfkQ7LrXftYIh?=
 =?us-ascii?Q?NrTdyEJZ+yLgieJjWDtKBQhvteRLN9++KTKoYbrkBai+zgmhLbsaI1InsWQS?=
 =?us-ascii?Q?n6AN1YTWVrhJ+TJCUh4gf6ZwjXeWIjHMJUC6hVyuQxzL0PzdpNyoaulkKel6?=
 =?us-ascii?Q?u76dMwaD8EP4BEvFB/U4O4bbVbHAE3Iv7KlErMBWYLzE2lCTHLm4LZH9olNd?=
 =?us-ascii?Q?grTr80/CItSnYd/or0hkHCLchn6oLSxLf2GYGbKfoGSTRceo+pqwHJnbFugP?=
 =?us-ascii?Q?SHTxodBC9j3juHG1+i8ujpYCeqqE/YCMzjS1O8u7AZUckKWfSEIZJ8md1Bvd?=
 =?us-ascii?Q?X0LYM64ZMwNlZduKPAlr8ZmMnp08M4GRtAXU0OurIKLkaNM+beTm3O3JHIh0?=
 =?us-ascii?Q?35SxESjgDMStrGGc6lPlz8u35IgTXGgipBvw/dTu+LHyBXO2vD2TVaVdVp3v?=
 =?us-ascii?Q?PMRnpIPqC3UAY7ik15DJcMtObOcGyRgzi14YbDWz7mgC61rewBdo9Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5217.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tDJj7rMNcWjvljiIaPV4z6bqYEgcXAtsKwBbfRJD8fw6bmQygJELeNrykPBb?=
 =?us-ascii?Q?VZv5YaO1dp4GK0YPdcok1533bQkpNIcsiTpzSqHuUMThziLLMag8jNGfzvAL?=
 =?us-ascii?Q?WQCPpfz8bam2P9U/4TAFatntC5FMC8ni+sD74PX9Qi2IjEF8jdlCXkmKoz2n?=
 =?us-ascii?Q?JQzXZ/qVAvnbmvyNjdjPd+VgZq0jY07GFut76E6ccg2GEUxeGMcdxne7kglZ?=
 =?us-ascii?Q?Z1R3NJbyQyc7u1yYB50MHrS415DO1WX7lvEmOWRlpvCuLcG6mtA3z5JWGP80?=
 =?us-ascii?Q?bTCBTchleIvh9RU+babFIRmaet2Lp739wOWYV5Ygptpo1azs7W7O7/z/kgrL?=
 =?us-ascii?Q?1tHWfpDbyqjBFf4z77ygUd3NFFxVKpqVl1UCceYJhJLyKK8LNuarRMsaG3Uy?=
 =?us-ascii?Q?nxse0kGd+P2IGtAm5hKjW+cAzTPQzg6WJjMYNrOabPRqntHgYgHCjaYBM8Jq?=
 =?us-ascii?Q?gbaU9zbo7KqaeIcAd+rNq4pBMY0fI/8toBJ+OXpeFuCY8y/buDF9hDow0C3O?=
 =?us-ascii?Q?CmBet6OtnLkx9rSHxjQn2GXslvwmVSKxWUMdEpGJX5DVlNtrQ7UC0k0QSnho?=
 =?us-ascii?Q?sUwxG1heqNP6+/pct0iN507IRc6R2lPoBT1DhwWRfKGzkBx/J7YLttQU9+La?=
 =?us-ascii?Q?7bj+WSO7h0u8goGI4Fv09es1VW3iu7fid8vasP1IQsvN3LQqYIDQ2EbaRCMA?=
 =?us-ascii?Q?/JITUtN/rASEulN0boi6UfxKB8GGqRs69QISnFktSGM5mJxopXUbULgS+5FW?=
 =?us-ascii?Q?iUKs6k9akzNhICF6+MJ1yd1PeKAf3OlNxrXSKP7lM4h13KZ2Xp54G9vymHur?=
 =?us-ascii?Q?u7Y0FYKxTLFRmamWxSmLOiOkFhqvkqkr1JupeA3f6q6Nvm5iocTD+rEDjkH1?=
 =?us-ascii?Q?tFr5MG7JkANihQeucW6E67JSr+DLiyavwEJDpH73dprmIwY88eqzroWCKIK0?=
 =?us-ascii?Q?jSU29xoYHKkURfaa2LQ9M2e7iQ3x2j8WC1gQYRnjbL5OXgUTdtwyNM2z8F5t?=
 =?us-ascii?Q?va6DGDgXODFU8oq7iiNuniMaXI/FKX1RKOlG4rZ8r9T0f7Cg4wQAbMtYUmgR?=
 =?us-ascii?Q?Jx68HoGT5C4NbOPevMjsnWxu1Owdvfgz2PRvzTAurBpf64oFXyIM8QMvd9Xc?=
 =?us-ascii?Q?PUt8a7LcY00P/PhiYpKihbzMc7Qwbw196Mf2R3ReXs8xmtjlYIOmEuxrk7me?=
 =?us-ascii?Q?nsq9WxS4VCIwdfmJBaUrdzckjToBmhGL5hR5yGajbQNf/sbgCME2m/+Gjflr?=
 =?us-ascii?Q?P+WIU3ZrfkDE4uDriMVfkXiFOGk3I6aVf+5kL5IV4cYjebz957ANN+0hS8Gv?=
 =?us-ascii?Q?MiPmneN5x3TGu66vJuUGnPak4SUHFgX120W7HUkpZfR5NNNEOtoaPHdyMdPS?=
 =?us-ascii?Q?JNvG8WlEjQc4+sLGXtFiyoiEg0t0skQvqS5mLkVABgwjWIA9hxpMFvFSYH2z?=
 =?us-ascii?Q?w44x6nAbaff3mMo+QVRx9m4AsnQU7CupZ8w/pjRYHb9PtDYTYUetRaxGOyOT?=
 =?us-ascii?Q?aDiM1T1bbsEQfzJrv/E9ge6GH2gg22UoX65tjhleqjbcGd4X3Ur2VtaFmCNC?=
 =?us-ascii?Q?bh0GQsMmo8lig/VE4U8E5OMwhePDO9NnwrQaD9Es?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MUjupM0hZQ1hiRVMtT2WtxNI0hu3yerGmuQEQpgH3Nuhqae64s4iXnBkh7rE9LuBJq+fE5dQ3wzDoYnlXzmuvgtHtfv64Vegk6YXUvprjH4U53d9O2CDJsozou3S1EQvrLm0AfjFbyqy2cQOJHJJwsMpBzayCNTSPDXbTAFjbz5iXBFrtn3gkCG1PePrMK3Q5BroJ2KEUMwOwCd9/chFZy35L0EnmkGUVNmv9O+6cVgrionE+Z2uKCqtkdaKwrZtaTCjDCNLMJhLvOHkhnN6Gde5+lWJOOglgAimE+ZoY5vM3ram/FXlLQTL7ZbXnYyMybkXBtkQXFSLZqXpIVqfGlc948/l1fZb5MkT7pW7udVdxYMnKGRd6lW04Q3NkK0r1kapV00AxlQNWTnN/yYfeBAv/IcO3PceBVEWj2li0Nx/FsLpzv3zSxCfzdXEHLiyBgx+om7G/dLfFlk+tgdsxwkt9dd3iEBdo3iZn07BS4x3v5XpXtgdKm+O/1CD+0FG9FnO+IKqpWmQfOmLZU9g0GIBLOPQKwkzPh3M2dn8hZU057W59C2UOfIISMLeeKqgtECzkfItWbc/9HUPDcXobjrGKN1r5z7OYDoF+HyVZ7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5217.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1788b4c4-d3d1-4cdb-a8ba-08dd415ee417
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 18:49:56.5838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p21t/MESTFtIXbQDA8TwWIAWpwcfhG6xwQHKINa3EExUTFwR3XlY08LCuyAGGfLh3362vaVUhehnGYKhLeKn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7721
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300143
X-Proofpoint-ORIG-GUID: 4NfFgJyjPKhWk4iHBfcLSmL1OsCtGS1S
X-Proofpoint-GUID: 4NfFgJyjPKhWk4iHBfcLSmL1OsCtGS1S
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:48 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Thomas Tai <thomas.tai@oracle.com>
> Sent: Thursday, January 30, 2025 1:37 PM
> To: mhkelley58@gmail.com; haiyangz@microsoft.com; wei.liu@kernel.org;
> decui@microsoft.com; drawat.floss@gmail.com; javierm@redhat.com; Helge
> Deller <deller@gmx.de>; daniel@ffwll.ch; airlied@gmail.com;
> tzimmermann@suse.de
> Cc: dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; Thomas Tai
> <thomas.tai@oracle.com>
> Subject: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
> executing kexec

Sorry for the typo in the subject title. It should have been 'hyperv_fb sof=
t lockup on Azure Gen2 VM when taking kdump or executing kexec'

Thomas

>=20
> Hi Michael,
>=20
> We see an issue with the mainline kernel on the Azure Gen 2 VM when
> trying to induce a kernel panic with sysrq commands. The VM would hang
> with soft lockup. A similar issue happens when executing kexec on the VM.
> This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs with bios
> boot are fine.
>=20
> git bisect identifies the issue is cased by the commit 20ee2ae8c5899
> ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()" ).
> However, reverting the commit would cause the frame buffer not to work
> on the Gen2 VM.
>=20
> Do you have any hints on what caused this issue?
>=20
> To reproduce the issue with kdump:
> - Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
> - echo 1 > /proc/sys/kernel/sysrq
> - echo c > /proc/sysrq-trigger
>=20
> To reproduce the issue with executing kexec:
> - Install mainline kernel on Azure Gen 2 VM and use kexec
> - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --command-
> line=3D"$( cat /proc/cmdline )"
> - sudo kexec -e
>=20
> Thank you,
> Thomas
>=20
> --- soft lockup log---
> [    1.690032] efifb: probing for efifb
> [    1.693989] efifb: framebuffer at 0x40000000, using 3072k, total 3072k
> [    1.700996] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
> [    1.706999] efifb: scrolling: redraw
> [    1.710981] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    1.716806] Console: switching to colour frame buffer device 128x48
> [   29.176649] watchdog: BUG: soft lockup - CPU#0 stuck for 26s!
> [swapper/0:1]
> [   29.176655] Modules linked in:
> [   29.176658] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0+ #=
1
> [   29.176661] Hardware name: Microsoft Corporation Virtual
> Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 03/08/2024
> [   29.176663] RIP: 0010:fast_imageblit.isra.0+0x2de/0x460
> [   29.176669] Code: 07 49 21 f1 41 83 e1 01 46 8b 4c 8c 40 44 89 09 41 8=
9 d1
> 4c 8d 79 08 41 c0 e9 06 49 21 f1 41 83 e1 03 46 8b 4c 8c 40 45 89 0e <41>=
 89
> d1 4c 8d 71 0c 41 c0 e9 05 49 21 f1 41 83 e1 07 46 8b 4c 8c
> [   29.176671] RSP: 0018:ffffc900000437a8 EFLAGS: 00010246
> [   29.176673] RAX: 0000000000000400 RBX: 0000000000000005 RCX:
> ffffc900006bb140
> [   29.176674] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
> ffff888012146600
> [   29.176675] RBP: 0000000000000080 R08: ffffc900006bb000 R09:
> 0000000000000000
> [   29.176676] R10: 0000000000000001 R11: ffff888012146580 R12:
> 0000000000001000
> [   29.176677] R13: ffff88801214658a R14: ffffc900006bb144 R15:
> ffffc900006bb148
> [   29.176678] FS:  0000000000000000(0000) GS:ffff888026a00000(0000)
> knlGS:0000000000000000
> [   29.176680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   29.176681] CR2: 00007f8bc160c238 CR3: 000000002ac38002 CR4:
> 00000000003706b0
> [   29.176683] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [   29.176684] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [   29.176685] Call Trace:
> [   29.176687]  <IRQ>
> [   29.176690]  ? watchdog_timer_fn+0x220/0x2a0
> [   29.176695]  ? __pfx_watchdog_timer_fn+0x10/0x10
> [   29.176697]  ? __hrtimer_run_queues+0x112/0x2b0
> [   29.176702]  ? hrtimer_interrupt+0x108/0x270
> [   29.176704]  ? sched_clock_cpu+0x60/0x1a0
> [   29.176708]  ? __sysvec_hyperv_stimer0+0x32/0x60
> [   29.176712]  ? sysvec_hyperv_stimer0+0x70/0x90
> [   29.176715]  </IRQ>
> [   29.176716]  <TASK>
> [   29.176716]  ? asm_sysvec_hyperv_stimer0+0x1a/0x20
> [   29.176722]  ? fast_imageblit.isra.0+0x2de/0x460
> [   29.176724]  cfb_imageblit+0x433/0x470
> [   29.176726]  bit_putcs+0x291/0x570
> [   29.176731]  ? __pfx_bit_putcs+0x10/0x10
> [   29.176733]  fbcon_putcs+0x139/0x1a0
> [   29.176735]  do_update_region+0xf1/0x110
> [   29.176740]  redraw_screen+0x22f/0x290
> [   29.176743]  do_bind_con_driver.isra.0+0x2ab/0x3d0
> [   29.176745]  do_take_over_console+0x3a/0x50
> [   29.176747]  do_fbcon_takeover+0x5c/0xe0
> [   29.176749]  fbcon_fb_registered+0x4f/0x70
> [   29.176751]  do_register_framebuffer+0x1bc/0x2a0
> [   29.176755]  devm_register_framebuffer+0x28/0x90
> [   29.176757]  efifb_probe+0x544/0x720
> [   29.176760]  platform_probe+0x43/0xb0
> [   29.176763]  really_probe+0xd9/0x390
> [   29.176767]  ? __pfx___device_attach_driver+0x10/0x10
> [   29.176769]  __driver_probe_device+0x78/0x160
> [   29.176771]  driver_probe_device+0x1e/0xa0
> [   29.176773]  __device_attach_driver+0x99/0x130
> [   29.176775]  bus_for_each_drv+0x98/0xf0
> [   29.176777]  __device_attach+0xbc/0x1f0
> [   29.176779]  bus_probe_device+0x8d/0xb0
> [   29.176781]  device_add+0x4f1/0x6e0
> [   29.176785]  platform_device_add+0xfa/0x260
> [   29.176787]  sysfb_init+0x109/0x120
> [   29.176791]  ? __pfx_sysfb_init+0x10/0x10
> [   29.176793]  do_one_initcall+0x5b/0x330
> [   29.176796]  do_initcalls+0xac/0x130
> [   29.176800]  kernel_init_freeable+0x134/0x1e0
> [   29.176802]  ? __pfx_kernel_init+0x10/0x10
> [   29.176806]  kernel_init+0x1a/0x1d0
> [   29.176808]  ret_from_fork+0x34/0x50
> [   29.176813]  ? __pfx_kernel_init+0x10/0x10
> [   29.176815]  ret_from_fork_asm+0x1a/0x30
> [   29.176819]  </TASK>
> [  432.306986] fb0: EFI VGA frame buffer device
