Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA420A5E1BF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 17:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A5010E044;
	Wed, 12 Mar 2025 16:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtiX5d6X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A67610E18A;
 Wed, 12 Mar 2025 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741796900; x=1773332900;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rEvqy24kaiAFv0qz1NFX/wpBzHKZWVNSjIAaDiKBWg=;
 b=XtiX5d6Xz+IBQqH7p1iile/f0GKGZx39lRC+Ee3hDpGamqPFAz5vPGDj
 mMIEI6G7oO8kaOpUFKm+gvVyvtuoYeVMaRv/a7aU8Cchl9FHxeubE0Xlv
 IbmnzQBE1734DnwKnGhDFtJ1iKj8jAHMmt8KoG6TCbxedteZ5741K7BPI
 3lA0C4AptRGk1DawkkaeR1I0eu4n/H3rOwMkRK92wLr52iE+thFHiPMhj
 A4awFqeZNtDOxYglSoU96bLg6iq+kSlszExUTsRjZliJGy+n1ADD1gVpr
 o8eSAUayGgNf0Mea80pwz3s4cRs4G9gQk76hlmHh7iQ/s0vzHBqtZro26 Q==;
X-CSE-ConnectionGUID: rJTiaQOnRuCthN6v6ao6Lg==
X-CSE-MsgGUID: n8SXN0n0TZGkZvoXWSsVmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53513340"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="53513340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 09:28:17 -0700
X-CSE-ConnectionGUID: HX4CPm8VT06g5AuOsickhg==
X-CSE-MsgGUID: 1VtuEIHhQhKLqbCxlzIEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125748763"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 09:28:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 09:28:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 09:28:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 09:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc1JIxIgi1qStDxytviIzVxq5mk4G+68kSIGunwa+ImFtTXoje/csufbhRP25PtrlDPfLKIklo73UjK1tBH1P+kvsoHvZ3j7q40+tMDqzvkIethlwO2dQgUG23Rm0pOieKRrCSVvuR5QPI/R+NN3vTbG8nT6JJ6x03glO4+Zx/M8bap2cOOEenbYIWz5+jTNdcpPSSI2H9iepYU4Z5BizSUg5ovQTclScxIlAveJuBUimI4EL0G8qZ8iPk1KeySRkErqmtt+2Qv3h5Wpp0wIpFoq3YKqBlcuM7eg/TiLzSr1Bi8mK/qBUJoQvKkJZA08Rx1yGD74DLtPpUbHg9n0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV4StxaOJCQUKxc3/6c10xQlM/oeIzOX/z7DzDIS5qM=;
 b=yiNye48hPrbJsLFt5VMRJJk32eWUJu6NBtbbSQORlaBRTDAa3mZsKbEj7Qs7xagk7ztr/o3rIfRmAo+1mAy/yG4NAMoQ8TKifKa1s7UhmDZSjM18XZM6TAxb0WSU8bomi29tfRqPT37C2yBOQgd84uoY+mMhj/vzEEtNRN8WB1IJH1UFd86C2482SOHfhHwiuldCryQA8H2msy6C1r7RkCcPwUDJWpOdGSy1mAh0EH9seYWyJn61Vzd3oAgsi5DFMXjEy7jKyJswkf3aKdUt6r2UGeKFwkC+fvHwrEH7KdrEmBETxN0Qx3+AmJQPIwSO+NeO/GpDTx2tuWwudTNwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 16:28:07 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 16:28:05 +0000
From: "Zhang, Jianxun" <jianxun.zhang@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Topic: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Thread-Index: AQHbkeCBNr1za9vwG0GyIufnEkKJtLNtXoMAgACcqgCAAbWoyQ==
Date: Wed, 12 Mar 2025 16:28:05 +0000
Message-ID: <CH3PR11MB87072343A480183FA06D30FCF4D02@CH3PR11MB8707.namprd11.prod.outlook.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-5-jonathan.cavitt@intel.com>
 <Z8/BHmPM6h/agrvX@lstrano-desk.jf.intel.com>
 <CH0PR11MB544407DDD988B9B66C0E501BE5D12@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544407DDD988B9B66C0E501BE5D12@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8707:EE_|SA3PR11MB7528:EE_
x-ms-office365-filtering-correlation-id: 1193e25d-22ba-49ee-22e5-08dd6182de09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vzO778cFbqa3bDUdf0NrxzWc6eIaXV3UDCEasxQurKoonQFcUJF8ZFdMNE?=
 =?iso-8859-1?Q?vjXEFaUEAXJfRmV5Pj0X/S1AhnUwo4QoK9hbiJ1O1wn8Ja/sxlRDMhKaFk?=
 =?iso-8859-1?Q?rAKyJ0ZqT26bIoJMcCS3XFInG+ZOpvK4PNpOgMyr3n66uUAZ7Hd/Sz0q+Y?=
 =?iso-8859-1?Q?ykNi+4Lqtj0mDbItJR9YwmfvjOrKYxmrDLc+N6NZzlokoA0FdquWmrzGn2?=
 =?iso-8859-1?Q?YvDaKMZsTBXKur6aRAX/HMmNOXJI6FSU4EpKUF0ZgvEtwIAgRutmCNx78q?=
 =?iso-8859-1?Q?aFXB4VyTs20ebXnBpeI+m2D0fg2dwBAy8vCkLAIjCu9zHUA1ejpXiny3iF?=
 =?iso-8859-1?Q?cf2VwyQixhUPul9GBn7Jqvwv6nAXPGRHzTVhRXG/62Z4mZfgAsgHud8wA6?=
 =?iso-8859-1?Q?Xy1dFLr1YJprBqhdR6/nZVudT++deR3d9/YLy76bfhQWrEeEBDnaKRAelv?=
 =?iso-8859-1?Q?iJfYj+KVZcAZT6OrPGnAUKwkBPKxiIcPnUkMTDYyT9NA6awK1nPBd2tSmd?=
 =?iso-8859-1?Q?oj2rJQnmhHINH5M2XFfLZ6wwPHhOsj3mFDQnejwFnz9rmcRTQ7kajNd02q?=
 =?iso-8859-1?Q?+VXF3b79AV8dWvUZx6nT2SAn8kSK+keuxkaWa3ZZKuLPsoRYtnu/0Oq/fr?=
 =?iso-8859-1?Q?axYJQRBD8JGU7qmQ7xFmWwiRQ+BkchPnuTqFKlZXSBcelkFjS40/XPDDKt?=
 =?iso-8859-1?Q?TBEa/AijeLCGgdz6071La2+pKW7R7dcPiAZerC2QRaJwtqtQqkRqoYoUit?=
 =?iso-8859-1?Q?SHBlX5x5n9bGN3W3BZaBoSKqW2NbgG9r8cwdF6W1c4EMQQ7BAZ1Jr1PIA+?=
 =?iso-8859-1?Q?7SMAH23c8KBbDCF+lIqlg7WG0PnCdqBqphLrv85ueQcSsk7L0xIDNd4KwX?=
 =?iso-8859-1?Q?bheQbMtITuTuMH9m1n/ilvpnwLgYXvWof/X/p6HG4Qn+tmQDkYq3MY1RZP?=
 =?iso-8859-1?Q?3dihlLjPn5nBf65ueR4Iem2KTWd32DJ8V5kOrA3Wqhbp12rmByaPLsN1t3?=
 =?iso-8859-1?Q?5mFGQYLsIMU8NmErZJtThxn6mz687w7DL56hpeXp6UJ8/brU6+o67+2Qw6?=
 =?iso-8859-1?Q?SgEvM2r63+ct7UnmRmFUE6LswJMWKc+0kNEZ6WI8if9PSSkpRpnOqXqKfi?=
 =?iso-8859-1?Q?MSa4GX+ZZZUEk1kAlTYkmFUaD8bPcC8et1h5Rf9s2H2Srka1lB2bbOwrPp?=
 =?iso-8859-1?Q?+dwjnFX4+C/OQzrPonnDRRFbfCJ4mJlHJYMT4dlI33likPdXYtWCipSZol?=
 =?iso-8859-1?Q?88vPj08U73JeadF3lLn08XrxPKgCDHMav3yM+d8lo4/v3jpjclw4/e0a8H?=
 =?iso-8859-1?Q?KHcgE0odXV/5SPyZL0IA7A840OluhYX6hERPHFvryHpUKzcMf5Ab+aM87+?=
 =?iso-8859-1?Q?SjPfzgKY4j1/wDO9BRSZIb/B79UcWYAASQcjCDFPXBK9qHmNMKd6VUoVZc?=
 =?iso-8859-1?Q?h/79Hp59qa7wQiTb74gnavr9GEgQeb0573r7y9OLr5QoTNUhwdk2NJKG2Z?=
 =?iso-8859-1?Q?d4Ql2c44BSfezCJ6shslvC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?l4ZrCbtn/ECHehmOsn4dyAKuICIxbFIbn+BRrWPQKNF+53sdZXzSuPeIjJ?=
 =?iso-8859-1?Q?pBS4B+Sd0h1yS1n8oy+YzZU1cJZk2RVF3Ih2IRY/pRIfwXyqffyCYj71ZO?=
 =?iso-8859-1?Q?IEt+LE0aJS0GDpcv5QzcCVtLLM87GvgQ8q6NgovALYzXnDR8zp9WFzz8Oo?=
 =?iso-8859-1?Q?Oh5sdfv/XS7LJ0r3fMdtpol063VKIPk562O3K2yZ5jhzsCpDX3YO33k2aT?=
 =?iso-8859-1?Q?7VxrYJ8qs/RugD3zE7r1WQ7EXNt54D3NwEi64867FWoBJw9mj6Fm2Jn6kR?=
 =?iso-8859-1?Q?4AEI9eMQnM560ok9mKcXQGp5g8lTf4mvENyCdmdS6Sp72HQ/rsENOpT33K?=
 =?iso-8859-1?Q?d0TyKhupL8KrrRHlRDET6KZV2wgndqYIsexJUQmACJsyTgZhIsKzoeK8yj?=
 =?iso-8859-1?Q?sXfPpLWkHCR/m55la0wbXJmn32mdeLSOkzwqjib68Ln9H6w8mDE+V/dlC+?=
 =?iso-8859-1?Q?DaDtvjU5eXoWDSUuFueYCNY+3yjeXg30MzvB7OowvlwPNy3E7e02+k3fpV?=
 =?iso-8859-1?Q?xnQOWL897SDoXCyLGMg5FMLBOuwCsKUYwRrNlKUGKiaUrdZNVfeyR8JscS?=
 =?iso-8859-1?Q?iubjp0zHi/Lhn02pumsv3x+wwWt52dfTB2QINif1faj1CjkaxNJQxg9JzL?=
 =?iso-8859-1?Q?AzuaE4C1RrwWj9lo9D9qNO1n/lMZCKABh6wsVuNALywTD6laNuNy8MinMT?=
 =?iso-8859-1?Q?kKO4DwfrFZRZzCKZFAjV288NQsbWDHCnJu8P7pCuMz1DeQNemgeifau7cu?=
 =?iso-8859-1?Q?I3+gNGeXq2co7RnUIvqD+nzl0iZ98WI2GTlHQ6lUpa66fXt+l3tvQZphdi?=
 =?iso-8859-1?Q?X6I3DH1hJfVvF+ic5rGbsopK59iwoohPz3Z4z7RzcTiPYa3Jlq1iJ0nJp6?=
 =?iso-8859-1?Q?k9M6svIODJ1rTFG7sAzf0MWTXrq9cQA5uBEmWmQxm1T+2qObnwqqy2dlYz?=
 =?iso-8859-1?Q?EZ/w3754cFICdH2zXfkz/qotI4/5Ip1uMuJdEDvOqjyzHSNBNTp9D2vFkL?=
 =?iso-8859-1?Q?AYY61vkyEMyUK9qusfxzPQbcYK3dtG91L4oxsXB9EsI41cf6Y0Nb4KLP5m?=
 =?iso-8859-1?Q?O2WW2+taYtfvXIndKldn4TGIRHtWX4dk2KJOdWynvi5aGF3aJxg+rKrKxn?=
 =?iso-8859-1?Q?M2c3Ex+C7qr1UOm8CBvtbhBR5RuOKEYGmcyomIEKUzCtjHepJxmKai4G0o?=
 =?iso-8859-1?Q?cvGJzDCTMCULjWTWalVMjwWv+6iJ540rlUGOI/n3pNEjzHICVccfdH6HxS?=
 =?iso-8859-1?Q?d5YHf+jV5A4F5ANale6MEEyfHBgC39Aqzkgaaqtp/JSBa07sSTVWv8Yj+b?=
 =?iso-8859-1?Q?zqJedO4Gbsr0TUdUYqqOrt83W2mn8pugBVZyOFeAq61TjeDkuvjE1UWwwk?=
 =?iso-8859-1?Q?w7MhAQXD/S5yXll+vebPGWNtYZy4Tr1Q1DhVpQhtEZlWbaJfoUQXVfeoV9?=
 =?iso-8859-1?Q?V+LG2bUC1TaAkMaUVy79DXPI5+A/byJAXcMcy+jTSPTA7sjO8mBVbk3tc3?=
 =?iso-8859-1?Q?FJX//tvWHtk+vUzx1FKAGCZNyfps3utjqBPvZ2Rs6HD00QvUc+B45QCNep?=
 =?iso-8859-1?Q?f3HRprRplZae1ax62XFpLGJeNETRq7//db0ItjVvkGN9AA/Wkn8yI8A2id?=
 =?iso-8859-1?Q?vh8/n4jj4oZ1L4jITooVUw2ikgEjS97Mg3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1193e25d-22ba-49ee-22e5-08dd6182de09
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 16:28:05.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIgvWkaeH2Ht3vZgIrDlw1dEPY++D4GUn8qhyZCn4SPoRqhp3Hq5zb7mVYAJuok8LwprD1UOu+gcirsMfFgI9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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

Sorry if my reply is still in a wrong format. I have set plain text in the =
web-based outlook this time but don't know if it really works.=0A=
=0A=
Refer to my inline comment, thanks.=0A=
________________________________________=0A=
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=0A=
Sent: Tuesday, March 11, 2025 7:11 AM=0A=
To: Brost, Matthew; Zhang, Jianxun=0A=
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg; Zuo, Alex; joonas.laht=
inen@linux.intel.com; Lin, Shuicheng; dri-devel@lists.freedesktop.org; Cavi=
tt, Jonathan=0A=
Subject: RE: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults=0A=
=0A=
-----Original Message-----=0A=
From: Brost, Matthew <matthew.brost@intel.com>=0A=
Sent: Monday, March 10, 2025 9:51 PM=0A=
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>=0A=
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org=0A=
Subject: Re: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults=0A=
>=0A=
> On Mon, Mar 10, 2025 at 05:18:32PM +0000, Jonathan Cavitt wrote:=0A=
> > Add initial declarations for the drm_xe_vm_get_faults ioctl.=0A=
> >=0A=
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>=0A=
> > ---=0A=
> >  include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++=
=0A=
> >  1 file changed, 49 insertions(+)=0A=
> >=0A=
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h=0A=
> > index 616916985e3f..90c2fcdbd5c1 100644=0A=
> > --- a/include/uapi/drm/xe_drm.h=0A=
> > +++ b/include/uapi/drm/xe_drm.h=0A=
> > @@ -81,6 +81,7 @@ extern "C" {=0A=
> >   *  - &DRM_IOCTL_XE_EXEC=0A=
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE=0A=
> >   *  - &DRM_IOCTL_XE_OBSERVATION=0A=
> > + *  - %DRM_IOCTL_XE_VM_GET_FAULTS=0A=
>=0A=
> This should be a generic "get VM property" IOCTL, not a specific IOCTL=0A=
> that only retrieves faults. This allows for future expansion of the=0A=
> uAPI.=0A=
=0A=
Question from @Zhang, Jianxun :=0A=
"""=0A=
But first of all, should we regard faults as a property?=0A=
"""=0A=
-Jonathan Cavitt=0A=
=0A=
Thanks for Jonathan relaying my question here. I just feel it is a little s=
trange to treat "faults" as "property". Perhaps it is just a naming thing. =
But I get KMD wants to take an extensible and consolidated approach. Either=
/any way works for me in UMD.=0A=
=0A=
Thanks!=0A=
=0A=
>=0A=
> >   */=0A=
> >=0A=
> >  /*=0A=
> > @@ -102,6 +103,7 @@ extern "C" {=0A=
> >  #define DRM_XE_EXEC                        0x09=0A=
> >  #define DRM_XE_WAIT_USER_FENCE             0x0a=0A=
> >  #define DRM_XE_OBSERVATION         0x0b=0A=
> > +#define DRM_XE_VM_GET_FAULTS               0x0c=0A=
> >=0A=
> >  /* Must be kept compact -- no holes */=0A=
> >=0A=
> > @@ -117,6 +119,7 @@ extern "C" {=0A=
> >  #define DRM_IOCTL_XE_EXEC                  DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_EXEC, struct drm_xe_exec)=0A=
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE               DRM_IOWR(DRM_COMMAN=
D_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)=0A=
> >  #define DRM_IOCTL_XE_OBSERVATION           DRM_IOW(DRM_COMMAND_BASE + =
DRM_XE_OBSERVATION, struct drm_xe_observation_param)=0A=
> > +#define DRM_IOCTL_XE_VM_GET_FAULTS         DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)=0A=
> >=0A=
> >  /**=0A=
> >   * DOC: Xe IOCTL Extensions=0A=
> > @@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {=0A=
> >     __u64 reserved[2];=0A=
> >  };=0A=
> >=0A=
> > +struct xe_vm_fault {=0A=
> > +   /** @address: Address of the fault, if relevant */=0A=
> > +   __u64 address;=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT         0=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT 1=0A=
> > +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT        2=0A=
> > +   /** @address_type: , if relevant */=0A=
> > +   __u32 address_type;=0A=
> > +   /**=0A=
> > +    * @address_precision: Precision of faulted address, if relevant.=
=0A=
> > +    * Currently only SZ_4K.=0A=
> > +    */=0A=
> > +   __u32 address_precision;=0A=
> > +   /** @reserved: MBZ */=0A=
> > +   __u64 reserved[3];=0A=
> > +};=0A=
> > +=0A=
> > +/**=0A=
> > + * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS=
=0A=
> > + *=0A=
> > + * The user provides a VM ID, and the ioctl will=0A=
> > + *=0A=
> > + */=0A=
> > +struct drm_xe_vm_get_faults {=0A=
> > +   /** @extensions: Pointer to the first extension struct, if any */=
=0A=
> > +   __u64 extensions;=0A=
> > +=0A=
> > +   /** @vm_id: The ID of the VM to query the properties of */=0A=
> > +   __u32 vm_id;=0A=
> > +=0A=
> > +   /** @size: Size to allocate for @ptr */=0A=
> > +   __u32 size;=0A=
> > +=0A=
> > +   /** @fault_count: Number of faults to be returned */=0A=
> > +   __u32 fault_count;=0A=
> > +=0A=
>=0A=
> fault_count is implied by size.=0A=
>=0A=
> Matt=0A=
>=0A=
> > +   /** @pad: MBZ */=0A=
> > +   __u32 pad;=0A=
> > +=0A=
> > +   /** @reserved: MBZ */=0A=
> > +   __u64 reserved[2];=0A=
> > +=0A=
> > +   /** @faults: Pointer to user-defined array of xe_vm_fault of flexib=
le size */=0A=
> > +   __u64 faults;=0A=
> > +};=0A=
> > +=0A=
> >  /**=0A=
> >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE=
_CREATE=0A=
> >   *=0A=
> > --=0A=
> > 2.43.0=0A=
> >=0A=
>=0A=
