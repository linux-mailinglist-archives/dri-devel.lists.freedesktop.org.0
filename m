Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73FA330A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEBC10E291;
	Wed, 12 Feb 2025 20:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXQyaQQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B3310E291;
 Wed, 12 Feb 2025 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739391715; x=1770927715;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lkWR2nhGBz0rCA+x3CupcdqS1lrDdLn4ZYuwqcPZ64Q=;
 b=PXQyaQQ+b+re5yr190U/Xt0ZuqrtKudxXqaUy2mqumGnbZy2jzv/4zk7
 cUx4ihuQXJPRfsJgDgAtqxeKHJ4M7nDRbGlfbhXNY5jiclE1bgggjs0l2
 rPPfAYwdObFspJ8uuLPssZ9PXvUomFtJ7R+RO+lp0pgzR1ksXOb2NZ8iR
 ED2pseJ9RPaLZX/iQ206Fo4b/B8rC1pqT+XntkMGSCz5OszKbAmeptBgT
 czUFzZ5pYAyc1u2kHxsdD2JiUcDHyzixL4d/HnbMJxShLXq0kDJeCPQd1
 7jAxYBWW8QR9JLdfNZ3b5hy4U59E9j6bq1xhp9ak5TAdqdomBg4K8NTWG A==;
X-CSE-ConnectionGUID: jECs9M+yRP+cJWFzc1kryg==
X-CSE-MsgGUID: nqCBLqD4SoOzQbvszPsmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27665382"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="27665382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:21:54 -0800
X-CSE-ConnectionGUID: es3O4XPkTgmTi2FMfEyrVQ==
X-CSE-MsgGUID: LhCEX5rvRwKFeKxQpr5EqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113591012"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 12:21:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 12:21:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 12:21:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 12:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/rw8n+MT7JgDrSrn9DNrb8qKAvyCMMQQkNfooR5l9KTKzj96BAeK38cByiNjZ3ojIlmQOnsrKT87GfIIss/ubDhPx2KnaXvVX4+0GEi16hnipRIbKkhDV3IAr3cnZEuQSK+NCqgY1dohxQYPAmIngN2lEEFAD5SPToWpWh3pBfPhqEXGgsGzSr92G6cibA4hd0mW2+BrLYOTAaBxf6cZsI34EwAe3U/RagAN45Ug0N5YtV3Du8VY37yKhXsW5OIcvP1eUQoednJtJxaw6XAYXIgY1W5Inl2ZKVx1OiLE+D9FEEbxQKfL2mis1cxFYGsiA9mtwEfXvWvTJBBK6dMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkWR2nhGBz0rCA+x3CupcdqS1lrDdLn4ZYuwqcPZ64Q=;
 b=mjD4PwPzvF8uZWj563Psxe6TCP9KpD2t2xElPrrnlDde3RPXN9kIp3Elz90akMGz/S1w83xCmyc+3ouD9gRiUX7Y6cknq/M+csxuG3LE/BGAIotYbmThCbLB3sKPMXgLs9uafGDnQp5r3Ee9+o69dIBtLw0HTuqpE+xUEgq/ZfRdtPBZxxKAqkpFALEodeK7HP0P0oV67NWnNHrfrc9Ycj1yuyrOC3U2dTb2BH6EvObDxFzBtwNTfVN8MLeEFjt+eYhkAuTdJ0A2eTShTNtwO/75ZFEdOX+5JIbL13CAZyfyiY1Jcc/g9Mfpni2blQShoJvyJA0+u0LM6Nxom+swMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 20:21:45 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 20:21:45 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v7 5/7] drm/i915/xe3: avoid calling fbc activate if fbc is
 active
Thread-Topic: [PATCH v7 5/7] drm/i915/xe3: avoid calling fbc activate if fbc
 is active
Thread-Index: AQHbfVAlcBAUtNOmbE+0dugDrytIM7ND/Z8AgAAfNoA=
Date: Wed, 12 Feb 2025 20:21:45 +0000
Message-ID: <a964fc8c2b58725e566f818c0993717bc943cb2f.camel@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
 <20250212131420.60026-6-vinod.govindapillai@intel.com>
 <Z6zoqILXcOM0YKEc@intel.com>
In-Reply-To: <Z6zoqILXcOM0YKEc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CY8PR11MB7083:EE_
x-ms-office365-filtering-correlation-id: 17e41a57-81d3-4f9d-8f84-08dd4ba2ded7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VjhDeld0bEZvR0tqbmJ1QWd4WFpjcDQzczZzTWY3VDBVWStsajd1RFNYVUFi?=
 =?utf-8?B?dDdkMFhoTE5ielRIeGJETmMzVGNTeHZEZVorUVZ6M0IxUmtZV0tJZGZhNVBK?=
 =?utf-8?B?amNUb05McnJhdG12MkkrRi9uRXl4eDRPbmJ1dWhwNFVTUkxkakJZUUFnSkRs?=
 =?utf-8?B?SjZqdkUwMFVDNlNLTkI2a0NLcVlwM2c4TEg0WW5wWTkrdkZMY1RudU9tbU90?=
 =?utf-8?B?QU5LOWE2SE03QnNrSWgwYzU4aEJjVk9XUndvamh0YmsvZmIybUpuRlR2YzhP?=
 =?utf-8?B?T0hxSnJKVWs2c0J1MXByRytXb2RDd3djKzZtUG95QVkxQndnQmMzUTgra3VI?=
 =?utf-8?B?MU94V1Y5anZhdTF3N3dZMFJTOGhuVEVFUFNSRk5GWm14Q3NlN0ZCZDVIVmZM?=
 =?utf-8?B?NzB4bm1qNTlqUjJkZ0YwUW1LY0lHWDJMQS8yVlFESTNWWmxNSXZhUnZGa2lU?=
 =?utf-8?B?blVpYTJELzd3OStFeUkyN2c4S3BEakFKSmF4MFFVbkNTNjFLWVc4K1RLWkRY?=
 =?utf-8?B?bXNFYWN6LzZtL0xRajFHazVwbjAvcGZQVkJHam51cjlOOG1hNW9jNG1JTlRE?=
 =?utf-8?B?V1ZkTUZ4Ukl0Zkx0SEw2Y0lXWEpRY2NkTEVyanRVZmNkMmZEaDQrY2IwaGwz?=
 =?utf-8?B?YlJjUjdQTmZ4MGRCTVlILzRsdlRRQnYzbW5iREoyQU1DdzAra0IrM3ZUNnpw?=
 =?utf-8?B?dE1jWTdlR0hid0tpRmpoMlFPcjhFYnFlUldBT2hJNFZocGcyNEcweDZYbjBS?=
 =?utf-8?B?MVBYT3dTYy9oYkRSTWc0c29TdjB0LzVFWkFDSklpQ2l6REh0N09jVmQ3cTRo?=
 =?utf-8?B?TlZEaUVabHBHV1M3MTdRZ0dweWxSSEp4aCtCWFZNV092VklhZWRnei9tRVJv?=
 =?utf-8?B?U2phL1hGbFZiZjVwb0pmRys1QWY0NktVTlpJVi8xUTJRTDl6VjM5OXYzTkJn?=
 =?utf-8?B?cDJnQU5jVEhEWXZEM3hzZXJmZnB6K1ZhNTdWbUd5QVp5cUx6TXNHS2I0S0dE?=
 =?utf-8?B?WlVwZEhYcXNYK3JzNEJvVEhFV1o3Q250NDZNVUJoWGVlZVZ2M1Q2YUhUeE54?=
 =?utf-8?B?Mk03RVVQdlYwQUF3cytZcDhpWDAwNXp5L2FXNDd5M2tLT1Qwa01yZ00zVjJ5?=
 =?utf-8?B?Znc2ZEQyQThldXphekhJMEZFRi8vYzc2bDVLdjZGVG9yc3NtTTRCYzVHdU9K?=
 =?utf-8?B?UWJ5NG05QSs1Ukc5TUxrNFZ5YWVJRXduSmJMSElEMWl1VElycFJxZkFnOFhW?=
 =?utf-8?B?dndscHNSV0VFSFJnMDBwNU5kZm1DaDFNUlEvOFJaclp6MkkwVytxUWltK2xs?=
 =?utf-8?B?Y0tsTUl6WURQcjArNitab3ZLV0gxWGZGUlVmeDY4cElINEplU25VNzVFazFH?=
 =?utf-8?B?MGg4VC9XS0RmdmlObGZCd3NUejBuemhlWkNCKzRJQktHT0NMSjFoR25acmtY?=
 =?utf-8?B?RWgwOVFGbFZSTHlqNmplWlhTOU9xZGRtNjZiMDl1cXZLcVdNNWNobDhxTTlu?=
 =?utf-8?B?dTZCUEJaL2xQZ0JJdUZFdkdXbTFMZkJPbnE0eU9GejAzcS9vUXJBOStKcG9q?=
 =?utf-8?B?TDF1YUtNSVd2TEJiajNiMlZsN3JUSHFjOU5oSnFoeEw2MmZjMXprZVBmQUdJ?=
 =?utf-8?B?MHpPQ0JLcWRZbU5ENCtXQ1VGQlhVQ0R0S01BeDVlZXlFbTRjUnBlYmpSUEln?=
 =?utf-8?B?dmtGY003aS9oV0l2d0ZsbzRmODh5N0E0Q0ZQNFZ6ckdOUVZCMkdNQ2lDS1lG?=
 =?utf-8?B?dE1ydjRkUzY0WmQ1U3MrRjdEODBtcElLWTg3elFlQzIyQ2c0QTNPOWc4djVo?=
 =?utf-8?B?RWE0WjRMeTFKYmRkZ0FjZ1JWempHZkxpcHhlNVhEc2h6cER0TGlEMUorbUYy?=
 =?utf-8?B?WjdKZWFIdXhLUHZSVnhKT2NwRjF2aUF1dEpDRStUT0FWdm1qRklMd1lvT1k0?=
 =?utf-8?Q?0NGnkKTI+V/Y74MaqI4zU7rFvn5Pfj6f?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zko1cXIwS1RVUkg3d3BZNVVEWXg0bE14V3pVTk0yTVdXdzlmQnBUWGoyOGhx?=
 =?utf-8?B?S1d4Y21hWGNadnJNdzV4cVZPOGltUkRlU3E3Q0U1WlcwMlJZUUIzalF2RVJk?=
 =?utf-8?B?S0k4UEhZMUV0cXF3eHNQQTg1cSt3azN1NnBLQzBOQ2NCZmZzQitHQnJqUUEx?=
 =?utf-8?B?dkNnbXlhd0RISlBKVGx3ZEt1akgyTXZXUFZFd2ZmVHRDcWpsY2lKemxoaFk3?=
 =?utf-8?B?TGc4cEYvSWsycEJ2SXU5VWt5QVBjK2xTT1lVd1RFWjlSUTNuaFlqMFlOWEo5?=
 =?utf-8?B?R01pVFRPd0NlaUdXVmxoNFlyZlZ1d2FNOCtaSFNuN2xXYzF3dGlneDgwWTBz?=
 =?utf-8?B?YlJmR3RjUDZrVjZyQS9jY2dEQXc5ekYvcW9KTlFJMTlTa050UlBnTkI3OU9s?=
 =?utf-8?B?MDVwRzgwU1JjS284ei9SNkFiWit1bkZWNE9pNFRxK2RlcG84WGpMRkt6T294?=
 =?utf-8?B?WFNyaGxQZnZUNnVjaUFmUmV4TDJnZEd3ZnY1aElXTU9tMmIyR1M4VE12UFpw?=
 =?utf-8?B?ODBPQTNaUkJIU1ZBNnVpdTB1L3lHeHhvNURDN1ZsMGpNMnFDVjZ0NStyZk5S?=
 =?utf-8?B?Z3pUY0xLRXBKbytrTk9HSnF1MWRpUTRIdVRsWjZlRlVKWkhUWDEzVGxHODJr?=
 =?utf-8?B?MHphVEw5WGFQNmxuYkhUODB1bUhZZXc5NlRWa1pwOTBpclR6cVhKVEoxQ1FW?=
 =?utf-8?B?dGhPbk1OYzV6T3pPQklCQ0NlN05GdW45SC9kQjNXbUJ4RnNpUmdlU0tMM1hL?=
 =?utf-8?B?Q3FNdWlZUlhuUDNGaEllT09jUWlqOEVrN2NUSGR0WldwOUVXa0dmanJpYjdj?=
 =?utf-8?B?cnMwQWJvUThiUDhHbitBYldyM1VVUExhellydkpxNks1SXd3eXQ5TFhaUzJj?=
 =?utf-8?B?Y1BnL05iclFQMUJWQ2dINmw4QURDY3hwby9jOU40dEszZEtPR3AvMjVTT2dK?=
 =?utf-8?B?enRvNnVqbWlKMzZJSWZody95a2R6YkwwQ2ZoVFZ4YjdiWUhOWkRGTURxamZG?=
 =?utf-8?B?SnZNbEh2WFlReXZCNjd1dHpqOFBld0N3WmRac3JVR1p4UmFxbEVvOGdzejU5?=
 =?utf-8?B?WlkxQXlBWGZveml1S3NFSDNobTN6VVF0eUJmeFNoa0xFZmpVbHpUcUdDaXZp?=
 =?utf-8?B?ZEJDdTB1cUhRUlVkNDdxY0g5MDl4T1hJbjUzckZZTEpVbXBwTXRvUGZsRy9B?=
 =?utf-8?B?MFBDSEIzQ1RmZDZieUxXTXFrZDlQbXAxTnA3b0czT3pMS3FtTUxkbUtjb3Vm?=
 =?utf-8?B?UXRiMjdMcUk2b1pVZ0Fwd2t5eFM2cHJNRHA2OEdJRU1uNlhPZk5kT01NOERV?=
 =?utf-8?B?MmtaNU02YmhSd1h0bURUeDZyZExtNjEwRnlwZlo3eXQ2NXAzN1BVZFpXOHBX?=
 =?utf-8?B?TUN5alVoTE8rdEhGRVFJVHJuSE9pWGNScGc4T1hjcjNjRGpkajNMMzJuQlRM?=
 =?utf-8?B?UWltS212MHkyS3lFUUhhZVpIbU1lY010dG51cWMrUmtUZys3RkxZbHp4enBx?=
 =?utf-8?B?aFluSW42N1lBalBVcVBkU3dON3NuaExkbjIyU0RJWkgvSTJnOXAwbWIweEda?=
 =?utf-8?B?MUpCcVF1TUpNOE42Vnhqbm4xZkVtMWZmMTFleTJqWi9ldjJSQ3RRb2M1N2g0?=
 =?utf-8?B?cVNFdE9TcGk4azM0b1hWblh3TFo3Uituc1NzOGh1dVZGWHp2anRnZk1uUG96?=
 =?utf-8?B?dFZOY3E4SUdUUUg5VlErVE1NVytBamo0WmhJNzRneFpjbWJZUEMzUWR4Smty?=
 =?utf-8?B?ckFyN2Z2Q2RlRWxtNzdRczExdkZENDhjdnREN1JJU3ErRGRHbWg1YWlIaE05?=
 =?utf-8?B?bUNSb2txTzRjYnZXWFpqMXJmR0V4d2VrVWlqWnFkWWN6bWNHYnBoUWdDM295?=
 =?utf-8?B?YlV4NGxLTVp3enpwOVBYQjRzQmF5cm5lc0tPUlI3OS9GYjRzeGN0eERONlg2?=
 =?utf-8?B?d2lWTkJ5N1NvSHgya3dwSmRhZXpmcEx2Ni9Sbm1vdEdQTkV6ekQ4cmJGNmtI?=
 =?utf-8?B?VWdWby8xRlByd1RRamoxc0tOYkh2M1p1L2FreGk3Vmtyd09ybEpMUHNFWWJq?=
 =?utf-8?B?UTRta2FVSnNaMTJuWkFwN1JFdDJPdE1oTGFoWTFrWjVPWEFDVzhqekRWcC9V?=
 =?utf-8?B?VEVoSDNtYlFJL3crRXZsRDlRRlFqTk9zSUt1bXowZ0xHcjl1Vjdzd3pESmNy?=
 =?utf-8?Q?Nb2NMSpxdap5cwNWe0trwT4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0270DAC48E6A94894E2D34D7441FDA2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e41a57-81d3-4f9d-8f84-08dd4ba2ded7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 20:21:45.1722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ryt5aYgRLDTjxc7homuyzRFYq+bWyowkWK/5p7FgZbXH56ACM1YiIk4kZqjxlG1/UeviBikQRroqvZkqu3gV/CUBbZ6MVsbTmIYktfpQXZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

T24gV2VkLCAyMDI1LTAyLTEyIGF0IDIwOjMwICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDAzOjE0OjE4UE0gKzAyMDAsIFZpbm9kIEdvdmlu
ZGFwaWxsYWkgd3JvdGU6DQo+ID4gSWYgRkJDIGlzIGFscmVhZHkgYWN0aXZlLCB3ZSBkb24ndCBu
ZWVkIHRvIGNhbGwgRkJDIGFjdGl2YXRlDQo+ID4gcm91dGluZSBhZ2Fpbi4gVGhpcyBpcyBtb3Jl
IHJlbGV2YW50IGluIGNhc2Ugb2YgZGlydHkgcmVjdA0KPiA+IHN1cHBvcnQgaW4gRkJDLiBYZSBk
b2Vzbid0IHN1cHBvcnQgbGVnYWN5IGZlbmNlcy4gSGVuY2UgZmVuY2UNCj4gPiBwcm9ncmFtbWlu
ZyBhbHNvIG5vdCByZXF1aXJlZCBhcyBwYXJ0IG9mIHRoaXMgZmJjX2h3X2FjdGl2YXRlLg0KPiA+
IEFueSBGQkMgcmVsYXRlZCByZWdpc3RlciB1cGRhdGVzIGRvbmUgYWZ0ZXIgZW5hYmxpbmcgdGhl
IGRpcnR5DQo+ID4gcmVjdCBzdXBwb3J0IGluIHhlMyB3aWxsIHRyaWdnZXIgbnVrZSBieSBGQkMg
SFcuIFNvIGF2b2lkDQo+ID4gY2FsbGluZyBmYmMgYWN0aXZhdGUgcm91dGluZSBhZ2FpbiBpZiB0
aGUgRkJDIGlzIGFscmVhZHkgYWN0aXZlLg0KPiA+IA0KPiA+IFRoZSBmcm9udCBidWZmZXIgcmVu
ZGVyaW5nIHNlcXVlbmNlIHdpbGwgY2FsbCBpbnRlbF9mYmNfZmx1c2goKQ0KPiA+IGFuZCB3aGlj
aCB3aWxsIGNhbGwgaW50ZWxfZmJjX251a2UoKSBvciBpbnRlbF9mYmNfYWN0aXZhdGUoKQ0KPiA+
IGJhc2VkIG9uIEZCQyBzdGF0dXMgZXhwbGljaXRseSBhbmQgd29uJ3QgZ2V0IGltcGFjdGVkIGJ5
IHRoaXMNCj4gPiBjaGFuZ2UuDQo+ID4gDQo+ID4gdjI6IHVzZSBIQVNfRkJDX0RJUlRZX1JFQ1Qo
KQ0KPiA+IMKgwqDCoCBtb3ZlIHRoaXMgZnVuY3Rpb25hbGl0eSB3aXRoaW4gaW50ZWxfZmJjX2Fj
dGl2YXRlKCkNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2
aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMgfCAxMSArKysrKysrKysrKw0KPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gPiBpbmRleCBkZjA1OTA0YmFjOGEuLjk1MWRjODFi
N2I5NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2ZiYy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMu
Yw0KPiA+IEBAIC03MzksOCArNzM5LDE5IEBAIHN0YXRpYyB2b2lkIGludGVsX2ZiY19udWtlKHN0
cnVjdCBpbnRlbF9mYmMgKmZiYykNCj4gPiDCoA0KPiA+IMKgc3RhdGljIHZvaWQgaW50ZWxfZmJj
X2FjdGl2YXRlKHN0cnVjdCBpbnRlbF9mYmMgKmZiYykNCj4gPiDCoHsNCj4gPiArCXN0cnVjdCBp
bnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gZmJjLT5kaXNwbGF5Ow0KPiA+ICsNCj4gPiDCoAlsb2Nr
ZGVwX2Fzc2VydF9oZWxkKCZmYmMtPmxvY2spOw0KPiA+IMKgDQo+ID4gKwkvKg0KPiA+ICsJICog
V2hlbiBkaXJ0eSByZWN0YW5nbGUgaXMgZW5hYmxlZCwgYW55IHVwZGF0ZXMgdG8gRkJDIHJlZ2lz
dGVycyB3aWxsDQo+ID4gKwkgKiB0cmlnZ2VyIG51a2UuIFNvIGF2b2lkIGNhbGxpbmcgaW50ZWxf
ZmJjX2FjdGl2YXRlIGlmIGZiYyBpcyBhbHJlYWR5DQo+ID4gKwkgKiBhY3RpdmUgYW5kIGZvciBY
RTMgY2FzZXMuIFhlIGRvZXNuJ3Qgc3VwcG9ydCBsZWdhY3kgZmVuY2VzLiBTbw0KPiA+ICsJICog
bm8gbmVlZCB0byB1cGRhdGUgdGhlIGZlbmNlcyBhcyB3ZWxsLg0KPiANCj4gSSBoYXZlIG5vIGlk
ZWEgd2hhdCBYRTMgYW5kIFhlIGhlcmUgbWVhbi4gSSB3b3VsZCBqdXN0IHN0YXRlDQo+IHRoYXQg
cGxhdGZvcm1zIHdoaWNoIGhhdmUgZGlydHkgcmVjdCBkb24ndCBoYXZlIGZlbmNlcy4NCj4gDQo+
ID4gKwkgKi8NCj4gPiArCWlmIChIQVNfRkJDX0RJUlRZX1JFQ1QoZGlzcGxheSkgJiYgZmJjLT5h
Y3RpdmUpDQo+ID4gKwkJcmV0dXJuOw0KPiANCj4gSSBkb24ndCBxdWl0ZSBsaWtlIHRoZSBhc3N1
bXB0aW9ucyBiZWluZyBtYWRlIGhlcmUuDQo+IA0KPiBTaW5jZSBvbmx5IHRoZSBmZW5jZSBjYW4g
Y2hhbmdlIHVwb24gZmxpcCBudWtlIHdlIHNob3VsZA0KPiBwcm9iYWJseSBjaGVjayBmb3IgaW50
ZWxfZmJjX2hhc19mZW5jZXMoKSBpbnN0ZWFkIG9mDQo+IEhBU19ESVJUWV9SRUNUKCkgYW5kIHRo
dXMganVzdCBza2lwIHRoaXMgb24gYWxsIHBsYXRmb3Jtcw0KPiB0aGF0IGRvbid0IGhhdmUgZmVu
Y2VzLiBUaGF0IGFsc28gaW5jcmVhc2VzIG91ciB0ZXN0aW5nDQo+IGNvdmVyYWdlIGZvciB0aGlz
IHNob3J0IGNpcmN1aXQgcGF0aCwgd2hpY2ggaXMgYSBnb29kIHRoaW5nLg0KPiANCj4gSWRlYWxs
eSBJIGd1ZXNzIHdlIHNob3VsZCBjaGVjayBpZiB0aGUgZmVuY2UgaXMgYWN0dWFsbHkNCj4gY2hh
bmdpbmcgb3Igbm90LCBidXQgd2UgZG9uJ3QgaGF2ZSB0aGUgb2xkIHN0YXRlIGFyb3VuZA0KPiBh
bnltb3JlIHNvIGNhbid0IGRvIGl0IHJpZ2h0IG5vdy4NCj4gDQo+IFNvIEkgZ3Vlc3Mgd2UgY291
bGQgZG8gc29tZXRoaW5nIGxpa2U6DQo+IC8qIG9ubHkgdGhlIGZlbmNlIGNhbiBjaGFuZ2UgZm9y
IGEgZmxpcCBudWtlICovDQo+IGlmIChmYmMtPmFjdGl2ZSAmJiAhaGFzX2ZlbmNlcygpKQ0KPiAJ
cmV0dXJuOw0KDQpPa2F5LsKgSSB3YXNuJ3Qgc3VyZSBpZiBhbnkgb2xkZXIgcGxhdGZvcm1zIGhh
ZCBhbnkgc3VjaCBkZXBlbmRlbmN5IG9uIGZlbmNlcyBhbmQgc3RyaWRlIQ0KDQpCUg0KVmlub2QN
Cg0KPiANCj4gLyoNCj4gwqAqIHRoZSBleHBsYW5hdGlvbiBhYm91dCB0aGUgRkJDIHJlZ2lzdGVy
IHdyaXRlDQo+IMKgKiBudWtlIHZzLiBkaXJ0eSByZWN0IHN0dWZmLg0KPiDCoCovDQo+IGRybV9X
QVJOX09OKGZiYy0+YWN0aXZlICYmIEhBU19ESVJUWV9SRUNUKCkpOw0KPiANCj4gPiArDQo+ID4g
wqAJaW50ZWxfZmJjX2h3X2FjdGl2YXRlKGZiYyk7DQo+ID4gwqAJaW50ZWxfZmJjX251a2UoZmJj
KTsNCj4gPiDCoA0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiANCg0K
