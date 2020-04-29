Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8261BD11A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 02:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24E6E85E;
	Wed, 29 Apr 2020 00:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739376E85E;
 Wed, 29 Apr 2020 00:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEaBeMTM8CliR9nvC1iGHJC4BUWBTbPYstNKGybmBmpSOu/uRrOE1WKXUdqh7ND4hgFfXJbWGWyTn+o7WcNxIfIl/g76AQsTx2/v88ygrXNcm65bJpfMzvmSZBKI/flKFigP56ZyPZfd4Vw8Co3c/YlQi7acmT+qZNUbHh9h8Aeu1d5NZyIOe4mxzZ81F28hD6XMOh49XAoVVA97NZcSXhxmRbFr2Prnr4xbFG9Jxd9vxHylYw8zyrl5tuOPRKGycZxPYszgjEddh9HWxqtvfjReSEp5kMKtESJYJ4FzQEY49pB8ZGSLouBEUcO7j9rUySPdwxf2YyMJ7J2vNVh4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDBsCQTcg8MEt9vs8Qasl3JQC0NvXxR/JOnmm9OprMw=;
 b=LyGD+fe4uUj/djR99qDgl6VdZ0YSc8kLdFMU9zcR9M7BLGTvvJsAiMTIiQsvfu6+Kj8jbfH0w+0CBTgSG5O3xEEG3rjnjAKwUcp8qB7TXOqaQEivBHKMc7rHSNGgewIBpJ0qk7ZY+9q8pHTGPK6ZKSsV5d0ojVU1ymOHEDv/9Ffxvq7TQ70DI5U2jiBq/blYnMfHoAviaacPHrLtLnqgULVMVIIkCm+c91ya+IyeahqPTXgkr+hwPJmeDU2AEsxIDKw1UrWlM0Bunrd2yfSIcZYTI8WnjGXYlQHR7zIYPNI1hpURw3kpl4LieitBkVXArcVDAR1zbvORvxdRg8EsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDBsCQTcg8MEt9vs8Qasl3JQC0NvXxR/JOnmm9OprMw=;
 b=ekzX/jrCleo1eN9t5zhnCa6sagYpj2XWk7qxDQnzPmLvT0lrsAqP7rbt3PERu4HPEhh62m/DjFlGQe1c98ue8Ovp2DNT7gyvgsg9OjKtVNuf9W2+5fM5Vp9hGKDg6opCbk0uMDoc7A6ATxVagOJRYiyTnLHV7lk/jpjN36GLKa8=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2458.namprd12.prod.outlook.com (2603:10b6:907:8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 29 Apr
 2020 00:29:11 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::21c8:9f4e:c412:dfbe]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::21c8:9f4e:c412:dfbe%3]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 00:29:11 +0000
Date: Tue, 28 Apr 2020 20:29:06 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] amdgpu: fix gcc-4.8 build warnings
Message-ID: <20200429002906.3bor7udoifo7q56h@outlook.office365.com>
References: <20200428215541.4144749-1-arnd@arndb.de>
In-Reply-To: <20200428215541.4144749-1-arnd@arndb.de>
X-ClientProxiedBy: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 29 Apr 2020 00:29:10 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fd3c673-1226-4a2a-1a14-08d7ebd45659
X-MS-TrafficTypeDiagnostic: MW2PR12MB2458:|MW2PR12MB2458:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB245880E9F5B0602512530D9498AD0@MW2PR12MB2458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2524.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(2906002)(66556008)(6666004)(5660300002)(66946007)(66476007)(86362001)(55016002)(966005)(8936002)(7696005)(316002)(54906003)(44144004)(52116002)(6506007)(4326008)(1076003)(16526019)(21480400003)(6916009)(8676002)(9686003)(478600001)(186003)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVxIR1TiVO5i5gJY7fWsoF3lXzc+NBHajm8JzhiV6xOZ0dzYzbBY7h/JDcDBcTcJNYAhA6IfDMLmVLFU+RLaSzs0ZG5zYXSE7xPSMB8AaxzLUIwbHTxBACYa9n3K0a7lCBNBNnZbIiE4reNyQT1fKLEFVX2Vq73L1BalKi8x4eBsEVvl+AbqNPP3Psq0UTlhcH/HSrWVXouLsOQ3tvYS4NYcF8WPcKHwI3wUhXEwVCzbooUpsEBBAUl7s8fFgItudK7O5lOqikq1Qnr9YQgwc8zMK8HbRdHaEjMo26CZiV6UWFBeoLJl99BVzjNUIeVkLlRsGInO0IoykYDvqerJwtieUklMRk3rqNSrmCeJUCHYK0UOdZF6jHf0olsb8zDXuYZkjYQafzvixfdtaEkyCRxAvi4ahXQfsKTqG54jLACiNeXZ+T+7s9z6n1pQIEDuhp4eu8rVIkRkHj55EuGJJG6POZ10ln1XdCZCJvNvU+FiIHrW31NZFjBBWj1Yj5awfaFTpcuDBxGsDpePDS5NJl4i8u+/Fmmj6CxKGJ9Amgf5Xqsba73jtncC4psQLCY2
X-MS-Exchange-AntiSpam-MessageData: 19Izmasf/wPBPUOI8NE/MP9tZV89dOMNz1qsX+hor4lcnPPwQJ0kiz3mnvRgdFT/Nc17tibYdeEgzrwF8ma8vOZt2iwX2p15+92Bx44VZa96Z/OSjMMf2DqqgEArgFUMBT/O7R2vZ8FAtTM2WGQK5i1SfGgv33vcQkFL/sf2lCskHUa9hgVipEPnxcwSkfVs0xSUsXmSDdtfghYZvv9qduBNzEJ7hU6oI0QT9ASYhzzb+B9l50q2nJkiRjOgPrMjMEVbg+RHHVyjHqHBWrmPokMQ44JenGrdYyOE8dAvGRndzhNolycA49c9JLnLIQ8/pN0m5FckCuUz3gK/2IoMcJJofBpHAjE6r2ptgFZqn8HkjMpCspcEA/lCmj9eUgD7/HvRw50yQ+5YHfK7jYZMtEsxbqTJuIMZbtiR7LRH+5sdXfBMb7payLPhr+QocIJNTf4MFA+mvkSgHbyYFJXDQD/OfGPm8FIuHYYm3dCXIyX7/U6ahpgu1GhUf2U/9N+oCkVXY2dK1s7AKxfkcXjYHsjml0SB2Vys+7a84YW3zSCxitxENB7cGPrEKr9F9hELyU/QeAb34UWHAZ7fBSuHmIYmhLbOfIFe5Z+l+BYsR7/7e+YyAGWsfs1OwJkqF3f/1vW1K6da6qpWYrtm41Pm3RF7SRBr4QYM7PmcfQkeVdEeQDKa+IeNIP7pKHoFmODMH6m5Lu7NSgkp0cvsbM7GVEOreyOD62IwEd6PKDB9pkdxuRGAsZR1lrm5AdKW/jDlRldeFw7kPGSnoZKVuJq2KHrjSjJs1EpVUS0A9+rpQHYjbWxaZkTL1CAWtFzyo3kb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd3c673-1226-4a2a-1a14-08d7ebd45659
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 00:29:11.3846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uopoA6LB4vXwrwnJ9CITmyTW0cTruR4B9dSo7HoQWA2d9z3EnFu3x+wAGR0Si9+toXvhNOOUPKoWYCIbnpuk3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2458
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0704995590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0704995590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2374edgitgx3mth"
Content-Disposition: inline

--m2374edgitgx3mth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for your patch.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 04/28, Arnd Bergmann wrote:
> Older compilers warn about initializers with incorrect curly
> braces:
>=20
> drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_fo=
r_port':
> drivers/gpu/drm/drm_dp_mst_topology.c:5497:9: error: missing braces aroun=
d initializer [-Werror=3Dmissing-braces]
>   struct drm_dp_desc desc =3D { 0 };
>          ^
>=20
> Change all instances in the amd gpu driver to using the GNU empty
> initializer extension.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c        | 2 +-
>  drivers/gpu/drm/amd/display/dc/bios/command_table2.c      | 4 ++--
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c          | 6 +++---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c         | 6 +++---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c     | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c         | 8 ++++----
>  8 files changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7f4417981bff..81ce3103d751 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8695,7 +8695,7 @@ bool amdgpu_dm_psr_enable(struct dc_stream_state *s=
tream)
>  {
>  	struct dc_link *link =3D stream->link;
>  	unsigned int vsync_rate_hz =3D 0;
> -	struct dc_static_screen_params params =3D {0};
> +	struct dc_static_screen_params params =3D { };
>  	/* Calculate number of static frames before generating interrupt to
>  	 * enter PSR.
>  	 */
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers=
/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 37fa7b48250e..5484a316eaa8 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -294,7 +294,7 @@ static enum bp_result bios_parser_get_i2c_info(struct=
 dc_bios *dcb,
>  	struct atom_display_object_path_v2 *object;
>  	struct atom_common_record_header *header;
>  	struct atom_i2c_record *record;
> -	struct atom_i2c_record dummy_record =3D {0};
> +	struct atom_i2c_record dummy_record =3D { };
>  	struct bios_parser *bp =3D BP_FROM_DCB(dcb);
> =20
>  	if (!info)
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drive=
rs/gpu/drm/amd/display/dc/bios/command_table2.c
> index 8edc2506d49e..5e186c135921 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> @@ -113,7 +113,7 @@ static void encoder_control_dmcub(
>  		struct dc_dmub_srv *dmcub,
>  		struct dig_encoder_stream_setup_parameters_v1_5 *dig)
>  {
> -	struct dmub_rb_cmd_digx_encoder_control encoder_control =3D { 0 };
> +	struct dmub_rb_cmd_digx_encoder_control encoder_control =3D { };
> =20
>  	encoder_control.header.type =3D DMUB_CMD__VBIOS;
>  	encoder_control.header.sub_type =3D DMUB_CMD__VBIOS_DIGX_ENCODER_CONTRO=
L;
> @@ -339,7 +339,7 @@ static void set_pixel_clock_dmcub(
>  		struct dc_dmub_srv *dmcub,
>  		struct set_pixel_clock_parameter_v1_7 *clk)
>  {
> -	struct dmub_rb_cmd_set_pixel_clock pixel_clock =3D { 0 };
> +	struct dmub_rb_cmd_set_pixel_clock pixel_clock =3D { };
> =20
>  	pixel_clock.header.type =3D DMUB_CMD__VBIOS;
>  	pixel_clock.header.sub_type =3D DMUB_CMD__VBIOS_SET_PIXEL_CLOCK;
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/=
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> index 24c5765890fa..ee3ef5094fd1 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> @@ -698,7 +698,7 @@ void rn_clk_mgr_construct(
>  		struct dccg *dccg)
>  {
>  	struct dc_debug_options *debug =3D &ctx->dc->debug;
> -	struct dpm_clocks clock_table =3D { 0 };
> +	struct dpm_clocks clock_table =3D { };
> =20
>  	clk_mgr->base.ctx =3D ctx;
>  	clk_mgr->base.funcs =3D &dcn21_funcs;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_link_dp.c
> index 9ef9e50a34fa..7cbfe740a947 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -2683,9 +2683,9 @@ static void dp_test_send_link_test_pattern(struct d=
c_link *link)
> =20
>  static void dp_test_get_audio_test_data(struct dc_link *link, bool disab=
le_video)
>  {
> -	union audio_test_mode            dpcd_test_mode =3D {0};
> -	struct audio_test_pattern_type   dpcd_pattern_type =3D {0};
> -	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COU=
NT] =3D {0};
> +	union audio_test_mode            dpcd_test_mode =3D { };
> +	struct audio_test_pattern_type   dpcd_pattern_type =3D { };
> +	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COU=
NT] =3D { };
>  	enum dp_test_pattern test_pattern =3D DP_TEST_PATTERN_AUDIO_OPERATOR_DE=
FINED;
> =20
>  	struct pipe_ctx *pipes =3D link->dc->current_state->res_ctx.pipe_ctx;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/=
gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> index 84d7ac5dd206..dfa541f0b0d3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> @@ -1253,9 +1253,9 @@ void hubp2_validate_dml_output(struct hubp *hubp,
>  		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
>  {
>  	struct dcn20_hubp *hubp2 =3D TO_DCN20_HUBP(hubp);
> -	struct _vcs_dpi_display_rq_regs_st rq_regs =3D {0};
> -	struct _vcs_dpi_display_dlg_regs_st dlg_attr =3D {0};
> -	struct _vcs_dpi_display_ttu_regs_st ttu_attr =3D {0};
> +	struct _vcs_dpi_display_rq_regs_st rq_regs =3D { };
> +	struct _vcs_dpi_display_dlg_regs_st dlg_attr =3D { };
> +	struct _vcs_dpi_display_ttu_regs_st ttu_attr =3D { };
>  	DC_LOGGER_INIT(ctx->logger);
>  	DC_LOG_DEBUG("DML Validation | Running Validation");
> =20
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 63044ae06327..509b07c24758 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -449,7 +449,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc =
=3D {
>  	.use_urgent_burst_bw =3D 0
>  };
> =20
> -struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { 0 };
> +struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc =3D { };
> =20
>  #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
>  	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/=
gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> index d285ba622d61..654ea81b8ad6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> @@ -365,9 +365,9 @@ void hubp21_validate_dml_output(struct hubp *hubp,
>  		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
>  {
>  	struct dcn21_hubp *hubp21 =3D TO_DCN21_HUBP(hubp);
> -	struct _vcs_dpi_display_rq_regs_st rq_regs =3D {0};
> -	struct _vcs_dpi_display_dlg_regs_st dlg_attr =3D {0};
> -	struct _vcs_dpi_display_ttu_regs_st ttu_attr =3D {0};
> +	struct _vcs_dpi_display_rq_regs_st rq_regs =3D { };
> +	struct _vcs_dpi_display_dlg_regs_st dlg_attr =3D { };
> +	struct _vcs_dpi_display_ttu_regs_st ttu_attr =3D { };
>  	DC_LOGGER_INIT(ctx->logger);
>  	DC_LOG_DEBUG("DML Validation | Running Validation");
> =20
> @@ -778,7 +778,7 @@ void dmcub_PLAT_54186_wa(struct hubp *hubp, struct su=
rface_flip_registers *flip_
>  {
>  	struct dc_dmub_srv *dmcub =3D hubp->ctx->dmub_srv;
>  	struct dcn21_hubp *hubp21 =3D TO_DCN21_HUBP(hubp);
> -	struct dmub_rb_cmd_PLAT_54186_wa PLAT_54186_wa =3D { 0 };
> +	struct dmub_rb_cmd_PLAT_54186_wa PLAT_54186_wa =3D { };
> =20
>  	PLAT_54186_wa.header.type =3D DMUB_CMD__PLAT_54186_WA;
>  	PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS =3D flip_regs->DCSURF=
_PRIMARY_SURFACE_ADDRESS;
> --=20
> 2.26.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--m2374edgitgx3mth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6oylEACgkQWJzP/com
vP9ZtRAAwhju+gy6lOglOFjgQ84qyJG6fj4Sa0OpNenMPZndvO9+VdNIf5K+QmlQ
lv3ezy1JpkBV0qyM5r1Ixz0ur/U6O2HFwpqn+gP+23X6JEZOB+kzet+BZP88LjDA
Tu7hSE72Ap2X+HRzH+58xOb6HPt6QmcwIrBMk6pki/nZLIjecO2idux0laj6EIt4
NsBu817I1XrZitMhhaVYS93Teaj/Ams/4MXfT5yeZY99tusrX30HwSvg5gwcvp+y
q/u2NPIG9p3Au4BwMbD5ukJTxYEI7VYS4p9gBSrJOP40stj8MNORctW8UZ50dk9e
G0g6usP5t8cEftWhCLfKyMzGYxVIQ+GTqCJFt3sv+bw5rtAdn+4hy4NZWRy8lkXw
kzGH6BFjSXXAqQJL9QC1GWyAg2SKRvXt8ma7DHm1ENg+EAtkg4JDWm0kDWPR0wol
XoLzGkxJ6486JFc8ho+EtIAzAvnFsLRCGVrHunfktAe34YG7L+nTK+I8vptXfxnY
/BcmETbc75ZQrgGWFeYmMtpjmASWG1taeTSsXf5JBv2FKk3dred5pZ6/B0CCZwdI
5mAyfR5SdOXO+Z9nm8HIIv3xXWe0Am612lulaP0UIz1OHOZ21ra/0Q7JN5OmaxES
Qd9rEtaAOR1QrfMbHjLMetLDBcksupNCHK/WwypyxO3zPDq/4YU=
=tdHT
-----END PGP SIGNATURE-----

--m2374edgitgx3mth--

--===============0704995590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0704995590==--
