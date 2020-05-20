Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECA1DB9D1
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1A89E57;
	Wed, 20 May 2020 16:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0C589E57;
 Wed, 20 May 2020 16:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWPVhyQZlMo/Dk6STTAZN/kuE2+YpuZyESOhUGZR5ytjQ+qeyn9xpHrlLsTVTqE1pPjVml6xyyJBlLC4Pe3WoOsRhxNEE1bWoq19ltei/yg2LiMPkzKGVAZmHszhYM9mJa+DfC4bzzHxWk8ygp1F4QmEspKZkiTeL6HReKtOhPqheKJGMTFkALm36Lwqlw7jEI4ia6ykeLxY4I99C3SpNr9LMkWXR417e/VM1CMcYkti/CzIdG7HXvtXmA0eGCAKHnhYdSXHz/E5HeK0Ye5JbAd6SfXpunVl1X2X56hgTQA4XVALeLt5pI7cVG1wTbsGne/ucLCgkniiz79aWM1u4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R17axe/Sq+c0Nwax9LZlyTUu8+rMUxgJ0hmXQeeLO1o=;
 b=Tf8rE9+bKBd6cbHGgPdeIybHEN+uDnZbuMV9xMy0olSE5cBUMqy75JoCIkhbNjIlG2Mg1scNs5fiEVJfLOsQRRA+M+M9pmqSrqchjXXB4FlOvrLxISz034wcfBBip/+fT6GU6LT9v1m2ngeARqmJYl7R/X665w6R+F2iKm3+I52uPaJ44Fsm93bZwb9BOLhmavMO4FbVnWUefd/YYzE/5xvVWuMs6UCFjneB3PzpahrhaBIaBsBTbgTxk8yRJG7pW1nGmMuOmJwf2JxAU/HOF8yp8S9iIlAk25uSqkAZqHQIGascpFMJG2kcxGi+jqidSOBkj/o3Y5+4cUR5PRvMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R17axe/Sq+c0Nwax9LZlyTUu8+rMUxgJ0hmXQeeLO1o=;
 b=VFJO3IL/6+2qk9FrxNsD/zdSQqTtGLfOUHUv+2TVuUCJJNrFfVfNOQhvuXQGwoTlPoGLwKfd9ZV/X8XPVl3YiH2UOHYgzlpA+OKXPhshPaYXgm7zs6cNx6M91TbgtzdJbtz0ZIjSJWEsgLkDbpd3GRQmIpe5CzM+1aDfyTqQBDA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4539.namprd12.prod.outlook.com (2603:10b6:303:59::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 16:39:46 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 16:39:46 +0000
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-11.0 -
 DCE-12.
To: Mario Kleiner <mario.kleiner.de@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
 <20200515051924.12331-3-mario.kleiner.de@gmail.com>
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
Message-ID: <7ab95258-02a9-fd39-6806-e6e81ddc295c@amd.com>
Date: Wed, 20 May 2020 12:40:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200515051924.12331-3-mario.kleiner.de@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN8PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:408:ac::27) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.86] (165.204.84.11) by
 BN8PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:ac::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 16:39:44 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2732ddf-1d2e-4585-f580-08d7fcdc676d
X-MS-TrafficTypeDiagnostic: MW3PR12MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4539758D13379C41A8BBEDED8CB60@MW3PR12MB4539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DOcVIeAkx7bXKWpRUI/0HlrQ6jURbrIZf6nEO2hrxgqMym7GKRf7sgW+6F8HvKDNvcBYqozwTx8IXvyNAd66hN1bxQ62dNfCD7Ez5LMVzPO9gUxhsFNOUWPGGsLV2rzjvOicn63MGLC92j1Xbb4yU1zds5b516PlBP87ijWjjStpzGKGoXJgd73OMdG4r+m5wkJ5LT1Zt+Ypj1k5fuUuJSgoznZzQfiwJLjP1P26ImX7mac0uiNWVTKv8or+ZveQ/imb+rfJcuaErctH1ksvgVg96861t7eEuA5NvWJnAapsXaQJ+Brh1xGJS6S2JSaPfy59ivaWCjqtUbeFopfdSxQ5GWQ4QxhM6FXiyB+1yUBRgIb7Q4Cilwv/QwzPpo2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(66946007)(36756003)(16576012)(316002)(66556008)(66476007)(52116002)(186003)(16526019)(2906002)(53546011)(4326008)(6666004)(31696002)(5660300002)(31686004)(26005)(8936002)(478600001)(8676002)(956004)(2616005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zDU0STgK2rrnpmnjlaSr7I3X2A91usyPUjQ+VrmSbrqAjPbluSPFH6Xba/u1puQYFB6Ch73zIdCN+wWPXMhFiNkVKyIQiTDSvdUQFta7T5ul7t4GTHR4XWwlSg+Zb+Lj+Dc8IGdGx/TpTU+qEnDNXV5R2T2yNRmJF6b/AfjuWwffnML8jSAHcTkAvPAttKZ2n04pFALtKWuKhbWlTt1Dz8ZkVsHUEftGAdlXgHxgtOlwv+79kPAKTmNMY2VbcMiowYMT3i80/SPTbGz56M1HiIrraD6PAfDJZuvosEka+0eG9lOcW+o+aJ6qRtqo5o3Wi2Sjy9Slb//LWIiko7rycRYOvUPzPd72s6HgYJtTy+r3Ip98EcNIzvGBl44ocjAPZaXhX0kJpoX+N0voouv5sBE/+dXyUP0ifvKNi5pZabqssLJ70eYjbn3phnNA93glR0/lSjKzME0uwG02GquJK/3c4aJItz1ONyufWQnPiVRZJVQQPQ/b2/G129+vdFoh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2732ddf-1d2e-4585-f580-08d7fcdc676d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 16:39:45.7276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syyqGQgaeGd1f8uIrNmtgbq+ZZ9mI9qKBJTKjUaVAUmlOBu5EtI9fwpor9u0O7DVxNN/zl0iNp2I+eCTlGeAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4539
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-15 1:19 a.m., Mario Kleiner wrote:
> Testing on a Polaris11 gpu with DCE-11.2 suggests that it
> seems to work fine there, so optimistically enable it for
> DCE-11 and later.
> 
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index 9597fc79d7fa..a043ddae5149 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
>  		.pixel_format_support = {
>  				.argb8888 = true,
>  				.nv12 = false,
> -				.fp16 = false
> +				.fp16 = true

Carrizo (DCE 11.0) has a HW bug where FP16 scaling doesn't work. I
recommend we leave it off here.

Harry

>  		},
>  
>  		.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> index 4a7796de2ff5..51b3fe502670 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> @@ -411,7 +411,7 @@ static const struct dc_plane_cap plane_cap = {
>  	.pixel_format_support = {
>  			.argb8888 = true,
>  			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>  	},
>  
>  	.max_upscale_factor = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> index 9a9764cbd78d..8f362e8c1787 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> @@ -516,7 +516,7 @@ static const struct dc_plane_cap plane_cap = {
>  	.pixel_format_support = {
>  			.argb8888 = true,
>  			.nv12 = false,
> -			.fp16 = false
> +			.fp16 = true
>  	},
>  
>  	.max_upscale_factor = {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
