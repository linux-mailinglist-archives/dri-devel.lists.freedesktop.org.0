Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E010931F6F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 05:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D748710E2B3;
	Tue, 16 Jul 2024 03:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbI332qB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB3210E22D;
 Tue, 16 Jul 2024 03:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721101385; x=1752637385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WiT8cDNJJqMjKZVXnmweBQewbIZr8V7ITMx/djD7VQ0=;
 b=hbI332qBIJd+fP+xzxcU7D66syJS1ufxuev8QsDSuMVMRfH8VtgzukBK
 ykN41I3srrKmL0OJxi/AYNzQtm4znvMUVUgxMmAIl22rM6275qG1JPaL3
 uO4Ursp1QbRBq5sXPcoXxWtB14UTdCiyieZIYOl66qx6eaSOKhIkfewjW
 OzhaFH1osUPCEK6bGDPzcDz5FzTVFxqrdgETDeeMQU5ObGgGOi87bvKzY
 ZN4JKQetUTisRjl/YUS2WNXzpJqsFalxAO43/488sV0JwKGL3eq1dx48p
 qgDZ8Yq61PRcX37dtBP4943i2wJX4QGxHbxWkHoOxQpWWeNRMcps+nrxg g==;
X-CSE-ConnectionGUID: NLVvo6wBToSHfcXXcIsPAA==
X-CSE-MsgGUID: 0IHWweOdSqOkLna+bcV2SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29121514"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29121514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 20:43:04 -0700
X-CSE-ConnectionGUID: r8sjHpreSYGkhsFk5f8jTQ==
X-CSE-MsgGUID: UTeICMKVSLijiwEXHlthxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54771766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 20:43:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 20:43:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 20:43:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 20:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9yEgyL8tzfwGTyKk/yUoK1DsM6EqepStRR14OTxuWLhCvbvOI6BX1l9TGh4gUOteXEoYRStqkeGNPEixkebZ+A4vGHjYLstf1LOrnF/ujG3fVZlcG551h12tcWEe/p5FemC5iRypdXzjVCoFthqEH2hbdF/okGM06Fqp9E3QCQ8cJ9lWFJzgQeHx0T0lR6+z4twlO216d7SlJ3pbLMrFoYFdLsDUdNtKWj7iRtWrRzE8XQMsedXS+cqOrEHM9zrpQ5NJzo4okz3bDWNlezg8JbTFxTXRdc2RE6x42OpgQW1PTliRj01SnQv2DYVrhfdoPWEiNVmgz/vTX5ztPAH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgxePO+otvljwzk/eUHG3Mi3Om3hEh9Q9TmQvJX0S+c=;
 b=XUTg3CJssYj5M7TotltF/3Uf/qggFK3pxFAkLU0YqqYUzdqfdFuF2IrEmBXWrbkKQ3ixPlwtaJhNl/smh3Ra9mtlweZpv8fEolqjs2AD3/agoD+gSvNWLVylPYzBVxrfVFJGfQhYAqNIDnFtGhkiTSu8Pqam9MOqBIJIS+be5Kvguae0Tx1aQb49yr0JUZd5+JKbSDQrSY//96/VvlHk/Djj1Kx/AZb+vscXQlZ4vJLimTJUUT3tNjS1rcBcw0RXo/DfBARs3N+fBnqHORbcvBGwhLIIgSU5oGA3Em208w7cj9HHXb7B6CvJXwpmB7LpqGT6eIP20m9VnhrzAux60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:43:01 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%6]) with mapi id 15.20.7762.025; Tue, 16 Jul 2024
 03:43:01 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>, "janusz.krzysztofik@linux.intel.com"
 <janusz.krzysztofik@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Topic: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Index: AQHa062t9b0WHNH5wkOFQB2dDekqobHxt3qAgAAcC4CAATujYIAFUiwAgABZDNA=
Date: Tue, 16 Jul 2024 03:43:01 +0000
Message-ID: <SJ0PR11MB58670880B554A7E041F3AD75D0A22@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
 <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZpAfyzKlqlMrd4nj@intel.com>
 <SJ0PR11MB586743B1AF7DABD0F131E906D0A62@SJ0PR11MB5867.namprd11.prod.outlook.com>
 <ZpWfPjVificBZgBD@ashyti-mobl2.lan>
In-Reply-To: <ZpWfPjVificBZgBD@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: e83222b1-3cf2-4f94-1f73-08dca5496433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?y1NKjDU46EHvp/M7cRNZwPH2KvaTUN+5exPEC9s6sHh8Fb5+ZvNdmdoS0P6Q?=
 =?us-ascii?Q?DfQdffHmepyojOw4r5Iy3eVa7Kn9hdiw52hcgDvD27L1dcD2vEqEFBByuOHz?=
 =?us-ascii?Q?JnaNPDWlIp6oNNKQkdBWtsdsH1P3ILG8+87jQRgxmq3/YBNoUj+OKane5qK0?=
 =?us-ascii?Q?bbPO3Q3/sUjaxeq/SrUoLHFtaZ54j1hzJh95XEonCZymr+S+3BSPeG0OAoWp?=
 =?us-ascii?Q?VEwDKgTRcbgbz7qsWobmssvDQsl0ZHNN9yDp1XEoP3rNzmfjUoIs5MGYKtAM?=
 =?us-ascii?Q?FnS5oT3A/VDZzS/Gue0OsWJFehrSIDCr+FH1EdMG+9JXsc76vNgR7gE3h1Wh?=
 =?us-ascii?Q?Bhkl18D6hnyZ5Z6ae7AOCRAYPNXmUZ0sJnnVcNiDLJQBS7JOn6TB9kMHTPLK?=
 =?us-ascii?Q?64Vx9DNJgmPr0JUY1RrOddgB0cX8eHm2ywuTSfMNGdl9eIanpPE93Z6a84sh?=
 =?us-ascii?Q?CJN2/Yvcnw0FMAXONbHCS92rGn6CuCgAeeAJm1GFAJLugwvL3ippwx1NqP4d?=
 =?us-ascii?Q?d7pRFHUnLrGQWU9DoM1Vwjmu0Cnp5mhmEPmZ58vdGNIouBRdB3i16LeMVeN0?=
 =?us-ascii?Q?8IABoCl+GMreBgmz+XbqHzKJ5YOOBRdpxpd9Y1X/96NgpO4Xklbe7OLfoBn2?=
 =?us-ascii?Q?YM6ETS4M7x4hUJvVPUJTaK87RG7hUtLTJDZRr865g9/ZS0+LAdtDCLGM7V5p?=
 =?us-ascii?Q?DGBO09E16ltJ6oJ/0/YsySbNZuwB3ryrs/ztJGUOZ9nNzVvMXl2EnW21Dcwn?=
 =?us-ascii?Q?RwBup6wzRlhJ0UIm/0TsdRhRhIUx8x2yneR4Krzwj64XaGXyPrgAIyrQedgx?=
 =?us-ascii?Q?1Nt3nZNODrM3jLLZ+RbSVrTwLovg5NTx478mwHyN1c/Fj7gmrxtBJvJKkxqU?=
 =?us-ascii?Q?FeHSla/EFO4oV9gEmAtzIAhrPCAURfGg+EXEMFhDERICETjDngJHYFWYNNO0?=
 =?us-ascii?Q?YPnekm6k6HdQblUAHY+KWR2TnDNNWpiV8k62ScY1+OAycbEHhoKVN6qMA8nH?=
 =?us-ascii?Q?00z5UJFxuf8l4n6faVS/SMWygdsQdz94zP0d+oxr9zctJ69fz4UEUw6aEfcd?=
 =?us-ascii?Q?6jwHQt0cfPZhoZKdBqYyLyid2LUZotFEcG+JyFQ0n4WQ+yQ5cMwWHG1XX1+I?=
 =?us-ascii?Q?mvwIbWuCj6mQK2b9cu2JPajIm3dv+6yFIjKTZ2HfATEg7ivilxSS/fOKyeZL?=
 =?us-ascii?Q?OP9iPKdKH+oMu7hNZjItjfI8c5VLKwm0dkYfL2+pa4l+HV0Czx1cpRopcpFN?=
 =?us-ascii?Q?iHTAVaMXWu1b32d5nqjeIcx8tETbBjnKDiCptholOkDcxafFx6lWD9CT8MOY?=
 =?us-ascii?Q?N/ZrT9j9lelPLJy1vGMUFmvOju/BYqXj14i+L7/Zq5rHsmg4M8/9eC455olb?=
 =?us-ascii?Q?jgtTFifw8r1wfe+u90uWz1OtYP6EJqvQMsjtVIv+LccUGO8J0A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hf+kGEcacpIEiIlRpynot585TMrqWmEpdrliydKROsQTJ6mBFpkm3L8zzucD?=
 =?us-ascii?Q?EEQoTE9GObEaIgIh6Rg3WLKun2l3zBMtLLhoAHBxEWp62dIk7uhsBzOH5wEr?=
 =?us-ascii?Q?rFK2NLsffILhz8evSClDCVgR6Ttp7OmY60L4P/a1BnNqyJrGEiz+eQ1GBy6A?=
 =?us-ascii?Q?xXFUwq88okKdu09RYNEehCGBuoYg81JuPeSltckevNWgULMJ0VgwXHNseiJq?=
 =?us-ascii?Q?mIiHQqTCc/cQJhYNbPKEp9Pbamzkg+e7wwVuGlkFpF7v8RsTvyfOG3L7Qunw?=
 =?us-ascii?Q?gWjBfvgC/9tvmTb6iT33LQnERoMYJJX9wE/XAY+9nODZTRwAFjdg34z3Jg69?=
 =?us-ascii?Q?d1wiZhSh1tVy3m8dvJUF71W9zb1giOvtbgdl4fsC4IjQbCSGpwTmkvOssj4F?=
 =?us-ascii?Q?Yc9Ga4G/yAhZGo03bgWeW5vUyYXhnZJ3b7uoqabu1pU2KzY+yHL8EV0SMZdG?=
 =?us-ascii?Q?vG61HypJD3/ShoY1smUAvrV6CyM1UJPjTFMGuTyzP/XXhnOqLe2NaqnMazZt?=
 =?us-ascii?Q?FzThzs5aJyD2B3SJn5kDmm3nPmYxoDEzfjWQjqhX6kCQ1D1dRJe57uS5snBQ?=
 =?us-ascii?Q?W2sq4zyvQWhDS4e3vZKN0bwSceGcpuRP3UAkgDBQRWncQpr1+ZxG53GfQXuZ?=
 =?us-ascii?Q?YxjkUdvGug9FxY/kSnpezj5aSweiH/ovSCF0A1WWem1HCYjpy9ftesnfT9E1?=
 =?us-ascii?Q?+hY4eGXfGZmpdRGsnBoQelW7Arw3h+IgH0cA7giX38MwWAnF/Iib3F2XOY5Q?=
 =?us-ascii?Q?GlrvKSs1PWP4dM33ZkTo2EqoMcuRRt+ehKLOluOVJYdBsHfyg8Yhx/uzRXrR?=
 =?us-ascii?Q?qqM7pg7gi17rxyPUge7K87UtY6j5PjgHhFmylyA201umBdNM/IwK/NNHTdCf?=
 =?us-ascii?Q?16ufZfBISVOZvkfqcPGbRNSOIVW2uVPYwK7Lw9gdIRZLt+kcofoVlPCANlH8?=
 =?us-ascii?Q?O4Q6knOw6KpL+zavwHdG4rU2c8IJu3V9P9YmZ56Z1IBKEoJBh2ZgdC1uPUNo?=
 =?us-ascii?Q?DxqG3+6sClCw8mxkQ6FQQGhuZNmz7gmLBpKnfbnpEmChftjMxGbz4ERkqgKq?=
 =?us-ascii?Q?Gece46YcHaayxxvLjK+e9Zitw/Tv3K2rIT2UiRCJkUz/IoNMjbUQmz1Cv6VF?=
 =?us-ascii?Q?+pZTSLNK8rpSqZdLA7WFULAe5zTuHIdh77GCLFJC+B9vCdrHY0zmYUv3XPnv?=
 =?us-ascii?Q?vRtqNhe3C62XCpPE/wbMKqWNKWPB9AbDF269bEB8cY/xaa712PkYTJT+tBOD?=
 =?us-ascii?Q?2o5QX8wcUQpITeN4ivpcPvvrKGX22Qsu0TuyWAnlu0Tmt8GutmrwFDlr05Re?=
 =?us-ascii?Q?SkD21iRjRKK/LUP/7B9UD3GdEhoygS2B8Y790X1HM5xtstAdEsXBTUAmflA8?=
 =?us-ascii?Q?C4AC+Fec/r8aibLTBfu06H/5HShBsL6UkJYB9coubcgrwRivcLEee/U1ofoU?=
 =?us-ascii?Q?KYjUIl6aqN0+IBn318UKf/MpMOdyx6l+nuw7148HrjHtT0ooHcD20a+zDCrR?=
 =?us-ascii?Q?XL75DQKM2RiK+Xq1Csd73LXkk86YxY26nfAC47EX0/CY23r3j+/n4taezGc8?=
 =?us-ascii?Q?aFKpLDItXQYmwq+/iMMgQJ4VSTj8WhFsUoQ+TBbd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83222b1-3cf2-4f94-1f73-08dca5496433
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 03:43:01.1813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chFOKrOVz4B5ypzAZCbeps03Agfvm4nTtTdqaPf8RC0V+7HCiCBieVy7Er49ncbDECwRo47ZdPl2mjSYY6UBIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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

Hi,

> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Tuesday, July 16, 2024 3:44 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>; Wilson, Chris P <chris.p.wilson@intel.com>;
> tursulin@ursulin.net; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; Das, Nirmoy <nirmoy.das@intel.com>;
> janusz.krzysztofik@linux.intel.com; Chris Wilson
> <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption during
> execlists_dequeue for gen8
>=20
> Hi,
>=20
> On Fri, Jul 12, 2024 at 03:25:23PM +0200, Gote, Nitin R wrote:
> > > -----Original Message-----
> > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Sent: Thursday, July 11, 2024 11:39 PM
> > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Wilson, Chris P
> > > <chris.p.wilson@intel.com>; tursulin@ursulin.net; intel-
> > > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Shyti,
> > > Andi <andi.shyti@intel.com>; Das, Nirmoy <nirmoy.das@intel.com>;
> > > janusz.krzysztofik@linux.intel.com; Chris Wilson
> > > <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> > > Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption
> > > during execlists_dequeue for gen8
> > >
> > > On Thu, Jul 11, 2024 at 04:28:53PM +0000, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On
> > > > Behalf Of Nitin Gote
> > > > Sent: Thursday, July 11, 2024 9:32 AM
> > > > To: Wilson, Chris P <chris.p.wilson@intel.com>;
> > > > tursulin@ursulin.net; intel-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org; Shyti, Andi
> > > > <andi.shyti@intel.com>; Das, Nirmoy <nirmoy.das@intel.com>;
> > > > janusz.krzysztofik@linux.intel.com; Gote, Nitin R
> > > > <nitin.r.gote@intel.com>; Chris Wilson
> > > > <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> > > > Subject: [PATCH v3] drm/i915/gt: Do not consider preemption during
> > > > execlists_dequeue for gen8
> > > > >
> > > > > We're seeing a GPU HANG issue on a CHV platform, which was
> > > > > caused by
> > > > > bac24f59f454 ("drm/i915/execlists: Enable coarse preemption
> > > > > boundaries
> > > for gen8").
> > > > >
> > > > > Gen8 platform has only timeslice and doesn't support a
> > > > > preemption mechanism as engines do not have a preemption timer
> > > > > and doesn't send an irq if the preemption timeout expires.
> > > >
> > > > That seems to mean the original can_preempt function was
> > > > inaccurately built, so fixing it here makes the most sense to me,
> > > > especially if it's causing
> > > problems.
> > > >
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan
> > > > Cavitt
> > > >
> > > > > So, add a fix to not consider preemption during dequeuing for
> > > > > gen8 platforms.
> > > > >
> > > > > v2: Simplify can_preempt() function (Tvrtko Ursulin)
> > > > >
> > > > > v3:
> > > > >  - Inside need_preempt(), condition of can_preempt() is not requi=
red
> > > > >    as simplified can_preempt() is enough. (Chris Wilson)
> > > > >
> > > > > Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse
> > > > > preemption boundaries for gen8")
> > >
> > > Something strange in here...
> > >
> > > This patch is not using directly or indirectly
> > > (I915_ENGINE_HAS_PREEMPTION) the can_preempt()...
> > >
> >
> > Thank you Rodrigo for the review comment. Seems like you are right.
> > Fixes: bac24f59f454 is misleading as it's not using can_preempt().
> > The bug could be from the commit bac24f59f454 as mentioned in the
> > issue But this change fixes the original implementation of can_preempt(=
)  in
> below commit.
> > Fixes: 751f82b353a6 ("drm/i915/gt: Only disable preemption on gen8
> render engines").
> >
> > I will update the Fixes in the commit description and will send in v4.
>=20
> Can I reword the commit log to something similar:
>=20
>     drm/i915/gt: Do not consider preemption during execlists_dequeue for
> gen8
>=20
>     We're seeing a GPU hang issue on a CHV platform, which was caused by
> commit
>     bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundarie=
s
> for
>     Gen8").
>=20
>     The Gen8 platform only supports timeslicing and doesn't have a
> preemption
>     mechanism, as its engines do not have a preemption timer.
>=20
>     Commit 751f82b353a6 ("drm/i915/gt: Only disable preemption on Gen8
> render
>     engines") addressed this issue only for render engines. This patch ex=
tends
>     that fix by ensuring that preemption is not considered for all engine=
s on
>     Gen8 platforms.
>=20
>     v4:
>      - Use the correct Fixes tag (Rodrigo Vivi)
>      - Reworded commit log (Andi Shyti)
>=20
>     v3:
>      - Inside need_preempt(), condition of can_preempt() is not required
>        as simplified can_preempt() is enough. (Chris Wilson)
>=20
>     v2: Simplify can_preempt() function (Tvrtko Ursulin)
>=20
> Andi

Sure. You can.

Thank you
- Nitin=20
