Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F26872046F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 16:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007F110E174;
	Fri,  2 Jun 2023 14:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A710E174;
 Fri,  2 Jun 2023 14:28:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5x2j9S6GklW4U24eT1H6ydp4FAe5S3/am76bPlYJBjSTyXwpsnte5HCDyi1Wn7lZ6f/jeX2wOFXoXe+snBjDs85V2eCgKiQn0NQalYpFV4BhUn225pnKg7Yom3uWVopVPa3S1GRTWNzE9kD6n9zOgXoB0av4GV3vYyiJ7NhpawGcqBJmzb4oVwdmo5IUKbRkFP84fQ7kwIeGQdW6WDoqvxA8XM6Jd0OB1Q/VVQrQlYTDDwMIp8qSlNNzcbu6f3sjhkYNg4vHedDuxeEkt9he02OBz+5n8+VwZHpZrK8Ar6SKCl2xa2FMqdxgmkhBDJnGbelhbI/iSINGmgBhqarBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndasDeuxVxyIiMmhI4vf+nIa507+tA/OTjuCtfv63Sg=;
 b=jp+GVYGuql4vMeFNizNS6HaeGJzbZfcIXNrwz4aWWLnodAdlxFqaaXXK1pqEv7l9XHG8+tp2NnGaRhzomp0Abal4unHoPh1iYQxrlDRuy9T2XqSjACTWtE9UpX4bBgqmyGk2twhAqp4NLe35UfZeXb5o3gKKxyoL+MAzkSMUoArgTd7wS0sgkTPYy1Cw8bnLBnswwRPKLuGKhhEYaDSJtkwIqx9ND3ptA9a3zW5mOwFW633AWxduiU3CBW75Ex3P1wWWqlObSO2Zjcj9OUgTKPO7OTNwcggHdKDvt7KAbIQ0bV51tV4ul+1AnWpwre95L5wN7irbCVd0aq4AqxcDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndasDeuxVxyIiMmhI4vf+nIa507+tA/OTjuCtfv63Sg=;
 b=1Ar+8z0mEzDB38gCZZvkNj4Ju2ZazHgQcgmjLdw88E/4a9Ma7RnZaWOmd+eE72K4Imsr7uJwOadRB/EdFcdND6HU1YPSj6gxGjn5OoDJyn0YSw4qPf7SutgDDW7iS7KbULPqlo2lkgnxF8HoJgV+EqS7IyoRg6rBjEqn39WCj9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB6584.namprd12.prod.outlook.com (2603:10b6:8:d0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22; Fri, 2 Jun 2023 14:28:17 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 14:28:17 +0000
Message-ID: <7e8e0a05-68ae-1a93-4f1f-1d82305a504f@amd.com>
Date: Fri, 2 Jun 2023 10:28:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, alexander.deucher@amd.com
References: <20230602061753.116781-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230602061753.116781-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::38) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5aab85-a630-4d6b-f6b4-08db63759b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TZYHlFjfBw9D6tUJk4Zx3esE6+BCwUw82xzQI4S0rqllZ0Vu5pVExKlsMdCVhM9gCNJzDwq5LxwJiyEnGbBQOwbG4dK4UWK/4IRWXEXy+q+L4D1kttakNx/h3BAzghA2mF1DIK9ZN5z9BfuI1VGcSB6NpGWGSycsuD24TViilyxuMEoYqmPLSRVS4fy39tfNkpe5GoatO8xe77lnRp3vmHyZVrAFHQZTVlzn8ozib6eogxyiWiV6A1HCUqMR95hTqS6se8zrFLsrE8qvMzcY8FLCibTkqgGwDPdceUiBuME5BDjX0OGyujbL9VBI/m4NwvzqX+wZJYCAAZx+fCEoXlw4YI+E7NdRp6R3UtN0cxIFj2Dl+cFJAlJonyMzJ70snt+1jvl798tILejC7XjNICtzHKwqb7BQz/zp1TaCqxt8TWcpsfmzIDxkzxgOv7mvzcWW6obSq1RNAeiO+8nMeRBFo916aVjlPa+JCGmGHd4VU+ezmmlRQ+lIS9IYS3rA5B+kOgFLCZJf+XkxzHAKaxY1IeKOlt05ISGJSUpPYVLHK7b0HpGX2ATwDmjihWcqfoohnzLo0zIhOSYlg/VUvhfcr6yPLuQrUe1L4ntFd8Zs9iRhMSS6cMNi4POF/ppX5SdoInc51uvF7m3E0DTAQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(83380400001)(2906002)(66476007)(6486002)(44832011)(66556008)(2616005)(31696002)(86362001)(31686004)(66946007)(41300700001)(8936002)(6506007)(26005)(6512007)(53546011)(186003)(316002)(5660300002)(966005)(4326008)(8676002)(6636002)(36756003)(38100700002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnlDczV3YXBaUjFIVm9uWFBUV3NzWjhFUGRwM2hTTHA4OXcxL0tDelFqM25Y?=
 =?utf-8?B?UFZuR1FGMWlNdWtaTUdOQTZBdDV3YmdtUzArY0ZONzlXN09rWXJVM0pHZE9O?=
 =?utf-8?B?eENNYWFnaHhnSVVhMmNUM1djMW1MclZoWDZWWlJrM0tXV2YrUC9BUWRnb3V0?=
 =?utf-8?B?V3BLdzM3YXBMczhvV1U0RjVSOW9OMkk5d0hHTUNheEt5c2ZUdVZPTXhQUE9M?=
 =?utf-8?B?ZnpGMW5Gb09CdE5TZ01oVWRMNzlmcnhucVE3SElFaUI4Z010Ymg0RjcvYmJt?=
 =?utf-8?B?a2pzSlZPdFBkTGJBQ3I1alFnYzVNcXNTcnUvaklJN2NEekpMeXgrTUxDY2NR?=
 =?utf-8?B?bk5iTlRZNkhOR2FkYnJGSDdYb3pEWWcrTUZQRmQxbmJEMGc5R3oybHpqVDBw?=
 =?utf-8?B?dDFmQlJHeVZPQlJSY2c3djNyTWc5V01PaXd6YVNpaFlDaWk3VVdWL3hmbTFm?=
 =?utf-8?B?dERUS2RlcFRFdGVtWDN2RWVTRFAweVluSkNKL2NOdnZ1cHpiTmhESXN1SktN?=
 =?utf-8?B?WnZNV0hvaVhtQjdLMTF3MDJBZmhpZ1Z0bVA3YXJtSWxibjlCVFpEVDhoRURX?=
 =?utf-8?B?dmpybDFQQzdVRmhHY1N1UXd1UEVwWWNXL0c0aGFIRGRpTUxWb0tJRXFxK002?=
 =?utf-8?B?TzRUYnZidTFjQllJbVEzMGxDc1JxRURiTHNaMmVqdlByZFFnc3lWK3h5d2FI?=
 =?utf-8?B?QXRXTy9ENTdwMjhEeEl6UzVxWDBMc3g2bjhDQ1dVb0pVU09jMWFKZkZEcXFi?=
 =?utf-8?B?WUNYdmVJMUd3Q05mSG5lZkJNUWp3Y1Q2cU9DSlB0WVpVbS9PNjR3UTFtUUVj?=
 =?utf-8?B?MGczaGVrYmpwT0p4RnNxNzFsOWdXWUY5bnM0TTV5OVdJVzhUcEZKMHdaR3B1?=
 =?utf-8?B?U295WXJEa1F6blFidDlhck9xZ2pWYnJibW1BM0d4dGhmZDFlNVEzVFMrd1NJ?=
 =?utf-8?B?N0JRVE1nNFNvaWswTDNGTUhQMWJsU21wRTFaRUV6bXh4T2ZmZ3JJdWVFdktQ?=
 =?utf-8?B?TW5tblZjWDlrMmMzNFgzSSs1aWVVYWk1N0VETEFjdHNnczhjS1hZYldZVWRn?=
 =?utf-8?B?VVZ3ZG84aStkNkV5Qm92VEpRcXdNRnlUSVVvdjZFMjlSbG1wUCtIQm1icEtC?=
 =?utf-8?B?bktRRG9XMXBYMHNTMzZOaXBIY0JRTDVaWk5aR1ZtcHBiNGprc3hETGdrNDJS?=
 =?utf-8?B?UDdpM25jYzlpWTFaVE5wM3pCWnFDMWVSTVVkc01ic3hONUxWUGVtczRBQ1VY?=
 =?utf-8?B?di94Qk1MRStaQXVaUW4xUkpvck9JMUx6TmRJZkZwL2p5UklGSCtFTTlQdnRX?=
 =?utf-8?B?UHZTRUY1bGlBNjFPeXVyd1pOZFQzWjNoZml3RjlhTmdJbGJJdWZoNDYwb3Ja?=
 =?utf-8?B?NTFjSFlCVWk3K3B1ajl2VWdGWGlJdVJCY1BpS0JZbmdZenBpc3YrM1VNUjJW?=
 =?utf-8?B?cUNwOS9MQWM1cHBaZ0RpUFhGcFgyWFBPcUZMRHpMSDNMQnp1Rnc0Ry9aWWZr?=
 =?utf-8?B?RWlxdXpzYk5pM2txbXYrNTE1b2ZVaks0Nk1xU2sxRkIrc1Y5Zk5rWXp2Z24r?=
 =?utf-8?B?UEJFYnBONENPMGp5UFFXSWJ2MmdlL1UrU0QyejZBMzVDZ1lwcnNwVFBkbWZT?=
 =?utf-8?B?UUtFM0xrcTBlRHVFN2xvQWN0QUluU1dNUlpRSUFEQ2Fja0lRNkxndnZ1TStI?=
 =?utf-8?B?WGR0M3NhVTg1S0Zxbk1xSkNWamJMdHVmNVlWQTBTalBkcDMyeXhmczZqT2ZI?=
 =?utf-8?B?WEJUeWd2NFVMVFVybDhEaDRSSzJKb3c4VmFma2FqY2s1WHVyZTZLa0M0bHpx?=
 =?utf-8?B?WGcwTnRReGZpVi9zQW9nTkVhbUVFY2RHVFpmaTc2Q05PVjRsYVI3dWsyV3pX?=
 =?utf-8?B?WFM5cmV1ZzNhU2lqZm5UekQwYzlhMG1KbFp5RkpMUmJJWmhQRkR5dm12c3hB?=
 =?utf-8?B?WklpaDBTelFPNitZcGV0WE11QVdkZmtYQ2pLODJQblNkU1dSeEdLY05UNHhm?=
 =?utf-8?B?LzA1d0t4U1BEQkFwQ2ZLam5HN3NYdWZLUXZydG9leCszYXhVdkNsMEkrRGlm?=
 =?utf-8?B?MW83akdqK0lSK252MW9TU2JpdndlbGZtVllYZkc4YzJHNkIwdEdQd1ZsZzZK?=
 =?utf-8?Q?/Ml5b8RIg/zaVwAZvPtPxMZEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5aab85-a630-4d6b-f6b4-08db63759b8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 14:28:17.7316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiuwwOx/Ge8+PobIRt3AlGaXs8In3qD1FnE5cP4OpOFZEBXnLJ6HnWHj8UYVVtFwoObZg2nylCvZrlTGDm0AjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6584
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/23 02:17, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2377 link_set_dpms_on() warn: inconsistent indenting.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5376
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> index 2963267fe74a..f7f1a1586f3b 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
> @@ -2374,8 +2374,8 @@ void link_set_dpms_on(
>   		}
>   	}
>   
> -		if (dc_is_virtual_signal(pipe_ctx->stream->signal))
> -			return;
> +	if (dc_is_virtual_signal(pipe_ctx->stream->signal))
> +		return;
>   
>   	link_enc = link_enc_cfg_get_link_enc(link);
>   	ASSERT(link_enc);
-- 
Hamza

