Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A018C9B11DC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AFB10E06F;
	Fri, 25 Oct 2024 21:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlG74o39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9710E06F;
 Fri, 25 Oct 2024 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893064; x=1761429064;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sr2oSwfxWw6lzhTNwcdNZB3nm2DW27pSQn9L+r3Yh3E=;
 b=MlG74o39ygfOVYdhMB8pzJ1P2+7yfj+E2NpN+kzOU1U3Xorio/pGot87
 4ouDD0XUfBkupyMeou915FbgHDoEMeFKLzjmNNK9RW5drMFWhslbvjxWD
 TDaYELLItZBXFinPhlGigKWoemX5GX+qeDH1t9gtXTeJUmr8GnsmjOZyG
 5vD3oAwAwRmmRFyjCwvmrivXE0+pzvuFNKvjbXvMAk0LxIQ6hcLHgQLTq
 mxiIcLOou2gYSyXBhVxO/SJA909ScjFjcTg6izK6efGxp4baWJTUz5Oo8
 Ci42eDULoInWckYwsvgcfVo8R7l1BBbGmumwahopCruEfeqhSDoGcEkum w==;
X-CSE-ConnectionGUID: G+XDsz/pRXGjshGsHmnkeA==
X-CSE-MsgGUID: pAsphyWiSyahQt40h8HrGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40192770"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="40192770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:04 -0700
X-CSE-ConnectionGUID: 5b8U8t/jRn6Z0d/tdrKnMA==
X-CSE-MsgGUID: gq9ctujvRdCPlPsIqHwZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="104358063"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsgpVfuAf5lKRwEyozTTBuW+R7/VnrlBelUipevfde7XySDeNJB26jUyugE+4fJ4cwAqqpc/rOa1lGqIo8YNMWO2rYnwShr+n4Kr3LCjBumgapSi9QP1V5LOFBmx0j8r50qN9jPO95OfOE/zTWhqqLZsIskS+nqBzyRz6Oan1XJQE2jZEn/ikSsmU+pv0tr94Uq1zCx+Y7zwXBXh1eIA7oR1yS/REFgjezTO9mrutZdXmr3YpaGfGePBgY8wcoPE6ruQSfPpByvOZSgzhen3eC724LfM46xXNdy1wnQ2a7VQ5pmxkQpTqJYgRmdZGK1o+hUdCDZHa8Shu5f/ZEo/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03FoM+1l/NsBZ9xl0OALJLgpCURFDJ88jf4B2nbIwDM=;
 b=codadH9Y5tp8eQfNDA81RJycn2EMjzLgSnlG8cumUIIzq9lplZlE4jD8/Jx44xZZww3vtLzv7yLYN9jFlA8xAgBLEZeRnweTzJxRWfmKvbbHAKQDlf4TYwkl0Huw2FABewviJiImRCtfWNB11humolhs33nUk2IBP9UVPt57CvcsHf94tArPplknMieUiYN6P2yFjNBdV3iOiGTvuUwxJZcn5/M6NC6dG+YE+HZhQtAvy8fkNYMqpityIvv57Iy4HKtyfyxPzA/ywlZjBRfVIgaJh0vZhUtS7zjopL6QEaloftzcMZhZ3nI7yiZ1hVHeuWcGGkgu7d7o10JjMzw9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v4 0/7] PCI: VF resizable BAR
Date: Fri, 25 Oct 2024 23:50:31 +0200
Message-ID: <20241025215038.3125626-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: be783733-f4c3-4dce-92ef-08dcf53f1d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THVPY21FbUdONzh2K3AxTGlQYVVWbHZoMEZoRGFUODJHRFJsa0dqOEh4b1VR?=
 =?utf-8?B?am5ac2JPZjRrbG5seFFDZlhiZlJ0TmxWRksyWVVhQUc5WFhwVnhubHVJTFJy?=
 =?utf-8?B?UjgrL3dGQ3ZrdkozSDIyTmoxRnh1Tkp3UUxyWDdNeEtmc0NNek1IMFBEcXJq?=
 =?utf-8?B?NVVNbzdaQmFYMXltcFRtQWtpbmN3SVdkaEx5T1ZKSUpzYWZBOURNdWZHcUNB?=
 =?utf-8?B?U2hGZXovcENwbFFTSTR3R1VIWk1Wd0FoSU0yQkxRbGJyclFNaEgwenpPVzRM?=
 =?utf-8?B?bUQzd1dtM2QrMm0rcUhybTIwK2dCUS9lSTBrTjQ0T1NqTEpXclRQWmh6aCtQ?=
 =?utf-8?B?ejFTTWZUSG1rWTJCZjNxYmF4YUhyOXBiNmkyY1BpVmRKRjZTNldEOTdqT2lO?=
 =?utf-8?B?dSthQTJaWHp2b25NRWwzUGZOTEdxb0c1VUg5a3Z3QWhmcGhqOGQ1VHF6c1ZL?=
 =?utf-8?B?TUpOZTdTSHFuWEJUK0liRW4vdkF1ZmF6T09YYkE2eEJ4RFd3OFRQcTNXNHMz?=
 =?utf-8?B?WFF1RTRJenZEVjJkU1BFSTFWOElnNUhVSkh5WFNpTHhGaStYekt4Z1p3cUt2?=
 =?utf-8?B?RXcycVEwT0pmNXhzOWltcndjUWpHeDRIOXRVWDVXM1l2UDlydWFSQTZ6ZGZQ?=
 =?utf-8?B?d0VUeVB3cmxPUkZrU0Y5WktVRGFKTXRqQnJwQ2NwaEN2Mmg1UWI5YjB2SzFP?=
 =?utf-8?B?Rkh1NUY0WEw5SS9peThtNXh6OTZpUmdna3NkMEk0dnhqM1ptTkZvdGJvcmcy?=
 =?utf-8?B?cXV2UmNuRytCVnYybnpYa0NtN2VrU0x1em9WUlByck9rVjRKVFFMYmUrT1ha?=
 =?utf-8?B?UHVZUW5PeXhjZ3FVNUd0ZGdkREYzZ2ttb2Zka2ZxU0pNU0doVjdGR1NuWVB0?=
 =?utf-8?B?S09ERm4yYUl6K1VhbWlwRHMvYnRHclREQURycmN2ZTVyeTFQQ1dGMEFvZHc4?=
 =?utf-8?B?L3FsUGgvNkFjUVlNcTVEL2JhbUYzRERwbFJEbjdVaHJYWmtqdThhNjQ2RXJE?=
 =?utf-8?B?VXVySmlzcmxCdVhDaUl0cDN6RHc1elhIRWtjRGt6UXFxeURYcm1xSzVsTlpw?=
 =?utf-8?B?Rjhlclh5QVhFOHFaUUs4ZXVKc2Y5b0o4OXErdTRFa0tpMzFsZnNyd0VnWU5z?=
 =?utf-8?B?MDRrS2t2MUZicVhOc0xJTjVqb2prbmx0YnBNeWJkTlVtUDljTDM0cERBcHN3?=
 =?utf-8?B?Q0tUOGVzNkdZTTVINytWSWllanlYTytMMmdiSWpaODIwZDdsMzVVWlZSdFJp?=
 =?utf-8?B?OVgvWnlremhDY1ZXbTRaM0p3RlgvZTR3SzYranpZRlFBS0hLWDJLVGhZeDJM?=
 =?utf-8?B?d0N6RGg0QndqMi9RdGpsTXJPMENCTUw5QWVKNVN2UktHU1o3ZHA4YU9Vc1Ri?=
 =?utf-8?B?OTlrcUcyaFAvNGRydDhNRllSZGY4NXlza1R1a0RDTkVnZ1p5dzBncUo2MVdN?=
 =?utf-8?B?cVUydjd5TXNyTGJWb2Z0S2dxTFZ5REVxUk0zOUpCaEgxeG1pckxneFZXUzdC?=
 =?utf-8?B?R1VLaWFmZmtJb0pRL1RNVFBEcWVXV3RLQjJzM3RoM2wrck53dEk3ZktYOXVC?=
 =?utf-8?B?b2swQ2pTZ0IwdVZOaEE4T0YxeXREOFRaemdwTWN3MWE4a2FMalQwMENwRTUr?=
 =?utf-8?B?U09MeXNhaWp3WXRYcHVVNlZGQVlSRnlVQThZcXNFS1YweWNOdmFnTXNjWmd1?=
 =?utf-8?B?OUJyazZkT0JwUWZCVDNuOE1NWXRjZHhJS0tsT0k5MXJzOWlBWWNnMTJWSDg4?=
 =?utf-8?Q?MMc5mHxvTxLAkerS8uxOQ0KiBi9u5TpUZErmsYr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS91a1VRczVwTzFrWFQ2RXp5Z2RWSTJhRlAzK2pkSVEvaHFSbllId2p4TUly?=
 =?utf-8?B?T1V0K3hxT2JrM3dpQ0xRRjZELzlxZ2QxTW00RUlWS0M4SjV2ZlVaOUhBbEQx?=
 =?utf-8?B?YU80dHF6dVJOU2czUXlobVJmemFQVElJMkdzelVDTWxJOHZyVGlMMnJCVU1u?=
 =?utf-8?B?OXpvcTRGaUlSaXU1cDF1b2RLenVMTzBwblpLRjdZUUYyT2hZSGVVRXVjMTM1?=
 =?utf-8?B?anNxT2hWaGNDbDE3ZUlzaVdLZ05NaE51alo1anF4VDJ3NVZ2TEdYRUlFK2NH?=
 =?utf-8?B?Wm95amdzWTc4TmYyNTRVQTlEWDVQbldXVVJvemNUaVZPTThiN3grSVJQZ1U3?=
 =?utf-8?B?dU1vQ3pWS0dGUzZaWVBHQnEwUU91cVN4b1o3bjFHaWc4YXZuQndwSUorUTFL?=
 =?utf-8?B?UmdoTElSU05zTW9PUFphV1VkTjFhaDJUeTFHUkRuNGxwLzA5ZlZvTk5jaXdT?=
 =?utf-8?B?Y1BZZDBMa2xQQVYrQ3MxNUJLZGhXWlJUaGQra1BQcm9USGd0Q0RlRll2akJh?=
 =?utf-8?B?eGo4SVJJaFc1dDBVWE9ydFlGUlBSdDZwVHBGd1pjS0RrSHVIVi9yY2YxYmI1?=
 =?utf-8?B?ZFU2OXFvOS9ZQlJRYTJZZncvWjFmKzI2VW4xTmlMY25xRm5BeXpxQ3lYSTNH?=
 =?utf-8?B?aEZmTFc2NEd3VlY3VzF2NlFheGhJVkxuNGxCdDg3enJsbGtiMGFGYXl5Y1hR?=
 =?utf-8?B?T1hRSlYzL3A2ZUlMMURuT1hHMGN6VGJZMXkyM0hYOEp4ZUhmdExrWW1DbTY5?=
 =?utf-8?B?UlJUV0E0TUhHZEZFRElxV0locnpGZUc0Vkt2d1hGbHJ1TFYrZnNDS1RBdkxE?=
 =?utf-8?B?QktUYVJsRlV1ellLWkFhblZ0TUdsQkdrckg3SlU1T1gwd3p4MXNsYXhoRDFT?=
 =?utf-8?B?aGN0dG9GaWNhanVzMXEyT3VJNjM5dFozTUxCSEE3ZldUTlBrSlRraXZuVHQv?=
 =?utf-8?B?aWpIbjlSb3c2TUYvVUptRkJVRlV6MG85bCtLZHFmRWhsT1hCSkgzdE1JUmJ0?=
 =?utf-8?B?aWQzTnpZVi9oRFdTOVRIZnFrY0YzTGJVbGN6NHNqaWtWNW9hTWlmbG5GOFRI?=
 =?utf-8?B?Yi82TFhPR2VzNmZSZlhyTW5hODZaNDI4MFc2TVBtdUNxa2R6RVlnaHl3dkdz?=
 =?utf-8?B?SUdVZXQwb1hxNTE0b3hZVUZWcFFtSWRWU2tPRldpK1hmY0oxTWg5Y3BHV3hi?=
 =?utf-8?B?NXFnSGc1TDgwOEQ5SWZtRlBJaG9QaU9yeWNpTFdwQmFBTGxneDNGbm5ycXho?=
 =?utf-8?B?V0tCMUN5U2liU0xJZEZvQnBObWtacE9mdVF2RTNMbzRtdjFpVWlpbVVZdFhH?=
 =?utf-8?B?djlabnlzejBkNkRMTnkxbERoeGhJYXFZSjRXZzNrN2tJYkhNbWgwd3pkaDRn?=
 =?utf-8?B?REcvbXFGTzZRNW94TzB2eXpkd0RyS1U5OSs4LzJQZFY0NGFZdjd6S21PN1px?=
 =?utf-8?B?RjFJbXBkT21ndzJqajZxWGZ5bW9kcW90ZzZ3MDY2KzZZNHBoSGlnWHNER0Fl?=
 =?utf-8?B?d2orNm85VmR0dFhjOVQ3aW1IUzBLcWxKdkIzK0pGeXkzc2JHMjRORUhTbmE0?=
 =?utf-8?B?LzV6RTdJYWJJY2ZFMU5nNmdFMFFVV3ZMSGxTS1YrS0ZKejYzbEFJbURVeFV2?=
 =?utf-8?B?YnFVTVhqaW9HMjdPdmxoV0xKUjQ3WlpmK1pFVzRJTFp3WVdBazFxWmFPK1ZF?=
 =?utf-8?B?UWNxYlRWU1J1ZWhnMkgrWHVxVGFJVEV6OU94MkMrNkJDMTgza3NvQnk2UXNK?=
 =?utf-8?B?bVFHUk13M3ZvS1ZLUUYvYUVjSmpMVjhFbGN6eG8vRjNxMWg4ak96c1lYRjQy?=
 =?utf-8?B?Y1AwaFhuZk5XcENXTHNiRkVUZVdvaFF3dGQ3T2dFd2tiZERQaHNGLzhFS1lQ?=
 =?utf-8?B?RVc1SjRBU1B6NzcySkFUMkxCZ0hlSlFNVmd0eDRCRWZkRmxyQWJLKzE4cFNK?=
 =?utf-8?B?QTZ0K3ZFOTNsOWJCVmxuSDdtcm5CbG5rMXZmcmdNM0FueHV6VmpoeDQ3Y2FB?=
 =?utf-8?B?ek5BZHE1SlBMS3lJVnhEeUlRK3A3R3RKQ3czc2lUeDBVTktQZzM3emJhb1pm?=
 =?utf-8?B?QlRXQ3V2UUFpamRRMU5ielYrd3RrVkVqNVRic3pOeDVFbkJjSEdtMHlsWGRD?=
 =?utf-8?B?NTU2Y3IwQXoxMU1KQmNCbXBBdGc4bkpOS1RLZWFNUE5kQW1Nb1hCYlZVVS92?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be783733-f4c3-4dce-92ef-08dcf53f1d4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:00.4944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JVbpTltvyasTsIMTIsr2OQpon6wcG0du1p7AuQt1KO+/erGoWjB5XBt4xM4eCDLxAK0927gftq+CUGiOfaRxe0fEBXgNVX34gdQ8vQkS64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

Hi,

In v4, the approach to extending the BAR was changed to follow the
suggestion from Christian.
The control is now entirely on the driver side, with PCI subsystem
checking whether the resource fits during VF enabling.
I also added helpers to move between IOV / BAR # (suggested by Ilpo),
since the ifdefs started to look mighty ugly after addressing some of
the review feedback.

v3 can be found here:
https://lore.kernel.org/dri-devel/20241010103203.382898-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

Michał Winiarski (7):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to identify IOV resources
  PCI: Add a helper to convert between standard and IOV resources
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 158 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |  10 +-
 drivers/pci/pci.h                 |  45 ++++++++-
 drivers/pci/setup-bus.c           |   9 +-
 drivers/pci/setup-res.c           |  40 ++++++--
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   1 +
 9 files changed, 261 insertions(+), 31 deletions(-)

-- 
2.47.0

