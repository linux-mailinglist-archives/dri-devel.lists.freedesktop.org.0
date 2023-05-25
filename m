Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C668D710F87
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01D810E16E;
	Thu, 25 May 2023 15:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B7110E16E;
 Thu, 25 May 2023 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685028389; x=1716564389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=wfaphfsI9i+xrMWefM+6bOb/5HUDG8wRrhQHgGA3S9Y=;
 b=CGNH/myCSMhQv/OTg0Su6oD3Q1ZZazButEYLlxTTXpL8Pla4IQnFFYJm
 wQfi2VIFv24BLHWY4j1VOi9Gm28pU2tbEssLOGh8/qVXNE2IJ3HOiN3FB
 YfS35SaJCR/sx/e/xnMxVGryJpTKPULr7LMxNWYlPmvGz1ZnWhYTDbc/M
 +sPLsG+NMFf1JVnPLVadrRO4QUKW0jJVVp7nz43n082mlz9lH3i6WJWdW
 Sj3w+fZd5R5Lm/MIPCfVz1ww+sMa52RGcPuhVU3X3GfPXtnoVov2s0xNb
 X6QkCZPOLnoTENx/ufNyedKaNDAToVWbcobL1fY7TCMRXn/pJOQBiZJI7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382167179"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="382167179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 08:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817154340"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
 d="scan'208,217";a="817154340"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 25 May 2023 08:26:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:26:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 08:26:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 08:26:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 08:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzaqzDA+Pe+xA3sPeinTlLWrP0Ak2cvjhX06Dlo2sfPmRJPeA9MyfLBPmwjPrDv5wdt8zXFNFt5WMon97+7ap55ijhLeiZKMhNg9Lp5wrjUrZFKYKDo5arHrwml1C2LK8M6yE+4clm2sx3CifdE1GbA2ivA64kuxBeqiLvqDQzPUYS1FsNgUIRTQX5JV2ZbLBEyeOOZ/baWYJED1U3Znyj6RI44FjJaq5nfeEy8nW3a8wZPFs2+HKN2QynTmkHceuEZk4uC3vA8wYDWhrzifJ3fFslQTpW7tKUy/RWGKOHfky8V+UqdoLud24JlcCVVqlnDa0Bjebs4AswlaNEbDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKf/t+ji/kgQIFBZKFbdvQTq4JwIvzxERfc+hcM1azg=;
 b=W2Z88n0FOZGNx5UX06+M8D0h7ouuVYIQnUOOxVuUUSXBwB0v3f7uSGsfEV4VSS5CKNf/NSWuqUc+xMKFQ+afiLabbw+q44yUSEZWGx005IKbrnkEMOn2OmjtAvVioNOBflDMB3J0M/9lTDtGUsXT02aV9p1T2y7t1urHFpfQF+37BrZyDGjskNNhEsxAg/mnqyHOMUGQwPyyxs8ZSOkd7b81qiphI4HSxM/Xd0VE73wlxksQrYbvA2JQBKXzORNup3ueHcJwzra8a/uqeSBhCo6/FV2rN3u8/jJt3+qv+fzqlMyHLEP8iKf1jbhRMmyuJTj9JMLNKBXGUPUisWPs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 15:26:03 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 15:26:03 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v12 0/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZjnqnJ8PZ7Ur6xkyxJe9rIFJU0a9qqhsAgABvbA+AAALhlQ==
Date: Thu, 25 May 2023 15:26:03 +0000
Message-ID: <BYAPR11MB2567D29E5AA322D54250DEA79A469@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230524200255.443021-1-fei.yang@intel.com>
 <78124d6f-7f46-afbe-d320-9dad77082f3b@linux.intel.com>
 <BYAPR11MB25673475B8C523F25A54DC029A469@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB25673475B8C523F25A54DC029A469@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH7PR11MB6608:EE_
x-ms-office365-filtering-correlation-id: 8d0ebf66-a32e-41f5-f4c9-08db5d3459ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVMsetFi9QMDCAs91Dj8fwo/Bkue3BEtQPc8vU2bsY/wqbfc1tBwpTrsQ9OfcrqQdPhl91LGxFJEgI4UjMm2549RiLNK3E0Y0tklRaxbmIbI8tOQLS+4aL2Qzuv9ZZ386TFRjo7E3I6XLmXvQRsMVueNJVbbRHji8LHNTjwhoA9Jh9wqDGDtlPvs2psvKyHun3SSqQv5m2DgucFgeDo+BoIABMW+llebR+0oab3XMCqJQLAltz1o+wSJzUQEDbjUiqcr+5//8k0CyC5R4JBkwAUGe8/todPZkdeERUJM3vB1csKq585TPSX15hvg9fOlg7l3rWEgs2CxUCtDIMXRO9UtK/VphXdit4V1fAX23s/KWOtPCAc90i6wz0AfzNi7iGgZOSDj7GmrsE6adCzfdhNfDeu9r4GzwswtJqq1Ae9lFfJOHICDY1B5AwZmYWkTXWdsh9TZz8zfWp0q4FKMuqat7UwUSYXhdCGRGAA2X58wqe7VrWdmhirHusarGFP2VlNXPqacPax9HKkADtSkGYLOJdhgeGuomx/8Ij6bmv/ekXS5Xctag9KllyXHOXPb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(71200400001)(7696005)(41300700001)(26005)(9686003)(6506007)(8676002)(8936002)(38100700002)(5660300002)(52536014)(53546011)(83380400001)(38070700005)(2906002)(2940100002)(186003)(33656002)(86362001)(55016003)(122000001)(966005)(82960400001)(66476007)(4326008)(64756008)(66946007)(76116006)(66446008)(66556008)(19627405001)(478600001)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/am6OF86STJK47mr7NewQSw4cangaxaTVx5Wv3d9MSqzlWTAn+CzlCvpO0?=
 =?iso-8859-1?Q?L7gCU4+7cpblUCdlLVk3yW4OSGCC1Dht+IWfzY0/RQW5+bcgPEzWXgaCMV?=
 =?iso-8859-1?Q?w5I97AXQokOw7r7Bx8ldyYffdeBIUCUA6B44GTIQ4v2EaPIiKMfzGxx1vj?=
 =?iso-8859-1?Q?Y0l6PgmzYFzAvB0ToIahehHDONnwMHKbyV8XB0ZQ7BZmZ7zqC5gAqB7B4W?=
 =?iso-8859-1?Q?j12uGyYJ08OAEIFbuvcIb7BJgTVlbQVXw0omAJoiqDu/QIU1SktdllPFXh?=
 =?iso-8859-1?Q?AZvb0DK8Gso+/O/QOxHDSrkQN/tKZybr9uxFxgD7izVoGNAyeGzAlwIt3o?=
 =?iso-8859-1?Q?GGoaSisn055dDaegkmkA1rKz0Le4ag6/FmKRV0R1iXoHBYMXlZzlFL7K7F?=
 =?iso-8859-1?Q?mTn1Rk9wuAaNwPAUnHaUw1Ff5hjDOuZR7MhR6CEtg07e63a4UXqAYjGfXk?=
 =?iso-8859-1?Q?753zand2OX/d5CX+N4fHknmKbVf6HaLu3RxB6sJbpckk68jvv/s5YLH9U1?=
 =?iso-8859-1?Q?IYsCj6EdeaeGbDmi0jkEeea0sPV9mLOoi6+NQslCda6ZZhKycmn7Fc+EK4?=
 =?iso-8859-1?Q?69VbVy4v+pDKMZOLxXDMpudFDbhXsKRGEYCCQ9A9VDIrmcF/sRsgUZMAv0?=
 =?iso-8859-1?Q?FPVyj2K9JuJWeWbhMpSff+WKAsqBFookP0W/5sfsQrzQevfUdKQAFT0PFy?=
 =?iso-8859-1?Q?M8eKANqx2NefOCOh+XWNrAUTkoSFPgWUK2an3v6PB6J04ZrpsLjG6Usb8f?=
 =?iso-8859-1?Q?6JPpuwGR/HP1AWFMyuXlmn1fQwR7RpaOAeo0zCWrd47ehjafeTqlHgWuuL?=
 =?iso-8859-1?Q?VodT3/UyceT4qt54k3V9fcUd2ezip5hfUonCTrieWWmaVR0V4Z/GzzXAS0?=
 =?iso-8859-1?Q?xziycmuMb0Urk4ksqpLXveiMUD/ExNOIn3TJ6ibLmbeDBA/GJCFhW99XHJ?=
 =?iso-8859-1?Q?3EIuGPhFFGguRwWRuob355SvrCAxJgiQ/mvXVVoFwPSMAM259AMvqT4dxX?=
 =?iso-8859-1?Q?5I+cg8qxsMh+P/eGXT8MCSM0X2h3SN1ulji1W83yZpjNKH1IUUbgLRVR8t?=
 =?iso-8859-1?Q?Ir3Wm0QeURLkIpTtpWSgQhDt+2tIKe6l3HViekHS0jTVWkH3pshH9gY7OY?=
 =?iso-8859-1?Q?7PWWjuOjhDvdN5Y7irQNh7B42SHsndsUtkJW15p4+Da5i9VQ4rAfNSBtyX?=
 =?iso-8859-1?Q?59hyT61uEzc4WWpesIObUoChrd8IdSostXS0s0n9796+/epcpareNkXdIv?=
 =?iso-8859-1?Q?X0Br6O5xlLeTB9PAnwhMLnisu3J4AjKGgA+mu7Ae5UJp8JK2naJyfBk/ks?=
 =?iso-8859-1?Q?UOxQZdWrqLoCKoUYmbTW/mX85Q8/6F9L/GwMWjfcnj5zRdYPA3BGYTmy0e?=
 =?iso-8859-1?Q?BSTd/FI82jS4YVgQeEUtCGAwWnjVYy269bA7QbDBDGZpHY8tcz+jweTdUD?=
 =?iso-8859-1?Q?XH6QHGLQHfhNe6EAfzzrECCs5P5uYuQNwV/VhD4K/lEiKwU5eM+fRxxQqj?=
 =?iso-8859-1?Q?SDcM8nYPoZgJ8rBSPz96JesIw6vuIlejyEgk4x6eBWtak48KQLsYI/CqGz?=
 =?iso-8859-1?Q?sWfCPWiV1wZiysskKF7bXsC8Jp9PEV6uciWWDBgC7lMpWDmuyYRHiTYRA9?=
 =?iso-8859-1?Q?HissUf2OVM1+g=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567D29E5AA322D54250DEA79A469BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0ebf66-a32e-41f5-f4c9-08db5d3459ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 15:26:03.0784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7SAGGiaKQbq2XtkRkqsPi9FEFH5KtV3ouB6QAJ9LkPC953GVVQGZCLE0FfDJBb/SF2uP6CmzMmYVAtrCNiZTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567D29E5AA322D54250DEA79A469BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 24/05/2023 21:02, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> This series introduce a new extension for GEM_CREATE,
>> 1. end support for set caching ioctl [PATCH 1/2]
>> 2. add set_pat extension for gem_create [PATCH 2/2]
>>
>> v2: drop one patch that was merged separately
>>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
>> v3: rebased on https://patchwork.freedesktop.org/series/117082/
>> v4: fix missing unlock introduced in v3, and
>>      solve a rebase conflict
>> v5: replace obj->cache_level with pat_set_by_user,
>>      fix i915_cache_level_str() for legacy platforms.
>> v6: rebased on https://patchwork.freedesktop.org/series/117480/
>> v7: rebased on https://patchwork.freedesktop.org/series/117528/
>> v8: dropped the two dependent patches that has been merged
>>      separately. Add IGT link and Tested-by (MESA).
>> v9: addressing comments (Andi)
>> v10: acked-by and tested-by MESA
>> v11: drop "end support for set caching ioctl" (merged)
>>       remove tools/include/uapi/drm/i915_drm.h
>> v12: drop Bspec reference in comment. add to commit message instead
>>
>> Fei Yang (1):
>>    drm/i915: Allow user to set cache at BO creation
>>
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>>   3 files changed, 83 insertions(+)
>>
>
> Do you also have a Test-with: run against the new IGT somewhere?

I ran locate test, not sure how to get a IGT result with updated kernel on =
patchwork,
looks like a chicken and egg problem.

> Regards,
>
> Tvrtko


--_000_BYAPR11MB2567D29E5AA322D54250DEA79A469BYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&gt; On 24/05/2023 21:02, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; This series introduce a new extensio=
n for GEM_CREATE,</div>
<div class=3D"ContentPasted0">&gt;&gt; 1. end support for set caching ioctl=
 [PATCH 1/2]</div>
<div class=3D"ContentPasted0">&gt;&gt; 2. add set_pat extension for gem_cre=
ate [PATCH 2/2]</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; v2: drop one patch that was merged s=
eparately</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;commit 341ad0e8e=
254 (&quot;drm/i915/mtl: Add PTE encode function&quot;)</div>
<div class=3D"ContentPasted0">&gt;&gt; v3: rebased on https://patchwork.fre=
edesktop.org/series/117082/</div>
<div class=3D"ContentPasted0">&gt;&gt; v4: fix missing unlock introduced in=
 v3, and</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;solve a rebase c=
onflict</div>
<div class=3D"ContentPasted0">&gt;&gt; v5: replace obj-&gt;cache_level with=
 pat_set_by_user,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;fix i915_cache_l=
evel_str() for legacy platforms.</div>
<div class=3D"ContentPasted0">&gt;&gt; v6: rebased on https://patchwork.fre=
edesktop.org/series/117480/</div>
<div class=3D"ContentPasted0">&gt;&gt; v7: rebased on https://patchwork.fre=
edesktop.org/series/117528/</div>
<div class=3D"ContentPasted0">&gt;&gt; v8: dropped the two dependent patche=
s that has been merged</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp;separately. Add =
IGT link and Tested-by (MESA).</div>
<div class=3D"ContentPasted0">&gt;&gt; v9: addressing comments (Andi)</div>
<div class=3D"ContentPasted0">&gt;&gt; v10: acked-by and tested-by MESA</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; v11: drop &quot;end support for set =
caching ioctl&quot; (merged)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; remove tools/in=
clude/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;&gt; v12: drop Bspec reference in comment=
. add to commit message instead</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Fei Yang (1):</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;drm/i915: Allow user to=
 set cache at BO creation</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; include/uapi/drm/i915_drm.h &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 41 ++++++++++++++++=
++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; 3 files changed, 83 insertion=
s(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Do you also have a Test-with: run agains=
t the new IGT somewhere?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I ran locate test, not sure how to get a IGT =
result with updated kernel on patchwork,</div>
<div class=3D"ContentPasted0">looks like a chicken and egg problem.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567D29E5AA322D54250DEA79A469BYAPR11MB2567namp_--
