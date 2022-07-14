Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA5574444
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 07:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6FBA1F68;
	Thu, 14 Jul 2022 05:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A81A1F68;
 Thu, 14 Jul 2022 05:09:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E4Qe80003328;
 Thu, 14 Jul 2022 05:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qti.qualcomm.com;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=rOMZ8LoGeQgBhQiosX7CdpNk60/LriiMGP4E2u5hFIU=;
 b=SP71L09Vn4tFPO0GeDhHqPKPPDpCHEDHaKNFT6GJvfbA/3A6UeiCVIEZGefohy4d/cx7
 cI+saZXvKm+e080Or5ww1bzuLonvHi4Ezc1Hp6PE03dRoq4VD/pMOY8o2Y8PIi4av9I9
 R04FYt15aooQSaNlMecTVcZpmGH7VHyrAInGHJKm67Im+eFARtSeEkYmoMckpyXfVKh9
 Uo/L1kFs7eY1Ge+i67xIUzNREZt8fnD9PoPXTmSDjTlkU4kMi7uSMxTxrjpEMZgjUpkv
 MIGzZZHvdlgoyZgiDl6Wln4em8kBtPUfFsenYDTM1m7tx1QImHLHC89KjFihb+bzaNwv Aw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h9u14agfb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 05:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSyMnKYLhbwDfbw1QG8w4ZHAK91TsI8pMjR0iLh39GH86rvjrZewv3rorm0QbP5ZAoL6+UW0UnlXsQQ7QxScv8TQn+cgILvlgZjScgd2hh9UrUjN/Qy9tXF7NjSBqYvGzoxtGr8TMENpj63FVLJ+0WlGPtU13IzfqCCAOee1vavRL/qfPntqwN3l19Cl9RfC8A2e7rUOmeuEDasw5HBp/ZjZG2VNDGrPLwK5MGo0ZY8ucIkB7gbLPvrvmINB3fNkJAA0wRxW0XB7oNibdGvg1mELzZfM2EkBsc/N7Dw9tC0D4Nq7j9TcPZjMwI4B3dS0XW+ijvkIxtUsNeBmjNw0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOMZ8LoGeQgBhQiosX7CdpNk60/LriiMGP4E2u5hFIU=;
 b=GQdE6ec42gdLePTxoamxtukylwmj7YYlfUPIi/bFprwwQEGIQC2yd1wubfGjGy1nmI8YCa/06Z5B6izEDj3/qXSnQmnrc/nYIKxT62BwVFSMHZKwKHCEmRLsoYxR+V9AZnhGCEwqPf9dATMrEXTqkkLt+zvGLkysbOsEaxtYtCkoFihKdyZXDXX7KRLoSLwSjwV/5dwe4Oyvelto9+AttLrItxqTu+nhEGOQZQEP8WYgLEWRVYsY9K9oh2xOxRvTj2CgSRm8G8dTt7PxwcDDkeOyfRQ4hqL3bEQlr8rvuJvGjJWveFWNKJa6a7zy7RDJocbxHhk50gNbKIrRtLqvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CY5PR02MB9013.namprd02.prod.outlook.com (2603:10b6:930:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 05:09:28 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7%6]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 05:09:27 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v6 07/10] drm/bridge: add psr support for panel bridge
 callbacks
Thread-Topic: [PATCH v6 07/10] drm/bridge: add psr support for panel bridge
 callbacks
Thread-Index: AQHYlSXWx1x+JZs89kaa8tVbyhISza19VXaw
Date: Thu, 14 Jul 2022 05:09:27 +0000
Message-ID: <BN0PR02MB8173764A946F6400ADC64AFDE4889@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-8-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-8-git-send-email-quic_vpolimer@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed9b78dc-74ec-4d20-1d63-08da655706e4
x-ms-traffictypediagnostic: CY5PR02MB9013:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N/0dAl9Qry93TOg7TEckZFstBiGVIYvkC1tMYsX97Uy/SJ1oJzkef13Ic0ZnP2Z/nnT9gHxiSL45Hvf0fCc+tsSCZ0z220gLGmrhXG6SmXVv4AxBvw0OLcaCV2+Rmf2xn33kbzTvbdoZBCgWttJo/D5iUE0kveptiK2HnJtmzNGrKP8vvt4H1vMkaSM+obrS19MR3z4cnz3yLX8IMJv2dbvZbhHscpg9Sp1EVBoQrbic1aW2Qrp9BhT1dqhUJlSIC9LxOnnsL/V57GzW40dqoQqdZgQ6cnFwjIR4FU6/unlHZPwWJfevTKPqOvlmmhD/puiX9DJL1ihlv5PDZBC/Ah5bplolfMaf2nQJfD0jBuVpKok5e9PJtxQccOPLEyY6bxdbNbiZ7dW+BoMZ0mw7c2MyxNvYv94xiwHt1TGjnXRP/mcnmKu7FjUhIz9vNo/5Doah/RoMSMsUohNjS1U00p5iGRNx9+yE17x2A6hROoMvj1CldOrB31nm2LokwbiXiDnCRXU+KhNtOEhtiPdQFJrOWstOKURmEVz+PLoXR/80vy9oZROmBGoYwTEDqKXtrp7fv32kegdrXCDu5x5anb8TXWHZO5wxhwisGaGpEMKXYIfV2aVED/b/Ur/v/yOqNX92ENqSJL5LpdqjqupHCJXR1uDDu3J3DK0YO8P4ixv6LXYgGgxEeJXwOEkMerC4OEHQXoVUGFNyAzOVvzosu+FZI5663dGmX35XdkMId4D4Kf/17lfoS8UxYgRhoAT2QGzjjmUMKXfWiOQUn7SZW6RbRG950CfbVji+HpWMjFFCLu2SLzL03SBqAdZfgWfv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(38100700002)(122000001)(54906003)(38070700005)(316002)(110136005)(83380400001)(55016003)(107886003)(186003)(41300700001)(8936002)(52536014)(5660300002)(9686003)(33656002)(7416002)(478600001)(6506007)(7696005)(53546011)(8676002)(64756008)(66446008)(26005)(76116006)(66556008)(66476007)(66946007)(86362001)(4326008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gdKaecnIiAH1BvO+RDqGFO847AuevN4lqXOBrGlhxcmilB2JoZE3QBHccRKk?=
 =?us-ascii?Q?bUFBUfgTRrmXJvZ75A6lt8XidRSjPdHopzELtRycO5DzFsvgFdtSM+q/HVco?=
 =?us-ascii?Q?Nb0s34F1KQmKG8Snu2Xjv8CVDbCSRwsGk0iWg0Fx6zt01ZLiMqelx66oHRuB?=
 =?us-ascii?Q?E6GU3PoYbszUO+LcWFG3quf9HsdZz7eg4zlj9L87Zdc2KhhI/YqOSu2VlCbs?=
 =?us-ascii?Q?TXVsPO5D2BV8gVb8RB4acWOkZoqfnFrH6LwCQUb4xD4qu4hEUnY36mRVTgD+?=
 =?us-ascii?Q?jcAPTgPzvQqouMIYlmM6s5eKEp6ryaxCXLkUH1BT6QHAb21rgrq9CneHNHST?=
 =?us-ascii?Q?NN7Vn4LZR3si1msRs5sDR4tkWd4Jk+iWOkI6Wbs8mN87+qavY059VrmkpTjA?=
 =?us-ascii?Q?3DArxKUeRIfmkD8bc17bPFaESgQv720SJGLld21YSeJLSjF2oxYeIxl+mhUI?=
 =?us-ascii?Q?J22PsgTJ8AWq8rBm2DOuYEDHoEJgCfBnhTY5vFnpAnVJBXax1CyIQcR1eKIi?=
 =?us-ascii?Q?jUnN+C1M9hmfiuMMYFfopNlIssGWGfP/O79skkzuPGjtHGaubpwtbMPovSCh?=
 =?us-ascii?Q?xOGxsOjISfUKKQsSj/v56lXLuXW9ZLuKO3Mrbwx/HyyJuSH2UzYjXi+B17sE?=
 =?us-ascii?Q?QbDpFs5iF1r9Lwfndq+kQ0amlwgU0kJaqqFj8cCyOFn1UXM9CjwEMXMmiRa2?=
 =?us-ascii?Q?V4znRBGkTNdZ6mw6D51ZInR8oF8+GtNah15JhMo+0XOkC4eKpKZsedQEMwpF?=
 =?us-ascii?Q?/rBrE8QYdEXv1sbn7FuTwFnyp0F1JJfnL10wsc/0TgpB05khInD4vPR4pKJI?=
 =?us-ascii?Q?okLwvxTkxqUqEI/aMbBDSgMtuHoC+FG6MVsp9TkbjkmXUNBXDhhOvjHi+hoG?=
 =?us-ascii?Q?gnbNqBOEuF7vtFPB4PgcwYJKM159kxeENtuspCdlGWLoAtGQj6Ce4mo+3GED?=
 =?us-ascii?Q?HMKuJ3xDPTcxY7cYUK1HugfGsxuZGZgJ2D7tapd3eqT0yl5k+4d4KQ7AVCrJ?=
 =?us-ascii?Q?Q5unm3UZqKwFMh61or9QE7tEVM2gntftxil0CMGPVjO8Din3ImJ1bExUVzDf?=
 =?us-ascii?Q?LHfrzhcsFqEsZSw3cHKTBnY6uEXAHzKykC7FEGrDxpoLquyhZJo3RpuqQWAd?=
 =?us-ascii?Q?8uyUOjGN1xGEcXl54xFmC+W1aQqLwRypqOK+R6tWtku4LmOvp8TKam4xE4j9?=
 =?us-ascii?Q?yUc6rzXGGCvkmj2wPm9wsEmRdrKDY+8HjSwJLnJUsnuXt8GKdnfJqSXfI8ga?=
 =?us-ascii?Q?C/OHCMQOhhvLVV7z+a/wc3MOWswLj7ML8pVnjWTFYT+XaCJvtiPN7dVGAqLH?=
 =?us-ascii?Q?xzwH3HrFgmZ6jRyXu5u7dwftw5ElcyYgvTLaW9AfykcG8AX40nChe3+E2aic?=
 =?us-ascii?Q?YyFiRqI9lFsskBmC4T7Rkv1Jlp9bhsBNG3U4MuOfbaq+RIDfrtYb1w1E/vz5?=
 =?us-ascii?Q?T+cyAog59t0HalCBlXRVPT2dpwuk+JCB+I0/Wn5kCEZjrMkGsfUBYpbbO3Ex?=
 =?us-ascii?Q?IhVJuP3YXKmwA2WBmXUyMNjOwAFeF6b1IAzGD/H8645mXw8v0ZhVpEVxqoA0?=
 =?us-ascii?Q?4Xojpy/Xv1dHB09o/SsrcKVksc5TI7aCGV4NUI4bnUvreeJt3K7feUtmPJXE?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9b78dc-74ec-4d20-1d63-08da655706e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 05:09:27.8207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QSmf7bCr09beVgvVjpL3THRo8iKFpp1lJ2ykJx+hp58L91yOqgoPZzHicy1RnntYGzFdKbxhW+d7rN4r1piqyi4BTBz0CSS5XoUq6TOfspE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR02MB9013
X-Proofpoint-GUID: 0-8sm8xjraeovRZ_AbFzfztbTBYQyhF8
X-Proofpoint-ORIG-GUID: 0-8sm8xjraeovRZ_AbFzfztbTBYQyhF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_03,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=930 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140022
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
> Subject: [PATCH v6 07/10] drm/bridge: add psr support for panel bridge
> callbacks
>=20
> This change will handle the psr entry exit cases in the panel
> bridge atomic callback functions. For example, the panel power
> should not turn off if the panel is entering psr.
>=20
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/panel.c | 48
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c
> b/drivers/gpu/drm/bridge/panel.c
> index eeb9546..9770b8c 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -112,6 +112,18 @@ static void panel_bridge_atomic_pre_enable(struct
> drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state =3D old_bridge_state-
> >base.state;
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc =3D drm_atomic_get_new_crtc_for_encoder(atomic_state,
> encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(atomic_state,
> crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>=20
>  	drm_panel_prepare(panel_bridge->panel);
>  }
> @@ -120,6 +132,18 @@ static void panel_bridge_atomic_enable(struct
> drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state =3D old_bridge_state-
> >base.state;
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state;
> +
> +	crtc =3D drm_atomic_get_new_crtc_for_encoder(atomic_state,
> encoder);
> +	if (!crtc)
> +		return;
> +
> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(atomic_state,
> crtc);
> +	if (old_crtc_state && old_crtc_state->self_refresh_active)
> +		return;
>=20
>  	drm_panel_enable(panel_bridge->panel);
>  }
> @@ -128,6 +152,18 @@ static void panel_bridge_atomic_disable(struct
> drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state =3D old_bridge_state-
> >base.state;
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc =3D drm_atomic_get_old_crtc_for_encoder(atomic_state,
> encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(atomic_state,
> crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>=20
>  	drm_panel_disable(panel_bridge->panel);
>  }
> @@ -136,6 +172,18 @@ static void panel_bridge_atomic_post_disable(struct
> drm_bridge *bridge,
>  				struct drm_bridge_state *old_bridge_state)
>  {
>  	struct panel_bridge *panel_bridge =3D
> drm_bridge_to_panel_bridge(bridge);
> +	struct drm_atomic_state *atomic_state =3D old_bridge_state-
> >base.state;
> +	struct drm_encoder *encoder =3D bridge->encoder;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	crtc =3D drm_atomic_get_old_crtc_for_encoder(atomic_state,
> encoder);
> +	if (!crtc)
> +		return;
> +
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(atomic_state,
> crtc);
> +	if (new_crtc_state && new_crtc_state->self_refresh_active)
> +		return;
>=20
>  	drm_panel_unprepare(panel_bridge->panel);
>  }
> --
> 2.7.4

