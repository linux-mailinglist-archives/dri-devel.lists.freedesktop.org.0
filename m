Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0728919905
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 22:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0215210E0F5;
	Wed, 26 Jun 2024 20:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=buckeyemail.osu.edu header.i=@buckeyemail.osu.edu header.b="NUovKUxW";
	dkim=pass (1024-bit key; unprotected) header.d=buckeyemail.osu.edu header.i=@buckeyemail.osu.edu header.b="TOhNlpre";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-002cfd01.pphosted.com (mx0a-002cfd01.pphosted.com
 [148.163.151.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6561210E937
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:02:56 +0000 (UTC)
Received: from pps.filterd (m0300657.ppops.net [127.0.0.1])
 by mx0a-002cfd01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q912bd002684;
 Wed, 26 Jun 2024 12:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 buckeyemail.osu.edu; h=from:to:cc:subject:date:message-id
 :references:in-reply-to:content-type:content-transfer-encoding
 :mime-version; s=pps1; bh=yglm3tNvaw1uc440ms6bKLnRvZ+8WtclWCRQ4L
 JkP7I=; b=NUovKUxWZ86u9blp7lZezxrHfvfmV3Upd0ShoQ9MQmFH4v0pwiFxP9
 OTOiKe40rIjN3WYFgwPqvhk0qxIYukKuqzKgPDxzHOF0PftMVFWYTL9Y5FHlZA8n
 0cVHnggG3/Kg7D1YDs8/mwGQAOH4qGaOivc7lEK6KTJj1Tkl68X/iht/ev+FTFEw
 KKHEhlpYMzjqAdn7qycJsHTokAmibQ5u0204XxJvQK3vGzdJeXUJTO+q6cMORttZ
 hBnlyUUX0uw/bY5y0gD9xBsjIecTItNneGhhbfR3Q2ihtc1oY1Y9XzWuHju0uajR
 ODhavYbGbJXykqHHO5HA35Sgo7K70aHQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-002cfd01.pphosted.com (PPS) with ESMTPS id 4004ckdfhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 12:02:32 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg+g8j8gJ9qQvFUl1TQ7XfNGPx5Ph9yF9iyS8sB52/oiHEIYyRNh3cMSa1cGHqFmF29vS3R+ivMjHhn+gH0tZ0bfQdepyRdXdze0+D+d2XBHy8L6TyCmbZoTz7hxDL2R4bxI5/Kp6ZUoas+iHxEdfCcNPqcXev15+6yNvRHkf4lDYrXpHDxK5vCrzNpcRnkwaQRg82VUzDqoazVjPxNC8Xcrei00NvezAmBQvWmSTxOGl0RAhaD+AejVqwPsUULd/DGbSWIuamQ9MS5oJuTLoWfAeTNOlne+02xOncvxJz2grsSe0lue8YKubX4lo4tvbiN5kuRUxoOWJSTn6Kr0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yglm3tNvaw1uc440ms6bKLnRvZ+8WtclWCRQ4LJkP7I=;
 b=XTbsMdpdj4z9bxPt2nm3pCcpPOp3H8/yursfKIFFRDc7GTYnV0ImbkBNTXhr42X/r/GUsZYP7H31i30Bvse/B/BElcsrOfz63CRx5BWqTxC+2T1xSr4pWVUJpJxzEcQ4y58887j1jC0miA9hD2yz39owoZ/fnbu9gHRdEvCIM2Tmr7dKq4MWhnzdL6qdDltYMQymDYuf7HpgdwPTEV17HwyeW9xZUS4lnTg7gj3yOCo4m9ixmFr99t5qyywikBQosFo6Ho+zdY1NO8mNpJBkTcrd5zLAHJ0IHoKBLj0frbaLUcKcCRoKyGuH+6Z6eqT3MUviyVqGIRYX0KV5jtt4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=buckeyemail.osu.edu; dmarc=pass action=none
 header.from=buckeyemail.osu.edu; dkim=pass header.d=buckeyemail.osu.edu;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buckeyemail.osu.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yglm3tNvaw1uc440ms6bKLnRvZ+8WtclWCRQ4LJkP7I=;
 b=TOhNlpreQ0tjv4lk1pZVqAXwiBaB6b2z+PLH8bVdg8B3Kl0imAvdCXgIaG7uOWtqRcdXAS0rp0QQmM/ifBOjW7t4KKYzglZvBtCSYO6Qlp1BgK9kUvAe8XDmjfjZFlSdS5DiXJ/daRMvN1s39QWK3wc2R1QrKSKsX7vDCkSo3pM=
Received: from DM6PR01MB5804.prod.exchangelabs.com (2603:10b6:5:1da::13) by
 BY3PR01MB6626.prod.exchangelabs.com (2603:10b6:a03:360::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Wed, 26 Jun 2024 16:02:30 +0000
Received: from DM6PR01MB5804.prod.exchangelabs.com
 ([fe80::acf3:583e:e776:4462]) by DM6PR01MB5804.prod.exchangelabs.com
 ([fe80::acf3:583e:e776:4462%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:02:29 +0000
From: "Pafford, Robert J." <pafford.9@buckeyemail.osu.edu>
To: Frank Oltmanns <frank@oltmanns.dev>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum
 rate
Thread-Topic: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
Thread-Index: AQHavqzpBgj5D7bkhkG8vcHmuBIAebHH7mBAgAjhLiCACXU+bQ==
Date: Wed, 26 Jun 2024 16:02:29 +0000
Message-ID: <DM6PR01MB58043A518B836D1CC3509554F7D62@DM6PR01MB5804.prod.exchangelabs.com>
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <DM6PR01MB58047C810DDD5D0AE397CADFF7C22@DM6PR01MB5804.prod.exchangelabs.com>
 <87wmmjfxcj.fsf@oltmanns.dev>
In-Reply-To: <87wmmjfxcj.fsf@oltmanns.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR01MB5804:EE_|BY3PR01MB6626:EE_
x-ms-office365-filtering-correlation-id: fdeb25fe-4d0a-4fbd-bac8-08dc95f9617f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230038|366014|1800799022|7416012|376012|38070700016; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1gUzkqdPOrrqR0MEb2xoND+iwIiYA9rATEqAlZ2GU2eIc3+SqiDFsej25d?=
 =?iso-8859-1?Q?4hNTbrsA4PB08FsY+BAt4TrQ7ke/p9rxKW87BDzz3esluv0QGsqBVME9BJ?=
 =?iso-8859-1?Q?YPSnvMoGJpdBud+2UX9tnpqjonvZDPta1faXU9HuviuaGtCJOwxy4Bj44h?=
 =?iso-8859-1?Q?ILHMnC2j7ihc/Q1gKRxl6MgwHnwtucGbkQL0OFKQwwTpb2/LnoshowJ7C3?=
 =?iso-8859-1?Q?RwTjvACCnH7beeDmea5qmn7tfxiIyiTSATPucasibLzD+2kPlr6wgLK7FU?=
 =?iso-8859-1?Q?CdKNkRBYWYcEWQwpFAeeFMiR0ocwcY62EOBfX8geO6zUOtw04f+MmsbTCm?=
 =?iso-8859-1?Q?D/YdUY6SgAXnWXzeTjNlLWV0MbSfZiPqzDJknV0qyfxHKVmE5BhBdP4LaS?=
 =?iso-8859-1?Q?EfuDYzPQJyLYNR3+yep4sJq4NNWR9A6hD9OH3vrLN7nuY2JFf75T6jgSIS?=
 =?iso-8859-1?Q?eW4kfk3pE9GbU7jFNoK6jO/QszG10Avma9/PrcUH0hCaCfW7AzP4P5RfT/?=
 =?iso-8859-1?Q?WWD67CXqUaXp6auW8mS4K6QwzzBvVH9ggVlFuZoUE8k+yvZQ43ETyhsfSH?=
 =?iso-8859-1?Q?6Y1MqawsmNGUMnEnIWMkAhWpVVmBSxKEjwFewZUGY+jYKINGYissM9eaaS?=
 =?iso-8859-1?Q?lc8mEVFiSKM4mVVxg4MVeOdm5L/gwd9wSF0iBvBar0LHGnpB4or3IpCWoq?=
 =?iso-8859-1?Q?snpbE1UXeYBO5TSM5EOpa7cz5nG2RA1oB0otrvK9dQ9ZUeUQdOYhKH0QKc?=
 =?iso-8859-1?Q?TmM4guHoGRpQTS9EMn8hCBjcMk+VBBHlXe6HK1n/orYQcfXV2V2RjRahzT?=
 =?iso-8859-1?Q?oKvGRnJzk13BQc+mGQCp/FV9i8rovvkfIZIDPYqDqmpkvlAH6wTb39MyZh?=
 =?iso-8859-1?Q?8tnQa1WOd0aut3c2qT+xWZDEdVVw/JeaJ9vECMIAtossbnaZ3HdLY6bmHj?=
 =?iso-8859-1?Q?XQPpPJkM7a2iFhXrBmwPjxwktY5SFEe9I4/03V1X8YQxE0iQrNtl0MJAPU?=
 =?iso-8859-1?Q?BrLNt+sSY3V3rP0X7/Cvz7a3CKgAoSczfRokWxt5/vUIlDjoQLhkagITJI?=
 =?iso-8859-1?Q?lnbB7QGBW+THsYhoxgWhBGRmZ5dF3+4l1ONHVnT8CQgK95JACWcgy9fiQx?=
 =?iso-8859-1?Q?9KPy0b8M0aBA8JqBv/f72RqUcj/jiwJNCzjFzcgf2PQHzhGCpi/5vFLPu7?=
 =?iso-8859-1?Q?+vleP6nfAPQ/nf5HkZ3cO/zPQR3p9ZeBmwxEwi2/p/H/1hf9nzcEbi8uYW?=
 =?iso-8859-1?Q?wvsPSeFwRDEQ7u/+91AP/4O33YFSe5SglJTlEEI1AtrpHBnpzN14F7GzZd?=
 =?iso-8859-1?Q?uuk5iAVPN6F5Q8tUvFg6t1Z8ZDx/b30i60Y4bSf+sVkktD2WzlFOkOkBjq?=
 =?iso-8859-1?Q?u9X7YgBTl8Y3dUX4fbVgL16S4Fn3OUfSb81jNm6QBiNEwYZ1Mky3w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5804.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(1800799022)(7416012)(376012)(38070700016); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LQUHpqb5+M67pirOLzEw5ZtTttaZqdXOcQjuTEgDBsoK+VINve14fgSHMl?=
 =?iso-8859-1?Q?/Sa/P7hDphuoZEUkL+ifY48QcNCCp/6PmNXmPRW79kzml6uSfjZ5o6l6ot?=
 =?iso-8859-1?Q?2R9Z8iTaHtEDbfBCsvnEROmcrXGiQ2xxiVzVY4gTkOwYZGTG6C5ggXmL/Y?=
 =?iso-8859-1?Q?UKZ6z9YCrvbMHRYNXSa9CoJBUWbZi95pcXo0EpRLEieKLOw0sI7nqtH6Lk?=
 =?iso-8859-1?Q?dYKSvn5T4D3pWhtvxwgNbU40b0iJAyxF1umJb59UCB0IdIPDJzhVusacw4?=
 =?iso-8859-1?Q?v/d5oXbMmalIKNWYD58fyBra76iDYZnuWCATCmfoESQ0Cc8QKC8Svjdlmm?=
 =?iso-8859-1?Q?/LhotAe7zQE+t6G6GpRXPR0b4Fletwv3lrqoMz1ouRqE+qpPCZ28OJD5rC?=
 =?iso-8859-1?Q?yq4LmIFHrOIWcrlmW3Wrq1n5ul4NjERzXbq5M3dU14lkqQQbdVuvNSEW0j?=
 =?iso-8859-1?Q?KFw/+0UpTxPHCvHLV+j0IoC9s785Yv5VfK+fSNp/39nOKG6P+IweITr6Fi?=
 =?iso-8859-1?Q?8fROOJf7RF0Wynj8OiXKuw5UoY4g444HSROgk7NAH6CtogRCcAsrIOYX6L?=
 =?iso-8859-1?Q?kgbNJ/xk1mki825Whs+aKAXPp1jQDdGhCWOwLtfDivmfWuyns1Q5cdP+QQ?=
 =?iso-8859-1?Q?RVFvx5SYtconuM716PN4hDME+gpYOswAY1HaGLe83Wbs1GQwyVc6r0aFhA?=
 =?iso-8859-1?Q?OResQs54pP8lMecWet1I5RXRYoGBPYUZK3oLOA6gX+oGRpGm3TqYMTND9B?=
 =?iso-8859-1?Q?NtNJfMNSqlaIa5JRiWKXcc8ry+xfNI7LwTZ94FIdWavbaO1qbQvfmCPfdg?=
 =?iso-8859-1?Q?qxIzgeXX1lSu84aSX8Vn+nRTOzRvbtVblyYFf6KB6oPF75Wb0vlAL9l+rg?=
 =?iso-8859-1?Q?gWQLutbOnB1Qdpx29y/F55S2vsL30GhFPn0qdNG/oqjKoI6JzB8rDgkxei?=
 =?iso-8859-1?Q?rKDB/aGjCBgdmI/XJEfFl9826otSzh+6ZlmWObBm7Vz0rXtJ2tB3NijIp5?=
 =?iso-8859-1?Q?Dj1t769uejn0TisSyJEelSluX+r6h+coDRtaF1FromC4bfPsVg6tkiIwtc?=
 =?iso-8859-1?Q?RR5LJ4//idQKpnegtG39mPmN6Ah1b6m//6d5S6sWBf/9eh6TbNIdExzY0s?=
 =?iso-8859-1?Q?7cGrRyyw1/RsgPSYrAgSfTC6uAeTuE19BFtUNim8TRaSsd7oRGmcrPXhzc?=
 =?iso-8859-1?Q?BGOaCxcqm4sZRgUA6IpF6vJYeIHlCMxHL/65RzphpUF/pXqsGaE2BCvQad?=
 =?iso-8859-1?Q?Eh+sFKTEPXUCbK2znvjSCOPsaCIR2TWOOH6zBShglOB7YWZC6DWJeIvryy?=
 =?iso-8859-1?Q?NRxrsF7XuncLXjy/8GwxHg7BGaO4XxeWtES+tX6IgcjLH0I1TfUBxjtPYN?=
 =?iso-8859-1?Q?rfCt12dJS23ydBXvgjEc2bLJGJZTypdBP8WbJ0v5KC1E3X1gBIhOxQNv0W?=
 =?iso-8859-1?Q?+YH+3SwhV/tZFQGwu2Cykx2kLWkqQVTE9uf2NP8hqXZoCJrTErdbR9kxcC?=
 =?iso-8859-1?Q?a8Aj8cKns52LWMiR8zl45tsvAh5CR0/Zi14jd470tdJ1Tr9kAOigppLVuQ?=
 =?iso-8859-1?Q?tUtfXoELEh7y/2PFlwiVmCY1rWFF+V01bprOikJLiu05iyzPYXJNEc1DqB?=
 =?iso-8859-1?Q?vU4jHMBCLi7Gg6c10GlwDwin1XVsIG5l23OcNQay0nYa+aeYa1z6BWTJbH?=
 =?iso-8859-1?Q?orLjY/074TGTvlj3uDh6kGFM0XYXl65pdCL5rfiA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: buckeyemail.osu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5804.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdeb25fe-4d0a-4fbd-bac8-08dc95f9617f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 16:02:29.4449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb095636-1052-4895-952b-1ff9df1d1121
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/pRC1thL90hndhoWthROvJY7nC7ua+cz2zFfOSbMWL9BnqpFSbGpD5c3vrhPo8WDEx5XyJSWFjN0c6EwQpqf62qH21rp+sm10vKqov2F0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6626
X-Proofpoint-GUID: H_GwHnlH67Z8Z5f7GAzFMG1QGXZbjCGl
X-Proofpoint-ORIG-GUID: H_GwHnlH67Z8Z5f7GAzFMG1QGXZbjCGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260117
X-Mailman-Approved-At: Wed, 26 Jun 2024 20:26:44 +0000
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

Hi Frank,=0A=
=0A=
Moving to a new for loop makes sense. Let me know when you have a patch=0A=
and I'll be glad to test it on my board. I do also wonder if this may=0A=
have contributed to some of the HDMI issues seen in the other thread.=0A=
=0A=
Best,=0A=
Robert=0A=
=0A=
> Hi Robert,=0A=
>=0A=
> I'm truly sorry for the trouble the patch has caused you and for my late=
=0A=
> reply!=0A=
>=0A=
> On 2024-06-14 at 23:52:08 +0000, "Pafford, Robert J." <pafford.9@buckeyem=
ail.osu.edu> wrote:=0A=
>>> The Allwinner SoC's typically have an upper and lower limit for their=
=0A=
>>> clocks' rates. Up until now, support for that has been implemented=0A=
>>> separately for each clock type.=0A=
>>>=0A=
>>> Implement that functionality in the sunxi-ng's common part making use o=
f=0A=
>>> the CCF rate liming capabilities, so that it is available for all clock=
=0A=
>>> types.=0A=
>>>=0A=
>>> Suggested-by: Maxime Ripard <mripard@kernel.org>=0A=
>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>=0A=
>>> Cc: stable@vger.kernel.org=0A=
>>> ---=0A=
>>>=A0 drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++=0A=
>>>=A0 drivers/clk/sunxi-ng/ccu_common.h |=A0 3 +++=0A=
>>>=A0 2 files changed, 22 insertions(+)=0A=
>>=0A=
>> This patch appears to cause a buffer under-read bug due to the call to '=
hw_to_ccu_common', which assumes all entries=0A=
>> in the desc->hw_clocks->hws array are contained in ccu_common structs.=
=0A=
>>=0A=
>> However, not all clocks in the array are contained in ccu_common structs=
. For example, as part=0A=
>> of the "sun20i-d1-ccu" driver, the "pll-video0" clock holds the 'clk_hw'=
 struct inside of a 'clk_fixed_factor' struct,=0A=
>> as it is a fixed factor clock based on the "pll-video0-4x" clock, create=
d with the CLK_FIXED_FACTOR_HWS macro.=0A=
>> This results in undefined behavior as the hw_to_ccu_common returns an in=
valid pointer referencing memory before the=0A=
>> 'clk_fixed_factor' struct.=0A=
>>=0A=
>=0A=
> Great catch! At first glance, it seems to me that calling=0A=
> clk_hw_set_rate_range() in sunxi_ccu_probe() should not have happenend=0A=
> in the loop that iterates over the hw_clks.=0A=
> =0A=
> Instead we should add one more loop that iterates over the ccu_clks.=0A=
> Note, that there is already one such loop but, unfortunately, we can't=0A=
> use that as it happens before the hw_clks loop and we can only call=0A=
> clk_hw_set_rate_range() after the hw_clk has been registered.=0A=
> =0A=
> Hence, I propose to move the offending code to a new loop:=0A=
> =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < desc->num_ccu_clks; i++) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ccu_common *cclk =3D=
 desc->ccu_clks[i];=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!cclk)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 con=
tinue;=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cclk->max_rate)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clk=
_hw_set_rate_range(&cclk->hw, common->min_rate,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 common->max=
_rate);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 WAR=
N(cclk->min_rate,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "No max_rate, ignoring min_rate of clock %d - %s\n",=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 i, cclk->hw.init->name);=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
> =0A=
> I haven't tested (or even compiled) the above, but I'll test and send a=
=0A=
> patch within the next few days for you to test.=0A=
> =0A=
> Thanks again,=0A=
> =A0 Frank=0A=
> =0A=
>>=0A=
>> I have attached kernel warnings from a system based on the "sun8i-t113s.=
dtsi" device tree, where the memory contains=0A=
>> a non-zero value for the min-rate but a zero value for the max-rate, tri=
ggering the "No max_rate, ignoring min_rate"=0A=
>> warning in the 'sunxi_ccu_probe' function.=0A=
>>=0A=
>> [...]=
