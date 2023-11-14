Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217987EADF9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 11:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C6F10E1F2;
	Tue, 14 Nov 2023 10:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11D610E1EF;
 Tue, 14 Nov 2023 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699957599; x=1731493599;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=34MpgpoKmhFMhBPDgc4o9aoG/C3eC3QzjEWvhyzQZhs=;
 b=Cv4GnV8eNHU86tp/UhvuRFqAWmVr1M0XGNVyLA5IXkHk4Ih5MNeI//A8
 KRhKoJxPTDHMTdTWdwOjaKpZrutZNmA/S6H+CmIixfVRc1NgkUvOC+vWo
 6Lo6mNwlD7NZIlXvIofRkUp60q/W/ppbBIWZ+whV6Xeei3ad13nVScM6/
 GiqBibUouLMSnt86Cly9S7k+bzhNIP58wEbhxtWP3RxAFp2m2xzfhY9vY
 R+JONS/fqypLcA12RiMDHknFOb7fTxBz9f59m7UWpqGd8nsS/Li6Sbbe6
 wfDCIy/HDXauxxIMBKtPNG3P1D/0aVIUiZr50Bw2ui0fco3LtxyIiv0Mf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476838677"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="476838677"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938037443"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="938037443"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 02:26:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 02:26:38 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 02:26:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 02:26:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 02:26:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnFXUlHJvjqjeC+/ziBQAdx+04I7IBlsWILxayrEgSmy03h5Ff0BkgSS3HLlHLy9iW3G0sQoxMG5nszW3dJf9yzYDsBAhP9X6NYVYQMVt1DcMtGDorjozdUxSQYMfY6R7pDuBQB8ipc0TiueaNL1kT678GT0Zg8ivQYiX3dUzE3M/SoILDzeqCU7Bc3O1PZFsPzRM84VWebTkgcsUknEdjNQpe7sc4F77wSPgpFZJ1XAh7vWTDC/+LNpe58FSTlW0g7xur3+roSF16zqpPHH4Q+NDwXy1si5A/NHwIj/1ETKC7KQLmRFRb+FD6OUMCM9YymnYsP3tZEUzOxJxgiqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS+DnxkS4tdFu+KS4+Qkix35WucVElzn0rN/GJ+Y3K8=;
 b=SCKeQb02QRu/b247LOqkEeFkvccwY39xy4TiDZAu3fCarCBHnRSHiAd4RNp/VzX57JxzgkILLSQcm0/K/Dc0m3xzhBT3oGGz6cgtKO+bhIoqpvSEqcGIR1Osb2lAsPLMpM17EmOz9CV65VQNbiB+ZBARuspOUC7336DMM28czrf/6ryzmrI63Jk8eMUiYDz6Jx2nXKXkz11RRuPibmkbWwyG+xYpOj4/x3za5YNaT8gqA1np0G0TVendxCt9aijSqFmxYKMS0Um1td7uUuZoUzDaVqLXM7b4m5aZ0HJ26pHiQSaVSA66Tv2LFxf+O4Bl9TfsS4i4R3YDZ3wUyJaiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 14 Nov
 2023 10:26:35 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d59d:536b:8f8:26c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::d59d:536b:8f8:26c9%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 10:26:35 +0000
Message-ID: <1ff55638-4ade-c16e-b6de-093ff9fe9b1a@intel.com>
Date: Tue, 14 Nov 2023 15:56:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 00/11] Add DSC fractional bpp support
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: e29fae0b-9887-44b1-696d-08dbe4fc2d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IehI4viRXRL/rZ3Wp0JnGRlOgr741pR87mKdyLdiHyCzoicdE8W0JvPkyPc08deK71jAAXZkDM+FB5lexKW1OfzImuDWNYGs0jmDJ9UuNUNV+/7r4dQcJjTXcMsizTn8eUTHeaeniNT3fbnl6J+XfkAI3dj2M75hKsRaQEbNQcM2l4NrjEGs+DbiNB+MzXQ4eg/ctdD63bSSvyKtJAMcxH9OPpi58AICDpsx9Nnc/6hmmt0yfEe5ymTlVtWKPUUYA7QcMhkGBt+r2K0vKkXLGZZthGq2VsDAr3ouuKoVhq+5EmVpV69BWhRpC2HvpLFj0zwHxY9GIT3Ee6iPpj+yYscgPivN/JBv5zqDc61QFCP3d+XLA/5dypN3D1Rr+5LRTRlm4gaYmGyjOh+Ovfd+kn3wdpjh3JjEeVziyVswWcI1M95yMi2APR0JXDbzv8XbVR00sKwoaIpDePW3KyylWA4TcIAR0fA70MaZpRs5gOW3z5vEF+QChMf1Ci5UduX82CgoeFOFWt1Mx5BHmi52hkpLww0aRRDQYwnHQ04QFZaC3jUKqR7sKV6+tG597w8GiL+IIgFfTxIjeZL8mstvIkCpdE+mXTPIsoP/ilILVpLz9AkU86emv6ykBlTa0/qw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(5660300002)(38100700002)(41300700001)(2906002)(31696002)(36756003)(82960400001)(83380400001)(478600001)(66946007)(31686004)(53546011)(2616005)(26005)(6512007)(6666004)(66556008)(316002)(66476007)(6486002)(966005)(6506007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlIL2V2TlpUbmZUNWZISTl4RWZxWktMWi92YUlWbno5UnZHRGQ2K3pCWFJG?=
 =?utf-8?B?TzJNMWNCK2U2SW42UzFMbEZXL3pCNE43OTZnamdVb25QcGpOcGVWRlo5YTJC?=
 =?utf-8?B?MTB4Y3JBaW9ZVTdqbmtySnY0YU15eDlMWXFaUGg1d29yNkFETVEvakc0V3Bz?=
 =?utf-8?B?S0xUTjZvRWJVN0JVYmd3Y1dReWJkMmhxcVQxbUkyK1orODVFWEZNWEJLTFkx?=
 =?utf-8?B?VU8vTVFNU1J5ZzhXK0NjdTd1RDVuWi90K0JXNWh6S2tlU2VFYTlkV1ZHSzdm?=
 =?utf-8?B?aFB5UnUzK2w5N2VWSTZaTzkxNW5ETDl6TmplcXhpa1Vqd1BkZjhNQ0x3V0d4?=
 =?utf-8?B?dHBWUnVIM2Y0NnpGV3RndG1od0p2R2pTSHp3ZTB0S3R3MkNQVVRDRFBGWW1O?=
 =?utf-8?B?ZVliWUROdnY4UUpZaDdYL2FaWVp2eUtJZUZRVWR6TmIvSDkyeDFtSnBqWmx4?=
 =?utf-8?B?cDMzY08wNzhqTzVJQmRUeUdyMmp4V3BRTXJITWpEQW9FRzBnRnJZaW9MQ1p1?=
 =?utf-8?B?cmNCQm11cFo0Rm4rNGNaaFlMTnlHSVNKZUVnWWZrMVRiWHQ1TGxxK21nZmxN?=
 =?utf-8?B?YTJKVGxkYlF4elJEZzVzNURWV2lXL3dkVXEvbE1jRnIzV0x3OVRjZk5pUDEy?=
 =?utf-8?B?NmNFTWkvb0ROcisydW9xaFlRa1NjRWFFcHR0VWpReHJwQ0o3TUJlUWl1R0Jz?=
 =?utf-8?B?aTByYy9IVFBab2ZNT1ZSbm5NSHU0SW1qcWZSYlhkRGNMc3Y1S0JEamJ5U2dO?=
 =?utf-8?B?VVNDWDNjdG1yeGkraHBSbGZzWVJLSkhsNTR6MkVDdVlGR3lFV2s2TzFCYU50?=
 =?utf-8?B?UGJnU3hiZ0F1eVdPNmE0NXRGeC81VE40Wi9HcGdlV3hUaWJ5ZnNqa3hFdFkz?=
 =?utf-8?B?M1lWdjJlYTVwMlYzaThEUDlGMEozYmk4RlQ0OHZMUzRzUmVqaThqbkVSczNk?=
 =?utf-8?B?bERUcW8yeEVBaWJYQTkwWHpwY0psYzBQNWZTb0JSNjV4OXZvckNTVVEra0lD?=
 =?utf-8?B?cjdnby9BMnZVS0VGUXB3VzhVMXZGOEtMeEw4ejFWUHZWbzhsNXZDSUF5cUtL?=
 =?utf-8?B?MFVIRzBqWktXWE9vOTRRQUgzUU8yOGRPdk9UdFBSTnB5c3RySkVDKytXLyt4?=
 =?utf-8?B?ZjNaczFxelJYUTNlRnBGbWRnTE5aSmdwZS9qdU9CQmhFOEdCcFNyZi9nVDVI?=
 =?utf-8?B?eWkyYzhaeGJrdU84cWtFUXppREhsT2xyYy80c2hZYnEvN3IxRlY4cWdOMm02?=
 =?utf-8?B?VVdoWmV2M0Z4RFphK1NLeWJ3WlNZc2N5bVFoTGloeU9xeWs1eFFYN0JYZzdR?=
 =?utf-8?B?ZlFoYkVKMndYbXRrUDRkUVRqYkc0K1VLL1BaWE9Dd0ttamhQRW9paXpaNzA1?=
 =?utf-8?B?eUlmQmx0cWxLVk5iOFRQOUg0QXRLSUtDQnNsN2xyZG8xQXkxcFpIclVHR3Vy?=
 =?utf-8?B?STVsREszWXN6Rk5FVTAzZUlmZFFCdFltVkZ4WGJBUURqZElNeTJNU1VSVDFl?=
 =?utf-8?B?all4U0VnR0U3dGtlYTZZbm82OUY5c3BwRlpjZkZXZC9XOVBqYUUzVlAveHN6?=
 =?utf-8?B?ekJmaWdJYWpGUWxjMmZ3eXplR1VFS01FNHpmOStBN0ZBMFNUam5MVlkzVmpp?=
 =?utf-8?B?Mm5CZktIaWJ2T0J2V2lSWCtqRjJaeTVOTXF2L09CK0xURVJMVzZNbUdLZWdM?=
 =?utf-8?B?U1htNHBUcGJpajNxWW9acVdBdUZjSFdvOUlOUURNdHdWZlVQZVM3ZGwrb0dK?=
 =?utf-8?B?VjBnV3pzdmZJSGVYYnZNZlF0QnR4UmFkRDU2QTREck5tQndjenQzUTBiRENz?=
 =?utf-8?B?cGIrNDRndFdNRExjMi96ZmUxMFJDTWtFeU5yREJ0ZGQvWG1FeHQ3UEQ5cktC?=
 =?utf-8?B?d3VTbHRienN5WmVjcGF1a3BRS3MrbmlmS1ZsUEJaSzFyM3JuWUVYRjlDVytx?=
 =?utf-8?B?QWVlSk00SEhJeWM4cC93amY2UkY0QzNoV0trZ3FCeFU1YlZKMFNjK3d6UVYr?=
 =?utf-8?B?NzhoemlselUyUUQ1N1gwWWVjVnVlUDlwd3g5d0dPbE5RMVlrajVwWG1GclV5?=
 =?utf-8?B?dFZzMElUYjZ6R0M4UTBhM1VvcElwdWI2WVE1TTAyUENDMk9UcUF3c2VBazI2?=
 =?utf-8?B?YzRnREpPSVJRU0NBODdCU3NRSEsyQWN1QVdYdDlnbFhXbFFpMDVKYzFjVGsv?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e29fae0b-9887-44b1-696d-08dbe4fc2d76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 10:26:35.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5yrQtDt8otH4rORGEXgwfR/Bug9pIxiCutykF1AXA+K758prD4HrBrckHZXuSFMR5IqTJuqfd/eoG8TYCjRhpNOKsrTXamhQVzh+PNLImo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
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
Cc: suijingfeng@loongson.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/2023 3:40 PM, Ankit Nautiyal wrote:
> This patch series adds support for DSC fractional compressed bpp
> for MTL+. The series starts with some fixes, followed by patches that
> lay groundwork to iterate over valid compressed bpps to select the
> 'best' compressed bpp with optimal link configuration (taken from
> upstream series: https://patchwork.freedesktop.org/series/105200/).
>
> The later patches, add changes to accommodate compressed bpp with
> fractional part, including changes to QP calculations.
> To get the 'best' compressed bpp, we iterate over the valid compressed
> bpp values, but with fractional step size 1/16, 1/8, 1/4 or 1/2 as per
> sink support.
>
> The last 2 patches add support to depict DSC sink's fractional support,
> and debugfs to enforce use of fractional bpp, while choosing an
> appropriate compressed bpp.
>
> Rev10: Rebased and added DSC Fractional support for DP MST.

Pushed patches 1-8 to drm-intel-next, thanks for the reviews, acks.

Regards,

Ankit


>
> Ankit Nautiyal (8):
>    drm/display/dp: Add helper function to get DSC bpp precision
>    drm/i915/display: Store compressed bpp in U6.4 format
>    drm/i915/display: Consider fractional vdsc bpp while computing m_n
>      values
>    drm/i915/audio: Consider fractional vdsc bpp while computing tu_data
>    drm/i915/dp: Iterate over output bpp with fractional step size
>    drm/i915/dp_mst: Use precision of 1/16 for computing bpp
>    drm/i916/dp_mst: Iterate over the DSC bpps as per DSC precision
>      support
>    drm/i915/dp_mst: Add support for forcing dsc fractional bpp via
>      debugfs
>
> Swati Sharma (2):
>    drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
>    drm/i915/dsc: Allow DSC only with fractional bpp when forced from
>      debugfs
>
> Vandita Kulkarni (1):
>    drm/i915/dsc/mtl: Add support for fractional bpp
>
>   drivers/gpu/drm/display/drm_dp_helper.c       | 27 ++++++
>   drivers/gpu/drm/i915/display/icl_dsi.c        | 10 +--
>   drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++--
>   drivers/gpu/drm/i915/display/intel_bios.c     |  4 +-
>   drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
>   drivers/gpu/drm/i915/display/intel_display.c  |  6 +-
>   .../drm/i915/display/intel_display_debugfs.c  | 84 ++++++++++++++++++
>   .../drm/i915/display/intel_display_types.h    |  4 +-
>   drivers/gpu/drm/i915/display/intel_dp.c       | 87 +++++++++++--------
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   | 85 +++++++++++-------
>   drivers/gpu/drm/i915/display/intel_fdi.c      |  3 +-
>   drivers/gpu/drm/i915/display/intel_link_bw.c  |  2 +-
>   .../gpu/drm/i915/display/intel_qp_tables.c    |  3 -
>   drivers/gpu/drm/i915/display/intel_vdsc.c     | 29 +++++--
>   include/drm/display/drm_dp_helper.h           |  1 +
>   15 files changed, 266 insertions(+), 100 deletions(-)
>
