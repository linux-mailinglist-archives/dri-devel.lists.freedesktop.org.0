Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DFE4C4532
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065D610E18D;
	Fri, 25 Feb 2022 13:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2910E18D;
 Fri, 25 Feb 2022 13:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIhO9QvlgOkaaxj5yu9pNej/CX7EuvKtCObjlWmTuRiqbrPJNAK2RGV6jGszQRKvGvIlMwcD6Cfqh1fKaUpQts/XAJR1Fkv0cdhhigY6Ng0A5F1kctDhEXQivv1OTsouS93zI7TSYGnWjMA/LdqibH/D7UH9CVAjlpttazKkNUaORV7lAwc+oSQCkQXQfT7yhI61MQv/ewXk3UGicK6luQXi215DEXcDK1DUSl6kYpsxR/UagwGdQmAOabRqHbgauNM5jxmtQdOHRQrGXs9cMoFoNjc+neZwEv4DWY1JynvoMkkZ3sEwI+TvmD1d2+tB4z/zvK1VAvSiabzDejKfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypAVuSHNjxx7igM/SeVwIAfWU+LBv2dcL8SGfSHuxKo=;
 b=Y7YsxeUWGY5t5GlYMZ81dqGG5kqgBG36RbB3hIh5eDNssGeASnhcLOsFu0LFkiFgHe4Lj2HwqCfK58azCAJmaw7HmnZ8b0LH4MEW/SdmGDMhUq0kAVHrznZs8C9Tqb3N9AQm3b4RhB15lR5GCfp9GFu6DWGYCIHIx+MfjOsF1Xw+zmmFo2J6bb8teWxxeIHg6nPNvNUn2BYPf9ZeueT+7AiG7R73ur7WhwMCch3suZT2cz4xQJpfq6mn4HK72GIeb0QKAAwaBZbQBXC3Dpdsb4VGSUd/adqSwUlD7wvMKwYCBt594MUOp2PuuF0UaLmZEHLnXncP1P6mz4y/MX4izw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypAVuSHNjxx7igM/SeVwIAfWU+LBv2dcL8SGfSHuxKo=;
 b=rbpd9D4ZM+KSALKWOwK1ELhMvceCT4URhSDAOzWcAWWw/jAt3adMrKIPSoyAiP49Z0Qvy4TG2aaC7ywpc3BANDqpjUr6Nk2XHunLeqzQm1w/mkREmw+w0ftZ0epkSovuBcqTBuRZ6VebfSRhPQznDznW8zCaEDt+39Rp/krL6Vg=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Fri, 25 Feb 2022 13:03:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::7d61:f517:f3f8:9ea]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::7d61:f517:f3f8:9ea%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:03:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Meng Tang <tangmeng@uniontech.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] gpu/amd: vega10_hwmgr: fix inappropriate private variable
 name
Thread-Topic: [PATCH] gpu/amd: vega10_hwmgr: fix inappropriate private
 variable name
Thread-Index: AQHYKiy7+jRaPGoPcku+5M9g0K/kXaykO7Vg
Date: Fri, 25 Feb 2022 13:03:54 +0000
Message-ID: <DM6PR12MB2619714B0189A1A9A70F50F2E43E9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220225094722.4734-1-tangmeng@uniontech.com>
In-Reply-To: <20220225094722.4734-1-tangmeng@uniontech.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-25T13:03:52Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=5895e3a7-516d-4965-8176-4699645bd2b2;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-25T13:03:52Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: f5db1b40-c924-486c-b760-2a4d349e5ff2
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1f6031e-7c47-48a6-025d-08d9f85f470f
x-ms-traffictypediagnostic: CH2PR12MB4312:EE_
x-microsoft-antispam-prvs: <CH2PR12MB43125C693A5DDA295DE234C2E43E9@CH2PR12MB4312.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YWb0UAZVXEyRpCOfPPn0TqCHepBeNneHyJfznhnLgYAw+lulvAi1gRtgTNn+Im850snF0LieU01r4ol22ZNNz9GKrd9LbYpp1FGAZ9pXjzT5f0w/MWJZB85QKTKyXTp/Oe+sEwfXQRcSeEtSj/1CrfhG6MH1e4bkdKSDDzTKg7nybDn/DvNShLar9fgvFIv/laXGZft732RSdchaBKO/Hb3kC45j1lCkabZC/J2ejGl3dVoGqXE6mCvZu+IF+SyTvsjFUneFZJ1gMwJ5+5pib7htPkkkWVShUvcG2hrNapKznz5Qtzwd0TRPSwaNQr30EJRH9Qyy/ZPEczNI/XK7rXo3NTbzpGuTQrGX6LVb5QMCnp8lwwEGUD7T+1a8Rk9FRg8LP4/smZkiLiQPIi1QsNdaP3zBPLv+d1OlCpXuz8N50vLmUzhK1QlM28YQOlzYQsDePvYuwWKty/DxR4d2oIby2CKrM3mDYB2m7X9RFTZHgLHbHozjyjWptqGTrAzB9k2Lif2u1uDQQKYJDBTdscn6SjSwnB7O51qVz0/zL7qtnFy0mnk1wqUBqRfVJLLoI87WL2pf3xlKcfuhYiz/SzfGV4AW+2nzrLy5DlExNceMjyYL3KZJ92uTsMUDgLZNVBwZ5fQUNNB/8ch92XQ/aQy4B1BglGtv54DLYLJG5o2SFZAIgT7Mc3PDRWdAMUnZgnQhD3Fi8ldY/CXPwS2Yyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(316002)(83380400001)(66946007)(55016003)(71200400001)(8676002)(19627235002)(38100700002)(66476007)(66556008)(110136005)(66446008)(8936002)(86362001)(64756008)(54906003)(4326008)(52536014)(5660300002)(76116006)(26005)(186003)(38070700005)(6506007)(2906002)(122000001)(53546011)(9686003)(7696005)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lp6jXv30/jRXMNaoPKW59knE/cplRvsy/UE4J+0/CY7/MHdpYUaDHZZv19Tv?=
 =?us-ascii?Q?otyvDgufVlySbLOuUKBs/ItsWkwQZRPKQk5W7Ev8loihs7rSYWBHg3o5ba4R?=
 =?us-ascii?Q?xIPsrpRalJz4QG2yXKoNlPAnOzKlO+AmJR+Z7OQgymtCED6Y7WwlAXLR7FqN?=
 =?us-ascii?Q?f2iXDPeQ5Kc7yXLkaT8/2R4oLZt7ii+XotUJzg9l/2rzx6dxOdZ9Hegycyg6?=
 =?us-ascii?Q?LMIKhCH/XAciMRkI6hRmj+jkNZDkD1KLakkHgeqriWYVRjdcxZv/X3ojC288?=
 =?us-ascii?Q?s86cC/AIDb/DTtTbpbCB0MY3QXPofPrkkdlkRYCN9PjmnR07ZTRHdG0lrfyg?=
 =?us-ascii?Q?EkOrQ7yuB92IqwNabdHO/2rmbYl5RDljp+/+v4viSdgv+e6eIwSE2S9RkSkS?=
 =?us-ascii?Q?t/2JKwu+l+vavOCaDZ9MoEGRCHlBZemv8Zul+zYZ4uwXxA/eEcTj2ZR6v+f/?=
 =?us-ascii?Q?I3gerDAwx2jrcUpC++UaQG7zvXapgOtzl/8wJZJXXaJRrAAfWDBjP8DJ2+Wv?=
 =?us-ascii?Q?lwfrwpKz1EU88pIjnFJyqjdSRYyot/WEf27cHjJwiy0wo9I8hUv6iY38vokX?=
 =?us-ascii?Q?2g25s0/KKf7YE8S9dvqYha75joIMe9ZzxgkfnRi8GbrBohneGiH+eUU65cNv?=
 =?us-ascii?Q?zH5XAir1qX0vxYEgbUqpcD6F8/I/6t1XXFT5N0iupx8Etlg+zkZINTDRkfRk?=
 =?us-ascii?Q?YKh2F02tU9S6myhog9xchC2uDTk5kJaXJbsgjVPANyG40yjZzsm7Fkf1qmBz?=
 =?us-ascii?Q?E3ATGz41umjUjo+ldU0ghUfzYLim6TDK1aFNDbLYHnjqLLE9PeVvjV6q2MiT?=
 =?us-ascii?Q?SXHUNJPQ5UhhfaHfNXuGdDqlsGp5F1EVmFwQo0LK+qSqc6sXpiaYoRT3fnw+?=
 =?us-ascii?Q?Npaq3DU7ZCBpeg0vR6DJ/oaGzwFOw0pGlZbHIorDAcLB6p0c77xXLD6sPg5k?=
 =?us-ascii?Q?kc2fkd9rIYDVMkls2Wj0ao2w+hE4+zEoW70+Zm/yXD8SOX3zyzq0pBr+D/1k?=
 =?us-ascii?Q?bO9PLdxYBwPr4LWjl3TKSBbQzjNy7g19RUnvHWeDaCC0ruM5HkHyBvh0Q1eQ?=
 =?us-ascii?Q?OroIxZHxXAC1SxRRJt8ueHfpaKtw3EZtDlhXspavtkTsAta5bJvyRU784MK4?=
 =?us-ascii?Q?LZpy7IpDcx8SfoJUdi498a3ORPQzWAwOTd4/lMW8OW/42U7kpNw0yNrBMl2H?=
 =?us-ascii?Q?gttPdnuqZ+5nB3j5Q8Q2UbHb1aws5e6GTkJRssn0AG6p6mf4wfO8wnvX1+TN?=
 =?us-ascii?Q?Ow4p3AEZTT3QYeON01ZuH7PW3FYT+ghctEbmRPjHIIyCWI5N/ez6kcSb4KUB?=
 =?us-ascii?Q?wWK6eTnxzzzAalPkoaDBqIZpfdZflQhpEkyirx3msqY/Xq18350K51cs/B5n?=
 =?us-ascii?Q?NkTl/I7Z8LhiR6QeCW0br9HGwHavc89qgsHOke+JZSbold0m5RdYA04B6cJf?=
 =?us-ascii?Q?mz1zktnNYh+NVMtC+fzoCBUcm9wgiMeZ+JjO1vakozLIn7Wi7eeI8rl6aDUI?=
 =?us-ascii?Q?mijUlxzI3GNhZBnnYnlRy5G0K2OK4aZXGtWqpQrpK4+wKDTO3qEprLxXvnfO?=
 =?us-ascii?Q?y3sh1ReE3LzcbRRTK4g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f6031e-7c47-48a6-025d-08d9f85f470f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 13:03:54.6914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kA+GcFNymu4OeHhUXe42oNeSTyn5c59fxmZPaZr6geRyRZhkSjXauxqZfG23lxQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Thanks!
The patch is reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Meng Tang <tangmeng@uniontech.com>
> Sent: Friday, February 25, 2022 5:47 PM
> To: airlied@linux.ie; daniel@ffwll.ch
> Cc: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; Meng Tang <tangmeng@uniontech.com>
> Subject: [PATCH] gpu/amd: vega10_hwmgr: fix inappropriate private variabl=
e
> name
>=20
> In file vega10_hwmgr.c, the names of struct vega10_power_state *
> and struct pp_power_state * are confusingly used, which may lead
> to some confusion.
>=20
> Status quo is that variables of type struct vega10_power_state *
> are named "vega10_ps", "ps", "vega10_power_state". A more
> appropriate usage is that struct are named "ps" is used for
> variabled of type struct pp_power_state *.
>=20
> So rename struct vega10_power_state * which are named "ps" and
> "vega10_power_state" to "vega10_ps", I also renamed "psa" to
> "vega10_psa" and "psb" to "vega10_psb" to make it more clearly.
>=20
> The rows longer than 100 columns are involved.
>=20
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 68 +++++++++++---
> -----
>  1 file changed, 38 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index 3f040be0d158..37324f2009ca 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -3095,7 +3095,7 @@ static int
> vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
>  		void *pp_table, uint32_t classification_flag)
>  {
>  	ATOM_Vega10_GFXCLK_Dependency_Record_V2
> *patom_record_V2;
> -	struct vega10_power_state *vega10_power_state =3D
> +	struct vega10_power_state *vega10_ps =3D
>  			cast_phw_vega10_power_state(&(power_state-
> >hardware));
>  	struct vega10_performance_level *performance_level;
>  	ATOM_Vega10_State *state_entry =3D (ATOM_Vega10_State *)state;
> @@ -3145,17 +3145,17 @@ static int
> vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
>  	power_state->temperatures.min =3D 0;
>  	power_state->temperatures.max =3D 0;
>=20
> -	performance_level =3D &(vega10_power_state->performance_levels
> -			[vega10_power_state-
> >performance_level_count++]);
> +	performance_level =3D &(vega10_ps->performance_levels
> +			[vega10_ps->performance_level_count++]);
>=20
>  	PP_ASSERT_WITH_CODE(
> -			(vega10_power_state->performance_level_count <
> +			(vega10_ps->performance_level_count <
>  					NUM_GFXCLK_DPM_LEVELS),
>  			"Performance levels exceeds SMC limit!",
>  			return -1);
>=20
>  	PP_ASSERT_WITH_CODE(
> -			(vega10_power_state->performance_level_count
> <=3D
> +			(vega10_ps->performance_level_count <=3D
>  					hwmgr->platform_descriptor.
>  					hardwareActivityPerformanceLevels),
>  			"Performance levels exceeds Driver limit!",
> @@ -3169,8 +3169,8 @@ static int
> vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
>  	performance_level->mem_clock =3D mclk_dep_table->entries
>  			[state_entry->ucMemClockIndexLow].ulMemClk;
>=20
> -	performance_level =3D &(vega10_power_state->performance_levels
> -				[vega10_power_state-
> >performance_level_count++]);
> +	performance_level =3D &(vega10_ps->performance_levels
> +				[vega10_ps->performance_level_count++]);
>  	performance_level->soc_clock =3D socclk_dep_table->entries
>  				[state_entry->ucSocClockIndexHigh].ulClk;
>  	if (gfxclk_dep_table->ucRevId =3D=3D 0) {
> @@ -3201,11 +3201,11 @@ static int vega10_get_pp_table_entry(struct
> pp_hwmgr *hwmgr,
>  		unsigned long entry_index, struct pp_power_state *state)
>  {
>  	int result;
> -	struct vega10_power_state *ps;
> +	struct vega10_power_state *vega10_ps;
>=20
>  	state->hardware.magic =3D PhwVega10_Magic;
>=20
> -	ps =3D cast_phw_vega10_power_state(&state->hardware);
> +	vega10_ps =3D cast_phw_vega10_power_state(&state->hardware);
>=20
>  	result =3D vega10_get_powerplay_table_entry(hwmgr, entry_index,
> state,
>  			vega10_get_pp_table_entry_callback_func);
> @@ -3218,10 +3218,10 @@ static int vega10_get_pp_table_entry(struct
> pp_hwmgr *hwmgr,
>  	 */
>  	/* set DC compatible flag if this state supports DC */
>  	if (!state->validation.disallowOnDC)
> -		ps->dc_compatible =3D true;
> +		vega10_ps->dc_compatible =3D true;
>=20
> -	ps->uvd_clks.vclk =3D state->uvd_clocks.VCLK;
> -	ps->uvd_clks.dclk =3D state->uvd_clocks.DCLK;
> +	vega10_ps->uvd_clks.vclk =3D state->uvd_clocks.VCLK;
> +	vega10_ps->uvd_clks.dclk =3D state->uvd_clocks.DCLK;
>=20
>  	return 0;
>  }
> @@ -4823,33 +4823,41 @@ static int vega10_check_states_equal(struct
> pp_hwmgr *hwmgr,
>  				const struct pp_hw_power_state *pstate1,
>  			const struct pp_hw_power_state *pstate2, bool
> *equal)
>  {
> -	const struct vega10_power_state *psa;
> -	const struct vega10_power_state *psb;
> +	const struct vega10_power_state *vega10_psa;
> +	const struct vega10_power_state *vega10_psb;
>  	int i;
>=20
>  	if (pstate1 =3D=3D NULL || pstate2 =3D=3D NULL || equal =3D=3D NULL)
>  		return -EINVAL;
>=20
> -	psa =3D cast_const_phw_vega10_power_state(pstate1);
> -	psb =3D cast_const_phw_vega10_power_state(pstate2);
> -	/* If the two states don't even have the same number of
> performance levels they cannot be the same state. */
> -	if (psa->performance_level_count !=3D psb-
> >performance_level_count) {
> +	vega10_psa =3D cast_const_phw_vega10_power_state(pstate1);
> +	vega10_psb =3D cast_const_phw_vega10_power_state(pstate2);
> +
> +	/* If the two states don't even have the same number of
> performance levels
> +	 * they cannot be the same state.
> +	 */
> +	if (vega10_psa->performance_level_count !=3D vega10_psb-
> >performance_level_count) {
>  		*equal =3D false;
>  		return 0;
>  	}
>=20
> -	for (i =3D 0; i < psa->performance_level_count; i++) {
> -		if (!vega10_are_power_levels_equal(&(psa-
> >performance_levels[i]), &(psb->performance_levels[i]))) {
> -			/* If we have found even one performance level pair
> that is different the states are different. */
> +	for (i =3D 0; i < vega10_psa->performance_level_count; i++) {
> +		if (!vega10_are_power_levels_equal(&(vega10_psa-
> >performance_levels[i]),
> +						   &(vega10_psb-
> >performance_levels[i]))) {
> +			/* If we have found even one performance level pair
> +			 * that is different the states are different.
> +			 */
>  			*equal =3D false;
>  			return 0;
>  		}
>  	}
>=20
>  	/* If all performance levels are the same try to use the UVD clocks to
> break the tie.*/
> -	*equal =3D ((psa->uvd_clks.vclk =3D=3D psb->uvd_clks.vclk) && (psa-
> >uvd_clks.dclk =3D=3D psb->uvd_clks.dclk));
> -	*equal &=3D ((psa->vce_clks.evclk =3D=3D psb->vce_clks.evclk) && (psa-
> >vce_clks.ecclk =3D=3D psb->vce_clks.ecclk));
> -	*equal &=3D (psa->sclk_threshold =3D=3D psb->sclk_threshold);
> +	*equal =3D ((vega10_psa->uvd_clks.vclk =3D=3D vega10_psb->uvd_clks.vclk=
)
> &&
> +		  (vega10_psa->uvd_clks.dclk =3D=3D vega10_psb-
> >uvd_clks.dclk));
> +	*equal &=3D ((vega10_psa->vce_clks.evclk =3D=3D vega10_psb-
> >vce_clks.evclk) &&
> +		   (vega10_psa->vce_clks.ecclk =3D=3D vega10_psb-
> >vce_clks.ecclk));
> +	*equal &=3D (vega10_psa->sclk_threshold =3D=3D vega10_psb-
> >sclk_threshold);
>=20
>  	return 0;
>  }
> @@ -5444,19 +5452,19 @@ static int vega10_get_performance_level(struct
> pp_hwmgr *hwmgr, const struct pp_
>  				PHM_PerformanceLevelDesignation
> designation, uint32_t index,
>  				PHM_PerformanceLevel *level)
>  {
> -	const struct vega10_power_state *ps;
> +	const struct vega10_power_state *vega10_ps;
>  	uint32_t i;
>=20
>  	if (level =3D=3D NULL || hwmgr =3D=3D NULL || state =3D=3D NULL)
>  		return -EINVAL;
>=20
> -	ps =3D cast_const_phw_vega10_power_state(state);
> +	vega10_ps =3D cast_const_phw_vega10_power_state(state);
>=20
> -	i =3D index > ps->performance_level_count - 1 ?
> -			ps->performance_level_count - 1 : index;
> +	i =3D index > vega10_ps->performance_level_count - 1 ?
> +			vega10_ps->performance_level_count - 1 : index;
>=20
> -	level->coreClock =3D ps->performance_levels[i].gfx_clock;
> -	level->memory_clock =3D ps->performance_levels[i].mem_clock;
> +	level->coreClock =3D vega10_ps->performance_levels[i].gfx_clock;
> +	level->memory_clock =3D vega10_ps-
> >performance_levels[i].mem_clock;
>=20
>  	return 0;
>  }
> --
> 2.20.1
>=20
>=20
