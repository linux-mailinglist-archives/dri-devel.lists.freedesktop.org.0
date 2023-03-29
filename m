Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD26CEEAE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB6210EB7A;
	Wed, 29 Mar 2023 16:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF2110E554;
 Wed, 29 Mar 2023 16:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/hjzYa0lg22yk9nudWpaat/k6vT5B9K4OsI6/mU8Mgy8MKevF/rwTTp8UeK8pBa5Ul9OcQJMoejGAgF7AvU4YlM+Mf8ytdZf6ysZXVoezmMXkuicM9HhG4WRPwijFVuBaCxE2+8fzRF2OzLBJwH3uDzMytfnA5fx8Y3oDoYGVKJlk4EwN0w1wUWUATnGRoyvPFaK1acvINY8oOs8AHIWSTOoIVaQs5yoUG7CIYHIm11LTU+Is7CYMLXS0GPbuY19O0A6fEoGA974rGiDW+FhLRUWF1FEShCRA7QoSKmtmT41xuzzxCdzeCOLrWIuM3j0CAAd6S3P4q+69FWsVeV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSFNW5/iy3IqzMtqxLLMdgcYI0DEp9x+YdHiVh292XA=;
 b=Av/GXGb3J0herrWI2hVoWO8PKi3b8Jmk7Y5VWqHHwpaHn7Y6NLMlgCa/j4G57PZoAfJn2+Lh5e3NEnpmA3W9bxnfirmT+684oWIHCCNAxMW0/RlSTK06CmRxEHqPEPpO4toJBIxfyz36OWvZq6UVJdBqxo9YJ33LlGaLw23dvHtIh0QPZmh0Pn5vL9PDesH35VBFj8ylzsib12EWVbWYebZ+ccdx4QXL6LKIrqKKxA4CFQLOAtbSeFDG3XwRBpzyBs3HkdwL4egCVVTyQ6NIYEb8olhjrVnQ5jSEpyNJGOzvyHXgmcBE1a0KtS519uRN02tlQV+zFhclRZ7VzPjbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSFNW5/iy3IqzMtqxLLMdgcYI0DEp9x+YdHiVh292XA=;
 b=vILaDK2j+cngLlZdFB2vv2R4y9DdmUFbKmqnFOt33cTnKHY9nchx28uJsFDS3S1qBQLDkrJd0jxWBG6r5NgpjwY6CJT8wQQ8MbzH9bcNT9oioMpxQgFUn0RyCQhy+rw3Ow5XLIx96U+0tVZ+jiFWEFcc6cwhp22KVVushM3pEWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ0PR12MB6853.namprd12.prod.outlook.com (2603:10b6:a03:47b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 16:06:38 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 16:06:38 +0000
Message-ID: <fba14fea-787b-c5b2-a72a-ab802f76b3f7@amd.com>
Date: Wed, 29 Mar 2023 12:07:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] drm/amd/display: Add previous prototype to
 'optc3_wait_drr_doublebuffer_pending_clear'
Content-Language: en-US
To: Caio Novais <caionovais@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230328220947.108188-1-caionovais@usp.br>
 <20230328220947.108188-3-caionovais@usp.br>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230328220947.108188-3-caionovais@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::42) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ0PR12MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7068e712-64f1-4099-43b5-08db306f93f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+WxI/2tNDhz7oneE57UJA1xEc0h/1opvAOtw/PZXSuz/5CF7yXbJLq6+DsCgFsl3oRFAuFHw3R2st32nkEU/wmKlSTnpzx9R6dqzGDfA7jIUohAJZ8qY37q0e+r6YURIGwBOqOj1JZg8EAJo8mcVJzvbrl3Gh+AXHKPueZdwQ7vwta078HCp9R0x0cCy00LPMQFNIIwXbJ8borvcnxZOKFUFs+OSURi+wQHAeN+5iYHg8cApMJFvJs5/UQKPpuf1AutNivGGl9xlnQ5sDz9fpFIBu3m5niYEAkQLx3gK+DtzJkozyNtvxuDHZLKYiqPOnLmQ8HVbsb+7wi28O4Vzlh/aHi5K6cfBCuRHvHX/uPs2tVYpzfvpKK1rO3XPKbWDTIwYo8/LwNueKhi96DgdnYVJrS4ukuz8IYhww5sC6u/q1py9GYi7umHZvdfi24VcpD8kaa2GbgupNKQwBHjqC53fLFr4OGNNJf/xBvbpwtD4YWwpYES5LsBCpilWcILBf7vPv2I+N/HSo+BMH9KUK91HqYtK8wKYYG/jsJoS744Nm/WBSTnXaUbrD/hzGGI1gm+LYu6Acm/nkeR+Yq0JlMEAr+Y2GxQbA5hjzMMT9xbyJPFvqPIeuGt9SXzjpsAVyoOusI/6XZ/me3V33ykig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(66556008)(8936002)(83380400001)(66946007)(31686004)(38100700002)(44832011)(5660300002)(54906003)(2906002)(8676002)(4326008)(41300700001)(66476007)(316002)(478600001)(2616005)(31696002)(6486002)(86362001)(6512007)(186003)(53546011)(6506007)(26005)(6666004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJJelBZZ1hGS2VXVG9vWDJwWSthL1NkdUtlN1VZbWRsaXE5dlpHQ212UEVi?=
 =?utf-8?B?MTR0NFBvMmVkSmhXdFNuVjBuWFFMYkZNUWZzSkd3cXlYRjlQTVQ3UyszR3VS?=
 =?utf-8?B?cGhEcEkvZW5yZnRRcU96SUJlMkpsTkZOUFdiVDJORmZONXlkU0lyQm5KRXJY?=
 =?utf-8?B?SjFIbVJxRiszeVJJTnRqb2hycWpHdGIzZnp1Q3l2OTM4TkEyZitEbE1wazJ5?=
 =?utf-8?B?R2Z5dVlOSkM0bVh6aFRWd3ZzcmY0V3dOVm96RS9yOXZ5QzdtYms3bVp2N091?=
 =?utf-8?B?VVRDak1FRWV6aU9jYkI2STZ0N3h3K3JseG5xNk42UjBZNjR6M2U4aFFiUThG?=
 =?utf-8?B?VlgwUm1iWnEzcE9XUS8wZ1R3Qkk5bkxBSEwrYjNCVU5ST2k5NGEvSGx0TFFn?=
 =?utf-8?B?KzZpL0hDUGg5YlRpYUhNVnlyUGpGL2tPQkFXRGoraXZvOHVEUmsvaEMwb2lu?=
 =?utf-8?B?cm9IQll5MmxRbjZ5S3JuTFhncFA2VVMrbVAvdEcrTkE2RjNQM2NYOVhha250?=
 =?utf-8?B?RTZjNUZ2RTJKYUNVR2twMy9OcXF6VVJMOU90ZGdqaU56NWFQeW16NS9OQnNX?=
 =?utf-8?B?QW44N2RGQTFwY0JIZEpjUFQwNkxvRDc5Rit1TSsvT0o4TE9iNFBRcjRkOEZv?=
 =?utf-8?B?L2Z0emxJUHRNcHY1TmR2NmQ4K0ZkNTM2ZXZQMHpEbUJMNStqUHdIcHRJREJl?=
 =?utf-8?B?U29XNmJTWjdaUy9XZ3R4NitONUhCd1pIL3NUeXBXQkhuVlk0akMxUnB1RmtO?=
 =?utf-8?B?cnlDZzlBbUpWN0V2eTJrTEpSOTBEVkc4NzBaQzlzMi9IVEJpQXZ6eFBJaWNt?=
 =?utf-8?B?ZXFMS0Y4Q1ozOENRcjB6WEREMk80M3VlcmVmSGVyQzlXaTArV2xjODNxUUdu?=
 =?utf-8?B?ay9jZnhIYThsSWFDWFFaeTc1TFlXUExtTEtSajZDZGduNmgrdTgzdDBpYXhu?=
 =?utf-8?B?ZGlPdjBvQVlhbWpiZlNuWHk1cHVrN1h6Z1psa20rUzVDS0IvZFVhVGVOR3px?=
 =?utf-8?B?d2o1OXd0ZVZWdkdyVWZtbUNMODBqRVcrcEtlTkRiNlU4SnV4elFQZWdFRmtn?=
 =?utf-8?B?VGVhSlR0MElQbkhsZVp6SCtQby9jREpEV0RnYTloLzZNallWTi9YVHBKNnhX?=
 =?utf-8?B?UXpkdWFJQmdRSFhkWWNsWnpKaUVYbFIwbjZCa05mZmllRDE1WkVEa3dQbXYy?=
 =?utf-8?B?QmtBTGhNMzdrTXJIRHNhWC9xbG9saC9TQWxGRFdod1BvR1hweHJKbWlFdk5k?=
 =?utf-8?B?OGY0Ny9qQjBFYTZrSzhVSnJFMFVBSE9udnI1VFJnV2tERkRSNnROellIWkZo?=
 =?utf-8?B?N21tdWw4ajlCdFd4bkZTMzNNSGdBcEgweXBwMEdjZGZMaHh3Ym9YR3ZkODFS?=
 =?utf-8?B?N1JycWtyNHBxcFVBSmFQd0RkaVZwYlprSFRJRmdHYW9LRzlXTzJ2UVFIVmpC?=
 =?utf-8?B?Mm85dmx3YURyMlNpYjkyNFNna1dDYXZFVnFsUlI2b0tBT3UzMmkyRW0vNzN1?=
 =?utf-8?B?clRqbGxqOHNhQlV4aWdTZUtMOTcxemVtdjVrRUlEcWk0bEdzemJ2RjlBTDVi?=
 =?utf-8?B?dWlGTmROcUx5NXlrUUVHWm5ITlpyMjBoNFN4T3Q3YVc1YkFPenBNeXBIODRk?=
 =?utf-8?B?QlR6MGpHbFJuUFpqYzZra2F6NXBrVXp4NU9iclBSbVprZjNydEhzN2RwKzVp?=
 =?utf-8?B?eW9SV0dCdlpGcndodFpwVE9kM0lVbm1Xcllib3VIZWFYNkFUZzNaZHFpRVgy?=
 =?utf-8?B?VzlEYnE2TWhuVHg0OHIzZ205UVVMYXV5c1VYeGQ3QllqM2dqcGh5TkFTaHlR?=
 =?utf-8?B?SFN4VFNWWXI0OXlKYTJGVmRSVndSclRiZld2dWliUmtoR0JwbE9FczlzV0Vy?=
 =?utf-8?B?WXhKRW1UMnM4em9pVHVGS0tPaXlvaFZpcityMW00WFMwZG9MRTIrZXZzejRS?=
 =?utf-8?B?ajcxbDNXOWdLWW5CM0tqRVlkRnBOWWtvNmowVHlrcE9QZjlLSXRSeXNJMldC?=
 =?utf-8?B?YktLTGFPMnpIRzNMR0pQdHRiU2Fud3l1VEcvdmQyWHI2dVJoYzRvZkRLaTl4?=
 =?utf-8?B?OFd6QjZyYWpRZW9XeEllVEZLZVlmWGNxTkZsQzIvaGpXMWtyZkJyS2dJWWln?=
 =?utf-8?Q?Z/eKtPYiK95sPHlnWTpQeoAas?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7068e712-64f1-4099-43b5-08db306f93f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 16:06:38.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNtchfnCwrG/qP3thYmgWvEuhADna15wLXNGa1hPZCOawBjnd8gSb6buEWcVUN+qFObUZ+iI2A4/F+9ZfsJaCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6853
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Deepak R Varma <drv@mailo.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/28/23 18:09, Caio Novais wrote:
> Compiling AMD GPU drivers displays a warning:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for ‘optc3_wait_drr_doublebuffer_pending_clear’ [-Wmissing-prototypes]
> 
> Get rid of it by adding a function prototype
> 
> 'optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc)' on drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
> 
> Signed-off-by: Caio Novais <caionovais@usp.br>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
> index fb06dc9a4893..2e3ba6e2f336 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
> @@ -331,6 +331,8 @@ void optc3_lock_doublebuffer_enable(struct timing_generator *optc);
>   
>   void optc3_lock_doublebuffer_disable(struct timing_generator *optc);
>   
> +void optc3_wait_drr_doublebuffer_pending_clear(struct timing_generator *optc);

I would prefer if you marked the function as static instead, since it is
only used in dcn30_optc.c.

> +
>   void optc3_set_drr_trigger_window(struct timing_generator *optc,
>   		uint32_t window_start, uint32_t window_end);
>   

-- 
Hamza

