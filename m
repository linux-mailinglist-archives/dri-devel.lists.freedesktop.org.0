Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9996E7FEA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D5210E1C5;
	Wed, 19 Apr 2023 16:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044010E1C1;
 Wed, 19 Apr 2023 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681923407; x=1713459407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x4ipC/+bKa3BGPKFg0dJPiuISZ39La32XdGi4Q8l9Ws=;
 b=LV2HfaOiOFWnXqh69OtcGZ/wL9D0tY3vQEn3hnUGycKjaE6TsfmfCAWH
 iCwZxfbn839tYZkhBwi2GN8LiPAjq9HzD+kHrPmYxBlmut90aAV6SHYf1
 Shj6CdC1hfbWSNjnnKwSUuEx6z+dlWjiGKR2Em0U2uOsilHTMsZBQD6DQ
 +Uis//dt6be9RZJ6Y1FJDFwRT8LVAzQ7oRZCa8dA1kkvwR8ZjGknRSV/3
 OE8vQwE93wGXsDMsjbHNOZy9vx/UkGtkevyXkN5rlKj9IAxSHyCaBqJdG
 SNE1oa0QRNlxm3hgyiRnidqkFqAq+OdMsAPfjB+KqTk08/I+JLaeyAHvP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348254644"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348254644"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694131813"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="694131813"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 19 Apr 2023 09:56:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:56:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:56:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:56:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WurO1gJIhFCPPX63sMli7XLiYP2g+P9c6txsJPULKvWCnX61ebjUgbad/cNeTBmaDshAMHT3DLOuPz+mBDDD31X2Qne3b2n0Gfo/pvbYszqunA8X+4abOEzMWYkTKyFJUkeNuxa8KT/N9F0SZqeWpgI+Spand6Wdm8V5BRIRLRU25/nX9dKLd0nf9bJxjfw2nA9WYudDk51jS33muabqBcsoxw4OE639TXqI+ALPREVmjzQ09K31em+6376rMZ8T8GR/T6T/g4+x/179a9W1R0I/S/8RIp/4FAtIrPFfazkI0H0E9nYY/qQuaudsHiryhGoT7Vtyjka5aXY317awUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4ipC/+bKa3BGPKFg0dJPiuISZ39La32XdGi4Q8l9Ws=;
 b=McocpC+BwVChkoAVDmXHzLh78T5Y+IEU/zcxLu8hqZWD/Kf0S5CmPISUhJHjHhiGc0NESndFX9L2EF8enLvJHvTg77Xpjz4iSAHIu4rTwZaLGumaVZHXc6M7Fpl5kcNALPUldeiuVHE27FR5ft3LJSPI+rjkuQNR0L8FueFjvCZh2GkbmKJk6pqnp7EX/iUN4/xTPRj9j6CEn6I2pTLPcQ1GG2d1x6MKGyJxYbd6p0QOi4mwFJjMSC1RCujy40PnBc/YfRW38bUhAKTMuLkREj36QDOnRE6l9/9dFNTLLAzeaj6ZRc9ZInEAIgDMRSqnioPLFov8CTbgHVUIYQphzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 16:56:28 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:56:28 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set caching
 ioctl
Thread-Topic: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set
 caching ioctl
Thread-Index: AQHZcPUwGPTTADxEY0a1AQjVgX/kgK8ynU6AgAA/Z1A=
Date: Wed, 19 Apr 2023 16:56:28 +0000
Message-ID: <SN6PR11MB25749EBC8F0450324D2793729A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-6-fei.yang@intel.com>
 <bb9f41b6-3925-6e48-adda-228633e5fc5a@intel.com>
In-Reply-To: <bb9f41b6-3925-6e48-adda-228633e5fc5a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|PH0PR11MB7524:EE_
x-ms-office365-filtering-correlation-id: d62cfbea-1e24-4472-edd6-08db40f704a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXdvHYzfOmNL1BCAIjbbpGFE0qJVKpr3j0h5SABP/4pXv8Et4+4e+eet79dwZSWaE5TtQLOxNCI4ccdqE71HoEnkJO5EjN+viEV1oxLXdpxRiZZdKJ31e3LhOk5QS5lTAJ/ywofSvfUbIxXeTIMJznB3HPgidvlI0R2pXHY7PZZBN861LPu6v/BULOd6Bv0u2R+JgxAv+KEYNNqHwOiikOBCX+co2Nie0h4TB1HWRi915evHeRImoMTQWN224VVxQMo92pHosSVzRnclNN2anBWQzq9m++ntIG9Ue1OyNMEjh8qy5wz0mj0m9Ps1AmzwwjoUDUOQxitrmSqpUekT3icCyjban9bboaCxi6Y/1mUxSOj9UpZwTeoHjPOyQ2csVW+fFUgV6cowJw4w3woIbypbYEj8nQuqfDO7tSM3ra06UAMiXdCRyUJDCssmv4kvMTFHEPe2FijMPNW1y09IGIx90Wc7azhk32iOwZ9g8kQDobY0pBnDiBlxZveIyZMEKZJYO6Fphav1IGfmGjqhkJnChz7hlnK2Y4gRA8Td58yn8mj20e8iS/f6lXy1bCwiPXo3rew5S54Gl3kw8V0gcv7pT7b+pkOnJ3/VRFp1jb/zbNcZsv7ok8s/TxV29xkl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(52536014)(38070700005)(8676002)(2906002)(8936002)(5660300002)(41300700001)(122000001)(55016003)(86362001)(33656002)(38100700002)(478600001)(110136005)(6506007)(26005)(53546011)(9686003)(71200400001)(186003)(7696005)(4326008)(76116006)(66446008)(64756008)(66476007)(450100002)(66946007)(66556008)(83380400001)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUVCZzdIMy9QT3dsR0l3SkV2bFIwMlc4SXlaaG80WE55Z2FtcWFqZytIN0tQ?=
 =?utf-8?B?WVV3ZUNSZDhQVk8wdHJ1VEUrOERTMGZhOEhMbzl0R3V3c3dLeEFqZENHUE91?=
 =?utf-8?B?L2tVNjdQZWQwc1o4MjFZc2lJSENUWHpJcU5ZcmpnOXdYMTExUitNYVg3bnV6?=
 =?utf-8?B?TVM2RDBHMUcyQWMwVVFDdHlia0tWQjJZSElqc2Qwbmphem15WFBWVG5lcEx5?=
 =?utf-8?B?NmV1dzQvMEh3K25QakxaNjNESGNLdVNKTEp2alNnUGY3bnhSeDFtWDgyamxj?=
 =?utf-8?B?QTZqTVc2cDJqdlorNE5KZGpJT0VLcnRRQ1VVdTJPRUlZc0xHdlZVaEhjUE1F?=
 =?utf-8?B?RDN6cXg3d3dzWk9oaDBzMFJnZms0ZGltUzA1SEVWOFhNYjFyYmZPdEtFVUV6?=
 =?utf-8?B?OXVIUXRFcWJGUDZBSlllbUF1U0Y1bUVSMEszS3JWbWY0dmVCS3hZWmZ3cEJs?=
 =?utf-8?B?d1VMNGorSWtUZkhQL0tGQjlwR1ExeVFXdHNIdzZXYnVXMmg1YUZ4V3pvd0sy?=
 =?utf-8?B?ZG1BbDVWWEF0Um1YQjFmUlM4dm5SMTAzUzNjSFJNMW5LeUhWNFNWRnRSTXdz?=
 =?utf-8?B?M3oyOEhiR3NSN3VSV1VRNm5Nb25HZTIyY0ZlUXdJYVJsNXZmRUk4UTE1R2xY?=
 =?utf-8?B?MzV3eFYwU3c2YTNBckZnemRPbUwwSCtmc2JJVjhuZmJpNmRteGJxNEF3MkdL?=
 =?utf-8?B?cnBwcmx2Z1NNK21QRjJYdGtDUkp2VjFnelN0R3M5S250Q2JQSnU5ZTJobHBV?=
 =?utf-8?B?d2xHU1ZXV2VnaXZ2eUluY1A4NFF5RzY1YjBXNk5FNkZoWEJxV2RDeWg0QTl4?=
 =?utf-8?B?S0xZQWRZZE1kS0tHRWF5M0xRQlJIOVFubVJZOTk1QWhZQ2FGNE1YMmtFMXpP?=
 =?utf-8?B?cnVLZlp1cS9SN0owZUpMZ1RrR0VsYWJpOXJLMzJUbkZGaDV6M1U2LzN5Y2ZT?=
 =?utf-8?B?QS9GOHplVU5FNlZPekdjekFWSVkrVHVxWFB2cjhBNHRLdlMrTlVSVkQvWTA5?=
 =?utf-8?B?ckxvWktMK2Z1NnVGdFlKd2t4NnBqN1BEMVd2K3VKdVk1NTVweG1SNnk4bSto?=
 =?utf-8?B?QlA2dUVjYjgvRXl6eFAzM0JLclo0Unk4VXdZaENFeWRwWjBkMEx4a0dra1hh?=
 =?utf-8?B?SDlZZGlGcnlLTlJ6aThwWEs3ZDBCLzJlTCtwaCtyRDVOclFYNDY5alBOZGEw?=
 =?utf-8?B?L1lQelAwaXNXaWx3ZkhsUFlsSy9rV3hVRHRQOTVaZ1FCL1loZW1sVmk4OW9S?=
 =?utf-8?B?dWtkQUp0Ri9qMVFTeG5PcHEyU2NLb2hjdC9IWnJWVlUwMmtOTFhWUzhjZW9I?=
 =?utf-8?B?ZS83V0hwWXcyWDdxdFROeUJ2eTA2YUozT3NoOGYwTm05Q1laN1Q3Mzk2a3Vh?=
 =?utf-8?B?S2NORURRRGpjdkZEVEN1eHIvTUtYMmZ1dVlUTHpnMVQrR1FwWWk3YlhBdTBY?=
 =?utf-8?B?K0R5S0pTRUhYRUdiUEN3YW11akowOXlHdjJJdEJ1RHlIeXoyNUYxL1htWTlX?=
 =?utf-8?B?VDJjM1E0anFCNVBLMVRvcE5NU25HN0ZmTXo5aHR2OEZSOWNIZVREeVhsUWxu?=
 =?utf-8?B?T1pNY2pnbllyQm91TmJSZWFkclUzVU5sV1RqOUV6QWc5bnpQNGJvT1VQNFNj?=
 =?utf-8?B?djJYRXY4SVJGdVljZUU3QkVaZENXcmZhbUpGTzdBeld1MVRZbTZVT09mWXNx?=
 =?utf-8?B?ZVVVbFo3TXpqQUFhN3NlK3FDYWVIalJabTYwNVlzL0RXQ0hiR1ZPb3FNL003?=
 =?utf-8?B?MVBSSW40VVo5TFpIZnNDZ3NsMFl1RlJLMlBDQW5Xc2VrQWgxNEkrUlBEMjlU?=
 =?utf-8?B?SW42OGZjdllKNkdieStyV1A1Mlc4ZmhTZnltOG90VWs3MElFd1V0TVVVaGRn?=
 =?utf-8?B?NDdEOFFaNXNCVDlKODFpRERXeTM1OFJQRy9Bd2ZqajY4Y1VISGE3ZDdpd0J1?=
 =?utf-8?B?cEM4aEc4blJUczBqTEVUQzFPM3FnU0Rnazc0ME00SHlPZ05zaEdvNDF4eVBQ?=
 =?utf-8?B?bDRmTWZPVmx1VWRUVG1LUGJxTm5QMW1KQTdpcHJXZDRTM0ZBTllETitqUVRr?=
 =?utf-8?B?aFFiaXdvWk8rNGtYUzRhdjh5OCs5eFdSUjVaUy8vK21wRUF2SitiL0E1SXVW?=
 =?utf-8?Q?L1gU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62cfbea-1e24-4472-edd6-08db40f704a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 16:56:28.2133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUhxv2bJ1n4yXJVtDkiWSqJNF7AXbWbMsWE62cPx3oXWSJxIRy0sfGMKF49Bu5i/PvlyaTVnk/C6ZwAgXlEsgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiAxNy4wNC4yMDIzIDA4OjI1LCBmZWkueWFuZ0BpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9t
OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4NCj4+IFRoZSBkZXNpZ24gaXMgdG8g
a2VlcCBCdWZmZXIgT2JqZWN0J3MgY2FjaGluZyBwb2xpY3kgaW1tdXRhYmxlIHRocm91Z2gNCj4+
IG91dCBpdHMgbGlmZSBjeWNsZS4gVGhpcyBwYXRjaCBlbmRzIHRoZSBzdXBwb3J0IGZvciBzZXQg
Y2FjaGluZyBpb2N0bA0KPj4gZnJvbSBNVEwgb253YXJkLiBXaGlsZSBkb2luZyB0aGF0IHdlIGFs
c28gc2V0IEJPJ3MgdG8gYmUgMS13YXkNCj4+IGNvaGVyZW50IGF0IGNyZWF0aW9uIHRpbWUgYmVj
YXVzZSBHUFUgaXMgbm8gbG9uZ2VyIGF1dG9tYXRpY2FsbHkNCj4+IHNub29waW5nIENQVSBjYWNo
ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0K
Pj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kb21haW4uYyB8
IDMgKysrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jICB8
IDkgKysrKysrKystDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fZG9tYWluLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2RvbWFpbi5jDQo+PiBpbmRleCBkMmQ1YTI0MzAxYjIuLmJiMzU3NWIxNDc5ZiAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kb21haW4uYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jDQo+PiBAQCAtMzM3
LDYgKzMzNyw5IEBAIGludCBpOTE1X2dlbV9zZXRfY2FjaGluZ19pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPj4gICAgICBpZiAoSVNfREdGWChpOTE1KSkNCj4+ICAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+DQo+PiArICAgIGlmIChHUkFQSElDU19WRVJf
RlVMTChpOTE1KSA+PSBJUF9WRVIoMTIsIDcwKSkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVP
UE5PVFNVUFA7DQo+PiArDQo+PiAgICAgIHN3aXRjaCAoYXJncy0+Y2FjaGluZykgew0KPj4gICAg
ICBjYXNlIEk5MTVfQ0FDSElOR19OT05FOg0KPj4gICAgICAgICAgICAgIGxldmVsID0gSTkxNV9D
QUNIRV9OT05FOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9zaG1lbS5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1l
bS5jDQo+PiBpbmRleCAzN2QxZWZjZDNjYTYuLmU2MDJjMzIzODk2YiAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KPj4gQEAgLTYwMSw3ICs2MDEs
MTQgQEAgc3RhdGljIGludCBzaG1lbV9vYmplY3RfaW5pdChzdHJ1Y3QgaW50ZWxfbWVtb3J5X3Jl
Z2lvbiAqbWVtLA0KPj4gICAgICBvYmotPndyaXRlX2RvbWFpbiA9IEk5MTVfR0VNX0RPTUFJTl9D
UFU7DQo+PiAgICAgIG9iai0+cmVhZF9kb21haW5zID0gSTkxNV9HRU1fRE9NQUlOX0NQVTsNCj4+
DQo+PiAtICAgIGlmIChIQVNfTExDKGk5MTUpKQ0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBNVEwg
ZG9lc24ndCBzbm9vcGluZyBDUFUgY2FjaGUgYnkgZGVmYXVsdCBmb3IgR1BVIGFjY2VzcyAobmFt
ZWx5DQo+DQo+IFNvdW5kcyBzdHJhbmdlLCAiZG9lc24ndCBzbm9vcCIgPw0KDQpXaWxsIHVwZGF0
ZS4NCg0KPj4gKyAgICAgKiAxLXdheSBjb2hlcmVuY3kpLiBIb3dldmVyIHNvbWUgVU1EJ3MgYXJl
IGN1cnJlbnRseSBkZXBlbmRpbmcgb24NCj4+ICsgICAgICogdGhhdC4gTWFrZSAxLXdheSBjb2hl
cmVudCB0aGUgZGVmYXVsdCBzZXR0aW5nIGZvciBNVEwuIEEgZm9sbG93DQo+PiArICAgICAqIHVw
IHBhdGNoIHdpbGwgZXh0ZW5kIHRoZSBHRU1fQ1JFQVRFIHVBUEkgdG8gYWxsb3cgVU1EJ3Mgc3Bl
Y2lmeQ0KPj4gKyAgICAgKiBjYWNoaW5nIG1vZGUgYXQgQk8gY3JlYXRpb24gdGltZQ0KPg0KPiBT
aG91bGRuJ3Qgc3VjaCBjb21tZW50IGJlIGEgcGFydCBvZiBwYXRjaCBkZXNjcmlwdGlvbj8gb3Ig
YXQgbGVhc3QgcmVtb3ZlZCBieQ0KPiBmb2xsb3ctdXAgcGF0Y2guDQoNCldpbGwgdXBkYXRlLg0K
DQotRmVpDQoNCj4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50
ZWwuY29tPg0KPg0KPiBSZWdhcmRzDQo+IEFuZHJ6ZWoNCj4NCj4NCj4+ICsgICAgICovDQo+PiAr
ICAgIGlmIChIQVNfTExDKGk5MTUpIHx8IChHUkFQSElDU19WRVJfRlVMTChpOTE1KSA+PSBJUF9W
RVIoMTIsIDcwKSkpDQo+PiAgICAgICAgICAgICAgLyogT24gc29tZSBkZXZpY2VzLCB3ZSBjYW4g
aGF2ZSB0aGUgR1BVIHVzZSB0aGUgTExDICh0aGUgQ1BVDQo+PiAgICAgICAgICAgICAgICogY2Fj
aGUpIGZvciBhYm91dCBhIDEwJSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudA0KPj4gICAgICAgICAg
ICAgICAqIGNvbXBhcmVkIHRvIHVuY2FjaGVkLiAgR3JhcGhpY3MgcmVxdWVzdHMgb3RoZXIgdGhh
bg0K
