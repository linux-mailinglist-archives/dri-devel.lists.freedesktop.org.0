Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79A1B46C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709189BB0;
	Wed, 22 Apr 2020 14:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7489BB0;
 Wed, 22 Apr 2020 14:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4zUZKFWDDR15cXr/NFLqQBAGlYYl+ynggNzuX1QfKyFP4u9LwuMBM82Jnh1faCMyhxHF5tturGxvIHxYKJhr0UxFY9jxdH93DrHwFpKaXrX0UopUUoNV+lydLdaaF3nkUuWHaZlvvoY8eAPe5VXSmMLmhZY1pKZN/3HPrc0k9DNLlW4WPkCmQuu+kC+jM8gw7hRuDJRx15MIXgxRDIWB8EOZemFPFWt+O7ScERDFcXlqpE7m5w6DGmk/BFav9TgeydsJt8dAnsqEM8F4TfY3MWrwelQ3qfIoKVn4RqVEXWvk+p0YA8kpALOWFtaFRTQZpEUd12P1gRR94Zdek6GNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU/HWoM8eYXLEToHJoOUTfi6If5bv/Y5qf5c6ulpDAM=;
 b=RiG0b2L9DCzzL0fh9Shag4m47R7dFjTNT6Z+GKn2xSh77s0/guLXjvgl2EbxtQKv/vwdWsgFw2NQRuEpEOuKahCgvcZ1ehVNyW7pRcw0Hkmp88vnoneXXYa+jm7K6uPjZV4EVc48Ey7z6e/dHM2TYVwh3mjGc8hoYj60P06ZcPYejmoizYy9XHhXWvgsqs9DFTBzriUBozLNrARxU3GdLXHnPkc//9dskMscrFG5e0TzFdeQVi4XriNycmn+AH5Wy+AnGSk9pWc24/luInIn52eBvIjAdPRjSmkCg65sSsnLR3WCzhZARKyjqLM/gcCiFHpqMYs9iQRXAO8cS9vO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU/HWoM8eYXLEToHJoOUTfi6If5bv/Y5qf5c6ulpDAM=;
 b=MYJ9ZDbFt8oZcPPySMaA0HrJvoxOnmX2Tm8nbe31NjvrZjz+L7ieVJ43emPWxiz8JoNW1Pm0479DGtpqTqLDcML2Ifka9CJUdkrg7gSeJHx9tdzpIL9l7UpzcI5kq/MMQYliyjJm+lvy0b4s+yh51NMxBPmdjyy3IiwBTXNh/1A=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 22 Apr
 2020 14:00:37 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 14:00:37 +0000
Subject: Re: [PATCH] drm: amd/display: fix Kconfig help text
To: Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <31d56a46-e3de-e768-a154-03b6afb3ad72@infradead.org>
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
Message-ID: <6892a582-3598-1963-5b6b-96cd8d24dad5@amd.com>
Date: Wed, 22 Apr 2020 10:00:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <31d56a46-e3de-e768-a154-03b6afb3ad72@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: BN8PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:408:94::14) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::6] (2607:fea8:9240:c66::6) by
 BN8PR03CA0001.namprd03.prod.outlook.com (2603:10b6:408:94::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Wed, 22 Apr 2020 14:00:36 +0000
X-Originating-IP: [2607:fea8:9240:c66::6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5eaca7c2-c10e-4853-9a37-08d7e6c58880
X-MS-TrafficTypeDiagnostic: MW3PR12MB4395:|MW3PR12MB4395:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB43952D47FD0CD04536D9990D8CD20@MW3PR12MB4395.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(8676002)(52116002)(316002)(66946007)(66556008)(66476007)(5660300002)(2616005)(53546011)(31686004)(186003)(36756003)(16526019)(81156014)(8936002)(2906002)(6486002)(478600001)(31696002)(110136005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/l3Uc+q0io2qHHUl1TwdriYODd5a2F9iTVfhrGzlUXkB7UBly0rbF3AXYur91326UP3pbr5sEPghxVkNNepmiVpdmoLvCFvZvI1Ga7tFxBCfwoXqdKTIv6FUfWqpRUSnbHy3Nug0SPq05Wht2gOx21dDLx1gXKzo4FKZfyA+eNdsg5ysD38FBKBwfF1R2AG4LSuHHYlYXzEKmdq7EXrCli0WPgm0H9/kVxEvyRXJ4Th/mnZapuUniLHXte9HLEp6j6ZOAODCIBke+5x0f+z51FDjitJbLOT21bPQCLt1o+M87LYi2VV7MJpx7/IYQOp4I5ZW/1YhyoYOdlQKKJXTF5MaKl1dNfQ8ekjV+Rx9YjNAUnw9XZkmuw3sdYlDFq9BHWabZAwil+THXxxH4sQDTbcH7wU5xIPJDkQQDrxQob1ZJ1n2m3qVytZe2GLzs67
X-MS-Exchange-AntiSpam-MessageData: U5uQe6Fl8mPO2+C0BJ/CmKFhf+LYN5WPvQWVQfOj/kLTVVSJjC4XapeauOcWwS3XE+AbbK1c+sEvW+CQDGT4BrM9btGxPf72mft25xKQV+K5jvr3ydw25WfNeaQccwiJ5yE+J9jTcaRGqJ9HtY4XxLdk2Box82gm87veMi+VoI4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaca7c2-c10e-4853-9a37-08d7e6c58880
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 14:00:37.0773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/SOd0e8CA/hkRKY84jw1E3EaiLEnso0FLi0WPgBg/BLv9H0LyFMaRY47IAqxkaz4dtBNZJ4jbGw7myA+29FRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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

On 2020-04-21 7:34 p.m., Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix help text: indent one tab + 2 spaces; end a sentence with a
> period; and collapse short lines of text to one line.
> 
> Fixes: 23c61b4599c4 ("drm/amd: Fix Kconfig indentation")
> Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/Kconfig |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> --- linux-next-20200421.orig/drivers/gpu/drm/amd/display/Kconfig
> +++ linux-next-20200421/drivers/gpu/drm/amd/display/Kconfig
> @@ -21,16 +21,12 @@ config DRM_AMD_DC_HDCP
>  	bool "Enable HDCP support in DC"
>  	depends on DRM_AMD_DC
>  	help
> -	 Choose this option
> -	 if you want to support
> -	 HDCP authentication
> +	  Choose this option if you want to support HDCP authentication.
>  
>  config DEBUG_KERNEL_DC
>  	bool "Enable kgdb break in DC"
>  	depends on DRM_AMD_DC
>  	help
> -	  Choose this option
> -	  if you want to hit
> -	  kdgb_break in assert.
> +	  Choose this option if you want to hit kdgb_break in assert.
>  
>  endmenu
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
