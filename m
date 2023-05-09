Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F556FD7BA
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 09:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04C10E453;
	Wed, 10 May 2023 07:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F110E3A7;
 Tue,  9 May 2023 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683652338; x=1715188338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=8++tauix8NCYNfjj/u1aw4T8repZqd5Gdnv5EFyt9UI=;
 b=Tl7Z68W6TYNhbXny87982ZsqhL6Cydilm779XTGEo3Vv/o5plGDSgOlZ
 7iuQsFnjcl9ZGLnv9UgJCmq0MpamFI20rx62WymzehdufAiXc6pT39ycB
 DrfGyzdM/fQLlQbbeEHdEqg9RqgTs03pm/Yn7eAHvyQmJiefS/g+Yy20o
 cD/i47+DS247ILOLPlnBxoooargeAGdVomKZUaFrm56lj/F0iujIIRI3O
 /YsS8j2V7L2Fnjb9/Vn1Sfk0VpKqFt19uuzaIgdA19Nw06fyxvADG94ng
 hEolh6OXxOwnCdFeCbgt8Q2JiNYdqL7cgOZa13yfS80krfKiBNaVhHmUs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="339227400"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
 d="scan'208,217";a="339227400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 10:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729600956"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
 d="scan'208,217";a="729600956"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2023 10:12:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 10:12:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 10:12:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 10:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhaEVf6VBJtHpcXHo/DboKZlt+MTQ5Kihx0ZiFa96WYDQg4TVuhk9Px/SkRWI9Oc9moJGX5KNi2Y/0XqobRZPWjDT1LTMbX2wRwc7tKGJHvOk24J2YO69ZuoElUuSehtz45hOEol6NZkAqqCBE81p1pdoSdAy/gKiXRdAndqZzPXG0vC6HT51XWstOZ7VrCTE/9/Sd6GkAC6/+GINF1PLtkkX6CH4WQ4atL+HJd4rx7LVCH/1CgcZUq/S8RHOTgW5WNPhmvZSouHqX4lO/9BuDMHuenNeO8CAO2I2PbkwMJ0DpfB/D3hCp4pwfSr5SYxi8ekE6VBViAAhf3ovCyZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Mz83lWECSFVT89ges14ppMstqjAkRIFxy40uP53ToE=;
 b=DAm3Dx2Bompjly56ktmjRJhfh66oVmoGOrToyxoDvin57vsm8ZSjxS+104dUHxOQlN7pAVNJT1XccumcP/ZP9BB7hgzwMTvwQI/PiI1RNDv+ZJNAz45D7N1BwqeTEBSprWeyKK5/1A3iKWWtnEmrEektyGGOXZxs0pTO/2dwOUFmlHRSHnELS9h03yQbQLbh9ick8HuO3TtA3W4ihTUeZZQize4vvgoORKDBEjvLzbiK4sESyLg+evZ/HwvLGezOSCELgXlG101/oxzB4IDcK+IZHXYXv91tNuJ24cx9vu8K9ebXAJf/boyn7eGCKjqQNeYAUJXnvZ2wCD68dX1Vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 17:12:07 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::5d35:326a:e933:9113]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::5d35:326a:e933:9113%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 17:12:07 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v7 2/2] drm/i915: use pat_index instead of
 cache_level
Thread-Topic: [Intel-gfx] [PATCH v7 2/2] drm/i915: use pat_index instead of
 cache_level
Thread-Index: AQHZggeM3BkOo0kMzEGO1nz6ppY/I69R27YAgABPjkQ=
Date: Tue, 9 May 2023 17:12:06 +0000
Message-ID: <SN6PR11MB25746DE12E35850DF6772BA29A769@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230508234854.4028658-1-fei.yang@intel.com>
 <20230508234854.4028658-3-fei.yang@intel.com>
 <1eba1d94-427e-c8fe-9d58-69b52d1545e4@linux.intel.com>
In-Reply-To: <1eba1d94-427e-c8fe-9d58-69b52d1545e4@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|SA1PR11MB6760:EE_
x-ms-office365-filtering-correlation-id: edd2ae4d-3bcd-41af-5d28-08db50b0846b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jkknpix6ooa/jSHUlvGxoRXVFapAE0+BmmCHhwZlyiAKRR7exKFbtU39cGkRP+ifRs6yCmtOkb5BKq6ECLYScdTuDFvMUD0SFzqYth3QdkG4WgCw5M80NmOQrg97d8GYJbshec4obSKw7CTpmc6eP7MrkigAL6A4xbu0iE7hj7CjVMJ4nZqH/hE3kfJAyDKYbHwv9UDm+o93Ab4dcbZU4fF5tJrLpPBG9A0pWpjeihvzgif69AM7aoc7EF/WhkcI6xW6eastQ+u1XVA6jpu4fNcK01V4cYZSfY/1E65c9kde3e9diyojNJHYLF0qN9BD42dNLJX2D7RskgrGxEZwjvrU8GHXsbSwRXNRexDEcllHmyfcAkPPZTbRTVzTfN8BOXWskXnujF7qz69zocG+nlihtAzzks+/8jMQ6x+HxwYSE09fn9+Z1sta8x8zCgBnTlAQblzuKe7tMIMkPe7e14xreFuGmpJclkbfzMnICA+N53Yr+Z8+FfUW8bzMN3f4R0NHfjsxCgHvYtm1sC2SoPsH50zdghuGrnVoe+bQbjspgp8rOQOZS7TvWyzp4V9ADYThe5DYR2/+qAwo49NWbm1q/AARoMmhHyrpHSLoQI8p3wLy6zV1DocKBAmrqp03
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(19627405001)(66899021)(64756008)(4326008)(316002)(478600001)(76116006)(66946007)(7696005)(66556008)(91956017)(54906003)(110136005)(66446008)(66476007)(33656002)(86362001)(83380400001)(26005)(53546011)(6506007)(9686003)(2906002)(71200400001)(5660300002)(41300700001)(52536014)(30864003)(8936002)(8676002)(55016003)(82960400001)(186003)(38100700002)(122000001)(38070700005)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?T1kEDY3MR7MQgdRACFSyhLV4LJA6EwRbUC6lgCR+eWVcm5+REFg8fy8hsj?=
 =?iso-8859-1?Q?PyOZ0VUD+cumbblDjkI4T8OZfMMnIq3Sa7bSW8J+RrlOmou8oyTP+AxJ6p?=
 =?iso-8859-1?Q?Nyv38kVrLXZlkv81rDUsed/AyZgu8bCENfCXKkoVXWQYQAk8gwSLJa0JjX?=
 =?iso-8859-1?Q?4kU3sBNHuYqllvX4dLmAN2uV/069xwQhcjOGCvGq8B+3A5DU906jsRnNnS?=
 =?iso-8859-1?Q?JtChtQZ+p70g5gEMwNG8WrT9+ACVqk842NsraIaEVY/XbKJSvKhsNjo8lY?=
 =?iso-8859-1?Q?88Hkfs2586FlR/i5LJXRc+1VNqUNdNSGJ/CCKfIdJQbRTIuSKzjlY0NmFO?=
 =?iso-8859-1?Q?trZgpPYT7nnej+4fqBEplmBUzhw//DNd7Fjrvx8ulB9J29WMO+FH4PI2lA?=
 =?iso-8859-1?Q?ikSnXBPkfUXLln0A+z5A7Ux03otLlnxzIkGmSxd3XCDStpXnecUegcalIi?=
 =?iso-8859-1?Q?IT28UseuR43mLuKZVMzExJq+p1axVequBZ508Aaad/Ik0RB/vo/Hh9safs?=
 =?iso-8859-1?Q?b5Lw4JL+l9n9Io8DjhAlRuX8f8y1/+U897IKeQhLT42vv8iSgMHIqN0CIF?=
 =?iso-8859-1?Q?49XAUryzjozToEhX7O5Xjv/VBKsJrWZG0SxyidjNksyTF9nGBgZ6bTFMiJ?=
 =?iso-8859-1?Q?Vzq9sq1II6UMRJl7UyWJaWUztzh2auZx4gl+V7YMRmCHpoD9fKL3n1+O+z?=
 =?iso-8859-1?Q?Znh9zL2x6xdqC0PAY3OkDQ3WEgKFncNAd2u1E0xapwN5pa0sC0xOQnOi6D?=
 =?iso-8859-1?Q?E6aNwZzZRruzDw7NdGrI592E5Ihz+yej8g8hR65SRbGPzF/112ASYnqjwC?=
 =?iso-8859-1?Q?IBFz6j92Jxc+xjtzAtHO+/bogRlUgyWsCVz2fF9OW2QdV/oSJCJsSuVh7/?=
 =?iso-8859-1?Q?POvsUOERBSckDJFiMfXH3NdToAk6mD5uTuwdZhR4EKR3nllulYswEMtFhQ?=
 =?iso-8859-1?Q?CXrRdjtFSPgOidMwpu7ezSum51hBe8ZSSPbOO0pdzf9ztpRX36Bg6CgQYM?=
 =?iso-8859-1?Q?qqYmbZwNJS80Kk5jZqg3Tc+KFjUzWw+lBg6jQQAGM2Ivn2Z3ZHoUV8bqM9?=
 =?iso-8859-1?Q?6D8wkr81gTBL1iK+QJJTxV6cA7wqVrqSBg3If3Y0Mmv+C6KeDdNxP/XWAJ?=
 =?iso-8859-1?Q?5QCFDQbMH1UXclgkt4JF46FMiFSjRBbNvSYB2rzQQLqjeexfEOZIqc8VD8?=
 =?iso-8859-1?Q?bOkzCrhdpJsH7AEyuY1gcgGutP7jCPnTlJzzMN8VCm6fgj02SHz9fGkF1i?=
 =?iso-8859-1?Q?IyZWcpdBV/NR3RNfe2CkaLxHyQYT4QLo0mWqoCjpg9Y+GaZHqAoHpXxpfW?=
 =?iso-8859-1?Q?qQHs856tW/TE9bxPekrqkfqpBsUFTAm9AAe5F5e2ExJr2dmKdhe7NgHYTF?=
 =?iso-8859-1?Q?oJWgEvNX1UMMlTiWGXWSbGIdxgKMU8/YRXEvFyWBdal1Fmn3u7B2Wu93GH?=
 =?iso-8859-1?Q?JhJ2loIwSUNXqlLQI1+JMtSz+Kq5TQGlip7Pzka9oFdYUg66JH6UTJYjyO?=
 =?iso-8859-1?Q?yVczHizCfW+jmAZVTkAqCWzB4lVWAtSIEbuuYnS+ceGvQV+2Y47GZUKfVu?=
 =?iso-8859-1?Q?EUdXM+nCgRcxjr2U4TtXsRROxCcsZpLxugLoCuf7mxjWAaecsYSNgLbUz3?=
 =?iso-8859-1?Q?ooUJPrs3et0Ik=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB25746DE12E35850DF6772BA29A769SN6PR11MB2574namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd2ae4d-3bcd-41af-5d28-08db50b0846b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 17:12:06.9075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoEWWP3zmvJiFYsKItfW6/fVuK81VmkpeEd19IPdblAchOu1ocrKHUDD+5Aft/IC47kouqsVzjj3QehFTetasQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 10 May 2023 07:02:02 +0000
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_SN6PR11MB25746DE12E35850DF6772BA29A769SN6PR11MB2574namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 09/05/2023 00:48, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Currently the KMD is using enum i915_cache_level to set caching policy f=
or
>> buffer objects. This is flaky because the PAT index which really control=
s
>> the caching behavior in PTE has far more levels than what's defined in t=
he
>> enum. In addition, the PAT index is platform dependent, having to transl=
ate
>> between i915_cache_level and PAT index is not reliable, and makes the co=
de
>> more complicated.
>>
>> From UMD's perspective there is also a necessity to set caching policy f=
or
>> performance fine tuning. It's much easier for the UMD to directly use PA=
T
>> index because the behavior of each PAT index is clearly defined in Bspec=
.
>> Having the abstracted i915_cache_level sitting in between would only cau=
se
>> more ambiguity. PAT is expected to work much like MOCS already works tod=
ay,
>> and by design userspace is expected to select the index that exactly
>> matches the desired behavior described in the hardware specification.
>>
>> For these reasons this patch replaces i915_cache_level with PAT index. A=
lso
>> note, the cache_level is not completely removed yet, because the KMD sti=
ll
>> has the need of creating buffer objects with simple cache settings such =
as
>> cached, uncached, or writethrough. For kernel objects, cache_level is us=
ed
>> for simplicity and backward compatibility. For Pre-gen12 platforms PAT c=
an
>> have 1:1 mapping to i915_cache_level, so these two are interchangeable. =
see
>> the use of LEGACY_CACHELEVEL.
>>
>> One consequence of this change is that gen8_pte_encode is no longer work=
ing
>> for gen12 platforms due to the fact that gen12 platforms has different P=
AT
>> definitions. In the meantime the mtl_pte_encode introduced specfically f=
or
>> MTL becomes generic for all gen12 platforms. This patch renames the MTL
>> PTE encode function into gen12_pte_encode and apply it to all gen12. Eve=
n
>> though this change looks unrelated, but separating them would temporaril=
y
>> break gen12 PTE encoding, thus squash them in one patch.
>>
>> Special note: this patch changes the way caching behavior is controlled =
in
>> the sense that some objects are left to be managed by userspace. For suc=
h
>> objects we need to be careful not to change the userspace settings.There
>> are kerneldoc and comments added around obj->cache_coherent, cache_dirty=
,
>> and how to bypass the checkings by i915_gem_object_has_cache_level. For
>> full understanding, these changes need to be looked at together with the
>> two follow-up patches, one disables the {set|get}_caching ioctl's and th=
e
>> other adds set_pat extension to the GEM_CREATE uAPI.
>>
>> Bspec: 63019
>>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>
>> To be squashed
>> ---
>>   drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
>>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 58 +++++++++----
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++-
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 11 ++-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 51 ++++++++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 44 +++++++++-
>>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  8 +-
>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 84 +++++++++----------
>>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 82 +++++++++---------
>>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++--
>>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
>>   drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  4 +-
>>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 ++++++-----
>>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
>>   drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
>>   drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
>>   drivers/gpu/drm/i915/i915_debugfs.c           | 53 +++++++++---
>>   drivers/gpu/drm/i915/i915_gem.c               | 27 +++++-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
>>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
>>   drivers/gpu/drm/i915/i915_vma.h               |  2 +-
>>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
>>   drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
>>   .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
>>   .../drm/i915/selftests/intel_memory_region.c  |  4 +-
>>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
>>   36 files changed, 451 insertions(+), 238 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/=
i915/display/intel_dpt.c
>> index c5eacfdba1a5..7c5fddb203ba 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>> @@ -43,24 +43,24 @@ static void gen8_set_pte(void __iomem *addr, gen8_pt=
e_t pte)
>>   static void dpt_insert_page(struct i915_address_space *vm,
>>                            dma_addr_t addr,
>>                            u64 offset,
>> -                         enum i915_cache_level level,
>> +                         unsigned int pat_index,
>>                            u32 flags)
>>   {
>>        struct i915_dpt *dpt =3D i915_vm_to_dpt(vm);
>>        gen8_pte_t __iomem *base =3D dpt->iomem;
>>
>>        gen8_set_pte(base + offset / I915_GTT_PAGE_SIZE,
>> -                  vm->pte_encode(addr, level, flags));
>> +                  vm->pte_encode(addr, pat_index, flags));
>>   }
>>
>>   static void dpt_insert_entries(struct i915_address_space *vm,
>>                               struct i915_vma_resource *vma_res,
>> -                            enum i915_cache_level level,
>> +                            unsigned int pat_index,
>>                               u32 flags)
>>   {
>>        struct i915_dpt *dpt =3D i915_vm_to_dpt(vm);
>>        gen8_pte_t __iomem *base =3D dpt->iomem;
>> -     const gen8_pte_t pte_encode =3D vm->pte_encode(0, level, flags);
>> +     const gen8_pte_t pte_encode =3D vm->pte_encode(0, pat_index, flags=
);
>>        struct sgt_iter sgt_iter;
>>        dma_addr_t addr;
>>        int i;
>> @@ -83,7 +83,7 @@ static void dpt_clear_range(struct i915_address_space =
*vm,
>>   static void dpt_bind_vma(struct i915_address_space *vm,
>>                         struct i915_vm_pt_stash *stash,
>>                         struct i915_vma_resource *vma_res,
>> -                      enum i915_cache_level cache_level,
>> +                      unsigned int pat_index,
>>                         u32 flags)
>>   {
>>        u32 pte_flags;
>> @@ -98,7 +98,7 @@ static void dpt_bind_vma(struct i915_address_space *vm=
,
>>        if (vma_res->bi.lmem)
>>                pte_flags |=3D PTE_LM;
>>
>> -     vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +     vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>
>>        vma_res->page_sizes_gtt =3D I915_GTT_PAGE_SIZE;
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_domain.c
>> index d2d5a24301b2..05107a6efe45 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>> @@ -27,8 +27,15 @@ static bool gpu_write_needs_clflush(struct drm_i915_g=
em_object *obj)
>>        if (IS_DGFX(i915))
>>                return false;
>>
>> -     return !(obj->cache_level =3D=3D I915_CACHE_NONE ||
>> -              obj->cache_level =3D=3D I915_CACHE_WT);
>> +     /*
>> +      * For objects created by userspace through GEM_CREATE with pat_in=
dex
>> +      * set by set_pat extension, i915_gem_object_has_cache_level() wil=
l
>> +      * always return true, because the coherency of such object is man=
aged
>> +      * by userspace. Othereise the call here would fall back to checki=
ng
>> +      * whether the object is un-cached or write-through.
>> +      */
>> +     return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> +              i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>>   }
>>
>>   bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>> @@ -267,7 +274,13 @@ int i915_gem_object_set_cache_level(struct drm_i915=
_gem_object *obj,
>>   {
>>        int ret;
>>
>> -     if (obj->cache_level =3D=3D cache_level)
>> +     /*
>> +      * For objects created by userspace through GEM_CREATE with pat_in=
dex
>> +      * set by set_pat extension, simply return 0 here without touching
>> +      * the cache setting, because such objects should have an immutabl=
e
>> +      * cache setting by desgin and always managed by userspace.
>> +      */
>> +     if (i915_gem_object_has_cache_level(obj, cache_level))
>>                return 0;
>>
>>        ret =3D i915_gem_object_wait(obj,
>> @@ -278,10 +291,8 @@ int i915_gem_object_set_cache_level(struct drm_i915=
_gem_object *obj,
>>                return ret;
>>
>>        /* Always invalidate stale cachelines */
>> -     if (obj->cache_level !=3D cache_level) {
>> -             i915_gem_object_set_cache_coherency(obj, cache_level);
>> -             obj->cache_dirty =3D true;
>> -     }
>> +     i915_gem_object_set_cache_coherency(obj, cache_level);
>> +     obj->cache_dirty =3D true;
>>
>>        /* The cache-level will be applied when each vma is rebound. */
>>        return i915_gem_object_unbind(obj,
>> @@ -306,20 +317,22 @@ int i915_gem_get_caching_ioctl(struct drm_device *=
dev, void *data,
>>                goto out;
>>        }
>>
>> -     switch (obj->cache_level) {
>> -     case I915_CACHE_LLC:
>> -     case I915_CACHE_L3_LLC:
>> -             args->caching =3D I915_CACHING_CACHED;
>> -             break;
>> +     /*
>> +      * This ioctl should be disabled for the objects with pat_index
>> +      * set by user space.
>> +      */
>> +     if (obj->pat_set_by_user) {
>> +             err =3D -EOPNOTSUPP;
>> +             goto out;
>> +     }
>>
>> -     case I915_CACHE_WT:
>> +     if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
>> +         i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>> +             args->caching =3D I915_CACHING_CACHED;
>> +     else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>>                args->caching =3D I915_CACHING_DISPLAY;
>> -             break;
>> -
>> -     default:
>> +     else
>>                args->caching =3D I915_CACHING_NONE;
>> -             break;
>> -     }
>>   out:
>>        rcu_read_unlock();
>>        return err;
>> @@ -364,6 +377,15 @@ int i915_gem_set_caching_ioctl(struct drm_device *d=
ev, void *data,
>>        if (!obj)
>>                return -ENOENT;
>>
>> +     /*
>> +      * This ioctl should be disabled for the objects with pat_index
>> +      * set by user space.
>> +      */
>> +     if (obj->pat_set_by_user) {
>> +             ret =3D -EOPNOTSUPP;
>> +             goto out;
>> +     }
>> +
>>        /*
>>         * The caching mode of proxy object is handled by its generator, =
and
>>         * not allowed to be changed by userspace.
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gp=
u/drm/i915/gem/i915_gem_execbuffer.c
>> index 3aeede6aee4d..5fb459ea4294 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -640,9 +640,15 @@ static inline int use_cpu_reloc(const struct reloc_=
cache *cache,
>>        if (DBG_FORCE_RELOC =3D=3D FORCE_GTT_RELOC)
>>                return false;
>>
>> +     /*
>> +      * For objects created by userspace through GEM_CREATE with pat_in=
dex
>> +      * set by set_pat extension, i915_gem_object_has_cache_level() alw=
ays
>> +      * return true, otherwise the call would fall back to checking whe=
ther
>> +      * the object is un-cached.
>> +      */
>>        return (cache->has_llc ||
>>                obj->cache_dirty ||
>> -             obj->cache_level !=3D I915_CACHE_NONE);
>> +             !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
>>   }
>>
>>   static int eb_reserve_vma(struct i915_execbuffer *eb,
>> @@ -1324,7 +1330,10 @@ static void *reloc_iomap(struct i915_vma *batch,
>>        if (drm_mm_node_allocated(&cache->node)) {
>>                ggtt->vm.insert_page(&ggtt->vm,
>>                                     i915_gem_object_get_dma_address(obj,=
 page),
>> -                                  offset, I915_CACHE_NONE, 0);
>> +                                  offset,
>> +                                  i915_gem_get_pat_index(ggtt->vm.i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>        } else {
>>                offset +=3D page << PAGE_SHIFT;
>>        }
>> @@ -1464,7 +1473,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>>                        reloc_cache_unmap(&eb->reloc_cache);
>>                        mutex_lock(&vma->vm->mutex);
>>                        err =3D i915_vma_bind(target->vma,
>> -                                         target->vma->obj->cache_level,
>> +                                         target->vma->obj->pat_index,
>>                                            PIN_GLOBAL, NULL, NULL);
>>                        mutex_unlock(&vma->vm->mutex);
>>                        reloc_cache_remap(&eb->reloc_cache, ev->vma->obj)=
;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/=
i915/gem/i915_gem_mman.c
>> index 3dbacdf0911a..4e7a838ab7bd 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -383,7 +383,16 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf=
)
>>        }
>>
>>        /* Access to snoopable pages through the GTT is incoherent. */
>> -     if (obj->cache_level !=3D I915_CACHE_NONE && !HAS_LLC(i915)) {
>> +     /*
>> +      * For objects created by userspace through GEM_CREATE with pat_in=
dex
>> +      * set by set_pat extension, coherency is managed by userspace, ma=
ke
>> +      * sure we don't fail handling the vm fault by calling
>> +      * i915_gem_object_has_cache_level() which always return true for =
such
>> +      * objects. Otherwise this helper function would fall back to chec=
king
>> +      * whether the object is un-cached.
>> +      */
>> +     if (!(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>> +           HAS_LLC(i915))) {
>>                ret =3D -EFAULT;
>>                goto err_unpin;
>>        }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_object.c
>> index 8c70a0ec7d2f..46a19b099ec8 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -54,6 +54,24 @@ unsigned int i915_gem_get_pat_index(struct drm_i915_p=
rivate *i915,
>>        return INTEL_INFO(i915)->cachelevel_to_pat[level];
>>   }
>>
>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *=
obj,
>> +                                  enum i915_cache_level lvl)
>> +{
>> +     /*
>> +      * In case the pat_index is set by user space, this kernel mode
>> +      * driver should leave the coherency to be managed by user space,
>> +      * simply return true here.
>> +      */
>> +     if (obj->pat_set_by_user)
>> +             return true;
>> +
>> +     /*
>> +      * Otherwise the pat_index should have been converted from cache_l=
evel
>> +      * so that the following comparison is valid.
>> +      */
>> +     return obj->pat_index =3D=3D i915_gem_get_pat_index(obj_to_i915(ob=
j), lvl);
>> +}
>> +
>>   struct drm_i915_gem_object *i915_gem_object_alloc(void)
>>   {
>>        struct drm_i915_gem_object *obj;
>> @@ -133,7 +151,7 @@ void i915_gem_object_set_cache_coherency(struct drm_=
i915_gem_object *obj,
>>   {
>>        struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>>
>> -     obj->cache_level =3D cache_level;
>> +     obj->pat_index =3D i915_gem_get_pat_index(i915, cache_level);
>>
>>        if (cache_level !=3D I915_CACHE_NONE)
>>                obj->cache_coherent =3D (I915_BO_CACHE_COHERENT_FOR_READ =
|
>> @@ -148,6 +166,37 @@ void i915_gem_object_set_cache_coherency(struct drm=
_i915_gem_object *obj,
>>                !IS_DGFX(i915);
>>   }
>>
>> +/**
>> + * i915_gem_object_set_pat_index - set PAT index to be used in PTE enco=
de
>> + * @obj: #drm_i915_gem_object
>> + * @pat_index: PAT index
>> + *
>> + * This is a clone of i915_gem_object_set_cache_coherency taking pat in=
dex
>> + * instead of cache_level as its second argument.
>> + */
>> +void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
>> +                                unsigned int pat_index)
>> +{
>> +     struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>> +
>> +     if (obj->pat_index =3D=3D pat_index)
>> +             return;
>> +
>> +     obj->pat_index =3D pat_index;
>> +
>> +     if (pat_index !=3D i915_gem_get_pat_index(i915, I915_CACHE_NONE))
>> +             obj->cache_coherent =3D (I915_BO_CACHE_COHERENT_FOR_READ |
>> +                                    I915_BO_CACHE_COHERENT_FOR_WRITE);
>> +     else if (HAS_LLC(i915))
>> +             obj->cache_coherent =3D I915_BO_CACHE_COHERENT_FOR_READ;
>> +     else
>> +             obj->cache_coherent =3D 0;
>> +
>> +     obj->cache_dirty =3D
>> +             !(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE) =
&&
>> +             !IS_DGFX(i915);
>> +}
>> +
>>   bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>>   {
>>        struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/dr=
m/i915/gem/i915_gem_object.h
>> index 284e1aa396cd..884a17275b3a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -34,6 +34,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>>
>>   unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
>>                                    enum i915_cache_level level);
>> +bool i915_gem_object_has_cache_level(const struct drm_i915_gem_object *=
obj,
>> +                                  enum i915_cache_level lvl);
>>   void i915_gem_init__objects(struct drm_i915_private *i915);
>>
>>   void i915_objects_module_exit(void);
>> @@ -764,6 +766,8 @@ bool i915_gem_object_has_unknown_state(struct drm_i9=
15_gem_object *obj);
>>
>>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *o=
bj,
>>                                         unsigned int cache_level);
>> +void i915_gem_object_set_pat_index(struct drm_i915_gem_object *obj,
>> +                                unsigned int pat_index);
>>   bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
>>   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj)=
;
>>   void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_objec=
t *obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/=
gpu/drm/i915/gem/i915_gem_object_types.h
>> index bf0bd8e11355..adf4c2b28135 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -364,15 +364,42 @@ struct drm_i915_gem_object {
>>   #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pag=
es */
>>   #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory =
*/
>>        /**
>> -      * @cache_level: The desired GTT caching level.
>> +      * @pat_index: The desired PAT index.
>> +      *
>> +      * See hardware specification for valid PAT indices for each platf=
orm.
>> +      * This field used to contain a value of enum i915_cache_level. It=
's
>> +      * changed to an unsigned int because PAT indices are being used b=
y
>> +      * both UMD and KMD for caching policy control after GEN12.
>> +      * For backward compatibility, this field will continue to contain
>> +      * value of i915_cache_level for pre-GEN12 platforms so that the P=
TE
>> +      * encode functions for these legacy platforms can stay the same.
>> +      * In the meantime platform specific tables are created to transla=
te
>> +      * i915_cache_level into pat index, for more details check the mac=
ros
>> +      * defined i915/i915_pci.c, e.g. PVC_CACHELEVEL.
>> +      */
>
> Dunno - this still reads a bit wonky to me. It was unsigned int already
> and also it does not hold i915_cache_level on legacy platforms, right?

v8 sent with some clarification.

>> +     unsigned int pat_index:6;
>> +     /**
>> +      * @pat_set_by_user: Indicate whether pat_index is set by user spa=
ce
>>         *
>> -      * See enum i915_cache_level for possible values, along with what
>> -      * each does.
>> +      * This field is set to false by default, only set to true if the
>> +      * pat_index is set by user space. By design, user space is capabl=
e of
>> +      * managing caching behavior by setting pat_index, in which case t=
his
>> +      * kernel mode driver should never touch the pat_index.
>>         */
>> -     unsigned int cache_level:3;
>> +     unsigned int pat_set_by_user;
>
> Unsigned int:1 to fit into the bitfield sandwitch better?

okay

>>        /**
>>         * @cache_coherent:
>>         *
>> +      * Note: with the change above which replaced cache_level with
>> +      * pat_index, the use of cache_coherent is limited to objects crea=
ted
>> +      * by kernel. Check for @pat_set_by_user to find out if an object =
is
>> +      * created by userspace or kernel. A later patch will disable the
>
>pat_set_by_user is not about who created the object, no? And it is not
>in a later patch any longer.
>
>> +      * ioctl's to change cache settings for objects with pat_index set=
 by
>> +      * userspace. Please don't assume @cache_coherent having the flags=
 set
>> +      * as describe here for these objects. Also see the helper functio=
n
>> +      * i915_gem_object_has_cache_level() for possible ways to bypass t=
he
>> +      * use of this field.
>> +      *
>>         * Track whether the pages are coherent with the GPU if reading o=
r
>>         * writing through the CPU caches. The largely depends on the
>>         * @cache_level setting.
>> @@ -446,6 +473,15 @@ struct drm_i915_gem_object {
>>        /**
>>         * @cache_dirty:
>>         *
>> +      * Note: with the change above which replaced cache_level with
>> +      * pat_index, the use of cache_dirty is limited to objects created
>> +      * by kernel. Check for @pat_set_by_user to find out if an object =
is
>> +      * created by userspace or kernel. A later patch will disable the
>> +      * ioctl's to change cache settings for objects with pat_index set=
 by
>> +      * userspace. Please don't assume @cache_dirty is set as describe =
here
>> +      * for these objects. Also see i915_gem_object_has_cache_level() f=
or
>> +      * possible ways to bypass the use of this field.
>> +      *
>>         * Track if we are we dirty with writes through the CPU cache for=
 this
>>         * object. As a result reading directly from main memory might yi=
eld
>>         * stale data.
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_stolen.c
>> index ee492d823f1b..3b094d36a0b0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -565,7 +565,9 @@ static void dbg_poison(struct i915_ggtt *ggtt,
>>
>>                ggtt->vm.insert_page(&ggtt->vm, addr,
>>                                     ggtt->error_capture.start,
>> -                                  I915_CACHE_NONE, 0);
>> +                                  i915_gem_get_pat_index(ggtt->vm.i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>                mb();
>>
>>                s =3D io_mapping_map_wc(&ggtt->iomap,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/=
drm/i915/gem/i915_gem_ttm_move.c
>> index 69eb20ed4d47..7078af2f8f79 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -214,7 +214,8 @@ static struct dma_fence *i915_ttm_accel_move(struct =
ttm_buffer_object *bo,
>>
>>                intel_engine_pm_get(to_gt(i915)->migrate.context->engine)=
;
>>                ret =3D intel_context_migrate_clear(to_gt(i915)->migrate.=
context, deps,
>> -                                               dst_st->sgl, dst_level,
>> +                                               dst_st->sgl,
>> +                                               i915_gem_get_pat_index(i=
915, dst_level),
>>                                                  i915_ttm_gtt_binds_lmem=
(dst_mem),
>>                                                  0, &rq);
>>        } else {
>> @@ -228,9 +229,10 @@ static struct dma_fence *i915_ttm_accel_move(struct=
 ttm_buffer_object *bo,
>>                intel_engine_pm_get(to_gt(i915)->migrate.context->engine)=
;
>>                ret =3D intel_context_migrate_copy(to_gt(i915)->migrate.c=
ontext,
>>                                                 deps, src_rsgt->table.sg=
l,
>> -                                              src_level,
>> +                                              i915_gem_get_pat_index(i9=
15, src_level),
>>                                                 i915_ttm_gtt_binds_lmem(=
bo->resource),
>> -                                              dst_st->sgl, dst_level,
>> +                                              dst_st->sgl,
>> +                                              i915_gem_get_pat_index(i9=
15, dst_level),
>>                                                 i915_ttm_gtt_binds_lmem(=
dst_mem),
>>                                                 &rq);
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/g=
pu/drm/i915/gem/selftests/huge_pages.c
>> index d1057574e966..df6c9a84252c 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -354,7 +354,7 @@ fake_huge_pages_object(struct drm_i915_private *i915=
, u64 size, bool single)
>>
>>        obj->write_domain =3D I915_GEM_DOMAIN_CPU;
>>        obj->read_domains =3D I915_GEM_DOMAIN_CPU;
>> -     obj->cache_level =3D I915_CACHE_NONE;
>> +     obj->pat_index =3D i915_gem_get_pat_index(i915, I915_CACHE_NONE);
>>
>>        return obj;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/dri=
vers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> index fe6c37fd7859..a93a90b15907 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> @@ -219,7 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt =
*gt,
>>                        continue;
>>
>>                err =3D intel_migrate_clear(&gt->migrate, &ww, deps,
>> -                                       obj->mm.pages->sgl, obj->cache_l=
evel,
>> +                                       obj->mm.pages->sgl, obj->pat_ind=
ex,
>>                                          i915_gem_object_is_lmem(obj),
>>                                          0xdeadbeaf, &rq);
>>                if (rq) {
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/driver=
s/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 56279908ed30..a93d8f9f8bc1 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -1222,7 +1222,7 @@ static int __igt_mmap_migrate(struct intel_memory_=
region **placements,
>>        }
>>
>>        err =3D intel_context_migrate_clear(to_gt(i915)->migrate.context,=
 NULL,
>> -                                       obj->mm.pages->sgl, obj->cache_l=
evel,
>> +                                       obj->mm.pages->sgl, obj->pat_ind=
ex,
>>                                          i915_gem_object_is_lmem(obj),
>>                                          expand32(POISON_INUSE), &rq);
>>        i915_gem_object_unpin_pages(obj);
>> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915=
/gt/gen6_ppgtt.c
>> index 5aaacc53fa4c..c2bdc133c89a 100644
>> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> @@ -109,7 +109,7 @@ static void gen6_ppgtt_clear_range(struct i915_addre=
ss_space *vm,
>>
>>   static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
>>                                      struct i915_vma_resource *vma_res,
>> -                                   enum i915_cache_level cache_level,
>> +                                   unsigned int pat_index,
>>                                      u32 flags)
>>   {
>>        struct i915_ppgtt *ppgtt =3D i915_vm_to_ppgtt(vm);
>> @@ -117,7 +117,7 @@ static void gen6_ppgtt_insert_entries(struct i915_ad=
dress_space *vm,
>>        unsigned int first_entry =3D vma_res->start / I915_GTT_PAGE_SIZE;
>>        unsigned int act_pt =3D first_entry / GEN6_PTES;
>>        unsigned int act_pte =3D first_entry % GEN6_PTES;
>> -     const u32 pte_encode =3D vm->pte_encode(0, cache_level, flags);
>> +     const u32 pte_encode =3D vm->pte_encode(0, pat_index, flags);
>>        struct sgt_dma iter =3D sgt_dma(vma_res);
>>        gen6_pte_t *vaddr;
>>
>> @@ -227,7 +227,9 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt=
 *ppgtt)
>>
>>        vm->scratch[0]->encode =3D
>>                vm->pte_encode(px_dma(vm->scratch[0]),
>> -                            I915_CACHE_NONE, PTE_READ_ONLY);
>> +                            i915_gem_get_pat_index(vm->i915,
>> +                                                   I915_CACHE_NONE),
>> +                            PTE_READ_ONLY);
>>
>>        vm->scratch[1] =3D vm->alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);
>>        if (IS_ERR(vm->scratch[1])) {
>> @@ -278,7 +280,7 @@ static void gen6_ppgtt_cleanup(struct i915_address_s=
pace *vm)
>>   static void pd_vma_bind(struct i915_address_space *vm,
>>                        struct i915_vm_pt_stash *stash,
>>                        struct i915_vma_resource *vma_res,
>> -                     enum i915_cache_level cache_level,
>> +                     unsigned int pat_index,
>>                        u32 unused)
>>   {
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.c
>> index bb6998d67133..f948d33e5ec5 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -29,7 +29,7 @@ static u64 gen8_pde_encode(const dma_addr_t addr,
>>   }
>>
>>   static u64 gen8_pte_encode(dma_addr_t addr,
>> -                        enum i915_cache_level level,
>> +                        unsigned int pat_index,
>>                           u32 flags)
>>   {
>>        gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> @@ -40,7 +40,12 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>        if (flags & PTE_LM)
>>                pte |=3D GEN12_PPGTT_PTE_LM;
>>
>> -     switch (level) {
>> +     /*
>> +      * For pre-gen12 platforms pat_index is the same as enum
>> +      * i915_cache_level, so the switch-case here is still valid.
>> +      * See translation table defined by LEGACY_CACHELEVEL.
>> +      */
>> +     switch (pat_index) {
>>        case I915_CACHE_NONE:
>>                pte |=3D PPAT_UNCACHED;
>>                break;
>> @@ -55,9 +60,9 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>        return pte;
>>   }
>>
>> -static u64 mtl_pte_encode(dma_addr_t addr,
>> -                       enum i915_cache_level level,
>> -                       u32 flags)
>> +static u64 gen12_pte_encode(dma_addr_t addr,
>> +                         unsigned int pat_index,
>> +                         u32 flags)
>>   {
>>        gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>>
>> @@ -67,24 +72,17 @@ static u64 mtl_pte_encode(dma_addr_t addr,
>>        if (flags & PTE_LM)
>>                pte |=3D GEN12_PPGTT_PTE_LM;
>>
>> -     switch (level) {
>> -     case I915_CACHE_NONE:
>> -             pte |=3D GEN12_PPGTT_PTE_PAT1;
>> -             break;
>> -     case I915_CACHE_LLC:
>> -     case I915_CACHE_L3_LLC:
>> -             pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
>> -             break;
>> -     case I915_CACHE_WT:
>> +     if (pat_index & BIT(0))
>>                pte |=3D GEN12_PPGTT_PTE_PAT0;
>> -             break;
>> -     default:
>> -             /* This should never happen. Added to deal with the compil=
e
>> -              * error due to the addition of I915_MAX_CACHE_LEVEL. Will
>> -              * be removed by the pat_index patch.
>> -              */
>> -             break;
>> -     }
>> +
>> +     if (pat_index & BIT(1))
>> +             pte |=3D GEN12_PPGTT_PTE_PAT1;
>> +
>> +     if (pat_index & BIT(2))
>> +             pte |=3D GEN12_PPGTT_PTE_PAT2;
>> +
>> +     if (pat_index & BIT(3))
>> +             pte |=3D MTL_PPGTT_PTE_PAT3;
>>
>>        return pte;
>>   }
>> @@ -457,11 +455,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>>                      struct i915_page_directory *pdp,
>>                      struct sgt_dma *iter,
>>                      u64 idx,
>> -                   enum i915_cache_level cache_level,
>> +                   unsigned int pat_index,
>>                      u32 flags)
>>   {
>>        struct i915_page_directory *pd;
>> -     const gen8_pte_t pte_encode =3D ppgtt->vm.pte_encode(0, cache_leve=
l, flags);
>> +     const gen8_pte_t pte_encode =3D ppgtt->vm.pte_encode(0, pat_index,=
 flags);
>>        gen8_pte_t *vaddr;
>>
>>        pd =3D i915_pd_entry(pdp, gen8_pd_index(idx, 2));
>> @@ -504,10 +502,10 @@ static void
>>   xehpsdv_ppgtt_insert_huge(struct i915_address_space *vm,
>>                          struct i915_vma_resource *vma_res,
>>                          struct sgt_dma *iter,
>> -                       enum i915_cache_level cache_level,
>> +                       unsigned int pat_index,
>>                          u32 flags)
>>   {
>> -     const gen8_pte_t pte_encode =3D vm->pte_encode(0, cache_level, fla=
gs);
>> +     const gen8_pte_t pte_encode =3D vm->pte_encode(0, pat_index, flags=
);
>>        unsigned int rem =3D sg_dma_len(iter->sg);
>>        u64 start =3D vma_res->start;
>>        u64 end =3D start + vma_res->vma_size;
>> @@ -612,10 +610,10 @@ xehpsdv_ppgtt_insert_huge(struct i915_address_spac=
e *vm,
>>   static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>>                                   struct i915_vma_resource *vma_res,
>>                                   struct sgt_dma *iter,
>> -                                enum i915_cache_level cache_level,
>> +                                unsigned int pat_index,
>>                                   u32 flags)
>>   {
>> -     const gen8_pte_t pte_encode =3D vm->pte_encode(0, cache_level, fla=
gs);
>> +     const gen8_pte_t pte_encode =3D vm->pte_encode(0, pat_index, flags=
);
>>        unsigned int rem =3D sg_dma_len(iter->sg);
>>        u64 start =3D vma_res->start;
>>
>> @@ -735,7 +733,7 @@ static void gen8_ppgtt_insert_huge(struct i915_addre=
ss_space *vm,
>>
>>   static void gen8_ppgtt_insert(struct i915_address_space *vm,
>>                              struct i915_vma_resource *vma_res,
>> -                           enum i915_cache_level cache_level,
>> +                           unsigned int pat_index,
>>                              u32 flags)
>>   {
>>        struct i915_ppgtt * const ppgtt =3D i915_vm_to_ppgtt(vm);
>> @@ -743,9 +741,9 @@ static void gen8_ppgtt_insert(struct i915_address_sp=
ace *vm,
>>
>>        if (vma_res->bi.page_sizes.sg > I915_GTT_PAGE_SIZE) {
>>                if (GRAPHICS_VER_FULL(vm->i915) >=3D IP_VER(12, 50))
>> -                     xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, cach=
e_level, flags);
>> +                     xehpsdv_ppgtt_insert_huge(vm, vma_res, &iter, pat_=
index, flags);
>>                else
>> -                     gen8_ppgtt_insert_huge(vm, vma_res, &iter, cache_l=
evel, flags);
>> +                     gen8_ppgtt_insert_huge(vm, vma_res, &iter, pat_ind=
ex, flags);
>>        } else  {
>>                u64 idx =3D vma_res->start >> GEN8_PTE_SHIFT;
>>
>> @@ -754,7 +752,7 @@ static void gen8_ppgtt_insert(struct i915_address_sp=
ace *vm,
>>                                gen8_pdp_for_page_index(vm, idx);
>>
>>                        idx =3D gen8_ppgtt_insert_pte(ppgtt, pdp, &iter, =
idx,
>> -                                                 cache_level, flags);
>> +                                                 pat_index, flags);
>>                } while (idx);
>>
>>                vma_res->page_sizes_gtt =3D I915_GTT_PAGE_SIZE;
>> @@ -764,7 +762,7 @@ static void gen8_ppgtt_insert(struct i915_address_sp=
ace *vm,
>>   static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>>                                    dma_addr_t addr,
>>                                    u64 offset,
>> -                                 enum i915_cache_level level,
>> +                                 unsigned int pat_index,
>>                                    u32 flags)
>>   {
>>        u64 idx =3D offset >> GEN8_PTE_SHIFT;
>> @@ -778,14 +776,14 @@ static void gen8_ppgtt_insert_entry(struct i915_ad=
dress_space *vm,
>>        GEM_BUG_ON(pt->is_compact);
>>
>>        vaddr =3D px_vaddr(pt);
>> -     vaddr[gen8_pd_index(idx, 0)] =3D vm->pte_encode(addr, level, flags=
);
>> +     vaddr[gen8_pd_index(idx, 0)] =3D vm->pte_encode(addr, pat_index, f=
lags);
>>        drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vad=
dr));
>>   }
>>
>>   static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space =
*vm,
>>                                            dma_addr_t addr,
>>                                            u64 offset,
>> -                                         enum i915_cache_level level,
>> +                                         unsigned int pat_index,
>>                                            u32 flags)
>>   {
>>        u64 idx =3D offset >> GEN8_PTE_SHIFT;
>> @@ -808,20 +806,20 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct=
 i915_address_space *vm,
>>        }
>>
>>        vaddr =3D px_vaddr(pt);
>> -     vaddr[gen8_pd_index(idx, 0) / 16] =3D vm->pte_encode(addr, level, =
flags);
>> +     vaddr[gen8_pd_index(idx, 0) / 16] =3D vm->pte_encode(addr, pat_ind=
ex, flags);
>>   }
>>
>>   static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
>>                                       dma_addr_t addr,
>>                                       u64 offset,
>> -                                    enum i915_cache_level level,
>> +                                    unsigned int pat_index,
>>                                       u32 flags)
>>   {
>>        if (flags & PTE_LM)
>>                return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,
>> -                                                    level, flags);
>> +                                                    pat_index, flags);
>>
>> -     return gen8_ppgtt_insert_entry(vm, addr, offset, level, flags);
>> +     return gen8_ppgtt_insert_entry(vm, addr, offset, pat_index, flags)=
;
>>   }
>>
>>   static int gen8_init_scratch(struct i915_address_space *vm)
>> @@ -856,7 +854,9 @@ static int gen8_init_scratch(struct i915_address_spa=
ce *vm)
>>
>>        vm->scratch[0]->encode =3D
>>                vm->pte_encode(px_dma(vm->scratch[0]),
>> -                            I915_CACHE_NONE, pte_flags);
>> +                            i915_gem_get_pat_index(vm->i915,
>> +                                                   I915_CACHE_NONE),
>> +                            pte_flags);
>>
>>        for (i =3D 1; i <=3D vm->top; i++) {
>>                struct drm_i915_gem_object *obj;
>> @@ -998,8 +998,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt=
 *gt,
>>         */
>>        ppgtt->vm.alloc_scratch_dma =3D alloc_pt_dma;
>>
>> -     if (GRAPHICS_VER_FULL(gt->i915) >=3D IP_VER(12, 70))
>> -             ppgtt->vm.pte_encode =3D mtl_pte_encode;
>> +     if (GRAPHICS_VER(gt->i915) >=3D 12)
>> +             ppgtt->vm.pte_encode =3D gen12_pte_encode;
>>        else
>>                ppgtt->vm.pte_encode =3D gen8_pte_encode;
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h b/drivers/gpu/drm/i915=
/gt/gen8_ppgtt.h
>> index f541d19264b4..19c635441642 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> @@ -10,13 +10,12 @@
>>
>>   struct i915_address_space;
>>   struct intel_gt;
>> -enum i915_cache_level;
>>
>>   struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>>                                     unsigned long lmem_pt_obj_flags);
>>
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> -                      enum i915_cache_level level,
>> +                      unsigned int pat_index,
>>                         u32 flags);
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915=
/gt/intel_ggtt.c
>> index c8390d03fce2..2a7942fac798 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -221,7 +221,7 @@ static void guc_ggtt_invalidate(struct i915_ggtt *gg=
tt)
>>   }
>>
>>   static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> -                            enum i915_cache_level level,
>> +                            unsigned int pat_index,
>>                               u32 flags)
>>   {
>>        gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT;
>> @@ -231,30 +231,17 @@ static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>>        if (flags & PTE_LM)
>>                pte |=3D GEN12_GGTT_PTE_LM;
>>
>> -     switch (level) {
>> -     case I915_CACHE_NONE:
>> -             pte |=3D MTL_GGTT_PTE_PAT1;
>> -             break;
>> -     case I915_CACHE_LLC:
>> -     case I915_CACHE_L3_LLC:
>> -             pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
>> -             break;
>> -     case I915_CACHE_WT:
>> +     if (pat_index & BIT(0))
>>                pte |=3D MTL_GGTT_PTE_PAT0;
>> -             break;
>> -     default:
>> -             /* This should never happen. Added to deal with the compil=
e
>> -              * error due to the addition of I915_MAX_CACHE_LEVEL. Will
>> -              * be removed by the pat_index patch.
>> -              */
>> -             break;
>> -     }
>> +
>> +     if (pat_index & BIT(1))
>> +             pte |=3D MTL_GGTT_PTE_PAT1;
>>
>>        return pte;
>>   }
>>
>>   u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>> -                      enum i915_cache_level level,
>> +                      unsigned int pat_index,
>>                         u32 flags)
>>   {
>>        gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT;
>> @@ -273,25 +260,25 @@ static void gen8_set_pte(void __iomem *addr, gen8_=
pte_t pte)
>>   static void gen8_ggtt_insert_page(struct i915_address_space *vm,
>>                                  dma_addr_t addr,
>>                                  u64 offset,
>> -                               enum i915_cache_level level,
>> +                               unsigned int pat_index,
>>                                  u32 flags)
>>   {
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>>        gen8_pte_t __iomem *pte =3D
>>                (gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_=
SIZE;
>>
>> -     gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>> +     gen8_set_pte(pte, ggtt->vm.pte_encode(addr, pat_index, flags));
>>
>>        ggtt->invalidate(ggtt);
>>   }
>>
>>   static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
>>                                     struct i915_vma_resource *vma_res,
>> -                                  enum i915_cache_level level,
>> +                                  unsigned int pat_index,
>>                                     u32 flags)
>>   {
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>> -     const gen8_pte_t pte_encode =3D ggtt->vm.pte_encode(0, level, flag=
s);
>> +     const gen8_pte_t pte_encode =3D ggtt->vm.pte_encode(0, pat_index, =
flags);
>>        gen8_pte_t __iomem *gte;
>>        gen8_pte_t __iomem *end;
>>        struct sgt_iter iter;
>> @@ -348,14 +335,14 @@ static void gen8_ggtt_clear_range(struct i915_addr=
ess_space *vm,
>>   static void gen6_ggtt_insert_page(struct i915_address_space *vm,
>>                                  dma_addr_t addr,
>>                                  u64 offset,
>> -                               enum i915_cache_level level,
>> +                               unsigned int pat_index,
>>                                  u32 flags)
>>   {
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>>        gen6_pte_t __iomem *pte =3D
>>                (gen6_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_=
SIZE;
>>
>> -     iowrite32(vm->pte_encode(addr, level, flags), pte);
>> +     iowrite32(vm->pte_encode(addr, pat_index, flags), pte);
>>
>>        ggtt->invalidate(ggtt);
>>   }
>> @@ -368,7 +355,7 @@ static void gen6_ggtt_insert_page(struct i915_addres=
s_space *vm,
>>    */
>>   static void gen6_ggtt_insert_entries(struct i915_address_space *vm,
>>                                     struct i915_vma_resource *vma_res,
>> -                                  enum i915_cache_level level,
>> +                                  unsigned int pat_index,
>>                                     u32 flags)
>>   {
>>        struct i915_ggtt *ggtt =3D i915_vm_to_ggtt(vm);
>> @@ -385,7 +372,7 @@ static void gen6_ggtt_insert_entries(struct i915_add=
ress_space *vm,
>>                iowrite32(vm->scratch[0]->encode, gte++);
>>        end +=3D (vma_res->node_size + vma_res->guard) / I915_GTT_PAGE_SI=
ZE;
>>        for_each_sgt_daddr(addr, iter, vma_res->bi.pages)
>> -             iowrite32(vm->pte_encode(addr, level, flags), gte++);
>> +             iowrite32(vm->pte_encode(addr, pat_index, flags), gte++);
>>        GEM_BUG_ON(gte > end);
>>
>>        /* Fill the allocated but "unused" space beyond the end of the bu=
ffer */
>> @@ -420,14 +407,15 @@ struct insert_page {
>>        struct i915_address_space *vm;
>>        dma_addr_t addr;
>>        u64 offset;
>> -     enum i915_cache_level level;
>> +     unsigned int pat_index;
>>   };
>>
>>   static int bxt_vtd_ggtt_insert_page__cb(void *_arg)
>>   {
>>        struct insert_page *arg =3D _arg;
>>
>> -     gen8_ggtt_insert_page(arg->vm, arg->addr, arg->offset, arg->level,=
 0);
>> +     gen8_ggtt_insert_page(arg->vm, arg->addr, arg->offset,
>> +                           arg->pat_index, 0);
>>        bxt_vtd_ggtt_wa(arg->vm);
>>
>>        return 0;
>> @@ -436,10 +424,10 @@ static int bxt_vtd_ggtt_insert_page__cb(void *_arg=
)
>>   static void bxt_vtd_ggtt_insert_page__BKL(struct i915_address_space *v=
m,
>>                                          dma_addr_t addr,
>>                                          u64 offset,
>> -                                       enum i915_cache_level level,
>> +                                       unsigned int pat_index,
>>                                          u32 unused)
>>   {
>> -     struct insert_page arg =3D { vm, addr, offset, level };
>> +     struct insert_page arg =3D { vm, addr, offset, pat_index };
>>
>>        stop_machine(bxt_vtd_ggtt_insert_page__cb, &arg, NULL);
>>   }
>> @@ -447,7 +435,7 @@ static void bxt_vtd_ggtt_insert_page__BKL(struct i91=
5_address_space *vm,
>>   struct insert_entries {
>>        struct i915_address_space *vm;
>>        struct i915_vma_resource *vma_res;
>> -     enum i915_cache_level level;
>> +     unsigned int pat_index;
>>        u32 flags;
>>   };
>>
>> @@ -455,7 +443,8 @@ static int bxt_vtd_ggtt_insert_entries__cb(void *_ar=
g)
>>   {
>>        struct insert_entries *arg =3D _arg;
>>
>> -     gen8_ggtt_insert_entries(arg->vm, arg->vma_res, arg->level, arg->f=
lags);
>> +     gen8_ggtt_insert_entries(arg->vm, arg->vma_res,
>> +                              arg->pat_index, arg->flags);
>>        bxt_vtd_ggtt_wa(arg->vm);
>>
>>        return 0;
>> @@ -463,10 +452,10 @@ static int bxt_vtd_ggtt_insert_entries__cb(void *_=
arg)
>>
>>   static void bxt_vtd_ggtt_insert_entries__BKL(struct i915_address_space=
 *vm,
>>                                             struct i915_vma_resource *vm=
a_res,
>> -                                          enum i915_cache_level level,
>> +                                          unsigned int pat_index,
>>                                             u32 flags)
>>   {
>> -     struct insert_entries arg =3D { vm, vma_res, level, flags };
>> +     struct insert_entries arg =3D { vm, vma_res, pat_index, flags };
>>
>>        stop_machine(bxt_vtd_ggtt_insert_entries__cb, &arg, NULL);
>>   }
>> @@ -495,7 +484,7 @@ static void gen6_ggtt_clear_range(struct i915_addres=
s_space *vm,
>>   void intel_ggtt_bind_vma(struct i915_address_space *vm,
>>                         struct i915_vm_pt_stash *stash,
>>                         struct i915_vma_resource *vma_res,
>> -                      enum i915_cache_level cache_level,
>> +                      unsigned int pat_index,
>>                         u32 flags)
>>   {
>>        u32 pte_flags;
>> @@ -512,7 +501,7 @@ void intel_ggtt_bind_vma(struct i915_address_space *=
vm,
>>        if (vma_res->bi.lmem)
>>                pte_flags |=3D PTE_LM;
>>
>> -     vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +     vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>        vma_res->page_sizes_gtt =3D I915_GTT_PAGE_SIZE;
>>   }
>>
>> @@ -661,7 +650,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>   static void aliasing_gtt_bind_vma(struct i915_address_space *vm,
>>                                  struct i915_vm_pt_stash *stash,
>>                                  struct i915_vma_resource *vma_res,
>> -                               enum i915_cache_level cache_level,
>> +                               unsigned int pat_index,
>>                                  u32 flags)
>>   {
>>        u32 pte_flags;
>> @@ -673,10 +662,10 @@ static void aliasing_gtt_bind_vma(struct i915_addr=
ess_space *vm,
>>
>>        if (flags & I915_VMA_LOCAL_BIND)
>>                ppgtt_bind_vma(&i915_vm_to_ggtt(vm)->alias->vm,
>> -                            stash, vma_res, cache_level, flags);
>> +                            stash, vma_res, pat_index, flags);
>>
>>        if (flags & I915_VMA_GLOBAL_BIND)
>> -             vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +             vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>
>>        vma_res->bound_flags |=3D flags;
>>   }
>> @@ -933,7 +922,9 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt,=
 u64 size)
>>
>>        ggtt->vm.scratch[0]->encode =3D
>>                ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
>> -                                 I915_CACHE_NONE, pte_flags);
>> +                                 i915_gem_get_pat_index(i915,
>> +                                                        I915_CACHE_NONE=
),
>> +                                 pte_flags);
>>
>>        return 0;
>>   }
>> @@ -1022,6 +1013,11 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt=
)
>>        return ggtt_probe_common(ggtt, size);
>>   }
>>
>> +/*
>> + * For pre-gen8 platforms pat_index is the same as enum i915_cache_leve=
l,
>> + * so these PTE encode functions are left with using cache_level.
>> + * See translation table LEGACY_CACHELEVEL.
>> + */
>>   static u64 snb_pte_encode(dma_addr_t addr,
>>                          enum i915_cache_level level,
>>                          u32 flags)
>> @@ -1302,7 +1298,9 @@ bool i915_ggtt_resume_vm(struct i915_address_space=
 *vm)
>>                 */
>>                vma->resource->bound_flags =3D 0;
>>                vma->ops->bind_vma(vm, NULL, vma->resource,
>> -                                obj ? obj->cache_level : 0,
>> +                                obj ? obj->pat_index :
>> +                                      i915_gem_get_pat_index(vm->i915,
>> +                                                             I915_CACHE=
_NONE),
>>                                   was_bound);
>>
>>                if (obj) { /* only used during resume =3D> exclusive acce=
ss */
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/=
gt/intel_gtt.h
>> index 9aff343beaa8..4d6296cdbcfd 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -163,8 +163,6 @@ typedef u64 gen8_pte_t;
>>   #define MTL_3_COH_2W        REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK=
, 3)
>>   #define MTL_2_COH_1W        REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK=
, 2)
>>
>> -enum i915_cache_level;
>> -
>>   struct drm_i915_gem_object;
>>   struct i915_fence_reg;
>>   struct i915_vma;
>> @@ -232,7 +230,7 @@ struct i915_vma_ops {
>>        void (*bind_vma)(struct i915_address_space *vm,
>>                         struct i915_vm_pt_stash *stash,
>>                         struct i915_vma_resource *vma_res,
>> -                      enum i915_cache_level cache_level,
>> +                      unsigned int pat_index,
>>                         u32 flags);
>>        /*
>>         * Unmap an object from an address space. This usually consists o=
f
>> @@ -304,7 +302,7 @@ struct i915_address_space {
>>                (*alloc_scratch_dma)(struct i915_address_space *vm, int s=
z);
>>
>>        u64 (*pte_encode)(dma_addr_t addr,
>> -                       enum i915_cache_level level,
>> +                       unsigned int pat_index,
>>                          u32 flags); /* Create a valid PTE */
>>   #define PTE_READ_ONLY       BIT(0)
>>   #define PTE_LM              BIT(1)
>> @@ -319,20 +317,20 @@ struct i915_address_space {
>>        void (*insert_page)(struct i915_address_space *vm,
>>                            dma_addr_t addr,
>>                            u64 offset,
>> -                         enum i915_cache_level cache_level,
>> +                         unsigned int pat_index,
>>                            u32 flags);
>>        void (*insert_entries)(struct i915_address_space *vm,
>>                               struct i915_vma_resource *vma_res,
>> -                            enum i915_cache_level cache_level,
>> +                            unsigned int pat_index,
>>                               u32 flags);
>>        void (*raw_insert_page)(struct i915_address_space *vm,
>>                                dma_addr_t addr,
>>                                u64 offset,
>> -                             enum i915_cache_level cache_level,
>> +                             unsigned int pat_index,
>>                                u32 flags);
>>        void (*raw_insert_entries)(struct i915_address_space *vm,
>>                                   struct i915_vma_resource *vma_res,
>> -                                enum i915_cache_level cache_level,
>> +                                unsigned int pat_index,
>>                                   u32 flags);
>>        void (*cleanup)(struct i915_address_space *vm);
>>
>> @@ -579,7 +577,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct int=
el_gt *gt,
>>   void intel_ggtt_bind_vma(struct i915_address_space *vm,
>>                         struct i915_vm_pt_stash *stash,
>>                         struct i915_vma_resource *vma_res,
>> -                      enum i915_cache_level cache_level,
>> +                      unsigned int pat_index,
>>                         u32 flags);
>>   void intel_ggtt_unbind_vma(struct i915_address_space *vm,
>>                           struct i915_vma_resource *vma_res);
>> @@ -657,7 +655,7 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt);
>>   void ppgtt_bind_vma(struct i915_address_space *vm,
>>                    struct i915_vm_pt_stash *stash,
>>                    struct i915_vma_resource *vma_res,
>> -                 enum i915_cache_level cache_level,
>> +                 unsigned int pat_index,
>>                    u32 flags);
>>   void ppgtt_unbind_vma(struct i915_address_space *vm,
>>                      struct i915_vma_resource *vma_res);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i=
915/gt/intel_migrate.c
>> index e0998879a0e1..6023288b0e2d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> @@ -45,7 +45,9 @@ static void xehpsdv_toggle_pdes(struct i915_address_sp=
ace *vm,
>>         * Insert a dummy PTE into every PT that will map to LMEM to ensu=
re
>>         * we have a correctly setup PDE structure for later use.
>>         */
>> -     vm->insert_page(vm, 0, d->offset, I915_CACHE_NONE, PTE_LM);
>> +     vm->insert_page(vm, 0, d->offset,
>> +                     i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>> +                     PTE_LM);
>>        GEM_BUG_ON(!pt->is_compact);
>>        d->offset +=3D SZ_2M;
>>   }
>> @@ -63,7 +65,9 @@ static void xehpsdv_insert_pte(struct i915_address_spa=
ce *vm,
>>         * alignment is 64K underneath for the pt, and we are careful
>>         * not to access the space in the void.
>>         */
>> -     vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE, PTE_LM=
);
>> +     vm->insert_page(vm, px_dma(pt), d->offset,
>> +                     i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>> +                     PTE_LM);
>>        d->offset +=3D SZ_64K;
>>   }
>>
>> @@ -73,7 +77,8 @@ static void insert_pte(struct i915_address_space *vm,
>>   {
>>        struct insert_pte_data *d =3D data;
>>
>> -     vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
>> +     vm->insert_page(vm, px_dma(pt), d->offset,
>> +                     i915_gem_get_pat_index(vm->i915, I915_CACHE_NONE),
>>                        i915_gem_object_is_lmem(pt->base) ? PTE_LM : 0);
>>        d->offset +=3D PAGE_SIZE;
>>   }
>> @@ -356,13 +361,13 @@ static int max_pte_pkt_size(struct i915_request *r=
q, int pkt)
>>
>>   static int emit_pte(struct i915_request *rq,
>>                    struct sgt_dma *it,
>> -                 enum i915_cache_level cache_level,
>> +                 unsigned int pat_index,
>>                    bool is_lmem,
>>                    u64 offset,
>>                    int length)
>>   {
>>        bool has_64K_pages =3D HAS_64K_PAGES(rq->engine->i915);
>> -     const u64 encode =3D rq->context->vm->pte_encode(0, cache_level,
>> +     const u64 encode =3D rq->context->vm->pte_encode(0, pat_index,
>>                                                       is_lmem ? PTE_LM :=
 0);
>>        struct intel_ring *ring =3D rq->ring;
>>        int pkt, dword_length;
>> @@ -673,17 +678,17 @@ int
>>   intel_context_migrate_copy(struct intel_context *ce,
>>                           const struct i915_deps *deps,
>>                           struct scatterlist *src,
>> -                        enum i915_cache_level src_cache_level,
>> +                        unsigned int src_pat_index,
>>                           bool src_is_lmem,
>>                           struct scatterlist *dst,
>> -                        enum i915_cache_level dst_cache_level,
>> +                        unsigned int dst_pat_index,
>>                           bool dst_is_lmem,
>>                           struct i915_request **out)
>>   {
>>        struct sgt_dma it_src =3D sg_sgt(src), it_dst =3D sg_sgt(dst), it=
_ccs;
>>        struct drm_i915_private *i915 =3D ce->engine->i915;
>>        u64 ccs_bytes_to_cpy =3D 0, bytes_to_cpy;
>> -     enum i915_cache_level ccs_cache_level;
>> +     unsigned int ccs_pat_index;
>>        u32 src_offset, dst_offset;
>>        u8 src_access, dst_access;
>>        struct i915_request *rq;
>> @@ -707,12 +712,12 @@ intel_context_migrate_copy(struct intel_context *c=
e,
>>                dst_sz =3D scatter_list_length(dst);
>>                if (src_is_lmem) {
>>                        it_ccs =3D it_dst;
>> -                     ccs_cache_level =3D dst_cache_level;
>> +                     ccs_pat_index =3D dst_pat_index;
>>                        ccs_is_src =3D false;
>>                } else if (dst_is_lmem) {
>>                        bytes_to_cpy =3D dst_sz;
>>                        it_ccs =3D it_src;
>> -                     ccs_cache_level =3D src_cache_level;
>> +                     ccs_pat_index =3D src_pat_index;
>>                        ccs_is_src =3D true;
>>                }
>>
>> @@ -773,7 +778,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>                src_sz =3D calculate_chunk_sz(i915, src_is_lmem,
>>                                            bytes_to_cpy, ccs_bytes_to_cp=
y);
>>
>> -             len =3D emit_pte(rq, &it_src, src_cache_level, src_is_lmem=
,
>> +             len =3D emit_pte(rq, &it_src, src_pat_index, src_is_lmem,
>>                               src_offset, src_sz);
>>                if (!len) {
>>                        err =3D -EINVAL;
>> @@ -784,7 +789,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>                        goto out_rq;
>>                }
>>
>> -             err =3D emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem=
,
>> +             err =3D emit_pte(rq, &it_dst, dst_pat_index, dst_is_lmem,
>>                               dst_offset, len);
>>                if (err < 0)
>>                        goto out_rq;
>> @@ -811,7 +816,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>>                                goto out_rq;
>>
>>                        ccs_sz =3D GET_CCS_BYTES(i915, len);
>> -                     err =3D emit_pte(rq, &it_ccs, ccs_cache_level, fal=
se,
>> +                     err =3D emit_pte(rq, &it_ccs, ccs_pat_index, false=
,
>>                                       ccs_is_src ? src_offset : dst_offs=
et,
>>                                       ccs_sz);
>>                        if (err < 0)
>> @@ -979,7 +984,7 @@ int
>>   intel_context_migrate_clear(struct intel_context *ce,
>>                            const struct i915_deps *deps,
>>                            struct scatterlist *sg,
>> -                         enum i915_cache_level cache_level,
>> +                         unsigned int pat_index,
>>                            bool is_lmem,
>>                            u32 value,
>>                            struct i915_request **out)
>> @@ -1027,7 +1032,7 @@ intel_context_migrate_clear(struct intel_context *=
ce,
>>                if (err)
>>                        goto out_rq;
>>
>> -             len =3D emit_pte(rq, &it, cache_level, is_lmem, offset, CH=
UNK_SZ);
>> +             len =3D emit_pte(rq, &it, pat_index, is_lmem, offset, CHUN=
K_SZ);
>>                if (len <=3D 0) {
>>                        err =3D len;
>>                        goto out_rq;
>> @@ -1074,10 +1079,10 @@ int intel_migrate_copy(struct intel_migrate *m,
>>                       struct i915_gem_ww_ctx *ww,
>>                       const struct i915_deps *deps,
>>                       struct scatterlist *src,
>> -                    enum i915_cache_level src_cache_level,
>> +                    unsigned int src_pat_index,
>>                       bool src_is_lmem,
>>                       struct scatterlist *dst,
>> -                    enum i915_cache_level dst_cache_level,
>> +                    unsigned int dst_pat_index,
>>                       bool dst_is_lmem,
>>                       struct i915_request **out)
>>   {
>> @@ -1098,8 +1103,8 @@ int intel_migrate_copy(struct intel_migrate *m,
>>                goto out;
>>
>>        err =3D intel_context_migrate_copy(ce, deps,
>> -                                      src, src_cache_level, src_is_lmem=
,
>> -                                      dst, dst_cache_level, dst_is_lmem=
,
>> +                                      src, src_pat_index, src_is_lmem,
>> +                                      dst, dst_pat_index, dst_is_lmem,
>>                                         out);
>>
>>        intel_context_unpin(ce);
>> @@ -1113,7 +1118,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>                    struct i915_gem_ww_ctx *ww,
>>                    const struct i915_deps *deps,
>>                    struct scatterlist *sg,
>> -                 enum i915_cache_level cache_level,
>> +                 unsigned int pat_index,
>>                    bool is_lmem,
>>                    u32 value,
>>                    struct i915_request **out)
>> @@ -1134,7 +1139,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>        if (err)
>>                goto out;
>>
>> -     err =3D intel_context_migrate_clear(ce, deps, sg, cache_level,
>> +     err =3D intel_context_migrate_clear(ce, deps, sg, pat_index,
>>                                          is_lmem, value, out);
>>
>>        intel_context_unpin(ce);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.h b/drivers/gpu/drm/i=
915/gt/intel_migrate.h
>> index ccc677ec4aa3..11fc09a00c4b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.h
>> @@ -16,7 +16,6 @@ struct i915_request;
>>   struct i915_gem_ww_ctx;
>>   struct intel_gt;
>>   struct scatterlist;
>> -enum i915_cache_level;
>>
>>   int intel_migrate_init(struct intel_migrate *m, struct intel_gt *gt);
>>
>> @@ -26,20 +25,20 @@ int intel_migrate_copy(struct intel_migrate *m,
>>                       struct i915_gem_ww_ctx *ww,
>>                       const struct i915_deps *deps,
>>                       struct scatterlist *src,
>> -                    enum i915_cache_level src_cache_level,
>> +                    unsigned int src_pat_index,
>>                       bool src_is_lmem,
>>                       struct scatterlist *dst,
>> -                    enum i915_cache_level dst_cache_level,
>> +                    unsigned int dst_pat_index,
>>                       bool dst_is_lmem,
>>                       struct i915_request **out);
>>
>>   int intel_context_migrate_copy(struct intel_context *ce,
>>                               const struct i915_deps *deps,
>>                               struct scatterlist *src,
>> -                            enum i915_cache_level src_cache_level,
>> +                            unsigned int src_pat_index,
>>                               bool src_is_lmem,
>>                               struct scatterlist *dst,
>> -                            enum i915_cache_level dst_cache_level,
>> +                            unsigned int dst_pat_index,
>>                               bool dst_is_lmem,
>>                               struct i915_request **out);
>>
>> @@ -48,7 +47,7 @@ intel_migrate_clear(struct intel_migrate *m,
>>                    struct i915_gem_ww_ctx *ww,
>>                    const struct i915_deps *deps,
>>                    struct scatterlist *sg,
>> -                 enum i915_cache_level cache_level,
>> +                 unsigned int pat_index,
>>                    bool is_lmem,
>>                    u32 value,
>>                    struct i915_request **out);
>> @@ -56,7 +55,7 @@ int
>>   intel_context_migrate_clear(struct intel_context *ce,
>>                            const struct i915_deps *deps,
>>                            struct scatterlist *sg,
>> -                         enum i915_cache_level cache_level,
>> +                         unsigned int pat_index,
>>                            bool is_lmem,
>>                            u32 value,
>>                            struct i915_request **out);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i91=
5/gt/intel_ppgtt.c
>> index 7ecfa672f738..436756bfbb1a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
>> @@ -181,7 +181,7 @@ struct i915_ppgtt *i915_ppgtt_create(struct intel_gt=
 *gt,
>>   void ppgtt_bind_vma(struct i915_address_space *vm,
>>                    struct i915_vm_pt_stash *stash,
>>                    struct i915_vma_resource *vma_res,
>> -                 enum i915_cache_level cache_level,
>> +                 unsigned int pat_index,
>>                    u32 flags)
>>   {
>>        u32 pte_flags;
>> @@ -199,7 +199,7 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
>>        if (vma_res->bi.lmem)
>>                pte_flags |=3D PTE_LM;
>>
>> -     vm->insert_entries(vm, vma_res, cache_level, pte_flags);
>> +     vm->insert_entries(vm, vma_res, pat_index, pte_flags);
>>        wmb();
>>   }
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/dr=
m/i915/gt/selftest_migrate.c
>> index e677f2da093d..3def5ca72dec 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
>> @@ -137,7 +137,7 @@ static int copy(struct intel_migrate *migrate,
>>   static int intel_context_copy_ccs(struct intel_context *ce,
>>                                  const struct i915_deps *deps,
>>                                  struct scatterlist *sg,
>> -                               enum i915_cache_level cache_level,
>> +                               unsigned int pat_index,
>>                                  bool write_to_ccs,
>>                                  struct i915_request **out)
>>   {
>> @@ -185,7 +185,7 @@ static int intel_context_copy_ccs(struct intel_conte=
xt *ce,
>>                if (err)
>>                        goto out_rq;
>>
>> -             len =3D emit_pte(rq, &it, cache_level, true, offset, CHUNK=
_SZ);
>> +             len =3D emit_pte(rq, &it, pat_index, true, offset, CHUNK_S=
Z);
>>                if (len <=3D 0) {
>>                        err =3D len;
>>                        goto out_rq;
>> @@ -223,7 +223,7 @@ intel_migrate_ccs_copy(struct intel_migrate *m,
>>                       struct i915_gem_ww_ctx *ww,
>>                       const struct i915_deps *deps,
>>                       struct scatterlist *sg,
>> -                    enum i915_cache_level cache_level,
>> +                    unsigned int pat_index,
>>                       bool write_to_ccs,
>>                       struct i915_request **out)
>>   {
>> @@ -243,7 +243,7 @@ intel_migrate_ccs_copy(struct intel_migrate *m,
>>        if (err)
>>                goto out;
>>
>> -     err =3D intel_context_copy_ccs(ce, deps, sg, cache_level,
>> +     err =3D intel_context_copy_ccs(ce, deps, sg, pat_index,
>>                                     write_to_ccs, out);
>>
>>        intel_context_unpin(ce);
>> @@ -300,7 +300,7 @@ static int clear(struct intel_migrate *migrate,
>>                        /* Write the obj data into ccs surface */
>>                        err =3D intel_migrate_ccs_copy(migrate, &ww, NULL=
,
>>                                                     obj->mm.pages->sgl,
>> -                                                  obj->cache_level,
>> +                                                  obj->pat_index,
>>                                                     true, &rq);
>>                        if (rq && !err) {
>>                                if (i915_request_wait(rq, 0, HZ) < 0) {
>> @@ -351,7 +351,7 @@ static int clear(struct intel_migrate *migrate,
>>
>>                        err =3D intel_migrate_ccs_copy(migrate, &ww, NULL=
,
>>                                                     obj->mm.pages->sgl,
>> -                                                  obj->cache_level,
>> +                                                  obj->pat_index,
>>                                                     false, &rq);
>>                        if (rq && !err) {
>>                                if (i915_request_wait(rq, 0, HZ) < 0) {
>> @@ -414,9 +414,9 @@ static int __migrate_copy(struct intel_migrate *migr=
ate,
>>                          struct i915_request **out)
>>   {
>>        return intel_migrate_copy(migrate, ww, NULL,
>> -                               src->mm.pages->sgl, src->cache_level,
>> +                               src->mm.pages->sgl, src->pat_index,
>>                                  i915_gem_object_is_lmem(src),
>> -                               dst->mm.pages->sgl, dst->cache_level,
>> +                               dst->mm.pages->sgl, dst->pat_index,
>>                                  i915_gem_object_is_lmem(dst),
>>                                  out);
>>   }
>> @@ -428,9 +428,9 @@ static int __global_copy(struct intel_migrate *migra=
te,
>>                         struct i915_request **out)
>>   {
>>        return intel_context_migrate_copy(migrate->context, NULL,
>> -                                       src->mm.pages->sgl, src->cache_l=
evel,
>> +                                       src->mm.pages->sgl, src->pat_ind=
ex,
>>                                          i915_gem_object_is_lmem(src),
>> -                                       dst->mm.pages->sgl, dst->cache_l=
evel,
>> +                                       dst->mm.pages->sgl, dst->pat_ind=
ex,
>>                                          i915_gem_object_is_lmem(dst),
>>                                          out);
>>   }
>> @@ -455,7 +455,7 @@ static int __migrate_clear(struct intel_migrate *mig=
rate,
>>   {
>>        return intel_migrate_clear(migrate, ww, NULL,
>>                                   obj->mm.pages->sgl,
>> -                                obj->cache_level,
>> +                                obj->pat_index,
>>                                   i915_gem_object_is_lmem(obj),
>>                                   value, out);
>>   }
>> @@ -468,7 +468,7 @@ static int __global_clear(struct intel_migrate *migr=
ate,
>>   {
>>        return intel_context_migrate_clear(migrate->context, NULL,
>>                                           obj->mm.pages->sgl,
>> -                                        obj->cache_level,
>> +                                        obj->pat_index,
>>                                           i915_gem_object_is_lmem(obj),
>>                                           value, out);
>>   }
>> @@ -648,7 +648,7 @@ static int live_emit_pte_full_ring(void *arg)
>>         */
>>        pr_info("%s emite_pte ring space=3D%u\n", __func__, rq->ring->spa=
ce);
>>        it =3D sg_sgt(obj->mm.pages->sgl);
>> -     len =3D emit_pte(rq, &it, obj->cache_level, false, 0, CHUNK_SZ);
>> +     len =3D emit_pte(rq, &it, obj->pat_index, false, 0, CHUNK_SZ);
>>        if (!len) {
>>                err =3D -EINVAL;
>>                goto out_rq;
>> @@ -844,7 +844,7 @@ static int wrap_ktime_compare(const void *A, const v=
oid *B)
>>
>>   static int __perf_clear_blt(struct intel_context *ce,
>>                            struct scatterlist *sg,
>> -                         enum i915_cache_level cache_level,
>> +                         unsigned int pat_index,
>>                            bool is_lmem,
>>                            size_t sz)
>>   {
>> @@ -858,7 +858,7 @@ static int __perf_clear_blt(struct intel_context *ce=
,
>>
>>                t0 =3D ktime_get();
>>
>> -             err =3D intel_context_migrate_clear(ce, NULL, sg, cache_le=
vel,
>> +             err =3D intel_context_migrate_clear(ce, NULL, sg, pat_inde=
x,
>>                                                  is_lmem, 0, &rq);
>>                if (rq) {
>>                        if (i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT=
) < 0)
>> @@ -904,7 +904,8 @@ static int perf_clear_blt(void *arg)
>>
>>                err =3D __perf_clear_blt(gt->migrate.context,
>>                                       dst->mm.pages->sgl,
>> -                                    I915_CACHE_NONE,
>> +                                    i915_gem_get_pat_index(gt->i915,
>> +                                                           I915_CACHE_N=
ONE),
>>                                       i915_gem_object_is_lmem(dst),
>>                                       sizes[i]);
>>
>> @@ -919,10 +920,10 @@ static int perf_clear_blt(void *arg)
>>
>>   static int __perf_copy_blt(struct intel_context *ce,
>>                           struct scatterlist *src,
>> -                        enum i915_cache_level src_cache_level,
>> +                        unsigned int src_pat_index,
>>                           bool src_is_lmem,
>>                           struct scatterlist *dst,
>> -                        enum i915_cache_level dst_cache_level,
>> +                        unsigned int dst_pat_index,
>>                           bool dst_is_lmem,
>>                           size_t sz)
>>   {
>> @@ -937,9 +938,9 @@ static int __perf_copy_blt(struct intel_context *ce,
>>                t0 =3D ktime_get();
>>
>>                err =3D intel_context_migrate_copy(ce, NULL,
>> -                                              src, src_cache_level,
>> +                                              src, src_pat_index,
>>                                                 src_is_lmem,
>> -                                              dst, dst_cache_level,
>> +                                              dst, dst_pat_index,
>>                                                 dst_is_lmem,
>>                                                 &rq);
>>                if (rq) {
>> @@ -994,10 +995,12 @@ static int perf_copy_blt(void *arg)
>>
>>                err =3D __perf_copy_blt(gt->migrate.context,
>>                                      src->mm.pages->sgl,
>> -                                   I915_CACHE_NONE,
>> +                                   i915_gem_get_pat_index(gt->i915,
>> +                                                          I915_CACHE_NO=
NE),
>>                                      i915_gem_object_is_lmem(src),
>>                                      dst->mm.pages->sgl,
>> -                                   I915_CACHE_NONE,
>> +                                   i915_gem_get_pat_index(gt->i915,
>> +                                                          I915_CACHE_NO=
NE),
>>                                      i915_gem_object_is_lmem(dst),
>>                                      sz);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/=
i915/gt/selftest_reset.c
>> index a9e0a91bc0e0..79aa6ac66ad2 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
>> @@ -86,7 +86,9 @@ __igt_reset_stolen(struct intel_gt *gt,
>>
>>                ggtt->vm.insert_page(&ggtt->vm, dma,
>>                                     ggtt->error_capture.start,
>> -                                  I915_CACHE_NONE, 0);
>> +                                  i915_gem_get_pat_index(gt->i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>                mb();
>>
>>                s =3D io_mapping_map_wc(&ggtt->iomap,
>> @@ -127,7 +129,9 @@ __igt_reset_stolen(struct intel_gt *gt,
>>
>>                ggtt->vm.insert_page(&ggtt->vm, dma,
>>                                     ggtt->error_capture.start,
>> -                                  I915_CACHE_NONE, 0);
>> +                                  i915_gem_get_pat_index(gt->i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>                mb();
>>
>>                s =3D io_mapping_map_wc(&ggtt->iomap,
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/d=
rm/i915/gt/selftest_timeline.c
>> index 9f536c251179..39c3ec12df1a 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
>> @@ -836,7 +836,7 @@ static int setup_watcher(struct hwsp_watcher *w, str=
uct intel_gt *gt,
>>                return PTR_ERR(obj);
>>
>>        /* keep the same cache settings as timeline */
>> -     i915_gem_object_set_cache_coherency(obj, tl->hwsp_ggtt->obj->cache=
_level);
>> +     i915_gem_object_set_pat_index(obj, tl->hwsp_ggtt->obj->pat_index);
>>        w->map =3D i915_gem_object_pin_map_unlocked(obj,
>>                                                  page_unmask_bits(tl->hw=
sp_ggtt->obj->mm.mapping));
>>        if (IS_ERR(w->map)) {
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_tlb.c b/drivers/gpu/drm/i9=
15/gt/selftest_tlb.c
>> index e6cac1f15d6e..4493c8518e91 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_tlb.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_tlb.c
>> @@ -36,6 +36,8 @@ pte_tlbinv(struct intel_context *ce,
>>           u64 length,
>>           struct rnd_state *prng)
>>   {
>> +     const unsigned int pat_index =3D
>> +             i915_gem_get_pat_index(ce->vm->i915, I915_CACHE_NONE);
>>        struct drm_i915_gem_object *batch;
>>        struct drm_mm_node vb_node;
>>        struct i915_request *rq;
>> @@ -155,7 +157,7 @@ pte_tlbinv(struct intel_context *ce,
>>                /* Flip the PTE between A and B */
>>                if (i915_gem_object_is_lmem(vb->obj))
>>                        pte_flags |=3D PTE_LM;
>> -             ce->vm->insert_entries(ce->vm, &vb_res, 0, pte_flags);
>> +             ce->vm->insert_entries(ce->vm, &vb_res, pat_index, pte_fla=
gs);
>>
>>                /* Flush the PTE update to concurrent HW */
>>                tlbinv(ce->vm, addr & -length, length);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/=
i915/gt/uc/intel_uc_fw.c
>> index 4ec7df9ed5ff..e34c79120090 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -957,9 +957,15 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_=
fw)
>>                pte_flags |=3D PTE_LM;
>>
>>        if (ggtt->vm.raw_insert_entries)
>> -             ggtt->vm.raw_insert_entries(&ggtt->vm, dummy, I915_CACHE_N=
ONE, pte_flags);
>> +             ggtt->vm.raw_insert_entries(&ggtt->vm, dummy,
>> +                                         i915_gem_get_pat_index(ggtt->v=
m.i915,
>> +                                                                I915_CA=
CHE_NONE),
>> +                                         pte_flags);
>>        else
>> -             ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE,=
 pte_flags);
>> +             ggtt->vm.insert_entries(&ggtt->vm, dummy,
>> +                                     i915_gem_get_pat_index(ggtt->vm.i9=
15,
>> +                                                            I915_CACHE_=
NONE),
>> +                                     pte_flags);
>>   }
>>
>>   static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/=
i915_debugfs.c
>> index 41389a32e998..76ccd4e03e31 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -139,21 +139,54 @@ static const char *stringify_vma_type(const struct=
 i915_vma *vma)
>>        return "ppgtt";
>>   }
>>
>> -static const char *i915_cache_level_str(struct drm_i915_private *i915, =
int type)
>> -{
>> -     switch (type) {
>> -     case I915_CACHE_NONE: return " uncached";
>> -     case I915_CACHE_LLC: return HAS_LLC(i915) ? " LLC" : " snooped";
>> -     case I915_CACHE_L3_LLC: return " L3+LLC";
>> -     case I915_CACHE_WT: return " WT";
>> -     default: return "";
>> +static const char *i915_cache_level_str(struct drm_i915_gem_object *obj=
)
>> +{
>> +     struct drm_i915_private *i915 =3D obj_to_i915(obj);
>> +
>> +     if (IS_METEORLAKE(i915)) {
>> +             switch (obj->pat_index) {
>> +             case 0: return " WB";
>> +             case 1: return " WT";
>> +             case 2: return " UC";
>> +             case 3: return " WB (1-Way Coh)";
>> +             case 4: return " WB (2-Way Coh)";
>> +             default: return " not defined";
>> +             }
>> +     } else if (IS_PONTEVECCHIO(i915)) {
>> +             switch (obj->pat_index) {
>> +             case 0: return " UC";
>> +             case 1: return " WC";
>> +             case 2: return " WT";
>> +             case 3: return " WB";
>> +             case 4: return " WT (CLOS1)";
>> +             case 5: return " WB (CLOS1)";
>> +             case 6: return " WT (CLOS2)";
>> +             case 7: return " WT (CLOS2)";
>> +             default: return " not defined";
>> +             }
>> +     } else if (GRAPHICS_VER(i915) >=3D 12) {
>> +             switch (obj->pat_index) {
>> +             case 0: return " WB";
>> +             case 1: return " WC";
>> +             case 2: return " WT";
>> +             case 3: return " UC";
>> +             default: return " not defined";
>> +             }
>> +     } else {
>> +             switch (obj->pat_index) {
>> +             case 0: return " UC";
>> +             case 1: return HAS_LLC(i915) ?
>> +                            " LLC" : " snooped";
>> +             case 2: return " L3+LLC";
>> +             case 3: return " WT";
>> +             default: return " not defined";
>> +             }
>>        }
>>   }
>>
>>   void
>>   i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_obje=
ct *obj)
>>   {
>> -     struct drm_i915_private *dev_priv =3D to_i915(obj->base.dev);
>>        struct i915_vma *vma;
>>        int pin_count =3D 0;
>>
>> @@ -165,7 +198,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct=
 drm_i915_gem_object *obj)
>>                   obj->base.size / 1024,
>>                   obj->read_domains,
>>                   obj->write_domain,
>> -                i915_cache_level_str(dev_priv, obj->cache_level),
>> +                i915_cache_level_str(obj),
>>                   obj->mm.dirty ? " dirty" : "",
>>                   obj->mm.madv =3D=3D I915_MADV_DONTNEED ? " purgeable" =
: "");
>>        if (obj->base.name)
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915=
_gem.c
>> index 0a78bdbd36b1..38933c00f705 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -420,8 +420,11 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>>                page_length =3D remain < page_length ? remain : page_leng=
th;
>>                if (drm_mm_node_allocated(&node)) {
>>                        ggtt->vm.insert_page(&ggtt->vm,
>> -                                          i915_gem_object_get_dma_addre=
ss(obj, offset >> PAGE_SHIFT),
>> -                                          node.start, I915_CACHE_NONE, =
0);
>> +                                          i915_gem_object_get_dma_addre=
ss(obj,
>> +                                                                       =
   offset >> PAGE_SHIFT),
>> +                                          node.start,
>> +                                          i915_gem_get_pat_index(i915,
>> +                                                                 I915_C=
ACHE_NONE), 0);
>>                } else {
>>                        page_base +=3D offset & PAGE_MASK;
>>                }
>> @@ -598,8 +601,11 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object=
 *obj,
>>                        /* flush the write before we modify the GGTT */
>>                        intel_gt_flush_ggtt_writes(ggtt->vm.gt);
>>                        ggtt->vm.insert_page(&ggtt->vm,
>> -                                          i915_gem_object_get_dma_addre=
ss(obj, offset >> PAGE_SHIFT),
>> -                                          node.start, I915_CACHE_NONE, =
0);
>> +                                          i915_gem_object_get_dma_addre=
ss(obj,
>> +                                                                       =
   offset >> PAGE_SHIFT),
>> +                                          node.start,
>> +                                          i915_gem_get_pat_index(i915,
>> +                                                                 I915_C=
ACHE_NONE), 0);
>>                        wmb(); /* flush modifications to the GGTT (insert=
_page) */
>>                } else {
>>                        page_base +=3D offset & PAGE_MASK;
>> @@ -1142,6 +1148,19 @@ int i915_gem_init(struct drm_i915_private *dev_pr=
iv)
>>        unsigned int i;
>>        int ret;
>>
>> +     /*
>> +      * In the proccess of replacing cache_level with pat_index a trick=
y
>> +      * dependency is created on the definition of the enum i915_cache_=
level.
>> +      * in case this enum is changed, PTE encode would be broken.
>
>_I_n

Sorry, what does this mean?

>> +      * Add a WARNING here. And remove when we completely quit using th=
is
>> +      * enum
>> +      */
>> +     WARN_ON_ONCE(I915_CACHE_NONE !=3D 0 ||
>> +                  I915_CACHE_LLC !=3D 1 ||
>> +                  I915_CACHE_L3_LLC !=3D 2 ||
>> +                  I915_CACHE_WT !=3D 3 ||
>> +                  I915_MAX_CACHE_LEVEL !=3D 4);
>
> I thought BUILD_BUG_ON would be better.

Of course, don't know what I was thinking, updated in v8.

>> +
>>        /* We need to fallback to 4K pages if host doesn't support huge g=
tt. */
>>        if (intel_vgpu_active(dev_priv) && !intel_vgpu_has_huge_gtt(dev_p=
riv))
>>                RUNTIME_INFO(dev_priv)->page_sizes =3D I915_GTT_PAGE_SIZE=
_4K;
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i91=
5/i915_gpu_error.c
>> index 8ffdd7f47e93..566536499954 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1122,10 +1122,14 @@ i915_vma_coredump_create(const struct intel_gt *=
gt,
>>                        mutex_lock(&ggtt->error_mutex);
>>                        if (ggtt->vm.raw_insert_page)
>>                                ggtt->vm.raw_insert_page(&ggtt->vm, dma, =
slot,
>> -                                                      I915_CACHE_NONE, =
0);
>> +                                                      i915_gem_get_pat_=
index(gt->i915,
>> +                                                                       =
      I915_CACHE_NONE),
>> +                                                      0);
>>                        else
>>                                ggtt->vm.insert_page(&ggtt->vm, dma, slot=
,
>> -                                                  I915_CACHE_NONE, 0);
>> +                                                  i915_gem_get_pat_inde=
x(gt->i915,
>> +                                                                       =
  I915_CACHE_NONE),
>> +                                                  0);
>>                        mb();
>>
>>                        s =3D io_mapping_map_wc(&ggtt->iomap, slot, PAGE_=
SIZE);
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915=
_vma.c
>> index 20a44788999e..a814775a363d 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -315,7 +315,7 @@ struct i915_vma_work {
>>        struct i915_vma_resource *vma_res;
>>        struct drm_i915_gem_object *obj;
>>        struct i915_sw_dma_fence_cb cb;
>> -     enum i915_cache_level cache_level;
>> +     unsigned int pat_index;
>>        unsigned int flags;
>>   };
>>
>> @@ -334,7 +334,7 @@ static void __vma_bind(struct dma_fence_work *work)
>>                return;
>>
>>        vma_res->ops->bind_vma(vma_res->vm, &vw->stash,
>> -                            vma_res, vw->cache_level, vw->flags);
>> +                            vma_res, vw->pat_index, vw->flags);
>>   }
>>
>>   static void __vma_release(struct dma_fence_work *work)
>> @@ -426,7 +426,7 @@ i915_vma_resource_init_from_vma(struct i915_vma_reso=
urce *vma_res,
>>   /**
>>    * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding addre=
ss space.
>>    * @vma: VMA to map
>> - * @cache_level: mapping cache level
>> + * @pat_index: PAT index to set in PTE
>>    * @flags: flags like global or local mapping
>>    * @work: preallocated worker for allocating and binding the PTE
>>    * @vma_res: pointer to a preallocated vma resource. The resource is e=
ither
>> @@ -437,7 +437,7 @@ i915_vma_resource_init_from_vma(struct i915_vma_reso=
urce *vma_res,
>>    * Note that DMA addresses are also the only part of the SG table we c=
are about.
>>    */
>>   int i915_vma_bind(struct i915_vma *vma,
>> -               enum i915_cache_level cache_level,
>> +               unsigned int pat_index,
>>                  u32 flags,
>>                  struct i915_vma_work *work,
>>                  struct i915_vma_resource *vma_res)
>> @@ -507,7 +507,7 @@ int i915_vma_bind(struct i915_vma *vma,
>>                struct dma_fence *prev;
>>
>>                work->vma_res =3D i915_vma_resource_get(vma->resource);
>> -             work->cache_level =3D cache_level;
>> +             work->pat_index =3D pat_index;
>>                work->flags =3D bind_flags;
>>
>>                /*
>> @@ -537,7 +537,7 @@ int i915_vma_bind(struct i915_vma *vma,
>>
>>                        return ret;
>>                }
>> -             vma->ops->bind_vma(vma->vm, NULL, vma->resource, cache_lev=
el,
>> +             vma->ops->bind_vma(vma->vm, NULL, vma->resource, pat_index=
,
>>                                   bind_flags);
>>        }
>>
>> @@ -814,7 +814,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_ge=
m_ww_ctx *ww,
>>        color =3D 0;
>>
>>        if (i915_vm_has_cache_coloring(vma->vm))
>> -             color =3D vma->obj->cache_level;
>> +             color =3D vma->obj->pat_index;
>>
>>        if (flags & PIN_OFFSET_FIXED) {
>>                u64 offset =3D flags & PIN_OFFSET_MASK;
>> @@ -1518,7 +1518,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i=
915_gem_ww_ctx *ww,
>>
>>        GEM_BUG_ON(!vma->pages);
>>        err =3D i915_vma_bind(vma,
>> -                         vma->obj->cache_level,
>> +                         vma->obj->pat_index,
>>                            flags, work, vma_res);
>>        vma_res =3D NULL;
>>        if (err)
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915=
_vma.h
>> index 38c8c66ed724..9a9729205d5b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -250,7 +250,7 @@ i915_vma_compare(struct i915_vma *vma,
>>
>>   struct i915_vma_work *i915_vma_work(void);
>>   int i915_vma_bind(struct i915_vma *vma,
>> -               enum i915_cache_level cache_level,
>> +               unsigned int pat_index,
>>                  u32 flags,
>>                  struct i915_vma_work *work,
>>                  struct i915_vma_resource *vma_res);
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i91=
5/i915_vma_types.h
>> index 77fda2244d16..64472b7f0e77 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -32,8 +32,6 @@
>>
>>   #include "gem/i915_gem_object_types.h"
>>
>> -enum i915_cache_level;
>> -
>>   /**
>>    * DOC: Global GTT views
>>    *
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm=
/i915/selftests/i915_gem.c
>> index d91d0ade8abd..61da4ed9d521 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
>> @@ -57,7 +57,10 @@ static void trash_stolen(struct drm_i915_private *i91=
5)
>>                u32 __iomem *s;
>>                int x;
>>
>> -             ggtt->vm.insert_page(&ggtt->vm, dma, slot, I915_CACHE_NONE=
, 0);
>> +             ggtt->vm.insert_page(&ggtt->vm, dma, slot,
>> +                                  i915_gem_get_pat_index(i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>
>>                s =3D io_mapping_map_atomic_wc(&ggtt->iomap, slot);
>>                for (x =3D 0; x < PAGE_SIZE / sizeof(u32); x++) {
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/g=
pu/drm/i915/selftests/i915_gem_evict.c
>> index f68ef4074088..f8fe3681c3dc 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
>> @@ -246,7 +246,7 @@ static int igt_evict_for_cache_color(void *arg)
>>        struct drm_mm_node target =3D {
>>                .start =3D I915_GTT_PAGE_SIZE * 2,
>>                .size =3D I915_GTT_PAGE_SIZE,
>> -             .color =3D I915_CACHE_LLC,
>> +             .color =3D i915_gem_get_pat_index(gt->i915, I915_CACHE_LLC=
),
>>        };
>>        struct drm_i915_gem_object *obj;
>>        struct i915_vma *vma;
>> @@ -309,7 +309,7 @@ static int igt_evict_for_cache_color(void *arg)
>>        /* Attempt to remove the first *pinned* vma, by removing the (emp=
ty)
>>         * neighbour -- this should fail.
>>         */
>> -     target.color =3D I915_CACHE_L3_LLC;
>> +     target.color =3D i915_gem_get_pat_index(gt->i915, I915_CACHE_L3_LL=
C);
>>
>>        mutex_lock(&ggtt->vm.mutex);
>>        err =3D i915_gem_evict_for_node(&ggtt->vm, NULL, &target, 0);
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu=
/drm/i915/selftests/i915_gem_gtt.c
>> index 154801f1c468..36940ef10108 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> @@ -135,7 +135,7 @@ fake_dma_object(struct drm_i915_private *i915, u64 s=
ize)
>>
>>        obj->write_domain =3D I915_GEM_DOMAIN_CPU;
>>        obj->read_domains =3D I915_GEM_DOMAIN_CPU;
>> -     obj->cache_level =3D I915_CACHE_NONE;
>> +     obj->pat_index =3D i915_gem_get_pat_index(i915, I915_CACHE_NONE);
>>
>>        /* Preallocate the "backing storage" */
>>        if (i915_gem_object_pin_pages_unlocked(obj))
>> @@ -359,7 +359,9 @@ static int lowlevel_hole(struct i915_address_space *=
vm,
>>
>>                        with_intel_runtime_pm(vm->gt->uncore->rpm, wakere=
f)
>>                          vm->insert_entries(vm, mock_vma_res,
>> -                                                I915_CACHE_NONE, 0);
>> +                                          i915_gem_get_pat_index(vm->i9=
15,
>> +                                                                 I915_C=
ACHE_NONE),
>> +                                          0);
>>                }
>>                count =3D n;
>>
>> @@ -1377,7 +1379,10 @@ static int igt_ggtt_page(void *arg)
>>
>>                ggtt->vm.insert_page(&ggtt->vm,
>>                                     i915_gem_object_get_dma_address(obj,=
 0),
>> -                                  offset, I915_CACHE_NONE, 0);
>> +                                  offset,
>> +                                  i915_gem_get_pat_index(i915,
>> +                                                         I915_CACHE_NON=
E),
>> +                                  0);
>>        }
>>
>>        order =3D i915_random_order(count, &prng);
>> @@ -1510,7 +1515,7 @@ static int reserve_gtt_with_resource(struct i915_v=
ma *vma, u64 offset)
>>        mutex_lock(&vm->mutex);
>>        err =3D i915_gem_gtt_reserve(vm, NULL, &vma->node, obj->base.size=
,
>>                                   offset,
>> -                                obj->cache_level,
>> +                                obj->pat_index,
>>                                   0);
>>        if (!err) {
>>                i915_vma_resource_init_from_vma(vma_res, vma);
>> @@ -1690,7 +1695,7 @@ static int insert_gtt_with_resource(struct i915_vm=
a *vma)
>>
>>        mutex_lock(&vm->mutex);
>>        err =3D i915_gem_gtt_insert(vm, NULL, &vma->node, obj->base.size,=
 0,
>> -                               obj->cache_level, 0, vm->total, 0);
>> +                               obj->pat_index, 0, vm->total, 0);
>>        if (!err) {
>>                i915_vma_resource_init_from_vma(vma_res, vma);
>>                vma->resource =3D vma_res;
>> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/driv=
ers/gpu/drm/i915/selftests/intel_memory_region.c
>> index 3b18e5905c86..d985d9bae2e8 100644
>> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>> @@ -1070,7 +1070,9 @@ static int igt_lmem_write_cpu(void *arg)
>>        /* Put the pages into a known state -- from the gpu for added fun=
 */
>>        intel_engine_pm_get(engine);
>>        err =3D intel_context_migrate_clear(engine->gt->migrate.context, =
NULL,
>> -                                       obj->mm.pages->sgl, I915_CACHE_N=
ONE,
>> +                                       obj->mm.pages->sgl,
>> +                                       i915_gem_get_pat_index(i915,
>> +                                                              I915_CACH=
E_NONE),
>>                                          true, 0xdeadbeaf, &rq);
>>        if (rq) {
>>                dma_resv_add_fence(obj->base.resv, &rq->fence,
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm=
/i915/selftests/mock_gtt.c
>> index ece97e4faacb..a516c0aa88fd 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
>> @@ -27,21 +27,21 @@
>>   static void mock_insert_page(struct i915_address_space *vm,
>>                             dma_addr_t addr,
>>                             u64 offset,
>> -                          enum i915_cache_level level,
>> +                          unsigned int pat_index,
>>                             u32 flags)
>>   {
>>   }
>>
>>   static void mock_insert_entries(struct i915_address_space *vm,
>>                                struct i915_vma_resource *vma_res,
>> -                             enum i915_cache_level level, u32 flags)
>> +                             unsigned int pat_index, u32 flags)
>>   {
>>   }
>>
>>   static void mock_bind_ppgtt(struct i915_address_space *vm,
>>                            struct i915_vm_pt_stash *stash,
>>                            struct i915_vma_resource *vma_res,
>> -                         enum i915_cache_level cache_level,
>> +                         unsigned int pat_index,
>>                            u32 flags)
>>   {
>>        GEM_BUG_ON(flags & I915_VMA_GLOBAL_BIND);
>> @@ -94,7 +94,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private =
*i915, const char *name)
>>   static void mock_bind_ggtt(struct i915_address_space *vm,
>>                           struct i915_vm_pt_stash *stash,
>>                           struct i915_vma_resource *vma_res,
>> -                        enum i915_cache_level cache_level,
>> +                        unsigned int pat_index,
>>                           u32 flags)
>>   {
>>   }
>
> With a pinky promise to improve this all in the near future I won't
> grumble to loudly. :) I haven't read all the details, I leave that to
> other reviewers, and also assuming some final tweaks as indicated above
> please.

Thanks for all the suggestions, really appreciated.
May I add your Acked-by?

-Fei

> Regards,
>
> Tvrtko


--_000_SN6PR11MB25746DE12E35850DF6772BA29A769SN6PR11MB2574namp_
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
&gt; On 09/05/2023 00:48, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Currently the KMD is using enum i915=
_cache_level to set caching policy for</div>
<div class=3D"ContentPasted0">&gt;&gt; buffer objects. This is flaky becaus=
e the PAT index which really controls</div>
<div class=3D"ContentPasted0">&gt;&gt; the caching behavior in PTE has far =
more levels than what's defined in the</div>
<div class=3D"ContentPasted0">&gt;&gt; enum. In addition, the PAT index is =
platform dependent, having to translate</div>
<div class=3D"ContentPasted0">&gt;&gt; between i915_cache_level and PAT ind=
ex is not reliable, and makes the code</div>
<div class=3D"ContentPasted0">&gt;&gt; more complicated.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; From UMD's perspective there is also=
 a necessity to set caching policy for</div>
<div class=3D"ContentPasted0">&gt;&gt; performance fine tuning. It's much e=
asier for the UMD to directly use PAT</div>
<div class=3D"ContentPasted0">&gt;&gt; index because the behavior of each P=
AT index is clearly defined in Bspec.</div>
<div class=3D"ContentPasted0">&gt;&gt; Having the abstracted i915_cache_lev=
el sitting in between would only cause</div>
<div class=3D"ContentPasted0">&gt;&gt; more ambiguity. PAT is expected to w=
ork much like MOCS already works today,</div>
<div class=3D"ContentPasted0">&gt;&gt; and by design userspace is expected =
to select the index that exactly</div>
<div class=3D"ContentPasted0">&gt;&gt; matches the desired behavior describ=
ed in the hardware specification.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; For these reasons this patch replace=
s i915_cache_level with PAT index. Also</div>
<div class=3D"ContentPasted0">&gt;&gt; note, the cache_level is not complet=
ely removed yet, because the KMD still</div>
<div class=3D"ContentPasted0">&gt;&gt; has the need of creating buffer obje=
cts with simple cache settings such as</div>
<div class=3D"ContentPasted0">&gt;&gt; cached, uncached, or writethrough. F=
or kernel objects, cache_level is used</div>
<div class=3D"ContentPasted0">&gt;&gt; for simplicity and backward compatib=
ility. For Pre-gen12 platforms PAT can</div>
<div class=3D"ContentPasted0">&gt;&gt; have 1:1 mapping to i915_cache_level=
, so these two are interchangeable. see</div>
<div class=3D"ContentPasted0">&gt;&gt; the use of LEGACY_CACHELEVEL.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; One consequence of this change is th=
at gen8_pte_encode is no longer working</div>
<div class=3D"ContentPasted0">&gt;&gt; for gen12 platforms due to the fact =
that gen12 platforms has different PAT</div>
<div class=3D"ContentPasted0">&gt;&gt; definitions. In the meantime the mtl=
_pte_encode introduced specfically for</div>
<div class=3D"ContentPasted0">&gt;&gt; MTL becomes generic for all gen12 pl=
atforms. This patch renames the MTL</div>
<div class=3D"ContentPasted0">&gt;&gt; PTE encode function into gen12_pte_e=
ncode and apply it to all gen12. Even</div>
<div class=3D"ContentPasted0">&gt;&gt; though this change looks unrelated, =
but separating them would temporarily</div>
<div class=3D"ContentPasted0">&gt;&gt; break gen12 PTE encoding, thus squas=
h them in one patch.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Special note: this patch changes the=
 way caching behavior is controlled in</div>
<div class=3D"ContentPasted0">&gt;&gt; the sense that some objects are left=
 to be managed by userspace. For such</div>
<div class=3D"ContentPasted0">&gt;&gt; objects we need to be careful not to=
 change the userspace settings.There</div>
<div class=3D"ContentPasted0">&gt;&gt; are kerneldoc and comments added aro=
und obj-&gt;cache_coherent, cache_dirty,</div>
<div class=3D"ContentPasted0">&gt;&gt; and how to bypass the checkings by i=
915_gem_object_has_cache_level. For</div>
<div class=3D"ContentPasted0">&gt;&gt; full understanding, these changes ne=
ed to be looked at together with the</div>
<div class=3D"ContentPasted0">&gt;&gt; two follow-up patches, one disables =
the {set|get}_caching ioctl's and the</div>
<div class=3D"ContentPasted0">&gt;&gt; other adds set_pat extension to the =
GEM_CREATE uAPI.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Bspec: 63019</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Matt Roper &lt;matthew.=
d.roper@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; To be squashed</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/display/=
intel_dpt.c &nbsp; &nbsp; &nbsp;| 12 +--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_domain.c &nbsp; &nbsp;| 58 +++++++++----</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/i915_gem=
_execbuffer.c &nbsp; &nbsp;| 15 +++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_mman.c &nbsp; &nbsp; &nbsp;| 11 ++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.c &nbsp; &nbsp;| 51 ++++++++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.h &nbsp; &nbsp;| &nbsp;4 +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/i915_gem=
_object_types.h &nbsp;| 44 +++++++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_stolen.c &nbsp; &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_ttm_move.c &nbsp;| &nbsp;8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../gpu/drm/i915/gem/selftest=
s/huge_pages.c &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../drm/i915/gem/selftests/i9=
15_gem_migrate.c | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../drm/i915/gem/selftests/i9=
15_gem_mman.c &nbsp; &nbsp;| &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen6_=
ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 10 ++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 84 +++++++++----------</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/gen8_=
ppgtt.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;3 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_ggtt.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 82 +++++++++---------</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_gtt.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 18 ++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_migrate.c &nbsp; &nbsp; &nbsp; | 47 ++++++-----</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_migrate.h &nbsp; &nbsp; &nbsp; | 13 ++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/intel=
_ppgtt.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_migrate.c &nbsp; &nbsp;| 47 ++++++-----</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_reset.c &nbsp; &nbsp; &nbsp;| &nbsp;8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_timeline.c &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/selft=
est_tlb.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gt/uc/in=
tel_uc_fw.c &nbsp; &nbsp; &nbsp;| 10 ++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_deb=
ugfs.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 53 +++++++++---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_gem=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 27 +++++-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_gpu=
_error.c &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 16 ++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/i915_vma=
_types.h &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 -</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/i915_gem.c &nbsp; &nbsp; | &nbsp;5 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../gpu/drm/i915/selftests/i9=
15_gem_evict.c &nbsp; | &nbsp;4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/i915_gem_gtt.c | 15 ++--</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; .../drm/i915/selftests/intel_=
memory_region.c &nbsp;| &nbsp;4 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/selftest=
s/mock_gtt.c &nbsp; &nbsp; | &nbsp;8 +-</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; 36 files changed, 451 inserti=
ons(+), 238 deletions(-)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/di=
splay/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index c5eacfdba1a5..7c5fddb203ba 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/display/i=
ntel_dpt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -43,24 +43,24 @@ static void gen8=
_set_pte(void __iomem *addr, gen8_pte_t pte)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void dpt_insert_page(s=
truct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_t add=
r,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 offset,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level lev=
el,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_dpt *dpt =3D i915_vm_to_dpt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *base =3D dpt-&gt;iomem;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_set_=
pte(base + offset / I915_GTT_PAGE_SIZE,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;pte_encode(addr, level, flags));</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;pte_encode(addr, pat_index, flags));</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void dpt_insert_entrie=
s(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct=
 i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_ca=
che_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 fl=
ags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_dpt *dpt =3D i915_vm_to_dpt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *base =3D dpt-&gt;iomem;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct sg=
t_iter sgt_iter;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_=
t addr;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;int i;</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; @@ -83,7 +83,7 @@ static void dpt_cl=
ear_range(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void dpt_bind_vma(stru=
ct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vm_pt_stash *st=
ash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_resource *v=
ma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cache_level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 pte_f=
lags;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -98,7 +98,7 @@ static void dpt_bi=
nd_vma(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (vma_r=
es-&gt;bi.lmem)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, cache_level, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, pat_index, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vma_res-&=
gt;page_sizes_gtt =3D I915_GTT_PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index d2d5a24301b2..05107a6efe45 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_domain.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -27,8 +27,15 @@ static bool gpu_w=
rite_needs_clflush(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_DG=
FX(i915))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; return !(obj-&gt;cac=
he_level =3D=3D I915_CACHE_NONE ||</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;obj-&gt;cache_level =3D=3D I915_CACHE_WT);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For objects =
created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by set_p=
at extension, i915_gem_object_has_cache_level() will</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* always retur=
n true, because the coherency of such object is managed</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* by userspace=
. Othereise the call here would fall back to checking</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* whether the =
object is un-cached or write-through.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return !(i915_gem_ob=
ject_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;i915_gem_object_has_cache_level(obj, I915_CACHE_WT));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; bool i915_gem_cpu_write_needs=
_clflush(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -267,7 +274,13 @@ int i915_gem_ob=
ject_set_cache_level(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;int ret;<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (obj-&gt;cache_le=
vel =3D=3D cache_level)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For objects =
created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by set_p=
at extension, simply return 0 here without touching</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* the cache se=
tting, because such objects should have an immutable</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* cache settin=
g by desgin and always managed by userspace.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (i915_gem_object_=
has_cache_level(obj, cache_level))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D i=
915_gem_object_wait(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -278,10 +291,8 @@ int i915_gem_ob=
ject_set_cache_level(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return ret;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Always=
 invalidate stale cachelines */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (obj-&gt;cache_le=
vel !=3D cache_level) {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_object_set_cache_coherency(obj, cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;cache_dirty =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; i915_gem_object_set_=
cache_coherency(obj, cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;cache_dirty =
=3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* The ca=
che-level will be applied when each vma is rebound. */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return i9=
15_gem_object_unbind(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -306,20 +317,22 @@ int i915_gem_g=
et_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; switch (obj-&gt;cach=
e_level) {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_LLC:=
</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_L3_L=
LC:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; args-&gt;caching =3D I915_CACHING_CACHED;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* This ioctl s=
hould be disabled for the objects with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by user =
space.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; err =3D -EOPNOTSUPP;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_WT:<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (i915_gem_object_=
has_cache_level(obj, I915_CACHE_LLC) ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; i915_g=
em_object_has_cache_level(obj, I915_CACHE_L3_LLC))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; args-&gt;caching =3D I915_CACHING_CACHED;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else if (i915_gem_ob=
ject_has_cache_level(obj, I915_CACHE_WT))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;args-&gt;caching =3D I915_CACHING_DISPLAY;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; -</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; default:</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;args-&gt;caching =3D I915_CACHING_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; out:</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;rcu_read_=
unlock();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return er=
r;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -364,6 +377,15 @@ int i915_gem_se=
t_caching_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!obj)=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return -ENOENT;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* This ioctl s=
hould be disabled for the objects with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by user =
space.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ret =3D -EOPNOTSUPP;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * The ca=
ching mode of proxy object is handled by its generator, and</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * not al=
lowed to be changed by userspace.</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; index 3aeede6aee4d..5fb459ea4294 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_execbuffer.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_execbuffer.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -640,9 +640,15 @@ static inline i=
nt use_cpu_reloc(const struct reloc_cache *cache,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (DBG_F=
ORCE_RELOC =3D=3D FORCE_GTT_RELOC)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For objects =
created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by set_p=
at extension, i915_gem_object_has_cache_level() always</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* return true,=
 otherwise the call would fall back to checking whether</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* the object i=
s un-cached.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return (c=
ache-&gt;has_llc ||</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;obj-&gt;cache_dirty ||</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;cache_level !=3D I915_CACHE_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int eb_reserve_vma(str=
uct i915_execbuffer *eb,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1324,7 +1330,10 @@ static void *=
reloc_iomap(struct i915_vma *batch,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (drm_m=
m_node_allocated(&amp;cache-&gt;node)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; i915_gem_object_get_dma_address(obj, page),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;offset, I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(ggtt-&gt;vm.i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;} else {<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;offset +=3D page &lt;&lt; PAGE_SHIFT;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1464,7 +1473,7 @@ eb_relocate_en=
try(struct i915_execbuffer *eb,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reloc_cache_unmap(&amp;eb-&g=
t;reloc_cache);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mutex_lock(&amp;vma-&gt;vm-&=
gt;mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i915_vma_bind(target=
-&gt;vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; target-&gt;vma-&gt;obj-&gt;cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; target-&gt;vma-&gt;obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PIN_GLOBAL, NULL, NULL);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mutex_unlock(&amp;vma-&gt;vm=
-&gt;mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reloc_cache_remap(&amp;eb-&g=
t;reloc_cache, ev-&gt;vma-&gt;obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 3dbacdf0911a..4e7a838ab7bd 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_mman.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_mman.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -383,7 +383,16 @@ static vm_fault=
_t vm_fault_gtt(struct vm_fault *vmf)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Access=
 to snoopable pages through the GTT is incoherent. */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (obj-&gt;cache_le=
vel !=3D I915_CACHE_NONE &amp;&amp; !HAS_LLC(i915)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For objects =
created by userspace through GEM_CREATE with pat_index</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* set by set_p=
at extension, coherency is managed by userspace, make</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* sure we don'=
t fail handling the vm fault by calling</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* i915_gem_obj=
ect_has_cache_level() which always return true for such</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* objects. Oth=
erwise this helper function would fall back to checking</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* whether the =
object is un-cached.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (!(i915_gem_objec=
t_has_cache_level(obj, I915_CACHE_NONE) ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 HAS_LLC(i915))) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ret =3D -EFAULT;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto err_unpin;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 8c70a0ec7d2f..46a19b099ec8 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -54,6 +54,24 @@ unsigned int i915=
_gem_get_pat_index(struct drm_i915_private *i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return IN=
TEL_INFO(i915)-&gt;cachelevel_to_pat[level];</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +bool i915_gem_object_has_cache_leve=
l(const struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum i915_cache_level lvl)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* In case the =
pat_index is set by user space, this kernel mode</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* driver shoul=
d leave the coherency to be managed by user space,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* simply retur=
n true here.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return true;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Otherwise th=
e pat_index should have been converted from cache_level</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* so that the =
following comparison is valid.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return obj-&gt;pat_i=
ndex =3D=3D i915_gem_get_pat_index(obj_to_i915(obj), lvl);</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct drm_i915_gem_object *i=
915_gem_object_alloc(void)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_object *obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -133,7 +151,7 @@ void i915_gem_ob=
ject_set_cache_coherency(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_private *i915 =3D to_i915(obj-&gt;base.dev);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; obj-&gt;cache_level =
=3D cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;pat_index =
=3D i915_gem_get_pat_index(i915, cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (cache=
_level !=3D I915_CACHE_NONE)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;obj-&gt;cache_coherent =3D (I915_BO_CACHE_COHERENT_FOR_R=
EAD |</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -148,6 +166,37 @@ void i915_gem_o=
bject_set_cache_coherency(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;!IS_DGFX(i915);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/**</div>
<div class=3D"ContentPasted0">&gt;&gt; + * i915_gem_object_set_pat_index - =
set PAT index to be used in PTE encode</div>
<div class=3D"ContentPasted0">&gt;&gt; + * @obj: #drm_i915_gem_object</div>
<div class=3D"ContentPasted0">&gt;&gt; + * @pat_index: PAT index</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * This is a clone of i915_gem_obje=
ct_set_cache_coherency taking pat index</div>
<div class=3D"ContentPasted0">&gt;&gt; + * instead of cache_level as its se=
cond argument.</div>
<div class=3D"ContentPasted0">&gt;&gt; + */</div>
<div class=3D"ContentPasted0">&gt;&gt; +void i915_gem_object_set_pat_index(=
struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;unsigned int pat_index)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_priv=
ate *i915 =3D to_i915(obj-&gt;base.dev);</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_inde=
x =3D=3D pat_index)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;pat_index =
=3D pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index !=3D i=
915_gem_get_pat_index(i915, I915_CACHE_NONE))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;cache_coherent =3D (I915_BO_CACHE_COHERENT_FOR_READ |</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;I915_BO_CACHE_COHERENT_FOR_WRITE);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else if (HAS_LLC(i91=
5))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;cache_coherent =3D I915_BO_CACHE_COHERENT_FOR_READ;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; else</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;cache_coherent =3D 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;cache_dirty =
=3D</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; !(obj-&gt;cache_coherent &amp; I915_BO_CACHE_COHERENT_FOR_WRITE) &a=
mp;&amp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; !IS_DGFX(i915);</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; bool i915_gem_object_can_bypa=
ss_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_private *i915 =3D to_i915(obj-&gt;base.dev);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 284e1aa396cd..884a17275b3a 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -34,6 +34,8 @@ static inline bool=
 i915_gem_object_size_2big(u64 size)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; unsigned int i915_gem_get_pat=
_index(struct drm_i915_private *i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;enum i915_cache_level level);</div>
<div class=3D"ContentPasted0">&gt;&gt; +bool i915_gem_object_has_cache_leve=
l(const struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum i915_cache_level lvl);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void i915_gem_init__objects(s=
truct drm_i915_private *i915);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void i915_objects_module_exit=
(void);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -764,6 +766,8 @@ bool i915_gem_ob=
ject_has_unknown_state(struct drm_i915_gem_object *obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void i915_gem_object_set_cach=
e_coherency(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; unsigned int cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt; +void i915_gem_object_set_pat_index(=
struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;unsigned int pat_index);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; bool i915_gem_object_can_bypa=
ss_llc(struct drm_i915_gem_object *obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void i915_gem_object_flush_if=
_display(struct drm_i915_gem_object *obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void i915_gem_object_flush_if=
_display_locked(struct drm_i915_gem_object *obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.=
h</div>
<div class=3D"ContentPasted0">&gt;&gt; index bf0bd8e11355..adf4c2b28135 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object_types.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object_types.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -364,15 +364,42 @@ struct drm_i91=
5_gem_object {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_BO_FLAG_STRUCT_P=
AGE BIT(0) /* Object backed by struct pages */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_BO_FLAG_IOMEM &n=
bsp; &nbsp; &nbsp; BIT(1) /* Object backed by IO memory */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/**</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp;* @cache_level=
: The desired GTT caching level.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_index: =
The desired PAT index.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* See hardware=
 specification for valid PAT indices for each platform.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* This field u=
sed to contain a value of enum i915_cache_level. It's</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* changed to a=
n unsigned int because PAT indices are being used by</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* both UMD and=
 KMD for caching policy control after GEN12.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For backward=
 compatibility, this field will continue to contain</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* value of i91=
5_cache_level for pre-GEN12 platforms so that the PTE</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* encode funct=
ions for these legacy platforms can stay the same.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* In the meant=
ime platform specific tables are created to translate</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* i915_cache_l=
evel into pat index, for more details check the macros</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* defined i915=
/i915_pci.c, e.g. PVC_CACHELEVEL.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Dunno - this still reads a bit wonky to =
me. It was unsigned int already</div>
<div class=3D"ContentPasted0">&gt; and also it does not hold i915_cache_lev=
el on legacy platforms, right?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">v8 sent with some clarification.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex:6;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_set_by_=
user: Indicate whether pat_index is set by user space</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp;* See enum i91=
5_cache_level for possible values, along with what</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp;* each does.</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* This field i=
s set to false by default, only set to true if the</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* pat_index is=
 set by user space. By design, user space is capable of</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* managing cac=
hing behavior by setting pat_index, in which case this</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* kernel mode =
driver should never touch the pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; unsigned int cache_l=
evel:3;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_set=
_by_user;</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Unsigned int:1 to fit into the bitfield =
sandwitch better?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">okay</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/**</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * @cache=
_coherent:</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Note: with t=
he change above which replaced cache_level with</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* pat_index, t=
he use of cache_coherent is limited to objects created</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* by kernel. C=
heck for @pat_set_by_user to find out if an object is</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* created by u=
serspace or kernel. A later patch will disable the</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;pat_set_by_user is not about who created =
the object, no? And it is not</div>
<div class=3D"ContentPasted0">&gt;in a later patch any longer.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* ioctl's to c=
hange cache settings for objects with pat_index set by</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* userspace. P=
lease don't assume @cache_coherent having the flags set</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* as describe =
here for these objects. Also see the helper function</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* i915_gem_obj=
ect_has_cache_level() for possible ways to bypass the</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* use of this =
field.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Track =
whether the pages are coherent with the GPU if reading or</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * writin=
g through the CPU caches. The largely depends on the</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * @cache=
_level setting.</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -446,6 +473,15 @@ struct drm_i915=
_gem_object {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/**</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * @cache=
_dirty:</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Note: with t=
he change above which replaced cache_level with</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* pat_index, t=
he use of cache_dirty is limited to objects created</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* by kernel. C=
heck for @pat_set_by_user to find out if an object is</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* created by u=
serspace or kernel. A later patch will disable the</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* ioctl's to c=
hange cache settings for objects with pat_index set by</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* userspace. P=
lease don't assume @cache_dirty is set as describe here</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* for these ob=
jects. Also see i915_gem_object_has_cache_level() for</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* possible way=
s to bypass the use of this field.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Track =
if we are we dirty with writes through the CPU cache for this</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * object=
. As a result reading directly from main memory might yield</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * stale =
data.</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index ee492d823f1b..3b094d36a0b0 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_stolen.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_stolen.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -565,7 +565,9 @@ static void dbg_=
poison(struct i915_ggtt *ggtt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; ggtt-&gt;error_capture.start,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(ggtt-&gt;vm.i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;mb();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;s =3D io_mapping_map_wc(&amp;ggtt-&gt;iomap,</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 69eb20ed4d47..7078af2f8f79 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_ttm_move.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_ttm_move.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -214,7 +214,8 @@ static struct dm=
a_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;intel_engine_pm_get(to_gt(i915)-&gt;migrate.context-&gt;=
engine);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ret =3D intel_context_migrate_clear(to_gt(i915)-&gt;migr=
ate.context, deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst_st-&gt;sgl, dst_lev=
el,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst_st-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(=
i915, dst_level),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_ttm_gtt=
_binds_lmem(dst_mem),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0, &amp;rq);=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;} else {<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -228,9 +229,10 @@ static struct d=
ma_fence *i915_ttm_accel_move(struct ttm_buffer_object *bo,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;intel_engine_pm_get(to_gt(i915)-&gt;migrate.context-&gt;=
engine);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ret =3D intel_context_migrate_copy(to_gt(i915)-&gt;migra=
te.context,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; deps, src_rsgt-&gt=
;table.sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;src_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(i=
915, src_level),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_ttm_gtt_binds=
_lmem(bo-&gt;resource),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst_st-&gt;sgl, dst_leve=
l,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst_st-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(i=
915, dst_level),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_ttm_gtt_binds=
_lmem(dst_mem),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; index d1057574e966..df6c9a84252c 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/selft=
ests/huge_pages.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/selft=
ests/huge_pages.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -354,7 +354,7 @@ fake_huge_pages_=
object(struct drm_i915_private *i915, u64 size, bool single)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;w=
rite_domain =3D I915_GEM_DOMAIN_CPU;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;r=
ead_domains =3D I915_GEM_DOMAIN_CPU;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; obj-&gt;cache_level =
=3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;pat_index =
=3D i915_gem_get_pat_index(i915, I915_CACHE_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return ob=
j;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_ge=
m_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index fe6c37fd7859..a93a90b15907 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/selft=
ests/i915_gem_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/selft=
ests/i915_gem_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -219,7 +219,7 @@ static int __igt=
_lmem_pages_migrate(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;err =3D intel_migrate_clear(&amp;gt-&gt;migrate, &amp;ww=
, deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl, obj-&gt;cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl, obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(obj),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0xdeadbeaf, &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (rq) {</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_m=
man.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 56279908ed30..a93d8f9f8bc1 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/selft=
ests/i915_gem_mman.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/selft=
ests/i915_gem_mman.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1222,7 +1222,7 @@ static int __i=
gt_mmap_migrate(struct intel_memory_region **placements,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
ntel_context_migrate_clear(to_gt(i915)-&gt;migrate.context, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl, obj-&gt;cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl, obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(obj),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;expand32(POISON_INUSE), &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_=
object_unpin_pages(obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 5aaacc53fa4c..c2bdc133c89a 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen6_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen6_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -109,7 +109,7 @@ static void gen6=
_ppgtt_clear_range(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen6_ppgtt_insert=
_entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ppgtt *ppgtt =3D i915_vm_to_ppgtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -117,7 +117,7 @@ static void gen6=
_ppgtt_insert_entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int first_entry =3D vma_res-&gt;start / I915_GTT_PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int act_pt =3D first_entry / GEN6_PTES;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int act_pte =3D first_entry % GEN6_PTES;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const u32 pte_encode=
 =3D vm-&gt;pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const u32 pte_encode=
 =3D vm-&gt;pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct sg=
t_dma iter =3D sgt_dma(vma_res);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen6_pte_=
t *vaddr;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -227,7 +227,9 @@ static int gen6_=
ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;sc=
ratch[0]-&gt;encode =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vm-&gt;pte_encode(px_dma(vm-&gt;scratch[0]),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_N=
ONE, PTE_READ_ONLY);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get=
_pat_index(vm-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACH=
E_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PTE_READ_ONL=
Y);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;sc=
ratch[1] =3D vm-&gt;alloc_pt_dma(vm, I915_GTT_PAGE_SIZE_4K);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_ER=
R(vm-&gt;scratch[1])) {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -278,7 +280,7 @@ static void gen6=
_ppgtt_cleanup(struct i915_address_space *vm)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void pd_vma_bind(struc=
t i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vm_pt_stash *sta=
sh,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vm=
a_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 unused)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index bb6998d67133..f948d33e5ec5 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -29,7 +29,7 @@ static u64 gen8_pd=
e_encode(const dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static u64 gen8_pte_encode(dm=
a_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level leve=
l,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -40,7 +40,12 @@ static u64 gen8_p=
te_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; PTE_LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D GEN12_PPGTT_PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For pre-gen1=
2 platforms pat_index is the same as enum</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* i915_cache_l=
evel, so the switch-case here is still valid.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* See translat=
ion table defined by LEGACY_CACHELEVEL.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; switch (pat_index) {=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;case I915=
_CACHE_NONE:</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D PPAT_UNCACHED;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -55,9 +60,9 @@ static u64 gen8_pt=
e_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return pt=
e;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -static u64 mtl_pte_encode(dma_addr_=
t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; +static u64 gen12_pte_encode(dma_add=
r_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -67,24 +72,17 @@ static u64 mtl_p=
te_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; PTE_LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D GEN12_PPGTT_PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_NONE=
:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_LLC:=
</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_L3_L=
LC:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_WT:<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(0))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D GEN12_PPGTT_PTE_PAT0;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; default:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* This should never happen. Added to deal with the compile</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;* error due to the addition of I915_MAX_CACHE_LEVEL. Will</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;* be removed by the pat_index patch.</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(1))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(2))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D GEN12_PPGTT_PTE_PAT2;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(3))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_PPGTT_PTE_PAT3;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return pt=
e;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -457,11 +455,11 @@ gen8_ppgtt_ins=
ert_pte(struct i915_ppgtt *ppgtt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_page_directory *pdp,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sgt_dma *iter,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 idx,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_page_directory *pd;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ppgtt-&gt;vm.pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ppgtt-&gt;vm.pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t *vaddr;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;pd =3D i9=
15_pd_entry(pdp, gen8_pd_index(idx, 2));</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -504,10 +502,10 @@ static void</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; xehpsdv_ppgtt_insert_huge(str=
uct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resou=
rce *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sgt_dma *iter,=
</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_leve=
l,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int rem =3D sg_dma_len(iter-&gt;sg);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 start=
 =3D vma_res-&gt;start;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 end =
=3D start + vma_res-&gt;vma_size;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -612,10 +610,10 @@ xehpsdv_ppgtt_=
insert_huge(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ppgtt_insert=
_huge(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; struct sgt_dma *iter,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D vm-&gt;pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int rem =3D sg_dma_len(iter-&gt;sg);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 start=
 =3D vma_res-&gt;start;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -735,7 +733,7 @@ static void gen8=
_ppgtt_insert_huge(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ppgtt_insert=
(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct =
i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_le=
vel cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_i=
ndex,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 fla=
gs)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ppgtt * const ppgtt =3D i915_vm_to_ppgtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -743,9 +741,9 @@ static void gen8=
_ppgtt_insert(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (vma_r=
es-&gt;bi.page_sizes.sg &gt; I915_GTT_PAGE_SIZE) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (GRAPHICS_VER_FULL(vm-&gt;i915) &gt;=3D IP_VER(12, 50=
))</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xehpsdv_ppgtt_insert_huge(vm, vma_res, =
&amp;iter, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xehpsdv_ppgtt_insert_huge(vm, vma_res, =
&amp;iter, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;else</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gen8_ppgtt_insert_huge(vm, vma_res, &am=
p;iter, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gen8_ppgtt_insert_huge(vm, vma_res, &am=
p;iter, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;} else &n=
bsp;{</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;u64 idx =3D vma_res-&gt;start &gt;&gt; GEN8_PTE_SHIFT;</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -754,7 +752,7 @@ static void gen8=
_ppgtt_insert(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
gen8_pdp_for_page_index(vm, idx);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;idx =3D gen8_ppgtt_insert_pt=
e(ppgtt, pdp, &amp;iter, idx,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cache_level, fla=
gs);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pat_index, flags=
);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;} while (idx);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vma_res-&gt;page_sizes_gtt =3D I915_GTT_PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -764,7 +762,7 @@ static void gen8=
_ppgtt_insert(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ppgtt_insert=
_entry(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 idx =
=3D offset &gt;&gt; GEN8_PTE_SHIFT;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -778,14 +776,14 @@ static void ge=
n8_ppgtt_insert_entry(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(pt-&gt;is_compact);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vaddr =3D=
 px_vaddr(pt);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0)] =3D vm-&gt;pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0)] =3D vm-&gt;pte_encode(addr, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;drm_clflu=
sh_virt_range(&amp;vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void __xehpsdv_ppgtt_i=
nsert_entry_lm(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 idx =
=3D offset &gt;&gt; GEN8_PTE_SHIFT;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -808,20 +806,20 @@ static void __=
xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vaddr =3D=
 px_vaddr(pt);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0) / 16] =3D vm-&gt;pte_encode(addr, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vaddr[gen8_pd_index(=
idx, 0) / 16] =3D vm-&gt;pte_encode(addr, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void xehpsdv_ppgtt_ins=
ert_entry(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; PTE_LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return __xehpsdv_ppgtt_insert_entry_lm(vm, addr, offset,=
</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lev=
el, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pat=
_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; return gen8_ppgtt_in=
sert_entry(vm, addr, offset, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return gen8_ppgtt_in=
sert_entry(vm, addr, offset, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int gen8_init_scratch(=
struct i915_address_space *vm)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -856,7 +854,9 @@ static int gen8_=
init_scratch(struct i915_address_space *vm)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;sc=
ratch[0]-&gt;encode =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vm-&gt;pte_encode(px_dma(vm-&gt;scratch[0]),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_N=
ONE, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get=
_pat_index(vm-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACH=
E_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pte_flags);<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;for (i =
=3D 1; i &lt;=3D vm-&gt;top; i++) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;struct drm_i915_gem_object *obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -998,8 +998,8 @@ struct i915_ppgt=
t *gen8_ppgtt_create(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ppgtt-&gt=
;vm.alloc_scratch_dma =3D alloc_pt_dma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; if (GRAPHICS_VER_FUL=
L(gt-&gt;i915) &gt;=3D IP_VER(12, 70))</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ppgtt-&gt;vm.pte_encode =3D mtl_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (GRAPHICS_VER(gt-=
&gt;i915) &gt;=3D 12)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ppgtt-&gt;vm.pte_encode =3D gen12_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;else</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ppgtt-&gt;vm.pte_encode =3D gen8_pte_encode;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.h b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index f541d19264b4..19c635441642 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -10,13 +10,12 @@</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_address_space;</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct intel_gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; -enum i915_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_ppgtt *gen8_ppgtt=
_create(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; unsigned long lmem_pt_obj_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; u64 gen8_ggtt_pte_encode(dma_=
addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #endif</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index c8390d03fce2..2a7942fac798 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
ggtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -221,7 +221,7 @@ static void guc_=
ggtt_invalidate(struct i915_ggtt *ggtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static u64 mtl_ggtt_pte_encod=
e(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_ca=
che_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 fl=
ags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t pte =3D addr | GEN8_PAGE_PRESENT;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -231,30 +231,17 @@ static u64 mtl=
_ggtt_pte_encode(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; PTE_LM)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D GEN12_GGTT_PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; switch (level) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_NONE=
:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_LLC:=
</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_L3_L=
LC:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_WT:<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(0))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte |=3D MTL_GGTT_PTE_PAT0;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; default:</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* This should never happen. Added to deal with the compile</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;* error due to the addition of I915_MAX_CACHE_LEVEL. Will</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;* be removed by the pat_index patch.</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; break;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (pat_index &amp; =
BIT(1))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; pte |=3D MTL_GGTT_PTE_PAT1;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return pt=
e;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; u64 gen8_ggtt_pte_encode(dma_=
addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t pte =3D addr | GEN8_PAGE_PRESENT;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -273,25 +260,25 @@ static void ge=
n8_set_pte(void __iomem *addr, gen8_pte_t pte)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ggtt_insert_=
page(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum=
 i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsi=
gned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *pte =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;(gen8_pte_t __iomem *)ggtt-&gt;gsm + offset / I915_GTT_P=
AGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; gen8_set_pte(pte, gg=
tt-&gt;vm.pte_encode(addr, level, flags));</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_set_pte(pte, gg=
tt-&gt;vm.pte_encode(addr, pat_index, flags));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
invalidate(ggtt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen8_ggtt_insert_=
entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ggtt-&gt;vm.pte_encode(0, level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const gen8_pte_t pte=
_encode =3D ggtt-&gt;vm.pte_encode(0, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *gte;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen8_pte_=
t __iomem *end;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct sg=
t_iter iter;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -348,14 +335,14 @@ static void ge=
n8_ggtt_clear_range(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen6_ggtt_insert_=
page(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum=
 i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsi=
gned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;gen6_pte_=
t __iomem *pte =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;(gen6_pte_t __iomem *)ggtt-&gt;gsm + offset / I915_GTT_P=
AGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; iowrite32(vm-&gt;pte=
_encode(addr, level, flags), pte);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; iowrite32(vm-&gt;pte=
_encode(addr, pat_index, flags), pte);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
invalidate(ggtt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -368,7 +355,7 @@ static void gen6=
_ggtt_insert_page(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void gen6_ggtt_insert_=
entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_ggtt *ggtt =3D i915_vm_to_ggtt(vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -385,7 +372,7 @@ static void gen6=
_ggtt_insert_entries(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;iowrite32(vm-&gt;scratch[0]-&gt;encode, gte++);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;end +=3D =
(vma_res-&gt;node_size + vma_res-&gt;guard) / I915_GTT_PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;for_each_=
sgt_daddr(addr, iter, vma_res-&gt;bi.pages)</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; iowrite32(vm-&gt;pte_encode(addr, level, flags), gte++);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; iowrite32(vm-&gt;pte_encode(addr, pat_index, flags), gte++);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(gte &gt; end);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Fill t=
he allocated but &quot;unused&quot; space beyond the end of the buffer */</=
div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -420,14 +407,15 @@ struct insert_=
page {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_address_space *vm;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_=
t addr;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 offse=
t;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; enum i915_cache_leve=
l level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int bxt_vtd_ggtt_inser=
t_page__cb(void *_arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct in=
sert_page *arg =3D _arg;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; gen8_ggtt_insert_pag=
e(arg-&gt;vm, arg-&gt;addr, arg-&gt;offset, arg-&gt;level, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_ggtt_insert_pag=
e(arg-&gt;vm, arg-&gt;addr, arg-&gt;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; arg-&gt;pat_index,=
 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;bxt_vtd_g=
gtt_wa(arg-&gt;vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -436,10 +424,10 @@ static int bxt=
_vtd_ggtt_insert_page__cb(void *_arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void bxt_vtd_ggtt_inse=
rt_page__BKL(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 unused)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; struct insert_page a=
rg =3D { vm, addr, offset, level };</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct insert_page a=
rg =3D { vm, addr, offset, pat_index };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;stop_mach=
ine(bxt_vtd_ggtt_insert_page__cb, &amp;arg, NULL);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -447,7 +435,7 @@ static void bxt_=
vtd_ggtt_insert_page__BKL(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct insert_entries {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_address_space *vm;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_vma_resource *vma_res;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; enum i915_cache_leve=
l level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags=
;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -455,7 +443,8 @@ static int bxt_v=
td_ggtt_insert_entries__cb(void *_arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct in=
sert_entries *arg =3D _arg;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; gen8_ggtt_insert_ent=
ries(arg-&gt;vm, arg-&gt;vma_res, arg-&gt;level, arg-&gt;flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; gen8_ggtt_insert_ent=
ries(arg-&gt;vm, arg-&gt;vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;arg-&=
gt;pat_index, arg-&gt;flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;bxt_vtd_g=
gtt_wa(arg-&gt;vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -463,10 +452,10 @@ static int bxt=
_vtd_ggtt_insert_entries__cb(void *_arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void bxt_vtd_ggtt_inse=
rt_entries__BKL(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_resource *vma_re=
s,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; struct insert_entrie=
s arg =3D { vm, vma_res, level, flags };</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct insert_entrie=
s arg =3D { vm, vma_res, pat_index, flags };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;stop_mach=
ine(bxt_vtd_ggtt_insert_entries__cb, &amp;arg, NULL);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -495,7 +484,7 @@ static void gen6=
_ggtt_clear_range(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void intel_ggtt_bind_vma(stru=
ct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vm_pt_stash *st=
ash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_resource *v=
ma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cache_level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 pte_f=
lags;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -512,7 +501,7 @@ void intel_ggtt_=
bind_vma(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (vma_r=
es-&gt;bi.lmem)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, cache_level, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, pat_index, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vma_res-&=
gt;page_sizes_gtt =3D I915_GTT_PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -661,7 +650,7 @@ static int init_=
ggtt(struct i915_ggtt *ggtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void aliasing_gtt_bind=
_vma(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;struct i915_vm_pt_stash *stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum=
 i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsi=
gned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 pte_f=
lags;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -673,10 +662,10 @@ static void al=
iasing_gtt_bind_vma(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; I915_VMA_LOCAL_BIND)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ppgtt_bind_vma(&amp;i915_vm_to_ggtt(vm)-&gt;alias-&gt;vm=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stash, vma_r=
es, cache_level, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stash, vma_r=
es, pat_index, flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; I915_VMA_GLOBAL_BIND)</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; vm-&gt;insert_entries(vm, vma_res, cache_level, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; vm-&gt;insert_entries(vm, vma_res, pat_index, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vma_res-&=
gt;bound_flags |=3D flags;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -933,7 +922,9 @@ static int ggtt_=
probe_common(struct i915_ggtt *ggtt, u64 size)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;=
vm.scratch[0]-&gt;encode =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.pte_encode(px_dma(ggtt-&gt;vm.scratch[0]),</=
div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; I915_CACHE_NONE, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1022,6 +1013,11 @@ static int ge=
n8_gmch_probe(struct i915_ggtt *ggtt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return gg=
tt_probe_common(ggtt, size);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/*</div>
<div class=3D"ContentPasted0">&gt;&gt; + * For pre-gen8 platforms pat_index=
 is the same as enum i915_cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * so these PTE encode functions ar=
e left with using cache_level.</div>
<div class=3D"ContentPasted0">&gt;&gt; + * See translation table LEGACY_CAC=
HELEVEL.</div>
<div class=3D"ContentPasted0">&gt;&gt; + */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static u64 snb_pte_encode(dma=
_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level=
 level,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1302,7 +1298,9 @@ bool i915_ggtt=
_resume_vm(struct i915_address_space *vm)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vma-&gt;resource-&gt;bound_flags =3D 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vma-&gt;ops-&gt;bind_vma(vm, NULL, vma-&gt;resource,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj ? obj-&gt;cache_level : 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj ? obj-&gt;pat_index :</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(vm-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; was_bound);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (obj) { /* only used during resume =3D&gt; exclusive =
access */</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 9aff343beaa8..4d6296cdbcfd 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
gtt.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -163,8 +163,6 @@ typedef u64 gen8=
_pte_t;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define MTL_3_COH_2W &nbsp; &=
nbsp; &nbsp; &nbsp;REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define MTL_2_COH_1W &nbsp; &=
nbsp; &nbsp; &nbsp;REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -enum i915_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; -</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct drm_i915_gem_object;</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_fence_reg;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -232,7 +230,7 @@ struct i915_vma_=
ops {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*bi=
nd_vma)(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vm_pt_stash *st=
ash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_resource *v=
ma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cache_level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Unmap =
an object from an address space. This usually consists of</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -304,7 +302,7 @@ struct i915_addr=
ess_space {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;(*alloc_scratch_dma)(struct i915_address_space *vm, int =
sz);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 (*pte=
_encode)(dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level level,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags); /* Create=
 a valid PTE */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define PTE_READ_ONLY &nbsp; =
&nbsp; &nbsp; BIT(0)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define PTE_LM &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BIT(1)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -319,20 +317,20 @@ struct i915_ad=
dress_space {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*in=
sert_page)(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dma_addr_t add=
r,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 offset,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cac=
he_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags);</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*in=
sert_entries)(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct=
 i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_ca=
che_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 fl=
ags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*ra=
w_insert_page)(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
dma_addr_t addr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_c=
ache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned in=
t pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*ra=
w_insert_entries)(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;void (*cl=
eanup)(struct i915_address_space *vm);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -579,7 +577,7 @@ void ppgtt_init(=
struct i915_ppgtt *ppgtt, struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void intel_ggtt_bind_vma(stru=
ct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vm_pt_stash *st=
ash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_resource *v=
ma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cache_level=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void intel_ggtt_unbind_vma(st=
ruct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_reso=
urce *vma_res);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -657,7 +655,7 @@ void gen6_ggtt_i=
nvalidate(struct i915_ggtt *ggtt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void ppgtt_bind_vma(struct i9=
15_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vm_pt_stash *stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void ppgtt_unbind_vma(struct =
i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res);=
</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index e0998879a0e1..6023288b0e2d 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -45,7 +45,9 @@ static void xehpsd=
v_toggle_pdes(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Insert=
 a dummy PTE into every PT that will map to LMEM to ensure</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * we hav=
e a correctly setup PDE structure for later use.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_page(v=
m, 0, d-&gt;offset, I915_CACHE_NONE, PTE_LM);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_page(v=
m, 0, d-&gt;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(vm-&gt;i915, I91=
5_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PTE_LM);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(!pt-&gt;is_compact);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;d-&gt;off=
set +=3D SZ_2M;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -63,7 +65,9 @@ static void xehpsd=
v_insert_pte(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * alignm=
ent is 64K underneath for the pt, and we are careful</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * not to=
 access the space in the void.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_page(v=
m, px_dma(pt), d-&gt;offset, I915_CACHE_NONE, PTE_LM);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_page(v=
m, px_dma(pt), d-&gt;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(vm-&gt;i915, I91=
5_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PTE_LM);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;d-&gt;off=
set +=3D SZ_64K;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -73,7 +77,8 @@ static void insert=
_pte(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct in=
sert_pte_data *d =3D data;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_page(v=
m, px_dma(pt), d-&gt;offset, I915_CACHE_NONE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_page(v=
m, px_dma(pt), d-&gt;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(vm-&gt;i915, I91=
5_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(pt-&=
gt;base) ? PTE_LM : 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;d-&gt;off=
set +=3D PAGE_SIZE;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -356,13 +361,13 @@ static int max=
_pte_pkt_size(struct i915_request *rq, int pkt)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int emit_pte(struct i9=
15_request *rq,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct sgt_dma *it,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int length)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;bool has_=
64K_pages =3D HAS_64K_PAGES(rq-&gt;engine-&gt;i915);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; const u64 encode =3D=
 rq-&gt;context-&gt;vm-&gt;pte_encode(0, cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const u64 encode =3D=
 rq-&gt;context-&gt;vm-&gt;pte_encode(0, pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; is_lmem ? PTE_LM : 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct in=
tel_ring *ring =3D rq-&gt;ring;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;int pkt, =
dword_length;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -673,17 +678,17 @@ int</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; intel_context_migrate_copy(st=
ruct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct i915_de=
ps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *=
src,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level src_=
cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int src_pat_index=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool src_is_lmem,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *=
dst,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level dst_=
cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int dst_pat_index=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool dst_is_lmem,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_request =
**out)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct sg=
t_dma it_src =3D sg_sgt(src), it_dst =3D sg_sgt(dst), it_ccs;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_private *i915 =3D ce-&gt;engine-&gt;i915;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u64 ccs_b=
ytes_to_cpy =3D 0, bytes_to_cpy;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; enum i915_cache_leve=
l ccs_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int ccs_pat=
_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 src_o=
ffset, dst_offset;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u8 src_ac=
cess, dst_access;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_request *rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -707,12 +712,12 @@ intel_context_=
migrate_copy(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;dst_sz =3D scatter_list_length(dst);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (src_is_lmem) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;it_ccs =3D it_dst;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ccs_cache_level =3D dst_cache_level;</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ccs_pat_index =3D dst_pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ccs_is_src =3D false;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;} else if (dst_is_lmem) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bytes_to_cpy =3D dst_sz;</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;it_ccs =3D it_src;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ccs_cache_level =3D src_cache_level;</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ccs_pat_index =3D src_pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ccs_is_src =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -773,7 +778,7 @@ intel_context_mi=
grate_copy(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;src_sz =3D calculate_chunk_sz(i915, src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bytes_to_cpy, ccs_bytes_to_cpy);<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it_src, src_cache_level, src_is_lmem,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it_src, src_pat_index, src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; src_of=
fset, src_sz);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (!len) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -784,7 +789,7 @@ intel_context_mi=
grate_copy(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; err =3D emit_pte(rq, &amp;it_dst, dst_cache_level, dst_is_lmem,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; err =3D emit_pte(rq, &amp;it_dst, dst_pat_index, dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst_of=
fset, len);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (err &lt; 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -811,7 +816,7 @@ intel_context_mi=
grate_copy(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ccs_sz =3D GET_CCS_BYTES(i91=
5, len);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err =3D emit_pte(rq, &amp;it_ccs, ccs_c=
ache_level, false,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; err =3D emit_pte(rq, &amp;it_ccs, ccs_p=
at_index, false,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; ccs_is_src ? src_offset : dst_offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; ccs_sz);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (err &lt; 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -979,7 +984,7 @@ int</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; intel_context_migrate_clear(s=
truct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const struct i=
915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct scatter=
list *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cac=
he_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 value,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_re=
quest **out)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1027,7 +1032,7 @@ intel_context_=
migrate_clear(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (err)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it, cache_level, is_lmem, offset, CHUNK_S=
Z);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it, pat_index, is_lmem, offset, CHUNK_SZ)=
;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (len &lt;=3D 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D len;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1074,10 +1079,10 @@ int intel_mi=
grate_copy(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct i915_deps *deps,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *src,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level src_cache_level,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int src_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *dst,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level dst_cache_level,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int dst_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_request **out)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1098,8 +1103,8 @@ int intel_migr=
ate_copy(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
ntel_context_migrate_copy(ce, deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;src, src_cache_level, src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;dst, dst_cache_level, dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;src, src_pat_index, src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;dst, dst_pat_index, dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;intel_con=
text_unpin(ce);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1113,7 +1118,7 @@ intel_migrate_=
clear(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const struct i915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct scatterlist *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 value,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_request **out)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1134,7 +1139,7 @@ intel_migrate_=
clear(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (err)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; err =3D intel_contex=
t_migrate_clear(ce, deps, sg, cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; err =3D intel_contex=
t_migrate_clear(ce, deps, sg, pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;is_lmem, value, out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;intel_con=
text_unpin(ce);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_migrate.h b/drivers/gpu/drm/i915/gt/intel_migrate.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index ccc677ec4aa3..11fc09a00c4b 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
migrate.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
migrate.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -16,7 +16,6 @@ struct i915_reques=
t;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_gem_ww_ctx;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct intel_gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct scatterlist;</div>
<div class=3D"ContentPasted0">&gt;&gt; -enum i915_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; int intel_migrate_init(struct=
 intel_migrate *m, struct intel_gt *gt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -26,20 +25,20 @@ int intel_migrat=
e_copy(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct i915_deps *deps,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *src,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level src_cache_level,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int src_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *dst,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level dst_cache_level,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int dst_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_request **out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; int intel_context_migrate_cop=
y(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const =
struct i915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct=
 scatterlist *src,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_ca=
che_level src_cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 src_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool s=
rc_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct=
 scatterlist *dst,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_ca=
che_level dst_cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 dst_pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool d=
st_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct=
 i915_request **out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -48,7 +47,7 @@ intel_migrate_clea=
r(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const struct i915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct scatterlist *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 value,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_request **out);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -56,7 +55,7 @@ int</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; intel_context_migrate_clear(s=
truct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const struct i=
915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct scatter=
list *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cac=
he_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 value,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_re=
quest **out);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 7ecfa672f738..436756bfbb1a 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_=
ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_=
ppgtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -181,7 +181,7 @@ struct i915_ppgt=
t *i915_ppgtt_create(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void ppgtt_bind_vma(struct i9=
15_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vm_pt_stash *stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;u32 pte_f=
lags;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -199,7 +199,7 @@ void ppgtt_bind_=
vma(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (vma_r=
es-&gt;bi.lmem)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, cache_level, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; vm-&gt;insert_entrie=
s(vm, vma_res, pat_index, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;wmb();</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index e677f2da093d..3def5ca72dec 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selfte=
st_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selfte=
st_migrate.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -137,7 +137,7 @@ static int copy(=
struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int intel_context_copy=
_ccs(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;const struct i915_deps *deps,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;struct scatterlist *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum=
 i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsi=
gned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;bool write_to_ccs,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;struct i915_request **out)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -185,7 +185,7 @@ static int intel=
_context_copy_ccs(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (err)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it, cache_level, true, offset, CHUNK_SZ);=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; len =3D emit_pte(rq, &amp;it, pat_index, true, offset, CHUNK_SZ);</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (len &lt;=3D 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D len;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -223,7 +223,7 @@ intel_migrate_cc=
s_copy(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct i915_deps *deps,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool write_to_ccs,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_request **out)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -243,7 +243,7 @@ intel_migrate_cc=
s_copy(struct intel_migrate *m,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (err)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto out;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; err =3D intel_contex=
t_copy_ccs(ce, deps, sg, cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; err =3D intel_contex=
t_copy_ccs(ce, deps, sg, pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; write_to_ccs, out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;intel_con=
text_unpin(ce);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -300,7 +300,7 @@ static int clear=
(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Write the obj data into c=
cs surface */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D intel_migrate_ccs_co=
py(migrate, &amp;ww, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-=
&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;ca=
che_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;pa=
t_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; true=
, &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rq &amp;&amp; !err) {</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
if (i915_request_wait(rq, 0, HZ) &lt; 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -351,7 +351,7 @@ static int clear=
(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;err =3D intel_migrate_ccs_co=
py(migrate, &amp;ww, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-=
&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;ca=
che_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;pa=
t_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fals=
e, &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rq &amp;&amp; !err) {</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
if (i915_request_wait(rq, 0, HZ) &lt; 0) {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -414,9 +414,9 @@ static int __mig=
rate_copy(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_request *=
*out)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return in=
tel_migrate_copy(migrate, ww, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; src-=
&gt;mm.pages-&gt;sgl, src-&gt;cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; src-=
&gt;mm.pages-&gt;sgl, src-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;i915_gem_object_is_lmem(src),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst-=
&gt;mm.pages-&gt;sgl, dst-&gt;cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst-=
&gt;mm.pages-&gt;sgl, dst-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;i915_gem_object_is_lmem(dst),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -428,9 +428,9 @@ static int __glo=
bal_copy(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_request **out)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return in=
tel_context_migrate_copy(migrate-&gt;context, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; src-&gt;mm.pages-&gt;sgl, src-&gt;cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; src-&gt;mm.pages-&gt;sgl, src-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(src),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; dst-&gt;mm.pages-&gt;sgl, dst-&gt;cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; dst-&gt;mm.pages-&gt;sgl, dst-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(dst),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -455,7 +455,7 @@ static int __mig=
rate_clear(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return in=
tel_migrate_clear(migrate, ww, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj-&gt;cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_object_is_lmem(obj),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; value, out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -468,7 +468,7 @@ static int __glo=
bal_clear(struct intel_migrate *migrate,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return in=
tel_context_migrate_clear(migrate-&gt;context, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_object_is_lmem(obj),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; value, out);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -648,7 +648,7 @@ static int live_=
emit_pte_full_ring(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;pr_info(&=
quot;%s emite_pte ring space=3D%u\n&quot;, __func__, rq-&gt;ring-&gt;space)=
;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;it =3D sg=
_sgt(obj-&gt;mm.pages-&gt;sgl);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; len =3D emit_pte(rq,=
 &amp;it, obj-&gt;cache_level, false, 0, CHUNK_SZ);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; len =3D emit_pte(rq,=
 &amp;it, obj-&gt;pat_index, false, 0, CHUNK_SZ);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!len)=
 {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;err =3D -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;goto out_rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -844,7 +844,7 @@ static int wrap_=
ktime_compare(const void *A, const void *B)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int __perf_clear_blt(s=
truct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct scatter=
list *sg,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cac=
he_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_lmem,<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size_t sz)</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -858,7 +858,7 @@ static int __per=
f_clear_blt(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;t0 =3D ktime_get();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; err =3D intel_context_migrate_clear(ce, NULL, sg, cache_level,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; err =3D intel_context_migrate_clear(ce, NULL, sg, pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;is_lmem, 0, =
&amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (rq) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (i915_request_wait(rq, 0,=
 MAX_SCHEDULE_TIMEOUT) &lt; 0)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -904,7 +904,8 @@ static int perf_=
clear_blt(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;err =3D __perf_clear_blt(gt-&gt;migrate.context,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; dst-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;I915_CACHE_NONE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; i915_gem_object_is_lmem(dst),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; sizes[i]);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -919,10 +920,10 @@ static int per=
f_clear_blt(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static int __perf_copy_blt(st=
ruct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *=
src,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level src_=
cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int src_pat_index=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool src_is_lmem,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct scatterlist *=
dst,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level dst_=
cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int dst_pat_index=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bool dst_is_lmem,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t sz)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -937,9 +938,9 @@ static int __per=
f_copy_blt(struct intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;t0 =3D ktime_get();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;err =3D intel_context_migrate_copy(ce, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;src, src_cache_level,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;src, src_pat_index,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; src_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst, dst_cache_level,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst, dst_pat_index,</div=
>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dst_is_lmem,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (rq) {</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -994,10 +995,12 @@ static int per=
f_copy_blt(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;err =3D __perf_copy_blt(gt-&gt;migrate.context,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;src-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; I915_CACHE_NONE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(src),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;dst-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; I915_CACHE_NONE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;i915_gem_object_is_lmem(dst),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;sz);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index a9e0a91bc0e0..79aa6ac66ad2 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selfte=
st_reset.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selfte=
st_reset.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -86,7 +86,9 @@ __igt_reset_stolen=
(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, dma,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; ggtt-&gt;error_capture.start,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;mb();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;s =3D io_mapping_map_wc(&amp;ggtt-&gt;iomap,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -127,7 +129,9 @@ __igt_reset_stol=
en(struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, dma,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; ggtt-&gt;error_capture.start,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;mb();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;s =3D io_mapping_map_wc(&amp;ggtt-&gt;iomap,</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 9f536c251179..39c3ec12df1a 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selfte=
st_timeline.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selfte=
st_timeline.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -836,7 +836,7 @@ static int setup=
_watcher(struct hwsp_watcher *w, struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return PTR_ERR(obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* keep t=
he same cache settings as timeline */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; i915_gem_object_set_=
cache_coherency(obj, tl-&gt;hwsp_ggtt-&gt;obj-&gt;cache_level);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; i915_gem_object_set_=
pat_index(obj, tl-&gt;hwsp_ggtt-&gt;obj-&gt;pat_index);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;w-&gt;map=
 =3D i915_gem_object_pin_map_unlocked(obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_unmask_=
bits(tl-&gt;hwsp_ggtt-&gt;obj-&gt;mm.mapping));</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_ER=
R(w-&gt;map)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/selftest_tlb.c b/drivers/gpu/drm/i915/gt/selftest_tlb.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index e6cac1f15d6e..4493c8518e91 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selfte=
st_tlb.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selfte=
st_tlb.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -36,6 +36,8 @@ pte_tlbinv(struct =
intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u=
64 length,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s=
truct rnd_state *prng)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; const unsigned int p=
at_index =3D</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_get_pat_index(ce-&gt;vm-&gt;i915, I915_CACHE_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_object *batch;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_mm_node vb_node;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_request *rq;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -155,7 +157,7 @@ pte_tlbinv(struc=
t intel_context *ce,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;/* Flip the PTE between A and B */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (i915_gem_object_is_lmem(vb-&gt;obj))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ce-&gt;vm-&gt;insert_entries(ce-&gt;vm, &amp;vb_res, 0, pte_flags);=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ce-&gt;vm-&gt;insert_entries(ce-&gt;vm, &amp;vb_res, pat_index, pte=
_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;/* Flush the PTE update to concurrent HW */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;tlbinv(ce-&gt;vm, addr &amp; -length, length);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt=
/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 4ec7df9ed5ff..e34c79120090 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/uc/int=
el_uc_fw.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/uc/int=
el_uc_fw.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -957,9 +957,15 @@ static void uc_=
fw_bind_ggtt(struct intel_uc_fw *uc_fw)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;pte_flags |=3D PTE_LM;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (ggtt-=
&gt;vm.raw_insert_entries)</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.raw_insert_entries(&amp;ggtt-&gt;vm, dummy, I915_CACHE_=
NONE, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.raw_insert_entries(&amp;ggtt-&gt;vm, dummy,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(ggtt-&gt;vm.i915,</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;else</div=
>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.insert_entries(&amp;ggtt-&gt;vm, dummy, I915_CACHE_NONE=
, pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.insert_entries(&amp;ggtt-&gt;vm, dummy,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; i915_gem_get_pat_index(ggtt-&gt;vm.i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; pte_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void uc_fw_unbind_ggtt=
(struct intel_uc_fw *uc_fw)</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 41389a32e998..76ccd4e03e31 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_debu=
gfs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_debu=
gfs.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -139,21 +139,54 @@ static const c=
har *stringify_vma_type(const struct i915_vma *vma)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return &q=
uot;ppgtt&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -static const char *i915_cache_level=
_str(struct drm_i915_private *i915, int type)</div>
<div class=3D"ContentPasted0">&gt;&gt; -{</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; switch (type) {</div=
>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_NONE=
: return &quot; uncached&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_LLC:=
 return HAS_LLC(i915) ? &quot; LLC&quot; : &quot; snooped&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_L3_L=
LC: return &quot; L3+LLC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; case I915_CACHE_WT: =
return &quot; WT&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; default: return &quo=
t;&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; +static const char *i915_cache_level=
_str(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_priv=
ate *i915 =3D obj_to_i915(obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (IS_METEORLAKE(i9=
15)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; switch (obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 0: return &quot; WB&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 1: return &quot; WT&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 2: return &quot; UC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 3: return &quot; WB (1-Way Coh)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 4: return &quot; WB (2-Way Coh)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; default: return &quot; not defined&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; } else if (IS_PONTEV=
ECCHIO(i915)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; switch (obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 0: return &quot; UC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 1: return &quot; WC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 2: return &quot; WT&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 3: return &quot; WB&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 4: return &quot; WT (CLOS1)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 5: return &quot; WB (CLOS1)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 6: return &quot; WT (CLOS2)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 7: return &quot; WT (CLOS2)&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; default: return &quot; not defined&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; } else if (GRAPHICS_=
VER(i915) &gt;=3D 12) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; switch (obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 0: return &quot; WB&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 1: return &quot; WC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 2: return &quot; WT&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 3: return &quot; UC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; default: return &quot; not defined&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; } else {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; switch (obj-&gt;pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 0: return &quot; UC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 1: return HAS_LLC(i915) ?</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot; LLC&q=
uot; : &quot; snooped&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 2: return &quot; L3+LLC&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; case 3: return &quot; WT&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; default: return &quot; not defined&quot;;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; void</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; i915_debugfs_describe_obj(str=
uct seq_file *m, struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; struct drm_i915_priv=
ate *dev_priv =3D to_i915(obj-&gt;base.dev);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_vma *vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;int pin_c=
ount =3D 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -165,7 +198,7 @@ i915_debugfs_des=
cribe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;base.size / 1024,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;read_domains,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;write_domain,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;i915_cache_level_str(dev_priv, obj-&gt;cache_level),</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;i915_cache_level_str(obj),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;mm.dirty ? &quot; dirty&quot; : &quot;&q=
uot;,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;mm.madv =3D=3D I915_MADV_DONTNEED ? &quo=
t; purgeable&quot; : &quot;&quot;);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (obj-&=
gt;base.name)</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_gem.c b/drivers/gpu/drm/i915/i915_gem.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 0a78bdbd36b1..38933c00f705 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_gem.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_gem.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -420,8 +420,11 @@ i915_gem_gtt_pr=
ead(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;page_length =3D remain &lt; page_length ? remain : page_=
length;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (drm_mm_node_allocated(&amp;node)) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp=
;ggtt-&gt;vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_get_dma_address(obj, o=
ffset &gt;&gt; PAGE_SHIFT),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;node.start, I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_get_dma_address(obj,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
ffset &gt;&gt; PAGE_SHIFT),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;node.start,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE_NONE), 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;} else {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_base +=3D offset &amp; =
PAGE_MASK;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -598,8 +601,11 @@ i915_gem_gtt_pw=
rite_fast(struct drm_i915_gem_object *obj,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* flush the write before we=
 modify the GGTT */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;intel_gt_flush_ggtt_writes(g=
gtt-&gt;vm.gt);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp=
;ggtt-&gt;vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_get_dma_address(obj, o=
ffset &gt;&gt; PAGE_SHIFT),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;node.start, I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_object_get_dma_address(obj,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;o=
ffset &gt;&gt; PAGE_SHIFT),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;node.start,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE_NONE), 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;wmb(); /* flush modification=
s to the GGTT (insert_page) */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;} else {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page_base +=3D offset &amp; =
PAGE_MASK;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1142,6 +1148,19 @@ int i915_gem_=
init(struct drm_i915_private *dev_priv)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int i;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;int ret;<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* In the procc=
ess of replacing cache_level with pat_index a tricky</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* dependency i=
s created on the definition of the enum i915_cache_level.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* in case this=
 enum is changed, PTE encode would be broken.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;_I_n</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Sorry, what does this mean?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Add a WARNIN=
G here. And remove when we completely quit using this</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* enum</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; WARN_ON_ONCE(I915_CA=
CHE_NONE !=3D 0 ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_LLC !=3D 1 ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_L3_LLC !=3D 2 ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_WT !=3D 3 ||</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;I915_MAX_CACHE_LEVEL !=3D 4);</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; I thought BUILD_BUG_ON would be better.<=
/div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Of course, don't know what I was thinking, up=
dated in v8.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* We nee=
d to fallback to 4K pages if host doesn't support huge gtt. */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (intel=
_vgpu_active(dev_priv) &amp;&amp; !intel_vgpu_has_huge_gtt(dev_priv))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;RUNTIME_INFO(dev_priv)-&gt;page_sizes =3D I915_GTT_PAGE_=
SIZE_4K;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 8ffdd7f47e93..566536499954 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_gpu_=
error.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_gpu_=
error.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1122,10 +1122,14 @@ i915_vma_cor=
edump_create(const struct intel_gt *gt,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mutex_lock(&amp;ggtt-&gt;err=
or_mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ggtt-&gt;vm.raw_insert_p=
age)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ggtt-&gt;vm.raw_insert_page(&amp;ggtt-&gt;vm, dma, slot,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;i915_gem_get_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, dma, slot,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE=
_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_g=
et_pat_index(gt-&gt;i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CA=
CHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mb();</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s =3D io_mapping_map_wc(&amp=
;ggtt-&gt;iomap, slot, PAGE_SIZE);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_vma.c b/drivers/gpu/drm/i915/i915_vma.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 20a44788999e..a814775a363d 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_vma.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_vma.=
c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -315,7 +315,7 @@ struct i915_vma_=
work {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_vma_resource *vma_res;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_object *obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_sw_dma_fence_cb cb;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; enum i915_cache_leve=
l cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int flags;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -334,7 +334,7 @@ static void __vm=
a_bind(struct dma_fence_work *work)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vma_res-&=
gt;ops-&gt;bind_vma(vma_res-&gt;vm, &amp;vw-&gt;stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vma_res, vw-=
&gt;cache_level, vw-&gt;flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vma_res, vw-=
&gt;pat_index, vw-&gt;flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void __vma_release(str=
uct dma_fence_work *work)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -426,7 +426,7 @@ i915_vma_resourc=
e_init_from_vma(struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* i915_vma_bind - Sets =
up PTEs for an VMA in it's corresponding address space.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* @vma: VMA to map</div=
>
<div class=3D"ContentPasted0">&gt;&gt; - * @cache_level: mapping cache leve=
l</div>
<div class=3D"ContentPasted0">&gt;&gt; + * @pat_index: PAT index to set in =
PTE</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* @flags: flags like gl=
obal or local mapping</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* @work: preallocated w=
orker for allocating and binding the PTE</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* @vma_res: pointer to =
a preallocated vma resource. The resource is either</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -437,7 +437,7 @@ i915_vma_resourc=
e_init_from_vma(struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* Note that DMA address=
es are also the only part of the SG table we care about.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; int i915_vma_bind(struct i915=
_vma *vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;u32 flags,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_work *work,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res)</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -507,7 +507,7 @@ int i915_vma_bin=
d(struct i915_vma *vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;struct dma_fence *prev;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;work-&gt;vma_res =3D i915_vma_resource_get(vma-&gt;resou=
rce);</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; work-&gt;cache_level =3D cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; work-&gt;pat_index =3D pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;work-&gt;flags =3D bind_flags;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -537,7 +537,7 @@ int i915_vma_bin=
d(struct i915_vma *vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ret;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; vma-&gt;ops-&gt;bind_vma(vma-&gt;vm, NULL, vma-&gt;resource, cache_=
level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; vma-&gt;ops-&gt;bind_vma(vma-&gt;vm, NULL, vma-&gt;resource, pat_in=
dex,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; bind_flags);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -814,7 +814,7 @@ i915_vma_insert(=
struct i915_vma *vma, struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;color =3D=
 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (i915_=
vm_has_cache_coloring(vma-&gt;vm))</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; color =3D vma-&gt;obj-&gt;cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; color =3D vma-&gt;obj-&gt;pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (flags=
 &amp; PIN_OFFSET_FIXED) {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;u64 offset =3D flags &amp; PIN_OFFSET_MASK;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1518,7 +1518,7 @@ int i915_vma_p=
in_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(!vma-&gt;pages);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
915_vma_bind(vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vma-&gt;obj-&gt;cache_lev=
el,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vma-&gt;obj-&gt;pat_index=
,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;flags, work, v=
ma_res);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;vma_res =
=3D NULL;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (err)<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_vma.h b/drivers/gpu/drm/i915/i915_vma.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 38c8c66ed724..9a9729205d5b 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_vma.=
h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_vma.=
h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -250,7 +250,7 @@ i915_vma_compare=
(struct i915_vma *vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; struct i915_vma_work *i915_vm=
a_work(void);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; int i915_vma_bind(struct i915=
_vma *vma,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; enum i915_cache_level cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; unsigned int pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;u32 flags,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_work *work,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;struct i915_vma_resource *vma_res);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i9=
15_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 77fda2244d16..64472b7f0e77 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_vma_=
types.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_vma_=
types.h</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -32,8 +32,6 @@</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #include &quot;gem/i915_gem_o=
bject_types.h&quot;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; -enum i915_cache_level;</div>
<div class=3D"ContentPasted0">&gt;&gt; -</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* DOC: Global GTT views=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/se=
lftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index d91d0ade8abd..61da4ed9d521 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/selftests=
/i915_gem.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/selftests=
/i915_gem.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -57,7 +57,10 @@ static void trash=
_stolen(struct drm_i915_private *i915)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;u32 __iomem *s;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;int x;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, dma, slot, I915_CACHE_NON=
E, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm, dma, slot,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;s =3D io_mapping_map_atomic_wc(&amp;ggtt-&gt;iomap, slot=
);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;for (x =3D 0; x &lt; PAGE_SIZE / sizeof(u32); x++) {</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/se=
lftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; index f68ef4074088..f8fe3681c3dc 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/selftests=
/i915_gem_evict.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/selftests=
/i915_gem_evict.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -246,7 +246,7 @@ static int igt_e=
vict_for_cache_color(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_mm_node target =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;.start =3D I915_GTT_PAGE_SIZE * 2,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;.size =3D I915_GTT_PAGE_SIZE,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .color =3D I915_CACHE_LLC,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .color =3D i915_gem_get_pat_index(gt-&gt;i915, I915_CACHE_LLC),</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_object *obj;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct i9=
15_vma *vma;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -309,7 +309,7 @@ static int igt_e=
vict_for_cache_color(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Attemp=
t to remove the first *pinned* vma, by removing the (empty)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * neighb=
our -- this should fail.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; target.color =3D I91=
5_CACHE_L3_LLC;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; target.color =3D i91=
5_gem_get_pat_index(gt-&gt;i915, I915_CACHE_L3_LLC);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;mutex_loc=
k(&amp;ggtt-&gt;vm.mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
915_gem_evict_for_node(&amp;ggtt-&gt;vm, NULL, &amp;target, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/se=
lftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c</div=
>
<div class=3D"ContentPasted0">&gt;&gt; index 154801f1c468..36940ef10108 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/selftests=
/i915_gem_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/selftests=
/i915_gem_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -135,7 +135,7 @@ fake_dma_object(=
struct drm_i915_private *i915, u64 size)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;w=
rite_domain =3D I915_GEM_DOMAIN_CPU;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;obj-&gt;r=
ead_domains =3D I915_GEM_DOMAIN_CPU;</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; obj-&gt;cache_level =
=3D I915_CACHE_NONE;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; obj-&gt;pat_index =
=3D i915_gem_get_pat_index(i915, I915_CACHE_NONE);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Preall=
ocate the &quot;backing storage&quot; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (i915_=
gem_object_pin_pages_unlocked(obj))</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -359,7 +359,9 @@ static int lowle=
vel_hole(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;with_intel_runtime_pm(vm-&gt=
;gt-&gt;uncore-&gt;rpm, wakeref)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;insert_entries=
(vm, mock_vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_NONE, =
0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i915_gem_get_pat_index(vm-&gt;i915,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;count =3D n;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1377,7 +1379,10 @@ static int ig=
t_ggtt_page(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;ggtt-&gt;vm.insert_page(&amp;ggtt-&gt;vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; i915_gem_object_get_dma_address(obj, 0),</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;offset, I915_CACHE_NONE, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;order =3D=
 i915_random_order(count, &amp;prng);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1510,7 +1515,7 @@ static int res=
erve_gtt_with_resource(struct i915_vma *vma, u64 offset)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;mutex_loc=
k(&amp;vm-&gt;mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
915_gem_gtt_reserve(vm, NULL, &amp;vma-&gt;node, obj-&gt;base.size,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; offset,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj-&gt;cache_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;obj-&gt;pat_index,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!err)=
 {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;i915_vma_resource_init_from_vma(vma_res, vma);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1690,7 +1695,7 @@ static int ins=
ert_gtt_with_resource(struct i915_vma *vma)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;mutex_loc=
k(&amp;vm-&gt;mutex);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
915_gem_gtt_insert(vm, NULL, &amp;vma-&gt;node, obj-&gt;base.size, 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-=
&gt;cache_level, 0, vm-&gt;total, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-=
&gt;pat_index, 0, vm-&gt;total, 0);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!err)=
 {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;i915_vma_resource_init_from_vma(vma_res, vma);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;vma-&gt;resource =3D vma_res;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/se=
lftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory=
_region.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 3b18e5905c86..d985d9bae2e8 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/selftests=
/intel_memory_region.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/selftests=
/intel_memory_region.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -1070,7 +1070,9 @@ static int igt=
_lmem_write_cpu(void *arg)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Put th=
e pages into a known state -- from the gpu for added fun */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;intel_eng=
ine_pm_get(engine);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;err =3D i=
ntel_context_migrate_clear(engine-&gt;gt-&gt;migrate.context, NULL,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl, I915_CACHE_NONE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; obj-&gt;mm.pages-&gt;sgl,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; i915_gem_get_pat_index(i915,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_CACHE_NONE),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;true, 0xdeadbeaf, &amp;rq);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (rq) {=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;dma_resv_add_fence(obj-&gt;base.resv, &amp;rq-&gt;fence,=
</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/se=
lftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index ece97e4faacb..a516c0aa88fd 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/selftests=
/mock_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/selftests=
/mock_gtt.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -27,21 +27,21 @@</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void mock_insert_page(=
struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dma_addr_t ad=
dr,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u64 offset,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_lev=
el level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_in=
dex,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void mock_insert_entri=
es(struct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
struct i915_vma_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_c=
ache_level level, u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned in=
t pat_index, u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void mock_bind_ppgtt(s=
truct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vm=
_pt_stash *stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct i915_vm=
a_resource *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enum i915_cache_level cac=
he_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int pat_index,</=
div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u32 flags)</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;GEM_BUG_O=
N(flags &amp; I915_VMA_GLOBAL_BIND);</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -94,7 +94,7 @@ struct i915_ppgtt =
*mock_ppgtt(struct drm_i915_private *i915, const char *name)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void mock_bind_ggtt(st=
ruct i915_address_space *vm,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vm_pt_st=
ash *stash,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct i915_vma_reso=
urce *vma_res,</div>
<div class=3D"ContentPasted0">&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enum i915_cache_level cach=
e_level,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int pat_index,</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 flags)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; With a pinky promise to improve this all=
 in the near future I won't</div>
<div class=3D"ContentPasted0">&gt; grumble to loudly. :) I haven't read all=
 the details, I leave that to</div>
<div class=3D"ContentPasted0">&gt; other reviewers, and also assuming some =
final tweaks as indicated above</div>
<div class=3D"ContentPasted0">&gt; please.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Thanks for all the suggestions, really apprec=
iated.</div>
<div class=3D"ContentPasted0">May I add your Acked-by?</div>
<div><br class=3D"ContentPasted0">
</div>
<div>-Fei</div>
<div><br>
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<br>
</div>
</body>
</html>

--_000_SN6PR11MB25746DE12E35850DF6772BA29A769SN6PR11MB2574namp_--
