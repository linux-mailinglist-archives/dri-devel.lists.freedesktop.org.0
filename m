Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E684A6A476
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17C310E5E8;
	Thu, 20 Mar 2025 11:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyCL7tFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08A610E5E8;
 Thu, 20 Mar 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468987; x=1774004987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5xPmGW6vZT3dvZqGhB4QHYZw15uhwdothZz9LmvDgeA=;
 b=lyCL7tFOI64JISMpvsk4y+uuqHVHr8sNx9koQro1SH65zWKCyEMPXbz7
 GALPlFYS+8OCqwvgiQvsUcDuVJ20vbK+3lRnArawYSiHv9uekJ/oirOmA
 oEEA99v8KVlkDSfD0yxyHYE+ENOvJGCXuqz7w3JhNc5KLoZ6S2sX4eZcu
 I+PhmLsGVx3vyQVfd2MGS1W0PItmfDIye1sc6c4ucfuoovzC/GTBi5ofb
 I2XaTtEPGBoHJMhCXdtJShrrlXmfo9B4tSrNv9vnnAsWRcw61woW6w0aH
 PI0RuSNAgm2AJNIdgIkjpZLW6hBp0MkEZrWQny5GJFz7YJK0XeOQun41L g==;
X-CSE-ConnectionGUID: ZNfSBra1RLuaJXcxZUuvug==
X-CSE-MsgGUID: mmAmqQp+TSyhgH60Zb0u6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55070839"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55070839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:47 -0700
X-CSE-ConnectionGUID: LATMQMPDRiKWI3GDu6FoEA==
X-CSE-MsgGUID: wmx/RYbiS6mi76Zaj8/zqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="146265532"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 04:09:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:09:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkHkgYmeslg6462C3D8Gp600CIai9BRbATA4LlCqhjP4+r+Zpur7JImkD7cvfLwe+Vx6ncxgQExGo3pGUrpsPYabJpbtV3u89CpM4bQ8Hkmw4LOJeF96Ws3ZtWnpIE2me+uyuDV357dZrwonXVbtit/heuPWXGO7Q+wVa3ANBnveQLGYwxkTtnpPN5e1kv44RpopV0hEOqNXdQL0PI2cKBE6D6/BtjVpAEqN14xosAwnO8alAsmQHDT5UKqVhRoE0P1obnSGmA85dG6t3kH0oZbF2t/s+C7y7GjzgJmPyNtZzvrdjGa1Us24cyYJSYzVV7igc75vHspP9TCy0a98Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUPMBI+d4z8hOisADQ3OBoMr7nDKCGRSxyWJUhw22eQ=;
 b=S8pK0TRg718xIrZZ1/hCDabSRBRzSr03VrhcTmN/SVjTp1jB99rB7ERX5PfQVYQSSn/lzRfANIaaVuQo2qWJ/iO+0Aj2Opt/31ZAqZztFvzPHnfcdpFpQPzcghISwE/HGopAIsCv7dEb8ScKTX8nNvGW2gltFMjl2oWB3arsvMozuSftz7r4XMXBqOB0wLyw4KQe4/5W6NifDbLdIFsKC49mTWWx5CpRiWs/RRsBj6UckDX9mr/b/hHFYzU+viPb5zMalxuRKU3xbHF38S0bpa4Mj37CjlwuNuSnxeKdoWX0b+gv2T8kJuswbcVYup/RUURs0sR/Rt/jCDUIek94YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:43 +0000
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
Subject: [PATCH v6 2/6] PCI: Add a helper to convert between VF BAR number and
 IOV resource
Date: Thu, 20 Mar 2025 12:08:50 +0100
Message-ID: <20250320110854.3866284-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0096.eurprd09.prod.outlook.com
 (2603:10a6:803:78::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d72259e-9b5f-4ad8-110c-08dd679fb79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzVJd2Y4RXZMRnNtM01xQzRVZGk5ckg0dGRwRlBhbHVXMXgvMXM3WmIyd0ZH?=
 =?utf-8?B?UmIyRVU5ZStBWGlUbHRLVlpNZTlvU1Y4WE12YkVqZ1ZiZmRwZWF3TTVsZGpy?=
 =?utf-8?B?bFhxbGczM2NYbzUyWm9POTJEdlN2SU5kTzdDWHk2Rno0aWRzNGYrWG5EbnNr?=
 =?utf-8?B?Q2Z6OG9UY05TbFVhSzNIR0YwQkVWRnRQcFQ5Wkl2TGFMamdhN3QyYXRCM1FN?=
 =?utf-8?B?NzJKUGlMNmtHcTVSb0pSQU5PTFRBU1ZJZmdqSTF0VEZzN2t3QXFFUkZ5NWx6?=
 =?utf-8?B?MkFlcEtoY0FiWWs1aVVPTUxqd1I3clNRaU8wSW9KVm5rRkY0Um5UUS9zaFJq?=
 =?utf-8?B?ZGdOZmFucnJJdGx4YlhVL01mTlIvUDh2aUd2UEhMV3BlbXNGbHhyS09DcGhG?=
 =?utf-8?B?dmtLb1dkaElvUnBjdXQ3eUpCYnpsT3laaVFPc1l1WDdqS2VCY2E3WjBTTkJQ?=
 =?utf-8?B?OWliVVR5cXVyUXM2VUE3SUY4YlYwNS9ibzZMRklTdVhGb1h5OEo1NVJFbGVa?=
 =?utf-8?B?cklkUTJmYzd5MDFrQ3JZcGZQUExROHZSVnBBRUk2eTlCRlhWUmNpdlFSR0Uz?=
 =?utf-8?B?UFpORXpkU3FBK1ZmRDViVUJEUVVNS0RzOHdzMEM1dkQvRFppank4aHQ2VHZH?=
 =?utf-8?B?OFlTZktuYXYxby80SWxITWVkQ0tUN3kvSmFsMEFHYWNGL2JxY2wvcy9ZbkE4?=
 =?utf-8?B?U1BZV2w2cUVTdWZwRU5aN2kyaGtXRllORS9SOUtUdEtFSGtrU01mSmFMM1VT?=
 =?utf-8?B?M21OMEFGRERUajh5ejZURTBsYWR0ZzJ3TzZ2cmpEeDcvckVUR1NnU1gvTmJ1?=
 =?utf-8?B?K3NGQlNwTVpLTVJtZTNITmZOclJNaGRidjFvUnMxRkZBU0dEWjNxWG1pSmk1?=
 =?utf-8?B?RUhOOVMyaEN2NmhMY1haOFNOelNOS1NpR0prMi9hTll5RFo3dDVHSHF5N0pr?=
 =?utf-8?B?M2lBK21DUVA4RE9QZkF0aTBGUmtkU2h2ZlhVNXZCMHM0Vk85U3JXMzhvUSt6?=
 =?utf-8?B?R2M0ckYzYjZORnU1Nzg4T2VCZmRYMHUrZmlFWm9vWHBueFFvRXNKb1FZZ3Vo?=
 =?utf-8?B?N2hRY3MvSi91TWxhUTQyRHphUHFjK2V3NUZpK3NUQ2hVOWhCU1RLdCtrbnFR?=
 =?utf-8?B?MSt6ZFJEbzZNSGlGZGhWWVd1UEs3elU5WVVCQXJsdG9WdTYxQ29COHpBdXdv?=
 =?utf-8?B?Y2NLTE84aHQ5dUNzNGxRQnc5VGxXSFhjMjBUWXRzcXJienBWNmNHMWFOV0tJ?=
 =?utf-8?B?M1ZHRnV6ZmYzTjJSQkZ5L2xYaWlvTiswdUlCdm9UV0U3TDBTemhsS1dtZFRP?=
 =?utf-8?B?VC82TWV6UWhEaWZDeXVmYXJJUzc3RWVlTjlNTHc1OHh1b0J3VFA1RmI2aEUw?=
 =?utf-8?B?eEMzY1UwNkpzYU10OTZMSm9WWlVDWERWbitnSjBWT3VGVFRuQW9OdUY5Mmxi?=
 =?utf-8?B?Zkw2VkhoZ09YODJJSFBKbEpDOTZGeW9icjI0cmo1aVphSjg5QWZwQ3N4SEVx?=
 =?utf-8?B?Qm1mbnVZNnUydWdNOURpQXNtcE9RQnNzSVRIMlBHMFZ0SnNueHJIZTE5T1M1?=
 =?utf-8?B?ek5vcFAzTVZrdVBJTGp4azVHS2pBeDYwNk52eGNjbUJXQVRURVRIdmhIaFpJ?=
 =?utf-8?B?M1MvOFBKRmFWOGtpMjZXMTlTMXN1aVQ4M0FzL0JzZWFFZXlTb2VrdjVOWEha?=
 =?utf-8?B?TnhZbmFkcUx6N2ovVC8wK203Y0hRVUVZRjZqdmFRQWlQRUszZnkvSWR3V3NS?=
 =?utf-8?B?bDY3RE9CamN0MWNoWmRNeU53TGRBcnd6eVZKblNOWkFFOUVVdnhyWmxSUmlx?=
 =?utf-8?B?SUdqZGpnMklXbWdEYnRJTVU1ZU5JeE9kZkRRbzZnUTNOaEVFbWZ0VndEeGdi?=
 =?utf-8?Q?YCh/iIa9fKtmQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdIWCt3UEpaVklHbFZhbkFlajNZRzZHYW9hLy9zRllMZDFtcnFTVzhRRkpp?=
 =?utf-8?B?WlhocEpycDhzQ29ZZE9nY1BiVTNlaU96NzgzL1NrZTIrVi9xNFpvSmpIakRY?=
 =?utf-8?B?SEoyRGhvMU5BdXJuL0ZHVFIzZEt3bFplaWpKLzFYQ0Y4WTZzVUFLd1JZZThT?=
 =?utf-8?B?dUQ2Vy9oWjlMYnd0dlZWaHNrbzgvZDZ6aUhHc0Vob3hMT1NGS2NOdEhxQ2gy?=
 =?utf-8?B?cHVrb3dDNFp2NjBCSjM3cVMxWU1DbFBmUjg0bHBkU1ErYllqbXB4MlhFRWNE?=
 =?utf-8?B?Ynlmc1NTbUY4OStQK3BVUmdaejBySjUxUTVkTmM4Rk83ajF0TVpiSDNQeXRL?=
 =?utf-8?B?ZUlIVHZCeXA4M0JmaWpIcWd5NitnQ1c2UktVdlV5SnRkKzZ5aGJ0eUNZc3Bx?=
 =?utf-8?B?UjJwQ1g5S1RIS0lhdFhwUDNyaURDMEJDa1JkOW1aejNHT2N6N0dGRWJvTytS?=
 =?utf-8?B?YjVMNGt4WXlQc21qcXJMZWFJMlo5QXZqWkpKd1NxMWNLdU02d2syaHhWQkhL?=
 =?utf-8?B?bVI5dDJUZis5NTk0SFVoSWNjbXlJdVg5UytiTCt2dEJoVTFrOTM5b2x3SjFT?=
 =?utf-8?B?RHZSWVNKSVBnNlRTTVBPWG5VREdRN3paVm9Zb1lvN1d6RlZ1TVdQQzJhWFFW?=
 =?utf-8?B?c2RsRzU3UU1ocjZrOSs5ZDFkc2pOcVNKSTZCZEsyLys4N2Fta3hxMGJYSnFN?=
 =?utf-8?B?aHp1YTQ3TktNT0xkTm4rUXJTNXl2UVBPYkNBUldxd1REbFB5WXRUcFBDaTBV?=
 =?utf-8?B?cEZYTWJFVHJYY0YyTHFsbVUyRlZjTmtXbGVQdHBhWGthRDZwQTd0OG1BVTlV?=
 =?utf-8?B?WHh2V3lKVmU2SXlua05uL3VxZWtMbyt1eFhNYmppNVJzSVgrV2ZHQW5qRDl6?=
 =?utf-8?B?bkQwL05lSXZwZ0tCV1VwREtqQkYwOEpzMWI5WmNhVXU1enZTV0MrT2xySnV5?=
 =?utf-8?B?UHRKcitCeG9WLzUxTDR3NS9WNE9meGI4UXFQY2RGdm1SUEhHVXpkMFM2YzZr?=
 =?utf-8?B?YlJ5d0lBTjhlNUJaTzA3eGFKbVhoU0M0dFhvekV5ZWpSSy9DOE8zeWF5a2lp?=
 =?utf-8?B?ZlNYOVpTMkI5UTNudjNJVThvTnprQzZPUlljL242N01HSzJ0TTg4emw1dk1D?=
 =?utf-8?B?WFdUZHFYY2ZMUEtETUlwd3RES3l1VlJ3aDhZREQwbHY1M0JkdzhZRkszUjJl?=
 =?utf-8?B?ZVFnMWorZW5VbVVXdEdpclpTclhyWmsvNy9vRkx5SUxsOTZ3QXl4Y2g0U3pt?=
 =?utf-8?B?eEFJSHlkcUV1cWtIaGZMSmNlZnhNeFFyd0MrRzFEZmExTDlTUzl2bkpIbmZE?=
 =?utf-8?B?RE0xaCtHNi9nYzkwR0oxRXB5WWNLV3IwNUZzbk1JMElQR3JxT2JoeVFUclR2?=
 =?utf-8?B?YjAvYTY5azkxL3ZORlFBUDF0UTc5NGw1V1VET0I2ZWZyUkl5bkVHaC82cmNC?=
 =?utf-8?B?NlM3VWROOXRXWDlsMmVpRk5MRW1EWmZiY2w5eE9ldFFCWHlnVnN5UndVRkdm?=
 =?utf-8?B?VTdLQUhpWHlwRmNUVEZOTTZPeTk4WGFScC9OSmxYeGxScWhIUFYycFo2RW15?=
 =?utf-8?B?dmhsQmxobXdYQkgweUFGUktxUU83cmZDY2FzNytyYTE0U3lCa09GeVVRdFZm?=
 =?utf-8?B?eW4xemNyazRiMVlPRXlBZ3lIWFMxemczQzhGbThZenBIUmViRXFOM1JTYmpQ?=
 =?utf-8?B?NWR2M1pnSWRzc05GQ2VsRG5wNWlidzBVOUJEa3o2SFVOODY1a3Bjdy90dHAy?=
 =?utf-8?B?UnltdWpHMFlFKytCbmY1anpsZkNMS2xTRmNIWVdFSGhoMDdnNDg4ZUJGaHB3?=
 =?utf-8?B?U2t1N1FSQjUwZnN0WHJaVUJxbmkvTXk1SWp4T2NIbFVLTVBqYWt1SCs4bW5J?=
 =?utf-8?B?Wkxad09rdmJXa1hVSGl3cTlnakQzeW9FWWs1OWFPNlJGaU1DTGgyaXJqUVJY?=
 =?utf-8?B?REZ4eVRmUjNHVTZPWWM5VTlKejh1WUwzZGpxb2VLL3pvMFhJR1VrOEhqNjlw?=
 =?utf-8?B?d2k1YTRlT0ZCMmxLbFFpblVXYVovdFVCMFZyTUVia3Y4WmpPSXN2RDRIbTBa?=
 =?utf-8?B?ZWNTWVRUeS8ycjczbFBRNi90MFB3aldWeEFuRjJZUHZFd2F0Q0U2K3NKK08w?=
 =?utf-8?B?aHpsMzRuSHRnL1ArMjdIaWdBN1QwVVB2Q2JLMFk4TWc1SldPcEVSM3ZMVEpK?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d72259e-9b5f-4ad8-110c-08dd679fb79c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:43.6413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkzYlhnoTKA9FZBcMw62mxG/zvmol5efqhAXPUpFC5CnhEC3RumxR8imdUb3WesVmvmouCjlrxtvVFAeWcYeGB8zZam8I167lJZEGrFZQZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

There are multiple places where conversions between IOV resources and
corresponding VF BAR numbers are done.

Extract the logic to pci_resource_num_from_vf_bar() and
pci_resource_num_to_vf_bar() helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c       | 22 ++++++++++++----------
 drivers/pci/pci.h       | 19 +++++++++++++++++++
 drivers/pci/setup-bus.c |  3 ++-
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index bf95387993cd5..985ea11339c45 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -322,12 +322,13 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev,
+					     pci_resource_num_from_vf_bar(i));
 		resource_set_range(&virtfn->resource[i],
 				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -624,8 +625,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		bars |= (1 << pci_resource_num_from_vf_bar(i));
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		if (res->parent)
 			nres++;
 	}
@@ -791,8 +792,9 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
+		res_name = pci_resource_name(dev,
+					     pci_resource_num_from_vf_bar(i));
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -851,7 +853,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		res->flags = 0;
 	}
 
@@ -913,7 +915,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -979,7 +981,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index adc54bb2c8b34..f44840ee3c327 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -693,6 +693,15 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -717,6 +726,16 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_TPH
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 54d6f4fa3ce16..55e91ba1e74a2 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1885,7 +1885,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		struct resource *r =
+			&dev->resource[pci_resource_num_from_vf_bar(i)];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.49.0

