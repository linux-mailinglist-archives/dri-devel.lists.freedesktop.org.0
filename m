Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8D124BEC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A7F6E58E;
	Wed, 18 Dec 2019 15:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933966E58E;
 Wed, 18 Dec 2019 15:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4NgmniDLCPpcvGcTIzVThLd7wgWnQLTlNO1E7qnyXg5N+TRIWA+HVvIpcITAjEYSo8cJapvXzqGHUKqCyZGI9GAyd3EH0cFA7eWgeLPpVKWb/Hw/y0LWOjWrx/Jrli45Z4Ke3MHAVUGpXXDZg/IJVoxSbgai5Dp3vYybd/9BB9abHEzvQc9+gKPtsNTKm/wvAXFo6A7hoZxfLkjxdsDkOwlhT+OsYTwFanCWU4BjTGWqr6LvS8u4Q1m3LsXKGYE/MAZX71/A0hwcL47gVXrwZRMDsu5t8ZYNkiRpRbbySEENcESiGtuux4HTu7GeVtiTH1rIVz68qTocROGu70I+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDuLv5ixz6TwBocBe/2WsrxxZNIVDCwL4qS0RMxA4+w=;
 b=UnYl9ZK1zd7SJs9PpzghLMEs2cvyZNKy8mezkwp7ubfMc4flfxVCAd1bmqfihTwipFPBqBnktM7rF+3gcneEjzQpMP3Ig+pDwXv540YU1SYou9Sr2F3Kq0rXW2eQKQTmopKM5WC0z0Q64N558xuLLM7X2oo1XoGaBAU0Rnj7M+k4G57RJuhDiAGmxiYg4PHC3lDuKPB3bETHwxCgF61QxqAEYfzytjJwPaeedeE1oxq6rmt+yOGbKjJe4PmWQq7SIOQmrfxzXNCaO/CIGfvKyiH/bnNEi6WQAKZmA3cqAbM6vu2c7xPKCCJCGlIJ5W7GuB9qlKNUBL8o1eTtmmZHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDuLv5ixz6TwBocBe/2WsrxxZNIVDCwL4qS0RMxA4+w=;
 b=Uy+vwKuDzlgEzrQRVtp36qZetCtlJOec74ub/FiLFFVhNdg7jG/ssQmQYQc4lu0DINme7ggacObylrFsBCzDxVRmHYzr0BNcmrzLD79he2xH19BRfsMRcZSWun4WrnhvqLh1d82ZpVbI4sw2I5LJQ0HuwAEVETCSFGSb6Uk1xOw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0151.namprd12.prod.outlook.com (10.172.79.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 15:42:25 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 15:42:25 +0000
Subject: Re: [PATCH v2 2/9] drm/amd/display: Fix compilation issue.
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20191218151350.19579-1-animesh.manna@intel.com>
 <20191218151350.19579-3-animesh.manna@intel.com>
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
Message-ID: <03119efd-5130-3851-5dec-bd4ef5b8cfd5@amd.com>
Date: Wed, 18 Dec 2019 10:42:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <20191218151350.19579-3-animesh.manna@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 18 Dec 2019 15:42:24 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 429f53a5-9d83-4d44-45a0-08d783d0e157
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0151:|CY4PR1201MB0151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0151898702CAFB1B5E83B98F8C530@CY4PR1201MB0151.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0255DF69B9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(4001150100001)(8676002)(16526019)(186003)(54906003)(6486002)(2616005)(956004)(478600001)(52116002)(2906002)(7416002)(26005)(66556008)(66946007)(8936002)(316002)(36756003)(81166006)(81156014)(5660300002)(53546011)(16576012)(31686004)(66476007)(4326008)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0151;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QelLKeSsbsfceDCr0vzPVHEVZsIy23D1pFkTWxAOjbp+e0DXOlPh+e17EFIG4T+MHDtpz1VUH/rs4yj6a7NWeLNERXBQOGqLQbrmdMPMuycMWDiwO6s8j5wry/Gx4OZJqZ7AGLO6Nt7h5lTvrveWA6RfYWaDAVpMMfDpDuJzwNF8ZBWJAXOey7qUFQk7+6uVzvsOf1e3/Ckn62AL9o6FdzyTKW20IYDdAzrGpQjUugnnF00FWaPjgsvYy6V0qKDbTBq35GzQxhTDVntFO1kNLj2hQc6O9lnfMO6g72/wuZ1k8Vr54Z3EAQiVqW01o3cjC52AGo/F5Vk8IpkgoOCt821CmbpqwaU+QjTc1/RxZADv/VVtRzX+53ajBL2p0F6LtUmpq/j89maQ8V8rvFGiq81B5SO4cl1K0BtYYSiDRhIc6S9eIWOc7eFkyCIe1l1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429f53a5-9d83-4d44-45a0-08d783d0e157
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 15:42:25.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V7PrjfMwZaecB/2N3hlJYzlT18qztMiN5ZQxbNAmHvcrJ0RHSoScGtNI2ON/kfagPMgQCQmsVyCS9zfLtxhgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0151
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-18 10:13 a.m., Animesh Manna wrote:
> [Why]:
> Aligh with DP spec wanted to follow same naming convention.
> 
> [How]:
> Changed the macro name of the dpcd address used for getting requested
> test-pattern.
> 

Please roll this into your patch that renames the definition. All
patches should compile on their own.

Thanks,
Harry

> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 42aa889fd0f5..1a6109be2fce 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -2491,7 +2491,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
>  	/* get phy test pattern and pattern parameters from DP receiver */
>  	core_link_read_dpcd(
>  			link,
> -			DP_TEST_PHY_PATTERN,
> +			DP_PHY_TEST_PATTERN,
>  			&dpcd_test_pattern.raw,
>  			sizeof(dpcd_test_pattern));
>  	core_link_read_dpcd(
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
