Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A338B3E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273166E165;
	Thu, 20 May 2021 16:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3416 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 16:00:33 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A396E165
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 16:00:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KF3LuM008069; Thu, 20 May 2021 17:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=HFZ3hGTUJPDXtqlMMSLvGPOUCkEK05NcNkAviSBcM3U=;
 b=UYwt8OWzr/Geuk3n+7XFR03++h+vh7hsitrgYzvTsa0RBimGTW5ZeDS+nJBIBkGZBv+L
 FH9OXSn+gWam/KtN9hcrdsO/tLsv0863i2HpMXVpGoBearFk/CSRdiZy8QDJdH6/bfhi
 yImuTe49CRBUTrHsuDzTJciW/4rVIX+TzxczEHTY/xIix4hmJWHe7cMrg4E2POJL0Pn8
 DNkZuCwxdmZo4nT4dp8KEo/ZWkl6ajbbguvzp2Lj4HZFacQEl1vVrNKlUV1vCN8Wkt7q
 wYW4u0MF83mFDJ8lx/39jbSaQis/gdbXpb0/i4ioM3NJIe9NSHnZQ7gl+VjE5ISuBLmx qQ== 
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx07-00178001.pphosted.com with ESMTP id 38nnfdjkmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 17:03:25 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7uDz6VlyBCrU0o8QHX3Ywk/zAwTCg8YG0RyizuEdy1Zi7XKO93rmLFrvq0O73/lJwYhpyvCyY4VOL908KbPchEbAYETkYB9Onr6hl0mfwMRG/tUdtwREe/BjhV6A461gzbuL3st1Kapk3T1CTx5YmhaCSY0QsqjsL5ElI+p/oEXYfqzmyEwEwniVPHcws/fZ2v6PiEXBiAnIizDND2WePZ0DDjFSMJFbZgksatxDNnOJH/AR/oqCdweOzjJDnV/aouh6DEJumMmKtbHRPn15n1Fy4bprYm/uFX1MxNU+nnLV778lQRT/z8b/S6MJllsfGK6j2StTFG+GLUb5F9h2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFZ3hGTUJPDXtqlMMSLvGPOUCkEK05NcNkAviSBcM3U=;
 b=HO61fo2y9VKBYRRrxaWbLfXEuKj/YgjV6gxKoeEQ1oo9oR83aQA8rmsuA5THZXlhjotnHb7T8WNPGK289NLCdIVkPoCjHBz2sKbvuEmNRTa9oSMNWdr13M5BihZERyT+bLWSlPsjKrQf7q9+HkdrI7U1to52+4Q+ezsy3DEijYRYsGQcQw2VmcHq4go4VzkMEnZb8j1Z7QkuyqiFp5GtZ0jmRzuHhpZkWX9v0+p8LHIG8XM1dRmJdCZ1gnqtX56ogRYKuWsC8mlUVQfzYhJQeUWe+Lw4VExnAhCT9AuGFRe+vbx9tOY6hV4bdhR2lvyfYpa150cT7j/FWKP+XIbN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::17)
 by AM0PR10MB3124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:48:09 +0000
Received: from AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7d09:c28c:b46e:1ed]) by AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7d09:c28c:b46e:1ed%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:48:09 +0000
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH 09/38] drm/sti/sti_hqvdp: Fix incorrectly named function
 'sti_hqvdp_vtg_cb()'
Thread-Topic: [PATCH 09/38] drm/sti/sti_hqvdp: Fix incorrectly named function
 'sti_hqvdp_vtg_cb()'
Thread-Index: AQHXTXAZAdUhrqEkJ067JyTDnkMhfqrsc0uA
Date: Thu, 20 May 2021 14:48:09 +0000
Message-ID: <AM9PR10MB4119A23A74E9E55CD12B26029A2A9@AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-10-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-10-lee.jones@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2021-05-20T14:48:07Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=d720fe1a-616f-401c-abfc-1bf96b2c5cc0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.51]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 168db0c8-7443-4954-5eca-08d91b9e4961
x-ms-traffictypediagnostic: AM0PR10MB3124:
x-microsoft-antispam-prvs: <AM0PR10MB3124229236F9C6B8E3232C9F9A2A9@AM0PR10MB3124.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bxdPAupIiTZR76GBRUYjDZmjQpIVACRk9SH88oQMtaXgWIlHzeeIpF+Y8X/WrMLwgCnSrumUcT0cOu4I9dfAIz+8vfbP1sTSlDVU2UD93fm5Pz6amHZRHS3ITEWgy/K6/aY/CCnkeAIuUniQc3ADdKJaNmbP0yoKSNHZCQylsE6r73Z3Wkq8gWjI0VkztDAURooh+IkDGBZU++JKZBt1QnVZvtT9wfAYea1SkDcBnlYN0TsHAUTJjX90CV+PmQl4NqlnIjGKS2X37UTh1WmtvuxxD87x3LjoBh1GZ4TUnhvK1GgafxJZsxLK3JODM24FshAM79QWsBUzBbKUUlaBavKh+psPgQ+9elojW2bl1qBUaS4GNrRHipkvL96g2OsNk5h6iS+b8ymxL3twEvNfjbi2wFXtgox1Kf9RkaPSVPO8LZh1zchpeXQYmJo3wjQHVodUrT7vv74PsQWSJO3NroBN2J0rHYyMcr+emRuodU/eN+PXoPSD1ZCx+4aDAcfSAr73wEy9lXuP48rgP54d/ApLXV5eU5jAflo9Z3zRvhzLT0i6gQ3ZZMCCEBR//f8Kj/hK6md+vWqLOAGpWuf/Y13OlNi/mapWHS47HUZCuL4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(396003)(366004)(346002)(9686003)(52536014)(66556008)(186003)(7696005)(6916009)(86362001)(66476007)(83380400001)(66446008)(53546011)(33656002)(6506007)(76116006)(64756008)(66946007)(55236004)(478600001)(8676002)(316002)(54906003)(8936002)(38100700002)(122000001)(55016002)(5660300002)(71200400001)(4326008)(2906002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JX0G63z45g+jq+0NToZpxu8CDoGLzCSrmjQqwIY7/d1DoiF5RRBVbDIR3/Pb?=
 =?us-ascii?Q?TQLlqTTsWl2Ar+PxfPrcebu8pTUxnYbl2/A2myhL40fZP62zGKe8a3g7sKrc?=
 =?us-ascii?Q?iwfE372uMtJyhf8Z+il7o2/fmJMTubBLOrRe7cZhXzkWAMnERb2VPKoyg7gq?=
 =?us-ascii?Q?D1AbuGqWTcZahFdS+xEvi/5UR0tbjoP971wLB/+PaA+7u+TV9HCplLlBedQ+?=
 =?us-ascii?Q?cSDW90R95riSm2H4JxOF1Tg2wVc2v1Bsw4VDX/D93mqqN0lfAEoOAyl3QfCF?=
 =?us-ascii?Q?Cov/m38Pi/s/2Ek+vo2hZaMD7BqrVKlA70RBbcNJseBfGdhvpUGxraN8VR+A?=
 =?us-ascii?Q?Y3fw78XGbyJzRuG+uyMIGNCkMIDPA1QO4XKmCLBEYdWIiGjPLZYiiAKKYWzH?=
 =?us-ascii?Q?8VY5xqlCJYOo0+GEn+ZnjK2udqZM6alBbzy0ui62G10WFxR1x4e+eqS39Q64?=
 =?us-ascii?Q?wAazIXptbGgugo9fM+4nJ4ICqvsJUAj9auDFUtDHJzvxRMGKytgF7JbQHQ2b?=
 =?us-ascii?Q?KNuWBg0zs6169D/ylASf6Xe2QL7D2LXflSFRwjMqksgmsFLmxPaSllzV/Piz?=
 =?us-ascii?Q?fiqSi0RlKiUrmobke+RqZPMf13/5KMjlMV2/faJzFwZgbh6MSHreDPr8loMv?=
 =?us-ascii?Q?tGw73NFG3WRVrrvAK/BflkOiTjqCNJepBonrNNz0dLsTxpv/ziJtZg4b8npQ?=
 =?us-ascii?Q?yjIXAdVlGzIT6jgDzEgWgsAYpMbh8n7Ni6l9lrVQArEih/X7dagvsMA5oGrI?=
 =?us-ascii?Q?or3OH1n5A0CqypxskXaGw4IpVcTuNdGRP/cCSah4UvlxciGV8Ttxy+BtAVtO?=
 =?us-ascii?Q?n4M3OT4tcGVbfeFOKLyPh2cw1m9TFTbIOuEXZcdKpSa/wdeekBacP4uxe5Dx?=
 =?us-ascii?Q?I6HSLLr6/oXawJH4RlpQeaMEEKB+QBQD3PIobkhq1IUVksRqCaq9uUoenkAC?=
 =?us-ascii?Q?Mk/i14ED6Yo6NF8p2dvvZ+oj/vS5K8OgFRGYX4X7TASnSm1R1IhSOXA9NQS/?=
 =?us-ascii?Q?VvDInldhAaUnZoe7JOiy+mKUP1M+Ofl25BzteNTV4slBC/p81Z3D5xBSyT6O?=
 =?us-ascii?Q?d5QqqCiIMKYc+U4UqsShUUnjI75GDJN4ETLY69VgeO3m5h6gD5UNIC6ve6QJ?=
 =?us-ascii?Q?8EU6QStdjfmgXmMJyWXv2YMLQJiS6DEnpdGBDG+2wFFEUWn46AsHrOROdDID?=
 =?us-ascii?Q?EGMIXy93L3nNvr8qBx2/07Gu1QfOoOTQiIw8tX8lMCob7KgN9Aano7x54wxM?=
 =?us-ascii?Q?RpuGwmsUdALxijsmJrPIM7aQ4mX4EjfJGZH83UfVaM3Vblre3em4Z6WXC+87?=
 =?us-ascii?Q?Bwaku6BI02MUzZEhOKoiQGgs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 168db0c8-7443-4954-5eca-08d91b9e4961
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 14:48:09.8053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YASYrkkhSpdYVurBucAMFl+fhhOgoZQT9olNCf1jX7o7p4Mz8ssxAzHchpXgvoTKR0Njosw+hftKRaDacjWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3124
X-Proofpoint-GUID: da3_ND3nYSOtsGynu6xIkl7I3eEzSRQ2
X-Proofpoint-ORIG-GUID: da3_ND3nYSOtsGynu6xIkl7I3eEzSRQ2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_03:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200103
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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
> <daniel@ffwll.ch>; Philipp Zabel <p.zabel@pengutronix.de>; Fabien DESSENN=
E
> <fabien.dessenne@st.com>; dri-devel@lists.freedesktop.org
> Subject: [PATCH 09/38] drm/sti/sti_hqvdp: Fix incorrectly named function
> 'sti_hqvdp_vtg_cb()'
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/sti/sti_hqvdp.c:796: warning: expecting prototype for
> sti_vdp_vtg_cb(). Prototype was for sti_hqvdp_vtg_cb() instead
>=20
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

> ---
>  drivers/gpu/drm/sti/sti_hqvdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hq=
vdp.c
> index edbb99f53de19..d09b08995b12a 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -782,7 +782,7 @@ static void sti_hqvdp_disable(struct sti_hqvdp *hqvdp=
)  }
>=20
>  /**
> - * sti_vdp_vtg_cb
> + * sti_hqvdp_vtg_cb
>   * @nb: notifier block
>   * @evt: event message
>   * @data: private data
> --
> 2.31.1
