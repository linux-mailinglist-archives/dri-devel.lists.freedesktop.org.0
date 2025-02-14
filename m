Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB19A359AC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E09710EC0B;
	Fri, 14 Feb 2025 09:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Prg60RX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730CE10EC0B;
 Fri, 14 Feb 2025 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739524065; x=1771060065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=9mHOhE/G0Ykv5EtYnOrRWP0r8MNoojNli0lo7gEgwBA=;
 b=Prg60RX+ElcggMqsF31CqmH3Ou4tl4yXbfreM0f4QAlwyeJLncK9t7Ap
 0ijwEZkSbamj/bdVC9V5KcKKW7WWTWQANwZiu5Q5H4xOgEMmsdumM4SoX
 Rq+V00EX86cdj9yM8olrIPTvZGPLF/vL4NfvgZadnzhJHHtGmV2maZ80y
 GnrI1XPH2xN6nbJGbb9OWMqL/xxrtTHxji/c+mHb5uZNi7TSscxpXRG6q
 9OTZCXQGQBo0ANsuyorxIgQqFKlVA/x0TBsk7VkHkNPSsZtjOktEqGooM
 BNS9l2/uxJI9f4KAv3pFWxhMdRKfmc2C5gVGzNWo61jZMPd9X8pBSXicd A==;
X-CSE-ConnectionGUID: vmVipQMzQTGHF33q2iflgg==
X-CSE-MsgGUID: a97sAs20S5uEOthjHuqaIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57673397"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208,217";a="57673397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:07:44 -0800
X-CSE-ConnectionGUID: YYXqKFxoQ/yzZhjsEoox9g==
X-CSE-MsgGUID: xiDRINmNSEa/fmnyCObiMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="144341987"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 01:07:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 01:07:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 01:07:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:07:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycmmVfWiktLVa1pq3afNL91PDNtJ1JEheN3cZqPELvQE1SMSXyZCADtg21Ep6MyesLlOkyKrMvqxU+ga5HrWWSWZLSFtFvnsCuPqAzx5OxCmbdk28yrtIcFpKl71PTKie+VAMCLHinhnEiSTOPSbLQjwqlKDGI1JncYh+YwrYUejtjRebE844xNZ2aZ4r2Ot0FdB2oArXAl47PfCTdj2kFJfHdT3Ct+oxDyXl6Ub4bbaJp9wJsQgEB73mJc6lXoTc82x87TluB8KjGjLmZg4R5Kgq0i1bkcFleBakEhlTyWM3xc51oKonsKcSkEekseawf824OpNfhzHVfH6CAQ+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0/L9VRMzbmmy78M5bT7XtA7Edid3ltcgL9jriWgRIE=;
 b=V+0qVoq1YfEnRIwb2cp9JNqiO2t9IqKDXFolC7t5iHDQzSkje8VhWLdQQE+1OoC4zXRiZAkyQnizX2v7O1YtTNdr9SIje0AJNJqpmGlgcrt+c9qB4RgeD8o5/ECayrQAkbnyhMt24zbcm8M9E3rdtGryK1zaerlQoGV9z1pwarQRaGDEGWa0mWTi+xn6PTQSaN17srj+FQZftQtbqTBy7hB/BjD5l7sggEavjBOuKUsrgmfyMDQH0bgzveTKDEdPJxSMU6HpPoQZ4CQkeQDcniKXfOaD8o6/YFWBg4EL6bHCXQATY9VKsSN6keEnoXqncNktAMLGYUpsPy5/90ybag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 09:07:39 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:07:39 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "apopple@nvidia.com" <apopple@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "felix.kuehling@amd.com" <felix.kuehling@amd.com>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Thread-Topic: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation
Thread-Index: AQHbfbx0tm29quczTU6iC1uqisINKrNFv3gAgAC/JICAAAVlMQ==
Date: Fri, 14 Feb 2025 09:07:39 +0000
Message-ID: <MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <Z65ix566lLCPOsob@itl-email>
 <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
In-Reply-To: <433228556ac6ad42b21c942dc6c070069107660e.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MW4PR11MB7079:EE_
x-ms-office365-filtering-correlation-id: c3613a2c-c7a7-4728-6c2a-08dd4cd70857
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?SD/4Axje0rRPT5bIjw/Ae/UV8T4/RXufnHiI+reTA5jkAsQRzi1F2hQZoQ?=
 =?iso-8859-1?Q?eHxRJmyFO0GmVAO9a1HUC3NU0ycKhH3jMtEPBAsDYULo3HY1MQeG+/eNI3?=
 =?iso-8859-1?Q?Xk2477QJJuE2uWmUZ+QkA1aoKWLKcTLf7EHAqsMfLbHmx+MCAaOLEqRjPe?=
 =?iso-8859-1?Q?1Wou4OYC3KeG6Jx4jsLWLbOEg3YwqjH3U0m/iWSzoj59AGWYh62wLQF/Ka?=
 =?iso-8859-1?Q?LF4x1IZ0CXcvDjc98SnAokZV7XIrJ2Gotyq7okwkiLT06uBekfowdqaQZD?=
 =?iso-8859-1?Q?CnQoQP+wFMqgujxlYV5Y6Rnu505KcjX0SOD54TLQqWah9TWs0Xwc+A3DLD?=
 =?iso-8859-1?Q?/XFuHPBPnFpsOI2NQyos33XulZ6vJCxvDzuvKeNoSti/htBBXYbFQ+XExn?=
 =?iso-8859-1?Q?lRsMi8RPBfypdXzIFvVy9VO+zOmhyXndbJjO88oUNqz/tCdyN73STkgWnF?=
 =?iso-8859-1?Q?Y8KN2VPhNdIsQs5K+TF/HFuMeLj7LqYUeHsMg1DJfBIvqnxDW0jyB+vetz?=
 =?iso-8859-1?Q?J/VTJNdiSMpjuPGjzf1DLwlz0y246VEWPNARlWb3iUhluKwTcST/npwhym?=
 =?iso-8859-1?Q?fl/3+n0VFr2igGtBeWjsIaAl1qR3yXfGDhVke5+g9GvVOf6cxUPk2NXkA+?=
 =?iso-8859-1?Q?nk59YR3Ov2kAmbnBfVMCtdrpsNJwAwx8MfTwZIe4LbNtSdUKq4SJDu0uGL?=
 =?iso-8859-1?Q?O/LGlvds343NdYXNK3d8OPmc4cVXKWsa3KdiyCgSjQAhYlXYFeBhuoJ+AB?=
 =?iso-8859-1?Q?CEl4dLUw/T+MDhOjqEdm0jKCelT1GychWKrkZqpeTk9vfjiO++Gwvpd8qq?=
 =?iso-8859-1?Q?Mgef9+cw+eMMt4UsjdRnLf5jxBXs8ADhdNwXM3uG8b71Bu3suceie7QrVr?=
 =?iso-8859-1?Q?fcpgDNWne65D2tny7SY3ZwBv9nCzSSRJYiBDjRMoxdNZVA1CSB4Zk+9S34?=
 =?iso-8859-1?Q?vwLwo0Kv1AeiX9XySPbPYZBzuZbcpbhZaWXq5MiBIHQoijpWT5FN9co7vG?=
 =?iso-8859-1?Q?vStCu/w5vCb0BK595WJnfQQphtEi7QpVvqXxQGHPumb1y+Mqjh8FAT2qwn?=
 =?iso-8859-1?Q?RiLEl/MwFP/m9MZqsQFKyS/QAWro1w591+wDmxs6cuz7BWKafGNBTrF4NV?=
 =?iso-8859-1?Q?KENY6+BOCRG9AsvjkvwbhVi8ZC2NTemdCSYdetN4WcSvC1z+bvuSvs46fT?=
 =?iso-8859-1?Q?e+5oqoEwFQmdUzDOzyfZcrsgtOyHyCn5y0Kk4MLHvXS7aj+YmwIi05P9VK?=
 =?iso-8859-1?Q?YNkzN3ec12bAZRq3UtJtFsTPRxfjo0TdwSSgcrhwoTtRIbZrD2c+WzOUj1?=
 =?iso-8859-1?Q?kQpsQsC4CJp+vCA6rj2iOs4VgeEdxWXleNpguORPbXbZDIH0YBD2wF/7gh?=
 =?iso-8859-1?Q?iIbMLMgW76kY6mOIlpafDJtzKC/dzaIEXC7d5Nqt1zUUCErllgzxCP51IX?=
 =?iso-8859-1?Q?Fwq9kPtoGUl6ZFt1JGwVrHSYS3eUbTO1YqODLG+PpfGQ1F1bWPLfIWtMgx?=
 =?iso-8859-1?Q?n7sG45IbYiWk8C2i8OA/zi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xhciQjeRqJdHm7NCbUgnfFU8kIAmuyqlFybc5il5DcJcP9OONB1ui5iZlJ?=
 =?iso-8859-1?Q?eDV+q8d4qtRwdmJk5DyKSVM7NfqbB0f4FyTRYEF+AVX/OKegfufyr2vFK4?=
 =?iso-8859-1?Q?t4wibuG65RuyWjlg81SLkzPdMBRfMHvdQ93pe6z1cfBQbpWOSTN+axwMko?=
 =?iso-8859-1?Q?aAKLvyMmsgnWO54L3AnqHPE7kT7MCPF95TJdcuyTBs7tMRFJZSowI8AC9L?=
 =?iso-8859-1?Q?Bc9pQnIDPorB90FrDyS8/k4AdnIlezlN7YJ1vMhwj2x/wOg/rxWiFgY7kP?=
 =?iso-8859-1?Q?UYztkrRFuk31SUl8LgdFIuboQELC9dU+JSRh+YFX0ENlxt6pWDbtPTtkHA?=
 =?iso-8859-1?Q?F9Uzkt0t1q1gDPH7c+QVPFM960DoFoHitZ2Hk4O1B9AYVVE2xk1GqTL/Zo?=
 =?iso-8859-1?Q?NFwcJKBhq6CmwpTroiT4K3+0ZabiXWn1S52e+NwcXMpQjyeOeQfUGCUzLq?=
 =?iso-8859-1?Q?/VcVwHtCDyVaWwTDghzNBRly49HfDRNgHbyCSnntFqWcMwKc63N4MCVFJh?=
 =?iso-8859-1?Q?hHgTllVQEt3YIoXo1SsdQXt4MnMkRKpLN4WDT3q45wCcy+DqtJd8Q03j+i?=
 =?iso-8859-1?Q?xdg5YYBMLdy3wKlWB4SaynaQnB9rWLvFLEyFgL0hmpfvErUseCWH/3HqFc?=
 =?iso-8859-1?Q?He8Pf2BlEBHk3JcY7di/0bBpt4NUVbdy5IpyHKPYKYz4SWHyZh7xkrGcN4?=
 =?iso-8859-1?Q?n+m+xFAD74tRrndo2V+jxXDk4OxclU+R89K7E1M6m/3tXR/mZX/5PFJbDv?=
 =?iso-8859-1?Q?TiniL2sv2avyZQLAPibDr+wPUgWneDrKmm1+ayxQkGHjUPFYsQzqM7pPXB?=
 =?iso-8859-1?Q?okjE2yYToD948qICAYBcqGVUxjYgpAyg/E3NYzibowCjwy4txJJIiCUgq5?=
 =?iso-8859-1?Q?qTGheAhzHcyV0b+kqkLfeW7mezLkXDpj7t/FCHKF9sbMA2VyF4GsHvFoEv?=
 =?iso-8859-1?Q?ToHfbEw1BC7XcpcdZ3HBXseiEyDlzo6b3ubYBKjAHUvq58AFaJsCgLuXd/?=
 =?iso-8859-1?Q?hb6qbeXeCZ4DVHi4znD7TenkHaWqeShOxIc2iFrEIE5E367+qoXSkjk/7z?=
 =?iso-8859-1?Q?HiuKdkGgUGkrsfn/KZ4W9rhdikcUFeYOPD9byJHMnah18EqA3quXpzyy8c?=
 =?iso-8859-1?Q?/Mw0Eeg2O0V8nran3TaYibNGPH36bMrHaA0J+912EG5I/q0g+b57Af/OIT?=
 =?iso-8859-1?Q?mtql/8XEZk6Sub0dZvsx57/R42aUEauMRw5tzQ9jtzsqTdfpzt8+rs4R0G?=
 =?iso-8859-1?Q?NTPe1ayWrn/rIOxKQZqlDaXtRcTC7rev1ZV47AhRvtKjWCjzbINTKd4dNN?=
 =?iso-8859-1?Q?TsV4fo1veAjdRkCY5ROPbbuZOHXnRXokxZuZU511Lg0J7LH5zcl9NCfSqH?=
 =?iso-8859-1?Q?gU34zblsYGMiQqXNxNIIQMYP6oXSBqz7urIeGmxR3n5yCFKluf7BDtXdln?=
 =?iso-8859-1?Q?KSt5+2dAjUrJl9iorwOLsj6fmQSaIgLdgBHBEzx4FGK2llMOlfIDByrBzk?=
 =?iso-8859-1?Q?R3W4mhbQ+pdgj7iLhf345B9pH5kQORBmuVYJ5S+qGjVjazOC8CjL6YVm0K?=
 =?iso-8859-1?Q?ZlpGF4VQbiMjsT7HDi/S4NUCKef8xGTT6+VUqwkSnRKM60s1wgn+mjEnyG?=
 =?iso-8859-1?Q?gAVT4f81meEMLrAVi8qpsWsO7kJfvsLWGpYVTSVfoqoaA1wfAYMOaN5zCH?=
 =?iso-8859-1?Q?lKEaEW1fv82Yve401Zc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2MW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3613a2c-c7a7-4728-6c2a-08dd4cd70857
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:07:39.7539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sdkp7llc0dD+K3mp8Y4a3hnejPXaQFn3pPmclV9YVaJJcHWyZ9eBycxsA7D9ZRaV7WyA2Ndgxgnt4EnHyw32Sb4ZKWwhQ4z3fGzGAAls0oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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

--_000_MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2MW4PR11MB7056namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

k,
asx.ddk
________________________________
From: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
Sent: Friday, February 14, 2025 2:17:13 PM
To: Demi Marie Obenour <demi@invisiblethingslab.com>; Brost, Matthew <matth=
ew.brost@intel.com>; intel-xe@lists.freedesktop.org <intel-xe@lists.freedes=
ktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org=
>
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; apopple@nvidi=
a.com <apopple@nvidia.com>; airlied@gmail.com <airlied@gmail.com>; simona.v=
etter@ffwll.ch <simona.vetter@ffwll.ch>; felix.kuehling@amd.com <felix.kueh=
ling@amd.com>; dakr@kernel.org <dakr@kernel.org>
Subject: Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implementation

Hi

On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:
> On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:
> > Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas,
> > Alistair, Himal) for their numerous reviews on revision 1, 2, 3
> > and for
> > helping to address many design issues.
> >
> > This version has been tested with IGT [1] on PVC, BMG, and LNL.
> > Also
> > tested with level0 (UMD) PR [2].
>
> What is the plan to deal with not being able to preempt while a page
> fault is pending?  This seems like an easy DoS vector.  My
> understanding
> is that SVM is mostly used by compute workloads on headless systems.
> Recent AMD client GPUs don't support SVM, so programs that want to
> run
> on client systems should not require SVM if they wish to be portable.
>
> Given the potential for abuse, I think it would be best to require
> explicit administrator opt-in to enable SVM, along with possibly
> having
> a timeout to resolve a page fault (after which the context is
> killed).
> Since I expect most uses of SVM to be in the datacenter space (for
> the
> reasons mentioned above), I don't believe this will be a major
> limitation in practice.  Programs that wish to run on client systems
> already need to use explicit memory transfer or pinned userptr, and
> administrators of compute clusters should be willing to enable this
> feature because only one workload will be using a GPU at a time.

While not directly having addressed the potential DoS issue you
mention, there is an associated deadlock possibility that may happen
due to not being able to preempt a pending pagefault. That is if a dma-
fence job is requiring the same resources held up by the pending page-
fault, and then the pagefault servicing is dependent on that dma-fence
to be signaled in one way or another.

That deadlock is handled by only allowing either page-faulting jobs or
dma-fence jobs on a resource (hw engine or hw engine group) that can be
used by both at a time, blocking synchronously in the exec IOCTL until
the resource is available for the job type. That means LR jobs waits
for all dma-fence jobs to complete, and dma-fence jobs wait for all LR
jobs to preempt. So a dma-fence job wait could easily mean "wait for
all outstanding pagefaults to be serviced".

Whether, on the other hand, that is a real DoS we need to care about,
is probably a topic for debate. The directions we've had so far are
that it's not. Nothing is held up indefinitely, what's held up can be
Ctrl-C'd by the user and core mm memory management is not blocked since
mmu_notifiers can execute to completion and shrinkers / eviction can
execute while a page-fault is pending.

Thanks,
Thomas


--_000_MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2MW4PR11MB7056namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto">k,</div>
<div dir=3D"auto">asx.ddk</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Hellstr=F6m &l=
t;thomas.hellstrom@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, February 14, 2025 2:17:13 PM<br>
<b>To:</b> Demi Marie Obenour &lt;demi@invisiblethingslab.com&gt;; Brost, M=
atthew &lt;matthew.brost@intel.com&gt;; intel-xe@lists.freedesktop.org &lt;=
intel-xe@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri=
-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel.com&gt;; =
apopple@nvidia.com &lt;apopple@nvidia.com&gt;; airlied@gmail.com &lt;airlie=
d@gmail.com&gt;; simona.vetter@ffwll.ch &lt;simona.vetter@ffwll.ch&gt;; fel=
ix.kuehling@amd.com &lt;felix.kuehling@amd.com&gt;; dakr@kernel.org
 &lt;dakr@kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH v5 00/32] Introduce GPU SVM and Xe SVM implement=
ation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi<br>
<br>
On Thu, 2025-02-13 at 16:23 -0500, Demi Marie Obenour wrote:<br>
&gt; On Wed, Feb 12, 2025 at 06:10:40PM -0800, Matthew Brost wrote:<br>
&gt; &gt; Version 5 of GPU SVM. Thanks to everyone (especially Sima, Thomas=
,<br>
&gt; &gt; Alistair, Himal) for their numerous reviews on revision 1, 2, 3&n=
bsp;<br>
&gt; &gt; and for<br>
&gt; &gt; helping to address many design issues.<br>
&gt; &gt; <br>
&gt; &gt; This version has been tested with IGT [1] on PVC, BMG, and LNL.<b=
r>
&gt; &gt; Also<br>
&gt; &gt; tested with level0 (UMD) PR [2].<br>
&gt; <br>
&gt; What is the plan to deal with not being able to preempt while a page<b=
r>
&gt; fault is pending?&nbsp; This seems like an easy DoS vector.&nbsp; My<b=
r>
&gt; understanding<br>
&gt; is that SVM is mostly used by compute workloads on headless systems.<b=
r>
&gt; Recent AMD client GPUs don't support SVM, so programs that want to<br>
&gt; run<br>
&gt; on client systems should not require SVM if they wish to be portable.<=
br>
&gt; <br>
&gt; Given the potential for abuse, I think it would be best to require<br>
&gt; explicit administrator opt-in to enable SVM, along with possibly<br>
&gt; having<br>
&gt; a timeout to resolve a page fault (after which the context is<br>
&gt; killed).<br>
&gt; Since I expect most uses of SVM to be in the datacenter space (for<br>
&gt; the<br>
&gt; reasons mentioned above), I don't believe this will be a major<br>
&gt; limitation in practice.&nbsp; Programs that wish to run on client syst=
ems<br>
&gt; already need to use explicit memory transfer or pinned userptr, and<br=
>
&gt; administrators of compute clusters should be willing to enable this<br=
>
&gt; feature because only one workload will be using a GPU at a time.<br>
<br>
While not directly having addressed the potential DoS issue you<br>
mention, there is an associated deadlock possibility that may happen<br>
due to not being able to preempt a pending pagefault. That is if a dma-<br>
fence job is requiring the same resources held up by the pending page-<br>
fault, and then the pagefault servicing is dependent on that dma-fence<br>
to be signaled in one way or another.<br>
<br>
That deadlock is handled by only allowing either page-faulting jobs or<br>
dma-fence jobs on a resource (hw engine or hw engine group) that can be<br>
used by both at a time, blocking synchronously in the exec IOCTL until<br>
the resource is available for the job type. That means LR jobs waits<br>
for all dma-fence jobs to complete, and dma-fence jobs wait for all LR<br>
jobs to preempt. So a dma-fence job wait could easily mean &quot;wait for<b=
r>
all outstanding pagefaults to be serviced&quot;.<br>
<br>
Whether, on the other hand, that is a real DoS we need to care about,<br>
is probably a topic for debate. The directions we've had so far are<br>
that it's not. Nothing is held up indefinitely, what's held up can be<br>
Ctrl-C'd by the user and core mm memory management is not blocked since<br>
mmu_notifiers can execute to completion and shrinkers / eviction can<br>
execute while a page-fault is pending.<br>
<br>
Thanks,<br>
Thomas<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB70561D782F6A83E6B4A63BE5B3FE2MW4PR11MB7056namp_--
