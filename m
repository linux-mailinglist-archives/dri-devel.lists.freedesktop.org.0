Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49848A7185A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41210E6DA;
	Wed, 26 Mar 2025 14:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWpIKTVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3423210E6DA;
 Wed, 26 Mar 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742998902; x=1774534902;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lW+v84gdl5OcO/aYIA9+F7PeqC2xJXVOYGbvsB7tLMc=;
 b=OWpIKTVoja4T5kbH4A6aKSufMnds+jAHwxewrtXeF9RChApdebvuJMRe
 dVG2hGlnEsl7bw/o3rsrTM3OQw7eVSY+MGfdY8YUy9+36v/whm/FVcpiJ
 plXMwi6WdLKhB4rryFWyRlO8rcC2CjoLoO7W3VhOOnRUIlIuaz1JUwMYN
 GPjlRLY73jUJi4yuBkLpAS6yFbqfBDEalDd50EPfU4R+m3ryJkPH4cW0o
 rd/t8Hpv1uugHHLzYjzfHW1mR7LAqMQ33jcvGR3g7lKP+dGknH4akR7v5
 RttRqhyynCBOnQ/xSlR+VmaAMeyBXQ4/B/AqEbbJ65YTOHVoSNpM7rnM7 g==;
X-CSE-ConnectionGUID: hQAsK7VeQJayLWsC8sT8rQ==
X-CSE-MsgGUID: ZdfRutNsR2a2BBo7JodUag==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54952554"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="54952554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 07:21:40 -0700
X-CSE-ConnectionGUID: kWf3+GVITjKa3tLvogcMBw==
X-CSE-MsgGUID: JdYVhKIKQy+pZTO5wJ9BjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="147978787"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 07:21:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 07:21:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 07:21:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 07:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojFpfY0+qUJauoCW3xApnN519H6IYW9amx8foqZgwxnx59hiSdqUprVis6OsiPEoKihiw5gMBvJb4OgBlgxOKjuRkvhQXZbE/69bmJ8o079oOcXzI+jFDeC9mIN1hPmxNB883xv0dxNctdBfPe2t5hDj1N+vzr1bP4pd9g/B7kWEZHVJshQnc1X/JrIFQf3SVQ9TPATLHFns6vpJK8C1zHcD4qQWtI1/C+KZD4dh6j1TrrkjdEEudnZ6P3+fOEwh0MfkJZwcewzhYVUcPjBC9UFSYU/8rqnGmOdkYLo0fEnNRY7dOrfLsa1s3RxEqxUzfb4XY+2ZoKsVJyQxnZ06Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0j/VDuJIh27xqKeNmhXWZbg1rpOCjZ0QusbT1i5j4E=;
 b=ur4XD4fznWMLpDGfnqgPeNv8gAiKqO4R4Uf8rjA7qEYCZMrOlPvYaK/puhOT3J7yK6mT7N0eNuhvZxoMTQU33BaBYQt0oxpEf+0bqctDVLDzAweruR9BrpoBRgsZbjiRyS2qGGjsouAqVytLJZShpZ0LavgQM4opCPtay9oW3ZNU5eGLED3HjmoJrdGHMYwkc/0EF3/F2mqcmexN7yesKkFth0MN59iCm+FaBFE6xAExqc+7am+gr2BT9XD9EHJukkqJzsSW40xpmQYN/ICpBBr3G/wxNwsHYvx4st2o/0+WVsyVjGp9iy18WhhXyjx330QbeKStVr1xjV+o4AILDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:21:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 14:21:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbnRHUJ6o9fMfhP023SUzR3Zt4/rODeBMAgABso3CAAKEdAIAA76ag
Date: Wed, 26 Mar 2025 14:21:15 +0000
Message-ID: <CH0PR11MB54449EE925D5291EAC8D90F0E5A62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250324230931.63840-1-jonathan.cavitt@intel.com>
 <20250324230931.63840-6-jonathan.cavitt@intel.com>
 <Z-JdzvwmkpK2vZj-@black.fi.intel.com>
 <CH0PR11MB5444B65CB663C9123B41F7CFE5A72@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Z-NAFqRhGK4Vjfv5@black.fi.intel.com>
In-Reply-To: <Z-NAFqRhGK4Vjfv5@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB6838:EE_
x-ms-office365-filtering-correlation-id: 37afd255-ade5-402e-3493-08dd6c7177ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mA3N+szt1zSgQLc/9E0nRp2mcCZIFUD9Ghw13qE6dA81J+0QcmLtaOVjT9UJ?=
 =?us-ascii?Q?2ERPmALygQyZ1f20DDOGc6g3ioCkE2r3Ict3mb+SBvOWUzQIWAq9LY1yFsJ6?=
 =?us-ascii?Q?K9iHNGAQV8+2aCAEvPDlWW06TQb7Tzhy4/SDi+xYbDGAjY28q4irxoL938si?=
 =?us-ascii?Q?swvbexVzbWjVdbBwsrs9TyZQIDU7djuIRh+/bmJ+uHEAv+EpTd5iRNRvq98E?=
 =?us-ascii?Q?Vsz1SPE3suwp8eAkGzwYxoqaUOfC209LEgm+c0AEGj9Jgn19tSvQn7uqqj0F?=
 =?us-ascii?Q?x//Nblb6ZLsxOxjkAenELlgb2IkPD9dBvcdDQVNRQchA8XexHU6B/0BSjvuS?=
 =?us-ascii?Q?/Hh5e64jvflmVFwD/rPL+6OdlFbmhrS0O2JkUcO5WGeLQKGlrZZwiQG8psPJ?=
 =?us-ascii?Q?98AcPkTpY/gd7A29xVvFv6ZflTavsynCcV+iHpvLVbRseauQWt72Juh0Hia9?=
 =?us-ascii?Q?L9EPhYBjoaD0ZcV++gl8od1l8gJcazjsIKmpHfMaDhoS30GgLeSvu9mI0nXO?=
 =?us-ascii?Q?s+Ewpo/ylH5NvFBI/lmpC4oX2LY3NVlhudDp9Lt7jMLW5tSLKM1WPBQu3b0T?=
 =?us-ascii?Q?m9TX1vRpQvWXdU91E8mOH10KKa/fz8/zEY6OgEZYdsfZn1Kr6Jsin4Hzm6UE?=
 =?us-ascii?Q?r2ZImzggGWJa+R/QlULFwBs03xlJUQigwLtBslMB+KEtRxMkxoI9hNAAGFiq?=
 =?us-ascii?Q?w5B9ZeTWDh0EbF/oeg8VYTPKdQlE/T5QDpn4pDIxEYkps/wihjKckxrPq8Jy?=
 =?us-ascii?Q?cqQgtdQreCUELfCY8JWc93ddeBQR9YO7ifI7ESPvbRkTnAPdHQUFf1DJarC6?=
 =?us-ascii?Q?LLwFCae3vkwrcStxN4I8Tes95dt1AVZxkntEk3Emkh2B1MXDg842f/1x+1Wh?=
 =?us-ascii?Q?1Q0rx68V4nPyGeCQJtX6mxMY2UdB5S4kPW1WzKoOZvAeao8VEHgPszqBFhJ2?=
 =?us-ascii?Q?AXv6we/mYH58Fm7HfiOB7cdzpCmTTtEWwE61ff/zr5cdrELC+QM12pBUbTJ9?=
 =?us-ascii?Q?ZLG0np3JbwGvP08r3X3f7wXtchRgmnd6eznmMkElMvGrQzw+kPfy27lmCajB?=
 =?us-ascii?Q?3qhtdLuTbBb4t8pQe046EyS76L2NFJuCKyk3R9UmOrRHfVn2wIAhX0I/XX0b?=
 =?us-ascii?Q?LpZTIhHMevItx7GjlQjT16tfPMGZeq6wsXUbzZ2vtHJenseMALYW1QAWfmbk?=
 =?us-ascii?Q?A4RWFJdyfgY6zKVfad+BrabO3jIBRLdvFFlg2B2T0/s1Xyx9jOvVD69y2RzG?=
 =?us-ascii?Q?hh9lP9s4u9x10zXQTt2tPyarmKXndRy9QO5Yxt5gXldy0ntOU3JnMFU6mbd4?=
 =?us-ascii?Q?xVHuWWfCoMSQg9INoolrK4zI8lLhKQWUjXxTKxmsmhtCBVhQaHP/t4U9o14o?=
 =?us-ascii?Q?MsWtsilqcze6Urj/wH/BlGGOb5hCmIehDzQMudL6T3ZkOCc0zMyS6GH7jgAJ?=
 =?us-ascii?Q?xRYgUtrZbtO8qA6W4kwCqYapzlDK9tz8y3jrzkvzd+ga2CsHCJqrLA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aybqtuh8cYbIunzDNmFmQHgDjkT0UH/Mj3UmPW7Euc7nTr2kESuMXDH3L/6q?=
 =?us-ascii?Q?gWR1KmHkSxgfRN/wTIuQ6frwaNgh8xJ9hQheCTzlW+uGYv6VVnkxfWTn3lsX?=
 =?us-ascii?Q?0eXdjBdUzj2Jh0rvypgh3VoAg3PhY1GGnKuqifNdVQpOSPm/Wd34kIW9Vltc?=
 =?us-ascii?Q?TXuGqG2WvdymiMbi6Wz/55B4OESb1GbhHCnTGi+HkolvkQm4f03I04IRTsMY?=
 =?us-ascii?Q?bF3da4mBICCzwaHS/92m2e24EEleD07CUCX4+AgOnuq1dJCHS6RtYxlcfbeN?=
 =?us-ascii?Q?12n5omvkqQyUPk6t7E8ToT6SZZo6l2Urn2oHvqupI+tpRytqac3htkmmF7vR?=
 =?us-ascii?Q?XwyCXQfHdejEUIMaSy6WiBcN7eg2NM6Ecq9I2dw1ezEtSyOuLsIiSQYYIiEv?=
 =?us-ascii?Q?Ki81BgjvlnBi3w7NWaY8ZbKh5CzK2rqwdKd8D4nGT6+9pSF5YI+yQ8ZGawOc?=
 =?us-ascii?Q?mp9pXIbHUehWe4pUUc5Jd4SHFEnXS8qJKII2NoXKnCYo6X7Ygd4TnLh1PpuA?=
 =?us-ascii?Q?Owe9DlN7HhU+gUmj0g3EcCN+bq8DBL8BxzULELURUoLUDAlH6tXX2qhGZePx?=
 =?us-ascii?Q?cRCklA5T7vzSfuO8qGt9L0Ee34ZgnzOCWl8Tj2H99fGbsu0ZNEscYRzUHmBA?=
 =?us-ascii?Q?qp3t5FaFtpO0El3kRIHIwzP99iZHZ/QAhZklVWo0P5/OKsqxfMqTYNUgWYS7?=
 =?us-ascii?Q?ixl1OQVlunZAhm3LwhEpR530NvSkTSqJPxG3yFj07zfSLMJgl5hIhxnMilwg?=
 =?us-ascii?Q?M0QyQaH0gJSO/rnjIa5WGfJ9k3pg2/qtx8+Z0g8WkrM9zrd4aDPsE+swCsOg?=
 =?us-ascii?Q?jysLiQN6BuNSSpP7WJS8Bztf9I81asxl0vGuWgx38yqQecT4MrOweZ/pdFtE?=
 =?us-ascii?Q?CRh3rjNVGeDgtNTnTWQk3gxDkVMxQe2llgHMcDgfASSxXFDjnw1Q00Kf9tUe?=
 =?us-ascii?Q?Vzep6/odvR0CbeSkSw7v+TvZaSm2BixnRFjRYFNaoT/1mBFs1Mp08W/UHj6H?=
 =?us-ascii?Q?igtiz6xEah59AO73ouya2Fgs7c7Tujtu6SFZoGHp2j9JE9rkWjbFu/ElSYJh?=
 =?us-ascii?Q?KXRgjA7/3AqXu5nk2jSmVKV9M4OTnTJWxjpuf+n3RcJW8Uxz5Uq68ba7O762?=
 =?us-ascii?Q?fj6JPeTo2mkSAFpTdCrRmlKbGLSA6Xm1tBHvbSGCiGzztZgkfLTxwZRFlNfo?=
 =?us-ascii?Q?FFZHdWBfjNMxzUACtI838YMTav0JXG2x4732Df1Cj5TJl+L3Ty2hLl0DYk4H?=
 =?us-ascii?Q?jJd+tiRARuoY0+NzwKQL1Mp5BR7Pw9c4FQvNl18U1ByMfbJ3kaHCLmX5TVqj?=
 =?us-ascii?Q?V4No3AX4gJLAphuVudAPTpIRHp9oQSxYg+qhIKQmgUkOfOPczXQNy0bsibP4?=
 =?us-ascii?Q?s8W57abAlIMkngQlk4U6bcgPZdeec2HjrCwNxeh35DnsemKXSF1hD1Datr6x?=
 =?us-ascii?Q?kIVj08FLDqYEqypq8c1x8hENTcMut/9QN9ucxJHF/MN76QqTiGRrbfPl6CyL?=
 =?us-ascii?Q?lojyIHsMLXOy0zzAqY57sSaaHAWH7JoeevEJY2554ZxqfdHJiXschKY+/BLA?=
 =?us-ascii?Q?g+wW3cDvu9SvTlj5+6wxmHAOJRWMXacKCrKFydNZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37afd255-ade5-402e-3493-08dd6c7177ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 14:21:15.2954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSSaWrR81RTKvVVE8D/XkLUF0vGa3jR/9G3CIdL9njbcxhYYGJSA8u2Y/hEYk6sHSXg0wrcAeaV5tWgL+aEKS56UWr9BehsJIooU11Rw/OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
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
> From: Jadav, Raag <raag.jadav@intel.com>=20
> Sent: Tuesday, March 25, 2025 4:45 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel=
.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Bro=
st, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.=
com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop=
.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <micha=
l.mrozek@intel.com>
> Subject: Re: [PATCH v12 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_i=
octl
>=20
> On Tue, Mar 25, 2025 at 08:15:59PM +0530, Cavitt, Jonathan wrote:
> > From: Jadav, Raag <raag.jadav@intel.com>=20
> > > On Mon, Mar 24, 2025 at 11:09:28PM +0000, Jonathan Cavitt wrote:
> > > > Add support for userspace to request a list of observed faults
> > > > from a specified VM.
> > >=20
> > > ...
> > >=20
> > > > v10:
> > > > - Remove unnecessary switch case logic (Raag)
> > >=20
> > > This is usually "changes present in version" and not "comments receiv=
ed
> > > in version" but I guess this must be one of those drm things.
> >=20
> > I'm fairly certain change logs are supposed to be written in the future=
 tense.
> > Or at the very least, I think I picked up the habit in college.  Is thi=
s not correct?
>=20
> I meant it belongs to v11.

Apologies for the confusion.  Not every patch is modified each revision cyc=
le, so
removing unnecessary switch case logic was the 10th actual revision of the =
patch,
whereas the series as a whole had been modified 11 times at that point.

The change is correctly labeled as a part of revision 11 in the cover lette=
r.

>=20
> > > > +static int xe_vm_get_property_helper(struct xe_vm *vm,
> > > > +				     struct drm_xe_vm_get_property *args)
> > > > +{
> > > > +	int size;
> > > > +
> > > > +	switch (args->property) {
> > > > +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> > > > +		spin_lock(&vm->faults.lock);
> > > > +		size =3D size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> > > > +		spin_unlock(&vm->faults.lock);
> > > > +
> > > > +		if (args->size)
> > > > +			/*
> > > > +			 * Number of faults may increase between calls to
> > > > +			 * xe_vm_get_property_ioctl, so just report the
> > > > +			 * number of faults the user requests if it's less
> > > > +			 * than or equal to the number of faults in the VM
> > > > +			 * fault array.
> > > > +			 */
> > > > +			return args->size <=3D size ? fill_faults(vm, args) : -EINVAL;
> > >=20
> > > You're comparing an int with u32 and I'm not sure how this plays out.
> > > The usual practice is to use size_t (even in the struct)=20
> >=20
> > Size is a u32 in struct drm_xe_device_query.
>=20
> And what about the local one?

Do you mean the size variable used in xe_query functions?  Because that's
size_t.  Though the initial question was about the size variables in the st=
ructs,
AFAICT.

I need to solve a rogue locking issue with the series, so I'll change the s=
ize variable
to be a size_t in xe_vm_get_property_helper while I'm taking care of that.

-Jonathan Cavitt

>=20
> Raag
>=20
