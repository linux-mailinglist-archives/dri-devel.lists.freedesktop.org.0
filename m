Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF024BB803
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5317710EB71;
	Fri, 18 Feb 2022 11:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8F910EC1C;
 Fri, 18 Feb 2022 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645183541; x=1676719541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E6cHzxMKXbfBLRvZOM6o5cgMUIX5Usrenkv8n42gNfk=;
 b=HmzP2JH0JNDqtPsjEHR7i93cTywx11ABrjbZOrbJ+rzZ6Pv0GSVJxto3
 PaMAWADTye6xDsJisA2jZMvhSnUaS4MO2m/lW/tncCs5VmoFBc76vDuLw
 vvljn0mG2SlItAGC5bhdl8WGKkg5ErIpFVUXNrmzN+yhZKBOwdwTAIvIN
 QqMvVAJ4EgKX1HsvlFx8IldMU01g7XIddvAwWoamZfIcuJs/9cnmzbiPX
 C8hIrK54x4NS3yfyTgsu/1kxGmgDRi57M2O6PLov3nxb/R56/HNaSS/PM
 rFpPq04jFSkkC1BQw75J7Hp5iCFS4gYS/ADqWBAJdFrzjrAIvuhS58djV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250864236"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="250864236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="626596411"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Feb 2022 03:25:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 03:25:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 03:25:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 03:25:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 03:25:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuPinH5akW48s3Cyodvrg7g0KRST0bK+l10FJh5/hzc7lrQR2dxtsjrAhwxGjA/3WB+fo7lcHo7OgkAeu2/nQm+plRiQvSAkwcrC1mC1b3JB9+k+lzY7s0y0ZCQAPqHY/txYDYAxxwnSxrhQlBv5wNQKSEpaMWeVS8NB3YRmndVN8r0zGjI7ctu12Lv3f6cNS8jjZcPysNxsLIObl4zYDiI4bFNG5yssklypOFKQhHMBFl8Xcnmuul8oyrI2xJZ5xcwk/rsXbjqc/W/eCa7cR3JHRiy4IgfOLku4s9QMiF66v6YcoD14qrEt/tKh+Vpv5xMwNEi9QpB92EhKCHYAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAZUWsp6YcuGG804+ijE0c654qebDKAfOe6KvEUFAJ4=;
 b=EnZl7XLUwAVtyP25zZBHBqp75lgvlCU8XOhO3+ePKOgCsY6zcSc+xuyZ59uEdqAI5vY0xDE+586Vb0LewTZTwQJh55dg4ZuShWEA5hf8dZqWMkF0eC6ESvIfD00IF+NowbIc45Unqrjie9DX81soRVXJo61CtUGio6OAEwgeTWxtPOab63RMprwvIDvpemgrqlHugULg4EaqypqKINX2jqMRzjPIVxSxdRqCUfjmhKt9Vwl7XptxLvSyZott9PI3nON3zIRlzTmEv9x7yiEnSDWL4O0/ccCKs3wlkMLX14J3V8IKwrt7LSeT77VFkAjMQmr+Jm/+5jdN4Im/k/F8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN6PR11MB0051.namprd11.prod.outlook.com (2603:10b6:405:65::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Fri, 18 Feb 2022 11:25:37 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 11:25:37 +0000
Message-ID: <87462b40-c5c5-103e-3897-9f6cc5c91112@intel.com>
Date: Fri, 18 Feb 2022 12:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 06/22] drm/bridge: Use drm_mode_copy()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-7-ville.syrjala@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220218100403.7028-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20783079-9110-4264-848d-08d9f2d1630f
X-MS-TrafficTypeDiagnostic: BN6PR11MB0051:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB0051F74BD7FF58C8F2DC026CEB379@BN6PR11MB0051.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5+wWmypupyU6BeaHsfzTX8LFl5Nbwan0pWGA7VvpphcxcQJzTwsBIl7FqRH2wV4cCeqmm0CG+pfHCEP2AKvqrKvZgXHnwkyA0GasEIo8t2vlZsNtf+Y3uv82KqKX0q9sKBra717/jg91l0nKLaZDg8xLxhnXoqgOmTgHRcdw/u0Oc+U99M7IO0c/kfMDh0/CS3T46EU3qAo7+wiUjfN2XSphpPkwv8dNaZIgs0tP+z+RrjrIz4cKSrY8WuQjTJoFP8dFFXRUssk97t6U1IR+SmKuJFt12h5KVL8wC4w2IJ9h9ahUAoqk4mWFrrBAwo0BBg757ngzPNexQMvjonwspzblNF+yJyf9CZ8PUSzcIzywaHRh9ngGFUygjqYKfS9Ax+0E1p07blfuVvAY22rW/w18UkHNQ08C2QcU6jVWa2vSI3oZ4bOnQO9VMdqiClJovUrJH9WS/z8s3DgIiw+z3Ymzw8OmLDc1jPr/COQVk6oZVXbn09r1dGDAMjVs6vGFv3k9BZao094mJaK+/F4WPe9RU2UMJXSm7jjsxzsIrPGDsbCmEgecLBQzyuWNHEnMEI/uN7qyIfdNyrSYUtnDS7TvIDAqOHtgWKzHjRDrbbUl2ycO2pZP/e10ovJp7KNRCGPDu2oTQqajLMJ/IIGcisUwfrDdJNPmiYev0TGVs0ynQCIwMawqQlMi1Ry6RwVRu/SGDLy0+zABvvkGacpNHeGBdkWwB9fd16RDpqwH+3HU6j/IuQWwEAbAZYep6p6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(38100700002)(83380400001)(508600001)(6486002)(36916002)(53546011)(6512007)(31696002)(316002)(8936002)(44832011)(36756003)(186003)(26005)(54906003)(5660300002)(66574015)(31686004)(66476007)(66946007)(66556008)(8676002)(82960400001)(4326008)(2906002)(2616005)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZvMHNhUTJnOU0xMVFBaFp3YkRxb1RpbzAwTnlSVWFpc2ZId0xiZ3Nvc2FJ?=
 =?utf-8?B?MFBtTHdxS21aQ0duZ3RmZDRlSzBTR3JodmlaVmFuS1RmVXB5T0pzUENxMUMr?=
 =?utf-8?B?M090UXNuTXRwaGFjUnFFNEhkT2M3ZGVJTUI2RDU5cDlaK1QrSW1jMk5saDNx?=
 =?utf-8?B?emNLRGpxMzdJbldVRXhDQlNHZy85MVhLVFRFR1IvcTJQR2hyRVFGakJ4UDUv?=
 =?utf-8?B?ZHEwZ0RNMDY0S0RQYXliaUpvbkYwKzhhcWNBT013b0lrYWtlVE1VYmMxR0Ur?=
 =?utf-8?B?MVcxTXVlWHN6S3FjclFqOG9GU0N5WHJ3NExsMGFHblRwM0VtcDYvOTRXV2k3?=
 =?utf-8?B?cTA1TVFCUU52TEF3U0FhRWkvREoxaUdtc3AwOTE0TkNHZFhGcmR0QVFjUG43?=
 =?utf-8?B?SFpLamFMaWg5dDJpUmNJKzViRjlEWWRzV25NN0FadkpwZ2JyTXRRQ2RPRjZ4?=
 =?utf-8?B?cEFxdlFTYnBFMFBWVjRSKzF1aXc0KzZZTDVXTG9VMm95VWFqRkN5TzJlVmdh?=
 =?utf-8?B?cWZRbFpWMzlOUmVnSmZGdTlENmlhVzF1cDgveUxUT0gzVFo0YWJzQStDUmkz?=
 =?utf-8?B?UVIrbHRYOG1IRjRqWTV3VkVUeTJ2R2J0T0VmNTdPay8xMk0rYnkxbnJyRWpT?=
 =?utf-8?B?bXlhcVlqNVVWazRjTmlUVmthNU9mUjR1R3BhQWZuaUFJRzR1aGwxU1c5RHZn?=
 =?utf-8?B?b3dqUERWb2hmRU05TklqZWgweFQwY0ZJRXdLc2Z1c0ZMWjEvbVZOUU5Jb1Vq?=
 =?utf-8?B?b0s1MVErZnZCQzA1WlNSUUxwSkhLTEh0cnE2eXRnYUYwcDJpTnVpTll3d3p2?=
 =?utf-8?B?TU42Q2hVSzdDdUVuRklzcUxWbnhwWXdsMnRaT1JtZmM2YTF0M09LV1B4VUlH?=
 =?utf-8?B?M3hrejdza0UvM25yU3ZMODlLQzR4ek5yUzRESndFOU5SZ01odkNRNXFlYlky?=
 =?utf-8?B?VU1vZE5COUV3N2lRTDE2NVdhQStLZzYvTFMzdjRvcndyMUp6NkU5TDk4Ly9y?=
 =?utf-8?B?V0c2NVFvT2ZBbzBtVkNJUDNUWXZKSElLRDJSTlZDT0JXNHFYelV6UUtQQmtX?=
 =?utf-8?B?V2JFNmFjdW54L29GVDlvWGxjTlpEcnl4Unp2ZkpCM0hYS0lFRlFSdTlDc0VP?=
 =?utf-8?B?VkVoTWJpajNFT2RxYnNQemFtNytBczhaZTVFOENLVHl1dzlPZG1SbUFYNFVF?=
 =?utf-8?B?OVhveVR4bHRJT1NWRWNrc29kaTNzaTdTUloxbXpUV2FyMVlReUdUUFo4UDhB?=
 =?utf-8?B?V1RwcGJhQU1FZElCTFphcFIzd2VlRnBUcUZmTGFWeHY5dDJEblJvS3UyeGRT?=
 =?utf-8?B?L1ExUG8xKzJCaEpUUWMvRytVZkdEMDI0czc2NnJtYk1sTVB0dUU4VnRFWGNB?=
 =?utf-8?B?Ni83ckl6NjR3SllDOTZIa3FIdHROaHg0V1RkQkdIU0pQYko0ay9tNXNkQUlY?=
 =?utf-8?B?TEJjUWRzbzdyVjdlMUN3Rm9CbkpwN0xnR0t4ZDJvaU5oNWIwaXEreGlIdFVC?=
 =?utf-8?B?WnhPaDVPb21QOHhMZnFVZkdHMGt1NE5rMDViZC85a3owQTN3NlkvcjhZaHNW?=
 =?utf-8?B?T3haQ1EraHlUVWdKSU1uMW5YUmJZUFZOWmxzTVlwaFdBK1ZraUo4U1BpSFNr?=
 =?utf-8?B?M05jKytBVW1FMm1CZ1c2dFVRN0pMWHFmVXNHS2UvQ2xkNk52ak9OaStoUytK?=
 =?utf-8?B?b2tPRmZoZkl5SHg0bzE2SmZsclkwZFB0OEpmK2w0MkFOMDROQXdzWFQzeTg1?=
 =?utf-8?B?TExVdVdXT3IxR05zTTErRGhQcFB6akQyMVNrYnNXWVVCWUJsODVmcmYwbzhX?=
 =?utf-8?B?WlVYUWRsRjZIdGhqOTJZOStwUzBya3BqOU9hckppSTJqU2VTK1dEUnVZQzhZ?=
 =?utf-8?B?ZFpGREo1QzBlWTdlaUhRcCtLRGdDcmo4NnhCNVB6cHozT3o3OVVhM1R5MXBS?=
 =?utf-8?B?RmU4bUI1bk8yeCszZTdpUGMwT2NwVnhXWURWUDU1bVp5ellURmVtZmpwZTVI?=
 =?utf-8?B?YUZQUlpZMVd6T0JmdGJmOW5BOS9uZlpwRmJSOWZkWC8xdmRyck5XcFlINktj?=
 =?utf-8?B?RENxZUJ2SUMxRjhEdnQ2YmxIRVBBajZ0Rk1mQm1hWFhLeC9FWkNRVTJxdU1z?=
 =?utf-8?B?V1pDT3ViZzcvUDVGeGhnQWFOcy9BYndZMEl4ZndhL2tlZUFOeFhlQzNvMk0z?=
 =?utf-8?Q?gcolXJMmBPYP3rc8oyM9VyQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20783079-9110-4264-848d-08d9f2d1630f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 11:25:37.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmCGagPf5PVNJAIREl3HPHItiiyrYFrYvGvu2/MEXWo6GfnwUlxLeMpPXLLBqQk228O/G+Vy9wArtZrpARo0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.02.2022 11:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
>
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
>
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
>
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
>
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
>
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
>
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c          | 2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>   drivers/gpu/drm/bridge/tc358767.c         | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 963a6794735f..881cf338d5cf 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -857,7 +857,7 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>   	/* Save the new desired phy config */
>   	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
>   
> -	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
> +	drm_mode_copy(&dsi->mode, adjusted_mode);
>   	drm_mode_debug_printmodeline(adjusted_mode);
>   
>   	if (pm_runtime_resume_and_get(dev) < 0)
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d220..a563460f8d20 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2830,7 +2830,7 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>   	mutex_lock(&hdmi->mutex);
>   
>   	/* Store the display mode for plugin/DKMS poweron events */
> -	memcpy(&hdmi->previous_mode, mode, sizeof(hdmi->previous_mode));
> +	drm_mode_copy(&hdmi->previous_mode, mode);
>   
>   	mutex_unlock(&hdmi->mutex);
>   }
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c23e0abc65e8..7f9574b17caa 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1312,7 +1312,7 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
>   {
>   	struct tc_data *tc = bridge_to_tc(bridge);
>   
> -	tc->mode = *mode;
> +	drm_mode_copy(&tc->mode, mode);
>   }
>   
>   static struct edid *tc_get_edid(struct drm_bridge *bridge,

