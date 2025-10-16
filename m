Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A2BE376A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 14:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02B110E9CE;
	Thu, 16 Oct 2025 12:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l23vA58y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FB910E9CE;
 Thu, 16 Oct 2025 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760618636; x=1792154636;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=l5FBtzaFSuT+1scARcUhOP+aNGRPGAqaTcA1Svg9DGk=;
 b=l23vA58yN+2vnmtvAMb6G5NT4zm4LFt8tfJtfTwNI7L+t70bshpaP4o6
 wnrodRGBec0dSCnEDay4A6XBtq8ZnOKdZJujtW0qjEOFSpukuXsOjmg/t
 a7wCFPUdDzshW5AvVqL72UgzfGotkL09dWcuwSC2ah8I4HyUdAIZKPMTe
 GwY/fT1/E4CBZ5ChEXcwXL0pMp2eo1LWj/A4rZJ7XpIkuUqoz2j+T63uP
 gi6U90ysAnmXiaoJTIkdcW4guVoKPpRA54KKnZTRYKqicCnf54NhXHT+q
 fmDzP8uZSyPiwyln6OD3SiZBGO6i5mWebn6uRSvhBnVWAjrjZru9ZhKeW Q==;
X-CSE-ConnectionGUID: TOnxAuI7QXy4tjBw+M+nFg==
X-CSE-MsgGUID: mAsG39uvT6iJ47LgG8COJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66458173"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66458173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:43:55 -0700
X-CSE-ConnectionGUID: zphWMlBcTauBAwyH61iYRg==
X-CSE-MsgGUID: kiKqo297T0Cr3BYRrdnxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182389252"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:43:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:43:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 05:43:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRASRvy0r2riCkcOL+PsdBg+soGND0d5gFAgfYhgTvOBMG0wKSjpkmEAf3Z+gvPNsauXec5HnPaNfg+ytXttPKiP7gMAsmYHlPyks7+/3XUIMb4E+UABOf+x2hpUXGd3x6GhxTQT/JSBNib9v6h88YZDvQ+bTHx8MXVgiSUh9IFQW0g6CpjBQnM5g6wlgHQ4Mn0k6MIhuIR+bC2KyZbWnw+GBxW339uIMKjHOrSDJkMviq22uR5BGPWtO5oQuxR8vFQNv/HagUYAlb/XC+sGZQ3L0y3sS9WmQm1kq9fuSC8eQhdFdPzHgR52x29CM8VjxrOlwJX1zrD20n/BhSZ0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrKDJ9WIs2sonsKZeKorl8xfIw3rTF8m73LmbTppQb0=;
 b=EVDZs8BqChejTZU7hHOyQ/57QwjsGxia88BrhN2yebVb0tp4NumLprW0Y5mCFxLi+o+U9oBlalq1uzenjkLB0jzJsoSsCWV41Rftfa9gFw6CIFufHZhncXY6zcLJ4ebCWsekiPqVaarXQaF/uLcPBqvqDJ3Y4ab3EOPNWIdeJ9kKmk8vd8TBiF699Bkrii5rbGQcVWc30Eo1KF2Eyuz//F6FujgC0/8CGoVfs8g3pzbI/u0XflFdXD3SzZHHl09QpyiyFmDB+8nzWpcWF0BHDzmr5n1mrbLsB62zIgA+YHLSN42/dpOihaE0lMPLy+S8K9xSFroGUFIKgwy+UODNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 12:43:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 12:43:51 +0000
Date: Thu, 16 Oct 2025 08:43:46 -0400
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aPDoguxlhXlvjNAi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ea6d75-5d4d-4158-17b2-08de0cb1a8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?93Xyp2WevXPb2EA14Ezur9uRXsIzF+Xc3nkYUp05log8DrluRdMdzSBQGq?=
 =?iso-8859-1?Q?gpJWsTVX3fiVnPPiI/26cvbC6+PCYMASIzFWqjFKAa8IO3E5UvVly6xG81?=
 =?iso-8859-1?Q?+pCRk7f6fuKMjUEkfZOgAgQwww6IOpLWelJ1Zlrj84xwzXEKfMjkMXLZuj?=
 =?iso-8859-1?Q?DKJJNN09d0K40M8HIb0Dfe+vevJhJ1kdqqu54LA+lviJBMhpmTzLd41hJM?=
 =?iso-8859-1?Q?B5Pv/NJXybBIpwFmIRwTFVC4GSnWmk4BFjaPuBaqv8u090UQpXJhlHqy+P?=
 =?iso-8859-1?Q?S6fse2F3yK8pOwDK3IGQmljLUWP6tP7U6JNhffb1qvf+9tCF36HkFU8LLP?=
 =?iso-8859-1?Q?3Ux9U/GohH1dc2TKjP98H8uJ2XJYNC/bLrL0XeqLxl2dLC1AECQ7BnSe0P?=
 =?iso-8859-1?Q?c4Op2tJCapdDSILFQo4QC5ylRbavZjf+e+ZiPfilWsV87VRKPHlYm7S52E?=
 =?iso-8859-1?Q?x2H7q8kk3AXgdE8WGpTcpzl5JrkJFuwM8XOEboGk/fwzPD4BN9ADNtxazU?=
 =?iso-8859-1?Q?vVTAXVGmgn9mKdFjjpsBG6QWjHN8DfnV/noKR54j56KjnfgQothWW7YDDZ?=
 =?iso-8859-1?Q?+GX8zDHkAWAXF/hCvgDAyKnBO3Hl6XzdCq4T/eDp99pXZ9N+Smaws3k9SH?=
 =?iso-8859-1?Q?5C4n7NfhSJLw1SpyGduwD0rdzTBBIDM38OR51LePxTDEsT+tcwlhZuW8cg?=
 =?iso-8859-1?Q?zASYbR6wPQeeuRFuN7fZf5XrRCKrZ1HNWalHOcJC94QSuf0mqWlKcLaZ+8?=
 =?iso-8859-1?Q?gnvemnVQUDSE28QeXoZC8tch4lxUZE1EX4YLAIdM6P8zTVqBO2EdeTENUJ?=
 =?iso-8859-1?Q?WbgoTmnxY/PmYpCBadEpjRbTDNonvHMNd6qtczvH+/kd8Tv1y0VXlQ+36R?=
 =?iso-8859-1?Q?Uj4y6Vml8NHNPbO3/1tRxbNwS57z3hVBu+gYOZy2CVEriQKxwV+I4UcOmq?=
 =?iso-8859-1?Q?Z3G8UwE8fp2WPXEqJSQTqKxu9nBc8ilbRyl0IUI2f5X9UwsR6ZvooCztVK?=
 =?iso-8859-1?Q?Ag8Ma1/NBCSY61askxowTPdI7s8oZZJwzX/tMQTAWAXGE9a7kF2FxQJaVy?=
 =?iso-8859-1?Q?zfue9XlVxtgluhzaivMh3LcAPHai4tnoGxVjC2gAZVbuMxD58XqCO0VP8p?=
 =?iso-8859-1?Q?LtFnEoNnUlr7CdxVL62vbMJR/mPBpzE+pxVDzz1MOYPx1yllWi+aCJz1k5?=
 =?iso-8859-1?Q?yT/Y5OKI6IKGRSuGKjRor6zbxiOyggCI3N1KPbkWGQzGRo210q1LcVVBDr?=
 =?iso-8859-1?Q?fVKA3fiWkdZN49gOzZAiDQ+ck7sqcflmftfA3J/2PPjrdpfxtfgdCwkNng?=
 =?iso-8859-1?Q?6qRu/qEpnpjIrnOBadtdHlpK2l6cAKAoBEim65jnBwp/g9fgMht8gBFOOZ?=
 =?iso-8859-1?Q?eL/eE1zZ4P/pq0XcWjiUZxkwSMLiVa6c7B1NgAIQg1pl+rzmzQQ+kzB60y?=
 =?iso-8859-1?Q?7Pg2YBDDCTY8nQb6Um/DgTGD+7zuNz04YZ4PGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qCqBXrKl2j1X3UG9gGCd5AjTHpzWbyjJXxNNGNoWQZsUbHJQrqlyG8TfOm?=
 =?iso-8859-1?Q?I4O43CymCjVxPxnHYofiLt/ghm1CBoc0oH5oeTrhuJdXg145knQ3k9q+zF?=
 =?iso-8859-1?Q?IADU1tHJiTB2lHZT7rfjpQJhr03GgNFO387H5YKJSm3EidEJ6kKPfmTKvx?=
 =?iso-8859-1?Q?GogaNzPI0Ip0UV26+8xIi+KIAqE3K+1xfMxCgscriICqtPK/Xgi5wAJrvu?=
 =?iso-8859-1?Q?ngCRjd+MkvOjFUv+Ts8Fb+ZvS2xhor13bp5/Kk1Gj7w6A/hYpYsRyDRNQi?=
 =?iso-8859-1?Q?hUndYnnkpJEAMcTnc13LQj54ykoVAcCo+IfMW2KW+F16vP24ORx2KbsXbi?=
 =?iso-8859-1?Q?Z7yK4ZF46KZz/OZWWVn5wSE9i4yZ8Ey7nrBVftSQD8sZDMeqKWp0r2PTK9?=
 =?iso-8859-1?Q?w/zZys42BbVc2PIljPhc+hrZYeZw2RLPbHVCHG5OirieYAmLW9zS0j2NXF?=
 =?iso-8859-1?Q?6VAmqYtyVk16WXfWAhDyFwoExVZTKb8jWhmC2x/meT8OPZojC8Cfd6ky3U?=
 =?iso-8859-1?Q?7GOAfbobEHvm1b4P/8CPDHFFXbrx4j/OB2WLHveU3VY0BAECwuYY4zUGRL?=
 =?iso-8859-1?Q?so1sseHrBeCy3zAehZIwzGb6Cb/FaazrAKdNog2p6VpmSR+Y1x/5NVEMoT?=
 =?iso-8859-1?Q?hfQ5HDdaS6BvI4GcqyPYbYmz1H7fqxiazZcrWkM8YlYAmrR0tDOhvdgGf9?=
 =?iso-8859-1?Q?wMePCOmlguVWVEUiKM7pKB80GBTG4KmN/3jqpHpS4Woo/9Vom8japzoctl?=
 =?iso-8859-1?Q?Rk+rie58UtT12/claPFmUG5kLPTvEiumYXTR51PgS1EJBwhoEp7Es7HKQg?=
 =?iso-8859-1?Q?OQgIY+zqU5ic7yAA3+wTIjO/5Wu35Oq9NkbFYSW0wWpz7XE4ampUpis6Zd?=
 =?iso-8859-1?Q?xEc2MBNLEeuKxnCwMeYxtAcO6RUl2eMRvSH+mhX++GGqvI9E9QSwb7HD8o?=
 =?iso-8859-1?Q?/WJpQ5E6zQppJp91zIFj9ykGQK5ezMwS7Jo27vSd6v+0sLpqHRYHAxyOKK?=
 =?iso-8859-1?Q?bQ6HKnsn2boDSaeuy6NDqZ2gktGG77DKTYRkg0muZp3/9cKg00S+fpVjAa?=
 =?iso-8859-1?Q?NYm4X/c0pQWoTbaqsuKwAEVpqjfPL5qRU5n+1VCZSTXSj2aCv2s3rVXs9e?=
 =?iso-8859-1?Q?6l5kSBNi5Eav6mdc3yWCL4rqPnO9Sqqd2x4+hpGhO2+u5d4U4UjywsUi3Z?=
 =?iso-8859-1?Q?RqzFUGtWcwZJnMg43mXGJSxfw7L2h1cVbJwBL8egtQPmoQjZJxmUMeO+aa?=
 =?iso-8859-1?Q?WfyGlkLPbPJlBqnI/mz3zrJudBCDOBf1qGXywcszZAi8Cz1oX2uWGF6j0N?=
 =?iso-8859-1?Q?eJ2D2eEP5OKYj7iU0CMmy1e9h1tc+nkbZalxOyzu57HEcxl8W/54/lzoj2?=
 =?iso-8859-1?Q?P6PLEMMFsJNJB9YHRz+bQoRLgcOWh0Blafr9QMGRQ6AkQVP7kaU1LvUE1Z?=
 =?iso-8859-1?Q?BsEwRoPHhSCirRRf4GMgWfY4GTOJV1Cmn/qEKwD9myh7rQHCLr2FBFJxfK?=
 =?iso-8859-1?Q?fSCPIoBaU+5Yi7KW9UuD4M81OTVizga7l9oRN5RANEPcSq/Q9i7GYm+wH9?=
 =?iso-8859-1?Q?zGpSckiltV6t9UG/cl6rOs7+0oyjRsTbTtBBSV9yYtwuTkeJ0c7FPaU3AN?=
 =?iso-8859-1?Q?Z/s+s22MKoQYABUYdmkRNlji0HoEnLZa7lKTtzsDzqtvtx62IMyqT2XQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ea6d75-5d4d-4158-17b2-08de0cb1a8dc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:43:51.7432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4IX8mdq4/b0Bv2QjvIIonvABTZs9/oVzwbj7G91EFDrMV+p8xCuUkI/n2N84PYUEOYRkXhroRFhIMrhSeBwRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
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

Here goes our first drm-intel-fixes round towards 6.18.

Thanks,
Rodrigo.

drm-intel-fixes-2025-10-16:
- Skip GuC communication warning if reset is in progress (Zhanjun)
- Couple frontbuffer related fixes (Ville)
- Deactivate PSR only on LNL and when selective fetch enabled (Jouni)
The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-10-16

for you to fetch changes up to 95355766e5871e9cdc574be5a3b115392ad33aea:

  drm/i915/psr: Deactivate PSR only on LNL and when selective fetch enabled (2025-10-15 10:12:43 -0400)

----------------------------------------------------------------
- Skip GuC communication warning if reset is in progress (Zhanjun)
- Couple frontbuffer related fixes (Ville)
- Deactivate PSR only on LNL and when selective fetch enabled (Jouni)

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Deactivate PSR only on LNL and when selective fetch enabled

Ville Syrjälä (2):
      drm/i915/frontbuffer: Move bo refcounting intel_frontbuffer_{get,release}()
      drm/i915/fb: Fix the set_tiling vs. addfb race, again

Zhanjun Dong (1):
      drm/i915/guc: Skip communication warning on reset in progress

 drivers/gpu/drm/i915/display/intel_fb.c            | 38 ++++++++++++----------
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   | 10 +++++-
 drivers/gpu/drm/i915/display/intel_psr.c           | 12 +++++--
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |  2 --
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |  9 ++++-
 5 files changed, 47 insertions(+), 24 deletions(-)
