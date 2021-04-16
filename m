Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A336240A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 17:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A956EC50;
	Fri, 16 Apr 2021 15:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5536EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTl5fP46dY/3vSR6gO5j+1kjVvOxFgAdmFzpYmnNSYcQMPDh07iPcMr5pl/TRE9G+CtMgkMvQ5WPNyXT82F59prJG2FSgiosv4d8HyOmNJ9/VHv3Acn1lsv85UP9T9SyebV7qoksQ2cldgWOEwcPO95GAUmDWuoBK4nH1/LcG0s1oOztceUUg6Ru7jrlzgPbu2LGj8F7tHLiu0kJWgY2CraQQgPAH3FNu73GsEd0VZoq0YQhnWViELkCzsqzfKk2RaLSRrzt2tUJ7rCAKDXBz2rwoK78hmR5efZgNcZzE/F1lPIDxqvjAE0MeG1Omx+Bu9/bUYN3A5d0SKBWRLjRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE3bpLCOf0LURtUyDCzhegkW/6g77juk5Cltv3V6IvY=;
 b=OLjxFDPVsP9K6EGqaPyoFIWT61Gcvq5x+71XJTwWNajqhA5X809vlN9IMdCzYd6amc0kGP6xEy1jiq3PaUEhmQ2nJGs24k+182oRXsC+uOUxwhudlZxspawZk7D8Vrx8FXnYjD19dMMYcKUcVT2NerH39bXdSqqWcrWYbRTteYyFbH8sKwqUZrREQXUJlyB9am8hC+QvvcGeGNQwQqGtzSV1oujNv3r4p2iuPZ98I0jXcvurcrseint9Kxbvqi7vWW1RLKoiofazTCpC760kuB4le+VqFZT25bosCu1OXMbqTiPFxzQEp8VXCmYBPJZnZU5ZzJQp6vbY+DFmIOi/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE3bpLCOf0LURtUyDCzhegkW/6g77juk5Cltv3V6IvY=;
 b=MXWpaJ+qxnassiCih1P6ObNNJJ8QS370jqUpCS/eL/qY146fsSQvFGTVBCFur4vEqPPtkjfcNtiSxUOxLlEypeDczj8BCfTQXW83WfekngHUwbJN9BAU33QLGO/zUy4b52t0kQHONzKy4PcdbYYKcRqoVhm3/Rg9F6o6Q1UpTYw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 15:34:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:34:58 +0000
Subject: Re: [PATCH 22/40] drm/ttm/ttm_tt: Demote non-conformant kernel-doc
 header
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-23-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2a85bf3c-d40e-6608-98f3-cd399f4df912@amd.com>
Date: Fri, 16 Apr 2021 17:34:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-23-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM0PR02CA0150.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
 (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by
 AM0PR02CA0150.eurprd02.prod.outlook.com (2603:10a6:20b:28d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 15:34:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ac8195-badc-444a-90fb-08d900ed3136
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206D4057F51F2A660EC0C1C834C9@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upnlecIYF4XCoUgMMJB41siSTXh/Nw7SvuewsCtd42Qv64kRyfiBmbXsu2FtT8WeBlJThVOTnztm2mM78Xe+hTYj0B/CGLqqWVmdI8Vrh05i1W8dINQzLYt0df+4ZLYXcc6ru+KfX8Z1L2evhX+wPKgC5xiLb3tznNfD1WM3y4cQiNqPGB2eGNc/OWl6NM8I/PujVYWVlDas5AWWYPegRtaV2EWOKZZb/Q1c985XRLkDEcAttcgtcWGL//djFCihcrz8/pNc1D4gu+/bWbGxB7RFfGuKMaZOdK60ZayfIehlTrj8lP35e+TEk+s1QGVOOdoZwJnwr2vtbhHoGJ4jz4PIrmzbm/OgNUbSbvrkwvDpcM2I2kT4NykFtx3Ra4vsmKdMNqq2Ynq4tX9kgafASBX38wBTi3D04w8YSoz5rIQBmMUUh/7dxcUw41vi3ZGnaewZ7Z9VyPLK6F7wXxpM3g3Dd92mWa0A3hlmuBOGeiitk0hFDh/oRn8uQhiqepSZpbGrGMbmRLcc5NP5Csw7iGop2V/zNXP9qz5e37KhG/ZLQL3xPnN9OpMt7SzFpoJfWIGT3ayYrQEwsdVsyv7HOy1Yn9MTPDptP0he8bFs8MFToo7llK8zAHVtmweQKa1xLGfL25sVwF553X+017W3pVq0tYMe4j8Fub/ydcsdiBmvFxg3M1kRP7tyNvC3ul8n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(36756003)(6666004)(54906003)(31696002)(2906002)(66556008)(66476007)(5660300002)(8676002)(66946007)(8936002)(2616005)(316002)(478600001)(6486002)(31686004)(38100700002)(52116002)(6916009)(186003)(83380400001)(16526019)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUJKOTFmN0hWZ0x6RGoxbUJ4N1JTdlZ5eTBpY1pWQWFMVFpibU84cHFaN0tq?=
 =?utf-8?B?bm11a1U1Wjk3cWdwRFltZ2RjRThxSE5BSm5XZnZKSUliZDhEYnRWU1dYVnV6?=
 =?utf-8?B?V1JxNFhsK05qckk1Tmd0R20rbVVBMU9xU2wzS1Z1OXdLZGlsVHlYZUF1a3hi?=
 =?utf-8?B?SDRoR25wOWxVZHFEWE5WYlhKdEpxWjZienJRTks5VytUS0VvQlp3ZzR3QlQw?=
 =?utf-8?B?akNUaUx2dkV0QWh2VFo1U3UzekRXYWpsVDh5dWJZU2VwTmpTeCtKWXd5WUZq?=
 =?utf-8?B?SXBGNlJ3enFiMDQrUzBoVXc3dmpSQTUrNlZzWVZoOUNWY1N0NmdaNnYwVkZh?=
 =?utf-8?B?NEcxSnRRakJ4UlJUQkNuSTFHc1dpNnRkVEJMdHp3TFhaVjlqbFArZlVyQStF?=
 =?utf-8?B?bGVQczYxMVZUV0ZwVHg3YzhROUpyYmlxZmZidkdiZk5NN2dTamNlV0RmOFRo?=
 =?utf-8?B?bW5VNXY1RjJJcVZuV3MrM2JjMnZpL3dwN2VMTUNuSnZhV2dSNng1WXREKzBB?=
 =?utf-8?B?VUxjZjJEa3NHL1NlZUZuQ2hBZFFXSkY3UTFZa2VCcTB1TUlwWU43Ni9kckJm?=
 =?utf-8?B?cW9lalphMDNDY2ZhakhqLzBvT2NMczJlRHdkWmRzTU5RdnZrREZOZ3VoWEh4?=
 =?utf-8?B?WXVOWjJhVDZRR0o1cWcvSTFoUU9QdTZNaXNDYVNCekFPUU5VS0J6NVNUWXlT?=
 =?utf-8?B?U0ErQXhTbUlGdi9JM0xHVUxjbEVrUGZBUDFDa2FVODdXeG94azkxSVlMRGI3?=
 =?utf-8?B?aXlITGpFM3AzQ2d1YUVXS0pWOXN5bnUwT1F2RzVaWUJpOWFzeHpzNHRCSzhK?=
 =?utf-8?B?Sjk2cGgxWXBhWUtFcW5Wb2J6QW01Yk5HS1h3NUZySWg5NlVwbE1oR1U0bFNC?=
 =?utf-8?B?TzJUTERqZjFlUXFLS1ZFMTRDQ0pjRnk5WkJuQ1AvNjk3VjNDWStrVjZWUTdX?=
 =?utf-8?B?bW44SVpQbXVGcGVUdU84TG1zem5xN3QyMDJwakRRRlVVcWN2dHhvMWY1azE0?=
 =?utf-8?B?YkY5RDZvQkhodlozRnhzN2grNy9lcVV3bDZod1JMQS9nUW11c2R5d2FNMFlQ?=
 =?utf-8?B?SGZSNTJGR2NsTGlWUE1CdU5saWVuL2IwL2NQbHdlWi82OWw5cmdkZ1BxVHg0?=
 =?utf-8?B?WENuRG1PdHpkTVBxeHNCYkN0Y1FnNWEwZ1l0UTRMaW0rL0hZSjZNdjNWS3FR?=
 =?utf-8?B?bU1SUWhYVXo4OUM2djJ3U1F0VEpxSHE3WFVpSlJSVlpmOE5oTm9sV3BQY1h1?=
 =?utf-8?B?UHlUWnNFSjFwOTVuemthckVBWEVueG9zZVFyTTNDNWk5NnpmbkJ4QTVHcTFa?=
 =?utf-8?B?UVpNV1hyaFNqSmlCdXkrSm1PVHlNZXdueU1KaDhRWTZjaE1jbnozUVNLRUsv?=
 =?utf-8?B?S3Y1NnBPeXBrUFU0d01mZElBaXNUSFZ2UkVhQ2dnb0MyQjlRN3RvWkVnTUZW?=
 =?utf-8?B?bXJxZVdFdlFST3E2OEROMm9BaS8xcVlBT3M2RWs2RDRoREZrMnk4czA2aFhF?=
 =?utf-8?B?eEYzbDZKRE5QU1BPSDhMeEhwQUhqN2x3a0cxc2xadlY5Zm9obEdoKzB2OCtT?=
 =?utf-8?B?azZ0Vk5xSTFRQThCRlJVYUEwK1JIUktWWUpJckRxVkxLVWNjSjY5QmZ4TU0y?=
 =?utf-8?B?RkZhUW5pcFB1NUtjWXZnL0FNUlFRTnk4VWtjQzdXUlBjb1BnVk14SStzbjg0?=
 =?utf-8?B?dGtRK0xzS3dPbFc0SUh2bHhPZ1VHS3ZMOXVybjFoUHZvTzBMQUU0OGRLYzRN?=
 =?utf-8?B?Q3NGRlZqSFVHZW9rd0gxaWNQbzQ0RmFhV2hJQSt2eHo5dk9EWmJ1MGtTajNB?=
 =?utf-8?B?Q09RNmRTWnhmeFlJZG9iTWRSTnVBRld4b0pYaXlERHYySFhManFWeWVFODZQ?=
 =?utf-8?Q?De1bHTxrw/1s9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ac8195-badc-444a-90fb-08d900ed3136
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:34:58.4783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUSPi4PBoR3VuzJyR78RnKtMPLV4F3c71MROxrjDZU0pYIM3gwoq8/8kqysMtHCj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.04.21 um 16:37 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_pages' not described in 'ttm_tt_mgr_init'
>   drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_dma32_pages' not described in 'ttm_tt_mgr_init'
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

For that one I would rather prefer to just document the two parameters.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 7dcd3fb694956..d939c3bde2fcf 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -389,7 +389,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>   }
>   
> -/**
> +/*
>    * ttm_tt_mgr_init - register with the MM shrinker
>    *
>    * Register with the MM shrinker for swapping out BOs.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
