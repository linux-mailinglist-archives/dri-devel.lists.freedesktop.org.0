Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97B2EEBCD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 04:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A436E5C1;
	Fri,  8 Jan 2021 03:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592866E5C1;
 Fri,  8 Jan 2021 03:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4bw5w+hNOcxGBnFSC3N1FAAWEYqriGJpmVdG1//TCnQ+sRvk4ZpGCCdlqY5PRpT/LEllwlHxqk7Jj/mRKrRdeC3qim++5vqI7JG1C8jQkD98macwF/A7/S8xAice+SLdjhZ2ITcxslodnDzyO0qpIcGEbvImhKSDfNl/DiAAEjK27vQKWEaGvIgcsLPyCrSvnR5lPaoAMrSo9bVZskAayNUdtQrgFDPu7R2iO3ie1UFLtiUlfMjFN0iSynJfVmwjQbZ8pLc/tkUe0VML7p0bXeaJPQ2DW6jPDBF0qwd3pnI/j86bAhO9LGBWRBKtJ3W3PTCkfweb2FMZC+umjrVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ORUMKLs2G2NCJa8qOXWl9AmKT8HV1ZgYMGS2QwXYEw=;
 b=IMWVm5R40/RpwCUJ+v5ypcJTLpH2Vs/4Qwzzm2xaSanbsIkdt145HX+6Oy51YOq2uYXtZ3+fsS0QYPt4lHM8YM6gdysPp1AJMR8lx2owx73WaDoPF9D75skOL0d7zAh/zdjUL/jYU6r+MTv06c3yIpQbtsJHyAk4FbIlUiFtyHMr+yTtGCmUNV1ZQSfmegO1pwwWXILd/N0xHE9wUeN6FQS9joo5169jAb6Nwuwc7KlNt6msrzEroJsncn8wSQeM8zdwO+f5ttOU+PRKMUDK6EG5ELtqC6TgTnMh2tnRTVe0eXy6n0JsGk9Deorb0TeddOi39EtZSvY6J5ZjgUXteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ORUMKLs2G2NCJa8qOXWl9AmKT8HV1ZgYMGS2QwXYEw=;
 b=xY336fwB+7SAc/NnHjlPPKX5yC1wNqNJjNN6vy5A37Xj3BcTiSJJspdNDMlCVpl3/ABQ/ciuY8a5tM5F0ERW5aXM2doRAmok+5mORftf+rUZVfT3R7PIwdPRkWdasIKHcSFdF9lKXBTyP/n2jxr6ebYA4/xR90QLjLZFSKKG8OU=
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN6PR12MB1938.namprd12.prod.outlook.com (2603:10b6:404:fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Fri, 8 Jan
 2021 03:17:59 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::a440:d0d:9875:252%6]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 03:17:59 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] Revert "drm/amd/display: Expose new CRC window
 property"
Thread-Topic: [PATCH 3/3] Revert "drm/amd/display: Expose new CRC window
 property"
Thread-Index: AQHW5TcvUlKgcGjnKUeMDor6+QmNyKodDaiQ
Date: Fri, 8 Jan 2021 03:17:59 +0000
Message-ID: <BN8PR12MB4770440F3C5E2BAEC3F7914AFCAE0@BN8PR12MB4770.namprd12.prod.outlook.com>
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
 <20210107205321.166698-4-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20210107205321.166698-4-Rodrigo.Siqueira@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=1c80195c-f5bf-4754-886a-fed532e267bf;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-08T03:12:23Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1df5b3a5-9b4b-4f62-c8d9-08d8b3840074
x-ms-traffictypediagnostic: BN6PR12MB1938:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB19386C704FED357A1A5E54F8FCAE0@BN6PR12MB1938.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:338;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9wCLVrC4yB3HTW8/9rduTiMY67Z2pDKBkpS4WE5xsCeboVOftKCRJK75DpaL64f43mQXP1osPm9Iv4acPwo/tTxTho3Icbq0RYSwfW35D+4DfpRXudVf9ut7hFZnttmh0fZdmoFjpFoaDCzNrwnKF7DP/Na+1umPUGhImkwlTdPTDtHg6mUgb8nNf05BmkjhqUu10rm8NJCrq6an9W99T1enuRrBYBCdeaIpeuV2uE9oJDGSBdTJvheVh4SyByJcMGWLmYQ8KFph1+ugahPscI+QZvcg49ES3/V2BenknRrSdcvZCrIPVJRIZeepGb2dD+nDKOxGtRWPwQe/m+Y4EytntdnVsK2S6rH5QsBzuev4BmyCGJQbusroDJ3Gkk+K6koGZfmk7SCNkz/qTR1MUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(110136005)(7696005)(9686003)(316002)(54906003)(86362001)(55016002)(53546011)(30864003)(83380400001)(478600001)(6506007)(64756008)(186003)(66556008)(33656002)(2906002)(66476007)(52536014)(8676002)(4326008)(26005)(5660300002)(76116006)(8936002)(66946007)(71200400001)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JnVV6lY1/0au+a/na7UGOgjiZp9dQ0ZSH0ggCTYxMRSy28dXSuo8+RicrfaD?=
 =?us-ascii?Q?MDtYKQaOAlQetGWAeDcDMbWkPb335aJWMhkIupQ7igTF8xVWNyI/BI6x7GvD?=
 =?us-ascii?Q?oTGu8fKDNZvWFDOBKzU9fRAJOhio9vn2J88QsD0z2vW0AVsDnEzbiyeZY+p9?=
 =?us-ascii?Q?hFnM92U4bHeABmjamTMn2bqCwVY/ox96elhhLAdFsK5XmW+ZQLW6FzEfCUg1?=
 =?us-ascii?Q?hD3/0oTXbSmdeo/31kW435JXxqEbUt6TwaLdwkf6zDVHayv5Q7V+2pl81xoK?=
 =?us-ascii?Q?6z/gRyeviyv6CWaSIbaNUhIJeIm9ZWGhbNowGG5EjpCq8s+bTn8aY1skjJ+s?=
 =?us-ascii?Q?1gpVwzWorG9v8j97qZE7qMZYhLn+aKzCCNuxFBZXq1HH/cd6IJ5/L+I2kHYE?=
 =?us-ascii?Q?MYVCxv13T61JH3fRV7l1JIZtI+0XEfjqa9cV4K0r6uu/ERPtCvF+nD++11CD?=
 =?us-ascii?Q?dxBqG7F9mvwQcv10zeiPH8DqTj++fD+nFluD8phppGR15Ralf+DtwdVipAc9?=
 =?us-ascii?Q?d3qhel38MtsD8tLmNo/WmWFC1xSr7WW03MOGDuM1Pbm+8TrxD6+Fa9q9bK5/?=
 =?us-ascii?Q?2o5i3VZGR+NJy//umIa5/9gCVfEhPM2IChwryl3GK/pQ2ykcDi46ahGcg/l6?=
 =?us-ascii?Q?MToKBAzO0Aq+C482oh2v5hSruXGFrinBuJ6mwjila/fFLluPXCUVEdHJ8nXh?=
 =?us-ascii?Q?RcP0loy2qaHi7Q6bRLanroCZcRnj8aQ+uldwlUcclMDKmUlzD1u4CsYs+nAN?=
 =?us-ascii?Q?KL/MytmyozAX+0oxVlSPMj5SPmFmiWSCikmfjgsIZQIoYZFTP0YYsvOpW8pm?=
 =?us-ascii?Q?aylomwUUFMnOBlxEjtnJ8LYWE7OeKLRhynE1IVjCmrqDc8tID4YmRVJMiL4j?=
 =?us-ascii?Q?XxlJUJVvDUqTDiMKHBZKTpezjYcyufqRRSs20u8j9PJ+sHYaNrZhhAdCjCBT?=
 =?us-ascii?Q?xSWBqDZWPiFvZfxSkJ5yUoEAl2SD2TEuk+GEcAWZJsY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df5b3a5-9b4b-4f62-c8d9-08d8b3840074
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 03:17:59.6214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lAwu98soerx2KBCkziv1L+ZowOO79pOlyxMLyOhbPk1OqWHT5k6o9P0/MDtrZbY48YPJacdvOW3USzGXu2f2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1938
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Li,
 Roman" <Roman.Li@amd.com>, "R, Bindu" <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Thanks Siqueira.
Comments below.

> -----Original Message-----
> From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> Sent: Friday, January 8, 2021 4:53 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Li, Roman <Roman.Li@amd.com>; R, Bindu <Bindu.R@amd.com>; Daniel Vetter <daniel@ffwll.ch>
> Subject: [PATCH 3/3] Revert "drm/amd/display: Expose new CRC window property"
>
> This reverts commit 110d586ba77ed573eb7464ca69b6490ec0b70c5f.
>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Roman Li <Roman.Li@amd.com>
> Cc: Bindu R <Bindu.R@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 +-----------------  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |
> 19 ---  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   3 -
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   2 +
>  5 files changed, 12 insertions(+), 210 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a06554745238..0515ed0d125c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -938,41 +938,6 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_  }  #endif
>
> -#ifdef CONFIG_DEBUG_FS
> -static int create_crtc_crc_properties(struct amdgpu_display_manager *dm) -{
> -dm->crc_win_x_start_property =
> -drm_property_create_range(adev_to_drm(dm->adev),
> -  DRM_MODE_PROP_ATOMIC,
> -  "AMD_CRC_WIN_X_START", 0, U16_MAX);
> -if (!dm->crc_win_x_start_property)
> -return -ENOMEM;
> -
> -dm->crc_win_y_start_property =
> -drm_property_create_range(adev_to_drm(dm->adev),
> -  DRM_MODE_PROP_ATOMIC,
> -  "AMD_CRC_WIN_Y_START", 0, U16_MAX);
> -if (!dm->crc_win_y_start_property)
> -return -ENOMEM;
> -
> -dm->crc_win_x_end_property =
> -drm_property_create_range(adev_to_drm(dm->adev),
> -  DRM_MODE_PROP_ATOMIC,
> -  "AMD_CRC_WIN_X_END", 0, U16_MAX);
> -if (!dm->crc_win_x_end_property)
> -return -ENOMEM;
> -
> -dm->crc_win_y_end_property =
> -drm_property_create_range(adev_to_drm(dm->adev),
> -  DRM_MODE_PROP_ATOMIC,
> -  "AMD_CRC_WIN_Y_END", 0, U16_MAX);
> -if (!dm->crc_win_y_end_property)
> -return -ENOMEM;
> -
> -return 0;
> -}
> -#endif
> -
>  static int amdgpu_dm_init(struct amdgpu_device *adev)  {
>  struct dc_init_data init_data;
> @@ -1119,10 +1084,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>
>  dc_init_callbacks(adev->dm.dc, &init_params);
>  }
> -#endif
> -#ifdef CONFIG_DEBUG_FS
> -if (create_crtc_crc_properties(&adev->dm))
> -DRM_ERROR("amdgpu: failed to create crc property.\n");
>  #endif
>  if (amdgpu_dm_initialize_drm_device(adev)) {
>  DRM_ERROR(
> @@ -5456,64 +5417,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  state->crc_src = cur->crc_src;
>  state->cm_has_degamma = cur->cm_has_degamma;
>  state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb; -#ifdef CONFIG_DEBUG_FS
> -state->crc_window = cur->crc_window;
> -#endif
> +
>  /* TODO Duplicate dc_stream after objects are stream object is flattened */
>
>  return &state->base;
>  }
>
> -#ifdef CONFIG_DEBUG_FS
> -static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
> -    struct drm_crtc_state *crtc_state,
> -    struct drm_property *property,
> -    uint64_t val)
> -{
> -struct drm_device *dev = crtc->dev;
> -struct amdgpu_device *adev = drm_to_adev(dev);
> -struct dm_crtc_state *dm_new_state =
> -to_dm_crtc_state(crtc_state);
> -
> -if (property == adev->dm.crc_win_x_start_property)
> -dm_new_state->crc_window.x_start = val;
> -else if (property == adev->dm.crc_win_y_start_property)
> -dm_new_state->crc_window.y_start = val;
> -else if (property == adev->dm.crc_win_x_end_property)
> -dm_new_state->crc_window.x_end = val;
> -else if (property == adev->dm.crc_win_y_end_property)
> -dm_new_state->crc_window.y_end = val;
> -else
> -return -EINVAL;
> -
> -return 0;
> -}
> -
> -static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
> -    const struct drm_crtc_state *state,
> -    struct drm_property *property,
> -    uint64_t *val)
> -{
> -struct drm_device *dev = crtc->dev;
> -struct amdgpu_device *adev = drm_to_adev(dev);
> -struct dm_crtc_state *dm_state =
> -to_dm_crtc_state(state);
> -
> -if (property == adev->dm.crc_win_x_start_property)
> -*val = dm_state->crc_window.x_start;
> -else if (property == adev->dm.crc_win_y_start_property)
> -*val = dm_state->crc_window.y_start;
> -else if (property == adev->dm.crc_win_x_end_property)
> -*val = dm_state->crc_window.x_end;
> -else if (property == adev->dm.crc_win_y_end_property)
> -*val = dm_state->crc_window.y_end;
> -else
> -return -EINVAL;
> -
> -return 0;
> -}
> -#endif
> -
>  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)  {
>  enum dc_irq_source irq_source;
> @@ -5599,10 +5508,6 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  .enable_vblank = dm_enable_vblank,
>  .disable_vblank = dm_disable_vblank,
>  .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> -#ifdef CONFIG_DEBUG_FS
> -.atomic_set_property = amdgpu_dm_crtc_atomic_set_property,
> -.atomic_get_property = amdgpu_dm_crtc_atomic_get_property,
> -#endif
>  };
>
>  static enum drm_connector_status
> @@ -6829,25 +6734,6 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  return 0;
>  }
>
> -#ifdef CONFIG_DEBUG_FS
> -static void attach_crtc_crc_properties(struct amdgpu_display_manager *dm,
> -struct amdgpu_crtc *acrtc)
> -{
> -drm_object_attach_property(&acrtc->base.base,
> -   dm->crc_win_x_start_property,
> -   0);
> -drm_object_attach_property(&acrtc->base.base,
> -   dm->crc_win_y_start_property,
> -   0);
> -drm_object_attach_property(&acrtc->base.base,
> -   dm->crc_win_x_end_property,
> -   0);
> -drm_object_attach_property(&acrtc->base.base,
> -   dm->crc_win_y_end_property,
> -   0);
> -}
> -#endif
> -
>  static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>         struct drm_plane *plane,
>         uint32_t crtc_index)
> @@ -6895,9 +6781,7 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
>     true, MAX_COLOR_LUT_ENTRIES);
>  drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES); -#ifdef CONFIG_DEBUG_FS
> -attach_crtc_crc_properties(dm, acrtc);
> -#endif
> +
>  return 0;
>
>  fail:
> @@ -8538,7 +8422,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   */
>  for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
> -bool configure_crc = false;
>
>  dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>
> @@ -8548,30 +8431,21 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  dc_stream_retain(dm_new_crtc_state->stream);
>  acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
>  manage_dm_interrupts(adev, acrtc, true);
> -}
> +
>  #ifdef CONFIG_DEBUG_FS
> -if (new_crtc_state->active &&
> -amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
>  /**
>   * Frontend may have changed so reapply the CRC capture
>   * settings for the stream.
>   */
>  dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
> -dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
> -
> -if (amdgpu_dm_crc_window_is_default(dm_new_crtc_state)) {
> -if (!old_crtc_state->active || drm_atomic_crtc_needs_modeset(new_crtc_state))
> -configure_crc = true;
> -} else {
> -if (amdgpu_dm_crc_window_changed(dm_new_crtc_state, dm_old_crtc_state))
> -configure_crc = true;
> -}
>
> -if (configure_crc)
> +if (amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
>  amdgpu_dm_crtc_configure_crc_source(
> -crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
> -}
> +crtc, dm_new_crtc_state,
> +dm_new_crtc_state->crc_src);
> +}
>  #endif
> +}
>  }
>
>  for_each_new_crtc_in_state(state, crtc, new_crtc_state, j) diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index ef394e941d9d..9d22d62ac2d1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -343,13 +343,6 @@ struct amdgpu_display_manager {
>   */
>  uint32_t active_vblank_irq_count;
>
> -#ifdef CONFIG_DEBUG_FS
> -/* set the crc calculation window*/
> -struct drm_property *crc_win_x_start_property;
> -struct drm_property *crc_win_y_start_property;
> -struct drm_property *crc_win_x_end_property;
> -struct drm_property *crc_win_y_end_property;
> -#endif
>  /**
>   * @mst_encoders:
>   *
> @@ -436,15 +429,6 @@ struct dm_plane_state {
>  struct dc_plane_state *dc_state;
>  };
>
> -#ifdef CONFIG_DEBUG_FS
> -struct crc_rec {
> -uint16_t x_start;
> -uint16_t y_start;
> -uint16_t x_end;
> -uint16_t y_end;
> -};
> -#endif
> -
>  struct dm_crtc_state {
>  struct drm_crtc_state base;
>  struct dc_stream_state *stream;
> @@ -467,9 +451,6 @@ struct dm_crtc_state {
>  struct dc_info_packet vrr_infopacket;
>
>  int abm_level;
> -#ifdef CONFIG_DEBUG_FS
> -struct crc_rec crc_window;
> -#endif
>  };
>
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base) diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> index 7b886a779a8c..c29dc11619f7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> @@ -81,41 +81,6 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
>  return pipe_crc_sources;
>  }
>
> -static void amdgpu_dm_set_crc_window_default(struct dm_crtc_state *dm_crtc_state) -{
> -dm_crtc_state->crc_window.x_start = 0;
> -dm_crtc_state->crc_window.y_start = 0;
> -dm_crtc_state->crc_window.x_end = 0;
> -dm_crtc_state->crc_window.y_end = 0;
> -}
> -
> -bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state) -{
> -bool ret = true;
> -
> -if ((dm_crtc_state->crc_window.x_start != 0) ||
> -(dm_crtc_state->crc_window.y_start != 0) ||
> -(dm_crtc_state->crc_window.x_end != 0) ||
> -(dm_crtc_state->crc_window.y_end != 0))
> -ret = false;
> -
> -return ret;
> -}
> -
> -bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
> -struct dm_crtc_state *dm_old_crtc_state)
> -{
> -bool ret = false;
> -
> -if ((dm_new_crtc_state->crc_window.x_start != dm_old_crtc_state->crc_window.x_start) ||
> -(dm_new_crtc_state->crc_window.y_start != dm_old_crtc_state->crc_window.y_start) ||
> -(dm_new_crtc_state->crc_window.x_end != dm_old_crtc_state->crc_window.x_end) ||
> -(dm_new_crtc_state->crc_window.y_end != dm_old_crtc_state->crc_window.y_end))
> -ret = true;
> -
> -return ret;
> -}
> -
>  int
>  amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>   size_t *values_cnt)
> @@ -140,7 +105,6 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  struct dc_stream_state *stream_state = dm_crtc_state->stream;
>  bool enable = amdgpu_dm_is_valid_crc_source(source);
>  int ret = 0;
> -struct crc_params *crc_window = NULL, tmp_window;
>
>  /* Configuration will be deferred to stream enable. */
>  if (!stream_state)
> @@ -149,25 +113,9 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  mutex_lock(&adev->dm.dc_lock);
>
>  /* Enable CRTC CRC generation if necessary. */
> -if (dm_is_crc_source_crtc(source) || source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE) {
> -if (!enable)
> -amdgpu_dm_set_crc_window_default(dm_crtc_state);
> -
> -if (!amdgpu_dm_crc_window_is_default(dm_crtc_state)) {
> -crc_window = &tmp_window;
> -
> -tmp_window.windowa_x_start = dm_crtc_state->crc_window.x_start;
> -tmp_window.windowa_y_start = dm_crtc_state->crc_window.y_start;
> -tmp_window.windowa_x_end = dm_crtc_state->crc_window.x_end;
> -tmp_window.windowa_y_end = dm_crtc_state->crc_window.y_end;
> -tmp_window.windowb_x_start = dm_crtc_state->crc_window.x_start;
> -tmp_window.windowb_y_start = dm_crtc_state->crc_window.y_start;
> -tmp_window.windowb_x_end = dm_crtc_state->crc_window.x_end;
> -tmp_window.windowb_y_end = dm_crtc_state->crc_window.y_end;
> -}
> -
> +if (dm_is_crc_source_crtc(source)) {
Should still keep the condition "source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE", this solves
 the problem that it doesn't really turn off crc generation.
>  if (!dc_stream_configure_crc(stream_state->ctx->dc,
> -     stream_state, crc_window, enable, enable)) {
> +     stream_state, NULL, enable, enable)) {
>  ret = -EINVAL;
>  goto unlock;
>  }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> index 0235bfb246e5..f7d731797d3f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> @@ -47,9 +47,6 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
>
>  /* amdgpu_dm_crc.c */
>  #ifdef CONFIG_DEBUG_FS
> -bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state); -bool amdgpu_dm_crc_window_changed(struct
> dm_crtc_state *dm_new_crtc_state,
> -struct dm_crtc_state *dm_old_crtc_state);
>  int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  struct dm_crtc_state *dm_crtc_state,
>  enum amdgpu_dm_pipe_crc_source source); diff --git
> a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index f4a2088ab179..da292cea0f56 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3272,6 +3272,8 @@ void core_link_enable_stream(
>  }
>  }
>
> +dc->hwss.enable_audio_stream(pipe_ctx);
Original patch doesn't add this line.
> +
>  /* turn off otg test pattern if enable */
>  if (pipe_ctx->stream_res.tg->funcs->set_test_pattern)
>  pipe_ctx->stream_res.tg->funcs->set_test_pattern(pipe_ctx->stream_res.tg,
> --
> 2.25.1

Thanks!
Wayne Lin

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
