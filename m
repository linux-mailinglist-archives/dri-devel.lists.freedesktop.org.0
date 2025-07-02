Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D049AF09A7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 06:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327B10E0CD;
	Wed,  2 Jul 2025 04:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eedTNQ4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2D10E00B;
 Wed,  2 Jul 2025 04:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751429620; x=1782965620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2COMv6nohc1L0e/yr86p9R2QohE5Nlyjg226Cfr5ujE=;
 b=eedTNQ4bQ5fI4vkTyvyCsnYpSGGXSWTpcL1hCruVBckdoDviYiaUdBLX
 FhM6rKCb273nnU68+20peOFqZDT9ADRQ0VvMi+jq3MZhFOFHS+2TUomAJ
 daFgU1JMMGh9n2ViLllmpKo2ish+bDcMp91UjMCSZcBQXr1f1SVM9l/mJ
 uaQk/jSYuhI4Ws8lAxa+Aij+MAYNok216A8gO7qdKaiLaBmWMRDMAxWxf
 q3W7uPk2cXLO3fsWITDFI5/6rcL7WhmTp0oaDLo/g3wAHdS/lgTcisnE2
 9+xAhMnzBWK3RJu/MGoURoeY/5viriStmU6I9LldS3B+mwvFf+H3G8TSM w==;
X-CSE-ConnectionGUID: n041met3Rz2/VO3aTJaEIQ==
X-CSE-MsgGUID: K+qNRzRrTmG9GDuCUq1E5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57519741"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="57519741"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:13:40 -0700
X-CSE-ConnectionGUID: ZP7XYdLeQmOnYMzukCNMtA==
X-CSE-MsgGUID: jogJ6ktkRJS//sy9Q87rDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="153582956"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:13:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:13:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 21:13:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf4PQe5dGlcIZBU0sArCrJGe/Pkp5HirW9m4bTrNUB/a3XFpPq+g048srGM+7CWvJg0rdj5TBhs85NGA9SHvrgiXMDQaILW56yKubrrOSSdC7561M9ov4tjgTKdvnSYONufpodheAmv4Fau0briB9w8lmj4lXj/vEHdan49R41eyIrQi5LgPKKeXFStQT2XtQMoxe/gcKBvW3EukskePwl7Zo/Jv1n+8F2FMGIjW8Go7i5HVc2gxlcYiVcZCkDGDEVhiAchsIQI+7g6Ngrek2KsOZXk6m4cl4mJH2/mkpTChaBSJ5zKxiQqrJ4gU0wwCmN9bwSvj2xJ2myxJAvj9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDMfZLQQ94RXKxA85S8GTOhfYFZWQ+SbOjCNSthMvDQ=;
 b=SphWEW8rN8XWqtUmIG3Kivljj+1yS+06YUxvS8dHCUO510gs8Yp2+TzR89lKP09ZNRp68uQPtm18QpG8jZrN07GSPmSCB5RghNutPzdXBh0ytJV4pyUCBMO3GghaVXeKTIrUJe7si61i0L+xVD3MOWF5G8yFToifSx8gT62fw7WB9TVmoJarag1ROrvUj0CHzHNj30gli14fb6ZyCvkpv6VRjEVSdDwIIwm3v6L1eMmiM4OMT6VaelPlCz4mzgzFXlvq/ybnxQjHGOYsV7dRI2eeAmzAXlAgzzrCdkhinrF1sH9W97TOfji3CLE6Eo3hKG0JkVDaP0sU0gA8QlT6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 2 Jul
 2025 04:12:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 04:12:50 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIndpRBhJ5fPkCmN63maa21qbQYgX4AgAR36YCAABR1AIAALxsAgABFPwCAAA7SgIAAsHog
Date: Wed, 2 Jul 2025 04:12:50 +0000
Message-ID: <CY5PR11MB621111D5B260680202AD78179540A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
 <2025070140-dad-jaywalker-0774@gregkh>
 <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
 <c48b565e-73c9-4222-83b6-dc3597427db6@intel.com> <aGQcQbiqDxKplFZO@intel.com>
In-Reply-To: <aGQcQbiqDxKplFZO@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: alexander.usyskin@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM3PPF6A4412A55:EE_
x-ms-office365-filtering-correlation-id: e1ff7e89-fcab-42cd-b2bd-08ddb91eb587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?DUOrHbUsBrsLBFV0RbGFrQxm4yiDvELRDuI+Hz/xwd1dm0eoVFem4jrDCA?=
 =?iso-8859-1?Q?WTlQYVu8Qcga5GT1JxhEoLD5oK5vlmujvBjnujAe4+rBN8TVLuW26yfdhV?=
 =?iso-8859-1?Q?R7EpUe2nGykwAOFlCJXCsBkKZx8rTjzMyh6al7t3OYeFAIX4KtvxBjaoBJ?=
 =?iso-8859-1?Q?uQxG5+WYNbQsqKQpcGmo1oDzx0FN6dXP+wPi14GaT1kCwg92+CWd+bNPTP?=
 =?iso-8859-1?Q?LeF4yPaeDUI6I429tYbEq8BKwE1xRfVzEtzFpIAGOXmzJdXk6IKfcDaUyd?=
 =?iso-8859-1?Q?8+e/lSjW1+2RQqI2NX8iQYi4Z9a3GdVKtS9YPJBssOMkZ49aIodqKQbySC?=
 =?iso-8859-1?Q?RdLoOb6VcIJ0sGinCPhFgu8klro/TIMOOKpPii1glbUnycDyXQ3cEwYb0X?=
 =?iso-8859-1?Q?pCoCtSbWP6wua7IZkxizhiIhF8z6o0cohj3gVpLCXO+H3bddvIhy189BH/?=
 =?iso-8859-1?Q?a1OA7yr/7iEoc59quM7itdq9Wsh/ugVpHVw3MF4GeHTynRipwDNUttL8EF?=
 =?iso-8859-1?Q?/Q5yv4eSrY7ttCKYq08GFhWTgXzhBsNb6qynqJ5dCcf4oKxhTwQNsFDF1A?=
 =?iso-8859-1?Q?9Q9asCoDaGxYVQL/eIshMTpR23Q1rF6OYj1UzQ6C31lbRgYE99fm8G4+BM?=
 =?iso-8859-1?Q?x7yBfeStTgXTVIHO0MWwv0kiADb8PzfSYJDkevOKwWIu8aaBRg70rB9oPH?=
 =?iso-8859-1?Q?sDirBCX4vTrSkGFo1gDcSF4TyzBa3T9kfGvfWGeyHyfFcYzW8WGfUl7X1d?=
 =?iso-8859-1?Q?Pqlft6HO70/Ynw8Hh2GGleL70jF3VySwY2VSSBHWZEoLLFCMFMODFCJsek?=
 =?iso-8859-1?Q?U6APb99AnTj/kxeLyuTwt/V4D53iC4fgSdogWNRcers8Gd3rfXpOuGwKnt?=
 =?iso-8859-1?Q?eIds0N5iG/VdlF02gTy9L4PzDmJDzgn2DfGGQEg2Gg3uL/PmBSHtdzfFmN?=
 =?iso-8859-1?Q?GI5CufXCGBf3XHgD+1GP1l9qk6Mld/iEMbXJXSazIIQbOOpXAc63SOossg?=
 =?iso-8859-1?Q?BDVuAUTiXPfOiVGBnC3lihwWEP3/7yqhKkxXhCsUv8aN35ITSjhONBukCu?=
 =?iso-8859-1?Q?YvE+PKON6O9z2xLVDexumV9JJg2Emwv2F0XlLsmRJETBi7ONwXUpupCmqD?=
 =?iso-8859-1?Q?kH319HR0ROo1Ttt2uGYjEgCPIW2ymQyfJQo6M+LfaUEEQF4E0+nCbzr04k?=
 =?iso-8859-1?Q?mbryfwmwz1h82oNQynu4JWptsWyHAq0GIvVr8wuM47ACW9E3i1UX52DAu+?=
 =?iso-8859-1?Q?ffKB7Veb78s8F1+CjoIlzgc2kA/RtMpFrGZA0bCXTPRcihIe/43E7KjYv5?=
 =?iso-8859-1?Q?722NsXHbkMuJImcrQHPB16wQwac486SUyeDLGa0ersi2gyfU9CK/WHsltX?=
 =?iso-8859-1?Q?sFw+9iOZV4XgiWOlwgi8tPE7eS/m67i0iJwHLACyBAnISKe3qYc+cJiuHe?=
 =?iso-8859-1?Q?04QuexuUekPPNYCHb+6mNShDBpBdRiI0c4rhhn9GXQ1iUJYPvBNOU1ny0g?=
 =?iso-8859-1?Q?O8A03Q3OtWB1CKhY9/0B/Ys7gfYBiPGEChPcN3d4jiU/zn7yLLydymcVSo?=
 =?iso-8859-1?Q?xChL96Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WzR/r0zCkhl9q5d7Imxn5KVjHnqv+viSs2W9EsHCBHrmm2HxKHztRy0j3y?=
 =?iso-8859-1?Q?h1B8k6CIucy9FNdUjx7kpNFN893JLy2H3PpZCoYZQqN7gMiPZqQmpt2OBr?=
 =?iso-8859-1?Q?bnMR2LoB1M0YlELwWbJWdbnWz7sfxirDj6TwChpZYLVsd3edCdejCkg2LQ?=
 =?iso-8859-1?Q?JVFkriEL0p2UUYWsCD101EfshRMqHQV4Xbm/NtpYYrJ5AkaBAoeG6uxPn0?=
 =?iso-8859-1?Q?/O9jRVexPNB+PIQceBiZN2OgVKRszxOgAUaf6tbHEq9h9S5R0PgfOfLNaa?=
 =?iso-8859-1?Q?gINMknQ2Vayz3g/ex2eZcfWxMorWj1QvyyzG/T+E1RQ1VvHXVIMGdx0VtI?=
 =?iso-8859-1?Q?s6oSFUK7LqQPE6NERjvhPoQA12VUYlPoX/d6wrkj3cT4QR5ES4/ZGBycD+?=
 =?iso-8859-1?Q?qZjQnGcPiS8/ik95RpYIGwemz3d9Cv21rzgMBZSOgpFsaaBgRpHi3QfUd6?=
 =?iso-8859-1?Q?S7txJWOzJFc1XqmEK6WGApoQhJpq2M2sIw8Fv/lHkHtBzOqci/8w5EtW5s?=
 =?iso-8859-1?Q?5l37NC38Y0JoM9J53uyl6kHyDLXybopnM65+7Sg2lMk3TZ+JsEVqqlYLd2?=
 =?iso-8859-1?Q?e4vrMR4wKEcMGc00Afn3Wj84wisdIo1Ksj1ohTDZ1WIUtoVVTXXklEHaz+?=
 =?iso-8859-1?Q?WSQjskF6vs9R+T77BU/ijZt+xMBgKVYsjHQV0wp0Pv9jX4CsvYwpBBEpU8?=
 =?iso-8859-1?Q?yjtBKKYCWuLLZOE99Mq7NSn7Vy3Dwa8tV7N0ivshSqsAnQ9GtHo10IGCEM?=
 =?iso-8859-1?Q?BI/52pAbLiMgs5+6lRsLf0BcuQHf309+1AGWTAyWVLHSG3KW6hSsTvi8Ew?=
 =?iso-8859-1?Q?C3Mlazg6Jav8vFWdPF+J9rN93QW6uL5GI7DvWXchyVWIeYhebek6pY5aSx?=
 =?iso-8859-1?Q?7T4a1KCfI1j7lWKdpwEi9KYbrV1afEDSgwE63/ZHfRQa2yCHzyu+6xne6C?=
 =?iso-8859-1?Q?mB/m0xsaFL2qqKU9W2e8OmO5/qJkI0lHwX+UrESGISQvaesAp2Hw/Mr+d5?=
 =?iso-8859-1?Q?KVaL51q5d0cCF2H25z1OW6Df1QlW8G+dmjpEOeniVfdiAAc1SIj3BJ2fHG?=
 =?iso-8859-1?Q?4LxgaKmRKK7WY21OD95LcUwdfTkF3UDjlGlnlUi2ueQUJZ34NrKvI5VDRc?=
 =?iso-8859-1?Q?qMVcAKYooSiUyw6kT06MVZYcqsp0wZ+f5SrNTqjZeTCedBPkesWyj8Td/N?=
 =?iso-8859-1?Q?C3/HVNfav/LeZ1VjDXghXdlBmdtjajIvnEldsUf7WwAR1lOl8o1SXFRst/?=
 =?iso-8859-1?Q?6D3sVi4ZA6ZQLDncX0ZI3N3QzlB9i5IcmIB4UQzitkzE7fAUvlUlCY07OH?=
 =?iso-8859-1?Q?vqd/M960Q527CJWnVU+wbUNg1FADhAliIyUqdirfStnkLETI3iSG9zai4M?=
 =?iso-8859-1?Q?YuIxe2cXdM8jcjGNoVoPph69o1HLMQUh7S4uvEh55SXW0yTmn/LB3DKERY?=
 =?iso-8859-1?Q?WDyxL1eqq44Ac11ExATM3YQF8aiTkSB1zYtrFRM84udthRfParQtTS/EA6?=
 =?iso-8859-1?Q?FAa5qgB1zfCIcE6fefmU2ubXg4zLGL9n9F5YGmjMe5ucrP1auiI2XSbbSb?=
 =?iso-8859-1?Q?G6C0CZIKoSFkBKDHJnJ1kGNg9iwjmJZN/gkVm+IID+2mR243RumCetAiEC?=
 =?iso-8859-1?Q?o54+XeLbM2nrh6rv2UGu049tlXTLuO3q7Y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ff7e89-fcab-42cd-b2bd-08ddb91eb587
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 04:12:50.1672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNnn+8uHaxduzNcREwCRq5dkAHVx5738W2z/ZJ3IKV3SCW+hr+3fQPHjeWWyJqTXEtpxXTqQMxFJtNE2Y/9WXPPiMlXPHehQ1cH9ISkKHQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
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



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Tuesday, July 1, 2025 11:05 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>; Usyskin, Alexander
> <alexander.usyskin@intel.com>; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Gupta, Anshuma=
n
> <anshuman.gupta@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component
> driver
>=20
> On Tue, Jul 01, 2025 at 10:11:54PM +0530, Nilawar, Badal wrote:
> >
> > On 01-07-2025 18:04, Nilawar, Badal wrote:
> > >
> > > On 01-07-2025 15:15, Greg KH wrote:
> > > > On Tue, Jul 01, 2025 at 02:02:15PM +0530, Nilawar, Badal wrote:
> > > > > On 28-06-2025 17:48, Greg KH wrote:
> > > > > > > + * @payload_size: size of the payload data in bytes
> > > > > > > + * @payload: data to be sent to the firmware  */ struct
> > > > > > > +csc_heci_late_bind_req {
> > > > > > > +=A0=A0=A0 struct mkhi_msg_hdr header;
> > > > > > > +=A0=A0=A0 u32 type;
> > > > > > > +=A0=A0=A0 u32 flags;
> > > > > > What is the endian of these fields?=A0 And as this crosses the
> > > > > > kernel/hardware boundry, shouldn't these be __u32?
> > > > > endian of these fields is little endian, all the headers are
> > > > > little endian.
> > > > > I will add comment at top.
> > > > No, use the proper types if this is little endian.=A0 Don't rely on
> > > > a comment to catch things when it goes wrong.
> > > >
> > > > > On __u32 I doubt we need to do it as csc send copy it to
> > > > > internal buffer.
> > > > If this crosses the kernel boundry, it needs to use the proper type=
.
> > >
> > > Understood. I will proceed with using __le32 in this context,
> > > provided that Sasha agrees.
> >
> > I believe __le{32, 16} is used only when the byte order is fixed and
> > matches the host system's native endianness. Since the CSC controller
> > is little-endian, is it necessary to specify the endianness here?
> > If it is mandatory to use the __le{32, 16} endian type, then is there
> > need to convert endianness using cpu_to_le and le_to_cpu?
>=20
> I honestly don't believe that specifying endianness here is **needed**.
> I mean, it might be future safe to use the __le32 and flags =3D cpu_to_le=
32(1 <<
> 0) just in case someone decide to port all the GPU code to run in big-end=
ian
> CPU. Very unlikely I'd say, and much more cases to resolve before we get =
to
> this gpu use case here I'm afraid.
>=20
> Weel, unless this mei here can be used outside of GPU context?!
MEI is interface driver for CSC firmware that is also part of our GPU.
So, it is completely un-realistic CSC having different endianness as compar=
ed to HOST and GPU.
@Usyskin, Alexander what is you opinion ?
Thanks,
Anshuman.


>=20
> >
> > >
> > > >
> > > > > > > +{
> > > > > > > +=A0=A0=A0 struct mei_cl_device *cldev;
> > > > > > > +=A0=A0=A0 struct csc_heci_late_bind_req *req =3D NULL;
> > > > > > > +=A0=A0=A0 struct csc_heci_late_bind_rsp rsp;
> > > > > > > +=A0=A0=A0 size_t req_size;
> > > > > > > +=A0=A0=A0 ssize_t ret;
> > > > > > > +
> > > > > > > +=A0=A0=A0 if (!dev || !payload || !payload_size)
> > > > > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > > > How can any of these ever happen as you control the callers of
> > > > > > this function?
> > > > > I will add WARN here.
> > > > So you will end up crashing the machine and getting a CVE assigned
> > > > for it?
> > > >
> > > > Please no.=A0 If it can't happen, then don't check for it.=A0 If it
> > > > can happen, great, handle it properly.=A0 Don't just give up and
> > > > cause a system to reboot, that's a horrible way to write kernel cod=
e.
>=20
> I agree here that the WARN is not a good way to handle that.
> We either don't check (remove it) or handle properly (keep as is).
>=20
> With the context of where this driver is used I'd say it can't happen.
> Since xe is properly setting it right now and I don't believe we have oth=
er
> usages of this mei driver here.
>=20
> But if there's a chance of this getting used outside of xe, then we need =
to keep
> the check...
>=20
> But if you keep the check, then also use __lb32() because we need some
> consistency in the reasoning, one way or the other.
>=20
> > >
> > > Fine, will drop the idea of WARN here.
> > >
> > > Thanks,
> > > Badal
> > >
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
