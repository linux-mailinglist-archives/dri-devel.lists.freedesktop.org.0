Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC82A31D95
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 05:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE14F10E7A3;
	Wed, 12 Feb 2025 04:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXE5SVcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF37110E7A2;
 Wed, 12 Feb 2025 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739336011; x=1770872011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZkaLzQe9l0zS/HTcI13EHcB5o/lLAB4MZL9b+ioboxU=;
 b=AXE5SVcdtez2kgIyVrpUNYyAv4j4MGQtpqDM0R2zsdOwdu5IKpZmw62p
 CgyZ4hUJaIeuCf9Hh6Wm01eKpy9dafjdev5W5lZAGNkNg+/BWo58YpwDR
 wcak/M2OqTyb6sZoH57yQXV4Ugws8hLjKUHNS2RR2W5ssKWjUs48bOqwt
 60ntLJmsSuvsFCkeuzarAG0/TVkiGHyl+0FoknWkZhmhBqTnGu4NClexP
 MfuMkNXex9uoMBk1UGXjJeMsLyuisXSS8E7G7qsFkuge8j4KADmLdajt8
 J86Ii0/tEUf1s0LuSio1Ab9qLeSXWvPOeRjj+29ZyaliFveWLaMYRHJPS Q==;
X-CSE-ConnectionGUID: qlD50YI/RNeC7daRCD7D3A==
X-CSE-MsgGUID: fNdEM/hmRiapXEY2/zHAPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42821128"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="42821128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 20:53:30 -0800
X-CSE-ConnectionGUID: oo+AtJFWQaSejkqaZWemDg==
X-CSE-MsgGUID: dQpoGh7tReWn1MquKRb8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112928936"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 20:53:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 20:53:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 20:53:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 20:53:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8Jc7iytSsfokeuEvkXz+vSAxrEOv4HLAdPxFos3dWxEjGjWrCmcqeSFGLPssbMl7BHZu2R7dF/JJBDqwFAlWZDX8zWaQ1tgP/FqQE4haK+ZScMuje9rEiQoH7Awn0UHKILbuI47OJinSCmwpaipN/wxFetYYcHhFpFL/V66T8rosa0i/DZGnWgh2VQeagCHttWV8IK0P8CgbZaqhqjIvVjsUrd5WKLVzgGy+ZrbkBX9Na2XtEW8ZHj78zmgWDxhptD84wRkAzK1hcYUd0t2l96eaTCxe5EjmXP3ZIrVivfAfNGrP145Ard1LnQCvs8xRC/3RB9vaBrs1M7NVMbvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkaLzQe9l0zS/HTcI13EHcB5o/lLAB4MZL9b+ioboxU=;
 b=UqnfApBEZuP8djmz3tdTTrJP/zzpkfYCTBgVF5ZoCHp1qNraH21rpa/Xh1/gQyGu5BDUTnAD6PJuwajoU6CNUnAdzGVOWwgrIziy5wx8bPiMIYZzN6ayeXuOG7P1/bSdRC/L2wSseccFLukoxP1mw86WB7CRxB7YEKXk3Gmnhd0BwEZxZrZDhvNI55vfFHZKzziBUSP1YCvBN0yE8CVeUiEHTW8uypjxZg5RjQetEURwOlguOLIxkqRnkkMIgrIH5taHhF7xplZ1j9RvZ8wQyNgu3cjeMz9xgi4vHBjONymZmawkcEZ3mcX48s62QLB5qfT5tUTsJTdlWJ66Wl8qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 04:53:25 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 04:53:25 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v4 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v4 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbd7qbSx90We4N0EytYCXmY6ep8rNDGzjw
Date: Wed, 12 Feb 2025 04:53:25 +0000
Message-ID: <SJ1PR11MB6129A2E44D50C3B6D79D1D18B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-1-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-1-9a5b018e359b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8502:EE_
x-ms-office365-filtering-correlation-id: 43b7c104-e1cb-4f9b-1ce8-08dd4b212f01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bzdnRjgvcGdLcksyY0JnOFRSbHpXTlJvZjRsR3ZEVERzUHk0REhuUEhTbkcz?=
 =?utf-8?B?d2JwR1ExTHJiVlE1NlJ6WmRoMkpHTmIvcThjS0ZqbkY0YjM0aFhnUy9nd3pP?=
 =?utf-8?B?UWp6NDZLVXJXU2JPTUo2c0F1dUViL1RYd0UxSlZNUVRKd3hmeUVMUG9qQUp1?=
 =?utf-8?B?YVk1SHVuOW91WVNkd3lnOXFoN3RYZU1TODJ0SEhycmRHdUN5MFFrTEJKOUd3?=
 =?utf-8?B?RVMxNTN0ZU42N3lySWk3SXBOZzVLbFRjOEp5czU5RlVOcVVVaW1XaVI1bGxD?=
 =?utf-8?B?SVFSVk5VRHpIMjcvd1l6R3FONHhWMWpybzdIc0NEUGtuOUkxeDlCZGFJVkJi?=
 =?utf-8?B?cC9PUnI1K2Zoc1ZYZGlDSW1HbUsyQ2txVWphM3pVZyszL2IxdlhVRzhLQVBK?=
 =?utf-8?B?THhLV1QzSUwzWXYzemZrcW1rSHEveG8rRnN6YURGQWJLNkVrMDBCREhERmFK?=
 =?utf-8?B?WE9URkxMT09KQzA0MldEck5VbDVnbWxqYmhDTXRnUy9JUVJIVHVnU1dZMkNB?=
 =?utf-8?B?UWxXelZnWFNQSEtzbzNLbDFNNmlac09jbk9RNFAzbHhOeUIvcG9PN3JKNUJj?=
 =?utf-8?B?cE92QXdmVzJzeXdYcEprUllTNlNBMkYrTFZoL3ZWUmtFMHFlUlFNMStacG52?=
 =?utf-8?B?eGR3TG1mZytkRVIra3RNckxvZFBURWsyd3d6a3c2dytNdzVqK0d5ZmlScTV1?=
 =?utf-8?B?bVE4WjJNcWZmUXJqY1lkZ3VBSEtIWmxDMjBvcHVrZXN1V3AyOTAySDdYNDRj?=
 =?utf-8?B?MXJkNHhvSHYwaE5oUnJBYTNaUmVOR0RKTjRLOFBKNEZFTFlpYk9LRXhkeGpU?=
 =?utf-8?B?ZVhMUU5vVlhGYmlCNktrSDl4S3dGWVRaSkk1U3FvVFk4WG1tTCtRQkIvUXoy?=
 =?utf-8?B?YVJ2QzZDZUhkTW1Vc0tLVXFWd3paaFY3bm1pamk4YnlQcGlFV0VGbFFOeHkw?=
 =?utf-8?B?M294ZnpKWjNrQlh2S28xM3hUcEowdks4MVlUakZTWkNPTmliUmVGd0c4cXJK?=
 =?utf-8?B?Z0xOL0Z4R0x1WHdmRTgyLzVTbStwTktINUVmc3AzUTJsWEhxMnpqTlBvMldM?=
 =?utf-8?B?RVdkU3dhWEdyQWxnQTZ6LzZqTWpvQk1DK1lsVkZiOGVpS1JiTmEzSkp5ekhr?=
 =?utf-8?B?bDQxNFVLM25JbXovQ2FIcExtQVFJKzlzK2FsUTFQT2FoVmRCYWY4QWFSVGFv?=
 =?utf-8?B?YkloNmVqSDVobHpORXN2NlkwcFc3RkU2K3EyZFEwR3R5QmgyUnNqYWFqM2V1?=
 =?utf-8?B?WDhSOFNqM2ZGUk5OWlJVa2ZoRW82bHlTQ0xoMVVuUVZTOXFmQm5jRlJIUWVZ?=
 =?utf-8?B?VUFRSkxoVlRuQXltZnQzNHo4Qnl2VGZ2NGR1YzN2M3FrQ3kydjNLMUFUVFBU?=
 =?utf-8?B?TGltRnpFRnkyOGJwbTFTQlRmS08vdDhYaVduZTFSc2pNZjRzbTY3Y3E5Mm5w?=
 =?utf-8?B?K3JjUkQrd0hkVkxkbDdhQXpOdnNtQXAvKzNQZmhDTE84b1pOLzVuYzlJQzJr?=
 =?utf-8?B?SmlzdjNsdXdoZkNub29KQmFTcDRHWGZFK1kxSTJQR3JlNDhidDhyQmxHSkJu?=
 =?utf-8?B?ay9wYlpwdTc4M1FzOU51ZVRyTnI2djk4WGxFWWtMWk82eE51R3ptMTNwMWVF?=
 =?utf-8?B?eVhtcUNTaVRCSmt5Qnl5UXJRWjJGeVpDZWYwbDBkbEsvR1pDd2YzSmtROFFs?=
 =?utf-8?B?R2QvNHNXL25IYW5ZOFA0dGlMQ2ZrR0FiL3IyVEM4empsOGZRR0RtSWhQVm9H?=
 =?utf-8?B?QXFEUjd0bmhnVm1kV3FmdGcyVVpaZGFPb2R3TExGbkM5aE5KcElYRkhEbGJJ?=
 =?utf-8?B?SEtFMnFzNWJFMEJ6QXFuY1RNNFVxK0pwcFVDWEVNdFlzQmZyN1d2Z3VVZ2Jx?=
 =?utf-8?B?c0lqSkhIcmZBMEtEdzI2ZVJSbUtqQU9GNzhDbUhOS2hiNVJnS3BZeDJBdUtQ?=
 =?utf-8?Q?Qmiv3mxFHt+4ozPTkOG1LhlceZVq8h0K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnRvUmpwcjF1NU9hN0MyU08vTkhFZ1VvcmFhdEVBQmFhUmlYdGFuRkFnWCtr?=
 =?utf-8?B?Y1NVYUx1Rms0a29OVmlZYzkrMlBnb1JZR2Z4d091UmpaK0hOdlZPYTViQjVv?=
 =?utf-8?B?QzZYTXFBYk44a1UxeVhuL0RRdEVPRHFZQUNNNE1VQzZNaUwrbDBxTCtXdU5T?=
 =?utf-8?B?bHE4OGFuWDZoL3hVMjhLdDJYMEV5WmFlNHRKMktWTTdISkM2TitXZkJDUDk5?=
 =?utf-8?B?VENoYUVweGIxVDQ2Zk53QzBHVzEvb0NQK1V4QTQ3Y3A5UzRJRnpYUmk0aFVI?=
 =?utf-8?B?SG5NSW5JS25kVWVSVmJzM0R3NDdOUXBuNnZXNVc3ckdqVzV2QUVMbUlEUDZD?=
 =?utf-8?B?anljUWpDaVZaREVxMjJCcU44Uy9oaEdUY2svQU5zZUkrODllcHBWUzFac0U4?=
 =?utf-8?B?OHJ3U1BOcXFWdWw3NGxSWkxqWXZ4dUJMNFRzSlV4SUhES3pRZFgwNHZzYjAz?=
 =?utf-8?B?STBIbE5qaFZ5RTFFOGJTRVRVbEExcVpCZU5pZHdsNXU0cWFScHlwWDFlcEJv?=
 =?utf-8?B?dUpkeW1KZHQrV2E2UUFWR3g3ckc2dFlBUGk1Um42Z2wrQWdZT3p6b3c2aEs3?=
 =?utf-8?B?UFo3dURaTUFVZGNURTFEQkNFaFpqMzBLR2hMSmw1ZWRsb3lJc3NoamJHSkxC?=
 =?utf-8?B?MmFmc0dkQ2s4emFxOW1jQ24xdmtnMTcrYmtuYVFlQUZPN0NtZ3prRkJ4SWt4?=
 =?utf-8?B?QktHS3ZmSlBUVFA1YW1oSTVBVk9sWjhwaU1iN2Z6NVRTZ2hNNFZRcHNORmR1?=
 =?utf-8?B?T2ZHK3NJY0o3anV5MnRvVnViWlhRbXpubDdqRUkrSWlJVFBQelJyVXB2alhF?=
 =?utf-8?B?OEh2WmlUR3pMZ1VJRGNQVGJTZWxKRjJHQ3RNek5pbGZvSkJXUmtrN2pYcjd2?=
 =?utf-8?B?eExQczRFYm9DT3VuUE90NmF4R09nb1NxSVlRcGNWaVJTbVBpNEFuZ09Rb252?=
 =?utf-8?B?dnVKQlRCcm1TV2diRHdaYlNYTjZob1VEZ09FSldwTFZIUHJtZDlJWWRoVThZ?=
 =?utf-8?B?K3JEYXJDTWMzWEt2NzFtQ3dJVXk3S2dneWFndEJVNFpUMXBYbERycXhoNkJy?=
 =?utf-8?B?UExXKzRac0FNZUtraTRWVlBBTnBMSDVTVXQyc0ZwbWRGS2xWeXdRNVR5RmF6?=
 =?utf-8?B?TlpDdTRWU3ZEd2NJaHNSbExWUktwMnFpaWFHYVlBdzMwZFhXWjMzMDI4MURG?=
 =?utf-8?B?OERSNC9PSkkybDB1MWNRYjVQd3BYZktDNlZaMGxQK3V1UXYwdXdqbzIrQlFK?=
 =?utf-8?B?UDBFUlM5aFIyVnBZZFE2UzFLMmVCcFBZMnMzb01WMUEwVHVsVFZ0YVZSNExN?=
 =?utf-8?B?SDh6RHh1bngrRjhwY0g2ZWpibGsyUW1vYy80ZEJ4U0NnZ2U0Z1JuVTRyYjdN?=
 =?utf-8?B?U0N4bG9IVlFRYkM2emdjb1MraXNpOVRZWkFYcnJ4UEVOWlo3bGdhZ1VHck1P?=
 =?utf-8?B?SVlrWEZaRjVYdWZpRjFJSUhsWE5mRXRUMkd4V0lXaTRsZUJkNlJHWXVwWUp5?=
 =?utf-8?B?Rm1GdEYrNmR3d1pwNVJxQlFqeDBTUHZDS2NhVUUxL05IMGNNOEo4Umtlbjhm?=
 =?utf-8?B?Nzk1aXlobXc2UWh4YkduMHdKRklFckdQRWtQNVFFSUFCalZHNTdhQlF0TkdI?=
 =?utf-8?B?Zzd4T25aTTNuM1F5YUxoTkpDUGJUeTU2VTBXc2JGZUd6dmIvanZ6UGdFdnBi?=
 =?utf-8?B?WmcxWTlaTXhpZ1RhcW5oemp6Y2lmMDhYR21yTEFQckJsOFovamcvcSttb2RD?=
 =?utf-8?B?ZHdvZ3ZMOWwyYWFBMkJteS9UTEZKVTg1eld3V0RhYkh6dTdjWTNxcDFEWGNy?=
 =?utf-8?B?eTlEbVkrVVQwRUhWTmJmL3NuZk5EMTJEVWJFQjl1cVhNWFdJZDEvemdqbnMw?=
 =?utf-8?B?Q3M3bGlQVXZxRTBwMXRicmhidHZ3YU5lcTloNjZWdTI5a2E5cy84TmFpNDUr?=
 =?utf-8?B?RDZhdkpNNmxKMGwwNzhpU3pQRmVhMlQwRHpXQWtuQWFTRTJmZnQzSUtmNkhC?=
 =?utf-8?B?Q1Vhcm0vd251WTBidmliWnVjZkNDTVdKWHVSU216TEpWK0k4Szc0VVp4b1cx?=
 =?utf-8?B?enZxOFh1QVpwSFhmUDdmWXpIN3YwdTBzVzdHaktIK2FINHpYOEFGd21QeU5F?=
 =?utf-8?B?SXNrTkhoUC9NNmVWRGc1MUlnRlNlNWtDb0l5YmZYKzRISWNSTDJLeUYwS0lZ?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b7c104-e1cb-4f9b-1ce8-08dd4b212f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 04:53:25.0723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKlAkxMwSYoxBb/zTstdPqqmPFCSYrn6ppfOApZQAtDAURaz2Qj95WNPEJiwKD+4glHSuKsOLB05/htjNieyaDiyZ86YmDi7MqFT4EcZ4t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUs
IDIwMjUgMzo1NyBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJv
cmFoQGludGVsLmNvbT47IFN5cmphbGEsDQo+IFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNv
bT47IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY0IDEvM10gZHJtL3BsYW5lOiBBZGQgbmV3IHBsYW5lIHByb3BlcnR5DQo+IElOX0ZP
Uk1BVFNfQVNZTkMNCj4gDQo+IFRoZXJlIGV4aXN0cyBhIHByb3BlcnR5IElOX0ZPUk1BVFMgd2hp
Y2ggZXhwb3NlcyB0aGUgcGxhbmUgc3VwcG9ydGVkDQo+IG1vZGlmaWVycy9mb3JtYXRzIHRvIHRo
ZSB1c2VyLiBJbiBzb21lIHBsYXRmb3JtcyB3aGVuIGFzeW5jaHJvbm91cyBmbGlwcyBhcmUNCj4g
dXNlZCBhbGwgb2YgbW9kaWZpZXJzL2Zvcm1hdHMgbWVudGlvbmVkIGluIElOX0ZPUk1BVFMgYXJl
IG5vdCBzdXBwb3J0ZWQuDQo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwbGFuZSBwcm9wZXJ0eSBJ
Tl9GT1JNQVRTX0FTWU5DIHRvIGV4cG9zZSB0aGUNCj4gYXN5bmMgZmxpcHMgc3VwcG9ydGVkIG1v
ZGlmaWVycy9mb3JtYXRzIHNvIHRoYXQgdXNlciBjYW4gdXNlIHRoaXMgaW5mb3JtYXRpb24NCj4g
YWhlYWQgYW5kIGRvbmUgZmxpcHMgd2l0aCB1bnN1cHBvcnRlZCBmb3JtYXRzL21vZGlmaWVycy4g
VGhpcyB3aWxsIHNhdmUgZmxpcHMNCg0Kcy9kb25lL2RvDQpzL2ZsaXBzL2ZsaXANCg0KPiBmYWls
dXJlcy4NCj4gQWRkIGEgbmV3IGZ1bmN0aW9uIHBvaW50ZXIgc2ltaWxhciB0byBmb3JtYXRfbW9k
X3N1cHBvcnRlZCBzcGVjaWZpY2FsbHkgZm9yDQo+IGFzeW5jaHJvbm91cyBmbGlwcy4NCj4gDQo+
IHYyOiBSZW1vdmUgYXN5bmMgdmFyaWFibGUgZnJvbSBkcm1fcGxhbmUgKFZpbGxlKQ0KPiB2Mzog
QWRkIG5ldyBmdW5jdGlvbiBwb2ludGVyIGZvciBhc3luYyAoVmlsbGUpDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMgfCAgNyArKysrKysrDQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgICAgICAgfCAgNiArKysrKysNCj4gIGluY2x1ZGUvZHJt
L2RybV9tb2RlX2NvbmZpZy5oICAgICB8ICA2ICsrKysrKw0KPiAgaW5jbHVkZS9kcm0vZHJtX3Bs
YW5lLmggICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gIDQgZmlsZXMgY2hh
bmdlZCwgMzkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZV9jb25maWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcu
Yw0KPiBpbmRleA0KPiA4NjQyYTJmYjI1YTkwMTE2ZGFiOTc1YWEwYWI2YjUxZGVhZmI0Yjk2Li5k
YmJlZjIwNzUzZjgzNGE4NWFlOWRlZA0KPiA3NDhjZmYyYjNmMGU4NTA0MyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZV9jb25maWcuYw0KPiBAQCAtMzg4LDYgKzM4OCwxMyBAQCBzdGF0aWMgaW50
DQo+IGRybV9tb2RlX2NyZWF0ZV9zdGFuZGFyZF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgCWRldi0+bW9kZV9jb25maWcuc2l6ZV9o
aW50c19wcm9wZXJ0eSA9IHByb3A7DQo+IA0KPiArCXByb3AgPSBkcm1fcHJvcGVydHlfY3JlYXRl
KGRldiwNCj4gKwkJCQkgICBEUk1fTU9ERV9QUk9QX0lNTVVUQUJMRSB8DQo+IERSTV9NT0RFX1BS
T1BfQkxPQiwNCj4gKwkJCQkgICAiSU5fRk9STUFUU19BU1lOQyIsIDApOw0KPiArCWlmICghcHJv
cCkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsJZGV2LT5tb2RlX2NvbmZpZy5hc3luY19tb2Rp
ZmllcnNfcHJvcGVydHkgPSBwcm9wOw0KPiArDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9wbGFuZS5jDQo+IGluZGV4DQo+IGEyOGIyMmZkZDdhNDFhY2E4MmQwOTdkNDIyMzc4NTFk
YTlhMGE3OWIuLjQxNjgxOGU1NGNjZmZjZjNkM2FhZGEyNw0KPiAyM2U5NmNlOGNjZjFkZDk3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IEBAIC0xNDEsNiArMTQxLDEyIEBADQo+ICAgKiAgICAg
dmFyaW91cyBidWdzIGluIHRoaXMgYXJlYSB3aXRoIGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIHRo
ZSBjYXBhYmlsaXR5DQo+ICAgKiAgICAgZmxhZyBhbmQgcGVyLXBsYW5lIHByb3BlcnRpZXMuDQo+
ICAgKg0KPiArICogSU5fRk9STUFUU19BU1lOQzoNCj4gKyAqICAgICBCbG9iIHByb3BlcnR5IHdo
aWNoIGNvbnRhaW5zIHRoZSBzZXQgb2YgYnVmZmVyIGZvcm1hdCBhbmQgbW9kaWZpZXINCj4gKyAq
ICAgICBwYWlycyBzdXBwb3J0ZWQgYnkgdGhpcyBwbGFuZSBmb3IgYXN5bmNocm9ub3VzIGZsaXBz
LiBUaGUgYmxvYiBpcyBhIHN0cnVjdA0KPiArICogICAgIGRybV9mb3JtYXRfbW9kaWZpZXJfYmxv
Yi4gV2l0aG91dCB0aGlzIHByb3BlcnR5IHRoZSBwbGFuZSBkb2Vzbid0DQo+ICsgKiAgICAgc3Vw
cG9ydCBidWZmZXJzIHdpdGggbW9kaWZpZXJzLg0KDQpBcyBwb2ludGVkIG91dCBpbiBteSBwcmV2
aW91cyBjb21tZW50IHdlIHNob3VsZCByZW1vdmUgdGhpcyBsaW5lIG9yIHJlcGxhY2UgaXQgd2l0
aCBzb21ldGhpbmcgbGlrZSB0aGlzDQoNCldpdGhvdXQgdGhpcyBwcm9wZXJ0eSB0aGUgcGxhbmUg
c3VwcG9ydHMgYWxsIHRoZSBmb3JtYXQgbW9kaWZpZXIgcGFpciBsaXN0ZWQgYnkgSU5fRk9STUFU
IGZvciBhc3luY2hyb25vdXMgZmxpcHMuDQoNCj4gVXNlcnNwYWNlIGNhbm5vdCBjaGFuZ2UgdGhp
cyBwcm9wZXJ0eS4NCj4gKyAqDQo+ICAgKiBTSVpFX0hJTlRTOg0KPiAgICogICAgIEJsb2IgcHJv
cGVydHkgd2hpY2ggY29udGFpbnMgdGhlIHNldCBvZiByZWNvbW1lbmRlZCBwbGFuZSBzaXplDQo+
ICAgKiAgICAgd2hpY2ggY2FuIHVzZWQgZm9yIHNpbXBsZSAiY3Vyc29yIGxpa2UiIHVzZSBjYXNl
cyAoZWcuIG5vIHNjYWxpbmcpLg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVf
Y29uZmlnLmgNCj4gYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBpbmRleA0KPiAyNzE3
NjVlMmU5ZjJkYTYyYWFmMGQyNTg4MjhlZjQxOTZlMTQ4MjJlLi4wYzExNmQ2ZGZkMjc3MjYyYjFh
NGMwZjANCj4gOTdmY2UyZDcxOWY0Mzg0NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X21vZGVfY29uZmlnLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4g
QEAgLTkzNiw2ICs5MzYsMTIgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7DQo+ICAJICovDQo+
ICAJc3RydWN0IGRybV9wcm9wZXJ0eSAqbW9kaWZpZXJzX3Byb3BlcnR5Ow0KPiANCj4gKwkvKioN
Cj4gKwkgKiBAYXN5bmNfbW9kaWZpZXJzX3Byb3BlcnR5OiBQbGFuZSBwcm9wZXJ0eSB0byBsaXN0
IHN1cHBvcnQNCj4gbW9kaWZpZXIvZm9ybWF0DQo+ICsJICogY29tYmluYXRpb24gZm9yIGFzeW5j
aHJvbm91cyBmbGlwcy4NCj4gKwkgKi8NCj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICphc3luY19t
b2RpZmllcnNfcHJvcGVydHk7DQo+ICsNCj4gIAkvKioNCj4gIAkgKiBAc2l6ZV9oaW50c19wcm9w
ZXJ0eTogUGxhbmUgU0laRV9ISU5UUyBwcm9wZXJ0eS4NCj4gIAkgKi8NCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggaW5kZXgN
Cj4gZGQ3MThjNjJhYzMxYmYxNjYwNmYzZWU5ZjAyNWE1YjE3MWNkMWU2Ny4uMTc5ZGExOWQ2MDJh
Yzk0Y2I2ZWVlYTNlDQo+IDY1MjJhZTVjNzczOGJiNDYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9wbGFuZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oDQo+IEBAIC01
NDksNiArNTQ5LDI2IEBAIHN0cnVjdCBkcm1fcGxhbmVfZnVuY3Mgew0KPiAgCSAqLw0KPiAgCWJv
b2wgKCpmb3JtYXRfbW9kX3N1cHBvcnRlZCkoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHVpbnQz
Ml90DQo+IGZvcm1hdCwNCj4gIAkJCQkgICAgIHVpbnQ2NF90IG1vZGlmaWVyKTsNCj4gKwkvKioN
Cj4gKwkgKiBAZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmM6DQo+ICsJICoNCj4gKwkgKiBUaGlz
IG9wdGlvbmFsIGhvb2sgaXMgdXNlZCBmb3IgdGhlIERSTSB0byBkZXRlcm1pbmUgaWYgZm9yDQo+
ICsJICogYXN5bmNocm9ub3VzIGZsaXAgdGhlIGdpdmVuIGZvcm1hdC9tb2RpZmllciBjb21iaW5h
dGlvbiBpcyB2YWxpZA0KPiBmb3INCj4gKwkgKiB0aGUgcGxhbmUuIFRoaXMgYWxsb3dzIHRoZSBE
Uk0gdG8gZ2VuZXJhdGUgdGhlIGNvcnJlY3QgZm9ybWF0DQo+ICsJICogYml0bWFzayAod2hpY2gg
Zm9ybWF0cyBhcHBseSB0byB3aGljaCBtb2RpZmllciksIGFuZCB0byB2YWxpZGF0ZQ0KPiArCSAq
IG1vZGlmaWVycyBhdCBhdG9taWNfY2hlY2sgdGltZS4NCj4gKwkgKg0KPiArCSAqIElmIG5vdCBw
cmVzZW50LCB0aGVuIGFueSBtb2RpZmllciBpbiB0aGUgcGxhbmUncyBtb2RpZmllcg0KPiArCSAq
IGxpc3QgaXMgYWxsb3dlZCB3aXRoIGFueSBvZiB0aGUgcGxhbmUncyBmb3JtYXRzLg0KPiArCSAq
DQoNClRoaXMgaXMgYSBiaXQgbWlzbGVhZGluZyBiZWNhdXNlIHVzZXJzcGFjZSBzdGlsbCBuZWVk
cyB0byBjb25zaWRlciBJTl9GT1JNQVRTLg0KSXQgY2Fubm90IHJhbmRvbWx5IHBhaXIgYW55IGZv
cm1hdCB3aXRoIGFueSBtb2RpZmllci4NCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiArCSAq
IFJldHVybnM6DQo+ICsJICoNCj4gKwkgKiBUcnVlIGlmIHRoZSBnaXZlbiBtb2RpZmllciBpcyB2
YWxpZCBmb3IgdGhhdCBmb3JtYXQgb24gdGhlIHBsYW5lLg0KPiArCSAqIEZhbHNlIG90aGVyd2lz
ZS4NCj4gKwkgKi8NCj4gKwlib29sICgqZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLA0KPiArCQkJCQkgICB1aW50MzJfdCBmb3JtYXQsIHVpbnQ2NF90
IG1vZGlmaWVyKTsNCj4gKw0KPiAgfTsNCj4gDQo+ICAvKioNCj4gDQo+IC0tDQo+IDIuMjUuMQ0K
DQo=
