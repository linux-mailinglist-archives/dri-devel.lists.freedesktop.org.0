Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29911520DA1
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57EB10E9C5;
	Tue, 10 May 2022 06:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A3610E9C5;
 Tue, 10 May 2022 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652162955; x=1683698955;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8K7b+TYJ98q8MdLbarLwX+TIO/Au0KZXv1JnysINysE=;
 b=GUPVchHTMLGnDuJF1bOf4oahgVUsP5a/dDTWI5PpoRd95EeNtjs3b+dT
 GewzbXCvr9VzZeWu7W234cybMVraprRTCU0j2FCgHntA0wcpTLYT4TDiL
 ZQeEghmAvy3whrFhUb1vGy0lWkd49BuC/Esb6k180YmekDHJRNzYSbaZA
 eS4lmrIgh8cwdfYi7Wl93YTKd8/zkGKyj3AMKwvE7w6PIT1MOnHA0NfZj
 /oxGvJIJibciELqI94lwcbYlzmIvoFhWpD0NMjmgIXLnSznQPDE4SH8Ip
 LoEFnG2QfMAb96Z7uqpu/FWIb4AFVR4ll1awOeGW58dpdxS5jruaeqgcF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251320005"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="251320005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="593317673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2022 23:09:14 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:09:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:09:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyslDafzinCT6F3h9mcQtU+izCGOj6nFiYIX5q2ZVEUoL6shkxkr/wxjkAPjKUWGYoPf9BFz7K9DJCmV9IrJd2FDtEfnXyrDxR9l9zvNNZ9S/YjK7hg5u4OYMYVuMh3R1B4cQf3j0CnSxqIGoclTRs+BHJF3R9naWOpWdAJbRbybiBUhtHa2owWdJxHaJ/fZSqWJNvL5Q/cWENKay1KVBQY7Q+J/lA9g+sc1fFvgHhslnUIgCz/yM/YeOjy8Vk5yfEy8KP7jwWYNh5FgC9ap1BYZDfH93wfsK/OACbwH7oCTphaav0dx/+qMU0qM8jlWcuS+rNg1PK526S9W1IJjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAAhmmqzd6plrsLvahoEtwsUiYeBgF5gnff1p0jWyr0=;
 b=hFQsKoGXR6AozLUWEJW7J+y/PmYwu2dELa5DlqUPoS0Q/1CB5BWZeIPowWmdEVYnCRrt8AMqvr4+R/q5gGRdffweKtrU76cU/P2Hwb/yNgOZRY8a6IFDMQWXvYWwKAHaBeM5A+uMNV57T47FgoYTuNT8fxV59mYGKStRr5bPbEkw08svQS2mvbVp1jDoO+SbojIYzVS8zC8IfVrezRvxJ38EZ1/M0lNQYL0LbQxbQN1RSiK0/R4J9wzrWoA6mdVIMAzVspVETbg9UUxhh8MKe9vFCGITADG0uB0h/zqa4ftKKV8LLxmh+yon0NeVFuAu1eaP24JDeE1bgvHUNATK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MWHPR11MB1519.namprd11.prod.outlook.com (2603:10b6:301:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 06:09:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:09:07 +0000
Message-ID: <c0620f79-d8e4-f8d9-9cba-6f19dd6d9f61@intel.com>
Date: Tue, 10 May 2022 11:38:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 05/25] drm/edid: keep propagating drm_edid to display info
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1651830938.git.jani.nikula@intel.com>
 <0997057511416dd83482468c6da9708f3ae157c8.1651830938.git.jani.nikula@intel.com>
 <87ee17klty.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87ee17klty.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 029c3eb4-a19f-4a90-1ae2-08da324b9726
X-MS-TrafficTypeDiagnostic: MWHPR11MB1519:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB1519C7ABEFA47E0B15E6AF08CEC99@MWHPR11MB1519.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtedDrKmtzSJEX21Y2NN1K2eXS8fBrfmo+ZSjFfacnVTuX/jbJjN4xALNHf8rTbmvct/FMohAHU0PhK4uYZHtV2leAa0Pa86IeVMokq8NA4BDxEb4tqC1BzDoUOfDifXSUDIIheWEigvCXH6JmU7AT4UvjuPx3vT5vFrbOUQiJZ+dzhcO6VhUfIUpsoamAR3yugyKfKkHlqvGK/uYA8vYSKhOT6CbWIJbRPYDivy7xxwZT5yPFCRPCsfQR5usZmK3SjSjnUiEZogVCuaNBjWzm0d0U8swZSdsVXlXq8vq15N0poMMKpZAi4xQDYFpCVxOfANEFOmHGjOyWIU/gmMx7FHIwodYo4moxE4Ckhr+SfxKA6yHBmZgAe17JI1yd7NuPEBZGAOsZPwfJuFotK2+aKGd0nNue8Uq4q+H+9NBn6MQjU1/HZKMyt8uw8Oq5f8KhzcH81Gx6g1kaTeyXVcNqMn8jdcOojsKrHm4uLggoQpPGI9c5jviEv14uehl5g6MwZ9NoMe3rx8yPa7LNeF0YDyfy0sLnyHdNImi4uF+451B88Ew6/GhJxCcn8SZenNdGN6C6iahbiuZy6VKMR4DreGfit1Te1TyaklY9ttiQaHR7rci/8P4N/JjghVVejqtC8gfN5+udJ7C9LGw9sNOo0Mem1dvO8uGCqYjnee8HNOziibEWasXruveiw6IIzlYl/aQ/BgseB+DP/fclJgcIAqmJ31VRUd7FkE4Zaw5cI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(66556008)(4326008)(2906002)(55236004)(53546011)(38100700002)(31686004)(8676002)(6506007)(186003)(450100002)(31696002)(2616005)(6486002)(82960400001)(83380400001)(36756003)(6666004)(8936002)(316002)(26005)(508600001)(5660300002)(6512007)(86362001)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVaeldEUlpBYmhlT3lUTmttdXU5SjhzZk0yVkova3dCaFlxKzlib0xxak5U?=
 =?utf-8?B?NlVMbmFxSUlTZzN3Zmd4eFRHblBJNlNsWUg4QzR3S2dkZ2lOcERDQW12MGo3?=
 =?utf-8?B?SC9VQ2RiM2VRbkVVOFRLZ1k1czFzRGFHU2tFUjk5UVg3cW9BWXRiSEl0eUgy?=
 =?utf-8?B?TTR2Tk9LQ2cyV2ZHUXpQWmJnYjFCK2ErMC93NUczNVZXR3A0NjdERHB5eFpu?=
 =?utf-8?B?Z3YxcEE3ckg4MFFRZ3c1Skd5WGxYSW5SYUNVU2xDQVgxYTlWcDFYOVFUT25Y?=
 =?utf-8?B?RlEwNWpVUnRpMHlyTzQvbTd5WGtuVzBOZ015NjhEZmN3UnMrTzFFMjJ6QjJC?=
 =?utf-8?B?NkRLeVhxckVuQUlTNHMwc3pwMlFiVEdXelhOb1F0VVF1cmRrdllhUG02ek5w?=
 =?utf-8?B?TDVTMGkzaEtzejIzaitsQ3V0VmdFd1FxNlV5T3NjUEthUVA0Nis1YXJHRkxZ?=
 =?utf-8?B?bmxYbjR2RTZiVVZmS0ZCNTUzYmcxVitJUDlFNUlPODhuMzJwM3RRcE02WG1R?=
 =?utf-8?B?Ri9NdmNSWjcwUXZ5MDVPY1p6VnNpVjdYVi9EWUpTMWVnME4vaTNyeW9ZTmRR?=
 =?utf-8?B?cU1NWEFMK2pHTDFHUFRsSzA0SDVvaDEwaU5BUUYxc0hBTE43bENCK2tWOWxS?=
 =?utf-8?B?SitibHI2eWYzbkpnSVVxcDV5Vmh1REwyK2xxbWNNRW1MVlRLZUN4ajhWcGNV?=
 =?utf-8?B?L2RBRklMU1lYdS9lWHE0Mk80SXU0VW9UeDlLaE5MQ3hYQmxZMzBHMlJkbURO?=
 =?utf-8?B?dkozQ3VhY3g0ZXU0OFNwbDBaUmNpcy9ObnFkeGxWMEFtMEVFTXZYcjVLR1lD?=
 =?utf-8?B?UWVQVnBEZS9yR1ZVNGlzSXUycFFJbWYrb0N2cDZ1S0pJNGM1cnNSUktnZFhG?=
 =?utf-8?B?OUE3eW1GbTVndmhYdnBkY1dMakZJUFc3NDJGekE0aXhQa3B1MEwxSnRPVjBw?=
 =?utf-8?B?SFJXQkFHWmdpeTcwZlN6YXpJVm14dU5ROEowdVBOZTliS3RJMWlkMThWeUJ1?=
 =?utf-8?B?RjFweVM4OUpBUEtNN2FRN0s0eitmTjMxU0xLUFVzVU5JWjBmSHFhb2pqUXlY?=
 =?utf-8?B?WkE4a0dBYnJhbWxrcjVFMkMzMEFvWlVRaDZ6RFZJa0l0dnFndFhOSUxnYUtl?=
 =?utf-8?B?WUZ3WTU5UCtFdkphcUFzVUxLSUVSZXdxc2RBVzJCSjkxYUE0QXNMaG5YUlM2?=
 =?utf-8?B?L2JGOXREUFkrNisrU0RFcGcrS3FDRENtZnFYc0RTSmNUMXJBOUo3Wk1xNTZP?=
 =?utf-8?B?bm1JOW9zL25VZnE4YnBPdTI5dThvcFQzRmsxdHo0Vm4veTU1NmpvQlBtTmNU?=
 =?utf-8?B?Y2pUdVFvSU9qSy9pejRSdzV1QTZrS0hoeDE5RDJzZFNtMFhITWY1MEs4Uk5y?=
 =?utf-8?B?cGRUazhSVm1NenlNQmsrZDIyUU5obHUyUWlMZytXVFd5b2xNZDhuL1o3Tk40?=
 =?utf-8?B?TVNzQmFGRERPWGpjajBiNUxWZVdObnZSeWhvajBhV3lZTDA3enpEd0lkcGds?=
 =?utf-8?B?dGR4RzhkZUttRFJEdWNzSDZNWG80M0xEOW9jOUhHMGJ5WWxXbnBYZW1aY0k3?=
 =?utf-8?B?QjlQTFNRU2VxTkMxaUNlalI5dTVHOGM4Q2swSHdaL3FLdStMVklNTEtwWDk2?=
 =?utf-8?B?OWU3M012amQ1ZWl0TE1KYUNXNDdkVkY5S0VaTERETVpON2tDd0RGbWFqUGlz?=
 =?utf-8?B?UEZlWkpKY1BLeUdWSk05b0tyNGFmUTlUa0JpNkFsZzVHNWJrcDYxSWpiOFU4?=
 =?utf-8?B?VFRneUZ2RzEyVWFtc09WTjlDaWs1M1ZsQm1qaFVmZm9yRENoTTdLcjNDYWs1?=
 =?utf-8?B?eDI1UXRMTU50b3ZGTmhLd1FjY2J4WWRjUzVaQTdFWlNaU1lodnBoSkhBS1NE?=
 =?utf-8?B?NmJndVdIUkZuMnE5dlhmbzV4andvVG1LdEZCWXZCdlEwR0dhRUZocjl1YnVI?=
 =?utf-8?B?VHBwUWNqdnBKT0xoTW54azhQQWd5Tk9GbERYRXluYU4xaDFaNmE4c0tGekVj?=
 =?utf-8?B?UVZhUGx5RjhYcU1CNnJld1lqOGlrZ1hVY1FoNDc4ZkwvaFh1WThCRTRyS0FQ?=
 =?utf-8?B?WWs3dk5SYXdRS2hUY2phYjdvd0ZHd1lkQUZFUlArUW9sSk1MczhYWGRKRkZY?=
 =?utf-8?B?alFPS1dXUkIyZm44TklSUXRwSE1OVkpkVFp4MkVZNXNKUEw0UXBNb0lWV1li?=
 =?utf-8?B?SktjWmNVTGhVQXdRdjljNU55Z0ZVQkJhOGxGMUxSRUY0aXNUTUxzZ1pWcktH?=
 =?utf-8?B?TmIzdTgvQ241WDcwMHAvbnJUQjFUaStxUldBUXFNUlNqa0lxOHg0OGEwcmJP?=
 =?utf-8?B?TjZVRTZRZ2RndVQwWHB2TUwxaWlXUGk3cURyeFNIT0kzQWlMUWtvc0RYQTNx?=
 =?utf-8?Q?Izko6prjca86t83w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 029c3eb4-a19f-4a90-1ae2-08da324b9726
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:09:06.9576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcTAXu3a14dYFH749VsDXg2hVLKuiFUEyL6sIJk1SOKu8YZeOiIKmBVcwYo9Ae4i/5bTueYWuvT3ydnSRVjB2EwUQyzH/nuxGbs8SldP2NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1519
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/6/2022 3:46 PM, Jani Nikula wrote:
> On Fri, 06 May 2022, Jani Nikula <jani.nikula@intel.com> wrote:
>> We'll need to propagate	drm_edid everywhere.
> I seem to have copy-pasted a TAB in some of the commit messages, in a
> way that does not show up in git log.
>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++---------------
>>   1 file changed, 31 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 946296632b2e..c9d48fbd0a76 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2419,13 +2419,13 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>>   
>>   /**
>>    * edid_get_quirks - return quirk flags for a given EDID
>> - * @edid: EDID to process
>> + * @drm_edid: EDID to process
>>    *
>>    * This tells subsequent routines what fixes they need to apply.
>>    */
>> -static u32 edid_get_quirks(const struct edid *edid)
>> +static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>>   {
>> -	u32 panel_id = edid_extract_panel_id(edid);
>> +	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
>>   	const struct edid_quirk *quirk;
>>   	int i;
>>   
>> @@ -5448,7 +5448,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
>>   }
>>   
>>   static void drm_parse_cea_ext(struct drm_connector *connector,
>> -			      const struct edid *edid)
>> +			      const struct drm_edid *drm_edid)
>>   {
>>   	struct drm_display_info *info = &connector->display_info;
>>   	struct drm_edid_iter edid_iter;
>> @@ -5456,7 +5456,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>>   	struct cea_db_iter iter;
>>   	const u8 *edid_ext;
>>   
>> -	drm_edid_iter_begin(edid, &edid_iter);
>> +	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
>>   	drm_edid_iter_for_each(edid_ext, &edid_iter) {
>>   		if (edid_ext[0] != CEA_EXT)
>>   			continue;
>> @@ -5477,7 +5477,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>>   	}
>>   	drm_edid_iter_end(&edid_iter);
>>   
>> -	cea_db_iter_edid_begin(edid, &iter);
>> +	cea_db_iter_edid_begin(drm_edid->edid, &iter);
>>   	cea_db_iter_for_each(db, &iter) {
>>   		/* FIXME: convert parsers to use struct cea_db */
>>   		const u8 *data = (const u8 *)db;
>> @@ -5523,16 +5523,15 @@ void get_monitor_range(const struct detailed_timing *timing,
>>   	monitor_range->max_vfreq = range->max_vfreq;
>>   }
>>   
>> -static
>> -void drm_get_monitor_range(struct drm_connector *connector,
>> -			   const struct edid *edid)
>> +static void drm_get_monitor_range(struct drm_connector *connector,
>> +				  const struct drm_edid *drm_edid)
>>   {
>>   	struct drm_display_info *info = &connector->display_info;
>>   
>> -	if (!version_greater(edid, 1, 1))
>> +	if (!version_greater(drm_edid->edid, 1, 1))
>>   		return;
>>   
>> -	drm_for_each_detailed_block(edid, get_monitor_range,
>> +	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
>>   				    &info->monitor_range);
>>   
>>   	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
>> @@ -5592,12 +5591,13 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>>   		    info->mso_stream_count, info->mso_pixel_overlap);
>>   }
>>   
>> -static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
>> +static void drm_update_mso(struct drm_connector *connector,
>> +			   const struct drm_edid *drm_edid)
>>   {
>>   	const struct displayid_block *block;
>>   	struct displayid_iter iter;
>>   
>> -	displayid_iter_edid_begin(edid, &iter);
>> +	displayid_iter_edid_begin(drm_edid->edid, &iter);
>>   	displayid_iter_for_each(block, &iter) {
>>   		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>>   			drm_parse_vesa_mso_data(connector, block);
>> @@ -5636,18 +5636,20 @@ drm_reset_display_info(struct drm_connector *connector)
>>   	info->mso_pixel_overlap = 0;
>>   }
>>   
>> -u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
>> +static u32 update_display_info(struct drm_connector *connector,
>> +			       const struct drm_edid *drm_edid)
>>   {
>>   	struct drm_display_info *info = &connector->display_info;
>> +	const struct edid *edid = drm_edid->edid;
>>   
>> -	u32 quirks = edid_get_quirks(edid);
>> +	u32 quirks = edid_get_quirks(drm_edid);
>>   
>>   	drm_reset_display_info(connector);
>>   
>>   	info->width_mm = edid->width_cm * 10;
>>   	info->height_mm = edid->height_cm * 10;
>>   
>> -	drm_get_monitor_range(connector, edid);
>> +	drm_get_monitor_range(connector, drm_edid);
>>   
>>   	if (edid->revision < 3)
>>   		goto out;
>> @@ -5656,7 +5658,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>>   		goto out;
>>   
>>   	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>> -	drm_parse_cea_ext(connector, edid);
>> +	drm_parse_cea_ext(connector, drm_edid);
>>   
>>   	/*
>>   	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
>> @@ -5709,7 +5711,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>>   	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>>   		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
>>   
>> -	drm_update_mso(connector, edid);
>> +	drm_update_mso(connector, drm_edid);
>>   
>>   out:
>>   	if (quirks & EDID_QUIRK_NON_DESKTOP) {
>> @@ -5721,6 +5723,16 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>>   	return quirks;
>>   }
>>   
>> +u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
>> +{
>> +	struct drm_edid drm_edid = {
>> +		.edid = edid,
>> +		.size = edid_size(edid),
>> +	};
>> +
>> +	return update_display_info(connector, &drm_edid);
>> +}
>> +
>>   static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>>   							    struct displayid_detailed_timings_1 *timings,
>>   							    bool type_7)
>> @@ -5833,7 +5845,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>>   	 * To avoid multiple parsing of same block, lets parse that map
>>   	 * from sink info, before parsing CEA modes.
>>   	 */
>> -	quirks = drm_add_display_info(connector, edid);
>> +	quirks = update_display_info(connector, drm_edid);
>>   
>>   	/* Depends on info->cea_rev set by drm_add_display_info() above */

Perhaps the comment above needs to be updated with update_display_info()

Patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>>   	drm_edid_to_eld(connector, edid);
