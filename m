Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9224F9966
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8999110E80A;
	Fri,  8 Apr 2022 15:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3279010E7EB;
 Fri,  8 Apr 2022 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649431621; x=1680967621;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GIsWCj6bzOXnEfT+PzxDa8PqOoGUgKBW3xcnn8XKLHQ=;
 b=lUkkTM8kS+ly9GrMoJIBmBQE8a2cP6YuruAdqll6+TUTqPVa/kYI0pc+
 zbX4bIHk90L3u6OSAqAbC3tPbarfxIpBkZDmtZB440Nxatupl9l8iohDp
 ML44LkRqlNi5SQLtDWLcI9WhLDKWT/Plfm2SGKS5HLVnSJ+rp1dq9oNQD
 DM9BTMd7sXQSTExnx29endvOpoBRBJ6WR5vfY9UrzUlSuQ5o5wS5BcO5U
 1cK0X5QazgjZOl8HOs7KSpmRrIHde0uIs1FE9YebrcQh96wvW9+dpfKxy
 j9xN0UmjJmoBQIXQTHAcND6C3EH1qNaFJHmrib787aaADwjnqy5bf5/TQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286608708"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="286608708"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="609788885"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2022 08:25:24 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 08:25:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 08:25:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 08:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYIeLfsss4NF692pThZmyoVYlGunHuwAlycAjAbU+JoE+v7DD9CYqHRMFtC8/9l9Ca4DOmyPHcr5EZSwixI2ouVJrpyYUlZpInZsyZpHmpPXHI5OuC0B4CyIzc+IKTbyw9NG6avB2gJ1R+7uOR/q6IhiN1Sp2N5Tru7g6hZa1c63GpLganGwULPKedDRoU1gPM1WjHfKrHjWfJ4UgEKliwgAwrmDB1sj6oKPakvwcbdL+we2P7R8M6qMgvHwpQhgO+U0evn9oV/1Wd98uXonggmMUxreYuo7NcDy3vjIIsofhCL0d5iHM+ZdYV+MpFOWahUobpSpL8tfsY+NmK1X2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuFwFSsu50c3OaJqzkVYexk2JINbqRChA4+zVMmxqR0=;
 b=oKigSRvhAkjovOiC2sDdf1EIqJnb5ZFrc2jU2RwP7xlM0/5N/GSkLNLimktYRIgKKJ6Nyv1b4RA8lCx5Loo+NzusLwYdnsfZiq01O0i24TsMYUXyNvaeiywLYHYymNmjmzIwliD5mGn7NBK4SSdYrBvOfp/tyL3TDgVERVgfls3Jt4ViYhmb6xHmTdg3U9AkYGr3L5yY6WRoXPUAklAGfxw7SZSo/dnMCkv62xBO5zDp28PS7GCTFOe6QeK5kUeZe8fCEkv4T6y0eUCRYbXzl5/lVEb6dIaJodZUt/6IJGKDPsBlr7fXvXcMxyyzC7kIx8wbe/q3yn3sDV/SDoia4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BL0PR11MB3249.namprd11.prod.outlook.com (2603:10b6:208:6b::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.22; Fri, 8 Apr 2022 15:25:22 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 15:25:22 +0000
Message-ID: <cb1569b6-b842-6d3b-903c-94ded72cbf5d@intel.com>
Date: Fri, 8 Apr 2022 20:55:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] drm/debug: Expose connector's max supported bpc via
 debugfs
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <ville.syrjala@linux.intel.com>, <swati2.sharma@intel.com>
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
 <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
 <375fd7ff-a68e-d5c0-ff0d-bd6b50e90b93@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <375fd7ff-a68e-d5c0-ff0d-bd6b50e90b93@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 160f9abd-b97f-4b61-68c1-08da1973ff78
X-MS-TrafficTypeDiagnostic: BL0PR11MB3249:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB324953D46C473BB3D9D321D58DE99@BL0PR11MB3249.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzQdnq8F2J6vhFyqoHgPTz7r+BU06vFd0vyXdZK5eQGc5jGkivG7Qo7upVLmnYP1/ywH0wEkupprFKJXt1rDl3u+RyjF7dTdcl14epT6MVr6DDGxY8D93dawrKCzLM5SUccN6ocmL5kJ2L3Zz96myvVSfvZwTvuEqhf5RpMxOuTqfkvRt6B3snKBBEAzgjW6tqaOu6XYmsKRpdMQJOe6gx9nKTIFaxPCFOVkMjJSIkQ2rYKfvfdV/MCUhG9sqJu8UqdtbzdMujaQa/lyw9jGkFX/5fPH0yMb3ocXoHBbT/iN71Hd9yMRfhHT7iByFwNj3TJIsHTTOiEWa0ocw/Tu05iPos1au4Qr0UFtThyFdKCt+I7UnO2NdPVBh+G2hnduTtHtRRehTaQc6fNI547aJxcGix2uaPgzOnTpv5WJgrXLBYFBxB4Q+qSGnwL9PHdzaU+qnXg4gPsytkRhn8pRxP70rjgnqr81p3zp1uimjuZaPiNUHrrdP4dIY885+VY4+xfk1Az8T2NHe8HGPV6+7R7aYpPmmSxaBVsb5Tb8hOY5PxZROZJVNuxprJ7Nzpj9uhuIgBVQRPt8MkRdmnuiesYy+c8/qUnmoa09PSJ65gYaStZHXXp/25CJSi6J1NP3DfKLxmz4FXd9/+ejacdXQCqKWcMUFi2oVHV4q6pqQPgyMb9WphZm+JW9k7ePZBEcDZuWdQf2xP6ycBYY6M7FEc1OJzzVN33+ySGyW5/OVUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(6486002)(31696002)(82960400001)(508600001)(8936002)(53546011)(2616005)(186003)(26005)(6512007)(86362001)(2906002)(6666004)(36916002)(6506007)(38100700002)(6636002)(316002)(8676002)(66476007)(66946007)(66556008)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHA3NnF4cHBEbEZmcnNZUW1yS3RVVEoxamNTZ2JMbDh3UytNZVpvRFRRMFRU?=
 =?utf-8?B?YW8vWEQxbGZNQ3JiMHRFUW1tUnE2TWtaMk9weVVOcmIvQWMzSUx1TkYvNkww?=
 =?utf-8?B?eXFFVEhCdlpxQW01RGk2aHNCNS9hb0FyQlVnWlJaTVZlWCtuNGwrNXloZDhm?=
 =?utf-8?B?WmhTemJuOTJYd01OcEp5YmJJM3ZvM2RPWHBzUTh0TS9xVko3MkZPY1JDcTc0?=
 =?utf-8?B?aWtRTVNrQk9SdkZaelE0d2c3S3VhZktOQTBQYTBBeWhIVllWcVNXbkxTUjlY?=
 =?utf-8?B?YUlFRVlRSW1UQ3ZqaHZqSXpSbVJUMkpscHY1bnR5OW96OXRDQ0x2Nm16dEli?=
 =?utf-8?B?N09mYTFUcG5EWEtkRUlsVWI4Nk9RUmk2ZXdINUt1cElMTTEwY1dMVGdCa1U5?=
 =?utf-8?B?dUxmektIek1Ock9Tc3BsV0hDakp3Ymlab1NlN3RBeXhNam1zMzhIZW1xc3VY?=
 =?utf-8?B?aThUa1pubzFtbzlvT2duNVA5Vnh4c29uRS9Tc01WTnNDbnlnV2ZxTFJhcFJo?=
 =?utf-8?B?dkREazBYbTJaR0ltYzlPN2l6RWNwQmM1cGE4cWpkOGowZFlURnp6WHdpb3pj?=
 =?utf-8?B?YVp5Z2k5V3lSVDF4WTA3QzZMZG03aDlEVTg2MWRhRW5NMWUzUjhoM2IxYVNY?=
 =?utf-8?B?Y3duOW1JNmZLVXVJVVlYMHZTdmJLUW5MQjJpMHJQaXN0bjVKK0pqK0FGdXZO?=
 =?utf-8?B?OUdUQW80QWIydXFpeEZ3MmNvUHpvVHRLYVlib0h2MjQ4ejljcVdGQXBFRUxS?=
 =?utf-8?B?dzNSbHZPK1YyMEJRazRUS0Q1RG4xWTBWRTZ6Z1hjYmFNc201UHc5TWNrVkRt?=
 =?utf-8?B?V1gyaVJscm9aS2JuWVRLajVSaDI0RGxnblZjY2xoeVNBSkQ1Q2xIaFNIc09h?=
 =?utf-8?B?WjhMS0ova2xxZEZDN1dqcFVwVStPdTNrUmRDaW5Wd05PdUtyTk91QkkvU21F?=
 =?utf-8?B?dUNJVjVqSEY4NWVMOGZDZTF5b1R5YmxTQnR2UzRxZ25keU0yS0VRZFA0ZWhw?=
 =?utf-8?B?K285Ym9tZk9nTmlxM3JOZXRTVzc4SS9Vb3pSZzV3ek1jVXJCOEN0N0VvbmNX?=
 =?utf-8?B?VnkzMi9rOEpFM3k1TFdoTFVRdXBKV0tvTnEvdCs4a1NTQ0lKV1IxakEvM3d0?=
 =?utf-8?B?dlNXSDV4aUVOOG9PYitoaTVwVUwxc3RPTUFoSm9WdWxXM2NWNGttRFFLRlVB?=
 =?utf-8?B?ZTVNbFE1SGcrakpadWhXT0FQOFVXaFc4UUFaRjhINmJjZDlEVUt6VkdkTG1r?=
 =?utf-8?B?b2xEK2tXbklRcGg4TUpNcjIrNkU5ZytuODZkS0JtOHFhU1hVOGdWbVFpZHcx?=
 =?utf-8?B?OGZQRmxZVTZMWFhaZGVwVzE4dk5TenFZTmVlQzhYam4yWjk0SnoyR3pEZW9x?=
 =?utf-8?B?NEJTdUNSUkpZcXl2aHBGWFFBMDVaRVZMWnJPaDl6N2loRWpaRitUTzA5bEQx?=
 =?utf-8?B?dngwSkNzaXBPUWNBSENpOE9oQXFtc2F3VFdzYUtYNEtST3I2c2xIaGlTbno0?=
 =?utf-8?B?bnE4SGJvL2dEUTV2aUYyd1NvVVduOWIvSnZMTG1xcnpTWS9XK1RHQmZVRjd3?=
 =?utf-8?B?MjFSQUhuenhscUZDWW1YeWgwdUxBUU9pc2N2QnF3WWVkajZjMWNXTndyN0Za?=
 =?utf-8?B?YTcwWXBkNVNueWVDY3ZUZTFhd2pRL01JU2h3L3RsWlhvOEU5cER2Mkx4SER2?=
 =?utf-8?B?aU91eEpMYk8xc3daaVlWcWtGd29lMjhBeXlJM1IyQW0rdXJUS0gzeEZveXJW?=
 =?utf-8?B?dDNaa2RxTzlwc1E4UWY4S3hZVmFUYTRUdmRaTStMN3dhU1VHYmlyMVN2UUE5?=
 =?utf-8?B?b05kdE92NU1EOUUzdlF1Sll3V3EySEcvV1ZPaEFIMU94VTV5MllEeldWQXd6?=
 =?utf-8?B?Q28zSVE4Snc3T2NOeTN3VFEycjZoZ2JhU2kvUjhEaWJBQjdqMEZaRElFdjUv?=
 =?utf-8?B?OTRiMjBIQTdZV0dnRHk0KzdYQllqNTZkMklJKzBDZGNySlorVXQxZkRRTDY0?=
 =?utf-8?B?MElMSGF2bVMyaGV5Nm9QcDk0VjdsM0hQYkorWjhjaW5RTzkyNGtpMmxVQjFT?=
 =?utf-8?B?UHZBZWp3ZGpyYmJiWjMzQ01WSFFab0hjR0tPRzZYTFFUYnJXb2pYbENIMmxn?=
 =?utf-8?B?bDVLdjVEeHJteFczUHphWE1TOXBMeDQxaHVhWnVTV3ZjS2Q1YlRJODlwUHZ0?=
 =?utf-8?B?R3drL0VRMWlSV1U5V1hjcW0xU29PdGppM2JpMDFRRkI4cVBMb2FRdFRsSUdD?=
 =?utf-8?B?Q3cvdTRWcXN1Wmo3RzRid2lKNjZ5YWZaUllKMDBnSFhHM2wrTlZXa0FiYUpr?=
 =?utf-8?B?QzFZbXVOQ2R4NkRVOGpDbjVBVTBFYzFodDlEL2FzbU1NeEJkd3o4YkFTWFF6?=
 =?utf-8?Q?z7eI/vmOYksJblSA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 160f9abd-b97f-4b61-68c1-08da1973ff78
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:25:22.7173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FK5ypunWAhDyYVK3yvUSU2TIJy2R3ovF3sd7H7mglgHB2BfjxF8UCa/QeiKJXpzfTBswlea85Gq6JFaZxHSJX5Gv7y5YHJsX+IRzvn++v3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3249
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri-08-04-2022 08:32 pm, Harry Wentland wrote:
> 
> 
> On 2022-04-08 02:53, Bhanuprakash Modem wrote:
>> It's useful to know the connector's max supported bpc for IGT
>> testing. Expose it via a debugfs file on the connector "output_bpc".
>>
>> Example: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 7f1b82dbaebb..33e5345c6f3e 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -395,6 +395,23 @@ static int vrr_range_show(struct seq_file *m, void *data)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(vrr_range);
>>   
>> +/*
>> + * Returns Connector's max supported bpc through debugfs file.
>> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/max_bpc
> 
> /s/max_bpc/output_bpc
> 
> Btw, in amdgpu we have both max_bpc and output_bpc.

I'll float a new rev, Thanks.

- Bhanu

> 
> Harry
> 
>> + */
>> +static int output_bpc_show(struct seq_file *m, void *data)
>> +{
>> +	struct drm_connector *connector = m->private;
>> +
>> +	if (connector->status != connector_status_connected)
>> +		return -ENODEV;
>> +
>> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>> +
>> +	return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
>> +
>>   static const struct file_operations drm_edid_fops = {
>>   	.owner = THIS_MODULE,
>>   	.open = edid_open,
>> @@ -437,6 +454,10 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>>   	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>>   			    &vrr_range_fops);
>>   
>> +	/* max bpc */
>> +	debugfs_create_file("output_bpc", 0444, root, connector,
>> +			    &output_bpc_fops);
>> +
>>   	if (connector->funcs->debugfs_init)
>>   		connector->funcs->debugfs_init(connector, root);
>>   }
> 

