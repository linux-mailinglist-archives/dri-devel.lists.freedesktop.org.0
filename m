Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5534541DEE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 00:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167510E1D5;
	Tue,  7 Jun 2022 22:23:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3D510E1D5;
 Tue,  7 Jun 2022 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654640602; x=1686176602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1YabJ4LgWfzVFakaAH/b99o3zhyU/0DQ7cDgC2+xOaM=;
 b=KddZL+BWKGf8Y1gIXh51dtKRyVEZ3T33i5XBpIj8lteoPzUGSsMRFTY2
 TmaHOVWjUBo3FNjUlCnoUeGALLR4HkzojbNWUDg1SooY5zbUer5Z/Qi4n
 rqBPUQp+b0Moiyx6JjhOQD7PNcXMyv70K0aziOndwVr1qTbhCIDK7EH7n
 nZBOwY1TYv5ybOLaOt/LLXuTB1xGehqJnOhzIwrBMjye8e/aK4LvaXmWs
 dew6osxcNUV0i4xxcI9iLwowx/xLrNMT2wSACE/Pu6MVWXzSV5bQPgyLZ
 ex//lP70kmK83XOSk89hEpqlfuATKOZU1uwLVwPyViGBmewBX5LUwxThi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277462103"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="277462103"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 15:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="584435864"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2022 15:23:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 15:23:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 15:23:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 15:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF1RU+rQjG8g+SON+HVa5Bp5ML5vkIshGQMHLotwbZpviodjhxazhbLi0gzy1HTSDD6M7sBBMNEUuBLO3nenhEp0WSNDGvOhbTJCx4hw5RYR4YqBEQwPNrO7luHg2WO1FhIN8DJ6m9i4Rh9ApYqU/VA3Um2CmqyPEwhNtP41feVwsEtD8QECLxJKtBIXq0T2lH4jl1uEdo4+0PrQPXtkPdK17UnoPTjkMoJfKG+5NjkzFUUoIR6A27gtke7i9FxDiL1o55hj4brPA93OtCQNEEuW3T6+1duXoZJDTUZAgGESxGRNTYccqYtp+JLtZB3VVuDLJz5l/qHi3gm0aA3jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUybAnG91KbQI60Jgjg7NXJ6CnpVRikDXs/7MRP2Be0=;
 b=iXORw+30zItNqXJ1Gh17kpKJPMe74RttkSyuOEQkojVjOdhIgU341Q/3DJaa8s7CifYFhTeAzDnnXairZ40FD0ZBb5CJr+FdIiKRpHNtghd3dam1dFS4GViaKnOA+aRSA90xGo+Z+f5OFXSCp8+6TK42rD+xIt3L40F915n6tFDSqt+ZH44nZI7bvhdeiK4zL28Brut7Q09h9S73F4QdktV37ezpe0mvP+mLpX1498PehGz53CInAJTXNmBUO/Ec1zta8R3wjBQX76ZQ5GBTKC8cgByQzZC8qcz/roFjsQqHzBtEJ44LE+SBQyWbFysq6tnKGVsq37R+3w2mxt1DoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH2PR11MB4246.namprd11.prod.outlook.com (2603:10b6:610:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 22:23:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 22:23:19 +0000
Message-ID: <6fd4a9fa-5e02-a34f-7c8e-68c8f747e4fb@intel.com>
Date: Tue, 7 Jun 2022 15:23:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc: Use drm_err instead of pr_err
Content-Language: en-GB
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220607215103.3342267-1-John.C.Harrison@Intel.com>
 <871qw0ktzw.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <871qw0ktzw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0068.namprd19.prod.outlook.com
 (2603:10b6:300:94::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6eaefaa-0506-48d3-3d23-08da48d45347
X-MS-TrafficTypeDiagnostic: CH2PR11MB4246:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB4246FB12D313C6DBF8200782BDA59@CH2PR11MB4246.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaHOYeYtho73dwvqHFJo4UssnqVVKG5ZihqDAetQwSUHGRd0YreuciPjBdWtxxIbdarfjcIutxafLyjRgTS4JgtiEu2fzMdpAShyjZkQNPpJAceZZp0AeU4B9HwnVtdtMrp292GCflI/g6kepz4LE7dXJIBT7vX/rbdaBTzISL4yAlp4EFrXstnA+plax0u2O0mzLMDEhpImY5u1jkjhrEoyHisQ6hhrtjppcbjGed25+Xl2MFJo66APmlqLlkjcNgum5hXLYx+FK5rUFwVDGxLCvXyf/D2CNQU2DPfbE4jVfIaf8Bigqt4FH3E34dSjTrgo7LU697RYGuKLTaCi31/UZV3x6I0E3EoEUt1FATypHZIm2qCfWBOvLQFgljgKrggplBNOK2AYXCiA3dpzEA8sqR9yRrIBAY1VS8vLEdJUv6T1o98LGxvTIVvgjU/ha7xwc2TvHJCrV43y9WngiBQ2vRLxeVjLwjn/frnQg7JNqhnaT6OQsVbqIijxK8DMbxQrkWVuHOPCvQHORnPKLKF7fwIWxoU06kEGjKc4L1PYDv8Wd/ieEgPNU8tjVTRlRbzVMJszWRVouwgt/Dh3/3l4nbBz5Ne/Yeqkq3crb42tdHPvG1TyYQbyHhPBjwc1mnZFy426SgUnELUxK1Uu4jfiLddF3kqy5xjcQvnV9ooBW4mGzIuGBNocWmJfAGSyvwxld2U/0VN3RmTeD2pYZuUbRTl0IH+IvFEtQblSR/Diy76mwfX9/KpSJJ8yxzOf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(83380400001)(6506007)(4744005)(4326008)(6486002)(53546011)(36756003)(38100700002)(186003)(508600001)(6512007)(26005)(82960400001)(31686004)(2616005)(5660300002)(66556008)(37006003)(450100002)(8676002)(316002)(8936002)(66476007)(31696002)(2906002)(6862004)(6636002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEx1Ui9zeTNQUWVNV2FiblNIRkNkREl3QlZwMmh5NGR5VUZGSXdRMnZsSEw5?=
 =?utf-8?B?WTduSkpmU2tVMDdqaFJoWEtJYjBweUt3WXBwaWtkYTlmVFdGSkQxWVJneEVT?=
 =?utf-8?B?dTZoM0pKZ1hZaXZJalFaaWFZcVJWdFdOWnVUd0Z5ZmhUekZOb09OMElBZ2Vk?=
 =?utf-8?B?YXp6Z09WUElnZGtlWEFKa1dQMWk1ZFdwVE5aMFNsVEorVVltZDg3RUFENXBY?=
 =?utf-8?B?RjI2cU1jTHNtRjJvU3dUTVdKSnhDYXVaTEYvWTNVZ0NtSFVDRTd0b25nZ05j?=
 =?utf-8?B?RGdRbktaMkw4YXJ0SXE0ZmwvdFJGcng5MUExVWowL1Q5TzZJY0o4ZDdtN3N1?=
 =?utf-8?B?eWNxaUNXb2h0ampNUVQ4N3FTZXVHTW9XcDZiaitLRDc5MVlGOFRSd3hCUXd6?=
 =?utf-8?B?STNXcHNuUk1VQ215Q09WMlNkYzJiY2FKbS9CZ2hlTDAzRDUrR0QwU016Nkpw?=
 =?utf-8?B?OThKYnUxeTNnbWtXdnJoUDB0a2Q5U1k4QWk4QUlsMFgxcEw1eHVleXJMQlJN?=
 =?utf-8?B?WkJYRWdVb0djRHk3cEgyTmsyTHVZdnh1ZGkwUzdzZnZQSHc0OVZrR1RBcTB1?=
 =?utf-8?B?RlZGbmR1bElac0lIOGMyWVEyN05jTEgzaTZMRTROV1I5ekhvKzFaVko2WWlF?=
 =?utf-8?B?Z0RlUzk2S2hTZHVES01WZVBxcHhSWUgwLzRDUmo3OFJYTnhKRnZZaitieWc1?=
 =?utf-8?B?K2tXTGxOR0h5QWFnQkljcGJJT3BaY3F4M2daK1NNSzNCa0ozZVVPZHg0aUd3?=
 =?utf-8?B?R2lJcGR5bmpLeFpFaHNRaGlFallXM3E1K0Q4azVXZnUwTm9Ja2JzNFRyUEQz?=
 =?utf-8?B?Tnk2cTN4Qk1Na0hFMi9nT2F1NFNPSDRSY1pMYlFiaVBEeE1LaUp4NTVLOVRC?=
 =?utf-8?B?WW8vWHdHdFRmaS9iMHZXWHNZWm1nL05kVmw1ZWViNjdjZllhTndxRG54MUhU?=
 =?utf-8?B?SEZiM1dFV3pXbWdrY2RuQVJ2TmdmSHRxUTdWSE1TMDlhZWRicVlzYmdXMjI0?=
 =?utf-8?B?ZGxIdUdlUm9RTDZTWVR3aThOT3pRUkMwRkFJMDJ6QTFVNDlsTW40VVZENDNq?=
 =?utf-8?B?SVNYd0dWRnoyWnZqRWZsWTlIZXNGWlBoQUhQTEttejJqM29YaHZPcGtSSDRv?=
 =?utf-8?B?WkxvSFB0T0ZBQmd4U2ZqVExoc1pwbEMxWldXdy9OVktjUU4yVHVkZzdYVWxi?=
 =?utf-8?B?Q0pqV2huSkpMOGRRZDdHMEMwMmkrS3RObFdmaGN0UEZQRzJMajBOVEZjQzlS?=
 =?utf-8?B?Tm9UL3NuU25CYnpwSmFIL0NodGJxeElWa3BMR0V5TGpFUGFsNG9HanV5RWZY?=
 =?utf-8?B?Zmp6d0I2Nmx3OE1NeVB6SWVnMFBDbnRnTmQ1TTA2ZWRkK2k1SjRoQUlDYWdD?=
 =?utf-8?B?OVdqWUp4V3VtZ25nNXZCZmg4N0RPMGhsamd1VDRJcTZxMHZxWGJEcWpZVU1l?=
 =?utf-8?B?emNWcFNVVDVvNnk5ZmNWb001MWJ5QnlkdWxUa2d3TTFlcGFPV0ovam5FYm5X?=
 =?utf-8?B?dEFVd21XYW9mZUF5NkpacmVRNW44aVQ4RGFkR21BbnVwOVZ2QjNrM1M3N3FK?=
 =?utf-8?B?cWhaSTVNVjZjMURTbW83UEJvQkFSMmZCZElDWUtBYWVMVEJwQnpYdDhWZDR3?=
 =?utf-8?B?ZjBHY2RGOUFJTlFGY2FvOGVxeFhwZGI2SVJXcHpFOVphdE5hd0N2VFNLYzZz?=
 =?utf-8?B?TUV6OHFUTmJjQkYydTJ2RDdLQXdsT3ROdlRuL2ovN2pNcE45S2NiUDZ0N3My?=
 =?utf-8?B?REU2cWtLeVRRRUtOSTJLMitQbDVvd0NWZllSL2RJejZocnZpNFZDMEdxRUhP?=
 =?utf-8?B?aU5UWGtJaHNKNzJKc2o5SERPaTZqbm91UVhBaDZpVnRjMzc1T1lFRU0rVUQ3?=
 =?utf-8?B?TWwvVUZNU3drSVF2bEkvQkZuZXpJM2szQ0QySHNrdk54d215WjVjc3BMUklR?=
 =?utf-8?B?N3hLdTU1V3BxeWl6NG5jR1N2eEh6OTloSS9kQWMwaWRwWUVIYmxTWkIwcjYy?=
 =?utf-8?B?amx3UnVvV29JVkFoUHdzUXJqTnhKYmtZTVN5UzdvUHRENUtIbzYvRFJUMGN0?=
 =?utf-8?B?VDhlRlBHSUFwWC81Y0NibW9qN05yZzVJNkZ3L3hPR01TOTI4S2JrSWZuMFZv?=
 =?utf-8?B?amtSWGt4S1N2WEFLV1Z0YTAyZk44ZjRNUjZCbW9nMGlObm9NSXM5MEt5UXRT?=
 =?utf-8?B?a1djREdheXc1ZVZGaWpGb1pwVzIyTHhSdXRjSlNVM1FFNzE5SFlHcHczdVd2?=
 =?utf-8?B?RmpWUXZkZE4rTlV1Y0xCQkEzbkRwMk1iM1JlcjFFOE8zR2RkTWJUODRFUFc2?=
 =?utf-8?B?c1JBQzRUN01YdUNsdFNUelY2RFFsUjZRS1hWR2x3eFRNU2J3QWV4REQzajZi?=
 =?utf-8?Q?ks7AlqNz6PJWJ2Y4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6eaefaa-0506-48d3-3d23-08da48d45347
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 22:23:19.5665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGrInhMVSBjuiAdXQBD964uuJaFBAb0hgHdfWuKHXNmcDMdiukGpA+4zvLHAFzJFvAj81sfOkYbIug4MQ3Upk64BBPNp5fuaeb/1pfPv4ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4246
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/2022 15:07, Dixit, Ashutosh wrote:
> On Tue, 07 Jun 2022 14:51:03 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Don't use pr_err in places where we have access to a struct_drm.
> Seem to be many more pr_err's in selftests. Is there a reason why drm_err's
> cannot be used in selftests (especially those using an i915 device)?
> Thanks.
I figured I'd start small and just do the gt/uc ones to being with as 
those are the ones that affect me.

It sounds like the only reason to use pr_err is in the mock selftests 
where there is no easy access to a DRM structure. For everything else, 
there is no reason that I am aware of.

John.

