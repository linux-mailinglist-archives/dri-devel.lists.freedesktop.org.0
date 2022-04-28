Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E15132D6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 13:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FF10EE88;
	Thu, 28 Apr 2022 11:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AFC10EE06;
 Thu, 28 Apr 2022 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651146701; x=1682682701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P5wOuON1zGTWgSqqv/FWmwIn0RiLYRcpcpsP6MSMbGY=;
 b=WxkyEhwTCDnWgPJlqcMTn5fwXkLzb7ksTz/TR2ldcE3wBiO0WPk/OO3r
 Y6nNbekTYAgDyePtXrVjb5WPTIYWE9IWp6aGNg8XZcTWPlqnoyCpN0K18
 7MA/P52x874MFOxWQyw/8RPnBsUwE4vz675ET+0LisNpEnhCpdhq65OfA
 lhhorhmXwFjGy6wEGjNZAjM63UbDSz+/VQrKyI9q7Gj0qzxexk84tfnyx
 n4X03RqfeQe8viAQajgnoKeutQw9qjyJxUhSBQBKF8dVOCJnAPncIo6Io
 1DZFCp3BRfVMJuK0sRByb2r6nOgO7iVpZfqXcz4xIU5WKjdMVXANMAix/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266079058"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="266079058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 04:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="581315472"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 28 Apr 2022 04:51:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 04:51:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 04:51:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 28 Apr 2022 04:51:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 28 Apr 2022 04:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0+ebIUO7N5r4WoDsJILyryXK16tqtZpK2Ic2An27NSBNBAVe5ge9joNTtQD0qHvdRWwWw0t2faga5cDVG8vzhBKfszvGQEKBkHH/JlVMOuPsmcXcvhNNrMyMbkPff0tgLm/GS/nVpEroe9K54AWvx+BQ9qjvAbFlisEuwWj8pJUpY+c85s1JpB7EOfaRCQ4+NVAQGvw5QKyqv4gjPTrnX8VnYr2O/oRQPKLY8DFJu0b9WSjxSIP1ZLUHjon1AvniF0aKPjU3SRbCD8d9YJphJYD/cEBd36EoAjo6t2iQwYuVjVYSxqIZYCCmzf4XiuUP/P9gTp7tvRM/tY9tHhngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/bTny1OZE9VM4sv4JYBH2Mr9daTIgHmZQsdgZJh6II=;
 b=PSpw33eRPhleOFunKmb3l1oGBjaoIrCO0ypDp1XXWzpzZUGG8Y5Fy63g93JMJ1q4vb8ZRPqET971JZ5TIp2RXDA3vRM+VNjHGk8ToerhAS/td8UXUa0zrAezmPZVqKq3iZ0C9bqYsmFK5GUDvBYC8oU3dsiYwTrveinvB+0nOCKhQiqXL2DzCuuqjnzypg7J0mziFByqLQcZSM7Xn0thHyCJSfL1MkvcF6QMvsl+45C+LX/FuCdHTprezxd+GcV5CI8K4rFQJkna0h4Az6mVT3olBu0vxqTG/0gfiQv3i07W22I4QI62wfva7f/rzJqq1fPQQ1NUGQ/gFocODJ5IiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Thu, 28 Apr 2022 11:51:38 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%9]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 11:51:38 +0000
Message-ID: <e96fce3d-c406-3f3c-48ed-f77c15f0ffb8@intel.com>
Date: Thu, 28 Apr 2022 17:21:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC v2 1/2] drm/vrr: Attach vrr_enabled property to the drm crtc
Content-Language: en-US
To: "Navare, Manasi" <manasi.d.navare@intel.com>
References: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
 <20220425064612.2993587-2-bhanuprakash.modem@intel.com>
 <20220426220107.GB269266@mdnavare-mobl1.jf.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <20220426220107.GB269266@mdnavare-mobl1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197e855b-d214-4b9f-7850-08da290d73e9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5176:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB51768026B51D607A1320CE928DFD9@PH0PR11MB5176.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvQjStt8vYAPbOHWvsJ8QvUPZX42CAyGjeFPBXFCw3/OWqifoG6ntc9cGYVkz318rvUrb7ymceNw7qesyUIgaXSkriWggzYsztPMgDrkl7q4GK1EpXWXfU7a8vNostLJ4ye8h1fM/spDzOERdrsFRRsjWdHG4PjAN9bKrv3/HGAaNt6yvD6bfemdXJ/pJX4BCNbYdRZ+Vflo6pL6XbM746RnObJY3QE3/fjh3B4UCr3d4yUFM3JIPD4y28BQEo3dXHOOU56oHVbZEdrVGubtzKsw2sGu861bno8XP86RKBp2VLvNCHKsguPWk6EzWjd/RbH0sqZ6w7Y9rEpucqfVzmLVOynWpxC/Ye6iV/w0mikvHgB+p4hfghNj/MPcpNDoLugUlddFO8jl9OA7vcnHCPAPB7JPhImkrO+j4cKdjVXbtnSgqFt4N4c5/R4/OR9RmRRGIAOTaHNqfx48EHOIiwTP6J7zNufU6tr1JYN8MTWKDLmiJzH6TdukcYDAKDPaattP0YQ03+zWV4dW+sqMH05qX1jzuVf5ALTwWLHYqwMWnZd8ALj3F++InvIavW+hMBf0A5fsSr9jkMfSQZNXwAgKpEKTIZNZIGfDiTFC/1EnqPz5V997HlC/8IpyXbjgU+dNZVzzZr+9hJbWii1nWncMjE1SbUTd9m/JLasSzQgcrxxt9/OYsqX8rFj4+pOWRjI/0d2ybssbfiGSCHyBo0O3V0XqEPeLDb2zfHJq7J4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(66574015)(966005)(6486002)(508600001)(2616005)(86362001)(26005)(6506007)(6512007)(38100700002)(82960400001)(6666004)(66556008)(36916002)(186003)(66476007)(316002)(2906002)(36756003)(5660300002)(66946007)(8936002)(37006003)(31686004)(6862004)(83380400001)(4326008)(6636002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhvSkRibDJzK0FFMEVvcjdlenBOaHk4VjdUTHB2bHBsNk5tbkVSaE9wK2ph?=
 =?utf-8?B?WVNtSmhSUldNN3h3c3RWVEFUMGRVUjNxTEJVdXpOSzQ5TFQzYlkvdmRvZ0x2?=
 =?utf-8?B?aExDL1BlSjB1T0JRNmZnZldKa1hvN1o0aGg4My9vSkdrWUZ0SEVET0VwYnhw?=
 =?utf-8?B?U21DeXk2ZURUQ3lJblhZZGdyS1FFeWt4K0M0aWhjbU1taWdDeWN5TisrL1B6?=
 =?utf-8?B?WlFKcElySmVQM044QWRpRWNvVDk4c1BqclFHUjFLVDh1bVhERE5xTTU3M1dE?=
 =?utf-8?B?R0lmTVRBVmhpR1R1MnhUdCtvZDdGL0FWQ0NObEdIRG1QLzFlYXF0TE40blJN?=
 =?utf-8?B?RmRqZFRHcWxoMUR5TGIzTlVIdjdkUkdsd2dEMENRNkpwS21FY08xeDJCVjRs?=
 =?utf-8?B?cW5oN3Rjdit2eEc5dHIyWERLZDV5TFFLWit1RmR2Lzd5bnhtR04rV0UyNmty?=
 =?utf-8?B?dFpXOWtUdWw2clQvZm9keURHM0QzaXd2ZWxlY2FPNk1MNFhEeFYxMFh2a1Bx?=
 =?utf-8?B?U3JNMUxmYU9EYjAyeWloRzZwNmNJNTdVWE5HdXpKM0VuNzNmdjRnNnN4OXpK?=
 =?utf-8?B?YU00Wm9qNHJaNnJRb3FoVEZPTXl3N2UxNm40czFTQ1pKYVJZRWc5RXJFMTlv?=
 =?utf-8?B?dThLUDZwTGdXbXB3WlZVc2FPNlVlK0puM28rS3VUYVlmc3A0Um1UMkdQdzBE?=
 =?utf-8?B?Yy9ZQUJzeXNub2kva3FQUlkyQlFEL1pORjgwZktNRGNxMEtwdUhpZ0NpNnUy?=
 =?utf-8?B?TzNuMkZucUpTOWlGYjkwU2d6cUhtQVNmVmZQMmNEZWoyVHhuWWFzUDJOa1lV?=
 =?utf-8?B?R05YcnYrOTlDNHYwT3UxY3l2Y0wvMUN1NUQ1QTNNUFkvZEprTW1HODNpOHhn?=
 =?utf-8?B?WnVwajF4Rnd5Qjh0MzZKelFOTUI3MjBzcFBpcU9qZXJYRHFpbnJvdmF1c1dy?=
 =?utf-8?B?R2svR1N4SnNISE1jeENMNWt3RlcxWlQ2WlZoZ3E2TzBTZXlXMmlLMnBOa0sw?=
 =?utf-8?B?a29PUXcwZklrMU9PWFVQNHcxaWFKUDUzVTNHVXgxZ25HRE9xS2l0V21KK2dF?=
 =?utf-8?B?dFQ3bmFYMWhEbzJ6MnJTUjZZUTkwRjA5L2VtbkdrUGVlSjZkRjMybkJGRWNN?=
 =?utf-8?B?akVIOGd0cmVFRU81Y3BoL0k4bGlPZ0p1TzJkZWlOWlpDQXFTSWFQZS9NZWRh?=
 =?utf-8?B?YVRjRFdUT3dpdXc4dk9ITDV1MFI2dHN1WHlWUUlzSjhjVktLTDlpY1Z4WC9P?=
 =?utf-8?B?d2Fxb2hJMHFucmZoN1BnTFJwUFhoL3UwUjBodVJOQm9tT2NremYwMkJoVHJx?=
 =?utf-8?B?YSt4eDdwZGpJK2RNQmxZa2pTRnBYS0ZZeG05U1hyaUVWSEFyRU9TbHhPQ0Ey?=
 =?utf-8?B?YnV1TWMvb2NCOTRjUXJ4TlpzblMydDg2WFJCekRLV0hoWWNMZlY0UHk2bWh3?=
 =?utf-8?B?eS9rdnRxeWJ5UkRNL2tLRHBSY2FzMG8rUTlYUGdqSWRGNkNvUlBXV3Z0dm9W?=
 =?utf-8?B?M1JqVGhYQWZrRjVJRDdhdmlDSXNhSDFhbGp6MWJNZlhZNWJlRGYyRlNWb0Zl?=
 =?utf-8?B?eVBhQXRoTDdRUnJmS3VrZHpud1A1WmxsU0pCYS9xRmt5UFFxVitEWGZlRGhx?=
 =?utf-8?B?UkQ3MGhmRm94aEFSVFM5bVBpbFN2Y3NPZmxsMnpIZTR4b2VhTU0zajF4TFll?=
 =?utf-8?B?eVVvTEI1anZDdkZPOVRaUGlvUG5OUHJtSWR3ZHpUSDRMV3JXMEZDM3JKaGZT?=
 =?utf-8?B?TmZkVkgrTElxOVJuVlZ0ZHIyRU15Wm01aHBwaUcwaElpRXAxQ0lzRjhrZkFx?=
 =?utf-8?B?TkN3eTg1V2R5ajQ0V1pJajE5WWVsZ1dyK05VaHo3YVNLdkdibHhYZlhjWlRF?=
 =?utf-8?B?ZERXVm5mcVFlQzRSNWdpVTF5ZjlpeTI5NXNUcTFGUGlqSy9zY2RlTzRZTnBH?=
 =?utf-8?B?WmxhVkVOWWlUU3RKNENFVTRFL3NmYzhhcjJ4VTgyS1JsOGQwRURZeG1MRjhL?=
 =?utf-8?B?NFNqOGp0VUl5T3JkTTh6KzBFRnVEcDJnQzNkTkd3R1FmQlNyVWdVVDR3eFlV?=
 =?utf-8?B?ZkZZbWV1a2hydFM5aTVCQkw3cnlvRElwNi9FZ1hvb3RNMGFrRUovT0VVVG5u?=
 =?utf-8?B?WnlrZ0tJM25rRzFlb0tPbXJnOE42T1ptREdaMmticDJIVHlPTXRRemtFSU9N?=
 =?utf-8?B?YW9vU2s2R2FXelFXcDlQMEtGWktEc09lU0FHZkZwUk1IcC9WY2t1eWQxOTYr?=
 =?utf-8?B?RmE5SmVpQldvUjZQMVdnN1BWNHF6QnN4UkJkUHRsMmZYNGdGckNYTG1wb09Y?=
 =?utf-8?B?V055WnVsZG4vbzRNM21qQmV4ZTlqSWJ5VFBVczlpM3FJbVhKeUJFNXl3Z3Z6?=
 =?utf-8?Q?vn9AZ8WpxG8j2Fcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 197e855b-d214-4b9f-7850-08da290d73e9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 11:51:38.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZ2cX5bKrUxnrZyNuhb/6STsOIZA7nTsdR5GtBdS8ozeo/BlihRxmvPg/vxu94jH8Hs/aXj36BboU7OPe691l7dWnseoDm1Wv5Tdy8MItN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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
Cc: intel-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed-27-04-2022 03:31 am, Navare, Manasi wrote:
> On Mon, Apr 25, 2022 at 12:16:11PM +0530, Bhanuprakash Modem wrote:
>> Modern display hardware is capable of supporting variable refresh rates.
>> This patch introduces helpers to attach and set "vrr_enabled" property
>> on the crtc to allow userspace to query VRR enabled status on that crtc.
>>
>> Atomic drivers should attach this property to crtcs those are capable of
>> driving variable refresh rates using
>> drm_mode_crtc_attach_vrr_enabled_property().
>>
>> The value should be updated based on driver and hardware capability
>> by using drm_mode_crtc_set_vrr_enabled_property().
>>
>> V2: Use property flag as atomic
> 
> We already have userspace making us of the CRTC vrr_enabled property to
> enable VRR for the CRTC like in case of full screen gaming.
> 
> This can already be done through:
> drm_atomic_crtc_set_property call. Why do we need additonal helpers
> for setting the same per CRTC property?

Thanks for the Review, Manasi.

Yeah, I just realized that we are attaching "vrr_enabled" as part of 
crtc_init()

drm_crtc_init_with_planes() --> __drm_crtc_init_with_planes() --> 
drm_object_attach_property(vrr_enabled);

I'll drop the drm_mode_crtc_attach_vrr_enabled_property() helper.

> 
> This is a default CRTC property so it will be created annd attached for
> CRTC as per the DRM doc:
> "VRR_ENABLED":
>   *      Default &drm_crtc boolean property that notifies the driver that the
>   *      content on the CRTC is suitable for variable refresh rate presentation.
>   *      The driver will take this property as a hint to enable variable
>   *      refresh rate support if the receiver supports it, ie. if the
>   *      "vrr_capable" property is true on the &drm_connector object. The
>   *      vertical front porch duration will be extended until page-flip or
>   *      timeout when enabled.
> 
> Then we can use the atomic_crtc_set/get_property helpers to set it
> Am I missing some other use case here?

My intention is to set/clear "VRR_ENABLED" prop based on the driver and 
hardware capabilities. And user can request anytime to get the status of 
VRR on that CRTC.

Example:
Consider we have an Non-VRR panel is connected, but driver supports VRR 
(hence vrr_capable = 0)
  * Request from user-space to enable the VRR on CRTC.
  * Driver should take the decision to set/clear the "VRR_ENABLED".
  * Request from use-space to read back the "VRR_ENABLED". It must be 0, 
since "vrr_capable" is 0.

Without this series, in above scenario I am getting "VRR_ENABLED" as 1 
which is not true.

IGT to validate the same:  https://patchwork.freedesktop.org/series/100539/

I think, still we need a helper to set/clear the prop 
drm_mode_crtc_set_vrr_enabled_property(). I am not sure that we can use 
atomic_crtc_set/get_property helpers here, as these helpers are used by 
atomic_ioctls only.

- Bhanu

> 
> Manasi
> 
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   drivers/gpu/drm/drm_crtc.c        | 44 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_mode_config.c |  2 +-
>>   include/drm/drm_crtc.h            |  4 +++
>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>> index 26a77a735905..95b4a0c7ecb3 100644
>> --- a/drivers/gpu/drm/drm_crtc.c
>> +++ b/drivers/gpu/drm/drm_crtc.c
>> @@ -883,3 +883,47 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
>> +
>> +/**
>> + * drm_mode_crtc_attach_vrr_enabled_property - attaches the vrr_enabled property
>> + * @crtc: drm CRTC to attach the vrr_enabled property on.
>> + *
>> + * This is used by atomic drivers to add support for querying
>> + * VRR enabled status for a crtc.
>> + */
>> +void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *dev = crtc->dev;
>> +	struct drm_mode_config *config = &dev->mode_config;
>> +
>> +	if (!config->prop_vrr_enabled)
>> +		return;
>> +
>> +	drm_object_attach_property(&crtc->base,
>> +				   config->prop_vrr_enabled,
>> +				   0);
>> +}
>> +EXPORT_SYMBOL(drm_mode_crtc_attach_vrr_enabled_property);
>> +
>> +/**
>> + * drm_mode_crtc_set_vrr_enabled_property - sets the vrr enabled property for
>> + * a crtc.
>> + * @crtc: drm CRTC
>> + * @vrr_enabled: True to enable the VRR on CRTC
>> + *
>> + * Should be used by atomic drivers to update the VRR enabled status on a CRTC
>> + */
>> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
>> +					    bool vrr_enabled)
>> +{
>> +	struct drm_device *dev = crtc->dev;
>> +	struct drm_mode_config *config = &dev->mode_config;
>> +
>> +	if (!config->prop_vrr_enabled)
>> +		return;
>> +
>> +	drm_object_property_set_value(&crtc->base,
>> +				      config->prop_vrr_enabled,
>> +				      vrr_enabled);
>> +}
>> +EXPORT_SYMBOL(drm_mode_crtc_set_vrr_enabled_property);
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 37b4b9f0e468..b7cde73d5586 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -323,7 +323,7 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>>   		return -ENOMEM;
>>   	dev->mode_config.prop_mode_id = prop;
>>   
>> -	prop = drm_property_create_bool(dev, 0,
>> +	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
>>   			"VRR_ENABLED");
>>   	if (!prop)
>>   		return -ENOMEM;
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index a70baea0636c..bde657cb0f9e 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -1333,4 +1333,8 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   					    unsigned int supported_filters);
>>   
>> +void drm_mode_crtc_attach_vrr_enabled_property(struct drm_crtc *crtc);
>> +void drm_mode_crtc_set_vrr_enabled_property(struct drm_crtc *crtc,
>> +					    bool vrr_enabled);
>> +
>>   #endif /* __DRM_CRTC_H__ */
>> -- 
>> 2.35.1
>>

