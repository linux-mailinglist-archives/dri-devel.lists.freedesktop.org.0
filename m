Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2657443D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 07:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1EA1494;
	Thu, 14 Jul 2022 05:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C762A1C34;
 Thu, 14 Jul 2022 05:08:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E58Vhg001492;
 Thu, 14 Jul 2022 05:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qti.qualcomm.com;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=2KzQCnmTq6O/aWbMegwaaQraKg00s8NDzTBRrlSzwgY=;
 b=HHSqumZOLJ7jDb/+4NJIbth4JEcpPD+GvvzUwr1+LvMghvJAH8i99jvgnlgjAFxeJu/b
 mT8208PSzD1AYEmAkGs6SXPsW0WfD3/Z2X5JK2FF/jV5eSO4GPzuh8LiJhuKvWNOd/p/
 Nv5XoMGDJZRql8NGOWPSzWU/QRya69OrnmvbPgc6nAmY/RHFJ6IOop/2HsJ4mh2DDeCN
 Fr4wDShqiUCF7hULvmXQQDKUwB/Z+xu6EQXIku7ziPA38FpIG+zqnS28xtTrhvW4IpEv
 mjHlpqb+Kd2FQXC6Lus+nF3wvo1kRqyaeeOIsqjvzlXymacoWc1xlvdXed/fmUakglyg eA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h9ttejfx7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 05:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaPiXZLG8X3uGgYaO7ZPfYVdjuVZtOJLDzhMYwyvaewSmqHKF95zhNmhkUgQaFlrogISbqO8BvnUKw2Hu+WAHQT4yjoq9sM0WCQYWwnrH6E7ukBxQkBbTymT2hmBmV0hYvH+8Te9JmFnLrk+uyx19DNVw0B5vytGBqYyErZQuZfSoKS3by2W1bH2gM1FAH7kyc2DxpbbtBak2IHYSHNVr+4K7wVgpIiFf9AwOjN+b7AwWwuUGxy2kuIVhFMqpG8khlVTASdAXacny75bIqMhgH04x1jDIs+kXCjEknr0k6/C39Fj2Y7X3wMxW+fivAS7nml+8WQCvhtesYuLwXONwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KzQCnmTq6O/aWbMegwaaQraKg00s8NDzTBRrlSzwgY=;
 b=ExttP3S/3/ADUxbu+Q10mKdyFMYDsW75snRY5PP2VLFETeSd4C4G+o7Qh+4ymKCBicgA9faaLe4ZPNL/7IsqWPdM0HKwjAV63cvYQBUVkJr2l80DDKDwGSNTD4wuHOoYjsd8+yw6hpwlS5AJAGbeFi+i7npHVN/C6HOWceJllpC+HnHAuDzVOI7x3e2h5PnARFdnWOhfQAJkcwuULuP1W96jLOoZUTVcty9NyDJmOIe1VJyszkQatwRDpZuLhTolgovxWucIWAsv6pWJGStE62cqFZg0GHih1+OFvXNZtSG7b+wOLXhg7uxpU9ZenRkZgNRKdrqAXORLjgejl1Z5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CY5PR02MB9013.namprd02.prod.outlook.com (2603:10b6:930:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 05:08:25 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7%6]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 05:08:25 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v6 02/10] drm: add helper functions to retrieve old and
 new crtc
Thread-Topic: [PATCH v6 02/10] drm: add helper functions to retrieve old and
 new crtc
Thread-Index: AQHYlSXcTHETQiL+GE+ERz5TL7gn3a19U8Qw
Date: Thu, 14 Jul 2022 05:08:25 +0000
Message-ID: <BN0PR02MB81730D75DA27C15ADB9F2C9DE4889@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55876651-2f1a-40a9-ea92-08da6556e1ad
x-ms-traffictypediagnostic: CY5PR02MB9013:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZM82FKSo2gu0XwGh3tq+F4slhiROD8hN5fdr1nrzqGOr0lxo5Amqn/FdR0i4DxvL7EqwYOdA8ORLFZsnBHg+whap0rpavxcK1RkYmCHtyTnJ3uejUIumS0uptQ2ruvnlyuyV4+l6AwWv/6hDD+VEUCBJ8BmVaz3XJJXgM8F/NYFAt34uI1vHbxMGyMSS65zQAyc5zwUvNCISfxWS2IHOIFvcHZt6NBcFHvgS69QHQJy9c9uac7Y+jADMEC+O7DZT87YfTvjvH1CIKb+VudWGIM4/67gvlKG+Bn7fc/sc/+Hia6Ex7mmOkUJ40TTLBt7n8mPjOBSO1dcUonEdxNMFVvNiO7Jt681y7xxujq5gDzS9Eow51/QVuodYzo1S2xn1NTInqksVgMKE6jJ/mrvm6U2u7/P1ilICIvOpR/20g56yBfKoxFA0pbiTFn/Nclv/F7GakrR7wnnNobz1/9Z3tG3z4atdpdGnoSbC4UOZ8Noayx49lnrzAW2j8AS/RO0jR919LWcF6Bk1jYloXyr4Gy0fVY5lNP+wm9VfWxuBwH8jMaYZt+84exsEPo27oLslg2DEtIyUjZ7tGIk0iqblaQeO6Q5Jxtqt4jbwrT8ooT84EQ3mYHWLyFB/OUOrCnwNTwOziD3PGJI9dwicnVt8SoW5PYGmWgjD0ddrsxULLtT9WxKxmOTnqNDibtSNliF+sV9sfXG3peEQFk/0K/ULqG73Bjl58sj+uX0XKWxjnGi08xqWX0JU6nxbm0pxY6VTMK8HP+TnUi+x+X8hT7TC2nxF8dULmKrzUals9CG1+LJ2wqqdS9LHbU+Uhbea6YTz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(38100700002)(122000001)(54906003)(38070700005)(316002)(110136005)(83380400001)(55016003)(107886003)(186003)(41300700001)(8936002)(52536014)(5660300002)(9686003)(33656002)(7416002)(478600001)(6506007)(7696005)(53546011)(8676002)(64756008)(66446008)(26005)(76116006)(66556008)(66476007)(66946007)(86362001)(4326008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5mbaR9Hg8YmT2cFVoLIkKd47cQuKXGIAoudZ02jsePQcObTbhC2xVs+B3jtR?=
 =?us-ascii?Q?/2rdiet7UV1r/ZhY3fD96KaNQPGvJB1/zpqg8tWBvcofULZs2cc2B9IGJg9F?=
 =?us-ascii?Q?GDAEFQi6z3EQJGylOvp9lQW2QwYEQyqjPZ0Vf9XjNyFkmMmd8BjcbKCgVWiv?=
 =?us-ascii?Q?blaAirFGPh268PeEwjAgNCkqz+Dd41dWJ0gB3k4GnkfqIoxcdL9GctO0Zufs?=
 =?us-ascii?Q?RbMAmFf6x1C/sS1EYpaUDB9vNg7Tcy81Ea+XWStXDKHHaDJuPWKIb+Pexehz?=
 =?us-ascii?Q?3PSB6BL8zng598CGI0y1EamNr9ljgL+yQLOvjRVRS5s6gwq5KncBBvis/y6w?=
 =?us-ascii?Q?8hSl44G5aciJ/454KqWgFHgjZ4cD5y6PiKe6zwRoiTc5wJRIBlQiO5jtO5xf?=
 =?us-ascii?Q?Q9lpyo/6LnK8+JTVBI7xA6lAnHO4ZkXOZLkD/bfed5Ps43+uQC1Zd4+zlpN8?=
 =?us-ascii?Q?ei6ybueOVMS093nAbwH2Wq4hq7IxleEf7LZ0kkc6E9gJ/+GltnYJrM5ssYho?=
 =?us-ascii?Q?l+N0PT3wAhG5Mkzj6GEcYLUTNbheGHzF4V4fc4Vz/9W6ehZvSlyOPfT8tToq?=
 =?us-ascii?Q?GWsxdXK+E90ut2t9YtUnt3qFrbyTdBT/HmXr0HiLhuXeN49j95NndWyuSR2q?=
 =?us-ascii?Q?kqmDG4oK8YaAlL0XOVyzL22bsRTti15IWFz6otMJH/GKDlfJrL5LlrSykYxl?=
 =?us-ascii?Q?Dl2ULFpIkn6MqOmPhNAYf/tkUpvse7SLujjrkmIWM7bqo5EIOsLdfTgZyBa8?=
 =?us-ascii?Q?pfv+FA7I9MiaKFpGAk6FNNj7Ri2dEMkYS3obrNAFeZ7mvzpfR0jcJX+K85vy?=
 =?us-ascii?Q?ZaJgUB/5C+BX7SKglth0Iqc5bxRTsuvRdp96ca4zEzLyGMx26sxgGJFpucSP?=
 =?us-ascii?Q?GWBEISULznZSnnB7DZR6FjqhQXStn+sEWNpMdivuF3DfDkIMcOcbk6jBViO7?=
 =?us-ascii?Q?1g6lIiL1fxE/iyEXk5IJ/DTMQp2nVsJkLK5c02i7ClvN6U7bar5dvGHIpM2g?=
 =?us-ascii?Q?phdLWL1OtfcSJhGXh5KFzC8FbvLdlTTbTof3+OEnLiAyjYoLRMdOLHJJrRqx?=
 =?us-ascii?Q?kc4LiHmqV9iWFVE8AVfJ6imj8vu6zP2ytvF3lXoEd7JaDm44bb1FdlaeRmd/?=
 =?us-ascii?Q?ocYIQ8DRMIE8D8FKF8KDSnqf7eLDmrGsOWXBSntGe7uVX4N7/qvZa9PkKlRx?=
 =?us-ascii?Q?pvHOxf6/4StV8jEj9JrZucpLoV/wo6Ojl0xVWCylrLZ/DNKtzBddMpV8PafF?=
 =?us-ascii?Q?CssYDOh96OhAcH85bRSQw1dfKrPhyd2VAUxDaBwnD+sPcAuZ7mgST2PbfSdR?=
 =?us-ascii?Q?Cu4pMuFYfNdqMkH6deVrnC+6CLIpBOWFE8BsZG28h5tXf4MJRvxnlOIh7tFD?=
 =?us-ascii?Q?8bU2XYSxLklKFSDUAYP4CZjv3dY4JFGeFyh6Ps3wxF7Dr6DejbxsvTrCeb84?=
 =?us-ascii?Q?jMw0M8/TveANzl72YZpkuEsgfDE938P+C3crnvKGinK8NcbyrPunoW5V43uB?=
 =?us-ascii?Q?20U+oO6UTF7YY7pigZDfs3zs5MpSqRPnoLWGS/2wJQUThpfT021gcWgAgxS3?=
 =?us-ascii?Q?3vJykfe0NXQCR5s03t/DC+ns3XKPJ9rOvQQ3wp60AdT32ZqMf2w6Ysz4/Apa?=
 =?us-ascii?Q?tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55876651-2f1a-40a9-ea92-08da6556e1ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 05:08:25.3571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6iFXgS1UnXrX/PoElmwaPaw3LJ+K3H0wr1K/jzSNSm/oM0pGSnrPwUYUDX1QF9MFHV42AtPf2V9vQ87R4v+s73IPFMnd9kq/j4aimca1dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR02MB9013
X-Proofpoint-GUID: f2L_zFcPupP7B9x14OT4s7UPoKbG1hLq
X-Proofpoint-ORIG-GUID: f2L_zFcPupP7B9x14OT4s7UPoKbG1hLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_03,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=771 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207140022
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle reminder to review this patch.

Thanks,
Vinod P.

> -----Original Message-----
> From: Vinod Polimera <quic_vpolimer@quicinc.com>
> Sent: Monday, July 11, 2022 6:27 PM
> To: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
> Cc: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; linux-
> kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
> swboyd@chromium.org; Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
> dmitry.baryshkov@linaro.org; Kuogee Hsieh (QUIC)
> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
> <quic_vproddut@quicinc.com>; bjorn.andersson@linaro.org; Aravind
> Venkateswaran (QUIC) <quic_aravindh@quicinc.com>; Abhinav Kumar
> (QUIC) <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
> <quic_sbillaka@quicinc.com>
> Subject: [PATCH v6 02/10] drm: add helper functions to retrieve old and n=
ew
> crtc
>=20
> Add new helper functions, drm_atomic_get_old_crtc_for_encoder
> and drm_atomic_get_new_crtc_for_encoder to retrieve the
> corresponding crtc for the encoder.
>=20
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 60
> ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  7 ++++++
>  2 files changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58c0283..87fcb55 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -983,6 +983,66 @@
> drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state
> *state,
>  EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
>=20
>  /**
> + * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
> + * @state: Atomic state
> + * @encoder: The encoder to fetch the crtc state for
> + *
> + * This function finds and returns the crtc that was connected to @encod=
er
> + * as specified by the @state.
> + *
> + * Returns: The old crtc connected to @encoder, or NULL if the encoder i=
s
> + * not connected.
> + */
> +struct drm_crtc *
> +drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
> +				    struct drm_encoder *encoder)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +
> +	connector =3D drm_atomic_get_old_connector_for_encoder(state,
> encoder);
> +	if (!connector)
> +		return NULL;
> +
> +	conn_state =3D drm_atomic_get_old_connector_state(state,
> connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	return conn_state->crtc;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_crtc_for_encoder);
> +
> +/**
> + * drm_atomic_get_new_crtc_for_encoder - Get new crtc for an encoder
> + * @state: Atomic state
> + * @encoder: The encoder to fetch the crtc state for
> + *
> + * This function finds and returns the crtc that will be connected to
> @encoder
> + * as specified by the @state.
> + *
> + * Returns: The new crtc connected to @encoder, or NULL if the encoder i=
s
> + * not connected.
> + */
> +struct drm_crtc *
> +drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
> +				    struct drm_encoder *encoder)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> encoder);
> +	if (!connector)
> +		return NULL;
> +
> +	conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	return conn_state->crtc;
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_crtc_for_encoder);
> +
> +/**
>   * drm_atomic_get_connector_state - get connector state
>   * @state: global atomic state object
>   * @connector: connector to get state object for
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 0777725..7001f12 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -528,6 +528,13 @@ struct drm_connector *
>  drm_atomic_get_new_connector_for_encoder(struct drm_atomic_state
> *state,
>  					 struct drm_encoder *encoder);
>=20
> +struct drm_crtc *
> +drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
> +					 struct drm_encoder *encoder);
> +struct drm_crtc *
> +drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
> +					 struct drm_encoder *encoder);
> +
>  /**
>   * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
>   * @state: global atomic state object
> --
> 2.7.4

