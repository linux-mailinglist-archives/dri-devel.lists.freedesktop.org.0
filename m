Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE035ED42
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4606E6E1F2;
	Wed, 14 Apr 2021 06:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE66E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:37:18 +0000 (UTC)
IronPort-SDR: dEGJYCsRxjTGq4Zdvl2m1noahN45oTQNxy+zjGSzbHoMqSAn68/BuQEuSfanLu6/aHNC1ZMdky
 MtT2rGcU01+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="191392317"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="191392317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 23:37:17 -0700
IronPort-SDR: Y2J4wEqZuUixSnpXhTTyR9gsk6cyrn1FFmcR1/rgk5GnsK6/UYbmnE8YQkRXGHlr9W145zcR3j
 M50ydvI7Obmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; d="scan'208";a="424591782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 23:37:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 23:37:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 13 Apr 2021 23:37:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 13 Apr 2021 23:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VE9EcY7rUhGCL9vv2lYKcjUe1Hl2dF9iQxwGsc20jZXP8dXSPdpRRWxtnlk3Ul1iCsjbkx5+New3e5EqdxUNX3R0SEMoRrY6i6w4HwYgnUXgCbBJr5SXzuNUVmGAMYTa7MGc8se5dEs0yDr2ub/GxggfxZ5juNA+vaStJjRQCjrLuZv/wXDXSpt5usWhst/NH6+jATGbHO3S8WnrK1h3qvqTkqWz4gyuES0wWFlMjhl9MPy+8WH5NdtsEhE4IuzDPnLmoYAJD9NIK/Yhe0c3OLbZ+QnCTrXNxddWQpsXTvdEWw5FROoP7f/BW/Lw9UT6uhjPgVTcm6WnK/3vheS34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcjyd6SRSOlgl0LFcQ4D3eclfaQSepB0Y/T8xiqMnSQ=;
 b=JbwDK8J8sKfFZUpN/XVdpPdIVWYgKxmmsfAFnwNmREST8zYQeVWb7Gp6frCKmBj40zzuCpYAIckGvfOEwQs9EUaUu7xmg0kDMnw2tn5Wd4yt8hw3xkaDFz612wUOqRyxI986nHuePK/CxrbWlqxAzosgHG+YqkIelaExlU1aOBc2I5jEVLWF/6OiVXxfAsGWSojT289MSuN3qtF4KKp6RCpv3cmJ4JIUoueukL9PQ1NTWly5UTwbkpivuR4EJBDbgD/8XpxTjoviBQAn+cqfDai5d/1I4IzpTl3DEQ7ra/uxWRGhVwjqfKNM9BWb+Yl1WY3hqjB6GFAwV2R37dcgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcjyd6SRSOlgl0LFcQ4D3eclfaQSepB0Y/T8xiqMnSQ=;
 b=j7VwcRIlQ+PhI2bq2LRH3dASKexex/hMarjq9UnOrj11aOHyraApc65eG463bh05J0cFHyPePahS4MiKny30rpUpeiuYwiQBXXPSIhFdTlBojkIfw6zc34G9pgdvHNPecqpBplN45Iz3kEP++UIcacl7n2EtHKTznlxpYxIJ3kQ=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 06:36:56 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10%2]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 06:36:56 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>
Subject: RE: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
Thread-Topic: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
Thread-Index: AQHXMCcUFKowTWN1LEiVOPqQN59WlqqziP+w
Date: Wed, 14 Apr 2021 06:36:55 +0000
Message-ID: <BN7PR11MB27863A076DF43A77D6F4384C894E9@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
 <20210413052614.2486768-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210413052614.2486768-1-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df0fffbf-8834-4fd6-7af9-08d8ff0fb2b9
x-ms-traffictypediagnostic: BN6PR11MB1779:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB1779EAABB4AC1B48D7609ED1894E9@BN6PR11MB1779.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:478;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AVkMEDmA07b7hNVHVK3d/2POiy15PaUUhF6XyV2SLhuxvVPJGgMJ+kOk8SICIWxk0BD/uTMkkc1HmLHyrsfDIDQDN/u5duXqfccSJbmQ3IYcd6MFAj6vspXkmyyeTFPcRCAEz17PyhuUMZK8EnJWCqaoywue8Or54UqAjPiA0HuSw2JEwimCnE8tz4+E1cU6eCrj3B+qgUIcpUaZ5HXP5GKfifPzcPYo/aKK9m/iBK3jFzBLWnj99j0IL3ePicVlF5aprh8tqrXgq8DrqwnWqmA9YM9c4pUjIrY9aU0BUhdCTner7DPwjthr37di4MjY7UcNtCoAua3TEq/2P6GkTNv5j89L5cTJPcdBI4puhvTMM+F6TGx3dMYhIJJp/3LIac0grM2E04CGDq4OmBCrnjaYFXspiIeZw2mBaqMpi2VFejMyRi/OCtprwKo+rF3qS7fU6D89oICNoLfcXuknTnDBMvCyoUt9ainCLOlj9ODwKBpO0gO6wn5+rnwu8hO2/ZHPSUxlh0u/dhv0u5C0cpLitpk0p6qLxDzxTrUQJKR5R3I9MNP0oYs1FpkAdhYkjXTKrkEaM7aZ/3ncYDOBx23jqKe3L/2FlFFtELinX+/QIWaprYBWLCq7NnAGc0ZQFMkVM98KqqvuSBT3fidD8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(376002)(366004)(346002)(966005)(66946007)(316002)(2906002)(110136005)(7696005)(53546011)(4326008)(478600001)(38100700002)(122000001)(6506007)(86362001)(33656002)(76116006)(5660300002)(66446008)(83380400001)(26005)(55016002)(9686003)(186003)(66476007)(66556008)(8936002)(54906003)(8676002)(64756008)(52536014)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+M/ujmFS6nxL/wescUcEFbx4LWYS54o5Jy1nxlIGpku4WcEFfSjqRmRkfW1N?=
 =?us-ascii?Q?qzblEGyfvIKVBfiHReHUwdr1UeixGqLWd0rKhbacLNJrL0S3f0PX/l4Ke0X+?=
 =?us-ascii?Q?6MUPj/uBgDmSvUWHeDkdNJjOTXyTY+Ry0CZWmwIOB/IMmByMGoYJPE9IwqUX?=
 =?us-ascii?Q?TOHGlK+GlvFr+vRKHSwytNXTyEYaHyPgijivru2iTPXL2AIiqK5l8HTzrY6k?=
 =?us-ascii?Q?BVr0m98JuHDsV913TUKDh96Ke2wtMm/54mI0/f3wECSyRRJvf2bJJyIvEVjY?=
 =?us-ascii?Q?zPg+bo84j7cVJE7DYkNh6RsrXtm6VVbKUOnZVTvxFsSl6Q6K7Mwt5P3BHxUG?=
 =?us-ascii?Q?zB2XY04spqK00jOuUmFE5/QKVQelvfOnfBmUythwnvCUXVafdcbT7TVGK15a?=
 =?us-ascii?Q?6wJPOSK9c5GUBdCFgRWJ/y9h85hrqJAM/ivkPbuHaJnistUONRhN+mujkzIa?=
 =?us-ascii?Q?wTt+eehWETmKKVe4T0bRJmd5ONm+gEOuHTB+tAxEPaevVkn67X4+p8vPhnTM?=
 =?us-ascii?Q?ptPmlDktYi4uJw4WZWYLJSqK6nhrHgiObozc51QJD3FnBFD8xa4uc2dPa174?=
 =?us-ascii?Q?D7W3ZKilHG85mcbRJy0tkcPk89XUwdtho123Praw3sHDsa3d4X6/Wrtr+VpB?=
 =?us-ascii?Q?PEXHyEdqP+mwgROvZmKvAKycvRHEMkXkY5ifq1uaVVvqsL6Tbb8QV2aCiDMI?=
 =?us-ascii?Q?mxdzSMQTylp54GS0YuEtzNxf0901xDMq+AOtGXc5/f5RdCDvTAyydMpNf4mp?=
 =?us-ascii?Q?3gN5v+ET26+1iV3F9EXzzGH76PCqo1+80WqLy+u1YBQhyn8ooKFUNw5mXLSm?=
 =?us-ascii?Q?JMBEUGpd4bJntmiq3QHLa6E/AQ5RCSZwycBqfOid9MqLFMwzBwkf7yC+J9CY?=
 =?us-ascii?Q?hgRKjCuzJnoUnEgTYTixpViZts9BaIgPhrnvJNmFeEe+HWOCgP8eFTG5LU6c?=
 =?us-ascii?Q?likGhkGfGA8E0x4SlpFkmAuxAr5izsPx+v7y2yydXManfmNzkSDrItszLe8s?=
 =?us-ascii?Q?B/wXCyHSOxMNNg4YHsxBrgRy7sbJTZtRiaZvwM8ovhN5vWaoz0RDyIt6pMhH?=
 =?us-ascii?Q?vJdzNQd4YBAOgdfS1aftbu2DrtfZh6bACC2nVCZN0LK4qPBTCp0CVX79gRhe?=
 =?us-ascii?Q?oC+Ghm+7PT5e9h/GdELuvX004DvCHsFN34TrjiqND7u1WTVLBokEj0zIDZBc?=
 =?us-ascii?Q?WI+5uS6lA7U+bI/GVmuKYY13WsHPIuAwUUlMAbyzbk2khFIKVm98CTwKM1gD?=
 =?us-ascii?Q?oIt3qyZ26j6QJzyvyXwtTn1NEqQ1hPrAGiE38XDqckZgCcUq9uRAuDbCOwK0?=
 =?us-ascii?Q?yj4VeZvnQ4qyDEl12E6+kkAF?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0fffbf-8834-4fd6-7af9-08d8ff0fb2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 06:36:56.0028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3ULy5CcmAT+yPM26phhhROwPOxC0GhwTrYgOmUN+3KVn1Bw+J13tAfiUujTRlsHFrAFzNFOSf1A1Anvy8c75w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
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
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

Speaking of the modifier, we notice that the virtio-gpu driver's mode_config.allow_fb_modifiers = false, which means virtio-gpu doesn't support modifier. With mode_config.allow_fb_modifiers=false, the DRM Modifier API would fail. 

So, do you know if there is any concern about letting virito-gpu allow modifiers? Thanks.

BR,
Tina

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Vivek Kasireddy
> Sent: Tuesday, April 13, 2021 1:26 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Kasireddy, Vivek <vivek.kasireddy@intel.com>; Gerd Hoffmann
> <kraxel@redhat.com>
> Subject: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
> 
> If support for Blob resources is available, then dumb BOs created by the
> driver can be considered as guest Blobs.
> 
> v2: Don't skip transfer and flush commands as part of plane update as the
> device may have created a shared mapping. (Gerd)
> 
> v3: Don't create dumb BOs as Guest blobs if Virgl is enabled. (Gurchetan)
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 8 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 8502400b2f9c..2de61b63ef91 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,  {
>  	struct drm_gem_object *gobj;
>  	struct virtio_gpu_object_params params = { 0 };
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	int ret;
>  	uint32_t pitch;
> 
> @@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,
>  	params.height = args->height;
>  	params.size = args->size;
>  	params.dumb = true;
> +
> +	if (vgdev->has_resource_blob && !vgdev->has_virgl_3d) {
> +		params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
> +		params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
> +		params.blob = true;
> +	}
> +
>  	ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
>  				    &args->handle);
>  	if (ret)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 4ff1ec28e630..f648b0e24447 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device
> *vgdev,
>  	}
> 
>  	if (params->blob) {
> +		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
> +			bo->guest_blob = true;
> +
>  		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
>  						    ents, nents);
>  	} else if (params->virgl) {
> --
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
