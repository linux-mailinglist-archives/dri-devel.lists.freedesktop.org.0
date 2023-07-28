Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899C07664FE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988EC10E65C;
	Fri, 28 Jul 2023 07:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEFF10E05B;
 Fri, 28 Jul 2023 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690528472; x=1722064472;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wpjcc0A5TheyWQkwvMWe8N+5IuYWRnbDjX9Yeh3dZ8w=;
 b=dE8fvyC2PeFOJOAbLh0bKKUZAID4KAr5eNtR+KZ869uwWPXb8pdCNQDS
 RMFm4RSEnvEgI+WQVgZhoOQJ7w/Ea4I98hvaqOCDj96+BEu2HVTjD4kKZ
 drP5kiYVH0Wj9oTbtHOYAAn5wKZF0duHXKdfCwKMwzPFUwXWUQs8zEKvv
 XdwgZM2w08htaW/fXil5f6XA05noId7XHZyB7+fexdUNF/Vr6eWU5GD1W
 aV+Et2cl46qzFrjllD19/m5nYn1XlR3GWehH5crC2dK78/4G0ZJPdNIw3
 zuHs0JfDKKBW5LKA5ZlwqsPQHTGbnNKG5X4hvFWMh2IkrJt2u/rKwDxyH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371229037"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="371229037"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 00:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730628469"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="730628469"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 00:14:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 00:14:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 00:14:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 00:14:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 00:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMwgh4DI+aPsCISPpii3rnfdH9XVSw+ZLLDZNUYyrx/Jk3EOFXMx2k8ZYSuc5lWOEGSLuG+qiHc+VZKO/nERT5ZVl99NSLweD/7OiEQUv5C/6x+SQzYvSuIIlBQq5eOAtqX2fsgKZyXQ/sIDmifiadDt31x+ZEx9dK8Vsx5khtHGP4bTnDTOGlL91N9GXekv9U2YtTDNAIYrVnn7zM5Au9IgQrb1QEw2wUOgfOtO8QxamnPpqlG2jriXU1ytePxNlF5jjZBnL34lHFK1uAO4BUiOd1FAJkJBCklEkrhM53FUo1HP0aFoO+/6E/Wo7/hjujZBQ94H+zwDgMiGkJs0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyURtWFXI3pE5XVEZBdTrNWwZ1Wbvx4fsUKNFl9xrsE=;
 b=gAJ1cbWHawTpRypSK1IVTLDeK5R975P8We8mTOvL0J9Gb40TmeqUw3LxUhCPj5UQAVbd1jWgbiDIUjwlygFUNsJ1YxjyFfFOP6iqljbXWYIrA8RUiN2Yegr2wf63DbpQXy5Ru0d5rV2kEAWVlYKtUkkRhQqiqE2nHmA8Evup40EEcBqPDz5Q5MFYq6VAE/OV5mk5I35NZIq+SdhJv0Ru+LlVfLwetaIAG2uSAsOmrw+cJAysgo4v7QCNvho/26tjXMkqwhd3rDBcjxdPmETFz5c+X45dR+7EFKuqbDv9QTFHFr+6c5BHNjLmACSCTeOqUljJdSyfdIs6+gO29MWI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:14:27 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::ca92:81a9:39f7:933b%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:14:27 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 4/8] drm/i915: Refactor PAT/object cache handling
Thread-Topic: [RFC 4/8] drm/i915: Refactor PAT/object cache handling
Thread-Index: AQHZwJpocc2BM6J4wkK+9Kr4OKVZ2a/OxGGA
Date: Fri, 28 Jul 2023 07:14:27 +0000
Message-ID: <BYAPR11MB256702AD6B37216420298B699A06A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230727145504.1919316-5-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|IA1PR11MB6148:EE_
x-ms-office365-filtering-correlation-id: afa23ecc-3c1f-4307-d47d-08db8f3a4768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ce5jo755YSj1XCZODfMtI//SBhxcNURfQNoyp1FHkOemAu4Fyoejc/JPRbS6lS0nYYiynagzhpUmcwjsFy2lZ88CQeLrx/uRfx4TeEjPnKHz5RX2y/bC9X8ud5ZT+PSQut4YJMGsD7sI8G857gssVKFFBxauwOQb3qL1z1yM51HAngZCE5kQDR0QuThbrA05xaUvCnGPbcHX31j9FEZZNkhhxqhgWS1p2e7mBDK3qFUbnHfZUliSfzI9egVhKlcgOBRKS24e/tM1QatAbMEC2ybyMaPv0X6ydY1axtDZp0/o8wdzNqpPyYtpJkx2KG+5aRnkfPA1Bctll94mXMaijzYKCROnBmdPlfiJFqF6TD7IhtLz5f4RjDBbjgFvoq4ky2gDfTsWH+hYx3R2slNQVVchUXLWqgWgYd3hwlPbOrWuTJUzbYgutmc2LAfchiPdSNxfH1Y7/haOYRW2LJ49H3o57I4cflXK1EAfyPFedYGNNckW02ejNkYRLKZfLIy0qa23OzciJtJhjZSTM1qP5tmFdZ9joiZ3SiUZOxSAzzAh1TRZrlrHskfYHDqFCTiu1H/6NNvfS5tW+uNxcx9hCFPGzQz4SJgRnYiQvsjDp572vqPWdNvTx5ZWr2dVbyqr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(2906002)(41300700001)(316002)(38070700005)(8676002)(8936002)(33656002)(86362001)(55016003)(5660300002)(82960400001)(186003)(478600001)(110136005)(54906003)(122000001)(7696005)(71200400001)(9686003)(6506007)(26005)(76116006)(38100700002)(52536014)(66446008)(66476007)(66556008)(66946007)(64756008)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Haa1YebWMtBSOVbyT29emT9Hy4D90+mxvmzkCZ1N/P+pueI2OW0ShfuOZ/OX?=
 =?us-ascii?Q?3VeJQIBOIvwtn3hF0sQlPp+ZijnGJcJGJOodnOpiXOp03omoJ+p/U6rcDGWY?=
 =?us-ascii?Q?nUkQxmA1Jlq7k/isjf8OlRlbTtvD7bonFPGYuVEhOCGbmUQFZH9p3ELfPoI8?=
 =?us-ascii?Q?Fn+TSOtZM2Ev13MrCGBjGBERHZZyz3Vny2NJz41GdzB3OJmPG/PtmAcicS1F?=
 =?us-ascii?Q?/CF/qR/ovOp8/8tBc4BCnXYtOluquLiBncYZogZ1Van2uTOG9qxI6VAsNQjg?=
 =?us-ascii?Q?nQ0nZh3+BN3toj9I4ShRl90dOrCWlKmNnaHxQheh4V95qos6rwsObAztOdwi?=
 =?us-ascii?Q?hGoMO1R6kE5dDwh6bdJPAE9L/Ak7khIZOp5cB+VN/PFJLVzzcQjw7Ssft8uI?=
 =?us-ascii?Q?B2qrC+g1njZ+teSuMcSF7xlIpXodlxXggC7XXDRAfLxeEPnhHhsmaxwx47F0?=
 =?us-ascii?Q?4/pkV9DZ3EgKG+KSqXqfumumojD+32gQ2HsPdHIfYQT/GkX3IPlD3Wy8hV3R?=
 =?us-ascii?Q?asM5s+vNWl2Jg4XrEsXWmhO4bW6EcJEkgLgzbuMCa2uDDbVZg+8w6MkmJnYS?=
 =?us-ascii?Q?Z92ifKgomnMxGDtsnNQHmL7Ge/KEV/zD1rHWM+jug5pSMx9Cx4h+TPBc7Fvs?=
 =?us-ascii?Q?CGv292cpSi8JzFG0Xymnw/2b3n7ROW6ewCW1hkqrMsWM0M/5KPDOnnhAvPxg?=
 =?us-ascii?Q?WDBIp+fJk9rlcV1bCflLl3reKNGmfeCcY8NRTv+faXAmoB+Ua4K4uGpMGxiU?=
 =?us-ascii?Q?BhkJnplqkdjifirgirUazEvSTsl5EZY/iX76fRWiGPHWtR880ecABl7/OQ8M?=
 =?us-ascii?Q?JhgvV5UKqKXu/bcZY2gFM4e89dBHhbDj9uaxrxMuCmviEp4q/kBIRGbPQHif?=
 =?us-ascii?Q?sdMaGwsky72UpLUpb8CJsa/uvbzoz+CwnX4SSNuIRXWrAswBoCLR8HPOXZpZ?=
 =?us-ascii?Q?hni/gK13Vf0Tlrnkl4iT+BNBE3T7Q4pKA9f7IvtlsAwepbvGxzA8pOBHO4+9?=
 =?us-ascii?Q?jXt7k0+SPDfcYHkO2FbpC6mdxSTMQWF7JV9CX1ftwtFWJ+UiSLdOvyWfWWEr?=
 =?us-ascii?Q?BS/VpjPrenwZqfOdry4bVcppq+odI6aY5RDL9NsXxI1A4kxGvK1+3vVx4vEl?=
 =?us-ascii?Q?Q/6yj1NYOYkCjJdyTZCl47rtzJFVsUtfejAtUVQ3FA+l7E7r+dEaterUJ5rF?=
 =?us-ascii?Q?XId3LtLY/Al2jbXiefIxnGhED0ygKBxyIkNtdSXfSLLIgJLLu3Lvaa71QktY?=
 =?us-ascii?Q?StEinrr1I2iAB0x8vJW+J6YS0j7u5WG0zsLAcfPlYIjYuYv687bqpWZoMhkS?=
 =?us-ascii?Q?lAt6lEdrFBN9vrOUTV3l1KETMfftLcw9WL8XgamzqgeR0wdJ0o4aKmCVgkMh?=
 =?us-ascii?Q?QY8TB6aFh6r9iioMRySRbRfBa07zlrswBb2TOhnsaq6tEv3LWGvY67+4Hej7?=
 =?us-ascii?Q?alGkF8fr+ECCsVQ4l4akQFMGiJDU1w9tgAg53kx3mdKDuCvy7DuB0v7PvNB+?=
 =?us-ascii?Q?Dtsm9wsdygEFKwscHs2rH+wgCr1mT3px1DPQTDbgZr/CBcuYM0W2jiDixN1z?=
 =?us-ascii?Q?gmdZRrx7hPtGlEisKiiRu5mKpqx2wyKvjNK/mhtN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa23ecc-3c1f-4307-d47d-08db8f3a4768
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 07:14:27.1791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rx6hGEekFddwidKdqfh4F2NXvzHA2/b8Jsdl2KvjbxZDU3XiR5uLQ5eWd7oz5vD6oswo0gVQo6Sj64wvi/jIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[snip]
> @@ -41,14 +42,17 @@ static bool gpu_write_needs_clflush(struct drm_i915_g=
em_object *obj)
>               return false;
>
>       /*
> -      * For objects created by userspace through GEM_CREATE with pat_ind=
ex
> -      * set by set_pat extension, i915_gem_object_has_cache_level() will
> -      * always return true, because the coherency of such object is mana=
ged

i915_gem_object_has_cache_level() always return true means this function
always return false.

> -      * by userspace. Othereise the call here would fall back to checkin=
g
> -      * whether the object is un-cached or write-through.
> +      * Always flush cache for UMD objects with PAT index set.

(obj->pat_set_by_user =3D=3D true) indicates UMD knows how to handle the co=
herency,
forcing clflush in KMD would be redundant.

>        */
> -     return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
> -              i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
> +     if (obj->pat_set_by_user)
> +             return true;

return false;

> +
> +     /*
> +      * Fully coherent cached access may end up with data in the CPU cac=
he
> +      * which hasn't hit memory yet.
> +      */
> +     return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB) &&
> +            i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W);

Why checking COH2W here? The logic was, if UC or WT return false, otherwise
return true. So, as long as cache_mode is WB, it's sufficient to say true
here, right?

>  }
