Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F6A4EFF3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 23:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CA10E6C4;
	Tue,  4 Mar 2025 22:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrfff5y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597510E3F7;
 Tue,  4 Mar 2025 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741126610; x=1772662610;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EfBeFS0jcs2yrb42fDfcoHzpzJ6bWThxf5G7s7JutoA=;
 b=mrfff5y26OC2YxCpmsxjnD8U7EGuTeyiCKHL44R1GC8pO6294T9ILZnn
 NQjgt8TRtgcgfhdCD51vt5MaayA7oF85GsdviuJkAav+0PWjdIXZ7tqLk
 B2YIEIKfVxxleovMuUjKsA6jjuwiBCQXpj6JC14fWkU40IsUcbnUyULCv
 Ttska40TUnPnv+WTkoXB7URjL5SN4xqJnm8MKz/04OhYfo69hha+fp7Pi
 Rdbt/fxFww0qIkQNjte5cCMkIUzGHA1wFVk7QH9PBm/GguOx4zNWAJ7cL
 ILpHobv8Sdc0O+DGEHtsbshxHC3mxQb/mbI++II5AC1ND1KEIcCcL8npa A==;
X-CSE-ConnectionGUID: hG0o++zzTnmDI5TpinSdjA==
X-CSE-MsgGUID: z5JFJKfpTk+17AriYNyN3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44877922"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="44877922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 14:16:49 -0800
X-CSE-ConnectionGUID: C4MalyyOTvCKmL28205sYw==
X-CSE-MsgGUID: jHgHekzSQUGqCYRkRb71Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155688056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 14:16:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 4 Mar 2025 14:16:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 14:16:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 14:16:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahJaAj/XXUrNLEt/SyMlJcctt9/6vQOgDmljuXTgbkNEc5pgMoF0jeFd8svHbezr8OVp2fK1FDUsuFuKvDKcooG2ytCDOVtzMXYMSF4fN8nzrqVTWIZBPwjIVqEn65oyvMtggPnYXDB49RW0nZhyxoBtHi83EcQhrs+++vSRU97cj/q1ZdvZLEbMAjtw6xKwetn0zV0Vn/dVHNxYuqDnodbFnMru1uOdCMLEDz4OqVRyOyMJjWz48k5RXJd+Y3ernALQlsGjf6lYXps6IZAUcll0QFxB3fzebMD1MGlFlod96infWJM+/m84S822xZdn4EWERnh3gJ9Im7exXOOhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VynmIk5btkAhxQZnY2EskuGqRk/0DzmLMgSl+i55h2M=;
 b=J3osvZ3fJr1WVrzEo8vRugGt+/1YBCe14EqzVRuslO8a1ksnj+wPeiQ0AlWTA1kvOUOFFlbg9sHCYvlKS4tGMw/eg3w4uF0qsbc/fledS5jLMf7LQIlCl7liQjvLlAfdJDa60G0KJTVYBj1BD42Rg3SsoBeeBOk1nHL27JpvKfCvLtmbPo4ScxleU9dSFhS//XIzU6JrESnc8UKl06HelycR8DWvIK5Gtt2ZW53togvPXpxVd+L9d5jXNpe3IhE15b90YROnRVZ1Jhk+1M033G72LqOAZ5W5lzWlPM60A3jeGWgJGtVhO4X6wZ9IK9iw4s4BIp+8ONTYof377ec1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 22:16:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8511.017; Tue, 4 Mar 2025
 22:16:11 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbjSgrlcBcLGWv7E+BW1VUxS06JLNjhvTg
Date: Tue, 4 Mar 2025 22:16:11 +0000
Message-ID: <DM4PR11MB545667BB0BDCE23E18B7BA63EAC82@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-7-jonathan.cavitt@intel.com>
In-Reply-To: <20250304170854.67195-7-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB7585:EE_
x-ms-office365-filtering-correlation-id: fc4517d6-75ce-44eb-7547-08dd5b6a2be1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/lrmUTX+V5nrNnyW/hvEcljum+gjVHwaP22GSgHkog9TQ0nHCJUS9Ij+78tY?=
 =?us-ascii?Q?WzH+6FvsscP8jBHrtv4jcGRZMiG2vrBaKgmPa32feec06Fak/20kyeesNqcl?=
 =?us-ascii?Q?rD2frU+lOpI9L4iEelq6Ai5PGaLDUelrM7hfBOnq1CDZxbEuUOhkuBC710ko?=
 =?us-ascii?Q?D85BtG4khbg3Tln/09KsZpCUlBsBnbSmJlbyjR8gNHrdlk3iCkj9c4G81DgN?=
 =?us-ascii?Q?HAtKiGlu/ynf7gofiKovA6IFIK/1I2qxbDUxF3W7VrI0EiZ8SfydPQCvb0+y?=
 =?us-ascii?Q?Q+aHENg/lldw7evpqMHiuOGVb+vhx+kn8b/O4UYDEe8zkzST73J4w8ePWv0l?=
 =?us-ascii?Q?B6ZEY/H8nJQs2n3O8Krd/TY40b7QXZP6hvhS/iRKpbJkEp/G9321OEFsMaob?=
 =?us-ascii?Q?Dsk5nMupsQzg+n9LWguQGZzsRiWwoJnKssF4+JDKQBhASUiDEZ/iIrWtkzaO?=
 =?us-ascii?Q?842kL1a2dJWgzqgOqF9yMbO2jcwgybfuEFsHNCVd3k6wRlR32q8WUo90mSWM?=
 =?us-ascii?Q?sGP5N9jetPvtL65mTGlBwBGPgwUm64EEKsjl2PRa/38gl9mDQUBscjYlFWeJ?=
 =?us-ascii?Q?bUbmA8DtwFfkNjhLlYyr4w675PkXv3GkaZOiilM5fc0uU4mcnHfCmeuGdbiw?=
 =?us-ascii?Q?LrgYeGXUBKb5GBLpn/o8/7jHmSG36D2tq9F0/dKG/+i3+o7oWLHUNOVzgDNe?=
 =?us-ascii?Q?/lzprF+3TkoEoQAkn3l/3hM2q1zhz9OBihGKKQif47Z7+cGWSjuigs7uo6gY?=
 =?us-ascii?Q?d9M2K9RC3Eo9V5NWLRhH+/ucUz0KRU/y6oyFBMlC9yHw2ClErBHd3J74/GCe?=
 =?us-ascii?Q?hEyKAoVuQC+vxNS54olvBkDRVR4+j2XKPCf2VT1RCI5lAmWtkiM5HqJrHe6f?=
 =?us-ascii?Q?/Iz/SX585m4aFe+1usVK05GCcC2E1A65a1EasN9wTLuF4oYp8hj6mx3r60si?=
 =?us-ascii?Q?rj+vPWcZQq6W6ILP3B17ZXvuiL47dOu8LrHQU9PYeToPhrCUupYOviVpo2KO?=
 =?us-ascii?Q?MEysXE5wExGNe1kGe/Lep3XQiFSyhnFQj5LrgpetONvvWfuAcenQQwxhglpe?=
 =?us-ascii?Q?cJiNxryuyBLpQnw9nkUbAI4BcQzxZ0g4Ra0HmZIIij/4eLmBWQtD10Ltk6Hy?=
 =?us-ascii?Q?6zyspl++lycEYOKNHERxXtjcyy9rN/hvYf9ZVAVtqkpVYfT7Uny9J8KZGSpW?=
 =?us-ascii?Q?XxcRMYMYrsQUu3Bx1kLRW/dTp+iVpfUrYoygZWcmQ0YE4ODXgBBYkZmi703w?=
 =?us-ascii?Q?MfLW2+LrKUAp9Le4MfhzxXgN5/lakOtxyxxhrrvqQmq6RpAwb88VPcnqV37C?=
 =?us-ascii?Q?iXAUN4FhBGs8CES0w2GEtQzu8Uj7+jAniTcNEnewbD7Lh7vm/IrtK4XEvR+z?=
 =?us-ascii?Q?YlhO2FKDqU5EfDli3iYZx04bGpTEYnpFy1zUhaHyOBuLjR9NA8fCia2oyn4B?=
 =?us-ascii?Q?AqNDFv5SSwXPK+7N5fSoOJ1rcyA5WoGd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W3PgHTECiTYHF97SuDJwCLoKTkULWPn2a7cea+vmv7sDnRaVXzeMkTvyhqWU?=
 =?us-ascii?Q?Fk+Yg2LZxGG4XVZhCmTt49i88Dn0qizbyYukBxvfpU5NVIy2/Sn1PewXOSGS?=
 =?us-ascii?Q?Jb+TP8yuBcUGlzy6MSjkSjlCWZzB4GEqmpAFii0jLe97DRY16lEhYyEoCL0Q?=
 =?us-ascii?Q?V/mvtcSn6wPea9FXwilexxb2XvwuoLrHJeMrvWXz59hrP8QsfUubluInOAlJ?=
 =?us-ascii?Q?KN/O1R7ZhGVYJSGcAFRgqB6y6ij12jz0BHy8oKMDS0lhvB1T55uPo+G2LxYg?=
 =?us-ascii?Q?EVOLTxm05VXbzRwdyJLwTg4dTBdNUjA/U+obNWJ6uWCPYtxdOiijQs1o90y2?=
 =?us-ascii?Q?ATVv5rptnH1sTvfQGB8+L5PmFYB7OzRBJReqXqhjpvM9a+g+h59u8eUF/ld8?=
 =?us-ascii?Q?q2rDElTi2D6+rm3CplDYmWOW7D0VfVdvmSLIDN5hhJlF+0nKBw4683orkvP0?=
 =?us-ascii?Q?L3zjVhErH8C8ZoLAYBzE2NL4/3jI7eoiQDgVHZg7bVXch6mBijt341R9eWZa?=
 =?us-ascii?Q?G/mioKErk2Mn//+o/9so/V8KHvKm+z3oEQ8cPQMEVkctP14GR96cwnHpMKWf?=
 =?us-ascii?Q?Tv1ZF6wfX0XmgMqifKR3oWGpm6v2b4bcDaklpo/PQPERv3+oS5T7RN1LriMh?=
 =?us-ascii?Q?L+aUKqFBNsRFBivJL9St96c9bAxDJ35vEjH3si7A5ngHQ4Q4tOeKhax3qMDG?=
 =?us-ascii?Q?KfgI4s66wkYhyNQ4XhlKvKmx7iiLWwg8t6Rt3V46udTpztNviSEQn1oqwsyY?=
 =?us-ascii?Q?xz2VFJjK+UIG8+93WdVLNLAFR2rB01Fpilv2qcvF6tC6yYuIExh5pq7zSp/C?=
 =?us-ascii?Q?ugQ4I+yhmbfzKDC5uXeBYiSc8qZGNUylfj07663F+OQz0t5EATWI7BjY32eP?=
 =?us-ascii?Q?UPyhwQZWtUOWXVUowt207UTVfZAPiL0qZaTOuFNOML17H3nuiqWfUzBGvbhP?=
 =?us-ascii?Q?k+eQtcUUDJFw92KyU1vbIXiR7wcoMBOD3bURDVES+apWZ4AGeH7WPf6d7p6L?=
 =?us-ascii?Q?yaP9xQbvSvEaFVE2Hq1dW6a6s6AZUgaTaFhyJ2JxGoMKkMwjb/vgqDFgHqsP?=
 =?us-ascii?Q?39VDmkVPIlzum9DGylmU46++j3mRxZCLnmiQK8OvKdnkF763KpM4OLLb2MC6?=
 =?us-ascii?Q?UYzdhonfa/qRZyu7hCQRJCRAXsjbgpaP0ABIIWiw/sp6neu0j4YpHLPsJgiV?=
 =?us-ascii?Q?p1NfWtqxdLv5DDhTCVrxgiLmTw8aUldp53PqSMDaG5oXRwO0oR9RIRu3HQzU?=
 =?us-ascii?Q?nTMReLyGYV4QQAWScW2qpnb02bIJoq9YAz0wG9/3nMnaFb9L7H9MS/0LX47+?=
 =?us-ascii?Q?nqMVnXg5VerFJHaFD8UZIbx/1KLne1DbpO1Hu+rAN1svUIf7lKkXWcuYDzmX?=
 =?us-ascii?Q?hG/D30xFNxfMOlWWTK1EHethc1AFfr3sfRNE48NUoc2Uz0EMqKweITbfdq+U?=
 =?us-ascii?Q?zjv8AEe7BaJVp9Z/IpSjpz7WGclJeV0MoI9i2ezxDinY6Uv95CLZkGmn1vIO?=
 =?us-ascii?Q?S8AZhYaSf9fS5dYbXk9tw48wUwD++KXI3geiw9SK0B/YqepNqCovY75JY3C2?=
 =?us-ascii?Q?c/1Qn8jMkPBKzcyy2rHWkwOB41KGAM7qzLEU512Z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4517d6-75ce-44eb-7547-08dd5b6a2be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 22:16:11.7126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m94sBy1OgAPPLzMMMDL/a3QSkPBh1P8UnsxoLui0U1F1qRv/koz2JLG27TSeTwk6G0mS70zHiGQs0BwOXCsZEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

On Tue, Mar 4, 2025 9:09 AM Cavitt, Jonathan wrote
> Add support for userspace to request a list of observed failed pagefaults=
 from
> a specified VM.
>=20
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
>=20
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
>=20
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> CC: Jainxun Zhang <jianxun.zhang@intel.com>
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_vm.c     | 75
> ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |  2 +
>  3 files changed, 80 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 9454b51f7ad8..43accae152ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -193,6 +193,9 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
> xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
> DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY,
> xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>  };
>=20
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned l=
ong arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 6211b971bbbd..1e78103fb0f6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3234,6 +3234,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
>  	return err;
>  }
>=20
> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property) {
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return MAX_PFS * sizeof(struct drm_xe_pf);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int fill_property_pfs(struct xe_vm *vm,
> +			     struct drm_xe_vm_get_property *args) {
> +	struct drm_xe_pf __user *usr_ptr =3D u64_to_user_ptr(args->ptr);
> +	struct drm_xe_pf *fault_list;
> +	struct drm_xe_pf *fault;
> +	struct xe_vm_pf_entry *entry;
> +	int ret, i =3D 0;
> +
> +	fault_list =3D kzalloc(args->size, GFP_KERNEL);
> +	if (!fault_list)
> +		return -ENOMEM;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry(entry, &vm->pfs.list, list) {
> +		struct xe_pagefault *pf =3D entry->pf;
> +
> +		fault =3D &fault_list[i++];
> +		fault->address =3D pf->page_addr;
> +		fault->address_type =3D pf->address_type;
> +		fault->address_precision =3D 1;
> +	}
> +	args->value =3D vm->pfs.len;

It should be args->size instead of "args->value" ?

Shuicheng

> +	spin_unlock(&vm->pfs.lock);
> +
> +	ret =3D copy_to_user(usr_ptr, &fault_list, args->size);

It should be fault_list instead of "&fault_list" ?

Shuicheng

> +	kfree(fault_list);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(drm);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_vm_get_property *args =3D data;
> +	struct xe_vm *vm;
> +	int size;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm =3D xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;

This vm need be released with xe_vm_put(vm) at the end of the function.

Shuicheng

> +
> +	size =3D xe_vm_get_property_size(vm, args->property);
> +	if (size < 0) {
> +		return size;
> +	} else if (args->size !=3D size) {
> +		if (args->size)
> +			return -EINVAL;
> +		args->size =3D size;
> +		return 0;
> +	}
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_property_pfs(vm, args);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> 4d94ab5c8ea4..bf6604465aa3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void
> *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>=20
>  void xe_vm_close_and_put(struct xe_vm *vm);
>=20
> --
> 2.43.0

