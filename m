Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8BAE4BAA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 19:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB2B10E443;
	Mon, 23 Jun 2025 17:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbyKRcvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F35A10E43A;
 Mon, 23 Jun 2025 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750699033; x=1782235033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5f+m7z2QGKzljSQDwr0tYDKXIu6JgQgrqdHKMg1IyeM=;
 b=FbyKRcvUwk0VaNa/BAL1QJmXD8cPyuyQ7V4j9ZDRjLMgC/dHMUkZjA8Z
 V1N2KXRwlfjNndmNbGMtApvuuQ3nxdSxHJO7i2QxW0C4InE8Sj+mhCG94
 xE3vXw2UTF9N17d5Bl9bylWwp+qs8jYNJD1vb89qhkbiAAqeMym2c3xp8
 F9hfvH8gMdrz3zRc2O1Jmn3LEg2FC8w0XCPnfIt5nJQ5vjrAPfjd3bl9G
 2khrRghAf2L95J/kzKDPXJPZRZm5sXOK8G6Id6b78bNQiW+6wJ7ReuGrn
 hsBhPKjfawcAJakf/7fjYqDJLrfjo5+muw17ysq2loSuUbdRfWxL8krLu g==;
X-CSE-ConnectionGUID: yel/SUd3SdCI5vv+U1RJmQ==
X-CSE-MsgGUID: NGACLuT2T6OMV4JdfXEjRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63611623"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63611623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 10:17:09 -0700
X-CSE-ConnectionGUID: ntkvUp/KTZGnpe4OYUeEew==
X-CSE-MsgGUID: tHtr3Rw8TBu3xBpOs3islA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151429702"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 10:17:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 10:17:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 10:17:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 10:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6c1ojmxJIQNx/pxNeJLpjMl81x13RFwdrFqqavZT/Qp85rw0ASQRhk4MEYIv7JovvSdAmIPO5iQb4OgwnWyHbrfix3A/zGl9HdQV0qEw7bylJfr9VatIXzZaIjxBGaqplq6A2L0ABBRQ/603ytt2RJ9Coo0E1+vZ7Efua5fhC9sugs5+HF71xnIttYVRSoPSfETjfgqP5kAVfLt2mH9RsNVa6W/YR1TeKN1kmKFkln83jalGjE4bQl4vI8fKqN5Au0rRYwoodXeO42pVE6o/kxVXyXugltPlLqM4AsqEm4ZR43n+kXHDh8UmulF+zf7aURpwpgZnl+EAYbD4kRu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru5506HeaiZ/C631TFOyGm+nmmTx3cCRPDGKyAmHZNY=;
 b=cwp0/m6VIB0OhqkQ/rguoKFbwrZ9bz1ZxDvzq3uW5lnraerjfclfPGbh97tDbP+tNgNB10t6El2qWgXsPubjTukTJyW78UNHpTpSyVTs0Sk2fbfqfYonPANapI8Kw6sU7tWSQGdcRmOjvto9bevdV2Zciv2PhJoSwe4FPgc692doyID+QvutcQ/LHInGBlz0DDPAMreNcG/a6VFNUouhxKR2+UGF7cEqI9Rw75WtPMU6MQBPX8w159oShw+iBQAp4QJcrsN3Ju5MN/NA3Kkd8/L80dC16h5nCLsuEhqWcMJU+e/VUXiZJ92D64x748aSveRg5X5AocVbzF1AQtQl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 17:16:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 17:16:52 +0000
Date: Mon, 23 Jun 2025 13:16:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, Reuven Abliyev <reuven.abliyev@intel.com>,
 <linux-mtd@lists.infradead.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 00/10] mtd: add driver for Intel discrete graphics
Message-ID: <aFmL_g4LSPLEfxu-@intel.com>
References: <20250617134532.3768283-1-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250617134532.3768283-1-alexander.usyskin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bde624f-dff4-4bc6-2cae-08ddb279bee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/iqHRS/4ubJ4nbyqLkbZiWSbgB5PKEYktsNm7j2iFU+b88sbFpxwZ+IIO6U?=
 =?us-ascii?Q?Fk8pKBDV5D/4ZqZB9nHREh/59XH9jLVFkbzdfNpLQ/k6RWimf8D7qSE6GeSk?=
 =?us-ascii?Q?jp8+MkaWe0tLrMCAJNq7VdRsYkJQQOgur18C+sgAzwh+Pf3g4vVzKtmf3boi?=
 =?us-ascii?Q?+Ahv9yuzjo0jv28EcGDgZHfrNrjOYjFH6DvDzkuyuyHFyxAO2fJxPGBb5e4B?=
 =?us-ascii?Q?ECLMA2A4HLhtyKtnvKJ7Z6PhiJu9oGnttZT5CzhZW7Dm0XAZtSh86YrWhqwi?=
 =?us-ascii?Q?9h2xZ9OqzXA104q9txf6b9WAiX/ImKfQvTB5R6VXqQbZDbhYIk+nDEC02WKs?=
 =?us-ascii?Q?h+Y23+cNgkudiVVgsVQg1s1K0INHEsDDJ4s6YvRwrf/lKsYeT5zQpJ8axOAg?=
 =?us-ascii?Q?h3hMaVWi6TNLMwY+/5EgDfcQK4AsoHb2hnzjTaDWxyffafIxpBdJIkf6/Rc3?=
 =?us-ascii?Q?mgZG1H6bY546Gm3fRX8p3kl7OG4/VP7AQOR3gPDS0ajAnQTB01V7d89fAApc?=
 =?us-ascii?Q?KaQswdRH/9N2bWnks3nK5biduvUKMv1QpixVJlV5stXylEH27bHmbicr7fVI?=
 =?us-ascii?Q?wm/qmDfJyJkNnIwGH5ztAqbi+CQRoOTe1UgbV5mgHuEkVG9dzDfht0Ox8flW?=
 =?us-ascii?Q?smuXKzBxRtf6Spv+uXSdhBkvxm11pkh8Xf2BTiLSbNv6VPpwn50U7m7RQ5sf?=
 =?us-ascii?Q?WJdyLxzIErE+iCKoRdC2QkPkoOxCEPAgCsTGofwG7kPOWBKS8OKY7NqjnqDz?=
 =?us-ascii?Q?31BdhRPTlxlerNcEIzr/9M2/EWAydY2F93yNMSKCNPdDatYRjTGLXJsCvPmz?=
 =?us-ascii?Q?jLD0/NT92jeV2YgpPEeDCfqvEyJfs5LiAryiSQGyWwwoYz1ZkVRrcriC3PoC?=
 =?us-ascii?Q?63oiUHiUYDb6w5I6W2VEkNccUQG9BdJRu+WFDDynMAOhwedJQM6/nuS4EqOt?=
 =?us-ascii?Q?2e+oFEAj+sAObF0zOj/El6w9HLxJycn8lERwFZARE63deZhF/MIdVDNjktaj?=
 =?us-ascii?Q?T1NAYvSzXnPxaHY1EOSeqRhL9T97RoZ7MPoVuNzcDsr7NBR34StHAoCQZpyU?=
 =?us-ascii?Q?l/QyqvgivJE0U5xItsKNHTrqhlozHTq/rIRZ/x+m9nWmnpfvC6OvtHWkXBaF?=
 =?us-ascii?Q?S/HaJqCmbWIU2p0Tp00a5V44SAHgWfQFQo9RmxwDbqcyWbBrLy7atqvIkH6C?=
 =?us-ascii?Q?loS9Lnr5K7UON6yb8ErBK3I8+TIsDzjsJ7RVYobJXz0xD5VjTQ8R0FtcZvhz?=
 =?us-ascii?Q?/9aqU2oXq5VV2hNOoyniP5E6kdolGodbPI/gpcdpvz7vbCgSwQXpZOAFycU/?=
 =?us-ascii?Q?QRa+T2G7OGblmk2vOLccJbPfVxAeO7HXA0ozEiJw75Ah1xh1QdoJZEVFP4YE?=
 =?us-ascii?Q?dqUM4fcPu4jqjBd5fmQDd9PZJA8xplUdKLoZKt2HiWYPIebzjsQDt06uHnWB?=
 =?us-ascii?Q?sN2OjEsvHf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aFkCJP6DWY8A/UU1JekS0//idRHmJ9DYpX/DJwtO12B9477l2y1c3yYjXKeB?=
 =?us-ascii?Q?v8Y8HhmiueITqM0Ox+N5kkrdAs0ppbynJFpdYc+hPyYmTaP3LLZmoMIY/93T?=
 =?us-ascii?Q?16mKvpTQYIfvToV7OQf4OA0jGfeZm3Nqs5G25pfLRCfMs9BeprbZT6MaMAJD?=
 =?us-ascii?Q?2/Px+fILO8I5tvUSEZdbcT8gFCK+HiGlCdQJpEukmZtmJgRsfQ5CGBp4Ox+k?=
 =?us-ascii?Q?7M98ltn3QY3LCPYoaxiaef4xUG73bCmS87X9BpGBaPl4+g71A3h/6ToucPef?=
 =?us-ascii?Q?uowdVQEp2OTkQtQXXRVjmHHtUHsB4DWLr3ZsX10F1LNYBBPrVMmvc6lOrlST?=
 =?us-ascii?Q?CdsNSDqmTlikPnAAjMdzQbhH2nLYCjkOUXvaIq4bwBj0R7N9oeinDWNj3P+6?=
 =?us-ascii?Q?GtWauImX210zWuI23rFFL4nC0lqXN3jv8k23HQdQgf3d9mDY4h5YZZ/Muhez?=
 =?us-ascii?Q?syldstzXqfDGo8O7YprXEZPxbyOtobd/fxDwcQwQu1zRXPsdozfQCjbsrzvv?=
 =?us-ascii?Q?KLTRBSfD+8jbnSCpsF6RU9Aha2LyWKiIxZoQ5K0AMuieQ98cti8/rl1aydqq?=
 =?us-ascii?Q?0BSTVM9dXZb7SBM/mZXw4LmbTSMT1qaaXOIbM8Bf4jNU9RDD2SzrtUZu9c6u?=
 =?us-ascii?Q?dz4pAMSrCx8J9pzWUmtslcTXIPeWvW8dAM9xaCbftOVs97CCn6a4DteC244g?=
 =?us-ascii?Q?FgExUKpJiRg0mrN9ENvMkbb1kTWU51eVynYPl53O4PjK6HzRujjxBCNh0YKD?=
 =?us-ascii?Q?eRH3vKn2e1kK0oOLRdf++amfyk77nKCPgWwZdFLdhvWnYTmyCKEk/1nP2xOF?=
 =?us-ascii?Q?/7Ld2Vjk85b3f0PuGeaR8c7d0scGtgwJKlh6Fb9nkDJkuW+yLAIW7voaQzld?=
 =?us-ascii?Q?UzR53Ab8AoOppAWX7CQ7sGngCQpvtmM4GBWoIrwqYhSZy+0UALpaVV/VBtb0?=
 =?us-ascii?Q?N4Z1XfO7qXaDzvlxbxg+nNmXtrLPEycrLl/+aF4hDvnkaJu43dYxg+p/rDbb?=
 =?us-ascii?Q?VLzDk5JSJQ+4AD+jcHKvIU44LQF+CNCneSCbNrucin7Mu5VRRENG9z1lJ3Ex?=
 =?us-ascii?Q?lM4YRF53M4EPEL3S8PYWeG5Ge1OrTwEeDMtTdo5M3atP2D9Ho1DPVRJi6+Uw?=
 =?us-ascii?Q?qsx36+rWbmDEEWsqUJfTod2qzWagALSQAQCENNCOGVZjRtNJ2pmyCUlIJ0Fd?=
 =?us-ascii?Q?a2Tt+QdIcWAlNMbNuwQm/bDcHhPSr3ALSK1MjXN+MnOJEp6gK+C+V6R9dCwg?=
 =?us-ascii?Q?iUAs5aAYa1dnT/p8S7kWyb76wOzRXTjyBcWAUMGAdYrKg5but40n/mVTsN9X?=
 =?us-ascii?Q?68EiPLOPxxsihen3Dwq1Tv8njhl8I3zPFcjbxz6nXqxYy78r8usIBblFXIBW?=
 =?us-ascii?Q?u9NHbU79sJmERKy/PHsIXhiej9jk35kKcYKNr1m3cG5mfkO8P0/go7lV2ZWZ?=
 =?us-ascii?Q?Pajz5KciVnlnVEn66sVW4Z5W/M3vqwqPldxuX6yI2X9i2H0ZMm18LtQs9FgN?=
 =?us-ascii?Q?lxFwIFxFnMOPA9hkbh9FFW7bEbSjnwpqiGrLs5glavwOVdWbJubRfzkd/gWo?=
 =?us-ascii?Q?oEfpRbV7Toz4c7j/jcjKKx+xDxoDCy0zOa02VdA9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bde624f-dff4-4bc6-2cae-08ddb279bee6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:16:52.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH/peamtZj3hCHVM/j/eDq60f5+hHb6QCmTC34ynZeQy/UVYJtQLiombqQMTQliwy1ExY954OQ5gq9ilfpiAYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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

On Tue, Jun 17, 2025 at 04:45:22PM +0300, Alexander Usyskin wrote:
> Add driver for access to Intel discrete graphics card
> internal NVM device.
> Expose device on auxiliary bus by i915 and Xe drivers and
> provide mtd driver to register this device with MTD framework.
> 
> This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
> and "spi: add driver for Intel discrete graphics"
> series with connection to the Xe driver and splitting
> the spi driver part to separate module in mtd subsystem.
> 
> This series intended to be pushed through drm-xe-next.
> 
> V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
>     Enable NVM device on Battlemage HW (xe driver patch)
>     Fix overwrite register address (xe driver patch)
>     Add Rodrigo's r-b
> 
> V3: Use devm_pm_runtime_enable to simplify flow.
>     Drop print in i915 unload that was accidentally set as error.
>     Drop HAS_GSC_NVM macro in line with latest Xe changes.
>     Add more Rodrigo's r-b and Miquel's ack.
> 
> V4: Add patch that always creates mtd master device
>     and adjust mtd-intel-dg power management to use this device.
> 
> V5: Fix master device creation to accomodate for devices without
>     partitions (create partitoned master in this case)
>     Rebase over latest drm-xe-next
>     Add ack's
> V6: Fix master device release (use rigth idr in release)
>     Rebase over latest drm-xe-next
>     Grammar and style fixes
> 
> V7: Add patch with non-posted erase support (fix hang on BMG)
>     Rebase over latest drm-xe-next
> 
> V8: Create separate partition device under master device, if requested
>     and configure parent of usual partitions to this partition.
>     Rebase over drm-tip.
> 
> V9: Fix checkpatch warning on non-posted erase patch.
>     Add Rodrigo's review and ack.
> 
> V10: Drop master device creation patch as it now in mtd-next.
>      Drop power-management patch, it will be merged lately after
>      master device patch is propagated.
>      Rebase over drm-tip.
> 
> V11: Fix review comments.
>      Add reviewed-by.
>      Add cleanup in error path.
>      Add PADDING region that exists on some BMG devices.
> 
> V12: Add Raag's r-b.
>      Rebase over drm-tip.
> 
> V13: Rebase over drm-tip again to make it mergable.

I pushed this version to drm-xe-next, including i915 patches.

Thanks,
Rodrigo.

> 
> 
> Alexander Usyskin (9):
>   mtd: add driver for intel graphics non-volatile memory device
>   mtd: intel-dg: implement region enumeration
>   mtd: intel-dg: implement access functions
>   mtd: intel-dg: register with mtd
>   mtd: intel-dg: align 64bit read and write
>   drm/i915/nvm: add nvm device for discrete graphics
>   drm/i915/nvm: add support for access mode
>   drm/xe/nvm: add on-die non-volatile memory device
>   drm/xe/nvm: add support for access mode
> 
> Reuven Abliyev (1):
>   drm/xe/nvm: add support for non-posted erase
> 
>  MAINTAINERS                           |   7 +
>  drivers/gpu/drm/i915/Makefile         |   4 +
>  drivers/gpu/drm/i915/i915_driver.c    |   6 +
>  drivers/gpu/drm/i915/i915_drv.h       |   3 +
>  drivers/gpu/drm/i915/i915_reg.h       |   1 +
>  drivers/gpu/drm/i915/intel_nvm.c      | 121 ++++
>  drivers/gpu/drm/i915/intel_nvm.h      |  15 +
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
>  drivers/gpu/drm/xe/xe_device.c        |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   6 +
>  drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
>  drivers/gpu/drm/xe/xe_nvm.c           | 167 ++++++
>  drivers/gpu/drm/xe/xe_nvm.h           |  15 +
>  drivers/gpu/drm/xe/xe_pci.c           |   6 +
>  drivers/mtd/devices/Kconfig           |  11 +
>  drivers/mtd/devices/Makefile          |   1 +
>  drivers/mtd/devices/mtd_intel_dg.c    | 830 ++++++++++++++++++++++++++
>  include/linux/intel_dg_nvm_aux.h      |  32 +
>  19 files changed, 1236 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
>  create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
>  create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
>  create mode 100644 include/linux/intel_dg_nvm_aux.h
> 
> -- 
> 2.43.0
> 
