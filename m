Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6803A67DD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 21:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786B10E4CE;
	Tue, 18 Mar 2025 20:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKF+dSMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7AB10E4CB;
 Tue, 18 Mar 2025 20:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742328805; x=1773864805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t6H/4YliYcdFH+kuMbm81a+w57XpQ/6UoQnRodtDey0=;
 b=PKF+dSMpHjf6T99CsXSyeCrdsCIfTaCquYLhYYIZ+twAodATwpmnRHst
 PPlKJ0gFebKCfEPDhYigJH3XAl8XaUArbeKqhwFS47W4op/wSKld3TQo0
 42Jit1pmasaONW53MQgGpG53jSSQUAtT3qge2qdTBq0plF3YdTamuT4Xj
 eN8zX4xp7aqjzJ3LJHgV12D9wPX6P4SGuYrXkLeGngmcuaht0dz50pKyU
 +pXnl7MxCPwxHGKio8vXx/UwYWAVEfsRYwFlwT9o3IrFBSbLjGhea/NN2
 VZyJ46SwZ68stwjvMJ0WrzQdau3+iAKppbIly1/H3GNRYEWw3zp4gYkSl w==;
X-CSE-ConnectionGUID: fSSZ+7tdRsy9PWQRvPmxhw==
X-CSE-MsgGUID: af0MlN1hQ9+vz+mjX6WgHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="68843454"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="68843454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 13:13:24 -0700
X-CSE-ConnectionGUID: 7a861lKkSZOw3VHoK9k1Ow==
X-CSE-MsgGUID: +Yaf4eG4TX2cpbiF094MFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="127473728"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 13:13:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Mar 2025 13:13:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 13:13:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 13:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGmxAgSKriEEw7fz975ViKOH+hjIe66UagqSQZXRRQC9vlaOsqefADBC1KjczhaLwdJq9kvnbnhAHLcnSPiYQO6tDjtC5WLcAy/C2nNEoHC6kNXNhFAYQ/97Uum2Id3hTLFgEoweenJ1V7fmFNYvt/UYhLC/r4vpIWVUcsoLvN3tuJ41sr3QOC4z34+8pl6RIBJ8xHuEQxe0x9eHiRNsStlJv8B7zKeAKCPHH18B4m1EmX7TBG97ioU/kwSNAiJFYKOdNgizPjiZrVWsQ2VR4bDwANQ9FgGtVoqnavhV8VAuPmyhPhwtSPgNXDs4F/i7BIgQ9I8dh81mf1UeDGZLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6H/4YliYcdFH+kuMbm81a+w57XpQ/6UoQnRodtDey0=;
 b=B+/Id+mqPH25ywkHsy5Qb9ZexJQ4UjPfqbGXts4vDG9ywv1JzQKuXjxqoZa+/DroS3eroPmQXxI+3trOzloof4xdiGT2vejcBxEDL1MOhaMTW54ivvpOEPBxefMI06EL3jza27IdfcJpuycs3ggCflhuxA96ZF2euZVWjgHwbJiW7Vw9lMz+2h1ljkjI/w/+M3yqm92rqoebYWj9pNK9xOwukjtP5bbmHsQHtsgZcuFebX3Yjt1NXWdN4YZryW7g+Y/+49MnvD4WvK9SZ9s8CWBZt3zaaTVxHNWT74+IBM+cjSvF6pDpcvK8cuEm/x7ZYmaeqtFO1t9Jdxx3yx07rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 20:12:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 20:12:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v9 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v9 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHbmCjfnM43tL+w2kSyxP/2l/iGz7N5OUwAgAAZxxA=
Date: Tue, 18 Mar 2025 20:12:38 +0000
Message-ID: <CH0PR11MB5444C42CD2CE0F56FA1CE680E5DE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-3-jonathan.cavitt@intel.com>
 <2fde337b-3c41-413c-ba16-fe2e4879e980@intel.com>
In-Reply-To: <2fde337b-3c41-413c-ba16-fe2e4879e980@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: 8b0d1516-ca73-4603-bdc0-08dd66593b36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MXNNMUUycUpIanlCcHdsUGJjRmlmZERWUWM2VWoyd0dTQUtuVFlldk9Vc1kz?=
 =?utf-8?B?WTAvKzVxZ2o2cXZZNnNjYWw4RnJNQnQzbWZTVXZaVFFqaVEyWjdkR0dNeGgy?=
 =?utf-8?B?UXBmaXpVVkFNcTF4aFpzRHhNVEdIa2k5NGprdyt3RVExQzdmZ2tIK1p4ZHBi?=
 =?utf-8?B?SzVZQlFWMGltZFFDVk1NNjlINS9qWVJSYmxQWG5oU0k2VTlsSWpmZzkrQjd2?=
 =?utf-8?B?RzQyZUZGMFZNcEpyRVZNUTJLaDR0VElrSEZZYzZvNHhXYUliTGJmMDlLQkto?=
 =?utf-8?B?VzliTXd2YzV2MXBKa2JCcStSakx4Q1RBMU5sY1NOL0tRNkVGdFZ0YU9hNSts?=
 =?utf-8?B?L0NMVUdmNXY2WUoxWXpYZm1kZUtrT09PbzV2aURjN3l2ZHB3NmRkWXpndTBT?=
 =?utf-8?B?YmNZejFHUWE0cTArcFRtbW9TdllZOW1Md1VGT3F4Qk0xK1laWld5OGEyU1g5?=
 =?utf-8?B?b0JYTEZURlQ2cEFDc3pXM2p6aGlZanI2WkpyTEpOUXJQOUxISlgyZHVJdm1P?=
 =?utf-8?B?YWExWU9QdkpsRGpUS25YYlI2VUFMUXNXVmxVRCtZNXhmQUtFMW1uaU1Id2Uy?=
 =?utf-8?B?aTVRa2xxaGYzd3JzbWxvc2FTSGVrdUtqcTJvNUVxcTNVTDZPeGxoZlk0NjJn?=
 =?utf-8?B?cXZRM3prY24xWmRxeDJxSTRaMmRuVTBCQjhOS1dKelROYWM0WUt6SGV2Y1BJ?=
 =?utf-8?B?L2ZjaHMra2xaQWRnVy9qOWR5V0hBcWFCK0xSUVBJcUVpajRGYzBwL09SNnNY?=
 =?utf-8?B?MHpwNnRNbEp6QW90bnZ0eHZDK3FUcVR1WWtldHBJcFQxcFRsVXFKY2JkNjJ0?=
 =?utf-8?B?STZhSTZOeXJTZFJucnIxdnZ5aXRzbWpRM2dlTEV2emJZbDhKcmh1Ny8yRlBJ?=
 =?utf-8?B?ZzhzZzZFN1NuRldBTFYwNEZ0Vm94Y21hLzdRaVFjaGZwTlJtT0Y1ekxqL0sy?=
 =?utf-8?B?L3h2QlBIZ3VMWDVvZzBqejdSVzBOdXJsNFdzZDJuTkVZNzA5MncwSWFsZmkz?=
 =?utf-8?B?V1BHaWhsNzdjd2E5UDQ0ZmNaY0k3MkxTNDNQQVg2WlBlY0g5TVdjdXBwbXRx?=
 =?utf-8?B?VnljbkUrS0hNUWJJQ2dwM2RSMnFwS3RpeTFGOGRUZ0QrRXJ1clYwbU9qZnNy?=
 =?utf-8?B?VThTRUNseVNvSkZTK1pSUkpKcXlhdzMrekVIcVcvMVBpb2psWll3blRlQUpm?=
 =?utf-8?B?RnUvM0dobGVnM0hiL1hlZExEUDFReDdXMmE1SStqMDJRYWFyVVNMZ1pDVDBJ?=
 =?utf-8?B?NStqQ2FIVjZYZTRoMGVoSXRpY1NUK0ZSdDN6aFRLN1FlUnluclVDTC9PWFZ1?=
 =?utf-8?B?aUN0UitJVzJsaW03K0RRaEJHL21tUHV1MGsyTXp5RzNxWXBxNE82cFZxcGk4?=
 =?utf-8?B?alQwUGtkTGt3VWc3SWFod080RWJ0UUU2UEpRQTBCMUpBRHNZaW1xTWhBNzJX?=
 =?utf-8?B?Qm0rb2xncjA0dE8vRUwxQTdVTnE4d1VLYksyYkFJM2p2bHpLR2pteTV0eXZh?=
 =?utf-8?B?VmpXQjlJRVcvK2JPcFJhZXBLcnJCZVZlbFpreGMyMjZSZ2VXaDZTMHkvRGwy?=
 =?utf-8?B?blhYSzBwaDhTK2VHTlpOUTh5R3NobXRXWkpiRm5QU0VoZ1JkZnlkNDdxckVP?=
 =?utf-8?B?WU5oQlFpSmFoV3RqMmdHZW91NWxOcFRVTjFRZDBCQVZTaGNXUnptN2FHSEZX?=
 =?utf-8?B?WUpITlVaRXNSRWxxRGRKMVgySDJ5K3lGeVFSTzdBcGhLVitDU1FXWUtITXBS?=
 =?utf-8?B?d3RxM1FaWXcxYmtwQmxKeFhtS2VSMVIzYjRiMzZrSXUxSEcrWnZ4cG5VeVFM?=
 =?utf-8?B?MWFzaG5aU3dCVlgxU0RjN0RBUGxpNVJRNlBqK1UyaDBhOFBkcHNyZDdpMGFQ?=
 =?utf-8?B?Q0NFL0NEN1NiQ3FUZTR6b1R1MlIzRFcvQzZsdUFXa0NMemlUWGJtT3pRaHdY?=
 =?utf-8?Q?EJR9wEtXUvtXDrCHMwRrEZcfE0tQHpl9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHAxVDRuZVIrOWdmbXpkdnFLQitMT2NQaThub1BlWGhOV3VFMWoyRVFMNjA1?=
 =?utf-8?B?eVgvQktuL3hLdzdsZHpTc0g2Wko0K1Y2WE5QOW00SHN6bG1sTzIvQW1vSW1h?=
 =?utf-8?B?dDRoS1hDSjZjNjNnWFM5UEp6bVRma256b05pZDN1enVTWUQrZDlsQ2ljVWQz?=
 =?utf-8?B?aWt5TDJrajVGdEFDNmNOU3pjUDJpbDI1cnNMN3dEaEZuM3RUL3RwdXA0NmF1?=
 =?utf-8?B?NHBuekhDSHRTKzZFbVVSSmY3bkNYVTRzaTgvMnNDd2Y3R2taUVFzZ2xuTGU1?=
 =?utf-8?B?QlpOMDNneHptZmpEamJ6b3Vnc1RQRHBSaytxcTdMWTFMcmJZci9BckQwU3kx?=
 =?utf-8?B?dVZudnp5U3JvcXhyT091MUxuM3dGVmJNV2tzWnVoeVMybzJhQm9XZUtSLzNk?=
 =?utf-8?B?UmpjTW5PTGJpWDh5ZGZ4Z3REeGxOQ3dTdlkwdGorQklUeXdWVW5MT0kranN6?=
 =?utf-8?B?RnRpeTVwODR5dmFITjlkZzU3Z0p2dDU2c21XREw4NHc1cng4bCtuVUtNVjF1?=
 =?utf-8?B?cUt4Q1FkR2FMQkhCdE1ubjNPdFhDRnFtWGxXUGMzZ2V6NTRSd09vSUZxcUs4?=
 =?utf-8?B?R0R4UEFDWXE0enJOVW9nekhMd2tzUi8yUy80MFpkMDNNODBlRVJCbmV5SnBL?=
 =?utf-8?B?dG1icFVvbitGQkxkdTFmUjlzbkx5MDZoV2JxN2hlK0VDRUcyM3VIeXl1aTlv?=
 =?utf-8?B?MnJIRVFSWHN6c21TUlFtTHAyc2dVSk8vajVPN0pwQzhGSkVjUDVTSkVoV2tS?=
 =?utf-8?B?dVludHVLWkwxVzdEbnE4ditTd3l1L01HMkR4QUtiYUZaS1FHSzdGWkhtTmNF?=
 =?utf-8?B?eE53eVJFcDc4bVIvbGdzLzJJZTgyN05XeHlmZXE1a2d5ZWFyUUp6YzdzdUF1?=
 =?utf-8?B?VkVPMCt0VVpsUjJvNkdxcEpiaWJUcVk3SE5vL1VHMjNVcGJZWUlVbG83NnZS?=
 =?utf-8?B?SGJESlFCaFE3LzE1N0FFU080WUxhdTRhTlRydE8yb3F4b0dWWjZYNUlVK045?=
 =?utf-8?B?Vkx5Q0k0dW9GNUJ6NDJQSWV6SzlxbzRJY25XQXNHSDRCZTJ5MFF1TmcvUDd4?=
 =?utf-8?B?MGZRZ1lUeU12MnRCVU1PdzNHYnVyeENRYzJLWGVaT3lvTU92VXdjbnVWWnFs?=
 =?utf-8?B?Wm5qbjFtZ0IyaWFlUEdtNjJ2ZnhmVFlrTlBZNmlqWE1lUHZnNVA4ZTN2SlEw?=
 =?utf-8?B?U2UyWFVFVVRhZWFueEFDUXRFNzlvaXdOS1hWZUJHdWFyaUIvb3hwc1BnSU5R?=
 =?utf-8?B?aDNRdE9tTFl6Vldvemg0YUFuY0tJalZHbWxjS1R5KytKS09MUEY3L2RlSXYx?=
 =?utf-8?B?WUVBOHdseVRvRUpXNmJUSTM0cGZIVlVGSzhQWFdQUTB6OVVleDgvRlZCODk0?=
 =?utf-8?B?MXFJREZienIzQk90TmV5NkFDdnloaGk2OG5rS2dlTnQwN1hPWnNVSkd5YW91?=
 =?utf-8?B?dVM5cFBscWVob1hDN0lTTkpOaVVqaDBqRUtiQ0tUYzVUZklKTWZwT3grZFFR?=
 =?utf-8?B?a3B3S1Y0M1lGa0pKN3VMSXJ2dDI5SGpCeFYwQzBxaEJuU2trVGdJZmRVTEdG?=
 =?utf-8?B?MU9xMjhrUlRFOFk2UVRHaTluWHd4NCs3OEhGRlpLSGtVQzhDY3FHaHlERmQv?=
 =?utf-8?B?aUFmbHAvM3ZDbTcwODJWbStOWkV2R3pYL3E0elZqb1YzUDdZc2h1eGFtaG5D?=
 =?utf-8?B?TzZFd3FNdS9VcUdDeDNrNWM1WW5KcG13THh3N25ZUjBqR2RTcTQxZld5ekRa?=
 =?utf-8?B?TTFhV0JQMmFTS3oxaVpIdm9ZbWlBUXhGTC8vU1dHb3diNi9GUHYyUGFYcGcv?=
 =?utf-8?B?ZkowQk5yU3hZaUc4NG9ENVZTNE5KTUtZTDdKZ3JyNDMzTVZuS0NNNXo1MDZN?=
 =?utf-8?B?QzFZQWhSaWpLcjhtZ3R1dndGUi91dU96dzAwQW5SODdLWCtHaThTNGFZT00z?=
 =?utf-8?B?RnppTDVqcUI1VzFVNXJUWGYzZEMvWEJDdWN3c1BZUllQU29FTnVodEVqL3Fh?=
 =?utf-8?B?QW5Sb09IcWxBODFFYUVUU0dFbWk5NlpuN3BLekJzalB0bFBLRlNla2EvNFlp?=
 =?utf-8?B?bHo1N0hTMlNtWmxqYi9rMng2bEl5WXpZaDdEVmVRSGhWNGhjTkYraDNxcFY2?=
 =?utf-8?Q?P6ouZhta+Q6dmch4S+OavIJow?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0d1516-ca73-4603-bdc0-08dd66593b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 20:12:38.7508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTGskQqbrEmD90dCVCKYGHCaUx7KwAn7zY8fnotuC/IznQ/uUvxWtXGswRFPWV483oUnhZ1Uwrk9vJCsaiuDsuT0egQ5XF2OSLUT+Z06Tag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBNYXJjaCAxOCwgMjAyNSAx
MTozOCBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+DQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0
YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IFpoYW5nLCBKaWFueHVuIDxqaWFueHVuLnpoYW5nQGludGVsLmNvbT47IExpbiwgU2h1
aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IE1yb3playwgTWljaGFsIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjkgMi82XSBkcm0veGUveGVfZ3RfcGFnZWZhdWx0OiBNb3ZlIHBhZ2Vm
YXVsdCBzdHJ1Y3QgdG8gaGVhZGVyDQo+IA0KPiBPbiAxOC4wMy4yMDI1IDE4OjExLCBKb25hdGhh
biBDYXZpdHQgd3JvdGU6DQo+ID4gTW92ZSB0aGUgcGFnZWZhdWx0IHN0cnVjdCBmcm9tIHhlX2d0
X3BhZ2VmYXVsdC5jIHRvIHRoZQ0KPiA+IHhlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIGhlYWRlciBm
aWxlLCBhbG9uZyB3aXRoIHRoZSBhc3NvY2lhdGVkIGVudW0gdmFsdWVzLg0KPiA+IA0KPiA+IHYy
Og0KPiA+IC0gTm9ybWFsaXplIG5hbWVzIGZvciBjb21tb24gaGVhZGVyIChNYXR0IEJyb3N0KQ0K
PiA+IA0KPiA+IHYzOg0KPiA+IC0gcy9NaWdyYXRlL01vdmUgKE1pY2hhbCBXKQ0KPiA+IC0gcy94
ZV9wYWdlZmF1bHQveGVfZ3RfcGFnZWZhdWx0IChNaWNoYWwgVykNCj4gPiAtIENyZWF0ZSBuZXcg
aGVhZGVyIGZpbGUsIHhlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIChNaWNoYWwgVykNCj4gPiAtIEFk
ZCBrZXJuZWwgZG9jcyAoTWljaGFsIFcpDQo+ID4gDQo+ID4gdjQ6DQo+ID4gLSBGaXggaW5jbHVk
ZXMgdXNhZ2UgKE1pY2hhbCBXKQ0KPiA+IC0gUmVmZXJlbmNlIEJzcGVjIChNaWNoYWwgVykNCj4g
PiANCj4gPiBCc3BlYzogNzc0MTINCj4gPiANCj4gDQo+IGtlZXAgYWxsIHRhZ3MgdG9nZXRoZXIN
Cj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPg0KPiA+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxNaWNoYWwuV2FqZGVjemtvQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVs
dC5jICAgICAgIHwgNDIgKysrLS0tLS0tLS0tLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaCB8IDYxICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkNCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHRfdHlw
ZXMuaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFn
ZWZhdWx0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMNCj4gPiBpbmRl
eCAzMjQwODkwYWFjMDcuLjM3YjRhYjUxMzVhOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfcGFnZWZhdWx0LmMNCj4gPiBAQCAtMTQsNiArMTQsNyBAQA0KPiA+ICAjaW5jbHVkZSAi
YWJpL2d1Y19hY3Rpb25zX2FiaS5oIg0KPiA+ICAjaW5jbHVkZSAieGVfYm8uaCINCj4gPiAgI2lu
Y2x1ZGUgInhlX2d0LmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaCIN
Cj4gPiAgI2luY2x1ZGUgInhlX2d0X3N0YXRzLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9ndF90bGJf
aW52YWxpZGF0aW9uLmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9ndWMuaCINCj4gPiBAQCAtMjMsMzMg
KzI0LDYgQEANCj4gPiAgI2luY2x1ZGUgInhlX3RyYWNlX2JvLmgiDQo+ID4gICNpbmNsdWRlICJ4
ZV92bS5oIg0KPiA+ICANCj4gPiAtc3RydWN0IHBhZ2VmYXVsdCB7DQo+ID4gLQl1NjQgcGFnZV9h
ZGRyOw0KPiA+IC0JdTMyIGFzaWQ7DQo+ID4gLQl1MTYgcGRhdGE7DQo+ID4gLQl1OCB2ZmlkOw0K
PiA+IC0JdTggYWNjZXNzX3R5cGU7DQo+ID4gLQl1OCBmYXVsdF90eXBlOw0KPiA+IC0JdTggZmF1
bHRfbGV2ZWw7DQo+ID4gLQl1OCBlbmdpbmVfY2xhc3M7DQo+ID4gLQl1OCBlbmdpbmVfaW5zdGFu
Y2U7DQo+ID4gLQl1OCBmYXVsdF91bnN1Y2Nlc3NmdWw7DQo+ID4gLQlib29sIHRydmFfZmF1bHQ7
DQo+ID4gLX07DQo+ID4gLQ0KPiA+IC1lbnVtIGFjY2Vzc190eXBlIHsNCj4gPiAtCUFDQ0VTU19U
WVBFX1JFQUQgPSAwLA0KPiA+IC0JQUNDRVNTX1RZUEVfV1JJVEUgPSAxLA0KPiA+IC0JQUNDRVNT
X1RZUEVfQVRPTUlDID0gMiwNCj4gPiAtCUFDQ0VTU19UWVBFX1JFU0VSVkVEID0gMywNCj4gPiAt
fTsNCj4gPiAtDQo+ID4gLWVudW0gZmF1bHRfdHlwZSB7DQo+ID4gLQlOT1RfUFJFU0VOVCA9IDAs
DQo+ID4gLQlXUklURV9BQ0NFU1NfVklPTEFUSU9OID0gMSwNCj4gPiAtCUFUT01JQ19BQ0NFU1Nf
VklPTEFUSU9OID0gMiwNCj4gPiAtfTsNCj4gPiAtDQo+ID4gIHN0cnVjdCBhY2Mgew0KPiA+ICAJ
dTY0IHZhX3JhbmdlX2Jhc2U7DQo+ID4gIAl1MzIgYXNpZDsNCj4gPiBAQCAtNjEsOSArMzUsOSBA
QCBzdHJ1Y3QgYWNjIHsNCj4gPiAgCXU4IGVuZ2luZV9pbnN0YW5jZTsNCj4gPiAgfTsNCj4gPiAg
DQo+ID4gLXN0YXRpYyBib29sIGFjY2Vzc19pc19hdG9taWMoZW51bSBhY2Nlc3NfdHlwZSBhY2Nl
c3NfdHlwZSkNCj4gPiArc3RhdGljIGJvb2wgYWNjZXNzX2lzX2F0b21pYyhlbnVtIHhlX2d0X3Bh
Z2VmYXVsdF9hY2Nlc3NfdHlwZSBhY2Nlc3NfdHlwZSkNCj4gPiAgew0KPiA+IC0JcmV0dXJuIGFj
Y2Vzc190eXBlID09IEFDQ0VTU19UWVBFX0FUT01JQzsNCj4gPiArCXJldHVybiBhY2Nlc3NfdHlw
ZSA9PSBYRV9HVF9QQUdFRkFVTFRfQUNDRVNTX1RZUEVfQVRPTUlDOw0KPiA+ICB9DQo+ID4gIA0K
PiA+ICBzdGF0aWMgYm9vbCB2bWFfaXNfdmFsaWQoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVj
dCB4ZV92bWEgKnZtYSkNCj4gPiBAQCAtMjA1LDcgKzE3OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgeGVf
dm0gKmFzaWRfdG9fdm0oc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBhc2lkKQ0KPiA+ICAJcmV0
dXJuIHZtOw0KPiA+ICB9DQo+ID4gIA0KPiA+IC1zdGF0aWMgaW50IGhhbmRsZV9wYWdlZmF1bHQo
c3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHBhZ2VmYXVsdCAqcGYpDQo+ID4gK3N0YXRpYyBpbnQg
aGFuZGxlX3BhZ2VmYXVsdChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgeGVfZ3RfcGFnZWZhdWx0
ICpwZikNCj4gPiAgew0KPiA+ICAJc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7
DQo+ID4gIAlzdHJ1Y3QgeGVfdm0gKnZtOw0KPiA+IEBAIC0yMzcsNyArMjExLDcgQEAgc3RhdGlj
IGludCBoYW5kbGVfcGFnZWZhdWx0KHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBwYWdlZmF1bHQg
KnBmKQ0KPiA+ICAJCWdvdG8gdW5sb2NrX3ZtOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCWlmICh4
ZV92bWFfcmVhZF9vbmx5KHZtYSkgJiYgcGYtPmFjY2Vzc190eXBlICE9IEFDQ0VTU19UWVBFX1JF
QUQpIHsNCj4gPiArCWlmICh4ZV92bWFfcmVhZF9vbmx5KHZtYSkgJiYgcGYtPmFjY2Vzc190eXBl
ICE9IFhFX0dUX1BBR0VGQVVMVF9BQ0NFU1NfVFlQRV9SRUFEKSB7DQo+ID4gIAkJZXJyID0gLUVQ
RVJNOw0KPiA+ICAJCWdvdG8gdW5sb2NrX3ZtOw0KPiA+ICAJfQ0KPiA+IEBAIC0yNzEsNyArMjQ1
LDcgQEAgc3RhdGljIGludCBzZW5kX3BhZ2VmYXVsdF9yZXBseShzdHJ1Y3QgeGVfZ3VjICpndWMs
DQo+ID4gIAlyZXR1cm4geGVfZ3VjX2N0X3NlbmQoJmd1Yy0+Y3QsIGFjdGlvbiwgQVJSQVlfU0la
RShhY3Rpb24pLCAwLCAwKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtc3RhdGljIHZvaWQgcHJpbnRf
cGFnZWZhdWx0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgcGFnZWZhdWx0ICpwZikNCj4g
PiArc3RhdGljIHZvaWQgcHJpbnRfcGFnZWZhdWx0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1
Y3QgeGVfZ3RfcGFnZWZhdWx0ICpwZikNCj4gPiAgew0KPiA+ICAJZHJtX2RiZygmeGUtPmRybSwg
IlxuXHRBU0lEOiAlZFxuIg0KPiA+ICAJCSAiXHRWRklEOiAlZFxuIg0KPiA+IEBAIC0yOTEsNyAr
MjY1LDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfcGFnZWZhdWx0KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LCBzdHJ1Y3QgcGFnZWZhdWx0ICpwZikNCj4gPiAgDQo+ID4gICNkZWZpbmUgUEZfTVNHX0xFTl9E
Vwk0DQo+ID4gIA0KPiA+IC1zdGF0aWMgYm9vbCBnZXRfcGFnZWZhdWx0KHN0cnVjdCBwZl9xdWV1
ZSAqcGZfcXVldWUsIHN0cnVjdCBwYWdlZmF1bHQgKnBmKQ0KPiA+ICtzdGF0aWMgYm9vbCBnZXRf
cGFnZWZhdWx0KHN0cnVjdCBwZl9xdWV1ZSAqcGZfcXVldWUsIHN0cnVjdCB4ZV9ndF9wYWdlZmF1
bHQgKnBmKQ0KPiA+ICB7DQo+ID4gIAljb25zdCBzdHJ1Y3QgeGVfZ3VjX3BhZ2VmYXVsdF9kZXNj
ICpkZXNjOw0KPiA+ICAJYm9vbCByZXQgPSBmYWxzZTsNCj4gPiBAQCAtMzc4LDcgKzM1Miw3IEBA
IHN0YXRpYyB2b2lkIHBmX3F1ZXVlX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncpDQo+
ID4gIAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gcGZfcXVldWUtPmd0Ow0KPiA+ICAJc3RydWN0IHhlX2Rl
dmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4gIAlzdHJ1Y3QgeGVfZ3VjX3BhZ2VmYXVsdF9y
ZXBseSByZXBseSA9IHt9Ow0KPiA+IC0Jc3RydWN0IHBhZ2VmYXVsdCBwZiA9IHt9Ow0KPiA+ICsJ
c3RydWN0IHhlX2d0X3BhZ2VmYXVsdCBwZiA9IHt9Ow0KPiA+ICAJdW5zaWduZWQgbG9uZyB0aHJl
c2hvbGQ7DQo+ID4gIAlpbnQgcmV0Ow0KPiA+ICANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3BhZ2VmYXVsdF90eXBlcy5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjU1YzU5OGM0YTFiYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmgNCj4gPiBAQCAtMCww
ICsxLDYxIEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gPiAr
LyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjItMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+
ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX1hFX0dUX1BBR0VGQVVMVF9UWVBFU19IXw0KPiA+
ICsjZGVmaW5lIF9YRV9HVF9QQUdFRkFVTFRfVFlQRVNfSF8NCj4gPiArDQo+ID4gKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCB4ZV9ndF9w
YWdlZmF1bHQgLSBTdHJ1Y3R1cmUgb2YgcGFnZWZhdWx0cyByZXR1cm5lZCBieSB0aGUNCj4gPiAr
ICogcGFnZWZhdWx0IGhhbmRsZXINCj4gPiArICovDQo+ID4gK3N0cnVjdCB4ZV9ndF9wYWdlZmF1
bHQgew0KPiA+ICsJLyoqIEBwYWdlX2FkZHI6IGZhdWx0ZWQgYWRkcmVzcyBvZiB0aGlzIHBhZ2Vm
YXVsdCAqLw0KPiA+ICsJdTY0IHBhZ2VfYWRkcjsNCj4gPiArCS8qKiBAYXNpZDogQVNJRCBvZiB0
aGlzIHBhZ2VmYXVsdCAqLw0KPiA+ICsJdTMyIGFzaWQ7DQo+ID4gKwkvKiogQHBkYXRhOiBQREFU
QSBvZiB0aGlzIHBhZ2VmYXVsdCAqLw0KPiA+ICsJdTE2IHBkYXRhOw0KPiA+ICsJLyoqIEB2Zmlk
OiBWRklEIG9mIHRoaXMgcGFnZWZhdWx0ICovDQo+ID4gKwl1OCB2ZmlkOw0KPiA+ICsJLyoqDQo+
ID4gKwkgKiBAYWNjZXNzX3R5cGU6IGFjY2VzcyB0eXBlIG9mIHRoaXMgcGFnZWZhdWx0LCBhcyBh
IHZhbHVlDQo+ID4gKwkgKiBmcm9tIHhlX2d0X3BhZ2VmYXVsdF9hY2Nlc3NfdHlwZQ0KPiA+ICsJ
ICovDQo+ID4gKwl1OCBhY2Nlc3NfdHlwZTsNCj4gPiArCS8qKg0KPiA+ICsJICogQGZhdWx0X3R5
cGU6IGZhdWx0IHR5cGUgb2YgdGhpcyBwYWdlZmF1bHQsIGFzIGEgdmFsdWUNCj4gPiArCSAqIGZy
b20geGVfZ3RfcGFnZWZhdWx0X2ZhdWx0X3R5cGUNCj4gPiArCSAqLw0KPiA+ICsJdTggZmF1bHRf
dHlwZTsNCj4gPiArCS8qKiBAZmF1bHRfbGV2ZWw6IGZhdWx0IGxldmVsIG9mIHRoaXMgcGFnZWZh
dWx0ICovDQo+ID4gKwl1OCBmYXVsdF9sZXZlbDsNCj4gPiArCS8qKiBAZW5naW5lX2NsYXNzOiBl
bmdpbmUgY2xhc3MgdGhpcyBwYWdlZmF1bHQgd2FzIHJlcG9ydGVkIG9uICovDQo+ID4gKwl1OCBl
bmdpbmVfY2xhc3M7DQo+ID4gKwkvKiogQGVuZ2luZV9pbnN0YW5jZTogZW5naW5lIGluc3RhbmNl
IHRoaXMgcGFnZWZhdWx0IHdhcyByZXBvcnRlZCBvbiAqLw0KPiA+ICsJdTggZW5naW5lX2luc3Rh
bmNlOw0KPiA+ICsJLyoqIEBmYXVsdF91bnN1Y2Nlc3NmdWw6IGZsYWcgZm9yIGlmIHRoZSBwYWdl
ZmF1bHQgcmVjb3ZlcmVkIG9yIG5vdCAqLw0KPiA+ICsJdTggZmF1bHRfdW5zdWNjZXNzZnVsOw0K
PiA+ICsJLyoqIEBwcmVmZXRjaDogdW51c2VkICovDQo+ID4gKwlib29sIHByZWZldGNoOw0KPiA+
ICsJLyoqIEB0cnZhX2ZhdWx0OiBpcyBzZXQgaWYgdGhpcyBpcyBhIFRSVFQgZmF1bHQgKi8NCj4g
PiArCWJvb2wgdHJ2YV9mYXVsdDsNCj4gPiArfTsNCj4gPiArDQo+ID4gK2VudW0geGVfZ3RfcGFn
ZWZhdWx0X2FjY2Vzc190eXBlIHsNCj4gPiArCVhFX0dUX1BBR0VGQVVMVF9BQ0NFU1NfVFlQRV9S
RUFEID0gMCwNCj4gPiArCVhFX0dUX1BBR0VGQVVMVF9BQ0NFU1NfVFlQRV9XUklURSA9IDEsDQo+
ID4gKwlYRV9HVF9QQUdFRkFVTFRfQUNDRVNTX1RZUEVfQVRPTUlDID0gMiwNCj4gPiArCVhFX0dU
X1BBR0VGQVVMVF9BQ0NFU1NfVFlQRV9SRVNFUlZFRCA9IDMsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICtlbnVtIHhlX2d0X3BhZ2VmYXVsdF9mYXVsdF90eXBlIHsNCj4gPiArCVhFX0dUX1BBR0VGQVVM
VF9UWVBFX05PVF9QUkVTRU5UID0gMCwNCj4gPiArCVhFX0dUX1BBR0VGQVVMVF9UWVBFX1dSSVRF
X0FDQ0VTU19WSU9MQVRJT04gPSAxLA0KPiA+ICsJWEVfR1RfUEFHRUZBVUxUX1RZUEVfQVRPTUlD
X0FDQ0VTU19WSU9MQVRJT04gPSAyLA0KPiA+ICt9Ow0KPiANCj4gYXMgdGhvc2UgdHdvIGVudW1z
IHNlZW1zIHRvIGJlIHJlZmxlY3RpbmcgSFcgZGVmaW5pdGlvbnMsIElNTyB0aGV5DQo+IHNob3Vs
ZCBiZSBkZWZpbmVkIHNlcGFyYXRlbHkgZnJvbSB0aGUgU1cgZGVmaW5pdGlvbnMNCj4gDQo+IG1v
c3Qgb2YgdGhlIEhXIGRlZmluaXRpb25zIHdlIGtlZXAgaW4gdGhlIHJlZ3MvIGZvbGRlciwgZXZl
biBpZiBub3QNCj4gYmVpbmcgcHVyZSByZWdpc3RlciBkZWZpbml0aW9ucywgc2VlOg0KPiAgLSB4
ZV9iYXJzLmgNCj4gIC0geGVfbHJjX2xheW91dC5oDQo+ICAtIHhlX2d0dF9kZWZzLmgNCj4gDQo+
IHdlIGNhbiBhZGQgcGFnZSBmYXVsdHMgZGVmcyB0byBuZXcgcmVncy94ZV9wYWdlZmF1bHRfZGVz
Yy5oICopIGZpbGUsDQo+IGFkZGl0aW9uYWxseSB3ZSBjYW4gZGVmaW5lIHRoZXJlIGZvcm1hdCBv
ZiB0aGUgcGFnZSBmYXVsdCBkZXNjcmlwdG9yLA0KPiBhbmQgcmVtb3ZlIGl0IGZyb20gdGhlIHhl
X2d1Y19md2lmLmgsIGFzIEd1QyBzZWVtcyB0byBwYXNzIGRhdGEgaW4gSFcNCj4gZm9ybWF0IGFu
eXdheQ0KDQpGb3IgY2xhcmlmaWNhdGlvbiwgd2hlbiBJIG1vdmUgdGhlc2UgZW51bSBkZWZpbml0
aW9ucyB0byB0aGUgcmVncyBmb2xkZXIsDQpJJ20gZ29pbmcgdG8gYXNzdW1lIHlvdSB3YW50IG1l
IHRvIGluY2x1ZGUgdGhlIGNyZWF0ZWQgaGVhZGVyIGZpbGUgYXMNCmFuIGluY2x1ZGVzIGluIHRo
ZSByZWxldmFudCAuYyBmaWxlcywgYW5kIG5vdCBqdXN0IHN0YXBsZSBpdCBpbnRvDQp4ZV9ndF9w
YWdlZmF1bHQuaCBvciB4ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaC4gIElzIHRoaXMgY29ycmVjdD8N
Cg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBvciBtYXliZSBATWF0dFIgaGFzIGEgYmV0dGVy
IGlkZWEgd2hlcmUgdGhlc2UgZGVmcyBzaG91bGQgZ28NCj4gDQo+IA0KPiAqKSBwbGVhc2UgZG9u
J3QgYmUgdGVtcHRlZCB0byB1c2UgcmVncy94ZV9wZl9kZXNjLmggc2luY2Ugd2Ugd2FudCB0byB1
c2UNCj4gIlBGIiB0ZXJtIG9ubHkgdG8gbWVhbiAiUGh5c2ljYWwgRnVuY3Rpb24iLCBub3QgInBh
Z2UgZmF1bHQiIDspDQo+IA0KPiA+ICsNCj4gPiArI2VuZGlmDQo+IA0KPiANCg==
