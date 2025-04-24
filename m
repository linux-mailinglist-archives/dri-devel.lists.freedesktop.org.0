Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22AA99E8B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 03:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1282B10E437;
	Thu, 24 Apr 2025 01:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZCNtZXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650C10E137;
 Thu, 24 Apr 2025 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745459853; x=1776995853;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IoE8xtlxy7r1B1VsoBpx+b5Ya4xzI/Dyv+GqE8IgToQ=;
 b=DZCNtZXsNYCsFlVjrIhtUh41Gmukt5hE3oGYfrwv339/dT85r6SI83T+
 kibRIStZ2b5YeaL0382+pYwf6jUv0oxcZazYVHEJuYaGzoSxnkjfXwAY2
 qoXY59TPvEKXNgg1wJUXy6OztHjObuOQ3J791j2iWHKMIHvzS2rGiEGkR
 BNBaEJQDdI3VNly9pbOsk5N9ImiDfWcXgbmprIHu6joWEIoOEBe82O4PQ
 mssaL3U5sOQ7GpVroiQUxlQKugY283MvgzZlHXiBsDEahdP5x05NKPfFw
 RZeV6j6EYZcIDy049H5iGtBt9+hO0ggfUAV8rh8LXjPr9VpQ4aKDHD3gM A==;
X-CSE-ConnectionGUID: a37OwaJ1R+e9fPsnyNHdDQ==
X-CSE-MsgGUID: 7rh1ez0sS2+2oSr39wBh1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50898953"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50898953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 18:57:32 -0700
X-CSE-ConnectionGUID: 9VKzbELNQ/6HalisCQANyg==
X-CSE-MsgGUID: EnMzZsV3SLGK/pzSEDaiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137568449"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 18:57:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 18:57:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 18:57:28 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 18:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okQ8FHk0VBDb3ESn0LY9Dv6a0N3k2JlQGbdH4NFGXXZ9jf/Su7xKihEsZifTeDmXhtbyXshXmc2VTdhQozcVZGs617+Y1yIHp2D73gCURYI1wCEx1/2+Ot23k0iN9gRQqR7eqaCvN0aaxgYhRhDd/IfvvB7peCCiIlPTgcE1wE90mc/p8zaj1uJcUwAj3B14xTmLOV09eG9qaGTF6iAF313fC8QNeucqcUjgqohJ4k/aSdDrj2pxiOZZ7A6Y/UWfI5ZHezb78qsQ03siRdkZ//0GYWGBOJ2hiiI8AgNUShSSlBDJ6BmAqyTrjCfsd/K97obXdsXaDyzi7AZPmcwylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnqgePjwQMo20fnEaDGybN5w9JHQtJSqUeG3inyLyh0=;
 b=pfyo/sN8Kz5HL+k8vtAngATniimIXuG2YI7DKcyzIHJGEFmX/GHRI+I3uFC19GP8DaYUDB0mCMO0xeOOWqH0Ea4r5qnxKQylXmwB0Pxgr4SESsTHX1Y0ph+2ii5aZcG5q773vyS0TsNxvO1jNzpaIRzSRIFm1fauDHiZRR4fhX30UO5+k+v+XoRldNAN6Oq0R5ZDj0gobGWUqsokn6ixzUGArK0oZtMEiH8867LoJOLC/gEqk1dRgp1ORKNjjEfeED1uC8cpoGvC9n3xAidax3PTi4ogOWefB9bvOqhl3OZHZ5H5N+ozTDezW2Jef+Ok1ujqDBOOumoy7XyCPb8A5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB6880.namprd11.prod.outlook.com (2603:10b6:510:228::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 01:57:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 01:57:11 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v21 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v21 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbtIz6UmF3j+jmv0GkSxIWe/uh7rOyC3pQ
Date: Thu, 24 Apr 2025 01:57:10 +0000
Message-ID: <DM4PR11MB5456D03B7FB2738D23D73103EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250423201858.132630-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB6880:EE_
x-ms-office365-filtering-correlation-id: 00ead0f9-48b8-4916-7a8a-08dd82d353a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xcVDPKgq8hNh95Hx8kF23R6X72JXjT5AJlPuBPl0SxKU/upBfyFUoIswlQy7?=
 =?us-ascii?Q?CAHMfh0r55RvoQgQN9pfqaBxUdOaKUx9j+B0kJv2+8r64p4AWd68SlVyiPqC?=
 =?us-ascii?Q?Vt8Drhid4DNE8UZ4XJn3uyWY3/Tp6G63DKwSore0WLi9yR+El1eVNWEnvVUU?=
 =?us-ascii?Q?m8vArJduibPK2Ve2GwTqDs18GOeZdoP2IZFfoN6Bx3XBYy6mTx9pxzYGOC4e?=
 =?us-ascii?Q?VvWPWMZaiNmVlNMCi5epnrmEVAIrU2/47iltmO98DWdpF95VdTUgIeor34MI?=
 =?us-ascii?Q?Wf7GJMuDCNiX3NNqCYVJeBL+gIx+T9bMJwrOQYk5Etjg0IojTDABR3UMQtmO?=
 =?us-ascii?Q?46ofnECiUjPojwV4Jv2hr5LHfnofgn35SAulZMCHCod57i63Rz5u54m1H9sD?=
 =?us-ascii?Q?uvbnU6U5hDRlYd4ipSzHBGUDH1NkX0+PPCo1g4Qa3H0T+WCqIW3bPI/n2b7h?=
 =?us-ascii?Q?dUfGKoGaFNMuZ5c9oS3R2eDP99Juqeec9a/OR41APHC8NjjS9Gh6VwiNrwne?=
 =?us-ascii?Q?/rIju+fU2UJA6mMW4ozzVMxWz40J03su2mdZSy54ZftLIBBRSmYTwQylwR37?=
 =?us-ascii?Q?7fnfav6zYqPxz625ZbKr2XlIWwrsGt1Iju25TuuEE0kld2pdybd9rEn6ArHv?=
 =?us-ascii?Q?akaRiJGnnoC508BmiuN3tWPA5L1DJv2RemLdQ8nu8D1Lg1tmCwnHMQEgWR8l?=
 =?us-ascii?Q?MlDwm/e+hgzEA33MhKCnFRfFdiGzkmUp/mK/XAm1VPzI0ztId7qA1VgSFFpo?=
 =?us-ascii?Q?gAIEEYoos7j4coB0e9jb9LCzySF//upmHSSP5wd2M5T98KUCGWgaar62z1H4?=
 =?us-ascii?Q?XTL+OtF621g44TRYm1sOPwH8b7BVOK4dbKxs4Ro5iIPHcvk214Y2izoY2Rjz?=
 =?us-ascii?Q?WwU5bms7fQblZjpCO0gwOERVDGpjgROIPEFzNDVaIObHiQFx9Ei3yz8nHYHn?=
 =?us-ascii?Q?upANezmRDe4BaIcnt8rSjhfdbQnpDk8NuAWyhO698/7g+iZXvTMz7DKtiRjy?=
 =?us-ascii?Q?tC8Oe63AGkZv+pqERyfUbTFP6ssbVXILJEzoR4eIPmGlbTjotsIof+m1qQai?=
 =?us-ascii?Q?m8n/mNBCM34HKqyxyX1cLCQRNNFSeIa2s7qJA0iqtteFosBmsPc0M6VEpkxA?=
 =?us-ascii?Q?Wp/nQ9OC9pZ/bqD0MjKBSj4e6uBrPjUDHHlzuPx2xNB+t7bPfHB5niVn1qYD?=
 =?us-ascii?Q?hiZgO4DDt0TYRKWK5vedGFw60YQkhgXKgjGJlsOFlWEH729T2a4t9QJtjBvj?=
 =?us-ascii?Q?fswVNcX2XDuetbXi/9U58WKsjbeS8HdwGezeuvnsY1uIpS5wIjaDQugfxh0G?=
 =?us-ascii?Q?gNsqY2004rRUi0Bf+1z8BQMEm9zCzp8xlL0ey84vQboGyqzGwg70bNPG2gKg?=
 =?us-ascii?Q?UbaRm75NX+NWj+EeGNryG8zeMd3qIS87jstHc1jmzMgWTUkMts4T2HYJwIvi?=
 =?us-ascii?Q?2WWv+MUY+a6oWZjJQwf6jQFMtaC+lyuGy62YysKmdBH5Ka/104mbJQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TE812Of5iSup52Yk5JUNcGMicNHNZc/Wfk7nP2lILiZ5YQmni5O/bHhbfJ/k?=
 =?us-ascii?Q?DK7YhkU1608EWRGx+EOvxSvsAOr60tKBBe+8ffPuF5ZrzC3ApiujAqSLoNqj?=
 =?us-ascii?Q?1TyYx0sB7jaHbuJnN0217M4/QKlO/dBGsI68eVQ+5yTwE4z+LoWMb/Br3ml6?=
 =?us-ascii?Q?bHXZj3pJRJV2XJv3CGKUYjwrB/yH37Y5BCR4XIAIyOwgrN12o6iS4TMDTMQH?=
 =?us-ascii?Q?2Z78JRJN6cAOnTYpbWNO1WHnuOPnqe9mOxHHtTvCo4ZAGpP3rA3apM3IapOS?=
 =?us-ascii?Q?V4qfPngXBVj0QNPihNp8GA3QWW1mkXF9hoITYvPdFH9+8rkwmQX7Pea2hRl6?=
 =?us-ascii?Q?oGK8fyELVEGsYdJl0K86WEoD7iQJn//CLjy0ZiF4HZqCHX3m2t28CD6MIjO5?=
 =?us-ascii?Q?e/Oh07F2C3myKMn9JwTS6mhzcGTsBxqqkJpAwuZ5dZlYKQIERRDdaz6YILD2?=
 =?us-ascii?Q?MhiXFwpiuBoFGDDL+zlTu1+b3nboLb23ezRz+FGkrl3m88LNHDT/wICuiICw?=
 =?us-ascii?Q?KOXEGvpqOaqz/0l7uewj4ZkcLO85nvOUkCMgY7NYqwiboWGPmGs2vphobrQK?=
 =?us-ascii?Q?sKWPYGGrBP0RM4BsoCPGnyk0gBlSCw/e2h2MHPMnYGd766Apq70c6iSInrGZ?=
 =?us-ascii?Q?5l+tKuo/huDCcutncVGPq4cgvCBovYXuxdD9IQv34ugsV6fgFzRfLI0F12c0?=
 =?us-ascii?Q?5pEDkPfETUg/3UDKe7wOY19wvEywgI18AOffvCyxzMTD+6VDUm2c2f8cPWcg?=
 =?us-ascii?Q?ymOnVSWA+65wO0R0j0ik3MQ+TQ04ZSH+9X6OwYXg3d4Gl4pkGmlc5jO/UiqI?=
 =?us-ascii?Q?/yko2n2G6XQ3YRgtoaKyVs1v2txfWeZ4cuJKPH1nDBshw9H8rHYd6qV3dTg+?=
 =?us-ascii?Q?u9GwFLsTO++9DgIYXOEZfkI33NIgRHVx84OGNiYtCRYFkVPbP9Tr/kJW05G7?=
 =?us-ascii?Q?9t2C/pwOA0r0esEbyHW5A92Sn9idpY38od0Zj2FjbDgXk2TYoZaoxDNCQV/U?=
 =?us-ascii?Q?tzoH7LuNbr6+HOpT2T218EtPtAWjzEBH5y3yAQejPI5o5ijb+Rws3Ooba2OX?=
 =?us-ascii?Q?HMaG+XxCwv0yYHUS35hyL7pCGU7uyOhQ52LqxnvHrxjCRU3ENFzzDlbxoSuW?=
 =?us-ascii?Q?yAo/alQZGuo9MOYyjIL07oyfNBpUTwp7T1+d2FBgAwaC//OyzbJtYTDp20j8?=
 =?us-ascii?Q?kDNWIWnYUuHcyBOt3NXTNOSswHFaHIl+Ew33oZ8BSKBQNyw/9BMK0IJYohSX?=
 =?us-ascii?Q?92srLg/wkBrJDUvuCfNzZkKuoM/RKGgaXtZotQPyP6DGeXUqqjN2+6scBn+M?=
 =?us-ascii?Q?FolpvRUS1lKRZzEXbYD5D7OFaKHOi5/JAXrD0ZX2PGJ0H8yeE7DKcJbiB8gj?=
 =?us-ascii?Q?3d3leW8pxZlYEN126UhiLvOxf+6ax3Vc+/Ecc5kPbmvTUg9M79kUGYTNWjoe?=
 =?us-ascii?Q?r0y1nxKTvSobQGuMxBacG10yYAsk4Q0I6bDsvdlebplloDA8pcnV3FW/sFx2?=
 =?us-ascii?Q?uZwQMUCesLtpuzgRH1vQZxO2BrBOBeJgqimcOdbsxsfXjcE2W3r1wFTdu5If?=
 =?us-ascii?Q?otL73Q/PIG/4Pl6o+soB05BRVvHbHz0Kyt/CihAW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ead0f9-48b8-4916-7a8a-08dd82d353a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 01:57:10.9450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhTVIVoB/Lg5w9L1a9w/ZkWKxpFR6IFBMSeqVm+4PUTt8mudvRn7w8zGaKGXT7ylIfLuUZOFcKuBCHXljbfFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
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

On Wed, April 23, 2025 1:19 PM Cavitt, Jonathan wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
>=20
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
>=20
> v3:
> - Remove address type external definitions (Jianxun)
> - Add fault type to xe_drm_fault struct (Jianxun)
>=20
> v4:
> - Remove engine class and instance (Ivan)
>=20
> v5:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>   Ivan)
>=20
> v6:
> - Fix inconsistent use of whitespace in defines
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 86
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> 9c08738c3b91..556fc360a076 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>   */
>=20
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>=20
>  /* Must be kept compact -- no holes */
>=20
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct
> drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,
> struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION
> 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct
> drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY
> 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY,
> struct drm_xe_vm_get_property)
>=20
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1193,6 +1196,89 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>=20
> +/** struct xe_vm_fault - Describes faults for
> +%DRM_XE_VM_GET_PROPERTY_FAULTS */ struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +#define FAULT_ACCESS_TYPE_READ		0
> +#define FAULT_ACCESS_TYPE_WRITE		1
> +#define FAULT_ACCESS_TYPE_ATOMIC	2

There is the same definition of "FLT_ACCESS_TYPE_READ" in the "regs/xe_page=
fault_desc.h"
Could we remove the definition in xe_pagefault_desc.h, and change to this d=
efinition?
Also for the access_type in below.

Shuicheng

> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +#define FAULT_TYPE_NOT_PRESENT		0
> +#define FAULT_TYPE_WRITE_ACCESS		1
> +#define FAULT_TYPE_ATOMIC_ACCESS	2
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +#define FAULT_LEVEL_PTE		0
> +#define FAULT_LEVEL_PDE		1
> +#define FAULT_LEVEL_PDP		2
> +#define FAULT_LEVEL_PML4	3
> +#define FAULT_LEVEL_PML5	4
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of
> +&DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among
> +DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.
> +This
> + * determines both the VM to get the property of, as well as the
> +property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for
> +the
> + * requested property.  The user is expected here to allocate memory
> +for the
> + * property structure and to provide a pointer to the allocated memory
> +using the
> + * data member.  For some properties, this may be zero, in which case,
> +the
> + * value of the property will be saved to the value member and size
> +will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the
> +requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from
> +the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason,
> +such as
> + * providing an invalid size for the given property or if the property
> +data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and
> type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of
> &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> --
> 2.43.0

