Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C16574440
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 07:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C11FA1E47;
	Thu, 14 Jul 2022 05:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC918A19EE;
 Thu, 14 Jul 2022 05:08:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E41RCC018805;
 Thu, 14 Jul 2022 05:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qti.qualcomm.com;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ugKIBKQ8tmh0X7AszTrHAZrqo1QaTPUBfKoSbofQBpo=;
 b=UukwVS+VO7Qrz/9W8SXDX9ZjwdQDVUABc/lMIBNqbgi8WZxHSwzrUgmJEY9vgVxOMXrm
 uZYfiXgXSKw9CMZji5pHSEXXADzL3u9v1zCBqzWDsFsUwR3bzgxaetu99DrcmXCc/Odo
 kbedKgRzBquF4KhUnjTS2IIZdDPEHA2k34AOplhyw4wSkqHkDW+nAE+A1cVEwum2Y4/L
 9NAWoIpyucZ6DPyMR2onx3M63xu/rEWOuY9wSRJfggdj6mgcykvPUN7+zVx/uDwMgfkG
 mG9oM/InRt5VBtc/O8M9Tr9UbKamfHkpvZhyUTTB6bnEyZfwTSbjqc2AIklb+MYk2Idt Ow== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3haaba8931-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 05:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws4ApJwKdfn04vAMcMInbWZnlfh0PyfrvcMZg+3Zm1a01uWbAo7XmcnhVKkjxiEtCBVnCWIxofqz7B7za/H0IgYHnbCwzsYlnpwWwTZCMl2MoOD2BojllZ1wJnPbVyvEcDKIWCQyj8+nWFMjMgKPH58h17OtrmXI3bicBAn5GHmoE6t6l73Yt5kZmNa3KMR+VBFG1/GSrGtVvzLi36mv5YXisjRQlvJXWL2WHaWfeP7/a5HvwwmesZKICk2yKtrzEFh6pCQDDffW/betJE7lpusXEwghQIpmrsJq5UWdIMGpIq7x+ARwz+Uy4udndWeXxK4prbdP6/z1GhXcdNAg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugKIBKQ8tmh0X7AszTrHAZrqo1QaTPUBfKoSbofQBpo=;
 b=k5XkOR5Sy8ck7r1UCHL6RvMMn7gN7AAcLZI+L0KeNtd9CSBDgM1Vm9L0329cMN4FAsf507tN4zbsyQTIcyT4py1wEVW0Euku+OnJf84NPWyO+GYd3oAK8wEfP1MbgstTzUO3o+DA2h3BL4HmICtI6hpTtooMLI3xhBtOZ7jZO391xOg/Opj1Gl6MW4W7WvBC1z9Gpn1H88GDV2T7EEz7wGUJOR6rLNcFgRwn6pC6/1zkSE26OAjeX4IT86IfoQCLyn4zitfWHh/aYZ1dR8mYs8I8lE5eRUYQJ1JyHAHIVqEf9FyX49KNPHsc1BlsP8fGG4kicfQ7DUMOLYTAtxcVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8173.namprd02.prod.outlook.com (2603:10b6:408:166::9)
 by CY5PR02MB9013.namprd02.prod.outlook.com (2603:10b6:930:37::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 05:08:51 +0000
Received: from BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7]) by BN0PR02MB8173.namprd02.prod.outlook.com
 ([fe80::e1dd:9b38:7042:ea7%6]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 05:08:51 +0000
From: Vinod Polimera <vpolimer@qti.qualcomm.com>
To: "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Topic: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Thread-Index: AQHYlSXRWmdFe8sHw06OlQE5JVBCS619VUtw
Date: Thu, 14 Jul 2022 05:08:51 +0000
Message-ID: <BN0PR02MB8173546D79BEC3714073201AE4889@BN0PR02MB8173.namprd02.prod.outlook.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01c9d8d9-0bd8-4a51-a1d7-08da6556f153
x-ms-traffictypediagnostic: CY5PR02MB9013:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NZEShuWGE2zOVjePmLQnvykCrBmjtcyDH44Q4p8yQnmOFXz2IEXqcohTI3Eq/J5p0m1Gh8ODmcKS0WwY/asQTio62PDBAQ/CO5cpeQWzlgjCx+yL9N99b3DQenoiKUY2FPFXTkkuVta2Dj5IyPZk0dQJJQ+uzc0dlHaf1c/pLov0P8j0qCj4Mg/4t0QMqwc+DYlFMAwv6HMdJX77+4ZDDH/QV3zaqUo2yVRxx9ifTyyM7wPqedyCZ7N/REn8FbqGlmEsqPiiCOyK4Grh1/xTzqefZaY40XvV0n6u6n0G4QGEC37bYnpDnUDbgaEEMCtuUqCI7FkY0AAeKe2JdgF3CeRYLckpKvIhZWcOX2hwc9PIzLcDHEWojE8tb1/dbSnRMKyHBLtATo60MFWxmVTfOnWrDywLmyaNDNupcNUCZzw9KnX793busPr0XCUsxaKN+BEBJ+yabui7NizVGT/G8NX8Ng01aaUPRWCd4wKwvTtLHM/aXL+lfxfwd5lAcDL+IyJyKtKV+zczeFkgeOaAAwsgm2d+C1cSf1X6DI6X0qlD+lBKo3SwnK200rdGwv0kACorKrNRr8z0HchT4eHYjCDqqbLnbRUwuIbX1LvheapkwqZQidzC8JsEveIsFX/GM3FSF7sF9Grj+ztRKB6B3mqmojUhejtnxwL+BPK79FEbDkLEb08osTsHzfBiXOqwgKQ+fTESPPqkPoXw/MOsHK2O8IqzcQEfoD+QtwYBi1cfEAg1lbPK/e5m3AoWGyxqcPoe1M5bJpFvpkYYKMBUUrr6uR1kYQk3doPYqTROaB0YooW0JRomd+oQF5gib/U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8173.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(38100700002)(122000001)(54906003)(38070700005)(316002)(110136005)(83380400001)(55016003)(107886003)(186003)(41300700001)(8936002)(52536014)(5660300002)(9686003)(33656002)(7416002)(478600001)(6506007)(7696005)(53546011)(8676002)(64756008)(66446008)(26005)(76116006)(66556008)(66476007)(66946007)(86362001)(4326008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mgBZh5tzk1tWpexpsAxJ9ehUqFL1JDmhBYRGjU6+uBmtyMDwhRM7xUDztDHX?=
 =?us-ascii?Q?80FBJ3kEhd5hoRMyyVkNhTsVH6Ce84Y9W/qHoDXGEJKcszHHghdJ2gp6iPsL?=
 =?us-ascii?Q?G7HR6E8pADxL56Bws6RQdZm4i4fNtnn/Z8jbdUhpA9/yNxdiIqQksdlIEkaM?=
 =?us-ascii?Q?95t6R3sZawNdRmWnx7XjIs1Uv4LXW3JZwK44JUpxmgrJmGygAhOQ7P5UHQ/x?=
 =?us-ascii?Q?ba3GifEQhXwAvf8MsVpu91z8lyd1b64jVOsNobOvpOXtnpBqgJ3OwZVp5v0E?=
 =?us-ascii?Q?vouHUJqJAyO8+P8g582T4734dJMMDFa1A+QKCccT9oz6+pYGYBpVQSirFF+f?=
 =?us-ascii?Q?fkk9yWMeSzJVIAeQfcqT9xez0uJ7bU4wntBDXZ+UFeiSE1kWJOmM6R/OJgZN?=
 =?us-ascii?Q?uxhmm9vaSwerrVLuu57TfNUbdyQiD1QWCGRGlbFkJvspeGyqZhLbdxPBcZrf?=
 =?us-ascii?Q?k0+H+GKyJgDIWB5hZ0N+kOB9vW3MDsYe06Aqizu8M21X0sk8PwpfzFfs0rgC?=
 =?us-ascii?Q?uEAZQ6zo3khenTY1PgW9k63pb3Qp/LDcsD0ddCGipgXU/AiL93Zn6RfF4WJY?=
 =?us-ascii?Q?Ie2wBPRn3tIKWtEySmGwc6Siar8j/veJuqx0n4gdJ00F/fT1hbq680uspA8P?=
 =?us-ascii?Q?mit+27eJBemeaO0mnXUQHObTPbseth55T3/zTYK2JH1UoZEwnLMzWHe85lTD?=
 =?us-ascii?Q?VdjSlUn4mgLqIEJPAjj0rowdZwTdWdsYHZ+B0UjRpa8Hk/C8BSnF6SBO6BeK?=
 =?us-ascii?Q?GfwUt/fC4rItq+OyZm8k4Dk6ROn3lH+w6bnISVqegnLi5TBUXGyGswaxUApg?=
 =?us-ascii?Q?e6SDTbJpjElgS8KYC2w1aSNJOjrOy9J66ikFZomc0UtbatKcxzQq8JcDfaYv?=
 =?us-ascii?Q?V/aDIWFWNh/JbvzJO4KFOmwBuyVdkvcs+wTXfDi2NfCQ2tLGMvxWeR7S5q4b?=
 =?us-ascii?Q?wPHc/qyEoumWYdAN/9MTsPfZhBTDF3vUQxzqg1XeDtZcCJ0u/uRqJMk50UP1?=
 =?us-ascii?Q?JPdJtlg5L871QmfqxTmpyxO5JjvC2E8jakY+U5zg6mk3i9lckV3//z4UR5sK?=
 =?us-ascii?Q?Ct1Ti6d5V0aNaJKy40tjpZEeFeP5oS2NIibZ8XoaSHvGt54Vx7/ych3z6cuM?=
 =?us-ascii?Q?r4RDuL4EBMHPo5nLw/+WqG7WwrSk2X3ctQmE3Ve9o7MGY0Kcvc9CVs6Jx0Vy?=
 =?us-ascii?Q?saSfRqWZKl6t3DtJIEICEA+SYhRME5rwZnoCCV4NFXdM+AR4W8NJe9qrbDGA?=
 =?us-ascii?Q?8pvkhHZfnyvQkiVK7bWbPLi9FzHEcfdnEbi4BpyLKt+j0cP+cwBdoe2+A5ME?=
 =?us-ascii?Q?heEnkrOQD8CfAF5yNnH/+uSEqBRc8yZUuRQQqYr1c4Q5NyDnzh2vODhhoeii?=
 =?us-ascii?Q?rYUv9+Zt0o5mYRco4YISdIstYOUNZtBfL0oG/6f6PgX9G/qfKzTiFNTUzb9o?=
 =?us-ascii?Q?2bwwPxaPwOT63UjIIZugboU7XoKoirS3GVfKHh+QBKoCuhpK3iOdqexckYt5?=
 =?us-ascii?Q?Sf84LRbHESL5xMeBNZZtefAG3t1iLk3UCpBMlXAxQTG8DbzKQdj5iXd0by95?=
 =?us-ascii?Q?dDDGpWkdaRpXlPv3GjUEVFq0BoYlr3utVRxIjMkc9Qnm8LuKJuhdW9RWDmCV?=
 =?us-ascii?Q?rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8173.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c9d8d9-0bd8-4a51-a1d7-08da6556f153
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 05:08:51.6104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mbyOHuSOu8SFu4z4RJqi5hdVf9+fOrJrx0hHD4HeOrYDMT45MqdaWHP13P5jkO/bhWAda+ushIAbFz79r4/CpQ3cFeDLJ5SN6jRLE9gRZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR02MB9013
X-Proofpoint-GUID: HpWQ7q69dL7S8HUFB5NdsQYdpP63w9ca
X-Proofpoint-ORIG-GUID: HpWQ7q69dL7S8HUFB5NdsQYdpP63w9ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_03,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=870
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Subject: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get
> crtc from connector state instead of dpu_enc
>=20
> Update crtc retrieval from dpu_enc to dpu_enc connector state,
> since new links get set as part of the dpu enc virt mode set.
> The dpu_enc->crtc cache is no more needed, hence cleaning it as
> part of this change.
>=20
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 ++++++++++++++----
> -----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 --------
>  3 files changed, 14 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b56f777..f91e3d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -972,7 +972,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>  		 */
>  		if (dpu_encoder_get_intf_mode(encoder) =3D=3D
> INTF_MODE_VIDEO)
>  			release_bandwidth =3D true;
> -		dpu_encoder_assign_crtc(encoder, NULL);
>  	}
>=20
>  	/* wait for frame_event_done completion */
> @@ -1042,9 +1041,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>  	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>  	dpu_crtc->enabled =3D true;
>=20
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state-
> >encoder_mask)
> -		dpu_encoder_assign_crtc(encoder, crtc);
> -
>  	/* Enable/restore vblank irq handling */
>  	drm_crtc_vblank_on(crtc);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb..0fddc9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -181,7 +181,6 @@ struct dpu_encoder_virt {
>=20
>  	bool intfs_swapped;
>=20
> -	struct drm_crtc *crtc;
>  	struct drm_connector *connector;
>=20
>  	struct dentry *debugfs_root;
> @@ -1245,6 +1244,7 @@ static void dpu_encoder_vblank_callback(struct
> drm_encoder *drm_enc,
>  		struct dpu_encoder_phys *phy_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc =3D NULL;
> +	struct drm_crtc *crtc;
>  	unsigned long lock_flags;
>=20
>  	if (!drm_enc || !phy_enc)
> @@ -1253,9 +1253,14 @@ static void dpu_encoder_vblank_callback(struct
> drm_encoder *drm_enc,
>  	DPU_ATRACE_BEGIN("encoder_vblank_callback");
>  	dpu_enc =3D to_dpu_encoder_virt(drm_enc);
>=20
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	crtc =3D dpu_enc->connector->state->crtc;
> +
>  	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc)
> -		dpu_crtc_vblank_callback(dpu_enc->crtc);
> +	if (crtc)
> +		dpu_crtc_vblank_callback(crtc);
>  	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>=20
>  	atomic_inc(&phy_enc->vsync_cnt);
> @@ -1280,29 +1285,22 @@ static void
> dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
>  	DPU_ATRACE_END("encoder_underrun_callback");
>  }
>=20
> -void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct
> drm_crtc *crtc)
> -{
> -	struct dpu_encoder_virt *dpu_enc =3D
> to_dpu_encoder_virt(drm_enc);
> -	unsigned long lock_flags;
> -
> -	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	/* crtc should always be cleared before re-assigning */
> -	WARN_ON(crtc && dpu_enc->crtc);
> -	dpu_enc->crtc =3D crtc;
> -	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> -}
> -
>  void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>  					struct drm_crtc *crtc, bool enable)
>  {
>  	struct dpu_encoder_virt *dpu_enc =3D
> to_dpu_encoder_virt(drm_enc);
> +	struct drm_crtc *new_crtc;
>  	unsigned long lock_flags;
>  	int i;
>=20
>  	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>=20
> +	if (!dpu_enc->connector || !dpu_enc->connector->state)
> +		return;
> +
> +	new_crtc =3D dpu_enc->connector->state->crtc;
>  	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	if (dpu_enc->crtc !=3D crtc) {
> +	if (!new_crtc || new_crtc !=3D crtc) {
>  		spin_unlock_irqrestore(&dpu_enc->enc_spinlock,
> lock_flags);
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c..edba815 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -39,14 +39,6 @@ struct msm_display_info {
>  };
>=20
>  /**
> - * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned =
to
> - * @encoder:	encoder pointer
> - * @crtc:	crtc pointer
> - */
> -void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> -			     struct drm_crtc *crtc);
> -
> -/**
>   * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or =
off
> if
>   *	the encoder is assigned to the given crtc
>   * @encoder:	encoder pointer
> --
> 2.7.4

