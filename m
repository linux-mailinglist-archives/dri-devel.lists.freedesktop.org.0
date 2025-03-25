Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5195CA70412
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A0810E220;
	Tue, 25 Mar 2025 14:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaBuJzM2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F58C10E220;
 Tue, 25 Mar 2025 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742913873; x=1774449873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aD9eIHjtrdD6OKT7xP7VOp0BjRFOWgeSl6Mk0XJIaYg=;
 b=KaBuJzM2AgRDFd0FCQSuzTFHlOeEVat57kytzB3DOUOL0wPlHT1QpoGO
 qUJURWBucUY1fo67FmgM/SgIFobXYvMX0MZhqVrf0udkeN2zyk8cR0c2B
 HH8KClhlKlvRcrw2jTR8CiddHW9Nyav8/CBLW1WxRx2XZyfdbO42cRLcq
 AUfsCi+SDQj4aAXwt3VCu1gfZ7j/rpK2hrsVAZTIp5bIqHUy0b44fO8of
 hc4o3uhQqvwLEh8Edd19ijTF64ycdAbUEHzKnVKpPG3KXLF6DjUr7zJl1
 nTukrXL3w4mSMvj+zJliJUVvH38q2eBwlcEiJLTP8QZ+wljb0zbC7Sm9g A==;
X-CSE-ConnectionGUID: QZ7jav5zRwuRdJpmWwjWFg==
X-CSE-MsgGUID: Phhf8RQ9T9auxOmqcZOBUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54811118"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="54811118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:44:32 -0700
X-CSE-ConnectionGUID: M90/e7RmSHakAlGDKOlBvQ==
X-CSE-MsgGUID: JpFtICXpRV2GGTUHM/9GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129511342"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 07:44:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 07:44:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 07:44:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 07:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0zNjWYudoDqkhiXUzey1zV4RwWk4MWOpl6WjpanCr84Zo0HNDFX4hNat6gBYsluATU6OhZiAxQ0QZSZyG9isoW8GmRGO3Eqyb28lGk9VriL3U6/AWg1a2Ko4dzZRR75F68AEy2bijGgN19XUb9gO6WJyAnWBCB4LVi3rR5f62otUmT4etM8QEzSr/SksFU9MlNK2uSresXuWL2IPJDxTEATphEw8dGfNPfp3lsEg0yrAxPUhMAsFIzTabG92m0uyX8aOZw2RBXjoJ0heUYEX8yBZh8Yx3aI4CCiW+6G16qlgw8fy4Y4DTHrhRNe5IbyV8ciwVC0f87Uf7te4WeleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VQyeqRlmBj7fpJRwp3GuKEpunU6sumQAsXdCuAp5m4=;
 b=dqmUiD40uAYxnADFCTQoHqLtLInoDBKnnj/an6xJfnyE2aNLoORKnleN5Rms/jKmSFRAyiv+0sIuDitFSu/H1eJfsbrH4tZH1/IRVKI0Ybw4QSmKqtkXholGaJrhUnDj+rA9Eq4ptVZ9CSy8XqmoUP5igM63ilffXvgO5voLfRWNjaBiBd4ACNWmOa5VP4JLzAqwJtY/cX3Nn9eBPRa7iV5Y6DxC7X3yVSc19g9PVzx48O31LLiFZJcmSFM1++KckwZUwHY8CqIR7yLOQksW+8KnBLHXP/1qDGdwsOYEodHijKLjLs2w0KbLyGbAfLRMN8vOB/hoGzASdgMSJpRp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 14:44:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 14:44:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: RE: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbmaxz60pzmV6QPUmyocFpZL7O4LN+QOmAgAQd96CAAHRngIAAAToggACkoACAAHGLAA==
Date: Tue, 25 Mar 2025 14:44:13 +0000
Message-ID: <CH0PR11MB5444B20C4AD1D82138D6970CE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250320152616.74587-1-jonathan.cavitt@intel.com>
 <20250320152616.74587-6-jonathan.cavitt@intel.com>
 <Z934F9fz_-d1oGiC@black.fi.intel.com>
 <CH0PR11MB5444C9D9B706616AFC314810E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-HN3Yvci8x7JwWc@black.fi.intel.com>
 <CH0PR11MB544414B6A0B6FBD0B790CFD4E5A42@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-JY_kzjHq5fSRBg@black.fi.intel.com>
In-Reply-To: <Z-JY_kzjHq5fSRBg@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PR11MB8670:EE_
x-ms-office365-filtering-correlation-id: b0fed71b-4f66-4b21-15cb-08dd6bab8320
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?y0tSfwahUjI/lurd2lMKBt4vRzMThFyQTlUjTXBHQ/YyAPCOOe2awQMlGffs?=
 =?us-ascii?Q?oFlGZAeCWqwWIXW9t4R0dWeeFcqBYPB1nz3IVgrjEIexs4iwrvhH40CfRqO2?=
 =?us-ascii?Q?Tc4H706mYhywO5EewqeZVBM4MmTVvJgvGa5tGvYNb8fLTJpQVIQMiDc04/du?=
 =?us-ascii?Q?eb/pnYKAs9PH8JGmWKkOA/+vGhQLmzM4bnrMA4Avk1yQlrRt8oPupiFeId8h?=
 =?us-ascii?Q?MPXytc+SLdSXYoEb7+u1w4V47OkoW5oDYoglarRqjye/LYDGLOK1qg/h3aDa?=
 =?us-ascii?Q?3bZQay51uJyOWj8TSKIo9/Iiv6139jCt5EcHzjdBeDqX6Wr6PM9RcGQabr7N?=
 =?us-ascii?Q?Ho1kXom6ypFb1QoxfB45I0PGybsMCQCSd5z1vmiI2HMbmA6p1kNeyLRf/uv9?=
 =?us-ascii?Q?3fnIV3v/qTfArbMPiLZg2EKpdfakO1p2lbd2kZ5AzF6lzS1wx8HkqTzNYS0z?=
 =?us-ascii?Q?34+fNDNIHSsqARSuLMFI+bKxs6L+EYhOK9QEwAjJ9pyvDpgLa+3HnKrHhIRm?=
 =?us-ascii?Q?3aBiSI6EOC10Hf+9RdhsUlxdZ9lxpBqbBIfNuJK6850jVXjX+pjOCgk8OuZ+?=
 =?us-ascii?Q?vfcTPE5pJpo6BRhESpKJHpSR3bKKvDWUxII/U8ss5F1nXQmhREzAkYthFYnT?=
 =?us-ascii?Q?qt/riHJP1ZrqtgSGBl0SANWYdql19SaGyzt3vUNgCKq74VAnTAjcTJZFALMn?=
 =?us-ascii?Q?M6K/qZtObj3zzq1pB2xVJtIy52L+H8VbhzHdFGGjw97ciI7G+FFkphOBPaPA?=
 =?us-ascii?Q?gNrLgzKhZ8alZENFewzeG9xhOhAuhRBFdysq4UhhVp79E/W2J4fFvw9Mfut5?=
 =?us-ascii?Q?kRdE7ENYUAkisldRFWgAAGz+T1RgdtZ4gMjCCQessseX5E9j2VkD1ZCKltOT?=
 =?us-ascii?Q?OorsaV3qcFnfteBwuNkNDAjy+fPIG9r2kkxyoHQW+jM0sMu3+mpq3fTkahHN?=
 =?us-ascii?Q?GfJn672oiG0yCt2vpi6SYPXkYFD4jyglT5Do/0XFwrF0iQlKVwu6UwqT0RKD?=
 =?us-ascii?Q?7gM0ROdNFoQ7rJ4pW5xXRGhQmRLgcIb1cY1jI7VLXb3TVQrGWRppHEBQLi/1?=
 =?us-ascii?Q?vwmIypTXvd+S8EtKP1LkMrVAgtKLDWh7QEyZpJGvKdgj3OY4AtxzoPk+bdxF?=
 =?us-ascii?Q?xrIy+eZWlUBgH1jdBp19/sSOTAV9vJ0NCF2gLOQndTxxi0+OirQJIjSWZMGu?=
 =?us-ascii?Q?S6A61Ke134p3SNSsy1qaKHyOhuZ514PmIMFIAZ2Kgz5mTiSmLrXUOakvzA8q?=
 =?us-ascii?Q?CiVFD8FI6/FTc8lZDJ2goJnPPehyw+GWfHEZLJMpFxcLsDVCX6F+46y/vnAq?=
 =?us-ascii?Q?+lR5CevlwILOtYiS8C7a/PMyTH/8LjbWKaP86jZHb9Or08scyjdUMHQZyYCi?=
 =?us-ascii?Q?F69B2NCQNP72YlUnI/JthF+1pJuS3/dDm4lvcW59r0dduOyZNjHjuLmOCJQC?=
 =?us-ascii?Q?qTIZE/P9zGwN/gwoWZaJ4ZhwjqvUr3x5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3nky+bgxRmoJRXBfnvE6DwSHgzPosJMq3PN8DkDAbxRFaYF8zmXtbY2mwijF?=
 =?us-ascii?Q?R0YFew8a1sTb4aG91qAZ32dPfl1Vqq3DXzoUzO2uaUlwa9bfQPiGJXMbtuJ7?=
 =?us-ascii?Q?5yIht9DrZ3VZWCFm4oeeDAvgY2+cvhJHFBwg2xpOr94bLagte3vFDjitRD6L?=
 =?us-ascii?Q?bTV9D7naAmdpDWZtSBduvDMXcb8s4sRrNOnJXU8c6SeNFthzfw6KFJsjNBNF?=
 =?us-ascii?Q?DgvAD3KEL87+FTrEwEET/soTIXIKmLvyJWRqCSB94DegMYXzAjwPlG9eVKZm?=
 =?us-ascii?Q?stUsBBRO/m5xujjEblsqr1PObRqO+d4T/vmNx3KMqXenXwy3GUJpKAZ3ag40?=
 =?us-ascii?Q?P+FOQcrZ8751iui23FH2VVlkyelfwpahKBoQPiT/q0i7nKDeLSk0e+pJgB9/?=
 =?us-ascii?Q?67tnYxCEBQ8M87Y6t5NwnCdWkXdcposlMCgSY1iYjO2GyX1HPRRjLmA0My8M?=
 =?us-ascii?Q?aL7Zr++BEFldv0CoY5znrlh3ToFadOOOUNDVUFQLnM8LkBy+BfIfWRXzaEYC?=
 =?us-ascii?Q?OvB5Rlr+dEbtkzW1j/4Rv3uAPaBMJLX7m5d9a39TG76Wr62YbxRqn1BTR4T2?=
 =?us-ascii?Q?/MoD1v2qB2PvsBAgpTahaAyUcPrZUj3fwCK1fyaFrHdvcovXH/dIMTFz9aHa?=
 =?us-ascii?Q?I/K1qf6KVZRRTTjys1GQ3KJmsFgaw+4mjKHxq9a2lZTPw07Cu1/tLtBsXpSF?=
 =?us-ascii?Q?5ciGQ3olNbrqwSDzjwtRdWeFFRBaD4+XzAcTNjE6BQd+/ltvrsUeYz/z5m8w?=
 =?us-ascii?Q?mYNFyqS6hgdygH7G6Dyly/0jXVTsvFyPXsmuMEC3ObkKFmK1qyIsOJDbIt5l?=
 =?us-ascii?Q?MBjb2syfUuD951kn2z4/bOsC1djomONkpUtY2F5HPHxRW3NiZ7+AvAqWiWQb?=
 =?us-ascii?Q?TkbcY5Rov/GZw3+fBhlU06ymlKSuGnnHXHbWx+us4H51vKkxMXoq+/6VXNvr?=
 =?us-ascii?Q?QSbmiahCTFeJD3EGwcqlwgIfc6NFKvj1DMiOEgp6V24W7YkgCgoWbiPmIEhu?=
 =?us-ascii?Q?oYnJctjfsuV1gZmkcEtFb3c+Edg7CgrlAsXBrxnwoyyV70OVPZxnCzBtq43q?=
 =?us-ascii?Q?VSIQX5uOI2/Nu/7P0nH6HMxs2z4PO6AMthOtwhiuQ9Yn6IBYJiYkqZhDb7Tj?=
 =?us-ascii?Q?kTp5DGBUNED32dUFDJYwSCNNIp9trr5pyJNG7pDo3UV25FSGIgOl0t6KQ8Sw?=
 =?us-ascii?Q?eFo0Yu0mlp312/RL4HoO57L6155KNM+PQe0sEDyvdyv7Ls78SsKAS1AvkawF?=
 =?us-ascii?Q?gEg9OzbFkcBp7+1TJreAsPjb2SL0+ZZ3NCXAjjJeeazkFQz9Oc+YqTRgdhu8?=
 =?us-ascii?Q?u9vyIsoFc30k3X5u/0KRxTbD7yZbQ5oNPpvaCwyFkfIQ9fJ13M5Rpwur107X?=
 =?us-ascii?Q?fK70vHdQv9JEyeuudxgM93oxtuaafMLeWPXc9wlmnwfQVLkCXeAE0+vZFlDq?=
 =?us-ascii?Q?RZK6IECwfQ6ncnxbC0OqYgGX+uCuEStr9Y91ht4IbFPY6BibVMLdqCGIcWDL?=
 =?us-ascii?Q?7aIeSLXmP6Oytfmg/7TV2RkxLoutDl4iHtFJsGi4WdKkcNp7gvFXuQT0eDzz?=
 =?us-ascii?Q?JUtSV4JJ0nyP1ABgndJKGbpk8vq55QwYTdaaB1Vl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fed71b-4f66-4b21-15cb-08dd6bab8320
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 14:44:13.9839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynyEMD1iNqUPsZ0XY4Y0ZJmhoophWSLkDQChTiZCME63ikDvyYF51T3sxmSQNeWregfNP0K/DKnT0qBRtZyGTcND/z+mpmbKSIHsTNedmJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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

-----Original Message-----
From: Jadav, Raag <raag.jadav@intel.com>=20
Sent: Tuesday, March 25, 2025 12:19 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost=
, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.co=
m>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.o=
rg; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.=
mrozek@intel.com>
Subject: Re: [PATCH v10 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Tue, Mar 25, 2025 at 03:01:27AM +0530, Cavitt, Jonathan wrote:
> > From: Jadav, Raag <raag.jadav@intel.com>=20
> > > On Mon, Mar 24, 2025 at 10:27:08PM +0530, Cavitt, Jonathan wrote:
> > > > From: Jadav, Raag <raag.jadav@intel.com>=20
> > > > > On Thu, Mar 20, 2025 at 03:26:15PM +0000, Jonathan Cavitt wrote:
> > > > > > Add support for userspace to request a list of observed faults
> > > > > > from a specified VM.
> > > > >=20
> > > > > ...
> > > > >=20
> > > > > > +static int xe_vm_get_property_size(struct xe_vm *vm, u32 prope=
rty)
> > > > > > +{
> > > > > > +	int size =3D -EINVAL;
> > > > >=20
> > > > > Mixing size and error codes is usually received with mixed feelin=
gs.
> > > > >=20
> > > > > > +
> > > > > > +	switch (property) {
> > > > > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > > > > +		spin_lock(&vm->faults.lock);
> > > > > > +		size =3D vm->faults.len * sizeof(struct xe_vm_fault);
> > > > >=20
> > > > > size_mul() and,
> > > > > [1] perhaps fill it up into the pointer passed by the caller here=
?
> > > >=20
> > > > "The pointer passed by the caller".  You mean the args pointer?
> > > >=20
> > > > We'd still need to check that the args->size value is empty here be=
fore overwriting
> > > > it, and we'd also still need to return the size to the ioctl so we =
can verify it's
> > > > acceptable later in xe_vm_get_property_verify_size.
> > > >=20
> > > > Unless you want to merge those two processes together into here?
> > >=20
> > > The semantics are a bit fuzzy to me. Why do we have a single ioctl fo=
r
> > > two different processes? Shouldn't they be handled separately?
> >=20
> > No.  Sorry.  Let me clarify.
> > "two different processes" =3D getting the size + verifying the size.
>=20
> Yes, which seems like they should be handlded with _FAULT_NUM and
> _FAULT_DATA ioctls but I guess we're way past it now.

The current implementation mirrors xe_query.  Should we have separate
queries for getting the size of the query data and getting the data itself
in xe_query?

And just to preempt the question: this cannot be an xe_query because
the size of the returned data depends on the target VM, which cannot
be passed to the xe_query structure on the first pass when calculating
the size.  And just reporting the maximum possible size was rejected
separately.=20

>=20
> I'm also not much informed about the history here. Is there a real
> usecase behind exposing them? What is the user expected to do with
> this information?

This is a request from Vulkan, and is necessary to satisfy the requirements
for one of their interfaces.  Specifically,
https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_device_fau=
lt.html
-Jonathan Cavitt

>=20
> Raag
>=20
