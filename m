Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811AEA46431
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 16:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0264D10E937;
	Wed, 26 Feb 2025 15:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BS+hm+Xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C7D10E935;
 Wed, 26 Feb 2025 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740582677; x=1772118677;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e8Ruua2OMchMb7yvJisKKHVQXSRZne+AsKjA9BGd1Hg=;
 b=BS+hm+XhJXpH0UAFep75O2FGwToR/vSyAPOj1cNyLuYW1Z4FgSP8KZMY
 yXBC1uecsbomv4j9qXzwShmcWgE5maU510cB2j3yo6RIC8qTN+ISxALkL
 qP4+yas/F9Dt1VEp56db8tMRpzkIIwvqgGJqjTfbSFLRUFfIy+dzMuq24
 u2d3ePhldw6GEbbnsHOe0RBg9BELBexUlHa08dYweaWTRj8VUG/K3Jo6h
 tHkcUjS0BPgVgW3vH97ei4oEkOika1FqPw0/b/jwKsOGBTZcqQg8zAtZD
 AQbnea4hWrN3sJw0/2rGGKdIvwJS+Vjiye16ugEd3ZCJPPA1MMIAjNRvL w==;
X-CSE-ConnectionGUID: HoUImQXiR4S6huLbGPcckg==
X-CSE-MsgGUID: rVAG3OC6Ry2JmNQ6xZD6wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66805821"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="66805821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:11:16 -0800
X-CSE-ConnectionGUID: KA/3JB0QQNiJXkr+UVdUQw==
X-CSE-MsgGUID: stBM8gUOTCedIc+oB10xFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120832052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:11:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 07:11:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 07:11:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 07:11:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvu1QZAbDx4B6xUhwMv/8XHI8qwlXW8jBpw7Sm/AdgJK2tqk3rQbbGqM0zdZRTcLvyql97K+toO3n6Tx+jrJflPERdO3oxRHAPtRuaincwbRLNX/VBTMErEIPg3FUBmjMJrpAapeVh30wpd21Gexi13ByxksctnI9RTIy3WVCkhoLTbx6P+sNMjptpP0/RAYQ3ozWTphFtXOWuLUFIhCpaeoJZsD+ucyQ9By8yyyiBLjL562R7goyCoTo4V64Pt9KfmJmQcH3wLelQBzCXisQWlVOv7NrvwZj8oj42YMuf5uouj8QoEExIgeZlCidBnDC10KvQFaH6tHyMqIvZTzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nfaHQnNFM/RUQ7UeInK5QmARyehgp90gjclqYh4WjI=;
 b=rwa5y9WgftP2v85oWbNX0AbG61hNY9GCiBZ2ygQM8Rz1fqVmFQuZ3qbvP0Z1VshpOWQgid22C5ui0VJKvtPM04l53KBA7Dniy3xn+T8bWPyTVQItw0bJkm4mLA9RF0EZI06J9FZk90+9goXCh6vfQxfVRvY6G1UgtspmvwqizPG+UJzQpg/bUFdo66fGTZYqyebFoDxmpFV6+pSpomt6C8panQeXZjBgrX8er9/3+zzqiMUcA/dzikGuWmy4OVbINq7t00q0oVybrRx5mk5hgzVKBQTru0qY3Auq0CRJ4HyKCDR+6U91d4+yPbypxfVi2K2QFFUON1QlZQtiU1xZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 15:11:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:11:11 +0000
Date: Wed, 26 Feb 2025 07:12:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, <jeffbai@aosc.io>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <Z78vTt8Ph9opzJmf@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
 <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
 <af689d4b-204d-495b-a7e8-0f7632b43153@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af689d4b-204d-495b-a7e8-0f7632b43153@intel.com>
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 48832bd1-ad40-4116-1396-08dd5677cdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTBKa05EMjBSRlFyeitNR01EOHVIdXBtMkhzZmpMY1RrZVc4c2dRVDdYQnFm?=
 =?utf-8?B?MFlDb3JEeDlxRTZjN0ZISEluVCtoRENTL0RJckFMbnZ2YWlac092MTNCUVY2?=
 =?utf-8?B?dlE3RWhlaHZ2cFJtekZsZWx6ZmJHTjR3MTQ1Ritxd1hCbHAzTEJjeVVUcmF4?=
 =?utf-8?B?VVM3RlUzWTFFYldleEF6R2lrcGZjRVpVeHJHenF5Y3ZvZndvV1NnVGlUalk1?=
 =?utf-8?B?ajNpRjJRQlcxM0ZGOGdneStuNXlUTzJNeU9IbzZ6TTgzZlJ1YStBUE5qODZI?=
 =?utf-8?B?Nm0xc0hLY3UwazRSZTFRN0pWWmVYcDZBMVVrNmIzTytrK1FOMDRGVHpZbzdn?=
 =?utf-8?B?ajhKaWlnMHhIQzdxRWErTmRnUDAvaUluSFloS3o5U0p4c2U0TjhEbldOT2ZJ?=
 =?utf-8?B?ZVVqNkVreGdMcnkvUG9XNmVGdHRnaVEvTWd1UklqTTFxaHR1WGNwcFhZRWdn?=
 =?utf-8?B?KzZRTTc4QXhjNWFSTXRqcUQwOHpCVnRjSENyZ3A1SjRlNGVlai9BQVJ2OSs4?=
 =?utf-8?B?cVNSL3FHTkpjSjJieEJ2ekx3WGFMVGFmWXUvRGpsRVJHUCtZeW8xKzRBSGt4?=
 =?utf-8?B?dnpId2svSWNHOXp2Z1NqZFRKVFVISnhsbVRIejFsNnovbDJqTGUvTjFleXdh?=
 =?utf-8?B?THA5c1kzVSswMTB5Rkw0MjJFNTR5eEZIcUZTRGRtZFdYSmF2YytySUVSOUxq?=
 =?utf-8?B?YmU0TS9TMlREeVdiVDFVOW45NGo4ZlFyZHkxSTFSY2JOcTkrSHg3TG1KS3dB?=
 =?utf-8?B?MEpqdVkxSTYvWEVSZ2RFdlNTNzZoeVlXWUdFblRmMzVodlNWVXVaOHBoRUN0?=
 =?utf-8?B?UGdyNGhBUkpxMUxvOEFXSExFTk1taWtycm12WmRMSThBQ1AzaFNOQzBkdGVO?=
 =?utf-8?B?ajlVQlNiOTVxMWZGSWRyZjh6NExDTW5yNkd0S3VZRys0MGtSUG84QUkrSk9i?=
 =?utf-8?B?aEVjTnFZN1l6MDk5alU5YURXUmQ2VWZ0RjlXa21RaExpOWdOMys5M3prR0cw?=
 =?utf-8?B?TklCT1hPMStjYVR4cFk0U2laWDNpa1VoSVJWQkcxaS9xeWlrRTU5d05ORVpm?=
 =?utf-8?B?aFl3ODJzUnVrWFpuY0Y1NTRCZmp1LzNKREY3bWRJdmIvcTZpdmNQaFNaZnAr?=
 =?utf-8?B?SjVsVXQ4UFFQcHhuOUpOelNwUTc4Q0VEbTZaS2xiYm9DSU1Ob0l5ZmZyd1kr?=
 =?utf-8?B?ekwrWndRbUhBZWhuSjZWMm1wR3V2a1NDTTg5NUN4dGF1b1BPQjdUSlgzMDR0?=
 =?utf-8?B?SU5CU2gyV215UFN1SEpZSzJsb3h1SHhYVU5nZHdQTXZCVlhjbmp1WEdOUDdE?=
 =?utf-8?B?S2FwbVZVMjYwMm5aSW5FNytEK2FGVEp5WXBYV0hYSmxlUTlpeUNoU0lTanVM?=
 =?utf-8?B?TjJnZ3R3bjVvZHRiQ3IvS0JvMEEvODZhNTcrbzZvdndyamwxZkRMWWo4MlE4?=
 =?utf-8?B?NnhXbC9ZektEVVFyRG5iMUlhd3BVOUExSi9qOUkzRHhJc2hwZnZkMWNLbVY0?=
 =?utf-8?B?VEo1M0RWTkovWDArYlZNaTgyaFlSTy9yeit3UWQvWHJTbHBHMEJuMEF6cDJI?=
 =?utf-8?B?NzNVdnFxb3lmNmw1TjQrVElKbTNBcG9kb1d6T21vVExqV0lZY2JkQVBrUzRV?=
 =?utf-8?B?eDBtbXhKdFVObVVDSC9aZ0JyTnJLVUpUZ2RQMnBnSmFtMVc2aUtSMy82V092?=
 =?utf-8?B?MG9MVUpLaVB5NkNMR1N5R2ZjTVZuVkNMNFdJVDhzalRjV3hiU2NOREx2cy9M?=
 =?utf-8?B?MXlESTNXUUliaURpQWY0YUpodkE3Sk5SeHJUREJmZDFwT1U4azY1eHY2Rklr?=
 =?utf-8?B?YU8xZUFFUjdlaHc0WW5VQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDY2YTVqaFZBWUt6TkxRTmlhTk5sendkdUlwc29zUGRJTmJKbXhxQVUyMHpq?=
 =?utf-8?B?b3lod1pJVFV4ZE9BMXpMc1VvVnhRanI0ZEU1R1dSTEpoQlpxbWtvV0J2elFt?=
 =?utf-8?B?VS96MnlrSC9KQTNhZjg0NTl1TGN4WW50aVpjdDUreFR5Q0xwWndCYWIvc3Nm?=
 =?utf-8?B?QytuS2hRT1cva0RzNUU5RGUrZTBiTEZGb3BwNXg5S0gwYkJQRGU2SlJDeWcx?=
 =?utf-8?B?ZVpFclB3R0tBVGxYMFZ4RXlHR25FYzVSMk54Zk1nOVNMbFFEeit3Rng4SWlv?=
 =?utf-8?B?bTcxak9yQktmTEIxeGJGeUsvamlKSU53MWhUZWI3bkFxaHlCWS9ZaTBkMFZr?=
 =?utf-8?B?bjBuU1g2OERoQ1RoSW1hUG9EQlZVWmFvdEpiRFN4ZmFSS05vWFlYZ0E0VUlZ?=
 =?utf-8?B?ZnVqQ2Izb2ZFUnhTY0FYWGVINENmNzRSUjlIN0I3SEhwL1I2ZE0wUitobDcv?=
 =?utf-8?B?dktiMmVtazhmZHE3L25GbWVVV0xtMnlkbXlNYXZ6aHZremxHSFZPNFJDcVJy?=
 =?utf-8?B?UnAwSVRLUFRhVzcramwzZjRhWDQyQWpvRXFISVlIcnA2dk9BbkJEaE01RElG?=
 =?utf-8?B?OGliaUQ5R3M5a0ZOcXl3MnR2TC9odXFUMGMwV2NQNmNodVh0NXlxZ2VVMjFj?=
 =?utf-8?B?WndiU0k2TFpRcW9KR0VReE52QUpuVTE3UCtTeGduNElRaGVNMmRFQ2NrdkU2?=
 =?utf-8?B?YUVvUmduZnNLOHUwcEtkSjZUNm0zNlRGbXB2T2l6ek9zSzd4T24rS0h5cGVP?=
 =?utf-8?B?VWEyRThlZFRLTkF3dGcyaDNWNGUxbEhqR09JTDVWbTFFeEswcng4TnEyQTZn?=
 =?utf-8?B?bVo5NnFTL2tqVkhqN0JkU0FGQ0dzNzBsY0tSTFM0ZXhOS0dFQlZpVkNPVzhL?=
 =?utf-8?B?bkZoK1dPTmxSc1pHRjBoc3dIRk8xOG5KWFhQNHBFbzNUQ3pjYlRQM3lpVkVa?=
 =?utf-8?B?c3ozOTNrY0R4V1JkUC8veTM1c2pjZm9vTDBYUno5dGUwQlo3Q1g4NEtLWlZM?=
 =?utf-8?B?ZTY3Tk0rK0lBc094WWJNVU4xUld6V1l5UWVxbUpLaGJGQSt6bjNrN3ZwOFRT?=
 =?utf-8?B?Rm03QkJwUFV4TmFuK0pkRGwyMmt5K1VCWkRvbFVoM0tHTWZRQWx0OGE3Wmky?=
 =?utf-8?B?TmI0eXNicVV4bnpDNWJUVldoM1RycDBqRzNFNEJMQlpPNTVkUS9wMXFQb0R2?=
 =?utf-8?B?WmFseWhweDFNNFNEZEZSc3doRGlCU1pJUCt3KzNwS01kTmVFNFJvK2FpL0xq?=
 =?utf-8?B?YzZQQTFPS1NlVi9MUmhVUUlkZk1jNUhTUXdOdngrdTRuMnYrM1RIM09JM1pr?=
 =?utf-8?B?aHdIejlkQTNrc1VTa2Jua3ZydGIvaG5LOW11Y3BEUVdjcVplb003VFZPcy93?=
 =?utf-8?B?NEVsdHBaKzJJMldQbGp0Q083SExaWUFZekJUTUI1VWE0UjhQQmVVNVA1WEZR?=
 =?utf-8?B?QlpwVjJuaTM4VWFSdWgvbGRWR3R4S1BvOStLNGZnU3FhbXNybVpzV0U5dDVy?=
 =?utf-8?B?RzJuaG5MQzZPSWdkR3RBSHBiREhkSVNqTVl0WDA3dlJRRytkb3pWNDNtN2x5?=
 =?utf-8?B?ZEtsMlFxTE5LVUZ1UDJKWXhQcTV4aWVkTU0xcmVUZTZjUCswMDdoR01JM0I1?=
 =?utf-8?B?Z0JHZmw3eXRaT0puZVNtTFpjTE9LUHhHVVdoQ0pORmtFbExBWkxZMDhmbHBt?=
 =?utf-8?B?cGpycUNVQW16OWxXUDQxNytieERQL041eTBab2lDSHJTVXluQW4zemM5Yzgx?=
 =?utf-8?B?L2FSNkZEemxyQUpPRitUOVY3UnJFTW5HUmN0bGVlS3ZGS0RNSVpGYW85STM3?=
 =?utf-8?B?REhqSXZJS0p5T2JwTkZySHdxZTVBZFI3NnJTZGlRbUZKU0FuNmtWbWc3MTNw?=
 =?utf-8?B?MjVKSEdlTlZkWTNVZDhzNVVnclJiRC9ySThlY0ZwYldZd2ZCQy93UVd6bTY1?=
 =?utf-8?B?dWVZVGJjWlFKQUJUUXE3cUpHVm9NK0JvWld3d0JWWXhoVVROSFJPL080czA1?=
 =?utf-8?B?SHYvelkxandLZ0hFZmJBWitYNFhSN3hMZVR1cVBYcGszSENBMkpxZ2dndGJ3?=
 =?utf-8?B?RjNVeVJvZ0lrVG1NY0hOU01OL2s0ODBRWHZ5YVQzMldvNEpOQzdDZE5WU3Er?=
 =?utf-8?B?azBIZ3RYSW02RW9iN3ZGV2g2RVdlR1l6MEtoKzVnL0lQRG5wWTZCMEVrTGlF?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48832bd1-ad40-4116-1396-08dd5677cdf0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:11:11.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8kJiVY2kSxNS63LdNlu50VWlvA5l5EK1icsNfEy/UkAThqiIV4a1cXkInbwoC2nPb1CcgzbEtUHbBC2eV+hhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
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

On Wed, Feb 26, 2025 at 10:38:40AM +0000, Matthew Auld wrote:
> On 26/02/2025 04:18, Matthew Brost wrote:
> > On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
> > > On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
> > > > From: Mingcong Bai <jeffbai@aosc.io>
> > > > 
> > > > The bo/ttm interfaces with kernel memory mapping from dedicated GPU
> > > > memory. It is not correct to assume that SZ_4K would suffice for page
> > > > alignment as there are a few hardware platforms that commonly uses non-4K
> > > > pages - for instance, currently, Loongson 3A5000/6000 devices (of the
> > > > LoongArch architecture) commonly uses 16K kernel pages.
> > > > 
> > > > Per my testing Intel Xe/Arc families of GPUs works on at least
> > > > Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
> > > > BAR" were enabled in the EFI firmware settings. I tested this patch series
> > > > on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
> > > > 
> > > > Without this fix, the kernel will hang at a kernel BUG():
> > > > 
> > > > [    7.425445] ------------[ cut here ]------------
> > > > [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
> > > > [    7.435330] Oops - BUG[#1]:
> > > > [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
> > > > [    7.449511] Tainted: [E]=UNSIGNED_MODULE
> > > > [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
> > > > [    7.467144] Workqueue: events work_for_cpu_fn
> > > > [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
> > > > [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
> > > > [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
> > > > [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
> > > > [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
> > > > [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
> > > > [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
> > > > [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
> > > > [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
> > > > [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
> > > > [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> > > > [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> > > > [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> > > > [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
> > > > [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> > > > [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
> > > > [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
> > > > [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
> > > > [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
> > > > [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
> > > > [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
> > > > [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
> > > > [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
> > > > [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
> > > > [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
> > > > [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
> > > > [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
> > > > [    7.701165]         ...
> > > > [    7.703588] Call Trace:
> > > > [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
> > > > [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
> > > > [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
> > > > [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
> > > > [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
> > > > [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
> > > > [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
> > > > [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
> > > > [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
> > > > [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
> > > > [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
> > > > [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
> > > > [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
> > > > [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
> > > > [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
> > > > [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
> > > > [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
> > > > [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
> > > > [    7.816489]
> > > > [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
> > > > [    7.827651]
> > > > [    7.829140] ---[ end trace 0000000000000000 ]---
> > > > 
> > > > Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
> > > > `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
> > > > before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
> > > > fix the above error.
> > > > 
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > > > Tested-by: Haien Liang <27873200@qq.com>
> > > > Tested-by: Shirong Liu <lsr1024@qq.com>
> > > > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > > > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> > > > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > > > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > > > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> > > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > 		flags |= XE_BO_FLAG_INTERNAL_64K;
> > > > 		alignment = align >> PAGE_SHIFT;
> > > > 	} else {
> > 
> > } else if (type == ttm_bo_type_device) {
> > 	new code /w PAGE_SIZE
> > } else {
> > 	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
> > }
> > 
> > See below for further explaination.
> > 
> > > > -		aligned_size = ALIGN(size, SZ_4K);
> > > > +		aligned_size = ALIGN(size, PAGE_SIZE);
> > > 
> > > in the very beginning of the driver we were set to use XE_PAGE_SIZE
> > > for things like this. It seems thing went side ways though.
> > > 
> > > Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
> > > uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
> > > 
> > 
> > It looks like you have a typo here, Lucas. Could you please clarify?
> > 
> > However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
> > size, which is fixed.
> > 
> > I think using PAGE_SIZE makes sense in some cases. See my other
> > comments.
> > 
> > > > 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
> > > > -		alignment = SZ_4K >> PAGE_SHIFT;
> > > > +		alignment = PAGE_SIZE >> PAGE_SHIFT;
> > > > 	}
> > > > 
> > > > 	if (type == ttm_bo_type_device && aligned_size != size)
> > > > @@ -1457,7 +1457,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > 
> > > > 	bo->ccs_cleared = false;
> > > > 	bo->tile = tile;
> > > > -	bo->size = size;
> > > > +	bo->size = aligned_size;
> > > 
> > > the interface of this function is that the caller needs to pass the
> > > correct size, it's not really expected the function will adjust it and
> > > the check is there to gurantee to return the appropriate error. There
> > 
> > Let me expand further on Lucas's comment. We reject user BOs that are
> > unaligned here in ___xe_bo_create_locked.
> > 
> > 1490         if (type == ttm_bo_type_device && aligned_size != size)
> > 1491                 return ERR_PTR(-EINVAL);
> > 
> > What we allow are kernel BOs (!= ttm_bo_type_device), which are never
> > mapped to the CPU or the PPGTT (user GPU mappings), to be a smaller
> > size. Examples of this include memory for GPU page tables, LRC state,
> > etc. Memory for GPU page tables is always allocated in 4k blocks, so
> > changing the allocation to the CPU page size of 16k or 64k would be
> > wasteful.
> > 
> > AFAIK, kernel memory is always a VRAM allocation, so we don't have any
> > CPU page size requirements. If this is not true (I haven't checked), or
> > perhaps just to future-proof, change the snippet in my first comment to:
> > 
> > } else if (type == ttm_bo_type_device || flags & XE_BO_FLAG_SYSTEM)) {
> > 	new code /w PAGE_SIZE
> > } else {
> > 	old code /w SZ_4K
> > }
> > 
> > Then change BO assignment size too:
> > 
> > bo->size = flags & XE_BO_FLAG_SYSTEM ? aligned_size : size;
> > 
> > This should enable kernel VRAM allocations to be smaller than the CPU
> > page size (I think). Can you try out this suggestion and see if the Xe
> > boots with non-4k pages?
> 
> The vram allocator chunk size is PAGE_SIZE so that would also need some
> attention, I think.
> 

Agree. So I think __xe_ttm_vram_mgr_init should be called with
s/PAGE_SIZE/SZ_4K?

> But I think we also then need to deal with the assert in: https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_gem.c#L181.
> 

Yep. I think that would need to be adjusted as well to be bypassed if we
are never going to CPU map the BO—specifically, CPU map it to user space
or if the BO is not in VRAM. For kernel VRAM mapping, this resolves to
an offset within an existing large PCIe BAR mapping, so allocations
unaligned to PAGE_SIZE should work.

Maybe export __drm_gem_private_object_init, which skips the BUG_ON, and
call this in Xe to avoid interfering with other drivers' expectations?

Matt

> > 
> > Also others in Cc... thoughts / double check my input?
> > 
> > > are other places that would need some additional fixes leading to this
> > > function. Example:
> > > 
> > > xe_gem_create_ioctl()
> > > {
> > > 	...
> > > 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
> > > 		return -EINVAL;
> > 
> > This actually looks right, the minimum allocation size for user BOs
> > should be PAGE_SIZE aligned. The last patch in the series fixes the
> > query for this.
> > 
> > Matt
> > 
> > > 	...
> > > }
> > > 	
> > > 
> > > Lucas De Marchi
> > > 
> > > > 	bo->flags = flags;
> > > > 	bo->cpu_caching = cpu_caching;
> > > > 	bo->ttm.base.funcs = &xe_gem_object_funcs;
> > > > @@ -1468,7 +1468,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > #endif
> > > > 	INIT_LIST_HEAD(&bo->vram_userfault_link);
> > > > 
> > > > -	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> > > > +	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
> > > > 
> > > > 	if (resv) {
> > > > 		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);
> > > > 
> > > > -- 
> > > > 2.48.1
> > > > 
> > > > 
> 
