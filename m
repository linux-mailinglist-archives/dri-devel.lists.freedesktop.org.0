Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666306E9CFD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130510ECDB;
	Thu, 20 Apr 2023 20:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E135010ECDA;
 Thu, 20 Apr 2023 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682022072; x=1713558072;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yNpfUtcOwTUlck0FonaBxtkUmpkuSRMoGKKSnDpWL+Y=;
 b=YOqK+Nm67HSOxOBSqDcY2LFPbhFyj65VSSFZpw9feHj3Np9UnkBnH11F
 X1fbQhgwnN0wouhU7iV5Flmz+3CGmB2yovEL8XzCQCMzxIx0d/AR0GeU6
 3TD0aVDQEVg0X99BAG7kkji6DKPK7ecXb204MJ7cDLjkik/xrfIt2kOlD
 qfsvlyVP8UQK1JfV/h2qrLQQPkBbqDn3CXDzTjLZqnCnWjaQEbhx5mQHR
 6KBcgGAYn0O2Ug8dhwwChxbt902g9xEsz+/I9YGy08xi/MZ+ZHxSKmyvv
 jL1fl2Viag8zlRT3+kQoIahRXSI2GU/qYzmirMCemZIw0U01xrLEcrFPB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326170634"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="326170634"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685503230"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="685503230"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 13:21:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:21:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:21:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVm4sigSho18nmLcdlYE06knDKjM+uLIjkxPHIBAf2IwW5ziv1hADwnOtEiVqQEvFGFF2+GsHbDuwmN+O7dutupv4agf7O5q58lTZv37gKAZ/hkES4zOWkWK54Y1fDirnfiivvZ8R/3Qn9FHKy2em8tzQ6VObWuQWQM524Tls4V03sP85dBYocDzU8pmrWo5F+J2JKVFYIwa1DyA9z33hCdya/zLL1cZ9cxcBB9qWOeKmyFdAzS0AS6QqL6zfMO4dUr5VDg398PWBNM52Yq1EnSMwjDGv6wopUi1vv19h/azT5gSMBVPCd4QfMH1v2fdPnBzrhrkfSjglS7k5wkbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCJoLJ/DYV7qIqfwpiLgZwPecfKrwqqQw7r1ejnd2Ao=;
 b=Zf60IyKM/V3apnLFebzH/XW9g+MH+JvzIwTTX1TO+NY2q9MZdpQhh6C6i5u2DSLz8t3TD3THHF8dTNnK/IuP6t15g2Xoo1xW00hO9Sh8G1nhk+FXl85oEXWXgwU/2sGHswscxjHYjK/IggTFTQ0+zAXn0sVs9mxBb6OD+9j0826u9eoFi5WiCj9eC45G5I/TKA2FD19TAY29aK3P4X+f2YgtGo0qpHfJJxClkOtnWGzl/puFjN+4MWrArMvCeFb+CDd7TWNRplQJh0eECSYpNuqSPjdxnCMPJNcGBK7HkMkoNnjAZvuAA+umrq/XmZa7EVtQP5BJqwZpoSfwlQvLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20; Thu, 20 Apr 2023 20:21:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:21:09 +0000
Message-ID: <6f30d4d4-f24e-00dd-8bad-c338ea6ed4dd@intel.com>
Date: Thu, 20 Apr 2023 13:21:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-5-daniele.ceraolospurio@intel.com>
 <ace7fa99ea2a38f605a3fe514ec39b372537a9a9.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <ace7fa99ea2a38f605a3fe514ec39b372537a9a9.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d8dcc8-2b0d-4e08-b87e-08db41dcc75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQFFksx2Y8jAaV2yXS9j9JaYOts0tAjWiqF6z6vSuSzRwkIJAUy0b4Sqq1jEFgFYGSSe2ADSwdarBnuMGAvINpRxBWPBFi19lJADKBWSjnTuCH8AM/gR1fTc9uY9O3aLe9lRQ8OgaMHccWBE+gMVO2WpCJAvAicjKEEJXXWk1/KZdWyvLlrRq+8A/vdUn7lO0cgMXtR1bkwrlqJrcUioY77xzFU7Mq7OxTu6thkRQfcSLQg80y3ejGr/8FPAFX/8QeULcNduQfBmPTVWykk6BevyXannTHngEv5eZfBjrZCSNHgmgD8qJKEAhdbbtTl7GxnnIhlbzqOE6qXvPxbKIFtKvj8Ljq9C6JtCt88Q2CVwg4ItIO0NgWfIEtnW/08k8EkqxTjW4DHnaSCZqzV9KZGQBCTojW9z3+pJqo6fFlH3jpaWrs2x6We6c1CbX5Qt/lZTo6RDdFESQxrOK57uKLMEw3U+cwQ5I0kpxR+JaDmPVb1fOvuHPsWqWoeDcqvr0QK2Pt/q/9wTv4P1u3RRHbypsRNTHsifFQUV7/CHY0dit+sa93fK3SkIvIjHGI1YEq0zBxTqXaU63z0QjtlugrsmefN0s9+NSTGHGphotnhPIF5un760DuFFk/KSAOD6YPMQT3qcSWCi4tULQvpvZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(6486002)(478600001)(31696002)(110136005)(86362001)(2616005)(36756003)(83380400001)(53546011)(82960400001)(26005)(38100700002)(6512007)(186003)(6506007)(316002)(66476007)(66556008)(66946007)(2906002)(8936002)(8676002)(5660300002)(31686004)(41300700001)(4326008)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHQ0d05aUUhDYlRyTXBPMnN0cTNlMWx4T0lTUkZCN3oxdThJU05jUTNJWDNh?=
 =?utf-8?B?OSsxbDJEczV4a3duY0ZyRG8xSjc5WjIxRzZoUmFTdCtaSE5NeWlaenVyZVdV?=
 =?utf-8?B?LzBnTmlITWJVanBmbFN1QUJvcEt2bFlZUkVWTlZLQVA4bEFYUGExdndrbHFT?=
 =?utf-8?B?dzdaSUpHQnRFbTZ2T2FHamRmeit1ZzVTbWQ3L0VqSDVRVmtxbkg1K01sSHls?=
 =?utf-8?B?RVZjb0IwM2ppYStIZ3FyOXdQTmRHcmNVajM5NHZYV3U5UVhhZnhGR2FPa01Y?=
 =?utf-8?B?YTNHbi9kcTdhSGxGS2Rlam45N3lPQVkyWE5PUnhNcWlzODBxR1R0ZWtzVkNy?=
 =?utf-8?B?VmJJY0tHS0tZVkpUUEx6Z2p0cHBONUc2ejBuU0o3b0NNbURNWmtGSE9ob29G?=
 =?utf-8?B?R0RtTlNhaUZOV1JqU2xEMEhlR2JqTGtjZGpIUG5LMzBJb1BvcEVnd0NDSThv?=
 =?utf-8?B?NDJtN1ZmdVlWQUlpY2pvVEJ5cHZCVFBNR282UzNObXgxeGRjUkdGWFhnaHVZ?=
 =?utf-8?B?L2dMRzhSL0lscjl5WW9mNzRwek5BTnZIdFNzNjVKMUxtZjQyV2dSbDA1cFVj?=
 =?utf-8?B?UVRDd0xFczdmQ2kwZ09TWm1RV1p1a3lDNVh6djc4RVFkVmhma2RpaFZzR3c1?=
 =?utf-8?B?U2s4a3VSOWJxWndvTTgvTzNDTEhaSFRTeVJVTlZOT2UrQnE2RTllSmdHeVF6?=
 =?utf-8?B?SGNjMUI5VDBFdVU3dndxV0tLSVg0Y0N0TDNxOFMxVTFCS0JhclhrVHI2UEM4?=
 =?utf-8?B?Ukl6VmFXMDF2c0tVUXpyYlRyOUVrWjBvZk9OdHdQNlBQb1U1L0k1VDhDMXJq?=
 =?utf-8?B?aG5XV1dtZGMyZzloMVBUSi9yOVYycnZxaWdJQWJWdUNobnZHZFdoSjVUbjQ4?=
 =?utf-8?B?WlQxakszdDd2blpxalJmLzlJTXVNVUNCVmRlWjEzWnVKOUpXVzgyUWZhaWJ4?=
 =?utf-8?B?UUtjODdEZ0FiL2tBblhzWjYvdG55M1kzd2JkQ1dCbUM2Q0tqWC9iRXg3SDFp?=
 =?utf-8?B?UXFaSGpaTXdTWkEwb3FkVzRMeFkxcmVzL2tVaGNoazBxell5UWhGMnp2RnVk?=
 =?utf-8?B?dGNtaUZ5OW9HWUplVmtFeWhVN1VIckdEV2w3TkVXbSt5dzlNRU8xbVZsOHBr?=
 =?utf-8?B?NTNjWEVmTmJmeFpBa3A0eU9YbmtOSWZHYWdlN2xwdjZPakMxZkcvM0xjaWRW?=
 =?utf-8?B?djJPckxDN3gxTk9OTHhTMVVRaVBtektyd3hXcmFFektDYUNXQmpKN1VIR2xj?=
 =?utf-8?B?ZmJjcm5LREJCOGJTNjdzZ2QvdzRFd3RPS01yanRHOGNDL2Q0enlHcXlRbzF3?=
 =?utf-8?B?eFp1T0JpalUzS1pEQ0xhOTV1OC9rTTZibkJ4MHIxbm1CenFqdTZwWUN1WGR4?=
 =?utf-8?B?MVgvWmhrKzFad0R0Z0tYbDJVb25yZ21LWUFVVFBvUllPbm1ublNtVGZHQUwx?=
 =?utf-8?B?ZjVQblNMUzQ3dXNQOUc0eGp4clFoZnluVDc1RzJ4TEEzWGhkTVN2NGJockZO?=
 =?utf-8?B?YXorWDFzUG5aMy9FMDB3OHh6cVJjdm5sTUNGUVdXRm90K0IrN0piZVJQN2pJ?=
 =?utf-8?B?UTQwSDM0NkZlRkcxdW5LdFFOY0NxMkljc1c5S2NCQU9FcWRxTDBxYUN3R0dK?=
 =?utf-8?B?bUcvWHpBUmVUeDY4VVlCNzVwd0ZLZys1SkgwSVBoYXhWYW1TYWEyM0lla0hP?=
 =?utf-8?B?UHU3d3dRTXd3OHRDOUhKWEdIWExuTUxJUmU5OTNXTnZXWlZyaGVJemxMbnBv?=
 =?utf-8?B?R083N2ZFSzgwdXZmd0VoK1hQeVRXUHNqZ3lpLzJMMVZJRnRSOGhNNzRWelJE?=
 =?utf-8?B?OVpmV0svR0tvdkEyYWU0WWw5WS8rbFgvdElWS3JWa3JLWUcvR0tDbzZpL3Ew?=
 =?utf-8?B?bHhrUXdQY2pUZGF4ZjQ0bTVpWitIRmZ0cmxGZjNlRnNmSXVDdXRqbXV6UzNL?=
 =?utf-8?B?WDZ1TG9FTVd2WXBramVYU1h0RXMyeUk5S1hETFo4NjVNdGlOa05BVTVTMmVu?=
 =?utf-8?B?eDU5NTdsdWtNOUdERE85R0xlUmFxNHEwSFpEaFdHVEFPWlI0Sis1d09kYlMy?=
 =?utf-8?B?amJycUFvZmpTSUZvZUFBYlZZU1hub25KM3F0akpMdlB0SkdsQy9oU3FuS3pw?=
 =?utf-8?B?Z1JqL05pblgyNDRSQmMzVzhGNGxZeEJHZThGRy9oTVpWbjVycmpwdFpsMlIz?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d8dcc8-2b0d-4e08-b87e-08db41dcc75b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:21:09.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAPZ7G7Gcjb9UdUDn3aOEfvTwxIuu6QVbwXJ407vJMsXpnfiEcwVUQQ8R+ZF0ev3Z151iQ8wzSs0wirjjfH0L89H9KQCpF5Pt83tscVoFvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/20/2023 11:49 AM, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-03-29 at 09:56 -0700, Ceraolo Spurio, Daniele wrote:
>> The GSC notifies us of a proxy request via the HECI2 interrupt. The
> alan:snip
>
>> @@ -256,6 +262,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>   	u32 irqs = GT_RENDER_USER_INTERRUPT;
>>   	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>>   	u32 gsc_mask = 0;
>> +	u32 heci_mask = 0;
> alan: nit: should we call this heci2_mask - uniquely identifiable from legacy.

The mask is theoretically not just for HECI2, the bit we set in it is. 
If future platforms add back the HECI1 interrupt then it'd go in the 
same mask.

>
>
> alan:snip
>
>> -	else if (HAS_HECI_GSC(gt->i915))
>> +		heci_mask = GSC_IRQ_INTF(1); /* HECI2 IRQ for SW Proxy*/
> alan: does this GSC_IRQ_INTF macro still make sense for this newer platforms with GSC-CS / HECI2?
> i dont think i see other bit definitions for this mask register, so might else well just define it as BIT14?

GSC_IRQ_INTF(1) is the HECI2 interrupt on DG2 and the bit has remained 
the same exactly to allow SW to re-use the same code/defines, so IMO we 
should do so.

>
> alan:snip
>
>
>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 4aecb5a7b631..da11ce5ca99e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -1577,6 +1577,7 @@
>>   
>>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>>   #define   GEN11_CSME				(31)
>> +#define   GEN12_HECI_2				(30)
> alan: I dont see this being used anywhere - should remove this.

A few of the defines for this register here are not used. I've added 
this one in as a way of documenting where the bit was, but I can remove 
it if you think it's unneeded.

>
>> +#define GEN11_HECI2_RSVD_INTR_MASK		_MMIO(0x1900e4)
> alan: GEN11? don't you mean GEN12?
>

Yup, this should be GEN12

>
>
>
>> +void intel_gsc_proxy_irq_handler(struct intel_gsc_uc *gsc, u32 iir)
>> +{
>> +	struct intel_gt *gt = gsc_uc_to_gt(gsc);
>> +
>> +	if (unlikely(!iir))
>> +		return;
>> +
>> +	lockdep_assert_held(gt->irq_lock);
>> +
>> +	if (!gsc->proxy.component) {
>> +		gt_err(gt, "GSC proxy irq received without the component being bound!\n");
> alan: So although proxy init is only a one-time thing (even surviving suspend-resume), we
> know that proxy runtime irqs could happen anytime (depending on other gpu-security-related
> system interactions). However, would the component driver be bound/unbound through a
> suspend-resume cycle? If yes, then would this check fail if an IRQ for a proxy request
> came too early after a resume cycle. If yes, then should we not do somethign here to ensure that
> when the component gets bound later, we know there is something waiting to be processed?
> (in bind, if proxy-init was done before, but we have outstanding IRQs, then we can trigger
> the worker from there, i.e. the bind func?)

A proxy request can only be triggered in response to a userspace ask, 
which in turn can only happen once we've completed the resume flow and 
the component is re-bound. Therefore, we should never have a situation 
where we get a proxy interrupt without the component being bound.

>
> alan:snip
>
>>   static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
>>   					 struct device *tee_kdev, void *data)
>>   {
>>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
>> -	struct intel_gsc_uc *gsc = &i915->media_gt->uc.gsc;
>> +	struct intel_gt *gt = i915->media_gt;
>> +	struct intel_gsc_uc *gsc = &gt->uc.gsc;
>> +	intel_wakeref_t wakeref;
>> +
>> +	/* enable HECI2 IRQs */
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>> +		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
>> +				 0, HECI_H_CSR_IE);
> alan: i notice we don't seem to care about potentially re-writing a '1' into reset
> if it was midst reset when we read. Shouldn't we also protect against that here?

Yeah, I'll add that in

>
> alan:snip
>
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> index 023bded10dde..a2a0813b8a76 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>> @@ -23,6 +23,9 @@ struct intel_gsc_uc {
>>   	/* for delayed load and proxy handling */
>>   	struct workqueue_struct *wq;
>>   	struct work_struct work;
>> +	u32 gsc_work_actions; /* protected by gt->irq_lock */
>> +#define GSC_ACTION_FW_LOAD BIT(0)
>> +#define GSC_ACTION_SW_PROXY BIT(1
>>
> alan: perhaps its time to have a substruct for "proxy_worker" and include
> 'wq' and 'work' in additional to actions?

The worker is not just for proxy, we use it for a GSC and HuC loading as 
well. It's the main way we handle the gsc_uc, so IMO it's better off 
staying in the main struct. However, if you still think a substructure 
will make things cleaner I can add it in, but please suggest a name 
because I have no idea what to call it (something like handler?).

Daniele

>> )
>>   
>>   	struct {
>>   		struct i915_gsc_proxy_component *component;

