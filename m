Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E6A3E178
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93910E9BA;
	Thu, 20 Feb 2025 16:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqCprUxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F310E1E4;
 Thu, 20 Feb 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740070475; x=1771606475;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=/VymSkBujf1e7qhydU3u7pByEM6Ieo0VfZhuF+wIsNI=;
 b=HqCprUxoJLQIvX8hvGwJSghS1XW1SIRc3DTyYlTmwx0SweVzYEwCUHzh
 71tDq9KTUodwUMPpPE/qPUexk6QtRUIZy5fl76cpxwAM432Ar7onyAYZn
 ftMlnM7bg3mRT5q/jmucATZ6YMVRa7s0j4RHUwHauA8wvJpwBsi5CfHrf
 EvuuG5nWyZimEtTxuGP+788RXYVz0ZOI3Xzo0bAMHGVkg9sxUENyBXlL1
 AwwPbpNHvNm3TY7vqQrfWxkIV+mN6Vj5AUJvt4F/ZmQhk6Zae1GW0P8tn
 TRGXIkVRjOC60rIkTYbRhWXC21Axv3bPN4/e/EIwiu6bIVf6XiRARbJru w==;
X-CSE-ConnectionGUID: MjuHzo4LSA66w9iBFKaqKg==
X-CSE-MsgGUID: 3A9diIY5T+qVhqsHf3vySQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52267221"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="52267221"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 08:54:34 -0800
X-CSE-ConnectionGUID: GcSRWO/eQfi/CqWdabLDwg==
X-CSE-MsgGUID: PvZJGDw0TiafnrhH6cXPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="138310839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 08:54:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 08:54:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 08:54:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 08:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US0z0U0xahqf2OjaiPR2PCfK4hs0ZZCYgtgLDlHvYpxld3KczD0LhsfGB9lKBLifgcoRZzDo5EvmvPVs/9iZ3iZCc2+0GiiTrL2Z03NBdwcG5sDHp7U03ZTJx2ixfVUjPij99BP/t5oDtet1nbF+uOot0CTDQR8tkWKwiWiHYSUzlrXFp5N+/hLeCoyuk7cw682TLBh9J6iRKDXGGs1TaprP/FRqqDgxxsZ4a4md7v9roauMx0M1X8+B0YAmnCrFOJOydkp9yRS+wbFzX4OU46qs+bITluAapTmPVpsNjwDc2ZiJJvEFbfw3nB7zgWealoLQkHcGYcxmYL0dE///Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX5QYV7sVkRt1UFqSxcYFj/RBqZCMQXcgYYJ20RjrSw=;
 b=Irqm58X7bWFLgDoHM5Zv2CE2ExKdCIqvtUXMVPoF65v5/cWd7N3wypZOhwvMF/7T7WM0COW79Oh+b3koxlT1GKyKC4yIxcdT2l8d3LdwT9aUSID8BhV0DwZItwGb60oSdPKLW+eTnhmqZlrF6jGNg8vi2Dq09njp8r5c8yM2zNt1EPWsph41JdbmU53x4Oqwm9AIief1IGGQqAqighehymRqJiihMVDwBNVt3qmgd/reCy2qkH7tG3cJYBJl6JgZZVvFIpvBeuW05Pb7WASPGpaQJMZVLkyPez4qeEp13nTfPVED00xCvHxUT00Fw6NBBgIOMMApRXGCgjkhvI94fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 16:54:27 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 16:54:26 +0000
Date: Thu, 20 Feb 2025 11:54:21 -0500
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
Subject: [PULL] drm-xe-fixes
Message-ID: <Z7dePS3a9POnjrVL@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cdf0a8-9541-47ce-5aa2-08dd51cf3c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?A260lfz3UWbftjGj99A/Fz9VvmxWqck1xZseEj9y4CsNAkNyXYP6Jy1lto?=
 =?iso-8859-1?Q?gQNvTKmO8qqgGJrIWIgKipd66ELTaT34hsk3kK6Hm/gkeXdVWmWrmYrV2I?=
 =?iso-8859-1?Q?kydD5+EncMIy6cfkm7ZLX01GqRbBS0rLYGdWDA5HMIdXkqsyJ6nv15JEPQ?=
 =?iso-8859-1?Q?AEtDDq9upot5k88uzNuGG4zSFLR2UtQVF/zQFlEYNxavYtTEbsUz9vphxn?=
 =?iso-8859-1?Q?1e3G1tU037bK9J+1PhCeNyfyBj1+wd1ngAhEBkZDJsbYo9c70mUO/GM+Ut?=
 =?iso-8859-1?Q?B4PjUbf+4N4AAeGPZu804W6nCcoxv3vLnZwBdl7OeX+69q8CfDXkE/1uzz?=
 =?iso-8859-1?Q?6FwtVbxgEGgwE9c/EO1VW/AfsCs7lVigxuIvhJxJ8zxXutj56kgJ9WT7BN?=
 =?iso-8859-1?Q?qGVrwJcI+b8gxO711HALgUokxiKGrlvDS4j4Rj3PhSUgtL16JegX3fDrH8?=
 =?iso-8859-1?Q?ru1a5Bx/nIpbYPV4mqpX1C7MljuFj18AyYaXmdiQL5B8Qh9lfLW52zsFip?=
 =?iso-8859-1?Q?N5OHIHyVgiUg+XCj8IAsZ0XQvHwmrCJXgJEzRT84e4LWyEUqJc0G5Kmpyr?=
 =?iso-8859-1?Q?am5+MK4Kydvm0Rw4GgPRgMmlVle2fZF+by9DfYBZPhwvV5vNergmjt61kB?=
 =?iso-8859-1?Q?hPkWeSoQK3h3vCVDhyn05jbzctKlIWWMq76oZcnkL1cIAKrR/dcGAB25BQ?=
 =?iso-8859-1?Q?JbXrYfhj9zjnWCLAA9eNa4v7OpQFwbCzzCIaAmoy+dvmZfTDYxIP9tvadU?=
 =?iso-8859-1?Q?HASU8PxjRxmyRnMX/AQBa4Nr85UBU0qTCaWpXWqgGhEpmMwjiDHXG/pgwL?=
 =?iso-8859-1?Q?g45MjfjFtbzm7a9AGRJhflUdaM3sgAIxK6N99S9jdV3WG7I4FabVmU8DWY?=
 =?iso-8859-1?Q?y6pMRj6oOrM37qn4Coz19wWlu81Yjz2bg0/NAkYIXlF6vEAY7DJfkBXEHT?=
 =?iso-8859-1?Q?+l23dB7K4oiFIbqmxMjEboj3ai+ho8cpp9mXdObMnbneKf+G7srWnclymL?=
 =?iso-8859-1?Q?BhPj/FhBTDEsG8FQynt9rMeKHdui79dRcn1Gvhl3Pe5/NscSm2h5V4qo8a?=
 =?iso-8859-1?Q?SJW0XeeAoN/U/k5LaaCaiPQUdkMl0yDK1Y4p6a548DsxNsqO4RnFX4mOo6?=
 =?iso-8859-1?Q?rOMiyVtQSNAfp2m+N0J/LRG5E4ikTsBl74ANeVc1yjnMIDbQcDQbHfLw+p?=
 =?iso-8859-1?Q?dnabJjwVe6vhQnka70jDeEHetvp74ZDXyaKlD0nkbkwkJOcQN2oWJJM/wv?=
 =?iso-8859-1?Q?dzp0AB8y+esdPKMEGvIrfK0KsIT0h4U3uBfh4TRSHGClDrLzZQnCcQnMmP?=
 =?iso-8859-1?Q?MnoZfBViKl5UmRzkR4yiObjDGqTRWq92IgpWTUDbhErqtc45MFhptfkOLw?=
 =?iso-8859-1?Q?tjtL72hiu3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1lIm6/ELd7pErzFr9ELlNqInCrScEciSd9XMLSg2Wfyej9fiFNrQlaZTtW?=
 =?iso-8859-1?Q?zpeSuM05Lw5PUFxVUSFDaILFZzPMnrGD3Mx59G/lTPw255VPHMl3WekQb9?=
 =?iso-8859-1?Q?b0RcUA7DQREyVXBijZHRbSHYECGlNtSUyKIS8n0q7KdzYXzQ04aDSJrLeR?=
 =?iso-8859-1?Q?tUnQgHgv6qb6q2PEXMYPlnRhJImT7RFliBXCamdh6VuHbo+QBj6LL9pugu?=
 =?iso-8859-1?Q?YzE5OW15aYZYAXE7quApndKD5Jmj6yGNVPY8Ef4lOKdFfuNeASC8lRsyHR?=
 =?iso-8859-1?Q?vhp4Dw3+OiGN8SDlpD39opqUwW0q9lIGo+oXDDYT4oJ790FnBYKJw9bVVY?=
 =?iso-8859-1?Q?jGJsqKIQCSDClhC7PzVsZ0Iz2zVHW8P51qVbTyZFWo7Zv89jTs13VEq7ZJ?=
 =?iso-8859-1?Q?zpV87XR7eLPxZjvJKt93irMwfWg20jejDA8XUmhSz3EUCkxgvh7Pab4ar5?=
 =?iso-8859-1?Q?gAf92+odLMa+zwDshBz4p2eooOGHIdR0k1d7P7a/yryWoflooK7h9f5Qtw?=
 =?iso-8859-1?Q?qEZLuzOm4Pl4ypWEpvoghI8zC3nV4s7IHqO7UEDsuk23OljrTMTjuP583I?=
 =?iso-8859-1?Q?7XTyFd7QsKqV8nAp/zqddSoq9YosTtu67fKc0G7XSbhTOfU7ojuqDTKxhh?=
 =?iso-8859-1?Q?olgiALtMGh50cmjlTGaWJTFjZPZppog0iY8o7ZwJGNzA1NwA4Wd/Ffp/OQ?=
 =?iso-8859-1?Q?Zr3un+h69ndzIz8RMu9ayV8sc/ZVjrFwZasWXL+EIzk1Cx+uLFLEHgXruv?=
 =?iso-8859-1?Q?Wb6zmIUYBH3Ms2dXlR78y7FRj2IdOlPVBH97NipRF8JEwVQ9zvBk8Kgzgn?=
 =?iso-8859-1?Q?TLY4MRglXvncUeNZnalHKhydfm4txt+ZAWHvHkPRzTiF5f59S85znssgKL?=
 =?iso-8859-1?Q?2JvePLHVY0vzf8ff5oaLR5x60biSm36GMr7C55zVd9UXbHiSaxbXDt3Rj7?=
 =?iso-8859-1?Q?CDb7mpb3N9vr0IYwLQ3SsLnWlya608VjGEJTAjpBVXBXJz2xhD7R5n2N7W?=
 =?iso-8859-1?Q?vbjcWGKwepxRp04UD9V43NC45+cIyHNGkld/obi+DGsqFa5Ec5DbEHdeo+?=
 =?iso-8859-1?Q?8A55htXFxYg32ts0e18psvHKwGOwtvrR3c1h5lntgIjHMn+RApzA6lL9ma?=
 =?iso-8859-1?Q?gyywu6lk1WaZG1PAOzkHlFtiX5sYAfowVngswGgdEggBk0s2V4PqHQBDLh?=
 =?iso-8859-1?Q?ab9TyKIJ/QWfvwqHMzRQuTas9UTiZtW07FRGtCtXfouwhcS2gpRLf0zxKp?=
 =?iso-8859-1?Q?xwQb3jUTltDQOu1BITNSQ0TMJ+vmg+RIRaCF7uXAIduDgmUvAojBq2/4tG?=
 =?iso-8859-1?Q?O8hS94SU9KF2djCUFZqx8dZKJXfUw5vw62Pk0jFEI40C6KwKpKn9+/xwxg?=
 =?iso-8859-1?Q?W1VqlJ7KOlNe/S8pSeeQko5TTkzj8IMaP+1r3gZnfxvwzukNqGnvOWvSzu?=
 =?iso-8859-1?Q?G6PLxOKdBUVmKpxkENFJFhsXglrYCKEjStXFWaiAdJTm0iZAMbqrsYtREV?=
 =?iso-8859-1?Q?oYebiPH893YCVXqM5RvzPX0RshOHcRf6sgszkWVVXjcelQ13N1lzRF5bnN?=
 =?iso-8859-1?Q?jRGQ4VTZzjKMvPJT8i5XzGqQGECsBDHlrl4U41lN9wpsNdJ/Ogb/t+y68R?=
 =?iso-8859-1?Q?znCYqKzaLlWpdeYqwq7E4yZ2gOJ2g9vdmGnHzXH7FygpXVxzz3ceZVFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cdf0a8-9541-47ce-5aa2-08dd51cf3c16
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:54:26.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A1m7Y7qImzhI9PGiIocgMdDZtQTqrR78mU39vMWiZZ3ok5KXm6BRdilSOqGIra+xW0qjQMazIHPt2K9ZHiSSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Here goes our round of Xe fixes of this week.

Thanks,
Rodrigo.

drm-xe-fixes-2025-02-20:
- Fix error handling in xe_irq_install (Lucas)
- Fix devcoredump format (Jose, Lucas)

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-02-20

for you to fetch changes up to 213e24250feed3bcf58d7594298df2d7e78a88ab:

  drm/xe/guc: Fix size_t print format (2025-02-18 15:53:01 -0500)

----------------------------------------------------------------
- Fix error handling in xe_irq_install (Lucas)
- Fix devcoredump format (Jose, Lucas)

----------------------------------------------------------------
José Roberto de Souza (1):
      drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump

Lucas De Marchi (2):
      drm/xe: Fix error handling in xe_irq_install()
      drm/xe/guc: Fix size_t print format

 drivers/gpu/drm/xe/xe_guc_ct.c  |  6 ++++--
 drivers/gpu/drm/xe/xe_guc_log.c |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c     | 14 +-------------
 3 files changed, 7 insertions(+), 16 deletions(-)
