Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7C129A9A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 20:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7756E09A;
	Mon, 23 Dec 2019 19:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1F6E09A;
 Mon, 23 Dec 2019 19:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdTcuMnMghz3MMSLdljGjOdI8PuYqZNH1r/XzQrqkIK00Qn9ay9Lk3Sx4bnLqdHXG6bIok5o7JcujS5PwzgtlKkA/FL+xgl+DuD8rPiFpCzR3QXvakxNvvwBTS1atxTlov7sK3sEugq0ae7KYh2HUabJLRutBgTMp0jCSBXNDRlqUQXbYfODZH8hOvNvLT6yDMfYz8+PSSoTPXPfEp2sxx2ErZZxi5iM4Y58r31u4otYw/JSgXw+/0soS0kVVRKtfVpJrkY4WO8iG9Fg3cI/JedUiHB9h5h+v5wWQfdvzGItW+tNF6Wufleubb1TUcOsK0JSzHz4laTjxCjIjQshlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MuW6mvd9fL4S9WmkE2zH+uH71OWo2LA+OcRKRtBw20=;
 b=Yb27+EwedxUo38cI8r3hHXh1G1BU1iiIHrSG8rk5kq0f4ZDww5hZ93kpMgUTVsPwLGSYPPltWJPYb59QdtVPlWXfI5dsZlUfA3QzxsgTij8BDk2EJhtr1JSwQ9cMxWqQisVYEkYqHSihVlll8TTKn7emp85R4XO9PswemXUn8aLvllOpsI2OJ0Aso0UTFpYBANT321ngmzCbdZ97HBsX+vJL8v3YGKpvlcW53Bt8qCZsYSZqLWWSIpzZ4YII1pl5ehaerDRRw3m08ME8J0vgeE9odGfbvvzUg/A9MkH3IKn1zRyuf12S94XxkrLXY1h3hq26mzOsZ4ilueHlzqz5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MuW6mvd9fL4S9WmkE2zH+uH71OWo2LA+OcRKRtBw20=;
 b=H4UCs6Pdr5UD8OB3sxi3LwDKsP2ryuno7XNJWmnBMU/U0ZhpiHG8q69Ty/XSvRBr7aYkIbIfZGb9yyNFyqKaYKpRyEIbGILPDvkcD/2PnlRM+dknRsrdsGhVXlCXfUpGb0irLkttEecdy6BcCnODg6xf2M7eAjKEbvDLgRnOHk4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0248.namprd12.prod.outlook.com (10.172.76.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.15; Mon, 23 Dec 2019 19:53:42 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 19:53:42 +0000
Subject: Re: [PATCH v3 1/9] drm/amd/display: Align macro name as per DP spec
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20191218235324.GI12192@intel.com>
 <20191223170350.15531-1-animesh.manna@intel.com>
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
Message-ID: <b3fef88f-976c-9904-6aa7-64a6d6060ec3@amd.com>
Date: Mon, 23 Dec 2019 14:53:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
In-Reply-To: <20191223170350.15531-1-animesh.manna@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
Received: from [10.4.33.74] (165.204.55.251) by
 YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 23 Dec 2019 19:53:41 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 507cf3d8-e074-4899-65ff-08d787e1cfe0
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0248:|CY4PR1201MB0248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB02481AF1DDD625FEBB5C904E8C2E0@CY4PR1201MB0248.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(199004)(189003)(4001150100001)(2616005)(956004)(66556008)(53546011)(36756003)(478600001)(26005)(2906002)(8936002)(81166006)(81156014)(8676002)(52116002)(66946007)(16526019)(186003)(4326008)(66476007)(31696002)(16576012)(6486002)(31686004)(54906003)(5660300002)(316002)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0248;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81mFo0VgE/qt0FQf1T2VZCFd4fX7jlQo9hwz4n5qV7KbcxFQxPxVAKSD837iW5DHtP/S9sO3ueBFin4POCIlfKtH+3sXk0CzEygkzyTGfYPonkjwEG4Fa/tm+ghmtdTFY7+yqN3HKu9B6xiTyPqtg1crYQsrZHszT/7e5Dmm4jUHokwMuGkd6Fp+KuKyzEabKadvF4NQV8iGiRc+5rKOEyMeP8wEbw156aJrD8/+tNn7C58Xr2tpPWlm79CYxF/7vKjOozy8Jg1UymBdBH+8GUS7g8ZsbsCTejYo9L7xyphia4UatFXdqxe8QugZO9/h6tWxIeDUfyuk3m3U0lqxtONozdCxYJWW/Z6S1DU+OXKqM15ixnjEugnyxPiXQJbZmXEmzZTZ/1n8HJK4Q30hG+4REfzJy/pcObLZuuOQJd/qjaBTOdxrlT+ypJ/dpKMI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507cf3d8-e074-4899-65ff-08d787e1cfe0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 19:53:42.3234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlV/RXXp0JW1IQyOJWQwO6xdthvHk7tuMHAyJntK/E4D8aOAHou4BUvuHMTDf2YYc4YiZdz8e7W4leff5cEljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0248
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

On 2019-12-23 12:03 p.m., Animesh Manna wrote:
> [Why]:
> Aligh with DP spec wanted to follow same naming convention.
> 
> [How]:
> Changed the macro name of the dpcd address used for getting requested
> test-pattern.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  include/drm/drm_dp_helper.h                      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 8f8f3632e697..d6e560870fb1 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -699,7 +699,7 @@
>  # define DP_TEST_CRC_SUPPORTED		    (1 << 5)
>  # define DP_TEST_COUNT_MASK		    0xf
>  
> -#define DP_TEST_PHY_PATTERN                 0x248
> +#define DP_PHY_TEST_PATTERN                 0x248
>  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>  #define	DP_TEST_80BIT_CUSTOM_PATTERN_23_16  0x252
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
