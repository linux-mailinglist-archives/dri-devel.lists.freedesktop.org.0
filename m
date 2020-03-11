Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC426182439
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 22:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D736E216;
	Wed, 11 Mar 2020 21:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA4B6E216;
 Wed, 11 Mar 2020 21:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kry3t/Ivhh/ZiLzdlfYt40PhuGtbq2o+PT7H2mBgJJzY0HO1EwHBYvtppwZV9aTVavk62LsrEaYd4zGYv2fmPOwOAqZKWI8YZpRSoSEzLa432N40XljKaCSktTM5X6FkfnWrciaCuw4ji3p42L5Y1XCRxr5mGUxZqTNtwlhsEhfyqgAHRKyAP6i8KP26suMBOopXH705lMtyXYS4SjmLpqw4VeOIdPE/jZd46+8YyucS8xt8KN3vORas08J/mj+3P6qg/1aqwQB7MGBQR/qse7WAXWJWoL/EBOuAuM3bxI3fb9xbCSz5//5Ipvdmenb0AIKD1sHKGTKvPK5T0bG8Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LloKidggvWjRdNj3I8/BZ4T+CO703iXJl+1vJaVh/TI=;
 b=k9ucb52LVSnpCerZgnZdfaQuEeV+DwTp7vmGGqA+2efHJrWJtaFe3U7vvgeCOdl6VRzn+83rNCtsItvs6K9G5QekkdtQedbATHR2YxYcghcamO3xIAxAv0vfSGOLRMS4meVVDbXqEDZTYydlR182N0Ab9MY9UAMka3g084hRoKufXeTyb7ekRDLsFWgvwClYIQMTnIveSgIUQBwT9zGOz5PjXC1OV2+54vhuy3hY5EieCKyVddzRiDwDzi3XPfdMjrTE6VO1FOIjHLexYqNp8UxCuwmVE+2v5pUq4HOoI+tA5DzSnpELDW1RYT71hCcTbOHVpnthWTVNudd59FrIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LloKidggvWjRdNj3I8/BZ4T+CO703iXJl+1vJaVh/TI=;
 b=MoBv5AzmKWHaUvScjtyVv72BwiBHC/84gE9SrFdjFE5aWUmW8mJIIX1tqIuyQZJ/ccDqYMFwDCJwG6AMEXhAY9qrGPMFgFbY6tAXsRb/wRCmx5Rl9z8gvWzJAAfywQnADZlLSLyw6iLPL27ci+biN2ijjCzQTFwsm0S3AI9YHJU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com (2603:10b6:4:53::12)
 by DM5PR1201MB0219.namprd12.prod.outlook.com (2603:10b6:4:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 21:50:02 +0000
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::6c24:8172:ed3c:5a8a]) by DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::6c24:8172:ed3c:5a8a%6]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 21:50:02 +0000
Subject: Re: [PATCH -next 023/491] AMD KFD: Use fallthrough;
To: Joe Perches <joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
 <3cfc40c8f750abc672d6a60418fe220cb663a0f5.1583896349.git.joe@perches.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <12c75b17-1d0e-6cc4-4ed1-a6f5003772ae@amd.com>
Date: Wed, 11 Mar 2020 17:50:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <3cfc40c8f750abc672d6a60418fe220cb663a0f5.1583896349.git.joe@perches.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To DM5PR1201MB0090.namprd12.prod.outlook.com
 (2603:10b6:4:53::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Wed, 11 Mar 2020 21:50:01 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa9eda06-d106-4f1f-d4f0-08d7c60626f8
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0219:|DM5PR1201MB0219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02198557A4FDD3A198DACBFD92FC0@DM5PR1201MB0219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(199004)(53546011)(6486002)(2906002)(4326008)(6916009)(478600001)(966005)(66946007)(31696002)(81156014)(316002)(8936002)(54906003)(16576012)(5660300002)(66556008)(2616005)(81166006)(36916002)(52116002)(86362001)(66476007)(44832011)(8676002)(956004)(26005)(186003)(31686004)(16526019)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0219;
 H:DM5PR1201MB0090.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+tDM3vTKNa+N//fHb6luOKecyRbRQLewb6iXgUeLpyz0ea4+JvqAYLHt0trDEkjYSoyVdEloGvidS5sVCr/HQfc5r8mJDn9+DeFfEewyfXANkLzsmXmAGvHbetNx7hLMTVs4pyl34hbw3OxISb+sR47RdC45Ii6F8+C7JkYgiwe+x60DMnTYl7e+0qVJJaDeoTR2xV8Jveqo8B/1OjJhTWnuVllLriOn8VMmPQSuyPVXoVyO1QhiL1aYZhI8/Qq3v5E+j3dswXXo9Ga/Ob68r0JtZpn4fAVFdUUoQs1L/h2LCqOgrPUnk/Z1g5B4u3c55EouCLJnmZZjfSAa6mofdwtFa0eK4Mc5K7RWV8AQqmLaV0ee49IANhRaD5tkWqQGplJ+X0c4ctEkmhD+ilLN5KBuG+32s13hoAAIcBZscI41hP/10i98kB66+jJEkc5hWf5Gx8gTaHdaDilT5srlM+WE4i4LJIUBVJd8mmBiLogzQYjn1KUyQhQCYyuksHvgmg67k3gBIxkr1O6Z56zqQ==
X-MS-Exchange-AntiSpam-MessageData: T+aNPQkFtRwhegbjaIC8JP/dIRFewQpKrGQ1oz7QtLDs4OKAUWGRBISAGX0fM/MYvtRvuW7TdvnwBUo2YOlGeXgMuusRfd6PSLrUsDDkcEtzU7WsqSWm58Oa7nFtAKjhWgxZr6YJ8AoKi1jD7w7YGQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9eda06-d106-4f1f-d4f0-08d7c60626f8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 21:50:02.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbckqFNE75EKyfrV8VCKVTJvPzvFVo+N5nmucoi/XUskDhF2lo91fPHWudcwVq0H5oeCiSlvJarK+B6a6HHZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0219
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-11 12:51 a.m., Joe Perches wrote:
> Convert the various uses of fallthrough comments to fallthrough;
>
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/


The link seems to be broken. This one works: 
https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/


>
> Signed-off-by: Joe Perches <joe@perches.com>


Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index d6549e..6529ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -79,7 +79,7 @@ static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
>   		dev_warn(adev->dev,
>   			 "Invalid sdma engine id (%d), using engine id 0\n",
>   			 engine_id);
> -		/* fall through */
> +		fallthrough;
>   	case 0:
>   		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA0, 0,
>   				mmSDMA0_RLC0_RB_CNTL) - mmSDMA0_RLC0_RB_CNTL;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
