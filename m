Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C655C2247D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E6810EA92;
	Thu, 30 Oct 2025 20:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdlvX4lb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CFB10EA7E;
 Thu, 30 Oct 2025 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856451; x=1793392451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=okb+M/wn9h2vJdcqhYylqAO/R/sI6fxbdUiiAEfom/0=;
 b=IdlvX4lb9yrq6R7bgT3GF/SERMryOJYqtHjypJWOY3Prx36To1sYWp79
 E/F6s9+tdXr87nTvckhFMuvQZ9MITPZytW4y9r/x0g18sxdaQttt2sPIb
 3eQIJ5E+64EIlINXomrQA02GkZOCOtqa0T2jyUk3DTA9ZLq9L3xHMb/t1
 ZA9aMIv9GrrImHBnNYekZcaSNvC6wuzr5gJkp42QChd8WM1wezTxJNS+B
 yG4RKY1e6OQWjXzzI/rL8UTLqKmUHTkpA9NG7vkY4it5k9jVYr265orBI
 qUWpFIIXs4DCZWc8BiH+tvCcwB4PJfud+tLxbThSaqW1yI+1U8jbhLU6h Q==;
X-CSE-ConnectionGUID: FYr4IwznRXiEsPZ9aMp7iw==
X-CSE-MsgGUID: 355p519uSsS+RyXJAnVgDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74688201"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74688201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:11 -0700
X-CSE-ConnectionGUID: /hQf+mu9TcWEV8aoCtzJYg==
X-CSE-MsgGUID: eBA5Rcp3SfiR4Pye4G5e0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186791496"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:34:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:34:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:34:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx1ianZmkSuskZsFjAYPaMhoPogHhr3VxuK+glP208rFvtWySXVCWC8qOLUWEH77ZJ87lxtpuFOGYiZiDyfM3nr+2sorZz1N3xPiYHq4futV3jr4zwo2xhrUfG6hRIaESH6SexiMxyHVtM0LzSxknP0wd+ujSaH32ZNa9CeHQf/JHxSko5MxfH2mr8Q9YH2eVlqhK5e6kz75jnE//7oJdv1X2d+IEp7Er6ZukHxuBKPSaUa1XP8Wzsq+LFahc03bByhjrsmOxoaYSbN+GZEQmlamJUiAsieU00pfSbaOMSCmv7mYTVjoaTzx6TBRf3ICNgkg4/sjeqR9/C+zm9skqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lka42VQgFhOwUKJHtrGuWt2PF93G/oNFLUE5rBn0LWY=;
 b=hZdrYamdjl8tj+/dgvBhRqKyuICHoRdkiKuz+BrkPQxVgEFiRfhVjUi0DnISL5BaUuNHkaCO8igJ9yz11nWHMHDPCdKcF+gtLHUY2O+yjIEzC5jzP71KZbQBOPUE4NKcJRYp/PnjsIMtuXihvxDOkULIhP7M1f4NkyGsY3j30wjPL6ZqBvIGtiMmDB4i5Kr9QzoWrZzAIBczLM78mpx11uDCGyV+xZcRsZVhO9m5tf1V2G2c9e56l3bCUi4sRlw5PzNf7gNRqH94EP1l+JGX+4Sv3QqeTEucApnbHuMdECqIYxq38E+vA/8RMAxrS1ELc+YVjLOj/V8WekhUJCWKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Thu, 30 Oct 2025 20:34:07 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:34:07 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Date: Thu, 30 Oct 2025 21:31:34 +0100
Message-ID: <20251030203135.337696-28-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: f09750c7-1e1b-4a58-46c1-08de17f3aca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE94OTZ0V2g4NEh6WVhxTlhMM0gySkdSZC9ETEZ4OXBHVkduTGp3OTNoN3B6?=
 =?utf-8?B?STNqaGx3K295MUxBRElSL2MyaklYa2ZRQ2RLclo0UkhVUkJPZTBVUDl5dXpk?=
 =?utf-8?B?S3ZMdjFYa282Si9XZkx1U2xKTDI3cXY3TFp0THhiZDVSYVJQWWozbUpmaW5l?=
 =?utf-8?B?TEY5RG5BMU1RMmFmNExFM1hIQWViZk1HN3p4V3htMnhvUkdOc2QzMmsvQkdi?=
 =?utf-8?B?UnAzc2wrR3RteEo2NENPVjV2aWZUR1lVbVBHanBjcXE3dWJBQWt3T1J5N0di?=
 =?utf-8?B?Mjd6VFRlcWhIYTFnOGJSbjhoTGc4V2N6aDdjN0pFemhORFZBQ2h5YUh5Y09X?=
 =?utf-8?B?TkR5VWNlR2dndnlsQlFib3VPdElLLzlWOGozUGJpeGR6Q1B1WFRYY3JIbUhS?=
 =?utf-8?B?SzIrL2NNMTh4QkQyQnJ4OTlsVW9YN2xvcmpoYUZJekJzSHlacUN0SnpzcjVm?=
 =?utf-8?B?dzV2dUF2UU1HOU1hTm15OGh3MmdhaU40WTNrR2lFN1U0aldSMXk0Q01rRXdG?=
 =?utf-8?B?NU0vSWI1ZE9yYm9UU0diam1aeFl2Nml2TUNXYzlMdDNnSXQxNVFOU3BteStt?=
 =?utf-8?B?Y3A5eTdmZzdHdzBOQkVxZ21aNlVQV3VmdmREWjh4MjdISlhIeVBvdml5TnlC?=
 =?utf-8?B?S1ltZy9DeTlGZ1VjdFZFbTdreCtkcGtTQW1wT2lnTlA1b2dqdWlVSnpMM25Z?=
 =?utf-8?B?eDNPZVZHcVJVUzZUTm1iZUsyV090SlZ1UVQ3L2NRazFrdmNDZ0UwN2ZudjhX?=
 =?utf-8?B?RUpTcVVqbDd2V1FzalMrQ01UYmVHekwxaTNVamJnVmdIdnlOZFp6US9sd282?=
 =?utf-8?B?VHdzVzNpVXVHNFdVV3lmVzRvclVxaVp0MjdyNDNBNzZKOUtzSUJ1bUQ0WC91?=
 =?utf-8?B?d0ZsVGVxdHI2bVdRR1c2L3YwZ3ZZSWh6OEd6bDZRaG4xTGwwWk5tNExiWDNi?=
 =?utf-8?B?WVNjVkl0ZnpSSVBSckVHWHV0S1hrRVpJb2FlSExvS1RMN1pZbzBUZW1vaDFt?=
 =?utf-8?B?N0R6eXZtUHh4d3dtN011dk1MdzBOZG05ZUZ3UnI1WS9IRHgrSUI1Q09CV0po?=
 =?utf-8?B?RmZ3azRBV09DSEdDNWNGb2ZhVWVYbXloYnZUcWVjcGlsQk04UW1mSTBUazZW?=
 =?utf-8?B?NkJ5RjRUOVM1alVtdHZiYU8zMWxCL3dDUTdmZmhLV0VFVjBHK3h4ZkIzQUx5?=
 =?utf-8?B?RktOWXRkVVJRdGhweDVRbTRRaWZUSVR5WU44RHpqOWZDM0w1Yjgvd0l1VERD?=
 =?utf-8?B?ZG5YSmplc2s4dFFzMjM2Kys3U2wzRkc0ZUlVcTk3QnljTVkydlYydzZZS2pH?=
 =?utf-8?B?dC82NzhQeWxNRnpON250ODh5QVliVzZ1YjNNZDVHeklzWG9GdXZxTURoYm4v?=
 =?utf-8?B?RlMzdmpaRk1mNGlpSlFPdzVsdTdRRFIvaDlRRUd6YVQreFV3WTV3MWRvSENm?=
 =?utf-8?B?UWpsM0t5Y0EyaDJRc2NMT3hWb2pNSEQyRTE5YmMxZzV6MGVzbW00YTRCRG1a?=
 =?utf-8?B?Tldoa0plbjhqemdPZW9BQ1lqTmc2emFUcmhPMzdGZW5UU0FiL3oxdis0a0JY?=
 =?utf-8?B?eDYzS1M2QU12WVRJNGVWRVBNdVBJMnJxcnJzVHZrOElHS1d0MUN0T3NPUEs0?=
 =?utf-8?B?dmNOemI3OG1lWGdWMCt5SmFmdFNNZUYwRVlIUTI3S1htRGdVZkdVU1Nqam9O?=
 =?utf-8?B?K0RzS1RIQkgzK1YxVkJmejgrSW5SQWZBNlhSZW1JNlFDUkwzWkUwcDJhYms3?=
 =?utf-8?B?YlQ5dkpscnQ1QUoxdVZ1QWdxRFI0eTFUVzJWSEVFdVFmZFpQZ2xqcEl3Tlcz?=
 =?utf-8?B?MjkyOGRPdTBlNmFMK1lSU3JQR3gxTGxZelJrcEYzdTMxa1Jmd2MxTEQ3ZW1G?=
 =?utf-8?B?ekoyNUpJeWhNQWpzVVhSdkkwK0dBNkVRczl4YURPTTJSZ3RiZmNkNW1JWE9Q?=
 =?utf-8?B?QlM0TGNXc3RVR3IvV016cWFCYUZOdGNMektXa00rOHU4UlFFN1VJTVZpYjJo?=
 =?utf-8?Q?dFTADw+TfGh91KMSQl3C2L02kSHF34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkpEMW5RK3pjdktQOU9vT2g0dFZKMVV2TWE1UUlSZURwZFZzYmw1SVJoOW85?=
 =?utf-8?B?amtLblVnY1dkTFNield4THdBLzNWMkF0czJJUEFxMWxZRDJsMmJxRDFIa3hO?=
 =?utf-8?B?dTlPR3poRWR4WWRsQm9ZbjRQWUNCVERSWW8yZWdBUVE1TEpUTkJhMGUvNU9Z?=
 =?utf-8?B?S2FzeW1Kck8yVFJKbjl1a2swTXcyN3FqYjNMS2lnQnBLNFA5bWc4WUxpaTJs?=
 =?utf-8?B?cDhsNk5aWVExZkRXd2doM0cwMHBRcnVNMXVPRzYrSllHc3lrNjd4TG5QSmxl?=
 =?utf-8?B?TE15L3FHYjg2WURrVExTS051SzhaNVM1YWNWa0kzZ1JrOW93ZHdSdlh2QjJk?=
 =?utf-8?B?QVRYRnExVFd1Z3NqZlJaMzhVS0JuSmV4NGpxNUFwdWhRbWJraEY2TC9zalUz?=
 =?utf-8?B?Q3JyekJJNFNpTEFnR1RlRDFUK1JNSnJSKzBGZFJmdGd2RDZqNDd5RU1LUXRs?=
 =?utf-8?B?RFRCcmVpVXhkT1dyamdTVEc0b2ZpTnpKeUNLMXRwZC8raGQyb3FLS2xJd0RZ?=
 =?utf-8?B?Sjl6WU94RVE4UG82dTI4Z0FVcXpYRm52NUFHR1RIamU0aWYyZ25DVXo2cnVL?=
 =?utf-8?B?alo5Nlk4akRwRnp1Slg3bTArSHFQRG5lUkJCOGJDWTcrRzYxTXBZVUI5RzIy?=
 =?utf-8?B?M0U2dWVpRytlY2Fmd2JOcW56WXVNQk5Xc3EvQU5VS01rU3dEVFBYK0E2NnRL?=
 =?utf-8?B?eGQ4TWVGa0NpSk0rdm5ndlJKQk1OVndiSW80K2NhdElQR0xNSXhMMEk5V0cv?=
 =?utf-8?B?SUF6VGlRb1lEb2tScDBNaEdZRHlEb1Y3cXR0SjZsUXgxWUhJNHRLTHpYNmly?=
 =?utf-8?B?ZUxyTlVUc1JnelRScTUySVQ2RTF3N3RhRTUyUExsUndTcUZmb3Vob0RzVUgv?=
 =?utf-8?B?bC9Bdm4zK1VtWnJtRmg4ejVjVWZEU3M5RzRPMExxaGZISlFDKzlKcU1NSUo3?=
 =?utf-8?B?Q1lsR282VzVGdk5KTGt0NFNHQWUyY1VVLzYvS3B1dHN5eCs1WGhJbHBCL0Rh?=
 =?utf-8?B?RHpKbk91RWJrclU5UmtOd2JpbmwwRHVpQ2dXbU9nUFpXYis3Tk5UT1Q4TUJT?=
 =?utf-8?B?YWIwQllUQ0NVU2hmUlQ3c1dsMmVscjZqRjBiOEhSUngyODJPcWttNHhDMC9I?=
 =?utf-8?B?TTF3dytFZWFTY2pDMHZmMWVkYTZ0a28zTkpMbDJodm5SVzZjeDRoYmEyR2Zi?=
 =?utf-8?B?amhCbnRpK213Nk5scEh2eWo3MFdCcDBYbWs4ck9NK0NDQnhlYWRZdWMwaEh6?=
 =?utf-8?B?WEJJRElpT2hXRFdvSSszMXJsU3FBUWZ2WmNBWldBRWpyM2lBc0NXK1Rzb05I?=
 =?utf-8?B?RmhEOG5SRXgyS2xkU2tHMjJQRXhYNkQ1ZU1QbmZyMUtad0V6N2Y1OWZIUGhD?=
 =?utf-8?B?ZHhvQkRRcTJYRThNMFlIdmsybnZuS2dINS9ieW8zQThXeVRYMEVYMmFZREZM?=
 =?utf-8?B?YjlFUWhETDhzU1BwMUhBVHZ4eDlreWUyVmtiVmE4d3ZLcWZDcmRnZGlpZUZY?=
 =?utf-8?B?a25iM1NoTjdWUkV5N2tsYmtjVzE2a2crWk43Ni9KejFFUklUT1h6bFJuRmd6?=
 =?utf-8?B?R0VUQlNkZnNPNno1REdKTk1QRk5WZG5wK0ZuYjgya0dNSXg3UFpWclM4eTQy?=
 =?utf-8?B?SlJwdW0xWmhzNktyQ3MwZlo2aGtqMUUzeTJoM0ZFcUdIK0c2MGFjbFVIMUM1?=
 =?utf-8?B?QnZKbnd1a0srNFBvM0lXdGVWRUVYM0VRSEUzRGQ2MGZjSVg1TGxaMktodEcz?=
 =?utf-8?B?YUdQUldpVnVVck1GeGQ4V2pXWnVNcVdmODdUdUpoNUt5V0REK2pjOGYxZkZI?=
 =?utf-8?B?dHB6RlVsbVYraWhiL3BwUVZacStaaEpYWVhlbXdIV1Vlc2xXbHo3cXFmRDJ0?=
 =?utf-8?B?MUQ3MXZ1aUdyZk9hTVUwbDZrZmRZVHBIdjk0elpqcU9uM0M1Um1HeWJteHAz?=
 =?utf-8?B?anBnQ2pGNmZ5dFA2Sjg4WkxlVGxReTB5dFFaVnVrYjc1bVVXQ1hLMkd0aGF2?=
 =?utf-8?B?SjNpc0Q1a1lnQkFDQTh6QlJSanFWcTMxeldCRlFtRnFlWFdCeHIzNnUrdXhP?=
 =?utf-8?B?czZkTjgrZnc1OEZHakk4SkZ3QUNNandzTnZVUUJPN2s0TGgvOG9EcEpLWDhX?=
 =?utf-8?B?U3BnUERlbnlmUWt1bCtOSHYybTFySmtYUm1YWE83ZzRVak1VS0l2TzJBcjJy?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f09750c7-1e1b-4a58-46c1-08de17f3aca7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:34:07.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAnqO7op6WHTD8C+lSuDY0+G5c0adNzdEvKLOGdI7CLxRAAGnNL82hmDNuDZPm717rD4x1rasuXyau9Ate8mZXlxbqvmVreZiW512LIBreQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
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

In order to allow VFIO users to choose the right driver override, VFIO
driver variant used for VF migration needs to use Intel Graphics PCI
IDs.
Add INTEL_VGA_VFIO_DEVICE match that sets VFIO override_only.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 include/drm/intel/pciids.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index b258e79b437ac..d14ce43139a28 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -43,6 +43,13 @@
 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
 	.driver_data = (kernel_ulong_t)(_info), \
 }
+
+#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
+	.driver_data = (kernel_ulong_t)(_info), \
+	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
+}
 #endif
 
 #define INTEL_I810_IDS(MACRO__, ...) \
-- 
2.50.1

