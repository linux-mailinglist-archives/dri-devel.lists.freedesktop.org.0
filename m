Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B78A9B050
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102310E336;
	Thu, 24 Apr 2025 14:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1B3Fhnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD9910E11F;
 Thu, 24 Apr 2025 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745504045; x=1777040045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EH/LBK+lMGpuRWW0Oam4vCxbtr87KDfIMcSCxVZHYEY=;
 b=L1B3FhnzBxRdbQoS3/3Mw02DOMLFyoxlj8tz5vAYy7UbJeIeBeFAr0Rr
 X1IrEMI+wrt25H6tDFDB/PEIiNDwB9D+PHD0kv5boNf/8FxXL7hYuIPM2
 QESkO7h/rN3moZS8n3jgpd1zSqmJQnhFZdpVbXXTQEnmJs7LVvOBHshlS
 kW7/vyR482l6zYIS15k30DTfdBXbA8985SiHAf35vuRx/y+YOrkPAsZlk
 FmqjEkiaFpncKzgPReYLmH07Zi45rvGAPLeN/0mk1IL6B9Dsppqr0CPn1
 3PNG2aP7XG8TTyj0gtA1IZFjznJaltpiPrtujQVUh4ATHTu0taCf3jc6H A==;
X-CSE-ConnectionGUID: GVOn0SSsSaOljiR/r1/F3g==
X-CSE-MsgGUID: jBvPDCo8RI21QmbiS1ff7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34762144"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="34762144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:14:04 -0700
X-CSE-ConnectionGUID: VWWwUQb9QCeDekzq5RuzBw==
X-CSE-MsgGUID: CH5d8zlcTuWcjtZO/eW0gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="169842194"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:14:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 07:14:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 07:14:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 07:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIpGKXFynb03kcWR0QP40dBUYWzPC8+TTeKuxVQuJSP5lVkl6S8QooMEoaDoSdgBbtpaWMLf//QjeVpgVjTNh8X17ZxTSFfCqxkyMirI79aG0qogf1KgZ6wOlpBPFYmWKRgh8FZbzcrJtS9R7qse5YTk5bzoXNxxdpMj+ctpDNf3csMbcvFQUjpo8FlZIcA7yOCGsPxsgi7AQuXc8FkmXJK6LHqWMV1uIMAhgZjgS+TVL1IMQVSPE4YdGyk9V4tDeCRUVOo6bN+pu8suUJys+9IzT9TkDdoRwMiGMOAau+6XYlqGh9gVv4i+HiL1X4vTSKzcvHMTG0SLCq1iC2Tp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bgnWzhCpLZgvPTSEtilqir2zx40bKeEsOrV6+OhCa8=;
 b=A1fkmndUDj2I3Qh+RjiukS9/ZGnsEAwOeljN2qLrvr7WxYPZK5uORXuoP2z+ZzuquzmiMY58H+GKmFiDyzPTNmT2XPmULnEqAJOKxoBQqEt8s/uJGjP49PBviKk2CX/lXYAIqSQ27HtzOhI2K9SBW47gywSxI6XCmyOvKY/FbxHT6e7+zRLuNurK+1kggv69UrTUInO4v9HWVVoNW9WFNFNorSgqnumR6Jvh6TzqQftXZANuN2dI3I+I/S4qh6hy9RXYNFyCx/+dubpWLOL9OgOSI7jclXgYRYu3xQ+ZQTJrY0YW3zD0MIoUzkVmRpvE8ZOSWUeNgoxKtPuVzpG7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 14:13:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 14:13:42 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v21 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Topic: [PATCH v21 4/5] drm/xe/xe_vm: Add per VM fault info
Thread-Index: AQHbtIz82wmDWcF6WUu37A70S4pZobOyLo8AgACsG4A=
Date: Thu, 24 Apr 2025 14:13:42 +0000
Message-ID: <CH0PR11MB54449481E41162985087628EE5852@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-5-jonathan.cavitt@intel.com>
 <DM4PR11MB5456188FB0B6C2D70DCD3CEDEA852@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456188FB0B6C2D70DCD3CEDEA852@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6420:EE_
x-ms-office365-filtering-correlation-id: e493adb3-e45f-406a-dddc-08dd833a37c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Q+0orhNB7WtY8a+O01AX+vSnG7zDgTLLux3KSVCrCNunarT6SpQcWTKiwBXr?=
 =?us-ascii?Q?991eKAHsBXg3ESkSqBP+SNJ2hCp32KhpqWHmJjuylQgSa+1WVxqaft+4Roj/?=
 =?us-ascii?Q?fbqNdHzCVRkBCKAuKvLcJlf+QG5KsGdep0ssSgE1FqomL3DQmq7kT7jvzACJ?=
 =?us-ascii?Q?Yn1+jH+Az2RsdNQ5rqSb+icxt3PDSq5o7Js7y8ErNDRBdNOoYAVSJsaKLx30?=
 =?us-ascii?Q?R5dvL5JBUZ7dBeoaYqIEIahYn1frnz3txg4SX0qKmdTKVUCgNrkaAD4PTev6?=
 =?us-ascii?Q?K07Zb/knDhv9guK/jkEiQCr7yUED9TdVqn2x3WzcOU30mbywoGhPmpcnd8UW?=
 =?us-ascii?Q?1qciy92KroOWlymjxcbD2cG3lCavVwDjvtM8ViHVUILq2GQOMXdYBIsaN/Pl?=
 =?us-ascii?Q?6bTqpa7nRI4E2zj9vwzlvuVo3EuTpkKSzcxdYHdgmbq7Sy+Re+bxg5j7WeIV?=
 =?us-ascii?Q?4x69TDxU+xqiVVezFRkRQ1VKo1ow7YjJ1AKE+Q8Vo7FVo+zYuGEzQwTH4TWO?=
 =?us-ascii?Q?NLaX9fC0utmbQuHYaxiFhtHqaOwdg2ElAHsWZmMFDDycQurrQ05vUiJARlf+?=
 =?us-ascii?Q?ROJ6jpoicZgwjwLcSwz52EN+PDvKUe3QTyh3pGwlADFy8Sg4+vDjxGDyCsja?=
 =?us-ascii?Q?2ORlAYNxoRzNi5cYlB5NOuzqdRoEyCFX0NYRow/kQ1ABY1Nicym2XA1lkAEQ?=
 =?us-ascii?Q?M1H92BTq/Hod/vnAhayEZU3UPRzF993ulNxxSU+lYnyJFdMtMmXE2hBJrqw9?=
 =?us-ascii?Q?osFE3F4zTTCjNVh2yQ2peXPwzMkGNzmFscTa9Jf3pJW9ByPptRyZEnekinsw?=
 =?us-ascii?Q?FiffZVscDKrw6FSNAYPZYpNEwJ7TN7s7N9W/T+okx2reWtc6ZkTWIpP1oB+6?=
 =?us-ascii?Q?N7+xekk6uQrUMiMNHKwXb2k2I+eN9VkOwN4p/53OyflCjZBg3E/wqdIvq+pz?=
 =?us-ascii?Q?iZMAqtgE0eBfUW5/25QqOjL28LwKydfWYrvnKwvK6mWymj770nOVemYYNz6Q?=
 =?us-ascii?Q?Vu/sbn9QLAA3IV0Sc6Adm8gdWh6S34dCIOvXFnPR1nhr9tkr5RaGPR1FiisF?=
 =?us-ascii?Q?UTTgulJN7mlxwlT4krM8vIbM6WRgthTYrSDtolxa5y/TLZ/tibD0I5uKuJMK?=
 =?us-ascii?Q?DAXmsqm8NAxI9/nWcPcvfBcwLV0OAaAo/wEGss1GU+ZrtEIfICkR/ubXeq1a?=
 =?us-ascii?Q?jHspq9Ykq/U9uh5tPJ4Dq8CRHlECLeckjF5V3vkeXitfTmFcqZ3C4WPbbxHo?=
 =?us-ascii?Q?N6Y4C7DHC1+hWsDV1xKzN84GMd6J/RWcnfx/rS4P0Njwubwam70UjCPO76I6?=
 =?us-ascii?Q?65c5eh91zKnM49XbIVMOyvgcunbcfWMt7wdyQBJ9TEg7OXzhh2R7oeZyH85r?=
 =?us-ascii?Q?65+Qz+qmqeN2JAozj7TdF8Ukq34Ox7CPp21BM6w1PxUyMVFfXW8Keo15fk2V?=
 =?us-ascii?Q?DCTJZowmPCaOKmLSw9XWaDVPwzzjN2sH2+71fds4IYMMzXt1MTQrn1Cgv9cV?=
 =?us-ascii?Q?WhEf8SN+TjEFNRQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YIv61/kFhtJMyrHRoXvTie0AQCx8LK2PfEkoYKwXxs8Ovv3gdCTpDKznlR9l?=
 =?us-ascii?Q?Nkcv42B8ZiOIPGH2nadbivCRXpjas9U96webutLuY4lkpXkS4g0u9OnB+66D?=
 =?us-ascii?Q?hJirQPO7dBJGkA0W6Ki8tgpaI8dWSbTgJanEYwVSfhn7X6F+J2UPYm80fyF2?=
 =?us-ascii?Q?jvZJR/f6grNyBNrygB4SnKgz3kZkiGMNwY0cvPBZhFCauyLVuosKDWdCXwMA?=
 =?us-ascii?Q?RIoLxq/WogangEShFiDOg8rDtEaFHnBbU0hMc6Yt1yHExwpc6W3LuGZHr2g9?=
 =?us-ascii?Q?154PpUsksZRVj5IN1KKfmiNGCfuxi+A/zov54y9YrwgVEAHa5gNgd76GBRT/?=
 =?us-ascii?Q?Bzu6k6dIjm+ly8aOl9JrxHrpExuQcpmCeJ5LYJ34jbYSR5XmUXKUVhhvmKjP?=
 =?us-ascii?Q?orPag0qFYf8LVGGpfOakgGdi7DbA9UIxiLo25ZskDeMmSesvTQ8A1eLnom5b?=
 =?us-ascii?Q?/DvIxrUfq20uyxl3S2UoOvE9nGe06VWmZhbwZsyyKmNEMJIxP3irowA/hZbu?=
 =?us-ascii?Q?Vk1VZT/qLCLCCdsZqqTY/8To6O380AESNHts+Sq9JPTQg0ToQ5bjxB/tjAb+?=
 =?us-ascii?Q?UbTTMf6WcRvCxVj/ran9UB7zKsat2u7+Q4jq+xCslrw+6laukpP1gqsuDgw1?=
 =?us-ascii?Q?iN7d1y/JRaoX6UtNzNrwd/pqw4pN+KiaPkvzzXrx016ROIIRvHnHW/twxB2/?=
 =?us-ascii?Q?/Rx61BhwBmFpiaeD6FV79IgF1EIHu4Hsk7Zdn5jgSrkdJfqFixyUO7+gGI7g?=
 =?us-ascii?Q?Yu1oNq5j0ouZIRi0fkHiVQjIQjUGFgzkDJqtjlwzFZk0WKfNAd/9QOY3JPan?=
 =?us-ascii?Q?uxHRzPU1Gpv/luwhiZ9FRdKfKceqIR43V79KanfjHYfsWWZ838dqUU0+gYr3?=
 =?us-ascii?Q?shg6ewBwdNV1+N0jnSjnFOWevGBvymburZJ61qiWDs0ixcpkOHsZCw64mwFA?=
 =?us-ascii?Q?W61cYjPcrMTsbvar4Y1xLRb8yr4k3mr3yH7yazPQqbK0fhXEw2vtUjRH1LTT?=
 =?us-ascii?Q?I0B5aRftSSxKRzus3V1w1hvXpkVUoTaOWGouGBsVAW2DgBnXolPJwcaw0Nbo?=
 =?us-ascii?Q?E/H1pbkKpEKGvZAKIodQHDtCTiHRFVtJDfkCenN2Em0KCPaUO4VAmKCFKp9e?=
 =?us-ascii?Q?+56XW8McFrxqtvjh7AKZWFFS6POuJUBypcSvjtK409d5Futl/I4Af2Aw8hu2?=
 =?us-ascii?Q?wfGsQ5TGvp3xWA0QVQykJSRrinrkCGva04CF1f22VnePwFtbs8xnLC1WSJ9k?=
 =?us-ascii?Q?16wScr7ndagHDU/3vH2qd2HuhJh3IJl/24Hddwc0a5RSlyPuRFh1+B3U9a09?=
 =?us-ascii?Q?sQ4l2icWER1Vapt0OeRsmjxQvULlRn6DFg3P2FMUn9S1hwh50+76SMJRUT/K?=
 =?us-ascii?Q?qOSPXpeUA7ZdFukTfI5fgJGIIND94y2QpoK8V26B3HO7Drqg8kpgm45gsdtt?=
 =?us-ascii?Q?v/w8e6BRjDiUlzp/mKcbUjvZWfbk7dzvU02XD1Cay+X4yB2/BlvGP6wwB36S?=
 =?us-ascii?Q?eta1SNsC2m6qjfJU3/qk8pQX5CJPiBT1E34P5qHcBCRDmDWmy4EH7eCu1m2U?=
 =?us-ascii?Q?suX2BepRs8P/j1BRDESM31vK/rDvi4UI4JYpuTQ8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e493adb3-e45f-406a-dddc-08dd833a37c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 14:13:42.3635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzCqji0ryiVJZSR6yWgKLnty8d5lMfnVpG4TL/Bta/FN/WT+89TmzV8YTryJwQNEyCx3a9gnP++xeOrZD7FtDPmWn6U0eC+BvteN/eot1nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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
From: Lin, Shuicheng <shuicheng.lin@intel.com>=20
Sent: Wednesday, April 23, 2025 8:49 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; dri-devel@lists.freedesktop.=
org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal=
.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <j=
ohn.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matt=
hew <matthew.auld@intel.com>
Subject: RE: [PATCH v21 4/5] drm/xe/xe_vm: Add per VM fault info
>=20
> On Wed, April 23, 2025 1:19 PM Cavitt, Jonathan wrote:
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen faults.  Only pagefaults are saved this way currently, though i=
n the
> > future, all faults should be tracked by the VM for future reporting.
> >=20
> > Additionally, of the pagefaults reported, only failed pagefaults are sa=
ved this
> > way, as successful pagefaults should recover silently and not need to b=
e
> > reported to userspace.
> >=20
> > v2:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> >=20
> > v3:
> > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > - Fix double-locking error (jcavitt)
> > - Assert kmemdump is successful (Shuicheng)
> >=20
> > v4:
> > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > - Store address, address type, and address precision per fault (jcavitt=
)
> > - Store engine class and instance data per fault (Jianxun)
> > - Add and fix kernel docs (Michal W)
> > - Properly handle kzalloc error (Michal W)
> > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > - Store fault level per fault (Micahl M)
> >=20
> > v5:
> > - Store fault and access type instead of address type (Jianxun)
> >=20
> > v6:
> > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> >=20
> > v7:
> > - Fix kernel docs and comments (Michal W)
> >=20
> > v8:
> > - Fix double-locking issue (Jianxun)
> >=20
> > v9:
> > - Do not report faults from reserved engines (Jianxun)
> >=20
> > v10:
> > - Remove engine class and instance (Ivan)
> >=20
> > v11:
> > - Perform kzalloc outside of lock (Auld)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > Cc: Michal Mzorek <michal.mzorek@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 26 ++++++++
> >  drivers/gpu/drm/xe/xe_vm.c           | 88 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h           |  9 +++
> >  drivers/gpu/drm/xe/xe_vm_types.h     | 28 +++++++++
> >  4 files changed, 151 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 93afa54c8780..a84f6247f8a2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -345,6 +345,31 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> > u32 *msg, u32 len)
> >  	return full ? -ENOSPC : 0;
> >  }
> >=20
> > +static void save_pagefault_to_vm(struct xe_device *xe, struct
> > +xe_gt_pagefault *pf) {
> > +	struct xe_vm *vm;
> > +
> > +	/*
> > +	 * Pagefault may be associated to VM that is not in fault mode.
> > +	 * Perform asid_to_vm behavior, except if vm is not in fault
> > +	 * mode, return the VM anyways.
> > +	 */
> > +	down_read(&xe->usm.lock);
> > +	vm =3D xa_load(&xe->usm.asid_to_vm, pf->asid);
> > +	if (vm)
> > +		xe_vm_get(vm);
> > +	else
> > +		vm =3D ERR_PTR(-EINVAL);
> > +	up_read(&xe->usm.lock);
> > +
> > +	if (IS_ERR(vm))
> > +		return;
> > +
> > +	xe_vm_add_fault_entry_pf(vm, pf);
> > +
> > +	xe_vm_put(vm);
> > +}
> > +
> >  #define USM_QUEUE_MAX_RUNTIME_MS	20
> >=20
> >  static void pf_queue_work_func(struct work_struct *w) @@ -364,6 +389,7
> > @@ static void pf_queue_work_func(struct work_struct *w)
> >  		if (unlikely(ret)) {
> >  			print_pagefault(xe, &pf);
> >  			pf.fault_unsuccessful =3D 1;
> > +			save_pagefault_to_vm(xe, &pf);
> >  			drm_dbg(&xe->drm, "Fault response:
> > Unsuccessful %d\n", ret);
> >  		}
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c in=
dex
> > 0c69ef6b5ec5..107e397b4987 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -27,7 +27,9 @@
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt.h"
> >  #include "xe_gt_pagefault.h"
> > +#include "xe_gt_pagefault_types.h"
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pat.h"
> > @@ -778,6 +780,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -
> > EAGAIN;  }
> >=20
> > +static struct xe_hw_engine *
> > +hw_engine_lookup_class_instance(struct xe_vm *vm,
> > +				enum xe_engine_class class,
> > +				u16 instance)
> > +{
> > +	struct xe_device *xe =3D vm->xe;
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id)
> > +		for_each_hw_engine(hwe, gt, id)
> > +			if (hwe->class =3D=3D class && hwe->instance =3D=3D instance)
> > +				return hwe;
> > +	return NULL;
> > +}
>=20
> There is a similar function xe_gt_hw_engine() to lookup to hwe.
> Anyway, I am ok with the function.

This is correct.  The problem is that xe_gt_hw_engine takes a
struct xe_gt *gt, which is not provided by the PF structure.

Though, I suppose this wasn't necessary to explain since you're
already okay with the function.

>=20
> Shuicheng
>=20
> > +
> > +/**
> > + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> > + * @vm: The VM.
> > + * @pf: The pagefault.
> > + *
> > + * This function takes the data from the pagefault @pf and saves it to=
 @vm-
> > >faults.list.
> > + *
> > + * The function exits silently if the list is full, and reports a
> > +warning if the pagefault
> > + * could not be saved to the list.
> > + */
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> > +*pf) {
> > +	struct xe_vm_fault_entry *e =3D NULL;
> > +	struct xe_hw_engine *hwe;
> > +
> > +	/* Do not report faults on reserved engines */
> > +	hwe =3D hw_engine_lookup_class_instance(vm, pf->engine_class, pf-
> > >engine_instance);
> > +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> > +		return;
> > +
> > +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> > +	if (!e) {
> > +		drm_warn(&vm->xe->drm,
> > +			 "Could not allocate memory for fault!\n");
> > +		return;
> > +	}
> > +
> > +	spin_lock(&vm->faults.lock);
> > +
> > +	/*
> > +	 * Limit the number of faults in the fault list to prevent
> > +	 * memory overuse.
> > +	 */
> > +	if (vm->faults.len >=3D MAX_FAULTS_SAVED_PER_VM) {
> > +		kfree(e);
> > +		goto out;
> > +	}
> > +
> > +	e->address =3D pf->page_addr;
> > +	e->address_precision =3D 1;
> > +	e->access_type =3D pf->access_type;
> > +	e->fault_type =3D pf->fault_type;
> > +	e->fault_level =3D pf->fault_level;
> > +
> > +	list_add_tail(&e->list, &vm->faults.list);
> > +	vm->faults.len++;
> > +out:
> > +	spin_unlock(&vm->faults.lock);
> > +}
> > +
> > +static void xe_vm_clear_fault_entries(struct xe_vm *vm) {
> > +	struct xe_vm_fault_entry *e, *tmp;
> > +
> > +	spin_lock(&vm->faults.lock);
> > +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> > +		list_del(&e->list);
> > +		kfree(e);
> > +	}
> > +	vm->faults.len =3D 0;
> > +	spin_unlock(&vm->faults.lock);
> > +}
> > +
> >  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bin=
ds)  {
> >  	int i;
> > @@ -1660,6 +1743,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> >  	init_rwsem(&vm->userptr.notifier_lock);
> >  	spin_lock_init(&vm->userptr.invalidated_lock);
> >=20
> > +	INIT_LIST_HEAD(&vm->faults.list);
> > +	spin_lock_init(&vm->faults.lock);
> > +
> >  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> >=20
> >  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> > 1930,6 +2016,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	}
> >  	up_write(&xe->usm.lock);
> >=20
> > +	xe_vm_clear_fault_entries(vm);
> > +
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h in=
dex
> > 0ef811fc2bde..9bd7e93824da 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -12,6 +12,12 @@
> >  #include "xe_map.h"
> >  #include "xe_vm_types.h"
> >=20
> > +/**
> > + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can
> > store
> > +before future
> > + * faults are discarded to prevent memory overuse  */
> > +#define MAX_FAULTS_SAVED_PER_VM	50
> > +
> >  struct drm_device;
> >  struct drm_printer;
> >  struct drm_file;
> > @@ -22,6 +28,7 @@ struct dma_fence;
> >=20
> >  struct xe_exec_queue;
> >  struct xe_file;
> > +struct xe_gt_pagefault;
> >  struct xe_sync_entry;
> >  struct xe_svm_range;
> >  struct drm_exec;
> > @@ -257,6 +264,8 @@ int xe_vma_userptr_pin_pages(struct
> > xe_userptr_vma *uvma);
> >=20
> >  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> >=20
> > +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_gt_pagefault
> > +*pf);
> > +
> >  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime=
_t
> > *end);
> >=20
> >  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma); diff --=
git
> > a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 1662604c4486..ff67d3c7145d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -19,6 +19,7 @@
> >  #include "xe_range_fence.h"
> >=20
> >  struct xe_bo;
> > +struct xe_pagefault;
> >  struct xe_svm_range;
> >  struct xe_sync_entry;
> >  struct xe_user_fence;
> > @@ -142,6 +143,23 @@ struct xe_userptr_vma {
> >=20
> >  struct xe_device;
> >=20
> > +/**
> > + * struct xe_vm_fault_entry - Elements of vm->faults.list
> > + * @list: link into @xe_vm.faults.list
> > + * @address: address of the fault
> > + * @address_type: type of address access that resulted in fault
>=20
> Should be access_type? And fault_type is missing.
> Also, the sequence is different from the structure definition.

I think this was a fragment from an earlier version of the patch
that never got updated to the most recent revision.  I'll update
these kernel docs shortly.
-Jonathan Cavitt

>=20
> Shuicheng
>=20
> > + * @address_precision: precision of faulted address
> > + * @fault_level: fault level of the fault  */ struct xe_vm_fault_entry
> > +{
> > +	struct list_head list;
> > +	u64 address;
> > +	u32 address_precision;
> > +	u8 access_type;
> > +	u8 fault_type;
> > +	u8 fault_level;
> > +};
> > +
> >  struct xe_vm {
> >  	/** @gpuvm: base GPUVM used to track VMAs */
> >  	struct drm_gpuvm gpuvm;
> > @@ -305,6 +323,16 @@ struct xe_vm {
> >  		bool capture_once;
> >  	} error_capture;
> >=20
> > +	/** @faults: List of all faults associated with this VM */
> > +	struct {
> > +		/** @faults.lock: lock protecting @faults.list */
> > +		spinlock_t lock;
> > +		/** @faults.list: list of xe_vm_fault_entry entries */
> > +		struct list_head list;
> > +		/** @faults.len: length of @faults.list */
> > +		unsigned int len;
> > +	} faults;
> > +
> >  	/**
> >  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
> >  	 * protected by the vm resv.
> > --
> > 2.43.0
>=20
>=20
