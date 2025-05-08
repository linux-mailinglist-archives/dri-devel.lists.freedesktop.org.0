Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD1AAFB65
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 15:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A5310E396;
	Thu,  8 May 2025 13:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5xEkoQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D194A10E095;
 Thu,  8 May 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746711157; x=1778247157;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=nI8Rp5PuNc9aadU0e34EKGsgfhNVjacMowaK3dimwDA=;
 b=W5xEkoQ3StdZyo9knoTKAGnG59RwgaLZiLW4XbQk3tatxNvayqQvYYAJ
 XxsnG69gUZf3numbBaq4P7ap/0MjXA7lnmPfds8tcNe//kq5kdaH9F42u
 nPA2DXFZpF0ujFPY0FOwZPF/TII4CDNV1KQELKW2/hQbxagd/Lxv4GdY5
 GdbRGNzYQNBGmEH9fX6baXH8m5hsy8fce1Nqc5SPUStWx8DOKAMDjw6Wr
 3CsY5Hx5HfLTrzXjzx7I/UFQHB7URodWFjgsKVwub2zgmfKEYcXlywD65
 Kx7XJCpLwEEPXHTr9O2Yx+cgyGLvAt3Si01b1/Zdo/550Q/RhTcPf3h56 A==;
X-CSE-ConnectionGUID: AWSavCt8Ty+kzRAxB5AUdQ==
X-CSE-MsgGUID: sFtVeIyURI6P6lqZaH7vmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73873037"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="73873037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:32:35 -0700
X-CSE-ConnectionGUID: vf8AUEagTf6TDEo1DJyF+w==
X-CSE-MsgGUID: atv05KXFQfeD7sx3HwzcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="167381449"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:31:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 06:31:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 06:31:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 06:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sp0goproBylKcd0CFNwv1u8gGxXQCGhBq/HiDiK4CS29jIke/2TwhiJ0TOD8dsAnDHjYL3QzfHYgdSF3tS4jIz5Ab4aJ7tj1msZD6y75JS3azgU7bAgTVxgQWhed5YQY43fdkW8DSdCRDOucmMRz32k8XpA/5za0i7onUA9ylWcCXwoQRJP72slnV6XMy0GBFtMcn4A8smMTkzFuE2UuWM7qO7JZw+led5gsiEYIX/VJHbJZOxXNAYJ6uzR6J/XdwLRLf3/ZelkMrfqCA8anzjLAC0gKCmGdH3oAErv+JKIt7nims77IWxO1ElsJuroi7tm2mIxQobDNnKM+MLZA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHnLBXpA04DyR78/KT6VWatrkiRbh0T+z9ex1kg/p0A=;
 b=G0p2gGafranJT+GkVpnxZTkOAWKZLDBq8/Gq4kBAWJeGOM57MfLw8/iFb1XJm7pWXBzHlYBV3gFrdJCV1FSgF9296VeHXjhEPJkMZ92KVzPJIRu95jx5IqmlSeFPsmPygUH1VO8GcOiOe2nt5aOuMtuwWr5Grfly9luJ/AB7RTx1wigJq3snD7YhdmjGLlSFTnx4yAE2xUzufn19CfaXmLsOKx2ULHU5GblNQ5fyzgG83zvgUhdeQsMxhFUaYHgme3cNJOLbn9+LttnjJQkpPV07O8qjJKPsMXYD1CLXipHg+mKptq/aTunIFn8v0Li7cLfRUsB2ArZz8266IefVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 13:31:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 13:31:32 +0000
Date: Thu, 8 May 2025 09:31:27 -0400
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
Message-ID: <aByyL3bEufPu79OM@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:303:b6::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb0f6f8-ba38-45b3-96b9-08dd8e34a5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oqMErJRZF9EOyIhuf9hF3jXSyyRHvN3ayQ2C/tCXnYBzcvWJkhHVXE04pg?=
 =?iso-8859-1?Q?euCw2yJOmP/3bsZakUSJ1lIU6Ha31MGkqOWZWIO/1JsPPR2XV+0Vqb0tdE?=
 =?iso-8859-1?Q?ErT9CmeFHF5A9jTm+6r8UWLMqlNn9LbfF+qJLyaSmI2Z1rl8EuO3+tSQRq?=
 =?iso-8859-1?Q?lYdyKhcVyqXPIfCGwZiemDogma0Y8AGnjo2GB8ZD08FewP1wx86OjHvLE7?=
 =?iso-8859-1?Q?dQOxuiE0J3KR8k6idCKwSRDzeYLU0H+k9TqgERp1Hoo/WZ9jTi/jp52uAM?=
 =?iso-8859-1?Q?p+8TySYIrcjuq1/KUtCw7tdA6Rh9jJommOROqDUffHfib4lsCGfJlWnyl2?=
 =?iso-8859-1?Q?uqUtE5OB+4DRRcrtnK0cXMUrIEl0PJvLqUNi+LPibnFHgNeDZxwsaf0kYq?=
 =?iso-8859-1?Q?o8sP5RWJmbFEaqb8RmLO1kgjXOZVabg3oVpWtlzLrIuQMarUad5zZvSGTR?=
 =?iso-8859-1?Q?9vLf3ECSYYd1VzKtO9lBLIp5VwEkDYmJW4Ai/7yCdqlsEbbvtIA/2uwxcO?=
 =?iso-8859-1?Q?3mCeVgMcXareRo+nUcQMHz+TMZ78jcbsPNJe87QF0e56XcmspD9YDmqIvY?=
 =?iso-8859-1?Q?Lld3Q3aAwDj7gnH62ZXiiTQZVP1NJ4Z+gVud+qlqBtyKG5xSCiTV8NqrEM?=
 =?iso-8859-1?Q?aHyTP2tR5WdOINEx+BYaHi7PjfaY/e25H9mmCOArmLnbdoUcwlghOYogEQ?=
 =?iso-8859-1?Q?m0a9BbneXaZaxNEOs28AdNdVMyE4XEemJePff2dbCCnrX7Nu+A3Wwy6KwN?=
 =?iso-8859-1?Q?MxlIX9O53bZAjYpAWu4RFf8hh4zas4tjJMceNRz2mBMh3j5gNkPzhJ0H50?=
 =?iso-8859-1?Q?xsHoYUwU3D2Sw6m+9j3vmp2hSQl8RZ7sGZUaCFaOEVk5lbQvhwVQjLlRmG?=
 =?iso-8859-1?Q?5orj6rsoecIAJeKVxOprJNrDXH9lWLejmqnyOx5nK6sic5dRnGSiWWdger?=
 =?iso-8859-1?Q?QrCp5Vqhe99EfSY6x42LIYHhlDTTLSanDq0b4bHMpD3qRqmBguDLjM0Ndc?=
 =?iso-8859-1?Q?Tcya3XhnpBwq3CIBZtcDOP2EI+h+XOEa6MgoOkxbwH+OZ+lgBRG6l/uHtp?=
 =?iso-8859-1?Q?GQdyzs+Fa6kQj8D6NhTM5Bh1crEAcmzTfWKJ6FFRImRcncILXQ7Zv4iT4C?=
 =?iso-8859-1?Q?i6HRaZUpRp91BlGtnCxecs7/b6S4d5+UyPSLFmi6RZ/NuEA3B2EYGj8DGI?=
 =?iso-8859-1?Q?+f0DDkLEdIBr9zP7CiBOtUwfdnGCxnj5agK2p9zc20Lbn/GU0sron+Xel/?=
 =?iso-8859-1?Q?QdzP54tnMiy0eVBx6gf1FAP0Oiwd9NUx2Uv6no9m8etuBOsWBjIebHYNGZ?=
 =?iso-8859-1?Q?D4+GXGvLWW1geYGGNmhMHU3je0VpgZ1UfL7/yFCm37B7lZaypC6neXnv3x?=
 =?iso-8859-1?Q?Rbz43tjrSGJ/aqjNejaqHLicu+ox+45+1o+oVTyGeEeJ6tcNAptmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y4nv/UXMzYDj5OXj53NiK0CcMbfPouxCempmP2QkYq/Ujc8qkxHbYGXRWq?=
 =?iso-8859-1?Q?bnS43FunUJZKnf+Xnv4KmEcPkimV8yXpDobwA+SaEr9cmYi4cyEZZnFvow?=
 =?iso-8859-1?Q?gGdBFyS37jzJMG4HNSmCY2PZpdXyS9Ao5lDiCRZECPxK8OXLOglHN5YWIU?=
 =?iso-8859-1?Q?IPyVOD/oRb1Z6hiXhgO4TZAvI7W/t5MEiTGsf+mFhj2WkZ042CCquNvGV0?=
 =?iso-8859-1?Q?yXsOJwzkpNf+Ni5JqMTeN/g952BZNXWFcNtnKy6SmJUuKkbQLQrdEkF/WR?=
 =?iso-8859-1?Q?8Gojfti6Xx+0o0Smnfhq3GZG6EYlr8WR8R2qF64C3xvwbxfse2GI4aej4r?=
 =?iso-8859-1?Q?1hoykJIOT0XKRMhruC8CRjFpaYBfx2XITV3iqQ1AB7v7mVmuX2cQVISfBX?=
 =?iso-8859-1?Q?Bs3duBKVJgktjtIiVZKZRAYYAZxQN2iciwD92SWl1j+iouFMoqY1mPPBfN?=
 =?iso-8859-1?Q?Bh6IYtgEJGsHgeIsGPwMWR0DcBxLwYxf7h7f/2/6BuL1YEn/SCs2MYBk3T?=
 =?iso-8859-1?Q?omcL/KbXayz6CLZog0aMaal+xbUg4jR1puNDs4nbpjjIByPs86/NF0Q8aN?=
 =?iso-8859-1?Q?13SeLa8dBGk+br2Yqk8esfKfiMXDNxt0CMUyuPbTJS1sfXT1OJ71LzYXrP?=
 =?iso-8859-1?Q?QGkDPSXRQVhqNU7+WvDiWMbTtVfWX2NQ1xm0Ch63IMDBgFOsXOgBPj89zZ?=
 =?iso-8859-1?Q?R/klBlXbnvdxYDqBetZ1rWg2vwQvkScLWJknqhMf2kVVkG8Ci+UAYWDOfo?=
 =?iso-8859-1?Q?lZrpN6vwYkR6RcvhQi+CJLeJiV0s396H5+tvP8u3HZozsk2ItTau2sd93d?=
 =?iso-8859-1?Q?IFS4PNusOvyXWbyVa36L0j7XOwBrRWEGyA+STY8OfB9y/MOcD+3A6h5Ira?=
 =?iso-8859-1?Q?iURfyiMdeoywuyYWmQx0Sx+AuYlnt0KH5wbEJqeOor+pzkkQleOO7QlRuW?=
 =?iso-8859-1?Q?9o7hEn8npr+JF/6wV7WprJHh6ZLRm8WntxBS5aNfTSxOpU+3QcJ+w/nkdz?=
 =?iso-8859-1?Q?fdbP7oxK+70x1EjYKPfAtmcA7Cz1nlWZv/Utq7jU+6t7wYSrHUxd+FwWLm?=
 =?iso-8859-1?Q?PsPg1VIhAo5ABWQQEjeGHY4wH1DZqFx3nZKT50QwhqJt5P1N7wVm0fiPt3?=
 =?iso-8859-1?Q?Ocf1+FgKrzAQhERS4UhsFuBWJbxAvTZhKtROddjeKy77/VH/0JwRdK+NND?=
 =?iso-8859-1?Q?kY2oJUf0j7UriKYMiVJeC+X3FntLGY1jv4cuXwR5WIrcWELS6wyQyELqdw?=
 =?iso-8859-1?Q?1FX3nnCVFzh6iMZSZSLzJV7r+uJXPzhQFZHeHcWbMBPyYOjv3N+DufW0mp?=
 =?iso-8859-1?Q?yZyW4B16N9dfiFTZzkbm7I01Dzflau5orEbHw3YewzWYeq7HUagRTJBWjO?=
 =?iso-8859-1?Q?F9aZ9bkT8j3ClEuFS5tXD+Cp2YzPg5b4JIuSXnEOSvRiAkL3t/fXLHlb9e?=
 =?iso-8859-1?Q?lwWBL2yFHiFurzqYwcBfscQteaoWVLv5dJuKdd966R/gbB1b3Cj4/JX5g1?=
 =?iso-8859-1?Q?Jb6h08L/ytoGNzxrSab+ri/dWKfKzCFEZELxMtDH3H6PSsP8bgOrO2/Sw1?=
 =?iso-8859-1?Q?UKygJtapogaKyt8DCQsCRUamKSW1MTHOzGIAjzvzy2ZUvg0hTU28jeBCpG?=
 =?iso-8859-1?Q?Rhp2yBvJblKfJ85tNZLG5BIvYj4V7Qd7YWDMlSv7Qjw1cw+Z1L7vsXGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb0f6f8-ba38-45b3-96b9-08dd8e34a5b0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:31:32.8457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIVEBR9nldxpH2G33mfkYp5SRXkzIr5ET/ABhoFwmAU/MEynh2O7n7jxwpQrGitPRzYojC/dahkDCPs1LKElMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
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

Here goes our likely last drm-intel-next PR towards 6.16.

Mostly with patches targeting the full display split.

Thanks,
Rodrigo.

drm-intel-next-2025-05-08:
Non-display related:
- Fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

Display related:
- More work towards display separation (Jani)
- Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards (Jouni)
- DSC checks for 3 engines (Ankit)
- Add link rate and lane count to i915_display_info (Khaled)
- PSR fixes and workaround for underrun on idle (Jouni)
- LOBF enablement and ALMP fixes (Animesh)
- Clean up VGA plane handling (Ville)
- Use an intel_connector pointer everywhere (Imre)
- Fix warning for coffeelake on SunrisePoint PCH (Jiajia)
- Rework/Correction on minimum hblank calculation (Arun)
- Dmesg clean up (Jani)
- Add a couple of simple display workarounds (Ankit, Vinod)
- Refactor HDCP GSC (Jani)
The following changes since commit 1954629dc649b25071eec0d353288c5ee303e358:

  drm/i915/debugfs: move PCH type to display caps (2025-04-11 09:47:39 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-05-08

for you to fetch changes up to ecd9352cd92784717670e22a5ebd890ca0ae980e:

  drm/i915/rps: fix stale reference to i915->irq_lock (2025-05-07 15:44:19 +0300)

----------------------------------------------------------------
Non-display related:
- Fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

Display related:
- More work towards display separation (Jani)
- Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards (Jouni)
- DSC checks for 3 engines (Ankit)
- Add link rate and lane count to i915_display_info (Khaled)
- PSR fixes and workaround for underrun on idle (Jouni)
- LOBF enablement and ALMP fixes (Animesh)
- Clean up VGA plane handling (Ville)
- Use an intel_connector pointer everywhere (Imre)
- Fix warning for coffeelake on SunrisePoint PCH (Jiajia)
- Rework/Correction on minimum hblank calculation (Arun)
- Dmesg clean up (Jani)
- Add a couple of simple display workarounds (Ankit, Vinod)
- Refactor HDCP GSC (Jani)

----------------------------------------------------------------
Animesh Manna (11):
      drm/i915/lobf: Add lobf enablement in post plane update
      drm/i915/lobf: Add debug print for LOBF
      drm/i915/lobf: Disintegrate alpm_disable from psr_disable
      drm/i915/lobf: Add fixed refresh rate check in compute_config()
      drm/i915/lobf: Update lobf if any change in dependent parameters
      drm/i915/lobf: Add debug interface for lobf
      drm/i915/lobf: Add mutex for alpm update
      drm/i915/lobf: Check for sink error and disable LOBF
      drm/i915/alpm: Add intel_psr_need_alpm() to simplify alpm check
      drm/i915/display: Disintegrate sink alpm enable from psr with lobf
      drm/i915/alpm: Check for alpm support before accessing alpm register

Ankit Nautiyal (2):
      drm/i915/display: Add macro for checking 3 DSC engines
      drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices

Arun R Murthy (2):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: move min_hblank from dp_mst.c to dp.c

Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

Imre Deak (2):
      drm/i915/dp: Use an intel_connector pointer everywhere
      drm/i915/hdmi: Use an intel_connector pointer everywhere

Jani Nikula (57):
      drm/i915/pch: move PCH detection to intel_display_driver_early_probe()
      drm/i915/pch: clean up includes
      drm/i915/dpio: have chv_data_lane_soft_reset() get/put dpio internally
      drm/i915: use 32-bit access for gen2 irq registers
      drm/i915: record GEN2_IER in gtier[0] for pre-ilk error capture
      drm/i915: stop recording IER in error capture
      drm/i915: use display snapshot mechanism for display irq regs
      drm/i915: don't capture DERRMR for VLV/CHV
      drm/i915: use graphics version instead of PCH split in error capture
      drm/i915/irq: convert ibx_irq_reset() into ibx_display_irq_reset()
      drm/i915/fb: convert intel_fbdev.[ch] and intel_fbdev_fb.[ch] to struct intel_display
      drm/i915/display: convert intel_modeset_setup.[ch] to struct intel_display
      drm/i915/display: convert intel_modeset_verify.c to struct intel_display
      drm/i915/sprite: convert intel_sprite_uapi.c to struct intel_display
      drm/i915/frontbuffer: convert intel_frontbuffer.[ch] to struct intel_display
      drm/i915/crt: switch to display->platform based platform detection
      drm/i915/dmc: switch to display->platform based platform detection
      drm/i915/dp-aux: switch to display->platform based platform detection
      drm/i915/dpio: switch to display->platform based platform detection
      drm/i915/gmbus: switch to display->platform based platform detection
      drm/i915/hdmi: switch to display->platform based platform detection
      drm/i915/display: switch to display->platform.dgfx from IS_DGFX()
      drm/i915/audio: don't set LPE audio irq chip data, it's unused
      drm/xe/compat: clean up unused platform check macros
      drm/i915/display: pass struct intel_display to PCH macros
      drm/i915/display: drop lots of unnecessary #include i915_drv.h
      drm/i915/pch: abstract fake PCH detection better
      drm/i915/reg: use REG_BIT and friends to define DP registers
      drm/i915/reg: Add/remove some extra blank lines
      drm/i915/backlight: drop dmesg suggestion to file bugs
      drm/i915/error: drop dmesg suggestion to file bugs on GPU hangs
      drm/i915/hdcp: remove duplicate declarations
      drm/i915/hdcp: deduplicate and refactor HDCP GSC ops initialization
      drm/i915/hdcp: split HDCP GSC message alloc/save responsibilities
      drm/i915/hdcp: rename struct intel_hdcp_gsc_message to intel_hdcp_gsc_context
      drm/i915/hdcp: rename HDCP GSC context alloc/free functions
      drm/i915/hdcp: pass the context to the HDCP GSC message interface
      drm/i915/hdcp: switch the HDCP GSC message interface from u8* to void*
      drm/i915/hdcp: simplify HDCP GSC firmware usage selection
      drm/i915/hdcp: pass struct drm_device to driver specific HDCP GSC code
      drm/i915/hdcp: drop unnecessary include from intel_hdcp_gsc.h
      drm/i915/dpt: convert intel_dpt_common.c to struct intel_display
      drm/i915/hdmi: convert rest of intel_hdmi.c to struct intel_display
      drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()
      drm/i915/dsi: remove dependency on i915_drv.h
      drm/i915/display: remove struct drm_i915_private forward declaration
      drm/i915/bios: fix a comment referencing struct drm_i915_private
      drm/i915/crtc: pass struct intel_display to DISPLAY_VER()
      drm/i915/irq: move locking inside vlv_display_irq_reset()
      drm/i915/irq: move locking inside valleyview_{enable, disable}_display_irqs()
      drm/i915/irq: move locking inside vlv_display_irq_postinstall()
      drm/i915/irq: split out i915_display_irq_postinstall()
      drm/i915/irq: split out i965_display_irq_postinstall()
      drm/i915/irq: make i915_enable_asle_pipestat() static
      drm/i915/rps: refactor display rps support
      drm/i915/irq: move i915->irq_lock to display->irq.lock
      drm/i915/rps: fix stale reference to i915->irq_lock

Jiajia Liu (1):
      drm/i915/pch: fix warning for coffeelake on SunrisePoint PCH

Jouni Högander (17):
      drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards
      drm/i915/display: Add new interface for getting dc_state
      drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
      drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
      drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
      drm/i915/dmc: Add interface to block PKG C-state
      drm/i915/psr: Block PKG C-State when enabling PSR
      drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
      drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
      drm/i915/psr: Add interface to notify PSR of vblank enable/disable
      drm/i915/dmc: Add interface to control start of PKG C-state exit
      drm/i915/psr: Apply underrun on PSR idle workaround
      drm/i915/display: Rename intel_psr_needs_block_dc_vblank
      drm/i915/display: Rename vblank DC workaround functions and variables
      drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
      drm/i915/display: Ensure enough lines between delayed VBlank and VBlank
      drm/i915/psr: Move PSR workaround to intel_psr.c

Khaled Almahallawy (1):
      drm/i915/display: Add link rate and lane count to i915_display_info

Nemesa Garg (1):
      drm/i915/display: Implement wa_14024400148

Rodrigo Vivi (2):
      drm/{i915,xe}: Move intel_pch under display
      drm/i915/display: Convert intel_pch towards intel_display

Ville Syrjälä (6):
      drm/i915/vga: Clean up VGACNTRL bits
      drm/i915/vga: Add more VGACNTRL bits
      drm/i915/vga: Extract intel_vga_regs.h
      drm/i915/vga: Include the current pipe in the VGA disable debug message
      drm/i915/vga: Nuke vga_redisable_power_on()
      drm/i915/vga: Consolidate intel_vga_disable() calls

Vinod Govindapillai (1):
      drm/i915/display: implement wa_14022269668

 drivers/gpu/drm/display/drm_dp_helper.c            |  52 ++-
 drivers/gpu/drm/i915/Makefile                      |   2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |  60 ++--
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  32 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |  43 +--
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   4 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          | 191 ++++++++++-
 drivers/gpu/drm/i915/display/intel_alpm.h          |  10 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  12 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |  42 ++-
 drivers/gpu/drm/i915/display/intel_bios.c          |  19 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |   2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  12 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |   1 -
 drivers/gpu/drm/i915/display/intel_crt.c           |  46 ++-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   9 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  17 +-
 drivers/gpu/drm/i915/display/intel_de.h            |  14 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  67 ++--
 drivers/gpu/drm/i915/display/intel_display_core.h  |  23 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  11 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  13 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |  18 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   | 255 ++++++++------
 drivers/gpu/drm/i915/display/intel_display_irq.h   |   9 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  60 ++--
 drivers/gpu/drm/i915/display/intel_display_power.h |   1 +
 .../drm/i915/display/intel_display_power_well.c    |  11 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |  23 ++
 drivers/gpu/drm/i915/display/intel_display_rps.h   |  24 ++
 .../gpu/drm/i915/display/intel_display_snapshot.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  11 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  93 ++++--
 drivers/gpu/drm/i915/display/intel_dmc.h           |   4 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  14 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 204 ++++++++----
 drivers/gpu/drm/i915/display/intel_dp.h            |   2 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |  21 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  60 +---
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  25 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  11 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  11 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |  15 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   3 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |   7 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   4 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   5 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  74 ++---
 drivers/gpu/drm/i915/display/intel_fbdev.h         |   6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |  13 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |   4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |  18 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  48 ++-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |  60 ++--
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   8 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  38 +--
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  13 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      | 124 +++----
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |  20 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  | 181 ++++++----
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |  63 +---
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 273 +++++++--------
 drivers/gpu/drm/i915/display/intel_hotplug.c       | 129 +++-----
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  77 ++---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |  23 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 195 ++++++-----
 drivers/gpu/drm/i915/display/intel_modeset_setup.h |   4 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |  17 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |   6 +-
 drivers/gpu/drm/i915/display/intel_pch.c           | 340 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pch.h           |  58 ++++
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  44 +--
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  15 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   8 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |  31 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  26 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 368 +++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr.h           |  10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  26 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   3 +-
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |  17 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |  14 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |  68 ++--
 drivers/gpu/drm/i915/display/intel_vga.h           |   2 -
 drivers/gpu/drm/i915/display/intel_vga_regs.h      |  36 ++
 drivers/gpu/drm/i915/display/intel_vrr.c           |   5 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   4 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  10 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |  10 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
 drivers/gpu/drm/i915/i915_driver.c                 |   7 -
 drivers/gpu/drm/i915/i915_driver.h                 |   1 -
 drivers/gpu/drm/i915/i915_drv.h                    |   7 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |  48 +--
 drivers/gpu/drm/i915/i915_gpu_error.h              |   3 -
 drivers/gpu/drm/i915/i915_irq.c                    |  49 +--
 drivers/gpu/drm/i915/i915_reg.h                    | 144 +++-----
 drivers/gpu/drm/i915/i915_utils.h                  |   2 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |   8 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               | 316 ------------------
 drivers/gpu/drm/i915/soc/intel_pch.h               |  56 ----
 drivers/gpu/drm/xe/Makefile                        |   3 +-
 .../gpu/drm/xe/compat-i915-headers/gt/intel_rps.h  |  11 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  47 +--
 .../gpu/drm/xe/compat-i915-headers/soc/intel_pch.h |   6 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   6 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   3 -
 drivers/gpu/drm/xe/display/xe_display_rps.c        |  17 -
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           | 133 +++-----
 drivers/gpu/drm/xe/xe_device_types.h               |   2 -
 include/drm/display/drm_dp_helper.h                |   2 +
 120 files changed, 2647 insertions(+), 2322 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vga_regs.h
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_pch.c
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_pch.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_display_rps.c
