Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88CB2DD2F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6D610E72B;
	Wed, 20 Aug 2025 13:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSo8WxpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C2E10E729;
 Wed, 20 Aug 2025 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755694913; x=1787230913;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7+u26PQlRThmngQWvRil7JaJES6gmagSFZgUNaadxIA=;
 b=dSo8WxpFvl15prxMPFEmdTKMIQWSEOehj+khncVktGQpnIa4j36w/Ec1
 ojqtxGFbQNVARYKAbUGZrqEkiFmgjFkZibhgImqsAPaf0qnxqG+qoQEFQ
 A4jPSO2E2P7B3romhYUaPdFi2LVDQ6Y9TI0LS9W4U17eWmCjTsirSQ/83
 +qgrqXtwZpjN/4MuiGS6T1esMsbkPbJ5VTqzm/k+N0ywmimX1bjU/ufOp
 I0QAATg+bn8u3BrQpidSWPbfMkcuqydyYaGAXIbLv85Zpo77AStmoOwoA
 0gHVFe/nT9knGl9veJz7v2sz3/7ba8DyLeOOLM85YdqIGr6n9umi3j3AM w==;
X-CSE-ConnectionGUID: ZxkOLjiVRn+t43BZ2+YdqQ==
X-CSE-MsgGUID: dX2mpDNQSWSAR6bL6IUYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68230152"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68230152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:01:52 -0700
X-CSE-ConnectionGUID: f8Z+4eaiR2KYMTvLVTRQZA==
X-CSE-MsgGUID: VpwYfMSpQ8KMBenycld+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167629574"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:01:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 06:01:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 06:01:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 06:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u//LTdBqsbaR334KZkgB1smfPop1/ku01KkwSEy9vAy3L8hJY034Df47aJ9inhfmzTx3ym85pqsX8wjhboNlsPFM7SowuD7wR236dymNBreHwxXIS7hmHUBseW0DBa53bpUwuYEnAeo/b5QFEO/VMoyBdBIgYJNrDVKh3QQ4yW69LdtefEtqT9Ps8BhAraRznJFnaOZmMgj/fEKNYLx+3yUv2NNVZUV9Fw59Jv0CF5HmvelpIRNZbiIyNakQNca4ci8/7qS3VytnjKGcQYkZ3Dc1wc6mxBQuOLWopPjfzJSAj6IjFTT0Iu55IMwSzS5YFcqUID1//2IwKrtzhlvhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP/KJ35FMh92uUlEkFUuxlTmlDRIIgAvV1tfQ266EvQ=;
 b=URJyfBEPL0i673ypvYgbZZeCGoTLvgjZplGylpSns+FQ2hYOd1LGBoYy6Q4Pe0/Yy5+GeNEUuJ6f0XNMxJGsctgvnL9XG7wuIPw/WiK8tUa7g1bsdAAe91QaeIAOa9uxtHlFLa10YvO6ThUnUTi/x5jARU+e9p+mbVLYfIz+tCkOg1JuRIyZ9E4oMmETmbaitqRMnM7wALnHUgX50vsCN9yc6NcoZMzV5Pmlr+ZCPpaN6iCkLvOgSWcjtuoRhCfCfjDBPBzoxxU/sJ9W07phFnzuQ/YHZT5Vxw9BPucqB8SJEo6QzK1SWpf06+H2TkUeS8KKTypyCE9Zq3CxqzvM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY5PR11MB6306.namprd11.prod.outlook.com
 (2603:10b6:930:22::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 13:01:44 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 13:01:44 +0000
Message-ID: <6b864fa5-2cf6-4eab-9b8d-67391b784b14@intel.com>
Date: Wed, 20 Aug 2025 18:31:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/24] drm/gpuvm: Pass map arguments through a struct
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Danilo Krummrich <dakr@kernel.org>, Brendan King <Brendan.King@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
 <20250818215753.2762426-2-himal.prasad.ghimiray@intel.com>
 <20250820135657.19a6bcbc@fedora>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820135657.19a6bcbc@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY5PR11MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf08d61-50aa-4e28-b9cc-08dddfe9b657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHJOeFJpWndsenZqMnJuZk5TTUFPTXFxa1U1YjBQekx4VTRLU3VOeDhxTnVP?=
 =?utf-8?B?UTBwakRwUW1rT25JRjVxb1VxN3l4MG1EaTNlQ0dzWVRCRXFndng2blhPOFRk?=
 =?utf-8?B?TDl6NXlGa01Bakh1RE5DUHJxVFh5enZodEZDYlpXUThxQ2FqVldmQTh4Z3NV?=
 =?utf-8?B?MzEzL29taXZjQ3NpYlhuQnNoUU5aYitOV0I3ZDJBbXpLQno0UG5ta1FXZVpT?=
 =?utf-8?B?YWNaRXlVWVRoand3dXd3UEc5UjlKcVRENkZHSTh0cVZ0Z2doeDJxMDR0b0xS?=
 =?utf-8?B?cC9VZ2p1S2d6Uk10OG9UemtWY3pBdVo3cTNqMnF2L3RwZDc0QXlkN2ZmSmFL?=
 =?utf-8?B?QzBsSHNlK3l0Q1F6aVNrei95ZWFvTFpyNk9PL2NlYmlsbG1WT21LYURWbGVi?=
 =?utf-8?B?azd0TTNnbmpHeVFOcHIrT1BSNE5pWFUwbERCSXlkaHh2dk1ZTUFncnhSUWlV?=
 =?utf-8?B?QVZ1bHhuTS94c2J0N2p5V29FdTN2R1psUy9oclVBc0ExUW9TSmx5UkxXaUhU?=
 =?utf-8?B?MVB6aG85dUxtZGRyMlZKVTM0SUtORDBEQnpLaGtoTVRNZGl2ejU0THBvbXlt?=
 =?utf-8?B?ZzhXTmdRTis2bGczb0RVVTNpbjdZb0l6b1R4Q1NqU3gyS2NjNUk1dkdoSWJD?=
 =?utf-8?B?NkpISGNvMjk5dUx2TVdZVU41L3VxZnZjd3NXbHB0cU82b2ZteU5Bb1hNNW96?=
 =?utf-8?B?N1Bhb3BjVTVTY2JzS0krcWE3cGFCRzlLTjJzYTJRQXF6elk1RGluSkVlSC8y?=
 =?utf-8?B?WnVRWWhKcVhscHV1cUx1bVY5cEFOZ0JqSTJaU1pXQmNoYXZtTXFtM2Y2bkZV?=
 =?utf-8?B?NlF0VWl1Z2Nra0ZIR3EvT2xTcnpveCtvZU1OdXY1SGw0Nno1eUZOMjRNQ3pw?=
 =?utf-8?B?bkFQcHB1SE12WDZUdERsN2NZLzhqREdWWk56cGVIend2Si9qaXNxL2dTYXdS?=
 =?utf-8?B?NzFsOW5CKzRxRDlWbUZnN0xXbGhhT3VpQS90SmNFaUlXakdHT2dwQ1phU3JD?=
 =?utf-8?B?NFppdXpmLzVDbGtNYU9PZzZGQTBNR0hiOEdYUGpvL0J6ckJ3QzUrSFJPR0dm?=
 =?utf-8?B?ZFlhblpUcUhTL2ZxRmVsL0VCdlpaWEEyQTI4UjhPT2xETkluWFFvWWlPL1BO?=
 =?utf-8?B?dGxrUjE4cDJWdWlXKzBOVjhjVDBGNkxqNHd2NGVLTTRqT1ZEOTRVV2I4STlL?=
 =?utf-8?B?MjAzNkFWQ2kxVS8vNE5jR05WZ2hzQTk1K00zN3BGdUU4QjEwdzNKMjU3SXlS?=
 =?utf-8?B?VmtORjFaVENDOWt6elJ2aW5WZ01qU0dWZUFvYmZpd2JuUGxXZFcrN3ZocFFh?=
 =?utf-8?B?OEtUcHBDaXlxbno4M0pYUzRndW1mMG9ENDBkNmtGNDdLVkF5VTZJSHo0M3Q3?=
 =?utf-8?B?dW5Ka0RkYnR3clZ2NlRkM05tdmR2amJjaUhhN0dWSjYwYVF1MVlrK2xoWmFU?=
 =?utf-8?B?NXNROEZpeURQbDdLM3hkazBSSHZJVDZIOUszZ29EaStoTUxnbzBMMDNwanlr?=
 =?utf-8?B?eWxURVJ3TmVlR242SzN6UzhsbS9iQk1tanhJQjNjK1hwOFdES3NKNDJSeXFO?=
 =?utf-8?B?TzE4R29jSmtLY05hOFpPQUxyczFwT3dvYnlJNjM0ay94MWVNSVEzazd4Y3lB?=
 =?utf-8?B?VFl5TTlEU2lNRVVHOXZLUEVWWk15UjlNdFRuWVVzSUM2NjUxa2lLMDg0eXA0?=
 =?utf-8?B?T0x5Z0xyeGp4TGxWQ0luNS91N2VRMU80bEVoRjFZU3dKamw5R2tSdkg5Unhw?=
 =?utf-8?B?ZmpzaTMrQXFDSjhtOHlKMHZ1NHpyS0ZnSHZkK3Mza0dXNVdsMlRjc3I4QkhD?=
 =?utf-8?B?YmlTbi96dEMwbjBWY1o2aGgzTzlYY2MyMm9Ca2QwVnNCTkFpUXNObWl4djdY?=
 =?utf-8?B?d2VGMk9lRklZRmJ0MVZybEkvQXY1S1V2R2Mzci9MZUZzNVBpWkxNdWhTV0xr?=
 =?utf-8?Q?h4CXmEsNqW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xHRVY1Y2ZoZTlxMjhOeXEzbzFRQngxQWZPQTQvL3N2ZVBIakFSQk92UWNt?=
 =?utf-8?B?U0ptVTNDK1EvdkxicFlkNkFzWldRdTJqTmNFSmtBWGp2dGF3THVWRkkraFMz?=
 =?utf-8?B?WVBqUDFocEVoWUlnTEpJbVhqbFVRcXZTZFE4aEp3dll1RXNiSzJ6VzZjczV4?=
 =?utf-8?B?TisvWjhRTWJRS2RFYjlucmRQdDRUS055ZUQ0bm01QUFYNmVXdC9OWmNVNkc5?=
 =?utf-8?B?U1J2eWJvekNhVGtNcjRWVy8zUE9zaGhRRFR1anNlRG9FaEoxakQ5Qit0R1dU?=
 =?utf-8?B?UllyQzY3aWpwR0MrOGk2WmdzMkN0SXJYT3VsckdHbTFsSzhpdU1wSnRHZlVS?=
 =?utf-8?B?aGJJelFtTmdkL1NJbXNOa1d6VVU2N2JEYllJT1NNaHh3clJaQi9pM1B5MUxn?=
 =?utf-8?B?QXpEZ1hKK3Zmdzl1a25yRkdHU3Z0WFhYRzFlZDY1UkliR2xUOTVKR0dobkVK?=
 =?utf-8?B?QTBuQWZnTjl4Y1lGS2Y4TkZqK05GZjE1SkxZTUN3NnV0YkJUYWVuM2NNUllZ?=
 =?utf-8?B?c2laRTlnNTNjR2xuR1NIbkVkS2p5U0d4MFBFQ2pQaFFLQXgvYkhnVnpTbGli?=
 =?utf-8?B?dGJtMUhYMzBUL3BqK2N2eEVRZlJWNnZEOGN2bTQyU0dyakxNQVdSTWoySllF?=
 =?utf-8?B?clhLczNxQ1VvZW9HOGV5L0ozSDZpZHdWSW5CRkxlWURvSWY4YmdwakpEMzg3?=
 =?utf-8?B?cGtnVndPUm5HK1RXSk51V2p4NmhQMFg0VGhEeWJ5UGNCUk1yK3RReXg3MDJ1?=
 =?utf-8?B?L3I5bXlpb0ZQaDdEZ1dCTE9LS2V3b2xSZXFJaUJ5QzQwa1hya0lybFc2WVJY?=
 =?utf-8?B?TEtGMnRSMlcrbjY0WGc5NFkrU1J2ZWl5QS8vajRoWDg3c1NZZ1J3RkExM01l?=
 =?utf-8?B?SDQxZ2lXcjlTeStTNzNEYVBadWpkY0xpZk1mUEZWdUhxTm0rZEZLQytTWTB4?=
 =?utf-8?B?RE5meTRBNFkrNmxmVy9XTkJBcmdHS1NGYklnWXE5eXQ5clUyZnZlcTNTem5m?=
 =?utf-8?B?RkdBSkNLUWFydmVyRm9qVzZPWk14RW0valVQLzUxSkxuTktvdzFiOS80SXZu?=
 =?utf-8?B?Nmk5S1l4WDYxWnBHMUQySDUxeW02cUtkemd4em85dWdscTZlYmFVYURrTEsr?=
 =?utf-8?B?b0RVTlA5aW5nSXBwdmszUzl0M01tZFhieEVDaER4QnZtR0tqZmEvcTNVem9s?=
 =?utf-8?B?QjdGRllKK0c3QWc5V3VTTEZ1dmpKWmdUcTlVWHJlbnJFV2hTZjlRdzN4OGkz?=
 =?utf-8?B?TjYrcnBjdnl1eXllSDhsN2x3aVIvdVFyejBHaFl5aGlsRFYva0Q0dEtpd0wr?=
 =?utf-8?B?Sko3dDEzamNYSmdIMWt4VjlCbm5melJCQTZ0Uk1IUjhqRjhkY0VFQ29FUjhq?=
 =?utf-8?B?cWdPeDB4N1VOKzNzaStuNXhUUWM2QVBCYkpzRkxjQ0J5WDZsd1FSRTZIaUR6?=
 =?utf-8?B?Mzh2V3lzZFo5ZFBSZWNjMWtCNWU5akx1QUxRU1ZDNEd6N0E1U2t6OTYxZ1lD?=
 =?utf-8?B?RytzWndOUG5zVlZJdG1UTy9ya3ZNRzF2cTZjaG5zOGVrOUhZRWxxc3RhdEdj?=
 =?utf-8?B?aEZGRkdKMFAvN2hsS0RtWnNGZ3dQVzJaR1FZVCtYMlBCalZFaWxaQ0krSWJV?=
 =?utf-8?B?TzJ0aVRjbnlhdXdMOVlMZ2cxV2Y4WDJnd0hSWDIzVUYzaTMrbnUzbGYycVh6?=
 =?utf-8?B?WUVtQnRabkZBV3BxQTN4NUJqUnQ0TEJwWEwxZ3Q1M2JseDhPWnJ4aVBFdHN3?=
 =?utf-8?B?bDZUMVZ2RDZjZGZIRkp3ZmFjZTE5ZTNvNi9Ua01hanQyazdITWNnUnZLd2s0?=
 =?utf-8?B?OHlKRFhCbXkxbzBEckJHaXlra0xsYWFzQllTRU1aYzFsNXliU3hGdDRxTm1k?=
 =?utf-8?B?b2MxTVJuNTBFMFZSRXRCaDF5dkdYdGdXa2tOMVBnaWJKNXM0em9lbGpmSTZv?=
 =?utf-8?B?cTlmb0xHT3dyQWJISDNGcEdQYmM0MTVoajAzWXAzSitXMUNvT2MvZ0JKRWpm?=
 =?utf-8?B?YUFrbTVXRWRhRkpSM3dmMy9iSlEzODVqR3hReUlCOTROSitjUUN3QUE3VnYx?=
 =?utf-8?B?ZC94ajN0VUZob0pNTTRDNE1FZkxEUDUybHRabW50bHV3ZllFRkRzRkhVSHZ5?=
 =?utf-8?B?WHNNSE5GUmlWS3RCeHlGaTQrR0FWN1ovNGg1MjVPWGlHMkk4ZnR1eXAvVy8y?=
 =?utf-8?Q?NIpNar+8h/uMCkuc/y80htw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf08d61-50aa-4e28-b9cc-08dddfe9b657
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:01:44.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcRWdtOAMopweBxvTMMxFZsfA/zhmS/tmPA3/K+Ht5B8JtH429lKe0EosqT3rWEFs4oGMfjMdTwIvGfxXjJta/0yjDsGA57OWlL/LpRYU7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
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



On 20-08-2025 17:26, Boris Brezillon wrote:
> On Tue, 19 Aug 2025 03:27:30 +0530
> Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> 
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
>> so, before we do that, let's pass arguments through a struct instead
>> of changing each call site every time a new optional argument is added.
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Brendan King <Brendan.King@imgtec.com>
>> Cc: Matt Coster <matt.coster@imgtec.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 74 +++++++++++---------------
>>   drivers/gpu/drm/imagination/pvr_vm.c   | 15 ++++--
>>   drivers/gpu/drm/msm/msm_gem_vma.c      | 27 +++++++---
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 11 ++--
>>   drivers/gpu/drm/panthor/panthor_mmu.c  | 13 +++--
>>   drivers/gpu/drm/xe/xe_vm.c             | 13 +++--
>>   include/drm/drm_gpuvm.h                | 20 ++++---
>>   7 files changed, 102 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index 74d949995a72..c0e6f9310514 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -486,13 +486,18 @@
>>    *				  u64 addr, u64 range,
>>    *				  struct drm_gem_object *obj, u64 offset)
>>    *	{
>> + *		struct drm_gpuvm_map_req map_req = {
>> + *		        .map.va.addr = addr,
>> + *	                .map.va.range = range,
>> + *	                .map.gem.obj = obj,
>> + *	                .map.gem.offset = offset,
>> + *	           };
> 
> Nit: indentation is messed up here.

will address.

> 
>>    *		struct drm_gpuva_ops *ops;
>>    *		struct drm_gpuva_op *op
>>    *		struct drm_gpuvm_bo *vm_bo;
>>    *
>>    *		driver_lock_va_space();
>> - *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
>> - *						  obj, offset);
>> + *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
>>    *		if (IS_ERR(ops))
>>    *			return PTR_ERR(ops);
>>    *
>> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>>   
>>   static int
>>   op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
>> -	  u64 addr, u64 range,
>> -	  struct drm_gem_object *obj, u64 offset)
>> +	  const struct drm_gpuvm_map_req *req)
>>   {
>>   	struct drm_gpuva_op op = {};
>>   
>>   	op.op = DRM_GPUVA_OP_MAP;
>> -	op.map.va.addr = addr;
>> -	op.map.va.range = range;
>> -	op.map.gem.obj = obj;
>> -	op.map.gem.offset = offset;
>> +	op.map.va.addr = req->map.va.addr;
>> +	op.map.va.range = req->map.va.range;
>> +	op.map.gem.obj = req->map.gem.obj;
>> +	op.map.gem.offset = req->map.gem.offset;
>>   
>>   	return fn->sm_step_map(&op, priv);
>>   }
>> @@ -2102,10 +2106,14 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>>   static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>> -		   u64 req_addr, u64 req_range,
>> -		   struct drm_gem_object *req_obj, u64 req_offset)
>> +		   const struct drm_gpuvm_map_req *req)
>>   {
>> +	struct drm_gem_object *req_obj = req->map.gem.obj;
>>   	struct drm_gpuva *va, *next;
>> +
>> +	u64 req_offset = req->map.gem.offset;
>> +	u64 req_range = req->map.va.range;
>> +	u64 req_addr = req->map.va.addr;
>>   	u64 req_end = req_addr + req_range;
>>   	int ret;
>>   
>> @@ -2236,9 +2244,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		}
>>   	}
>>   
>> -	return op_map_cb(ops, priv,
>> -			 req_addr, req_range,
>> -			 req_obj, req_offset);
>> +	return op_map_cb(ops, priv, req);
>>   }
>>   
>>   static int
>> @@ -2303,10 +2309,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>>    * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>    * @priv: pointer to a driver private data structure
>> - * @req_addr: the start address of the new mapping
>> - * @req_range: the range of the new mapping
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @req: ptr to struct drm_gpuvm_map_req
>>    *
>>    * This function iterates the given range of the GPU VA space. It utilizes the
>>    * &drm_gpuvm_ops to call back into the driver providing the split and merge
>> @@ -2333,8 +2336,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>>    */
>>   int
>>   drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>> -		 u64 req_addr, u64 req_range,
>> -		 struct drm_gem_object *req_obj, u64 req_offset)
>> +		 const struct drm_gpuvm_map_req *req)
>>   {
>>   	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>   
>> @@ -2343,9 +2345,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>>   		       ops->sm_step_unmap)))
>>   		return -EINVAL;
>>   
>> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
>> -				  req_addr, req_range,
>> -				  req_obj, req_offset);
>> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>>   
>> @@ -2421,10 +2421,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>>    * @exec: the &drm_exec locking context
>>    * @num_fences: for newly mapped objects, the # of fences to reserve
>> - * @req_addr: the start address of the range to unmap
>> - * @req_range: the range of the mappings to unmap
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @req: ptr to drm_gpuvm_map_req struct
>>    *
>>    * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
>>    * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
>> @@ -2447,9 +2444,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>>    *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
>>    *                    break;
>>    *                case DRIVER_OP_MAP:
>> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
>> - *                                                     op->addr, op->range,
>> - *                                                     obj, op->obj_offset);
>> + *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, &req);
>>    *                    break;
>>    *                }
>>    *
>> @@ -2480,18 +2475,17 @@ static const struct drm_gpuvm_ops lock_ops = {
>>   int
>>   drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>>   			   struct drm_exec *exec, unsigned int num_fences,
>> -			   u64 req_addr, u64 req_range,
>> -			   struct drm_gem_object *req_obj, u64 req_offset)
>> +			   struct drm_gpuvm_map_req *req)
>>   {
>> +	struct drm_gem_object *req_obj = req->map.gem.obj;
>> +
>>   	if (req_obj) {
>>   		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
>>   		if (ret)
>>   			return ret;
>>   	}
>>   
>> -	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
>> -				  req_addr, req_range,
>> -				  req_obj, req_offset);
>> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
>>   
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
>> @@ -2613,10 +2607,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>   /**
>>    * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
>>    * @gpuvm: the &drm_gpuvm representing the GPU VA space
>> - * @req_addr: the start address of the new mapping
>> - * @req_range: the range of the new mapping
>> - * @req_obj: the &drm_gem_object to map
>> - * @req_offset: the offset within the &drm_gem_object
>> + * @req: map request arguments
>>    *
>>    * This function creates a list of operations to perform splitting and merging
>>    * of existent mapping(s) with the newly requested one.
>> @@ -2644,8 +2635,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>>    */
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>> -			    u64 req_addr, u64 req_range,
>> -			    struct drm_gem_object *req_obj, u64 req_offset)
>> +			    const struct drm_gpuvm_map_req *req)
>>   {
>>   	struct drm_gpuva_ops *ops;
>>   	struct {
>> @@ -2663,9 +2653,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>>   	args.vm = gpuvm;
>>   	args.ops = ops;
>>   
>> -	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
>> -				 req_addr, req_range,
>> -				 req_obj, req_offset);
>> +	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>>   	if (ret)
>>   		goto err_free_ops;
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
>> index 2896fa7501b1..3d97990170bf 100644
>> --- a/drivers/gpu/drm/imagination/pvr_vm.c
>> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
>> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>>   static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>>   {
>>   	switch (bind_op->type) {
>> -	case PVR_VM_BIND_TYPE_MAP:
>> +	case PVR_VM_BIND_TYPE_MAP: {
>> +		const struct drm_gpuvm_map_req map_req = {
>> +			.map.va.addr = bind_op->device_addr,
>> +			.map.va.range = bind_op->size,
>> +			.map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
>> +			.map.gem.offset = bind_op->offset,
>> +		};
>> +
>>   		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
>> -					bind_op, bind_op->device_addr,
>> -					bind_op->size,
>> -					gem_from_pvr_gem(bind_op->pvr_obj),
>> -					bind_op->offset);
>> +					bind_op, &map_req);
>> +	}
>>   
>>   	case PVR_VM_BIND_TYPE_UNMAP:
>>   		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
>> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
>> index 3cd8562a5109..792b35433666 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
>> @@ -1171,11 +1171,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
>>   							      op->obj_offset);
>>   				break;
>>   			case MSM_VM_BIND_OP_MAP:
>> -			case MSM_VM_BIND_OP_MAP_NULL:
>> -				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
>> -							    op->iova, op->range,
>> -							    op->obj, op->obj_offset);
>> +			case MSM_VM_BIND_OP_MAP_NULL: {
>> +				struct drm_gpuvm_map_req map_req = {
>> +					.map.va.addr = op->iova,
>> +					.map.va.range = op->range,
>> +					.map.gem.obj = op->obj,
>> +					.map.gem.offset = op->obj_offset,
>> +				};
>> +
>> +				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>>   				break;
>> +			}
>>   			default:
>>   				/*
>>   				 * lookup_op() should have already thrown an error for
>> @@ -1282,10 +1288,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>>   			if (op->flags & MSM_VM_BIND_OP_DUMP)
>>   				arg.flags |= MSM_VMA_DUMP;
>>   			fallthrough;
>> -		case MSM_VM_BIND_OP_MAP_NULL:
>> -			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
>> -					       op->range, op->obj, op->obj_offset);
>> +		case MSM_VM_BIND_OP_MAP_NULL: {
>> +			struct drm_gpuvm_map_req map_req = {
>> +				.map.va.addr = op->iova,
>> +				.map.va.range = op->range,
>> +				.map.gem.obj = op->obj,
>> +				.map.gem.offset = op->obj_offset,
>> +			};
>> +
>> +			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>>   			break;
>> +		}
>>   		default:
>>   			/*
>>   			 * lookup_op() should have already thrown an error for
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> index ddfc46bc1b3e..d94a85509176 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>>   			break;
>>   		case OP_MAP: {
>>   			struct nouveau_uvma_region *reg;
>> +			struct drm_gpuvm_map_req map_req = {
>> +				.map.va.addr = op->va.addr,
>> +				.map.va.range = op->va.range,
>> +				.map.gem.obj = op->gem.obj,
>> +				.map.gem.offset = op->gem.offset,
>> +			};
>>   
>>   			reg = nouveau_uvma_region_find_first(uvmm,
>>   							     op->va.addr,
>> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>>   			}
>>   
>>   			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
>> -							      op->va.addr,
>> -							      op->va.range,
>> -							      op->gem.obj,
>> -							      op->gem.offset);
>> +							      &map_req);
>>   			if (IS_ERR(op->ops)) {
>>   				ret = PTR_ERR(op->ops);
>>   				goto unwind_continue;
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 367c89aca558..2003b91a8409 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -2202,15 +2202,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>>   	mutex_lock(&vm->op_lock);
>>   	vm->op_ctx = op;
>>   	switch (op_type) {
>> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
>> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
>> +		const struct drm_gpuvm_map_req map_req = {
>> +			.map.va.addr = op->va.addr,
>> +			.map.va.range = op->va.range,
>> +			.map.gem.obj = op->map.vm_bo->obj,
>> +			.map.gem.offset = op->map.bo_offset,
>> +		};
>> +
>>   		if (vm->unusable) {
>>   			ret = -EINVAL;
>>   			break;
>>   		}
>>   
>> -		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
>> -				       op->map.vm_bo->obj, op->map.bo_offset);
>> +		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>>   		break;
>> +	}
>>   
>>   	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>>   		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c86337e08a55..f35d69c0b4c6 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2337,10 +2337,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   
>>   	switch (operation) {
>>   	case DRM_XE_VM_BIND_OP_MAP:
>> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>> -		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>> -						  obj, bo_offset_or_userptr);
>> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
>> +		struct drm_gpuvm_map_req map_req = {
>> +			.map.va.addr = addr,
>> +			.map.va.range = range,
>> +			.map.gem.obj = obj,
>> +			.map.gem.offset = bo_offset_or_userptr,
>> +		};
>> +
>> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>>   		break;
>> +	}
>>   	case DRM_XE_VM_BIND_OP_UNMAP:
>>   		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>>   		break;
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index 274532facfd6..a9fa44148e0c 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
>>    */
>>   #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>>   
>> +/**
>> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
>> + */
>> +struct drm_gpuvm_map_req {
>> +	/**
>> +	 * @op_map: struct drm_gpuva_op_map
> 
> Doc name doesn't match the field name.

Will fix it.

> 
>> +	 */
>> +	struct drm_gpuva_op_map map;
> 
> Nit: not convinced map is a good name for that field, given this is a
> map_req, so we now those are map-related arguments. I would probably
> go for 'op'.

Sure.

> 
>> +};
>> +
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>> -			    u64 addr, u64 range,
>> -			    struct drm_gem_object *obj, u64 offset);
>> +			    const struct drm_gpuvm_map_req *req);
>> +
>>   struct drm_gpuva_ops *
>>   drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>>   			      u64 addr, u64 range);
>> @@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
>>   };
>>   
>>   int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>> -		     u64 addr, u64 range,
>> -		     struct drm_gem_object *obj, u64 offset);
>> +		     const struct drm_gpuvm_map_req *req);
>>   
>>   int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>>   		       u64 addr, u64 range);
>>   
>>   int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>>   			  struct drm_exec *exec, unsigned int num_fences,
>> -			  u64 req_addr, u64 req_range,
>> -			  struct drm_gem_object *obj, u64 offset);
>> +			  struct drm_gpuvm_map_req *req);
>>   
>>   int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>>   				 u64 req_addr, u64 req_range);
> 

