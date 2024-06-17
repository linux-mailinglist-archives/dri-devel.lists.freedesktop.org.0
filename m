Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B578E90B055
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE1710E138;
	Mon, 17 Jun 2024 13:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=garmin.com header.i=@garmin.com header.b="nhkM3s5a";
	dkim=pass (2048-bit key; unprotected) header.d=garmin.com header.i=@garmin.com header.b="NSm35CRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 700 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 13:53:47 UTC
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com
 [205.220.177.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5D110E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:53:47 +0000 (UTC)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
 by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HA6eB5024145;
 Mon, 17 Jun 2024 08:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=pps1; bh=jpJh0XsmW5+m63pmFIUEwNuILWY
 OFMze3lk5bRr8jBY=; b=nhkM3s5aqF020MXVizm3BYYCy3v07J4cd6x9vY/5Ltv
 yHqvP4lfG/wDowE0FUhKY/TW4i2nXnC1r6tweQe2DxD23so33FkA0A2RDM2Smo3R
 VkQiyOC2HJA1Q6nSxNumEF6gZ8WRHe0obs3T/wD24uqPUcATxu5lGGaFid/jXrJZ
 LA7i7ywHV/sqRjRhOe7WoouS0WQjyXpoeXLZFbaJ7hgSD0SKUvxdoFZf8mdgHgTT
 RNdral1OojradqgUoy6ickzB7Ry/1zHsisR7a8ingq6tdAsZKRzLUYGxb4hQlW8h
 8CoJSzfgJuvPUi94UnTSeTbdS18w5b2/DbgPFULoo1g==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3ytk34gc5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 08:42:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGHFS3uDln5jHwpu2p4Vo07IbMh4RmK2WLGFGm+hsoTM9jAdRhsTfC+PlEuWgspFOcgxXZatDfn+2EdDJ7GFuThPUvwikuG3JXcKDvjLgYbZgRSBox75NDJlh3Yb7r9gp61QKzYbLC8062117tljbBDBey9DhIilLvEX1rUJSlVfCZjdw3DCZAEBY4O2BApNVTH4lnspCU7bqjO+XUJ3n8tPPLaQq1FI9bTrwZHVBK11yG/sBNjuYP0rC//i4Y1pivOyJBKic8XEb+od+599IFeldCN8IDmbsXgQKve+cMY21f8GdtZbR5ILPHdNBEQAXEJ/ul0kpFzGXDL9/kTtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpJh0XsmW5+m63pmFIUEwNuILWYOFMze3lk5bRr8jBY=;
 b=DYpQIDe64e5a8XWyhAeFmbAXvBvlz6zMrcHRoNBfEVutLnyCIWU9Ab8EE0P0mfQ858bX67+uSaoX8/plzdS5sNlKBZawXtOT25+ZNEpNLlP/xQblNWOIe0lmAzzAJaEuM9TKNXPEh4pxeAnORbNyXvLGg0QBoTTbncCd+ukrKfv4YvOyIV0+MphypfxCsIGBum3zrESJlqT2nLut5Aqold1SPUc8PSVfP7pe61Dwt7T0kwiD92xQ26ADHAQQkTpoq1b372NTycn4H484PflNjpDbdKbjqD2mI/24KPb5qsAy1vP/Ou7tWRy3y+hQM3Sxrxlsl7pFuUrx/yhDzPZ2eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpJh0XsmW5+m63pmFIUEwNuILWYOFMze3lk5bRr8jBY=;
 b=NSm35CRbqdTAVou9GjM/qVhX02acZerajxIJbhk2YgexpW97AgvtL0/6+3bZzJW1WiQLdCKYuE8yqFx/4ZQ0ZdPg3mcopeaiT3xdB8KWakzcaVrFGtMvB5EIBgc3B8uN52OEciQ/0gviQRp0ecvPsSSaQIXTL6mIZuoqf1pKlvnyg7E9Uu6oVKEeG211BeVHHWhZWz71Y9BOPNz57FwIoTcsNTYKSi51+G5335PcmDw5lj0sZWkCrF0T5tt5bYMWbtMn+bivMdAJeLJTZuOmNDNRnhG/oCi4PjvuD+2Px9g+GIxHr9T/szw+DkQrxFlqR7/iPZ/C1lAfsMeXhkjcGQ==
Received: from DM6PR04MB5178.namprd04.prod.outlook.com (2603:10b6:5:10d::23)
 by DM8PR04MB8072.namprd04.prod.outlook.com (2603:10b6:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 13:41:59 +0000
Received: from DM6PR04MB5178.namprd04.prod.outlook.com
 ([fe80::c2d5:c293:4896:b5a4]) by DM6PR04MB5178.namprd04.prod.outlook.com
 ([fe80::c2d5:c293:4896:b5a4%2]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 13:41:59 +0000
From: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>
CC: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Correct sequencing of usage of DRM writeback connector
Thread-Topic: Correct sequencing of usage of DRM writeback connector
Thread-Index: AdrAusI9x3tDcCHnRSWudKoz72ltVA==
Date: Mon, 17 Jun 2024 13:41:59 +0000
Message-ID: <DM6PR04MB5178398F885B5AD82430B8ECECCD2@DM6PR04MB5178.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ActionId=224a0733-8089-44b3-8bfb-f36ec9325fbc;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=true;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=f3ff6d80-3782-4df6-bf6c-659f84558040;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2024-06-17T13:29:19Z;
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB5178:EE_|DM8PR04MB8072:EE_
x-ms-office365-filtering-correlation-id: 6ec09da4-4b0a-4680-fad5-08dc8ed34325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?sIYOt/dFTlCK3g00gmF4BtHfo5VSkrDJIgSNVPccqh6Mv0zrq8TeyPd4r0qr?=
 =?us-ascii?Q?sUzTfRaZuo2oeIY+SJ12oJB26ulJ/nR90rM4zt/80nigTwAAm+YqyXbhAkcR?=
 =?us-ascii?Q?V/PsN1Yr0qqoNd0fyOnQsE3wum0oI5qp2Urp8jTIUjPTSu3fHndYzSTawUu2?=
 =?us-ascii?Q?M5c1CmmD+85zvqi6gTuJinFcd60DRuW/KYpc+rSs6qH5P34MbDGpD+/EOO1s?=
 =?us-ascii?Q?/Vjp13gR6P+IsdaAmbQ6kVizxqIz9ca6rPm01jfHXH2KX8pNe6sw40jwQpWl?=
 =?us-ascii?Q?8ukIqypOz7GKn/QYSbwsqKKjG52d6O10TGKc4CfKFwSfyxqfqVFn9EcavxWy?=
 =?us-ascii?Q?NsvTtYwijg2A4sXMM+Ov+kiukj9VYKPlTjbEr2EUT6gBt0Lk5BnyaxHolA5Q?=
 =?us-ascii?Q?tKI8IGK4cdk8ujrDPf8CoYob+bu214AwyhGicKTDlXAOU1VTo5jWiDNwHzHD?=
 =?us-ascii?Q?BtuFFgW99DVNhN3qTZPidN8MfULFR1b/SizW/zOfBOx7nx8+pbGeVGy+M3ah?=
 =?us-ascii?Q?DSfcvk36c6F4YN5QFmYwcB2Q1YJqeMUwISXFYWSBUFHVC5/bq9zy5ibUSins?=
 =?us-ascii?Q?Yys6/kx3d4PRPaqSJ/M6yCgD+3lDZvB9sKe9uwCnV++jFziOjr1eMKxD07yZ?=
 =?us-ascii?Q?C7+k8MLIuNz7XyjYNxN8HnHUZtQw/h49kVFHXSNvzzh7VTLL3YwS8dv+YNcc?=
 =?us-ascii?Q?xK91Ra5X2OEUhu8kzIdxoSA3mV+g41ELhTNqkUSEPg9hBi6ywK+2VvHAIJPG?=
 =?us-ascii?Q?dr9rVEBsR9BnO5L5vFU4l20cbWL/PRzlevkQNClR8okSYRr4YiwZfLF5McZU?=
 =?us-ascii?Q?OntqQtcKjgxY55Dv55j9W5kXCKHotP6ANKelGdCiTgMzQfex5jAr5hnJWBDt?=
 =?us-ascii?Q?0tG4u2ZsRXxLkJ78FOn0++p8rjWqDHlGHHPp7cvtJ2zKX7eMC9KSTW3oE1TL?=
 =?us-ascii?Q?3QHwdaH5HVEcZ40QOscipkrRPgn73zwvzu1273WZ4u3VZtMFjNKXZepUpZmH?=
 =?us-ascii?Q?yIa8dRoEwEAWYTmzmxuIYqx/9YywkbrQag+eBzSIRoVSBEW4k5GVC9dvTDga?=
 =?us-ascii?Q?2vOQ6Zj4Jk2ang4qgbj96TYWZ4PYRlsn3hJh+48i/diIwiBTQay1mV8kF2G6?=
 =?us-ascii?Q?+/B4ywksMdBJ3HKfmTcd5Ob6H9zRu0GUt+Dc2j14U6U1jsXLCUFSg5flFGMN?=
 =?us-ascii?Q?ixiqZpHhonCwe16HswRB9/RP02cOy1OoLY4I95pyipAGZn8FJOEyBcaLWjVs?=
 =?us-ascii?Q?l73PUF3B0P9li6cKvVXShg/IIv/JUlGpS6sNPQ0CW920AAt+6YOjriJY7O4Q?=
 =?us-ascii?Q?LTJlR2jvGx/1Bp71rsZPEM/14GzG2Vd8g5ArcNYGiksiOPeNC8Ivwh4X2LiJ?=
 =?us-ascii?Q?NSmt95E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB5178.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G/62N1Fv99rKMzvf0jpPiyRrblldbHsRkc4HYSQkweKbzx3f1tB83CsBcQ/T?=
 =?us-ascii?Q?VhRwL/W9SHv5AuBJb6tTxMubE9cKnn/Y23WveaKv9ZUNnIEXNIfuVtet7loH?=
 =?us-ascii?Q?g2WhMDbdMuClHc5v9ac95CUKMZdeTmJMMEPyvVCcdQJVGXWcOildXh4sar0H?=
 =?us-ascii?Q?H7dIET0T9fvGeXUBcvX1rgIfpvyLsXcYS1hI/wNj07caBc8cCeE/CzxADjHy?=
 =?us-ascii?Q?yOGdcXWIQBa2ZwdYFGjANBfu3kVX5+qK0eirxnK2DZDMMbvPSSSDVE3X8tkp?=
 =?us-ascii?Q?5IB9A5dZ+4kudvSDxxMEQ05WhI78ID/+f4S2xlsHY2tHvK8jN1hu97HCRZNe?=
 =?us-ascii?Q?ta98jcgKZkiJKAphMfNX+nH6fFqprAdzgZMMtr9/EgMZgIx/fnjNc4Df0O9w?=
 =?us-ascii?Q?Yo1Y0y62uNpl32TO0GUijJE0hynsn4i/0WHDRPI3M4bvmdtckszL/huDjCHU?=
 =?us-ascii?Q?JA5kbuAg2MrprRzYQu1+WkTe11N+gcOcIBgEz0CtXpAmKrWhRP9RPyQZyySf?=
 =?us-ascii?Q?xbHKUR4R+SbQZTpl+EiBSTtqFmHkxKH1zcgMeLFFJ/q2I2hK9AjqiTq7CxB4?=
 =?us-ascii?Q?2hfRWNL08wWj1+Bs49rNbcmFqLZ6C2NdbTM+pqZvqrIjGHz/GPRkas6rZRNL?=
 =?us-ascii?Q?96fKqQKMvme9b246afWOvBxN8Yf6S5S/8iLLbn/SHDqaBJZtZSaFw9omOapG?=
 =?us-ascii?Q?vGmwzY0RQO8VD673MzvVBCQ8UCLDI6JxwuRl39NqKurg5einuSvIALX1Sjp0?=
 =?us-ascii?Q?dZUp+hnP+AzIOz9E1z4Blq/Zw8e1VhPbHC/W9NXIhGhgVUkSviaauAVRhPBI?=
 =?us-ascii?Q?X77y+G1h4DhiKEXJFpoGV+0/lSG/LqSUGuedUjRQ5/B0EQb7aOv77UHRBej/?=
 =?us-ascii?Q?1y78b34ktmr+L9a+zvRyRcRXzKabz3cJu1BxK2G1aGGcdLczeGOWzIzOGKe+?=
 =?us-ascii?Q?KJmof+NYZGBtMdw+WNgwh+olaRuTHcTAbSDVe0WL1Jc/NOQSJjBV0KuUuja7?=
 =?us-ascii?Q?mvczffBRxkVAMQ+H61I27e9gRFb/3mFVx78GBmliZagG5qJrNxw16vAn4CXF?=
 =?us-ascii?Q?hKaq0OLSfbtJWn57biaFEPZjXXUL9N8Y4D/e+wTfMxiALa17xoorDMPpjW8o?=
 =?us-ascii?Q?EqwCqYbxqOOi97PdgFpbDjHCbT8GhczKVtrZNgfve40hfAXQ406rZxjYl7Su?=
 =?us-ascii?Q?K8uhsuNy5vcLhrl9FBr7RfbtpXm2DKB4p70Ne2uKoSreMUmwGGQbt3K8guGP?=
 =?us-ascii?Q?6zLhD/bccjoPIPHRIi5sQdkqrn5OUbV6uXF7BSIpaB9MHXss1hTVPnhpewZs?=
 =?us-ascii?Q?6jrudq5k8K46QJgtQMlssaK4FXvPaup0XRa0+OHao4BI3BIt4vDvYW8Vr3Yy?=
 =?us-ascii?Q?uGOgJ5Sge/OmT+eCVqFkr6IEFS41uTsBME9FaJmsqL2JHqjvGUxWY7aY/yIR?=
 =?us-ascii?Q?WeISTTZ7wd/SPnUAzhZLa7sX4Zr20wfMG278x2/SmGesMvPd6Y6+Jpy1WIwN?=
 =?us-ascii?Q?dH9ekVHSzKXYKGpnjsRBaBDkhT9407jc/WLQSKK7yAPKdOtu0zk4xE//21Ik?=
 =?us-ascii?Q?rxsqujSFNuTgnAzsfy1mcJebHowdYttXXGxdcODs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5178.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec09da4-4b0a-4680-fad5-08dc8ed34325
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 13:41:59.5376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VftlLo7HX2QxItmaX5/uAir1ZiFuPqWFDQbjykUfN5qzbXw+BlWQY8OSwDBY48wI994N197eCtQzVAA0kijMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8072
X-Proofpoint-GUID: 21IfV45Vt44GmOSx0hKqDd-b-ZlmDMFD
X-Proofpoint-ORIG-GUID: 21IfV45Vt44GmOSx0hKqDd-b-ZlmDMFD
X-Authority-Analysis: v=2.4 cv=NvmDcNdJ c=1 sm=1 tr=0 ts=66703d29 cx=c_pps
 a=clyc6YhGvfCRRXf4btgSWw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=T1WGqf2p2xoA:10 a=FS7-D2N0u7gA:10 a=Kt9auuaWazqB0a-1qowA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_12,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=816 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406170104
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

Hi,

There is a discussion ongoing over in the compositor world about the implic=
ation of this cautionary wording found in the documentation for the DRM_MOD=
E_CONNECTOR_WRITEBACK connectors:

>  *  "WRITEBACK_OUT_FENCE_PTR":
>  *	Userspace can use this property to provide a pointer for the kernel to
>  *	fill with a sync_file file descriptor, which will signal once the
>  *	writeback is finished. The value should be the address of a 32-bit
>  *	signed integer, cast to a u64.
>  *	Userspace should wait for this fence to signal before making another
>  *	commit affecting any of the same CRTCs, Planes or Connectors.
>  *	**Failure to do so will result in undefined behaviour.**
>  *	For this reason it is strongly recommended that all userspace
>  *	applications making use of writeback connectors *always* retrieve an
>  *	out-fence for the commit and use it appropriately.
>  *	From userspace, this property will always read as zero.

The question is whether it's realistic to hope that a DRM writeback connect=
or can produce results on every frame, and do so without dragging down the =
frame-rate for the connector.

The wording in the documentation above suggests that it is very likely the =
fence fd won't signal userspace until after the vblank following the scanou=
t during which the writeback was applied (call that frame N). This would me=
an that the compositor driving the connector would typically be unable to l=
egally queue a page flip for frame N+1.

Is this the right interpretation? Is the writeback hardware typically even =
designed with a streaming use-case in mind? Maybe it's just intended for oc=
casional static screenshots.

Matt Hoosier

