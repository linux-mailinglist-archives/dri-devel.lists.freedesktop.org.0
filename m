Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A10435EF1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FE86EA17;
	Thu, 21 Oct 2021 10:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E006EA17;
 Thu, 21 Oct 2021 10:21:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkEDt4As4uayxKzgh+XHxvnMjjsmt6b8ijc7sZRbntjcmW/NcrCPdThmYQMwTCvhs+tdfoLY9XEYpFxhV2hAWc/qg/Owbb9itHuNtHrqofP4SeA1yi/7HKRPT0175RuPI9k5IAU/aUun5qKmo0TfdAr5eX9mHyNe2kly7TcexkEmCMbgjjOhEQFTmtEYar6NZWKzhvNtJJnqu71GUPtHSUOg6wSBAg/IpsYPyZUgIKa4StDbuC4ED2Wk5QTVtXl/DNLUCqF466QR8Qc5G+3fQHFaqTvl4Pc6MPVnzSkRa1Umpj+M9jfq36wuYe/EK1trhu60I2xrlIX3KUvZEBZQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeHiCnxZf7ZpIan1oT5wV2tg9IEj+sgEDJEWRRuL5vA=;
 b=AM9Z+KNLmwtLS5ATwKcnINI0CQGyE7Xmw7G9Aw1rVT2Sl6nvKcbIedvZxhu+HJk32bbF2Em++60cEGURRB9jDvq45XcaUhgMD1mQ8AXUdbjuJfl47CEjs7AweAuTHP4pezEDmNjOLGRwOM/hxIqQGbO7suACPugUYy4srqeNG86nZucTBg6f3DLXVD2E+8XFSku7C3kMIWLeabG2kSIPwhGt+e7olbBd2cNyjEQdmBUM4i2nTlV7QXmoM8wj4/qhowJIyJC412Hbba5ShT6v0n5BmLVT11fez9uqIGgTMI+NrZiDjG4v9isbg5VjPZz+WIo/5kT6GE6NOEa4pUi9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeHiCnxZf7ZpIan1oT5wV2tg9IEj+sgEDJEWRRuL5vA=;
 b=C9CjzBehPa8pBfHTyTspHJ3f9IngLdHg7j42g01+gtYHmSmb59GgxFpDLP3qB04DV25P3mmzoDRAwyBRVFT8UGrgUPONN/nf4wLrwpF673beo6ArpGnKH9WwG9/WaBuR0mTu7nRXTeizmtQGZimZUM/hM2UrpyMFZO1fb7Oa1fQ=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 10:21:22 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::14f7:9173:d617:e87c%2]) with mapi id 15.20.4628.016; Thu, 21 Oct 2021
 10:21:22 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zuo, Jerry"
 <Jerry.Zuo@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Lipski, Mikita" <Mikita.Lipski@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Thread-Topic: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
Thread-Index: AQHXxevA0g2GGOC1AkGMa1YE1Dr1DKvdNtRw
Date: Thu, 21 Oct 2021 10:21:21 +0000
Message-ID: <CO6PR12MB54898FF423C7C44426068E7DFCBF9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
 <20211020194715.1107972-3-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211020194715.1107972-3-Bhawanpreet.Lakha@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=9178ae65-2aff-459f-b8ff-a50e026bbc64;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-10-21T09:57:25Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79f31c14-130d-4640-a6c0-08d9947c8799
x-ms-traffictypediagnostic: CO6PR12MB5473:
x-microsoft-antispam-prvs: <CO6PR12MB5473437531C26D95329E565CFCBF9@CO6PR12MB5473.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bIlPFbSrGRZiR/MNmRzsKYVdQ/QvIpIY3iFxex23jeSWkH6V5DsrccUqGBFmhVFF0S+Z+6XDrBuHSjIvpuLmWSdNumkEOkSDeQH6SDi/jUY3Xh0EhrfPT6IcfQNK0r6nDV0r6B1bxfF1lk/DxBNhDkjQsnBP12Peh9mVzTIbisix+ZjXkwhJkCfP1Zd3v8QpasMpcCPkarIMu83aQsxJi9sNn9oOVehOjT77y0hxvwLpYDrsfQEeGY5EUnPE8WeeTMhLSg5r2bFWwttablOV4UKV/Me0X51RYWKC9nI17MohefYJBq08+iOxnYKjwSIYHOvt9fVdmuaJv9PVNHQDO3Z3cYKTGuyft7Ob0q0cxz2V90J7PlH/uqtJpXjmVLrEOBCxh5Bh1jcV6Qa3NFQBCESA+9MwZqQ/jimI8wvpfokGqE3mipXOAYiLvxm2+XhTDx1r5keW/D9hGtvLF13d2/E/aNow80YfxYTgi77nLxEdyZXAVH4yP7gzUJL2CVcxni7/TrcoBF/O7KfDYwy0ir3MBIgs51MqEhzcaJu8xswQVGyYnTup5uvmeNE0eCtfiennKSA+Rlpi23xCJW2aUubUyPdAXR51l6BscC94i8g4qwkzRC0+3EedbgA/Kb1gXiT65EQYRXzM0egtIhNZl+5AjHMfr95v8gpbCZhKpQ+62VXqsfz/vktbAsSgpLHUxFJfkfvxGNt1D1oNsVt30A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4326008)(52536014)(66446008)(30864003)(9686003)(83380400001)(66476007)(122000001)(110136005)(66556008)(55016002)(38100700002)(2906002)(186003)(64756008)(33656002)(86362001)(66946007)(76116006)(26005)(7696005)(38070700005)(508600001)(8936002)(6506007)(53546011)(5660300002)(316002)(54906003)(71200400001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?49hAaU3RICD9bf8gtQcOSMmIHj+a1q9NwwP6Qe7jG6UXgPQaUxGSaa3VtAWF?=
 =?us-ascii?Q?3L1tSWPmNrS+kvaBx6E1PaDXsHag1GzjVtSqs4rluaPNHxJtfictBvSSnUcf?=
 =?us-ascii?Q?TFkKRBKL1KyLt3IJvlvtw7tUh8ZKkS+X4SW7ET3U/cdrF+84Go2AI9eJaAx9?=
 =?us-ascii?Q?1Ztx5ulJ3NYU7ObnOKU9yneGWv3XRshxrEdsDMCvNjOmwk8r+2DBfMeulR/T?=
 =?us-ascii?Q?OsTYXEdEeoQMs+d8J37RfjRAVNeRJCZgN6LoHbzXzgoGFnxhnt7HUbaQkTGY?=
 =?us-ascii?Q?pqOSd1V86/k7eEhoQ+VMZ1v9mOE944D3VutHszdIFOkd9X/g9VqVVns+k7ut?=
 =?us-ascii?Q?pjYtYRe7cttGtT/kEQi6b0NMwC3GRn1o+PIBh/ronzl+Xd/TETEVSc+n2GYd?=
 =?us-ascii?Q?BLqlBFcICddjQUxY3nusk70PztdIfmxccvJ2QqF8pYvYyB2lXYZM1/z2ZtiU?=
 =?us-ascii?Q?O4evQqHuGKskqrSwaPga55umot2D9XEXmTyLVICibrGZTbTrl4AH3b13upVt?=
 =?us-ascii?Q?uXj1swwqXO3BxOTlrUz6H49qQU/mLTBWG7IMdsNQv3a9wAYKUxE63krYlH6V?=
 =?us-ascii?Q?AtaB086MQfuYFnw2rOY6zmHFcCGAwFpA0l0P+3KlSg1qyn/BHeGsZYmcoOWu?=
 =?us-ascii?Q?6KQxBzLmnuSdcSbtASj7+mRmLMTBZv/2fsYmI90PdsNSt01vsZh0cu34ajMX?=
 =?us-ascii?Q?Hw5fd9rP3oX0LPqfAZqX8caNTAmMf/ACe5jKhL8Hpp6jfFqZJ54h+qVDn5xh?=
 =?us-ascii?Q?64KWVCo3jKQcVb6QV4abiohqagDMQnqVMFO06KdIKC6r9LyejSDBXl/Kev8V?=
 =?us-ascii?Q?7D+N4CSAp+mWuslh75MkKjviVi7+UftpFHwi8l561x2j6w0xuHTRKFhSsGDi?=
 =?us-ascii?Q?aFe094jfIg7Rsn4r3PPKzZ/S7gOfylctUT7kanBvGMkKySnqj1lxqnKJ3ldo?=
 =?us-ascii?Q?0Ea8fCtmWVH6AXMqmtVhSLWOARR/hpbsjq4uVzo1WayHyRh6NlgPHRJNYVOU?=
 =?us-ascii?Q?q8wZkYybguPr6/kLZ90N5S8PB1M9z7ck6zH7XoHCKWn0quQCJmHBRy2uwHVc?=
 =?us-ascii?Q?8KsCnroIJnd0bOWvmngwouM1m/pKTae+bApFxO3T7dCn5o9CMw5UfVw3OiZD?=
 =?us-ascii?Q?7mtaQHmbYlZmDzXJuX4z5RAJ5iCzIinl4uGTcSBqf1+gRV9CHq0XkcYmvA59?=
 =?us-ascii?Q?lNuQCL05vcYNaMG+GhN3Sjli8hH4P/MHYw3NOt4YhI6lwnZpksz3/+re5z3g?=
 =?us-ascii?Q?JkIM9W42KWx8vzaXn41jVFxvlNuhUvNFskK7CF+cO2Hg70VbWJekYvynuXVk?=
 =?us-ascii?Q?MKjHOFtinBEVsdyE4dcnQ3Yv542O8Q/sEOc0v3Kzkf+5lN65F/yXj396CGXe?=
 =?us-ascii?Q?CvJbAF/NJEJlhxYG2b1MXigli1mOr7Ig6KOGTb0BHVH7XP9VBA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f31c14-130d-4640-a6c0-08d9947c8799
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 10:21:21.8807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waynelin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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

> -----Original Message-----
> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Sent: Thursday, October 21, 2021 3:47 AM
> To: Zuo, Jerry <Jerry.Zuo@amd.com>; dri-devel@lists.freedesktop.org; lyud=
e@redhat.com
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.c=
om>; Kazlauskas, Nicholas
> <Nicholas.Kazlauskas@amd.com>; Lipski, Mikita <Mikita.Lipski@amd.com>; in=
tel-gfx@lists.freedesktop.org
> Subject: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
>
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 280 ++++++++++++++++++  =
.../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
>  5 files changed, 333 insertions(+)
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
> index e5d6cbd7ea78..b23972b6a27c 100644
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
> @@ -3430,6 +3447,20 @@ enum dc_status dc_link_allocate_mst_payload(struct=
 pipe_ctx *pipe_ctx)
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
> @@ -3439,14 +3470,30 @@ enum dc_status dc_link_allocate_mst_payload(struc=
t pipe_ctx *pipe_ctx)
>               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
>               i,
>               link->mst_stream_alloc_table.stream_allocations[i].slot_cou=
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

Hi Bhawan,
dp_get_link_encoding_format() could also return DP_UNKNOWN_ENCODING case. P=
robably should also catch that case.
Thanks!

> +     }
> +#else
>       link_encoder->funcs->update_mst_stream_allocation_table(
>               link_encoder,
>               &link->mst_stream_alloc_table);
> +#endif
>
>       /* send down message */
>       ret =3D dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> @@ -3469,13 +3516,188 @@ enum dc_status dc_link_allocate_mst_payload(stru=
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
> +
> +     /* increase throttled vcp size */
> +     pbn =3D get_pbn_from_bw_in_kbps(bw_in_kbps);
> +     pbn_per_slot =3D get_pbn_per_slot(stream);
> +     avg_time_slots_per_mtp =3D dc_fixpt_div(pbn, pbn_per_slot);
> +
> +     stream_encoder->funcs->set_throttled_vcp_size(
> +                             stream_encoder,
> +                             avg_time_slots_per_mtp);
>
> +     return DC_OK;
>  }
> +#endif
>
>  static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx) =
 { @@ -3483,6 +3705,10 @@ static enum dc_status
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
> @@ -3504,9 +3730,25 @@ static enum dc_status deallocate_mst_payload(struc=
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
> @@ -3516,8 +3758,16 @@ static enum dc_status deallocate_mst_payload(struc=
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
> @@ -3533,6 +3783,20 @@ static enum dc_status deallocate_mst_payload(struc=
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
> @@ -3542,11 +3806,27 @@ static enum dc_status deallocate_mst_payload(stru=
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
--
Regards,
Wayne Lin
