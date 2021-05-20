Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D660E38B33A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A64F6F49C;
	Thu, 20 May 2021 15:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2165 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 15:27:20 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940116F49C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:27:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KEc6UI027717; Thu, 20 May 2021 16:51:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YWpglcXsTk8lS2dAh+WicVzQTdxMUfpjuhDJYeZ6rKw=;
 b=qpoVf/rnR3yb4EnV9zpGHPJPC51ZJqxxtVpdfl4FAhXAf4uYUfkQXKG/wNHBKnef2mf7
 z6Y+GqcFThLXl01pfCNnBT1kFifdrEwi6O+n6t0WOSmfr1vg0ePewdAPDqQaUbR0KKO9
 5EN3h4+xlMAM9T3EwXvv09VDsaXN79F7yHqJ1wtYZSFybzZyDxa15fCOqYFgAE4jsKGB
 +9s4BVm2o53JqYg0hWYbYojBKsQw0OVU6PjcN6DOJRdSdeZE3Jguru5voMS2Ozsw3K4o
 Jc+vUPo0HC8crgmNeGlvq9x5i5FSWlujQr7HDqbZcNEvt13e0sM18ChhL03I7Qa/zJI4 zw== 
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by mx07-00178001.pphosted.com with ESMTP id 38nemtn330-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 16:51:05 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYR1wEEBBv7j5v+nipNrPm0aWaPbJ8A0MoCdHQk0MwAUgK7voSGTYF3krt9dJYk2xlMZPMGMU2M0/vmkuCV6eIaaLHnOeCWn6i/6mP/4dDAgfWcZlRyRvBHYv6QJmzX55qHavwW2QABflxLZ+pXuviNdPozEmApAidxRVHzrcwnSoNwAR+2szvCoPqkp6t+lrsqk2kOdggYDUar63UBGBto1xOgEtSIjeFbC6E/19LA2Lh09tblIwEDOa/JnmMI06UEfNuJ8iC6vbjW24BSdl2aZPjfoqPO43OK5UPKe3hPd3+6M0eOy0ggV95ms7l/JL3QFYCOWDRCLtXf7WsOkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWpglcXsTk8lS2dAh+WicVzQTdxMUfpjuhDJYeZ6rKw=;
 b=R9sz75qwOAGfwSPX5lPOgBlnydRRlS2APkkGJu6QpkBOz2+9WLWQ39fbvJAOnTU3GUchroRzqgdqkZwfJ4Xr0s09AP10uV4FtaqmaurVlSkjVGo3aPu+N0gZebX0L9lud1HL2PPmdBjjaKHH8Gfw6VdHiGyybKZmgtYUche0ZnrmxpgK1pkv8h65FJqbnR5Ga6qhtBCcf3Jtt2GqvxRlXEFOYCjOmSN/jQXitMwBnTcp98oeySKoKexLr3gj7xqFPIEF0Fbq+PZqMGqkErX1x1hu78f1ZWhGW7EcliS4naw68YGrX2Tie+qBfBPcbFBJ7Sf+WfyKGXL6+JNeE7cDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::17)
 by AM0PR10MB3124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:47:36 +0000
Received: from AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7d09:c28c:b46e:1ed]) by AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7d09:c28c:b46e:1ed%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:47:36 +0000
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH 07/38] drm/sti/sti_hda: Provide missing function names
Thread-Topic: [PATCH 07/38] drm/sti/sti_hda: Provide missing function names
Thread-Index: AQHXTXAWtG2AcsBQ8kiyV2XsVNLpRqrscjYQ
Date: Thu, 20 May 2021 14:47:36 +0000
Message-ID: <AM9PR10MB4119486EC3DF4A4F796A021F9A2A9@AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-8-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-8-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2021-05-20T14:47:34Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=055cd27c-91cd-4427-9821-8c2427d42065;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aed58f9-8d39-4329-b456-08d91b9e35b8
x-ms-traffictypediagnostic: AM0PR10MB3124:
x-microsoft-antispam-prvs: <AM0PR10MB31245C4E53AAB22D57A545759A2A9@AM0PR10MB3124.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMjoKW5L9Wi5FbAbqqV48O8HMzqohJjWT8VjKH//XyB+T90doa7/6prhGi3ded5MxKE8aRWDxQ5vZsFWG5q7Quh2yvn+E+DMZwxsP4PJMfcoiJZanpZO49L16i2wV/kKEhnt8KBPahR1q71IdFGVMrPg/MvT3NV/qNnLxhLvh6ggUfdjE39DaUzgjGK8MkJ0Dz8IsJZ49kXmzSjV6y5mM+gIsxFMJaPjyE9F1KGzvkxRGNWfFuObKf6eCLnf/qH4KEzEz+XZpWHSTulY9vp2gnaiseE31Z1AEBjWRSa57kWGkrmr3ZbGlobdiWFBEHwAC6nMhHbYNFg4X+H3Jy59zokjtcIW0SmkhdhNKdEWvin0JiT8eKEkOJ/R2fv+6C8vQdvpjFBdq2N5E9SRLhBEe6sJUTbcH9yoPTdW04jN0sCCe1zHkNoK7RtQFflf+8blynxH6rZD23NQUIvWTFOMzbpPr+YGOf3k5CVQqG5iR9dDTqovwnKNGKl9dPPcnZ8XvnEoHs2IvvEwIL7wNDF4uQDkivjI6w/ezptLBVVlmMVM48zNoyN0Xcd39ia0UufKjHRaadbhBhl/4xYvzrG5PxCRmdxjrctL/f5bdkqYC34=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(396003)(366004)(346002)(9686003)(52536014)(66556008)(186003)(7696005)(6916009)(86362001)(66476007)(83380400001)(66446008)(53546011)(33656002)(6506007)(76116006)(64756008)(66946007)(55236004)(478600001)(8676002)(316002)(54906003)(8936002)(38100700002)(122000001)(55016002)(5660300002)(71200400001)(4326008)(2906002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Y6Wuhee15Nn5MuyoKDCXBtv1nJAIbhJRGW5+5S4J7zaZCTajvKViotQbVMtC?=
 =?us-ascii?Q?9rjtmyXxJdHt9hOmSfN0yelP3YauKZwWMAuPviQgaSgQcXyYhQxxOfNDhHJp?=
 =?us-ascii?Q?z4LeekpD74zxLhLrGYIlME2/Dw2LHB3bYAKEa1NNnskirOeoxIvQ2WrsZ2O/?=
 =?us-ascii?Q?TaIDsg3XU99PzHzNJjGfz5DMRAwj9MHLxst5HBlzDDCpq6rxiQfz6PSj56nV?=
 =?us-ascii?Q?OuS2yN3YY4/Dk8AbCBVytkv2OiJyo19xkIiEiCH/4JiC+HBj299/fDkCeudC?=
 =?us-ascii?Q?1SDekrmRjWj1jkOZM2HeyLDJ0J3gJ+nYZpVY7Vk4z0COFFxnJohwc+kaSZcT?=
 =?us-ascii?Q?hU3dVfWLneOHkuWMm+pRj1nTTdjeV/A5kfiT4dk19gdT5CLFaaGlWlBKOvnk?=
 =?us-ascii?Q?gmeDXH4Iq9sGd4OXDvUQtl1aAJqmOdR7hqOLoO3Hz3/DVMQGib3xx2m5mDfc?=
 =?us-ascii?Q?yTo3jVtMr0zjv+mp9gdvQ+kaVwny2RKQCFcUG5tpIRjmMlTZnhoJKKFib3cL?=
 =?us-ascii?Q?zZ+2zHZoKsTceVkJOgMueUq2Wzc4a1olrrF1hd1M21QFmOLEvofCKWcazQ4E?=
 =?us-ascii?Q?2apbA4KcmJAkmT3qpU82d3dxNlQ3dsqtjEvStW5ee2nqjSv+aDC5qntEH4Fm?=
 =?us-ascii?Q?7P1Aj2jwIcZLvIaqqx83if8op2NcqsBO9tbqUJRRW7N7WRXpvbmnnzRrpB2h?=
 =?us-ascii?Q?zQD+RRjao2kZ9dOAQ6jbnL/CA+ns/YNQbd+S+3jNjsTj32tLkQhlgjWShUu9?=
 =?us-ascii?Q?oBNYy0FRU006zxDNEAUrK0HIMV1JiICAcdGFMXahn3kTBUjHAoCChcjOJJ9E?=
 =?us-ascii?Q?XYd1EK30hapu2R4MFcuEMUOZBZ8xy/zDeu7dO+i99MhFToIT/Mt5ObAt6BHi?=
 =?us-ascii?Q?Kg3iEfvl1/dbNkeJJF2xI202EXW8TenuJKHlsmdVH6HyMkP1HXBy8JPlzPvi?=
 =?us-ascii?Q?ryaA7yTiu7ZsXedmHk2BQKDZip2NMsDHoBntjDqvjqySAIwj/S/7VUPJO9jp?=
 =?us-ascii?Q?SDZf7wgirgjDtzdJXWgMzgodtyRRnryQJX8U6NcHlHl49TfwmWhosj/YJhXJ?=
 =?us-ascii?Q?ZnwvicfM7qpI1nScH5wrXr1C2yVMkgI4baHECi2hhY30r0a4c52DK8siG4mk?=
 =?us-ascii?Q?WQgxyFKkYxA3Sb+3nZxbzu45KNDgq3dsPReKLyo0d/qKMfS2DVvvdYnQBReP?=
 =?us-ascii?Q?4Acz6tWtBwPvJAlxNeRER0mdud7qrJpzR6Diepit9NcusDYSpSL0vJReHQMM?=
 =?us-ascii?Q?5DNEKNfYbvjyRdfrSHpcrINJZw7NBewByvM/qFjkFHzNs8WX7uV2uueE3fpQ?=
 =?us-ascii?Q?HkuJ6zQAQ2dtNJDmSLopErsX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aed58f9-8d39-4329-b456-08d91b9e35b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 14:47:36.8809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJ7xrb2TX/CG83ml1P+KES4qY/S8OlIlRKadQ7ONhBe4KYYPTcM5hE2JZ6B5wAo6eILqSAqUrrYL3WeCZYYMjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3124
X-Proofpoint-GUID: UyZYqZXWsulWreDMbWT_yJJSLl6BDXJS
X-Proofpoint-ORIG-GUID: UyZYqZXWsulWreDMbWT_yJJSLl6BDXJS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200102
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee

Thank you for the patch

BR
Fabien


ST Restricted

> -----Original Message-----
> From: Lee Jones <lee.jones@linaro.org>
> Sent: jeudi 20 mai 2021 14:02
> To: lee.jones@linaro.org
> Cc: linux-kernel@vger.kernel.org; Benjamin Gaignard
> <benjamin.gaignard@linaro.org>; David Airlie <airlied@linux.ie>; Daniel V=
etter
> <daniel@ffwll.ch>; Fabien DESSENNE <fabien.dessenne@st.com>; dri-
> devel@lists.freedesktop.org
> Subject: [PATCH 07/38] drm/sti/sti_hda: Provide missing function names
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/sti/sti_hda.c:283: warning: expecting prototype for Sear=
ch for
> a video mode in the supported modes table(). Prototype was for
> hda_get_mode_idx() instead
>  drivers/gpu/drm/sti/sti_hda.c:301: warning: expecting prototype for Enab=
le the
> HD DACS(). Prototype was for hda_enable_hd_dacs() instead
>  drivers/gpu/drm/sti/sti_hda.c:383: warning: This comment starts with '/*=
*', but
> isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>=20
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

> ---
>  drivers/gpu/drm/sti/sti_hda.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.=
c index
> 5c2b650b561d5..03f3377f918c0 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -272,7 +272,7 @@ static void hda_write(struct sti_hda *hda, u32 val, i=
nt
> offset)  }
>=20
>  /**
> - * Search for a video mode in the supported modes table
> + * hda_get_mode_idx - Search for a video mode in the supported modes
> + table
>   *
>   * @mode: mode being searched
>   * @idx: index of the found mode
> @@ -292,7 +292,7 @@ static bool hda_get_mode_idx(struct
> drm_display_mode mode, int *idx)  }
>=20
>  /**
> - * Enable the HD DACS
> + * hda_enable_hd_dacs - Enable the HD DACS
>   *
>   * @hda: pointer to HD analog structure
>   * @enable: true if HD DACS need to be enabled, else false @@ -380,7 +38=
0,7
> @@ static void hda_debugfs_init(struct sti_hda *hda, struct drm_minor *mi=
nor)
> }
>=20
>  /**
> - * Configure AWG, writing instructions
> + * sti_hda_configure_awg - Configure AWG, writing instructions
>   *
>   * @hda: pointer to HD analog structure
>   * @awg_instr: pointer to AWG instructions table
> --
> 2.31.1
