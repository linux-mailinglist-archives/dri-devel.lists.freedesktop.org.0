Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4F127F0E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 16:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC5B6EC4D;
	Fri, 20 Dec 2019 15:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B656EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ho4c30wVZUqqkIDKpW3cgYtgkIK8ayQ4cEIYb8lwbcW/qky/WxxgDTfrm5+RVnr2pEKiDr/Ok5kiP6e+FIbhDq0MAua7DfHavDHFRxWDsDg/AwnHeZrnbwGmaVlbCM539KpotrG1XZghIt3BpLGJA4xQRICe9qcjSnq12M4sM3qN8IfA4A34e2lrzQWfKea0wqn/wJ3x3bXL3H0DlI/DsxW425IDRpuwk5kcI1MF4iWnnxsTcCVMFfCDW/ChwD0ktzSMKAAMG1IcrlT2RNj65VI7Bpwccsp1JnNjYgkkXZWOYXK0UgE3cBiG3fWkdlo76Mr7cyV+r8+c9IQ/FBMVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUhp2dw0RjeLodXBWKgxpQeP9C7TLbC1w81yKwU8E5k=;
 b=Z0qte41vxoGEttzoSpuEYYY3d+XfBP2lBxJeEzxtwUVO3Ho0qhksjTf+S6WMvZXYejwDdM/nuHtkCltpdCUfYjJheVBTB6sdDpHxe58B3+/hiuy7OxtuhW6sQowj07Q3T6CXIX+l5/9E2vRw/LOybWrq7BLoDua023zQ4URaa6EwKzW/fNI9PNpb3gbuobSgT+ZsvyJSCmjBCeXkj3chd2UTDNrKZEJjmqnTmbPQ/38AAymmIUCRpAzi+KEUirRlHMcZ6HI62SMgvnDdh8kdEF7i24o6JtN75WU+TCwZHxKUpKZJqArSaqquPbOwp3vku7iHa2FW/waKoqoa4Pk+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUhp2dw0RjeLodXBWKgxpQeP9C7TLbC1w81yKwU8E5k=;
 b=Fl3FY4I0RyDTQGiyXqb8NICwBRlvZBE5vYeWhGXwSbCXMU8pNW6mCtGAu01A0f0oSyupzDX2GkeTrJVevh8ek6glsR6ByDczv1/m42XNf6YcvNik2Nd9M5+KHBu2mGGvZx6xuC07E1ce6KA48+5CoLDQkzM8BfGJd08PLhumfpY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0135.namprd12.prod.outlook.com (10.172.75.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15; Fri, 20 Dec 2019 15:09:41 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.012; Fri, 20 Dec 2019
 15:09:40 +0000
Subject: Re: [PATCH next] drm/amd/display: make some symbols static
To: Chen Zhou <chenzhou10@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com
References: <20191220065557.151393-1-chenzhou10@huawei.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <3461e773-19db-c7a0-6512-d485da828a1a@amd.com>
Date: Fri, 20 Dec 2019 10:09:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <20191220065557.151393-1-chenzhou10@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::24) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 20 Dec 2019 15:09:39 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67197c2a-11a1-4a3b-3c30-08d7855ea2fd
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0135:|CY4PR1201MB0135:|CY4PR1201MB0135:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB013520B18E35D7BA770396C78C2D0@CY4PR1201MB0135.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-Forefront-PRVS: 025796F161
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(6636002)(478600001)(36756003)(956004)(2906002)(6486002)(4326008)(2616005)(16526019)(31686004)(8676002)(186003)(81166006)(81156014)(31696002)(4001150100001)(66946007)(66476007)(316002)(66556008)(8936002)(16576012)(53546011)(52116002)(26005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0135;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PL1M5BDWg0qxgQgtsfAH1WgsJsW/xacIPi4dJrR8b640tGWsHL8d9ka5nNw8VXo2W1vjsRWBV0530WE18lXtNHknBITolb8gduA9UnXr749PbsLydYmraHcJKdjfyM04yFsB4E6Q4YQdQfng7cM0Q1PY09mOM8vrw02FXjc+yWL83LCZtbS106KfU/mUAypQFIrdMMJIOistbrbTcyZbd+QF+SVDCyUr/oa361dHLzXfiP6Gr0xfLXR+caqtvKzBdwOJU4pkzeCR/RDGENx1Rs4sEtbOjOSpxxoWT0bMoo61hMinTkX9F/0cOU+oIEjGLO+XZiQ1UttAY3Rrb7zdTI4zOtrJ/r7jEVN7dTdlK8NobVpE7EXKXRKBaD2xpSCgrHlyjoAvlRr5aMNEeXQ7ebOH4DvxmSuPsJIC0PRtyU4HL+zI/YYnhGLPJX4pEJb+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67197c2a-11a1-4a3b-3c30-08d7855ea2fd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 15:09:40.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmX/BuC+MWxSkQHrxL4I+rX3V58G8CAjN4jD4EuoULzB5yzgdkKMyenxlpnBthsxLURLq83pjZk8BhdxCN3b7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0135
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-20 1:55 a.m., Chen Zhou wrote:
> Make some structs and functions static to fix build warnings, parts of
> warnings are as follows:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_resource.c:744:21:
> 	warning: symbol 'dce110_clock_source_create' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_resource.c:768:6:
> 	warning: symbol 'dce110_clock_source_destroy' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index bf14e9a..87227db 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -741,7 +741,7 @@ struct dce_i2c_hw *dce110_i2c_hw_create(
>  
>  	return dce_i2c_hw;
>  }
> -struct clock_source *dce110_clock_source_create(
> +static struct clock_source *dce110_clock_source_create(
>  	struct dc_context *ctx,
>  	struct dc_bios *bios,
>  	enum clock_source_id id,
> @@ -765,7 +765,7 @@ struct clock_source *dce110_clock_source_create(
>  	return NULL;
>  }
>  
> -void dce110_clock_source_destroy(struct clock_source **clk_src)
> +static void dce110_clock_source_destroy(struct clock_source **clk_src)
>  {
>  	struct dce110_clk_src *dce110_clk_src;
>  
> @@ -1007,7 +1007,7 @@ static bool dce110_validate_bandwidth(
>  	return result;
>  }
>  
> -enum dc_status dce110_validate_plane(const struct dc_plane_state *plane_state,
> +static enum dc_status dce110_validate_plane(const struct dc_plane_state *plane_state,
>  				     struct dc_caps *caps)
>  {
>  	if (((plane_state->dst_rect.width * 2) < plane_state->src_rect.width) ||
> @@ -1062,7 +1062,7 @@ static bool dce110_validate_surface_sets(
>  	return true;
>  }
>  
> -enum dc_status dce110_validate_global(
> +static enum dc_status dce110_validate_global(
>  		struct dc *dc,
>  		struct dc_state *context)
>  {
> @@ -1305,7 +1305,7 @@ static void bw_calcs_data_update_from_pplib(struct dc *dc)
>  		1000);
>  }
>  
> -const struct resource_caps *dce110_resource_cap(
> +static const struct resource_caps *dce110_resource_cap(
>  	struct hw_asic_id *asic_id)
>  {
>  	if (ASIC_REV_IS_STONEY(asic_id->hw_internal_rev))
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
