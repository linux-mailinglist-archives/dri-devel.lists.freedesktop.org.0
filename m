Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD7707178
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98E710E208;
	Wed, 17 May 2023 19:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9690510E208;
 Wed, 17 May 2023 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684350388; x=1715886388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=4Kv0uT8kQyuE1nsv/L7v7dRyLM0SjKg88ibegVJEszE=;
 b=ibRD8s+kGK7GtQ3zVe7+ychKMbgi8fwDGvc8xutJSOxBPbHv01Gt+SyI
 IiRVRTnX0yAuwW68qIW47jA/X9fjBOK3aqTEhVP/6N+OvzS3sbCDuvZnO
 wTtnnT+TJvG8RJfFjIylpTWX71UHcCGzZNc7r6RWNXpu3wocmTtc0+zv0
 kB6h9+RhmWMM9OG6M4oXLGxCe8AW9kSCmWLFwOweRRV+plpVe1e25KwML
 JP+4MqtDetPbkRCzDaUT0bsang7NOIEsirtJzaj6B0Ee/7THmoEbGgT4h
 CxnOA2qoFo55UD2F4E2Fw3/cyOKA3x14pg9wurwECRosRUSOkKUB2Nvdm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="332218315"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
 d="scan'208,217";a="332218315"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 12:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846194194"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
 d="scan'208,217";a="846194194"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2023 12:06:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 12:06:27 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 12:06:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 12:06:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 12:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LleF+rsn+15z125EiJCVLgyKj721BMiiv9IYEGllIguPi9vaiwf6oEE4yhoc97IUxQHuAeLPPptDwjqWQrRSqoxWkaUQGr39gX27nw5vd88QQSDj2guPV7hdxL+xdPwrDUNkZFvH7fO1Fi3azhUNcIizGzpRL9YnT02/IgPs9u1p4FK5V8hpYXNnwDAa/RSo+HkCyQnyo1YyWIqSu4xfJj6wz9foaCMOmX63lvkuv/TSHwLEGunhHbL1ClPZhKWOKkX5GTzDp5JcniFUOWhHCn4mWN751y4xhqnRSIkyToSUe2T0U1hKepQbVN8Yfv4/nfIyj2HIDF+hSKHBNlbHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/3UPmKxMOMymXJo2b5yBcm/SvKZwwmeW1/T3esuC/g=;
 b=ZYUyqDh77qRc/csNRlGIeU/4DwSm43Yb6+i4HAOBAUNFvgeq4jARDD3SiyxbTADlrcjmFWalTsQw7Cw171WZyq32S85XZzOgAwl345i155bQTVl6V3bK4YxqJEBzTxylnMYoMptCCAepz1u/pgAnWAkOaiTh9WxrpyWdp95mcpHCklCpCTW2+bJyveekvBltIPr5EfkDaSNWUgfuebN6Zd/l0rjIrJA0Td/uiSL0E75+F7L9/FhH4It8EqKKC4DDTJSeV42lkyep9LZVBduhPDymSwhUuT+ZWiSKHefD5gG1qx0dHb0Z5ysTGfgsAJQOdzsaR1dFdOPiTQht6URzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 19:06:24 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::8ec1:2f24:6309:c008%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 19:06:22 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v9 2/2] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v9 2/2] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZiCHF6CB6Nf+gYEeBVlnhDi4Rgq9eG2cAgAC0+ak=
Date: Wed, 17 May 2023 19:06:22 +0000
Message-ID: <BYAPR11MB256783C87A22DD874231178D9A7E9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230516181140.1372245-1-fei.yang@intel.com>
 <20230516181140.1372245-3-fei.yang@intel.com>
 <7085b59d-3f56-5b46-a853-f499a8498d99@linux.intel.com>
In-Reply-To: <7085b59d-3f56-5b46-a853-f499a8498d99@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: 693b881f-effd-456b-b32d-08db5709ce0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o860hnjIIIcLvo6Kq5lFacNabp3SXXTn8JNcxlpCmJkA6o8ZK9Lu4h5QyWU9xvZGIPsGThsoGwo7+NDZOEdo6f/w4BAfkmdwRQGoSB6tZ9c+es30Dl0KLvvN5e7S/iH7J4Ju5C+97zcHKdfdncO+IQc1wyo1DZU141L6Uy55BpiJnxFgi3QG3sRXrBd1irI5nSfsWs7cLrBExm7ZEO695bEogE2Ooo2WvDqNwhmL0FYuWJgfS9klalPuAFQeXhoe7tlOZ72YFnSg1K6RcgOmmE3+bRtc9N58to0UFQmKoWFtt7QKrguugwnZebxqfRUw1u1tssNB8NnFcqcCOV8j8ToFNF/anyN4FQHshL8E8JG9Ve/UkXPTPwv4vYD2TRb8zkPV/hDRr7bb/6vJ+7upQ5seEefpaUNZCJ6QK4v5zYluDxii7V/ztSYLPmiFkEVxmqoGXZN4ZGSuCg7uwPQPo9VCub+lUaegq+Izs1Klg5SVPr3iKEP1WZhr43fHTaPESU+/6gMxZq+yc88n/exiMSiWd9fbTH8zzcI2L5ME02Dz5ypE3NG/2Du5SNf/1BAIxxx6i17JfZ8RaLqSobUIH7bE2UY9VbZEdODHou191P0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(33656002)(66556008)(966005)(110136005)(54906003)(66446008)(66946007)(76116006)(4326008)(478600001)(66476007)(64756008)(316002)(7696005)(86362001)(55016003)(8676002)(8936002)(2906002)(82960400001)(122000001)(52536014)(38070700005)(41300700001)(38100700002)(5660300002)(186003)(53546011)(26005)(6506007)(9686003)(30864003)(71200400001)(83380400001)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JmTyYaDa2AECedNZqCJwsNji5qNluGpJh7oVf3C/l3As9iobWdwj9Y2k59?=
 =?iso-8859-1?Q?Wy4WNcbKht7VVTYmDlsbQhLiPHhX5qhD/MDNLjbpWIuNuQsA0kyasFqyl7?=
 =?iso-8859-1?Q?Ct4K6RtnHL/4BM8b73dzCZZsaP7qIb68ejmkQbzZaOu6iLq8TeYQga32z2?=
 =?iso-8859-1?Q?oegq5H3P9W9Xt+Uf0gsD26geX8reYcZ03vjJ3Qk8I3ORKqOAEbW2AjKbb8?=
 =?iso-8859-1?Q?ykjakBWix+B3s9/xbqF0bmMz1NZUSDCUjsTpWmXsZyzKcD9dIE8tGyah4K?=
 =?iso-8859-1?Q?/ubU3ufVq2iG5Qt3t3YGp2vwqtKYvXK+UOJcMzjnnjkg1dmxlVLNDDFDMQ?=
 =?iso-8859-1?Q?CEdv7/FSq/webnIR3sqZMdIeADIKia4/aa/o0Jp4BXvewGypHXk3VVXP5w?=
 =?iso-8859-1?Q?pnGDNGjy1kluSB/idwD4cOCi/ahv52qi5wO3uea2jitzWUT10fP3F4KfAI?=
 =?iso-8859-1?Q?9exSZFGGppTCiahCWxEbE4A7fcIqWSg5r+1rqSAaWtMuHR8NF4i1wyg8m+?=
 =?iso-8859-1?Q?/0qlN907dLT7JLgkPUWsH1/xoN8oS5Lno1954GqpSacWIAJwA5Bb8JAk2Y?=
 =?iso-8859-1?Q?K792XyU+x8VrP/2bBqt+r6dkwR7sXco98YqEeKv9uIwra4qk12j+9i+Tzi?=
 =?iso-8859-1?Q?F4Vs3fDuXwSWYkowPMabUQEqxnhsZKw55xqdHPgd59IE/cOQgiOaosMo2J?=
 =?iso-8859-1?Q?e+4EXtog3zuY9xuuZ9R7zqos1UCWd97pjV1qL6zY+HDirpQJ0r511Qyrg8?=
 =?iso-8859-1?Q?c52JpQn8mAyQvBuWWyx0+2k8OpjVy3J8FW+lex0aEEJsrf0FHtCalZqaZq?=
 =?iso-8859-1?Q?dO5eozNGFPf+vBJnzwFf+AAf0bI7LAdxrd0foClmhLomzGoaLy6i1q7UzG?=
 =?iso-8859-1?Q?73PdsSrKrH0UQ0f2tPH49yRak7iyNY0GtL8E4BxxIp5aI7iVBFbknslnKj?=
 =?iso-8859-1?Q?P8XunyTuFIRfW54ToZLzE25/3uwBHpXWfnA6f4LAFjc9Jq9DxWwHuyYaRi?=
 =?iso-8859-1?Q?ZjMKIaP1WH3PimoafaVxxyMVRJbhBlNcuvB61vqF/HmyRKFFiby73kbirv?=
 =?iso-8859-1?Q?NVJLMWtIk/TwrTkEN3KCHLslO3/yQmHR9/fm/Z/uzVPgtpGeXEADCjjuq6?=
 =?iso-8859-1?Q?zWnvj0QAW3o3ujHZaeAoEan4RA0nbhEupam3WnFsHuIW5xTvXtCz76F+g1?=
 =?iso-8859-1?Q?Ai1sgOcO82Lm9RzdC/3D+o/X+TgaqFMQcXTZVSDXoWE2aPwW8ewph7KwCL?=
 =?iso-8859-1?Q?28MVBCPHxMj8o9d0CShzSZCMn94ZxiuKz/F8Zo0V3ygUjTgN9URQPeq9da?=
 =?iso-8859-1?Q?4mhlK5SHob6+Q3rm9WxLtXSA/lROk8l0exnBd0wJRhfXaBOw1np1emDJ5c?=
 =?iso-8859-1?Q?Od7PKehYsvqQolB0JPYf+ZEDSnH48EPyFjx8FY39kvmkGC+UD3dJ+ujdxE?=
 =?iso-8859-1?Q?9LkkqWt6m0CZwAQy7ALFlQdmT8OC73Z7q3x0SMzgBn5f6QrrOetZXd36KU?=
 =?iso-8859-1?Q?9Oy/NlnKABC+/3GdlLq8rIPaZZOV886ZBz47syUoU0qle1KedAKT4qUysu?=
 =?iso-8859-1?Q?wR0quFJ1eJNuE1a2Ud0pxzksdaEc/y/I/z2vY+YxtksEIK1evwRDbHwU8A?=
 =?iso-8859-1?Q?HBK/TkwX9p3MQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB256783C87A22DD874231178D9A7E9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693b881f-effd-456b-b32d-08db5709ce0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 19:06:22.5931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXen5o6RcJ/dMiy4vwpRvNknGyyRqc/7Rp3NQak7eoIzRYeVi2cLlvDSmsI+/cuH+eDNiDrf1n+yEzOMhQ3oGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB256783C87A22DD874231178D9A7E9BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 16/05/2023 19:11, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> To comply with the design that buffer objects shall have immutable
>> cache setting through out their life cycle, {set, get}_caching ioctl's
>> are no longer supported from MTL onward. With that change caching
>> policy can only be set at object creation time. The current code
>> applies a default (platform dependent) cache setting for all objects.
>> However this is not optimal for performance tuning. The patch extends
>> the existing gem_create uAPI to let user set PAT index for the object
>> at creation time.
>> The new extension is platform independent, so UMD's can switch to using
>> this extension for older platforms as well, while {set, get}_caching are
>> still supported on these legacy paltforms for compatibility reason.
>>
>> Test igt@gem_create@create_ext_set_pat posted at
>> https://patchwork.freedesktop.org/series/117695/
>>
>> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22=
878
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>   include/uapi/drm/i915_drm.h                | 42 ++++++++++++++++++++++
>>   tools/include/uapi/drm/i915_drm.h          | 42 ++++++++++++++++++++++
>>   4 files changed, 126 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_create.c
>> index bfe1dbda4cb7..644a936248ad 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -245,6 +245,7 @@ struct create_ext {
>>        unsigned int n_placements;
>>        unsigned int placement_mask;
>>        unsigned long flags;
>> +     unsigned int pat_index;
>>   };
>>
>>   static void repr_placements(char *buf, size_t size,
>> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_exte=
nsion __user *base, void *data
>>        return 0;
>>   }
>>
>> +static int ext_set_pat(struct i915_user_extension __user *base, void *d=
ata)
>> +{
>> +     struct create_ext *ext_data =3D data;
>> +     struct drm_i915_private *i915 =3D ext_data->i915;
>> +     struct drm_i915_gem_create_ext_set_pat ext;
>> +     unsigned int max_pat_index;
>> +
>> +     BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=3D
>> +                  offsetofend(struct drm_i915_gem_create_ext_set_pat, r=
svd));
>> +
>> +     if (copy_from_user(&ext, base, sizeof(ext)))
>> +             return -EFAULT;
>> +
>> +     max_pat_index =3D INTEL_INFO(i915)->max_pat_index;
>> +
>> +     if (ext.pat_index > max_pat_index) {
>> +             drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
>> +                     ext.pat_index);
>> +             return -EINVAL;
>> +     }
>> +
>> +     ext_data->pat_index =3D ext.pat_index;
>> +
>> +     return 0;
>> +}
>> +
>>   static const i915_user_extension_fn create_extensions[] =3D {
>>        [I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,
>>        [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,
>> +     [I915_GEM_CREATE_EXT_SET_PAT] =3D ext_set_pat,
>>   };
>>
>> +#define PAT_INDEX_NOT_SET    0xffff
>>   /**
>>    * i915_gem_create_ext_ioctl - Creates a new mm object and returns a h=
andle to it.
>>    * @dev: drm device pointer
>> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, vo=
id *data,
>>        if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>>                return -EINVAL;
>>
>> +     ext_data.pat_index =3D PAT_INDEX_NOT_SET;
>>        ret =3D i915_user_extensions(u64_to_user_ptr(args->extensions),
>>                                   create_extensions,
>>                                   ARRAY_SIZE(create_extensions),
>> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, v=
oid *data,
>>        if (IS_ERR(obj))
>>                return PTR_ERR(obj);
>>
>> +     if (ext_data.pat_index !=3D PAT_INDEX_NOT_SET) {
>> +             i915_gem_object_set_pat_index(obj, ext_data.pat_index);
>> +             /* Mark pat_index is set by UMD */
>> +             obj->pat_set_by_user =3D true;
>> +     }
>> +
>>        return i915_gem_publish(obj, file, &args->size, &args->handle);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_object.c
>> index 46a19b099ec8..97ac6fb37958 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>        if (!(obj->flags & I915_BO_ALLOC_USER))
>>                return false;
>>
>> +     /*
>> +      * Always flush cache for UMD objects at creation time.
>> +      */
>> +     if (obj->pat_set_by_user)
>> +             return true;
>> +
>>        /*
>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make=
 it
>>         * possible for userspace to bypass the GTT caching bits set by t=
he
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index ba40855dbc93..4f3fd650e5e1 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3664,9 +3664,13 @@ struct drm_i915_gem_create_ext {
>>         *
>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>         * struct drm_i915_gem_create_ext_protected_content.
>> +      *
>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
>> +      * struct drm_i915_gem_create_ext_set_pat.
>>         */
>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>        __u64 extensions;
>>   };
>>
>> @@ -3781,6 +3785,44 @@ struct drm_i915_gem_create_ext_protected_content =
{
>>        __u32 flags;
>>   };
>>
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT ind=
ex) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *              .pat_index =3D 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>> + *              .size =3D PAGE_SIZE,
>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>> + *      };
>> + *
>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ex=
t);
>> + *      if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +     /**
>> +      * @pat_index: PAT index to be set
>> +      * PAT index is a bit field in Page Table Entry to control caching
>> +      * behaviors for GPU accesses. The definition of PAT index is
>> +      * platform dependent and can be found in hardware specifications,
>> +      * e.g. BSpec 45101.
>
> AFAIU BSpec numbers do not work from the outside so please put an url to
> the place where PRMs are hosted instead.

Yeah, I was thinking of https://www.intel.com/content/www/us/en/docs/graphi=
cs-for-linux/developer-reference/1-0/hardware-specs.html
But from these documents I could only find the definition of PTE which is
referring the concept of to PAT: Page Attribute indirectly. There isn't any
further detail and apparently the PAT tables are not included there either.

Any suggestion?

>> +      */
>> +     __u32 pat_index;
>> +     /** @rsvd: reserved for future use */
>> +     __u32 rsvd;
>> +};
>> +
>>   /* ID of the protected content session managed by i915 when PXP is act=
ive */
>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>
>> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/=
i915_drm.h
>> index 8df261c5ab9b..4fbfa472b9fc 100644
>> --- a/tools/include/uapi/drm/i915_drm.h
>> +++ b/tools/include/uapi/drm/i915_drm.h
>
> Changes to this file I think you should drop. Looking at the log, it is
> mostly other folks who synchronise it.

I don't really know how this is maintained, just grep'ed for i915 uAPIs and=
 found
this copy. But okay I can drop it if a different group of people is suppose=
d to
maintain it.

> Regards,
>
> Tvrtko
>
>> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>>         *
>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>         * struct drm_i915_gem_create_ext_protected_content.
>> +      *
>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
>> +      * struct drm_i915_gem_create_ext_set_pat.
>>         */
>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>        __u64 extensions;
>>   };
>>
>> @@ -3724,6 +3728,44 @@ struct drm_i915_gem_create_ext_protected_content =
{
>>        __u32 flags;
>>   };
>>
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT ind=
ex) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *              .pat_index =3D 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>> + *              .size =3D PAGE_SIZE,
>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>> + *      };
>> + *
>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ex=
t);
>> + *      if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +     /**
>> +      * @pat_index: PAT index to be set
>> +      * PAT index is a bit field in Page Table Entry to control caching
>> +      * behaviors for GPU accesses. The definition of PAT index is
>> +      * platform dependent and can be found in hardware specifications,
>> +      * e.g. BSpec 45101.
>> +      */
>> +     __u32 pat_index;
>> +     /** @rsvd: reserved for future use */
>> +     __u32 rsvd;
>> +};
>> +
>>   /* ID of the protected content session managed by i915 when PXP is act=
ive */
>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>

--_000_BYAPR11MB256783C87A22DD874231178D9A7E9BYAPR11MB2567namp_
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
&gt; On 16/05/2023 19:11, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; To comply with the design that buffe=
r objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt; cache setting through out their life=
 cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt; are no longer supported from MTL onw=
ard. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt; policy can only be set at object cre=
ation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt; applies a default (platform dependen=
t) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt; However this is not optimal for perf=
ormance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt; the existing gem_create uAPI to let =
user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt; The new extension is platform indepe=
ndent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt; this extension for older platforms a=
s well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt; still supported on these legacy palt=
forms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Test igt@gem_create@create_ext_set_p=
at posted at</div>
<div class=3D"ContentPasted0">&gt;&gt; https://patchwork.freedesktop.org/se=
ries/117695/</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Tested with https://gitlab.freedeskt=
op.org/mesa/mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@linux.=
intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Tested-by: Jordan Justen &lt;jordan.=
l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; include/uapi/drm/i915_drm.h &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 42 ++++++++++++++++=
++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; tools/include/uapi/drm/i915_d=
rm.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 42 ++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; 4 files changed, 126 insertio=
ns(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index bfe1dbda4cb7..644a936248ad 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -245,6 +245,7 @@ struct create_ex=
t {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int n_placements;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int placement_mask;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
long flags;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static void repr_placements(c=
har *buf, size_t size,</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -394,11 +395,39 @@ static int ext=
_set_protected(struct i915_user_extension __user *base, void *data</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +static int ext_set_pat(struct i915_=
user_extension __user *base, void *data)</div>
<div class=3D"ContentPasted0">&gt;&gt; +{</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct create_ext *e=
xt_data =3D data;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_priv=
ate *i915 =3D ext_data-&gt;i915;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
create_ext_set_pat ext;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; unsigned int max_pat=
_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; BUILD_BUG_ON(sizeof(=
struct drm_i915_gem_create_ext_set_pat) !=3D</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;offsetofend(struct drm_i915_gem_create_ext_set_=
pat, rsvd));</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (copy_from_user(&=
amp;ext, base, sizeof(ext)))</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EFAULT;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; max_pat_index =3D IN=
TEL_INFO(i915)-&gt;max_pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (ext.pat_index &g=
t; max_pat_index) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; drm_dbg(&amp;i915-&gt;drm, &quot;PAT index is invalid: %u\n&quot;,<=
/div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ext.pat_index);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; ext_data-&gt;pat_ind=
ex =3D ext.pat_index;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div class=3D"ContentPasted0">&gt;&gt; +}</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; static const i915_user_extens=
ion_fn create_extensions[] =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; [I915_GEM_CREATE_EXT=
_SET_PAT] =3D ext_set_pat,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define PAT_INDEX_NOT_SET &nbsp; &n=
bsp;0xffff</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* i915_gem_create_ext_i=
octl - Creates a new mm object and returns a handle to it.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp;* @dev: drm device poin=
ter</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -418,6 +447,7 @@ i915_gem_create_=
ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (args-=
&gt;flags &amp; ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return -EINVAL;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; ext_data.pat_index =
=3D PAT_INDEX_NOT_SET;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D i=
915_user_extensions(u64_to_user_ptr(args-&gt;extensions),</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; create_extensions,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ARRAY_SIZE(create_extensions),</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -454,5 +484,11 @@ i915_gem_create=
_ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_ER=
R(obj))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return PTR_ERR(obj);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (ext_data.pat_ind=
ex !=3D PAT_INDEX_NOT_SET) {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_object_set_pat_index(obj, ext_data.pat_index);</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* Mark pat_index is set by UMD */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;pat_set_by_user =3D true;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return i9=
15_gem_publish(obj, file, &amp;args-&gt;size, &amp;args-&gt;handle);</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; index 46a19b099ec8..97ac6fb37958 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -208,6 +208,12 @@ bool i915_gem_o=
bject_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!(obj=
-&gt;flags &amp; I915_BO_ALLOC_USER))</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Always flush=
 cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user)</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return true;</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * EHL an=
d JSL add the 'Bypass LLC' MOCS entry, which should make it</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * possib=
le for userspace to bypass the GTT caching bits set by the</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/include/uapi/drm/i915_d=
rm.h b/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index ba40855dbc93..4f3fd650e5e1 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/include/uapi/drm/i915_drm.h</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/include/uapi/drm/i915_drm.h</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3664,9 +3664,13 @@ struct drm_i9=
15_gem_create_ext {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * For I9=
15_GEM_CREATE_EXT_PROTECTED_CONTENT usage see</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * struct=
 drm_i915_gem_create_ext_protected_content.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For I915_GEM=
_CREATE_EXT_SET_PAT usage see</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* struct drm_i=
915_gem_create_ext_set_pat.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_M=
EMORY_REGIONS 0</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_P=
ROTECTED_CONTENT 1</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 ext=
ensions;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3781,6 +3785,44 @@ struct drm_i9=
15_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 fla=
gs;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/**</div>
<div class=3D"ContentPasted0">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted0">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted0">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =3D =
ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err) ...=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + */</div>
<div class=3D"ContentPasted0">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /** @base: Extension=
 link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct i915_user_ext=
ension base;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_index: =
PAT index to be set</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* PAT index is=
 a bit field in Page Table Entry to control caching</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* behaviors fo=
r GPU accesses. The definition of PAT index is</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* platform dep=
endent and can be found in hardware specifications,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* e.g. BSpec 4=
5101.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; AFAIU BSpec numbers do not work from the=
 outside so please put an url to</div>
<div class=3D"ContentPasted0">&gt; the place where PRMs are hosted instead.=
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Yeah, I was thinking of https://www.intel.com=
/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/hardware=
-specs.html</div>
<div class=3D"ContentPasted0">But from these documents I could only find th=
e definition of PTE which is</div>
<div class=3D"ContentPasted0">referring the concept of to PAT: Page Attribu=
te indirectly. There isn't any</div>
<div class=3D"ContentPasted0">further detail and apparently the PAT tables =
are not included there either.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Any suggestion?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reserved =
for future use */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div>
<div class=3D"ContentPasted0">&gt;&gt; +};</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /* ID of the protected conten=
t session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_PROTECTED_CONTEN=
T_DEFAULT_SESSION 0xf</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/tools/include/uapi/drm/=
i915_drm.h b/tools/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index 8df261c5ab9b..4fbfa472b9fc 100=
644</div>
<div class=3D"ContentPasted0">&gt;&gt; --- a/tools/include/uapi/drm/i915_dr=
m.h</div>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/tools/include/uapi/drm/i915_dr=
m.h</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Changes to this file I think you should =
drop. Looking at the log, it is</div>
<div class=3D"ContentPasted0">&gt; mostly other folks who synchronise it.</=
div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I don't really know how this is maintained, j=
ust grep'ed for i915 uAPIs and found</div>
<div class=3D"ContentPasted0">this copy. But okay I can drop it if a differ=
ent group of people is supposed to</div>
<div class=3D"ContentPasted0">maintain it.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Tvrtko</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3607,9 +3607,13 @@ struct drm_i9=
15_gem_create_ext {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * For I9=
15_GEM_CREATE_EXT_PROTECTED_CONTENT usage see</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * struct=
 drm_i915_gem_create_ext_protected_content.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For I915_GEM=
_CREATE_EXT_SET_PAT usage see</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* struct drm_i=
915_gem_create_ext_set_pat.</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_M=
EMORY_REGIONS 0</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_P=
ROTECTED_CONTENT 1</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 ext=
ensions;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3724,6 +3728,44 @@ struct drm_i9=
15_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 fla=
gs;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;</div>
<div class=3D"ContentPasted0">&gt;&gt; +/**</div>
<div class=3D"ContentPasted0">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted0">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted0">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =3D =
ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err) ...=
</div>
<div class=3D"ContentPasted0">&gt;&gt; + */</div>
<div class=3D"ContentPasted0">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /** @base: Extension=
 link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; struct i915_user_ext=
ension base;</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_index: =
PAT index to be set</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* PAT index is=
 a bit field in Page Table Entry to control caching</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* behaviors fo=
r GPU accesses. The definition of PAT index is</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* platform dep=
endent and can be found in hardware specifications,</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;* e.g. BSpec 4=
5101.</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;</di=
v>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reserved =
for future use */</div>
<div class=3D"ContentPasted0">&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div>
<div class=3D"ContentPasted0">&gt;&gt; +};</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; /* ID of the protected conten=
t session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define I915_PROTECTED_CONTEN=
T_DEFAULT_SESSION 0xf</div>
<div class=3D"ContentPasted0">&gt;&gt;&nbsp;&nbsp;</div>
</div>
</body>
</html>

--_000_BYAPR11MB256783C87A22DD874231178D9A7E9BYAPR11MB2567namp_--
