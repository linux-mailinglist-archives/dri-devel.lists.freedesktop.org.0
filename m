Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A899481B6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 20:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130710E27F;
	Mon,  5 Aug 2024 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFIJL/d9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6E10E27F;
 Mon,  5 Aug 2024 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722882940; x=1754418940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=L+jQ/BX3Zb8WuDA2018VXZv6PSDUXcBcO4MOuLK+0/Y=;
 b=iFIJL/d9kcMY2ViPETwJq55ixy4GtBwuorXKK7sCq4Tdd/K0vWqy7FrV
 SfWzTxrlybGqpEJq7Dj2RNNg/N1pKMiuX+PSGC1Y2R5mtvGOf323V0zqK
 B+yZy/TsiOztsiwpYwUioig2+e+W40SwpUcpYdNr1UIlaLVYJQ+H7PXX9
 XaiDinAV2nQCae2dKnn3p3iiL8CpUXjdobW6yMPsDhYWjzHMbqWcR0IKU
 J7+IBoK8O+rmqP8UNkKUG6ibjArJFW+f3AM4Ue07qLJPzRYfuyBuvuMoh
 LRyvvlUSq1EG+v9dqWKaHKegQVbTM//79IznnMvI7KK3CUTO6icJxFOJS w==;
X-CSE-ConnectionGUID: WyObZhz3RTqO4dhCsELQcQ==
X-CSE-MsgGUID: lLh1B5ZLTvO4O7Ifj6HG9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21028378"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21028378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 11:35:39 -0700
X-CSE-ConnectionGUID: Mx3hZ3KOQOyMtsoBl2zb1w==
X-CSE-MsgGUID: yUzF/E7YQOmmGdGPbJUBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56461350"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 11:35:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 11:35:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 11:35:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 11:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWUWPMwZwbKbJ464wfcIgeTHOT76eBH/IGHfR0lbSFlG5OYamPXrhzCNA9rK/g/d0B/QJdvPSTncgsuPT0ocDg/BeYxEq0e3N3vt8N1oPynHW4nmds5r0KE6nklMpENZ/31LzumyC0tk5o/EyDhmIrwhlSGnYfOhgxZMTbEHtXswzMzwY5gmKE3auYFCmbgojh8Zcih6uWLlXpN9s6ZkarBy4ALFPDm6qXZJAfJcIguiu9awc+nz6kPzq1DWmlU3085ilPQ80dR81elJz3Q8WgnF1HBpY3yYO3MfKVUQS9jOuPzDBJc72qI8gc0NSVascZjLQzhrxQaZ0FfsToWxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+jQ/BX3Zb8WuDA2018VXZv6PSDUXcBcO4MOuLK+0/Y=;
 b=kPWMOhQ7r4RsgIT8AI91Usg3H1KU0u+LquTV+Bfy3XTTAHT5QzSqPU/E9PngVi5iy9HND4RBdAdQQBduGJstlyrQHcTE94/S8OzA5owcBfnhA8zdp4quJNempq/i144oXisF5fjGWzlZAzZvpJG/bIpLlDsqpQ4G4nT7wy5N08fns3gltEdteO9kF2y/rGqFl3oqhziTJ9TOvFZb4rW5j72DRQb3aED8JBEI+aXlS9gKkPmSHQijodPdFEYjMBOK/UTsjo4rd3GCGJ20YIIFS/z7aXJf2CQ0CGFa0Vnt/3s6OX3i8xps/Lv04gfF09c5mFtvvMAmoLKev7QCfKQTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 18:35:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 18:35:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "Amaranath.Somalapuram@amd.com"
 <Amaranath.Somalapuram@amd.com>
Subject: Re: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
Thread-Topic: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
Thread-Index: AQHazV8g2IMOcl3PpUWWCZZCj43bWbIZMcMA
Date: Mon, 5 Aug 2024 18:35:34 +0000
Message-ID: <a9973e37fc9c81046ce5f32a13f5e8eb50d90935.camel@intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB8099:EE_
x-ms-office365-filtering-correlation-id: 25e28993-da5e-437f-2379-08dcb57d64d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Tkcwb01jTGt4NEV4bkM4LzFqaGJ2TVZ6dU1VTHNMbStLbWptODJRSzU5S3lp?=
 =?utf-8?B?dytYQTVhMElWZXVOVXJPbnFpQUNPeXFtOUZBQ0pWK0xSYUR4YzdOT2xJWElQ?=
 =?utf-8?B?V3c2QWR2bXp3TGIzRmpNSXlHdEhYMm9lVmlsNHRaVkh4dER6MnJ4TGdMU2Rv?=
 =?utf-8?B?dmg1aGNYMXd3U2dBZkNFUjdCdForUHFlb2lucVJTTnN2bG9ONVl5WUEveDhS?=
 =?utf-8?B?MTJRTnpWZ0VROGpCVFFybW0zWS96M0prKzlKTnc0V01NNU9YaDFWUHhsTHlM?=
 =?utf-8?B?cUR3WmNuK2VqdjYwdzlMWWlqSUtSdE1IdnpTc21mOWdINW9rdlA3SVFFSlNn?=
 =?utf-8?B?SGIxVnNLVUZrQ2txWk1MMGVub1BaSVE0MHlhVGZIMStQZFQ4Y1hnUzZ0d256?=
 =?utf-8?B?NER4Ulh5VkJQR3NvdnFnbkptdWh6Zys5bzZqVHpzS3g3ajZIcGNNQUdrU24w?=
 =?utf-8?B?REFsL0xUdlFzYlRVeHNaM1Ewcmd2NC9YZEtGYlB0VzdzaUwrQ3JqUUpWMlp3?=
 =?utf-8?B?b3pxMUdlS0pJWElMUElsN3NKd3JYQVBjVTJYVzc0dkh1c3ZzcFlFQS81eHl1?=
 =?utf-8?B?K0ZuT0ZmNzAwUUtIa2VZODB6RVJzUnVHenY4MnNKQnNZMjZudjZTZXhCUnFY?=
 =?utf-8?B?azQ3ZE82aVltbnJrM3lpN0R2dytBV2FyTDF4UTdPQ2V2MDgvQjN1M1g1dHp3?=
 =?utf-8?B?ZWV3clBCSzZPckUvQlpFNTh6YWF5Mmx1ejNQQzBJV0RZUk4rSEhxSTlyYklH?=
 =?utf-8?B?MVUzUnhkaXpwb3J1VHhjb2dONDZudWd1djBubkZnRCs2MzBvYVpySnpUZUZD?=
 =?utf-8?B?OFpTTzVJVnVoRzZ4VGxHS0lpaG4rajU2RE12UjFKbmFKVWVDSVd5U2VUM2xa?=
 =?utf-8?B?WVNWbTNuL05IUXAyRStGb0s3Qm1INTJ5Tk1ndWhMc1pYNnhXbUJpK1dFZHNq?=
 =?utf-8?B?a1pFWmJDU2UzaU5OanhHQXh5eHU1VW0yY2JjSUZ2U25wV1o5VWI4K3ltejRw?=
 =?utf-8?B?NUwyMmcxR05lUE9PWUlLNG5aQld4dnBvbzdHWU9BYmdSUFJOV0xWN2FPNDZz?=
 =?utf-8?B?VVJUNlozS0JtYTdPNDJOU0xLcVJCNjZZQXdkVkVWUEVKeDJkVDhsUE81emhn?=
 =?utf-8?B?cjVuREFUZUpVZjQ2YjZOdERETmlMNFRNYW5KK2lDRGhkYzZramJKYzRZUHVa?=
 =?utf-8?B?cmFPZE1VclJ0UWxKYUM1emdUMGhaRy81MGVpV0dibytwMTlDam1XcGVjdVJj?=
 =?utf-8?B?NjVtZTJLR1htUlBHU3JOOUFKSHlqZVNsWExBUXFrY3lVNHhzWU4wTzFOQ01W?=
 =?utf-8?B?ZlgvZFgxWkJxYVYrbnhXbU1teVgvdXNGQ3NIWEVuZTZjKzhYN205Z3FuOTMx?=
 =?utf-8?B?V0xrbFVET255MjVhKyt6bzRncm1oR1ltSEhJOEVrT2NuYldzdmRZbTFiTXND?=
 =?utf-8?B?VVN6OTJXSlFiUzUzVWthdnVCcnNWWkxxTWhMcTZaNlp2TlpMWHZSZWlJa2JL?=
 =?utf-8?B?VW52Z0hrSElOS1JLUmwvaThDajNNWlRVNm1WbWMxcEd6T3ljUUtQNUpWekV3?=
 =?utf-8?B?YzIzV2tST2R3Zm13UzlTb0VFWmhuTnRhUHgyMFRXQUxZOGpGYzg2bmsyS2dj?=
 =?utf-8?B?alY1ZURwMEQrNnVEdVZCNDk1bURIOGp1eE5XVFdld1ptUC8zMW9GQnFROTI3?=
 =?utf-8?B?UW01b1NTTFpjWGVSVkZEdXR3TWk0Mk1CeDB2eGJxUTAvcVJ2SnprODRZb0ZK?=
 =?utf-8?B?cHFMR0FVcVVaekNreHFlanV2SXpHTnhxTmNlbjlXTjUwc1VWaEpCcTFYZU5l?=
 =?utf-8?B?cy9UMUtiMVRjcFVtNCszaG9idmhMUW5nUi9KcjlOWCtoSWxEN3BxUHoxREli?=
 =?utf-8?B?YWF5QTFXbGduVFh1NG5Sb09zWTk4Yll0YWxiYXdHVHl2SHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTJoK2RzaFBranpmMWJVTEVCcnFwZnhWdG14aFZnTzExY3VXNVBOVy9hOGdR?=
 =?utf-8?B?cjBDQlJKMVBtck9XZUpEYm1HNDhydEwxMjZTMmxCdndTVENIRmJxTEN5TE1L?=
 =?utf-8?B?M2VTTUZJMWVZem83RUVQNmdybmgzTVJaZmR4dmdxR1g5RTdTeVlhVkErdCtW?=
 =?utf-8?B?QXRib3Qrbi9vNWdRQS9iTjRIOS9FS2RDR3FjQ0NlYXFyeGtmOU5IVWpONERr?=
 =?utf-8?B?SmppS3E2MWtObnJnNDRlL3JWbjd4ZS9PbmNLTVoxQVlrUFpDTjZjNzhuU2pE?=
 =?utf-8?B?Ulpiczk4V3Fody8wazRvMFUzVkVwRStCam9WRCtmUU5jMVg3SDc2SFVFTmZK?=
 =?utf-8?B?NHZJM0pUUE1lZ2k4NGd3ai9MOFY1QTA3U1Q5T2laSmZqWnRjQk1KanRGMjBT?=
 =?utf-8?B?WTFYbXJDcWlrTU1BVE0wQkF2QkJic0ZJbm91RUJZeW54dWpaWEhTNWVKOGtS?=
 =?utf-8?B?VzNLeTNpZUtHUTBURWpQN0xHTzcyVzdqYUlZZllWM0ZsKzlaL2IvRVBobFFL?=
 =?utf-8?B?bHRmR2I4QzA2eGpEM2UrQko4VjRxVVdWcS9EQmhHejYxQzVoTnVZbGhzNFF3?=
 =?utf-8?B?UVUya1l2TFpJclNiOFBPMHp4TVdCc2s0K0wvWkVpaitRaFhmeHBhN0E2allm?=
 =?utf-8?B?U1FHQ2hIWHl1c0RUZXBoWnc5RVcvRjdLcTErOWZnbjBqVEQvUEtMNTgraGEv?=
 =?utf-8?B?U3BVOS82YUhGY3VhSXV6aVF5VkcrdWxBSzlFekt5VkErWlRNQ0kvdzlQZSta?=
 =?utf-8?B?bFF1akpXdGhEU2g1MnJPcDE0V2ZmUEtnQ1hHT3ArWTRqSENMcW5TYWhQSFB4?=
 =?utf-8?B?emxDOU9WYVJXVVZaYjJ0Ykxtb1BvZ0t4RVN0VnFENHROWFgweGVBeFRqRFdr?=
 =?utf-8?B?OGlnU2RoUkVybW1SbGQ5eGlQeTBjbnlsbWR5TFBNOVFkM0k2U3l2UW8rajY5?=
 =?utf-8?B?dWFVSFUyQTY4amRJZFJFNTdLNHp5MEIxSElpeVl6TFVWaTJONjRyUHNLeWx0?=
 =?utf-8?B?VkpzaFpqeEpnL2ljSXZpWW1JM2xMT1BxL1k4MysrVDduV0tDWDV2NmVpWjhp?=
 =?utf-8?B?V2phdXdGeitSM0JKNTlWeEcweFpJR2x3MmZ4VjcvTWJSWVJYbmlxMW5vMlNj?=
 =?utf-8?B?Rlp0NWFNd3hRNkg4UktWanF0NkpLUUlta0hwMW5oSkZ5ME1VSHM4bjdvUGNm?=
 =?utf-8?B?cVF1TnpYZjdhTWNTQVRUbngwS0Nhb3JUNDFua01sN0lSR0dZMVcrSmVyZGw3?=
 =?utf-8?B?NDNFazlSWEJLbjZ5Q0tDcHZvdWFBRXFlK3JBbDVDbGRXSHR0UEdkMGVOQ3VV?=
 =?utf-8?B?akw3SlNCRERrYUFnaGF5TWVFTDk4clR4dTZjSmdRelkrdkdDZGpYZUpub1ZN?=
 =?utf-8?B?VEg1Q1NQR013K1YxK2p6bkdmVEFtek1TR29QazFZaC9MV3BmWUdvaDh5eTky?=
 =?utf-8?B?MmY5ZDdUQjBoaFJGS0tQVTQ5Sm5qT2pZcDd6K0NtUEthTGRkM1RZUXVjK003?=
 =?utf-8?B?NmZWK3hnYjZIcm92TDZBM0VGanpSTmNmc3BPMmFDMk8ybUtWR2xFUzV3c3cv?=
 =?utf-8?B?cUk1WENmMWJhWEpXYW5aUWlJSlRjdE5aK3NDcUJCS3FzQ0tLQWZaY0lZbHpB?=
 =?utf-8?B?WVhpcVVPVzd3UzN4a2twSis0azlLcEFScEhnWEFkM013L0E3N0xpWXVOREhC?=
 =?utf-8?B?Z2RCY2dnSWtlOXh3ZFdTa2FhYVJSa3FHZlU2djhTbWRFMGNITjZkY1VBend4?=
 =?utf-8?B?bStGL3FYL3JQSzlRRDFKUndvSmVMR2sxcHkvbENsd3hnRGpzQU4rRGNMUVg3?=
 =?utf-8?B?Q0g1bnBnT0Y2OHJjY3pkKzNaMStjWkVFellTM01tY2luS0I1L2JKZm9pS1px?=
 =?utf-8?B?U2g2UkRoOERPNzQzL3BKeWs3bm9YekROS0loQW9ONXhCb3JkZVNDalN1K2J4?=
 =?utf-8?B?UXVkS3J5L1cwSXZJWE0vbjhaTGR2eDMrS2hxWDhOUVc2OGZNbFBhKytOQnpl?=
 =?utf-8?B?N2FXU2VwK3VpTm5kTERiZENjRnNEMzhqUmkwMTYyOFoxaG52d2hIZmwrcFBk?=
 =?utf-8?B?dW9zS0ZFWVpnNGliYlY0ako0UTBWdVZyZlV2R3M4YWpCYmhEcU9WeUFHSkI1?=
 =?utf-8?B?RUpYblRxVEpMNVBtVHJGZ1JFQ3laemk2SW92a0t5Z013aXk1V2Q3bXBBajFo?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E275A97596E2141AAF556BF7B2F1B6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e28993-da5e-437f-2379-08dcb57d64d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 18:35:34.6325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PoH3N9tu2qYjDAhqBOhvz5Q5qIXL7UO9oD/q3OlLG6vrwsEpgIvWxIVwlH/sl1Z38qxuXHSydZGBa4Cm92hmqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
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

T24gV2VkLCAyMDI0LTA3LTAzIGF0IDE3OjM4ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gVGhlIFhFX1BMX1RUIHdhdGVybWFyayB3YXMgc2V0IHRvIDUwJSBvZiBzeXN0ZW0gbWVt
b3J5Lg0KPiBUaGUgaWRlYSBiZWhpbmQgdGhhdCB3YXMgdW5jbGVhciBzaW5jZSB0aGUgbmV0IGVm
ZmVjdCBpcyB0aGF0DQo+IFRUIG1lbW9yeSB3aWxsIGJlIGV2aWN0ZWQgdG8gVFRNX1BMX1NZU1RF
TSBtZW1vcnkgaWYgdGhhdA0KPiB3YXRlcm1hcmsgaXMgZXhjZWVkZWQsIHJlcXVpcmluZyBQUEdU
VCByZWJpbmRzIGFuZCBkbWENCj4gcmVtYXBwaW5nLiBCdXQgdGhlcmUgaXMgbm8gc2ltaWxhciB3
YXRlcm1hcmsgZm9yIFRUTV9QTF9TWVNURU0NCj4gbWVtb3J5Lg0KPiANCj4gVGhlIFRUTSBmdW5j
dGlvbmFsaXR5IHRoYXQgdHJpZXMgdG8gc3dhcCBvdXQgc3lzdGVtIG1lbW9yeSB0bw0KPiBzaG1l
bSBvYmplY3RzIGlmIGEgNTAlIGxpbWl0IG9mIHRvdGFsIHN5c3RlbSBtZW1vcnkgaXMgcmVhY2hl
ZA0KPiBpcyBvcnRob2dvbmFsIHRvIHRoaXMsIGFuZCB3aXRoIHRoZSBzaHJpbmtlciBhZGRlZCwg
aXQncyBubw0KPiBsb25nZXIgaW4gZWZmZWN0Lg0KPiANCj4gUmVwbGFjZSB0aGUgNTAlIFRUTV9Q
TF9UVCBsaW1pdCB3aXRoIGEgMTAwJSBsaW1pdCwgaW4gZWZmZWN0DQo+IGFsbG93aW5nIGFsbCBn
cmFwaGljcyBtZW1vcnkgdG8gYmUgYm91bmQgdG8gdGhlIGRldmljZSB1bmxlc3MgaXQNCj4gaGFz
IGJlZW4gc3dhcHBlZCBvdXQgYnkgdGhlIHNocmlua2VyLg0KDQpTb3JyeSBpZiBJIG1pc3NlZCBz
b21lIHBhdGNoIGNoYW5naW5nIGl0IGJ1dCBJIGRpZCBub3QgZm91bmQgaW4gdGhpcyBzZXJpZXMg
YW55dGhpbmcgY2hhbmdpbmcgdGhlIDUwJSBsaW1pdCBpbiB0dG1fZ2xvYmFsX2luaXQoKS4NCldo
ZW4gSSBkZWJ1Z2dlZCBzb21lIFZ1bGthbiB0ZXN0cyBhbGxvY2F0ZSBhIGxvdCBvZiBtZW1vcnks
IHRoZSByZWFzb24gdGhhdCBLTUQgd2FzIG5vdCBhbGxvY2F0aW5nIG1lbW9yeSB3YXNoIHRoaXMg
dHRtX2dsb2JhbCBsaW1pdCB0aGF0IGlzIHNoYXJlZA0Kd2l0aCBhbGwgZGV2aWNlcyB1c2luZyBU
VE0uDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
dHRtX3N5c19tZ3IuYyB8IDMgKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV9zeXNfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N5c19tZ3IuYw0KPiBp
bmRleCA5ODQ0YThlZGJmZTEuLmQzOGI5MTg3MmRhMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3R0bV9zeXNfbWdyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV9zeXNfbWdyLmMNCj4gQEAgLTEwOCw5ICsxMDgsOCBAQCBpbnQgeGVfdHRtX3N5c19tZ3Jf
aW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gIAl1NjQgZ3R0X3NpemU7DQo+ICANCj4gIAlz
aV9tZW1pbmZvKCZzaSk7DQo+ICsJLyogUG90ZW50aWFsbHkgcmVzdHJpY3QgYW1vdW50IG9mIFRU
IG1lbW9yeSBoZXJlLiAqLw0KPiAgCWd0dF9zaXplID0gKHU2NClzaS50b3RhbHJhbSAqIHNpLm1l
bV91bml0Ow0KPiAtCS8qIFRUTSBsaW1pdHMgYWxsb2NhdGlvbiBvZiBhbGwgVFRNIGRldmljZXMg
YnkgNTAlIG9mIHN5c3RlbSBtZW1vcnkgKi8NCj4gLQlndHRfc2l6ZSAvPSAyOw0KPiAgDQo+ICAJ
bWFuLT51c2VfdHQgPSB0cnVlOw0KPiAgCW1hbi0+ZnVuYyA9ICZ4ZV90dG1fc3lzX21ncl9mdW5j
Ow0KDQo=
