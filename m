Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C964A12395
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACE610E637;
	Wed, 15 Jan 2025 12:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muIf6mZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028FF10E636;
 Wed, 15 Jan 2025 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736943144; x=1768479144;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=keGY73O3UoT7y8Ia9dArMvgmos9C5FVI7Z4U3mlB4pg=;
 b=muIf6mZ2R7Paz/Be/XXKY0Ww+PhuiOup5nmo4L36tQSQIQcb24Ftll9r
 4/wYKQ9fbE9Eal1eOj4RkXmJx8MjCMsp6pC3sLgcNUJ1Qo4e9EaZ60ZS0
 xjZUtiDs4yhRyTlk4vuGi2vkznoERkREJGwEoFQzDE541iS3ZG8+q4Td0
 0c3XyN6yMSUZGW86EXMVKCJ1wwdC449MNfBf+z74a1YQabV1piDiP6Nqh
 dymJzkekjleewmTus2FThcJBh1ZmgCw3h1OsaqjL7o9cDUviJXo/Ci5e4
 uNw/DdmxJB7Mab7U/Ks1fPjn+/FTq3HOIr/A+w7d46i9fU/v4C6XHn5yI Q==;
X-CSE-ConnectionGUID: 7KF7YrKiSP6aRND134pFQA==
X-CSE-MsgGUID: wesiFUv5ShG80U0PtUUyfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41037562"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="41037562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 04:12:23 -0800
X-CSE-ConnectionGUID: lGswYj3TRkKji3mA2xWy/A==
X-CSE-MsgGUID: R8GM47DyR46VYDpt4jQDVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="105078632"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 04:12:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 04:12:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 04:12:22 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 04:12:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTUB9nxfmQAX/3SKSjhpjljLhPx+8Pbq6Pi+BbX1XVKlyiis/ZXGt51ZGDKCRsCnodTdQeqYYmMejQTnHs8cTtwF9gCcvUFY12+Vv+DFloX6bkHhZbD91Bba+GdyC06hqZfavcIr94GQDtKF/WjSZvgcrxrxNlijfS0flwniO/iZwTVcVG5UTvXN/1Hl43InEGqa/bASP9Ujaf0S3mTLmckDzyLrlKqOx9aJaLtjqAU/B93arAGvWgUCocgHwhJEvo83yNoHRVn/SwaOkXrCuH1CD8FDtYdgRVQDXHfgDvu4inF1Hzlj3PnZrqxC/RJN05W+XzM7aiONWdK3YaNTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keGY73O3UoT7y8Ia9dArMvgmos9C5FVI7Z4U3mlB4pg=;
 b=dMbHK0XBZHwKX9g8DybOMGAWSCl1gJJ0NIKDO0AqB8QKRJZ898JtSbNkstQje1YoKdIi2sTeJZ7mqCzoWsXtefN5yJA6RLamHKtofJNgBUbyl1B+Vn5rTd5LhCiWLPLBDojl/Wy/pqi6uQkZo+1AucXY7htQ8YflksTO8bkXXxJHpz1vOrb70yySX4NQHuQM1uUREYcl+u5l4Cb025S+Zqg8nUbvth4pl23AvC9SFuxuUYyWHRse86tL22K9tW6qpSrbh3mMw5hC4u1d8ansV/UBEWqhkZmtB16pj/k4ESTaiaKNxVGkM+Zcf8Upcu8Oip+aslXRaOESLmb9wUUZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.21; Wed, 15 Jan 2025 12:12:20 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:12:20 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Arunpravin.PaneerSelvam@amd.com" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
CC: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "lincao12@amd.com"
 <lincao12@amd.com>
Subject: Re: [v2,2/2] drm/buddy: Add a testcase to verify the multiroot fini
Thread-Topic: [v2,2/2] drm/buddy: Add a testcase to verify the multiroot fini
Thread-Index: AQHbZ0a5jqtJAvi8qEiAPCBPiKU5Jg==
Date: Wed, 15 Jan 2025 12:12:20 +0000
Message-ID: <3f816555e6913fdbcb254523f65c98088d70581b.camel@intel.com>
References: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.2 (3.54.2-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|LV1PR11MB8820:EE_
x-ms-office365-filtering-correlation-id: e380f98d-8231-4eef-ef3a-08dd355ddc78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aW5hWVFWbHBiWXI5eXFac2k4Q3d3VlhtMFNyS05RVzY0cERCbmo4dm8yejBG?=
 =?utf-8?B?S0lkTDlRbWk4Z2c0VjN0ZUVoVTVrMGVCUjBkRGNJWUdxdDNjeHZORDFxd2JK?=
 =?utf-8?B?dUlaeUdST0tlNnBTak8yU2ptTWxHVlhqQk80c0VFZ0JyUHMyMTg0dkZrMnBU?=
 =?utf-8?B?dGdnck5PYXE2MVozUzJNOHlJQUR6MEk4dG5rMDA1cFczZEJHUGcrbnJwNCt1?=
 =?utf-8?B?Wk1JVzAwejhYM05JanZVdGxEb3dUa0RkVmNYQ2tIRng2NHhjLzhwdkJrbXhn?=
 =?utf-8?B?U3RGMEFhRlBJV2VadkU1dktDSnZLRHFVNXo5MmFMRVkzRUIybkl3RnRRYnlt?=
 =?utf-8?B?bDZNZlhFODZBVTYyVXdMZEowMklqWjdlcFBDcDMzODdtZWFpUmhVeXZDVUNl?=
 =?utf-8?B?dkZYbzhjTjJpck1pelU1eVZ0TkIvRXQxeURwdGU3OU1BeCsyQmltSXo0WWlJ?=
 =?utf-8?B?Z0ZzdVllVkhycHdZNUFVbmNLR090azVlWi9RaytSSDZ4RFRoalkvVFhRWUgz?=
 =?utf-8?B?ZDdQV3JPZDRmcE5CdThldFg0Wk1xY2c5NEhlRTZ2UGpZb3hCb3J1MlpFMXFJ?=
 =?utf-8?B?bkhodjBYbTNzK3pLeGxBVEZja0lPYytrejJDc0JLNjhQcXR2RUZ2YUVKY2VF?=
 =?utf-8?B?ZEp5UERsRThQb3lhUCtzWTFuRzFpUXN6Q0lZaTZwaTc5Y1hBU2xEcWtQbHRl?=
 =?utf-8?B?d3M4cHB5amdXa2VvSjNPbVB3VjJzbWtmNjdaa1pHV012NklSVWN5MXU4WDNp?=
 =?utf-8?B?allXeWJoZWlVQmZhaHN0NWdVVnhsSE5ZcHp3Kyt1YUw4MXc0VDBwcXZVRlNT?=
 =?utf-8?B?REhZeUFtSElsc0IydGRzK3hzYlQrdkpNS2tyYThBL051RitpOEp3czZtckNJ?=
 =?utf-8?B?cmRuWFk0cDU4QlR2dE9RWEpva3QzaHZadGl0ZnNhSXJXM3cyQklXdXd3R1k5?=
 =?utf-8?B?SWNwZ09La21Bbm12REptNTkvdDVLU3dGMkhydVpRVzdYcjNUaUhLTndxQnFM?=
 =?utf-8?B?S3pSTCtIQVJRN2JMVFFsa0VnbEloWTZGbmJ1dlE3M0gxU3dkMjFiR2ZvQTNW?=
 =?utf-8?B?UUdYRXBxaEgyYnMwL2RrR3prWFBDQmNwT01USWdBNGI3aEZRN2RYZmhaekhY?=
 =?utf-8?B?dkR5b1NLbC9sU3JOVnFTYlBlOEZtQytNVkpDUDZGbGg4RC90d1V6TWhTWCtP?=
 =?utf-8?B?TlVKUGpqdldWSHhIdDJZdGo2NERYb1ZHL3FmaThLNExnSzRWaXRsODB4Rkp4?=
 =?utf-8?B?WkI1cUhJZTFjeS9xUU1WWnUrYVF4RmhtTHl4Z2pKT0t0M21EK3M1Q1liUXQ2?=
 =?utf-8?B?ZHQ5VWFrU01CSm1EUmNjNGpBOUtPTElzZTgxTCtUdXdFYTR3K0hHMkx1TDVn?=
 =?utf-8?B?TFB3c243SzlwSHhseFVFbE9JcmNtU3dpNDY4elh0ajFmT3loZ2N1K3JoUmV4?=
 =?utf-8?B?ZlY1NWNqdlh6VndDTGxPcXJNbjBGcmhxMGorMldmZi81aTE1REJORlBKeUtD?=
 =?utf-8?B?VEs3cXl6dGZzNURkWFMzVjg1K0xlYlprbWpYZjdBSFdoa3FJcUVpT2xSRW1Z?=
 =?utf-8?B?Vkxja0IvVURDOFdqaUdFQmdLbnhmNHFVTHIzWDZUeVN2TEVaMGRjUDRmUk9a?=
 =?utf-8?B?MHFoQkFsSTBaYlZ0cStsT29kRnhIUmkrMzZ6NTk5VzRaVmtkenltalA4bHlN?=
 =?utf-8?B?b0JYL3U2Q2ltcWZyUVRLd0pweVErRDRiOVBmZlVpdm5GUUxTR3czeTJDM3JC?=
 =?utf-8?B?d2trNndwVUgxTzNHVkF3aGJiQ3hBM1crU1hQdWMrNTFOd3lqbDBaRkpMK3I1?=
 =?utf-8?B?azRmV0FKRENpU1JwdkxmNElSSk9UdWdDUlhzanZOSVVHaTIxQm0xV2xhcWJU?=
 =?utf-8?B?bkdWT2crbkdPcm8vbGMvaFlaa2JpQitEVVpDVTFVM3RnMWFiUVhFVkFWeDBW?=
 =?utf-8?Q?HLhAncljSlAZR544fxSqnk33kMTLfrkK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmZ4S3Ntek1GckFMVmNnUTlvS3pnMzdUaEcxTUdQS0dlQS9ZOGtoTDhKZ09X?=
 =?utf-8?B?UHBaUERkY3oxeHZQN29KanpmUmg5SVltR3JuQll6d0t0QlNtUlB5WmpUd05q?=
 =?utf-8?B?ZGVRNUdZa0d2QXlBa01nNGc2dENDQk1Gb0M2OUZWelBLVjIxQkV0M0NpWmla?=
 =?utf-8?B?R1Fpc2V5ako4OGJJZVk5aUpKOHdZVFY2anVhbkFqbGN3YTlCS1MxSy81QXNw?=
 =?utf-8?B?dHVBaTJISEFLMUdFNkNmMGwzUkU1YTJqV25ZUitVa1VHMmQ0azljMzZEeisr?=
 =?utf-8?B?RlBlM0RiWElFdDRUdWxkVWgrZ01mVzVZNE1LakhUV082MWJDVUlYM2FFZXNW?=
 =?utf-8?B?eDFOamNzaWFEYnhZeWxwSHdqK0Zqc2ttcWVlN095V09jb2FaTHVHdE03QUl4?=
 =?utf-8?B?eFBibzExaFkwUlBrdHcvRWVheXRzci96RUkyU0FlcldNV2VaZFpjREVmTGUy?=
 =?utf-8?B?Qlp3bjhmMW54RnhRd0R3MVRsbTFDWE1kaTU3dFozVzhRclpmQlQrOHR0TTZO?=
 =?utf-8?B?QXBIdGJsaUR0aWh5cnN6MjI1d3Z1b2QyZ0F6ck9sTW5GSGFvQkpBZmdRTDM3?=
 =?utf-8?B?elROeGF2bm56WGtsU0ZHZ0tqN3l3TUtxNkNrQ3loaHpoVUJSY1Z1NXFoQ3M4?=
 =?utf-8?B?QXpFYldZZlBhQlpMMjM0L0lHanJvcVBVK3I0U01meXpQSGhoRnk0Z0J5aGpu?=
 =?utf-8?B?Uzl1OE9BZUhXNkdQb1lYOWtYWVB4bGNJUm5ma012OWFMNnhzVmxEb0VIQ3F3?=
 =?utf-8?B?eFlBcnB6RDVFRzZta3JXKzVXdXNQM2g0MHlDUWxYaWw0OGZVcmxtaFR3NmNU?=
 =?utf-8?B?U3RLL3ZVY3FmTGl0bzk4NDduSTR3MVh2NzA1Y295UVpBUnpuM0lIdTJlcDdS?=
 =?utf-8?B?a2hFdytwYm5sMVRxY2dBTUlYVnpLMkQ3a2pOL0t5elUyTGE3S2JGOWI5cjk3?=
 =?utf-8?B?dzlLVEVOM3lMK2dQQjBxNmM5VHZuSzBPcG4yS3ZWTnRmc3BYb0F5VFVNWWhW?=
 =?utf-8?B?Mk5nWk9VbTFDSG05OUMyaDkzTkF2enBBdkNoMm9VbjNVbVBOUDYwbWEzcCs1?=
 =?utf-8?B?QkNQS0szaGhiNUpKT3BRd0dzeWZCQ3kvTHU2RWY1TXBVaWdDZW1GRGhiMkJI?=
 =?utf-8?B?Qm5PcVg5YTI4YTJXaE8wVWpYMGtYSlBvWHNBVHowTWZmd1dNaFMxU0h2cEFj?=
 =?utf-8?B?T1VhSXZhNTFmT1BxNzJpV2pLMyszYVo1ME9PU0JiVktNc2ZJaStMblpQVDlZ?=
 =?utf-8?B?ZTNsdmdWc1VUb3dpWnVKc2JSSGNsQXdaSW9meTFLQkJiT2I2cnFCM0s4bkhO?=
 =?utf-8?B?N21STlo0QUpSRjlnNUVBell3RlR0anpEcjNVL2E1OTB0dDk3VXdNb0wyWndi?=
 =?utf-8?B?OHlxMDl3RENVQzVpaXQxMUU5SHpsYjVaZS96ZmNid1R0V2lLdWhsSnBxVkhl?=
 =?utf-8?B?UFl5cEtKbG1kS3NTWGVLZVhHMU04UkFQcW1OcXo4Z09JMVlzN3FNYkFLaXZu?=
 =?utf-8?B?ZmxkMjRRVFZFQnJwdjJyaWR1bW02d24vNG0vekkrOVRCaWVLQUh5Q1VFZFFC?=
 =?utf-8?B?QjZLZFJ0RjdwY2JRUk96am45RzFLOGhPVFRxYlpTU1JkajRJZ2xsS0NHNG90?=
 =?utf-8?B?ZlpIK045Y1ZSZXVtckRaZkd2d2k0MjUzdjdKTXppeGxoNitjajd1VVpJT2RK?=
 =?utf-8?B?ZUVwbkhTZ1MydnlpY04zMXVna2tDUTY2bjRXdFlxdzNhWS9pazgzYS9aRGhJ?=
 =?utf-8?B?cVRjdmxUTFRSVS8rQUZPR0U1ZXFyUGRhdXp5OVhaUjBwbzBpRUVJWWJUSU1t?=
 =?utf-8?B?QUJaRnNEcmNFL1BBYTR6TWFOYmpMbmhSN1R0cXowbm9yQzhlZjVKME5GYm5V?=
 =?utf-8?B?S3c1T2xIUDB1QlZhT0dKSG9pdWhHejRoME5iMHArRmNFZVNELzRncWRyOU5G?=
 =?utf-8?B?MC94UUMrTTNiVWVxZGsxYzBwV2J1dytWMFliSjl4OC9ISkNmNmZoM1lQRENE?=
 =?utf-8?B?ZGJSVEtiRWYvMGRlYU8yOTNsRWpkNngxcTBhdXd1SnBLdnVkY1NKaXp5VTZO?=
 =?utf-8?B?RFJuUCtISzJ0aFlPc0h3OEJUc1NVaDJleXdQa0pFSEcxZHFRWkdlQndDbzZt?=
 =?utf-8?B?U2xkZk41MnNLLzc5ZEd5TTlXV1RxNVN5L0d6WkRiLzhIVFRSN3Y3d2h6cE00?=
 =?utf-8?Q?BNvfR3GXjtMqjdYfL5eJ/D7mDDWCrnapb85hUOqLQPXi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8C118D1BF46AB448ED26E722BA26EF5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e380f98d-8231-4eef-ef3a-08dd355ddc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 12:12:20.3425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwwEsAyRytWJRqhfplT7cGrIDOXdyn72welBTgLF0SGKm6yiwek18WiFVGnoRqZOnK07iOCLdatMs4NamIeWKelrPnHw8wL+LtuuTjBwOf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
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

SGkhDQoNCk9uIFRodSwgMjAyNC0xMi0yNiBhdCAxMjozMSArMDUzMCwgQXJ1bnByYXZpbiBQYW5l
ZXIgU2VsdmFtIHdyb3RlOg0KPiAtIEFkZGVkIGEgdGVzdGNhc2UgdG8gdmVyaWZ5IHRoZSBtdWx0
aXJvb3QgZm9yY2UgbWVyZ2UgZmluaS4NCj4gLSBBZGRlZCBhIG5ldyBmaWVsZCBpbl91c2UgdG8g
dHJhY2sgdGhlIG1tIGZyZWVkIHN0YXR1cy4NCj4gDQo+IHYyOihNYXR0aGV3KQ0KPiDCoCAtIEFk
ZCBrdW5pdF9mYWlsX2N1cnJlbnRfdGVzdCgpIHdoZW4gV0FSTl9PTiBpcyB0cnVlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQXJ1bnByYXZpbiBQYW5lZXIgU2VsdmFtDQo+IDxBcnVucHJhdmluLlBh
bmVlclNlbHZhbUBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaW4uQ2FvIDxsaW5jYW8xMkBh
bWQuY29tPg0KPiBSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA2ICsrKysrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fYnVk
ZHlfdGVzdC5jIHwgMjkgKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+IC0tDQo+IMKgMiBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KSXQgYXBwZWFy
cyB0aGlzIHBhdGNoIGJyZWFrcyBkcm0tdGlwOg0KDQpkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJt
X2J1ZGR5X3Rlc3QuYzogSW4gZnVuY3Rpb24NCuKAmGRybV90ZXN0X2J1ZGR5X2FsbG9jX2NsZWFy
4oCZOg0KZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9idWRkeV90ZXN0LmM6MjY0OjIzOiBlcnJv
cjogdW51c2VkIHZhcmlhYmxlDQrigJhwcm5n4oCZIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0N
CiAgMjY0IHwgICAgICAgICBEUk1fUk5EX1NUQVRFKHBybmcsIHJhbmRvbV9zZWVkKTsNCiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn4NCmRyaXZlcnMvZ3B1L2RybS90ZXN0cy8uLi9s
aWIvZHJtX3JhbmRvbS5oOjE4OjI2OiBub3RlOiBpbiBkZWZpbml0aW9uIG9mDQptYWNybyDigJhE
Uk1fUk5EX1NUQVRF4oCZDQogICAxOCB8ICAgICAgICAgc3RydWN0IHJuZF9zdGF0ZSBuYW1lX18g
PQ0KRFJNX1JORF9TVEFURV9JTklUSUFMSVpFUihzZWVkX18pDQogICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn4NCiANCg0KVGhhbmtzLA0KVGhvbWFzDQoNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2J1ZGR5LmMNCj4gaW5kZXggY2E0MmU2MDgxZDI3Li4yNDFjODU1Zjg5MWYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2J1ZGR5LmMNCj4gQEAgLTMsNiArMyw4IEBADQo+IMKgICogQ29weXJpZ2h0IMKpIDIw
MjEgSW50ZWwgQ29ycG9yYXRpb24NCj4gwqAgKi8NCj4gwqANCj4gKyNpbmNsdWRlIDxrdW5pdC90
ZXN0LWJ1Zy5oPg0KPiArDQo+IMKgI2luY2x1ZGUgPGxpbnV4L2ttZW1sZWFrLmg+DQo+IMKgI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiDCoCNpbmNsdWRlIDxsaW51eC9zaXplcy5oPg0KPiBA
QCAtMzM1LDcgKzMzNyw5IEBAIHZvaWQgZHJtX2J1ZGR5X2Zpbmkoc3RydWN0IGRybV9idWRkeSAq
bW0pDQo+IMKgCQlzdGFydCA9IGRybV9idWRkeV9ibG9ja19vZmZzZXQobW0tPnJvb3RzW2ldKTsN
Cj4gwqAJCV9fZm9yY2VfbWVyZ2UobW0sIHN0YXJ0LCBzdGFydCArIHNpemUsIG9yZGVyKTsNCj4g
wqANCj4gLQkJV0FSTl9PTighZHJtX2J1ZGR5X2Jsb2NrX2lzX2ZyZWUobW0tPnJvb3RzW2ldKSk7
DQo+ICsJCWlmIChXQVJOX09OKCFkcm1fYnVkZHlfYmxvY2tfaXNfZnJlZShtbS0+cm9vdHNbaV0p
KSkNCj4gKwkJCWt1bml0X2ZhaWxfY3VycmVudF90ZXN0KCJidWRkeV9maW5pKCkNCj4gcm9vdCIp
Ow0KPiArDQo+IMKgCQlkcm1fYmxvY2tfZnJlZShtbSwgbW0tPnJvb3RzW2ldKTsNCj4gwqANCj4g
wqAJCXJvb3Rfc2l6ZSA9IG1tLT5jaHVua19zaXplIDw8IG9yZGVyOw0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9idWRkeV90ZXN0LmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vdGVzdHMvZHJtX2J1ZGR5X3Rlc3QuYw0KPiBpbmRleCA5NjYyYzk0OWQwZTMuLjRiNTgxOGY5
ZjJhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9idWRkeV90ZXN0
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9idWRkeV90ZXN0LmMNCj4gQEAg
LTM4NSwxNyArMzg1LDI4IEBAIHN0YXRpYyB2b2lkIGRybV90ZXN0X2J1ZGR5X2FsbG9jX2NsZWFy
KHN0cnVjdA0KPiBrdW5pdCAqdGVzdCkNCj4gwqAJZHJtX2J1ZGR5X2ZpbmkoJm1tKTsNCj4gwqAN
Cj4gwqAJLyoNCj4gLQkgKiBDcmVhdGUgYSBuZXcgbW0gd2l0aCBhIG5vbiBwb3dlci1vZi10d28g
c2l6ZS4gQWxsb2NhdGUgYQ0KPiByYW5kb20gc2l6ZSwgZnJlZSBhcw0KPiAtCSAqIGNsZWFyZWQg
YW5kIHRoZW4gY2FsbCBmaW5pLiBUaGlzIHdpbGwgZW5zdXJlIHRoZSBtdWx0aS0NCj4gcm9vdCBm
b3JjZSBtZXJnZSBkdXJpbmcNCj4gLQkgKiBmaW5pLg0KPiArCSAqIENyZWF0ZSBhIG5ldyBtbSB3
aXRoIGEgbm9uIHBvd2VyLW9mLXR3byBzaXplLiBBbGxvY2F0ZSBhDQo+IHJhbmRvbSBzaXplIGZy
b20gZWFjaA0KPiArCSAqIHJvb3QsIGZyZWUgYXMgY2xlYXJlZCBhbmQgdGhlbiBjYWxsIGZpbmku
IFRoaXMgd2lsbA0KPiBlbnN1cmUgdGhlIG11bHRpLXJvb3QNCj4gKwkgKiBmb3JjZSBtZXJnZSBk
dXJpbmcgZmluaS4NCj4gwqAJICovDQo+IC0JbW1fc2l6ZSA9IDEyICogU1pfNEs7DQo+IC0Jc2l6
ZSA9IG1heChyb3VuZF91cChwcmFuZG9tX3UzMl9zdGF0ZSgmcHJuZykgJSBtbV9zaXplLCBwcyks
DQo+IHBzKTsNCj4gKwltbV9zaXplID0gKFNaXzRLIDw8IG1heF9vcmRlcikgKyAoU1pfNEsgPDwg
KG1heF9vcmRlciAtIDIpKTsNCj4gKw0KPiDCoAlLVU5JVF9FWFBFQ1RfRkFMU0UodGVzdCwgZHJt
X2J1ZGR5X2luaXQoJm1tLCBtbV9zaXplLCBwcykpOw0KPiAtCUtVTklUX0FTU0VSVF9GQUxTRV9N
U0codGVzdCwgZHJtX2J1ZGR5X2FsbG9jX2Jsb2NrcygmbW0sIDAsDQo+IG1tX3NpemUsDQo+IC0J
CQkJCQkJwqDCoMKgIHNpemUsDQo+IHBzLCAmYWxsb2NhdGVkLA0KPiAtCQkJCQkJCcKgwqDCoA0K
PiBEUk1fQlVERFlfVE9QRE9XTl9BTExPQ0FUSU9OKSwNCj4gLQkJCQkiYnVkZHlfYWxsb2MgaGl0
IGFuIGVycm9yDQo+IHNpemU9JXVcbiIsIHNpemUpOw0KPiArCUtVTklUX0VYUEVDVF9FUSh0ZXN0
LCBtbS5tYXhfb3JkZXIsIG1heF9vcmRlcik7DQo+ICsJS1VOSVRfQVNTRVJUX0ZBTFNFX01TRyh0
ZXN0LCBkcm1fYnVkZHlfYWxsb2NfYmxvY2tzKCZtbSwgMCwNCj4gU1pfNEsgPDwgbWF4X29yZGVy
LA0KPiArCQkJCQkJCcKgwqDCoCA0ICogcHMsDQo+IHBzLCAmYWxsb2NhdGVkLA0KPiArCQkJCQkJ
CcKgwqDCoA0KPiBEUk1fQlVERFlfUkFOR0VfQUxMT0NBVElPTiksDQo+ICsJCQkJImJ1ZGR5X2Fs
bG9jIGhpdCBhbiBlcnJvcg0KPiBzaXplPSVsdVxuIiwgNCAqIHBzKTsNCj4gKwlkcm1fYnVkZHlf
ZnJlZV9saXN0KCZtbSwgJmFsbG9jYXRlZCwgRFJNX0JVRERZX0NMRUFSRUQpOw0KPiArCUtVTklU
X0FTU0VSVF9GQUxTRV9NU0codGVzdCwgZHJtX2J1ZGR5X2FsbG9jX2Jsb2NrcygmbW0sIDAsDQo+
IFNaXzRLIDw8IG1heF9vcmRlciwNCj4gKwkJCQkJCQnCoMKgwqAgMiAqIHBzLA0KPiBwcywgJmFs
bG9jYXRlZCwNCj4gKwkJCQkJCQnCoMKgwqANCj4gRFJNX0JVRERZX0NMRUFSX0FMTE9DQVRJT04p
LA0KPiArCQkJCSJidWRkeV9hbGxvYyBoaXQgYW4gZXJyb3INCj4gc2l6ZT0lbHVcbiIsIDIgKiBw
cyk7DQo+ICsJZHJtX2J1ZGR5X2ZyZWVfbGlzdCgmbW0sICZhbGxvY2F0ZWQsIERSTV9CVUREWV9D
TEVBUkVEKTsNCj4gKwlLVU5JVF9BU1NFUlRfRkFMU0VfTVNHKHRlc3QsIGRybV9idWRkeV9hbGxv
Y19ibG9ja3MoJm1tLA0KPiBTWl80SyA8PCBtYXhfb3JkZXIsIG1tX3NpemUsDQo+ICsJCQkJCQkJ
wqDCoMKgIHBzLCBwcywNCj4gJmFsbG9jYXRlZCwNCj4gKwkJCQkJCQnCoMKgwqANCj4gRFJNX0JV
RERZX1JBTkdFX0FMTE9DQVRJT04pLA0KPiArCQkJCSJidWRkeV9hbGxvYyBoaXQgYW4gZXJyb3IN
Cj4gc2l6ZT0lbHVcbiIsIHBzKTsNCj4gwqAJZHJtX2J1ZGR5X2ZyZWVfbGlzdCgmbW0sICZhbGxv
Y2F0ZWQsIERSTV9CVUREWV9DTEVBUkVEKTsNCj4gwqAJZHJtX2J1ZGR5X2ZpbmkoJm1tKTsNCj4g
wqB9DQoNCg==
