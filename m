Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97882674C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 03:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFCB10E14E;
	Mon,  8 Jan 2024 02:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E310E141;
 Mon,  8 Jan 2024 02:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7DW9/fIZMA0bnQL05rrHLfsRvKm/q9id/dCs2zRSkDiLSIhpDJwSYhBevaTnbiI1zwkEUkvXhS29IZDNvC+5aNJHkU/92jlG4F/wT8zVBPVlUic5O7vLxa1XNjQOOK/ECMRB5Qu9MdYGMD3jKbqFW+O9mzOAXfW3RS1fLI9VysJkAzyKYGnegzY77ILXZ342p26lb6X9aszHtCGHu0n8p3JEh25bAovI1Xm7nlQ3dcGschLWSHwtACGVkWQ+cSiXj78S4UWoF0WG9422J8xmjYnfys+k/BAYXTVkAwSfioC6xgQyofQE+pNruPSZgOWFcIkCae2b33hjk3QXDth+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U7xFn2Mr9laTQI3FAU4ap4I/xgGLuaxdLkyR8WDGrk=;
 b=kPZJ4ZZA6QMyEbfC0tRG8EdnGJMNcVAH+6twgkgjXg6lGDVZOBLZSSeB+2BhdtqQlSNTNBIqMGuCQuupgykPhvaMzo5dy4qXrsOCIXFay4lT2tXvKMPokuWjYgw1xlMlwQ+9nYAUNiJP2yloOadsocR7qx9yCYY/e6yWOfbFiNnDUSXWMp1s1x2dfcndhfDspXupdR+H7BCsrQTpYFfppdNJ9R0mU03I1GrLbCjgIfRSZvxpWjkaN9+D/FVQfMkkXU+XH3tN7H4ZFigXTxmsditlAOO/M7chxBALKZr//NLgsROlpXQ1F1ODR8GTggZ1nX8iMzPgfKOfH43XwXVgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6U7xFn2Mr9laTQI3FAU4ap4I/xgGLuaxdLkyR8WDGrk=;
 b=A0dn+9LLa5ToYPPXDxvUOKCA4q5UOppRFc+JossYLayKKMyY9ORF55+Hzhg5hFFB7yO6FX6k93P5u1Pa+Qre3kOsLaR2tbgGHzANjy0jk3bQUAjxp0RidSe1xNbsjBBbqdEOH9h5Qn4+SqIN2LtI9j/HlIp6TmOfEeKUdy+dfXQ=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 02:58:15 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::65c9:d76b:2f37:a940]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::65c9:d76b:2f37:a940%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 02:58:15 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Imre Deak <imre.deak@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/display: Fix assignment of integer to fixed point
 pbn_div
Thread-Topic: [PATCH] drm/amd/display: Fix assignment of integer to fixed
 point pbn_div
Thread-Index: AQHaP71jebZOi952YE6vceXO2NXcJrDPO7GQ
Date: Mon, 8 Jan 2024 02:58:15 +0000
Message-ID: <CO6PR12MB548992EC45C5B1EF0CB6D6EFFC6B2@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240105095559.1136737-1-imre.deak@intel.com>
In-Reply-To: <20240105095559.1136737-1-imre.deak@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=665675e8-c319-4d33-abe9-3bb25fa15f6e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-08T02:54:39Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|BY5PR12MB4292:EE_
x-ms-office365-filtering-correlation-id: ecb0d61e-0a1c-4807-53e1-08dc0ff5a90e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pKAsTIP9QkyhvkQ78PfY4oBdCEZW/M9haoIGRV9IyC0aG3CciSCl1I8yJY3GPqAIIZEKK8eBalIMXEfywWJPXa9xRM45BZUKS85EdC0cY89WLIvioVaec3HbyUN0FHzHxoAO9eEx/3gkIqx3V3RCzX8OUjOZ6ItNhrgmILQWu2llIxhrUeqw6OCahIoGxwZZ/SnATAhoaTh38JNMAuJ4i4K2jeLI+W0RflG75rRKqYzZgNjlV8HsuUvk5iyp9fdh2LL0Yf48iOJiQ8/km+ZItIYgEtXS0dA4xr6GOOaKjjjyQBuhlfIQ24cmQ/fVbrKcXNRP+3jxxDp6TyOh1M74e4YWhcEQmmc/3J2TmUsqOJm5Habe6bUaQLvgLrOdzotv/Xi9PU1NLxvh5exsRYGWishnKmzvG/T+BlkZdcMd+Tfbw+qVlEdCkY2V3OOByyI4GAfjk7+rJZwTeCkQp6kh3u0BVer1qipESRSYLTRCUj7aqDYs5JroGcxDSP1h69hSRabNCeziRK3hYFpaOcl2+vwdeLxsgY+rnVDD8dAYLFEitGgvAFKY/chnaQiO86vSXHaxYVQe89H6tAsuxdWUavwWN5ExmGOLMECB7VACyYVcdB6M+ZTdstA3JbdTeynu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(346002)(366004)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(316002)(110136005)(54906003)(8936002)(55236004)(8676002)(71200400001)(7696005)(83380400001)(6506007)(52536014)(4326008)(33656002)(53546011)(66946007)(66556008)(76116006)(55016003)(9686003)(478600001)(64756008)(26005)(66476007)(66446008)(122000001)(38100700002)(2906002)(38070700009)(5660300002)(41300700001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6G2K2SVLg5GDqx0BMo0zfrmJl85hU/wEHgRKh5KoC1zP8TZQ4vtmwFXBCIkg?=
 =?us-ascii?Q?BVgrStZKtyaC2fcaY8NJDsLP2tg2P9ER8OHhuoe7HcnRAxSnpBqhdYpbZhuG?=
 =?us-ascii?Q?hdLdAEstWqSdxmSKDfQpX+NJcxGl7zL2NLYG41432JRJfkPgqSDjK2Ilww7T?=
 =?us-ascii?Q?r3lyCE8+D37coihzTFQiyzKK0RUKn5t1goDxE0ox0Y6Wsie97GJaqrlQx2PB?=
 =?us-ascii?Q?4v/tQGUFEI0aMvsrlD8leKAa6te8y7lNV81iPEajFXrttNt7cLYddLJeTvMN?=
 =?us-ascii?Q?GiD8aau0sK9Lt+9fZZulkWA7ZOlUCJ6e6DHm9CV/wA28ZA1JXvfxRjtHc5nv?=
 =?us-ascii?Q?hJwZrVcAFKDaS07G9U5kpgnyzbPeQKukI9HLx1DI4jjhJAGf4dX+dRBj/89H?=
 =?us-ascii?Q?X833q66+kRJPG2YN0ggo+vKaDOp/X7mqqxknVPWN4Q87BJnE5AP9FkUrL56O?=
 =?us-ascii?Q?lLpw0M/1nLq9zXxNpNzhmNu0AFUlzDaUCH7r12YdwPfUPBCC7tTt08mlShc1?=
 =?us-ascii?Q?EDZ6fEophsVC5ug6uwaZi0jxmrg1c8znVZPbgA5PiTlMGIt3BZmKwoqhKP8K?=
 =?us-ascii?Q?w1batPv5rQE1aryPqVhHhzUXic86g/y+g7gSZ7dvvr1JNMCp5dQxU9/v4W10?=
 =?us-ascii?Q?CGfRoU2W/mTPHWdbB4EUV/mzXCcSVUelFqKRUd/dryGknKL0i4kT5wywml89?=
 =?us-ascii?Q?oj+mQnBYNRJFwkM7PCjCChFu6ER7XHHkm26yNG2Im5rupKqrFTlCGRn1g+q8?=
 =?us-ascii?Q?PiOVuIQcwa7R00P86b+FcBPIKorevvSJOgtYnfxz1mnLXymNxE4ih7c4f+qu?=
 =?us-ascii?Q?8KP/6ikt62NRji/OEDAP2oL3hvoVyA/60/UXZIyT6wZ2WDttRA/9TSKjzvmk?=
 =?us-ascii?Q?RVb0HB+AORHJxNxLyXxT35gmvwThyICNLOk6IWZhHrZSW6uxpk1ibmhPBAw1?=
 =?us-ascii?Q?U76i7+Dlvm2i6ECPCkpepvgScZnIVfJRJnpUzZZCFUD2yyHZmrijoNbQQkkz?=
 =?us-ascii?Q?08HAi7/UWl+HKqEQIrJJaRkwtGM08l+9kDCFDilhM9bJa0SRTu/1D53o5ont?=
 =?us-ascii?Q?fLsvrnrZvuDuKTjv2ayLcUt65vWJpstjgYPOK/3+D3/PUQL3BnKeV9dm+gt7?=
 =?us-ascii?Q?l8DNSB0RMwU1/wQ78gNday12OMGqEOYP/QB5KBdbxWA8KYUXtqwukB5tcm02?=
 =?us-ascii?Q?HdXy1iiMnt5sZT/CLGELK4k9BAoxdEWq6nWNc1xOJ136sYJb1hymsUnvgCaZ?=
 =?us-ascii?Q?sY3wSjaj8BnzsCF9J1ItjYMmigkkDZSe+VwLoNrPTHfHNKbcqOOjkVZ3ftx+?=
 =?us-ascii?Q?Mta5dTzO8wvfk0+MFun366wA00RAH0aLiYk0jHHWvR5cjkcrHeg9U5voyiie?=
 =?us-ascii?Q?NJq4jdbNjQin8s/xZmOsPOY3W20WgQDNX58U/V3ZR7P3UuJWsTd2nT8zciOM?=
 =?us-ascii?Q?G72vdXo/ni1YdGMZTDrl1TQlxUaPKZYT5uvkqHPBvZafcI4NKgTf70dB6Hni?=
 =?us-ascii?Q?sKcQBoUJK83bIWej18+vZVnLz/B7zV6BaCzevrXXYdPyUy27O5Q6v3z4Ymi5?=
 =?us-ascii?Q?7KAc2LZFR4HNzz6aRK0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb0d61e-0a1c-4807-53e1-08dc0ff5a90e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 02:58:15.6848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AT4+MrpJT26kvw4+XmPZucrLxegXDSjddc9Tx+O8WeT+3hBrnpyAVkZ45aNSr3nQfpbLI05/I7VP3+JExfL1uw==
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
Cc: Dave Airlie <airlied@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thanks, Imre Deak!

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Friday, January 5, 2024 5:56 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Lin, Wayne <Wayne.Lin@amd.com>; amd-gfx@lists.freedesktop.org; Dave
> Airlie <airlied@redhat.com>
> Subject: [PATCH] drm/amd/display: Fix assignment of integer to fixed poin=
t
> pbn_div
>
> Fix the merge conflict resolution in
>
> commit 13feae00ee99e0fc8b6f1748fc4c70281a7d6939
> Merge: eb284f4b37817 3c064aea46d07
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Fri Jan 5 13:19:40 2024 +1000
>
>     Merge remote-tracking branch 'drm/drm-next' into drm-tip
>
>     # Conflicts:
>     #       drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>     #       drivers/gpu/drm/i915/display/intel_dmc.c
>
> @@@ -6916,7 -7007,8 +7009,7 @@@ static int
> dm_encoder_helper_atomic_che
>         if (IS_ERR(mst_state))
>                 return PTR_ERR(mst_state);
>
>  -      if (!mst_state->pbn_div.full)
>  -              mst_state->pbn_div.full =3D
> dfixed_const(dm_mst_get_pbn_divider(aconnector->mst_root->dc_link));
>  +      mst_state->pbn_div =3D dm_mst_get_pbn_divider(aconnector->mst_roo=
t-
> >dc_link);
>
> resulting from the following two changes:
>
> commit 191dc43935d1ece82bc6c9653463b3b1cd8198fb
> Author: Imre Deak <imre.deak@intel.com>
> Date:   Thu Nov 16 15:18:31 2023 +0200
>
>     drm/dp_mst: Store the MST PBN divider value in fixed point format
>
> commit 9cdef4f720376ef0fb0febce1ed2377c19e531f9
> Author: Wayne Lin <wayne.lin@amd.com>
> Date:   Mon Dec 4 10:09:33 2023 +0800
>
>     drm/amd/display: pbn_div need be updated for hotplug event
>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5d82bac1a51ab..f9714dd6fe8ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7009,7 +7009,7 @@ static int dm_encoder_helper_atomic_check(struct
> drm_encoder *encoder,
>       if (IS_ERR(mst_state))
>               return PTR_ERR(mst_state);
>
> -     mst_state->pbn_div =3D dm_mst_get_pbn_divider(aconnector-
> >mst_root->dc_link);
> +     mst_state->pbn_div.full =3D
> dfixed_const(dm_mst_get_pbn_divider(aconnector->mst_root->dc_link));
>
>       if (!state->duplicated) {
>               int max_bpc =3D conn_state->max_requested_bpc;
> --
> 2.39.2

