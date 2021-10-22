Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD444373DD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F016E8FE;
	Fri, 22 Oct 2021 08:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0C96E8FE;
 Fri, 22 Oct 2021 08:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYxk/UpJbYTpa14GvXLsWhrWPGeyRXWTS9hMlkoW5m09TzE02Rs7CYgBy9ZoOXi9QmEw2WuChS4DN1wYMPKs4Gc3oXdvX7AjF4ycx+zQueoFlFi7OIxWX+Z4SMy9P5zaD7YDLxNFXCuFE189aRkJ2tLulnajUIegSD/sGZvVT/90BFo9lmdtcDO4TH4vzCfQsMva6jGOMKqQ25ebHVzwNuvJF58DyVIgR/8muqroyWqDJS+QJIEGAyyTchi/7bU1w1vI0uuZYr28C0jxUsxUssdKCCMj4jFluo7k+ETc+Gcr1bzUGWkQ9/ctilvFdJaKwiwpE1saChfIfbqiRkScaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9QAGkIgqaLrZUesMEq5MHc0hPazXHlK3rjZXHAhjlQ=;
 b=EanuPgueUPaNDmNO5LJg5d4ivXi5Dbrg3fmuFaYb3/t4Wqm529BcklbAPJOFWFP1QGmVZE3l8KHgd0B9cMEi6NHmduhC8k6l+QcNAU7eJyPfUfGToynQMArKoFKKMa0OnM7ek0ILzNZ3zGVzF0aEybz3uNlkmiBzLFHGFupk/2egZI/m5XPEN5IrdgDXGzSgABk0ntSZ7RPNEZ9Lq9C0HTmHQ+DgLp4lHAL/Jp91Op8xFJHownlTN6tgCp+QDDSUPcl4wViDmiuDnE7hbiFDIIBq5311jeasezcf4jjn3a+oSun8KGOwg6Iw9Iz6Lq04AankiGmiez6Z6E04/hIS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9QAGkIgqaLrZUesMEq5MHc0hPazXHlK3rjZXHAhjlQ=;
 b=fZHXrA1Qk9IAQSGfajN6yrc4v/aaa5sjoIc/RYetvefcvNrGgaOpJs1SqzTg5pbQHk9C3+MsG3jYkbUbnz7Db6pvNBjp7kOUJfo2zoI/jAThpRlGQeyTk/Mx7S1DmYEm7P/mJb6pPeYWcC5AxEx3w+Gfaojejwy10ksLtOVkTtY=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 08:46:55 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c%2]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 08:46:55 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Subject: RE: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Thread-Topic: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Thread-Index: AQHXxevA0g2GGOC1AkGMa1YE1Dr1DKvdNtRwgABaUoCAAQKyMA==
Date: Fri, 22 Oct 2021 08:46:54 +0000
Message-ID: <CO6PR12MB54891302DCDDA8788782E043FC809@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <CO6PR12MB54898FF423C7C44426068E7DFCBF9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <20211021151535.81769-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211021151535.81769-1-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b9166870-9c5a-431c-b9bf-d602e9b5fa19;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-10-22T06:41:37Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8b0b943-53b3-4783-7add-08d995388032
x-ms-traffictypediagnostic: CO6PR12MB5476:
x-microsoft-antispam-prvs: <CO6PR12MB5476EF028A24EA316BF29F68FC809@CO6PR12MB5476.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:28;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyoiB/+clFfzccMXHfdpOewqknnextmUAY4X+x/7eEm3co5tPfwW4ZlxpAE9cejV0jiPbEVeCp2RnxW4egmsXao7mHmr76ZT6rfHMC02g7DrZ/b0IOaMD7v3Oo0pQneyhk+dRPu2bY3uQIec0MA3glSz0sdtFAhDxs5u34WewqQC2Nz2xtipsqWBcqauPzenM54Q6nxiXinc1gs5rNhwHRbSeN78oiZ1hwYfTmcNsz326aX/qdSmDArMxeSCbYLqZmevelk3j3/1GJpYyk9dlL063OVSwCS/U5p2FsyfhZuZ0nzIriMd0DZSAlTa1YV7/0q3C2vc3LbZtbaHNHnCx0+Dqm7OOozfcdCSyKA9f7v5lUbgsqWrAfi/8Ps+iR1abWApiZ9edGGFaNe8WC+6DkrP3yo3aEM2mooWPJyQUG2n0i6so1Uo21KFDuTQlqZyilKUKYwcnbJQp09rNcsTN3FUx+d6XQ45PFvClymvI+CQNTD5YKgR397rnUjdcRGMgzaU5rlzcguW1USDFgTJMcL2z9JGf8ePIKytZItCllmSGX0xdw4lELIJddEasL4cUg5//ifdj7yIWe2hCCp8eXoc6/W6RdR8j2E6xvnBtYlLaokYJgKqaaI4c0lqA1Mg/qGKLeCxP1JW2HQshm7T5tdgbifY5Iy+MA2xi4h5pphFsqckFbCohiK3P95yDsdX/npwlCSQLnluk4o74H1DYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(2906002)(186003)(8676002)(66476007)(5660300002)(9686003)(71200400001)(4326008)(86362001)(508600001)(316002)(38100700002)(83380400001)(30864003)(122000001)(52536014)(55016002)(66946007)(110136005)(54906003)(66556008)(38070700005)(66446008)(8936002)(26005)(7696005)(76116006)(53546011)(6506007)(64756008)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HRLho12yqCYf04wvzFbzXEXqHVPSmrpKxDLZM2kQCaU9URTime1T+rBt331U?=
 =?us-ascii?Q?hk/Ob3lW44i4s5qy3qAhMPc5Bnn+BJLQAEHDkfpFcI/vMVx8KVCCRDA/S81H?=
 =?us-ascii?Q?XOLpZcJrQTpnqNf4RhMWTPhlDNNOeLd3cyyAZ3rFCDzCDVF4BzdVaNmjVXz8?=
 =?us-ascii?Q?GojQc0+21tZUbJ5+bj075hr3IGLf2MGhlVclzO3HyX3yzyLBlI9IciFBJ4Tg?=
 =?us-ascii?Q?CUCpKonCgLEFqTSyPSmoON+lvhrg8vjOhhjg78yoh4loyoMi7u4CO+xitzKb?=
 =?us-ascii?Q?lb5zO3BXsaSdvb6We75wGRgP/kOs45ev9t4BS9rTN2y2rHavQyKlHg/P69bM?=
 =?us-ascii?Q?A6Gjwnk24LxHMhQdfA2cu2XxBjFsqpDWl4eFVI3cWSOP6e8PGdvldc/EpTKh?=
 =?us-ascii?Q?im4D2w0J4gNoehQozN4BHpoGa9tc4kF+LaOAj3jN/EUoMDIMJSYGxQl1jDnR?=
 =?us-ascii?Q?k5EgHHvJvlLLcWp+WZ+69R4y5XN/D5GyY2RudEVQF5v8s13DJW3yJMqVXYp6?=
 =?us-ascii?Q?D74cu4/amDGlIiZC9BBEvtE24Gnkk9iMYDjAygw3oCPi44yhECRIkYstNCGE?=
 =?us-ascii?Q?JwN946Ge/OdZBPNn6PIj4nZrHEZ84GoiDn3sI9dWq7SMsvkGORZ2EycAdJI6?=
 =?us-ascii?Q?xBucnG55KQbeLBMHBZIWo2Il3v9PlGW9y46KBNGS/n+62VN+D6ytfsQGZSTv?=
 =?us-ascii?Q?fRhh60fnUDplX5C2YjKxxMvfdPxznAld4CmWl+DP9c4Bb/9DStDe60thHuY4?=
 =?us-ascii?Q?1WJQXIspF9+pL380vxXGJ2phwYN+nDsVnyLGAE9Nc3utfgZmTmNiUyxTaJch?=
 =?us-ascii?Q?Kqu2kQx1Du9S4qlrUpo5GL4nOIwnxf99GjBUZyNF2L8P9PFst0ohAHwJxlkX?=
 =?us-ascii?Q?CBnOupsNwkpvbr621vBCtxYrpG+VbHBLs0aqIpwJp8jBbLhZ8xVH7qM0VGgP?=
 =?us-ascii?Q?WENG6v21YW6lXd+QcePqL87r1JFk/qxSl1KMGCA6oSAbq41XDhc0xIblsWFC?=
 =?us-ascii?Q?Uv9le5Mo4uMvmuwBBraGumiA4ntf+EXeGrPOA/aO6Srl4kNox3Tnu3jfAong?=
 =?us-ascii?Q?6IwLi+ywmtksl16yAAUkoat2Yx0C4G/mFyhTOoFwfOtg1b9jGo/kS8ujSQ39?=
 =?us-ascii?Q?rnaUXRHHr7xa3TdRacegiobnSJeiLKxAaChCatWGgoDfD3WmbsahKT+bGzo+?=
 =?us-ascii?Q?N5i9h3Oxnc0VwKZMyGT7douYZzGlcJYYRXkM3SisG30twaN1UclTYByWVsCn?=
 =?us-ascii?Q?bo4YwHuFzR5FEwgomSadYofUvshzcPjQKW0OLAJlK6Ct4SI7KANHaCAPTXHq?=
 =?us-ascii?Q?vkAVY3iurZCOlCqk6Jq1Gj4fkjVutn14RrF4263zK8jJnsyIlZ2awOuKT5Rz?=
 =?us-ascii?Q?LZSMrzBVIKakcVeaLg0d22yK8Urr6c0LFZFVKbiOVyv2VuLZCQ3H9HsGrOTi?=
 =?us-ascii?Q?zjVT75eHjNo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b0b943-53b3-4783-7add-08d995388032
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 08:46:54.8108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waynelin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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

[Public]

Hi Bhawan,
It looks good to me. Thanks!
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

Regards,
Wayne
> -----Original Message-----
> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Sent: Thursday, October 21, 2021 11:16 PM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org; lyud=
e@redhat.com
> Cc: intel-gfx@lists.freedesktop.org; Wentland, Harry <Harry.Wentland@amd.=
com>; Lin, Wayne <Wayne.Lin@amd.com>; Kazlauskas,
> Nicholas <Nicholas.Kazlauskas@amd.com>; Lipski, Mikita <Mikita.Lipski@amd=
.com>; Lakha, Bhawanpreet
> <Bhawanpreet.Lakha@amd.com>
> Subject: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
>
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
>
> [Why]
> configure/call DC interface for DP2 mst support. This is needed to make D=
P2 mst work.
>
> [How]
> - add encoding type, logging, mst update/reduce payload functions
>
> Use the link encoding to determine the DP type (1.4 or 2.0) and add a fla=
g to dc_stream_update to determine whether to increase/reduce
> payloads.
>
> v2:
> * add DP_UNKNOWN_ENCODING handling
>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 292 ++++++++++++++++++  =
.../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
>  5 files changed, 345 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/a=
md/display/dc/core/dc.c
> index 8be04be19124..935a50d6e933 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2354,6 +2354,11 @@ static enum surface_update_type check_update_surfa=
ces_for_stream(
>               if (stream_update->dsc_config)
>                       su_flags->bits.dsc_changed =3D 1;
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +             if (stream_update->mst_bw_update)
> +                     su_flags->bits.mst_bw =3D 1;
> +#endif
> +
>               if (su_flags->raw !=3D 0)
>                       overall_type =3D UPDATE_TYPE_FULL;
>
> @@ -2731,6 +2736,15 @@ static void commit_planes_do_stream_update(struct =
dc *dc,
>                       if (stream_update->dsc_config)
>                               dp_update_dsc_config(pipe_ctx);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                     if (stream_update->mst_bw_update) {
> +                             if (stream_update->mst_bw_update->is_increa=
se)
> +                                     dc_link_increase_mst_payload(pipe_c=
tx, stream_update->mst_bw_update->mst_stream_bw);
> +                             else
> +                                     dc_link_reduce_mst_payload(pipe_ctx=
, stream_update->mst_bw_update->mst_stream_bw);
> +                     }
> +#endif
> +
>                       if (stream_update->pending_test_pattern) {
>                               dc_link_dp_set_test_pattern(stream->link,
>                                       stream->test_pattern.type,
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_link.c
> index e5d6cbd7ea78..ec5f107bc85a 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3232,6 +3232,9 @@ static struct fixed31_32 get_pbn_from_timing(struct=
 pipe_ctx *pipe_ctx)  static void
> update_mst_stream_alloc_table(
>       struct dc_link *link,
>       struct stream_encoder *stream_enc,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename st=
ream_enc to dio_stream_enc?
> +#endif
>       const struct dp_mst_stream_allocation_table *proposed_table)  {
>       struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] =
=3D { 0 }; @@ -3267,6 +3270,9 @@ static void
> update_mst_stream_alloc_table(
>                       work_table[i].slot_count =3D
>                               proposed_table->stream_allocations[i].slot_=
count;
>                       work_table[i].stream_enc =3D stream_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                     work_table[i].hpo_dp_stream_enc =3D hpo_dp_stream_e=
nc; #endif
>               }
>       }
>
> @@ -3389,6 +3395,10 @@ enum dc_status dc_link_allocate_mst_payload(struct=
 pipe_ctx *pipe_ctx)
>       struct dc_link *link =3D stream->link;
>       struct link_encoder *link_encoder =3D NULL;
>       struct stream_encoder *stream_encoder =3D pipe_ctx->stream_res.stre=
am_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     struct hpo_dp_link_encoder *hpo_dp_link_encoder =3D link->hpo_dp_li=
nk_enc;
> +     struct hpo_dp_stream_encoder *hpo_dp_stream_encoder =3D
> +pipe_ctx->stream_res.hpo_dp_stream_enc;
> +#endif
>       struct dp_mst_stream_allocation_table proposed_table =3D {0};
>       struct fixed31_32 avg_time_slots_per_mtp;
>       struct fixed31_32 pbn;
> @@ -3416,7 +3426,14 @@ enum dc_status dc_link_allocate_mst_payload(struct=
 pipe_ctx *pipe_ctx)
>               &proposed_table,
>               true)) {
>               update_mst_stream_alloc_table(
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                                     link,
> +                                     pipe_ctx->stream_res.stream_enc,
> +                                     pipe_ctx->stream_res.hpo_dp_stream_=
enc,
> +                                     &proposed_table);
> +#else
>                                       link, pipe_ctx->stream_res.stream_e=
nc, &proposed_table);
> +#endif
>       }
>       else
>               DC_LOG_WARNING("Failed to update"
> @@ -3430,23 +3447,56 @@ enum dc_status dc_link_allocate_mst_payload(struc=
t pipe_ctx *pipe_ctx)
>                       link->mst_stream_alloc_table.stream_count);
>
>       for (i =3D 0; i < MAX_CONTROLLER_NUM; i++) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>               DC_LOG_MST("stream_enc[%d]: %p      "
> +             "stream[%d].hpo_dp_stream_enc: %p      "
>               "stream[%d].vcp_id: %d      "
>               "stream[%d].slot_count: %d\n",
>               i,
>               (void *) link->mst_stream_alloc_table.stream_allocations[i]=
.stream_enc,
>               i,
> +             (void *) link->mst_stream_alloc_table.stream_allocations[i]=
.hpo_dp_stream_enc,
> +             i,
>               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
>               i,
>               link->mst_stream_alloc_table.stream_allocations[i].slot_cou=
nt);
> +#else
> +             DC_LOG_MST("stream_enc[%d]: %p      "
> +             "stream[%d].vcp_id: %d      "
> +             "stream[%d].slot_count: %d\n",
> +             i,
> +             (void *) link->mst_stream_alloc_table.stream_allocations[i]=
.stream_enc,
> +             i,
> +             link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +             i,
> +             link->mst_stream_alloc_table.stream_allocations[i].slot_cou=
nt);
> +#endif
>       }
>
>       ASSERT(proposed_table.stream_count > 0);
>
>       /* program DP source TX for payload */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +     case DP_8b_10b_ENCODING:
> +             link_encoder->funcs->update_mst_stream_allocation_table(
> +                     link_encoder,
> +                     &link->mst_stream_alloc_table);
> +             break;
> +     case DP_128b_132b_ENCODING:
> +             hpo_dp_link_encoder->funcs->update_stream_allocation_table(
> +                             hpo_dp_link_encoder,
> +                             &link->mst_stream_alloc_table);
> +             break;
> +     case DP_UNKNOWN_ENCODING:
> +             DC_LOG_ERROR("Failure: unknown encoding format\n");
> +             return DC_ERROR_UNEXPECTED;
> +     }
> +#else
>       link_encoder->funcs->update_mst_stream_allocation_table(
>               link_encoder,
>               &link->mst_stream_alloc_table);
> +#endif
>
>       /* send down message */
>       ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> @@ -3469,13 +3519,191 @@ enum dc_status dc_link_allocate_mst_payload(stru=
ct pipe_ctx *pipe_ctx)
>       pbn =3D get_pbn_from_timing(pipe_ctx);
>       avg_time_slots_per_mtp =3D dc_fixpt_div(pbn, pbn_per_slot);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +     case DP_8b_10b_ENCODING:
> +             stream_encoder->funcs->set_throttled_vcp_size(
> +                     stream_encoder,
> +                     avg_time_slots_per_mtp);
> +             break;
> +     case DP_128b_132b_ENCODING:
> +             hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +                             hpo_dp_link_encoder,
> +                             hpo_dp_stream_encoder->inst,
> +                             avg_time_slots_per_mtp);
> +             break;
> +     case DP_UNKNOWN_ENCODING:
> +             DC_LOG_ERROR("Failure: unknown encoding format\n");
> +             return DC_ERROR_UNEXPECTED;
> +     }
> +#else
>       stream_encoder->funcs->set_throttled_vcp_size(
>               stream_encoder,
>               avg_time_slots_per_mtp);
> +#endif
> +
> +     return DC_OK;
> +
> +}
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx,
> +uint32_t bw_in_kbps) {
> +     struct dc_stream_state *stream =3D pipe_ctx->stream;
> +     struct dc_link *link =3D stream->link;
> +     struct fixed31_32 avg_time_slots_per_mtp;
> +     struct fixed31_32 pbn;
> +     struct fixed31_32 pbn_per_slot;
> +     struct link_encoder *link_encoder =3D link->link_enc;
> +     struct stream_encoder *stream_encoder =3D pipe_ctx->stream_res.stre=
am_enc;
> +     struct dp_mst_stream_allocation_table proposed_table =3D {0};
> +     uint8_t i;
> +     enum act_return_status ret;
> +     DC_LOGGER_INIT(link->ctx->logger);
> +
> +     /* decrease throttled vcp size */
> +     pbn_per_slot =3D get_pbn_per_slot(stream);
> +     pbn =3D get_pbn_from_bw_in_kbps(bw_in_kbps);
> +     avg_time_slots_per_mtp =3D dc_fixpt_div(pbn, pbn_per_slot);
> +
> +     stream_encoder->funcs->set_throttled_vcp_size(
> +                             stream_encoder,
> +                             avg_time_slots_per_mtp);
> +
> +     /* send ALLOCATE_PAYLOAD sideband message with updated pbn */
> +     dm_helpers_dp_mst_send_payload_allocation(
> +                     stream->ctx,
> +                     stream,
> +                     true);
> +
> +     /* notify immediate branch device table update */
> +     if (dm_helpers_dp_mst_write_payload_allocation_table(
> +                     stream->ctx,
> +                     stream,
> +                     &proposed_table,
> +                     true)) {
> +             /* update mst stream allocation table software state */
> +             update_mst_stream_alloc_table(
> +                             link,
> +                             pipe_ctx->stream_res.stream_enc,
> +                             pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                             &proposed_table);
> +     } else {
> +             DC_LOG_WARNING("Failed to update"
> +                             "MST allocation table for"
> +                             "pipe idx:%d\n",
> +                             pipe_ctx->pipe_idx);
> +     }
> +
> +     DC_LOG_MST("%s  "
> +                     "stream_count: %d: \n ",
> +                     __func__,
> +                     link->mst_stream_alloc_table.stream_count);
> +
> +     for (i =3D 0; i < MAX_CONTROLLER_NUM; i++) {
> +             DC_LOG_MST("stream_enc[%d]: %p      "
> +                             "stream[%d].vcp_id: %d      "
> +                             "stream[%d].slot_count: %d\n",
> +                             i,
> +                             (void *) link->mst_stream_alloc_table.strea=
m_allocations[i].stream_enc,
> +                             i,
> +                             link->mst_stream_alloc_table.stream_allocat=
ions[i].vcp_id,
> +                             i,
> +                             link->mst_stream_alloc_table.stream_allocat=
ions[i].slot_count);
> +     }
> +
> +     ASSERT(proposed_table.stream_count > 0);
> +
> +     /* update mst stream allocation table hardware state */
> +     link_encoder->funcs->update_mst_stream_allocation_table(
> +                     link_encoder,
> +                     &link->mst_stream_alloc_table);
> +
> +     /* poll for immediate branch device ACT handled */
> +     ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> +                     stream->ctx,
> +                     stream);
>
>       return DC_OK;
> +}
> +
> +enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx,
> +uint32_t bw_in_kbps) {
> +     struct dc_stream_state *stream =3D pipe_ctx->stream;
> +     struct dc_link *link =3D stream->link;
> +     struct fixed31_32 avg_time_slots_per_mtp;
> +     struct fixed31_32 pbn;
> +     struct fixed31_32 pbn_per_slot;
> +     struct link_encoder *link_encoder =3D link->link_enc;
> +     struct stream_encoder *stream_encoder =3D pipe_ctx->stream_res.stre=
am_enc;
> +     struct dp_mst_stream_allocation_table proposed_table =3D {0};
> +     uint8_t i;
> +     enum act_return_status ret;
> +     DC_LOGGER_INIT(link->ctx->logger);
> +
> +     /* notify immediate branch device table update */
> +     if (dm_helpers_dp_mst_write_payload_allocation_table(
> +                             stream->ctx,
> +                             stream,
> +                             &proposed_table,
> +                             true)) {
> +             /* update mst stream allocation table software state */
> +             update_mst_stream_alloc_table(
> +                             link,
> +                             pipe_ctx->stream_res.stream_enc,
> +                             pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                             &proposed_table);
> +     }
> +
> +     DC_LOG_MST("%s  "
> +                     "stream_count: %d: \n ",
> +                     __func__,
> +                     link->mst_stream_alloc_table.stream_count);
> +
> +     for (i =3D 0; i < MAX_CONTROLLER_NUM; i++) {
> +             DC_LOG_MST("stream_enc[%d]: %p      "
> +                             "stream[%d].vcp_id: %d      "
> +                             "stream[%d].slot_count: %d\n",
> +                             i,
> +                             (void *) link->mst_stream_alloc_table.strea=
m_allocations[i].stream_enc,
> +                             i,
> +                             link->mst_stream_alloc_table.stream_allocat=
ions[i].vcp_id,
> +                             i,
> +                             link->mst_stream_alloc_table.stream_allocat=
ions[i].slot_count);
> +     }
> +
> +     ASSERT(proposed_table.stream_count > 0);
> +
> +     /* update mst stream allocation table hardware state */
> +     link_encoder->funcs->update_mst_stream_allocation_table(
> +                     link_encoder,
> +                     &link->mst_stream_alloc_table);
> +
> +     /* poll for immediate branch device ACT handled */
> +     ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> +                     stream->ctx,
> +                     stream);
> +
> +     if (ret !=3D ACT_LINK_LOST) {
> +             /* send ALLOCATE_PAYLOAD sideband message with updated pbn =
*/
> +             dm_helpers_dp_mst_send_payload_allocation(
> +                             stream->ctx,
> +                             stream,
> +                             true);
> +     }
>
> +     /* increase throttled vcp size */
> +     pbn =3D get_pbn_from_bw_in_kbps(bw_in_kbps);
> +     pbn_per_slot =3D get_pbn_per_slot(stream);
> +     avg_time_slots_per_mtp =3D dc_fixpt_div(pbn, pbn_per_slot);
> +
> +     stream_encoder->funcs->set_throttled_vcp_size(
> +                             stream_encoder,
> +                             avg_time_slots_per_mtp);
> +
> +     return DC_OK;
>  }
> +#endif
>
>  static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx) =
 { @@ -3483,6 +3711,10 @@ static enum dc_status
> deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>       struct dc_link *link =3D stream->link;
>       struct link_encoder *link_encoder =3D NULL;
>       struct stream_encoder *stream_encoder =3D pipe_ctx->stream_res.stre=
am_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     struct hpo_dp_link_encoder *hpo_dp_link_encoder =3D link->hpo_dp_li=
nk_enc;
> +     struct hpo_dp_stream_encoder *hpo_dp_stream_encoder =3D
> +pipe_ctx->stream_res.hpo_dp_stream_enc;
> +#endif
>       struct dp_mst_stream_allocation_table proposed_table =3D {0};
>       struct fixed31_32 avg_time_slots_per_mtp =3D dc_fixpt_from_int(0);
>       int i;
> @@ -3504,9 +3736,28 @@ static enum dc_status deallocate_mst_payload(struc=
t pipe_ctx *pipe_ctx)
>        */
>
>       /* slot X.Y */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +     case DP_8b_10b_ENCODING:
> +             stream_encoder->funcs->set_throttled_vcp_size(
> +                     stream_encoder,
> +                     avg_time_slots_per_mtp);
> +             break;
> +     case DP_128b_132b_ENCODING:
> +             hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +                             hpo_dp_link_encoder,
> +                             hpo_dp_stream_encoder->inst,
> +                             avg_time_slots_per_mtp);
> +             break;
> +     case DP_UNKNOWN_ENCODING:
> +             DC_LOG_ERROR("Failure: unknown encoding format\n");
> +             return DC_ERROR_UNEXPECTED;
> +     }
> +#else
>       stream_encoder->funcs->set_throttled_vcp_size(
>               stream_encoder,
>               avg_time_slots_per_mtp);
> +#endif
>
>       /* TODO: which component is responsible for remove payload table? *=
/
>       if (mst_mode) {
> @@ -3516,8 +3767,16 @@ static enum dc_status deallocate_mst_payload(struc=
t pipe_ctx *pipe_ctx)
>                               &proposed_table,
>                               false)) {
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                     update_mst_stream_alloc_table(
> +                                             link,
> +                                             pipe_ctx->stream_res.stream=
_enc,
> +                                             pipe_ctx->stream_res.hpo_dp=
_stream_enc,
> +                                             &proposed_table);
> +#else
>                       update_mst_stream_alloc_table(
>                               link, pipe_ctx->stream_res.stream_enc, &pro=
posed_table);
> +#endif
>               }
>               else {
>                               DC_LOG_WARNING("Failed to update"
> @@ -3533,6 +3792,20 @@ static enum dc_status deallocate_mst_payload(struc=
t pipe_ctx *pipe_ctx)
>                       link->mst_stream_alloc_table.stream_count);
>
>       for (i =3D 0; i < MAX_CONTROLLER_NUM; i++) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +             DC_LOG_MST("stream_enc[%d]: %p      "
> +             "stream[%d].hpo_dp_stream_enc: %p      "
> +             "stream[%d].vcp_id: %d      "
> +             "stream[%d].slot_count: %d\n",
> +             i,
> +             (void *) link->mst_stream_alloc_table.stream_allocations[i]=
.stream_enc,
> +             i,
> +             (void *) link->mst_stream_alloc_table.stream_allocations[i]=
.hpo_dp_stream_enc,
> +             i,
> +             link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +             i,
> +             link->mst_stream_alloc_table.stream_allocations[i].slot_cou=
nt);
> +#else
>               DC_LOG_MST("stream_enc[%d]: %p      "
>               "stream[%d].vcp_id: %d      "
>               "stream[%d].slot_count: %d\n",
> @@ -3542,11 +3815,30 @@ static enum dc_status deallocate_mst_payload(stru=
ct pipe_ctx *pipe_ctx)
>               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
>               i,
>               link->mst_stream_alloc_table.stream_allocations[i].slot_cou=
nt);
> +#endif
>       }
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +     case DP_8b_10b_ENCODING:
> +             link_encoder->funcs->update_mst_stream_allocation_table(
> +                     link_encoder,
> +                     &link->mst_stream_alloc_table);
> +             break;
> +     case DP_128b_132b_ENCODING:
> +             hpo_dp_link_encoder->funcs->update_stream_allocation_table(
> +                             hpo_dp_link_encoder,
> +                             &link->mst_stream_alloc_table);
> +             break;
> +     case DP_UNKNOWN_ENCODING:
> +             DC_LOG_ERROR("Failure: unknown encoding format\n");
> +             return DC_ERROR_UNEXPECTED;
> +     }
> +#else
>       link_encoder->funcs->update_mst_stream_allocation_table(
>               link_encoder,
>               &link->mst_stream_alloc_table);
> +#endif
>
>       if (mst_mode) {
>               dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_link_dp.c
> index 296b0defcd1c..bb96e4e9ccfc 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -5993,6 +5993,25 @@ enum dp_link_encoding dp_get_link_encoding_format(=
const struct dc_link_settings  }
>
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const
> +struct dc_link *link) {
> +     struct dc_link_settings link_settings =3D {0};
> +
> +     if (!dc_is_dp_signal(link->connector_signal))
> +             return DP_UNKNOWN_ENCODING;
> +
> +     if (link->preferred_link_setting.lane_count !=3D
> +                     LANE_COUNT_UNKNOWN &&
> +                     link->preferred_link_setting.link_rate !=3D
> +                                     LINK_RATE_UNKNOWN) {
> +             link_settings =3D link->preferred_link_setting;
> +     } else {
> +             decide_mst_link_settings(link, &link_settings);
> +     }
> +
> +     return dp_get_link_encoding_format(&link_settings);
> +}
> +
>  // TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST an=
d MST)  static void get_lane_status(
>       struct dc_link *link,
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/a=
md/display/dc/dc_link.h
> index a73d64b1fd33..08815310d85b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -295,6 +295,10 @@ enum dc_detect_reason {  bool dc_link_detect(struct =
dc_link *dc_link, enum dc_detect_reason reason);  bool
> dc_link_get_hpd_state(struct dc_link *dc_link);  enum dc_status dc_link_a=
llocate_mst_payload(struct pipe_ctx *pipe_ctx);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx,
> +uint32_t req_pbn); enum dc_status dc_link_increase_mst_payload(struct
> +pipe_ctx *pipe_ctx, uint32_t req_pbn); #endif
>
>  /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
>   * Return:
> @@ -424,4 +428,7 @@ uint32_t dc_bandwidth_in_kbps_from_timing(  bool dc_l=
ink_is_fec_supported(const struct dc_link *link);  bool
> dc_link_should_enable_fec(const struct dc_link *link);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const
> +struct dc_link *link); #endif
>  #endif /* DC_LINK_H_ */
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm=
/amd/display/dc/dc_stream.h
> index b8ebc1f09538..e37c4a10bfd5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> @@ -115,6 +115,13 @@ struct periodic_interrupt_config {
>       int lines_offset;
>  };
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct dc_mst_stream_bw_update {
> +     bool is_increase; // is bandwidth reduced or increased
> +     uint32_t mst_stream_bw; // new mst bandwidth in kbps }; #endif
> +
>  union stream_update_flags {
>       struct {
>               uint32_t scaling:1;
> @@ -125,6 +132,9 @@ union stream_update_flags {
>               uint32_t gamut_remap:1;
>               uint32_t wb_update:1;
>               uint32_t dsc_changed : 1;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +             uint32_t mst_bw : 1;
> +#endif
>       } bits;
>
>       uint32_t raw;
> @@ -278,6 +288,9 @@ struct dc_stream_update {
>
>       struct dc_writeback_update *wb_update;
>       struct dc_dsc_config *dsc_config;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +     struct dc_mst_stream_bw_update *mst_bw_update; #endif
>       struct dc_transfer_func *func_shaper;
>       struct dc_3dlut *lut3d_func;
>
> --
> 2.25.1

