Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77B4D0138
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63EE10E012;
	Mon,  7 Mar 2022 14:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750410E012;
 Mon,  7 Mar 2022 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646663369; x=1678199369;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=onbgWenK86GcqGGQrrQ1HHaW5ude74tJsIkJUSzGwuE=;
 b=cQxN+iehuWN9+VP2CIlCLrFS37Yevec0+/6CdxZFj4CmYm41+LP6djTa
 lDjkE8FbQb3P3n/eVI8/08n3gONZ1ZJW2dy1a06JzDGwjr7HJCrDrL8HF
 EFbvrun2+gTTgAtwTnT6CSqF0K6/tNcrAVPm+n35gLyt47YBTC+dLaBsr
 TpDQRd6MtjdLS7GSMoSDCFodD0JsjckHNPvFWaj/jLQrHO1IaenfuDr9U
 LXhw4H+06MX9TT/St8MngXnuYrCrNM0lcuW5DSgJR5MqwdEZYxn5rb245
 EYLX5ZO8QOFodzUf9oO+530jSjhl32H6DgWlL7gVrfHpZ461TELEgmFh3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="279107053"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="279107053"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="537131935"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2022 06:29:28 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 06:29:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 06:29:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 06:29:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 06:29:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkez4XR6+iqFPT2Z8q1QZIyalHbXuPA7uJ9rdX/bYq++UKBdFb1zZZscjo2vHKikb0ygwdahGHb95gLmlFkANpKO1IJWeoEaAWTuKYiOqrWFWEwlhB4p+t0UjaWk/4/jSRXdi96qeduCJ2Fdvbmf+IubcN9nL5OR53Z29+VAgSd7vl6I0uaDfBRPZillPdmBzX52ZqdK/9P1jqGoDO0pzJrlt32+R/jvXoqkJv4EZaSTAO4otJmnddXEjo+CnqfIOycpAo9bHL/luOwdQQGFPt6bs97RjEZ2kpzcf9kZUrI6cBmQmZ0O7u5bCGc3k0Q7LCAYmYzieK+UEOt6/vhESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB6U1gh+OYL5FVlwFFaiU24BwVQjDP+d/YonC+VpwRk=;
 b=nKTQ7LpG7ugu2Q2kPemwvhKMy6usmwFt2HcHoTRFn3sDa/OaoielAwNqJHyW0tbyh8nW+eO5aqpxIl8MMvaDeJ5DK4ebqG+XrPmvhvnI4ZqQfXkiv9h7LcjxvCUwfQpRHa4bljzF3OiaSTPiXmgwiYVX/NrYlns+bbzU4rl5T1Dx93az88PS7ENfAI61jS5Bq/bD0EW9QMvNsG/T6j2IT+mp1BRyWExok5H3n93SmpV+Hww4UDJOA7fWr7yBHzq5fO0kJLrUXbbJAWNSs9vzI5pa4GZucqeCCzcxyGhGkncvo72gdUEqP50AXYl9kcwFhNnuQ31IW1NtI6ocM0ddXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM6PR11MB3338.namprd11.prod.outlook.com (2603:10b6:5:9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.26; Mon, 7 Mar 2022 14:29:22 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::69a8:645d:f48f:1462%5]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:29:22 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/6] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on
 graphics ver 12+
Thread-Topic: [PATCH v3 1/6] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj
 on graphics ver 12+
Thread-Index: AQHYMijoIE188rnsAkafWAQosN/ZBayz+ySA
Date: Mon, 7 Mar 2022 14:29:22 +0000
Message-ID: <c11485b14f0a17e46ec815bcf89139a308395c46.camel@intel.com>
References: <20220307134038.30525-1-ramalingam.c@intel.com>
 <20220307134038.30525-2-ramalingam.c@intel.com>
In-Reply-To: <20220307134038.30525-2-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a9896fb-bc4f-4f2a-e1b2-08da0046dfa2
x-ms-traffictypediagnostic: DM6PR11MB3338:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3338E4DFE0147EA117DA6EAE97089@DM6PR11MB3338.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LMpb+YFvcwXlXM9Z0k9F3HL5C+xFIu1oZZYBOyynSVl93YzpF6/dFEfHuNmAKjVIID+exnC99SdhEI3VM7ayJNtcEfDvtrn4swHO+2xy2RMziF3jIKJi+EBI5D2H/1MN2P9yf9lSA2aieLxE5cUJMezkaE5P9/zZVTvQtZAbEOnnRWGzO2tKuBdJCvF690kSyvhQkHwLqozR0ritrkhaS41cZ8TSqRxJKo+cwrN8+hFLQ9fhKT4f8hEFmXJSUn0UPlzeUyOubDHDpBL2xN/OBHCVRrncFjYte8d6//EWVX+dcsK+P5uWd+xKyaApYd6/i5LGY4hEuDr77CJkhRFXZj/lZ/E/LR+Ar49+dN2bCinK5PqfFypQks35RVufOFn+9jZtAqbOFVFJmsbLKXpOP22qca0rtqVf+OuMTK8zQD2USx0XYEtq+Dnu8sd/pWQSFGxs7Ht5RRHlTSD7VaBU4jpCU+2JEuZV/iiDlkzaZQc4oSMYfK+lPmBFA6J3FIkuSsUg+fFt651DiKQwDq06tmfncfsaxz4BVYKNB4usdgr7QcuiJn1cmmaeybEtHQO8ll9zcQ9FbYZzENf0fDhgij8uDAqCH6Z0++d8NpRJ7TWVPLotnNOd0tC0xV1uqJVzur7khDeX+wZ7YG0Mh/MjLzZTCTF5CPnDJeaamP3QUn3XQTLS5L486rNDYBfJyNd7o71D9dUhcP6YgeQeJFPTag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(64756008)(66446008)(66556008)(66476007)(91956017)(4326008)(38070700005)(122000001)(186003)(6506007)(71200400001)(8676002)(6512007)(508600001)(66946007)(110136005)(54906003)(316002)(83380400001)(6486002)(2616005)(86362001)(26005)(38100700002)(5660300002)(36756003)(2906002)(8936002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SitLaFU1TWJTWi9PWnVsVEpzSzJqVEVBYTZoM2VIZ3BCV0QrcHRNM0pTd1BN?=
 =?utf-8?B?Y1BCczBkZDRQK09MQ2ZqVzdRYlg2M0wyYkZiVUNVbkZpWkRYRG1VV3hHNStD?=
 =?utf-8?B?a0NIR28zMk05YzlIdmp5cXBGWkZpMi9WMmdVUnBGbzRMN2xVWHNuRUtldGw0?=
 =?utf-8?B?M2dDRzUwWU54a0VGYWdlUk1jRXVPamhDWUpVUDRodzNrS2N1T1ZlQUppTFlQ?=
 =?utf-8?B?OEdvZlBKY0RROHNmdjlYQ21OQXloL3pVNGVoS1NCeTlHQ0VWblZXeHFWUFVI?=
 =?utf-8?B?NmNkMmlpWlBqUFFENzhjUXZWckcya2s2RDViUHdjZ09tZTdlY3FVZ2NtQjdK?=
 =?utf-8?B?UVZYbnlWRndYOEtqdXRwUHFxZjZ2bXpKRjh4K3k3WG5ocENjR3oxMTFOTG5h?=
 =?utf-8?B?cWxZclVmSnVyMEFEL3NkaDRyNFg0NFZ1SytvS0hvNHBjK0dZYWlqZGQ2WVE0?=
 =?utf-8?B?ZGt0bHRaRTdOVjAyTEtpUTYzSHMrcEsxR1BFb2pnb1U1eGk2NEcra21veGFS?=
 =?utf-8?B?UWNNSm9iUWZZRDA5aVJQbno5NFZVSThGZ0JvTnJTVFpjbitrQmRadEJpWnRP?=
 =?utf-8?B?RndlK1l6bCtoQmhKS2RGRENtT21pSTcvYzZTNzQ4MVgwcmd3Y1ZrZGNpR1BL?=
 =?utf-8?B?NTlzNlpwS05mdVJGS0hhaXdlWWRPTUY0ZFZrQkVZVno2aVhpaGpVVFBZWnh2?=
 =?utf-8?B?eFJYemZmWDdMV3AvS0tNQXFoc2haL0YrMDI1RFRMS0w3SzNlNWx4RGJkN1lm?=
 =?utf-8?B?bE90ZFZIRzlNQkdpak9ESHN2K29ISE5rMGF0aUlVZUMvV1VBbzVMc1haVzFr?=
 =?utf-8?B?VjZmNkFYZmliNzdXdEIvRU9QbzZRMzVtdUI1cmZnNlQzMURKUmhmbVRxb1ZW?=
 =?utf-8?B?VGFNb2IxUTRuNm9kVWZUYXl3Wkl6b3IwWnRhTUtsTVZQR1VGR2pydHBsd1JL?=
 =?utf-8?B?QzdHOGdhbytvVndVeWxUSnQ0azU4a0xvSnZDOEhqUlZHRlF0V3N4Q2xZVDZs?=
 =?utf-8?B?WXV0YlJ3REdMdnNQdEYzUkpsODEzenBCUm1jQ2xvcDAzM3gxemxRTWxXM24x?=
 =?utf-8?B?MnREVVRLRzNEbFFiQ0IybXlPYUsrL0lEa2QvZS9hWjBBQWxwSU9OMXBTVEJn?=
 =?utf-8?B?WjNOYW5peTM4SW9aSXNNcUxPRTcvNFBIc0E4NXJkRGM4L2syNXkyMnE5dHlj?=
 =?utf-8?B?VEYyU2N3VjVzNk1BL2pTQSttY1ZNRmc1WEpPZXFtbWRtRUNwaVY1aldtT0RM?=
 =?utf-8?B?TVVNbnNOU1lMNzRkVVU4aG9jUDRRVmJDeDZrbDk1am1xRnlXNnVhL0U4dzMr?=
 =?utf-8?B?bDJCblN1Vk1wTUhnVmpIMFRmUTFvSmRYS2FGTHR4aUZ0MDJRT0l3djJNQUdV?=
 =?utf-8?B?N1lpK0E1VTFlNnA2dDBkM05OMm15R0crK09MdU5pTlZEdlR6eXpHYnRNUjVV?=
 =?utf-8?B?VVdybWx6Y0MydGk4RlpkUlNxSXQwUDZIVmExVDZwb24wRGgwc3ZCUVBGa3Ju?=
 =?utf-8?B?Y1BKTDQ3S05CSk9YcTZwL0hzY21LZTVxd2QvdzhYVVhML1BDT3ZsZFBEcVlu?=
 =?utf-8?B?akJkd0cwL0NUb1dYM0NDRnlrLzhvN0RYcUh2cW5IRXdYL3FNeCt3bUlDREFx?=
 =?utf-8?B?MFd2dXk2ZDhjSDQ4Z2I3d2JHNlNSaXVjNldxS0JsaHpja0IwaWo4WUVGV2E1?=
 =?utf-8?B?a05ONjdkbjVCK3J0TGhMOXJLcHh0cmMrOHJHb1FoWlBIODYxTitzWlZmQjR5?=
 =?utf-8?B?VnZwSlVVT0IxK2cvdWNCU2JCN2MzaDJEblk4QVBWWklkaE4rTEJyTzcvMENF?=
 =?utf-8?B?RUsvdHVQblNPTVoyVXJ1ZTA4bnlRODhOemIzQ3o3NWY5TitWK0U5UHdFeG1t?=
 =?utf-8?B?MlBzSTN1SmUvUE5YWlZQckwrR2NHMmhEYytRUjdXZi9Zait1ei85a2tDc2Jj?=
 =?utf-8?B?d1RSQ1phK2lLRXR3bG5FaFBuUjNxNUk3ZW5CUXZhMTRtZURrcDRCWmJKcklk?=
 =?utf-8?B?M2xzWko0U2RoM2dQVTVqd2lWSGVOWGxUMUw1MG4xeVFrcGlnT21BSVliZ25i?=
 =?utf-8?B?MHY2SDE2RlIvWS9sSksweWo4WGFSRURsOExCR1dGL1B4TzFOOWw3Q2l4UlN4?=
 =?utf-8?B?NDNLaFhTS1dycjhGamg3ZDUycXBnbm1NUFBOem9vTnYrcUxIQVFidnhEM2xO?=
 =?utf-8?B?WnorRUVGOC84SFFmSE9aL3FNUWwreE1UeEZuU0J1OW1JUS82ekNtZ3NVWmhy?=
 =?utf-8?Q?zH2HM7EvkONkpDZylxfU2hVyWNoqjYOJkhdTPc/418=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9820099B6DC6B84682117BC8EDC36DCB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9896fb-bc4f-4f2a-e1b2-08da0046dfa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 14:29:22.4957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vivkj4R//CDonWujso4kj4B4UbHI9VhIXnCr0TP/Fj4br2QDwPWZjVUWzpIRU0rb6scbxewAo8l5inVAIuUMaRwPPe+6qxcSqbEz/AQrr98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3338
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJhbS4KClR5cG8gaW4gcGF0Y2ggdGl0bGUgRkFTUi9GQVNUCgpPbiBNb24sIDIwMjItMDMt
MDcgYXQgMTk6MTAgKzA1MzAsIFJhbWFsaW5nYW0gQyB3cm90ZToKPiBYWV9GQVNUX0NPTE9SX0JM
VCBjbWQgaXMgZmFzdGVyIHRoYW4gdGhlIG9sZGVyIFhZX0NPTE9SX0JMVC4gSGVuY2UKPiBmb3IK
PiBjbGVhcmluZyAoWmVybyBvdXQpIHRoZSBwYWdlcyBvZiB0aGUgbmV3bHkgYWxsb2NhdGVkIG9i
amVjdCwgZmFzdGVyCj4gY21kCj4gaXMgdXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGlu
Z2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9ncHVfY29tbWFuZHMuaCB8wqAgNSArKwo+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jwqDCoMKgwqDCoCB8IDUxICsrKysrKysrKysrKysrKysr
LQo+IC0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dwdV9j
b21tYW5kcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFuZHMu
aAo+IGluZGV4IGQxMTJmZmQ1NjQxOC4uOTI1ZTU1YjZhOTRmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dwdV9jb21tYW5kcy5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3B1X2NvbW1hbmRzLmgKPiBAQCAtMjA1LDYgKzIwNSwxMSBA
QAo+IMKgCj4gwqAjZGVmaW5lIENPTE9SX0JMVF9DTUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAoMiA8PCAyOSB8IDB4NDAgPDwgMjIgfCAoNSAtCj4gMikpCj4gwqAjZGVmaW5l
IFhZX0NPTE9SX0JMVF9DTUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMiA8PCAyOSB8
IDB4NTAgPDwgMjIpCj4gKyNkZWZpbmUgWFlfRkFTVF9DT0xPUl9CTFRfQ01EwqDCoMKgwqDCoMKg
wqDCoMKgwqAoMiA8PCAyOSB8IDB4NDQgPDwgMjIpCj4gKyNkZWZpbmXCoMKgIFhZX0ZBU1RfQ09M
T1JfQkxUX0RFUFRIXzMywqDCoMKgKDIgPDwgMTkpCj4gKyNkZWZpbmXCoMKgIFhZX0ZBU1RfQ09M
T1JfQkxUX0RXwqDCoMKgwqDCoMKgwqDCoMKgMTYKPiArI2RlZmluZcKgwqAgWFlfRkFTVF9DT0xP
Ul9CTFRfTU9DU19NQVNLwqDCoEdFTk1BU0soMjcsIDIxKQo+ICsjZGVmaW5lwqDCoCBYWV9GQVNU
X0NPTE9SX0JMVF9NRU1fVFlQRV9TSElGVCAzMQo+IMKgI2RlZmluZSBTUkNfQ09QWV9CTFRfQ01E
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDIgPDwgMjkgfCAweDQzIDw8IDIyKQo+IMKg
I2RlZmluZSBHRU45X1hZX0ZBU1RfQ09QWV9CTFRfQ01EwqDCoMKgwqDCoMKgKDIgPDwgMjkgfCAw
eDQyIDw8IDIyKQo+IMKgI2RlZmluZSBYWV9TUkNfQ09QWV9CTFRfQ01EwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgKDIgPDwgMjkgfCAweDUzIDw8IDIyKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9taWdyYXRlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX21pZ3JhdGUuYwo+IGluZGV4IDIwNDQ0ZDZjZWIzYy4uY2I2OGY3YmY2YjI4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+IEBAIC0xNiw2ICsxNiw4
IEBAIHN0cnVjdCBpbnNlcnRfcHRlX2RhdGEgewo+IMKgfTsKPiDCoAo+IMKgI2RlZmluZSBDSFVO
S19TWiBTWl84TSAvKiB+MW1zIGF0IDhHaUIvcyBwcmVlbXB0aW9uIGRlbGF5ICovCj4gKyNkZWZp
bmUgR0VUX0NDU19CWVRFUyhpOTE1LCBzaXplKcKgwqDCoMKgwqDCoChIQVNfRkxBVF9DQ1MoaTkx
NSkgPyBcCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBESVZfUk9VTkRfVVAoc2l6ZSwKPiBOVU1f
QllURVNfUEVSX0NDU19CWVRFKSA6IDApCj4gwqAKPiDCoHN0YXRpYyBib29sIGVuZ2luZV9zdXBw
b3J0c19taWdyYXRpb24oc3RydWN0IGludGVsX2VuZ2luZV9jcwo+ICplbmdpbmUpCj4gwqB7Cj4g
QEAgLTYxNCwyMCArNjE2LDU2IEBAIGludGVsX2NvbnRleHRfbWlncmF0ZV9jb3B5KHN0cnVjdCBp
bnRlbF9jb250ZXh0Cj4gKmNlLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+
IMKgCj4gLXN0YXRpYyBpbnQgZW1pdF9jbGVhcihzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSwgdTY0
IG9mZnNldCwgaW50IHNpemUsCj4gdTMyIHZhbHVlKQo+ICtzdGF0aWMgaW50IGVtaXRfY2xlYXIo
c3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsIHU2NCBvZmZzZXQsIGludCBzaXplLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB2YWx1ZSwgYm9vbCBpc19sbWVt
KQo+IMKgewo+IC3CoMKgwqDCoMKgwqDCoGNvbnN0IGludCB2ZXIgPSBHUkFQSElDU19WRVIocnEt
PmVuZ2luZS0+aTkxNSk7Cj4gLcKgwqDCoMKgwqDCoMKgdTMyICpjczsKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHJxLT5lbmdpbmUtPmk5MTU7Cj4gK8Kg
wqDCoMKgwqDCoMKgaW50IG1vY3MgPSBycS0+ZW5naW5lLT5ndC0+bW9jcy51Y19pbmRleCA8PCAx
Owo+ICvCoMKgwqDCoMKgwqDCoGNvbnN0IGludCB2ZXIgPSBHUkFQSElDU19WRVIoaTkxNSk7Cj4g
K8KgwqDCoMKgwqDCoMKgdTMyICpjcywgbWVtX3R5cGUgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoGlu
dCByaW5nX3N6Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoEdFTV9CVUdfT04oc2l6ZSA+PiBQQUdF
X1NISUZUID4gUzE2X01BWCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgb2Zmc2V0ICs9ICh1NjQp
cnEtPmVuZ2luZS0+aW5zdGFuY2UgPDwgMzI7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBjcyA9IGlu
dGVsX3JpbmdfYmVnaW4ocnEsIHZlciA+PSA4ID8gOCA6IDYpOwo+ICvCoMKgwqDCoMKgwqDCoGlm
ICh2ZXIgPj0gMTIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpbmdfc3ogPSAx
NjsKCk5vdGluZyB0aGF0IERHMSBkb2Vzbid0IHVzZSBtb3JlIHRoYW4gMTEgZHdvcmRzPyBEb2Vz
bid0IG1hdHRlciBtdWNoIEkKZ3Vlc3MgaWYgd2UgcGFkIHdpdGggTk9QLgoKPiArwqDCoMKgwqDC
oMKgwqBlbHNlIGlmICh2ZXIgPj0gOCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmluZ19zeiA9IDg7Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByaW5nX3N6ID0gNjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpc19sbWVt
KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1fdHlwZSA9IDEgPDwgWFlfRkFT
VF9DT0xPUl9CTFRfTUVNX1RZUEVfU0hJRlQ7CgpTaG91bGQgd2UgdXNlIHRoZSBNRU1fVFlQRSBt
YWNyb3Mgc28gaXQgYmVjb21lcyBjbGVhcmVyIHdoYXQgd2UncmUKZG9pbmc/IAoKQWxzbyBkb2Vz
IERHMSBzdXBwb3J0IHRoZSBtb2NzIGFuZCBtZW1fdHlwZSBmaWVsZHM/IElmIG5vdCBzaG91bGQg
d2UKc2V0IHRoZXNlIHRvIDAgZm9yIHJlbGV2YW50IGhhcmR3YXJlPwoKPiArCj4gK8KgwqDCoMKg
wqDCoMKgY3MgPSBpbnRlbF9yaW5nX2JlZ2luKHJxLCByaW5nX3N6KTsKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKElTX0VSUihjcykpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gUFRSX0VSUihjcyk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAodmVyID49IDgpIHsKPiAr
wqDCoMKgwqDCoMKgwqBpZiAodmVyID49IDEyKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCpjcysrID0gWFlfRkFTVF9DT0xPUl9CTFRfQ01EIHwKPiBYWV9GQVNUX0NPTE9SX0JM
VF9ERVBUSF8zMiB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAoWFlfRkFTVF9DT0xPUl9CTFRfRFcgLSAyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgKmNzKysgPSBGSUVMRF9QUkVQKFhZX0ZBU1RfQ09MT1JfQkxUX01PQ1NfTUFTSywg
bW9jcykKPiB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAoUEFHRV9TSVpFIC0gMSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysr
ID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBzaXplID4+IFBB
R0VfU0hJRlQgPDwgMTYgfCBQQUdFX1NJWkUgLyA0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAqY3MrKyA9IGxvd2VyXzMyX2JpdHMob2Zmc2V0KTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgKmNzKysgPSB1cHBlcl8zMl9iaXRzKG9mZnNldCk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gbWVtX3R5cGU7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC8qIEJHNyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAqY3MrKyA9IHZhbHVlOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9
IDA7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gMDsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAvKiBCRzExICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpj
cysrID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSAwOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBCRzEzICovCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCpjcysrID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgKmNzKysgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IDA7
Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmICh2ZXIgPj0gOCkgewo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBYWV9DT0xPUl9CTFRfQ01EIHwgQkxUX1dSSVRFX1JH
QkEgfCAoNyAtIDIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBC
TFRfREVQVEhfMzIgfCBCTFRfUk9QX0NPTE9SX0NPUFkgfAo+IFBBR0VfU0laRTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gMDsKPiBAQCAtNjQ1LDcgKzY4Myw2IEBA
IHN0YXRpYyBpbnQgZW1pdF9jbGVhcihzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSwKPiB1NjQgb2Zm
c2V0LCBpbnQgc2l6ZSwgdTMyIHZhbHVlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgKmNzKysgPSBsb3dlcl8zMl9iaXRzKG9mZnNldCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAqY3MrKyA9IHZhbHVlOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gLQo+IMKgwqDC
oMKgwqDCoMKgwqBpbnRlbF9yaW5nX2FkdmFuY2UocnEsIGNzKTsKPiDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIDA7Cj4gwqB9Cj4gQEAgLTcxMSw3ICs3NDgsNyBAQCBpbnRlbF9jb250ZXh0X21pZ3Jh
dGVfY2xlYXIoc3RydWN0IGludGVsX2NvbnRleHQKPiAqY2UsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0X3JxOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGVyciA9IGVtaXRfY2xlYXIocnEsIG9mZnNldCwgbGVuLCB2YWx1ZSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IGVtaXRfY2xlYXIocnEsIG9mZnNldCwg
bGVuLCB2YWx1ZSwgaXNfbG1lbSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC8qIEFyYml0cmF0aW9uIGlzIHJlLWVuYWJsZWQgYmV0d2VlbiByZXF1ZXN0cy4gKi8KPiDC
oG91dF9ycToKCk90aGVyd2lzZSBsb29rcyBnb29kLgoKL1Rob21hcwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJ
bnRlbCBTd2VkZW4gQUIKUmVnaXN0ZXJlZCBPZmZpY2U6IElzYWZqb3Jkc2dhdGFuIDMwQiwgMTY0
IDQwIEtpc3RhLCBTdG9ja2hvbG0sIFN3ZWRlbgpSZWdpc3RyYXRpb24gTnVtYmVyOiA1NTYxODkt
NjAyNwoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRl
bnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNv
bnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==

