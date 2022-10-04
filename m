Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB545F4604
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920A310E09A;
	Tue,  4 Oct 2022 14:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B050710E09A;
 Tue,  4 Oct 2022 14:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyoMsVm3pd53XbzjPF9zQdIq535nZ+NfabYxGFg3Mi75YVhNHTS2VPtFmxWPL39Ap+Dh28dTDca5RzfHmPf4x9OqedC31lA3u0i355OsP/nF0eh8TUjf7xVSafhCqQy2PP0HfVHR49P7TE+ysj5KlM+/XV3r9+0D1D3hJEtQ+p+WMswuZ1EbHRRl6HWU5YX6nznOoAQU/QVtcAsk7RIbBWx/YVXPqWKYFqCq7iNnxIjc05PUtHZKaXFt7rCjs80cxSVb4qx6D42PkRAo7of1zkYmRFE8Pq7SoIbqV0A9hIlzrbOiS1HbEm01oTO8VwtbiJxWU6tB2RNiJBHIZqnPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg2seKycPIEzThv85Jrn6cwmRCR4Vh9YKpDvGPAIU5A=;
 b=JYW+zd7MvAmb55oKYxngEGzWQXWR5ThksZo6soKxsRnUkmohZ+Hy3o1gB0zoakUYSxp67W1UcYz+D6PMzELm7cICfmwplzR6PBcH0o7xGo4P+byzq++fXKaFHywE2Te3BsFiZ8AIUQPKG7HvHWeCoQ8Woz3jSP2On8faojnor6Jv+7gUqc1BWu3AQAjl0tWt9Plc3czqDleX8qWjBjD1P95degwJXohm+rUcAfU9ZSAvoTNFBPLc74spABKCKHSMAoMyrHk+63AuQPlDkUoNd1bX33z2AWpe7Pc5b9+QoyJGkmf2zUnX8TURo/Rl1jlXjy1h0kIM2e7+v4s7Lf3KIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg2seKycPIEzThv85Jrn6cwmRCR4Vh9YKpDvGPAIU5A=;
 b=kJYUcN/FLgsW1MOC9wA7uCcoIfy1Rz+DLjM5hC/oJK6y5g/iZlC0xpPRn/aFzD0MWTyYAeSdX5BPBnMX9P4XWpkq8Q241eSSAvUNBMIQGnbzJ9Jm3noEEf9XMRIUJ2kKUAA9g1FNZlOkflSTMO91eqm4jy5Tjx+TJM26ObXun5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Tue, 4 Oct
 2022 14:55:57 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 14:55:57 +0000
Message-ID: <fb9d0d91-3919-ae92-c1ba-733b0a1206e7@amd.com>
Date: Tue, 4 Oct 2022 10:55:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/amd/display: Remove unused struct i2c_id_config_access
Content-Language: en-US
To: Yuan Can <yuancan@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, Jun.Lei@amd.com,
 Charlene.Liu@amd.com, jerry.zuo@amd.com, agustin.gutierrez@amd.com,
 Nevenko.Stupar@amd.com, sancchen@amd.com, tales.aparecida@gmail.com,
 chandan.vurdigerenataraj@amd.com, aurabindo.pillai@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220927133908.103658-1-yuancan@huawei.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220927133908.103658-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:208:23d::12) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 268ca9b0-6c2b-49d8-00b8-08daa6188b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WiFHoeEJ1X3PXRR0R8OkZJSVR3eo124tiH8NrwqKxDgH745Eyj/F5DdJyTOZcfd2PPJODodMKeioCqPHavK9UQerG2f4sDxmbAx31QR00MhX+of0x+3lbd7E621LNXbxstmLqdNCI41G5NGdFGnjHW3uPqceJIDDGzhVNPzwz74XPRb9jsLUhv4485f/7RMRd1rR5x7E7cgveQq43oZMkXHNvCS5TOkpSowT5o6g8MU63GWZUL14YRnIiBzTHmry293RtVi2L/H+2fXGxmk6w7q9iK9nDaF9rvcNmLO4W56l8/vKT9Gc2ctkKDZR4f6iRCCq0cgIffvVlVMeNqVupZUJuH8b57SmWf1uXsweuw2niVYEa0lVFwhvgq2y/nckFDIq+ol3NVeep+Lj1T5WJIXwpDas4Pys2IzRZkwFv/TfSZxdHxY1CPskM4fmmWGI9CX86MpSMBs7gKcn0lu1X0euXzUoqb3xHnJq1NYrX5dl1xZxYY4NXcmnKhKz5kVZIdL4p5pc6PnIH3Ld/O9gAcdHQRV1piPBltoIaA7prUtLj4zPVUh299dfq9rtjbCELRPgioTzMk4e7vGNSR+4p4FVTzqxvDswfkne2xWaNqbHtIriHdLt3Rjpky06ex5/T4MtaKkxo1IWhCZJKavd9UQ3rbodULVr9uR3VrMMfrGzZudJFqfabwQ5rvwpmcj3OiauQNWyXJR/VwmKsfZ+5HfXTw5E4P/I7ug1/G+QuIxOvjWJfWjk3lMDZrObQAWbXZ4IUXpCZ7USdJ1wri1udyBmHzKmGrTGl7QiHOIRpzT7Wi2jDXsdPbbEYYdTqGB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(66556008)(66476007)(2906002)(66946007)(83380400001)(186003)(41300700001)(36756003)(26005)(6512007)(8676002)(6486002)(38100700002)(53546011)(921005)(478600001)(31696002)(86362001)(6506007)(316002)(2616005)(31686004)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVQWHBmY2ZKdU1wdHMrT0dLamdCUExHZDZrbCtrOVRiRDZVdkVHWTh1Yndk?=
 =?utf-8?B?NWRTVTh0OHNHSzhibUpqSE1nMnVnR2JjdWt1UmxFdG91MDBCOTU4bWpUK3J3?=
 =?utf-8?B?NkdQcVRaQVlJK2tzZTEzRXZGblZsd0lEbEZpQTU4TUhuMXNZVDM2OWh2c0gv?=
 =?utf-8?B?QlpjUEhLV1N6cGc1SDdMU0pSMmxOcStocm0xaHJKWm9PRndURm92b2dnbnpK?=
 =?utf-8?B?bHN5VldYbmFKL0ZrQUFyV0JvV2NLbWlIbXBoVlgxREs5MzdsOUk0RkZXaFZr?=
 =?utf-8?B?ZUovSXA4SVFqZUZLS24zalFyZ2ZRSHE5ZlpIUnNoZnlVTFN6VllneWFKZFoy?=
 =?utf-8?B?TCtZTG5ZVTBtVURWVzRFQ3p3N2lhcXJDNTFCWldvT3NzUjQxVWc4T28zY1VB?=
 =?utf-8?B?NWovbFFMYkRpSGxHNTFFSjJsTXoyR040VjdsVGFGOU4yRWduZldkbHYyWTE4?=
 =?utf-8?B?NkVwUnVHdHpRRDB1VTE5RjhnMGZFUHJjNjk0UlB5VWJDS2wvMktkUitxT2lR?=
 =?utf-8?B?bFZYTGJSVEdGaDhGRmZzblFjTlpSNzRneHpJUEpjUjlsbEpCTmJLMXo3UUFx?=
 =?utf-8?B?amxqZmxYT2dtM0UxMWJybWo5MEJzdjR2ZStxU0k1VUFYVStmeGVBKzJucitP?=
 =?utf-8?B?QVV6aFlBTDF3Vjkzb3Q4K3M2M1ZpdnJPSHVCeko1WWZuQ0gyNi9nSmpCOXhX?=
 =?utf-8?B?cFp6Ujk1VzNuRGxZaDg3cmdpQ004YlBPTDJnZ1ovWkFOWHdOYnlHOHRBMXJU?=
 =?utf-8?B?d1YrUkpPU2FKSStOamNrZ29rd0lPWmgrKysydjlqOGZQTnFsUHk4MGx4Z3NF?=
 =?utf-8?B?bU0yY2tZcWNhVkxBV09INW04Q1Y0TTloNVNvVUZ0SmhseEFlSFdlWmVpaXVv?=
 =?utf-8?B?eTNSWTN4dkdoa2htYjAyVWM5dzVpUFhEZVZWY3ovTDVHR05JaWRFcHZWL3Fp?=
 =?utf-8?B?ODk5RHFXQ2Vkd3FiZVUwZDNtRzlnSUFNQVNaQVUweG4wR015bTdYQjRtbDBX?=
 =?utf-8?B?SWdwakh2NFJpSG5MT0RCTGFFZFpCbG9FcjgzRVNCQkRQTFFkLzAybU1QTE52?=
 =?utf-8?B?eGw5U2RycmRDYmRmMWhKeWo4bkJwWHRPV2xJZndHRmxXbzh4U1A2YlFzcHp5?=
 =?utf-8?B?UFFpS3kxZXNlOEFOSk81NEYzQkxBS1NoaG8wdnRGcmp3S0RXK0o1SzFIM3JV?=
 =?utf-8?B?bUt0SEVtc1BmVWowUlpnekRnY1o5azBJK044d2p2SktDbythUXJIZjhQSzlC?=
 =?utf-8?B?QmhyRmhFTzVDZ1pNenBYNWh5eUk4VGZHaDE1RlE0UXA5RTRaQTZRZElxQk43?=
 =?utf-8?B?VmZYM2hhZTNZNzZBcllDM0Q2MzlMY29VS0VXOXBxMUUwZ1ZCblNmMnFmZHZU?=
 =?utf-8?B?bTc1ZzBSTEhoVEhpSEgzSjBZbTNJRjgzSWNhdkZBSWU5YW9nRHlSaitJU3gr?=
 =?utf-8?B?RmQ1clFmTVdNdXluWHA2M0t1Ni9BUXNBMzZ0eWd6cGRRQnhlTXB2QlYrQWJz?=
 =?utf-8?B?em9IaXZBRGVtejBNeGczUnZkZHZXakR4UUlnWDh6a3dOQzNQOWlGTCt2bGZJ?=
 =?utf-8?B?bnByNHBUd3NrTnp3dFlGajZUMUNmeUhCWVRoMU1CL2RSZU91NmFPMEJBS095?=
 =?utf-8?B?VmI1VkRWdnQ1NmpDd3hOOVhTWEROVUV3UUhFdWNqM3haVnZxb2hRN1pXaVhk?=
 =?utf-8?B?aG04Y2Y0ZE9reEl2ckNlQjRYVEFsZFUxSUR3R2hVb1EwRHBxYjc5dytvT3ln?=
 =?utf-8?B?VVlhVWR0QmRVK0U2ZDkrSVBWNEpMalVSVTZmaWhBeENUc2FBU25QaW4ydm8z?=
 =?utf-8?B?ajRzYnFJaDR1SnZoWnlzWG1RVWpIcVlpU1d5R1VDc3BxR3Z5TUg5emc5UDEz?=
 =?utf-8?B?dG1qUGxFOWNWVDd1d09mYXpPVWxndkxKblMvZnlnL1MxaUVxOFlyR2VGL2l4?=
 =?utf-8?B?cVc5akNWVjBQNGQ5dGRkL0RPU0svaHlyM25rUHBVVnczbDRKSDBGV2dvbUNh?=
 =?utf-8?B?VzdzRTFtU2YxZk9GM2J3QUh5QmZ5VDUvK2k3TTNlK0RodXc4bnpzQ0pLZU94?=
 =?utf-8?B?R1A1WGk2azJWbGFXQ1NNUW5oYXUxUll5N3dRUjBsTjJjQWd0cU1EaktsaW00?=
 =?utf-8?Q?xunD8djYl0dfjB40YeglRkyyW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268ca9b0-6c2b-49d8-00b8-08daa6188b17
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 14:55:57.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeKQiyZVzTeuGB598WtClSXlqwIeSMTSKa3vxDJg5drGrCIajY4NlKvkbqJv1NxSEmIrciQKACcZqodZUlQBnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-27 09:39, Yuan Can wrote:
> After commit 5a8132b9f606("drm/amd/display: remove dead dc vbios code"), no one
> use struct i2c_id_config_access, so remove it.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 5d70f9901d13..d380cf98b844 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -50,13 +50,6 @@
>   #define LAST_RECORD_TYPE 0xff
>   #define SMU9_SYSPLL0_ID  0
>   
> -struct i2c_id_config_access {
> -	uint8_t bfI2C_LineMux:4;
> -	uint8_t bfHW_EngineID:3;
> -	uint8_t bfHW_Capable:1;
> -	uint8_t ucAccess;
> -};
> -
>   static enum bp_result get_gpio_i2c_info(struct bios_parser *bp,
>   	struct atom_i2c_record *record,
>   	struct graphics_object_i2c_info *info);

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and applied to amd-staging-drm-next.

Thanks
Siqueira
