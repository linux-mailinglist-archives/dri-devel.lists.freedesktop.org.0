Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40689716F55
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 23:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264010E42F;
	Tue, 30 May 2023 21:02:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06D10E42E;
 Tue, 30 May 2023 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685480569; x=1717016569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AJOgFBGgT45Q5XXd5cpPfgSrdYt/nkriCpshUKNka8s=;
 b=M2bdjEycNUDiG7UQXPNVEDaA39bfkt0JiKA7V2y/3hYP1A/l5bBRCTwh
 YV88RveK31sekVv5X45czUSWOsVaLN+lIFxYhMJf3NZClrnir8h2x5mei
 PSnMA5uzm8cxKNJVt+1LDtAjW60IioSlq3TAbdoKn9wq+8MAr0IJG7F27
 nZSBnz/0ZldXTMHz/hOVKQId1JngadAppL12krOj0TpQ/RYBz0MZvbIYA
 xDpRWw9cBRnzBVjE79VOJPzbs3FEM0u/nxloaP4LILEXv+Fmj4AOpvosy
 J+OEuAabJZipssPWwQnR4on9S3wPaS18aRRTweIsKaaMIHeQGuVNevfZQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="352545955"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="352545955"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="739656980"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="739656980"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 30 May 2023 14:02:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:02:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 14:02:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 14:02:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 14:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgjE41vqD13EVxS4mKBGwPjkLmF2VMwgl4nwU3JyvbOqxEskVsnl3D0gkBBMM6aBN5jwVeVLNq4Oymm3TMHRxgp7hZe1qVWaVjI3Qu9mqW6BNk+4MjVAzicWbZqrlrx9aN7uKHYe6gBDqac/dXK7WkrIlw385bCqAoN0PuktPftH1uHMysFjaIljBqZXosHQSY3miEjpvzGe8ILBk7gAqQf5NShT25YUwMXq0yGn7bB1S3R/C6RQUB7yXSxQG/v38F4bpV71XiTyQwfhZombwb4WVwCy0ihfq88REhk2Uy/nfRsKOP2HsfhZ7TzTVG/qpwg1lSBxoCIreit51RA9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJHfkDAmcx/IoV3mjbXiU7wDvPvl2HIXajA4K+Z9lt8=;
 b=EcQH1WPJx2fvEWQu6T2d6PF34J2cCEHlZ6qr4LTNz8psgmm+25MRime0rQVzjfs05ss5JhOKwyWAt6G2oUXR0q1YmZGpqtGgwvZtj4JM6e2Ln9BrhdEr4NmBY9eoWQsKJ0cwWNl3P6dPN5LURrUbVnpcJc2yFakKbwmhAp9S+XLuQ5wJUzhXJ46T8huBTILAmpY4F1qwLkvnQiohPhJOxi51lTKhDYx3W7TnVlVO9bGyZiUrfRlwOw9w7TIsJdG+tnxVeIF0VHV1N6QUMbfRrO7WYw+7AonJR3dcWOZxBfco7Bw0RXtOE+/LseLfjB0gGpeWANbyEDr8ldZiG9ZwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 21:02:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 21:02:38 +0000
Message-ID: <948849e9-b94a-a747-b389-1b359a1d3049@intel.com>
Date: Tue, 30 May 2023 14:02:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH 2/3] drm/i915/guc: Update log for unsolicited CTB response
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
 <20230526235538.2230780-3-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230526235538.2230780-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db6e403-01c7-434e-6e78-08db61513344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FShTud+QhsCAmkv4QmI+g2JjFwe4FpBsshQgJ6NApZccEf966QM48u3j2JVydQ9TT33ImZwGGOIqEgSn0bdt20CDpWUP8nXworHKx3BBcnHc7u8ODhsm5YF9Ubggyf3VK9b3jL407NV90whD8KOR9LL2lBJE12J11kD2b0MOBjBIv0UzaBgOveKxx/aHeI7IV9aJaxU5Gd6WPDnpaL9HJRUjmCuYVxCGPE7hip0ZU4mb42kiUaDz7b6klR5Rh3ZISxlTyxGXvNBCG/pqsoFwxjZCwd9WBMiUrITpp54ijoyfiDxWrrlNyiG/YJn/4X73MbxZqAZgiGhDqPRBmDZQYzGBHlG6L3Cx0O1kcnYikeqBi66b2j70IuiQ8o7phFYGeno9638tF1K2Xg1ICDgJrf+muP4VrSR/JexECun3kZZFceuxW8jEwaAMkJNWOeA9bPe+Cj8Zpo4lTVdbRqR0gDOF5BvLrOayniuporgKL7yUj/c0p5OtV1VdZanVfQUSbUlh3aF98K5nbKBcnMj2MTjzw1FvPZAyZ5yQMOvBbQG3sKIdPiZE3VxFhqOD9RCI1mpXN1g2+DD6vJXlnnlWDueYOtKBhqhbaMtlZjzYighl6sbp2MTQY86+HjcfXsgMtXCAn28Mu/Jv/LXYtbODVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(31696002)(86362001)(41300700001)(6486002)(4326008)(6916009)(316002)(450100002)(66556008)(66476007)(36756003)(66946007)(5660300002)(15650500001)(186003)(2616005)(2906002)(6506007)(53546011)(6512007)(31686004)(26005)(83380400001)(38100700002)(107886003)(478600001)(8936002)(8676002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3c3OENjbi9hZ212RWZ0T3hWek9rRG1sYnR5WSs0ck04czVydTU5VGFwb0li?=
 =?utf-8?B?V0luSU8wTHdiR3lqbmxiUzg5RERlaE44eDlXbU1hdVAvR3FBU2JxSWJ4RnFu?=
 =?utf-8?B?cG1KWXFPeHVUcFRzUU9mUkZTaGEvUzM0Nk92UEJtODhZeGFFRGRBWnlNRVVM?=
 =?utf-8?B?R0pkOWJ2bFdYaGdYL0ZKN09CMkZaeUhWNEc4bGM3NUpMUVJjQU92dWp5QkRJ?=
 =?utf-8?B?bVRCYjBESUZMT3VsT1hYeTZKaW5Wam5JMmszUHZMUUtXZTJXTThrazl6bEJo?=
 =?utf-8?B?RFlMTk83aHpEN2lIODdHWlkzODQ1Y25Cd2Zja2Z4bndPZDROb3VYK0RNOE9u?=
 =?utf-8?B?WWtmc0J3ejVvaWxITmV6SG9WWWN1MWUyUjE5SCtQRmpiSGc1NFRla1Zxek1z?=
 =?utf-8?B?RzlONWdzcTV5YUxoS29hcUFzWWc4ZnljVkJLNzk4TVBxcTF3MVB0cGhialNF?=
 =?utf-8?B?VFB5VE1nSWpMSE0yaWJxeFV0ZjgvR2s5R2JDVVpOQStvK2VyRDVRWE5wUld6?=
 =?utf-8?B?b0lOeG9hdk1lbkcxeFQzQ0I4VEVFbk1TemFVRGhWUEtBVVJ1UFNXaXA1WHZa?=
 =?utf-8?B?d0NyUHFOWGlNRjdWWWw0UDdka0ZIN0o2K1NZclgrYXNuY3FPZTRUWUJWMFNV?=
 =?utf-8?B?WGJkbHlvNTdpM0RpTHZGYzBVY3drMUcyVUliWk1ibTNLOXlqaitnOXpVZ3I4?=
 =?utf-8?B?V1RLME9GM3FjTVR0VzBuTDJLejRMOGRVaXFzVXVMTis0c2pBbUMzcmowdmxO?=
 =?utf-8?B?SkQ1a0NZRStHOFkzQjZIVVE4S2dSbWVMQTVwT0Yzc0NPMFNnUktmMGNldG55?=
 =?utf-8?B?VDVROGtnREV2S21vaVg0THBZb0ZQb2F1UEdLajZ4UFkrVHNzd3JpOGNQNG81?=
 =?utf-8?B?SUlGelg0SGVLa1R3MitkRm9waFE3T014VXdDdkNaV3lMWXhiK3F5bVNsM3RN?=
 =?utf-8?B?N3M4TGExaEpxSmZWNjJBanJORnJDbHFFRzIyMkpFZE5rWkh3VEFxeGdQbS9i?=
 =?utf-8?B?N0ZQcHpwYlFFYlNkdWZtL0tlREdML1NZSDk2RGx4VTNWcys0alB5YUhMZjlC?=
 =?utf-8?B?NkFtempxUGJsTmdhQkxlY3lXenM1SFVjYThOQmhPZ3p2SUVzUGpicktPZldS?=
 =?utf-8?B?Mkh2RzRickxXK2k4OTlBeWtNNEhjem82UUhYRzhLVjZPNXF1RXk3SUlCTEpw?=
 =?utf-8?B?WGxOVDhsaDVFSkd1YWNnUkV3bVAxN1QvQnh5Z2V3dThaaVdOMGhPQzV0WGV4?=
 =?utf-8?B?VUpJQVZ1bnBkb0k5YlEvMUtzWDRuN09DSTVWYytzbUlnTzVLTTB4WEt1Qjc5?=
 =?utf-8?B?L0dPczZCdnQvQ2dFZkdoSDBnV1FtUS85YlZhRVFJZHN2ZUdGTWNQY1YxNkE0?=
 =?utf-8?B?WjQxK0I1VjlaY2hCU3M3SUZ4S2kxUEVnT0daM0pGV2JJTFdxcWl6bDBaVzFR?=
 =?utf-8?B?b3ZzaFNkSXJNK1RNNGozRlZDR0d6UmhRN0d2NzJQUkl6NWU4UGN2RVNXeWla?=
 =?utf-8?B?TWhBZ3E0OWJpZ3RvZytNaXZjeUg1QTVsYjdkU2Q0R1BRYnByR2NWam5WYXla?=
 =?utf-8?B?amgxTzQ1cnFUQTVNa05NVE5Vck50SUJiK05UODBYM0pxcDJTZURsRWdpd2xn?=
 =?utf-8?B?RUVpSmVCbWVCNnFTS3BIZkFWNzlJNXQ5cWwreC9HQ2poZDFzQzNwTHcxVTRT?=
 =?utf-8?B?WlJPMUtpZlNBUHFwTCttOUw0Z1prQkN2bXEzQ09yWUNvQjQyZ1NncG1vak1B?=
 =?utf-8?B?aXBiT1k4Y0RscElCM1pGT2ZPUjBSYWx3TENYQ3djeFpvZ1VsTFpXUTBDcmZh?=
 =?utf-8?B?d2xtaXYwekZzT3FiMEY3WDR6bG9RWWhZNzQvNWVGWHNTKy9NVjJ0K2o2bzlJ?=
 =?utf-8?B?aVJiWjI5dUtFY1NhQzRFWFFXK0lybEJsRVNXRndmV3pxUjcxTjlvRnQwRlcx?=
 =?utf-8?B?NExLejJVQTZpUHE4dHNRWVpxRUNMRFBmNzZFM2JBWnJXeGpad1NNdXFzWXBJ?=
 =?utf-8?B?WXZNRFpqd1hsUEZsbzhBNmZtM1B6UHFMUG5DWW1BVkFqdDJnaDg0blB6YmVB?=
 =?utf-8?B?a09Hd0dQMTFLQ1JtUXJoYmZUN3FzSUgydjl1WkV5ejdwclVjQ3hnNlFKaGZl?=
 =?utf-8?B?YnZrZW5lOEZMUkQvR0QyZm5CbmFlQ0tpRjRaSGZjZVVsM0FySWFoRXdYVFVx?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db6e403-01c7-434e-6e78-08db61513344
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 21:02:38.5535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEWc9B9ZiWGd3FeCeeI1MMy/vcYYb0HgyiJEaUsEFGCf9ZiGMJzLQrV3URYQPHL2NzxsbMGJhWAUi1TA2iOp90xCXKGa1CGp6q5AkG9kiwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
X-OriginatorOrg: intel.com
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
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/26/2023 16:55, John.C.Harrison@Intel.com wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> Instead of printing message fence twice, include HXG header of the
> unexpected message and its len.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index af52ed4ffc7fb..3a71bb582089e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -994,9 +994,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   		break;
>   	}
>   	if (!found) {
> -		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
> -		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
> -			 ct->requests.last_fence);
> +		CT_ERROR(ct, "Unsolicited response message: len %u, data %#x (fence %u, last %u)\n",
> +			 len, hxg[0], fence, ct->requests.last_fence);
>   		list_for_each_entry(req, &ct->requests.pending, link)
>   			CT_ERROR(ct, "request %u awaits response\n",
>   				 req->fence);

