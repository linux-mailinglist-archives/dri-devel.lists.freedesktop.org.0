Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53673B0FFC9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 07:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A32710E87D;
	Thu, 24 Jul 2025 05:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcMHYX/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AE410E878;
 Thu, 24 Jul 2025 05:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753333547; x=1784869547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ojbSZXAFwgntwM/JsLF3p8dEI1btb1yOXistA/kntyo=;
 b=LcMHYX/eaTLmKX5FOdfj2/DKwg5Xixlh1F9gUsdpfs94b2bkwSxPLyEM
 PgvYjfUe/J7DJZmYmZB3nc8fEhxA6p9PWLUmg+LWSbhnDyOG44Vd9iUiI
 uXqGEYJJJRv84AVyMWZESsKjREu1hy7dMIsX5Ks6VquSLB2DjDZ6aDuNk
 JApY+CGf9UhyAV8T60zoqC7ZMl8C6YPolJBY2ahLgVJswiPtznPumKyCx
 wHFevHf12ZbSepFK9ASN+KmPGATgjy8WWzSoeM4fqyQsGj4rw3AvCASNh
 nAo7814ih5NP2+0ymLpW73LNTST9y4lpU5Wyl/FayKgI8SuhMLKLISBwc g==;
X-CSE-ConnectionGUID: MNgKpSxHQIGtKvaiueM4Ig==
X-CSE-MsgGUID: 4KZdBshkTQamoxZnr0WQVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59288766"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="59288766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:05:46 -0700
X-CSE-ConnectionGUID: kGqO+y24Tv25+pviUSwzPg==
X-CSE-MsgGUID: Av5/WRAjTQiM005jMTs1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="164450867"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 22:05:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 22:05:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 22:05:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 23 Jul 2025 22:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzjPLgoRU1HkWIBpHvjina+NKrXs92KsmEL+CeB/nrtdGOe6DE9pvXe+XTghCg7TwTAc07T8OBXUuAV5v7VZwwnwL0e5TMusMTX/5EVYPuCKdoeVtyFWOxh1v9cRNTjXBS8aOKjgUsMvXwCvrBmBk+OAwYV+0oX7xix/vL+ejS34dLIBkRpns+FfefkofqMblxr2TZflfnKT85l8NDhWDEhedso4W2KuJ5MYhBtytX8548Y6c2Jx6+y5LIGVzA59j3ehk1hFxG5+J/1Wl3nw4TOLY+K967RGpIcJTFqVdqURcyst4KemriQ5Z0Xo4Zsm3ixwEesc0V6v/bvD1MxgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojbSZXAFwgntwM/JsLF3p8dEI1btb1yOXistA/kntyo=;
 b=GVm++vMQh97pCfuiVAV8pMY3CKn6WLjoEMws/ZWr53iH5KieVIhf7TffmZ3fvEz4QlW2De7Hw5pcv02nNSKptaNTQQkNolne+Es1XTol1DiMLvsYnbam3Fjv23Rhsn7LRZdMyHJbn+/jPD5LCCk182gPqCO7mFRutuGIp+Los4dbi1WKi5NnlzOrLr7P95D1hBf/OsB3xyIaFFYJENi4MLgyNrv3zqiziDvzq3e0b5+tG6VTDq7qx+PjaK8X0nK+1rP8woD4bSOcBAYQVaeMwmL7+RDFyAxuRBRXcq+NyBpisImLuJ0hSOIRfQa47vX5iVWzW8dJJVbHwdB9Efv6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 05:05:32 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%7]) with mapi id 15.20.8943.021; Thu, 24 Jul 2025
 05:05:32 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Shyti,
 Andi" <andi.shyti@intel.com>
Subject: RE: [PATCH] iosys-map: Fix undefined behavior in iosys_map_clear()
Thread-Topic: [PATCH] iosys-map: Fix undefined behavior in iosys_map_clear()
Thread-Index: AQHb9855RD8SejSisEuXjvmUXA1DarQ39j4AgAALLICACLzYYA==
Date: Thu, 24 Jul 2025 05:05:31 +0000
Message-ID: <IA3PR11MB8987884A53D81CADB5C088DFD05EA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250718105051.2709487-1-nitin.r.gote@intel.com>
 <aHpelIVPhfR74SUH@ashyti-mobl2.lan>
 <598098e1-f5fa-46cb-a7e6-589f75ce7234@suse.de>
In-Reply-To: <598098e1-f5fa-46cb-a7e6-589f75ce7234@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DS0PR11MB7903:EE_
x-ms-office365-filtering-correlation-id: a0eb1cf9-c4ba-4b2e-0fdf-08ddca6fb6f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MFo2ZzVjNW9KNHRNQ0grWE9CMGxkWU9Rb0p5NWs0L0Fpb3BxYXNRc3ZxNnZT?=
 =?utf-8?B?UFhoaFlvbDdRVnVYYjFpTkpac2ErbnJsUDh0UFhsOU5vTDh1cVNIL3lTcmlv?=
 =?utf-8?B?RzdIYWF5NTZiVDVMRkU0aXFVdWV5ZG40ME5IalljU3pML1M3ZjFGalVqL1JQ?=
 =?utf-8?B?REx5M09hSStqalFLdnRVdzhIQXdzV011QlR0eVZDNHAzV0c0ZjVVU09iTU03?=
 =?utf-8?B?YndmVWpRTzVPc2Znd0tHelpQQ3Yvc05MWXlLV040aFl1cERvYkZDOXIzeitj?=
 =?utf-8?B?VlExMTFYbm1hZFMyRFNCeUlCYXRjeGN5Q3ExTm9mSnh1bnJUVXhPMklDVFRn?=
 =?utf-8?B?QnBncldBNU1ZYkR0TWpkREZFQzdzUjc3SCtpVFZ2Tmd0Z29aQkI1OFpoSjIw?=
 =?utf-8?B?TEF0OTVQaWd3UDJzQlFJT2RLNXdTYW41bjc4cEExTmRUaVFFb1FZRmtwN3NF?=
 =?utf-8?B?a2RtRWdMZ2NCek95QjZtcHd0SU9kMytMampNWmVwTHd0TEowV1hIVVM4cDdY?=
 =?utf-8?B?TmZZSGFyZ3V4NEZ3WFFXTHRZTFNwbFJHaTQ3LzIxMWJGS0NUeTk0L3laOGNN?=
 =?utf-8?B?anRZVFVSWjBtTlU4dElDdFQyUmlEL0p4QkJmSnZxU0ZlU2FRWVM5T3lSQklp?=
 =?utf-8?B?TmR3Wi9qLzltbmhrd3dEL0oxeTRuZFR4OEtQYUxWVnFWSkJPSVViQ0t4V1Zh?=
 =?utf-8?B?bUNYSVhDQ0RiUis0VUZkSWJ1M0tSSW1DT2xiYTVWNUtIUENOUFhEb3NYd21w?=
 =?utf-8?B?L0dzYnlwVE1kMzYxazVmeXN2VXlNRERwV1pMaXRvNVdGdCs2UU0vK3pBNkV3?=
 =?utf-8?B?M3hpdGxZQUhLSXNrT0JXSUU0Vy9CK2lLNEd6WTFibm1ObUJKNEhpc2xVQVBT?=
 =?utf-8?B?UzBoWWx6bVNrY0Y4bW1NM2FXblk3Vy81V0xqYjNlNUxaeGx3UG5NdTIyMVk1?=
 =?utf-8?B?aW5IazJCU0NuZnlTaUVqbld2SDZZckxleUg2VUVCalZVc2lIMVdHRnoyNk03?=
 =?utf-8?B?SUF6eDZ2TGY4ako3a1ovQUM3dm1Fa2hNNEV3YlFVYm1tN3RrWkpkTXpHQWc5?=
 =?utf-8?B?NzcxNXBlRGh5K280c3daWGluWXoydWhIWXM4bjdkQVBWSmNXVzhYclNuU29q?=
 =?utf-8?B?WkltTnc3WGx3UXcvUlhkK08vTnhrV1RlNkR6em1seklCOElRcU1mZTJVRjlB?=
 =?utf-8?B?dUZyWW1LWElnRnVpWnlPSFlnSWUzbkt2U0RvWkRsSCtaR1IzVkF0c09RbmZv?=
 =?utf-8?B?UmFiTUg2eVFKMnZ4dVZrQkRBWGM2RS9IV3VJTmxOR0k1TmJyaytFR1pKbWFF?=
 =?utf-8?B?SnovcDlBQ1JyakM0L2ZML05scEVQL29YT3VmQUJuSTlVMlJNWkhGck9uRXdj?=
 =?utf-8?B?NVlPL0ljWHhoUlZZTHQxZFd1MEc5MVB1ZUp4Tkx5bGo2MjVzREFHVFQ1c3BE?=
 =?utf-8?B?YmpCQlR2UHE3bHI0dXdtWjZVQWlqWElvM2REL0hoSDJFRzFtUFdudVBmeGEw?=
 =?utf-8?B?REQyaUF0Ym84WVhDVEQ5dy9xZFJGbUp4U1NoR3FUQXBXMXoxZWhsNnltalFL?=
 =?utf-8?B?RVd3Z1Q0NWJkaUZvRFExeFJVd1RQMlNYM29WMXI2SDlnakg4T1J5eCtEczBR?=
 =?utf-8?B?dHIvUFFhaG9Reng1VTJVT2x5ZjRDQzQ2M245WFIyeUJrRXl1cjJCUDU4NWVm?=
 =?utf-8?B?YkljZkhuaXhmZzVRTllwU05qNzRqT0ZjY08xMzFUM1l2Z0hlYS9FazFuUC9I?=
 =?utf-8?B?RFpPM0l0YTZDak9janZPNTJRY3VkY01SZHM1S1pLazZ2M3BUc2NEYnJFcU1Y?=
 =?utf-8?B?a2RiMU45cTBIeW9BVW9keEFzMkYwS0hyOEpKakgydUtlVjZuYzkxdWp1REpC?=
 =?utf-8?B?WlVsNDJpbmNiZXU4c2U2Ujk0bXdxampVZTdvc2pDU1kzNXhIbXRVRXBoR3lJ?=
 =?utf-8?Q?6LrIHv6m724=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGVJODNrL2JxdzBQQWM5SXUxeUlnV2NzaEIrcXFXdGI5NEhOeFdUeWJEVTMz?=
 =?utf-8?B?djJhWTlFVm1qSlZHaE5meWRLTW1SK0VpZ3UyY0VsUTNYcFFPSm56MzRHbjM5?=
 =?utf-8?B?VnplYnl2c0NGVGVvbnloNjF5UGtBM2E5dDFMM01oWUNadk5nTnB0eGIxN0FO?=
 =?utf-8?B?NnN5bTh1a1NjTENZK0dueVQ0TjFkUzVKWTZtSWVQd3VKQm5TcjNCeVlxU1RY?=
 =?utf-8?B?a2JQajlLZ0NXVFJEcnFDOHlIUFc5S3YzMnRScFF3c1N3em9ZMTk1emVLRWJG?=
 =?utf-8?B?Ykp2WFRia2dJQTRrb3ljMnY3UTN1eVh5RG9ObEpoV1M5Tzc5M3Q5OTZ4c0JS?=
 =?utf-8?B?Z2hML3R6YU5pd1RlbGNPOXlPTzVIUFhaUUhMVnZSSUhxWHJYRWtJcFI2NUVZ?=
 =?utf-8?B?RmdlZUFLTmtuVlFZSlFXUzJOSjZTbzhVL1pCbEFUWXJPay9Cc0kvMUdtUzFD?=
 =?utf-8?B?amtqRVpHcC96ZytOTTdXNGJldTJXeEdLa1F3YmlOZmN1VVUxcVdIUmgxWnpZ?=
 =?utf-8?B?dkEvRW5lOVpwMmV2SjdrOWdxdUFxMEVxNTZkTkpmMzZ1dXV4WDl0VzA2WnJL?=
 =?utf-8?B?bDRzNTV2OEtGVEdONEZkc1pLNTFicGhiOEVTenpQT0VlVW9CaTVSYmcrYnB2?=
 =?utf-8?B?Q3V4bDhQRlUyemxMUWQvZHpUOCtIS0ZvQ1dnZGE0L2tJTGh6OUo3Qy85aE9I?=
 =?utf-8?B?QUtHWldNQ3BOa0NqdUhqUFBpQXZxaUVUTnAzbFl0bEZBTlNJWmwvMW5rYUpw?=
 =?utf-8?B?OTNKc1hpbkp5WHkrWEpDVXZ2L3BXTjMyenR0OGYyZFRwcEw2RHJOZlFNaFJt?=
 =?utf-8?B?N2hSQkMwckxyLy9BdkdMdTB6UHF4QVFvTG1aSjdYV21FdTA5V2diVjVxY1Z0?=
 =?utf-8?B?NHdKeXFQZXBEbnlFTjBvRHpJMUFwRU93M1JBYVhzbmRrNzlmUHhrNlhDckdU?=
 =?utf-8?B?L2tFR08rajRtT2l5YStaYkdJN2FzbGtLM29tV1RnSVh5dGNmYW5vRGNHY3NF?=
 =?utf-8?B?Z2RZUEMxS1FobmFFd216T0xZaE80N0d3UGU1YktaUHlWZTBONnVDSHlVOHlG?=
 =?utf-8?B?SE4yK09TQ3lHSEFEaW02TE14dnM1eldEMllUK0ovbTc2UTFjUFRzaE9YUU44?=
 =?utf-8?B?RGdZUmYvOXFMVDRGVnFQNFdMMnVuanJQM3gyOEVXVSt0MlNaT2txZFpYMnVy?=
 =?utf-8?B?WjB2UXA5VHBQd1RPczVnK0o4Z3l1cTFzVktHRExZQStmVHIxQ3JrZHlSeGVC?=
 =?utf-8?B?czg1T2l5L0h0dm90dXhLWE5wMjh0dngwekttM3FLSUUyRlZDWjZDUWwyYXFX?=
 =?utf-8?B?SG9vWHg0Y2JvdEoyNXd1VElxdHhBUWE4T09ycXdvdzd6T1ZTNWYxYUhFY0Fv?=
 =?utf-8?B?NUkrV1EvdGM4RHgvRTJHSTlUNEhMS3duc2U5VTBqSTEwMVZxQnIyRUJ2ZFQ4?=
 =?utf-8?B?Y1huRjY1N0MvaE1rQ1VlbXhsRjczN2hrK1ViNlJOOVdkQyt1QU9NcUoxcEMw?=
 =?utf-8?B?eUFWNnRXT2NQYzAzSXpORzBLZ2JtekF0bkp6VGVNRFI4VEN3MkZCTDY3Ui9a?=
 =?utf-8?B?SGhhWnVkakxuU2RZZzRueXRwb09IYlZGOCtOd2UzakpoZHlDWFZWRmJUM1JH?=
 =?utf-8?B?RlEyYko5dEdnUXI3MGJjSjVtNlgybFFIYWJZSzN6S016bmVxdmlHWElMQXoy?=
 =?utf-8?B?U2g3K3FseUI1NU1HeWhJODJhUFgrejJnTHlNYWpWVTBUUEFEYmZGTEpwWVFm?=
 =?utf-8?B?VGVFVlBOTTFvT2JhYmFCd25VdktBYW9QVUY2TEFIMmZteTlRVkZ3YytSSDRt?=
 =?utf-8?B?WEVwUW84M3dKbGRaUUxjbzQweTJITVNZYzBxaXhPSVVraXlwUGxydEY0U2pK?=
 =?utf-8?B?dUplZjNxRFRsalpqUW9qb0ZrczVwTGtJK1dNUTFaUEF6OXVGMk1zZXNhL2NL?=
 =?utf-8?B?WjBSZk5YdFdBNkJJcXB3UmRXdTd6T3NGc01FL3U2ZXFJakdUVytyY1hhNDQ2?=
 =?utf-8?B?R0xZei9PSGh3cTNacUdDM3F1N2x3MkdVeTRXa2hKaVRPeXZ6c2ZxaTdkcFpG?=
 =?utf-8?B?bmh5UGpldzM0Yzd3TEcrQXJQb1ZZZzN0VTdHUlFWcHR0ME1NalR1ZXBQcCtJ?=
 =?utf-8?Q?m03D7uiycuzcl+KIUTudKObxL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eb1cf9-c4ba-4b2e-0fdf-08ddca6fb6f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 05:05:31.6321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: etv0tT3oN3yGxuK2jITJT9B+7SLpHG5mlnrMsVT3zH7NN/46LN1idyhxBisJinXDGT1zHHUwhiTVp/94zWVElg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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

SGkgVGhvbWFzLA0KDQo+IA0KPiBIaQ0KPiANCj4gQW0gMTguMDcuMjUgdW0gMTY6NDcgc2Nocmll
YiBBbmRpIFNoeXRpOg0KPiA+IEhpIE5pdGluLA0KPiA+DQo+ID4gT24gRnJpLCBKdWwgMTgsIDIw
MjUgYXQgMDQ6MjA6NTFQTSArMDUzMCwgTml0aW4gR290ZSB3cm90ZToNCj4gPj4gVGhlIGN1cnJl
bnQgaW9zeXNfbWFwX2NsZWFyKCkgaW1wbGVtZW50YXRpb24gcmVhZHMgdGhlIHBvdGVudGlhbGx5
DQo+ID4+IHVuaW5pdGlhbGl6ZWQgJ2lzX2lvbWVtJyBib29sZWFuIGZpZWxkIHRvIGRlY2lkZSB3
aGljaCB1bmlvbiBtZW1iZXINCj4gPj4gdG8gY2xlYXIuIFRoaXMgY2F1c2VzIHVuZGVmaW5lZCBi
ZWhhdmlvciB3aGVuIGNhbGxlZCBvbiB1bmluaXRpYWxpemVkDQo+ID4+IHN0cnVjdHVyZXMsIGFz
ICdpc19pb21lbScgbWF5IGNvbnRhaW4gZ2FyYmFnZSB2YWx1ZXMgbGlrZSAweEZGLg0KPiA+Pg0K
PiA+PiBVQlNBTiBkZXRlY3RzIHRoaXMgYXM6DQo+ID4+ICAgICAgVUJTQU46IGludmFsaWQtbG9h
ZCBpbiBpbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oOjI2Nw0KPiA+PiAgICAgIGxvYWQgb2YgdmFs
dWUgMjU1IGlzIG5vdCBhIHZhbGlkIHZhbHVlIGZvciB0eXBlICdfQm9vbCcNCj4gPj4NCj4gPj4g
Rml4IGJ5IHVuY29uZGl0aW9uYWxseSBjbGVhcmluZyB0aGUgZW50aXJlIHN0cnVjdHVyZSB3aXRo
IG1lbXNldCgpLA0KPiA+PiBlbGltaW5hdGluZyB0aGUgbmVlZCB0byByZWFkIHVuaW5pdGlhbGl6
ZWQgZGF0YSBhbmQgZW5zdXJpbmcgYWxsDQo+ID4+IGZpZWxkcyBhcmUgc2V0IHRvIGtub3duIGdv
b2QgdmFsdWVzLg0KPiA+Pg0KPiA+PiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTQ2MzkNCj4gPj4gRml4ZXM6IDAxZmQzMGRh
MDQ3NCAoImRtYS1idWY6IEFkZCBzdHJ1Y3QgZG1hLWJ1Zi1tYXAgZm9yIHN0b3JpbmcNCj4gPj4g
c3RydWN0IGRtYV9idWYudmFkZHJfcHRyIikNCj4gPj4gU2lnbmVkLW9mZi1ieTogTml0aW4gR290
ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gPiArVGhvbWFzIGFuZCB0aGUgZHJpLWRldmVs
IG1haWxpbmcgbGlzdC4NCj4gPg0KPiA+IEluIGFueSBjYXNlLCB5b3VyIHBhdGNoIG1ha2VzIHNl
bnNlIHRvIG1lOg0KPiANCj4gVGhlIGNhbGwgdG8gaW9zeXNfbWFwX2NsZWFyKCkgaXMgYXQNCj4g
DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE1LjYvc291cmNlL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtDQo+IGJ1Zi5jI0wxNTcxDQo+IA0KPiBJdCdzIGEgZGVmZW5zaXZlIG1l
YXN1cmUgZm9yIGNhc2VzIHdoZXJlIHRoZSBjYWxsZXIgcmVhZHMgdGhlIHJldHVybmVkIG1hcA0K
PiBhZGRyZXNzIHdoZW4gaXQgd2FzIG5ldmVyIGluaXRpYWxpemVkIGJ5IHRoZSB2bWFwIGltcGxl
bWVudGF0aW9uLg0KPiBJJ20gbm90IGEgYmlnIGZhbiBvZiBtZW1zZXQoKSwgYnV0IE9LLiBQcmVm
ZXJhYmx5LCBpb3N5c19tYXBfY2xlYXIoKSB3b3VsZCBzaW1wbHkNCj4gc2V0IHZhZGRyID0gTlVM
TCBhbmQgaXNfaW9tZW0gPSBmYWxzZS4gQW55d2F5LA0KPiANCj4gUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gQmVzdCByZWdhcmRzDQo+
IFRob21hcw0KPiANCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KQ291bGQgeW91IHBsZWFz
ZSBoZWxwIHRvIG1lcmdlIHRoaXMgcGF0Y2g/IA0KDQotIE5pdGluDQoNCj4gPg0KPiA+IFJldmll
d2VkLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT4NCj4gPg0KPiA+
IEFuZGkNCj4gPg0KPiA+PiAtLS0NCj4gPj4gICBpbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oIHwg
NyArLS0tLS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAu
aCBiL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4gPj4gaW5kZXggNDY5NmFiZmQzMTFjLi4z
ZTg1YWZlNzk0YzAgMTAwNjQ0DQo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgN
Cj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaA0KPiA+PiBAQCAtMjY0LDEyICsy
NjQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaW9zeXNfbWFwX2lzX3NldChjb25zdCBzdHJ1Y3QN
Cj4gaW9zeXNfbWFwICptYXApDQo+ID4+ICAgICovDQo+ID4+ICAgc3RhdGljIGlubGluZSB2b2lk
IGlvc3lzX21hcF9jbGVhcihzdHJ1Y3QgaW9zeXNfbWFwICptYXApDQo+ID4+ICAgew0KPiA+PiAt
CWlmIChtYXAtPmlzX2lvbWVtKSB7DQo+ID4+IC0JCW1hcC0+dmFkZHJfaW9tZW0gPSBOVUxMOw0K
PiA+PiAtCQltYXAtPmlzX2lvbWVtID0gZmFsc2U7DQo+ID4+IC0JfSBlbHNlIHsNCj4gPj4gLQkJ
bWFwLT52YWRkciA9IE5VTEw7DQo+ID4+IC0JfQ0KPiA+PiArCW1lbXNldChtYXAsIDAsIHNpemVv
ZigqbWFwKSk7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiAgIC8qKg0KPiA+PiAtLQ0KPiA+PiAyLjI1
LjENCj4gDQo+IC0tDQo+IC0tDQo+IFRob21hcyBaaW1tZXJtYW5uDQo+IEdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+IEZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQo+IEdGOiBJdm8gVG90
ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4gSFJCIDM2
ODA5DQo+IChBRyBOdWVybmJlcmcpDQoNCg==
