Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43283B49B2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 22:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893136EE3F;
	Fri, 25 Jun 2021 20:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2060.outbound.protection.outlook.com [40.107.101.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE376EE1C;
 Fri, 25 Jun 2021 20:14:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOiOf6gomi8O8eyHXGjoUE5zRtk9PHCbI0glqTSbBCfvAOEfQAhejvvvNK/zbVg0Sf/iVGENni2pdpdkD7PzrUwYEBBHwMLnrJ0v264aaGtgzcty/8fcsC055vIIwBz/4usQ47YYoMpUfgsLGjRByLwQ3VIyvUvSxCjmjtwr8T+zFmsmq5pBjvKExW5YB+qi/w/VgZl7MBJ3/16cCn354Fwct+VqSgVc9aPh1uyYfOiCh3jV6oZfU+DNL0MKZpAgHnbZrBSRtN0Qs6FEXCpGzei77XxSVoUo6Ke7JPuc4zrHW4p2DSME26k7xJmmNLxSKthf1dF2x9fjnDOdeU+8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1lNDXB7DY7R/SRLGX2rQjbJwy0Pdz7RjWiQLYk8aic=;
 b=IsM0YSWvU+vGiRnlmry3PtEPR9YH9L/SVMMCBMJF+5NQo/7O8q07aBPtza3DDfWd+gfkSSzY/ckz0GmvWe+ixlAAYkkYWArvsFPYwxoJOVMBXe+YwW+Fg5i8iLkoSVjw/DCeGoxooMwjvcyjcaZrd5pVQbH0z5n0mEBjGEZc20nN8NZcapbDQVNY6YQ3F3vim/O9J8OXkC1gLxF3EMvqKXGMGow+dRrQk44xy+P1UmSI1ejXNQaFYk3CbC+FGEwpiyLnMkB1vPcHGN/LoyHy06GcnxDkdvqcM78XuEsvRGeHDUC3YpJPmfQkdwVOYGD0373wLrnY4TZR/2p17/JjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1lNDXB7DY7R/SRLGX2rQjbJwy0Pdz7RjWiQLYk8aic=;
 b=Mu7TcJcZNiJ/1vNMMMtpDscp3TxjMrhDiLW8gFt8EbuZLYV8Jw8jkV+R0IxcMIcM26ousHuncG4kKmANSbykEW2ReLhwINOugKBdwdbi25I+UKzcykdGra7j3pfZ5xh7LblUpfFHoMEhj0XULmvKkJHDp8wthQVvEbUGjZn/B9U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 20:14:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::401d:c7a2:6495:650b%3]) with mapi id 15.20.4264.019; Fri, 25 Jun 2021
 20:14:38 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Really fix DCN3.1 Makefile for PPC64
To: Michal Suchanek <msuchanek@suse.de>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210623103039.9881-1-msuchanek@suse.de>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <6ae69103-b01f-4f16-7cd2-845ea991ae95@amd.com>
Date: Fri, 25 Jun 2021 16:14:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210623103039.9881-1-msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 20:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e79b07d-92c7-443e-7315-08d93815db7a
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB544446CF3CF6F9BDCD7138088C069@CO6PR12MB5444.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPxOYLosezUw4s2mTp3i7R1F/KNxYXdL0i1LhvXvLoacpVtOwDQEHziamwD3fUzMMmLjYyBGQKrx+nn2zzfLqwoXcHMMUmex9MOFoeZ4e6Z9IIgmaJvzesn8k0FKtXmZAkNEctglIsbDGEHkUPb52kVjuLuhop1rXq4ssl3fGqYLI6EjzoeN3nWznpDhJRITXS0DHOG996ISXAxv/oCXlpAUQG1tgqZ/jUbacOX8umsgSGffe/dEc0ro8be9IQLytz8bGREpZtzu4vEeNyGG3xcUbLd5ERnZTUf0SdoB6Qo/DpE2oQId2w2+HYM4TRIxntGPqKgkSf6CLShdiX0v5qpA57EJ3a7z+cSDwNwMXT7OmF13UMZjsEql8qC1Io3sBj64UcSkqIIjp1kA/3/FVWfntBwhztky6gSO2sEBVFXghcUs5SWjHXtYXwvvVts64F80/H2wlP1nbO7y+yBO9Z2hZ72Tu64PUrSM71R6zQAaB9ZI5C/xPVs1CNZykEBIh5Bxg+spqtLSD+vovdAJevoHpuSzf1d9qpVtRCqwtMM2LIJWjTdpEl72XpE2fDbB5R3SFJM4+gxgklG1Ei+FtYy5DZhfEW36aRLJP+bKg/hXIl4DBKpxLhWteFo5hmLDjAyZZFNlU9fS4fzje0zDeGNjd6DlxMFB/LeJgmY4KiB3HV+7/qZpeGt7zCsNte/y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(8676002)(316002)(16576012)(110136005)(8936002)(478600001)(4326008)(26005)(53546011)(38100700002)(66946007)(66556008)(66476007)(16526019)(86362001)(956004)(2616005)(31686004)(186003)(31696002)(5660300002)(54906003)(6636002)(6666004)(6486002)(2906002)(36756003)(44832011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmgrelYxVXdxZklZWmRWdDc5a28wT2hsZXJ2MTI5OTBXNkJJSjcxM2R5NFB2?=
 =?utf-8?B?RFNuN1ZraWF2MGdtNE9uMGdDeTZCZHhZcWZibzBIOUtWREtuMU8rM0V4aEYr?=
 =?utf-8?B?MW5HU0tGUGY0RXg0NXdqNWpSWWFsdTJsVnV4T1FLNEZmY3EyalMzcDdMOFpG?=
 =?utf-8?B?RTd3elp6V2FOVW40b1JWeXRjblIyRE9EZzdDNXRGd01HMzRwWHVjUElzcGhz?=
 =?utf-8?B?dTRjcmVJaEtHRTA5M2ExL3U3NkVEUGZOakxJTXlsQzh3RXV3MkZ5bHMrbDFL?=
 =?utf-8?B?L0VMSmlqZHJzQkxHdmN4OVVEWnFCemZ1eUVzVWwzM0NZUVBQOWUwTFZvWXZs?=
 =?utf-8?B?aDlPVHM5Z1VOQllPbXhwSmNkS0IrY3NhN0JwZ3NWak9kTG0vcmE1UDVrTEth?=
 =?utf-8?B?S1NjbGNFc1ZTWFpkUHh0UVBuam5aaktoa254TU9lZjQ5L2RhRjhJdURCTFJY?=
 =?utf-8?B?ZU1HaGRvVzI2SlZGMWs3Wkk2QU9UQ3NhYnhIYk9naVErSTBtZEppa21NTTZ5?=
 =?utf-8?B?WUtmQUNBOWNqekY3TGFqV0ZYQjkxZ1hMZGtNNXlKUnh0ZU9vV2ZnNUt1L0J5?=
 =?utf-8?B?TXE0SEVsQlNVYmM1djJMd3g5djhnTnh5Vy9WMUg3Q3VXQU1seU4wK3JHVVR1?=
 =?utf-8?B?Mk40T0I4OFBSa29WZ213QWdKc0ozR3l5VkdNcG5YL1I5SUxWaXFlT3hzdmc5?=
 =?utf-8?B?QzhlMWsxNGNTYldxZzk0Tzg5bXVvY1c0cUhoUXIyV0g4RndjZEhHSUhiOENL?=
 =?utf-8?B?WVVLLzJLKzMyQ1dNc3ZWY0lFSUV3Yzg2Ulhlb1VXaVQ2R21HcnFKZXo4RGN6?=
 =?utf-8?B?RzJnV1BIM2QzbWNzVnlsUklLNWtEUWI3blZVV29UeTRSU1Q3dE5vWUhVTiti?=
 =?utf-8?B?dzFoK3ZFR2RabUd6RGdsb2J2YkVmQ1BtZmpPcVNwZDVBcHJRR2Y1bDE1WENW?=
 =?utf-8?B?RGVIcGJPdmUzWDJoeXpzbU5RWGYzTkd4dE5aVk5nTVBiMWJrVjlWVGwybmJB?=
 =?utf-8?B?aFpUOEdjejd5NHVzdmsvaFdKVHl3OGhEN2hKa3QzQ0pvRU5oQkp0dXFtLytX?=
 =?utf-8?B?NTVnMW5nNDlXNVFhQnR3QlpSVmJsK3RMd2Z6QXZKMXZDOGtnV01DVitoVVFD?=
 =?utf-8?B?dTdDVzNmRGtXWEliVzRlZXh3V2cydW91UHVXalhuVU03YTJkSFVRdGo4ajYw?=
 =?utf-8?B?dlNNU05YQnExdjNGY0J2ZzJuQ1pWTjcwbFBlTDZIQ3R1a3FIYjJ4TW9aQ1Jn?=
 =?utf-8?B?U0N5SGpLd3cvVEorS2F4TFdrc2ZyYTFodDRLWGVZdmFLQ0VrUG5NRXFPbXg2?=
 =?utf-8?B?dDFtNmdvdEZZeEI5YUhGaWo3OGVxcG9BMjlTVTFQUWhMSlkwazkvUTV2K2Uv?=
 =?utf-8?B?eFVTQSt0cWhjRWVMa2dwdkFCemVNUTQ0VWRDQzNMRjFra3ByWUJNTC9PcTdl?=
 =?utf-8?B?NlAzeGxBWmVnWTJqaU5uYWpHUVdIUXgyZnhYTkxUdStDUW8xNi9EWHFGN3k3?=
 =?utf-8?B?dnpOU1A0QXJFM25rVFFoYmZya0MyYk0yUituUDlrTy8rcnRzeHh4N2NaMjNi?=
 =?utf-8?B?SS9mVW1IbVJVeTRQbHBuS2RFK1dkWkJqbUo0VWcra2ZaS3FLWktScEZucmJK?=
 =?utf-8?B?QVhQVER5SXJRaDBUOVZONzUrQXUwSHNLTmFjeWV5UWhBbkpFWFZub1ZIcElS?=
 =?utf-8?B?S3RKZDhuUXBGSGJHWHJIV3VYQ1RxalRwL0xCZWJtU2txbndDTWFUSVlpVVFq?=
 =?utf-8?Q?lzG3z5RuG0UTc5nqIJVUcer8ZtA12u6gEvL0eFx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e79b07d-92c7-443e-7315-08d93815db7a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 20:14:38.0226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe39Lrumz985PWcZxF4l/P1d+pJZa4teo85Wj4TB6LYrC03ETSaBKokyPgNwN9bTCeLl0mvQFQCnlPFqrz2tHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Will Deacon <will@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-23 6:30 a.m., Michal Suchanek wrote:
> Also copy over the part that makes old gcc handling cross-platform.
> 
> Fixes: df7a1658f257 ("drm/amdgpu/dc: fix DCN3.1 Makefile for PPC64")
> Fixes: 926d6972efb6 ("drm/amd/display: Add DCN3.1 blocks to the DC Makefile")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> The fact that the old gcc handling triggers on gcc 10 and 11 is another
> story I don't want to delve into.
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> index 5dcdc5a858fe..4bab97acb155 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
> @@ -28,6 +28,7 @@ endif
>  CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mhard-float
>  endif
>  
> +ifdef CONFIG_X86
>  ifdef IS_OLD_GCC
>  # Stack alignment mismatch, proceed with caution.
>  # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> @@ -36,6 +37,7 @@ CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mpreferred-stack-boundary=4
>  else
>  CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -msse2
>  endif
> +endif
>  
>  AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
>  
> 

