Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF94C0768
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB95110E385;
	Wed, 23 Feb 2022 01:51:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDB510E385;
 Wed, 23 Feb 2022 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645581085; x=1677117085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CUELoDb/4qgZq3Z2LpI1+gpgV2XMQiV853nlxH23rqY=;
 b=Bvaddf+NCPFIFqsXahDMopz2+8rjkJupjvcsTEmg+wrwGXU9xkcqV/Nd
 Ws0zLK6A2idfpDavvyyJJ7q1Aokj11GXDyedGgkIGzmexqHJb8FLGN2b4
 lRQd/V4O6Q+g7NEp8XncwFBJGHpH8Dw+dudfnU/8fbd5wTyaSweWDktLx
 S4/SWzkQb49+NORXzdNa5GmoXdWl2Dyn1G5z9kgr7j/93+b9nHGLnTUCc
 zwlhCmVBCuPKzp56EPoFOWDrzxnZDRMhF/duhL/TAwhi+LZuWfp09trCL
 RWuFp36WLvGVQoSGNwTnCJTuXlz9OW+aAdluSA6+l/QwNSGjKf9RtSkY2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338296766"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="338296766"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="532482043"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 17:51:23 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:51:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 17:51:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:51:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/lOQb0hPXcMDHUJydta+OYEc2FbBl42NBC+uXkXQiu+gh7pVa4K9lCF3Ek1odlo8VwzMmfoKHkthyeS0bx6pbLwSu+JBZAhhwA4rEIvo+zpqC4SahNvEZNvagJP3NsQ4xS23PSimFQXAMeqQfT+x3s04ZqSkgZM8ncTk5XXLZbFNgIxXyFcs6XT/WWH+fx8ju2xW0b3co7BED1MWVYqiq/NpYqHXEydEsGqb0TOVn1fJUZhqR2x8Ih4HgUS3mcreqevH4rSRLdnHYbMX8SR6lk0LqhNMC1TJCgaAoXoxkMkaW1ZXGDY8IbqfjFkuR7j649TL2wBQ+zpcFU07r0sFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAgS20PRd5IXbj661wbjZKjHDH7GXEfUdgTDFom5vhU=;
 b=DgDkCzCajuwLskSQZIOXU1G1TphIzfMjlcVzyv3AMlgUDVxiJunnwbRysAgS8HGZtyhdM76jUmBbCjZ6C4ZNA3zP82aNrd1GkcJrQUcNu+CgECDwDbpU7uyo/V8r2NV8GeFoK2fwt6mo6qowLC3809lI655fsEaOYN41VFL8pDhkFgz/DJhhN1bK++JsHCgTXHRBTHPkE8Kl8nFUS4/F7h2RIZGb7u9vct+w184hTwxMSEeQS7ZIUu0hpP3KtKRrpjhDtf70E7PYGdp5jQODT9NM6Hmd2Jt0s4ziyT9aOlKTuntS7iD/1XGPHK2XmYwAfC/Cq7qXWvXBljX7H7kqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB1954.namprd11.prod.outlook.com (2603:10b6:404:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 01:51:21 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 01:51:20 +0000
Message-ID: <c96c52d1-28ec-8a85-0ea0-209601b0b2a7@intel.com>
Date: Tue, 22 Feb 2022 17:51:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Do not complain about stale
 reset notifications
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220212010425.3643192-1-John.C.Harrison@Intel.com>
 <f99a6caf-7aeb-9ff4-4872-cc986e11cf66@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f99a6caf-7aeb-9ff4-4872-cc986e11cf66@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:300:ed::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41d8a9e1-da79-4caa-333c-08d9f66efd57
X-MS-TrafficTypeDiagnostic: BN6PR11MB1954:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1954EC27EBF1FFC03C9164C3BD3C9@BN6PR11MB1954.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AaYtOI3k121M31v9+vrrJuQSxxyEbLlu/Xoz1GESCahqJKQ1obwfr9ZPTWZzlwVNEwy995Q9T3m46N7as2hqn0/JUyABg1hlh/Hu/WSpFt7PJfMDnlkJKR2uCYmy/3SVvAl6UgduyMVmqvGGHgShwRMrRqb5215xwM9FB+IQZmjWxoiQEBibDZfjlNgUGs70UWDtHeqYkiqDH1E7SFGv58aEI9us4B86KesazFcYvMzftUZXOZb2Pky5h7v45mf8GeBP2WZwz8NhY+usOVv2Y+dwRR30ZehCf7FcdV/OYq9VSes+JXAYKhujCbH586OOJsehyCU9llyOazJaG0G266984XR/AfTfqdH4NPgtKOIkJor/hie8orTlY0Nu+/DEWRfoDedYvn2uxtXVfEP0xUiYxuAtphxT/FAkxE1dsQNSTBe3tgsJ2gVIRraZuBSoLQr3HvtoWkNacqO7ZOUa+FJG1MXZI2AcGhx+4qYreSvlqBBkl3TVGeJDHSPNu9MBd+s99V5cLB+jJExTeRExFJTBoMJrnEGB5AjbZ51wtAOixLKiT6kzSH61N3sQxIJH0pPMtjJagT6I3sFskK9nUUR4SAQTcRhCGEN4gt1Jy8lEcdxB+BvKEZeg73y1Em75VFMtOXfDfZvlvcdGwB33Sfp0VyixCrNfddz7HUZGqg37xYJeV1nJ+b8uklTw+J7fUah/UnKAIE4qM06M8obZ61194QMBODHcn1fbSCkpnZVRC3qEFVGcJuwodm9sUHf1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(508600001)(86362001)(8676002)(6506007)(4326008)(53546011)(38100700002)(6486002)(450100002)(66946007)(66556008)(66476007)(36756003)(26005)(186003)(2616005)(31686004)(83380400001)(2906002)(15650500001)(82960400001)(31696002)(8936002)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajhPaHBmaWJQbTM2WUVNd1VZbEQ2MUk5R0FOVGNmUngzWTFvaDRIY1BKZllz?=
 =?utf-8?B?RStzQjZhbDQxQjdUWlBkZTFlK2w2bzZXc09JWWVnM3FXVXBPa2pCb3I0MWFL?=
 =?utf-8?B?Y0hhYjM2YWdLRVRob21jWjU2NjZhVzd5WWd0b1J2a0xBZDNSd2pJUEhORWkw?=
 =?utf-8?B?RElxYi85SXBYTWc5TWJBV2V5YXJiSXh3TkY2QjVoZkNpL3RoTGw5endWOS8v?=
 =?utf-8?B?cm9JUGNZUHJuaW52UGJ0SVJHMTVRYll6bkNXWVdhdXVFUzNaaERnUTVBb2pE?=
 =?utf-8?B?YnVaUDNhbWVyTVdXTVo0eWRHbm52Qmc3MFkyNlZIU29QM1l3U21tNC80TUEr?=
 =?utf-8?B?dkcrSUhWS2d6bFhvSTFUNVpqRVRNUEUzQnB3NjhseTFrWjMxbUtIVGhzVWE3?=
 =?utf-8?B?ZUROWkFPY2xJTUhRWU5mbFM5NHVQbWl0YWhwdEFhb1l4T0xyVElNU0trV0FW?=
 =?utf-8?B?K0ljY20wK1Z3SjhiWEY0YTRkZ09ldCt3RDhPVXhoT2tvMzBPVWc2MDM4TXh2?=
 =?utf-8?B?VUs0Wnc0OUd1UWphYVRDTnlaRElEeVJ0UGVOa1JDbTBjK0xhaTNONjlpV1JG?=
 =?utf-8?B?S0s2MFcxcWlWUFlJNFBIcjZ0RzdIK3NaaGc4K2R0OGU1SUpVdGxtcU9hTkJ4?=
 =?utf-8?B?TXMzbmRxaTQxNFJDSWU2TVhWTVVhTnUvMVJubVNpYitOUWhGRm9DK1c0Mkxl?=
 =?utf-8?B?a1VKL1NpRHVvT08rUGEraUxBRitLbUdKSHduNmdSOEtqOVNQVUhWZGFoQjds?=
 =?utf-8?B?NE42cGhHdzg1SGp1cTdlazBNK1R6M01YT3FKa2VQRnlUVG9ISUh3R2RjeWNk?=
 =?utf-8?B?OUlxK01WaTV0SHdjbytQZUNxRmVvU1djYWc4QURScmtZdElTUXRoUkt0MDM3?=
 =?utf-8?B?aHY3SldkZENBbzIwTjd2N0RDZjM4bEd6VXFCdDRjSVdpbHdJMnpmY2dJZUNs?=
 =?utf-8?B?TnByRk0rSlVwR2ZYMUdqOWc1S05jR2pSVXFZYTAxWHUydEhsQitZWEtZUzFi?=
 =?utf-8?B?R3VScFQ3UVpSYzdsZEhUdmRCaUs4ZENjeTRkN09ieE1FdklRY1p1ekJtYjZC?=
 =?utf-8?B?dWFYZ2tMdHQ5TVVXNnhXQ2ZzUGJoOFE0ZlBuWUZPM1Iwdzc1dGN3NnJWb1N2?=
 =?utf-8?B?NzhHYzhhYzF2bnFlOFZtSjF1TEdiK2NmSk15YVFoMEsyTDJhNjRjWTdndEVZ?=
 =?utf-8?B?VFdhWTFtOEJ0VnBzQ3RPNHozWk9XaDhXWGxtTzQzUmdXSjIvTElaQVA5MWVB?=
 =?utf-8?B?bVJ5eTRDUXdzMnNvbkYyemRxUEJnTnlmZWFHbWpROUZoQjd1UGQ0TERZdkdh?=
 =?utf-8?B?b2YrUFZEeTloMXhpZk81cDNlZjk3YktxVHBPeG04cjRhR0V6KzNtaVhydnRV?=
 =?utf-8?B?enZSb3pheTdNZWt0L1BSRittWEpJc3BrVmNmWTQrYkFRekZ0Sm90c1BIR056?=
 =?utf-8?B?bGtaVkJob0hBZGloT2ZiNmE1WXNCNGoxOHMwTHJaOEh6V2UyN1A2WkpEQzkz?=
 =?utf-8?B?U0NkeTRmdTgrUEJSZWdTKzZ4dWM5UklCQTM5OWlOUVo1dDkzbzhwa1h1WmZ0?=
 =?utf-8?B?RUg3Wk51VWlzNDRSeWNvcXlBK0hNQ3Z0ZVl2YnlXZ01EYjJqaXBNK3BQQlVC?=
 =?utf-8?B?MEZJbFdOQXdSMm5hdUI2bytDNUlGRHA2WDZ2eXFlaU9tWkRtN3MzVGdKeUYz?=
 =?utf-8?B?cTBtb3F2MHZzckZxK1ZrOGJ2dVNEZERkaU9LM05pK2IxdDNraFhRZTh6OElO?=
 =?utf-8?B?L1E2eCtiK2VIZ0F5SmNhM3diVnc2VElIaUtESWtIbVBNNGMrR3N1N2hnc29j?=
 =?utf-8?B?U2RkSnM5WDl3cHM5Tzh5SzlsRXc0SkgyR2RHT2srSUY2ZUxSQnk1bVNzbWZz?=
 =?utf-8?B?VmxqQXFPM0JqaHVyeGNTS3ZWSWZRMDhDL3gvVzMyM2JkbHZhc1oraTRmRHBN?=
 =?utf-8?B?aE5OdnUyd0JrNXJoU0w3aUxQSWs1dUF0bkMyTEN3K2JBemNjWkIwd3N1dndZ?=
 =?utf-8?B?ZjZ5V1JqbnBwVjRjTmNLdVJUeSs3cGhZNWUzRTNVSWRHaTZSemNuTXljeHoz?=
 =?utf-8?B?TjVTUzNNaDlueVN6ZzNPcEFTRmtveG5BSitkMEVmbVVsTzdaa2lUZVpOS0VR?=
 =?utf-8?B?a2RnN2hrMjRhK1ZRUlpOZFpvQW0wbndXV0tXTml6R1h2U09WOFJWeXNNTWpj?=
 =?utf-8?B?UWlIeGROdDYxcmJIS2ZVYnRlTlN1a0NuUEhwV2g3bzZXdEIwaE1sb2ZWWCtN?=
 =?utf-8?Q?crjthBTpPdE33LQ84H4PybqwgJJZBCjZSNWimDbZ/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d8a9e1-da79-4caa-333c-08d9f66efd57
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:51:20.8852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvTZxj2JVb/RS8E6zy2pavUBLCc7ot/RnbqMdAQrZL7nLjBZJZyLgGSGJX+RApiW8i+ACSpuSgWBin7BE+rniqFNTsW7Dq2BrDpHjNQi9pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1954
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/2022 17:39, Ceraolo Spurio, Daniele wrote:
> On 2/11/2022 5:04 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> It is possible for reset notifications to arrive for a context that is
>> in the process of being banned. So don't flag these as an error, just
>> report it as informational (because it is still useful to know that
>> resets are happening even if they are being ignored).
>>
>> v2: Better wording for the message (review feedback from Tvrtko).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b3a429a92c0d..3afff24b8f24 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4022,10 +4022,10 @@ static void guc_handle_context_reset(struct 
>> intel_guc *guc,
>>           capture_error_state(guc, ce);
>>           guc_context_replay(ce);
>>       } else {
>> -        drm_err(&guc_to_gt(guc)->i915->drm,
>> -            "Invalid GuC engine reset notificaion for 0x%04X on %s: 
>> banned = %d, blocked = %d",
>> -            ce->guc_id.id, ce->engine->name, 
>> intel_context_is_banned(ce),
>> -            context_blocked(ce));
>> +        drm_info(&guc_to_gt(guc)->i915->drm,
>> +             "Ignoring context reset notification for 0x%04X on %s: 
>> banned = %d, blocked = %d",
>
> The if statement above checks for !banned, so if we're here we're 
> banned for sure, no need to print it as if it was conditional. I'd 
> reword it as something like: "Ignoring reset notification for banned 
> context 0x%04X ...". With that:
Hmm. The patch was based on an older tree that had an extra term in the 
if. Seems like the patch applied cleanly and I didn't check the 
surrounding code! Will update it to drop the banned and blocked values.

John.


>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> +             ce->guc_id.id, ce->engine->name, 
>> intel_context_is_banned(ce),
>> +             context_blocked(ce));
>>       }
>>   }
>

