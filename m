Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE1AB46648
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783B010E364;
	Fri,  5 Sep 2025 21:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBEsC+xM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315B810E364;
 Fri,  5 Sep 2025 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757109517; x=1788645517;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=VMsmTNCmr7n5YsRR+rq7u5jB0A/Yh8dn+qzcCQ08+Lc=;
 b=oBEsC+xM1kE2A+lCwTAFSoXV5+tlFDqtF0ePDhoeEDdEdfrfDRdqqYUR
 Vmx3v2b+ORidLj4c4vZcofxb0VgnPfw0o6Nid304ygq2BhdC30CW2cuJh
 3l0Js9m46dgXaInxxo9kF2pfnKbehIQ9g66YfF7udjHQPnmF04U0AQfiq
 aAh+5MMwW+0E3V9m7rUD2zmbuJiqSvWr+JjG2Hd/LPeC3HBCK2mAwb+7n
 KFFaWqidX+9V+MdEV2PMiUJ5+gf7c6KJECbQoL6yXh/tQrV+uQp/lczem
 SWiqDXmcRf3I4rStYjSH5u+egPuH0X/jwtnE/IwUVIzNN/holkGTh7ha/ Q==;
X-CSE-ConnectionGUID: PPpuL/mBQE67TVv4smuPeA==
X-CSE-MsgGUID: 1Obm9m/ISwmHz43c+78fRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82056219"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82056219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:58:36 -0700
X-CSE-ConnectionGUID: oAjkyrntTmKw8e8cJ8qwIw==
X-CSE-MsgGUID: ZgkFXl2mRhOwRKY2ym/sCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172619194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:58:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:58:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 14:58:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVDPz+BykMGB5H+e+KY/gI8BJzG6xIi52NZXnCka2Vbtv2521XPYCWYYItDL7XtiEoti70VyauS8+96S5hd+PR0NuPi5Q1zAL4FQFJlhEUMgb036AgZfaI2UzvcsWeN9ETJkccz1jC+7+nYVQzKAo9Qd+BFRxjADwBGH42KrTUDBOrtSo+uZSY9Tknx2dtWlDuiJMX9tg+KNok+AlZfQQ/+CpP7JJLCQCoczFXBli6FEV2yukP/pMss3B78eBcf5eIDikOywtpO80bfLOzA5Up23cSw4/H8SaBZjx/VPKRirJxRe0tk69GI3CZcxEvmreNtXQkSynE3i1dy+oajkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XztvM9mzAv50ZrMYtBT4+k67qbLZssiZtJlup9jOPH0=;
 b=QF0f3MHDLidi8He1ZkHKnxu6IY9Yx5ZDT3hHxvRQWwo4cnuvDe219P0sA3do5jlYo67H3r8HIEwqrn0YzqyeTlW4l7l1KwuF4ULMU1NbPsvIOQV6n0Ohqa8RwG5zC3GndrZR8ALt6fq7uki7T3sUyKV1CLqPJImgVvh/IZLibqgzJF1drutQ50iZ+cJ6zzXx3KBcncqaFg9RzgjFQv37tSDwWwqB+m35LaZpzcdFRpewEEKGR41upplhSiLAsE2xGzG+gNXwi2o4ODzL31B1DqkgbJbdlBicOz66UxQvD3eJxXKgUJx/zyJGbyr9oyv7BvCeprB+MLig3nuITt90Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 21:58:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 21:58:25 +0000
Date: Fri, 5 Sep 2025 17:58:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <aLtc-gk3jhwcWxZh@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: abdb293b-f192-4edf-7a6b-08ddecc75672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KFxPLRpz6OMLXyMAD1GK63P3YFrxu0b3NLJFMy32BgAYC2em9DSIgueKBI?=
 =?iso-8859-1?Q?dzhxyskU8nBA6Q1KcPrrjsRizvqEsGFVJNESr/cqu0Kr84ts/3nx3Xgiig?=
 =?iso-8859-1?Q?x9PWvq6OFbvYlajhBAoY4xCvFvi25RTzGqvLJQYDoc8BZE1+jhHh4Lj2zb?=
 =?iso-8859-1?Q?hPsqwYxPWpib6iA2peZsu6MfW8rgKEMvr16JRNwsbbzoPx9fdcA8FTaAI5?=
 =?iso-8859-1?Q?kW9BGLN8lrdDvVS7fxOTULD8iUtTPo4jJEeyX0/CbVYfAigK/d03x9Yvn3?=
 =?iso-8859-1?Q?0eqg/GNvk8dxgcEJgpmDHP/JXAX6PLtA/jFvuz/9W2OJGi9h42QquggBR2?=
 =?iso-8859-1?Q?mLc1Xw1Cob8B08eMUXXLtNZBUdhDxBvN/TiH661UswjPaMha4siWqrwP2C?=
 =?iso-8859-1?Q?qkJO8ig1OZWb6uxZqchfHZOV9lg3oD4TS1YvtSzGW676explIYLQ60qSSD?=
 =?iso-8859-1?Q?oD+bjBkAU3J/5WeS0EfodWCJFfbmhcudJnoRTXKTB2tD4xh6crgLx3+9hN?=
 =?iso-8859-1?Q?Blj+HlXAbVVcnXsuNXIYgSGyDiAYCiruahYLEjgXYaR7y0wB3RUGb0Rwmn?=
 =?iso-8859-1?Q?xRFczAcA7Lfku586ZVFQUmH9Zg8oj50wJ67aQW2gfu1rlh0Jjsu+OiGdUo?=
 =?iso-8859-1?Q?9a2DMlGSv26HJuJXQKVALJlAkiRUFsl2BsYnc9tAjxz68/nwdVyXKRq6oo?=
 =?iso-8859-1?Q?AbYxdBaY/mLv03w1E5h3ItNYvL5DWkkdmBRG2+Pp8h8NkxyT1cSgXj+DJr?=
 =?iso-8859-1?Q?lgYBOIp6Osx45/vZrjLP/WgpMxG9Ou9hydgu8jnzjjuHKyrLNAKIk7IWlb?=
 =?iso-8859-1?Q?3//OsQARCi70lbS+gNUeVUamTUz+pkVFpZ+V1e3iZgDemxH/aPTf/DNzNK?=
 =?iso-8859-1?Q?VJpUnOMU+os7AwFe6vNHdY92p7c7Q4RCuTLypdMc/RazXx0Pmvz/DqXxVA?=
 =?iso-8859-1?Q?+V36CKIl0/JBB5WmIhwr3i2ew/6LbquOJjAlZG5g1OzB/nE0Extvop26h/?=
 =?iso-8859-1?Q?rHVNFhfOolAQZ5cSKXASIG/dX7CjCdsXOscYQpOFCtVpexgTDJl0pxTGux?=
 =?iso-8859-1?Q?3DyLkC8M0m3qoBjU+16RNKlRlOyMTqJu1hOR9d5S/eKaLljITiSpC/Yxfx?=
 =?iso-8859-1?Q?Mns+dLs0ZTH8vw0EBegruN+JBBUQyg/O5xNW40B3EsJGCr1PkSQBc+1b16?=
 =?iso-8859-1?Q?GjekFvAj2o8SETUj64lCTveXSSxwEg/ssfjqZ52wlbyO+E43s59jB/nTnZ?=
 =?iso-8859-1?Q?TlkmN/NpNloENXyiutCjLUrAVcLWZG8OdkyjxnecijiLSz1iuBq99qn7EJ?=
 =?iso-8859-1?Q?2Lx+/jD40/mJpAx9OcYyfugfly82vbsM+ZlrFcB56SyIa5/coRicoSId1P?=
 =?iso-8859-1?Q?vvdl/QcPtS9QiJvAybe9l5tfLSiOQuLk/g9nOQbXK7tG/yd7AV69A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cmS5Jv/MU1SK2HqzJ1EnNe/CbD4U/iORfBb5RrqLZg6WXmE5Ntd+KOZMGH?=
 =?iso-8859-1?Q?nyW8gnTrSworUwAhq4x+rwlr0YMQ6Df6I1pId0UyxUzdRox+8o3+Ia/KmC?=
 =?iso-8859-1?Q?ZQk5Azt58iRAl3j4DglkqR/JiXwb/mnFJNGyqoV6K2VhvFhXqNNOCg12Tl?=
 =?iso-8859-1?Q?M3LP3MMkNUWY7ayi/WEUXGCRVND6entsBvAaeGN0E5jHJ4BI/CCzVzrcgg?=
 =?iso-8859-1?Q?kXUsT8B0pQSbSDUs/Hc7xXoKViFAlEQoGHXAXZMndbgbXtsIyKUJiQA231?=
 =?iso-8859-1?Q?yhnXfZTc6J3z/TlPRUsa1/p/sGW5+N5BJS+benJ5ZN+VjJ35TBlp1Igt02?=
 =?iso-8859-1?Q?1yQlLqQk31DA8/S2R9Z02V1dfbmNyuQv5ps6tMqtfa7jNx1BeRZbLXLUXt?=
 =?iso-8859-1?Q?qNJRENrvHJLSa2OtJ8+cwCnJdv6G9MvsugbJzsgf6bgAbMjZQUHpdWx+YJ?=
 =?iso-8859-1?Q?ZqFY5KkBj6QwynQIRRFBkEEuFVclR2erzrij2Knby1DrTlmy95+FsvsgwF?=
 =?iso-8859-1?Q?xMQckFtuXE2kbs8xCAqVBxgkVVhV26V4oN8DnN+3oFiy2nPfQ6vXLi1Uh+?=
 =?iso-8859-1?Q?VaKmQCYgPT6Yih8fZKYLZYXNEHSMR6vS9PR7KX6Ba/MLEe98SsFXv1nd94?=
 =?iso-8859-1?Q?XMYn8McbnQqJHlX1FnnyDq6CR2IraaRQmvSwLKyL6mCco/j8bPStGoK7Ne?=
 =?iso-8859-1?Q?oD5Y1N7YdKsmKC4WDmikVaScKQw7aqyVZ5TkV1HNEv8K4t/kFfqHWycaxI?=
 =?iso-8859-1?Q?Xu6N1MJQiHeSYzt3AuZmfWXUtF93J430KtMQu1mV3eF9UqpEtyxKbpxg6+?=
 =?iso-8859-1?Q?qGrObNoYAPqBsIVP2u1Gkgo6hlERwpdgpJxqx3yZwAEeO4H9qSKb0E8er6?=
 =?iso-8859-1?Q?/uUmTdsavpRjwVEsOZ8Eb8T/IuEkaeDgPdQqCZURPKS2Q2vN6GDBb8ZA7j?=
 =?iso-8859-1?Q?7+pJO0eIyXP+UUCE37YMxT/S0ZEjC5QvpfPWVELlzJDdatTqeimeH+uPUy?=
 =?iso-8859-1?Q?gOTvONL4m4JuMp8x28j+LKloh075XZyOAIGTqSCZb2WteHSsiTFRanp50j?=
 =?iso-8859-1?Q?XPh9jGXwO6QX8xmJq7yQ39bDxIvjp66VHymHTUlg4qeEq3r7BjuCg8oOhw?=
 =?iso-8859-1?Q?hRBES1K268Gp1Vtm1Kqp1x4oQZ6kl/rbFEOL7oMygwydxvOvvcocyebDep?=
 =?iso-8859-1?Q?y/Cs/CVauBtFXk3KzHhSw4Y8S27tZpuN3D5Ff+vjGtveHAUkN+OXJf6UXH?=
 =?iso-8859-1?Q?pZ18ohvz6wy1aO9y6B5tZqlf9Y3DSJsEiH6g8tgMumhHxsgHdLUkl5lA4k?=
 =?iso-8859-1?Q?2yxkT8gRqBiMxxyJckeiBDkCgIW+axjVwk+N5niUxojxjBrGfQPJHn4vKG?=
 =?iso-8859-1?Q?SH8TdkfYcX7URV6EXsqCpEoVB8eLcwwbmYlMFrIzejuLm/Hoo+xSOxBXZd?=
 =?iso-8859-1?Q?OGGH9O5lnkA6N7+E4gcxGzRhv5ZZ0sGSND7+lFjNVPXHtPQdFhXA6DglNa?=
 =?iso-8859-1?Q?14R3PBe8fQmIA/vrp5idDQj9kzkKIxPb8snrSmrAKRnyQbjLyRin1F1B2A?=
 =?iso-8859-1?Q?JHlztO46QLZ770dESwwaZBWs+js+3vNzIKQjfHGTzqy4GLDGeTFftS7pq4?=
 =?iso-8859-1?Q?Xwu31PunbwQy0fKXbgIEW69JP7QibkL1ca?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abdb293b-f192-4edf-7a6b-08ddecc75672
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 21:58:25.2323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utt/r8cDF91Al+w0sqhbhIwHUjky1oI2WY6Qez8Xnsi+LK+5yKn+xQVDkSUvGLz+Qdx8rygBR/5OrBnrUGXPcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Sima,

Here goes our first drm-intel-next pull request towards 6.18.
I'm planning to send another pull request in the end of next week.

It is important to highlight the iopoll.h work that is pushed here without
any ack since it lacks MAINTAINERS and previous changes apparently gets
through various trees. [1]

On the highlights here we have Wildcat Lake enabling patches, and also
many more refactor towards the full intel_display split, as well as
many Type-C and Display Port changes.

Thanks,
Rodrigo.

[1] - https://lore.kernel.org/intel-gfx/c34ce332183d24ed29ed23852238fd5ca948d4f1@intel.com/

drm-intel-next-2025-09-05:
Cross-subsystem Changes:
 - iopoll: Generalize read_poll_timeout() into poll_timeout_us() (Ville)

Non-display related:
 - PREEMPT_RT fix (Sebastian)
 - Replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST (Ruben, Imre)
 - Some changes oeveral like in RPS, SoC, debugfs targeting display separation (Jani)

Display related:
 - General refactor in favor of intel_display (Suraj)
 - Prune modes for YUV420 (Suraj)
 - Reject HBR3 in any eDP Panel (Ankit)
 - Change AUX DPCD probe address (Imre)
 - Display Wa fix, additions, and updates (Ankit, Vinod, Nemesa, Suraj, Jouni))
 - DP: Fix 2.7 Gbps link training on g4x (Ville)
 - DP: Adjust the idle pattern handling (Ville)
 - DP: Shuffle the link training code a bit (Ville)
 - Don't set/read the DSI C clock divider on GLK (Ville)
 - Precompute plane SURF address/etc (Ville)
 - Enable_psr kernel parameter changes (Jouni)
 - PHY LFPS sending configuration fixes (Jouni)
 - Fix dma_fence_wait_timeout() return value handling (Aakash)
 - DP: Fix disabling training pattern (Imre)
 - Small code clean-ups (Gustavo, Colin, Jani, Juha-Pekka)
 - Change vblank log from err to debug (Suraj)
 - More display clean-up towards intel_display split (Jani)
 - Use the recomended min_hblank values (Arun)
 - Block hpd during suspend (Dibin)
 - DSI: Fix overflow issue in pclk parsing (Jouni)
 - PSR: Do not trigger Frame Change events from frontbuffer flush (Jouni)
 - VBT cleanups and new fields (Jani, Suraj)
 - Type-C enabled/disconnected dp-alt sink (Imre)
 - Optimize panel power-on wait time (Dibin)
 - Wildcat Lake enabling (Imre, Chaitanya)
 - DP HDR updates (Chaitanya)
 - Fix divide by 0 error in i9xx_set_backlight (Suraj)
 - Fixes for PSR (Jouni)
 - Remove the encoder check in hdcp enable (Suraj)
 - Control HDMI output bpc (Lee)
 - Fix possible overflow on tc power (Mika)
 - Convert code towards poll_timeout_* (Jani)
 - Use REG_BIT on FW_BLC_SELF_* macros (Luca)
 - ALPM LFPS and silence period calculation (Jouni)
 - Remove power state verification before HW readout (Imre)
 - Fix HPD mtp_tc_hpd_enable_detection (Ville)
 - DRAM detection (Ville)
The following changes since commit 11895f375939d60efe7ed5dddc1cffe2e79f976c:

  drm/i915/bios: Apply vlv_fixup_mipi_sequences() to v2 mipi-sequences too (2025-07-10 11:30:32 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-09-05

for you to fetch changes up to 70a9b201cfa893fd0b7125c8f9205d9e12e02ba5:

  drm/i915/display: Avoid divide by zero (2025-09-05 15:24:46 +0300)

----------------------------------------------------------------
Cross-subsystem Changes:
 - iopoll: Generalize read_poll_timeout() into poll_timeout_us() (Ville)

Non-display related:
 - PREEMPT_RT fix (Sebastian)
 - Replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST (Ruben, Imre)
 - Some changes oeveral like in RPS, SoC, debugfs targeting display separation (Jani)

Display related:
 - General refactor in favor of intel_display (Suraj)
 - Prune modes for YUV420 (Suraj)
 - Reject HBR3 in any eDP Panel (Ankit)
 - Change AUX DPCD probe address (Imre)
 - Display Wa fix, additions, and updates (Ankit, Vinod, Nemesa, Suraj, Jouni))
 - DP: Fix 2.7 Gbps link training on g4x (Ville)
 - DP: Adjust the idle pattern handling (Ville)
 - DP: Shuffle the link training code a bit (Ville)
 - Don't set/read the DSI C clock divider on GLK (Ville)
 - Precompute plane SURF address/etc (Ville)
 - Enable_psr kernel parameter changes (Jouni)
 - PHY LFPS sending configuration fixes (Jouni)
 - Fix dma_fence_wait_timeout() return value handling (Aakash)
 - DP: Fix disabling training pattern (Imre)
 - Small code clean-ups (Gustavo, Colin, Jani, Juha-Pekka)
 - Change vblank log from err to debug (Suraj)
 - More display clean-up towards intel_display split (Jani)
 - Use the recomended min_hblank values (Arun)
 - Block hpd during suspend (Dibin)
 - DSI: Fix overflow issue in pclk parsing (Jouni)
 - PSR: Do not trigger Frame Change events from frontbuffer flush (Jouni)
 - VBT cleanups and new fields (Jani, Suraj)
 - Type-C enabled/disconnected dp-alt sink (Imre)
 - Optimize panel power-on wait time (Dibin)
 - Wildcat Lake enabling (Imre, Chaitanya)
 - DP HDR updates (Chaitanya)
 - Fix divide by 0 error in i9xx_set_backlight (Suraj)
 - Fixes for PSR (Jouni)
 - Remove the encoder check in hdcp enable (Suraj)
 - Control HDMI output bpc (Lee)
 - Fix possible overflow on tc power (Mika)
 - Convert code towards poll_timeout_* (Jani)
 - Use REG_BIT on FW_BLC_SELF_* macros (Luca)
 - ALPM LFPS and silence period calculation (Jouni)
 - Remove power state verification before HW readout (Imre)
 - Fix HPD mtp_tc_hpd_enable_detection (Ville)
 - DRAM detection (Ville)

----------------------------------------------------------------
Aakash Deep Sarkar (1):
      drm/i915/display: Fix dma_fence_wait_timeout() return value handling

Ankit Nautiyal (4):
      Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
      drm/i915/dp: Add device specific quirk to limit eDP rate to HBR2
      drm/i915/display_wa: Add helpers to check wa
      drm/i915/gmbus: Add Wa_16025573575 for PTL/WCL for bit-bashing

Arun R Murthy (1):
      drm/i915/display: Use the recomended min_hblank values

Chaitanya Kumar Borah (3):
      drm/i915/display: Add power well mapping for WCL
      drm/i915/dp: Refactor intel_dp_in_hdr_mode() for broader reuse
      drm/i915/dp: Set min_bpp limit to 30 in HDR mode

Colin Ian King (1):
      drm/i915/bw: Remove space before newline

Dibin Moolakadan Subrahmanian (2):
      drm/{i915,xe}/display: Block hpd during suspend
      drm/i915/display: Optimize panel power-on wait time

Gustavo Sousa (1):
      drm/i915/display: Remove unused declarations of intel_io_*

Imre Deak (24):
      drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to TRAINING_PATTERN_SET
      drm/i915: Fix selecting CONFIG_DRM_KUNIT_TEST in debug builds
      drm/i915/dp: Fix disabling training pattern at end of UHBR link training
      drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
      drm/i915/icl+/tc: Cache the max lane count value
      drm/i915/lnl+/tc: Fix max lane count HW readout
      drm/i915/lnl+/tc: Use the cached max lane count value
      drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
      drm/i915/tc: Use the cached max lane count value
      drm/i915/tc: Move getting the power domain before reading DFLEX registers
      drm/i915/tc: Move asserting the power state after reading TCSS_DDI_STATUS
      drm/i915/tc: Add an enum for the TypeC pin assignment
      drm/i915/tc: Pass pin assignment value around using the pin assignment enum
      drm/i915/tc: Handle pin assignment NONE on all platforms
      drm/i915/tc: Validate the pin assignment on all platforms
      drm/i915/tc: Unify the way to get the pin assignment on all platforms
      drm/i915/tc: Unify the way to get the max lane count value on MTL+
      drm/i915/tc: Handle non-TC encoders when getting the pin assignment
      drm/i915/tc: Pass intel_tc_port to internal lane mask/count helpers
      dmc/i915/tc: Report pin assignment NONE in TBT-alt mode
      drm/i915/tc: Cache the pin assignment value
      drm/i915/tc: Debug print the pin assignment and max lane count
      drm/i915/wcl: Add display device info
      drm/i915/display: Remove power state verification before HW readout

Jani Nikula (69):
      drm/i915/display: remove superfluous <linux/types.h> includes
      drm/i915/hdmi: use intel_de_wait_for_set() instead of wait_for()
      drm/i915/ddi: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/dpll: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/cdclk: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/power: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/pch: use intel_de_wait_custom() instead of wait_for_us()
      drm/i915/dsi: use intel_de_wait_custom() instead of wait_for_us()
      drm/xe/compat: remove unused platform macros
      drm/xe/compat: stop including i915_utils.h from compat i915_drv.h
      drm/xe: fix stale comment about unordered_wq usage
      drm/i915/display: hide global state iterators, remove unused
      drm/i915/display: make struct __intel_global_objs_state opaque
      drm/i915/display: keep forward declarations together
      drm/i915/display: use drm->debugfs_root for creating debugfs files
      drm/i915/gvt: use drm->debugfs_root for creating debugfs files
      drm/i915: use drm->debugfs_root for creating debugfs files
      drm/i915/vbt: split up DSI VBT defs to a separate file
      drm/i915/vbt: add anonymous structs to group DSI VBT defs
      drm/i915/vbt: flip bta_enabled to bta_disable
      drm/i915/vbt: add missing DSI VBT defs
      drm/i915/display: add intel_dig_port_alloc()
      drm/i915/connector: make intel_connector_init() static
      drm/i915: silence rpm wakeref asserts on GEN11_GU_MISC_IIR access
      drm/i915/display: pass display to HAS_PCH_*() macros
      drm/i915/fb: pass display to HAS_GMCH() and DISPLAY_VER()
      drm/i915/clockgating: pass display to for_each_pipe()
      drm/i915/clockgating: pass display to HAS_PCH_*() macros
      drm/i915/clockgating: pass display to DSPCNTR and DSPSURF register macros
      drm/i915/irq: pass display to macros that expect display
      drm/i915/dram: pass display to macros that expect display
      drm/i915/gmch: pass display to DISPLAY_VER()
      drm/i915/gem: pass display to HAS_DISPLAY()
      drm/i915/switcheroo: pass display to HAS_DISPLAY()
      drm/i915/drv: pass display to HAS_DISPLAY()
      drm/i915/uncore: pass display to HAS_FPGA_DBG_UNCLAIMED()
      drm/i915/gvt: convert mmio table to struct intel_display
      drm/i915/reg: separate VLV_DSPCLK_GATE_D from DSPCLK_GATE_D
      drm/i915/display: drop __to_intel_display() usage
      drm/i915/audio: drop irq enabled check from LPE audio setup
      drm/i915/bo: remove unnecessary include
      drm/i915/switcheroo: check for NULL before dereferencing
      drm/i915/dram: add intel_fsb_freq() and use it
      drm/i915/dram: add intel_mem_freq()
      drm/i915/rps: use intel_fsb_freq() and intel_mem_freq()
      drm/i915/dram: bypass fsb/mem freq detection on dg2 and no display
      drm/i915/dram: move fsb_freq and mem_freq to dram info
      drm/i915/dp: convert open-coded timeout to poll_timeout_us()
      drm/i915/power: drop a couple of &i915->drm usages
      drm/i915/hdmi: use generic poll_timeout_us() instead of __wait_for()
      drm/i915/hdcp: use generic poll_timeout_us() instead of __wait_for()
      drm/i915/hdcp: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dsi: use generic poll_timeout_us() instead of wait_for_us()
      drm/i915/dsi-pll: use generic poll_timeout_us() instead of wait_for()
      drm/i915/gmbus: use generic poll_timeout*() instead of wait_for*()
      drm/i915/wm: use generic poll_timeout_us() instead of wait_for()
      drm/i915/cdclk: use generic poll_timeout_us() instead of wait_for()
      drm/i915/power: use generic poll_timeout_us() instead of wait_for()
      drm/i915/power-well: use generic poll_timeout_us() instead of wait_for() for DKL PHY
      drm/i915/power-well: use generic poll_timeout_us() instead of wait_for() for VLV/CHV
      drm/i915/dp: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dp: use generic poll_timeout_us() instead of wait_for() in link training
      drm/i915/vblank: use generic poll_timeout_us() instead of wait_for()
      drm/i915/tc: use generic poll_timeout_us() instead of wait_for()
      drm/i915/dsb: use generic poll_timeout_us() instead of wait_for()
      drm/i915/lspcon: use generic poll_timeout_us() instead of wait_for()
      drm/i915/opregion: use generic poll_timeout_us() instead of wait_for()
      drm/i915/ddi: prefer poll_timeout_us() over readx_poll_timeout()
      drm/i915/pps: prefer poll_timeout_us() over read_poll_timeout()

Jouni Högander (21):
      drm/i915/psr: Do not disable Early Transport when enable_psr is set
      drm/i915/psr: Ignore enable_psr parameter on Panel Replay
      drm/i915/psr: Add enable_panel_replay module parameter
      drm/i915/display: Write PHY_CMN1_CONTROL only when using AUXLess ALPM
      drm/i915/display: Avoid unnecessarily calling intel_cx0_get_owned_lane_mask
      drm/i915/display: Ensure phy is accessible on lfps configuration
      drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS before phy reg read
      drm/i915/dsi: Fix overflow issue in pclk parsing
      drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush
      drm/i915/psr: Underrun on idle PSR wa only when pkgc latency > delayed vblank
      drm/i915/psr: drm_WARN_ON when activating disabled PSR
      drm/i915/psr: Do not activate disabled PSR on irq_aux_error
      drm/i915/psr: Check pause counter before continuing to PSR activation
      drm/i915/psr: Check drm_dp_dpcd_read return value on PSR dpcd init
      drm/i915/psr: Do not unnecessarily remove underrun on idle PSR WA
      drm/i915/psr: Check PSR pause counter in __psr_wait_for_idle_locked
      drm/i915/bios: Remove unnecessary checks of PSR idle frames in VBT binary
      drm/i915/alpm: Calculate silence period
      drm/i915/alpm: Add own define for LFPS count
      drm/i915/alpm: Replace hardcoded LFPS cycle with proper calculation
      drm/i915/alpm: Use actual lfps cycle and silence periods in wake time

Juha-Pekka Heikkila (3):
      drm/i915/display: take out dead code
      drm/i915/display: log fail from intel_sdvo_enable_hotplug
      drm/i915/display: Avoid divide by zero

Lee Shawn C (2):
      drm/i915/hdmi: add debugfs to contorl HDMI bpc
      drm/i915: compute pipe bpp from link bandwidth management

Luca Coelho (1):
      drm/i915: use REG_BIT on FW_BLC_SELF_* macros

Mika Kahola (1):
      drm/i915/display: Fix possible overflow on tc power domain selection

Nemesa Garg (2):
      drm/i915/display: WA_14011503117
      drm/i915/scaler: Fix condition for WA_14011503117

Ruben Wauters (1):
      drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST

Sebastian Andrzej Siewior (1):
      drm/i915: Don't check for atomic context on PREEMPT_RT

Suraj Kandpal (9):
      drm/i915/scaler: Use intel_display as argument to skl_scaler_max_src_size
      drm/i915/xe3lpd: Prune modes for YUV420
      drm/i915/vblank: Change log from err to debug
      drm/i915/scaler: Fix WA_14011503117
      drm/i915/backlight: Fix divide by 0 error in i9xx_set_backlight
      drm/i915/vbt: Add eDP Data rate overrride field in VBT
      drm/i915/bios: Add function to check if edp data override is needed
      drm/i915/edp: eDP Data Overrride
      drm/i915/hdcp: Remove the encoder check in hdcp enable

Ville Syrjälä (26):
      drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x
      drm/i915/dp: Don't switch to idle pattern before disable on pre-hsw
      drm/i915/dp: Clear DPCD training pattern before transmitting the idle pattern
      drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything changed
      drm/i915/dp: Move intel_dp_training_pattern()
      drm/i915/dp: Implement .set_idle_link_train() for everyone
      drm/i915/dp: Make .set_idle_link_train() mandatory
      drm/i915/dsi: Don't set/read the DSI C clock divider on GLK
      drm/i915: Precompute plane SURF address
      drm/i915: Nuke intel_plane_ggtt_offset()
      drm/i915: Move the intel_dpt_offset() check into intel_plane_pin_fb()
      drm/i915: Use i915_vma_offset() in intel_dpt_offset()
      drm/i915: Remove unused dpt_total_entries()
      drm/i915: Don't pass crtc_state to foo_plane_ctl() & co.
      iopoll: Generalize read_poll_timeout() into poll_timeout_us()
      iopoll: Avoid evaluating 'cond' twice in poll_timeout_us()
      iopoll: Reorder the timeout handling in poll_timeout_us()
      drm/i915/hpd: Fix mtp_tc_hpd_enable_detection()
      drm/i915/dram: Populate PNV memory type accurately
      drm/i915/dram: Use intel_dram_type_str() for pnv
      drm/i915/dram: Pack dram_info better
      drm/i915/dram: s/wm_lv0.../has_16gb_dimms/
      drm/i915/dram: Move 16Gb DIMM detection fully to the skl/icl codepaths
      drm/i915/dram: Fix some spelling around the 16Gb DIMM w/a
      drm/i915/dram: Don't call skl_get_dram_info()/skl_get_dram_type() on icl
      drm/i915/dram: Print memory details even if something went wrong

Vinod Govindapillai (1):
      drm/i915/fbc: fix the implementation of wa_18038517565

 drivers/gpu/drm/display/drm_dp_helper.c            |   2 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |   2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  51 ++--
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  15 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  58 ++---
 drivers/gpu/drm/i915/display/i9xx_plane.h          |   1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  32 ++-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  59 +++--
 drivers/gpu/drm/i915/display/intel_alpm.c          | 133 +++++------
 drivers/gpu/drm/i915/display/intel_backlight.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  46 +++-
 drivers/gpu/drm/i915/display/intel_bios.h          | 176 +-------------
 drivers/gpu/drm/i915/display/intel_bo.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  56 +++--
 drivers/gpu/drm/i915/display/intel_connector.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |   1 -
 drivers/gpu/drm/i915/display/intel_crt.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  28 +--
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  21 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  73 +++---
 drivers/gpu/drm/i915/display/intel_display.c       |   9 +-
 .../drm/i915/display/intel_display_conversion.c    |   2 +-
 .../drm/i915/display/intel_display_conversion.h    |  12 -
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   6 +-
 .../i915/display/intel_display_debugfs_params.c    |   7 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  15 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   7 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  13 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   3 +
 .../gpu/drm/i915/display/intel_display_params.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display_power.c |  24 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  57 ++++-
 .../drm/i915/display/intel_display_power_well.c    |  52 ++--
 drivers/gpu/drm/i915/display/intel_display_regs.h  |   2 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  16 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |  35 +++
 drivers/gpu/drm/i915/display/intel_display_wa.h    |  11 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 143 +++++++----
 drivers/gpu/drm/i915/display/intel_dp.h            |   3 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |  13 -
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 156 ++++++------
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  20 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  10 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h  | 197 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_encoder.c       |  41 ++++
 drivers/gpu/drm/i915/display/intel_encoder.h       |   6 +
 drivers/gpu/drm/i915/display/intel_fb.c            |   1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |  39 ++-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  13 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  28 ---
 drivers/gpu/drm/i915/display/intel_fdi.h           |   1 -
 drivers/gpu/drm/i915/display/intel_global_state.c  |  32 ++-
 drivers/gpu/drm/i915/display/intel_global_state.h  |  36 +--
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  53 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  33 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  24 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |  34 ++-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |   1 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |  11 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |  13 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   5 +-
 drivers/gpu/drm/i915/display/intel_pch.h           |   4 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |  11 +
 drivers/gpu/drm/i915/display/intel_pfit.h          |  10 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   6 -
 drivers/gpu/drm/i915/display/intel_plane.h         |   1 -
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   2 +
 drivers/gpu/drm/i915/display/intel_pps.c           |  10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 123 +++++-----
 drivers/gpu/drm/i915/display/intel_quirks.c        |   9 +
 drivers/gpu/drm/i915/display/intel_quirks.h        |   1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  10 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |  51 ++--
 drivers/gpu/drm/i915/display/intel_tc.c            | 258 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_tc.h            |  72 +++++-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  16 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |  20 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |   9 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |  53 +++-
 drivers/gpu/drm/i915/display/skl_scaler.h          |  13 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  61 ++---
 drivers/gpu/drm/i915/display/skl_watermark.c       |  20 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   4 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |  32 ++-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |   5 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  11 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |  12 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  20 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |   4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |  14 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   2 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   6 +-
 drivers/gpu/drm/i915/i915_irq.c                    |  13 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   9 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |   6 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   9 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |  35 ++-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        | 266 +++++++++++----------
 drivers/gpu/drm/i915/intel_uncore.c                |   3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |   8 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |   8 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |  97 ++++----
 drivers/gpu/drm/i915/soc/intel_dram.h              |  13 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   3 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  22 --
 drivers/gpu/drm/xe/display/ext/i915_utils.c        |   1 +
 drivers/gpu/drm/xe/display/xe_display.c            |   6 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   9 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   4 +
 drivers/gpu/drm/xe/xe_device_types.h               |   3 +-
 include/linux/iopoll.h                             | 170 ++++++++-----
 126 files changed, 2166 insertions(+), 1419 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h
