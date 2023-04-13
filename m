Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A36E1374
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 19:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1518810E380;
	Thu, 13 Apr 2023 17:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91E10E380;
 Thu, 13 Apr 2023 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681406735; x=1712942735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bb5+3GoxaHgISWW57Gol7uQPSB7Qydnk9TuKgRnqnM8=;
 b=YnMpe4+q8l7JH5p47fxOwMAJQPmIIPo8Yczmc8pXvumCBKCU9692AdKJ
 1dw7KhI4tvyz9ozphG/qKLIhsO5l//vvVsX8fLgavHWYJzupJql7QqkB+
 FhZy/LWgBpri5Rq5e+VJGfyFtA0C0INzh7+GQRZxmk4jGshC9i2OZgFr8
 TzbjEc56gQH2Rm0/bwgipdHg8k6efMvArgY7WBchtN1Ajf2dqksd4fc+z
 1R97jAA/ZwN9sNNYWTyFRkTZevcZCXFsS4fSbQO7SfCi48uum9wruz6/b
 HqndgMByZp+YUxDwM7fiQIpSCxLrvaWW1QENwBWQf52DfhPWJqoKEEtcQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="343005413"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="343005413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 10:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689436089"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="689436089"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 10:25:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 10:25:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 10:25:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 10:25:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 10:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD0pWgg1kE91N//AgyMqTDq3i5PVe4kUe8C1GtYLB2KwuvYCtwn7LIy2P6ys5qgOk0CRqmqKxjNOW3UOSIOlUDipYpVpY4ppBqN8ICQm0RtX79XvLQijenVqfyjOke1hHm7sBBzQfQiRsTAPJwGFBS1ZybMQe6QwR8neIF1WyRoXMXyO/mB7oYjH1pLyeqJYwxeNnfNr7wjShbfuNuivfAWW3fnTGG37DRSW/t8VxpNAMiaXzSv+k3w8eHnrilhNH+WGTi+HrOKbKe7dtP/iDZRg7TyZZ256ew8Kv7cEW72gNSBKOeT+nByQAfs/uUxzpdSSoKDXZdgVR3VJC38ncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve61G4Nek9TAyl2HzyZxby6HMB4uDnaxUE8ZGsqYqAM=;
 b=Do71/r5h41XgL6hQF3/rXno93AzjQqXT7iRDX2ctUOZer6N/wJhmntT3+F+CRYyfljXfJUskCFeR6eySI6luMhSt2PQ4RycO1ylBoGwqHngBlkmVYDXXNbCSRkBVKC5EdNXOK0pYfUjfIWiBtpmKSx3COGRXn41hwjI5HDpfgdoBTfLHLDym0r1xdb2HMnNyEeX/VwNscci2mUlq9GsAZ3+lbjFlToAAz+SSZphPklJ6DG6In6hLUN51OSQ/RjTFOgaWwrGRGP0ToEpDr0YDVAxKHSDqGWvNy3eac9aKp2NLAXHPufIRsmgLOyHWOaP4+9DxV7BF9FObLIebUMFUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 13 Apr
 2023 17:25:12 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3541:e31b:6f64:d993%9]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 17:25:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [PATCH v4 08/12] drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC
 parameters
Thread-Topic: [PATCH v4 08/12] drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC
 parameters
Thread-Index: AQHZZg4E678Q93xMIEubQF7hjIB+v68pjVtw
Date: Thu, 13 Apr 2023 17:25:11 +0000
Message-ID: <SN7PR11MB675048DBEDFE8CD781628198E3989@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
 <20230403092313.235320-9-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403092313.235320-9-dmitry.baryshkov@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB6329:EE_
x-ms-office365-filtering-correlation-id: 86d0ce2c-8a04-4235-0f4b-08db3c4409a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TEj8mMrqBWvQ+EI/axDlw2CwNBb4TIeHsfBYLck3Of2QQDkCZGSRygmQv7rMsafhrYIXmRCj4VOiTEC50keRprXE3pHX69ABNideHmuYGIIWEPQ8F1soxXiISA9mER+6jnzE4El+bDHtz0hiiBpxo97O2snKr+huTP6SQDoMTv7U1PK5H2E7LjGAnCtU1/GN3GZ+lcXU/gpDyoK8vwUJyUuKWzYuTc8lo87D6T/jZHVF3YQJhkk4MQ5VfLN+fKLNTIQbmre8/g7nILMSaZ2xQG4q29Z6kKbeBvYFNkOpUhExx44lV6qTBwHz9JDSyCZhVdXMk2HHghNChg3YZTsRz5W3ncjLEY9B37mQgFEkoQuPUnt0+dEkRabeN6Qsq9FvV9HipQro1jQl27t7Tp3ZRFY0sOhmMc7Dy8FqIG6HMk0QsRzbOqWqkQYQX2h1/n5oSUS7ZK8hYC82ip8HTBkvSiyvgHHB9kPigZ/Hd1n2toAEmt4kHQH+XE9hnNsd2VuhlqbwuMq81Zb/yVFLJljYaGJPU1X+MCYMQth55sQ/6N0VFxsgqOtkeP8XkNlP0PZ5qndYj22Ee9NkIRaX0uDsRLbc1YPAcRULiOfD6eYuzIhtapJkmTTdifsEtOKPrTrcGvrghg/XMweRNEZcxnvehQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(82960400001)(8676002)(55016003)(64756008)(122000001)(38100700002)(921005)(5660300002)(38070700005)(2906002)(41300700001)(30864003)(66446008)(52536014)(33656002)(8936002)(86362001)(66946007)(66556008)(7416002)(186003)(110136005)(76116006)(4326008)(6506007)(26005)(9686003)(316002)(54906003)(7696005)(71200400001)(478600001)(66476007)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3BAfkV9YY2LfLuuJLMr5aLdFNYqNPI6Dg+DlBaCSIFXl1gDp7pPgjNLc47?=
 =?iso-8859-1?Q?QoPEao2xJmFC7xYQXtr69hbJ3Txsm1phkyyGfwX3OkxxwjiVk55OnT+VbM?=
 =?iso-8859-1?Q?GFrEgewf4LwBaJPUn/PNLCJ0kXZB8LnGSx6pgEx6RQqyudkNBNHquAKtci?=
 =?iso-8859-1?Q?cdA3pKAsvo3DLgLYMZYpBx+aPzGgYeBqJuqABFmcC6hAnCuxkysXqmg1E4?=
 =?iso-8859-1?Q?z0pNf5Pov3vzRyAgSn/D1AcnZLAh1hWP8tXnubdQ33zQwKFNvp4b2vh8jQ?=
 =?iso-8859-1?Q?+gHAtJCwSYQ24rAREmMs73CRDHNQf84kynUaYKKTcT6q5HL3TutgmF5xvW?=
 =?iso-8859-1?Q?SsPsXUHz9f/1EpYg5Uqvfe0wWD2OaHODDOGFdXL94nSKsZGuzRb+P2fLoK?=
 =?iso-8859-1?Q?cUKuyU9FLWSvH+Z+AjwXNumfUgCzCcJYO+2zgLtpCw60qgI0jMUYcxZpN0?=
 =?iso-8859-1?Q?QcqyHvLhtNZMfK43NoI5niq24HIJb5onqy3wYglfCE6Dz3aElPbQsnWgQS?=
 =?iso-8859-1?Q?j4HABw5FwBTnjd8NBGsHMtwqs5tn2ifJYQ9aN0q7FZ4hO2Bei1CMZe3Lkv?=
 =?iso-8859-1?Q?VyriP5A6GY8rRd3I6Xhgt0XH49E4bIA0XZY0FA/mTOK/sUsSw2xiqj5FNt?=
 =?iso-8859-1?Q?WatAMiytoQQExiD2mKbjC0dqX5+Ed1liV3hDOIRCZjgoIgcoqg8gcQ3z00?=
 =?iso-8859-1?Q?JqTquzNGqnKZgK4t/ffec2UGE42HMkErhNhVx4ho6qaa1zEfhq1YQH+Tsa?=
 =?iso-8859-1?Q?OtouRDhiotmJQ4cDHlqBDl36NfXPujDFYeAscxip/h/Kh8dEeMztRNBMuF?=
 =?iso-8859-1?Q?l0Owwuw+g4E6O7UsUGVe+osa6+9QuzUd5T1ZWs4XdW54ZpisAIpJtBL5rQ?=
 =?iso-8859-1?Q?2eZjgVXGci+ghi6scplY2jLuPXScmqCDqu7giRWAmqHxDx60O5jLwtmIeH?=
 =?iso-8859-1?Q?XWZz0xrg+lOJNOLlCmMs/rdmSYYfLLiprxq3BqAjA5fEGcgDBmGY51cjEA?=
 =?iso-8859-1?Q?G1YTgUEXB2jtOvQvp5GWY6PuCpkOoqMZZRhg8sHm4uBBgaXF9x0Qj+1S4F?=
 =?iso-8859-1?Q?WuMRh2GxmWUT85hHvNlaAqpmaRvPWQrxU3rW8nE/aX2bDZY3pPTOVUrst+?=
 =?iso-8859-1?Q?t3/7i9UqnjRvI0phEFCuU8oJ7TGVFthdrZLTR9vCZkr3RZWeGcPaQnMZZg?=
 =?iso-8859-1?Q?6Ajv8oxWOuZmC6fDTsyyqBsko1F6kSxxcfOhsa3ZH/oCe4tVD9YU0ivNKr?=
 =?iso-8859-1?Q?KNQvzo5lFJx/pKvE5fXzjqBZyg983C96MbHsXjRYihqsx7FrotkMgr2I45?=
 =?iso-8859-1?Q?ssmHf5pTBpbXQu6tv5Y9RuFrOlUy5jiAU4gRYptyVv2F1tUKXRhD7AV39n?=
 =?iso-8859-1?Q?LnZrmjt7ot+c+OxevE1CMtXvMiqH+OmzY95VY6tESfbOPTiuThGi8a01+3?=
 =?iso-8859-1?Q?WFxwPg4/tNuSQmsG9CkcyTgVsquhnG40obPGXzQ5G7PGWFR4KUWt1kl6qg?=
 =?iso-8859-1?Q?RK5X4zzCXBnAjgRLbSjV0fLfHJ1+UCQssVmjmeOtcIANpGCgh/erJqc0X3?=
 =?iso-8859-1?Q?NtunU3C0+nuh8OO0jyZsE2K5HgetNmBfUX8Gi8CrEgzwBTep4tcq3ubZ/E?=
 =?iso-8859-1?Q?eZFNuSmdaZsD1vHwJDyRJxqrxcNccrKG2i?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d0ce2c-8a04-4235-0f4b-08db3c4409a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 17:25:11.9822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iT20G59Qz+0B3Xo/0rRc05gv5FN0PRAgJr8o4cvld5vcQMlBlW3hasR1OB1P81mPj7Mzeq6FgvMWhOZwLjp6iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-OriginatorOrg: intel.com
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
> Include RC parameters for YCbCr 4:2:2 and 4:2:0 configurations.
>=20

Looks Good to me

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dsc_helper.c | 438
> +++++++++++++++++++++++
>  include/drm/display/drm_dsc_helper.h     |   2 +
>  2 files changed, 440 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c
> b/drivers/gpu/drm/display/drm_dsc_helper.c
> index aec6f8c201af..65e810a54257 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -740,6 +740,438 @@ static const struct rc_parameters_data
> rc_parameters_1_2_444[] =3D {
>  	{ /* sentinel */ }
>  };
>=20
> +static const struct rc_parameters_data rc_parameters_1_2_422[] =3D {
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 8,
> +		{ 512, 15, 6144, 3, 12, 11, 11, {
> +			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
> +			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 10,
> +		{ 512, 15, 6144, 7, 16, 15, 15, {
> +			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
> +			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 12,
> +		{ 512, 15, 6144, 11, 20, 19, 19, {
> +			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
> +			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
> +			{ 20, 21, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 14,
> +		{ 512, 15, 6144, 15, 24, 23, 23, {
> +			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
> +			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
> +			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
> +			{ 24, 25, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 16,
> +		{ 512, 15, 6144, 19, 28, 27, 27, {
> +			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
> +			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
> +			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
> +			{ 28, 29, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(7), .bpc =3D 8,
> +		{ 410, 15, 5632, 3, 12, 11, 11, {
> +			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
> +			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(7), .bpc =3D 10,
> +		{ 410, 15, 5632, 7, 16, 15, 15, {
> +			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
> +			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(7), .bpc =3D 12,
> +		{ 410, 15, 5632, 11, 20, 19, 19, {
> +			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
> +			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
> +			{ 19, 20, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(7), .bpc =3D 14,
> +		{ 410, 15, 5632, 15, 24, 23, 23, {
> +			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
> +			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
> +			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
> +			{ 23, 24, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(7), .bpc =3D 16,
> +		{ 410, 15, 5632, 19, 28, 27, 27, {
> +			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
> +			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
> +			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
> +			{ 27, 28, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 8,
> +		{ 341, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
> +			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 11, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 10,
> +		{ 341, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
> +			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
> +			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 12,
> +		{ 341, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
> +			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
> +			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
> +			{ 18, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 14,
> +		{ 341, 15, 2048, 15, 24, 23, 23, {
> +			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
> +			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
> +			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
> +			{ 22, 23, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 16,
> +		{ 341, 15, 2048, 19, 28, 27, 27, {
> +			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
> +			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
> +			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
> +			{ 26, 27, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(10), .bpc =3D 8,
> +		{ 273, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
> +			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
> +			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
> +			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(10), .bpc =3D 10,
> +		{ 273, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
> +			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
> +			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
> +			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(10), .bpc =3D 12,
> +		{ 273, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
> +			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
> +			{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
> +			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
> +			{ 16, 17, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(10), .bpc =3D 14,
> +		{ 273, 15, 2048, 15, 24, 23, 23, {
> +			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
> +			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
> +			{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
> +			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
> +			{ 20, 21, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(10), .bpc =3D 16,
> +		{ 273, 15, 2048, 19, 28, 27, 27, {
> +			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
> +			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
> +			{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
> +			{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
> +			{ 24, 25, -12 }
> +			}
> +		}
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static const struct rc_parameters_data rc_parameters_1_2_420[] =3D {
> +	{
> +		.bpp =3D DSC_BPP(4), .bpc =3D 8,
> +		{ 512, 12, 6144, 3, 12, 11, 11, {
> +			{ 0, 4, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 10, -10 }, { 5, 10, -10 }, { 5, 11, -12 },
> +			{ 5, 11, -12 }, { 9, 12, -12 }, { 12, 13, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(4), .bpc =3D 10,
> +		{ 512, 12, 6144, 7, 16, 15, 15, {
> +			{ 0, 8, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 14, -10 }, { 9, 15, -12 },
> +			{ 9, 15, -12 }, { 13, 16, -12 }, { 16, 17, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(4), .bpc =3D 12,
> +		{ 512, 12, 6144, 11, 20, 19, 19, {
> +			{ 0, 12, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 9, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 18, -10 }, { 13, 18, -10 },
> +			{ 13, 19, -12 }, { 13, 19, -12 }, { 17, 20, -12 },
> +			{ 20, 21, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(4), .bpc =3D 14,
> +		{ 512, 12, 6144, 15, 24, 23, 23, {
> +			{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
> +			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
> +			{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
> +			{ 24, 25, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(4), .bpc =3D 16,
> +		{ 512, 12, 6144, 19, 28, 27, 27, {
> +			{ 0, 12, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 15, 20, -2 },
> +			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 25, -8 }, { 19, 26, -10 }, { 21, 26, -10 },
> +			{ 21, 27, -12 }, { 21, 27, -12 }, { 25, 28, -12 },
> +			{ 28, 29, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(5), .bpc =3D 8,
> +		{ 410, 15, 5632, 3, 12, 11, 11, {
> +			{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 10, -10 },
> +			{ 5, 11, -12 }, { 7, 11, -12 }, { 11, 12, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(5), .bpc =3D 10,
> +		{ 410, 15, 5632, 7, 16, 15, 15, {
> +			{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
> +			{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 14, -10 },
> +			{ 9, 15, -12 }, { 11, 15, -12 }, { 15, 16, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(5), .bpc =3D 12,
> +		{ 410, 15, 5632, 11, 20, 19, 19, {
> +			{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
> +			{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
> +			{ 13, 18, -10 }, { 13, 19, -12 }, { 15, 19, -12 },
> +			{ 19, 20, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(5), .bpc =3D 14,
> +		{ 410, 15, 5632, 15, 24, 23, 23, {
> +			{ 0, 11, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 13, 18, -2 },
> +			{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 21, -8 }, { 15, 21, -10 }, { 17, 22, -10 },
> +			{ 17, 22, -10 }, { 17, 23, -12 }, { 19, 23, -12 },
> +			{ 23, 24, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(5), .bpc =3D 16,
> +		{ 410, 15, 5632, 19, 28, 27, 27, {
> +			{ 0, 11, 2 }, { 6, 14, 0 }, { 13, 17, 0 }, { 16, 20, -2 },
> +			{ 19, 23, -4 }, { 19, 23, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 25, -8 }, { 19, 25, -10 }, { 21, 26, -10 },
> +			{ 21, 26, -10 }, { 21, 27, -12 }, { 23, 27, -12 },
> +			{ 27, 28, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 8,
> +		{ 341, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 2, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 1, 6, -2 },
> +			{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
> +			{ 3, 8, -8 }, { 3, 9, -10 }, { 5, 9, -10 }, { 5, 9, -12 },
> +			{ 5, 9, -12 }, { 7, 10, -12 }, { 10, 12, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 10,
> +		{ 341, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 2 }, { 2, 5, 0 }, { 3, 7, 0 }, { 4, 8, -2 },
> +			{ 6, 9, -4 }, { 7, 10, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
> +			{ 7, 12, -8 }, { 7, 13, -10 }, { 9, 13, -10 }, { 9, 13, -12 },
> +			{ 9, 13, -12 }, { 11, 14, -12 }, { 14, 15, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 12,
> +		{ 341, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 6, 2 }, { 4, 9, 0 }, { 7, 11, 0 }, { 8, 12, -2 },
> +			{ 10, 13, -4 }, { 11, 14, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
> +			{ 11, 16, -8 }, { 11, 17, -10 }, { 13, 17, -10 },
> +			{ 13, 17, -12 }, { 13, 17, -12 }, { 15, 18, -12 },
> +			{ 18, 19, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 14,
> +		{ 341, 15, 2048, 15, 24, 23, 23, {
> +			{ 0, 6, 2 }, { 7, 10, 0 }, { 9, 13, 0 }, { 11, 16, -2 },
> +			{ 14, 17, -4 }, { 15, 18, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
> +			{ 15, 20, -8 }, { 15, 21, -10 }, { 17, 21, -10 },
> +			{ 17, 21, -12 }, { 17, 21, -12 }, { 19, 22, -12 },
> +			{ 22, 23, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(6), .bpc =3D 16,
> +		{ 341, 15, 2048, 19, 28, 27, 27, {
> +			{ 0, 6, 2 }, { 6, 11, 0 }, { 11, 15, 0 }, { 14, 18, -2 },
> +			{ 18, 21, -4 }, { 19, 22, -6 }, { 19, 23, -8 }, { 19, 24, -8 },
> +			{ 19, 24, -8 }, { 19, 25, -10 }, { 21, 25, -10 },
> +			{ 21, 25, -12 }, { 21, 25, -12 }, { 23, 26, -12 },
> +			{ 26, 27, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 8,
> +		{ 256, 15, 2048, 3, 12, 11, 11, {
> +			{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
> +			{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 3, -2 }, { 2, 4, -4 },
> +			{ 2, 5, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 4, 7, -10 },
> +			{ 5, 7, -12 }, { 7, 8, -12 }, { 8, 9, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 10,
> +		{ 256, 15, 2048, 7, 16, 15, 15, {
> +			{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
> +			{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 7, -2 }, { 6, 8, -4 },
> +			{ 6, 9, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 8, 11, -10 },
> +			{ 9, 11, -12 }, { 11, 12, -12 }, { 12, 13, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 12,
> +		{ 256, 15, 2048, 11, 20, 19, 19, {
> +			{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
> +			{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
> +			{ 11, 13, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
> +			{ 13, 15, -10 }, { 13, 15, -12 }, { 15, 16, -12 },
> +			{ 16, 17, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 14,
> +		{ 256, 15, 2048, 15, 24, 23, 23, {
> +			{ 0, 4, 10 }, { 3, 8, 8 }, { 6, 11, 6 }, { 9, 14, 4 },
> +			{ 13, 15, 2 }, { 13, 15, 0 }, { 13, 16, -2 }, { 14, 16, -4 },
> +			{ 15, 17, -6 }, { 15, 17, -8 }, { 16, 18, -10 },
> +			{ 17, 19, -10 }, { 17, 19, -12 }, { 19, 20, -12 },
> +			{ 20, 21, -12 }
> +			}
> +		}
> +	},
> +	{
> +		.bpp =3D DSC_BPP(8), .bpc =3D 16,
> +		{ 256, 15, 2048, 19, 28, 27, 27, {
> +			{ 0, 4, 10 }, { 4, 9, 8 }, { 8, 13, 6 }, { 12, 17, 4 },
> +			{ 17, 19, 2 }, { 17, 20, 0 }, { 17, 20, -2 }, { 18, 20, -4 },
> +			{ 19, 21, -6 }, { 19, 21, -8 }, { 20, 22, -10 },
> +			{ 21, 23, -10 }, { 21, 23, -12 }, { 23, 24, -12 },
> +			{ 24, 25, -12 }
> +			}
> +		}
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static const struct rc_parameters *get_rc_params(const struct
> rc_parameters_data *rc_parameters,
>  						 u16 dsc_bpp,
>  						 u8 bits_per_component)
> @@ -782,6 +1214,12 @@ int drm_dsc_setup_rc_params(struct
> drm_dsc_config *vdsc_cfg, enum drm_dsc_params
>  	case DRM_DSC_1_1_PRE_SCR:
>  		data =3D rc_parameters_pre_scr;
>  		break;
> +	case DRM_DSC_1_2_422:
> +		data =3D rc_parameters_1_2_422;
> +		break;
> +	case DRM_DSC_1_2_420:
> +		data =3D rc_parameters_1_2_420;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/display/drm_dsc_helper.h
> b/include/drm/display/drm_dsc_helper.h
> index c634bb2935d3..0bb0c3afd740 100644
> --- a/include/drm/display/drm_dsc_helper.h
> +++ b/include/drm/display/drm_dsc_helper.h
> @@ -13,6 +13,8 @@
>  enum drm_dsc_params_kind {
>  	DRM_DSC_1_2_444,
>  	DRM_DSC_1_1_PRE_SCR, /* legacy params from DSC 1.1 */
> +	DRM_DSC_1_2_422,
> +	DRM_DSC_1_2_420,
>  };
>=20
>  void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
> --
> 2.39.2

