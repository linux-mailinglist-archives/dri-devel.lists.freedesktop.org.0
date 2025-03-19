Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA45A69AAC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 22:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9810E588;
	Wed, 19 Mar 2025 21:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp0vQYb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677B310E314;
 Wed, 19 Mar 2025 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742418883; x=1773954883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yijq2zQK5Oc0ln4sQkoCXSiJBj93SbjQYX2YE61kmJA=;
 b=Dp0vQYb9/BOEtciG8RRkw2E2P2sXXWPvXc3j5x0efPfmC1FcoDg6Qpax
 W+olNVXSGR8B8b4nGmbhliiXnz4wT54FX3EDo0oXP2lUY1Dyt1VKTs/Ck
 UrJcn7gO/TvcLmV5xuLGq4Bz2ltXswbOFr9XGOCLDZstacfyN/V2/htOT
 tlwUD6iNcbTm9RwIARYelvu2vTLOvUTWMsB4g9fNLONXuYN9BV62ZNLRQ
 Z2CH0Ij+ss9zPme0cA25rrvaQKeLMVqas0xKN8bgHeG1N6A/NqBH6sc3a
 vC+ZlLvx96PkaaAfyDTgdH8l08A0cN6a2MVzcQGnFwqpPtReG4p0GdTcz g==;
X-CSE-ConnectionGUID: p57+v+9CSTOFgFxIAXQ6PQ==
X-CSE-MsgGUID: 72grA2DvRiaZL9giqn9W0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43736732"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43736732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 14:14:41 -0700
X-CSE-ConnectionGUID: Ab0M3L8xSbeBNDEsWoXu+w==
X-CSE-MsgGUID: r8jAVf59S164mcbeEOSBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="128016270"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 14:14:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 14:14:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 14:14:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 14:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOdWt4XSUmQ28dmi82PwSU0lada9LxybF27v1ZsUdFdNIc2ZMr2biwXJd0WACS2Gj88TpN1gH7x/0GL1w+jM6Off+v8zHmNmhO2WWCUQcfU2kamMc5W8R63su1/60e/WjDbkePvgz07n8GnqBv1+gcxTDX6/JR88OF6/TU6UQ8FbmnW8kfchgY1wlaj/7Y4kXshFJbk9WE2J0H0t/wURp6ckgmLQjjlUcu2WZjGO7FVpcsFAkmgerwMJb+PF811F5tE+faEmQK60L2in8hDAESxj2qOa0ILg/DnhWAc/g0rGneTW60GJhlj03aiPzsrqaiBxyRIi1m9YMDbCF4yZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLnjQ+UGb+Vmj/rV1R+tk//siG1ZU67y6ArTwaZtS/c=;
 b=PawjF1kVbgCdvZcFTPR9RCADoKvfzhunHx+wWll2Ibg8y5WpDzeZ46GfJMaYWjnsSRWzkv4cVoEs308Utf2gRQBiU67Brh3KYNa6+olORFYmUxLkeEOom/kfhuzP2sWYp9neQiucOJDYiisk/wbU7nKvru+U6Wqbvvbdn2SUcInoI+porChE7Mz1eUmRdSYi1HdH4v/Kj6SzSgjcv7sqQMsY2rvxWXCCuTX6eRqa52M59MBUHeyn67sJyi1AZHJC48LPdWYjlD28xMsdyNz/CxgadIPrzawH+XhOcnsZ4eQjS5PG6iuiKRv2o4lcXW0jExQ6GPIbnGaCGsAUOsDDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 19 Mar
 2025 21:13:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 21:13:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Topic: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
Thread-Index: AQHbmCjcA44oxosgcU6Hrsbe0PPJI7N64naAgAADbUCAAA4pAIAAAaMA
Date: Wed, 19 Mar 2025 21:13:56 +0000
Message-ID: <CH0PR11MB5444F20BF59C2DB0B7A2953DE5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-4-jonathan.cavitt@intel.com>
 <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
 <CH0PR11MB5444600AD376DB09737B32B4E5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
 <CH3PR11MB8707995DFB1FAE57E0023449F4D92@CH3PR11MB8707.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8707995DFB1FAE57E0023449F4D92@CH3PR11MB8707.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4930:EE_
x-ms-office365-filtering-correlation-id: b619e41f-d408-4e2a-75eb-08dd672af5c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?l3ULTB+XvgsuckWyn5u4B9NDt1tiSvIzbnkwA0ZHIWpa4CneS+iMsmR4xf5K?=
 =?us-ascii?Q?4oN4F9gBErWBOusSL/80X9qX2kkeKLNJiEBFHXa72EEvoO1u5jvlAyAHU8cv?=
 =?us-ascii?Q?U7+RwzcAokNlInCFCWbrfR80RqmPfDZf1v93FOC3i1ZnLpv5Bn4MPRpbpfBY?=
 =?us-ascii?Q?LNBrhSRWoksCm7x/V0cn4sAAvEHrlfN4GGz/WR4TP60/THcDXGuYrkw0U7Pv?=
 =?us-ascii?Q?dGrG+zUUaG5hah7Ei8Fs7xX5IbbVySfIj1FeLBvuZ5KA4E1UoekEiaXR2A1a?=
 =?us-ascii?Q?h50obnwOeZKbTPnyiacvS34bP6F9O0cd7RU579QdZhgJzoM+QzKalPwfuBEA?=
 =?us-ascii?Q?Z5YqYyO2XUL13tg8r/0qwK0qUcuTLsepswpKedwoKXu4jt2PbnmSnb8QzNOo?=
 =?us-ascii?Q?ZeSDdSiXDVD3PDM1gc3fG/roEuS6PINbqdiqBoYqwz63H+/7UCTvnMCgFLW4?=
 =?us-ascii?Q?oSrkts2thEysnJeKQ2G7cLsfEfUXuVLUShCqQTSoHNacVJJBeoegNB0BOObh?=
 =?us-ascii?Q?BoKHWtEwc/LdPbdbqdBkXd/OasFmGYWhb2YaaOxBI0/jK3iSE30xJINQ+mxx?=
 =?us-ascii?Q?uaiPlO546IQ5YgroYotfk1TF4rkUMWgr+PDh8xpJoUNYXNGdhqAwpUbS9f6E?=
 =?us-ascii?Q?5o2Q5Z7AyTNCIVPlAz7Q9jOgoO2KFjtx2FDdt/m0xYxqDEqHESAkCDiq2d9S?=
 =?us-ascii?Q?6aw0EGqcR0BvvSxsF66VtyvPPGsxWjgTD02zO/8M83kU+oaK4OL/K5APagyA?=
 =?us-ascii?Q?O2VQkOj+mXdXiZ4ar++i5L7sj7c6csBeXg0pAom+OBFmGDQ52sM9XfA1Z9YS?=
 =?us-ascii?Q?O/oazPpiw6BaxWC0py0N42iMXAUUV6RIf7YXkEtTOVWiTqnaJScLG6BTrf6a?=
 =?us-ascii?Q?CEXbFgeWYoaI6yLoDTRBXZ3p3bfBXGEujppk996BMMqlfCpLfy5YCxvu9rDx?=
 =?us-ascii?Q?CNBKTf/ybSr6YQ/4OQCeHGsdVm2shzNVQgGOhSzc35gJ4uqiYEKQd1Bkev+K?=
 =?us-ascii?Q?VC+xGVZ50a2q8kLRm7ALAIl/K+Q7f+t3snkuX/4pM0UumJoR7Fu9DP+UDnMV?=
 =?us-ascii?Q?gEIdlFW4AtuAAk21G3FmyJu1+sLCZEQ0LM+xFAzVDtIgoFiHPK2mclhIetBN?=
 =?us-ascii?Q?5B/Ow1cgSttg0VWETK+Zd1rP2kNy92xnI6oz94hf+eC6RMwmiW0brd1T2RHS?=
 =?us-ascii?Q?5lsDsj7bqadrSJ02YATBBfvcw710NBPUDN4Zmf0VQiqtVeMQSKLUqDehKRko?=
 =?us-ascii?Q?rRSc1OsaCGMfsIyShpcycU2rHQ30XmKKSjlIwGWUYV4Zu+84u02oZ6fCz0e0?=
 =?us-ascii?Q?TTh5+uSQ7cAo+iVuNvPJnGED9yMqJ8xgGMBzsvIgF7EvdiZRf5boI8TfiieQ?=
 =?us-ascii?Q?BFdZ+BuVJCNL+ThvFHzTwHwve1AdpDslxExZFftRQNEQic8TBf2a3WVHSoua?=
 =?us-ascii?Q?v5WuxGxSsOLUJz2k2t7Kri+Ed4JA1rIz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?prAfABzclggniCaCIAbHdXsKePJSvu3xdqc9cS2DRhJGa+vxvxhpnDmL9ENj?=
 =?us-ascii?Q?ePVlKUgrhBSaS3Z2L3xzs4YUuKFRrh5OzF4eAM9OiJLC9zxFWId8nI5fPWWE?=
 =?us-ascii?Q?klDFf/TvYtRp450rh8VfoVaT4aWLzOIqcl+tHqSbkNmA0gpVgM4OCzV+vQV1?=
 =?us-ascii?Q?/UKhhWGuS+bpPviP7SF026i1l2itWl+7wc8s7ZUJP0aZi9GGzF0aSqklYD5K?=
 =?us-ascii?Q?sUF7v9Q6iKzs3CudGdglKSUbPaT+9Rb+TrBULb1cMJd8hpOE7VlxmPZUpMnB?=
 =?us-ascii?Q?jK3xECOrw20gJhkInLhgmYGvHSuGH2M4Lh7aQgsSIfSyMOuwxGZ4cUR6zic4?=
 =?us-ascii?Q?6VNXnvX1Fvc3OCOx+PpNGq7BeQyI3fDH74R+z1uifBtGbAchEyB+tNNruyWN?=
 =?us-ascii?Q?Qv5BQXE0RKO7vXW2DcsWCxLxboXv8ae8FYNTBhjJOlmNYXu360v9Q74SVqcd?=
 =?us-ascii?Q?UZhKtay1bgBKeE2Jua36L5FC1g2QISKmwc2F90LbQ/ihboMqVVJq6s8VuX0s?=
 =?us-ascii?Q?RSObIacc4DLpry/fnT5i2xL/9NG7igXz9bR2Qa/7xuadEWEh4LNnTkc4NWko?=
 =?us-ascii?Q?ffQLbdnhDhuX7XnaSYYD5Mq33QLf3rissEssoCWGXp3RQ08HZ8FYQkOk9t1o?=
 =?us-ascii?Q?O5RtgyOd76x4XY4XJHxXKrTbNhSB/uSdJw4/aXBoCjypXwX7ZqHFC/9zu1uD?=
 =?us-ascii?Q?uGpsn08AumKySI176TyHt3oozr0X5mUfvbgySemEPW/3EqBhFyPYcFcPKCUH?=
 =?us-ascii?Q?oCurUjIb2czW1kQKjQ4A3KoS7CN7/hF2nFXYLStQizMosVD8mOyK2/YzfWgR?=
 =?us-ascii?Q?UZIdRMVfj1weVsI08snjYhTqIGGT0D4QB64Sy8UDyZB8jF1zJyDhfAHtW5Od?=
 =?us-ascii?Q?YatvAQwHWT8PmQMB8rvQBlQLna+5avAuekojbTT6yH7412vHj1SlN9YOy2gz?=
 =?us-ascii?Q?gMZbIpPnnNkV9vTLs+0oAiUwWtUlzZw8qJZi2YUfUe19ux55vdfOp4BbWH5q?=
 =?us-ascii?Q?88tKyq7s5OjcXVM9Rn91R+fCG6sK0SHzq6uMB6uwC/fmDPhASWBoKr5mtm74?=
 =?us-ascii?Q?YVabTeJ3UQgjm7E9bMBVD6jQqwhUqMe7fXPrIR2pFt1l2wjG7yTpdacqNGZ5?=
 =?us-ascii?Q?uh8JrBRetTviASYTrNfxgBjxcKjckEXyB+Kpjh3i1MNPnB2UWJqXPm3AsXUr?=
 =?us-ascii?Q?TQ5/k9aCb9P72HTsLrorcICpg2gKA6u3spQBzsqIpI411OatpmQnvfzJsUY0?=
 =?us-ascii?Q?rPVKcV9pBPplh0hzislrqcUTfx4OSIHNLDHPzdCZIYPPZVze58DkMZXH2zpX?=
 =?us-ascii?Q?epCgdRgG1tG6llRr546bximBah2B8kavhXSvY8K7mhyHlo8XxrVdIs+OAPbx?=
 =?us-ascii?Q?gbS4aTNW3S9k1aQYrmR9QYzRwzrkH2ttBKdP1f/ohf6EvbVzqHd8btLO4TMn?=
 =?us-ascii?Q?oGzC5tIQ/nlKAFKWdGiNNK6/fei2+1FAmpj1okDJedD/VBP6k6BimAKxfcDC?=
 =?us-ascii?Q?ZI7KHueF9qJ778mUeIkNAo6pZ3dowm9dkVTwKMG0fJGVqd6HKyBX1C+Xbke8?=
 =?us-ascii?Q?XxN/NmkLkRkfwqQtsC0+3B3ldO038CM043FwDCgs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b619e41f-d408-4e2a-75eb-08dd672af5c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 21:13:56.5686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Erq0QOS9nwm8Q7ZSupOFoDuUWuaTTA9YJcs6ArETWu7pTjL5JGRGxVtdl9ZLhqqgL/Jsezk+Vxlzzqe7eo2qS1KKGTN5LXDi4p/MzzCiyaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
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
From: Zhang, Jianxun <jianxun.zhang@intel.com>=20
Sent: Wednesday, March 19, 2025 2:02 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.=
org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal=
.mrozek@intel.com>
Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
>=20
> ________________________________________
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Wednesday, March 19, 2025 1:13 PM
> To: Zhang, Jianxun; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg; Zuo, Alex; joonas.lahtinen@linux.intel.com; Brost, M=
atthew; Lin, Shuicheng; dri-devel@lists.freedesktop.org; Wajdeczko, Michal;=
 Mrozek, Michal; Cavitt, Jonathan
> Subject: RE: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
>=20
> -----Original Message-----
> From: Zhang, Jianxun <jianxun.zhang@intel.com>
> Sent: Wednesday, March 19, 2025 12:59 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesk=
top.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel=
.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel=
.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedeskto=
p.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <mich=
al.mrozek@intel.com>
> Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
> >
> > On 3/18/25 10:11, Jonathan Cavitt wrote:
> > > Add initial declarations for the drm_xe_vm_get_property ioctl.
> > >
> > > v2:
> > > - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> > >
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > > ---
> > >   include/uapi/drm/xe_drm.h | 80 ++++++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 80 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 616916985e3f..ef335471653e 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -81,6 +81,7 @@ extern "C" {
> > >    *  - &DRM_IOCTL_XE_EXEC
> > >    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > >    *  - &DRM_IOCTL_XE_OBSERVATION
> > > + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
> > >    */
> > >
> > >   /*
> > > @@ -102,6 +103,7 @@ extern "C" {
> > >   #define DRM_XE_EXEC                       0x09
> > >   #define DRM_XE_WAIT_USER_FENCE            0x0a
> > >   #define DRM_XE_OBSERVATION                0x0b
> > > +#define DRM_XE_VM_GET_PROPERTY             0x0c
> > >
> > >   /* Must be kept compact -- no holes */
> > >
> > > @@ -117,6 +119,7 @@ extern "C" {
> > >   #define DRM_IOCTL_XE_EXEC                 DRM_IOW(DRM_COMMAND_BASE =
+ DRM_XE_EXEC, struct drm_xe_exec)
> > >   #define DRM_IOCTL_XE_WAIT_USER_FENCE              DRM_IOWR(DRM_COMM=
AND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > >   #define DRM_IOCTL_XE_OBSERVATION          DRM_IOW(DRM_COMMAND_BASE =
+ DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > > +#define DRM_IOCTL_XE_VM_GET_PROPERTY       DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
> > >
> > >   /**
> > >    * DOC: Xe IOCTL Extensions
> > > @@ -1189,6 +1192,83 @@ struct drm_xe_vm_bind {
> > >     __u64 reserved[2];
> > >   };
> > >
> > > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERT=
Y_FAULTS */
> > > +struct xe_vm_fault {
> > > +   /** @address: Address of the fault */
> > > +   __u64 address;
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT         0
>=20
> > Just a question, VK_DEVICE_FAULT_ADDRESS_TYPE_NONE_EXT in Vulkan spec
> > specifies the address of the fault does not describe a page fault, or a=
n
> > instruction address. Does this NONE type in KMD mean the same thing?
>=20
> I think it means that the page that was attempted to be accessed did not =
exist.
> Read, by comparison, means that the page existed, but that permission was
> not granted to read the contents.  Write means the same thing for write
> permissions.
>=20
> At least, that was my understanding.
>=20
> -Jonathan Cavitt
>=20
> But no matter if the page existing or not, the type of access, read, writ=
e or exec is always present. Make sense?

Yeah, that makes sense.  Though I don't think that's what the address type =
field is being used for?

Here's the itemized list of places where these address types are used:

DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT:
Used during pagefault handling, if no associated VM was found.  It's also t=
echnically the default address type
(as the pagefault structure is initialized to all zeroes).

DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT:
Currently unused

DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT:
Reported if we attempt to perform a non-read operation on a read-only VMA.

Should we expand this list before creating the next revision?  Or perhaps r=
ename address_type to
something else?

-Jonathan Cavitt

>=20
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT 1
> > > +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT        2
> > > +   /** @address_type: Type of address access that resulted in fault =
*/
> > > +   __u32 address_type;
> > > +   /** @address_precision: Precision of faulted address */
> > > +   __u32 address_precision;
> > > +   /** @fault_level: fault level of the fault */
> > > +   __u8 fault_level;
> > > +   /** @engine_class: class of engine fault was reported on */
> > > +   __u8 engine_class;
> > > +   /** @engine_instance: instance of engine fault was reported on */
> > > +   __u8 engine_instance;
> > > +   /** @pad: MBZ */
> > > +   __u8 pad[5];
> > > +   /** @reserved: MBZ */
> > > +   __u64 reserved[3];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PRO=
PERTY
> > > + *
> > > + * The user provides a VM and a property to query among DRM_XE_VM_GE=
T_PROPERTY_*,
> > > + * and sets the values in the vm_id and property members, respective=
ly.  This
> > > + * determines both the VM to get the property of, as well as the pro=
perty to
> > > + * report.
> > > + *
> > > + * If size is set to 0, the driver fills it with the required size f=
or the
> > > + * requested property.  The user is expected here to allocate memory=
 for the
> > > + * property structure and to provide a pointer to the allocated memo=
ry using the
> > > + * data member.  For some properties, this may be zero, in which cas=
e, the
> > > + * value of the property will be saved to the value member and size =
will remain
> > > + * zero on return.
> > > + *
> > > + * If size is not zero, then the IOCTL will attempt to copy the requ=
ested
> > > + * property into the data member.
> > > + *
> > > + * The IOCTL will return -ENOENT if the VM could not be identified f=
rom the
> > > + * provided VM ID, or -EINVAL if the IOCTL fails for any other reaso=
n, such as
> > > + * providing an invalid size for the given property or if the proper=
ty data
> > > + * could not be copied to the memory allocated to the data member.
> > > + *
> > > + * The property member can be:
> > > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> > > + */
> > > +struct drm_xe_vm_get_property {
> > > +   /** @extensions: Pointer to the first extension struct, if any */
> > > +   __u64 extensions;
> > > +
> > > +   /** @vm_id: The ID of the VM to query the properties of */
> > > +   __u32 vm_id;
> > > +
> > > +#define DRM_XE_VM_GET_PROPERTY_FAULTS              0
> > > +   /** @property: property to get */
> > > +   __u32 property;
> > > +
> > > +   /** @size: Size to allocate for @data */
> > > +   __u32 size;
> > > +
> > > +   /** @pad: MBZ */
> > > +   __u32 pad;
> > > +
> > > +   union {
> > > +           /** @data: Pointer to user-defined array of flexible size=
 and type */
> > > +           __u64 data;
> > > +           /** @value: Return value for scalar queries */
> > > +           __u64 value;
> > > +   };
> > > +
> > > +   /** @reserved: MBZ */
> > > +   __u64 reserved[3];
> > > +};
> > > +
> > >   /**
> > >    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QU=
EUE_CREATE
> > >    *
> >
> >
>=20
