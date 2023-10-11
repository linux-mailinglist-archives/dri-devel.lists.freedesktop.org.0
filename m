Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99D7C501B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 12:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D810E653;
	Wed, 11 Oct 2023 10:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6453D10E4D6;
 Wed, 11 Oct 2023 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697020135; x=1728556135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YPSza6Mbd7JAV1Nj+gxO9bjSynYO3xKSwwV35Qx0LOA=;
 b=HGifDm33ye51XQ3vKwHDH8G58E7AbLgHdjhPY78HmDh0fdqaoASUW+r7
 nP30EsjRZvLKjKgBf9WMqyz5j/VbYU/77cgCVjHFEQO+a0iSz9RV+6Jiv
 7L8cE5G/dp9FTpWxmG/GjPolJ4qnqxbFlIFrqrHCk5Kde2Q0VSfyt3KWP
 /mUvjx0nKfRXU20wYAzDWaJIzbdXoGGUL1ugAxw3TJFyUVQQpUyBTffwR
 mAyBrk/OAupphwVcqaPK9bTNtgGTn+ILirKvML4fv+0JQYJsFyk/T4++p
 /mYfYwzRB3gVTtO3NbQf0/tpqz6KN/o/Umbie9YEXSfGkuFqfviOzDZto Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387474388"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387474388"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 03:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="757512461"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="757512461"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 03:28:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 03:28:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 03:28:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 03:28:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 03:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXR8EY88gTGnU5xDOmajqkUwtBXSo32DGZj6340tF8X/038gih2nM3+JOP8lRRUMbGxy0veDljkrP4zVcC7S5Miu9oFAzmzMvQWj/QbczlLYkcpbOBIUm9qutnm7WIQoYnF16W6WVsrjFFWGWHB77OzeFJTohrnWecrLBJy8WzY/NxBLjwDanF/SbN0+eamFtca18s6b3VzSgGi85ifpUktTS9b+GfdkgbZSiMvWjKqI4Dhy+JhuabmhSJNMW74dba71w+OODT76SOVcFaXd4jRFgTuZogYZELwo78j6pe65Ae+RTz1K+bx1gD86SzwATuNJwEh8QtrsgELzBsPIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxOKsV06ppaHoHNLp2wZf0rBbS9ZiD+ZzvlW8Esvke0=;
 b=hzhaEDifDvu8XDpf+fhr70FKMgz86/itMBNhyu5DA1tnpUXrV4/r+ob8Zy3HUdhoyQe7sqWKrPxpuyz0iiLbH5vAVi++MjCXfWpirYmjkI8N1X2f30LH1ba/q7ZJmkMxi/kMu9f+NU3d6h5DpA/+Z1k+M7g1n+Vyj2cSdHSyMRSR/0U2fneKIulcLUCMCxJC+PwckGzGwxIzAJY44rdAddtqU+7j8R8+HhbRxC3wsdhqoSc9flhzOFBJj9WMe1bMCVZ1JcHJjU1A5kJJSrRHiatrybRahHG7KhKsYkyKNg8FN5C9SPVpvTqfunHvLAwLVnvR3xfoP8biBB6dlYk1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Wed, 11 Oct
 2023 10:28:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::72ba:c492:8b29:c776]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::72ba:c492:8b29:c776%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 10:28:50 +0000
Message-ID: <eec94294-fde4-5e54-ad72-b4404026e168@intel.com>
Date: Wed, 11 Oct 2023 15:58:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Remove the 'force_probe'
 requirement for Meteor Lake
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20231008164824.919262-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231008164824.919262-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f8cb46-f313-4fc6-c5a6-08dbca44dc22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnAAON01vohA3xJfX2EcWopXTz/U5OCAcgLd5xNdDLyKIZLpfWpiVTckolWWRfekyRPVDQcY4ybi7D3VI7R8TZegUcO2k7RwmB8/3wcjnnqEQfuUAGH019W1gIZ3IrCP6uduVdmGcNPACpfIAeiGbntJLre7xOIgElTFCO62l4y+48kvszttQUhPDrFB3AjYHtq3HqjJQU9xJNfqnFd5jzWUiuvNpls58prUmnh0poGbhE/oGtgGdtF65PgyXaiitje9l2rAZ1jtJ9XZiiaP/SSjBcwGwaS/I2yoyHepE7dk8LTQSD4xw6E5HPkZSaOo51BSkWQFFWo0JK9JNig32L2flvViFSRlHgLlGMPoOANTV9ht7bb+XMRxnChSswdyqinelKCB36ZtWdRShWP6PBAt43wBLywAw7cXoEy0lMjxOct0cB7dCiq2CgT3kxR7MJFL4pNoWxzp9fZyqdavL7obnYK2f7TbgPCIU5vIpZQgZnKb6tPagXYof4JnziNH5rRwyH0+yC+0GG5JS64PfU0rFTEjvQj3Z0fyqr3NavH4QqfYY4UtFpr6o07p6D6lCDrGQqRax4/KE1wruo6ZNPXfKBDh+eceV9DsOe++23X7HTr5jDbOODb0OqP8pnpx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(966005)(6666004)(6486002)(31686004)(6506007)(53546011)(5660300002)(83380400001)(8936002)(2906002)(8676002)(4326008)(2616005)(38100700002)(36756003)(31696002)(86362001)(316002)(110136005)(66556008)(66946007)(66476007)(54906003)(82960400001)(6512007)(26005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lsKzBncXRBQXhoTVNqSlVyUlpGNE9LUzJTcDhmVTZtUXlsUlpHeEc2L3FL?=
 =?utf-8?B?bFVmVGVGYTFDbmR6MmF4VXBMS29udTFLcWhaSGFtZmhNYWpudHpxREV2dEs1?=
 =?utf-8?B?K0FxT3YrOFl5cTNleDArZ1YwZ0YwOGUwYUpvWEEwc2o1NTUyS0pYMVlsL05l?=
 =?utf-8?B?RFpDUWhuTmZicDB6NGFwSi92RlJiVUZVSVJ0N2VJTlZualNtVmVGUS9HeE5x?=
 =?utf-8?B?dTBqY0l5cVlBVjRGOThPdHgxWThPVGFweE9oM3V4Nnl4UmR4cklxRzdXOUcv?=
 =?utf-8?B?RmoxVUFTaVY0ajRXWGdJWDdDSmZoc2VvNThLdU56cDJtbFhlVGxLTTI5bTJF?=
 =?utf-8?B?RDlKbUlDODRHZjI2STZnM0dLUkQ0aWwwZzdWajc1aWFuMks3aEtTVUlXanc4?=
 =?utf-8?B?ZEU2VmZFNmJKTG1tM3pQbHp0YVN3MUVTYnF3SHJuSnpQL3MxT0JqNi9Zdlpa?=
 =?utf-8?B?T0VSWjVabGFraW5oV2xxMEJJMTY2bjd4TkhmTDhzR0dJbEM4RFdwdXVBbnFH?=
 =?utf-8?B?aWxvNkJ1cHdUSTkwTE9uMjhCQ05wNDJZQmpqNHJCZy9jYmZxdGJ1M3VLNTk0?=
 =?utf-8?B?ek9uNGFhaktrWVIrVU56WUE2SlhZUHJUTUtsSVd1cjhsRWRPTi90VUxHWTVI?=
 =?utf-8?B?OXNOK3prKytGSzM3dkhkQXJpc0o3dVR6bzlSeW5naHRMTW1rcXRhb2tQTWVj?=
 =?utf-8?B?WldvelkxdysvQS9LN2hpZEhXQWhxRE85N1RTM3FXNURuc3NCTXVNTDJDY3dY?=
 =?utf-8?B?UzRBNmdUL1lRZTdoRVJieGFYa3JhREJta0dRK0hQSHZud2M0K1lPazlVT3Zs?=
 =?utf-8?B?ZzJ1bzVyZ0t4TTJ1THdGaE1qMjNDRzM3dm1TbWVQMENBVGtiNWNYeCt3Ky9i?=
 =?utf-8?B?b3FlanlnUXFITzVOOEpyaVFqOFN6NGduUUthUVJVckxVZnRkekNUSGdhWkZM?=
 =?utf-8?B?UW96SU9WQ1hJNDJucld2TTdJNnZYVy9wek5lVUY0MzJlR2kzaXBZME9SRnVr?=
 =?utf-8?B?eVk5aW80Zm5kTEN3ZEJSR3VORmRaaDNoTnBnOGs5K3dCN2JLOTBPckU2R0xm?=
 =?utf-8?B?OUp4dnhqK2tHbjRzSVRIQm8xaStlTUpXSzB0RzFSVHBnZVRTTzlENWQyNFkw?=
 =?utf-8?B?MXpad3lkalMwYUVXZmFqc1Jaa05Zek9iZGozK1hCTFIvUVZwU2tpZnNseVZP?=
 =?utf-8?B?Y2R2ZkEzeTNpMDZwQnU3SG1JOUg2NjE1YVZndmplaXg0Ny9DNzIzMEYrNndr?=
 =?utf-8?B?cm5EMlNHbnh1K2YxSU8zOVdCcDEzSjQzYkx2M0JURHZmSitIcmhGVXNZa1B3?=
 =?utf-8?B?eE5abFRwK2lmVEJhdGw1SHJMZUxiWk9uL25Xb29pMnNySnY1OHRIQTZLUy9V?=
 =?utf-8?B?T0J1K0ZVbGtIdTNSWjlST0JOTmJiLzhSOHRWWXNpTmJXcis3MEdWTTRUZXF4?=
 =?utf-8?B?cHMyYzVvUXV5WjlTRXJtT01mVUhVL3RKZW1YbDRZYnhFdkEyZlFESEp5SGt4?=
 =?utf-8?B?Y1NqYmRlZW1KWmpzWG1aaGZLM3dMNmZmRENuTDR3dG96dXFMK2p2WkFQUHAv?=
 =?utf-8?B?anNKQzErcmZLTFR6SDRIT0FCV1BGaytYZTZWbjJ2TzJySjRaSHcyb3hlSnR5?=
 =?utf-8?B?YkliOWU3S2wvbFZLbHZXcEZiY0duUHdEMytndFByS0dqajdiMWpZN1grRHYv?=
 =?utf-8?B?amhyUm9PTnA1THFJWkIybjRxR0VkTmRRQVBJdEh3dGxQSmVheEU2ZUZnaDR5?=
 =?utf-8?B?ZGdRWkM5VU45SXBMM3BaQXJLQi9aOFdOQUhhdjJ2cXl3NTVLbHFub3Ruc1Jh?=
 =?utf-8?B?VmU1QjRQcHhBWEZsTkRMT1VKaHpZNld0VElMWnZUajJmSFRNOWlCNUJ0VDdK?=
 =?utf-8?B?NytIMXBERm9KRVQreDJDVjBIL3lUQU41V2Y0K0o3RXhVUXo5Njg3RmNhWThN?=
 =?utf-8?B?YWVzRFNqaHM0cWxxNVZ4aEtHSjM4TDFFSmQzeGxtK242OStDdGVneW8zSkZZ?=
 =?utf-8?B?S1l0WXhzbzZCR21XTDNDbGtXVTQyYVlCM0NzamtUYVBOdUM4RVQ3TVYwdVFM?=
 =?utf-8?B?c0ZUV3ovQ1NSeTNNQ21JSkd6RjJoUE5mL0dIQVh3V25MaGFqV3o1N1ozOFBn?=
 =?utf-8?Q?M0Pk9AysLR9kCk54+3nRQrzEf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f8cb46-f313-4fc6-c5a6-08dbca44dc22
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 10:28:50.7166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNIWvCNL6+qus5HzrVu9W4sFVfRTIMklPuzTJ8Gl7i8JV/5ZCUUzoimyvU55xll5c2XOHXcJPcOAy+RGKvtGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
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
Cc: Aditya Chauhan <aditya.chauhan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/8/2023 10:18 PM, Andi Shyti wrote:
> From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>
> Meteor Lake has demonstrated consistent stability for some time.
> All user-space API modifications tide to its core platform
> functions are operational.
>
> The necessary firmware components are set up and comprehensive
> testing has been condused over a period.
>
> Given the recent faborable CI results, as well, we believe it's
> time to eliminate the 'force_probe' prerequisite and activate the
> platform by default.
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Verified with the latest drmtip(CI_DRM_13736) on eDP+HDMI config on MTL. 
System is booting seamlessly into Ubuntu UI and played around with a few 
display settings as well.(Single display, clone and extended modes).

Also tried hot-unplug and plug for the HDMI and is working as expected. 
Basic video playback was also verified on both eDP and HDMI.

Tested-by: Karthik B S <karthik.b.s@intel.com>

> ---
> Hello,
>
> This patch eliminates the 'force probe' for the MTL platforms. Over the recent
> weeks, MTL has demonstrated stability, consistently passing BAT tests with
> success rates ranging from 98% to 100%.
>
> There's a single issue hindering us from achieving a 100% BAT test coverage.
> Fortunately, we've identified the issue, and the proposed solution can be found
> here[*]. The CI results are encouraging.
>
> Once all reviews are addressed, we plan to submit this series with the "Fixes:"
> tag.
>
> Thank you and best regards,
> Andi and Radhakrishna
>
> [*] https://patchwork.freedesktop.org/series/124744/
>
>   drivers/gpu/drm/i915/i915_pci.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index df7c261410f7..fe748906c06f 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -836,7 +836,6 @@ static const struct intel_device_info mtl_info = {
>   	.has_pxp = 1,
>   	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>   	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> -	.require_force_probe = 1,
>   	MTL_CACHELEVEL,
>   };
>   
