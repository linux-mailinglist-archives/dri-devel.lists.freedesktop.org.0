Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A3AE1284
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 06:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907510EAB1;
	Fri, 20 Jun 2025 04:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qir5008v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381D710EAA9;
 Fri, 20 Jun 2025 04:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750394109; x=1781930109;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0DpF0PVk+H8+kCVYdsD6/4sqDi9qO3FCZzlyvqSUO+Q=;
 b=Qir5008vKlWuNyV8Bn0i5npK/hAR0At3hIIPB/QTzLdS9yH4FF51kcCW
 hzQ/p4cjNUU9AsqyvX/VY+1ouL4muoJL9d1DWDKwPRsgmVKErX1huk4Yu
 QiMNY7FPyAPZlELrtwjXOzsalXp17RRaC7IVimpFWLyRp+gg0QRk4iASu
 1+CWnEI50s7aAqjoMtIvNNvaAA9sh/M3ye/e7+IVRzJSAX39J/1tpkDzv
 b63tqdbD/EpCEKpbvhm2TDh0VV9wudgzxQqgROZSvHSF91iam3BJ5nigI
 OFKRbcoNjED4oRYP/j8NBrbInlRZ/r7e9axKVIQse1arBpmoIchZJUQnW Q==;
X-CSE-ConnectionGUID: wzFRioIwQfmkp6maHdAmqQ==
X-CSE-MsgGUID: DcIX5q4yRS2XtKcEitrkbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70213814"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="70213814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:35:08 -0700
X-CSE-ConnectionGUID: CyrO2S2zRTujvNI9q7vPDg==
X-CSE-MsgGUID: u3515HWzSGGB6ctnhNtRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="156614511"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 21:35:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:35:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 21:35:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 21:35:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDdr7xJEhJWn2s0rqjSBUF4H9LmPQ3N9cRkcRt5UX8k5Hv+mbHQNhRUzyyhBtROa9u9xr+/nCQLWO8TJ+KDpEXK14nAarpYsSdsPqYBuBf++DbusUph9Nf6X6CvnTn4Gg8t5SbtslPFMctEmSvNDzccz7yhNi5zlFUpVQVsP7lQehcXaa+nX/uDu7qKMf4wy8AZHSVPMmAfVCiz5YCctL2PRYkgigsVLktBT77kMtDubHT6fdNAHi6avbH6MkycBrm65QTSl+EGc7EP98Rl+EyYloSFUT8NICPM/jOZL5Lu39tuVJQ5nN1J4r21QMN+41OVpqV99mexN993ER1OwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF/JlrUHdIVT/l4WbMF7AOL0woEah2f9jdUtlShXVBo=;
 b=tD43B8x8++60IgDoAON2HU7lfSRIAXkzoiAJE8UHyxjJwrl9OWCfc6+ECfojtfvv/tVELuHoy5ebkspL/bPzdDgG+rrWycjyzAVwaWAJfyknuLW3qcDYyjh1y2YUjR2FBiYpLSL0kmN74RY8MCmJh2BeVN3q9dIh/z+FbHoInMykgBjCm1f84eWfNrqL55ukxao0bRrcBWlzA+/XM/k8Ep5oy4TYpA6a49hLaDJtOxZgWAa4T/fTBJftyc9jRWRPnPgLcAHHI5NxlN9zrBnYdKF+y7JK9YhW+utp5FoldLISVJtM5/mTI2AO2AOO7atyU6NsLs6Pl0ZbmyFrxlBr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 04:34:52 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 04:34:52 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Thread-Topic: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
Thread-Index: AQHbrPQmRKmQHX7Gr0u6GHgxFvhsurQKWpug
Date: Fri, 20 Jun 2025 04:34:52 +0000
Message-ID: <IA0PR11MB73079045693A35DF5D484822BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-7-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-7-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW3PR11MB4571:EE_
x-ms-office365-filtering-correlation-id: 3fb4dc4c-0408-4d9f-1655-08ddafb3ccb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?u/VneFcMyKzXzVk8GzPy6iliffdIlWVakwY+C2SHtYlD6MkkUX/9dfE1Pidj?=
 =?us-ascii?Q?Mc3pyexoiylgyjbJCFqHMJdQaNqUhLhDKovUVSY8VgjCgV5kpcvmh1K9O2B7?=
 =?us-ascii?Q?HNTCDufUJig6KRmrhvTgbOJivEfrHr0l388v1DpnLF6Auw3nRnbM2yLzYeta?=
 =?us-ascii?Q?x7JJnl7gcL8sAXzFjPylIpA+pVwwso7qbwPghiYqDhknSKR0APoU/w1Y35R5?=
 =?us-ascii?Q?WhX35RvJIJWKjPqGqOYTPaOUq+XF8iX2OrEm0aqJWhJtrymNbL0FtpsrVAuB?=
 =?us-ascii?Q?D4VNkFGHMLUOBKqD1Itt1Otj37OS8vSnTXAGJ5ldmvynhE04rgzyIgMPGoK6?=
 =?us-ascii?Q?6vAjcNoPgURdWo+qeOi/qaEZ3B/atG63rppnBvrKCU5gyCC8iPvYhjoUy75P?=
 =?us-ascii?Q?el6EZSlf9Ltj091wFg4L5FrhDXp8rhZDeM4xU4kM7MQOJrHpa9v8lb27BXtE?=
 =?us-ascii?Q?PGzp8RJm3K6XevGuXss/ZyluhU9q78unMgDEmNyn1phcCJyTKZs3RNnbQG9h?=
 =?us-ascii?Q?qH/vCRmRiPU9mNWKZqUWTxXk666fUo6J43vde8Kbradlo4vgb9fKVoCCUsYW?=
 =?us-ascii?Q?1Lt6X0ncRtJ9vd0w4TquLt8RyV6hEuiqvzpTW6wiNkj18A/J5ej2E5ErvuwZ?=
 =?us-ascii?Q?hIZB493weNDRJQtF8rhbFvTJ+yFnTgwi4L5O66bx5YDKe6OtTsUU7K5AeZll?=
 =?us-ascii?Q?hfqjqBtr9xnBF593CRVB4Z4oXpv2hYIeMsWrFzIRRxSluUieKuNN9HNBCrRt?=
 =?us-ascii?Q?d47JS2q/zoFrPnGm0kHp9msm7ml2hyTToPMLFK2oWPwSeTj9LRF7kTW9BtqR?=
 =?us-ascii?Q?hdpnRs2m/lgq9kqoEw6t13GmYuHMULdzMdXneANwsT9LbeCduC8ULzgqEN18?=
 =?us-ascii?Q?7Je0fWZMvQ+2zpkLIEWLGsuW/KTwgFwPtitUa/PLu0CNVy4QM/9+jpdjrhq0?=
 =?us-ascii?Q?K6NcLLfiKI+VfoxVqf4w9PHiqwFldAvdaJsVydKUWGRIXQ4CKA0o1r3Q4hF3?=
 =?us-ascii?Q?iYhLdN2RoBZAlM9lo5uQM1LWXznDmtiaTjq7UyIAX+xnMNi7TDIoewlyeGFN?=
 =?us-ascii?Q?eBa+ess3YCiZg0p8u2sTtR7+/jS0NFGuqBurhoIeNY6osCpUP05JVWRlOsPC?=
 =?us-ascii?Q?UQuBbHOozK+vCXRHndEG6R+myzGOlSl6ZcIaa+7gtmdMpb4YR5F/ycXlZyta?=
 =?us-ascii?Q?+hkAlbSlfVWYo0uJpDWZLtml+rCpoKaaojOE2ikj/qgmvHsM6JCZSKj0NBQn?=
 =?us-ascii?Q?t7wegw9dtdMZkMVEwPNSCI0tmHek9CiBj+x0V3ejBh4fTB6oIOWCXN9FqIoL?=
 =?us-ascii?Q?CEneS02haiWt4Qqp/zOL4sxAfMm+9MQS/gV1cYa8U+wG/GwwoUu+IJkTToRH?=
 =?us-ascii?Q?vgPKkOd+6sLYQeVyln4nJ13W474MIKUmJ+eC0cq/oP7uc0SEFe/NdT3XtNXN?=
 =?us-ascii?Q?H2SopNZphgD50zBjHv2LGC7qoO25UaQ6HIN/zKSFJKHmTFeiuj1+cA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NlThRHQo/yuivB6ATSyaAMp1iLNY4EOlg7WTx57xSlFCWkY+3k4RHf0eHob4?=
 =?us-ascii?Q?eLgpLE/zSizXp5KShf7xBWmeAZXD/M8Nr+I9hmsoc4JnMe2u7YNljMvEwluO?=
 =?us-ascii?Q?+rdu41VzkYV3zIReP5fv0S0w4ipHD5Jr9O7ulnWgfC243zW2pqyKg9Cbm5jn?=
 =?us-ascii?Q?1QziZDF+KZcIwPdf/l/8+ENe7pqX8oiRtD964IVNeaLIiC8gL7PCcez0v5Mc?=
 =?us-ascii?Q?thWhty4+7W6prw5n82rXYOwQop2GN2ok+CICJ3rIIW9ZrvVFik6JSxFaWQ34?=
 =?us-ascii?Q?fdU7defSesLGpITax1JQ7dhnn7mcvLRvz/lfiCy7vgFmUCHL88TR7mBq5VBl?=
 =?us-ascii?Q?7rInC3w9Zwne+7vdy5AEiF1EijSiwQHi1tkPStr9H1VhpIZhEPcjsGSwHE4V?=
 =?us-ascii?Q?Z8uRCtATX6JPTyvCKODnpq+46kuhSEjU4QksH5Q0zvJhP8pwu2cSowL4fLpb?=
 =?us-ascii?Q?neyMz0RQ+rT4oyWF3Z1VyU3p7WzzVqe0V8JVED4YPrR2EjOv/yX8K7lVYukv?=
 =?us-ascii?Q?wkhO9X0JrF5tTYqBaGIjHIpNkYXFa/yJ2dWz66RITsOzHbQsCTGga0UQmZif?=
 =?us-ascii?Q?rt9VGtat6ILvdBc9uosHZR9KhCuEwTJKSrgfMZdS/YJCX6zozVlXJmqt7z06?=
 =?us-ascii?Q?NROlXBgOgy1bt3Fol5/EhAyEyWx4dRud3jRxPPpTlY0gSk9wFQZQbqtCKyEZ?=
 =?us-ascii?Q?j74F6MWLyYKrGcxKVUM+cb4R39x6HvSf5v4TAJsLae4nPGFgEAQ0nXNbfquu?=
 =?us-ascii?Q?ZkxQHPmToyySUo+8F6w07nZ2MISSwliXU9F4zs0H1Z/soceB+NB51FoDXjCF?=
 =?us-ascii?Q?OCUMCZLNDCKHjoO1S+c8iZG4YbPzK/E2MhOIhK5xRodaFuAqgKjW4y1NN+Oo?=
 =?us-ascii?Q?MMxuR4Hqdo4RrBUUSMHaLbjDjQeBiBmOrtc2MKG/SVBJo4YTZmQlV0DRy2wg?=
 =?us-ascii?Q?cBhAQptOHCEJDQVrTlht5xaYBbo46E/JQmOtDBVcqgc/EF9vBK7c3HpzGtbx?=
 =?us-ascii?Q?/0zgKipUXoB73I2kV9upL2Ja+CO57Q/tb/55O2Rz9O2VnjB1R81F/GH/421s?=
 =?us-ascii?Q?U5OHNNTo/LfKxq1LhJuP4VdudxIIFPlI8H6g25wPMwZXqlqVsiHAZiNdiaCo?=
 =?us-ascii?Q?/Rzx0sNimx3gS86C1tJTnpsc1mQ4uk3o6Ww1yxoSOTNv/ODxuAuW0rVUxL2u?=
 =?us-ascii?Q?bR1p2H1x/1KSrnXCl9wxg3Og5OYk98vyxovoOksag7XqECqCW8rtevcgnXx1?=
 =?us-ascii?Q?8KZ73Nls0fLdr9cQ4mUWqa8xD+YDVEz1GznGnAjFxuKSDWI+lb0OR25W79G0?=
 =?us-ascii?Q?QCiEKq9GP6SvB6kIEzGN/r0x4YfO+HNEnALtylnSpU7oLAVDcxr+LM4vZ8KY?=
 =?us-ascii?Q?Ie4e/lf0VQTv+/3eG8TcRXCKBN+W5TArj8UTuAYqUHxglXFR7rFqY3T2kVPh?=
 =?us-ascii?Q?qVPd0PvTFCnDtG5+YCneUbNB+c7vdy87SPSF5QCTtf7VZ2s4o/mQj+Op5p3I?=
 =?us-ascii?Q?zuDzEZ/2qxKkWgBiFajvKfLN1ajmq7L1Je20gdJT7dPuWchqvxUVqwuJAtUf?=
 =?us-ascii?Q?l8w7XaQctJCgnsyGdGZEHyq0nwbbKSdOWMcVg4tUP/bym9AS3rKECGv9dPP8?=
 =?us-ascii?Q?ovIYQfCxl+7JKVaVUEI7RfgR7UAvfLDWBkZbh1TxVvlp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb4dc4c-0408-4d9f-1655-08ddafb3ccb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 04:34:52.4541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yYAsS1AvCfNZ0s0Gg9Yj8t23YFcoKS04toLCpGy0Se9shxmecldGhSkRBPHi81J4xZiw0Lj1sx9qkF+iapAy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 06/13] drm/dp: Modify drm_edp_probe_state
>=20
> Modify drm_edp_probe_state to read current level from
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE. We divide it by
> 1000 since the value in this register is in millinits.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 35 ++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index c58973d8c5f0..bb1242a1bf6b 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4185,7 +4185,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i
>  			      u8 *current_mode)
>  {
>  	int ret;
> -	u8 buf[2];
> +	u8 buf[3];
>  	u8 mode_reg;
>=20
>  	ret =3D drm_dp_dpcd_read_byte(aux,
> DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_reg); @@ -4202,17
> +4202,32 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct
> drm_edp_backlight_i
>  	if (*current_mode =3D=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
>  		int size =3D 1 + bl->lsb_reg_used;
>=20
> -		ret =3D drm_dp_dpcd_read_data(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size);
> -		if (ret < 0) {
> -			drm_dbg_kms(aux->drm_dev, "%s: Failed to read
> backlight level: %d\n",
> -				    aux->name, ret);
> -			return ret;
> +		if (bl->luminance_set) {
> +			ret =3D drm_dp_dpcd_read_data(aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
> +						    buf, sizeof(buf));
> +			if (ret < 0) {
> +				drm_dbg_kms(aux->drm_dev,
> +					    "%s: Failed to read backlight level:
> %d\n",
> +					    aux->name, ret);
> +				return ret;
>  		}
>=20
> -		if (bl->lsb_reg_used)
> -			return (buf[0] << 8) | buf[1];
> -		else
> -			return buf[0];
> +		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
Can a comment be added here on the unit?

Upon adding the above comment
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
> +		} else {
> +			ret =3D drm_dp_dpcd_read_data(aux,
> DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
> +						    buf, size);
> +			if (ret < 0) {
> +				drm_dbg_kms(aux->drm_dev,
> +					    "%s: Failed to read backlight level:
> %d\n",
> +					    aux->name, ret);
> +				return ret;
> +			}
> +
> +			if (bl->lsb_reg_used)
> +				return (buf[0] << 8) | buf[1];
> +			else
> +				return buf[0];
> +		}
>  	}
>=20
>  	/*
> --
> 2.34.1

