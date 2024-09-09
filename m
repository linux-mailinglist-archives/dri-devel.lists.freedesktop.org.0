Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A0971EC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 18:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F88310E5CE;
	Mon,  9 Sep 2024 16:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsJIt7Bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A19910E5CE;
 Mon,  9 Sep 2024 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725898204; x=1757434204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fMtwf0Ad3XZSJ5BmtJRfDIS5SlmbD+1uVbFPJGWmc1I=;
 b=XsJIt7Bw+ynci+lxcfluiy+EJBK1YfFW/43o7YTSOMH9b9xB9wfm1XfQ
 vm9+N8HkHDzHlfeDCSLSQMaapmQEiH+uGjE+GEB+980CcLTG83Ds+bjK3
 hn1TL/6BDoQCJtPR8YIarZ35vgGGIuunk/lrmFl+Mv3pKdqLVaZM86Hww
 R2RBQXb8tCwlFfHSCI9G0gNJIOQZ92YrF1lXrHvenhpmsj0sQEVxmqFoC
 pqAUq/SzaMm2EMo6UJ2bdTodSjHcPPtdyPv2384PDQxd1fS00dcYQUD/8
 F49HzkArlXTtby7kGGDs+il0l6LghNf4QiVaiMXks1k+JrWh0emHaMXg3 g==;
X-CSE-ConnectionGUID: dFF5P4JuQkWIs/yaOkDMZg==
X-CSE-MsgGUID: aKNyfwrySRebWEFo06W0oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24756059"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24756059"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 09:10:04 -0700
X-CSE-ConnectionGUID: uywivMRdTQmJN0ZPJDLWdg==
X-CSE-MsgGUID: I2JMtTaYQ1WIxYfIj2QFPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="70824856"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 09:10:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 09:10:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 09:10:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 09:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiBkz3cdp8gGFEKHUXURbKHJGd9bGSi13GDIAZomcNwbHB3SnJ3wh2pYxMkFnOZFFE3L1YC3/8uhu/E5UTvE647yvnBF/UbYDm2XblXezxNm7rplyHxp/RT8mA3cPA38FvrwJ/gCWkTvE9YGBJdYoq1uTpZwtiAfYKuzc6C+/PUvT777mbdoD/xHPChDw9uR3/BAK+WkL0yKxJ2NukO2sBEBYTwXvg20GbsO1otoWXnuV5VGDqMYKYw2Pq80IQLXUkwz/5ku90tQUnFHUSDGtoRA+k7ccH0zGCcXFngxIyVEG2sAuEGFxmV6f2tLlkGEuQ/39ytxlqxP6KVgLJyzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMtwf0Ad3XZSJ5BmtJRfDIS5SlmbD+1uVbFPJGWmc1I=;
 b=pgqb52YF2fsYqFWqEb06az4RRJDhdT47hqF6kyUjFWa1VeO0W45T41Pvk4IL8sybsyapScNO4dtPI2k02XTmGMESsiSqXQfCf9+b8p+OTf/mvWXUsngv5GDXxx40qQV0jWYs9T3ydVvMTtBNJsmZsVnASBveLnTZ6leyJctehufxBeD+xIwYBmnGiCHXV7cQ65b70lVR/gIlxoir5tTFIXtQTEBtt2dlTBgsmbiCDGJWpLQGcC6YOMTrbjd++lKSSUQXH3ygmQsba/pfkNBqoTa9e2OVpxkjudQtxp6mltCSBhptkJmKz9oAoaPX4pBMnNl3ZfHV7l42NEL2QF2iGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 16:08:13 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 16:08:12 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>, Hugues Bruant <hugues.bruant@gmail.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yu, Fenghua"
 <fenghua.yu@intel.com>, "Chatre, Reinette" <reinette.chatre@intel.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>,
 Julius Werner <jwerner@chromium.org>, "chrome-platform@lists.linux.dev"
 <chrome-platform@lists.linux.dev>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [REGRESSION] soft lockup on boot starting with kernel 6.10 /
 commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
Thread-Topic: [REGRESSION] soft lockup on boot starting with kernel 6.10 /
 commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
Thread-Index: AQHbAoUXCU2+GdbFwEygAz1aapAWGbJPGA4AgACHL1A=
Date: Mon, 9 Sep 2024 16:08:12 +0000
Message-ID: <SJ1PR11MB60831AF34B75030EBA3D5721FC992@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
In-Reply-To: <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB7674:EE_
x-ms-office365-filtering-correlation-id: 3fda8308-7730-42e5-66e0-08dcd0e99b28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZWRjekdqeEs2VTVjWTgxTXA5eGhUaTVqLzFGeWhKQ0dqVy9QNnhVWXJ1WnpH?=
 =?utf-8?B?QnRXZGMxeXEzbi81K1hFb0l0dGZmMnMwQmFkLzVJM3VqcDVnVHhOTnVCbTdu?=
 =?utf-8?B?dEF0cEljbXF1RmhxRUtVTitSb0hFOHBXNGdIT0VSU1Avait5ZE5wUlM3S0Y3?=
 =?utf-8?B?Njd0WkZlTDB5eXpqMStLdnZnL3Rzb01uOHJEVkVnUGJUNXUrTnNxR1dUcGh6?=
 =?utf-8?B?eXdXVyt1UndsaUYrcUJ4WUhUMEpXOUo4R2Y3ME9OSk0vcnNnYmtBSVRzTzVJ?=
 =?utf-8?B?YTRCaFZhdjQ0WFUrc05wcUVmck91MFVJK3Vud2pRSXY4R3dYUitnTmZIZ0dQ?=
 =?utf-8?B?YnFnT05jQmU5eWs5eEJWVmVMTEljL3J6ME91M1Q0TVlSSFl5Rk5xNnZtdzJI?=
 =?utf-8?B?aVVFY0VFTGtCWkRFRUJ5UGdhY2p5a0tSVC9RdVA5a0FLZ2NKeXRDZXVSQWFE?=
 =?utf-8?B?cFR3TWRPeHlEK1B6WFFRVG1KT3BQd0t5dXc2SW1ucG5NTUIyQkhqVWt0YUg0?=
 =?utf-8?B?dFhuREt4bzJadkdkcnZWYXRjeURDYk9RN2dRSlh6RVlzQ2l0eVpEU00xZWNh?=
 =?utf-8?B?cDl6U2JySWZjOFF3dFlsakRuaEJySGhtZVhIL3NJbWZNOTNScGh3K1NhektY?=
 =?utf-8?B?RE5QZTU5WkQveDk4cGxKWUpUbEdpekRTSWFBSk5UeU51UW1HWklUM1B2UnNi?=
 =?utf-8?B?RjBRUnBETmI3UFI3UnB1TnAzQ3cxYTFRanRBUVp3YnR5aS84R0lnbFdXUElL?=
 =?utf-8?B?WExDSTQ5a3RUQkY1MnBDSGRxa1hIYjRRRE9VMTIrNmVaNldmeUtBSUNuei9o?=
 =?utf-8?B?ZVVRU0pFaWE2WVMxYUJDMTVnY0t3NnBNV2dEU3V6RWtrWHBHbStJMGhiMjJh?=
 =?utf-8?B?VWs4ZTJ6YW9pdzlJRExVOHdObUVTSEhIV0RnSHBmVDFpV0t5VXFQNnBLN01D?=
 =?utf-8?B?blhxeXNZTDFwcDVEdk1uNTdKdzhoT0NWdVpBQ2U3dW9OQjljZnU2QTdlekNC?=
 =?utf-8?B?UzV2ZVVKanAybXNqNXZrNHk1cTJ3RlVGNmNPRGRtUEZpZGpPZUFHUFdEZ3dv?=
 =?utf-8?B?UkI5STFRMVdOd0tYWG9mZ21jK1B1aGgwd1VMQ2pyaXlOZDd6dTU1cC9ZUExU?=
 =?utf-8?B?Y1IxQmxJbU10cnQzb1RuSDUycHQzMjJQclhJeEJONEpGZ2Jta3B6dFBjcTRo?=
 =?utf-8?B?WDRSejdybjVrM0NRR0V6ZVNpczR4N3EwdzlTbTRSTHk3UURVMzNYYWpuUkN3?=
 =?utf-8?B?Umh2NDV2bDV1UEt1ZVBSVzl2TGl0SGowZ203ODErYWZXdjJQU25PYzcvMDN1?=
 =?utf-8?B?b24zaEpwcTREakZjbHQrZUkvanlTZnFON1c2aTdsT2kwOEpBTnFiRTdIblFY?=
 =?utf-8?B?ZDdQb0RPZjhNM3N5MkxuaksxdXhXaVRWbkJ6UTVlNitqRWhpVWttWXBlTjJD?=
 =?utf-8?B?Q0s0ZlhvVTFJNXNpMmJFWmFsZ2kvaWZPWkQ3ZERNODZQblFaVWZ0ZEU2YzR5?=
 =?utf-8?B?TCtYSTNVeHEvM3hOM3Y2eEI3V1doMG9HSFZ4RFlJSy9vSFhUUFJtVk1LSndE?=
 =?utf-8?B?VlNTd09WdVpmVGY3VkJLREJXczVqZW41R1VUMThKVHNvYmN2NURhMVVGRkNV?=
 =?utf-8?B?VGpNdStjRjdMVjBRTytqUWxyYk5TcTlkM0xUOFowQmZqMC94bVBpSVJwVVBp?=
 =?utf-8?B?TkRvbWk4TlFVZ3lIcEc2WWRDWVhrNUVxUWpRQnBycmpELzZZZnBSQkx4a0g4?=
 =?utf-8?B?clErTHRIa0VxaE11VGw5dGtKQ1hta3hSQkRsLzVFb3hjT3oxa054eEVFRzl5?=
 =?utf-8?Q?ro8niEfBCs79AltrwGLwa0dRsr+vqQHM9K2g8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzNMMDlselE0Y3MvSkdjc2dIS1hJTmdXRi9NajlDTjZpcFNGQzgwcDdWK3VG?=
 =?utf-8?B?SVZ2eDRQVEMvZk0yZCs4WmJma1ZtdjZYTG9GYXdwQWpmalhuTjVYajlVRFRT?=
 =?utf-8?B?MnBWMUZqK29pYXZOemdSTkZyWVloMEhteWZQZHdBbUlWdU9yeUhhQmhwZHlR?=
 =?utf-8?B?Qy82WHVTN2ZQZnFkRGtCcVp6Qis0bCsrRXF6TVdwNHhFd0lyYS9JTk1PYit2?=
 =?utf-8?B?OEFIeGdFWFNYTWZVSkFmZUdSa2UwbU9BL3NLOFg4eEs0cFhpVzhlYzBZVXZN?=
 =?utf-8?B?NjNlZGlrZDBmYlN1TW96RTg3ZTVNdzZYbjB5NS82eEs4OCtWanVoV1Flb292?=
 =?utf-8?B?RStSdGpVamEvb0pVbUw2dkMvQnBRUXNMOEZkZENJY2NTOFkwUUt4dVJjN0lw?=
 =?utf-8?B?UGxBa1R5eGhxdndLV1Ixa0JZWlJEZm96TS9nYjN5UkpySEJTRTVzbGxsWGFm?=
 =?utf-8?B?Y3lKQkpwRXZmMVNESlNiR21iRTNRQ3dDblNxcHY5N25wNHZYTDV0RklPN2h2?=
 =?utf-8?B?c0JKTjQ5OCs2Z0Y2R2FQVlhSQklPTENsN1FHcFVzVHdpYi9SMlhWaEk0b3Ar?=
 =?utf-8?B?WjlYK0dCVk9pdGZPaEJBeldrMU8xNmFOb0FrYVlkZGszL1VXM0FjaFlpaWlK?=
 =?utf-8?B?QnlPSVplNnlxZVJtZHlXbzQ4eFMyQk1RM01RYW1uRGRXS3UwRExURjA2WGZN?=
 =?utf-8?B?RWR2NG00NEV5Tk1iQVVTZHJBQWtWN05YZVJqeGhIWW9vb1lzbk5Tejd3TWhz?=
 =?utf-8?B?dnc3NmtHQ3YyV1NUYmpJcC9xSGVqdkVnR0VKWk5HdmhveUZIQnVqUzZqSVNv?=
 =?utf-8?B?QkNsV2FGOFNlejRuRmwvRTZscktUTkhkTDhEY0Fua1cyeFdaNWhGUWlzVFhR?=
 =?utf-8?B?cGNZVHh0RW9WQUE4NUU2WHFjdHRDUGo2dDIrWFBXeGVnYUxVL1EvV1VUNHhH?=
 =?utf-8?B?ZmJFZFM1ZDVLQ0t2cEE3V0UzV1UvQzQxZXUrSVVkM0JOS0lBWWlGVURnOTN4?=
 =?utf-8?B?cFgyVTJtS1haN2VsbDBPUThOTUY4djJvVy9VRkYzTEVIWTFidU11V2xsYmNy?=
 =?utf-8?B?d0FJb2kyK3dPdnR6cGkxOFZkUEJqZVAvZjQ5aUkzdHdtczNLbnZsTTRrZXhZ?=
 =?utf-8?B?TThtdVVUa3pRNWtyUmJSRDI5MnNDTmtkQmxWUFMxWHFSSWdUS2ltQmlJMXAv?=
 =?utf-8?B?NW01RThDQlJoUGVCYW5WejRhSjByNjltUEV6UXZDQThGb0tmTzFqSDZ2UE9G?=
 =?utf-8?B?eTh3bGdvSkxuekpaeHZBVkdrTC8xU1IxMDdiNzBCazNhQVVUNjZkSG5oM0JV?=
 =?utf-8?B?TjlGRjAvMWJ0U21Gek0wa1JJUWVQbVM4dG1mVlhyaGlvVklSVnJKTFBmVzZG?=
 =?utf-8?B?blg0YTdPMzZYZStYNHVtYStFbE03Q2IwY1NXSTZwY2tmSk9HMnQ4MFNSWENW?=
 =?utf-8?B?Q0pKQ1FUZ1JRcy9adjVnVXAxS1lwSm8xVXhvZkdkdTlaUFB1MEIvS2hIYWRN?=
 =?utf-8?B?U2cyWExvMXdDNVRobEt4c28zOHJLeDZTZllpQ1JXNjg4T2NqVVF0ZHZwdnNl?=
 =?utf-8?B?cWhIOHlIWDBRenN0eCsyU2c4L3ppMFE4OWpQYkNyZ3JMOHQ3cXN1RkhqV2JZ?=
 =?utf-8?B?ck9hRnFjWkd0bUhjZXZBTkgyRWp6M1U1RnZVZHltaWFSSXpNQzB6NFBNWktk?=
 =?utf-8?B?Ykc3Qkw1bFE1Sm84K2JnVy9xMjhFZUJBSzliRTIrS2lCVkszMFNDNmdxMmVj?=
 =?utf-8?B?S2hNZ2h5dEFldklPWGMyeU9MejBZRXZlN0NHVWlzWktsRlF1dmp4YThvUDhL?=
 =?utf-8?B?RnJhS0UxMnlUUnFOVzdNWGxRVnRyZ2t1NTNzc1B2Z1NVSExYbS9zYXFLdFV6?=
 =?utf-8?B?eXE1bmVsTHVDRWo0M29TaFJlM1E4Mk1kV0E3QlRWaDZ5SlFqU0hpWFNKdDdH?=
 =?utf-8?B?QTB3RzRuM2kyVCt4YzJUMDNzZ0RuY3NTUi9XTktTUmltdEdWTFlZcldPY3hJ?=
 =?utf-8?B?aUN1YTUvRkg5ak1aQyswMWpoUnRNN3NqckRkREdJSjVMNHFtVEl5RlE3Y3RO?=
 =?utf-8?B?a2k2a3ZFb3JrSVNVOHZJSlFaYkhHem9DcjFBZDZ5NldNSXRHT2p4NUszS2s5?=
 =?utf-8?Q?v0cp8H3/epkrF9apF8j/P0BUt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fda8308-7730-42e5-66e0-08dcd0e99b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 16:08:12.8436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOSY7D7OteZlcbcwdE7YQJcr6m42kb2wH3n2rs+WmS/ta0MGhezJ/ZJq5ABLLYfF5pb00MKeUGyGCvbjq33r3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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

PiBJIGhhdmUgZGlzY292ZXJlZCBhIDEwMCUgcmVsaWFibGUgc29mdCBsb2NrdXAgb24gYm9vdCBv
biBteSBsYXB0b3A6DQo+IFB1cmlzbSBMaWJyZW0gMTQsIEludGVsIENvcmUgaTctMTA3MTBVLCA0
OEdiIFJBTSwgU2Ftc3VuZyBFdm8gUGx1cyA5NzANCj4gU1NELCBDb3JlQm9vdCBCSU9TLCBncnVi
IGJvb3Rsb2FkZXIsIEFyY2ggTGludXguDQo+IA0KPiBUaGUgbGFzdCB3b3JraW5nIHJlbGVhc2Ug
aXMga2VybmVsIDYuOS4xMCwgZXZlcnkgcmVsZWFzZSBmcm9tIDYuMTANCj4gb253YXJkcyByZWxp
YWJseSBleGhpYml0IHRoZSBpc3N1ZSwgd2hpY2gsIGJhc2VkIG9uIGpvdXJuYWxjdGwgbG9ncywN
Cj4gc2VlbXMgdG8gYmUgdHJpZ2dlcmVkIHNvbWV3aGVyZSBpbiBzeXN0ZW1kLXVkZXY6DQo+IGh0
dHBzOi8vZ2l0bGFiLmFyY2hsaW51eC5vcmcvLS9wcm9qZWN0LzQyNTk0L3VwbG9hZHMvMDQ1ODNi
YWYyMjE4OWEwYThiYjJmODc3MzA5NmUwMTMvbG9ja3VwLmxvZw0KPiANCj4gQmlzZWN0IHBvaW50
cyB0byBjb21taXQgNTE4NmJhMzMyMzRjOWE5MDgzM2Y3YzkzY2U3ZGU4MGUyNWZhYzZmNQ0KDQpE
b2VzIHRoYXQgSW50ZWwgQ29yZSBpNy0xMDcxMFUgZXZlbiBleGVjdXRlIHRoZSBSRFQgY29kZT8g
TW9zdCBjbGllbnQgcGFydHMNCmRvbid0IHN1cHBvcnQgUkRULiBZb3UgY2FuIGNoZWNrIGlmIHlv
dXJzIGRvZXMgYnkgbG9va2luZyBmb3IgInJkdF9hIiBpbiANCi9wcm9jL2NwdWluZm8uDQoNCi1U
b255DQo=
