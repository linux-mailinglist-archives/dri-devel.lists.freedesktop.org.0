Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98D6EA014
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DF510ED40;
	Thu, 20 Apr 2023 23:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8310ED3B;
 Thu, 20 Apr 2023 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682034005; x=1713570005;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/4LEsvGNTnDmKTVorZKYRETcLqequDRTZT96Gx/tXyY=;
 b=Dxu6UgndoBeOiyGz4LfCSzuodLSWXeyD3MKeCd0uf+yCZLgBgJGtjfhu
 i8Ac+jnMzX0ufR45KDqMUMPvQZ25bsaQma41lu6VHPzQlhu9DfqHHfOFK
 Tb4D5vn24flmmgsFVJaA9QzsO5EDuJQ9OyOcPMLURbOQdYJFtDa+KZXPt
 HXx/JdPzO4cX3Jg5RRFh6vvohmbdfOEta3UIg78W9HhhCbKR/pZLWe1XB
 zG2TnsH00lxW8sIep7rKUrRpjUSv2fTBFjO979D0BVCgpt4DKPhEScIvX
 tWsRMdkRollVbtko3zSWA67b9DhRE4lY2wISld4Zu30DI7ltPYZxesf5V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432154476"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432154476"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 16:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669526410"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669526410"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 16:39:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 16:39:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 16:39:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 16:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMGyvOd0dginzjPPlJCJ70uhmOgUPs3h5v5JKLeD88VjQbZ4URAVgzbntK8lQTtR+BQmvfE7m+kcO8Zvf8qZWqIHxRtwjOr0N81TpSOXXu08enw022EC5MqGZByodDHd29JjH8S86mp8my0n84Kls+TujFmKfurt0NGafDhv0glqrJEi1JezIA/B+F733CMZmNUD6BcCr+TQ4HtNy6oJ9SdlXz8Ao+/8iUjqhNjTnRFxbadZJLeNSvPKiGKwHSS76F97XGW9/ekyJ2z8ehUATFDRTzooFWMTxX218wtyaTyRmxEcvVJyyN8YiOrcdLRB6uF2tXaILIVrnT1HxAKioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W74LN0UgOD97fJBW6k1weAUhDayaDDenn4U7rQPgtpI=;
 b=EzVV11AzsfePBOvz5E5Z0fugGg1b5E1PNy2cdBcKmO2KMfJzdzDEYVkQVtxn+Zh4+Z+C92akQdpMl07xSbgLDz0UFlRQ7AM/roXYO56drqfbEAAhr5a8spMBNLcIl9eA1i3+rb6CFWUp5Tb8XM8sPDo7roiQ07MMfA/ErLigA5WItUP80vs73ImaQh+r2DU8KbktrPImcyNKMpsnzoaBKLol1kKYZgLHWb3nWLuS8xl7p8SNKYf97jFM/8O1jbaNunzHk59bIyzZLdorf+Jrwf2YeDQIBLjP1j95rvLpi1Ba6UlAjdTkS17zB3DcLBk1k1fyP1donFEuKsAtHjhe9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Thu, 20 Apr 2023 23:39:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 23:39:09 +0000
Message-ID: <cdca3b14-5a21-0507-ddcf-84c91c75f897@intel.com>
Date: Thu, 20 Apr 2023 16:39:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 3/8] drm/i915/pxp: Add MTL helpers to submit
 Heci-Cmd-Packet to GSC
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-4-alan.previn.teres.alexis@intel.com>
 <b568ae8f-64a7-6a56-6760-ac0b2ff63191@intel.com>
 <f6ba19ef1483a0272f34bfd6a79ea76643615ca7.camel@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <f6ba19ef1483a0272f34bfd6a79ea76643615ca7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: c9cb18a3-17e7-454e-c370-08db41f87024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+M/aDPjPjTgSMbP8EHtvt94H7sfxbMrbG4XzUd0gbCUtV3UVMyWH3O5+n+OuR9bSVg6ycX8PmaJlbOR5JUQeXF9DeJ3eE+8WzwRoWaShxCtQ9e0A0RnjucezxAl/A3Fwo6xGdtvhJdCXJp5jLgBU1EzdZZwGo95Ap58FjFjNKd9wzGgp+jaUHsnFFEHgwaUdIEzjDKd7FL0aJNy4PeANtsrwIWMmztBdW4E3/wOVNscb4yO9nmHhWoFI4mqQilKeevk1SX8V9BNqdHAHDTFVxk3YZdxm+xYFbOxDCHIOe+KYsjOrgXcrC6++MYnf90LAZtthAN2LzxkytVdKCBBVKZbT2yngdq0Vz4U4fdUOEW8zJREgdoP+Cps/7O+8Goz/kjZLw1gRD6vS2FRF0zsr5pX9opryEcBzOqwbYmty/+ifUqgGmhrhq1la/63LsFhCFxZqoX8iECIptLL8BG94FUHY0j1PYKa/80y2RR0s4KBoudvnFJgjNDc6hFH5H/dTjKMMA4ZpMm4EO8Lz3UxVg8UR5HFKbHRWVEGHo7JZ5+1ct++OhsSzF5VTq3mfbNq3Ogi15221mGQ+C8MmHVbTdxhxTk5cMgLgxxFsAdJ7LmlWuumj18m3aEkbFFsSmQlH3niXCyWCllVz0dFC4wCVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(31686004)(4326008)(8936002)(110136005)(54906003)(66556008)(66476007)(66946007)(316002)(186003)(53546011)(38100700002)(26005)(6506007)(107886003)(2616005)(6512007)(83380400001)(5660300002)(8676002)(6666004)(41300700001)(478600001)(6486002)(31696002)(86362001)(36756003)(2906002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFkM21XeGdGL2VSYTloZ2c4RFF5N0lDbkYyeUZIcVN1ZkhwVnJRN1NENTJQ?=
 =?utf-8?B?S0JsK0NyK2lCVzVkcnczMWNCZE9WSEI1SlgzSjg1TitlY01mOFZXQ0JvYytD?=
 =?utf-8?B?am9tSmVyeDBhZndqbnYySHloejVtYjlUbzhXdGNYRXBLd1lYSUZlRjQvc1NS?=
 =?utf-8?B?WU4weUNCR3hybkR0UDhpNmMzSVBCQ1hvckptbFRIK2xlRmZob3NFelEzcW1k?=
 =?utf-8?B?T29wMklxT2V6YmpQcXRtWW5waXJnWVVIWTQwSVA3QlJoZnJ0U1lOb2ZTZ25j?=
 =?utf-8?B?SzkxYUsxVVFRUFZUM0J5R01GTytIYy80cEtIdk9UanpQYWlwbmlybWJuQ2hC?=
 =?utf-8?B?L0JhMWlWazJRNzZzU0FQU0ZCRG1ESnVPaW1BVnFpdVlPMTh3ZSs4Ymh4Ny9u?=
 =?utf-8?B?L3NpVUtEcVRjb0ROUEdwd01zT3lYRWVZUjZYUzd1U29Rd1pwUVNGcFJ6ZW5T?=
 =?utf-8?B?Y0dBc291ZjdxM3l4TGxKNDZLZmxOU2svb1lON0VEbUJ1aktaZ1VFUnVQeEJi?=
 =?utf-8?B?bnhBK283QUJ3ZUpIbnBxUTBVRVNMc3Q1WkZIVzJCOUFuclIzWThvS2dVSGhJ?=
 =?utf-8?B?dTJsM0s1MG1Fbk15b1JXY25UZFVRMWlCbkZCVWo1ZGZFSlZPclhra1l5bEpP?=
 =?utf-8?B?dGt5N0NpckRZQ3J1U1JUbHNyWGtuSEFMemh2a1B2THU1cFlNMEVRN2xBcVFX?=
 =?utf-8?B?V0hhWFdHdWFnczErbm1ZUkdpRkh2Uyt2a1V2c3ZaczJPZWJ6aGVtclhhTm9O?=
 =?utf-8?B?MWdiLzdzZHpZc2lQQTIzZEJnYmFBckVkS3dCZG1LVzdWZjg0aXltRGE4bUlx?=
 =?utf-8?B?YkNUWGdpRWJpR2pad0w1NGNlcDdJSmYydDZ4aVF6TDVJM2hpM2VWOExiNzEv?=
 =?utf-8?B?S2NmMEc0RDhkelpONXBzL0NVTEcvT2U2Qy9aWDcrV01hTlYxTmVnQVZGRFUv?=
 =?utf-8?B?bG5BbUEzczB2VjF6YnlOUTI1VTJ3M0pzV3YwdlgzcUltQ1hZRXdHaE1lZjV2?=
 =?utf-8?B?djlLN1orOFlzVjlldXhjOGxwTWU3SVRZWERBZzRaaU5UUmhxTllDSm9ReEp1?=
 =?utf-8?B?TGl1ajc3T29TeURhWVErTkYrbzdFbmR4cU9TNHVlK2lwUzFOSGc3aVMrS2dD?=
 =?utf-8?B?N1ZVYlhoelBPbU1SVGtzWFVWSFJNa1pBNDFUcmFuS3VFM1V2MEloZ3JkbFRv?=
 =?utf-8?B?OXBUUDQrdU55a0gvcGpROGcyWHJZWEhlOHN5a3dsWklUOUtsNVB1Wjljcmpu?=
 =?utf-8?B?RkhxTlZiNkVTVER3Ym5PaEJkWnNEQTFlbkk3aURKSEJOWW0zaEk0b3pKVS9p?=
 =?utf-8?B?TWh6enVFU0x2cWZnaExVVGtEa0RNU2xlSjFXR0JHQmdLdlFMaml6NE45cnR6?=
 =?utf-8?B?eXhucWZrQnpGNWxRK3E4L01ocWZGRE1mTURSOVFtTDhxemc2YjF2MEFTL1pR?=
 =?utf-8?B?Mi9DTUN1U0VHdXVDRVlnM3hNbS8wZnl3L2FQRkRJNHdBckh4b0hyajJtSUN6?=
 =?utf-8?B?YUxjZkpqQjViaUNVbzQ4Uzd6Zk0vd2thZHQ5ajREMnBXNkxodTB3U0JlWDNR?=
 =?utf-8?B?ZjVFakJYZFBORWJ1dGgyNGMycXhaZjZFTVRYVGtkd01PaENSYUR5U2pLaUcr?=
 =?utf-8?B?U2JnVG1GY1JJU0ljdHV1MC9DZlZ3eVltYWpPL2RDY2tKQ2xOZUtVLzh2ak55?=
 =?utf-8?B?ZFFISHM1WXdXbEM4ZnpFblNqV1F2NHJJSktZMGFuWHpQR0RNNkR5a0tqRFBu?=
 =?utf-8?B?b3VvTGlpYmpvd0xMeTdHMjFKQmdhZGpubm0rU3ZDNFU0cFhJNDg3eTIxYzZV?=
 =?utf-8?B?OHRKRmg3V0QwMlBqUXV4UW5JdzJkRlhaYzlnOUJwVVpqM2ZqZ2FITDhHMmFy?=
 =?utf-8?B?dEp0VGhDci81QWQrNVArbmtHN0VPb2pJS1F0dGZHSTFXUnBlbzduZGNVSDFU?=
 =?utf-8?B?Qmd2TlR5SjhTYUhIczIybytIc2swQ2RpL3RKcEM3Tk5Bc1g5d3Y0MnJ2SDF5?=
 =?utf-8?B?N0src1BxV1N3dEt5Y252L25OQXVaNlNYMVV6eEsrRHErSVJReWR4Z1JCcXBk?=
 =?utf-8?B?VnlrODVnLzdoRlk3STZGMzhlbTZsSEhNazRDOFhzUmxLejFZb0pCUXFBdDhK?=
 =?utf-8?B?c3Mxc3NFRjhuN2hJU2dIMXpMdjI2d0ZDRzQ2YUkvMWdjTmlYUVhQd3NRU0RJ?=
 =?utf-8?Q?LaLl3oam2GTgMBHc10JDOyc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cb18a3-17e7-454e-c370-08db41f87024
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 23:39:09.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pal2/LNRqSW6VhmsaVWllApC3J/h+pOq4FhEFRWKm0roPr2eh93BHkzeLfHwV23eCjqDvYeYhliRc/Qqf5jWiVakP2JBJDYP4L8gjwkoBLo=
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 10:56 AM, Teres Alexis, Alan Previn wrote:
> On Mon, 2023-04-10 at 09:10 -0700, Ceraolo Spurio, Daniele wrote:
> alan:snip
>
>>> +int
>>> +intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
>>> +				     struct intel_context *ce,
>>> +				     struct intel_gsc_heci_non_priv_pkt *pkt,
>>> +				     u32 *cmd, int timeout_ms)
>>> +{
>>> +	struct intel_engine_cs *eng;
>> We always use "engine" for engine_cs variables. IMO it's better to stick
>> to that here as well for consistency across the code.
> alan: will do
>>> +	struct i915_gem_ww_ctx ww;
>>> +	struct i915_request *rq;
>>> +	int err, trials = 0;
>>> +
>> Is the assumption that the caller is holding a wakeref already?
>> Otherwise we're going to need and engine_pm_get() here (assuming it
>> doesn't interfere with any locking, otherwise it has to be in the caller)
> alan: right now the only places this can get called from is via intel_pxp_gsccs_create_session or
> intel_pxp_gsccs_end_arb_fw_session. These functions are either being called by intel_pxp_start
> or intel_pxp_end. intel_pxp_start calls intel_runtime_pm_get_if_in_use indirectly from the
> session-worker and while intel_pxp_end takes an explicit intel_runtime_pm_get (since it is
> for suspend/shutdown cleanup and doesn't use the worker). I'm assuming runtime_pm works right?
> we have a similar logic across the paths from ADL version where we dont take explicit
> engine_pm_get for the termination via VDBOX because its part of the same code paths.

rpm_get works for the power management side, but not for "activeness" 
tracking, for which we need engine_pm_get. However, I've just realized 
that the context_pin contains an engine_pm_get, so we're covered.

Therefore, with the other minor comments addressed, this is:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> alan:snip
>
>>> +	err = i915_vma_move_to_active(pkt->bb_vma, rq, EXEC_OBJECT_WRITE);
>> nit: I don't think we need EXEC_OBJECT_WRITE for the bb as we're not
>> going to write it.
> alan: yes - will remove. (had accidentally kept above flag from offline
> debugging version of the code that had additional store dwords into bb).
>
>>> +	if (err)
>>> +		goto out_rq;
>>> +	err = i915_vma_move_to_active(pkt->heci_pkt_vma, rq, EXEC_OBJECT_WRITE);
>>> +	if (err)
>>> +		goto out_rq;
>>> +
>>> +	eng = rq->context->engine;
>>> +	if (eng->emit_init_breadcrumb) {
>>> +		err = eng->emit_init_breadcrumb(rq);
>>> +		if (err)
>>> +			goto out_rq;
>>> +	}
>>> +
>>> +	err = eng->emit_bb_start(rq, i915_vma_offset(pkt->bb_vma), PAGE_SIZE, 0);
>>> +	if (err)
>>> +		goto out_rq;
>>> +
>>> +	err = ce->engine->emit_flush(rq, 0);
>>> +	if (err)
>>> +		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
>>> +			"Failed emit-flush for gsc-heci-non-priv-pkterr=%d\n", err);
>>> +
>>> +out_rq:
>>> +	i915_request_get(rq);
>>> +
>>> +	if (unlikely(err))
>>> +		i915_request_set_error_once(rq, err);
>>> +
>>> +	i915_request_add(rq);
>>> +
>>> +	if (!err) {
>>> +		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
>>> +				      msecs_to_jiffies(timeout_ms)) < 0)
>>> +			err = -ETIME;
>>> +	}
>>> +
>>> +	i915_request_put(rq);
>>> +
>>> +out_unpin_ce:
>>> +	intel_context_unpin(ce);
>>> +out_ww:
>>> +	if (err == -EDEADLK) {
>>> +		err = i915_gem_ww_ctx_backoff(&ww);
>>> +		if (!err) {
>>> +			if (++trials < 10)
>>> +				goto retry;
>>> +			else
>>> +				err = EAGAIN;
>>> +		}
>>> +	}
>>> +	i915_gem_ww_ctx_fini(&ww);
>>> +
>>> +	return err;
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
>>> index 3d56ae501991..3addce861854 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
>>> @@ -8,7 +8,10 @@
>>>    
>>>    #include <linux/types.h>
>>>    
>>> +struct i915_vma;
>>> +struct intel_context;
>>>    struct intel_gsc_uc;
>>> +
>>>    struct intel_gsc_mtl_header {
>>>    	u32 validity_marker;
>>>    #define GSC_HECI_VALIDITY_MARKER 0xA578875A
>>> @@ -47,7 +50,7 @@ struct intel_gsc_mtl_header {
>>>    	 * we distinguish the flags using OUTFLAG or INFLAG
>>>    	 */
>>>    	u32 flags;
>>> -#define GSC_OUTFLAG_MSG_PENDING	1
>>> +#define GSC_OUTFLAG_MSG_PENDING 1
>> Nit: this change on the define is not really needed
> sure - will fix.
>> Daniele

