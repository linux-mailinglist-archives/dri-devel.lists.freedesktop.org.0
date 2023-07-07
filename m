Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714874A818
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 02:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B6210E4E6;
	Fri,  7 Jul 2023 00:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFB010E4E2;
 Fri,  7 Jul 2023 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688689544; x=1720225544;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=oXmJUv01luvD3gCbywJx3lVFNCrCTD4yb+jBdJxNCU8=;
 b=hqIAYIqeRqSJz0NAkwEGGBv4uokAbCZ+c90z4wT+XJOmaOxpPNoQ9Smz
 jnkQeyPn2Q6ASv9KUmF0TzRJnOFEumllmPCZhvPhapX4fGgU6XONzbsxd
 ij9AhKLJUynqx6QZcXh8MBhfDlTX9B/u5hYlWJ2Nz8aC0jWJSnWX//1MA
 i2FmjO7f0sxy7MwNQSY9ZdWvu6BrhyRCJa1WLtjNQcuza3V7OM4QIkboZ
 kiIgf018Iziby79vOAOccCizmlbU8siZRz1iMCvuC+a5Yqz4b7D0RSZFX
 lOAj/nPXav8vsYugBxGaFzRoTzMCxwbG+6esNTTT+VU4gyrWE9BdE/zy5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353603021"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
 d="scan'208,217";a="353603021"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 17:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="669963449"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
 d="scan'208,217";a="669963449"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 06 Jul 2023 17:25:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 17:25:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 17:25:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 17:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3vY9RAnH+mv7J3ufYqKn8TtYR+AIHQvPao4hcd5dpadAafl5xm9C42IdfhMy4gTR3HKXeKtLvESLhOIomrtiF7m8rqUiOpUjHGLzUNuUDKujTHQkqv5h5CU6eYapKK8HASLtvY+wnmEtXeeu9jhqiMwtHeBrF+bS8397O2aFUF/byAil/pmP2EgRoxIqlLvMv7xW6KtWwR4tjEugJbKV//QvotLEAhEF9ipWv77OBaf5xUAX7VlxoG4KgduMzHXgPSGSs364fAvZVQAi/DHAkyqFFe3WD1aUqCNmY3J0r3+ko5PfSphPmB+0FtQTSUX2gcAwVu/1UWHF0BbS3/RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZSletrnB3mAmlp2xujqfQJMqR7yZP/6kIKZTJx0mV4=;
 b=XoF3qClmRI5Uao73rednMFy1ANfKR2ddo8J8QOOs7SAf3GgwlVY1tREB8HLkaZ04WrWqlAdlhVG4IINwPe5RqoL3RvmOHT+GnyxTbbjmXoIUB5iNvoDy8ecAxZqpASP1bevMnFjkas7knUwRpvzj+xTBzoXaX73k7v0gxsAFS9eJaKCDAi6TuNbnDqdyeOHaA52Na30u5AkvuedZvpiBwrt4TORY/siSK4HmNWXCLrjJAYtmSnkf30AaPzlwmOBtPi9ZNgjWbKuVDXSw3EkSuebiGAPfIX65jvAqsrHgWvLsOne3yHQsHupeNGD60vwge+6096LVkCpyvTlPbBmXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 00:25:39 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 00:25:39 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915: Refactor PAT/cache handling
Thread-Topic: [PATCH v2] drm/i915: Refactor PAT/cache handling
Thread-Index: AQHZqpQvF7ewKzrr+kCyWWOnY6DVxa+i6j3igAUKSACAAUhM64ADsEEAgACQRXY=
Date: Fri, 7 Jul 2023 00:25:39 +0000
Message-ID: <BYAPR11MB2567C6E41E13F733CF5F1BA29A2DA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230629141509.3194090-1-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB256721AE29EBF133E60D7CD19A2AA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <6fcb91a4-5e93-4964-e4b1-45bf965b0011@linux.intel.com>
 <BYAPR11MB2567F99FD5CFB3E709B2B3879A2EA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <b5182784-acdc-0c4e-5c57-998ef93a7a17@linux.intel.com>
In-Reply-To: <b5182784-acdc-0c4e-5c57-998ef93a7a17@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CH3PR11MB8702:EE_
x-ms-office365-filtering-correlation-id: 7f1da065-705b-4dd7-350f-08db7e80b0d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VtYQSmkl7kuePQPgXgVoAMgckvdfSt/1DbZiUnawsOY678voaOnDGJx3F1dmW6LcWcGyKH1J7Mq270ZxrEhRnVank+o2YJGLQYGHMgQ3LvDFWE48zmfZEAZD/w3wLt8CbSQDfb0ioRfdC/dktFRfiVA8FBIXbgiirQmS83FoHBAfaWRMsBd2cFry9yIUQ049zMLChSjtNhokugI2iAHfrG5hU6vna37Ko2vwyHqadcUz6xErlAaeW7gULbgR1JaBJiORi115LbE6ENTaZF69nTaxSiycthK2DCNaq/u9WQyDL7DbyHzmOrXAebgBgvOS92tLU0SLi5SvhclQunfQP8R2X10mlA+Hx3cVfJrn9ksC7kTa4gaq5Typ0DPCMJTnQDN+3IJ/BBYyWV0RDM1EW96lpiE4Rhz9928Yc9OXo4Vpk7ZmuuyisI8AwJ/AXX7DQMLQ/Q4aTjbeofvSi9S1uytsxWlVzh3ALzUBim3OAYYXTjv+NkiusqMIrTKXHL5s5xQKDt3fBJmMcF7DxUcbYX3PnZpVgBk54kicR6LXCn6q0KIgZIqAVM/PoIj6dKFvJ+snFDpuNuxA+2GcFmp4NDU1faxHHFIRu32u4rEc8pRQP8HZKieoJbvc43tz6gex
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(8936002)(478600001)(5660300002)(52536014)(8676002)(66556008)(66476007)(19627405001)(76116006)(66946007)(316002)(4326008)(64756008)(41300700001)(66446008)(2906002)(91956017)(110136005)(7696005)(71200400001)(26005)(9686003)(186003)(30864003)(82960400001)(122000001)(83380400001)(6506007)(33656002)(38100700002)(86362001)(38070700005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bGjSwK3ZRNYZ6A4JojdOA3We8OoP6XbSghLxFTwxqzKgVEd7p4OPWLs113?=
 =?iso-8859-1?Q?88+0w93vao7vP8NRKFWKr9qDlgFSR/yE86jKzs5qlIOu/xY29Ser+2K6ey?=
 =?iso-8859-1?Q?HLWzAjR8xLz3gWLLcauBwUcuUhws54fQM5QV3UTL0jSc/F2D6K/3WKR+1A?=
 =?iso-8859-1?Q?r/zKp4QASHgl0CHgP0QlzsABhOZeV4BrOX2+7rFLVFksWuY68ucTlNIzWm?=
 =?iso-8859-1?Q?niNG3BIaytUmjva6Ronh+lfPAtVHU/vTRu5kLFqdWcdOex0IMreJ/h+ln9?=
 =?iso-8859-1?Q?MLOrssOm/pFZU1ayvH//bbtXJSpJxkyCwLNkzNlwzSwbv4beLlFj8GWJ+a?=
 =?iso-8859-1?Q?GnxJvQawQbJXO5PBldJ9lc2kjmBTi4oEoYeGPgH7gR6TenwdX5ie62LTuV?=
 =?iso-8859-1?Q?bR/abDqxCukcHFoFUhpsexVvOiXyVJK3nxHx0nRshGCccVFtAb/C4IeakY?=
 =?iso-8859-1?Q?qYCzzSl0+ZrJwiDbCLwILLhwVEnDzh3e7mgoUOUOKHRKAXoiiYOPiIoLuR?=
 =?iso-8859-1?Q?hFiEujjfCQurtPgzwOqm0p5L2WjPqn9mGQZR7LYuES35bUXuXpwk/TcxBJ?=
 =?iso-8859-1?Q?TgcoOS7VsTHg327Mdvqjl/Vhmrgft4tXg6ANi69VoDOVnf1VHCKlrf/Y3e?=
 =?iso-8859-1?Q?xPgeTcKgq6UJRo9GlNVry7kNi0JaQrtTLmb3xJTWJ0tzy0q/B0iCgLoNZA?=
 =?iso-8859-1?Q?3Q37A1kLU1sqlvq2UFRRXmxlPgtiUfYgNX8bQd/CRA1xVfBQEmH2bqSC/A?=
 =?iso-8859-1?Q?5QcdquDiZlWTmQKCPiaiLfhqLY9/7VlVATvLSIrPFRkmi9a8i/WqGEPDHx?=
 =?iso-8859-1?Q?TVII4eDZGLitMk+6Bjd1cI/gvUHuo/2IEuy0jes5pprojiSWV/JzrsdkUH?=
 =?iso-8859-1?Q?wTMmALjwehw3RitztqQ7FxMMbmcLVfqMSxLEwS6q1rDftYxemy1t5x2Yhh?=
 =?iso-8859-1?Q?fQUDV1u0X+i2lPRSQzOPM9ooiUQsFOoidV1dGY5Vm7YtHApF4ZyjYQs1EI?=
 =?iso-8859-1?Q?25jZTmO1EkCiveSN+iEp3SGQcSlrHwrjgEGZN+qu/637NDJspoYFB8rl6a?=
 =?iso-8859-1?Q?CthlvuBT+EFGLGejuZqdm5aqA02pO6pmbUPRvJKARU5CxEdma6yWpk4j6g?=
 =?iso-8859-1?Q?Xb55TiFVCQ9O5dS2D0DB3jIu2mqqujogx9LvRWAqUoP4XwtryRa6jkz/9B?=
 =?iso-8859-1?Q?GpZCgEzH4xFAwwwwNZG1NDeVVsMNgW9P8X2ny5WinBRgpfYa8saKzD3k1X?=
 =?iso-8859-1?Q?7Oe0Is4cSqyMmXIe+TNM0otFYMTn/wlMIarU3ZwJtptEI4P9RslSHQOkw2?=
 =?iso-8859-1?Q?7fzCP+wpCq21ipK/83SyNVz0S9l2IoF7HFdhPMwBDZkSUxUAVxlIgF2Ev/?=
 =?iso-8859-1?Q?msSfIAtNq2IfNKgMyZ1eRGZo3uaB7rMTDagGFD/KZv/2RbwLatHLaf/cy2?=
 =?iso-8859-1?Q?QUoHgN1HRYnxxNXeAU/B/wB2Cnme1Y1r0UYhyfSymAb0f+2RuZAmDxYpY/?=
 =?iso-8859-1?Q?D/mh06hM7HqHUCu6wgwFj4ReyZb6GD/xfpA50qZTXe5byvRnso93wUvUqk?=
 =?iso-8859-1?Q?k9RWMC7eZXKnqc+KSQKd/3Tp2o9imyyL9M8Y+7w9bxZVwLA7kcNxKKjJAc?=
 =?iso-8859-1?Q?YRXJwDnrfPbsLRAc0ptK9hcgm3z3cyM+J5?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567C6E41E13F733CF5F1BA29A2DABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1da065-705b-4dd7-350f-08db7e80b0d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 00:25:39.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: StlJ2oBXu/osGmvhHrR1oQsM1b6uNvEWwoyOlIXsZwfwdDK5CdZnw40HSbF4Rso2TdLpYAUF5OyhM62KGiBY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567C6E41E13F733CF5F1BA29A2DABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct  drm_i9=
15_gem_object *obj)
>>>>>          if (IS_DGFX(i915))
>>>>>              return false;
>>>>> -       /*
>>>>> -        * For objects created by userspace through GEM_CREATE with p=
at_index
>>>>> -        * set by set_pat extension, i915_gem_object_has_cache_level(=
) will
>>>>> -        * always return true, because the coherency of such object i=
s managed
>>>>> -        * by userspace. Othereise the call here would fall back to c=
hecking
>>>>> -        * whether the object is un-cached or write-through.
>>>>> -        */
>>>>> -       return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE=
) ||
>>>>> -                i915_gem_object_has_cache_level(obj, I915_CACHE_WT))=
;
>>>>> +       return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC=
) !=3D 1 &&
>>>>> +              i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT=
) !=3D 1;
>>>>
>>>> This logic was changed for objects with pat index set by user here. It
>>>> used to return false regardless the cache mode. But now it returns tru=
e
>>>> if its cache mode is neither UC nor WT.
>>>
>>> Yes, that was half of the motivation of the refactory. Before the PAT
>>> index series code was like this:
>>>
>>>        return !(obj->cache_level =3D=3D I915_CACHE_NONE ||
>>>                 obj->cache_level =3D=3D I915_CACHE_WT);
>>> So kernel knew it needs to flush only if caching mode is neither UC or =
WT.
>>> With the PAT index series you changed it to:
>>>
>>>        return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) |=
|
>>>                 i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>> And as i915_gem_object_has_cache_level was changed to always return tru=
e
>>> if PAT was set by user, that made the check meaningless for such object=
s.
>>
>> But the point is that the KMD should not flush the cache for objects
>> with PAT set by user because UMD is handling the cache conherency.
>> That is the design. Well doing so wouldn't cause functional issue, but
>> it's unecessary and might have performance impact.
>
> Not all i915_gem_object_has_cache_level() are even about flushing the cac=
he
> and if the kernel doesn't know what is behind a PAT index
> (i915_gem_object_has_cache_level lies by always returning true) are we 10=
0%
> sure everything is functionally correct?
>
> flush_write_domain() for instance uses it to determine whether to set
> obj->cache_dirty after GPU activity. How does the UMD manage that?
>
> Then use_cpu_reloc(). Another pointless/misleading question.
>
> Finally vm_fault_gtt() rejects access based on it.
>
> Perhaps the question is moot since the set pat extension is restricted to
> MTL so some other conditions used in the above checks, like HAS_LLC and s=
uch,
> make for no practical difference. Even if so, what if the extension was a=
llowed
> on other platforms as it was the plan until it was discovered there is no
> userspace code for other platforms. Would the plan work on all platforms?=
 And
> even if it would I think the implementation is very non-obvious.
>

Understand your point, perhaps we should let i915_gem_object_has_cache_mode=
()
do what it supposed to do, and add a separate check for obj->pat_set_by_use=
r
in functions like gpu_write_needs_clflush(), use_cpu_reloc(), etc. Anyway,
the design is to let UMD handle coherency for objects with pat set by user.

>>> With my refactoring it becomes meaningful again and restores to the
>>> original behaviour. That's the intent at least.
>>>
>>>>>  bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *ob=
j)
>>>>> @@ -255,9 +249,9 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915=
_gem_object *obj, bool write)
>>>>>  }
>>>>>
>>>>>  /**
>>>>> - * i915_gem_object_set_cache_level - Changes the cache-level of an o=
bject across all VMA.
>>>>> + * i915_gem_object_set_cache - Changes the cache-level of an object =
across all VMA.

[...]

>>>>> -       if (i915_gem_object_has_cache_level(obj, cache_level))
>>>>> +       ret =3D i915_cache_find_pat(i915, cache);
>>>>> +       if (ret < 0) {
>>>>> +           struct drm_printer p =3D
>>>>> +                drm_err_printer("Attempting to use unknown caching m=
ode ");
>>>>> +
>>>>> +           i915_cache_print(&p, cache);
>>>>> +           drm_puts(&p, "!\n");
>>>>> +
>>>>> +           return -EINVAL;
>>>>> +       } else if (ret =3D=3D obj->pat_index) {
>>>>>             return 0;
>>>> We will have to do this conversion and checking again later in this
>>>> function when calling i915_gem_object_set_cache_coherency().
>>>
>>> Yes the double lookup part is a bit naff. It is not super required
>>> apart for validating internal callers (could be a debug build only
>>> feature perhaps) and to see if PAT index has changed and so whether
>>> it needs to call i915_gem_object_wait before proceeding to
>>> i915_gem_object_set_cache_coherency...
>>>
>>>> My thought was to simply remove the use of cache_level/cache and repla=
ce
>>>> it with pat_idex. Conversion from cache modes to pat index should be d=
one
>>>> before calling any function used to consume cache_level/cache.
>>>
>>> ... I could probably call the setter which takes PAT index instead of
>>> i915_gem_object_set_cache_coherency few lines below. That would skip th=
e
>>> double lookup and make you happy(-ier)?
>>
>> Do you see any problem just letting these functions take pat_index as
>> the second argument? These functions are currently called with a
>> constant cache_level/mode, if we have INTEL_INFO(i915)->pat_uc/wt/wb
>> set properly, using pat index makes no difference, right?
>
> Which ones?

i915_gem_object_set_cache_level() and i915_gem_object_set_cache_coherency()
are both being called with cache_level as of now. That is not necessary if
platform specific INTEL_INFO(i915)->pat_uc/wt/wb are there. we can simply

s/I915_CACHE_NONE/INTEL_INFO(i915)->pat_uc
s/I915_CACHE_WT/INTEL_INFO(i915)->pat_wt
s/I915_CACHE_LLC/INTEL_INFO(i915)->pat_wb

[...]

>>>>> if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB))
>>>> This looks wrong, at least for MTL. Prior to MTL the GPU automatically
>>>> snoop CPU cache, but from MTL onward you have to specify if WB or
>>>> WB + 1-WAY COH is needed. And for KMD, cacheable mode means WB +
>>>> 1-WAY COH for MTL to keep the behavior consistent.
>>>>
>>>> This used to be taken care of by i915_gem_get_pat_index() call.
>>>> With that being replaced by i915_cache_find_pat(), you would need
>>>> to do something there.
>>>> But, without cachelevel_to_pat[], you might end up hard coding
>>>> something directly in the function, and that is platform
>>>> dependent. hmm..., I don't really like this idea.
>>>>
>>>> That's why I commented in v1 that we should use
>>>> INTEL_INFO(i915)->pat_uc/wb/wt instead of enum i915_cache_level or
>>>> i915_cache_t.
>>>
>>> I think I get it. I hope so.. So if I made the tables like this:
>>>
>>> #define LEGACY_CACHE_MODES \
>>>        .cache_modes =3D { \
>>>                [0] =3D I915_CACHE(UC), \
>>>                [1] =3D _I915_CACHE(WB, COH1W), \
>>>                [2] =3D _I915_CACHE(WB, COH1W | L3), \ // 2way??
>>>                [3] =3D I915_CACHE(WT), \
>>>         }
>>> #define GEN12_CACHE_MODES \
>>>        .cache_modes =3D { \
>>>                [0] =3D _I915_CACHE(WB, COH1W), \
>>>                [1] =3D I915_CACHE(WC), \
>>>                [2] =3D I915_CACHE(WT), \
>>>                [3] =3D I915_CACHE(UC), \
>>>         }
>>> #define MTL_CACHE_MODES \
>>>        .cache_modes =3D { \
>>>                [0] =3D _I915_CACHE(WB, COH1W), \
>
>This was a brain fart, should have just been WB.
>
>>>                [1] =3D I915_CACHE(WT), \
>>>                [2] =3D I915_CACHE(UC), \
>>>                [3] =3D _I915_CACHE(WB, COH1W), \
>>>                [4] =3D _I915_CACHE(WB, COH2W), \
>>> And made i915->pat_wc look up _I915_CACHE(WB, COH1W) would that work?
>>> Hmm and also all "has cache level" call sites would need to look
>>> not just for WB but WB+COH1W.
>>>
>>> Would it work? Too ugly?
>>
>> I don't think this would work. The cache_modes needs to be aligned
>> with BSpec, otherwise checkings for
>> INTEL_INFO(i915)->cache_modes[obj->pat_index] might become invalid.
>> Also, COH1W/2W were not even there for platforms prior to MTL.
>
> Not sure what would become invalid?

What if we want to check for a particular pat_index whether it means
cached or uncached, whether it's 1-way coherent or not? if the cache_modes[=
]
misaligned with bspec, then we would fail such check.

> COH1W/2W are perhaps names associated
> with MTL - but is Gen12 PAT 0 identical in behaviour to PAT 3 or PAT 4 on
> MTL? If yes then we can introduce an i915 specific name for that coherenc=
y
> mode and apply it to both platforms.
>
>> I still think setting INTEL_INFO(i915)->pat_uc/wt/wb is the best solutio=
n.
>> With that we can also eliminate the use of I915_CACHE({UC|WT|WB}).
>
> How for the call sites which are asking about caching mode characteristic=
s?
> We can't ask if something has PAT index X from the source code since that=
 is
> platform dependent.

We can compare pat index directly for exact match. Even for the case we jus=
t
want to distinguish cached or uncached, we can check the bit field of
INTEL_INFO(i915)->cache_modes[obj->pat_index].

>>>>> +357,7 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void=
 *data,
>>>>>          switch (args->caching) {
>>>>>          case I915_CACHING_NONE:
>>>>> -               level =3D I915_CACHE_NONE;
>>>>> +               cache =3D I915_CACHE(UC);
>>>>
>>>> For code like this, my thought was
>>>> -               level =3D I915_CACHE_NONE;
>>>> +               pat_index =3D INTEL_INFO(i915)->pat_uc;
>>>> And later the set_cache call should take pat_index as argument instead
>>>> of cache mode.
>>>>
>>>>>                  break;
>>>>>          case I915_CACHING_CACHED:
>>>>>                  /*
>>>>> @@ -367,10 +369,10 @@ int i915_gem_set_caching_ioctl(struct drm_devic=
e *dev, void *data,
>>>>>                 if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
>>>>>                     return -ENODEV;
>>>>> -               level =3D I915_CACHE_LLC;
>>>>> +               cache =3D I915_CACHE(WB);
>>>>
>>>> -               level =3D I915_CACHE_LLC;
>>>> +               pat_index =3D INTEL_INFO(i915)->pat_wb;
>>>> This should take care of the WB + 1-WAY COH issue for MTL mentioned ab=
ove,
>>>> assuming the i915_cache_init() set pat_wb properly, and the
>>>> i915_gem_object_set_cache() consumes pat_index instead of cache mode.
>>>
>>> That works too yes.
>>>
>>>>
>>>>>                  break;
>>>>>          case I915_CACHING_DISPLAY:
>>>>> -               level =3D HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_N=
ONE;
>>>>> +               cache =3D HAS_WT(i915) ? I915_CACHE(WT) : I915_CACHE(=
UC);
>>>>>                 break;
>>>>>          default:
>>>>>                 return -EINVAL;
>>
>> [...]
>>
>>>>>
>>>>> bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>>>> @@ -215,6 +222,7 @@ bool i915_gem_object_can_bypass_llc(struct drm_i9=
15_gem_object *obj)
>>>>>          /*
>>>>>           * Always flush cache for UMD objects at creation time.
>>>>>           */
>>>>> +       /* QQQ/FIXME why? avoidable performance penalty? */
>>
>> This is needed because UMD's assume zero-initialized BO's are really
>> zero'ed out before getting the handles to the BO's (See VLK-46522).
>> Otherwise UMD's could read stale data, thus cause security issues.
>
> Hah this comes exactly to my point from above. So it looks my propsal
> would exactly solve this. Because i915 would know the caching mode and
> know to flush if not coherent. And it would be better than flushing for
> every obj->pat_set_by_user because that approach pessimistically flushes
> even when it is not needed.

hmm..., This is only called at BO creation time. We do need to clflush all
objects with pat_set_by_user, otherwise the user would get access to stale
data.

-Fei

> Regards,
>
> Tvrtko
>
>>
>>>>>          if (obj->pat_set_by_user)
>>>>>              return true;
>>>>>
>>
>> [...]
>>
>>>>> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/d=
rm/i915/intel_device_info.h
>>>>> index dbfe6443457b..f48a21895a85 100644
>>>>> --- a/drivers/gpu/drm/i915/intel_device_info.h
>>>>> +++ b/drivers/gpu/drm/i915/intel_device_info.h
>>>>> @@ -27,6 +27,8 @@
>>>>>
>>>>>  #include <uapi/drm/i915_drm.h>
>>>>>
>>>>> +#include "i915_cache.h"
>>>>> +
>>>>>  #include "intel_step.h"
>>>>>
>>>>>  #include "gt/intel_engine_types.h"
>>>>> @@ -243,8 +245,8 @@ struct intel_device_info {  >>>           */
>>>>>          const struct intel_runtime_info __runtime;
>>>>> -        u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
>>>>> -        u32 max_pat_index;
>>>>> +        i915_cache_t cache_modes[9];
>>>> I was commenting on the array size here. It's probably better to make
>>>> it 16 because there are 4 PAT index bits defined in the PTE. Indices
>>>> above max_pat_index are not used, but theoretically new mode could be
>>>> added. Well, it's up to you, not likely to happen anyway.
>>>
>>> Ah okay. I am not too concerned. Compiler will let us know if it happen=
s.
>>>
>>> Unrelated to this comment - what about i915_gem_object_can_bypass_llc?
>>> Could we do better (less pessimistic) with something like my approach a=
nd
>>> so maybe penalize MTL less?
>>
>> The problem is that, for the BO's managed by UMD's, the KMD doesn't
>> know whether they are going to be mapped as cacheable or uncacheable
>> on the CPU side. The PAT index controls GPU access only. That's why we
>> make sure all BO's with PAT set by UMD (which means UMD will take
>> control and managing the
>> coherency) are clflush'ed.
>>
>> -Fei
>>
>>> Regards,
>>>
>>> Tvrtko


--_000_BYAPR11MB2567C6E41E13F733CF5F1BA29A2DABYAPR11MB2567namp_
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
&gt;&gt;&gt;&gt;&gt; @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush=
(struct &nbsp;drm_i915_gem_object *obj)
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;if (IS_DGFX(i915))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; /=
*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;* For objects created by userspace through GEM_CREATE with pat_index</=
div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;* set by set_pat extension, i915_gem_object_has_cache_level() will</di=
v>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;* always return true, because the coherency of such object is managed<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;* by userspace. Othereise the call here would fall back to checking</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;* whether the object is un-cached or write-through.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; r=
eturn !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_has_cache_level(obj, I915_=
CACHE_WT));</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; r=
eturn i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) !=3D 1 &amp;&=
amp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_has_cache_mode(obj, I915_CACHE_MO=
DE_WT) !=3D 1;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; This logic was changed for o=
bjects with pat index set by user here. It</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; used to return false regardl=
ess the cache mode. But now it returns true</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; if its cache mode is neither=
 UC nor WT.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Yes, that was half of the motiva=
tion of the refactory. Before the PAT</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; index series code was like this:=
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n !(obj-&gt;cache_level =3D=3D I915_CACHE_NONE ||</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;cache_level =3D=3D I915_CACHE_WT);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; So kernel knew it needs to flush=
 only if caching mode is neither UC or WT.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; With the PAT index series you ch=
anged it to:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; i915_gem_object_has_cache_level(obj, I915_CACHE_WT)=
);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; And as i915_gem_object_has_cache=
_level was changed to always return true</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; if PAT was set by user, that mad=
e the check meaningless for such objects.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; But the point is that the KMD should=
 not flush the cache for objects
</div>
<div class=3D"ContentPasted0">&gt;&gt; with PAT set by user because UMD is =
handling the cache conherency.
</div>
<div class=3D"ContentPasted0">&gt;&gt; That is the design. Well doing so wo=
uldn't cause functional issue, but
</div>
<div class=3D"ContentPasted0">&gt;&gt; it's unecessary and might have perfo=
rmance impact.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Not all i915_gem_object_has_cache_level(=
) are even about flushing the cache</div>
<div class=3D"ContentPasted0">&gt; and if the kernel doesn't know what is b=
ehind a PAT index</div>
<div class=3D"ContentPasted0">&gt; (i915_gem_object_has_cache_level lies by=
 always returning true) are we 100%</div>
<div class=3D"ContentPasted0">&gt; sure everything is functionally correct?=
</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; flush_write_domain() for instance uses i=
t to determine whether to set
</div>
<div class=3D"ContentPasted0">&gt; obj-&gt;cache_dirty after GPU activity. =
How does the UMD manage that?</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Then use_cpu_reloc(). Another pointless/=
misleading question.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Finally vm_fault_gtt() rejects access ba=
sed on it.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Perhaps the question is moot since the s=
et pat extension is restricted to</div>
<div class=3D"ContentPasted0">&gt; MTL so some other conditions used in the=
 above checks, like HAS_LLC and such,</div>
<div class=3D"ContentPasted0">&gt; make for no practical difference. Even i=
f so, what if the extension was allowed</div>
<div class=3D"ContentPasted0">&gt; on other platforms as it was the plan un=
til it was discovered there is no</div>
<div class=3D"ContentPasted0">&gt; userspace code for other platforms. Woul=
d the plan work on all platforms? And</div>
<div class=3D"ContentPasted0">&gt; even if it would I think the implementat=
ion is very non-obvious.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Understand your point, perhaps we should let =
i915_gem_object_has_cache_mode()</div>
<div class=3D"ContentPasted0">do what it supposed to do, and add a separate=
 check for obj-&gt;pat_set_by_user</div>
<div class=3D"ContentPasted0">in functions like gpu_write_needs_clflush(), =
use_cpu_reloc(), etc. Anyway,</div>
<div class=3D"ContentPasted0">the design is to let UMD handle coherency for=
 objects with pat set by user.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; With my refactoring it becomes m=
eaningful again and restores to the
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; original behaviour. That's the i=
ntent at least.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;bool i915_gem_cpu_=
write_needs_clflush(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; @@ -255,9 +249,9 @@ i915=
_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;/**</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - * i915_gem_object_set_=
cache_level - Changes the cache-level of an object across all VMA.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + * i915_gem_object_set_=
cache - Changes the cache-level of an object across all VMA.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">[...]</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; i=
f (i915_gem_object_has_cache_level(obj, cache_level)) &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; r=
et =3D i915_cache_find_pat(i915, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; i=
f (ret &lt; 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; struct drm_printer p =3D</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drm_err_printer(&quot;Attempting to use un=
known caching mode &quot;);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; i915_cache_print(&amp;p, cache);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; drm_puts(&amp;p, &quot;!\n&quot;);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; }=
 else if (ret =3D=3D obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; return 0;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; We will have to do this conv=
ersion and checking again later in this</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; function when calling i915_g=
em_object_set_cache_coherency().</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Yes the double lookup part is a =
bit naff. It is not super required &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; apart for validating internal ca=
llers (could be a debug build only</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; feature perhaps) and to see if P=
AT index has changed and so whether &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; it needs to call i915_gem_object=
_wait before proceeding to</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; i915_gem_object_set_cache_cohere=
ncy...</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; My thought was to simply rem=
ove the use of cache_level/cache and replace</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; it with pat_idex. Conversion=
 from cache modes to pat index should be done</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; before calling any function =
used to consume cache_level/cache.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; ... I could probably call the se=
tter which takes PAT index instead of</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; i915_gem_object_set_cache_cohere=
ncy few lines below. That would skip the</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; double lookup and make you happy=
(-ier)?</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; Do you see any problem just letting =
these functions take pat_index as
</div>
<div class=3D"ContentPasted0">&gt;&gt; the second argument? These functions=
 are currently called with a
</div>
<div class=3D"ContentPasted0">&gt;&gt; constant cache_level/mode, if we hav=
e INTEL_INFO(i915)-&gt;pat_uc/wt/wb
</div>
<div class=3D"ContentPasted0">&gt;&gt; set properly, using pat index makes =
no difference, right?</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Which ones?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">i915_gem_object_set_cache_level() and i915_ge=
m_object_set_cache_coherency()</div>
<div class=3D"ContentPasted0">are both being called with cache_level as of =
now. That is not necessary if</div>
<div class=3D"ContentPasted0">platform specific INTEL_INFO(i915)-&gt;pat_uc=
/wt/wb are there. we can simply</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">s/I915_CACHE_NONE/INTEL_INFO(i915)-&gt;pat_uc=
</div>
<div class=3D"ContentPasted0">s/I915_CACHE_WT/INTEL_INFO(i915)-&gt;pat_wt</=
div>
<div class=3D"ContentPasted0">s/I915_CACHE_LLC/INTEL_INFO(i915)-&gt;pat_wb<=
/div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">[...]</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; if (i915_gem_object_has_=
cache_mode(obj, I915_CACHE_MODE_WB))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; This looks wrong, at least f=
or MTL. Prior to MTL the GPU automatically
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; snoop CPU cache, but from MT=
L onward you have to specify if WB or
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; WB + 1-WAY COH is needed. An=
d for KMD, cacheable mode means WB +
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; 1-WAY COH for MTL to keep th=
e behavior consistent.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; This used to be taken care o=
f by i915_gem_get_pat_index() call.
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; With that being replaced by =
i915_cache_find_pat(), you would need
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; to do something there.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; But, without cachelevel_to_p=
at[], you might end up hard coding
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; something directly in the fu=
nction, and that is platform
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; dependent. hmm..., I don't r=
eally like this idea.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; That's why I commented in v1=
 that we should use </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; INTEL_INFO(i915)-&gt;pat_uc/=
wb/wt instead of enum i915_cache_level or
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; i915_cache_t.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; I think I get it. I hope so.. So=
 if I made the tables like this:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; #define LEGACY_CACHE_MODES \</di=
v>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cach=
e_modes =3D { \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[0] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[1] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[2] =3D _I915_CACHE(WB, COH1W | L3), \ // 2way??</di=
v>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[3] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; }</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; #define GEN12_CACHE_MODES \</div=
>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cach=
e_modes =3D { \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[0] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[1] =3D I915_CACHE(WC), \ &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[2] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[3] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; }</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt; #define MTL_CACHE_MODES \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;.cach=
e_modes =3D { \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[0] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;This was a brain fart, should have just b=
een WB.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[1] =3D I915_CACHE(WT), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[2] =3D I915_CACHE(UC), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[3] =3D _I915_CACHE(WB, COH1W), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;[4] =3D _I915_CACHE(WB, COH2W), \</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; And made i915-&gt;pat_wc look up=
 _I915_CACHE(WB, COH1W) would that work?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Hmm and also all &quot;has cache=
 level&quot; call sites would need to look
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; not just for WB but WB+COH1W.</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Would it work? Too ugly?</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; I don't think this would work. The c=
ache_modes needs to be aligned
</div>
<div class=3D"ContentPasted0">&gt;&gt; with BSpec, otherwise checkings for =
</div>
<div class=3D"ContentPasted0">&gt;&gt; INTEL_INFO(i915)-&gt;cache_modes[obj=
-&gt;pat_index] might become invalid.
</div>
<div class=3D"ContentPasted0">&gt;&gt; Also, COH1W/2W were not even there f=
or platforms prior to MTL.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Not sure what would become invalid?</div=
>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">What if we want to check for a particular pat=
_index whether it means</div>
<div class=3D"ContentPasted0">cached or uncached, whether it's 1-way cohere=
nt or not? if the cache_modes[]</div>
<div class=3D"ContentPasted0">misaligned with bspec, then we would fail suc=
h check.
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; COH1W/2W are perhaps names associated</d=
iv>
<div class=3D"ContentPasted0">&gt; with MTL - but is Gen12 PAT 0 identical =
in behaviour to PAT 3 or PAT 4 on</div>
<div class=3D"ContentPasted0">&gt; MTL? If yes then we can introduce an i91=
5 specific name for that coherency</div>
<div class=3D"ContentPasted0">&gt; mode and apply it to both platforms.</di=
v>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; I still think setting INTEL_INFO(i91=
5)-&gt;pat_uc/wt/wb is the best solution.</div>
<div class=3D"ContentPasted0">&gt;&gt; With that we can also eliminate the =
use of I915_CACHE({UC|WT|WB}).</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; How for the call sites which are asking =
about caching mode characteristics?</div>
<div class=3D"ContentPasted0">&gt; We can't ask if something has PAT index =
X from the source code since that is</div>
<div class=3D"ContentPasted0">&gt; platform dependent.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">We can compare pat index directly for exact m=
atch. Even for the case we just</div>
<div class=3D"ContentPasted0">want to distinguish cached or uncached, we ca=
n check the bit field of</div>
<div class=3D"ContentPasted0">INTEL_INFO(i915)-&gt;cache_modes[obj-&gt;pat_=
index].</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; +357,7 @@ int i915_gem_s=
et_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;switch (args-&gt;caching) {</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;case I915_CACHING_NONE:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; level =3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; cache =3D I915_CACHE(UC);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; For code like this, my thoug=
ht was </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; level =3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; pat_index =3D INTEL_INFO(i915)-&gt;pat_uc;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; And later the set_cache call=
 should take pat_index as argument instead</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; of cache mode.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;case I915_CACHING_CACHED:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; @@ -367,10 +369,10 @@ in=
t i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; if (!HAS_LLC(i915) &amp;&amp; !HAS_SNOOP(i9=
15))</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENODEV; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; level =3D I915_CACHE_LLC;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; cache =3D I915_CACHE(WB);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; level =3D I915_CACHE_LLC;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; pat_index =3D INTEL_INFO(i915)-&gt;pat_wb;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; This should take care of the=
 WB + 1-WAY COH issue for MTL mentioned above,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; assuming the i915_cache_init=
() set pat_wb properly, and the</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; i915_gem_object_set_cache() =
consumes pat_index instead of cache mode.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; That works too yes.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;case I915_CACHING_DISPLAY:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; level =3D HAS_WT(i915) ? I915_CACHE_WT : I915_CA=
CHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; cache =3D HAS_WT(i915) ? I915_CACHE(WT) : I915_C=
ACHE(UC);</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;default:</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; [...]</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; bool i915_gem_object_can=
_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; @@ -215,6 +222,7 @@ bool=
 i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; * Always flush cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; /=
* QQQ/FIXME why? avoidable performance penalty? */</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; This is needed because UMD's assume =
zero-initialized BO's are really
</div>
<div class=3D"ContentPasted0">&gt;&gt; zero'ed out before getting the handl=
es to the BO's (See VLK-46522).
</div>
<div class=3D"ContentPasted0">&gt;&gt; Otherwise UMD's could read stale dat=
a, thus cause security issues.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Hah this comes exactly to my point from =
above. So it looks my propsal</div>
<div class=3D"ContentPasted0">&gt; would exactly solve this. Because i915 w=
ould know the caching mode and</div>
<div class=3D"ContentPasted0">&gt; know to flush if not coherent. And it wo=
uld be better than flushing for</div>
<div class=3D"ContentPasted0">&gt; every obj-&gt;pat_set_by_user because th=
at approach pessimistically flushes</div>
<div class=3D"ContentPasted0">&gt; even when it is not needed.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">hmm..., This is only called at BO creation ti=
me. We do need to clflush all</div>
<div class=3D"ContentPasted0">objects with pat_set_by_user, otherwise the u=
ser would get access to stale</div>
<div class=3D"ContentPasted0">data.</div>
<div><br class=3D"ContentPasted0">
</div>
<div>-Fei</div>
<div><br>
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;if (obj-&gt;pat_set_by_user)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;return true;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; [...]</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu=
/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; index dbfe6443457b..f48a=
21895a85 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/i9=
15/intel_device_info.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/i9=
15/intel_device_info.h</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; @@ -27,6 +27,8 @@</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;#include &lt;uapi/=
drm/i915_drm.h&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; +#include &quot;i915_cac=
he.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;#include &quot;int=
el_step.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp;#include &quot;gt/=
intel_engine_types.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; @@ -243,8 +245,8 @@ stru=
ct intel_device_info { &nbsp;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; */ &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;const struct intel_runtime_info __runtime;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp;u32 max_pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;i915_cache_t cache_modes[9];</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; I was commenting on the arra=
y size here. It's probably better to make</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; it 16 because there are 4 PA=
T index bits defined in the PTE. Indices</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; above max_pat_index are not =
used, but theoretically new mode could be</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; added. Well, it's up to you,=
 not likely to happen anyway.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Ah okay. I am not too concerned.=
 Compiler will let us know if it happens.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Unrelated to this comment - what=
 about i915_gem_object_can_bypass_llc?</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Could we do better (less pessimi=
stic) with something like my approach and</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; so maybe penalize MTL less?</div=
>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; The problem is that, for the BO's ma=
naged by UMD's, the KMD doesn't
</div>
<div class=3D"ContentPasted0">&gt;&gt; know whether they are going to be ma=
pped as cacheable or uncacheable
</div>
<div class=3D"ContentPasted0">&gt;&gt; on the CPU side. The PAT index contr=
ols GPU access only. That's why we
</div>
<div class=3D"ContentPasted0">&gt;&gt; make sure all BO's with PAT set by U=
MD (which means UMD will take
</div>
<div class=3D"ContentPasted0">&gt;&gt; control and managing the</div>
<div class=3D"ContentPasted0">&gt;&gt; coherency) are clflush'ed.</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt; -Fei</div>
<div class=3D"ContentPasted0">&gt;&gt; </div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567C6E41E13F733CF5F1BA29A2DABYAPR11MB2567namp_--
