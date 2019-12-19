Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1F126469
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 15:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542BB6EB82;
	Thu, 19 Dec 2019 14:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4D76EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 14:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqUIc7u/9vYarhKOjbAQISmMFQGtX9pGQUKq/YHyk+FK2sBg+25jiL4+PNFBzm9O7clNKBsyt3S9H4+2YYxynYqZu23LjJdQADL6vP39Q7SNmGw+2i8a5fm0fzvfUqonI+7LPFe/cowlEiIgzCByjFWlQa3c3HstZR4qrBvrwBB+GO/6YUxdptY67OL1ky2aufdSdblQ87duD7HTFiyp5+eDRlRr4OqjkmU2rehdLRslVdWj8EuDasvJSOFS7w/eNw8tKoqm+fxyZ2u6YhAtIBN8Y3a4Hg0XRcJRxvUxvtU9j4cei0XvjhoYrzGD567rfFtjdU3MqprJueWC7HM29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVd928QsRRQHp9MK/TD1iyFvIEsIK5ye0fOfeMcAgSA=;
 b=dsxnAQVcPZch9GfCMN9gtIGu8ahZ/Uv5qpHL1EkhjTh4HOeQOp9SgjT5aIf3R/qnDXY2yobWFr2IvafUKa3sdewq/LQp7vIFJO7VfpzyyBMPERAd5ZmrphT8xheD+NcMRtjeYaKKYVVGigxYcRHfzNTgNALG9xrQGrQRLSQ3iyXdg8XVhQzJoPeJhGf10qUS+NEwQ7tMgAschLtVxSzd/WoyzzEwLMdm4+DPJcJDHCnahRKBE9pjFoMhCyl28Iyx9NITEZCXNsLxRORonDoD9zC+SS5wKrvvtPm+16u0VmVzdAUfm1g5Rq1FgRBQgo4w+K4UV7VuphcsstPQO9bPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVd928QsRRQHp9MK/TD1iyFvIEsIK5ye0fOfeMcAgSA=;
 b=FwveSpNnV0BvdCSBlETztV+D1ZWHMvOSzVWrtBZdI9ouObImtCN3ulR6DEG7ja7hlOg7MgLshZWj3Gq4L4AZMLbb1O22rx6tCOxAm1nKRjVjbxo5wMBV+6J6iToYaYJ0I9gZ/hStS7jLEq13SjQCkbQv/k4DA+hY36FEw8SURLY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0024.namprd12.prod.outlook.com (10.172.77.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Thu, 19 Dec 2019 14:17:21 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.012; Thu, 19 Dec 2019
 14:17:20 +0000
Subject: Re: [PATCH next] drm/amd/display: make non-global functions static
To: Chen Zhou <chenzhou10@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com
References: <20191219115500.2047-1-chenzhou10@huawei.com>
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
Message-ID: <2535f4bd-298f-60aa-728b-facfb2baef07@amd.com>
Date: Thu, 19 Dec 2019 09:17:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <20191219115500.2047-1-chenzhou10@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 19 Dec 2019 14:17:19 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d3d8aca-84d3-416f-b373-08d7848e28d8
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0024:|CY4PR1201MB0024:|CY4PR1201MB0024:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0024E6DB6CF0B48FCBEAF8FF8C520@CY4PR1201MB0024.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-Forefront-PRVS: 0256C18696
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(199004)(189003)(478600001)(66556008)(31686004)(66476007)(16526019)(52116002)(66946007)(186003)(4326008)(26005)(2906002)(6486002)(53546011)(8936002)(316002)(36756003)(5660300002)(8676002)(31696002)(2616005)(81156014)(6636002)(956004)(4001150100001)(16576012)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0024;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBPWbD36QUjqkc056sdKCsRCouKe+TEAkz3I1ui8Gh4UDpBavf0OGcbxYZPpdGee8fG2Jy0up2kBKWIJS1dwtJexWeGjou06y8RK9qNGK1wh+D/00OJ777wZhrxPKBho0eUaEEiL+NaPU43JwqQXWbHR6hTj1VrFiIBOadNrO+fii4U5Lo+dSg+kX+rK9vLPRiBzv9O9+4ZQhdmmcBDPxtqtsU/tS9TpVrbCble0N5Yq5d59hsrqlm2TRDeMGb30/lorMlee889Q74BvAIrZDEvcmkJAOr0wQyH2eBgWDiWyW6hhDit13xGEn4OvcvCPnKpA8XC1GJ2PV3RkbQuyFG8y+e8GbAnEto87WhpvvAo/DIC6pTh5eFracE5RT98geRTXMa3HW4qVJxD/Z2cuK6KdfZDjkMA6bqyaVR+AYH/vBmDhEVi0eDIv0OWnMbXO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3d8aca-84d3-416f-b373-08d7848e28d8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2019 14:17:20.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMnQSllyPp1rCgVEDqpaaL2R7ozYrq8F0HGOyn95N8pgDVeK8mtGQrOAVSM+LmA1hW+tN7FtrPYydtAnGrc2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0024
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

On 2019-12-19 6:55 a.m., Chen Zhou wrote:
> Fix sparse warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:964:5:
> 	warning: symbol 'shift_border_left_to_dst' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:975:6:
> 	warning: symbol 'restore_border_left_from_dst' was not declared. Should it be static?
> 
> Fixes: 89d07b662f5e (drm/amd/display: fix 270 degree rotation for mixed-SLS mode)
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 64a0e08f..5843c16 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -961,7 +961,7 @@ static void calculate_inits_and_adj_vp(struct pipe_ctx *pipe_ctx)
>   * We also need to make sure pipe_ctx->plane_res.scl_data.h_active uses the
>   * original h_border_left value in its calculation.
>   */
> -int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
> +static int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
>  {
>  	int store_h_border_left = pipe_ctx->stream->timing.h_border_left;
>  
> @@ -972,7 +972,7 @@ int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
>  	return store_h_border_left;
>  }
>  
> -void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
> +static void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
>                                    int store_h_border_left)
>  {
>  	pipe_ctx->stream->dst.x -= store_h_border_left;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
