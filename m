Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5DFC54CC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 00:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102C10E034;
	Wed, 12 Nov 2025 23:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oly58k3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BDE10E034;
 Wed, 12 Nov 2025 23:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762989808; x=1794525808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tJ19prhOJfGNdGEgl0hE9LWYett1DNCfURjpa48XSuQ=;
 b=Oly58k3BWotveQb/u2WOEzX28CCwE7LTHJOYYkAujBa4STl1Po4xtmQb
 enmfgVFD9k3dl4NBtmANs7BgZwM++RIeaZCDoPgYLFhemFPd1Pm3H+32V
 2M5+3mIS75wInn65i+mFxlXEqvioiavsTrELphofQjsCxHQ0dZ7jFQ/Gs
 QqiOHmcSnwMqJPQq/Xsy7ZC7HhAtAvWBYMF0n/QuKOoTj6pXzoav1HPAs
 dPtRqjVvAjMH6HH/ypqKD+nj+N/lNIIoqh99Hdov7Sf3RsMY67OFuqYYx
 kGJbps2l+m+8D66KGvKOTkEnTDS7w7CyxTLep0XbBCNRmoE+WnvPdwbKJ Q==;
X-CSE-ConnectionGUID: K65n1GmeQHmpAnMPWKEoQA==
X-CSE-MsgGUID: aSfFpl8xTf2EubBqh0h29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64999052"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64999052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:23:16 -0800
X-CSE-ConnectionGUID: McTzggSHSCuJnNEdX1h9Ig==
X-CSE-MsgGUID: 2nG/l4tBT/G8efhWknTluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189626936"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 15:23:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 15:23:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 15:23:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 15:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmYZg4JZmDFyWEU589L2XDLZ0RI7bGRemSFigfmPVezi810Ch9ekPR0NOESvTfbDR2GShrHXneAWIxEUqC1YWakTVFe+/7mBGsypOUmWk43ZB5J8Nb+1a+W8PisFH+z6atdlBzCwuDusOhxCE9lF9q0Fj6TVlFruCQiHZ5yeMyZdV1sBCkDoOFOfgXdPN0y9MnK8vrxH/Ud2VvzNZ4qZuUxiu7lgKOx1UfSrhizwQg4Y7xlI2lOyG/D5Xe0oGgrf50rhPPqdTVJLcx+3WU46IOL5USrjtjdhpQUZmDBtW0pHV04PAGK1j+uJjy6jeJz22r2kLO+8Ie3xIyluMUnGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ19prhOJfGNdGEgl0hE9LWYett1DNCfURjpa48XSuQ=;
 b=x4061sAbykayiV5b+Qgaaejk6H1bxhBGDD9yc2sUS14lxR/QtQziNiuL0O8I5mbclHV4FIcmGXJyEOoIWJNEe9m5qNPs9hPgcvLaBqUJXH0XmCJUPIUfuC9Bauf77yybC92zdw706bAFIffjQQd6SVhjZ0Ekh0askcb75AmZlRZ1MXlGTG10gw3+pHH7/0ZTWotle50UHdUlpL/mROZPC0/wWVNI3PyXu0AEGkZYdXUd5DSBV1xF89QtDvCbAB/Q1G2FbXM2XM1/uwB0R+jEUyDvvjwRS0/4gHdwpc1Z397kaq+UNIfzvdj4Pk1pGXduYHPIXGQD7eoxnenPuQ9T9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 23:22:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 23:22:56 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 13/24] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Thread-Topic: [PATCH 13/24] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
Thread-Index: AQHcU9eTxy3WCF4KDUSR4nReHpEhE7TvaKwAgABD+YCAAAIwgA==
Date: Wed, 12 Nov 2025 23:22:56 +0000
Message-ID: <a0f9871689abe6bb780d7abe59ad03d3c2992823.camel@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
 <20251112132220.516975-14-michal.winiarski@intel.com>
 <aRTb7nvT1jpd_k-h@intel.com>
 <akkdrkhzypmqbnazyek7htd5r4umg6en74mnuoamyn6ju3didy@54ysh52vthmf>
In-Reply-To: <akkdrkhzypmqbnazyek7htd5r4umg6en74mnuoamyn6ju3didy@54ysh52vthmf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|CH3PR11MB8186:EE_
x-ms-office365-filtering-correlation-id: 1bc4f93f-b82c-414c-0cea-08de2242695e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RE5GakVkN2swZExoUkx0NW1tNzAxNkxXQnowN1J4aSs5TFFkRnFxd2ZWaklh?=
 =?utf-8?B?MmtPeVJWalhVdHF4ZVpWd0QzclNadEtudXIwRlcrYks4MnZJRE1nVFh3OVY5?=
 =?utf-8?B?Ri9rM2ZvK1BtT0JvSUR0d0swZm1YN3NzU0Y3N1hhblptQVRmKzEzTWpwU0Mw?=
 =?utf-8?B?Snd2Yk9oTXMrOWJiTVUzNHdwUWlqZGI2b1JiWXBaQ2tYNDFHdUh3aDUwNlN0?=
 =?utf-8?B?VXdyeFJMQXZiUXhwQTFxZVdEcGhQVmw0NzlZb2VUSzVBZ1FONktPZERwcWpu?=
 =?utf-8?B?SjU0azVXaDJyMVNLeThzeDJRMkxmN2NDWDlTTU1hZGJhdldUakI0RlZSQ2Nl?=
 =?utf-8?B?VFlRNU85ZUhlbTBPZFlLVzIzRzFsa2UyNy9UUGdYNSt3SGYwU0xTU0hySTJj?=
 =?utf-8?B?WVdIb3FNSmZDV0NTRzVDeUhva0N5TGxzOG91USs5U01zWjBsekFucWZOcVlR?=
 =?utf-8?B?OGQ3azByS3prdE8rdlRyc2V6QzhGUFh5b0RzbG40NE4reE1EOGNIR2xzTWpW?=
 =?utf-8?B?T2pCSkkxbVFqYmZieFpKcVppRS8rTzFTakpIa1RrLzhOTXg4dko5am95dXhI?=
 =?utf-8?B?aU1GeWZWWlZTQ1NSTFk2a0xpTWRKOSs3M2wvVlJCdzdhT3NsdzZxdUtWNjRP?=
 =?utf-8?B?M3dBOG11eEJKT2hBYkhIdHgvYm1aT3JkRHlBUGl3Z0ZVTmwyeGNaOG9uU2lU?=
 =?utf-8?B?VVowcE9aWUN3MEFiWDFmNGJFNUUvVWNsTzFQd0VxakUrYXJkSTdsUmFmU00v?=
 =?utf-8?B?VHFTVlFJMGMyZDk5TEVtM05YZE4zOWRyK09zbVhDcGdpNlhuUDB4SkUxREla?=
 =?utf-8?B?RjYrN0oyak1sdnk1dVp0WFVRa3hyQms1bGVjTnNUYm5sRkYxT2pUYTZ2Zmky?=
 =?utf-8?B?U1pKTWtQcDdXWDJzSXBWRzVBMERHejcrUlI2RTMxeHBUMlp6RG5IbUhTeU1C?=
 =?utf-8?B?dEc0aXdzTVQvZGxUZitGcG9FNHNRR2w0R3ZidHdhVVpMYUd6RmNrODh0UW42?=
 =?utf-8?B?YTRod1U4VUhIdFV6NFYrZkVpQXBZUHM1Z28rdi9iK3lseHp3dHpkUzdGSlN5?=
 =?utf-8?B?WS9PL2pFM3VOSktiTCtIcTIwRlM0MGhQL3JxRzdaWGpxMVFjbGR4SGRPREJS?=
 =?utf-8?B?NzU3SHN6cEdkTFhmQ2VEWjJ6amFKYUY0WHBoYkF1a3dlT25YMENiRUZ1M2J1?=
 =?utf-8?B?bEkxZURZMjc1bktlQ1BGUkVaYXFlczZZZWpNSzlVS0ZoTE1aOHpJSkM4V0dl?=
 =?utf-8?B?elhSOFlibDFlNHVtRFRrM2kxSCtYb21HRy9CTWQyMTBRVFRVMytrTHJJTEd2?=
 =?utf-8?B?K1lEcHdSanB2ZkhQajArcEFvajZiL1VYcktKU3FkTHFGTlJNeTE0bS9landW?=
 =?utf-8?B?Rm0rZmtMckJ1YzFGYkpOZndReGVKODFUSTdaYmk3Z1JTem1KV0h0WU1PYXdQ?=
 =?utf-8?B?T2RFQVZBMTFGNWcwbktrREVWS1JPUUNBNmdkK0JvaWFkL2FXQzkybkUzdFMr?=
 =?utf-8?B?eEFhV3dYQUlLVWdqSjBFejRGRFVhY3lHWXp1aTVjQ2pBMEpHSlo2MHkwQU1Z?=
 =?utf-8?B?ZURueTlIc0w2OElWSDBBYVdRaDBpZ0l6bGZRN3FoN2h6MDhlMWMyTlBmSHRL?=
 =?utf-8?B?SGhRblR1amNDT3hDZkhuSjdIZ01Md2tmM2NPYkowaTZKOEJKZTMrTk9WRHdt?=
 =?utf-8?B?ZjJpVnpqWEdwRDUzVEVNRDZua2FCZ05MbUx6cS9GaGlMeExXbldNQ3FCbFl4?=
 =?utf-8?B?cVFJb1VxZ0k2V2ZIcE1BTmg5Qjc2TzQ3RllubEFkUjNzYVBPTWw4NlNUYmRN?=
 =?utf-8?B?c3ZzK0hKWkFkUmgvbXd6YjZjclVsdXhUQ09nTmZBSVJJTTV2V3MyeGJUR2tX?=
 =?utf-8?B?dUhSODU3TWV5cmlleCswM0tOK0VvSXRLMlMvVW1vNUtlb0tuZ2dNNTRCTmdF?=
 =?utf-8?B?dE9YSVBzUysxNU5GZGliUHV3amhTeEJBbkUvOGJwZTlLWWNyMXdGNUFseWZa?=
 =?utf-8?B?SkZSZEcvRzV4UmhzbG5JNCtFUjZVQlhacGNzcWtMN1FUYzdCNFc3dVFXSFRa?=
 =?utf-8?Q?T6FZrz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHYxb25kakxrVTlaM0JsZy9uTUJFVDFzMWt4WVJZRUV2cU4zbW1qR2lYY1k2?=
 =?utf-8?B?Q0ZFbVpJeFU4MktaL3lZcDB0bFVrZTFLUHVTRitDMmdwWGFmVTh6cWg5WG9C?=
 =?utf-8?B?K0Vad0VpMFRFcDNsbnlmejJpeTUzblNSOHpLVExJOGtmUklOb2d6dnBUMFZN?=
 =?utf-8?B?T0NZejZremlObmlMcXBuNHl5dEZDc1BmbUJ4N0lXcWwreDVJelBzWjlZaVJK?=
 =?utf-8?B?Z2dLYUs0MnBsRkt2ejRUcG9uWlZERjZwS1NXZTR0VEdSREFmWHdQTnRvenl3?=
 =?utf-8?B?QzJRdXQ5N1ZrbDllbGg2WnRsT3IyTEJSc2hCRERwNm5TaGZjdWlid0NhMDJj?=
 =?utf-8?B?QkVpRTlQTkZtaEp1ekNZUXhYVDdtSmxLQWRMZGh6Wk5SZVVScEZrdStROEdF?=
 =?utf-8?B?cFZTWTYyRnU2Nk5nZjM2Uzcva21OaTJJZ0VFRTF4UXBjbjBTakFVblZFZmhP?=
 =?utf-8?B?VG40OU9kTlY0N3lFSGZGSmxkd2p5NE9JendlRlZqYndxekt2S3FnUjFlUUlE?=
 =?utf-8?B?eUowTXBTM3Yxc2hZckdLOWdJdVRSUC8rVmZER1E0bTZncTQvRGxtOTQ5WHlk?=
 =?utf-8?B?dWxxNTJlTmtiMGp2bmFRM2gxbmRwdzFUR0hFN2pzZlJPRjRxUjlvSXNsNjJv?=
 =?utf-8?B?a1ZuMFl3N09KZEtYQVQ1SFJqdE5iZk0weS9RQmUwU2xZc0ZKMUtiQVlqeHZw?=
 =?utf-8?B?elRReEZkWmppS3liUDVqZnpqb2tRUFQvUzBBNWdGcUtyQUJadXUrdTZIUWUx?=
 =?utf-8?B?aDJPa3BrN0p0NGFBSnFsVTZGN3BNOXdPekFQclFFSitvblBYK3VQQ3VNaXhq?=
 =?utf-8?B?QlVMMTBiRXJSbGhRdE41bk1oN0VxbDdWN2x0cUcreXRONzk4dEx5eHFPVXlU?=
 =?utf-8?B?K2JydWNxS213dStHZWdIVUtoZ1hYZmRYMUtsRGRLUk4zOFZuTUY3ZzFzRnpU?=
 =?utf-8?B?eHhMSmovWTJ3N0owRHZINVBtR1RENU9tL3J4ckpLak1vNjQvR095S2puQmFO?=
 =?utf-8?B?SVpmUDhZbmZZTFB0VUFOQVEwNGc5RUxrM0RIWmtrOWpLWHEyRkhTQU41NEVo?=
 =?utf-8?B?YmsvK2xsMUlkQ2Q2c1RuNzR3Z0xUU096TW93bG9yNGtqSHBlUmJJUzgxKzE3?=
 =?utf-8?B?Smthbms1Vm1kK3JmOTB2WWZiaEFRaXRJV0xyUCsvTTNwSEl5OXpnaURjNnJy?=
 =?utf-8?B?Mk11blc1SUZKbXBGVFk2WExaa1VYbmhPQlZJRDM5UnNRZ1EyUzRaWkwwdndu?=
 =?utf-8?B?M2l6TUVxM0NOSGhXcWk0QWZNbU9Fdlg0bnpBSHpLMWdmTDJnNkMwemhDbURx?=
 =?utf-8?B?MnNUWFJ1b1d4Qmc4VlhoYnN2V3ZwUzBBV0pqSVhxdkloZkIrNGhyd3VFZ2kz?=
 =?utf-8?B?RE41azhlTnZQNlJsR0pEVGJJK3Y3RS91WDRSdzhvS09vOTBJNGh4aGRMRHJn?=
 =?utf-8?B?UHV6UGIwSVlJU3huY1pGTmNwT0lQanBPUVNuNmtHQllud2Z0MGxlVHRBVFQ5?=
 =?utf-8?B?RWRMRENObUtPdnhMNWxFbzM0YnJXbmQ5aThVdCtRMFBYb2RFalFRb2RKeFA2?=
 =?utf-8?B?Wm9aRlF2bFowODE1azZRSCt6TVhMSWlYZ2lkYk5NTDF6bEZjdEpQdkRZQjBy?=
 =?utf-8?B?WmdBS1lzYnlFYmJRUkdseHQ1Q2NhV0dOazk5UkRWRkxYMndkUVM2OFk0SEp5?=
 =?utf-8?B?ajdXYTlkeTFhWlhCaG1Gclc1S25OWVM3bGY1MW44d3ljWkFWM3Y4MDhmbWIw?=
 =?utf-8?B?OURGZXI5NWFxejdXbjNnK0RtcVErck5qc2oyUEhzOENrY01VbHBzT2ZZKzRl?=
 =?utf-8?B?bDBnNmsyRGY1ZVBiMkZVVEVoOFZFeVpQYlE2S1BsM0ZRYVhxektJS3oxRUFP?=
 =?utf-8?B?RFEzdW5mQitvWm5oRTliYTN3NWtNNlhHa0dVZERQS3UremVOR1JHdlQrTUNI?=
 =?utf-8?B?K0hmQmFqNllzUWJFWTd3elpNYkhuOUg0eTJJNmVVSFJOSjk3NlA5Umwxck4w?=
 =?utf-8?B?NFpPT3BJN0NkQjA2OElUaHBjOGhhRTRwRCs4Q09GdER5RjN4VTNja0wrMVRw?=
 =?utf-8?B?bnlnSkE5R3ppME55RDVXQzFjQTdPYnNxZ21Ta1Vud2tsbFZVc0J2OS9vcFZP?=
 =?utf-8?B?c2hSRmsrMTQzWkdRUHp6TktlWVBFaWRlN1JxbTFWSTJUR0p3RjNYbnlEdWg3?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C6F928270F98F40A79379CDF52C5C5A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc4f93f-b82c-414c-0cea-08de2242695e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 23:22:56.3822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OJl4AC9ngYi8MKW9cuA9SXgnZJ0Fke+8QxcRcVUXQbK+yqb5jkgzJFWtsLaxjUfgBFV7bY4LRmgU8ye0sDx/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDAwOjE0ICswMTAwLCBNaWNoYcWCIFdpbmlhcnNraSB3cm90
ZToNCj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMDI6MTE6NDJQTSAtMDUwMCwgUm9kcmlnbyBW
aXZpIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDEyLCAyMDI1IGF0IDAyOjIyOjA5UE0gKzAxMDAs
IE1pY2hhxYIgV2luaWFyc2tpIHdyb3RlOg0KPiA+ID4gSW4gdXBjb21pbmcgY2hhbmdlcywgU1It
SU9WIFZGIG1pZ3JhdGlvbiBkYXRhIHdpbGwgYmUgZXh0ZW5kZWQNCj4gPiA+IGJleW9uZA0KPiA+
ID4gR3VDIGRhdGEgYW5kIGV4cG9ydGVkIHRvIHVzZXJzcGFjZSB1c2luZyBWRklPIGludGVyZmFj
ZSAod2l0aCBhDQo+ID4gPiB2ZW5kb3Itc3BlY2lmaWMgdmFyaWFudCBkcml2ZXIpIGFuZCBhIGRl
dmljZS1sZXZlbCBkZWJ1Z2ZzDQo+ID4gPiBpbnRlcmZhY2UuDQo+ID4gPiBSZW1vdmUgdGhlIEdU
LWxldmVsIGRlYnVnZnMuDQo+ID4gDQo+ID4gUGVyaGFwcyB0aGlzIHNob3VsZCBiZSByZXRhaW5l
ZCB3aGlsZSB3ZSBkb24ndCBoYXZlIHRoZSB4ZS12ZmlvPw0KPiANCj4gVGhlIHNlcmllcyBhZGRz
IGRldmljZS1sZXZlbCBkZWJ1Z2ZzLCB3aGljaCBsZXQncyB1cyBnZXQgdGhlDQo+IGJpdHN0cmVh
bQ0KPiB3aXRoIGFsbCBvZiB0aGUgcmVzb3VyY2VzIChHdUMvTU1JTy9WUkFNL0dHVFQpLCBmcm9t
IGFsbCBHVHMuDQo+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCBhIHBlci1HVCBjb250cm9sIGZvciBv
bmx5IHRoZSBHdUMgbWlncmF0aW9uDQo+IGRhdGEuDQo+IEFuZCBpZiBpdCdzIG5lZWRlZCAtIGl0
IGNvdWxkIGJlIGV4dHJhY3RlZCBmcm9tIHRoZSBmdWxsIGJpdHN0cmVhbS4NCg0KSXQgbWFrZXMg
c2Vuc2UuIFBsZWFzZSBpZ25vcmUgbXkgcHJldmlvdXMgY29tbWVudC4NCg0KPiANCj4gVGhhbmtz
LA0KPiAtTWljaGHFgg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlj
aGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPg0KPiA+ID4gUmV2aWV3
ZWQtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9kZWJ1Z2Zz
LmMgfCA0NyAtLS0tLS0tLS0tLS0tLS0NCj4gPiA+IC0tLS0tLQ0KPiA+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgNDcgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfZGVidWdmcy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9kZWJ1Z2ZzLmMNCj4gPiA+IGluZGV4IDgzOGJlYjdmNjMy
N2YuLjUyNzhlYTRmZDY1NTIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3Rfc3Jpb3ZfcGZfZGVidWdmcy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3Rfc3Jpb3ZfcGZfZGVidWdmcy5jDQo+ID4gPiBAQCAtMzI3LDkgKzMyNyw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgew0KPiA+ID4gwqAJeyAic3RvcCIsIHhlX2d0X3NyaW92X3BmX2NvbnRy
b2xfc3RvcF92ZiB9LA0KPiA+ID4gwqAJeyAicGF1c2UiLCB4ZV9ndF9zcmlvdl9wZl9jb250cm9s
X3BhdXNlX3ZmIH0sDQo+ID4gPiDCoAl7ICJyZXN1bWUiLCB4ZV9ndF9zcmlvdl9wZl9jb250cm9s
X3Jlc3VtZV92ZiB9LA0KPiA+ID4gLSNpZmRlZiBDT05GSUdfRFJNX1hFX0RFQlVHX1NSSU9WDQo+
ID4gPiAtCXsgInJlc3RvcmUhIiwgeGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uX3Jlc3RvcmVfZ3Vj
X3N0YXRlDQo+ID4gPiB9LA0KPiA+ID4gLSNlbmRpZg0KPiA+ID4gwqB9Ow0KPiA+ID4gwqANCj4g
PiA+IMKgc3RhdGljIHNzaXplX3QgY29udHJvbF93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29u
c3QgY2hhcg0KPiA+ID4gX191c2VyICpidWYsIHNpemVfdCBjb3VudCwgbG9mZl90ICpwb3MpDQo+
ID4gPiBAQCAtMzkzLDQ3ICszOTAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0
aW9ucw0KPiA+ID4gY29udHJvbF9vcHMgPSB7DQo+ID4gPiDCoAkubGxzZWVrCQk9IGRlZmF1bHRf
bGxzZWVrLA0KPiA+ID4gwqB9Ow0KPiA+ID4gwqANCj4gPiA+IC0vKg0KPiA+ID4gLSAqwqDCoMKg
wqDCoCAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvQkRGLw0KPiA+ID4gLSAqwqDCoMKgwqDCoCDilJzi
lIDilIAgc3Jpb3YNCj4gPiA+IC0gKsKgwqDCoMKgwqAgOsKgwqAg4pSc4pSA4pSAIHZmMQ0KPiA+
ID4gLSAqwqDCoMKgwqDCoMKgwqDCoMKgIDrCoMKgIOKUnOKUgOKUgCB0aWxlMA0KPiA+ID4gLSAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOsKgwqAg4pSc4pSA4pSAIGd0MA0KPiA+ID4gLSAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6wqDCoCDilJzilIDilIAgZ3VjX3N0
YXRlDQo+ID4gPiAtICovDQo+ID4gPiAtDQo+ID4gPiAtc3RhdGljIHNzaXplX3QgZ3VjX3N0YXRl
X3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyDQo+ID4gPiAqYnVmLA0KPiA+ID4g
LQkJCcKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBvcykNCj4gPiA+IC17DQo+ID4g
PiAtCXN0cnVjdCBkZW50cnkgKmRlbnQgPSBmaWxlX2RlbnRyeShmaWxlKTsNCj4gPiA+IC0Jc3Ry
dWN0IGRlbnRyeSAqcGFyZW50ID0gZGVudC0+ZF9wYXJlbnQ7DQo+ID4gPiAtCXN0cnVjdCB4ZV9n
dCAqZ3QgPSBleHRyYWN0X2d0KHBhcmVudCk7DQo+ID4gPiAtCXVuc2lnbmVkIGludCB2ZmlkID0g
ZXh0cmFjdF92ZmlkKHBhcmVudCk7DQo+ID4gPiAtDQo+ID4gPiAtCXJldHVybiB4ZV9ndF9zcmlv
dl9wZl9taWdyYXRpb25fcmVhZF9ndWNfc3RhdGUoZ3QsIHZmaWQsDQo+ID4gPiBidWYsIGNvdW50
LCBwb3MpOw0KPiA+ID4gLX0NCj4gPiA+IC0NCj4gPiA+IC1zdGF0aWMgc3NpemVfdCBndWNfc3Rh
dGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0IGNoYXINCj4gPiA+IF9fdXNlciAqYnVm
LA0KPiA+ID4gLQkJCcKgwqDCoMKgwqDCoCBzaXplX3QgY291bnQsIGxvZmZfdCAqcG9zKQ0KPiA+
ID4gLXsNCj4gPiA+IC0Jc3RydWN0IGRlbnRyeSAqZGVudCA9IGZpbGVfZGVudHJ5KGZpbGUpOw0K
PiA+ID4gLQlzdHJ1Y3QgZGVudHJ5ICpwYXJlbnQgPSBkZW50LT5kX3BhcmVudDsNCj4gPiA+IC0J
c3RydWN0IHhlX2d0ICpndCA9IGV4dHJhY3RfZ3QocGFyZW50KTsNCj4gPiA+IC0JdW5zaWduZWQg
aW50IHZmaWQgPSBleHRyYWN0X3ZmaWQocGFyZW50KTsNCj4gPiA+IC0NCj4gPiA+IC0JaWYgKCpw
b3MpDQo+ID4gPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+IC0NCj4gPiA+IC0JcmV0dXJuIHhl
X2d0X3NyaW92X3BmX21pZ3JhdGlvbl93cml0ZV9ndWNfc3RhdGUoZ3QsDQo+ID4gPiB2ZmlkLCBi
dWYsIGNvdW50KTsNCj4gPiA+IC19DQo+ID4gPiAtDQo+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVj
dCBmaWxlX29wZXJhdGlvbnMgZ3VjX3N0YXRlX29wcyA9IHsNCj4gPiA+IC0JLm93bmVyCQk9IFRI
SVNfTU9EVUxFLA0KPiA+ID4gLQkucmVhZAkJPSBndWNfc3RhdGVfcmVhZCwNCj4gPiA+IC0JLndy
aXRlCQk9IGd1Y19zdGF0ZV93cml0ZSwNCj4gPiA+IC0JLmxsc2VlawkJPSBkZWZhdWx0X2xsc2Vl
aywNCj4gPiA+IC19Ow0KPiA+ID4gLQ0KPiA+ID4gwqAvKg0KPiA+ID4gwqAgKsKgwqDCoMKgwqAg
L3N5cy9rZXJuZWwvZGVidWcvZHJpL0JERi8NCj4gPiA+IMKgICrCoMKgwqDCoMKgIOKUnOKUgOKU
gCBzcmlvdg0KPiA+ID4gQEAgLTU2OCw5ICs1MjQsNiBAQCBzdGF0aWMgdm9pZCBwZl9wb3B1bGF0
ZV9ndChzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiA+ID4gc3RydWN0IGRlbnRyeSAqZGVudCwgdW5zaWdu
ZWQgaW50IHYNCj4gPiA+IMKgDQo+ID4gPiDCoAkJLyogZm9yIHRlc3RpbmcvZGVidWdnaW5nIHB1
cnBvc2VzIG9ubHkhICovDQo+ID4gPiDCoAkJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9E
RUJVRykpIHsNCj4gPiA+IC0JCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJndWNfc3RhdGUiLA0KPiA+
ID4gLQkJCQkJwqDCoMKgDQo+ID4gPiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUdfU1JJ
T1YpID8gMDYwMCA6IDA0MDAsDQo+ID4gPiAtCQkJCQnCoMKgwqAgZGVudCwgTlVMTCwNCj4gPiA+
ICZndWNfc3RhdGVfb3BzKTsNCj4gPiA+IMKgCQkJZGVidWdmc19jcmVhdGVfZmlsZSgiY29uZmln
X2Jsb2IiLA0KPiA+ID4gwqAJCQkJCcKgwqDCoA0KPiA+ID4gSVNfRU5BQkxFRChDT05GSUdfRFJN
X1hFX0RFQlVHX1NSSU9WKSA/IDA2MDAgOiAwNDAwLA0KPiA+ID4gwqAJCQkJCcKgwqDCoCBkZW50
LCBOVUxMLA0KPiA+ID4gJmNvbmZpZ19ibG9iX29wcyk7DQo+ID4gPiAtLSANCj4gPiA+IDIuNTEu
Mg0KPiA+ID4gDQo=
