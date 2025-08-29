Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6ADB3C48B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B2B10EC3B;
	Fri, 29 Aug 2025 22:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6BDAtlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01510E215;
 Fri, 29 Aug 2025 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756504873; x=1788040873;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=ilhgFdrOcOBdllU5rdRtu/MjtrtgvD8szp8yBULPajE=;
 b=J6BDAtlBl4wS1q9w65paKx754wY7HUQwCgTvlFal9MiwAIrM/cTrHEVF
 oYQff4HqrTKhIyM8PrrAeRTxLsB9Qh17nxyYzij7bCdriNPVTp1bNZKZz
 pvkp1q+kZDMI4yWWmikjsTWMw0oxzDJEjd48ycCWvXcFAas22NDF778Qi
 DvddAq+L4KG0rVBAEiwdEeEIyK2wo9fbo/t9VfqxP454tsbZ/5QXzKy2D
 04PP6y0qC5GQS2P+pdOjZs5byfLNS/BGSIQ4iX3AlrZgPrwDNoGmsxDWa
 OyNvXINHcVM+3Q8pCJ7V19USa3BXXDYWH6iC47A3knhGxWyoDMrV0X5lu g==;
X-CSE-ConnectionGUID: aXlC6oVtQfKdZPIy9q/5ag==
X-CSE-MsgGUID: p7U0OypAS+W7y6ndfEJSww==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84204549"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84204549"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:01:12 -0700
X-CSE-ConnectionGUID: iubHeJvlQ2qEL3JRHCCv1Q==
X-CSE-MsgGUID: uEWS6LGCStaWX75Rk8ac+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175782807"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:01:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:01:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 15:01:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:01:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC3bbmVTQhIMCCzKuHTC9aunyOo3Uh5/8vRjV/IbresghDauBlhRDKRi6X8OQKPyvd6FPK1EU1cv2WKoqwvxemzqs4lk959+JOrafGAMCJ8m33j8c1BE96EONnFHq5uyZNkzgqNT2zOXgB7yHnzKYcZ2iyrXb27UPMlrBLHkPZjbgHj96udWJoat9czKR1H3m9by4WETCeFHofiPTcik0t/hGcAHwHFViVuLvGbtQLTGgKmqu/3HNbfVyHc1asrAbNRutTOofYLWFFL34bxvvGLUBGqFPKgX1ebAGEN4eKokgnjTolY8l7tqx7WCiP4hUl8uas/+Kk8bNx3grzLtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUieSqiV5MpnYyZHh5Srcde2NbWLQard/Hr3SqK+IuI=;
 b=yFW+qAgu0ju0FIe4vWsqddfFlVIEJdgr0VZYlCBs3u5rf1ySG5bV1XRiJj/DLwvZ5sRSAcexJlDxR8es6w4dLsrNZ4tIoOwcizTcK9Kpz6rQL3ek9QZIdv1j+pL7nRTBxgs7BjRWitYsn32usjZ4aajE8oWGzDvPmyfwOUpBf0h9wJD+biUg4KostyEhwxPl5dKEoRQQyfyrmME4PIiahzU4PGkLDe0fme9KmkNSrM8cjHFkw4jTiDjiCxQCfaZKMuRTcHxEj/OoK3rg/dPvE6Ekm5J4s2gVRiz6yX3964CUk7a8Wucuz/6P2G+PMC7G5+y9WxCGBFMIc+B1S4YcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.15; Fri, 29 Aug 2025 22:01:00 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 22:01:00 +0000
Date: Fri, 29 Aug 2025 17:00:56 -0500
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
Message-ID: <nuejxdhnalyok7tzwkrj67dwjgdafwp4mhdejpyyqnrh4f2epq@nlldovuflnbx>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:254::19) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 144d6f78-a6c5-46e0-d3c7-08dde74789c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG0wTEVXcDZMVUVNTXpldFhvVEkvanhOQnlwbGJaekowSFdGNlYxS1BEeEtM?=
 =?utf-8?B?dER6Qk1XVElCTDJrcjdaQmZHVlZwZjJZbjY4aTIrVUZOeFdvd2JTdEJSTnRk?=
 =?utf-8?B?bG1RRjNUVGV5dlVLWTY3MEZ0REU3UXpxT0hQZWo3WDZlMFhJMmZGS2swQkti?=
 =?utf-8?B?WjZENU53NkUvblR6a3drRXRHbDIxTW82aExrOUxsQU5ydXRCalZVSkVlNzlz?=
 =?utf-8?B?OVFScDRickRoK2tNb1R2K3YwZ2dxTjU1VSttTy84bHVlcUI2L2wrNW9rNXFO?=
 =?utf-8?B?SWZ1MWw1ZkM4OUZwQzdZNmlKUStKcEhrZDFWQjBaQXE0cHh0dC83N1hqRXgx?=
 =?utf-8?B?QkRUQWpzaStRTTEyQXFlRURHNk1QSTNjSHhxSmNmbFZab2o4cDUxZy9kaHdL?=
 =?utf-8?B?ZFlmd3g3U0ZFMnUzV1U2cXpJbzRHcG0zU3orR3ZwV0NqOHN3a1F3QkNsSENU?=
 =?utf-8?B?QlUrMTRPWFp1N1hTMjVMaTYyQXduNDEyZ3JuaGs4ejVOcDJ0SDNGbGpzU1U3?=
 =?utf-8?B?UngwcWE0Y0FuVGJmQ0pCd1lrMng4eExSZmd0SXRWWDNPM0VHeVZLbCtuMWpX?=
 =?utf-8?B?MEdFZVgwdEdGaTVSb2x3SlUwTWZzNG5NcHJEbHM4elZMdzBCc2RXaktIckxv?=
 =?utf-8?B?NCtoK2U2YWUyQitSYjJ3V0tqRC9WeURVQW9RRXZpdGdNbDJONGRoOHpSOExW?=
 =?utf-8?B?dGhBNEVjVlJRQkxPeUJOcCtoVlBOZ2Vkb1FRUUc0S1hETEkya25zenVVc1lN?=
 =?utf-8?B?YURDZmJGSnRpMFNjaUJUUTlDT0dXbDU0dHJsekFwdXFtb3MrWUlkOU94UWw5?=
 =?utf-8?B?NkxrUGl5RGVqV2c3ZnBBOXNvYmg1TUZLK0pJbGw0VGM1dGZDVUthT3ZPQmRk?=
 =?utf-8?B?N0lXWEdiWnNIQU9ENyswaFhYMW1jQzBJeG9XRENMUFpWVVNNOTBXd2huVmNZ?=
 =?utf-8?B?YU5VdVdtZ2lnN3ZIL3hSbGlFaDNCdTBjVm5rajJwcVBsM2g0d3ZBSC9oWDVN?=
 =?utf-8?B?d25uejFoRlZrcGpYU3BiNmVJTWxVWEtsM09Ob2ZzSjJYLzYwbXV1R1QvMlJH?=
 =?utf-8?B?aFhHZ2V5NGxxT1BMdHNqOUt5OEJwSnJmMklWNUhEUDdUNFp5NTJoZVVzbzh4?=
 =?utf-8?B?OWRyODFXckpTRUlNZitwYnVQUzN3L1Y2eWJ2SkNFWE9FZHk4c084blZ1N2FK?=
 =?utf-8?B?Q2tBSlU2cVhTbklibllKYUl6NUxJZ2dHZ0U4RXBET2YwQStBYUZyTVN1ckEr?=
 =?utf-8?B?c3NzUHNrQkRCbmtQblZNUDJVWGxGY2N2VnJ4OG41Z3Blekh4T053Tmd0d1JT?=
 =?utf-8?B?aG1INGtxbDZjZ29JaHpIOUV4QVFMZmhON0lkNXdIdVprSGEwZ2lkOHN0alM0?=
 =?utf-8?B?aTQ4ZVhvRVhpUTNqUFVPV1h4K2o2dXJDSVpzR0c0TjI3SHZjTGZQTTJqMHV5?=
 =?utf-8?B?bzBncmJadytvaHUzbGpVcUZEU0NyekV1WVpIOHBZRmZOVGQ5WWdBR1pIc3lL?=
 =?utf-8?B?cVV4NmFSTGFVZERyZ0xUbWd6RGkxQkh5ZUxDME9JVWZLYzNsNlVUMmY0Vkcr?=
 =?utf-8?B?Nnh5QmZpOENGZEZYNktQQlNZVUw3NW55cmpJa2FGclNURFFEeDV5aHdacUVh?=
 =?utf-8?B?eHNmanh2VHRneHBEakZFZ2psam52anRKalVXRW9ReWlEazdHSTJzZkJENkZj?=
 =?utf-8?B?UGdXYi9CV0VyV3ZRN1dNZE1LZjdKdUp0enYvWVdOcmhDaVRRcUZwaWQ5dEdS?=
 =?utf-8?B?NC9CMitNYmxUT3plRStVSGtDQ1gwaGY1NjloUHRVbTgyeHpIc0VlVEIrZndT?=
 =?utf-8?B?MmxlREVpM3JCRTBSYzdGM2ppN2hXRW1qYkEra01zWG56Tk9DVTF3QkcrMzQw?=
 =?utf-8?B?TEFkUDVBZVpxa0oza0RDVXE2Q2FwUWU4ajRpOEdYcTBkY1FXcW1MKzZXMkZ5?=
 =?utf-8?Q?R0n1W4fARn8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elNHdmxTQ2hXQzZNOG5lQlAxZm1sdXBLMnFvRnpVNXFKQVBaYjVPME9yT0NU?=
 =?utf-8?B?NC9MSVRVMFpwLzlzUlRFYXBaNDBRb25sUlVudC9CbXYrWlVjNE5BdUlRbVRY?=
 =?utf-8?B?K1Jla1RVMXNPY1doaDlxUnJ4M01uK3pPT0VPUHVodzZKNk50L2JGbTR4R0Fj?=
 =?utf-8?B?cTVsQWJqajJIMlhhTzlvVmFOczZRUXkvb0lmZXZLYjBBdExMa1R6ZmRWRmgx?=
 =?utf-8?B?WHBheXo4TVFpa28wMTAraDlja1NDOWVJQ3FYc3Q4MFVJM2VBNHB0dDJ3ODNF?=
 =?utf-8?B?RHdTTVFSOWFiT2cvSjArbWUxdlgvV1ljYzlOQ3JsU1JxWG5RUUMxdVkvNGEv?=
 =?utf-8?B?d1dVbHVUUGxFeU9xcGU5L2FieWYrRVZGNG4yRDhBdkp2cjZxQWI0MklMZDhE?=
 =?utf-8?B?aFp5NDE1ZFZvR2NrNldWbkZhZnZJY0UxTTFKTXVta2d5ZFRjdGNOdnJhSmNB?=
 =?utf-8?B?WUlad1N3aUhHNEw0ay9MR2ZNQ3FnLzRGcXJNdmlLUkk1VzM4WXJIdFpTeHFi?=
 =?utf-8?B?TDBOTVRXT0JkZDhacmtOV2t1eDFtU0JZOEFvMElGbVVtaXRzY1djbjJFTEtL?=
 =?utf-8?B?bWphQUJaREpIUDhZV1RyRG9haDQzYjFpSkFsMGI5Zk15UHIwbzBYdlVFRExI?=
 =?utf-8?B?Q0JVM1BJd1dsQ3pKelRybmxrNlAvaHNVaFZTOGRvaGJPdEM5WW96eHpIWjhM?=
 =?utf-8?B?cEl5SE5nTVJjSHpSbXNydjhObGt2UzhhY2pJYTBGVGFMUXRTU2lLb3U4NUhX?=
 =?utf-8?B?WVlXeUxmSzdXMmlUT2IwYmZTVFN5b0hrQjQ3eHFMM3V2ZmYrQnF6RjVMK3I1?=
 =?utf-8?B?NEpJc2huNDRTd0ZZZ2xDdi9SWVVhOVRMTDMyNjRWWkZBTm1aWTd5VHZaWUQ3?=
 =?utf-8?B?aTl5azlGQzE5Mzk5V1plMEtkR29wNSs0d3hEeHZjN0NodGhtM3JMOG15YkJn?=
 =?utf-8?B?eDhTTEwyTThENWZmaWpsdW9vcndUODBsUXVDd1hFeDQ3WmwwUlpTWnhCU05q?=
 =?utf-8?B?T2NHLzg2ek9raFY3cWMxajFNM3FYc2FwcHA0dVZCYkNpNUpVSVpWYnpsSzNV?=
 =?utf-8?B?Q0VmeVdXa1c5RnhCM3djcmZZR0p5bmk5cmliRC9KVHg0T1orUm1mc3dhdWRI?=
 =?utf-8?B?czNEUjhvZUJoQ3c0Z0EvWEtaSmRkYWZXUkR2akt2MW8yWTNYeGxjUXU4THQ4?=
 =?utf-8?B?aFp0S0NHTFlPZEgrMDJIT0syeVBHREw4WUJXUDhGRUsxbnphNGwvNitZb3N6?=
 =?utf-8?B?NUlEemt5V0dZcEVnZG1ZelNLZzNEbDFKK2U2c2hTWUFxaW1rQlFqakc2NGlB?=
 =?utf-8?B?OHBsVnh3SWJWWWQxcVJwK091UU8yYVVFTjlaaXg0Uy81NWtkL3NPVWhqM2JX?=
 =?utf-8?B?cWh0d0JDYXNNNHJ5c1pNUUQxZnc3NS9aYk1vTmpUY3NHWmVDSE1YS095V0hj?=
 =?utf-8?B?MTRCSWNmYnJ3R0ZZdW9DL1VnQVdjNmNzTDFHcU42K2lOdDVIN0VSMEJBZzAy?=
 =?utf-8?B?elFUZ3RhL3Yrc1packprZEZ2ZFdhSkJabndrMjRFUVBTUFFqdmRIT3Z0UVFw?=
 =?utf-8?B?SEc3OFFRM0x5YmlldWZsYUd6RU1uN0RNNkUveDVUZkVBeEdrQ3hCQzMrNVR6?=
 =?utf-8?B?NTdPaXNsNHdCWmNxcGNpWjVHOUxwckJoK0hUUjliUUx2L1doOHVhRTcxR2hj?=
 =?utf-8?B?MVRxaHpBMm9pck1hZ0MyekxsYi9hb2NrT0Z2blZiQmlITDJKbXEzNzhmNEV3?=
 =?utf-8?B?eVFwaFNOck5Delhkc0tISHJQQTJFVWRlMEpWajZVcUlBN2FDa1lzeHI0Zldv?=
 =?utf-8?B?ZWZmMzZDWklyaDR6cE5JcGtZK1FsM3A5L01lajFzM3I3dkhJODdNQUdQM0g1?=
 =?utf-8?B?bEpoWEFkWVc5QTA1ankwYW5xU3ppNWdGZUU2Qlp6M1pmZjJyU0NSVTQ4Vktk?=
 =?utf-8?B?bjFlRFpGTHZRa1Jkdy8wSEpid0lDTmJRdFRIa1dBWjNsTXVnSDJ2QjRvczRp?=
 =?utf-8?B?UEREQ3UybG5OcmY5a0tDQTFJWDRaeFVCeFlQZW5hZTk2RnZhaXdNeDFwRzNu?=
 =?utf-8?B?NEovNi9zOFRwdHVYU3dnTE5jTythVHUyZWlVVnRIVkJDRXowQjJuT0Jpd1dh?=
 =?utf-8?B?d210SGF3djVEMHR6ZWRra1FzMHR3YThFTEwvb1lnWkNJSU5GeEpZV3RkYVBD?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 144d6f78-a6c5-46e0-d3c7-08dde74789c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 22:01:00.0000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvYOwGL/rjE5RDK1aJJnZLvp2Xig26p7AbX047ge8LC4c1TOEz73SSbTHdJ2y96F2Pc23IDXMAoYU6sI3ay7Q+G/GYQy3xpj9hxo7scyjAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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

Here is the first pull targeting 6.18. Quite on the big side and
contains 3 new UAPIs. The 2 backmerges are there since part of the work
went through the PCI subsystem (for SR-IOV) and drm-misc (for madvise
interface).

I anticipate we will have one more pull request in a couple of weeks,
but it should be smaller than this one.

Thaks,
Lucas De Marchi

drm-xe-next-2025-08-29:
UAPI Changes:
  - Add madvise interface (Himal Prasad Ghimiray)
  - Add DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS to query VMA count and
    memory attributes (Himal Prasad Ghimiray)
  - Handle Firmware reported Hardware Errors notifying userspace with
    device wedged uevent (Riana Tauro)

Cross-subsystem Changes:

  - Add a vendor-specific recovery method to drm device wedged uevent
    (Riana Tauro)

Driver Changes:
  - Use same directory structure in debugfs as in sysfs (Michal Wajdeczko)
  - Cleanup and future-proof VRAM region initialization (Piotr Piórkowski)
  - Add G-states and PCIe link states to debugfs (Soham Purkait)
  - Cleanup eustall debug messages (Harish Chegondi)
  - Add SR-IOV support to restore Compression Control Surface (CCS) to
    Xe2 and later (Satyanarayana K V P)
  - Enable SR-IOV PF mode by default on supported platforms without
    needing CONFIG_DRM_XE_DEBUG and mark some platforms behind
    force_probe as supported (Michal Wajdeczko)
  - More targeted log messages (Michal Wajdeczko)
  - Cleanup STEER_SEMAPHORE/MCFG_MCR_SELECTOR usage (Nitin Gote)
  - Use common code to emit flush (Tvrtko Ursulin)
  - Add/extend more HW workarounds and tunings for Xe2 and Xe3
    (Sk Anirban, Tangudu Tilak Tirumalesh, Nitin Gote, Chaitanya Kumar Borah)
  - Add a generic dependency scheduler to help with TLB invalidations
    and future scenarios (Matthew Brost)
  - Use DRM scheduler for delayed GT TLB invalidations (Matthew Brost)
  - Error out on incorrect device use in configfs
    (Michal Wajdeczko, Lucas De Marchi)
  - Refactor configfs attributes (Michal Wajdeczko / Lucas De Marchi)
  - Allow configuring future VF devices via configfs (Michal Wajdeczko)
  - Implement some missing XeLP workarounds (Tvrtko Ursulin)
  - Generalize WA BB setup/emission and add support for
    mid context restore BB, aka indirect context (Tvrtko Ursulin)
  - Prepare the driver to expose mmio regions to userspace
    in future (Ilia Levi)
  - Add more GuC load error status codes (John Harrison)
  - Document DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING (Priyanka Dandamudi)
  - Disable CSC and RPM on VFs (Lukasz Laguna, Satyanarayana K V P)
  - Fix oops in xe_gem_fault with PREEMPT_RT (Maarten Lankhorst)
  - Skip LMTT update if no LMEM was provisioned (Michal Wajdeczko)
  - Add support to VF migration (Tomasz Lis)
  - Use a helper for guc_waklv_enable functions (Jonathan Cavitt)
  - Prepare GPU SVM for migration of THP (Francois Dugast)
  - Program LMTT directory pointer on all GTs within a tile
    (Piotr Piórkowski)
  - Rename XE_WA to XE_GT_WA to better convey its scope vs the device WAs
    (Matt Atwood)
  - Allow to match devices on PCI devid/vendorid only (Lucas De Marchi)
  - Improve PDE PAT index selection (Matthew Brost)
  - Consolidate ASID allocation in xe_vm_create() vs
    xe_vm_create_ioctl() (Piotr Piórkowski)
  - Resize VF BARS to max possible size according to number of VFs
    (Michał Winiarski)
  - Untangle vm_bind_ioctl cleanup order (Christoph Manszewski)
  - Start fixing usage of XE_PAGE_SIZE vs PAGE_SIZE to improve
    compatibility with non-x86 arch (Simon Richter)
  - Improve tile vs gt initialization order and accounting
    (Gustavo Sousa)
  - Extend WA kunit test to PTL
  - Ensure data is initialized before transferring to pcode
    (Stuart Summers)
  - Add PSMI support for HW validation (Lucas De Marchi,
    Vinay Belgaumkar, Badal Nilawar)
  - Improve xe_dma_buf test (Thomas Hellström, Marcin Bernatowicz)
  - Fix basename() usage in generator with !glibc (Carlos Llamas)
  - Ensure GT is in C0 during resumes (Xin Wang)
  - Add TLB invalidation abstraction (Matt Brost, Stuart Summers)
  - Make MI_TLB_INVALIDATE conditional on migrate (Matthew Auld)
  - Prepare xe_nvm to be initialized early for future use cases
    (Riana Tauro)
The following changes since commit 1cd0c7afef97c3192edc92774a62d36b2a0bf2e0:

   Merge tag 'drm-misc-next-2025-08-21' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-08-25 06:38:49 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-08-29

for you to fetch changes up to 1047bd82794a1eab64d643f196d09171ce983f44:

   drm/xe: Fix incorrect migration of backed-up object to VRAM (2025-08-29 15:30:57 +0200)

----------------------------------------------------------------
UAPI Changes:
  - Add madvise interface (Himal Prasad Ghimiray)
  - Add DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS to query VMA count and
    memory attributes (Himal Prasad Ghimiray)
  - Handle Firmware reported Hardware Errors notifying userspace with
    device wedged uevent (Riana Tauro)

Cross-subsystem Changes:

  - Add a vendor-specific recovery method to drm device wedged uevent
    (Riana Tauro)

Driver Changes:
  - Use same directory structure in debugfs as in sysfs (Michal Wajdeczko)
  - Cleanup and future-proof VRAM region initialization (Piotr Piórkowski)
  - Add G-states and PCIe link states to debugfs (Soham Purkait)
  - Cleanup eustall debug messages (Harish Chegondi)
  - Add SR-IOV support to restore Compression Control Surface (CCS) to
    Xe2 and later (Satyanarayana K V P)
  - Enable SR-IOV PF mode by default on supported platforms without
    needing CONFIG_DRM_XE_DEBUG and mark some platforms behind
    force_probe as supported (Michal Wajdeczko)
  - More targeted log messages (Michal Wajdeczko)
  - Cleanup STEER_SEMAPHORE/MCFG_MCR_SELECTOR usage (Nitin Gote)
  - Use common code to emit flush (Tvrtko Ursulin)
  - Add/extend more HW workarounds and tunings for Xe2 and Xe3
    (Sk Anirban, Tangudu Tilak Tirumalesh, Nitin Gote, Chaitanya Kumar Borah)
  - Add a generic dependency scheduler to help with TLB invalidations
    and future scenarios (Matthew Brost)
  - Use DRM scheduler for delayed GT TLB invalidations (Matthew Brost)
  - Error out on incorrect device use in configfs
    (Michal Wajdeczko, Lucas De Marchi)
  - Refactor configfs attributes (Michal Wajdeczko / Lucas De Marchi)
  - Allow configuring future VF devices via configfs (Michal Wajdeczko)
  - Implement some missing XeLP workarounds (Tvrtko Ursulin)
  - Generalize WA BB setup/emission and add support for
    mid context restore BB, aka indirect context (Tvrtko Ursulin)
  - Prepare the driver to expose mmio regions to userspace
    in future (Ilia Levi)
  - Add more GuC load error status codes (John Harrison)
  - Document DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING (Priyanka Dandamudi)
  - Disable CSC and RPM on VFs (Lukasz Laguna, Satyanarayana K V P)
  - Fix oops in xe_gem_fault with PREEMPT_RT (Maarten Lankhorst)
  - Skip LMTT update if no LMEM was provisioned (Michal Wajdeczko)
  - Add support to VF migration (Tomasz Lis)
  - Use a helper for guc_waklv_enable functions (Jonathan Cavitt)
  - Prepare GPU SVM for migration of THP (Francois Dugast)
  - Program LMTT directory pointer on all GTs within a tile
    (Piotr Piórkowski)
  - Rename XE_WA to XE_GT_WA to better convey its scope vs the device WAs
    (Matt Atwood)
  - Allow to match devices on PCI devid/vendorid only (Lucas De Marchi)
  - Improve PDE PAT index selection (Matthew Brost)
  - Consolidate ASID allocation in xe_vm_create() vs
    xe_vm_create_ioctl() (Piotr Piórkowski)
  - Resize VF BARS to max possible size according to number of VFs
    (Michał Winiarski)
  - Untangle vm_bind_ioctl cleanup order (Christoph Manszewski)
  - Start fixing usage of XE_PAGE_SIZE vs PAGE_SIZE to improve
    compatibility with non-x86 arch (Simon Richter)
  - Improve tile vs gt initialization order and accounting
    (Gustavo Sousa)
  - Extend WA kunit test to PTL
  - Ensure data is initialized before transferring to pcode
    (Stuart Summers)
  - Add PSMI support for HW validation (Lucas De Marchi,
    Vinay Belgaumkar, Badal Nilawar)
  - Improve xe_dma_buf test (Thomas Hellström, Marcin Bernatowicz)
  - Fix basename() usage in generator with !glibc (Carlos Llamas)
  - Ensure GT is in C0 during resumes (Xin Wang)
  - Add TLB invalidation abstraction (Matt Brost, Stuart Summers)
  - Make MI_TLB_INVALIDATE conditional on migrate (Matthew Auld)
  - Prepare xe_nvm to be initialized early for future use cases
    (Riana Tauro)

----------------------------------------------------------------
Ashutosh Dixit (1):
       drm/xe/oa: Fix static checker warning about null gt

Badal Nilawar (1):
       drm/xe/psmi: Add Wa_14020001231

Balasubramani Vivekanandan (1):
       drm/xe/devcoredump: Defer devcoredump initialization during probe

Carlos Llamas (1):
       drm/xe: switch to local xbasename() helper

Chaitanya Kumar Borah (1):
       drm/xe/wcl: Extend L3bank mask workaround

Christoph Manszewski (2):
       drm/xe: Fix vm_bind_ioctl double free bug
       drm/xe: Untangle vm_bind_ioctl cleanup order

Dan Carpenter (3):
       drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()
       drm/xe: Fix an IS_ERR() vs NULL bug in xe_tile_alloc_vram()
       drm/xe/vf: Fix IS_ERR() vs NULL check in xe_sriov_vf_ccs_init()

Francois Dugast (6):
       drm/pagemap: Rename drm_pagemap_device_addr to drm_pagemap_addr
       drm/pagemap: Use struct drm_pagemap_addr in mapping and copy functions
       drm/pagemap: DMA map folios when possible
       drm/pagemap: Allocate folios when possible
       drm/xe/migrate: Populate struct drm_pagemap_addr array
       drm/xe/svm: Migrate folios when possible

Gustavo Sousa (2):
       drm/xe: Probe for tile count during device info initialization
       drm/xe: Use for_each_gt to define gt_count

Harish Chegondi (1):
       drm/xe: Remove unnecessary EU stall debug message

Himal Prasad Ghimiray (21):
       drm/xe/uapi: Add madvise interface
       drm/xe/vm: Add attributes struct as member of vma
       drm/xe/vma: Move pat_index to vma attributes
       drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
       drm/xe/svm: Split system allocator vma incase of madvise call
       drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
       drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
       drm/xe: Implement madvise ioctl for xe
       drm/xe/svm: Add svm ranges migration policy on atomic access
       drm/xe/madvise: Update migration policy based on preferred location
       drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
       drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
       drm/xe/svm: Consult madvise preferred location in prefetch
       drm/xe/bo: Add attributes field to xe_bo
       drm/xe/bo: Update atomic_access attribute on madvise
       drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
       drm/xe/vm: Add helper to check for default VMA memory attributes
       drm/xe: Reset VMA attributes to default in SVM garbage collector
       drm/xe: Enable madvise ioctl for xe
       drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
       drm/xe/uapi: Fix kernel-doc formatting for madvise and vma_query

Ilia Levi (1):
       drm/xe: Support for mmap-ing mmio regions

John Harrison (1):
       drm/xe/guc: Add more GuC load error status codes

Jonathan Cavitt (1):
       drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions

Karthik Poosa (1):
       drm/xe/hwmon: Add SW clamp for power limits writes

Lucas De Marchi (15):
       drm/xe: Fix build without debugfs
       drm/intel/pciids: Add match on vendor/id only
       Merge drm/drm-next into drm-xe-next
       drm/xe/psmi: Add GuC flag to enable PSMI
       drm/xe/psmi: Add debugfs interface for PSMI
       drm/xe/rtp: Add match for psmi
       drm/xe/configfs: Simplify kernel doc
       drm/xe/configfs: Allow to enable PSMI
       drm/xe/configfs: Use guard() for dev->lock
       drm/xe/configfs: Use tree-like output in documentation
       drm/xe/configfs: Improve documentation steps
       drm/xe/configfs: Minor fixes to documentation
       drm/xe/configfs: Dump custom settings when binding
       Merge drm/drm-next into drm-xe-next
       drm/xe/configfs: Block runtime attribute changes

Lukasz Laguna (2):
       drm/xe/vf: Don't register I2C devices if VF
       drm/xe/vf: Disable CSC support on VF

Maarten Lankhorst (1):
       drm/xe: Fix oops in xe_gem_fault when running core_hotunplug test.

Marcin Bernatowicz (1):
       drm/xe/tests: Make cross-device dma-buf BOs CPU-visible on small BAR

Matt Atwood (2):
       drm/xe: rename XE_WA to XE_GT_WA
       drm/xe: Update function names for GT specific workarounds

Matthew Auld (5):
       drm/xe/migrate: prevent infinite recursion
       drm/xe/migrate: don't overflow max copy size
       drm/xe/migrate: prevent potential UAF
       drm/xe: rework PDE PAT index selection
       drm/xe/migrate: make MI_TLB_INVALIDATE conditional

Matthew Brost (15):
       drm/xe: Explicitly mark migration queues with flag
       drm/xe: Add generic dependecy jobs / scheduler
       drm/xe: Create ordered workqueue for GT TLB invalidation jobs
       drm/xe: Add dependency scheduler for GT TLB invalidations to bind queues
       drm/xe: Add GT TLB invalidation jobs
       drm/xe: Use GT TLB invalidation jobs in PT layer
       drm/xe: Remove unused GT TLB invalidation trace points
       drm/xe: Don't trigger rebind on initial dma-buf validation
       drm/xe: s/tlb_invalidation/tlb_inval
       drm/xe: Add xe_tlb_inval structure
       drm/xe: Add xe_gt_tlb_invalidation_done_handler
       drm/xe: Decouple TLB invalidations from GT
       drm/xe: Prep TLB invalidation fence before sending
       drm/xe: Add helpers to send TLB invalidations
       drm/xe: Split TLB invalidation code in frontend and backend

Michal Wajdeczko (25):
       drm/xe: Move debugfs GT attributes under tile directory
       drm/xe/pf: Enable SR-IOV PF mode by default
       drm/xe: Enable SR-IOV for ADL/ATSM
       drm/xe: Enable SR-IOV for TGL
       drm/xe: Make GGTT TLB invalidation failure message GT oriented
       drm/xe/guc: Clear whole g2h_fence during initialization
       drm/xe/configfs: Fix pci_dev reference leak
       drm/xe/configfs: Enforce canonical device names
       drm/xe/configfs: Use pci_name() for lookup
       drm/xe/hw_engine_group: Don't use drm_warn to catch missed case
       drm/xe/pf: Skip LMTT update if no LMEM was provisioned
       drm/xe/pf: Disable PF restart worker on device removal
       drm/xe/pf: Make sure PF is ready to configure VFs
       drm/xe/pf: Don't resume device from restart worker
       drm/xe: Simplify module initialization code
       drm/xe: Print module init abort code
       drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
       drm/xe/configfs: Drop redundant init() error message
       drm/xe/configfs: Rename struct xe_config_device
       drm/xe/configfs: Rename configfs_find_group() helper
       drm/xe/configfs: Reintroduce struct xe_config_device
       drm/xe/configfs: Keep default device config settings together
       drm/xe/configfs: Only allow configurations for supported devices
       drm/xe/configfs: Allow adding configurations for future VFs
       drm/xe/kunit: Extend platform generator with PTL

Michał Winiarski (1):
       drm/xe/pf: Set VF LMEM BAR size

Nitin Gote (2):
       drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
       drm/xe/tuning: Apply "Disable NULL query for Anyhit Shader" to Xe2

Piotr Piórkowski (8):
       drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
       drm/xe: Use dynamic allocation for tile and device VRAM region structures
       drm/xe: Move struct xe_vram_region to a dedicated header
       drm/xe: Split xe_migrate allocation from initialization
       drm/xe: Unify the initialization of VRAM regions
       drm/xe/pf: Program LMTT directory pointer on all GTs within a tile
       drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
       drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_create

Priyanka Dandamudi (1):
       drm/xe/uapi: Add documentation for DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING

Raag Jadav (2):
       drm/xe: Don't fail probe on unsupported mailbox command
       drm/xe/i2c: Introduce xe_i2c_present()

Riana Tauro (11):
       drm/xe: Add documentation for Xe Device Wedging
       drm: Add a vendor-specific recovery method to drm device wedged uevent
       drm/xe: Set GT as wedged before sending wedged uevent
       drm/xe: Add a helper function to set recovery method
       drm/xe/xe_survivability: Refactor survivability mode
       drm/xe/xe_survivability: Add support for Runtime survivability mode
       drm/xe/doc: Document device wedged and runtime survivability
       drm/xe: Add support to handle hardware errors
       drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
       drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
       drm/xe/nvm: Use root tile mmio

Satyanarayana K V P (6):
       drm/xe/vf: Create contexts for CCS read write
       drm/xe/vf: Attach and detach CCS copy commands with BO
       drm/xe/vf: Register CCS read/write contexts with Guc
       drm/xe/vf: Fix VM crash during VF driver release
       drm/xe/vf: Refactor CCS save/restore to use default migration context
       drm/xe/pm: Disable RPM for SR-IOV VFs

Shuicheng Lin (1):
       drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()

Simon Richter (2):
       Mark xe driver as BROKEN if kernel page size is not 4kB
       drm/xe: Make page size consistent in loop

Sk Anirban (1):
       drm/xe/ptl: Apply Wa_16026007364

Soham Purkait (1):
       drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs

Stuart Summers (3):
       drm/xe/pcode: Initialize data0 for pcode read routine
       drm/xe: Move explicit CT lock in TLB invalidation sequence
       drm/xe: Cancel pending TLB inval workers on teardown

Tangudu Tilak Tirumalesh (1):
       drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3 platforms

Thomas Hellström (5):
       drm/xe: Defer buffer object shrinker write-backs and GPU waits
       drm/xe/vm: Don't pin the vm_resv during validation
       drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
       drm/xe/vm: Clear the scratch_pt pointer on error
       drm/xe: Fix incorrect migration of backed-up object to VRAM

Tomasz Lis (8):
       drm/xe/sa: Avoid caching GGTT address within the manager
       drm/xe/vf: Pause submissions during RESFIX fixups
       drm/xe: Block reset while recovering from VF migration
       drm/xe/vf: Rebase HWSP of all contexts after migration
       drm/xe/vf: Rebase MEMIRQ structures for all contexts after migration
       drm/xe/vf: Post migration, repopulate ring area for pending request
       drm/xe/vf: Refresh utilization buffer during migration recovery
       drm/xe/vf: Rebase exec queue parallel commands during migration recovery

Tvrtko Ursulin (3):
       drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
       drm/xe/xelp: Implement Wa_16010904313
       drm/xe/xelp: Add Wa_18022495364

Vinay Belgaumkar (1):
       drm/xe/psmi: Add Wa_16023683509

Xin Wang (2):
       drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
       drm/xe: Ensure GT is in C0 during resumes

Zbigniew Kempczyński (1):
       drm/xe/xe_sync: avoid race during ufence signaling

Zhanjun Dong (1):
       drm/xe/uc: Fix missing unwind goto

  Documentation/gpu/drm-uapi.rst                    |  47 +-
  Documentation/gpu/xe/index.rst                    |   1 +
  Documentation/gpu/xe/xe_device.rst                |  10 +
  Documentation/gpu/xe/xe_pcode.rst                 |   6 +-
  drivers/gpu/drm/drm_drv.c                         |   2 +
  drivers/gpu/drm/drm_gpusvm.c                      |   4 +-
  drivers/gpu/drm/drm_pagemap.c                     | 142 +++--
  drivers/gpu/drm/xe/Makefile                       |  10 +-
  drivers/gpu/drm/xe/abi/guc_actions_abi.h          |   8 +
  drivers/gpu/drm/xe/abi/guc_errors_abi.h           |   3 +
  drivers/gpu/drm/xe/abi/guc_klvs_abi.h             |   2 +
  drivers/gpu/drm/xe/display/intel_fbdev_fb.c       |   2 +-
  drivers/gpu/drm/xe/display/xe_display_wa.c        |   2 +-
  drivers/gpu/drm/xe/display/xe_fb_pin.c            |   5 +-
  drivers/gpu/drm/xe/display/xe_plane_initial.c     |   5 +-
  drivers/gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
  drivers/gpu/drm/xe/regs/xe_engine_regs.h          |   3 +
  drivers/gpu/drm/xe/regs/xe_gsc_regs.h             |   2 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h              |   2 +-
  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h        |  20 +
  drivers/gpu/drm/xe/regs/xe_irq_regs.h             |   1 +
  drivers/gpu/drm/xe/regs/xe_pmt.h                  |  10 +
  drivers/gpu/drm/xe/tests/xe_dma_buf.c             |  13 +-
  drivers/gpu/drm/xe/tests/xe_pci.c                 |   7 +
  drivers/gpu/drm/xe/tests/xe_wa_test.c             |   1 +
  drivers/gpu/drm/xe/xe_assert.h                    |   4 +-
  drivers/gpu/drm/xe/xe_bb.c                        |  35 ++
  drivers/gpu/drm/xe/xe_bb.h                        |   3 +
  drivers/gpu/drm/xe/xe_bo.c                        |  94 +++-
  drivers/gpu/drm/xe/xe_bo.h                        |   4 +-
  drivers/gpu/drm/xe/xe_bo_types.h                  |  12 +
  drivers/gpu/drm/xe/xe_configfs.c                  | 346 ++++++++++---
  drivers/gpu/drm/xe/xe_configfs.h                  |   4 +
  drivers/gpu/drm/xe/xe_debugfs.c                   | 114 ++++
  drivers/gpu/drm/xe/xe_dep_job_types.h             |  29 ++
  drivers/gpu/drm/xe/xe_dep_scheduler.c             | 143 +++++
  drivers/gpu/drm/xe/xe_dep_scheduler.h             |  21 +
  drivers/gpu/drm/xe/xe_device.c                    | 112 +++-
  drivers/gpu/drm/xe/xe_device.h                    |   1 +
  drivers/gpu/drm/xe/xe_device_sysfs.c              |   8 +-
  drivers/gpu/drm/xe/xe_device_types.h              |  86 +---
  drivers/gpu/drm/xe/xe_eu_stall.c                  |   4 +-
  drivers/gpu/drm/xe/xe_exec_queue.c                | 111 ++++
  drivers/gpu/drm/xe/xe_exec_queue.h                |   5 +
  drivers/gpu/drm/xe/xe_exec_queue_types.h          |  15 +
  drivers/gpu/drm/xe/xe_gen_wa_oob.c                |  10 +-
  drivers/gpu/drm/xe/xe_ggtt.c                      |  15 +-
  drivers/gpu/drm/xe/xe_gpu_scheduler.c             |  13 +
  drivers/gpu/drm/xe/xe_gpu_scheduler.h             |   1 +
  drivers/gpu/drm/xe/xe_gsc.c                       |   6 +-
  drivers/gpu/drm/xe/xe_gt.c                        |  34 +-
  drivers/gpu/drm/xe/xe_gt_debugfs.c                |  56 +-
  drivers/gpu/drm/xe/xe_gt_idle.c                   |  21 +-
  drivers/gpu/drm/xe/xe_gt_idle.h                   |   2 +-
  drivers/gpu/drm/xe/xe_gt_mcr.c                    |   4 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c              |  35 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf.c               |  24 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |  13 +-
  drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |  14 +
  drivers/gpu/drm/xe/xe_gt_sriov_vf.h               |   1 +
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       | 596 ---------------------
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |  40 --
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  32 --
  drivers/gpu/drm/xe/xe_gt_topology.c               |   2 +-
  drivers/gpu/drm/xe/xe_gt_types.h                  |  33 +-
  drivers/gpu/drm/xe/xe_guc.c                       |  43 +-
  drivers/gpu/drm/xe/xe_guc_ads.c                   | 123 ++---
  drivers/gpu/drm/xe/xe_guc_buf.c                   |   2 +-
  drivers/gpu/drm/xe/xe_guc_ct.c                    |   8 +-
  drivers/gpu/drm/xe/xe_guc_fwif.h                  |   7 +
  drivers/gpu/drm/xe/xe_guc_pc.c                    |  23 +-
  drivers/gpu/drm/xe/xe_guc_submit.c                | 209 +++++++-
  drivers/gpu/drm/xe/xe_guc_submit.h                |  10 +
  drivers/gpu/drm/xe/xe_guc_tlb_inval.c             | 242 +++++++++
  drivers/gpu/drm/xe/xe_guc_tlb_inval.h             |  19 +
  drivers/gpu/drm/xe/xe_guc_types.h                 |   6 +
  drivers/gpu/drm/xe/xe_heci_gsc.c                  |   2 +-
  drivers/gpu/drm/xe/xe_hw_engine.c                 |   2 +-
  drivers/gpu/drm/xe/xe_hw_engine_group.c           |   4 +-
  drivers/gpu/drm/xe/xe_hw_error.c                  | 182 +++++++
  drivers/gpu/drm/xe/xe_hw_error.h                  |  15 +
  drivers/gpu/drm/xe/xe_hwmon.c                     |   8 +-
  drivers/gpu/drm/xe/xe_i2c.c                       |  18 +-
  drivers/gpu/drm/xe/xe_i2c.h                       |   2 +
  drivers/gpu/drm/xe/xe_irq.c                       |   4 +
  drivers/gpu/drm/xe/xe_lmtt.c                      |  21 +-
  drivers/gpu/drm/xe/xe_lrc.c                       | 174 ++++++-
  drivers/gpu/drm/xe/xe_lrc.h                       |   9 +
  drivers/gpu/drm/xe/xe_migrate.c                   | 424 +++++++++++----
  drivers/gpu/drm/xe/xe_migrate.h                   |  29 +-
  drivers/gpu/drm/xe/xe_mmio.c                      |  33 --
  drivers/gpu/drm/xe/xe_mmio_gem.c                  | 226 ++++++++
  drivers/gpu/drm/xe/xe_mmio_gem.h                  |  20 +
  drivers/gpu/drm/xe/xe_module.c                    |  29 +-
  drivers/gpu/drm/xe/xe_nvm.c                       |   8 +-
  drivers/gpu/drm/xe/xe_oa.c                        |   8 +-
  drivers/gpu/drm/xe/xe_pci.c                       |  76 ++-
  drivers/gpu/drm/xe/xe_pci_types.h                 |   2 +-
  drivers/gpu/drm/xe/xe_pm.c                        |  23 +-
  drivers/gpu/drm/xe/xe_psmi.c                      | 306 +++++++++++
  drivers/gpu/drm/xe/xe_psmi.h                      |  14 +
  drivers/gpu/drm/xe/xe_pt.c                        | 238 +++++----
  drivers/gpu/drm/xe/xe_pt_types.h                  |   3 +-
  drivers/gpu/drm/xe/xe_pxp_submit.c                |   2 +-
  drivers/gpu/drm/xe/xe_query.c                     |  13 +-
  drivers/gpu/drm/xe/xe_res_cursor.h                |  10 +-
  drivers/gpu/drm/xe/xe_ring_ops.c                  |  22 +-
  drivers/gpu/drm/xe/xe_rtp.c                       |   7 +
  drivers/gpu/drm/xe/xe_rtp.h                       |   3 +
  drivers/gpu/drm/xe/xe_sa.c                        |   1 -
  drivers/gpu/drm/xe/xe_sa.h                        |  15 +-
  drivers/gpu/drm/xe/xe_sa_types.h                  |   1 -
  drivers/gpu/drm/xe/xe_sriov.c                     |  19 +
  drivers/gpu/drm/xe/xe_sriov.h                     |   1 +
  drivers/gpu/drm/xe/xe_sriov_vf.c                  |  78 ++-
  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c              | 377 ++++++++++++++
  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h              |  17 +
  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h        |  53 ++
  drivers/gpu/drm/xe/xe_sriov_vf_types.h            |   6 +
  drivers/gpu/drm/xe/xe_survivability_mode.c        | 169 ++++--
  drivers/gpu/drm/xe/xe_survivability_mode.h        |   5 +-
  drivers/gpu/drm/xe/xe_survivability_mode_types.h  |   8 +
  drivers/gpu/drm/xe/xe_svm.c                       | 369 ++++++++++---
  drivers/gpu/drm/xe/xe_svm.h                       |  27 +-
  drivers/gpu/drm/xe/xe_sync.c                      |   2 +-
  drivers/gpu/drm/xe/xe_tile.c                      |  62 ++-
  drivers/gpu/drm/xe/xe_tile.h                      |  14 +-
  drivers/gpu/drm/xe/xe_tlb_inval.c                 | 434 ++++++++++++++++
  drivers/gpu/drm/xe/xe_tlb_inval.h                 |  46 ++
  drivers/gpu/drm/xe/xe_tlb_inval_job.c             | 268 ++++++++++
  drivers/gpu/drm/xe/xe_tlb_inval_job.h             |  33 ++
  drivers/gpu/drm/xe/xe_tlb_inval_types.h           | 130 +++++
  drivers/gpu/drm/xe/xe_trace.h                     |  40 +-
  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c            |  12 +-
  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c              |  22 +-
  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h              |   3 +-
  drivers/gpu/drm/xe/xe_tuning.c                    |   2 +-
  drivers/gpu/drm/xe/xe_vm.c                        | 602 ++++++++++++++++++----
  drivers/gpu/drm/xe/xe_vm.h                        |  31 +-
  drivers/gpu/drm/xe/xe_vm_madvise.c                | 445 ++++++++++++++++
  drivers/gpu/drm/xe/xe_vm_madvise.h                |  15 +
  drivers/gpu/drm/xe/xe_vm_types.h                  |  57 +-
  drivers/gpu/drm/xe/xe_vram.c                      | 211 +++++---
  drivers/gpu/drm/xe/xe_vram.h                      |  11 +
  drivers/gpu/drm/xe/xe_vram_freq.c                 |   4 +-
  drivers/gpu/drm/xe/xe_vram_types.h                |  85 +++
  drivers/gpu/drm/xe/xe_wa.c                        |  25 +-
  drivers/gpu/drm/xe/xe_wa.h                        |   8 +-
  drivers/gpu/drm/xe/xe_wa_oob.rules                |  11 +-
  include/drm/drm_device.h                          |   4 +
  include/drm/drm_gpusvm.h                          |   4 +-
  include/drm/drm_pagemap.h                         |  50 +-
  include/drm/intel/pciids.h                        |   5 +
  include/uapi/drm/xe_drm.h                         | 282 +++++++++-
  154 files changed, 7228 insertions(+), 1877 deletions(-)
  create mode 100644 Documentation/gpu/xe/xe_device.rst
  create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
  delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
  create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.c
  create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.h
  create mode 100644 drivers/gpu/drm/xe/xe_psmi.c
  create mode 100644 drivers/gpu/drm/xe/xe_psmi.h
  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.c
  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval.h
  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.c
  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_job.h
  create mode 100644 drivers/gpu/drm/xe/xe_tlb_inval_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
  create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
