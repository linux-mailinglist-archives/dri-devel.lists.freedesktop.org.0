Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C260C52740
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864610E730;
	Wed, 12 Nov 2025 13:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSXrSE9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2210E714;
 Wed, 12 Nov 2025 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953829; x=1794489829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lk+65UU4VBbKG1L0noYI3cutbxJHfo80+io+HruK/S8=;
 b=CSXrSE9msVcqoc2562QTEsYFo5fv5i8QSy5zz5RLzaG6qDhQj54/pKfN
 FBOeBSwZwggYl8QT5FcJZVHn1IKAloUeWzSBOmRys07cOBIkfQ4CrGzWp
 rRISAiBoionh0PH9N2bRDcXFkub6oF6DlHG0W5pqYA9Q46cl9pCRt3uhN
 t2zegqHbxavd33o3oridtKc04wHTb86qV+D/+tUVbmvJbvttwNvTkA5Sw
 41qWOXEWy2fo01XH8U7hjwpuAd23khxF/RJOP24Toc1qjVbW9B4LvmTM5
 QFkUwhuTgbJ2aclNlOXTVPnExA6st1dbCKrEcesqH9U7Yx4+zMHy/yaZV A==;
X-CSE-ConnectionGUID: T5NoDelnQ+CloaYqUvaVYQ==
X-CSE-MsgGUID: tKkW75h5RumBNUuYsucoSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68649742"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68649742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:49 -0800
X-CSE-ConnectionGUID: KXmcoUlpR1C0Q6acfR4ZRw==
X-CSE-MsgGUID: MtN25BxYTEOK5gwPMEu1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193468023"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:47 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0EpY8XjJ7HLiR6unAHdhfG1DVbh+ewTMflBHMVQmqGjiAJWhgTKc9IQQ06CVKpOEE4Pnf98KmeLh6PgQEl9GiXFIjfmtxtrWvDd00cKZrbx+lfKY2GHL0/b2ipruxU/1fh06hmOcPBzKAaUcmt2SuKXPaVLjood+4O/QspbXxVrpM4r867wWz6XEK2/GlGOjQbc1R71PYluyGYYRutHJ1H7Net5SopXfnhsVE7NcEgSawobjiUwqi66k3mfRJZ0l327luztH7u/qVkTKEKQWRTTDnH0tWF/NwtmF+Dth20Q4kxZNPZ4QBVYtFAzwW5nJxsCqiVVkhaAyMmvyW2b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukotbZUfho/Muy5LocCZz85Giiw4AHi5xE9w0QXcURM=;
 b=h+JfO5dtC63iDeZOPc+a39DiFpMaanrXPLosMuNQgMbbjdA8Z/hi/cikWTxjJKExqIW3M0oEUUtWfFtVcYGrlCLwipn0CB14JRro07pIQvn81JWifp5AVZt8eE81cLWDQp4THe2ff/QE/BDJOATIsR38Q7Rfgtqo/m15FBnEODpd+l/mh12/Z2Gp9J+A+zgWc4QL84D2MLs+2RYhk6JZzq5B6HS36mn7wH/iRNP8aR3uNprYgFLDDNQofNqu9yD3TXcZ5H1DFDga28+9Zf4pKBrrZh9yZxdkcc8vdbUgDnXFjmKvLbsrooh2KPu+ZWM/DKOnb8Ax01VETNLaqhwwuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:23:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 13/24] drm/xe/pf: Remove GuC migration data save/restore from
 GT debugfs
Date: Wed, 12 Nov 2025 14:22:09 +0100
Message-ID: <20251112132220.516975-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e919e4-c577-4935-4e7f-08de21eeb47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTRjRlVlSXBEY214SEkyZUtJWUN6TFVJajEvUjNsVXNTOC9JcUIwalZxaGgv?=
 =?utf-8?B?cElxTU5uTTZQazRWUjl6YjRhNzZhTzlaTWd3WWE2bzJmejY1UzZnMlpycDgx?=
 =?utf-8?B?cmJGUnkyQjFDbEZiek5QU1kxS2k5QWxJZG5ORmo0UjQ3bEtsUSt6ZFpDNlZR?=
 =?utf-8?B?YlNiZEI0MWNkaFF1WTdFSU1Sa2VJNGhpVktCZFQ4bnNNZWFhL0lydEYrY2JH?=
 =?utf-8?B?NjJscXVqR0J6VFBtK1E4Y09DY1p5VGpPSHB4K1k0OFpyRENtTmFIeVJZNDU1?=
 =?utf-8?B?eWN0NGFwdDdPRENVbVBpb3Z4QkY4NmNHaWRPaVlhUEtIcWN6UURweEVDR1lG?=
 =?utf-8?B?TVd4cWs1anVCT0t5U2hEY0lMalNYcDk2RlRlM0RkcVBnQTlRV1NLaXBJZ1g4?=
 =?utf-8?B?emdKc0lmdTRpdEUrd0NqUGFPV2NuYmNPOWhNMEptZHpTdnZqTmVhN2dEL3Rm?=
 =?utf-8?B?WmVhbENVYWFBYXlVZUtWNUVyN0pYUmFDOTNGYXNUeFlyQXppZFR6N2JyeTFH?=
 =?utf-8?B?UmJVaE52SU5jMGQ3RzFpS3RLdVVKVjZCWEFUbDUyejdZdkl3OTRvMVpQQkxt?=
 =?utf-8?B?SmllczBYWnJqK1hjbjBFc0l1REFnQlRualB0Q3ZyYTJTVzJmcTEzbEptT1I3?=
 =?utf-8?B?cmxJd1NHcHBKUW56V3VML3NkdU5sV1hWUmRRNWRHYVRwN3NWd3RKMGNYRng1?=
 =?utf-8?B?eXNJcENEb1k0Ti9iRDJtcnBvOVJHOCtkdkxlcHpDSHJiSTk1SXRuWlQydjgw?=
 =?utf-8?B?MVF4dE1iQTA3eDllUUhpZGpreUtpRG9uZ3ArRlFLQzk3MzlWeU5RZnBZa0pV?=
 =?utf-8?B?NzN1YXloc0xBNmpEUXlXNjJNMnN6enJxVE85K2NWcFZ6bTRVcE0xMmE3SlR5?=
 =?utf-8?B?OXBEa09wUUFhdEdBeFVnY04wSlhXV2tjL1hxa1JsQURVVnlES3pzRkhFam5S?=
 =?utf-8?B?SktjL2N0b0tWREswemZiOENRYS9qUERkbUlmUE1UOWlQWHpqNm51U3phS1FI?=
 =?utf-8?B?TFNtN0tJVDJtQ1RwQTZ4TFNWWDJhOGZSdkVIMERZdHNIWFFRY0pnMmdQWWVD?=
 =?utf-8?B?ZEk5aFE2MFhqeURVWVNaZURLMWRqTjAyZDVXSnkwK3hnMjgyb1pHTFVvQjZv?=
 =?utf-8?B?MXRZb25ZZG5vSk8xQXY0SUdFa2I5aFNsR2pka3B4OVZ2aUdFTDczSHlYWlJW?=
 =?utf-8?B?MEZNcjlEY0s5YjdYS0JwWkdNSlUzUm1taFZHNDhBdU5Ga2ppUnp3N01OaW9B?=
 =?utf-8?B?SkZUZExzRXI4MHBMdzZIMjNQNForV0s2aHFhQm5pY05CT3VmWExWeE1JMXpw?=
 =?utf-8?B?ekk0WWZSZE1BeGE5aWFnZ3psZnk2dXZVMnArWUMySmQ0N015YUJGUUwrMmQv?=
 =?utf-8?B?U2xNRzJDb3czOWxSMmw0TXpHd3NaSSttbEJ5L2U1VXk1TnBDU25VT1BGN1RB?=
 =?utf-8?B?dGpkOGhGODZhUUlXWE1FbDVCWWd2eTZIL3hSRE41RzM5bmJraU51WVhlcURT?=
 =?utf-8?B?UXRzVmVvRnpRa1NKaC9zNXdTYXlmQXRqaGwyQUpSUmJUOHdlOWE5OUMzWFhQ?=
 =?utf-8?B?MlhIbVorMy9LeE56SEE5dXBOamVQejc4dkp4NlcyWjFZOFdvUU1PUEh1SjA5?=
 =?utf-8?B?aldyYTVoK1VPYXBERlo3eUZYT2h0bkFscHJXWjkzZG1rSDJjcFM2ZWQ0bTlu?=
 =?utf-8?B?SUlaRFNSYXpUYnZTUW80MTkxMHFvZWpBbHErNk45VWJOMzd3ZWtiUmRzWFBM?=
 =?utf-8?B?R2p5d3dxd1JzcG90T1h0eGlpSXd4d3lWRGhmU3FsREI4eDZWUEtIWVRYTFVU?=
 =?utf-8?B?Nm5lMEdEbEY4ZzIyK01UODlQRzVWSHlySHplQ094Zkd0RS9MSGI0cGgvM2Jn?=
 =?utf-8?B?VHZtRWdoaW80MXU5UjF0aDd3NUFCaGZMd3FuNW5kRmc5NXdFc0htV0RnTDdQ?=
 =?utf-8?Q?beQ51prTV/Q/lS4qxOmAI4zg+aAR1j9z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1BNGdveHIxRUVyeU9ZS2JNUDdONDdkRmZrRHlERktWanRSdjNHdTNrYkVN?=
 =?utf-8?B?b0picGd1UTRHWW1yMzRTa25MQWp3bTV4dTBOalJtSmJ0WVA3dVBtQTFseEpu?=
 =?utf-8?B?N2hxdlR3Q3Z0eE8zVms3cHJsOE5rUTg1Nzg5dXZuaTFSa3Y4VUFCZTJ6Z3dO?=
 =?utf-8?B?c1NIcWs1NGZWdnAvQ3VVdlpydjdpNlJROS9xWE1YL0hPWGwyaHluL3pST0RT?=
 =?utf-8?B?ckhEaFZ3dmo3WHNmMEw1Tm9BZytSTEp5MEF1THllNGxLRmR6OEljaFZPUzcr?=
 =?utf-8?B?L3NneU5EMDRIeXBuTHNOOE00a2lZTFVNeXp1Y2doN01pYVo0VG5STDlGYzBK?=
 =?utf-8?B?RlRkUDdWaG4zd0VRN1lUZlBNbkNPdUVrTUo2MmpOQmxHblFHWWFRMzFRNGxm?=
 =?utf-8?B?dVJWaWFWaUxVTGNlaTJxa29wNkZacU5lQXA1UGRIdTc5bmdxV1diVEFIRHgr?=
 =?utf-8?B?T1I1ZkFuc3R6RUNQblF1cWZ6NTFPSkQwbW5SSFhSZy9ndHJSNVNKclZhV3hy?=
 =?utf-8?B?bDliSkppN2NwR0tmcUZWR3paOW9qN2NUdjNFb2Y3VE02V2JQVThIcjZ3NXZo?=
 =?utf-8?B?SEdTOFBKQW1DRUoxUy81Kzl1RXhrM2NjZUdLZUxEK1dPR2VGbmVsR3NlL1l0?=
 =?utf-8?B?YUg0c3BhY2NIOXp2V0dxVnRmWVJ4TmFjb1FZYUtKNlF0ek1xU3hVUThCMEM1?=
 =?utf-8?B?M2JTcEtTYmlock5iTFAwbllXNENHbEhKSjNROFhDZHhWUndOMEpLclFnaHpL?=
 =?utf-8?B?SlJnSDJuNHdmckkrY0NYZTJqaUVWWkRBVHNNUHlodVhXVTNQMlVGZVNJazJI?=
 =?utf-8?B?ekluMTFFTUU1aXk1c0pjTzhnWGF1LzRBdVJmaWtVUWIyOWxKemlxaDFpbzlE?=
 =?utf-8?B?R2I2ZkREYjc5NzdFTG1KRWE4OXFpWHRxOS9ISm9JVE51cmVNRklsWmo4dS85?=
 =?utf-8?B?dXc5OTQ3VW5uK3JPUDhrdUYvMndmZ2FzKy9idjI5MGtSZHRWSlpFVkNnRkZR?=
 =?utf-8?B?VkdkeDRDc3RRSnVyWlhXRm5Bc0M1ZmxUV0ZyOGVSVzJZekh1QlFZQmN3b3Ns?=
 =?utf-8?B?dEZrczE5YVR3d2JSVVRMQ0ZNaWxSU2lSU3hLZURQa2lIdDlUK0dyYnF5QWVn?=
 =?utf-8?B?WXZVc3pmTWlOYWlOZ3FmRE9Qb1I4dXFJODU3N092OUMzWERTTUEwaFBlV3pS?=
 =?utf-8?B?eTYrZE9YcFJCRW4wSnJtRGx2QW9iWjlQeGFmVGYvMUpCZGgyY1VwZlZnMzly?=
 =?utf-8?B?SVBZS0pTekpiQSs1U3JRV0Q0WTcwajFuU2pmZTlyMFduSGlCZlhWU2p3dzQ0?=
 =?utf-8?B?bmdlNmk1bUszMTBaejRKY1hMaHlZWUJOT25iR2pWUklYcHgwdmQ0cVlZV3Jm?=
 =?utf-8?B?enZkbHd6eXppQjk2L1h1cnhSekZ6WXd6YUtvQU1GaUlUSFg1dDRSbnFaVzE3?=
 =?utf-8?B?d0NWZHE2cy9xejdhLzQ0ZG9DL0VVaDd6M0lNbDQwWjNhQis4R08vR3g3b2Nj?=
 =?utf-8?B?ZjgvN1BabzNsM3gzdHFRYnVlZUdyenVMNnhveEZGQlA0a0gwM0NBNTg4NmZT?=
 =?utf-8?B?N3RSMU9HemxCMi9Yd2RoNVpXVzFEamtqclRManJRVEhzcGtQZVlvL1o2RmJy?=
 =?utf-8?B?cWdvSnRBWlNZNDg2b1ovUTllZDB4Y3VXamV5WkhvVjVsaHA3aXBUQlQyWkRG?=
 =?utf-8?B?L0ZyWVpxOFhkY05keXhpNkU2UjV0dmRNcG95T3hqU2tZOWh5MWN5OGNTSDVD?=
 =?utf-8?B?cWd4Yzh3dW01M0xOMkZRZVhSL2lLQVY1STF0Qlp5ZU5EVFVwSWpIWEtZZnVW?=
 =?utf-8?B?SnNRb284YnlTL0hSdFVSaVdNeW1veXFDSUdJSE4yS2psZ1JpZkV0RFpXYXdV?=
 =?utf-8?B?QkVyMjc1aFViZkFWTloxZmZIZ0V2NjYrUVd1SnNvbzdUVTFGcnNxUjlYTk5k?=
 =?utf-8?B?ek9meUthd2tNNUpXQUtxMTlpODBRemEvbTM0NFdXaXJVZEx0NnNHN1Njamgr?=
 =?utf-8?B?ZVNlOXNrMHl5UkI5dlh6Nk53bzNiVGNTdkZaOVRsNm1HQ2NjWDNjQ2QzRXN5?=
 =?utf-8?B?NHFOdVdRR29waXFMV0dXeVliZVFlT2toekdKUzRtbU02RWNZVTU3ZThMZ3RP?=
 =?utf-8?B?ZHBWa2krUHI4cGtpNXJsMmlYNXRxc2RHZm96ZHMrSE5VMmtmekMrVG5DMUxa?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e919e4-c577-4935-4e7f-08de21eeb47d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:44.8504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hs+qJRM4x27HZNANktvAOYrLBIi9aHpei/jcfiQPqcLRnAVazHDDjNaLCuwBqv/QBCCwgOPISlHuOO+LpReLG9qa84tY5kzb9l7XDrJR/UU=
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

In upcoming changes, SR-IOV VF migration data will be extended beyond
GuC data and exported to userspace using VFIO interface (with a
vendor-specific variant driver) and a device-level debugfs interface.
Remove the GT-level debugfs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 838beb7f6327f..5278ea4fd6552 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -327,9 +327,6 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
-#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
-	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
-#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
@@ -393,47 +390,6 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── vf1
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── guc_state
- */
-
-static ssize_t guc_state_read(struct file *file, char __user *buf,
-			      size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
-}
-
-static ssize_t guc_state_write(struct file *file, const char __user *buf,
-			       size_t count, loff_t *pos)
-{
-	struct dentry *dent = file_dentry(file);
-	struct dentry *parent = dent->d_parent;
-	struct xe_gt *gt = extract_gt(parent);
-	unsigned int vfid = extract_vfid(parent);
-
-	if (*pos)
-		return -EINVAL;
-
-	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
-}
-
-static const struct file_operations guc_state_ops = {
-	.owner		= THIS_MODULE,
-	.read		= guc_state_read,
-	.write		= guc_state_write,
-	.llseek		= default_llseek,
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -568,9 +524,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 		/* for testing/debugging purposes only! */
 		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-			debugfs_create_file("guc_state",
-					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
-					    dent, NULL, &guc_state_ops);
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    dent, NULL, &config_blob_ops);
-- 
2.51.2

