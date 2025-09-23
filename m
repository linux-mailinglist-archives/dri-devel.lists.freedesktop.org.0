Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA0B97C42
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 01:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6A910E667;
	Tue, 23 Sep 2025 23:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zd8jnv0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755110E663;
 Tue, 23 Sep 2025 23:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758668586; x=1790204586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7IBpSh/OTUEDWHZs/hhKy8V8tOIeLqdvSoFKbzrH70k=;
 b=Zd8jnv0DOD5+kMjyVe+5BME3Krwk0TjH21+YqceytIygvETYTvvccwKS
 mzjAStQKqSLkU1IsrtYgkBDCifxmsC5j4/6AYWQGg4n7e/rlL/z9s2rqm
 oVeRysM8YZNQiXbYqIphS7xemqM0My3aUWtkr2tVJNJAVIldSTi+ifhuG
 wL1YDcMdpsMQwgnGkEvXP3qSfp6dQGa2YINZneJByQvoJ86U4tK8uESoQ
 YNr5n3hFGI683KhQdtyM4b+6Rop7KYUe4lrsYIs+pCc7ZPb3GjmJrZzWg
 1kzb8eLCfCxw7jzbIkkUoz6fKEgBTkXUkYlvyi1na4smzplVlUlQtY9v2 Q==;
X-CSE-ConnectionGUID: y7OFm6SCQHeno0kDSJ3ftw==
X-CSE-MsgGUID: OVjAXyXQT3aFmU7nUFHJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60174634"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="60174634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 16:03:05 -0700
X-CSE-ConnectionGUID: IwLCMbbwQEi3mjxzI5/e1g==
X-CSE-MsgGUID: cdp1YH4PQ7adKR2qhlixDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="177323544"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 16:03:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 16:03:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 16:03:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 16:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj0B2zdaqadOVgurc0UzBOHX1igZ4T8/febjk5JfIBvnGjLSyuwlmht5k2v7wUmQTdjN9ahnrwkCKJislmUZRdCTWUn1g8bArf0N//rUoChXHIDTnYfMsLkdX4IsFwdZRX2mXJ7hRSoFnbZL0Knj9zK2sDMHhE0Xu5pM48an8eCmbVfumpSPRRXDJMALTpcWtmzc2di7wC+11mO8+375peOnXeTB2dW/5SLqqSLrukj9szgLz6SQ/fx/JyFjczE42/nkJjppYNNYF5e97KJCYBNEKNH8923gJalAPYCZ62tbOc50sjOnEWYueBxkWPs4WYo39yarLe8SlOE/OC5yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XViuGrmDRtaH3pUv0t6me+iMIDUg7pX897ypyj2YrLI=;
 b=tYgJ2X1rnlzS/KEv+JNqEouSpTqTFhbMA4DipPh/KTzJCB+yB3aM+3s9Z6EypAUqHQrxBmRGxwVAzbCWcaETQUdtWpCX3AFYhNv9UyLPMo1V6nIVxxWUBTEcu7OxBKzpx12VY3Qs56+5jS+AdUTH791pE0vTdKHVPjpGZXm8wcpy635AH231pSJ7nio21BHgstKH8BCZ08D+/JgXgsPtL/9k5NTd7HdeQq4fWzls2NOdCKuF+hyPzuLfC25gS05QS5b+m3p8pNuJbmhnpEqDu+7Of6CSF/QsWzevlNlLL1VCBMsXxQQRkcj4RotHWz4wIYsTAEFNG+HDbsUYX8PwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 23:02:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 23:02:55 +0000
Date: Tue, 23 Sep 2025 16:02:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <aNMnHJwWfFPgGYbW@lstrano-desk.jf.intel.com>
References: <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9e19bd-8afd-4636-ab07-08ddfaf554df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmRJWjNtM011ZENWbW44MWdIZUlUcUxQOXU2eHJNUlRWV1JNSUh3RWk1Ymw1?=
 =?utf-8?B?eEpFWDU2SEdrSlh0ajhoS2xubzMrcVpmeEdYUTJUUE90OGhiNENOQ0NZWFdL?=
 =?utf-8?B?UjhKNnF5UnpuQUdPVXc5a0F6U2hLZ21MY0dmK0FKY241ZkVqMXI1dVlNOEJW?=
 =?utf-8?B?ak5YcFBxSG9vMGUvS0N5SlRScmFJYnVOYVM5RGpkaTl3WnF4bTY2UStEa1JO?=
 =?utf-8?B?UTBkNHpxZU1yRHRaKzhmSDN5WGpKSjZzdHJPZWZkYndLeTRUYnhnbkV0SGNh?=
 =?utf-8?B?R3k2RXZnaS93UnN4OTl3ODBJdjRwWHRRay9qUExDbG5VQmFsTWxpdFZNMnlO?=
 =?utf-8?B?Y3hPV2hrYmswR3FhZi8vWWhyL3ppcXJyd3ZZd3N5djN2QUFmQjlyNXU1UVRv?=
 =?utf-8?B?ZUVZWGZOV0cyNmducXRlaHljaVFhQXVUcHRaTFVlaXp6Kzl6Q2pVRlFkN2Yr?=
 =?utf-8?B?UnJXZGNrV1dwNFcxWm1BbTRNWlM2RHJvNFJ3RXJCbmQrSlF6Y2R6L05TcG5x?=
 =?utf-8?B?UXJSVEZMSUgvRDN5VnZHc05KMFNCWk94RGo3K0R3blYwSGxCNW1iNUxtWDZJ?=
 =?utf-8?B?b2hOa01kVWVQc3VnWFVScnFHb09FSTFyQU9UanlVYytwS2szSjNOcllYdkZh?=
 =?utf-8?B?WHFMYi8wc0llU2ZYakJ1M1dFRy9SRmRhS3M1bkcvRTlWaDJjYXJrN2V1dWY1?=
 =?utf-8?B?QTBxQnU4RjlLdlNQS1Rrd0JoaW0veVFCUUp5dE1CSmNzK3RRNGNRRXE4dTV6?=
 =?utf-8?B?V295TkdZdzk0a3pqZUpYYUh0UzBJSC8wL1FXRGl3MXZsbnMvNFZjQW5RUkRT?=
 =?utf-8?B?M0RWeFNzYUFNOGpkUTJFNmZYSSt4dHpnQWpjNWZQMlh2QkpyYjFjK0F3emw4?=
 =?utf-8?B?Rld3WG53VGJXcmhSNTgzVXRya2tvbXJ6RDRoREc1bGRiMksyNm5QSGlJR2dS?=
 =?utf-8?B?VlZ1dkNtZlRSSFBCRTM1eEtod1ZwWnZ4RXpsY1dJUmIrdmRhV1JMeW9QZFJ6?=
 =?utf-8?B?WHU2NkE0QTI2TStWVTlkU016T2c2VGVCUU9Ya3I1VlVwejUvK2dkS1NJTE1s?=
 =?utf-8?B?UUZ2WUY2dVFOQWFWckFub3grTTgwMFQwdTdhY2l4amJVazFaOWJNbXgwc0kw?=
 =?utf-8?B?ODZVLzJJYkZkSjJiTk9LVUF3c0hTNUFxVkhVRHhkRWw2Sk5qUUZkWmQ5ODJY?=
 =?utf-8?B?R2lLeGlzbmR1Uk8wNk1zYVUvak1FT211QmtlY0RSZkd6Z2RwVFE2amVoZnJB?=
 =?utf-8?B?NUViZkhPUGN4M05UcVNRSkZTbGtBOXdOeFUyOGhZNnJaV0hDZXJ2WklHWXhm?=
 =?utf-8?B?eTh6dkFZNHV3ZkdwS3NwUXJQL1pHb05KRDZJdWF6UU16RlltZ2lFRWtka0VX?=
 =?utf-8?B?K1UxTVlpOVY0WDdIOHAwRjg1U1dLTUxMS2ZVb2hMdFJieW5ia2xMN204Sk5a?=
 =?utf-8?B?MllwWkc2eXFNS2dveXVoeEhGeVl5MjlvaDV3TytNVXloYS81aThreDVsT2hQ?=
 =?utf-8?B?RUJyUVZlL3ZUZUZ3UTV4eXJYVWRNWm5vRnZreWZzaGMyY3BxU2xFOHNSdURv?=
 =?utf-8?B?a0M5NjA3eVNlbzlOQmhXa3hYRkpnc1prODJ0UEtLNHJjeDJlS2puRnE5V3g2?=
 =?utf-8?B?ZStuYWdDK1E3TkZmZkZZZjB5RmhDVnJPRk9FenMvMFNuY1ByOFZYTUlWOTgv?=
 =?utf-8?B?N2lCU1MrNUFQRFYyTXNNNmVkUmNWaE1PcGFuTzZLdW5ablJKNi9vWjdhUGJi?=
 =?utf-8?B?aUZJN2ZYVnRRbnM2UHlJVHJxajB3S0lCQm0zSHZTeDMxb2RRQ2FWay9BdXdZ?=
 =?utf-8?B?czFwaHpiREY3TkVkMUVPN1hOTE9rUVo4ZEZUd3BWR0F6c2ovY2NBWG5ianVO?=
 =?utf-8?B?dUFuejJQMVBWK25hU1RSSSt0ekQwbjVwM2NlRnNUaVozeHFtWjJ1WDUwWG1K?=
 =?utf-8?Q?ZMkmwQuNoD8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzRIeDZPQ0FXWDU2dE1mU0g3aUxPYjRtZXNnREVRYUdyV2FscmM3eEFzd2I2?=
 =?utf-8?B?RHdkNVVDVUR2TlNVdEt5WUxYVGlIRGNHZFdNa3M0d2xJQXpidEZyTFdNWTN1?=
 =?utf-8?B?dXE0c0xpVlc3K0RnbW90eTk4aW9Pd0hlNlQ4MlpYUDRmUGNRVHhVeHFSY3Fn?=
 =?utf-8?B?VFByN0tNTFJTL2VoRzdESm5HRWFVY0ZKR1lGNzV3djk2RVNRRk5nQmZ6QTgw?=
 =?utf-8?B?ZmpQdFNoMWlLRktlRWFsd2dhOUR4RjFreDl6WFhwRjg5RjhOaUt2YjNEcExm?=
 =?utf-8?B?VmNZRmhvYVNndWx0M3lJcXJmbFhSa2dWSEkrSy9JWTNsS0hRTDZ4RlByMGdG?=
 =?utf-8?B?ZVlUelNSVnU5WTV1WDBQYytVQy8vNlBHSWp5VEtZOHpRS1g2SjNkUW1Eb2Zu?=
 =?utf-8?B?MnZyMllFdElOUjdDcUJkNllTNXJoZWxvUHZ2cys0YVVMOXFVbUtpS0dQRElY?=
 =?utf-8?B?MndkMUx2MFp0a1BmOVFxaUpuTmlxNkx0S09qVkI3NTR3aURIMTZrNHRHY2Jl?=
 =?utf-8?B?ZFlSZDBHYWdKWm9VZjFwMTRTMzFoczlaV0FOZFgyRDNuUkFqb2N3RDlhT2d6?=
 =?utf-8?B?K1VheGdwUkhZcGpjcVU0bytjSnZ5MFBybFF6QktHZWZ6UUN4N1pjVzU0RVQ5?=
 =?utf-8?B?QllUN2VjMUw1dndJMTBxckJwZ05iU3UySi9UVC91WCs3MnlCbWtFWE5JaGZI?=
 =?utf-8?B?bXZUUGN6aFJuREVQeWp5MmFnVy9meGt1Q0pkb2tRUDBKRXV1UnRua2c3aFlY?=
 =?utf-8?B?N0RaeTRHMXMwWm96ejkzaUIzUEJzeDIxbGc2UzZKSnNYdHJIMjhmSXdnZlF1?=
 =?utf-8?B?VVh2bWdCWHk3LzEzMlE1ODZUZ09Vdy85aTRBaEVNTGFYbTc2bUdmb2JobkZB?=
 =?utf-8?B?OW00UkxWb2FsV3VFK3MvS0FXaG9ldnBkQ3FucXRLdVNsS1JNS2NaUGhnSXk3?=
 =?utf-8?B?MXVHczl1VUFWTmFPRlZrWnJ6OU9GUC9jZmdtbzhFOUV0VmpRbDhTaHlqL3lw?=
 =?utf-8?B?TVpQTUs4SHF1TzF2TGZFL1YxWnhCT2JzNXZtS2RjOEtCaHUzTS8vSVMxaEs1?=
 =?utf-8?B?M3E4aGoyRktZSTNtVmh3VzNwVjJqQ0kxc1NzQU1ZcnZUV2hYTER1QXQwR1Ri?=
 =?utf-8?B?dHp1WGdyVDhwYjJzNDF4WVRrSEUreUtzWWEzNUdYbHV2VWV0Q2lrWEFtSG5E?=
 =?utf-8?B?WWZ0dEN4emdrMCtpYzZ0V2g5bnYxYUs4Z1NHVy9XQzU0MElPUm9lSVhzdHhS?=
 =?utf-8?B?M25DQ0tyeVBmTW5maUR1N0FKenpvZldLSDdHc096bS9XRnEwZkZFenIvUkZz?=
 =?utf-8?B?WVZNcGExbkk5akZtVTNFOWpIVjVLQkw4V3hoNFpMaXA4ZHBocmJyVDg3SE9O?=
 =?utf-8?B?eXJOOWxTYWxlK0FJaUZTZGl2VVVoVVlPaHNqaDZTamNLRlVoN3BvTUdEMW1U?=
 =?utf-8?B?YkNlYkh5MVRwL3FFQVNPdGhHM2I3WnpnL3lHTkhHNmhpOTR0MFB4akhIaHdD?=
 =?utf-8?B?RXZ1L3BsR3BwenU4VTJDVnAyWUFqTS9hbGxyZm8zRmZpUGpBU0MwekZicGRn?=
 =?utf-8?B?RFFJcWduaFZ4WGlXdytPM0lGOUh2aWIzTWt6cWtWcDlzQzE3bHZjTlJ2OTNF?=
 =?utf-8?B?cGFRdzh6NXhQRUxncjB5KzIxakVHbGR6RE5haUljWFhBejYxbTZjOTZaSVJH?=
 =?utf-8?B?Q28yZzhLTmp3WENIdGFLQTV3QkhZOTVmOW8rRHI1SjJPVEtwVWFPTHZyYXBU?=
 =?utf-8?B?WHBJL21LZXBkTkdJTm9QWTNLeTltb08yMDBPNFNsT2JlcVcwQ20yQmRCY0hV?=
 =?utf-8?B?TXhUL2crbWFadEhTcER1VHFnMkpzQVdJQkJtWHVyVnF2MGZNS0RuWXVTN0dH?=
 =?utf-8?B?MU1oVnoxdHV5T0p6S01DTExXNXVNaUxmYnBwNDF4Q2xVQlRQbnVEQ2JBRDRK?=
 =?utf-8?B?K3lxZFpRUStTZVBGQ3pvd3lJaFBYRGJ2WFlNRUxzUWZiWm5hY2xLM2l4UnU4?=
 =?utf-8?B?UE40VTNGcEorbkxEbXg5Ym40TlNVdDZUaURTWDdNTEVBRXNOUlJPL2tnbmM1?=
 =?utf-8?B?UGY2UTRrR3ovR3pvNUtrTldjOEZtajlMQWNiOE9CMHdLc25RMFBvd2U0WDlt?=
 =?utf-8?B?c08xbElTMTEvR3RSb3NZMXJRamViMnJJNlFYbnJleVlZL1JPYVVEbzBzN1Bl?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9e19bd-8afd-4636-ab07-08ddfaf554df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 23:02:55.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7k8XRBVaLm3+XVdf4ISVHoUh8R9mDErcRQo2ao0BLP1szcpJO9IwaRa3j5ktFb1vnNnUXMiDFWN7knTOf8pfkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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

On Tue, Sep 23, 2025 at 03:48:59PM +0200, Christian König wrote:
> On 23.09.25 15:38, Jason Gunthorpe wrote:
> > On Tue, Sep 23, 2025 at 03:28:53PM +0200, Christian König wrote:
> >> On 23.09.25 15:12, Jason Gunthorpe wrote:
> >>>> When you want to communicate addresses in a device specific address
> >>>> space you need a device specific type for that and not abuse
> >>>> phys_addr_t.
> >>>
> >>> I'm not talking about abusing phys_addr_t, I'm talking about putting a
> >>> legitimate CPU address in there.
> >>>
> >>> You can argue it is hack in Xe to reverse engineer the VRAM offset
> >>> from a CPU physical, and I would be sympathetic, but it does allow
> >>> VFIO to be general not specialized to Xe.
> >>
> >> No, exactly that doesn't work for all use cases. That's why I'm
> >> pushing back so hard on using phys_addr_t or CPU addresses.
> >>
> >> See the CPU address is only valid temporary because the VF BAR is
> >> only a window into the device memory.
> > 
> > I know, generally yes.
> > 
> > But there should be no way that a VFIO VF driver in the hypervisor
> > knows what is currently mapped to the VF's BAR. The only way I can
> > make sense of what Xe is doing here is if the VF BAR is a static
> > aperture of the VRAM..
> > 
> > Would be nice to know the details.
> 
> Yeah, that's why i asked how VFIO gets the information which parts of the it's BAR should be part of the DMA-buf?
> 

Vivek can confirm for sure, but I believe the VF knows the size of its
VRAM space and simply wants to pass along the offset and allocation
order within that space. The PF knows where the VF's VRAM is located in
the BAR, and the combination of the VF base offset and the individual
allocation offset is what gets programmed into the PF page tables.

> That would be really interesting to know.
> 
> Regards,
> Christian.
> 
> >  
> >> What Simona agreed on is exactly what I proposed as well, that you
> >> get a private interface for exactly that use case.

Do you have a link to the conversation with Simona? I'd lean towards a
kernel-wide generic interface if possible.

Regarding phys_addr_t vs. dma_addr_t, I don't have a strong opinion. But
what about using an array of unsigned long with the order encoded
similarly to HMM PFNs? Drivers can interpret the address portion of the
data based on their individual use cases.

Also, to make this complete—do you think we'd need to teach TTM to
understand this new type of dma-buf, like we do for SG list dma-bufs? It
would seem a bit pointless if we just had to convert this new dma-buf
back into an SG list to pass it along to TTM.

The scope of this seems considerably larger than the original series. It
would be good for all stakeholders to reach an agreement so Vivek can
move forward.

Matt

> > 
> > A "private" interface to exchange phys_addr_t between at least
> > VFIO/KVM/iommufd - sure no complaint with that.
> > 
> > Jason
> 
