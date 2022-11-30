Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D463DB9D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 18:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4E10E10B;
	Wed, 30 Nov 2022 17:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF5110E108;
 Wed, 30 Nov 2022 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669828191; x=1701364191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3He1Fbx8Zv2XVJzjpamoLWhWrixtYTYJz2SFvuDRA9Q=;
 b=OinA2AaTCJKAvY8TGzmuRaCtoouS7aMdK5jJ38kurF6bAQ+K2P7+lge2
 b7Ye5xSWNjs74932MT134PQrWHuhJ3bbsmHpGU4dR77SnMz2xLk0GaNpb
 +aXLDGsSki4r8SfOEHOUPWfyW+yWrnP+Wys+BntbORVycOgWK5jWMH4Jb
 QSv0agPzs2SEUBHIOANUQWZVEW9Z4Tmwz7mVqRSE3WQTKuzPNP7XftIm8
 y/Yj+d8TWRLvZhT49FyzChFjL6fna+9HjRjdBcShoGush7dtqL61TdiXm
 lp3WEJgy4mMHnoWKad40EXAeuA+2FToBwvkH9byhFoigDy2N6Wen1Y4jx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342379234"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="342379234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 09:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707721537"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="707721537"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2022 09:08:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 09:08:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 09:08:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 09:08:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 09:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrtO/N4keKGH7rNrgeoWjlGRb+18MVPZld+IeCEHZ2czBrlqyW9xSvJR2awdElli5EwwnzMqfgh+PR66Mzorzw3QCvHHzURbqp32oEnYFPByoMb24B783ps3j33nvNbQ5wD3drFGXFE6AVc212yEbCqI4unaYPHNWoKj77jMCZHgqrMBpn7lKq9d2DIiNAfPSR0NFb57x21TIh4+OAngg+jPCdCm5LnSdQdTKSpQBo8530vi1h58PhJOlKhRXUpv7AO8PyfpUG0czmKAlO/HGlmakSeHWBJ6VoE+c2RXqBnbViBXQPBmIT/yvtpweBvM/gZQY22XQ1k1VF+nKHZ82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hULVVeK0TA4DEC1LTvm5IN5FMk4A1vjKYMTbG3cWKCc=;
 b=k6B7fZwQx6GQvOy6BcJNnvaAowV08rc6A/B9omAb/nUSXlZZXtp3/C3xOwSR1CDbyoaR/Z0xHRZ6AyWh3SyRfbtma21ooKo0Gb3+0vbotTap+DQydVzBd+JJayy6YJeAlRFdOHl7124CmxFp72dAHeXsilMllAMcew9mTSdCm9hqIZFTtTaXSuNPNqWP9d5KTOXrVBXI3drWJ7nkC6klj9Rp6ZLybDOyExO87ukCtuxzPfAM/O7qz33nN+lHorqsBM42dxfTRbWnhitkeKGbWJUk1nHMrpyxj3fZg+6wOrL56kd4JSh+zycFA/Qzmkkifw74WgEtQcx6jTeB3VqPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 17:08:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 17:08:31 +0000
Message-ID: <69774584-258d-7272-02fd-051ed3106363@intel.com>
Date: Wed, 30 Nov 2022 09:08:28 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] drm/i915/uc: Introduce GSC FW
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
 <80c9553796505e78d56c8704be115c44bbfa1aa3.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <80c9553796505e78d56c8704be115c44bbfa1aa3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS7PR11MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d90f86b-afb7-4182-101d-08dad2f58111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/MiOUlA04WTcHe717UkBRMfQ6fHk0PRVgDjVvp6QQouzBC3IyZhjzp0hnykyyzyznJK6JCcKQXMp7XFD89AHVoCTDCaUUiiu7kvl5K/IbzAyo68WJugm5tCBPArG5fbnsmpRBmOsiKmR4cPu7tPim1A6xZRN9kq1Z2EJNIwUJyuNP0NOwYog3qKfKB6cuSmKoNgLR6ZDDEEXNUnMixQ7CrpjYgFqe5QIsd0M10uD2mjl/Q/TukRzJdPNG+uP304X124zSEn6nR73Czwj2hbICwbGUAaF7Jm06yDOLWXULpToD7lKCRvKA3xo9Jrm2EpEtd/Hv3evxGiIIL8p0IxvAA5DJCB/mJOIF2K0raCmuo74TG2UJRwsKsMMc1uw1FuTNWy0YY32abWRbQAUJlnojJf48Xotgzf5kqHCNsnfAMaHyhLK5Az4Nu5dclY1wexRXLJdEpL3AWPwXH0FzaSGvTDsrTZPekr8F2i1aciRnWXXp4WULnk5QGFQj8pcXZe0PnOCrrD2/3wcB16+IyJ6MIZ/5ekiFsx4XuLKPz2KS6g0w/8SJ3IjIolnJlKxiPn5u8uZv/fP2xKdi0e1Fa2+gsgT3j17D897nYC/tT4pghUV0jnHQ/hG9PaWIxFKtFA0buOzJ3wP6umtIzmcFub9wS0UwB3jediU0J3HSH86SBgiuWX6HVGNGueYHsqcOtHic4iyt2PrcULz3vnyUWRjvyIFPZq6LUtJtu0S6usaDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(5660300002)(110136005)(82960400001)(54906003)(41300700001)(316002)(8936002)(6512007)(2616005)(4001150100001)(66556008)(186003)(66476007)(66946007)(8676002)(4326008)(38100700002)(2906002)(36756003)(26005)(450100002)(86362001)(31696002)(6506007)(478600001)(6666004)(6486002)(107886003)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHNzOVdrS3JlNHBMbmZvcUxtKy9LdXp3YzB1Y291ZzNYS2Q3OFBrTG9IV3h1?=
 =?utf-8?B?ci9zd1ZUUkNZdUhWVGoxUzFTT0Y5UlByWTlqb2xRd3dZbzAraTJQMWtVRkZt?=
 =?utf-8?B?Mzk3UithN0d2Y3VUVFA3SmJIcDN4YnFPd0pCMTc2eTY0ZXM1cFNzVDlJaWNm?=
 =?utf-8?B?NGh6T3lBcjZmblNRdlk1N1VIRE9IbTVSTlpzK0I0U3I2Tm9RN1lPWml6c2Ro?=
 =?utf-8?B?aVJuamFnSnBlVEdvNXd0OU9GcFA3TlVQUWg1ZWlkbjVDTmY5N0Q3dUFsTWlK?=
 =?utf-8?B?d1cwNlBzZzE5akV1RjEvMWxPQ0tTeDZBT0UxVEtiMXEzSVpFbThHUSszM2Vy?=
 =?utf-8?B?Z0w5ZkgreEZwSlBMVFV3OENvUHRQR1BFNWV3SDV1WldoekowMkdXUE8zaHMz?=
 =?utf-8?B?UGNTU0dWTUZuQXlaZ0M5Q2ZCYUtMbmFlTXpiVUtJamFJcldhY25XdGNHU1F4?=
 =?utf-8?B?VExNY1A3YzU2Ym5zRG5OeTlGU3J2MXFmMEFpSDRhVzNjY1JuWHo5SGFERlJM?=
 =?utf-8?B?TUl2c1QxVXNDV045TU1OdWNqSDBpWmh6aS9VUEUxMllIYTZWaW5CR3RQdmlF?=
 =?utf-8?B?Snc3UDR2eTVzZUNjYTYxclp3bjc5ZUlURlNkTnVWRUtURmlweUphOUN5RERX?=
 =?utf-8?B?WTFkR1N4eklQbXhhNlpkWHdJMDhNYUlmU0RhZ29lS2VVbVdPQ0svT0JoeDNN?=
 =?utf-8?B?cUxiREcyMVh4OFFWUkRnRlVQTWsvd043REZodVRZUERTa3Z5dGEvdUJ0WTVG?=
 =?utf-8?B?SENDSzlLVlpYSWZ1blZVTWxxNU1tQnpMRkttYThVUWhxRkhYL0k2MFhYUEc5?=
 =?utf-8?B?WlZSTkRJM0JrYldaeEJkcXU2YUZTOUF3SDF6TmVRRDBOU1B2RVdmSkcvTDcr?=
 =?utf-8?B?K2I0S1Uxb2NkazBlTjJ6OVVMWUdhVW9DOFB1SVM0c0J4L2p4ZmdvNDY2VDlu?=
 =?utf-8?B?Mm5qQjhqZU9hMXAwOFYrOG5Yc0k0aFFIWjVPRDJaSFdTUVZnNDhXdnRvQWNh?=
 =?utf-8?B?Rkw4LzJTSzQvanNYUHZ0UUdIT2tOY2xQZGlmUUZmVU41WUFlN3BVY2IvMHNS?=
 =?utf-8?B?alZKejVxVU5zMVU1KzdPMlJNUGc5THhlNTFvSjlhL1FIaU5WOFdFVEpBYjdZ?=
 =?utf-8?B?dHBRRjRpeGxCb2JaZEJmNnBtVmNmR2dGdlI4amowOXl0S2cwSFQydUVnYnQ0?=
 =?utf-8?B?STZNa2Y0U3RBdThmdXNYOVNUNXlhZlloU3dCa2lYczF5UUZkZ09QMGloUUF0?=
 =?utf-8?B?ckVNRWU2djVXZDVjeUFQZWFKSmFmczVyUU5Wc1JWMnR4VkNoeTZZUktGNVk5?=
 =?utf-8?B?UjYxK25FemtXaGFWN0ZYZ1FRRlRuY1AwaTg5eGJoTjZkSzJsTXVrS3pGTGd6?=
 =?utf-8?B?ZUoxU1o2Zm85R2ZYeDM0cHZibExDUk9OL25OM0Y3UXhGaXJIRkJZU1A2bUFx?=
 =?utf-8?B?ZFB1dmFpaW1jOSsydGN3YWEreTI4Q3FXcjBFR3JTdFBTVG1hTXVGMjdOMHNK?=
 =?utf-8?B?cTAxNk4zbkRUSk5QUWs2cERSajlmL3dJYmVhdUtKMjV6ZkRVUGhSQXh2U2FS?=
 =?utf-8?B?c3QvSmZtVkE3M2VkZjFQdzVtNEl3WHV3UnZYaklCdlRTM2I3UzI2NnZROGNB?=
 =?utf-8?B?czlwdisybjVsb1lZTWgrS2h2V2RXNEE4SldmREtOUWRQKzFWOVVJSGhSbmZt?=
 =?utf-8?B?TXhZbG90T1hITXNlMlhjRDV1eGFkbmhReFVtRVdDb0lwMmJrNVVhRExXRHRV?=
 =?utf-8?B?cXFkWnJ6ZjFpb0p3b0NRM21WNHN5MHB3UURGQmw3akpJRGNLbkZSeUVheVhT?=
 =?utf-8?B?Qm1pNW9IY1htM0FOOCtpR3d0bWQyMCtZVmJtVVNDR1NuLzF3YzVCVUlJQXVC?=
 =?utf-8?B?c090QUhmMTAya3Fwc0orTDNBaXpwcHAxa0NyYnRQUEdnT3JKdUdXdnltdlNT?=
 =?utf-8?B?ME9INnhTZy9wTXFtRC90TGVhSktPSVVrMWdhMU5RTVdJdzNyS0xFNDVXV3c1?=
 =?utf-8?B?NHRSNG5RZzk1K29YbjMrMlc3YlhJMS9RMGJBcmdFYkg5Z1dDOEpOSUIyN0hn?=
 =?utf-8?B?NUgvVEpWTE14dHk2eWtwT2h6bUxRVmFEbkVnbHRqODhqWXA5QVh6YlBuYWhR?=
 =?utf-8?B?V1hDMlN2Qm5XRjMvOUJRbFJnL3kxbmZ3NjdHNDBaajhra0dzREE3ZGgwVHRW?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d90f86b-afb7-4182-101d-08dad2f58111
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 17:08:31.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/aq0NElBR3ge4S4ZLTo4P0xbQKVR6Mmh1VCPMdThDY8XsTcVBF/5B/RF2OkymFbafE1Cih/fE8KiEqyjBmvGovWKbJtyzACEgRZjuUu1pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/29/2022 3:48 PM, Teres Alexis, Alan Previn wrote:
> Besides the nit below, just would like to echo the same thing Nikula said about not including the type definition in the
> main uc header (which i know can be a bit more work especially if we go with allocation of the structure at init time
> and using a ptr in the uc structure).

I had a stab at this and it is quite complicated due to the 
inter-dependencies between the headers. Even if I split out the type to 
its own header, I'd have to include it in the current one for the status 
checker functions to work, so there would be no gain. The whole 
infrastructure needs to be reworked so that the headers can be fully 
decoupled. I have a few ideas on how to go at that and I'll try to send 
out a few patches on the side to get that effort going.

> That said,
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Mon, 2022-11-21 at 15:16 -0800, Ceraolo Spurio, Daniele wrote:
>> On MTL the GSC FW needs to be loaded on the media GT by the graphics
>>
>>
>> @@ -246,6 +253,10 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>>   	int i;
>>   	bool found;
>>   
>> +	/* FW is not defined until all the support is in place */
> Nit: perhaps a little bit more explanation would be better here for folks reading thru the codes

Not sure what extra explanation I can provide here. The reason we're not 
defining the blob is because the support code is not fully there, there 
is no need to go into details of what's actually missing as that will 
evolve with time. I can however rephrase this if you think the current 
sentence is not clear, would something like this work:
"GSC FW support is still not fully in place, so we're not defining the 
FW blob yet because we don't want the driver to attempt to load it until 
we're ready for it".

Daniele

>> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
>> +		return;
>> +
>

