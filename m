Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03076AD07
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9740F10E373;
	Tue,  1 Aug 2023 09:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80A10E1D8;
 Tue,  1 Aug 2023 09:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Klhw3ERtCiVHqBobmMLieFnPxwDb7PsPsmGR/ZQA1ZRgqMhB04txqlGNc9gNQ2DdoYrtaVKv4KdCkpafoBa+GBsPeXf8z9l6dq7HfOTzvwwUf39Pg+2Htx09fuHSZ1cr18H2NkMHNb/FWskO5R99sXzfRi9w2E5Flb2LKXgdbWFo/aZ7z/uuhEwruKX0SDSJzq3OEfmJwkOexAAksbIbEEwrrd0sQuqvyhSUYv+isZPxZpIxQ8mUIV+3ec9DBRZhSiDHSfASsTBcnK5gW8uysOwGOiLu/xwWUaCI+9zcFg4yaV32aoG2QRV0OJCGusBJMGQkluUyPCgyrXRkniRxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrQSAFKr10rEsVyFWR76k1UQtNv7mPwV7ErwHA+i4nM=;
 b=hgwI1iqlZeHYRZ5lbGGBInr9a6XCkkkVsC2af/akg15vi2t1/zKHz9MNmA3dXoXNbPCc0FNx7NhCZcilTjjTvb/A0svN3/gepyezQFN7WTZ6iPS0noE0XynjxyQ+Ndh/oKQ3tVglhL51I0SmhFzN19rmYPSq/UBdqv3eQkjBV264SLbiZ4oTXi1J4MGuGkolQFplAg84OoYStT+vpvCbe1Dy7CHsIvdgh8HqWC2vjY9R0sc+2SfFzouylLoDTTPbZUuNTloKp5uHDx/qWeOK3v/yPo+TWDvZ/m07r1SU7O0d45tWwyvB5bdos5Yp679dJVjDzE3n1o4nhWOD0z90wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrQSAFKr10rEsVyFWR76k1UQtNv7mPwV7ErwHA+i4nM=;
 b=PQx2e0qFFi0FVZATa6rL3vVEaBTgaREq6d+a1BAI9l2t0qnXi4j7eo3aK9pz4ihsaut8Z7SIFSmj6+P5ohmGFCssEASGPZGFicDm3U8tmNEZgr2m6IXHv4dIcfbiv0jhNaa0m/lOqj/WlIOIJu57v9ZNetKZv3m/XAf6TyT+gUc=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 09:25:29 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::ed2a:4807:1825:170f%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 09:25:29 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Ran Sun <sunran001@208suo.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
Thread-Topic: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
Thread-Index: AQHZxFIc4odQ4Gl5oEefdCmIjSvmFa/VK4wQ
Date: Tue, 1 Aug 2023 09:25:29 +0000
Message-ID: <DM6PR12MB26192EB1ADCC6973C37B6E2AE40AA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230801080246.6556-1-sunran001@208suo.com>
In-Reply-To: <20230801080246.6556-1-sunran001@208suo.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f2166d1c-f3f0-4450-b892-707bdfe19fff;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-01T09:25:22Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|BY5PR12MB4292:EE_
x-ms-office365-filtering-correlation-id: 105b0b6e-36cf-4049-d0e9-08db92713f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ZgPJkBHqV0cM1Bc5VmklwzT2/Mj+Wi2HBM4YMtZ8Ec9kRozlQx78hVsboJlUqG7AViinaVXR+DVKZBlMsoXLs39TF1LGrdc5ORv7GlZZTt9aSP7Z86xyMO+/TkI+z8sVFsHNULsZtyADAhSgojCMX1xcB0SLq13lE0XSAC23bLnd4iP64u+TopxUlpoX4ZB2TqxQrWL2BU1PRKnTyknYZFDiNeuvwq9i0PBgvvpbe92Qd+3au02J+HiIxkjOvKgdfZbOZ39Sa/F8JPjxIctxOPtMWOmX3heS2M/CIM7lHgYCg/M4123euG1WSauYk4ua6ww0Rd8mGuCCZAOdQteRtV5UzfbIy/PxeHoGjKOHP66r1eOVKgAx0mYB7b3w9cf7xy41NZfwCWEl1/bUAPGadDbQmYFkquIyyxNXnRMITKkja0WJ/qCVfE9pSKCzMi2nvjR1tI17J4yJ0YqIZcgwCfHHcOq/0XKPOANOgn38hKV2dg2RVNPSZTUsgPrmOHeLP/I+27TCz8VQt3Y/YfI/s6YhwbmuPEfGc1MjiOEpdt4FaLGYdhOC9cjZ4C0z0PFg6GS0Y2fe/hZu9dWsDf/t5m27RhhC398K/v3yGj7xGms25IuxFZATWNAvaoaiY+N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(7696005)(38070700005)(9686003)(86362001)(71200400001)(55016003)(186003)(83380400001)(6506007)(53546011)(26005)(38100700002)(33656002)(122000001)(52536014)(5660300002)(8676002)(66556008)(64756008)(41300700001)(8936002)(66946007)(76116006)(66476007)(2906002)(316002)(478600001)(66446008)(110136005)(54906003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UKLjhXIJNwUIXnk2lV+0ALSNLSp/PIu+JXk0QQ8br0TxFRaJXSac5AyKoxpF?=
 =?us-ascii?Q?HYgyCctFsDZhBCHGBF9MG9nwf9b6BnfJop7EwuLeFWtq3Ppnex7mSJWlLi2U?=
 =?us-ascii?Q?n/3jG+C1ahiVsc31ZBF9RaPnfAEYJ66Kbgk/cvS6EUnrnJ3Kd8RlCVydnpAH?=
 =?us-ascii?Q?2bXan4RwWxQMw6QXYndjp8L55s2AUChZkqrBHT6XXTGNSrEPoZa2OJwQdSP4?=
 =?us-ascii?Q?Yyg7BLada7lqRkymrxPnmdNazW+8aSZWgAuImPrFYUtp1fwtoBdYzup3FC7C?=
 =?us-ascii?Q?GySdGtNMg6pJd+L/lDE7J1DCYMSbhFfGm0pXtnBKo7Gl9GJLwKMh0tvmoZF1?=
 =?us-ascii?Q?+ybeOazGAVizqI1yxLmSWss8TIvTOt1+n6J9ObRBG9K1/xTZPhlBs8jLco7y?=
 =?us-ascii?Q?TWboYolT2vXA81ReRtSKQKdWjRC4vVsu+Fp4wXaXHJJm8/wNZldma3vb/Lag?=
 =?us-ascii?Q?J9sl5QzSJX3+B37g4reZcCOzcpy+TAxM3jVDg7XtWAzljXrJI3Igww3zTfI/?=
 =?us-ascii?Q?BE9bJK6zIFkPBpxJSyBkCoS1HA/0Ndmw/yIFsiTcvVU7dWNc+IxcKVwk0UNX?=
 =?us-ascii?Q?yMTRIp0MpYYrQj0SLJBNS1f6WX2bxZMKg3w5LompPx1q1Dm1wUjcZQZOQveQ?=
 =?us-ascii?Q?Fc4zuUjDmhfTG4KqetirN1VbiHrgNnnadPbIsp9tAJxBu9tQZ3LjMBmWmDTJ?=
 =?us-ascii?Q?wOdY3ywdD9S+B4NHH/uW5gJxYxkxZSfcZU42nstps7jMC77qHaNMRty3e23o?=
 =?us-ascii?Q?jrTS9nvKXZdYvocnzisVVthvPKDR/1gwamuEufjwb9E4kWhZL3dUydoWfXgc?=
 =?us-ascii?Q?SnImUrxTz20lcUdDATz3iqjU/DRgIFGEctvBJmKeMeSo/AuJIbMIhb2GarGP?=
 =?us-ascii?Q?Wahd9J7CbOu+7D6eZLgQkZHNxqZBrc5ASA3aIf5/S8lx19maJ2f2liLCIfuS?=
 =?us-ascii?Q?XR2Q0ZXCfHmtWmoPS/N8qeMYEBcHicOZXUXWrh2Kjx97DipQZcXcFKqGzFDj?=
 =?us-ascii?Q?oI1gi2PlaIfIhDmZHxboXNYY+EybsBlpefyFhkjiAS0YhXvCBF2img/5f5Kn?=
 =?us-ascii?Q?UMEvVoDAnwqtQ9m/jHSdeMXR6s4j8C6adn/E7dkcEck96mehzem9pGYql1ZL?=
 =?us-ascii?Q?CwBFc/F8r4YLxn9RpC2OWHIso6OYaNLGnImzeSau/7Lkr42ndfprCCd7tMGQ?=
 =?us-ascii?Q?TSBDvMTfYpU3A/PnQyUcTly70zo+joLAWds1MGYSJcbKbIuGpTKyfTk9b603?=
 =?us-ascii?Q?p9LiopcYJIIGsDAnsO6QD3sNsPsSfIWpUXtHUq3RUzwn1BMCvfRnXyT3Nx8E?=
 =?us-ascii?Q?P0BH5TzwkZl81SkzSEuZYGto63g6T+ww9VAteEZKa48JzPAdZZxM77T3cQR2?=
 =?us-ascii?Q?u7rD/lRO3DnaToNPRD2k5ORpGqo70H/hOLL591dE3GOXhrNIHwQD9PiRtA2V?=
 =?us-ascii?Q?R0Oltg5/661df/LBJb4Eirj/ZGhNEkdjLAPUmV621kbsxAijJEKzcfhPNDxC?=
 =?us-ascii?Q?DiwyWXblo/q9oNxbGlSTQ+IWTrOyKHRp3a+7uD6dHM0Rw0fndbc8/etEGe6q?=
 =?us-ascii?Q?GdW+QSSPbeuO6cXuhiw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105b0b6e-36cf-4049-d0e9-08db92713f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 09:25:29.0570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuA8aAkov95Js5iFHhIqUHeaxcvo6WfEN59snPB9/53jziEDZ8MKqK+UH//H4otq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ran
> Sun
> Sent: Tuesday, August 1, 2023 4:03 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; airlied@gmail.com;
> daniel@ffwll.ch
> Cc: Ran Sun <sunran001@208suo.com>; dri-devel@lists.freedesktop.org;
> amd-gfx@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> index 8d99c7a5abf8..994c0d374bfa 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
> @@ -31,8 +31,7 @@
>
>  #include "amdgpu_ras.h"
>
> -static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D -{
> +static const struct soc15_baco_cmd_entry clean_baco_tbl[] =3D {
>       {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_6), 0,
> 0, 0, 0},
>       {CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_7), 0,
> 0, 0, 0},  }; @@ -90,11 +89,11 @@ int vega20_baco_set_state(struct
> pp_hwmgr *hwmgr, enum BACO_STATE state)
>                       data |=3D 0x80000000;
>                       WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL,
> data);
>
> -                     if(smum_send_msg_to_smc_with_parameter(hwmgr,
> +                     if
> (smum_send_msg_to_smc_with_parameter(hwmgr,
>                                       PPSMC_MSG_EnterBaco, 0, NULL))
>                               return -EINVAL;
>               } else {
> -                     if(smum_send_msg_to_smc_with_parameter(hwmgr,
> +                     if
> (smum_send_msg_to_smc_with_parameter(hwmgr,
>                                       PPSMC_MSG_EnterBaco, 1, NULL))
>                               return -EINVAL;
>               }
> --
> 2.17.1

