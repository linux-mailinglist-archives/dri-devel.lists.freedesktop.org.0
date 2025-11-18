Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA0C67B67
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7724D10E411;
	Tue, 18 Nov 2025 06:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSb/IJkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530710E0D3;
 Tue, 18 Nov 2025 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763447009; x=1794983009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0iX27sfJn4eKJAygXfoNO7tKuwHD9mp5jV+cGLtzT1Q=;
 b=JSb/IJkv1wHxfve/NgLtAiUq0elprmo0gbfhLBUJlwmHp/cB3MwYuNv5
 a60LPegSIupOb4ex54OyFyk1V3Wb2KlmGiAabNyObKyjrYaZBjxuw6Av0
 9x2V0ctQ0MubsVQM+CFp7PNgoVgylg42EQUGUSBgkR2OB804RV21JEQgg
 l4niC8gI4HMfK5K7keUe0gIBdeHy/YPuWUWQpPkc58OZBNOC/t/9bW+ce
 43Runw/DWGmB2YzU9omchcfqZcSVC0XbihH1OY9Eif3Cy7TCInlQX0/xK
 wk90wilKqyBhMRDQYfCsLjx2XGwFvV6uPyr+nQ9Uq2TIXFshm21WITBsB A==;
X-CSE-ConnectionGUID: pNwu/mlkQLWPv8AypXxDKA==
X-CSE-MsgGUID: kgHalWIPSb6NcZ0vKtX6Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65342424"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65342424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:23:29 -0800
X-CSE-ConnectionGUID: rlSgJ5eUTE+VjX2hZugxNg==
X-CSE-MsgGUID: cXrpPHPUS0WDKzbLFOFZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="194985446"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:23:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:23:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:23:28 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:23:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mn+IQwJwqQFr2w7OER4UDkVvEupNYeJlTybtteXFnmKw4S/ROtCcoXexevLKhe00ORjSgK8DB/C7DSPy4GJIPN0YEEGuQXq6hJc89f0Ph4eeLK4wzM7FIU/t/zsGpt/bhJNqFhzYVLs3sw51RgIRFmU4L0LEmtG+h7mWja6lFCsziPkjLn59kPRpQaYIZB62e9pfM0X3q6P2ZWaU6Ok7EUxmPsK3O+98wbt2WLO2WH5NmuzWqws8hCm3m68uH9sUqZwAych9RYj3EHenAw5R+6X78n4VQ3uFIJe+mWjD1EBu0PizIKT6NcIc9rpb1QYIhO6iDwXC41tA8StNRSH3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iX27sfJn4eKJAygXfoNO7tKuwHD9mp5jV+cGLtzT1Q=;
 b=uWBc+0zInUfY8q/v6Hku4YgTp9i+BkJN2+KFva7wZ58/VjgeaT6jKpKDOBeSl+lTwPj+Xnzix/yCH8uGlb6Ve0tXRjJ5gfaCFRn0E8EpPpfrq/Fxm1LhXhEh4woXXMQO7yaTlfOxbtcdam1fpkqTSFNa3vyp+GnVfANbwuomTc1ukti/cS2gi5/d61c1v2XZC3XtgfTWDa5vaWQ2kLsq6yEXbJ1xFr/SLIa7cXlYmg+2ny4V+ek7b0OhTcqaMPhoRrFBFJ7eL4+DdWpYlSddz9EMPJdry9+MnNmX0FM4vftowG6ToLkKu2hzBZzaWwkB7GTFEoxeyHQ65LZjTGIkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB6054.namprd11.prod.outlook.com
 (2603:10b6:510:1d2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 06:23:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:23:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 05/16] drm/i915/color: Create a transfer function color
 pipeline
Thread-Topic: [v6 05/16] drm/i915/color: Create a transfer function color
 pipeline
Thread-Index: AQHcTk7wLpLwP3X1Ak6wZcGq2gDzhbT4CG4A
Date: Tue, 18 Nov 2025 06:23:25 +0000
Message-ID: <DM3PPF208195D8D4BABD791997854DA96F4E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-6-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-6-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB6054:EE_
x-ms-office365-filtering-correlation-id: e005aec6-2a67-40f5-889f-08de266afaf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OUFLZ1lqL1lNUVB5WmpBRWUvMUJZMUhpdzNXVHF6NWcxSjJwNEIvYlJnaUxP?=
 =?utf-8?B?K1d0VzQrZ3RTbEVreGtuVWFmcm9hQzBGVVN1WHVWRHp0eTJJZlBuRVozb0ln?=
 =?utf-8?B?UWE5eDByYWdPY1QwUVYzc0dJYzFXaHpjUVU5L01DaXhUTmZrVk9Yb1drbWNm?=
 =?utf-8?B?UkNxQ1haWUxVc0JjZmNCU1h4ODVVcWNzdFJhYlFzN291WFZjZ2poYnJzL3Vx?=
 =?utf-8?B?bk05RDJuSWZoYll3WWZqM3QxK2h6QnZlbFB5WWw1WkJtZW95bk5JcExIUzR4?=
 =?utf-8?B?T2xsQUEwK0lPZDlIeFFjeGZuNXRQcVZJdk5xNUJZeGd5YStzTk9YR3lueDQ2?=
 =?utf-8?B?a3lMQTJkRDBuVFcwcEdxRm1LQ3dobTF6UUR0TzQ4d0FvMW1hL05BK0dUWGww?=
 =?utf-8?B?S3JmV09hTTZFVTlQclpiZEFSZURYSXZjVkx4Y014RURGdy80d0U2d3FsQTZG?=
 =?utf-8?B?bjJwY21VWnNUVlJ6R0VnNDZCSHNsVXBpNHd0cTB4eXBVU0JDc2JET1ZpcnNm?=
 =?utf-8?B?TXhMQkp4TWxnRnozRnpDcXZMS05vbnd0aTFpa1RsMm1BLzhCZUVVK3k1Qk5G?=
 =?utf-8?B?b1hja0N3V3hvY2xzdE1heCtGdHNKWkFQSGdYNWhaNnFxUGlYd2RWa2lmZHpa?=
 =?utf-8?B?NlhCMUlMd2gzZ2xBNHdpbmg5d1ZINVNCRWtJNnVUbkxBZ3kxeFphTTFHSlg5?=
 =?utf-8?B?VGtoUjM3Z0hHUVBMeUcvOEZGY2h4ZlJPMzB1YnRId0FOVjF6VFB2eUJ1VWU2?=
 =?utf-8?B?UWJTOU9LN2NRSEk1b0VKbFdFQUhnWGt3WkJHeFgrTW0vV0RqS0w3cWl1MVFp?=
 =?utf-8?B?bTFmZUxiY1NrMHhpMnBFS2FjTGU0aktsblhXNWtpc3F4dlRLREpsZlgydGFq?=
 =?utf-8?B?czNLdU44cWg3aFJlbWxRbUJXRWg0NldQWVdDRmtMNVVUUDJoakYwU3VtNUFY?=
 =?utf-8?B?dzkvQWo1MTd3WkRrQmYzMG5ZSTJiTTQ2UU40T3IrQTFNOVg3NCszaHlvSCsv?=
 =?utf-8?B?NVNFL3VQU1dLa3ZkNU44TVQ5Y0FIeXFMeldlWHNiZldwZnJndmFhdzIyekl4?=
 =?utf-8?B?ZU5iS0ExaEZlN2JhblB5UkNndk5ZZ01pWGVCZ3pJU29RQVRtYjBLVk1PaSsw?=
 =?utf-8?B?WDMzTHgvL3RvZUZDSXFIa0xuajFoNjBRQWJpVUJMb21mSUZQTVNwbkZHYUZ6?=
 =?utf-8?B?bWpwaFR1YzY5MW9JVi8vaU9PYTQ5WHNkd0h6ZmNKTk5ubCtJbitOdkdPWWs4?=
 =?utf-8?B?bytTdFNBSXZrdXVEeXR4WWhlQ2M4a2QrSVV1clpOMHNVN0dyQXpSZGJKNVBE?=
 =?utf-8?B?NjhXYy9zRi9OUFVIbkpIcUFaOFE2Ym5BRjFqSlh6N0FtamM3MXB3bW9ka0Vx?=
 =?utf-8?B?QzQvcXVKVUF3aEVnc3dsbmRuNXJFeHJvMjRaMy8xNnBGeCtpOG40NGxMUi8r?=
 =?utf-8?B?Y1ZJc2Q4akFHaTU1clN6ZE9Sa2FGc3pibGxkeDZLR3V0cGtVQlk3M3RjVE42?=
 =?utf-8?B?WWNORzc5UW5PVWUrTm1BTlA1eTdXY0xiR1JmQ0pyR2hOemJra3RZQUtVcHFR?=
 =?utf-8?B?eHNSNytiWnFYSWJVOTZad0VCNThURG5FbGxSbzFxdkV0cWt2YmhjZ01tak96?=
 =?utf-8?B?V0FmckF2Mng2eWd3TUdJNGtDWWd3SytIcXd6RUUxQXp4dlNJdkNHbFZuVE9u?=
 =?utf-8?B?T0thZE5sV3FRUExHWE41M1V5QTlzS01lQ01tSnNNNk1YMm8rd080TlFETG5P?=
 =?utf-8?B?NzIwdHdsMy92bC9jbUNyblp5clJGTm53K3BQSlg4eFR0SjhkTnBEZDFIeEhw?=
 =?utf-8?B?d2FieWhPUS84Q09Kb2xjb0ZFN1V1MGtFajdoNEpEMTJGRFJ2TGNURklBQ3ZO?=
 =?utf-8?B?RFljMkM5ZlZiVjE5R29YT1Jzc3JjaXlYWTV6am5KUis3WkhoSHFDWU4wSlJE?=
 =?utf-8?B?Z29GbHhhOTBWVnRBUXp5OXVucUkxVVY0VytQSzFQNDFsUDNGOEpLdzZEZWN0?=
 =?utf-8?B?TGxCd0NFZk1OQ1R4T2Q3bHB6OHdOclNVTlVFeDRPZUlQKzVEWUw3bWh0RHdi?=
 =?utf-8?Q?90yCTI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHlLWlhiSDhYUkVybTI4Y1NCSlRNcEc4aDl6MFNETlBzM0gxTzQ0Q2trL2Ni?=
 =?utf-8?B?SkErODNBWCsyYWRjejJ6UWtLdDk4WExxOTNyb0tjT3ZrZFBXdTJ3T1Bjd2R5?=
 =?utf-8?B?T1pKeGVVemFqak1ETkt6QTRtaCtmeG42TGYzQngrMjE4eXBNZTV5TXcwMGxk?=
 =?utf-8?B?b0tMY2NETDNNbndjL24wNGx1NjJySU1wdml1bVBTRlBNYkJxQUVaR0hoY2I5?=
 =?utf-8?B?NVdhcDEvTGtqazQ5NUtUYXdxbnVsQ2hkYkREd1VVWkcwRWxtUlB0ZW16VDZ6?=
 =?utf-8?B?YWJTQXhidDExeVE0eU03b09aOGtONXVETUhZNkR4ZDhPRmhVRTFiRmVjT1lw?=
 =?utf-8?B?ZzZzSVI4endEeHptNEVOY28vaUFDOHhSMUE0eHA3NWVCOWJhd1IwU2cyVGRX?=
 =?utf-8?B?M1NhOWFpTVE1cWlES2VYSk42b3hjcHdWWExablNQdVdsT3JYTDNUQ0ZBQUc0?=
 =?utf-8?B?TnRYNDcvQXkwUFdQcEpielRlZnErYlVDWS9WRFIvQ0taSlNXZk1hYkhobVBD?=
 =?utf-8?B?QTJVeFFVNmtadVgyWTZwQTlPN3VKY0swQ3RNNkE1ODdtb1RiZm1pL21oWkRX?=
 =?utf-8?B?VFZpdWUvbEQrWmVNcUlQY1BnNlo2T3BXSDdqaFNTNFBnbnJ0RFpPalZVY0RH?=
 =?utf-8?B?MklFZ2hBNzUvd1dJa1pDZDI0NE1USlVQRUcxWjBaWHJrV1RnSitjY0hhQVQz?=
 =?utf-8?B?dGVtYnYycDhkZUZLWG1pT011emhGVHlha1l2UFNjZURmNWIxWDF1alIwV2Zl?=
 =?utf-8?B?N0cxT1hHaURneGwvcnJRMk5lOGR4UVVLQ0xrdU5HV20yU2FjTTdOcWRWNUhH?=
 =?utf-8?B?SmpXRWlVQURWV215UWYvR3cyTnI2UGxRdHEwd3crN3J5UjcySXovQmkyd1FT?=
 =?utf-8?B?aTN6V0ZTYUUwTW9DV01CbGFFTUlhTjUyRXhEOUVOVk5ySndjcDNMMmNFR0h6?=
 =?utf-8?B?a3hEU1hzOWlBYkl3WUhmNy9XUUdPMTdtM0FieWwrdUdqcFI3L3ZzYThlTlJ2?=
 =?utf-8?B?eFV3L0RzOUMyTXdzVlJ5TjAxazMrMm9jcURlMzJmRmdMNFNTdTJiYmVBN0pl?=
 =?utf-8?B?cWpQZGx3ejRaQnZiNDZMcjE4RXltZkdqNU4xbDRFSTRXWi9KWCtqd1UzOWx1?=
 =?utf-8?B?L01NSGZpR3V5cVBhUXo0bEJpZVVXWUdHcmR5R1JMemg5OFNVT29QSDJSVkgx?=
 =?utf-8?B?OURYVU53ZzZTM1NDVHFxMXQ3dTU2c1Byc1dYV0VodHlXYlUxby9Cdjd4RE5J?=
 =?utf-8?B?a0lTM0xqR3J5TzdKcExHTU1ncVcya2xVQS8vem1XQ1dMVDVoK0NmNit4NmZZ?=
 =?utf-8?B?K0tMYmgrTXBaTkMydG81aE9KQUhJeitOSDdEZlJOTk5vd2gxdGJrRldNNEVk?=
 =?utf-8?B?TUU3S2E5T3QyMm4zVE13UnlMV3E2b3p6dXl6ZUJMQ0lmSmVwKzNDN1cwdFdv?=
 =?utf-8?B?Rm1aL3l4UmN2K1dLU0FFbW4vRTVuWmxtNTFlNEpuRDMweTFUY0xSSXVNN3c2?=
 =?utf-8?B?TkFkSXBvd0JPR0VvUDBOWVAzZVhqeEVZSko5K3NKaDlnOExCYnRoRmx1bWhs?=
 =?utf-8?B?aTVzTG1DQWQ2RDBXOFpJTUFKdnlxOHJtQnVIYzhKUlFnUFVXdjhxQk1xV3lL?=
 =?utf-8?B?dFVhNVV1aUZCVkhxVDV1MktsNC9iUFVhaElOUWxWa0ZTSE1Ua3NjcW80azY1?=
 =?utf-8?B?V0pmTEd0V21wNWtzOGxja0lqbkZqU2pic3VGb1JBNnVQWHQyMlNmQ25IYWh5?=
 =?utf-8?B?QVpiSGNyY1VYRnZHUHBoVURieFBrb05YZlN2TXYra0dxUmhTYkt3bXh6b01s?=
 =?utf-8?B?Z3JSVzloYnJSSUZsVnlSWnJmVm5pSDVzY3NqTFgxU3E0OGN5b2pTdmxzTWdt?=
 =?utf-8?B?dC80d2ZIS2tQWlB3V3R1OHVwcGhqYng5MzNvQnRTQWVWQ2xyNjE3RjF1SXRp?=
 =?utf-8?B?NkY1LzBHQ0U2VHcyR25FeFZNS1EyMzd6M3JGK0FVRHU3TzVvQVdpQkhoaVI5?=
 =?utf-8?B?QlJIMUl1Ukl5K01weXFYWk8wM3YwRE1LcUdXNGd1emhlbjY0a3VIQURibjRJ?=
 =?utf-8?B?QzI5TzZzVS9GVkZxbmFld1lKNDk4ZkEyVHZUNzEyVEt2eTAxZ2p2R0dlZXNF?=
 =?utf-8?Q?uREuDOP1SDp5StqiBkN9WMvQP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e005aec6-2a67-40f5-889f-08de266afaf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:23:25.1898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fd4PHPjnARyTvzIDqw+70NywbNSAosQcphObDQDtTXjzEjyhvnUImqN3tKANnJrM+ttmF7NAaeLXvcLnWirCog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

PiBTdWJqZWN0OiBbdjYgMDUvMTZdIGRybS9pOTE1L2NvbG9yOiBDcmVhdGUgYSB0cmFuc2ZlciBm
dW5jdGlvbiBjb2xvciBwaXBlbGluZQ0KPiANCj4gRnJvbTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFo
IDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiANCj4gQWRkIGEgY29sb3IgcGlw
ZWxpbmUgd2l0aCB0aHJlZSBjb2xvcm9wcyBpbiB0aGUgc2VxdWVuY2UNCj4gDQo+ICAgICAgICAg
MUQgTFVUIC0gM3g0IENUTSAtIDFEIExVVA0KPiANCj4gVGhpcyBwaXBlbGluZSBjYW4gYmUgdXNl
ZCB0byBkbyBhbnkgY29sb3Igc3BhY2UgY29udmVyc2lvbiBvciBIRFIgdG9uZQ0KPiBtYXBwaW5n
DQo+IA0KPiB2MjogQ2hhbmdlIG5hbWVzcGFjZSB0byBkcm1fcGxhbmVfY29sb3JvcCoNCj4gdjM6
IFVzZSBzaW1wbGVyL3ByZS1leGlzdGluZyBjb2xvcm9wcyBmb3IgZmlyc3QgaXRlcmF0aW9uDQo+
IHY0Og0KPiAgLSBzLypfdGZfKi8qX2NvbG9yXyogKEphbmkpDQo+ICAtIFJlZmFjdG9yIHRvIHNl
cGFyYXRlIGZpbGVzIChKYW5pKQ0KPiAgLSBBZGQgbWlzc2luZyBzcGFjZSBpbiBjb21tZW50IChT
dXJhaikNCj4gIC0gQ29uc29saWRhdGUgcGF0Y2ggdGhhdCBhZGRzL2F0dGFjaGVzIHBpcGVsaW5l
IHByb3BlcnR5DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3VtYXIgQm9yYWggPGNoYWl0
YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIC4uLi9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmMgICB8IDEwMSArKysrKysrKysrKysrKysrKysNCj4g
IC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmggICB8ICAxMyArKysN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSAr
DQo+ICA0IGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvcl9waXBlbGluZS5j
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9jb2xvcl9waXBlbGluZS5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZQ0KPiBpbmRleCBiMmY1
OTFlMTU2Y2IuLjhlMTg3NTUzODgzMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gQEAg
LTIzOSw2ICsyMzksNyBAQCBpOTE1LXkgKz0gXA0KPiAgCWRpc3BsYXkvaW50ZWxfY210Zy5vIFwN
Cj4gIAlkaXNwbGF5L2ludGVsX2NvbG9yLm8gXA0KPiAgCWRpc3BsYXkvaW50ZWxfY29sb3JvcC5v
IFwNCj4gKwlkaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLm8gXA0KPiAgCWRpc3BsYXkvaW50
ZWxfY29tYm9fcGh5Lm8gXA0KPiAgCWRpc3BsYXkvaW50ZWxfY29ubmVjdG9yLm8gXA0KPiAgCWRp
c3BsYXkvaW50ZWxfY3J0Yy5vIFwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmI2ZTZlYmRkMGRmZg0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0K
PiBAQCAtMCwwICsxLDEwMSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0K
PiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8N
Cj4gKyNpbmNsdWRlICJpbnRlbF9jb2xvcm9wLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfY29sb3Jf
cGlwZWxpbmUuaCINCj4gKyNpbmNsdWRlICJpbnRlbF9kZS5oIg0KPiArI2luY2x1ZGUgImludGVs
X2Rpc3BsYXlfdHlwZXMuaCINCj4gKyNpbmNsdWRlICJza2xfdW5pdmVyc2FsX3BsYW5lLmgiDQo+
ICsNCj4gKyNkZWZpbmUgTUFYX0NPTE9SX1BJUEVMSU5FUyA1DQoNCk1ha2UgdGhpcyBOVU1fQ09M
T1JfUElQRUxJTkVTIDINCk5vIHBvaW50IGluIGF0dGFjaGluZyBwaXBlbGluZVs1XSB3aGVuIHlv
dSBvbmx5IHVzZSBhbHNvIGl0IGRvZXMgbm90DQpBY3R1YWxseSByZWZsZWN0IGFueSBIL1cgbGlt
aXRhdGlvbnMNCldoZW4gbW9yZSBwaXBlbGluZXMgYXJlIGFkZGVkIGl0IGNhbiBiZSBjaGFuZ2Vk
IGFjY29yZGluZ2x5DQoNCj4gKyNkZWZpbmUgUExBTkVfREVHQU1NQV9TSVpFIDEyOA0KPiArI2Rl
ZmluZSBQTEFORV9HQU1NQV9TSVpFIDMyDQo+ICsNCj4gK3N0YXRpYw0KPiAraW50IF9pbnRlbF9j
b2xvcl9waXBlbGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QN
Cj4gK2RybV9wcm9wX2VudW1fbGlzdCAqbGlzdCkgew0KPiArCXN0cnVjdCBpbnRlbF9jb2xvcm9w
ICpjb2xvcm9wOw0KPiArCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwbGFuZS0+ZGV2Ow0KPiAr
CWludCByZXQ7DQo+ICsJc3RydWN0IGRybV9jb2xvcm9wICpwcmV2X29wOw0KPiArDQo+ICsJY29s
b3JvcCA9IGludGVsX2NvbG9yb3BfY3JlYXRlKElOVEVMX1BMQU5FX0NCX1BSRV9DU0NfTFVUKTsN
Cj4gKw0KPiArCXJldCA9IGRybV9wbGFuZV9jb2xvcm9wX2N1cnZlXzFkX2x1dF9pbml0KGRldiwg
JmNvbG9yb3AtPmJhc2UsDQo+IHBsYW5lLA0KPiArCQkJCQkJICBQTEFORV9ERUdBTU1BX1NJWkUs
DQo+ICsNCj4gRFJNX0NPTE9ST1BfTFVUMURfSU5URVJQT0xBVElPTl9MSU5FQVIsDQo+ICsNCj4g
RFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBBU1MpOw0KPiArDQo+ICsJaWYgKHJldCkNCj4gKwkJ
cmV0dXJuIHJldDsNCj4gKw0KPiArCWxpc3QtPnR5cGUgPSBjb2xvcm9wLT5iYXNlLmJhc2UuaWQ7
DQo+ICsJbGlzdC0+bmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiQ29sb3IgUGlwZWxpbmUg
JWQiLA0KPiArY29sb3JvcC0+YmFzZS5iYXNlLmlkKTsNCj4gKw0KPiArCS8qIFRPRE86IGhhbmRs
ZSBmYWlsdXJlcyBhbmQgY2xlYW4gdXAgKi8NCj4gKwlwcmV2X29wID0gJmNvbG9yb3AtPmJhc2U7
DQo+ICsNCj4gKwljb2xvcm9wID0gaW50ZWxfY29sb3JvcF9jcmVhdGUoSU5URUxfUExBTkVfQ0Jf
Q1NDKTsNCj4gKwlyZXQgPSBkcm1fcGxhbmVfY29sb3JvcF9jdG1fM3g0X2luaXQoZGV2LCAmY29s
b3JvcC0+YmFzZSwgcGxhbmUsDQo+ICsNCj4gRFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBBU1Mp
Ow0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlkcm1fY29sb3JvcF9z
ZXRfbmV4dF9wcm9wZXJ0eShwcmV2X29wLCAmY29sb3JvcC0+YmFzZSk7DQo+ICsJcHJldl9vcCA9
ICZjb2xvcm9wLT5iYXNlOw0KPiArDQo+ICsJY29sb3JvcCA9IGludGVsX2NvbG9yb3BfY3JlYXRl
KElOVEVMX1BMQU5FX0NCX1BPU1RfQ1NDX0xVVCk7DQo+ICsJcmV0ID0gZHJtX3BsYW5lX2NvbG9y
b3BfY3VydmVfMWRfbHV0X2luaXQoZGV2LCAmY29sb3JvcC0+YmFzZSwNCj4gcGxhbmUsDQo+ICsJ
CQkJCQkgIFBMQU5FX0dBTU1BX1NJWkUsDQo+ICsNCj4gRFJNX0NPTE9ST1BfTFVUMURfSU5URVJQ
T0xBVElPTl9MSU5FQVIsDQo+ICsNCj4gRFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBBU1MpOw0K
PiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlkcm1fY29sb3JvcF9zZXRf
bmV4dF9wcm9wZXJ0eShwcmV2X29wLCAmY29sb3JvcC0+YmFzZSk7DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gK30NCj4gKw0KPiAraW50IGludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2luaXQoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUpIHsNCj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGxh
bmUtPmRldjsNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rp
c3BsYXkoZGV2KTsNCj4gKwlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wOw0KPiArCXN0cnVjdCBk
cm1fcHJvcF9lbnVtX2xpc3QgcGlwZWxpbmVzW01BWF9DT0xPUl9QSVBFTElORVNdOw0KPiArCWlu
dCBsZW4gPSAwOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwkvKiBDdXJyZW50bHkgZXhwb3NlIHBp
cGVsaW5lIG9ubHkgZm9yIEhEUiBwbGFuZXMgKi8NCj4gKwlpZiAoIWljbF9pc19oZHJfcGxhbmUo
ZGlzcGxheSwgdG9faW50ZWxfcGxhbmUocGxhbmUpLT5pZCkpDQo+ICsJCXJldHVybiAwOw0KPiAr
DQo+ICsJLyogQWRkICJCeXBhc3MiIChpLmUuIE5VTEwpIHBpcGVsaW5lICovDQo+ICsJcGlwZWxp
bmVzW2xlbl0udHlwZSA9IDA7DQo+ICsJcGlwZWxpbmVzW2xlbl0ubmFtZSA9ICJCeXBhc3MiOw0K
PiArCWxlbisrOw0KPiArDQo+ICsJLyogQWRkIHBpcGVsaW5lIGNvbnNpc3Rpbmcgb2YgdHJhbnNm
ZXIgZnVuY3Rpb25zICovDQo+ICsJcmV0ID0gX2ludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2lu
aXQocGxhbmUsICZwaXBlbGluZXNbbGVuXSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKwlsZW4rKzsNCj4gKw0KPiArCS8qIENyZWF0ZSBDT0xPUl9QSVBFTElORSBwcm9wZXJ0
eSBhbmQgYXR0YWNoICovDQo+ICsJcHJvcCA9IGRybV9wcm9wZXJ0eV9jcmVhdGVfZW51bShkZXYs
DQo+IERSTV9NT0RFX1BST1BfQVRPTUlDLA0KPiArCQkJCQkiQ09MT1JfUElQRUxJTkUiLA0KPiAr
CQkJCQlwaXBlbGluZXMsIGxlbik7DQo+ICsJaWYgKCFwcm9wKQ0KPiArCQlyZXR1cm4gLUVOT01F
TTsNCj4gKw0KPiArCXBsYW5lLT5jb2xvcl9waXBlbGluZV9wcm9wZXJ0eSA9IHByb3A7DQo+ICsN
Cj4gKwlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIHByb3AsIDApOw0K
PiArDQo+ICsJLyogVE9ETyBjaGVjayBpZiBuZWVkZWQgKi8NCj4gKwlpZiAocGxhbmUtPnN0YXRl
KQ0KPiArCQlwbGFuZS0+c3RhdGUtPmNvbG9yX3BpcGVsaW5lID0gTlVMTDsNCg0KSSBrbm93IHlv
dSBoYXZlIGFkZGVkIGEgVE9ETyBoZXJlIGJ1dA0KSSBkb27igJl0IGdldCB3aHkgaXMgdGhpcyBh
ZGRlZCBzaG91bGQgdGhpcyBub3QgYmUgaGFwcGVuaW5nIGR1cmluZyBzb21lDQpBdG9taWNfZHVw
bGljYXRlX3N0YXRlIG9yIHNvbWV0aGluZy4NCkFsc28gaXQgc2hvdWxkIGJlICpUT0RPOg0KDQpS
ZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxp
bmUuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxp
bmUuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdmMWQz
MmJjOTIwMg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuaA0KPiBAQCAtMCwwICsxLDEzIEBADQo+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKp
IDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fSU5URUxf
Q09MT1JfUElQRUxJTkVfSF9fDQo+ICsjZGVmaW5lIF9fSU5URUxfQ09MT1JfUElQRUxJTkVfSF9f
DQo+ICsNCj4gK3N0cnVjdCBkcm1fcGxhbmU7DQo+ICsNCj4gK2ludCBpbnRlbF9jb2xvcl9waXBl
bGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKTsNCj4gKw0KPiArI2VuZGlm
IC8qIF9fSU5URUxfQ09MT1JfUElQRUxJTkVfSF9fICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gaW5k
ZXggYzg5Y2FmYmQwMGZhLi5kZmI4ZjAwOTQwYWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4g
QEAgLTI0MSw2ICsyNDEsNyBAQCB4ZS0kKENPTkZJR19EUk1fWEVfRElTUExBWSkgKz0gXA0KPiAg
CWk5MTUtZGlzcGxheS9pbnRlbF9jbXRnLm8gXA0KPiAgCWk5MTUtZGlzcGxheS9pbnRlbF9jb2xv
ci5vIFwNCj4gIAlpOTE1LWRpc3BsYXkvaW50ZWxfY29sb3JvcC5vIFwNCj4gKwlpOTE1LWRpc3Bs
YXkvaW50ZWxfY29sb3JfcGlwZWxpbmUubyBcDQo+ICAJaTkxNS1kaXNwbGF5L2ludGVsX2NvbWJv
X3BoeS5vIFwNCj4gIAlpOTE1LWRpc3BsYXkvaW50ZWxfY29ubmVjdG9yLm8gXA0KPiAgCWk5MTUt
ZGlzcGxheS9pbnRlbF9jcnRjLm8gXA0KPiAtLQ0KPiAyLjUwLjENCg0K
