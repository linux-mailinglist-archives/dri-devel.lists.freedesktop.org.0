Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7C7E6966
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFA210E203;
	Thu,  9 Nov 2023 11:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936E410E203
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699528698; x=1731064698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3vNuJIkswCqcCJi3AeFmiPVB0KUU6rxcZ26a89VifrY=;
 b=BEoDC0RDE5+GowuoXULH4XbKxgPusYfiJ3HCLUGnp+GCYbHsFVCFMX3F
 EK9oad9aXF/bvwDnDS6MfouZD2Mm2+Sg9RT9DeA3yy5hjpWJCwvpSc4CU
 v6evBF4xPm9NwcVNaVKmu4tSvoLxEMW8ZfMPkDkt1VVOsBmjKt+vJfoTX
 r3027aBXS3hB0grZE7E7smaVoYxR1AoWB8wB0LZ3I7ghraBjA6N753ukT
 s1ybBUkirkfIDpWFynrlvJa+t4jhZ7aZ0Htd5W4xcWJiYPWbhS8xUQTtT
 nBfu86jvJ5EjU3Ci/23HAd6GSUoVKl4wDsN6r8NMgu0CIxVdrdArRCcqh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454268911"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454268911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 03:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="907099462"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="907099462"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 03:18:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 03:18:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 03:18:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 03:18:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 03:18:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+T7bGyfHpPWRpv/Zz7EPvAMWjfaHuYW0/F9T37qPw8OSEW/ioAF0vWD1Az0ZDN12UaetE3G63jZiAmkburxvRH9DyQOF7eMdiUeB5iod2d7SkVQ7ERkvI5ebAT/pXu7hoWkIylG1n2gNguUT+44DVErCe+lrsenwAiuKVO/USM16TG5IeoQE2C0rOGbwJYs+cN6uA2XTIwfVMYxT6IORYz9KrrzEyiHLLikLKnFFPYuPyD0fMF6kVm1Orqkc4D+MkRwB98rT3p1SxXkjVZTB+CBsT4uDSkKcsFOKv2UKbVMB+JE9zuQZHiOKZRp9nSph+aQt3MzldI0jdY4uucEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X/AXRwvY+Qj6WHRWezncko/OJqFC0OG456ZChX/5M4=;
 b=nm+C0Sep9V5ZqKyl88jge8RpiohMjE47c+sk2YuSgYilgcfDmJQHeRJnglbhebOAdZFO8gSFmB5f/sJrBSwzzte07R2OHHC96gSLyX4DLZZwnkQdrONJl7eGO6s9PfxU42g8bnPSZntHzYtPP1IwuTETqz9YZGCNsoVT55FgOsqKjyyLxOxbf9U9b8QopeWHxuBwtiEZi9NPJ42QD8ld029sToK7b5dTlscnlP1JLl8iqVtK1Q5vdt2mCtSAjOH3MRqS3dzHfcMRHto4DYxWSmwWImE7SVdMqcT9xrHtbsVUtApPIk6GVmdBzSdX1GNPKA06G+/cePP7bWgS7F4wLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 11:18:14 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::5fe4:5d4e:d75f:23eb]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::5fe4:5d4e:d75f:23eb%6]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 11:18:14 +0000
Message-ID: <7b2df780-78c1-4577-8b8b-2a5273b9e53e@intel.com>
Date: Thu, 9 Nov 2023 12:18:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
 <cb14b615-a53e-4f0e-83e5-48cf57e17717@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cb14b615-a53e-4f0e-83e5-48cf57e17717@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH0PR11MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee97653-332a-4a19-3db8-08dbe1159022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIXB4ZrMVZ8SCt2ZKYYlGWJhH01B73SKK4NIyjvJQvU17afCpes3qS+4P8PcTPKe8vm58RrjYmjhP8E/xSR2m9CLDell7OqMIEh5A+qWpxGlfMyTJy6bbKVO4jqimqsVcIH5RpaO6O37hZ4S0yOM3HP2GnqVXuHSvmTmAwy5js2uGrM/xp8P4rmeJlDiqXrC9n84sEOPEAM/ZiOyOmn0d3LyD4RmdH45Tt3tdWfUW4lN2q31WSlqyzuT5RV3Wnw1iNiNS2ccKNXztODfVkRneHkEPo36LG7YL+3jqvln9tJTQn9jvfiaIatN1gi1i+dOjywBQp5w3IHN+bzTusd/yfw4TaYpnpIcBt7mZTT0cn8ERuNIY3IwtuN+HYTA6pRzQyoNLoxIUQWgUERVmVzf4DJrOUxQEPXqS5D+ZCY8NPXA2bhfAQD5SF9Cv06TZMlMBykJJIWkhlpkfYmFCi2O/pnP+kMiB8c2MxbA5QlC25o5R1JR74RR//+crgPl0AN3VaEn5CWbeZQsn12nNOP9dt7EpqqCy4bacHigupzxD27E27jn8BnqW5Ej08HrTJK0Olr9zf6TB8ln2mreopQHWeXOBxVOF8L/EUeR94MEATmdGKLkDYfd+IvBuwmZH2PBaorwvi5CKmK1j0ObEax1/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(36916002)(6666004)(2616005)(6512007)(6506007)(4744005)(6486002)(478600001)(66574015)(83380400001)(66946007)(26005)(66556008)(66476007)(5660300002)(54906003)(6916009)(8676002)(4326008)(44832011)(316002)(8936002)(41300700001)(36756003)(38100700002)(82960400001)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emRKUGhYZDlwc1VhSXJmZGpna3RkelMwZnBPajZkeXN4dEh2ZzFBYU9Bc0tu?=
 =?utf-8?B?elRVak82TUM1MWRxdWlNcXU2QlR2M0hmdlFhT0hrWEtSK2l1T2Z1VEtDNEh4?=
 =?utf-8?B?ZFArM1JxNWxXdmxqTnJ0Vzh4SENEUlpJcnNJb1ZkQ2xheTdOS3pDTkxYRUdv?=
 =?utf-8?B?cjM1bHlDRmZMV29rUEFZcXM5bWUrTWlwdVNLL3RoSFd4K2tGTzFNbXJrcWFJ?=
 =?utf-8?B?cDRCeWFITUVFUklobzB1ZHhGK3lGMFhYYjd0M05Fb09iVFdzOGNJeDdlaCts?=
 =?utf-8?B?djNUU0dla2RUWHhFSWREZ1Y2bDQyT2JpOEFldjZMdEtNUFo4dVZLZ2dNK2Jm?=
 =?utf-8?B?SlFWZnMwQ085cCtHVkhDaTJMbnZKNnIxSDg4b3JRYW1OWEtVSkFYUklGRERY?=
 =?utf-8?B?ajhIU1g2bldORnVlQldQU09idmNHM2RhaWVvWTh5bVhoWGNaSWFUZkxOQ3Mr?=
 =?utf-8?B?dkRJSTBkTnk3RWpVUHhybkVBTTN6TFBwanJhdTdqTkphMldEUFhtZXRPL3BR?=
 =?utf-8?B?cWtyRDk0bUtkZXFXRGVaWjE1eVAzUDVqUkVURGhqTW5aSXZDZTdyNElMTXFs?=
 =?utf-8?B?UGVRUGZGOFJ0bmh6cWZ4dDBBekplc0laYzBzYklDT2ZQNVpIVG5RU2Z4bjla?=
 =?utf-8?B?K3pMSlZxczAveTR3Z1huS05MZ1daZlQ2VTRpdnRFQ2c3NHpQRHdHY014MkhO?=
 =?utf-8?B?d1ZlcWhsRlhudnAvd2k2ODA2eEl1UjZERVJMdmp6MS9tcXVPbnV4a05pMVEr?=
 =?utf-8?B?MWZRSHU3MWJ4Mko1eEJncTRob1hncFAyUUk0LzY1OXZWdXVRQ1dnQmxicHNC?=
 =?utf-8?B?NWZ6d3ppWVhVY2E5WVlpV2h6WnhSK2dlQi9rQUM3NE9ybnpBa3RSOWZJMDdR?=
 =?utf-8?B?TlFLKzRyRUJhY0RCRld3Ny8vY2U1cS9MRGVnMnZqeXBiaStlWlpkTkdDVk5T?=
 =?utf-8?B?emt3VXA0S3FCYmtiU0h2c2xFb2hnUUpjeU4xcTdUZVFkdXlCSEdMNzZsSlMx?=
 =?utf-8?B?M3dSamUyRC84UUhVN0dRYW9EUWVqL1JUSk5lbTR3VVRQdjNDbFk1ZmpSbFpW?=
 =?utf-8?B?Y2JiLzRLTFRQNGljdXo4eHBQT21kMHdtb1l1TGZCN1ZaMWVtdlozUjh5VDZB?=
 =?utf-8?B?NzMxd2JCQjVIRlowaDQ1dnh4aFVoS3FKUHdJQjdIQTV1YmxVTUFhVSt0eWdy?=
 =?utf-8?B?MFZvMTA1djZTbkN6Si9ZVlVmSk1WblBXR01pS2VTalZQMlNkc0tiU1kwZ0Ex?=
 =?utf-8?B?ZDFxY24xelVIK3d0em1LRkFKcTVIMFh6SXY5TWFzc0FabXZJdDU0RFFNNTI2?=
 =?utf-8?B?dWdmSHRyb1gzYmc1K0JKaE92U3Npdjg3NE94TFFmVHAxcUFkc010cFVHMnJB?=
 =?utf-8?B?RGVvMEdqYTJ5cFJ6RW5OQTFnc2RmanlldkRjazRJTkVrbzdjbStvNXUyQUhO?=
 =?utf-8?B?WXR3cjJta0V1TFpUS3E3akw3TnRPYjdNbVJvQ2ZuYTVReGJsZVF2QkZlbkZD?=
 =?utf-8?B?TG14QUtIL1B2RXljcUR3MWkvWTFPU0s3MWJFYWg2dUtzajdBaVUvR21NUkUv?=
 =?utf-8?B?M04vTElNNThkTUIzUHhpWW1HbDk5Zit3TjFQZmRuL2cwMXVXaVg0bGhmVHkr?=
 =?utf-8?B?SjltTHdteHk3aWFmMWhFMTNadTQ4NnNBZjA4enVqWkJyNXFMd1ZERC9EWFNL?=
 =?utf-8?B?Y0I0RnVJVVM5S20rV1Z1Q3RlTVNtcWd2czRrUzNzUkt0dTRqWWo0b3NqcFVN?=
 =?utf-8?B?aERsRGhhK1BpbTBrNkdlbWoxZFRqUDFQMFdMZTV3NDc1WmRCYjh1TVJ4Wkl1?=
 =?utf-8?B?MEFTZFdiaDg0QndiQTN4SXl6czdlUExFcVBDSWZQcGhjWHJJS0RZN3ZkM3BM?=
 =?utf-8?B?c0lRaVU0REQvRjZzY21pWGVYZkp5OER6TDNwbHVoVENwQU85MXRvWjM5cUJl?=
 =?utf-8?B?b0ZjOWtRb3NkdkNzMmNPcC9udEdRalR0ZDVnV0RFYldpcGd3UWhURUNTSXBB?=
 =?utf-8?B?c0RJZUYvV0cvckhTdVVGRTFTcEdoWlNFekQxM2RLdURYeFI4WGNFeEIzZkZH?=
 =?utf-8?B?SDA1MVZwejNmZW1xQTUrTk4rZHVpNEZUU2ZEbVF5VlhIM1gwSW5IZHE1TDFH?=
 =?utf-8?B?OTh4U1JYaytIc1FsZWd0U3JHN0tzTjlJNzVCZTlIQzExSWdXYkhBSnFiNjA2?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee97653-332a-4a19-3db8-08dbe1159022
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 11:18:13.7865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O40LfV1jrEmi4ShiqtqB1EEAbasgEMEWqR1RXc08awm2CV4KmB07b5iC9J6qcEeqE7+kMQAxF/NMcnQ6yPMAOcXLQLPXwroWSWSefWZ7FzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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
Cc: "Somalapuram,
 Amaranath" <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8.11.2023 16:01, Christian König wrote:> Well, you have a tendency to 
keep us busy :)

...:)

I'll try to get other folks to take a look at this. It's a lot of code
to review

> Please keep Amar looped in those patches. I will try to review them when 
> I have time, but he can give you at least some tested-by tags on AMD hw.

Will do

Many thanks,
Karolina
