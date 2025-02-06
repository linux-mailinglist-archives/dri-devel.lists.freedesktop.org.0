Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D36A29F73
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 04:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A803910E41A;
	Thu,  6 Feb 2025 03:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6v28ri6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AAC10E2D7;
 Thu,  6 Feb 2025 03:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738813661; x=1770349661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wPYl78SJltufBecg13b2ZUOAt8iLX3iRd3jd8bjtRJc=;
 b=R6v28ri6nwAt6JnOhS/7Q8D9Ms7HOP+C+PcQMyPIDgJMOmOW62n6SxV/
 /+6n5TZimenYxVEp2lKANx5/yxcC7Awc5mzhQdOmH64vw0B2l4VsXopc6
 /FFnCuMwc5wtcNiw/qTnV5Ra+HLIOInoWA696jm9w2nvFFafKJ7lcJKF+
 61Jn2Lm1z/eNLdGEpK7n2ws2ALsjK6vaP8YDLq1WVGEmdtsf3x0euhjSg
 ejAz0YBco8skar9sSNhuSTaMlwLw3a2ufr2uRMUA0Nwy9qPT43BZAJsR9
 ItW1BW/QIo3WHnxzpBxvXbI+dv3NMsFRLsmqELUwRzlX/V+wzqOuauPSU A==;
X-CSE-ConnectionGUID: eVXhC1e8SyeY0+HAygysrA==
X-CSE-MsgGUID: GH2/tYbIRtKYoJpe8Gef9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50827928"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50827928"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 19:47:40 -0800
X-CSE-ConnectionGUID: jRehXlMvQQu/yeDURt04dw==
X-CSE-MsgGUID: oY1C6hueRtigQWeMRCPwiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111533178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 19:47:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 19:47:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 19:47:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 19:47:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX1UjcQc2l5VV2sLVlMQzeKu8JO3ONjwW/8Dp9VKcyQN1w58a/R4z5qdgQez8L4mhhmCm6tKd65qRPphmx9dtL0elYy6nV5z3O2CmuVLBDpOings+KRCga33ro/txAWF6kT2j7WbIOhr+/nVMUXgjea+BaLrUL6E75X/5UIxND7i84MnACjHO9pEtBMDAjwBa+VHmFc+zmLsb2FW2hwb3UJkAREsckYy18c7xPOGqDq9reGW57LmDU7LdwEeB0h4fONxmmmBK6gQvLK24H3irIWsw9s9oManzf95HOJRumgDpBuUHaeT2Xq/ZEVTFEUBhPtxgrYjItyHjOhiRKmHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2yKafdWAbZq1IN/ixiO/W5j5lLKhv/UIh3o8e+4TRc=;
 b=xTbjbNa0CnChiTxgF68nF0gtTdcGozhneAZD97JN9qc7Y1zAM+JxFEXsvHZhjS1GYqZWd7PLbIvwxfLvxgnnpzsVqts83ajtKM0XDzzWh3lPATgoynEaiHZv4uzeYaZdjxKw+UEy2r6HzxXTIPBKs5yj/CGjHm744Eu14zJRBCGmtW6+4b87lPYmfhTuwyCN6FhJ4m2NvNnINcvVrA4OCvnj0tJqDxLsnLvnCludTCcE2myRdrKB51TeC98DOPxAbxFmgEfDXaOgHdrKBjFhu4eM3LbgqCeQ8Z7Vk8qf4dyBdScRRrtpN9sIga9GJYkoaQRnPfITDZ7SjvJ3e9WXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 6 Feb
 2025 03:47:37 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 03:47:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 3/7] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Topic: [PATCH 3/7] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Index: AQHbdwNnfVivH8LCnEKxWc22C/E+gLM4ysyAgADZjrA=
Date: Thu, 6 Feb 2025 03:47:37 +0000
Message-ID: <SN7PR11MB6750F6F118A5B1032F2F5D50E3F62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-4-suraj.kandpal@intel.com>
 <IA0PR11MB730700A8D04C43B0F9E5A94DBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730700A8D04C43B0F9E5A94DBAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA0PR11MB4749:EE_
x-ms-office365-filtering-correlation-id: 52186eb9-e55f-41a3-8539-08dd4660ff79
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ST4a/qjJmfSp9jKEPEokF5jltRi+Q0UY7DLN8m2BGwqewo6k8Fwxs4js3qyj?=
 =?us-ascii?Q?oYbV8A+qKDxCnjQ69nhQklR9JSWpefEsEz1I1/xw3NCn89I1WBkYoN5TtV/W?=
 =?us-ascii?Q?SI8CT4IUDesdOSZfJ0sj4So1/tdeq4xQ05LB6ryv0C7c5dGfEiThjDeMygMa?=
 =?us-ascii?Q?xHt4tIQNGMVIKxQuff4XWW8TFxrOfyEw7C56j5vliAm12t7Q7k52oCusSMU/?=
 =?us-ascii?Q?IduofdN423kkdf36aB9iAIMK7L34McSGXJr6uJFuqSgxHIoCpiFjyxn+ObU3?=
 =?us-ascii?Q?yDYN0GNAs5V7DJukQlqKvh8rgN6zUojRdhH6oZAtVmnAQIPd61HPpkhWu0w7?=
 =?us-ascii?Q?hL44AuTTmIvh19oWR/RpcssPwT1T8bW7jf2zVpVMhJZafPwhJoDTMq9RpzKH?=
 =?us-ascii?Q?QTx7wOEVsVoOoatOQLTGEawppTKKVV7yYSfY+DLO+pTfSpwpybfDawCjooub?=
 =?us-ascii?Q?V7z4QNPDSm0wV48ulb3xjaBFr7bfVHg6wlCiuy118aQgLeZ6mS38vaGWkX6y?=
 =?us-ascii?Q?hCjBcVv8yVlhxbRv76wpz6pXH7MHJYWMBvbLk+E1zZXW1AlZzI9hXFqM+qPl?=
 =?us-ascii?Q?AmeGmQtcUiw/PD0cMZIQgUTkQy97i1zqzTDuvv+04HP4Y+L1RG8vHWelis+8?=
 =?us-ascii?Q?0d5EpsQ5EYJq3lBgHPGZenOIoRWxb9gflpSWeObU3sVgie8Vnr9s3rdXilcC?=
 =?us-ascii?Q?02I3BK9nM+eeQGG37h1NrCzXE782cqYISlDhM67jJbOlXqIfmToBcfh7dsCE?=
 =?us-ascii?Q?0AsKZEzuAp/l6GnpSOG5Un1SpzIQcm8BrJL0H9QgM1I2dFnYynQrwX8zUwB2?=
 =?us-ascii?Q?e4qUcITNPiL+k8m13QJrfMx2ZEzMQyfN5mxy12JFzJWy3n8vUMF3EqQqJltp?=
 =?us-ascii?Q?TSwj7+i+ys//Nk4KtBLyzAKI1MPgk4dI0Cu6bLwn6SoogNWHTT6zyCELtwkr?=
 =?us-ascii?Q?76AF/iIN3yWmA8zq6m+/sF0eOJuV6kiXfjRWUNXJgjVDVB9mY1obRqbCOWA6?=
 =?us-ascii?Q?+gzku4jJiEmUUhxnla/w/bcIKtN0YLX5PL5y9x21r0ms6SWpzCb+StNFHzgl?=
 =?us-ascii?Q?o+uLcwYPhEzzKkaR8DiM+z9HUiTUQg2QEjVd4ZJ5deDrmeUJHA2EE1cEYfxR?=
 =?us-ascii?Q?X8SjZCTDo2hl97urU5i/qP6PmjEqOYOk2WUdtgTdzfnaLKBTVGmjMcqTL2pg?=
 =?us-ascii?Q?Wphn3HXVyFjQpCWT/FMlT7JvMqjDQ0Y4S1zMGrZWXvKGI/X1f69dom5N+6hG?=
 =?us-ascii?Q?L5pmQTF10Im0mQuh9f8qvA46MKT1KgfqOox6Citr20heM+NvxIUDDGUGWPqJ?=
 =?us-ascii?Q?Pww1gv6pwYLxugzQwti36CyhEaeB5B2/oLX97+tGRVERPbC8POYECjHE7Ui/?=
 =?us-ascii?Q?SEztq1tz221/Q6olfmTHk4SKqqroEdHd0oxr8MU3kPQUvzqTPNMorp1WanfL?=
 =?us-ascii?Q?sYJ+cZak03XUU2tgk7QqkPIMBp+1enrR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uiAsIMqvw0sAI94YjsFJS1e70Wdpa7gCB22qN/U4oz373i+YeLLxxF7DmeD0?=
 =?us-ascii?Q?ze9uLR57JWpegDtj+/Un/NL+KpLhHk93ds00VC+vr+NkagC4tiCCJ/jVJfMd?=
 =?us-ascii?Q?m8tbDUEq02l0y3mBgRxbgFpkKxc1WztjH2Y034f+f6l717/BKcSYSZ25VMi3?=
 =?us-ascii?Q?JpbRya8XNI1G56a8FB4nbYwP6JA9pmr1++2Z8GDuUB+tpFFlTvC+O67tmrqS?=
 =?us-ascii?Q?+qNwYIolDAF8RFCtW85PrnOQ21y/k/5+XdeNQ5WFGzTg5Js3aBESUbhtxnrX?=
 =?us-ascii?Q?LldmXWoU6H81psql5KEgL24OfKUIJmYPjslUTwYcgKV0md2hRMqZ5nJefCoh?=
 =?us-ascii?Q?uFjkOz5kzNlVqZeUk4MaVg6aFZA18HvG2yg45RHpGT87bMkUdG9vhImeI/hX?=
 =?us-ascii?Q?l7xvYbF4t1xnAVIkeKTTqn4OSGIQSFZ3wzDS7Iljpy7H3vZfubnwJAa5vKqc?=
 =?us-ascii?Q?JaPkUNL9Ykg1GOuOSnUjZyZ26lo+e9qr6RLgHzUSUk6FRWGbYzfC5lIR5sd0?=
 =?us-ascii?Q?Z9X01rwjMD0FqvCenD0Ub7pFDzOuGegFrBzUyV4/6vgQikYpk/dL79RpvHsj?=
 =?us-ascii?Q?OXBjykQEmrioxSsAIecHgPMXpHM4W6J+LnCDfpeYeTpAEd1N4etIgYKRNg/S?=
 =?us-ascii?Q?UXm5rFgvqisomQSAt51xr/CDce2xnIRh7mH8Y9cQj00bKEdHHuaa4+RB6vsC?=
 =?us-ascii?Q?Xz6f1o5GdFE+vYF8ZSFLYJDlA1pQ26LIHk5+31cZk6gTNUlMv+fK0FqyF97q?=
 =?us-ascii?Q?ybeGaIP4QFNiodK9kSAjZTCidQJgXAHArYAzs1HCTNAAhwanCWKHT+6rjhuP?=
 =?us-ascii?Q?P/Zt2V/T5qJT0E5iqOpflf8RlIJUxg2aluODIF5HDq56HFVfkRwDCfcu5VsB?=
 =?us-ascii?Q?fPiqpSc0wAG4x6qiJnVb9cVccTa447FZu3GlqDsmZP7LQmFmTQJwyQ/VOWAF?=
 =?us-ascii?Q?QPjK6CE7dx9kNfBsSuZq9VY41jTiIpt1uGNJin4R5xwro3Pyqo34L5ZOeavk?=
 =?us-ascii?Q?12UvUUqA80mgIGwh783LBKrtyuyewxCvUDSm5/DYzWkTxRDd3b1KJ8RCq4A7?=
 =?us-ascii?Q?qi5dR3juNhPW+MEPAJQzFjXhhlWbNEGAZI5RTkIvKUf2U6trQb2Gn6lmUVip?=
 =?us-ascii?Q?OFmeLU9dZHz8ahZXpbo5jBFglqGNZ/YkwReq13aKbe+sz2vLmXEO/twpxQMD?=
 =?us-ascii?Q?3vmzTP1yFzYROf5C33yoauRMzOruUBsuWHRoA0RwKn52A3gAcvA8bFFFPjbz?=
 =?us-ascii?Q?1OR7I1mNB/5tjDR3BmggUS0X1fNHjx03ity69tMkHgxsD6JZZgoYbenE0jKr?=
 =?us-ascii?Q?kFrh6kQPelUpf1lACGXxshuUbGChRUMRRhLrP/4Qm7AuhOwftsVahpHemSeB?=
 =?us-ascii?Q?F0OC5CTlpdOc0Oi8MZaGG5NAEuZfN+ptHNplUj1fJUeAHqB4siMkFeDzGpjg?=
 =?us-ascii?Q?PNHrcqm5eVlgVZ6PkCZdIqH/+Kt1RwzZkb/q0f08enY54bqJLMLSWwJ11Yjm?=
 =?us-ascii?Q?pATCN1SAVemCbkTwbh7xIk+6QQsEFxiJxhbtNnkYi3spmd6i7MvzwY2lqcIf?=
 =?us-ascii?Q?6S/raraMUCVdrR+YeYq3xs6gJvAcG/5jAN5rpIWo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52186eb9-e55f-41a3-8539-08dd4660ff79
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 03:47:37.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFqb3XaJcyMfwDqpTTs5pt9eI6+uFBkbSu7jtYLJWTkzaCb0nx+yDLx7uZ+aS4fqYR5WAjeS6ivXX8+Mmcd/FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Wednesday, February 5, 2025 8:14 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; Kao, Ben <ben.kao@intel.com>
> Subject: RE: [PATCH 3/7] drm/i915/backlight: Check Luminance based
> brightness control for VESA
>=20
> > Check if we are capable of controlling brightness via luminance which
> > is dependent on PANEL_LUMINANCE_OVERRIDE being set.
> >
> Is PANEL_LUMINANCE_OVERRIDE a macro? I don't see this definition!
>=20

So this is my bad, it isn't a macro it's a bit in EDP GENERAL CAP 2 and the=
 name too here is wrong
It should have been PANEL_LUMINANCE_CONTROL CAPABLE will fix it in the next=
 revision

> > --v2
> > -Prefer using luminance rather than nits [Jani] -Fix commit message
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Tested-by: Ben Kao <ben.kao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index cb51b7936f93..3b64ad724b29 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -412,6 +412,7 @@ struct intel_panel {
> >  		union {
> >  			struct {
> >  				struct drm_edp_backlight_info info;
> > +				bool luminance_control_support;
> >  			} vesa;
> >  			struct {
> >  				bool sdr_uses_aux;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 09e82f24d030..84126e7d1716 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct
> > intel_connector *connector)  {
> >  	struct intel_display *display =3D to_intel_display(connector);
> >  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> > +	struct intel_panel *panel =3D &connector->panel;
> > +
> > +	if ((intel_dp->edp_dpcd[2] &
> > DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
>=20
> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE seems to be for
> EDP_GENERAL_CAP_2 register, addr is 0x703 But the dpcd offset referred ov=
er
> here is dpd[2] which is EDP_BACKLIGHT_ADJUSTMENT_CAP reg, addr 0x702

Yes, you are correct it should have been dpcd[3] will fix it in the next re=
vision.

Regards,
Suraj Kandpal
>=20
> > +		drm_dbg_kms(display->drm,
> > +			    "[CONNECTOR:%d:%s] AUX Luminance Based
> > Backlight Control Supported!\n",
> > +			    connector->base.base.id, connector->base.name);
> > +		panel->backlight.edp.vesa.luminance_control_support =3D true;
> > +		return true;
> > +	}
> >
> >  	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
> >  		drm_dbg_kms(display->drm,
> > --
> > 2.34.1
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
