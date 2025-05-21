Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1BABEB5B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7A510E11D;
	Wed, 21 May 2025 05:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OG10VSMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5885F10E08D;
 Wed, 21 May 2025 05:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806057; x=1779342057;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xmgCVrAKLN5ZhdhC7UIr0ozU8sHOoWFxDgl/HxscaoI=;
 b=OG10VSMOAVkrxhiSLSKE2R45qKoWMWAPKw6JHOzrkXqQgpo+3J+9Fr5m
 xFmpqHkwZFSJBpqqE5iQMWqEaVbJkWKTTRP3U/lEBU2XJBU3ut5pyvwUm
 JNBJNjFJh1g9Ds43BImSLVYl1U1th1mVlm9eoUYNsAfDVsH7aiAhgzfjx
 ouIKvAilmA+wSQj93uHOgY+stFAE3Sq55NVuu5ERTaTXZ+snCu9E2Kmu7
 FEhuqrhrmVhIKau0Fe0GdwurjpfWvO0+riE+ZoRRvxCLbaAv0YFkElFAt
 lemoES55wv1lTfJs5v4jI8NFHn2BkRHa7eXQ4qjhFi9qWH3PoA9fxhB26 A==;
X-CSE-ConnectionGUID: oFfcOWRhRNe9nyAPLTWHHA==
X-CSE-MsgGUID: Epepg+EkQ6OOHn8sVYkntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49669183"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49669183"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:40:57 -0700
X-CSE-ConnectionGUID: lEMld16LTNqaEDLYVJ9ZWw==
X-CSE-MsgGUID: M57UdO90QZS/C+v5xcK70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170792120"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:40:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 22:40:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 22:40:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 22:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0/yFFSOunDD+Uja7hrYwnb5UWkBMfsY7vFUgKtgTosNRIxaDGFCA9eFnxxuDtxcm9SBh5Qj75v7V4Uz/afj/nZKN87Iq4ZNUVdeFF2JjttohEHagv+af1tzJNSnoSHqSBiBAvbFIort/U58h90yZqaSGOux7ZQAAaTsio2UJvTLkVv1yXH4rnu6IC86AueoI+1TjAZZqg2cStbnNw4mJWi1PJXkFFgn5O3VddeMRPsv/bTGuE0fsyBpptaRGyPwKng6mv/NjrJoXFZ1ak0uR8rxq2Q/y2X7H59D2rz5M8MGB+LN2wUDtB6hzYgsGB+Ct2bJvuZ5/FoujncAIMUVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmgCVrAKLN5ZhdhC7UIr0ozU8sHOoWFxDgl/HxscaoI=;
 b=C/ecitRvYjimAo9JP0JqfMWFB72XB4aVzndazvtGWx3PGCs1iTS5MnLthHSA2F14Dni0Om3cJfh9aK6rVoZxOrXijSAPXjJNIy7bhhySaRExPMy9j9qGYZteBLCE8ONkN5j+5iWxFYIf+fF6wGODT/CPIdbWJ5fK4vYfSAuvwTlJwQubuINf2ocxQCx7EVaor8wZQkGJ8I2xSvB4OvKi+XpkdQoh0aVQaIDZxMsXiiHlutnS53pmshP7NM1ulPNOG4JHHe7Mjv+fhu1KbG0oaVInF4rNiUttA5PvzRRn9HWbSYVS97rhFdBvf6FGSK5jc8Ij/EdQ26tZwvX+fLM2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:40:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 05:40:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
Thread-Topic: [PATCH v2 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
Thread-Index: AQHbyafFzAlnpcr3u0SdvKQi7D+mFrPchB+AgAAOZQA=
Date: Wed, 21 May 2025 05:40:53 +0000
Message-ID: <1d84f08bdba68cffc026590d00678121cb6687c5.camel@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-3-jouni.hogander@intel.com>
 <6d42171b-14a7-460f-9558-bf89af7941f2@intel.com>
In-Reply-To: <6d42171b-14a7-460f-9558-bf89af7941f2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: 60aacafe-04fc-440b-92cd-08dd982a0d55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Yjk0ZExxczQ1WFBrZEZ3dDBlN0ZMNHJRZEdsQkNGNWxVN1lTWWNOeE9aQjcw?=
 =?utf-8?B?NzE5dFRYR0s1Tnl3MFgvZHlKdk0xRGlvT3RGSGZUMHNmd1JLZTdScjAwby9X?=
 =?utf-8?B?TDlmSldmclVsVzh0Ylc4MFFSd2FkODZyRnQzZkh2QXJ5d0JrU1d0ZmhOcG1B?=
 =?utf-8?B?UEZ3cEVMb1FxRXlYcnlGaFJBZitvZUlhNDkzVWlKeUVJNVQzOURRaVpwVDQz?=
 =?utf-8?B?V3hNL3BSZExIMVVsR1V0eWtwT3BLb2JVT0RsV3phTk1sSURzOGxuRm9uUTRC?=
 =?utf-8?B?eXM2ZTlRUDY4UzJNMm5NMHNwVmlqZ1R3bGdaakdEOG0xTGNpZmVYMWtaRUZS?=
 =?utf-8?B?RkVVNS9mL0xjcHY1YUp3cFBIdDVkTk80VWRZWUlBVHorL1dGUnpEL1c1eXlW?=
 =?utf-8?B?ZXQ2Q0MvUUZ3a1BuN1RrUm0xQ01CaEdldFlDNFA0dTZwalB0ZzRNeXY0Z1Mr?=
 =?utf-8?B?VlRsRTJOdFFhTlozMGE1S2kzMkNXNCtSd0VuczUvT3pDZm5pZ2x4T2ZXV3BP?=
 =?utf-8?B?a2Z2MHI0L29OVjFoRFBWREhWaUVhVnlsZitCUVUySFlYK1NoL0FlUnVDY0I1?=
 =?utf-8?B?Mjd3a0NKT00zb2hkdmhkQW1JVjFxV1p0d2J3cUxmb2IzY3Q1Zi9SSDFLemV4?=
 =?utf-8?B?dSs5SkhwTk96T1hRRmhvNWJKZ3VCRnNDRUUrNitzMjNCY1VHWmcweTBtdHI0?=
 =?utf-8?B?L0ZLeFo1VmEzWlhMTXNhekIrWHhrbmVDVEo5UjMyblZ1RGlyeXJlRnkvRjlD?=
 =?utf-8?B?N1dYbDB4dC91bHlGOXBMMFp0SC9WOXd0S2syVFA5SGZ5d1VqekNKWXJlWFUz?=
 =?utf-8?B?Z0p1cGM5TTdOOGoweTNOT2NEb21zWFZKZzRCdUU5K0VlZGYzdlVrVmJZRDlq?=
 =?utf-8?B?UHdNWG1nTUR1YlpGL0grbGtYUWxNeVp2Mk9XeXRLYWFUUHNxVGkzMFprbUk1?=
 =?utf-8?B?bVphOEdvZFZ1MEltU1hEQThVQlJuSTFaZEVFdzV1WEZYSmY5SEhBbVA1Zmxz?=
 =?utf-8?B?NDlXc25pUXQvMkMwclgwd0E1dmJnTjFLWUQxUUE2eDY0N2hacFdmMGhSaTQ4?=
 =?utf-8?B?RVVjZVlCN3ZVcXVYMFBRVlB6S0pMdlNsM2xYVEJXYXNSTnpPTTZkMFNEdys4?=
 =?utf-8?B?c0p3aVQ2YXZzcHJvWUEwditHS1B1RVhpcEV2dkhqa0dWd253R1VKU3lFMmlX?=
 =?utf-8?B?cGtmWktCeC9ZaDNXN3JjdHpVNG45em1GSURoS1NqSnhVUWVqK09LaERVS3RI?=
 =?utf-8?B?b2g1SWNDYzc3OUlyUHN1MkxhdXhMdzJzZDRmNFQxaDhtRENjc28zMEhqUllH?=
 =?utf-8?B?MVZSV0VkSHhNcnQ4YXlDT1ZFWGV3OEFnK2Rkc2M3ZnVnazlpcTRhNEdZUE10?=
 =?utf-8?B?SGRybFFKaHJQSHRKeXFBb1BEUFBnWjVqMGNMczBhWUQxSGtzTllkREJlOHFs?=
 =?utf-8?B?Yi93K3JKQ0FmNWU1a0RjZk9mZ2tDbzVsZmhISERUUE5JQU9sTVRLazVOUDMw?=
 =?utf-8?B?WldnVHdhOXFqbDBvUW8xeXpibEk1bHVhM2tIak11ZjlETHFpdWxTV1NmTzNZ?=
 =?utf-8?B?bHdUU0tYYVVIV0JiRU5YSVZBbVE1bFVObDN2ZWxPMWNzTHFmNVFxdzZFQmZn?=
 =?utf-8?B?KzFTTG8ySlo5eU5CaTY0Sy90VGVrMmpXNEFuWW02VlFYYnVNYitWT3lxNExM?=
 =?utf-8?B?VlZaSXllNHg5b3VMcFlBZkFzRTZLUlNrOW1kMVZibGJpN2p0akhlUm5FNXNY?=
 =?utf-8?B?ek1QbEkyTnJIN3N0bjYrTDhzbktCVFFHbjR3RWFPUXdhQTZaY3ZaMGRDL0hY?=
 =?utf-8?B?RTVkcUJlZnRrSWtuUlNCSFVCa0FQRU9zZU5BSHJsMFNkcjZURGhRZnFPMTJZ?=
 =?utf-8?B?QVEvMnNBWnFLWGErLzVOemRoYXR5NjdRNHcwLzcySC95QWNkZzBGNFlWMTgz?=
 =?utf-8?B?NTBEeUt2YjEzUnI5TG1jR3lkemNJSGo0bEM3eVZ1R1FBUGRVSVdxZk5kdzJJ?=
 =?utf-8?Q?VHJiq2XVDecrexnJDAJhb9vGd2M5t0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWF5aUFXVDc2NWhTREp4aDh0NURhYXIyZFZLNWpWRkpoMHFiZHp0bkt2V1R6?=
 =?utf-8?B?TjhaaXozOTd5QmlYVGk0bEkxRVVFRTBZOVIvZXc1eFZ6SytMQkdSTkc3WXl6?=
 =?utf-8?B?L3NYeVJ2bTJSYkhwVk9mZmlORlVGakViNnczczc3SmlSVTh0Y1VkVmtHdkJV?=
 =?utf-8?B?L2tGdGxZYk1sSCtUUFhZallxQ2k0MDdMWWRqRVJaa0x1L1kwS3pxb2FRN1dh?=
 =?utf-8?B?SW4wbDlCY3FXM1pFMWFzcW9Md0F2MHZieDlTc0V2Mm5HUU9ESUdINWJDMEhj?=
 =?utf-8?B?enJjcEVnRlRNU2JWS0taNktYSS9LWlRUWjkxTzJLaGxlZWpTOXFsNXRQNU1a?=
 =?utf-8?B?a2NMTDF5RE9QWXp0ZmlPYUsxd0tBNjhMd0xsZ3ZCWjFkVGJNa01pcUYzUHIz?=
 =?utf-8?B?QVIzUmlqSktyaXAyd1NwSFBJZ21rMmlvUllYVmd6TDkrd2h5bzFMOHZxU3FU?=
 =?utf-8?B?aW1PeTczM2V6ZC92aEhhdkoyY2xrN3NuaFNsNE01VzJoUE02MnUvRGNmMlJN?=
 =?utf-8?B?QjNkOHpBNnZQVHczbm90S0ExN1pCaDZzWi8zaWV6VTdCcHE1SzBRWTdyRjFV?=
 =?utf-8?B?UktWcXZiSjhDUzRqYkw3QmpJWVVaREJBdlJkbVlzNTlyeUVGZVBwdFV3VXRQ?=
 =?utf-8?B?a2lnc2h3YkRJb3dwZVZ2a1dDdUY1aFZQSVdjOWxNZE16bnkxeWh5N0RYckFw?=
 =?utf-8?B?MEprVU9SN1ZiNzZ4bnpqNmpIb0Zmb25YSlR6a2xzTkE3R04xZ3ZqVkx3aXpU?=
 =?utf-8?B?RFZKeXZaT3VGU2RsU3ZmbDBidXhBa3hyMGhNbTNtaWxCOHo4RkZMREI2S0RD?=
 =?utf-8?B?cEU0MTBhNStlN01mb05HQzNrY1lEOEx6aTZhcDFZUFY1Tkh6RTFBb2ZvUlpC?=
 =?utf-8?B?eDBIK2ZwcUtCaFh4YVJ2SHpaNWx5cE9PSU9VVGcwT1g5NSt3L2RoQUJES1JO?=
 =?utf-8?B?YTVjYm5tMjdnWWhqaCtieTVTanl2bldCaUR5K2V4VnNQc0YrUmRxSFBORFp4?=
 =?utf-8?B?dXdKSE5QK0dzcUxlUmo5ZDJnQjlHei9tZUk0aTgvMzMvWmw5ejU5dG9OdFpw?=
 =?utf-8?B?eTBReFdmeXIwOXdWMzFqaDVISGI4NHI1U1VRWmVwMUZ1K2V6SkVGUytKRzI1?=
 =?utf-8?B?U3Q0YjkvallockRWNVZucnpmMnpkZ1Z6MVNLOFc3YTdMRVpVcEVJTjFGd1Na?=
 =?utf-8?B?TXpydk9OOXNPc0c4My9iWlBzbjBtYXQ5aklpYzh0Q3M3NjFhemRRWlJmeXh1?=
 =?utf-8?B?TDFqdXYreUliZHNSRjAzZVp0TWNPQUsvM0tHc3c0TW5aWmNSSUVxRnRnZmFt?=
 =?utf-8?B?UXhqNmxydGVNZjh4VXQrVjRKYUQxckFoVHM1MEdMc1BwVk1rYnM1UXV4VHpv?=
 =?utf-8?B?WUZraWUrUGY4a2FOeGRHN0QzS3BxQ0pQK3FXWjRFdlhrakhpUU9HWCtSZmIw?=
 =?utf-8?B?MVB1a3pTYXZVWWRtWTl6VkJDa2ErdEFNM2JuN3NEMFlKanFOVmdyMFZab3lQ?=
 =?utf-8?B?UW40Ny9sZzZhb2M0WEhaSFIzR2w5OTRWOXVLQkxPVGxlV3QvUjdGb2JzSm9l?=
 =?utf-8?B?N1U2NVZ1c1JNVHQ2LzVjd2RzVEVYWWFYcmkzNk9WUXpxZC9WbVBJcENmQTRO?=
 =?utf-8?B?dzc3N2NyMzl2Ukl5Mkp3UXhhNGZuemZHWWdLd2YvSUllS2NZZ2poKzh3VFA0?=
 =?utf-8?B?MytCSFJlZURkS3JZai92dVVoWU4zQWhZL2RRckJXRzJ6cGgxc2dBWUJuNDdh?=
 =?utf-8?B?b1pWSjZlYkk5RTM1S0Fpa3hNN25HL05neUNBamNDR3Q4ZGRuNHYyT1hoNGhR?=
 =?utf-8?B?UXZaTWFOQittL0dsaytCUzZSTk9xcENTMUM2bTZ5VUZDV2JndWtJTVdwVUc1?=
 =?utf-8?B?WEdxNy9NQWNXOFpHZ2hTOVJNSHNLVFpJN2xNM3Q3SHpZamRHTk83VVZuQzVN?=
 =?utf-8?B?cUdvaWVrL1JPZzRkd1pZVVFkZXFiekZHRlFkSGYzZFljRFJXTW5JVDN4Q2Mw?=
 =?utf-8?B?dFBSWGdDOXRXd3pUZTZvUVFoVU56TjMzeGtLT205dU5zOHFXTkJ5MTlQUHFn?=
 =?utf-8?B?NlFUS2JFUVYxMFF4Vmd1SHJ1YjRMQk1zMTNMb0NkSnY4c3BwUi9RZEYwU1Rx?=
 =?utf-8?B?NWdxYWkyb2dqd2p4cStmaXlWeHdkalBoTjR2TjNSWTFqOCtxQlZVWWdIeWtp?=
 =?utf-8?B?NytkVUdrMGlTTndNSjRxYjhRaWZSeFE1dGNuekExNzRJUGdKTjRWcmFyOE1O?=
 =?utf-8?B?d3JONXdJQy9pQzlBZ2JFQ3pvaEdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08EE97F58F7A19499C22C9E7FEEB592C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aacafe-04fc-440b-92cd-08dd982a0d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 05:40:53.5787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDGjIEPOQTiPl3F1OCqDagNH9MW08o17giKbCdJsC5DVzxCis7eM27oKyISNbDCD6QfgJH63g7hqgERruG5yjuEIMtBYDsf/wFXRskG42t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDEwOjE5ICswNTMwLCBOYXV0aXlhbCwgQW5raXQgSyB3cm90
ZToNCj4gDQo+IE9uIDUvMjAvMjAyNSAxMDoyMyBQTSwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0K
PiA+IEFkZCBQQU5FTCBSRVBMQVkgQ0FQQUJJTElUWSByZWdpc3RlciAoMHhiMSkgYml0cy4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoCBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwg
MTAgKysrKysrKystLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkv
ZHJtX2RwLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiBpbmRleCAz
MzcxZTJlZGQ5ZTkuLjkxZWU0YzBlZjBjZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcC5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0K
PiA+IEBAIC01NTQsOCArNTU0LDE0IEBADQo+ID4gwqAgDQo+ID4gwqAgI2RlZmluZSBEUF9QQU5F
TF9SRVBMQVlfQ0FQX1NJWkUJNw0KPiA+IMKgIA0KPiA+IC0jZGVmaW5lIERQX1BBTkVMX1JFUExB
WV9DQVBfQ0FQQUJJTElUWQkJCTB4YjENCj4gPiAtIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1NV
X0dSQU5VTEFSSVRZX1JFUVVJUkVECSgxIDw8IDUpDQo+ID4gKyNkZWZpbmUNCj4gPiBEUF9QQU5F
TF9SRVBMQVlfQ0FQX0NBUEFCSUxJVFkJCQkJCTB4YjENCj4gPiArIyBkZWZpbmUNCj4gPiBEUF9Q
QU5FTF9SRVBMQVlfRFNDX0RFQ09ERV9DQVBBQklMSVRZX0lOX1BSX1NISUZUCQkJMSAvKiBEUCAy
LjEgKi8NCj4gPiArIyBkZWZpbmUNCj4gPiBEUF9QQU5FTF9SRVBMQVlfRFNDX0RFQ09ERV9DQVBB
QklMSVRZX0lOX1BSX01BU0sJCQkoMyA8PCAxKQ0KPiANCj4gDQo+IFRoaXMgZG9lc24ndCBzZWVt
IHJpZ2h0LiBEU0MgRGVjb2RlIGNhcCBpcyBvbmx5IGJpdCAjMiwgYXMgcGVyIERQDQo+IDIuMS4N
Cg0KSXQgc2VlbXMgdGhlcmUgaXMgY2hhbmdlIGhlcmUgaW4gRFAyLjFhLiBJIHdpbGwgdXBkYXRl
IGNvbW1lbnQgdG8gRFANCjIuMWENCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KPiANCj4gDQo+
IFJlZ2FyZHMsDQo+IA0KPiBBbmtpdA0KPiANCj4gPiArIyBkZWZpbmUNCj4gPiBEUF9QQU5FTF9S
RVBMQVlfQVNZTkNfVklERU9fVElNSU5HX05PVF9TVVBQT1JURURfSU5fUFIJCQkoMQ0KPiA+IDw8
IDMpDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxfUkVQTEFZX0RTQ19DUkNfT0ZfTVVMVElQ
TEVfU1VTX1NVUFBPUlRFRAkJCSgxIDw8IDQpDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxf
UkVQTEFZX1NVX0dSQU5VTEFSSVRZX1JFUVVJUkVECQkJCSgxIDw8IDUpDQo+ID4gKyMgZGVmaW5l
DQo+ID4gRFBfUEFORUxfUkVQTEFZX1NVX1lfR1JBTlVMQVJJVFlfRVhURU5ERURfQ0FQQUJJTElU
WV9TVVBQT1JURUQJDQo+ID4gCSgxIDw8IDYpDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxf
UkVQTEFZX0xJTktfT0ZGX1NVUFBPUlRFRF9JTl9QUl9BRlRFUl9BREFQVElWRV9TWU5DX1NEUA0K
PiA+IAkoMSA8PCA3KQ0KPiA+IMKgIA0KPiA+IMKgICNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NB
UF9YX0dSQU5VTEFSSVRZCQkweGIyDQo+ID4gwqAgI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQ
X1lfR1JBTlVMQVJJVFkJCTB4YjQNCg0K
