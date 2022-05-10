Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70176520DE4
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9010F157;
	Tue, 10 May 2022 06:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33710F149;
 Tue, 10 May 2022 06:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652164309; x=1683700309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eRITmPUAt8CdEqxEHxjLH3Gj5gVSfFvHB3sldd1kbjY=;
 b=ceyzNbsMId68jJhppopnXJfvmTB0UnHGOxUeXdq9zuXcmnibmTbbENfx
 UCcn3mtfnjUAobxVCYnHiipw7646s9eC8cBIhudc5IUbcIzL5ZbWwgx2S
 5EjWngVjbmSDjKkNvEVDFwkgVFhPgztRZCFVP1FAvnC+ciUr9pRY7f8Id
 GffwCzV5k7oY1mi677OxHlJ3vSCuf9Ff/QQhNE/423v6cBz4cMkhMKLu/
 YU3N5yei5ZGFMj2/VQomNbmJTbQhDzCmYc5UmD9xrf0Tre4dzuyuPV+k9
 NNhp0VbK75sEsly9JCqEBsALaOcPiQq+QGCJRawH1n6JpsVwTjKuwg/o7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249809741"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="249809741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 23:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="738535775"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 23:31:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 23:31:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 23:31:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 23:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg989CT5+2Xh/INsTOKA5TTFKONd47pXP1bEMmbbhC7DW4rH+JMC2yuAF9YgNHeLjluVTxzmjf/e+1wYiF58SM2+Kc3I3+BkN0KDVbtR0UxiA2ZzHGtcGxaS0M/ei46zvjPKDHsOrV1tkEaur1soRZp8A8scYulVLqTf4NicWQfIdYJ+AxGfDBpt0APkzHlCkrOt89v3/+/ZZhTc94s+DWMKwPofJw+K4JfAGK7oLwrwzep8kj6Vfg+eYytffyUSJ1tKkXJpQErWd/I6QQtgJAlsVisnchmOPbViBQKYDV2krwzWJUqJPI+7zbVCIs8vfeO3OIgdKaZEFSSltmCkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++ERXZV0o7Ez8H+zFSbQm38L7HUkvP8q5377kWip320=;
 b=NX0YcMwXDIkAH7OujKblRNd15rDbOcE9w+Ee3z8RBjLtlMprOW659ohb7VBTZrFw4hzxAFC07jBUIkrrTUZEvW4Zsh56jBBK5H+hoqAzr1J/8+hGLVqjxHYVhlRlSZuEisslv+Yfe9wkJqLxfCidMX4R+IUFo7258zPJsZ1B1r5KousnGezhYd+lnIwWX/iwNsYut+fEi9rUxAItovJ9if1M4kI3T2P52ALANym++gnSJBRY2f0bB0ydcWX3nfCgUbkRKSQ7A8kayU4xUX9Gvne5mNZTr2JE2ziNDVnBDYRpfw6ehSB1Vk5Cv41rhg6XE/G8hweEx34PtE0bzGW8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MWHPR11MB1262.namprd11.prod.outlook.com (2603:10b6:300:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 06:31:46 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 06:31:46 +0000
Message-ID: <fe806b1c-fdeb-0cf6-3db1-051134f399e9@intel.com>
Date: Tue, 10 May 2022 12:01:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 06/25] drm/edid: propagate drm_edid to drm_edid_to_eld()
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <ddd28f56d1b2604bbf8457cb5bd3c6df34ff35b9.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ddd28f56d1b2604bbf8457cb5bd3c6df34ff35b9.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22c563cc-6274-4918-3590-08da324ec160
X-MS-TrafficTypeDiagnostic: MWHPR11MB1262:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB1262248C310AFBBCF23B1181CEC99@MWHPR11MB1262.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V/S5xdLN9J6kt7DJRFSBUfdp/03AUyWTw3z5+DrvfVKId9mrh84LcJsXRQNJ90Mw9uYotGsshe5tYfHNVVkBLbhTY6INlGHpO22j95kK/ntM5y8sgqOjTiQTIBMU2HCIePIpNeOKtf6Aoj3EnBFoyhFNMhE/KKotojc0Yd7Igm6Kff91KCZrQLaWrX59eeKgsRQ4iOooiFIzdS1PTITN6ubv0KE0AzDbRTHlLUx1yn/eBi+r/wOZoUBpLOPgURBn1R3AHyHMCGyHIyDUCqfvIjKGwtVVe1OYd2OgE2vGkIHXHu6khQ9NV+dEIr9nzAa2DnVgDwBe7DfvF7/usy+++V1AtLnbo1GGaiyOTntDBu69b4RFzFjNDvWpq4sYM7DFN3qXTrWZYwER6s/6VKyxvPQOAXS93//7guWarPKze1R4qMTVQBvPLFTFTibVgMjeYhQpRxyQNrIJXvW5n6Oq2xu8ISsb3ziqDF68SbGb2l1O8BHvfg6pZGW1Ch7J5KPyTTGe/lATTAo34PiQTyu7yPur8Am2BIN8FDvvTK3d/6gBr1jo10os2YjBPypvfH+YSD4LNgqavNR/pbxM2knKeLCUsq5AahYp6g7FmdgQzjOmAWe8xcEkFURwEG7Za83Dp6aiUSh5QOAwtalJ3Ed5Ova0tsM8XbuYw7bjf66Iv09EgXSoKQtAcXqx5NWgBQndFtehQttU8aMe57zX8lAbPPkfOcY7iC4LsApkV94uOJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(82960400001)(66556008)(450100002)(316002)(38100700002)(86362001)(8676002)(4326008)(66946007)(6512007)(31686004)(83380400001)(26005)(55236004)(53546011)(31696002)(66476007)(5660300002)(6506007)(6666004)(186003)(36756003)(2616005)(2906002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBrWlpxZzQ5RGE3ZGVCbEo0WGFhK3NwUU9SN2JRa2hTQXFQbmpkeDdqQlBr?=
 =?utf-8?B?Y09ualpTKzgyQWttcEV4OEtzT1RsTERoSHlPamFVL3VoRWhEcll0anFXemQz?=
 =?utf-8?B?TjlSdTRSLzE0ZWQzdHV5V21rNTVyTkFPRzU5ajR5UllrZ0o2T1VqK01vMnJ3?=
 =?utf-8?B?NHYzSGppQTVTVFhpSnp4MklGT1ozL0o4VlIzdEFBRXVsamViUUJsV3hoOGxj?=
 =?utf-8?B?cHFjNFJIZEhqSEdUelVlNFR6eGdpU1JrY084aW5jcTdkWkM0bWU3MVMzV3Zs?=
 =?utf-8?B?NlgyR0FtNSswQ3cvS1V5MWlPK21yMTV4dXZqUXFueVpCZG1LekhCei85LzUy?=
 =?utf-8?B?aXBGTnBLc2JaV1JCOEpOMFdWQU1ZSVd4S1FGclBHelI3TVVMaGpSQ09PcVRP?=
 =?utf-8?B?V2I4aUlRZjRrOVYwck0zZHNzd1BNdzVMc01UQVdMRnd4Qk91dW95MnNoZlZp?=
 =?utf-8?B?ai95UFIrSHEvN1AvM1hVM282QmZGZnNaMkh0VmQvQ3pyMENacXNKOThZUy9F?=
 =?utf-8?B?TGc5d2dEM3dqZ1JhQTk0UDQzWFZjRlB1SUZPQjFYZ3NtdWFsSWc4cStnRWtM?=
 =?utf-8?B?NTFGOC9QREh5MHNmN1BSQ2dMVHpRMHEwUGVJWG1vc0J4NmhRdExjRWhqV21Y?=
 =?utf-8?B?V3lFRWRxcEVid296R2x0V0NURjY3VDhlOU1KSUNsTTRQb2lwaVNUQXlwMFZZ?=
 =?utf-8?B?eEg0WlhBMlhTZzQ3VnNGRWFqYnBXUVZMRWpTYXNnTjBDUVpSOTZCYjV5Yk8y?=
 =?utf-8?B?NGxZV1lySE1DU1RpOFc2dHJTeWRCaDZIZkRZb1NKVkRPSXFxaXZpdmdqNGl4?=
 =?utf-8?B?N1IxYi9RL1VoMzhvSGQydGh4U0JqR0RxakFGK0p0NUM0NytVUkFGNHljSzA3?=
 =?utf-8?B?QmFwUTJySXJtSXhXbGJrMVFMQk9RQTc1ZmxQU0xiQmF6NjRIZVdCbTgvYnFF?=
 =?utf-8?B?LzkrZE15bE1vNmtpbjRQdXVWYmhXejNJaFY4SFUyY09TeUcvNTFKcEhmY3Bs?=
 =?utf-8?B?dko5SU01R1grcWhrVUNycVVBK2hSdXZlM1J6MFI5ZmpadVpLNVhqcmRtbVJF?=
 =?utf-8?B?WmN3dXBvNlV4R1ZqaXhyU2VpVng4MlFsR09SYk9zQTJvc2E4dCt3MndMSEVO?=
 =?utf-8?B?SU1LSlhXeTBod3BPb0RGYThyVUZhVGV5UjB3Wldyb1RMWmhQdGErQ05oZElD?=
 =?utf-8?B?eW5pVGkrbDM1SHZpRG11ZzZiVzRFbVdRQUJMeFpiNEtBNHh2SC9LQXN5V3FP?=
 =?utf-8?B?aDdCV1pVWWNpODZ1R0lncno0WjZlWUdLRFNsUkFKcElyaFJtZ0tSaWwyS1FV?=
 =?utf-8?B?VXhYU2g1ZHlXMUVXdDdlbUNWUG5Kd1VNM29HREdDMEJLSERCUGJPb05KYXdN?=
 =?utf-8?B?K3JXUStuK0cvWGxZVWE0emRTZ1lWVUVHQUs5bHlrZDBFT2xDU3JZTFIwVy9h?=
 =?utf-8?B?cUZ0MkRKU2VKRnNGNlNPUlVaV0tTcEN6L2l3NFZMNDZXTkNwNUVjUzFuZUcz?=
 =?utf-8?B?YW55dzJlYVBKUFlrRko0MUhrOTJjT2hjdGRrZmR3Q3p3RjFUYWdjM016bzdR?=
 =?utf-8?B?RFNEMGE0VklNZnhodXE2MmtqWmZtN0dueURIb0tyQWJBM1hIQU1LcXlQakZi?=
 =?utf-8?B?ajBWeWNneXZKbWl0TCtETFo2SmJaNlI0cit2SEwyMGduN3I0aTVMcVVBNnRx?=
 =?utf-8?B?RWtYUnpnVDdqbGowV0VrelA0QWFNbWJRRlFnTHVuNmI5UjVSd0ZJcWF4N1pC?=
 =?utf-8?B?UlE0SEVrYzFkRHRHTVNqeFRJRkVNeVlzNXRIT3RDNmhKbmVXSDZWQWhRUXZT?=
 =?utf-8?B?VUxJN3BBLy9BU2xGQzc1ZTA4aXZwMnp4Zjk3K1RXUGZweXQ0SExvWlY4Q2hi?=
 =?utf-8?B?MjV0ejREakdFZzlibkJJeFBLQ2UzUFFGQmQ4eGx4djNQR2lBNkJMZ3FzVy9y?=
 =?utf-8?B?ZVBzMlExSzZPeXZhc1pDVkNxL214bXNYbUQwQ2x1QURYZW04YlM5UmVrM2FT?=
 =?utf-8?B?c0JPRkZWS0ZPQjVNK0JNblBianhBUmwvMXN3S05Ba2dZKzhKb1YyQVRodW05?=
 =?utf-8?B?dVM2UEdLSVA2QmJHME83ZktoQmFPczJxRVl0M2NjdlNDZ1UzT1hmaHlsUjVa?=
 =?utf-8?B?d3paZDFMMXR0OXVEWmc0b2tYakl6Z0ptc1NaUmYvd1cwck9ldHZxNHF0Myt0?=
 =?utf-8?B?eHlEZ2RFWGlMZjZodG9NODN5V3ZCdHVsZDAxRWxjTVZaZi9tVWxkQ1ByZzN4?=
 =?utf-8?B?Y2ZicXVtdGptVDRzYnFoT2RIQzdXSnE2OVBXMmxod2Q1TjFjLzhBbTVTMHhp?=
 =?utf-8?B?a0FsbHliNVBabjVCSHd2ei91QzNJQnVNdVk2QXdJRVh2ZUVKR3E3ak5UQ2xH?=
 =?utf-8?Q?owxu69JUgK8yVPvc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c563cc-6274-4918-3590-08da324ec160
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 06:31:46.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKa0X2KLqwKEoNfgN+1urZrPvz1zI78ayFNggYzEypGKDdTBWbzUPr2LQfI4VXWR55heSue/9RFTe9FABIImPHQS00LkfkhSvlf9cC/Ywsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1262
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 96e3f9327044..e4fdf742645b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4883,13 +4883,13 @@ static void clear_eld(struct drm_connector *connector)
>   /*
>    * drm_edid_to_eld - build ELD from EDID
>    * @connector: connector corresponding to the HDMI/DP sink
> - * @edid: EDID to parse
> + * @drm_edid: EDID to parse
>    *
>    * Fill the ELD (EDID-Like Data) buffer for passing to the audio driver. The
>    * HDCP and Port_ID ELD fields are left for the graphics driver to fill in.
>    */
>   static void drm_edid_to_eld(struct drm_connector *connector,
> -			    const struct edid *edid)
> +			    const struct drm_edid *drm_edid)
>   {
>   	const struct drm_display_info *info = &connector->display_info;
>   	const struct cea_db *db;
> @@ -4900,10 +4900,10 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>   
>   	clear_eld(connector);
>   
> -	if (!edid)
> +	if (!drm_edid)
>   		return;
>   
> -	mnl = get_monitor_name(edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
> +	mnl = get_monitor_name(drm_edid->edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
>   	DRM_DEBUG_KMS("ELD monitor %s\n", &eld[DRM_ELD_MONITOR_NAME_STRING]);
>   
>   	eld[DRM_ELD_CEA_EDID_VER_MNL] = info->cea_rev << DRM_ELD_CEA_EDID_VER_SHIFT;
> @@ -4911,12 +4911,12 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>   
>   	eld[DRM_ELD_VER] = DRM_ELD_VER_CEA861D;
>   
> -	eld[DRM_ELD_MANUFACTURER_NAME0] = edid->mfg_id[0];
> -	eld[DRM_ELD_MANUFACTURER_NAME1] = edid->mfg_id[1];
> -	eld[DRM_ELD_PRODUCT_CODE0] = edid->prod_code[0];
> -	eld[DRM_ELD_PRODUCT_CODE1] = edid->prod_code[1];
> +	eld[DRM_ELD_MANUFACTURER_NAME0] = drm_edid->edid->mfg_id[0];
> +	eld[DRM_ELD_MANUFACTURER_NAME1] = drm_edid->edid->mfg_id[1];
> +	eld[DRM_ELD_PRODUCT_CODE0] = drm_edid->edid->prod_code[0];
> +	eld[DRM_ELD_PRODUCT_CODE1] = drm_edid->edid->prod_code[1];
>   
> -	cea_db_iter_edid_begin(edid, &iter);
> +	cea_db_iter_edid_begin(drm_edid->edid, &iter);
>   	cea_db_iter_for_each(db, &iter) {
>   		const u8 *data = cea_db_data(db);
>   		int len = cea_db_payload_len(db);
> @@ -5864,7 +5864,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   	quirks = update_display_info(connector, drm_edid);
>   
>   	/* Depends on info->cea_rev set by drm_add_display_info() above */
> -	drm_edid_to_eld(connector, edid);
> +	drm_edid_to_eld(connector, drm_edid);
>   
>   	/*
>   	 * EDID spec says modes should be preferred in this order:
