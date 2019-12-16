Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019431208AD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EE96E5B9;
	Mon, 16 Dec 2019 14:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5A66E5B0;
 Mon, 16 Dec 2019 14:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ4y8Lk3NjM5RfPM7wdpU/qal6cGz+MFQ8jCdmswFke262VMslJo/Bb6won0FyUcW7At/L93m0Rg3il2EtRID8tQkB4r9N2k704hVtfl1fpO6k+uRg2aGtXoWFcOgulQ+LCWa/SFUurj6yPwgLXs6tN683HvBizsgm0bN0nlPaifjzdDQDVxfMo1l+9TBreWQw2p2HgH6+RbFdUd99+5pl/ZGIk1xCpZQCffeT6qm5NKEc4n/fdeFx3kBB9ukTSVE7dMqo6QDNC7XvxneFcvxXdrJNB2k7pRw2RtUwLTHcf8sS8BU/fevHHa3IpseWCp9v4GGXiJg1W4D20yne3UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VCrlrn1P+WeoWTdGSCYh7GTEgLLD4lot1n9MawmBhs=;
 b=M7ZsMstD3i7NyXtG1yqmks82jzkcwrVeKU2en+OC5vZ7/a5lJyr2ItG6XuSZGDB1/A+1zVV4g5od2l4AgoRjeYlmzufWDlRIwZkyp0hBLI5fCRVVfwlBE2dL137KbcyeZcX0KF3ikjxx5dPbPIXAOiM44tzBA+78S4DBBE3oTSH+rU423f+CEiBbZC9yghOra2c1pFgxvd/I0DfquLaE4hNIiDeEOnaouqdP8VQlzj4H4Q7btoCKcNjvMZvLNcmRIBwY5tlvGuFs1J/vOeWq3gzEgfTYewY/kkF2DpQlWxmeqcLY8IsEuQCdECFLsSl7ZlX65l8sp8yJ6b3fyTv8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VCrlrn1P+WeoWTdGSCYh7GTEgLLD4lot1n9MawmBhs=;
 b=ouwNNF9WxMNLLgTEE5jaPvmmMFll1b/cmv5jQcu+K3qKxeYNLvJY4NS35eaCEo87XE5z3h18wP4Bdc8cHhRe7g0PUKZQbv5ege4cR7w+MvVGWO38a/wvpsWP/7ttWcbe4DoTuCcmh5vQ5cSLkLUTKr9VfrOS5mpJlbdVnKq6whs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0072.namprd12.prod.outlook.com (10.172.77.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.17; Mon, 16 Dec 2019 14:32:15 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 14:32:15 +0000
Subject: Re: [PATCH] drm/amd/display: Remove unneeded semicolon
To: zhengbin <zhengbin13@huawei.com>, harry.wentland@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1576314753-65777-1-git-send-email-zhengbin13@huawei.com>
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
Message-ID: <ab4d3c43-a954-88b6-6c58-de836e03c4b7@amd.com>
Date: Mon, 16 Dec 2019 09:32:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <1576314753-65777-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b0e08ce-a9e4-4849-46b0-08d78234bec1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:|CY4PR1201MB0072:|CY4PR1201MB0072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00721FCF799C1B5A828ADD648C510@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-Forefront-PRVS: 02530BD3AA
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(26005)(81166006)(8676002)(81156014)(31696002)(186003)(6666004)(66946007)(66476007)(66556008)(2616005)(2906002)(36756003)(31686004)(6506007)(53546011)(478600001)(52116002)(8936002)(6512007)(6486002)(5660300002)(316002)(4001150100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0072;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqqbwkpCbKwzNbUeot1iQbLaW6xedZITz3dK6G2ICdq9T+aQZ/XPXSquuuf/MwCkXjgJNl0ECD9tnwFkt149A0YrFFGnPlt4NNAYqtME3ZtUc5jiG+5bj0MdkQt5reSSTXe+0F6gDijGYbrOJ3O8JCg9vmNmRMHGdUt60k3Oc6lLpsFeCky405tYwu8O/TFqEzo9f13KzZVZh47QEThc4GonXGfSciqBlWd0AV30aBRfKgIb+S+cUNe3WV7RmUKJxqjS4ZB06urkDyrLzg70vndBCVTy+qV7JQF6k8+O++XcpOyY2Vf4Y83Pg//8si1Cbxv18NJ71cEc3+FlXZQUTMANlN+afTAcxJO8rVAc1a0zuGKzbNZpM5N6eGbU6eaJtiOHlkxfOiS4YYFT72qfXlpWSU5JMfcCPuCPUu/Rgso9UBKdxIstYgZ7q61+mOYk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0e08ce-a9e4-4849-46b0-08d78234bec1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2019 14:32:14.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qW3nbTWy5zY8Uy5erJh07t7x8BHttXnW9PRm7e2YKAT7TpayVe9vfbxevowAOFO/+4CNLutWus0nWmzhB4fs5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-14 4:12 a.m., zhengbin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c:412:90-91: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> index de51ef1..a1b7e76 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> @@ -409,7 +409,7 @@ void build_watermark_ranges(struct clk_bw_params *bw_params, struct pp_smu_wm_ra
>  			continue;
> 
>  		ranges->reader_wm_sets[num_valid_sets].wm_inst = bw_params->wm_table.entries[i].wm_inst;
> -		ranges->reader_wm_sets[num_valid_sets].wm_type = bw_params->wm_table.entries[i].wm_type;;
> +		ranges->reader_wm_sets[num_valid_sets].wm_type = bw_params->wm_table.entries[i].wm_type;
>  		/* We will not select WM based on dcfclk, so leave it as unconstrained */
>  		ranges->reader_wm_sets[num_valid_sets].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
>  		ranges->reader_wm_sets[num_valid_sets].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
> --
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
