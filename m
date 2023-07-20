Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26C75A31B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEF410E52F;
	Thu, 20 Jul 2023 00:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E928C10E52D;
 Thu, 20 Jul 2023 00:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689811644; x=1721347644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/xyh4XekcoaBLjIXufif9Lb7BdCF0RkhVoZN51+GAAE=;
 b=SJMzkbYMN2fCFwDYvSzzMHxAXFT0hPySa3iuE9jvht5cE15X+GFfizB6
 FZaUWam9epSXytreeg3bYUjZ+DCcNrFSDEx3nfSrOpcy3DIZihr9l2iRb
 jTWGY/6fkYN9v+zn7sZhO0ovv01OP7BgkygrWYKlPRcQZqVxJ0EE0Tt3Y
 jLYnWo3Jm8uoCGS0tzfdCWNFEvJjfD8AjDXoFe0TL/qZVPSdr/zjMdtw7
 76hODd0HfdXfFW8Pu0UlYWzqbocN8KrJIPDlRNpYjiBHvB0WjUsY/yAZ3
 H2YF1idYzAIt/p+ybQOAVT9zna7fGDVISFaJzciXvQE6xLsdvOghNrGJf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369250876"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="369250876"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 17:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="759362435"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="759362435"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 17:07:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 17:07:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 17:07:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 17:07:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 17:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aatlU0YNtXjez8vshkvd/GLPRUvs4ijnAL4JIh1kSuPN8e7NAJ3jDd6uh/IsMgwDnoWAGdusxOzonwZyg3YgTXKQsJURk6hPL7Jl3qmDsIgTDV0UJgXay6oH6KZZ9brVrp9bOYdYFfNkOwOAaknqgwcUdzTpIZxv9cICBr7o7N9f9SKZRtEDMwYnhRFk+VeEkvxVPOaBp6rlbH58Pk1zkuRKwAEv2LYi/gQB+YL+betpd8zkOS1uilWpAZML3VakaeI/66u6OSgjnno+OYaRSEmAn+mQvcrf7npzSz7DzdxMLITNMiQAXH9K8b9i2e/Q3f563eMlGKkJA4joHy//jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQj2K9QHg0tXH5V5GVXsnMJ+6IG5l6HLv7ywghKu9O0=;
 b=jgxGYzAoTNbRDRUFJHdffF9Yv3nML6lq4xP5iyYikHjvAVXlm8ADt1yOeJpBfQhhc1mbl4WC6VdeDnexgiGATrH/uq3YgjwHTnZuCIkGmhLvYm7Pf56gNZsjfKMQB8dRJ24KgbXnScYMRvcrbYav/PJPhcCo0TQzeFrDTnCT5QbosDyE+LXcEbLQnYFWw141a9c3/haZL1VgKOkedhp5TLEn9g8EbrQqHp7yyrvSAlWWHZyzGsrp7RyEs2rT5eE1JuTAQot/Q3QUvbgqvGuMO0/YU+/a4/rTrWGTvL6VxZ/bTsqi4GrYCKIR2pW2YLLppDLqh5vUoWTfVCdhofnorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 00:07:15 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b%4]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 00:07:15 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Thread-Topic: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Thread-Index: AQHZuj3S3fKOcuZYgEmEIa0jSNqDGq/BrRqAgAACt9A=
Date: Thu, 20 Jul 2023 00:07:15 +0000
Message-ID: <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CY8PR11MB7316:EE_
x-ms-office365-filtering-correlation-id: 8ff5d025-c3a4-4b64-a7eb-08db88b5468d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p5Mk7eRj7kaWDPDFdsm1lVOSZkrRYfW6nCPMP0hZ1SQ1YUJTVzHz8DbV8J2+Po1et9xi7eBNDRJtbNpnUk8AaGgrhA3ZkEHeoWN/1RchKdqWCVSjuBDOJrhSEzM2TmClbgr682odcb8n9r15s3b1fkMoi3GNamJaLJcChacAzc6sPlcV2R7BXm63iQ0FCFUzyuURI4bFF8aq4oWuooCJ2jTjsKg4uOnwRWnDVwLyXRCalLmhPr8FdP0fmMsT3ViOtaSi2bNwj+T+o3tKdlnYG7TxpgebAW5LvEuputFqvgfZUGbU7yeDle5P12ltr9L1A6x1qh+jezBFx+l61XudK/6AYKpzHMzVYhX1l+r1Iqw5GcqpaKGZRQZm0PnExYA6dLqw5jE3ETCQQEZea0EEYka3/RF8uNTI7vmO7eb0GvgqpDeDHDBx5rpww3Qc21dshD+rNwLk1VjxUoNQAQ021ZRy3KZQ1MBlp9TNM6TxSONp4yGWS0bpcm0ppUQ81rApUAZDbMePpDexVxypBntFOMOGxsnS61DVviReQIXX1hNVQcyDzPYyhYd2ZJvSs7xP6IpAUg2zbzxTgvjN1kT0cIgUwD5md5+n6c2aBVBTbpC/UwS69n06lJRxNl2ZNnUS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(66556008)(54906003)(478600001)(110136005)(71200400001)(7696005)(186003)(316002)(2906002)(6506007)(9686003)(66476007)(5660300002)(122000001)(38100700002)(66946007)(66446008)(8936002)(8676002)(4326008)(41300700001)(64756008)(76116006)(82960400001)(52536014)(83380400001)(38070700005)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?juNwGjnXVONDl7Z8zQ9L47PRtx8CkHCajUkPbBcbXYYVaNuXcGP1XOx7bmZc?=
 =?us-ascii?Q?SeXce0yMojqZ1oenCJnq2e/qnPpX4733h+TczYReC+qvKI8JycUiJLfbAztb?=
 =?us-ascii?Q?os996Wgu8oKfmRR8DmP7euEOY8XPnhAg3d9gJcZ+ntdHh3bDQGoihYdJhTpQ?=
 =?us-ascii?Q?pn03U5O7jFDuGDWfgN+eMWR8wWp01GNYxpXo1KYupLUUaJTIMzWxmRKFjhJ9?=
 =?us-ascii?Q?2viDj9dnXooKD3lJvOkAXXsYCUbH56ltV4Wdn/cAPznpidqIwah/AEGYNMyW?=
 =?us-ascii?Q?Elh+oibk1J+iFwQenK6KIpH/sIEAbWjcysL9NWG/cX+zbRuTP296Xo32EoH/?=
 =?us-ascii?Q?I0bN9K55iaJZN6+y2NTUkLVYucR0hEX1C6Q70ElLrNrz/x/SPBFvvUEOkZz0?=
 =?us-ascii?Q?HnbH7IQ2l/XPwbrK/SRIqAxAptIxgHve3dWjRSvmTBv4JCXTKcvDgmGDkYq7?=
 =?us-ascii?Q?rQHbh3Z6CNSGgCKUkWQrq6d+zVsgVY0waq1/D9KJAqLLEYPwWrx3v8BbR8gJ?=
 =?us-ascii?Q?FfH1Mj3frLfHkqgOuy6eQ6Ujhf+uWJPIctKLTgcUUyAKm6Z0Kq/c1Y+5mjKQ?=
 =?us-ascii?Q?d0707tr7feh1EWgZHz/SU4p7zse0FssSVeH1th3/QrRUKqoE5kAOj3v796Q7?=
 =?us-ascii?Q?Y5EM+WKK4trJev/To2v7kQ8XuEeU/ZouypJ3PNlucmc5nALzQtFvx4NVkkmm?=
 =?us-ascii?Q?tnulLL0PxXssreVc0ecPCSko3+ilfOfADOrsFWDjFfODGgd15kYEdg/l4sYf?=
 =?us-ascii?Q?g2YRFHxyaXoV+KRBgrVbvcfgP4RBRSYrTUEFdt+SWAhPhc28rNCPIqhyc55r?=
 =?us-ascii?Q?rFPpXpkCkR2TuL2KMxG2Pqw+VHckbKDNNFN2Z3whrMlfAX+s5JJ36+jjU0if?=
 =?us-ascii?Q?V81ktSKcjORYWqk65PVk1PAIoH/U7gBx2IxDsH5kFRv85vp/6gLUI/qDRCTJ?=
 =?us-ascii?Q?xSFRwiP36XuGtMNDV+rmaRKRj7VYPAgLsoBqSMLt4jK7oq7qrOJQEhIkELos?=
 =?us-ascii?Q?qa/rqO2DBxE1Nnazw8Zupjy0rlLTSZkswCQ/VmfHyM/1IiEwsLwofeH/1yRk?=
 =?us-ascii?Q?9K18khCOjUZ/aI0Ytmrjxq7BMl7eJeyru29s5FlNj9ukUF+NCEx+6er3g5QP?=
 =?us-ascii?Q?8Zsw6kzWZ27JgUFDLNLEjXdyvRg905JrlwTkf1nFNC8Z4s2z7g1U6W6wApmy?=
 =?us-ascii?Q?ClWOTNhnaHka+xvaJ36Sm46uGuurYGU5JP5lXseCmYD8VNoy137Eso1oSqpW?=
 =?us-ascii?Q?3VNG9sLDFtZEtzwGdhOXfJm3WEFzuQN7XU7fT57ZIeh7kzNM5uwawufsn7Uv?=
 =?us-ascii?Q?Y6w7K4GhXAECoyBb1bb8PXTUWyTWQBrFo+WA2nicyP2QCFm6KX12s8aKBTBh?=
 =?us-ascii?Q?NDrW3VyhuysKC0EI8W8L7Cdci3M6Vos9o+X+dyqSTKnuzLWz2BjNdkSQtLGE?=
 =?us-ascii?Q?7D7BVPSDCkcfsFsmrwIDTrPGpx23yVyhRCbhTL8BAv3Ksl7JEVfHgR/+vG3T?=
 =?us-ascii?Q?Qxrq2EEvLwnsbFPzBLtFN13aC1v5FOvkpQ5PNpAs9B/Qv61/Xln/9XQdLQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff5d025-c3a4-4b64-a7eb-08db88b5468d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:07:15.7062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6L16cBx6A1XiBVTXbHN5iejh2t43BSwWDzygeipHdGyoHm0E1z6eAAxjlUgbk+nkF1O2/MlVCgydNlEZ5XgWQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[snip]
>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct drm_i915_g=
em_object *obj)
>
> The code change here looks accurate, but while we're here, I have a side
> question about this function in general...it was originally introduced
> in commit 48004881f693 ("drm/i915: Mark CPU cache as dirty when used for
> rendering") which states that GPU rendering ends up in the CPU cache
> (and thus needs a clflush later to make sure it lands in memory).  That
> makes sense to me for LLC platforms, but is it really true for non-LLC
> snooping platforms (like MTL) as the commit states?

For non-LLC platforms objects can be set to 1-way coherent which means
GPU rendering ending up in CPU cache as well, so for non-LLC platform
the logic here should be checking 1-way coherent flag.

> My understanding
> was that snooping platforms just invalidated the CPU cache to prevent
> future CPU reads from seeing stale data but didn't actually stick any
> new data in there?  Am I off track or is the original logic of this
> function not quite right?
>
> Anyway, even if the logic of this function is wrong, it's a mistake that
> would only hurt performance

Yes, this logic will introduce performance impact because it's missing the
checking for obj->pat_set_by_user. For objects with pat_set_by_user=3D=3Dtr=
ue,
even if the object is snooping or 1-way coherent, we don't want to enforce
a clflush here since the coherency is supposed to be handled by user space.

> (flushing more often than we truly need to)
> rather than functionality, so not something we really need to dig into
> right now as part of this patch.
>
>>      if (IS_DGFX(i915))
>>              return false;
>>
>> -    /*
>> -     * For objects created by userspace through GEM_CREATE with pat_ind=
ex
>> -     * set by set_pat extension, i915_gem_object_has_cache_level() will
>> -     * always return true, because the coherency of such object is mana=
ged
>> -     * by userspace. Othereise the call here would fall back to checkin=
g
>> -     * whether the object is un-cached or write-through.
>> -     */
>> -    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> -             i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>> +    return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) !=3D=
 1 &&
>> +           i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) !=3D=
 1;
>>  }

[snip]
>> @@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_=
cache *cache,
>>      if (DBG_FORCE_RELOC =3D=3D FORCE_GTT_RELOC)
>>              return false;
>>
>> -    /*
>> -     * For objects created by userspace through GEM_CREATE with pat_ind=
ex
>> -     * set by set_pat extension, i915_gem_object_has_cache_level() alwa=
ys
>> -     * return true, otherwise the call would fall back to checking whet=
her
>> -     * the object is un-cached.
>> -     */
>>      return (cache->has_llc ||
>>              obj->cache_dirty ||
>> -            !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
>> +            i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) !=
=3D 1);
>
> Platforms with relocations and platforms with user-specified PAT have no
> overlap, right?  So a -1 return should be impossible here and this is
> one case where we could just treat the return value as a boolean, right?

My understanding is that the condition here means to say that, if GPU
access is uncached, don't use CPU reloc because the CPU cache might
contain stale data. This condition is sufficient for snooping platforms.
But from MTL onward, the condition show be whether the GPU access is
coherent with CPU. So, we should be checking 1-way coherent flag instead
of UC mode, because even if the GPU access is WB, it's still non-coherent,
thus CPU cache could be out-dated.

[snip]
>> @@ -208,12 +230,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>      if (!(obj->flags & I915_BO_ALLOC_USER))
>>              return false;
>>
>> -    /*
>> -     * Always flush cache for UMD objects at creation time.
>> -     */
>> -    if (obj->pat_set_by_user)
>> -            return true;
>> -

I'm still worried that the removal of these lines would cause the
MESA failure seen before. I know you are checking pat index below, but
that is only about GPU access. It doesn't tell you how CPU is going to
access the memory. If user space is setting an uncached PAT, then use
copy engine to zero out the memory, but on the CPU side the mapping is
cacheable, you could still seeing garbage data.

I agree the lines don't belong here because it doesn't have anything
to do with LLC, but they need to be moved to the right location instead
of being removed.

>>      /*
>>       * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make i=
t
>>       * possible for userspace to bypass the GTT caching bits set by the
>> @@ -226,7 +242,21 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>       * it, but since i915 takes the stance of always zeroing memory bef=
ore
>>       * handing it to userspace, we need to prevent this.
>>       */
>> -    return IS_JSL_EHL(i915);
>> +    if (IS_JSL_EHL(i915))
>> +            return true;
>> +
