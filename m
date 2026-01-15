Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57903D259F4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1010E79E;
	Thu, 15 Jan 2026 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ql9TU4nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E533310E188;
 Thu, 15 Jan 2026 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768493465; x=1800029465;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=KKNZPUqFw7HFZxD3P0dNskJm5+e2BjL/HfKTPrymRPk=;
 b=Ql9TU4nDpgjd9BZUqcf8xe8Ibh4S87qhy2SOXveKZomJq7TuwrDK7PHs
 4mk0QoNz4kPnVSjKQlaN4M4m6kg41qSpc8KXWJJQa9+evyagofFMW8OjN
 JhEVCEmdMiVlzVsDfENhRQ1SuGS/tR3BlOBY3gIGIv1833eg9isk+NK5q
 490sPGNVLOC5j8q+Qan1S+PKhjbA5U4BQNjWnY2NZQBbZcoxAXoNWr4iG
 ibhclQAhoHspBcresmj+d7MOzWHzMKb9JB21oJjz3P6pmfWGrqVFFpcuS
 Z/owKK/Ek8qx362TBJSRPzY8OtBdKV5iJKw/1ErBliT3xmBFOf2KxHpG/ g==;
X-CSE-ConnectionGUID: glo2ZTVBR0iJak0ySNFpHg==
X-CSE-MsgGUID: ygmGcxyFRpiMW0914G+4Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81247516"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="81247516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:11:04 -0800
X-CSE-ConnectionGUID: Ak6r8JZIStKpWw6jt7SUnA==
X-CSE-MsgGUID: gaxdyBmYQO2fBEtiDMTOFQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:11:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:11:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 08:11:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:11:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtDS6vfJU6PkwJ6O6xfgQi+zZVIc1jzunmdOOlx/PkkAeAH4Juw2vMsR5V+1/9b+B8rLM9iPvkNi1bnX/jArTCQ3ABbt3t9UDiB5IK2v/QHVt9Kd5Q53VuVPyjfcoV0GqIBaEYNCYJlWjxBBfSH8sMfSR5lFNiQ18MQx96L/zobW5Na6PLSlNQmQ+yMebaKIXOEqcjtVzBYc0iLMWH8+zW3IGaP8mpsUy7qQo+9EHJ+3Xa1psusl+CCH/dCpzDGK5BIKYHOmwoYGaNKKmzHLougPW4pn5QAclOHDkYXEYayMcitYBkAEBTcjps520vqTDcxxL+4mQkuJbhTxAxVoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLe27EyIsK+c85/2OS6x6qB5DC7js4kPq1syHlrWMSU=;
 b=ED3jh1DowBkEVo9zKZ3pmjMoxvzgB2TkLUC8qTR4Q5JRkSyxh17kqHi4RBqo8xGgA4riQVxTv+FOclnlV26Oajw/ZUTT0v7lBG+thOe8fndvrTxCw4GjmTPnkOiG+cK1aSXy/nsiJFTlhIHI6jPC/DsdnnwopSFjLKdn+vlAt001NMvNNvtNLLb6zq+YrrEMgMuj36CFgeb4aQKcRzMep35uzkh/Z0Fx0sayYBwwXseOSCxhWhoAjToEYafm3GyvLWCOEaRZ0dzIyzeh1azOKc7QTYly2wx07iSo6okX/JgtAmx7OaHw4HDm3//UEAs8w9R0V+4SII53K3f4oHGwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8708.namprd11.prod.outlook.com (2603:10b6:610:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:10:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 16:10:58 +0000
Date: Thu, 15 Jan 2026 11:10:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <aWkRjqiDTWu4zY3X@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c804819-59de-49cc-ce56-08de5450ab57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9r2+kUGkxchgD2D72q/4irjZHl43PU+0SkK92ziIeWT98+G3dlElfEKA0b?=
 =?iso-8859-1?Q?Flnsgl0OC3d7rl/qvjmI3ft008Cl2smng5ypY1/h0SPcgWOEuEUYh344by?=
 =?iso-8859-1?Q?9X/Z2Oe3OTItPrgPnfo0IwJkKNCIsunF4w7qbzzfHKpZ1ycu8ky+EoAP03?=
 =?iso-8859-1?Q?SvKJkld9zIE8ndRO9CbClhOtsWaD/3YeJ8xshppXisIcp/Qoj4kdDt4gS3?=
 =?iso-8859-1?Q?Iip+odiE6LcRoNnDjCQMZm2/8R4QsSSNrnnqnJcREQZUo+5mwXoZYWxxHf?=
 =?iso-8859-1?Q?1n8lGTsp6+LnFk8GvN3cBfBh2fzVswzMYxl744HjwKSLPiW2Mlm+MYxyF5?=
 =?iso-8859-1?Q?qzdzZcGWqXAzZB7kohiX8h6VBS2AZLMaXbceJkFXdSxJ39+xNxFWxCHMmJ?=
 =?iso-8859-1?Q?4DuPDYBuJjKCLmgQpgqqNp3Ri7lmDUj1T1/C2xgap+qlNSjnHTNXvBJsi9?=
 =?iso-8859-1?Q?z/R/vtZKDgMqmt33gb4rz03ok1N1fT7nTtWbTCAqCUqVXcxhhVU4U4NRHA?=
 =?iso-8859-1?Q?g6P1OqBej7zgnL21lWG/QYyLfLRr81Let8IyeHt69xEPTkRYcUGnGLSA1N?=
 =?iso-8859-1?Q?P+1hs0H7qE+mJezDwV9PW+qDdolv+t/2olJ46EaR6jhaTl8fYWU89J8SNM?=
 =?iso-8859-1?Q?SfoXAKV2z6cGcFifA5R3oVBv0tLk8ELtCGWylPcz9dE49go1zsEBlEKCdM?=
 =?iso-8859-1?Q?6W8K4ZeMJkmkXYy8tVgV2/1ZHAIvJ9WKeOA7s4og5jw5OtCqOmivI3qd66?=
 =?iso-8859-1?Q?jARC8EJZAXNmafs0IzLomY+56wxxv8I8jkWP8nYUpsTX7ySwEPpzQoggGo?=
 =?iso-8859-1?Q?08xMpC4x8VdcaDJTdHDD3Rt4arkzlAL2dGVFr9pEFyEnIzxYgdotlUz4ph?=
 =?iso-8859-1?Q?N1zK3dNdoIb8jxB26rODudadB4ZNZp6RAmID45Ar8qnI7oh0Pcncadp7rF?=
 =?iso-8859-1?Q?3PUE1/vXI8EBGoCPfq7KDhF183ccLkSLEoxOIASZpi6LQ3DLdquwt3Kpoy?=
 =?iso-8859-1?Q?EE80pgchqxPOUvfT4+DUPJZHMhI89EGq34WXH0HZ2NGpaj06wBsvCMmAN8?=
 =?iso-8859-1?Q?FU1uVOXji3ZYh9QhJI84+civOye0/6RrILxxdEVgPOR2p2y2lpMXZu3vOx?=
 =?iso-8859-1?Q?7+vQdPMyp/hy/ysvq/BbJB8Eyvwjo4L/BEdoaIhqsJpzitO0bnuWP7QPJd?=
 =?iso-8859-1?Q?+1HlPZc08WnN7sJZcyRkwKTZk67BuCfVFHjW+W/qg8KEnTj4vWRMXWfYTE?=
 =?iso-8859-1?Q?NWRZrpfVq41ZLke69OeXaObGWl9bD7fqW9c7pbpkdNAW4p37CDzQQMFftO?=
 =?iso-8859-1?Q?6H8C55/SSeKbtmKcg/Z0TP6g3sRIivkWQWiS9WmBczE+ap3qH8b6tusaDq?=
 =?iso-8859-1?Q?foCUQ1t3mz/cJ8Y73dQJfxzW2kYX0oZVizuIuIzWJ0r10MF4yXy7oqmXBl?=
 =?iso-8859-1?Q?yA7UaCNEmQFzlidelG5EPiqPffcUjTpzv8eXqYGkJP2pBJrCR8VMYKapJu?=
 =?iso-8859-1?Q?RSVhFTZhb2vfVkANPMJuTNBIi4oLEphuC0ENo2TBVpPNQxy0CWDteU3mGi?=
 =?iso-8859-1?Q?96lOylpYlCNCnj5HER5IGUERz3ad?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qRslAE7L5qIAY92PLUlwYLFQknEkF67mtbp9Tt1et8nXd9eD9ejBWX2W4g?=
 =?iso-8859-1?Q?ZHGR6g0KQKFL8xj7Ps1QsXPB9XM0aZe1cOfF568YIyLhQ/TC//M76cuZDa?=
 =?iso-8859-1?Q?sRFu8slzrzqQiYij1TkeqxwPa9TyC3NZvxGWx+R/TlqP7KNLwH02Gq6KXG?=
 =?iso-8859-1?Q?BJGeaoMu/mIotb0WWx+5TCfI/y1gtJrINAktBAEVqrWfND04Lqu/SxFJYY?=
 =?iso-8859-1?Q?uJViTt9xwXumgstBp8TtV8tx0+2uD4dI7GN7vAnJsxKPXynKG7odc6Op6I?=
 =?iso-8859-1?Q?bEZVZNaOnQjIv1BH7nzZqCNJw0xpYOI0z//DQg3wZbJc17hgnkVtptXfMB?=
 =?iso-8859-1?Q?Wl70q37AUR7djxqcvEeLVgyx+V1hH0PkF2ASWuqe8qGX7DCSbRhI3pSuag?=
 =?iso-8859-1?Q?JFTjruMYjS6zVDZ+Rde6mNYMZrsJVldDu3C5SAL4v+La0ZHsK8shZnQ1Ul?=
 =?iso-8859-1?Q?OVtimrVY5/4HhoyBa4IhvG4b9QH1vS2tRVq45pF6ThNjV0EXaiMm3H9BHV?=
 =?iso-8859-1?Q?jwc6JDJUUJRMp6YxuDFXeMQhC5z6GNc5vrEs7XxOwliQN0PE985u4RusxS?=
 =?iso-8859-1?Q?dCYt1abYAWnZt2hs0NPjnw3B1nhg2DHIkASEri2gHy/tXC6kc49htA4Bmh?=
 =?iso-8859-1?Q?XxqG4KZBi0iJMj2lusCTPnbjVWu/M8D6QUDz5KisQSIu4sZWZiDUD5ctSu?=
 =?iso-8859-1?Q?T5xQZMX3k3BDoktBdVijNYBMH3kWAFhu5QvZOYFD8BHmiyh7NjvjbPHjxu?=
 =?iso-8859-1?Q?kaKTSCAkTyhsftz18nt+WG5hXuOcfn0KlJxxhE4XieFIA7J7pkO3Y2neOl?=
 =?iso-8859-1?Q?hIT/Gdvl+OxAphJPPs7Go61JSwOCkVqajIeDbKW1Qc5C2bjL0tjHFtDTtE?=
 =?iso-8859-1?Q?8qanVv/QkuUaoVyBE3NrGaXnB+X8NIjo4i48kvVqsa5OLdSo+sYctQ7XHA?=
 =?iso-8859-1?Q?h7Tey4NLbB/FU3ddmxT1prTWdrfmetYM8FUu3aEKRIIGnHmv3J1ZoGmDpi?=
 =?iso-8859-1?Q?+We3aOygSFEaveUuv3wpMe/WfpV6yvJMfE/5BpEwm2Z3YABHxvaHGGGm41?=
 =?iso-8859-1?Q?NPEdz2Ry072T+xg1f3jPU1NhrnKc5E1jJuU+j9NINDVDiS6e4Rj6jTZM9s?=
 =?iso-8859-1?Q?XGGMxNo6UXM4ZlG1MKWsG296MMFFbZovC7GUyl/C8U/yw+AxaTh/zhyCsn?=
 =?iso-8859-1?Q?KyGqt46D6I69qVXFbo5cauYieRlSGzq+asIUEDc1AyNsQYo1VvuFmOhx/l?=
 =?iso-8859-1?Q?3whsatXFuFd1Xw4whHMZKNF8Pmi84TlBRY/c1GEVwOEtOjIPMTv5hRY1Jb?=
 =?iso-8859-1?Q?kG0UXS2hESCii4KiyZXyY1SHPW5FILVd/8zHWSS/vV6MGytMppVAL9CeYI?=
 =?iso-8859-1?Q?jQInQy8oBjrAUHCvRZMbPeR5/I7ziGQhfbA7zmsMpNIyjljzL3Z30YwZOZ?=
 =?iso-8859-1?Q?wLO1Rq0scDcw6EQ1DLEg49Y9m5+8Toan9/wWWnh26pla6+Q8QJVv3va5eq?=
 =?iso-8859-1?Q?yAJO264+/xO6JJYm/cG6Q8mnU3HkW1fbDtzOCpzka4i34V3z2CPOc0ZDUc?=
 =?iso-8859-1?Q?ilwNEt7NwzVQDFNQ94sqT7OaIfkyDB4C+o/HZmDnXIJCvgOG46Xoq1b6lp?=
 =?iso-8859-1?Q?vhurFlkfgUfTQ0kBnciz08eInuS+r+ZL5eZEIylpHkLPEAXmrZYzS+1Amm?=
 =?iso-8859-1?Q?PUkvYod+R2UGyNKhR3ct0u4XkJqMjA1nGWtYeA1vs/GzZJcTE9EusRFgYk?=
 =?iso-8859-1?Q?5blekkoOjihiZ5ml0asQiNUOY4IzkXjR2QTd8GKPhMk+hAB6xgfAOS++HX?=
 =?iso-8859-1?Q?C8eOBZj/ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c804819-59de-49cc-ce56-08de5450ab57
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:10:58.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cL0ZyvWFELxuAF+G+vLOwSgGRAYFaA15ImlHQ1aeaRKWZa6vNkO4y0mrIMZL8hLJuoJ4+ol7Ga1WTPnTwv1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8708
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

This is likely our last drm-xe-next PR towards 7.0. But perhaps
an extra one coming in the beginning of next week depending on
how the THP patches and a few other cases goes.

It is important to highlight that this PR brings a revert of a
flag in the new multi-queue uAPI that had been added in the first
PR of this round. After that PR, with multiple uAPI changes, I
scrutinized them and found out this flag was not used nor planned
to be used. Hence, I requested the removal before the 7.0 deadline.

Thanks,
Rodrigo.

drm-intel-next-2026-01-15-1:
UAPI Changes:
 - Remove unused KEEP_ACTIVE flag in the new multi queue uAPI (Niranjana)
 - Expose new temperature attributes in HWMON (Karthik)

Driver Changes:
 - Force i2c into polling mode when in survivability (Raag)
 - Validate preferred system memory placement in xe_svm_range_validate (Brost)
 - Adjust page count tracepoints in shrinker (Brost)
 - Fix a couple drm_pagemap issues with multi-GPU (Brost)
 - Define GuC firmware for NVL-S (Roper)
 - Handle GT resume failure (Raag)
 - Improve wedged mode handling (Lukasz)
 - Add missing newlines to drm_warn messages (Osama)
 - Fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue (Marco)
 - Page-reclaim fixes and PRL stats addition (Brian)
 - Fix struct guc_lfd_file_header kernel-doc (Jani)
 - Allow compressible surfaces to be 1-way coherent (Xin)
 - Fix DRM scheduler layering violations in Xe (Brost)
 - Minor improvements to MERT code (Michal)
 - Privatize struct xe_ggtt_node (Maarten)
 - Convert wait for lmem init into an assert (Bala)
 - Enable GSC loading and PXP for PTL (Daniele)
 - Replace use of system_wq with tlb_inval->timeout_wq (Marco)
 - VRAM addr range bit expansion (Fei)
 - Cleanup unused header includes (Roper)
The following changes since commit 35ec71285c9311395b14bedc60fa94f6b7e24d2d:

  drm/i915/pc8: Add parent interface for PC8 forcewake tricks (2025-12-19 21:28:48 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2026-01-15-1

for you to fetch changes up to d30f75d2dba913754dbacb982b19b783a30253ea:

  drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST (2026-01-13 18:42:21 +0200)

----------------------------------------------------------------
UAPI Changes:
 - Remove unused KEEP_ACTIVE flag in the new multi queue uAPI (Niranjana)
 - Expose new temperature attributes in HWMON (Karthik)

Driver Changes:
 - Force i2c into polling mode when in survivability (Raag)
 - Validate preferred system memory placement in xe_svm_range_validate (Brost)
 - Adjust page count tracepoints in shrinker (Brost)
 - Fix a couple drm_pagemap issues with multi-GPU (Brost)
 - Define GuC firmware for NVL-S (Roper)
 - Handle GT resume failure (Raag)
 - Improve wedged mode handling (Lukasz)
 - Add missing newlines to drm_warn messages (Osama)
 - Fix WQ_MEM_RECLAIM passed as max_active to alloc_workqueue (Marco)
 - Page-reclaim fixes and PRL stats addition (Brian)
 - Fix struct guc_lfd_file_header kernel-doc (Jani)
 - Allow compressible surfaces to be 1-way coherent (Xin)
 - Fix DRM scheduler layering violations in Xe (Brost)
 - Minor improvements to MERT code (Michal)
 - Privatize struct xe_ggtt_node (Maarten)
 - Convert wait for lmem init into an assert (Bala)
 - Enable GSC loading and PXP for PTL (Daniele)
 - Replace use of system_wq with tlb_inval->timeout_wq (Marco)
 - VRAM addr range bit expansion (Fei)
 - Cleanup unused header includes (Roper)

----------------------------------------------------------------
Ankit Nautiyal (16):
      drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk()
      drm/i915/display: Abstract pipe/trans/cursor offset calculation
      drm/i915/display: Add APIs to be used by gvt to get the register offsets
      drm/i915/gvt: Add header to use display offset functions in macros
      drm/i915/gvt: Change for_each_pipe to use pipe_valid API
      drm/i915/gvt: Use the appropriate header for the DPLL macro
      drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
      drm/i915/intel_alpm: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy_regs: Fix the SPDX identifier comment
      drm/i915/intel_display_params: Fix the SPDX identifier comment
      drm/i915/intel_dsb: Fix the SPDX identifier comment
      drm/i915/intel_dsb_buffer: Fix the SPDX identifier comment
      drm/i915/intel_gvt_api: Fix the SPDX identifier comment
      drm/i915/intel_lt_phy: Fix the SPDX identifier comment
      drm/i915/lt_phy_regs: Fix the SPDX identifier comment

Ben Dooks (1):
      drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported

Gustavo Sousa (3):
      drm/i915/display_wa: Keep enum intel_display_wa sorted
      drm/i915/cdclk: Implement Wa_13012396614
      drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider

Imre Deak (19):
      drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config()
      drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
      drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
      drm/i915/dp: Align min/max DSC input BPPs to sink caps
      drm/i915/dp: Align min/max compressed BPPs when calculating BPP limits
      drm/i915/dp: Drop intel_dp parameter from intel_dp_compute_config_link_bpp_limits()
      drm/i915/dp: Pass intel_output_format to intel_dp_dsc_sink_{min_max}_compressed_bpp()
      drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
      drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
      drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
      drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
      drm/i915/dp: Unify detect and compute time DSC mode BW validation
      drm/i915/dp: Use helpers to align min/max compressed BPPs
      drm/i915/dp: Simplify computing DSC BPPs for eDP
      drm/i915/dp: Simplify computing DSC BPPs for DP-SST
      drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
      drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
      drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
      drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST

Jani Nikula (30):
      drm/i915: move display/intel_plane_initial.c to i915_initial_plane.c
      drm/xe/display: rename xe_plane_initial.c to xe_initial_plane.c
      drm/i915: rename intel_plane_initial.h to intel_initial_plane.h
      drm/{i915, xe}: move initial plane calls to parent interface
      drm/{i915, xe}: deduplicate intel_initial_plane_config() between i915 and xe
      drm/{i915, xe}: deduplicate plane_config_fini() between i915 and xe
      drm/{i915, xe}: start deduplicating intel_find_initial_plane_obj() between i915 and xe
      drm/i915: return plane_state from intel_reuse_initial_plane_obj()
      drm/xe: return plane_state from intel_reuse_initial_plane_obj()
      drm/i915: further deduplicate intel_find_initial_plane_obj()
      drm/{i915, xe}: deduplicate intel_alloc_initial_plane_obj() FB modifier checks
      drm/{i915,xe}: deduplicate initial plane setup
      drm/{i915, xe}: pass struct drm_plane_state instead of struct drm_crtc to ->setup
      drm/{i915, xe}: pass struct drm_device instead of drm_device to ->alloc_obj
      drm/i915: drop dependency on struct intel_display from i915 initial plane
      drm/xe/display: drop i915_utils.h
      drm/i915: remove unused dev_priv local variable
      drm/xe/compat: remove unused forcewake get/put macros
      drm/xe/compat: convert uncore macro to static inlines
      drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
      drm/i915: drop i915 param from i915_fence{, _context}_timeout()
      drm/xe: remove compat i915_drv.h and -Ddrm_i915_private=xe_device hack
      drm/i915/utils: drop unnecessary ifdefs
      drm/i915/display: remove accidentally added empty file
      drm/i915/gvt: sort and group include directives
      drm/i915/gvt: include sched_policy.h only where needed
      drm/i915/gvt: reduce include of gt/intel_engine_regs.h
      drm/i915/gvt: reduce include of vfio.h
      drm/i915/gvt: include intel_display_limits.h where needed
      mei: late_bind: fix struct intel_lb_component_ops kernel-doc

Mitul Golani (12):
      drm/i915/display: Add source param for dc balance
      drm/i915/vrr: Add VRR DC balance registers
      drm/i915/vrr: Add DC Balance params to crtc_state
      drm/i915/vrr: Add state dump for DC Balance params
      drm/i915/vrr: Add compute config for DC Balance params
      drm/i915/vrr: Add function to check if DC Balance Possible
      drm/i915/vrr: Add function to reset DC balance accumulated params
      drm/i915/display: Add DC Balance flip count operations
      drm/i915/vrr: Write DC balance params to hw registers
      drm/i915/display: Wait for VRR PUSH status update
      drm/i915/display: Add function to configure event for dc balance
      drm/i915/vrr: Enable DC Balance

Suraj Kandpal (4):
      drm/i915/cx0: Use the consolidated HDMI tables
      drm/i915/ltphy: Remove state verification for LT PHY fields
      drm/i915/ltphy: Compare only certain fields in state verify function
      drm/i915/ltphy: Provide protection against unsupported modes

Tvrtko Ursulin (1):
      drm/xe: Fix ggtt fb alignment

Ville Syrjälä (6):
      drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
      drm/i915/vrr: Add functions to read out vmin/vmax stuff
      drm/i915/vblank: Extract vrr_vblank_start()
      drm/i915/vrr: Implement vblank evasion with DC balancing
      drm/i915/dsb: Add pipedmc dc balance enable/disable
      drm/i915/vrr: Pause DC Balancing for DSB commits

 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  17 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |   4 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  19 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  60 ++-
 drivers/gpu/drm/i915/display/intel_connector.c     |   2 -
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   8 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  13 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  46 +-
 .../gpu/drm/i915/display/intel_display_device.h    |  18 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   4 +-
 .../gpu/drm/i915/display/intel_display_params.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   3 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |  15 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  11 +
 drivers/gpu/drm/i915/display/intel_display_utils.h |   4 -
 drivers/gpu/drm/i915/display/intel_display_wa.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |  12 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  25 +
 drivers/gpu/drm/i915/display/intel_dmc.h           |   5 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  60 +++
 drivers/gpu/drm/i915/display/intel_dp.c            | 515 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_dp.h            |  17 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  77 +--
 drivers/gpu/drm/i915/display/intel_dram.c          |  42 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  31 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_gvt_api.c       |  43 ++
 drivers/gpu/drm/i915/display/intel_gvt_api.h       |  21 +
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 193 ++++++++
 ...intel_plane_initial.h => intel_initial_plane.h} |   6 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |  54 +--
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |   4 +-
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |   4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 442 ------------------
 drivers/gpu/drm/i915/display/intel_rom.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  46 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  35 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           | 281 ++++++++++-
 drivers/gpu/drm/i915/display/intel_vrr.h           |  10 +
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |  68 +++
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |   5 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  26 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |   4 +-
 drivers/gpu/drm/i915/gvt/display.c                 |  23 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   2 +-
 drivers/gpu/drm/i915/gvt/display_helpers.h         |  37 ++
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h                  |   7 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |   1 +
 drivers/gpu/drm/i915/gvt/execlist.c                |   2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |  14 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |   2 -
 drivers/gpu/drm/i915/gvt/firmware.c                |   4 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   9 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |  26 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  21 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |   5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  24 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |  13 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |   5 -
 drivers/gpu/drm/i915/gvt/opregion.c                |   3 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |   3 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |   3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   8 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |   2 +-
 drivers/gpu/drm/i915/gvt/trace_points.c            |   2 +
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   6 +-
 drivers/gpu/drm/i915/i915_config.c                 |   3 +-
 drivers/gpu/drm/i915/i915_config.h                 |  10 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   2 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
 drivers/gpu/drm/i915/i915_initial_plane.c          | 290 ++++++++++++
 drivers/gpu/drm/i915/i915_initial_plane.h          |   9 +
 drivers/gpu/drm/i915/i915_request.c                |   3 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   4 -
 drivers/gpu/drm/i915/intel_gvt.c                   |  13 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   4 +-
 drivers/gpu/drm/xe/Makefile                        |   6 +-
 .../gpu/drm/xe/compat-i915-headers/i915_config.h   |   5 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  22 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |   7 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  11 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   2 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c      | 189 ++++++++
 drivers/gpu/drm/xe/display/xe_initial_plane.h      |   9 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      | 321 -------------
 include/drm/intel/display_parent_interface.h       |  17 +
 include/drm/intel/intel_lb_mei_interface.h         |   3 +-
 95 files changed, 2017 insertions(+), 1443 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_initial_plane.c
 rename drivers/gpu/drm/i915/display/{intel_plane_initial.h => intel_initial_plane.h} (60%)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.c
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
