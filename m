Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE2B8A18D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5210EA57;
	Fri, 19 Sep 2025 14:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3gfA8Da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5510EA54;
 Fri, 19 Sep 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758293617; x=1789829617;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=A737y0cdKctpg3KsJDCBY8EPYlvWdNrUjKylwOnLfjs=;
 b=n3gfA8DapDrjaxI3SSZoP6HbKU95MsbJAYcpmSPpn48sIXk8WjAgXPps
 bUpxHsay2JEmXqMqr70QKx/SERsnaEsJq5aj/p1Jif5OOwe/JgyYwZYQU
 g8dLZQSAXonRQVVJUevBLkEO7teoTuEMT1e5euPpyM/pALb9P3LubVggU
 i2bEmoTkKr3G7u/s3GmbhW/5dYfz0e4FgqKvHd1gMuyHeo86GsftXFxFL
 1gZuQe9Y82fp/b14r9nYEPY7SDuQurnrvaTyGXuBEP7m/HYsC9Aa6+O/I
 0IzhkFGHS503NrmUcjomzhcf3eaq8ySzr90cnIcIIoXPbbEBjzL2miYAb g==;
X-CSE-ConnectionGUID: X51skvv3RHeh8+vr4vD4sQ==
X-CSE-MsgGUID: WsbWeSmGRKiw5wZ2fiv0Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60695286"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60695286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 07:53:36 -0700
X-CSE-ConnectionGUID: /HSuELHpSF68IrB78BPwww==
X-CSE-MsgGUID: yb3Ea1D/SsCTFBhDtyRE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="213010314"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 07:53:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 07:53:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 07:53:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 07:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc6rJp9eIgSDNLuapAW7DbPj/AltWmzrWqLYcW8ABCCEFNwn3rJBq7TzU1puhApZSTXXHrT+Tq3IQlE+v+HFpVCNWS2zThQuX5YUI8Jb49vLrz9FHj6y1k4/oQJh6MweeY7FD61PxkeQmbsJMPe5I8F9npbCRl0JtTtbbIgFjoXBbOwYGFZdFxmhc9EZ+x0faDqJkL7XJsafrERVKCZNJlkg51rFdwegm7TqJ888asUYe4uKyqV7eHWLspJ5oatZ2MCSaWNSApepajngmwRHNuh0KFCrko2Nk5DGUNm4gMCq9Edbq4fXad+R+5uha8SBLoXtpt7ssAsgrojGwsx6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++ZiADaw0M5/OXgBdTgNE0+b7lZ2ufajBCiUGg7l10I=;
 b=vRlxINwOmLyWRDM24ZSXtEJIMfVeCJK1YmRUGaE1xtZCcYwtB6FECPzEfIZ72EiRc99U1TEZ8eG36s1Ohv6FDKG+zmhIZ80faYPbYrGK4VxIn7mhtR0/YD3lnCP26LT0D+/33AMNR7loCVj+Go0sk62AoiTZzPpmFh0TG0u50cUqRFsfVE2XcnqoEydV3cGq/T3CFXprrOMZrbgzYrgd44rmdfRYa6XN+l+TeyfC8t5/tSe4xR2U17t6raQAdg7j+Bnfc410Ovu0WHyrEMzbpn+wMftd+/AiItf+H9Ww9pUf75Apswjh3Ytvm9ZAUxiMPDTzHMXuyBlNOKPDGEaN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:53:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 14:53:31 +0000
Date: Fri, 19 Sep 2025 09:53:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <c2et6dnkst2apsgt46dklej4nprqdukjosb55grpaknf3pvcxy@t7gtn3hqtp6n>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd1f03c-63d9-4c1e-4878-08ddf78c4cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QnWKprE5Z+24QA6cL8IQojuhin5DeG6PTnXfueVPHzQeZGeTPNnvzSpQ7U?=
 =?iso-8859-1?Q?SMn4wu6ExWrCc+MqENESUTRjN9Wx7Yt/EGd/2MfUIAbTFu4em3jAu41NBF?=
 =?iso-8859-1?Q?AdOqcmasEKdOhZhp8a1383JsanQE0QEXu5IAs6aU6jFEKt97ZPU7G8MA4w?=
 =?iso-8859-1?Q?oz6d/AH6nmcqKRx2+Ep76rdBNyFGgr54Ud5nEbl9xi9iaNUbEAfYNZNqT4?=
 =?iso-8859-1?Q?nqQguVkL+f9UbUF5YdPhC0nVlSy51KnwZvIAUoH+/1JQDmuv83YsCED4/E?=
 =?iso-8859-1?Q?i/+nIXyASqNONfSdCs0dl2QNByN57nT1OKc3gCqCeYZ0aqRBHYkDm9w+/Q?=
 =?iso-8859-1?Q?EMs4IS2X0mYjHn+zGbkmnq78mej94bU+kxLCSiAYzLotBJLTpAZxNMoW6J?=
 =?iso-8859-1?Q?LxBPzSOozHtYG2dKQkDlOISrupKR5jWwyy+ookRr8I6QkT5ItfGyEa9rLB?=
 =?iso-8859-1?Q?rg0xt48kSw5pdoci4UNOdEvmrg8ZsxQhgWa7uwsgxw+kXvpc6y39wlL1pa?=
 =?iso-8859-1?Q?vYQv6/lYXSYQEvfJVmIt075FCGG08DfPntplZTjbxzI5dd+6SrCRBULS/5?=
 =?iso-8859-1?Q?iOTT8jGrpbinw9kQXFyA3UcdK1dXp/v5fDsqSA6OmW4BzdsKFdGi7lvOx7?=
 =?iso-8859-1?Q?ImBBsS19RuCY6o3uhUZ8MGcWZJLs0BWzcleExdKugHEug4jpiyUSRVnTrg?=
 =?iso-8859-1?Q?CE9jetkP4ed3mOW0rObGnO6cQPKVjZhdwDw54g1+cbk14gRHIKfNPJ4Ivf?=
 =?iso-8859-1?Q?dO9BrAzercTzs5vrIzdeVsgMcgs9rVv7MDAw/9L9DnNJMCbTJuwbtJ1UyI?=
 =?iso-8859-1?Q?7BqUROu1/WNAu89MOlKzTYumiUYJ6CNlD5iSxW5sEag7N7lMEpAqLE7Wnq?=
 =?iso-8859-1?Q?EYHrkljiNlr+mPKlRD6Mlp/ybQ0cVr0x08ZOmXZy6p/WwXtqxG6SE0CveQ?=
 =?iso-8859-1?Q?snpUqRd1NYOQxjhTQvYlhDWQ2G1Tm0wMokGDZFS+dFCXwssl20dbzEtzWu?=
 =?iso-8859-1?Q?Crxokr6F/1l8GgUS5QougRYgJ2rD1ogRXL7hnirOzXGBn8UXQN/9qMVs3Z?=
 =?iso-8859-1?Q?AQiUEf0WB+ubMvZbznNSDRxw/tsxvt7R37YKSPpYmTasktsp1LtTHJG900?=
 =?iso-8859-1?Q?5GAJqhWQO4dppKg5MvKmubZor5vNF36hSXwUlUJ2RKowt+lu0wZPCirHJA?=
 =?iso-8859-1?Q?NBP10hHEfugVrMNv5VAeCzjAf7P5DyxWC9eEFcjxRFSF2tYmpCsvWm04KV?=
 =?iso-8859-1?Q?pdw1O1pE5KjWebobuI+4dZAboXKC7usPXpezNF40lMjfjmypqTiilxHPcc?=
 =?iso-8859-1?Q?ugeAU/RJaIexz/P+q/8CmpBwZZeI/bMQuhRiOS2zBe+MKy+W1dZYt7H7Vj?=
 =?iso-8859-1?Q?dpQCUvogB8TZ9bbB8nwsZB89IwH2e9HnFDJGxrTGUuXAOttgyAJN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Hjb13INiCnVUHx6bpnNYcdn/vLUE78WOzXdoYvRDHvGReFtgnVd2VSuBXa?=
 =?iso-8859-1?Q?p30DsaMNPATCgIODoQ0ku7mJfx5uN8/zEplxdiNHXRG5MiDdZbZsBLLuS8?=
 =?iso-8859-1?Q?RFYx9DR/5o6HXaNVJf79c7ZoXr4wYmstkTjh5egFpf2UODgyVjUNt1iY1o?=
 =?iso-8859-1?Q?JxJ1/628NdXsV0jgp4JRVxuZBrf++6eizK1ajc/iXeCbSwB+GTVd8FWVqC?=
 =?iso-8859-1?Q?znS4scYV/KJUAJZsARx7WxzcsFXuJWsXVuFtvDCKKb8mRoddCUlFfG2kPD?=
 =?iso-8859-1?Q?UyNXaI64A9Ws4E4YyVDaMQ1+VncT7krVbhvVgZv3qG5CWob6wBG6vSbIXQ?=
 =?iso-8859-1?Q?A2rrp6PtOk9yN6Z5NGXXq09MM8oyEhK//R7exwjteWCGPIa3M5//Jbltdn?=
 =?iso-8859-1?Q?mUa3Yum8TT//GEdASpvUzC5OQdXiAq10plMH/AnZAVjIqhQ3+BiuLHcXeu?=
 =?iso-8859-1?Q?km/EqBs4KtkM57McWRT4W2Tkn51O14mG1xWq7sl2v57fENlig/c6nexurD?=
 =?iso-8859-1?Q?BwhYBqpIF8Pk7RdEGMtKg9jMdRf0zv0JiUIfmeKOjRoDJrTUWrFueJjRBh?=
 =?iso-8859-1?Q?QUo311A5z3ttXKR/ZeghPAGzUn3OnrITbg26nxaJAms8LtJh9kqBag7IQ7?=
 =?iso-8859-1?Q?KowZJboYe40lJ6xjI7yoOd0UK/EBpcPax5KERJQLFOMUZDMeJr/LNQ6zn5?=
 =?iso-8859-1?Q?VzU/rjvqbGVwSX6RAUP+e1/mdpNDxfRa74X4sEsuDniOQiFf2wpnrz/DiE?=
 =?iso-8859-1?Q?luZpTINUxGjsBO6bhEbT3a6/LTVzhXXDElupyB1BHaFIVEe8Qn4A6uF249?=
 =?iso-8859-1?Q?6K5KBC1kf72AYbG4BRZoytVZLJAHFLOqD1BpmG12PKobeSWFGYxmAMmpkV?=
 =?iso-8859-1?Q?M0mDyqzEHlLKP7Wt++JP8IUP0r4CQkc16SqcyXJpJVDhcSwqyGvvkro8Ys?=
 =?iso-8859-1?Q?Kpo8YxSCtvRawGQLZrZQQt/tJqN+CVMnHmAbEK+xfhhf8Q2uB1cnc5w4nV?=
 =?iso-8859-1?Q?x29zPp05JGuRTiJehAtNApnnEnOJ27XzJNUVMyKW/T6JTxZbj/8Pksb2Ip?=
 =?iso-8859-1?Q?IOi+2x5cb93aNFSApp1wonwdiYBZOToeMqrRFgzvnfipj/YKVf/HTLHcSz?=
 =?iso-8859-1?Q?EAo6JMtUaVBQB0D2m1TlvGwnarzFZbPQufWJ9XOQf4X6gqdPDXEMkcMbLO?=
 =?iso-8859-1?Q?BQrYe0MmTlZLRStPlZlKsfRC6MK+Pn55zqu7ayXUBa6czftCbWkRuWCSzE?=
 =?iso-8859-1?Q?J0dvQMVTJ2Pzxl4TdrheJuhi/+CArx7n2x46AN1lEyqKSmZteWtCUWZEHr?=
 =?iso-8859-1?Q?MlwHTGn8Ah8sPhtkwr9QlVZHNwO6tGSUAAN88HWLqF/+qn81Kz/+biIA3n?=
 =?iso-8859-1?Q?eF1+0DFSYkI9z53KhmATI6FOWaU7mX0WVE8SJ0x7ff1lsGD4jjtzEhzwCw?=
 =?iso-8859-1?Q?VPtI8OWSo5HET+qCvE67+Sn7+uwlkk9OZNuRgl7tPKdlW5I+bGRBCOUJTi?=
 =?iso-8859-1?Q?QkyEr7oyT9ApCPAOqcA6+Szzmh3GKI+Z/L3P1y0JdnCnsWdmX1McMoVBmz?=
 =?iso-8859-1?Q?F6yzI2V0d0dOAvWEz8cIhgYCTnc1Cb5Tze8AO9J7LzgT7yDPK6GDwOSFLl?=
 =?iso-8859-1?Q?XcZpdUY3TzNxA2ak4aVdPDLjR3HRqrJ888OUvjIDW53VBng7NL/XqzCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd1f03c-63d9-4c1e-4878-08ddf78c4cad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:53:31.4925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4PtQZU1+aBQv055uryS/K7tFzOaffXXkkQwFa5mugdoiV9rxKiTdASnu0tJvAVLQx1JN0HIUY8s0XacGjtUnKeialn8/+HivwtzhsEVAKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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

Hi Dave and Sima, here's the last pull request towards 6.18 for xe.
Several refactors and code moving around with a few big changes.

This is reproducing a bug in dim in which triggers a warning about
"missing mandatory Ack from maintainer" for commit 9e9787414882
("drm/xe/userptr: replace xe_hmm with gpusvm").

Other 5 commits around gpusvm are also triggering that warning, but
those seem legitimate. Since gpusvm is currently only used by Xe and
people involved are the main authors, I hope that is fine. I also have
an offline ack from Maarten for these patches. I will take a look in dim
to understand what's happening and how this escaped. For the escape it's
probably because the check was skipped for the first patch, since it's a
bug in dim, but then it also skipped for subsequent patches in the same
series when pushing.

thanks
Lucas De Marchi

drm-xe-next-2025-09-19:
UAPI Changes:
  - Drop L3 bank mask reporting from the media GT on Xe3 and later. Only
    do that for the primary GT. No userspace needs or uses it for media
    and some platforms may report bogus values.
  - Add SLPC power_profile sysfs interface with support for base and
    power_saving modes (Vinay Belgaumkar, Rodrigo Vivi)
  - Add configfs attributes to add post/mid context-switch commands
    (Lucas De Marchi)

Cross-subsystem Changes:
  - Fix hmm_pfn_to_map_order() usage in gpusvm and refactor APIs to
    align with pieces previous handled by xe_hmm (Matthew Auld)

Core Changes:
  - Add MEI driver for Late Binding Firmware Update/Upload
    (Alexander Usyskin)

Driver Changes:
  - Fix GuC CT teardown wrt TLB invalidation (Satyanarayana)
  - Fix CCS save/restore on VF (Satyanarayana)
  - Increase default GuC crash buffer size (Zhanjun)
  - Allow to clear GT stats in debugfs to aid debugging (Matthew Brost)
  - Add more SVM GT stats to debugfs (Matthew Brost)
  - Fix error handling in VMA attr query (Himal)
  - Move sa_info in debugfs to be per tile (Michal Wajdeczko)
  - Limit number of retries upon receiving NO_RESPONSE_RETRY from GuC to
    avoid endless loop (Michal Wajdeczko)
  - Fix configfs handling for survivability_mode undoing user choice when
    unbinding the module (Michal Wajdeczko)
  - Refactor configfs attribute visibility to future-proof it and stop
    exposing survivability_mode if not applicable (Michal Wajdeczko)
  - Constify some functions (Harish Chegondi, Michal Wajdeczko)
  - Add/extend more HW workarounds for Xe2 and Xe3
    (Harish Chegondi, Tangudu Tilak Tirumalesh)
  - Replace xe_hmm with gpusvm (Matthew Auld)
  - Improve fake pci and WA kunit handling for testing new platforms
    (Michal Wajdeczko)
  - Reduce unnecessary PTE writes when migrating (Sanjay Yadav)
  - Cleanup GuC interface definitions and log message (John Harrison)
  - Small improvements around VF CCS (Michal Wajdeczko)
  - Enable bus mastering for the I2C controller (Raag Jadav)
  - Prefer devm_mutex of hand rolling it (Christophe JAILLET)
  - Drop sysfs and debugfs attributes not available for VF (Michal Wajdeczko)
  - GuC CT devm actions improvements (Michal Wajdeczko)
  - Recommend new GuC versions for PTL and BMG (Julia Filipchuk)
  - Improveme driver handling for exhaustive eviction using new
    xe_validation wrapper around drm_exec (Thomas Hellström)
  - Add and use printk wrappers for tile and device (Michal Wajdeczko)
  - Better document workaround handling in Xe (Lucas De Marchi)
  - Improvements on ARRAY_SIZE  and ERR_CAST usage (Lucas De Marchi,
    Fushuai Wang)
  - Align CSS firmware headers with the GuC APIs (John Harrison)
  - Test GuC to GuC (G2G) communication to aid debug in pre-production
    firmware (John Harrison)
  - Bail out driver probing if GuC fails to load (John Harrison)
  - Allow error injection in xe_pxp_exec_queue_add()
    (Daniele Ceraolo Spurio)
  - Minor refactors in xe_svm (Shuicheng Lin)
  - Fix madvise ioctl error handling (Shuicheng Lin)
  - Use attribute groups to simplify sysfs registration
    (Michal Wajdeczko)
  - Add Late Binding Firmware implementation in Xe to work together with
    the MEI component (Badal Nilawar, Daniele Ceraolo Spurio, Rodrigo
    Vivi)
  - Fix build with CONFIG_MODULES=n (Lucas De Marchi)


The following changes since commit 1047bd82794a1eab64d643f196d09171ce983f44:

   drm/xe: Fix incorrect migration of backed-up object to VRAM (2025-08-29 15:30:57 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-09-19

for you to fetch changes up to d9b2623319fa20c2206754284291817488329648:

   drm/xe: Fix build with CONFIG_MODULES=n (2025-09-19 05:41:01 -0700)

----------------------------------------------------------------
UAPI Changes:
  - Drop L3 bank mask reporting from the media GT on Xe3 and later. Only
    do that for the primary GT. No userspace needs or uses it for media
    and some platforms may report bogus values.
  - Add SLPC power_profile sysfs interface with support for base and
    power_saving modes (Vinay Belgaumkar, Rodrigo Vivi)
  - Add configfs attributes to add post/mid context-switch commands
    (Lucas De Marchi)

Cross-subsystem Changes:
  - Fix hmm_pfn_to_map_order() usage in gpusvm and refactor APIs to
    align with pieces previous handled by xe_hmm (Matthew Auld)

Core Changes:
  - Add MEI driver for Late Binding Firmware Update/Upload
    (Alexander Usyskin)

Driver Changes:
  - Fix GuC CT teardown wrt TLB invalidation (Satyanarayana)
  - Fix CCS save/restore on VF (Satyanarayana)
  - Increase default GuC crash buffer size (Zhanjun)
  - Allow to clear GT stats in debugfs to aid debugging (Matthew Brost)
  - Add more SVM GT stats to debugfs (Matthew Brost)
  - Fix error handling in VMA attr query (Himal)
  - Move sa_info in debugfs to be per tile (Michal Wajdeczko)
  - Limit number of retries upon receiving NO_RESPONSE_RETRY from GuC to
    avoid endless loop (Michal Wajdeczko)
  - Fix configfs handling for survivability_mode undoing user choice when
    unbinding the module (Michal Wajdeczko)
  - Refactor configfs attribute visibility to future-proof it and stop
    exposing survivability_mode if not applicable (Michal Wajdeczko)
  - Constify some functions (Harish Chegondi, Michal Wajdeczko)
  - Add/extend more HW workarounds for Xe2 and Xe3
    (Harish Chegondi, Tangudu Tilak Tirumalesh)
  - Replace xe_hmm with gpusvm (Matthew Auld)
  - Improve fake pci and WA kunit handling for testing new platforms
    (Michal Wajdeczko)
  - Reduce unnecessary PTE writes when migrating (Sanjay Yadav)
  - Cleanup GuC interface definitions and log message (John Harrison)
  - Small improvements around VF CCS (Michal Wajdeczko)
  - Enable bus mastering for the I2C controller (Raag Jadav)
  - Prefer devm_mutex of hand rolling it (Christophe JAILLET)
  - Drop sysfs and debugfs attributes not available for VF (Michal Wajdeczko)
  - GuC CT devm actions improvements (Michal Wajdeczko)
  - Recommend new GuC versions for PTL and BMG (Julia Filipchuk)
  - Improveme driver handling for exhaustive eviction using new
    xe_validation wrapper around drm_exec (Thomas Hellström)
  - Add and use printk wrappers for tile and device (Michal Wajdeczko)
  - Better document workaround handling in Xe (Lucas De Marchi)
  - Improvements on ARRAY_SIZE  and ERR_CAST usage (Lucas De Marchi,
    Fushuai Wang)
  - Align CSS firmware headers with the GuC APIs (John Harrison)
  - Test GuC to GuC (G2G) communication to aid debug in pre-production
    firmware (John Harrison)
  - Bail out driver probing if GuC fails to load (John Harrison)
  - Allow error injection in xe_pxp_exec_queue_add()
    (Daniele Ceraolo Spurio)
  - Minor refactors in xe_svm (Shuicheng Lin)
  - Fix madvise ioctl error handling (Shuicheng Lin)
  - Use attribute groups to simplify sysfs registration
    (Michal Wajdeczko)
  - Add Late Binding Firmware implementation in Xe to work together with
    the MEI component (Badal Nilawar, Daniele Ceraolo Spurio, Rodrigo
    Vivi)
  - Fix build with CONFIG_MODULES=n (Lucas De Marchi)

----------------------------------------------------------------
Alexander Usyskin (2):
       mei: bus: add mei_cldev_mtu interface
       mei: late_bind: add late binding component driver

Badal Nilawar (7):
       drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw
       drm/xe/xe_late_bind_fw: Initialize late binding firmware
       drm/xe/xe_late_bind_fw: Load late binding firmware
       drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
       drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
       drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
       drm/xe/xe_late_bind_fw: Extract and print version info

Christophe JAILLET (1):
       drm/xe/hwmon: Use devm_mutex_init()

Colin Ian King (1):
       drm/xe/guc: Fix spelling mistake "sheduling" -> "scheduling"

Dan Carpenter (1):
       drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()

Daniele Ceraolo Spurio (3):
       drm/xe/guc: Set RCS/CCS yield policy
       drm/xe: Fix error handling if PXP fails to start
       drm/xe: Allow error injection for xe_pxp_exec_queue_add

Fushuai Wang (1):
       drm/xe: Use ERR_CAST instead of ERR_PTR(PTR_ERR(...))

Harish Chegondi (3):
       drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a const
       drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
       drm/xe/xe3: Extend Wa_18041344222 to graphics IP versions 30.00 and 30.01

Himal Prasad Ghimiray (2):
       drm/xe: Fix indentation in xe_zap_ptes_in_madvise_range
       drm/xe/vm: Fix error handling in xe_vm_query_vmas_attrs_ioctl()

John Harrison (7):
       drm/xe/guc: Clean up of GuC 'CTL' defines
       drm/xe/guc: Fix badly worded error message
       drm/xe/guc: Update CSS header structures
       drm/xe/guc: Add firmware build type to available info
       drm/xe: Allow freeing of a managed bo
       drm/xe/guc: Add test for G2G communications
       drm/xe/guc: Return an error code if the GuC load fails

Julia Filipchuk (2):
       drm/xe: Extend Wa_13011645652 to PTL-H, WCL
       drm/xe/guc: Recommend GUC v70.49.4 for PTL, BMG

Lucas De Marchi (12):
       drm/xe/configfs: Use config_group_put()
       drm/xe: Update workaround documentation
       drm/xe/configfs: Fix documentation warning
       drm/xe: Use ARRAY_SIZE in guc_waklv_init()
       drm/xe/configfs: Extract function to parse engine
       drm/xe/configfs: Allow to select by class only
       drm/xe/lrc: Allow to add user commands on context switch
       drm/xe/configfs: Add post context restore bb
       drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
       drm/xe/lrc: Allow to add user commands mid context switch
       drm/xe/configfs: Add mid context restore bb
       drm/xe: Fix build with CONFIG_MODULES=n

Mallesh Koujalagi (1):
       drm/xe/hwmon: Remove type casting

Matt Roper (1):
       drm/xe: Never report L3 bank mask for media GT going forward

Matthew Auld (9):
       drm/gpusvm: fix hmm_pfn_to_map_order() usage
       drm/gpusvm: use more selective dma dir in get_pages()
       drm/gpusvm: pull out drm_gpusvm_pages substructure
       drm/gpusvm: refactor core API to use pages struct
       drm/gpusvm: export drm_gpusvm_pages API
       drm/xe/vm: split userptr bits into separate file
       drm/xe/userptr: replace xe_hmm with gpusvm
       drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
       drm/xe: improve dma-resv handling for backup object

Matthew Brost (2):
       drm/xe: Add clearing stats to GT debugfs
       drm/xe: Add more SVM GT stats

Michal Wajdeczko (32):
       drm/xe/debugfs: Move sa_info from gt to tile directory
       drm/xe/guc: Set upper limit of H2G retries over CTB
       drm/xe/configfs: Don't touch survivability_mode on fini
       drm/xe/configfs: Prepare to filter-out configfs attributes
       drm/xe/configfs: Don't expose survivability_mode if not applicable
       drm/xe: Allow to stub lookup for graphics and media IP
       drm/xe/kunit: Update struct xe_pci_fake_data step declarations
       drm/xe/kunit: Introduce xe_pci_fake_data_desc()
       drm/xe/kunit: Drop custom struct platform_test_case
       drm/xe/kunit: Promote fake platform parameter list
       drm/xe/kunit: Drop xe_wa_test_exit
       drm/xe: Fix broken kernel-doc for the struct xe_bo
       drm/xe/guc: Rename xe_guc_register_exec_queue
       drm/xe/guc: Use proper flag definitions when registering context
       drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
       drm/xe/vf: Use single check when calling VF CCS functions
       drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
       drm/xe/vf: Move VF CCS data to xe_device
       drm/xe/vf: Move VF CCS debugfs attribute
       drm/xe/debugfs: Make residencies definitions const
       drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
       drm/xe/guc: Always add CT disable action during second init step
       drm/xe/guc: Don't invoke disable_ct action during replacement
       drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
       drm/xe: Keep xe_gt_err() macro definitions together
       drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
       drm/xe: Prepare format for GT-oriented messages in one place
       drm/xe: Add dedicated printk macros for tile and device
       drm/xe: Use tile-oriented messages in GGTT code
       drm/xe/tests: Add pre-GMDID IP descriptors to param generators
       drm/xe/vf: Don't expose sysfs attributes not applicable for VFs
       drm/xe/sysfs: Simplify sysfs registration

Nitin Gote (1):
       drm/xe: defer free of NVM auxiliary container to device release callback

Raag Jadav (1):
       drm/xe/i2c: Enable bus mastering

Rodrigo Vivi (1):
       drm/xe: Fix circular locking dependency

Sanjay Yadav (1):
       drm/xe/migrate: Remove unneeded emit_pte() when copying CCS only

Satyanarayana K V P (2):
       drm/xe/guc: Add devm release action to safely tear down CT
       drm/xe/vf: Enable CCS save/restore only on supported GUC versions

Shuicheng Lin (3):
       drm/xe/tile: Release kobject for the failure path
       drm/xe: Misc refine for svm
       drm/xe/madvise: Fix ioctl argument check

Tangudu Tilak Tirumalesh (1):
       drm/xe: Extend Wa_22021007897 to Xe3 platforms

Thomas Hellström (18):
       drm/xe: Attempt to bring bos back to VRAM after eviction
       drm/xe: Allow the pm notifier to continue on failure
       drm/xe: Block exec and rebind worker while evicting for suspend / hibernate
       drm/xe: Pass down drm_exec context to validation
       drm/xe: Introduce an xe_validation wrapper around drm_exec
       drm/xe: Convert xe_bo_create_user() for exhaustive eviction
       drm/xe: Convert SVM validation for exhaustive eviction
       drm/xe: Convert existing drm_exec transactions for exhaustive eviction
       drm/xe: Convert the CPU fault handler for exhaustive eviction
       drm/xe/display: Convert __xe_pin_fb_vma()
       drm/xe: Convert xe_dma_buf.c for exhaustive eviction
       drm/xe: Rename ___xe_bo_create_locked()
       drm/xe: Convert xe_bo_create_pin_map_at() for exhaustive eviction
       drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction
       drm/xe: Rework instances of variants of xe_bo_create_locked()
       drm/xe: Convert pinned suspend eviction for exhaustive eviction
       drm/xe: Fix uninitialized return values
       drm/xe: Work around clang multiple goto-label error

Varun Gupta (1):
       drm/xe: Fix driver reference in FLR comment

Vinay Belgaumkar (1):
       drm/xe/guc: Add SLPC power profile interface

Yang Li (1):
       drm/xe: Remove duplicate header files

Zhanjun Dong (1):
       drm/xe/guc: Increase GuC crash dump buffer size

Zongyao Bai (1):
       drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

  drivers/gpu/drm/drm_gpusvm.c                       | 297 +++++--
  drivers/gpu/drm/xe/Kconfig                         |   2 +-
  drivers/gpu/drm/xe/Kconfig.debug                   |   1 +
  drivers/gpu/drm/xe/Makefile                        |   5 +-
  drivers/gpu/drm/xe/abi/guc_actions_abi.h           |   3 +
  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |   5 +
  drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |  25 +
  .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |  15 +-
  drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |  18 +-
  drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |  10 +-
  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  71 +-
  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   8 +-
  drivers/gpu/drm/xe/display/xe_plane_initial.c      |   4 +-
  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   1 +
  drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   3 -
  drivers/gpu/drm/xe/tests/xe_bo.c                   |  36 +-
  drivers/gpu/drm/xe/tests/xe_dma_buf.c              |  26 +-
  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c         | 776 ++++++++++++++++++
  drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |   2 +
  drivers/gpu/drm/xe/tests/xe_migrate.c              |  66 +-
  drivers/gpu/drm/xe/tests/xe_pci.c                  | 225 ++++-
  drivers/gpu/drm/xe/tests/xe_pci_test.h             |   6 +-
  drivers/gpu/drm/xe/tests/xe_wa_test.c              |  91 +--
  drivers/gpu/drm/xe/xe_bb.c                         |   4 +-
  drivers/gpu/drm/xe/xe_bo.c                         | 909 +++++++++++++++------
  drivers/gpu/drm/xe/xe_bo.h                         |  78 +-
  drivers/gpu/drm/xe/xe_bo_types.h                   |  15 +-
  drivers/gpu/drm/xe/xe_configfs.c                   | 468 +++++++++--
  drivers/gpu/drm/xe/xe_configfs.h                   |  12 +-
  drivers/gpu/drm/xe/xe_debugfs.c                    |  66 +-
  drivers/gpu/drm/xe/xe_device.c                     |  11 +-
  drivers/gpu/drm/xe/xe_device_sysfs.c               |  98 +--
  drivers/gpu/drm/xe/xe_device_types.h               |  25 +-
  drivers/gpu/drm/xe/xe_dma_buf.c                    |  70 +-
  drivers/gpu/drm/xe/xe_eu_stall.c                   |   5 +-
  drivers/gpu/drm/xe/xe_exec.c                       |  40 +-
  drivers/gpu/drm/xe/xe_exec_queue.c                 |  22 +-
  drivers/gpu/drm/xe/xe_exec_queue_types.h           |   8 +-
  drivers/gpu/drm/xe/xe_execlist.c                   |  25 +-
  drivers/gpu/drm/xe/xe_execlist_types.h             |   2 +-
  drivers/gpu/drm/xe/xe_ggtt.c                       |  27 +-
  drivers/gpu/drm/xe/xe_ggtt.h                       |   5 +-
  drivers/gpu/drm/xe/xe_gsc.c                        |   8 +-
  drivers/gpu/drm/xe/xe_gt.c                         |   2 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  73 +-
  drivers/gpu/drm/xe/xe_gt_freq.c                    |  28 +
  drivers/gpu/drm/xe/xe_gt_mcr.c                     |   2 +-
  drivers/gpu/drm/xe/xe_gt_mcr.h                     |   3 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c               |  28 +-
  drivers/gpu/drm/xe/xe_gt_printk.h                  |  32 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  22 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |  24 +-
  drivers/gpu/drm/xe/xe_gt_stats.c                   |  57 +-
  drivers/gpu/drm/xe/xe_gt_stats.h                   |   1 +
  drivers/gpu/drm/xe/xe_gt_stats_types.h             |  33 +
  drivers/gpu/drm/xe/xe_gt_topology.c                |  48 +-
  drivers/gpu/drm/xe/xe_gt_topology.h                |   4 +
  drivers/gpu/drm/xe/xe_guc.c                        |  52 +-
  drivers/gpu/drm/xe/xe_guc.h                        |   4 +
  drivers/gpu/drm/xe/xe_guc_ads.c                    |   4 +-
  drivers/gpu/drm/xe/xe_guc_ct.c                     |  55 +-
  drivers/gpu/drm/xe/xe_guc_ct.h                     |   1 +
  drivers/gpu/drm/xe/xe_guc_engine_activity.c        |  13 +-
  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   4 +-
  drivers/gpu/drm/xe/xe_guc_fwif.h                   |  30 +-
  drivers/gpu/drm/xe/xe_guc_log.h                    |   2 +-
  drivers/gpu/drm/xe/xe_guc_pc.c                     |  67 ++
  drivers/gpu/drm/xe/xe_guc_pc.h                     |   2 +
  drivers/gpu/drm/xe/xe_guc_pc_types.h               |   2 +
  drivers/gpu/drm/xe/xe_guc_submit.c                 | 142 +++-
  drivers/gpu/drm/xe/xe_guc_submit.h                 |   4 +-
  drivers/gpu/drm/xe/xe_hmm.c                        | 325 --------
  drivers/gpu/drm/xe/xe_hmm.h                        |  18 -
  drivers/gpu/drm/xe/xe_hwmon.c                      |  45 +-
  drivers/gpu/drm/xe/xe_i2c.c                        |   2 +-
  drivers/gpu/drm/xe/xe_late_bind_fw.c               | 464 +++++++++++
  drivers/gpu/drm/xe/xe_late_bind_fw.h               |  17 +
  drivers/gpu/drm/xe/xe_late_bind_fw_types.h         |  75 ++
  drivers/gpu/drm/xe/xe_lmtt.c                       |  12 +-
  drivers/gpu/drm/xe/xe_lrc.c                        |  90 +-
  drivers/gpu/drm/xe/xe_migrate.c                    |  47 +-
  drivers/gpu/drm/xe/xe_nvm.c                        |   5 +-
  drivers/gpu/drm/xe/xe_oa.c                         |   6 +-
  drivers/gpu/drm/xe/xe_pci.c                        |  40 +-
  drivers/gpu/drm/xe/xe_pci_types.h                  |   1 +
  drivers/gpu/drm/xe/xe_pm.c                         |  54 +-
  drivers/gpu/drm/xe/xe_printk.h                     | 129 +++
  drivers/gpu/drm/xe/xe_psmi.c                       |  24 +-
  drivers/gpu/drm/xe/xe_pt.c                         | 157 ++--
  drivers/gpu/drm/xe/xe_pt.h                         |   3 +-
  drivers/gpu/drm/xe/xe_pt_types.h                   |   2 -
  drivers/gpu/drm/xe/xe_pxp.c                        |   1 +
  drivers/gpu/drm/xe/xe_pxp_submit.c                 |  34 +-
  drivers/gpu/drm/xe/xe_query.c                      |   5 +-
  drivers/gpu/drm/xe/xe_rtp.c                        |   6 +
  drivers/gpu/drm/xe/xe_rtp.h                        |   3 +
  drivers/gpu/drm/xe/xe_sriov.c                      |  14 +-
  drivers/gpu/drm/xe/xe_sriov.h                      |   2 +-
  drivers/gpu/drm/xe/xe_sriov_vf.c                   | 115 ++-
  drivers/gpu/drm/xe/xe_sriov_vf.h                   |   6 +
  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |  75 +-
  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h               |  17 +
  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h         |  44 +-
  drivers/gpu/drm/xe/xe_sriov_vf_types.h             |  12 +-
  drivers/gpu/drm/xe/xe_survivability_mode.c         |  14 +-
  drivers/gpu/drm/xe/xe_svm.c                        | 370 ++++++---
  drivers/gpu/drm/xe/xe_svm.h                        |  63 +-
  drivers/gpu/drm/xe/xe_tile_debugfs.c               | 135 +++
  drivers/gpu/drm/xe/xe_tile_debugfs.h               |  13 +
  drivers/gpu/drm/xe/xe_tile_printk.h                | 127 +++
  drivers/gpu/drm/xe/xe_tile_sysfs.c                 |  12 +-
  drivers/gpu/drm/xe/xe_tlb_inval.c                  |   3 +-
  drivers/gpu/drm/xe/xe_uc_fw.c                      |  29 +-
  drivers/gpu/drm/xe/xe_uc_fw_abi.h                  | 130 ++-
  drivers/gpu/drm/xe/xe_uc_fw_types.h                |   3 +
  drivers/gpu/drm/xe/xe_userptr.c                    | 319 ++++++++
  drivers/gpu/drm/xe/xe_userptr.h                    | 107 +++
  drivers/gpu/drm/xe/xe_validation.c                 | 278 +++++++
  drivers/gpu/drm/xe/xe_validation.h                 | 192 +++++
  drivers/gpu/drm/xe/xe_vm.c                         | 651 +++++----------
  drivers/gpu/drm/xe/xe_vm.h                         |  57 +-
  drivers/gpu/drm/xe/xe_vm_madvise.c                 |  40 +-
  drivers/gpu/drm/xe/xe_vm_types.h                   | 105 +--
  drivers/gpu/drm/xe/xe_wa.c                         |  63 +-
  drivers/gpu/drm/xe/xe_wa_oob.rules                 |   4 +-
  drivers/misc/mei/Kconfig                           |  13 +
  drivers/misc/mei/Makefile                          |   1 +
  drivers/misc/mei/bus.c                             |  13 +
  drivers/misc/mei/mei_lb.c                          | 312 +++++++
  include/drm/drm_gpusvm.h                           |  64 +-
  include/drm/intel/i915_component.h                 |   1 +
  include/drm/intel/intel_lb_mei_interface.h         |  70 ++
  include/linux/mei_cl_bus.h                         |   1 +
  133 files changed, 6994 insertions(+), 2379 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
  create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_printk.h
  create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.c
  create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.h
  create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h
  create mode 100644 drivers/gpu/drm/xe/xe_userptr.c
  create mode 100644 drivers/gpu/drm/xe/xe_userptr.h
  create mode 100644 drivers/gpu/drm/xe/xe_validation.c
  create mode 100644 drivers/gpu/drm/xe/xe_validation.h
  create mode 100644 drivers/misc/mei/mei_lb.c
  create mode 100644 include/drm/intel/intel_lb_mei_interface.h
