Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E86E7F18
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6515D10E1BC;
	Wed, 19 Apr 2023 16:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58610E078;
 Wed, 19 Apr 2023 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681920238; x=1713456238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CyISu1DV/5UqKo9+iY9yiIa0LZln3fySe5tk7Peff4c=;
 b=gh5ziopgoD72jIAe1xyD0Ho7L4WmpQ47stgGqyC2zXyqOnJ4/x584s7b
 y4mzaMQ02TsqW2sRZjSGlowBEc3AbEHoeRP1phdpkke1YD2dillB40jG0
 CppbY0gJoWRC3V2Iq/bGnbmP3dMEYHNUu4U9DsOnNOlQPVb4bj1gUBpCA
 or3SAJr2ltq89O/0scVvX8SfR65Yp8S9FuLed6C9F9aQsJ0coy+WNnphF
 tqYaeNAPQgpvGrZA87QVirTiTs+asWim6N1gGxTz/aGncg1bBqFJYlkXE
 rDgaJfnItt1L5TJAAXp4r7Mg+kC8+ex1Azdl7TCOPUfeMy9H2lbKyAsWo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334301466"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334301466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="721983414"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="721983414"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 09:03:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:03:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:03:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:03:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDd4WYRUfItZsniTJYu0TLgEFJOHuZwT1iDsZHdrDng7P52ZbJK/SntYBm2GXqqQpN2wTiENCm/BNQL3eOHJu6zofPm1pfjnR+9RcJy4T6qMGkot9Qpt2PTRfI86wE9Qw9+3jSK29G1DUmmjEX9NcS+mdHhT1ZjJEWNBQg6fcrv5V2RNoTz3F6Ixxqbu9+o2a5WsXu0rUL0ohv8hXKioUpmsE2FUzuTwGiYFzGFlnCTsfBW2/Y8d7ocIaqwajzbDarighFF+NYrTciKT3sK1OA0W/RGJeDq+z5dtPLH4ln2CK6qu7dC2sn8L9AUyKCzWxLKtzxXl0UIQoi2/IoBJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyISu1DV/5UqKo9+iY9yiIa0LZln3fySe5tk7Peff4c=;
 b=mMbbJVPUEr6CsDpna9bkKrM5/FWgFfBqKcW+Z8mQ6QiOrYtxX9TcFRBgwNnudnU/ZsVh3iSHS4pyHn+2FSyDgeGBdkLiPiD5jaD7v930o/g34/5Tgm5RKmAMrLr7sPlB5CmERgQZsOBwO6hIRPk5fXEcZVts7GL6WfN308kHDfoCrmk1coBnBwRYEWgdZFeU2Ss23P2wxbeCF6gYmu3mYHQFAHmN8TdhYwk5rF9xdXV4zXyXNFoqO4mfuZ9Es+4ZdIbcuhiWG4QgmY42PfJacOVTMc0XazDRW07DE6jSlC+IMf9G+HiLPTEgTClyR6LPEfkvYfr0uJ/UKRWILCtlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 16:03:50 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:03:50 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZcPU8pV7LJrvK6E+GLGIe52dGEa8yrFIAgAAiqpA=
Date: Wed, 19 Apr 2023 16:03:50 +0000
Message-ID: <SN6PR11MB25744F6D7DE1AF772278D0B09A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-3-fei.yang@intel.com>
 <95df8360-99ef-2184-401b-f10873de0fe5@intel.com>
In-Reply-To: <95df8360-99ef-2184-401b-f10873de0fe5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|PH0PR11MB4792:EE_
x-ms-office365-filtering-correlation-id: 0da0fbce-b8fc-4116-e579-08db40efaa62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGQkoGAAaRXknfyjZZ2+odFDnFr+vA923Plb8YakC8FukhynqLFxVRABtYOMbRNBFlj3W79Lq+yzdc2OstwhQlaFkJVf4o9yy2+sIDOVBaGgxGypMGPMww+37jnRDjelDyJ2VsxjeRYcsXPXR5xbkSwwGtvAD3AYv783nILLTHzjU2rbTtXYOOfoXOjH76A4lRiVTdT2TGyE2WsSfgJS6bklIjSDBbyMBDfqA5kyRRkg6/13bmYoccvaePjK45YAd4Fo640xhJzr1Js5CsF5xVArqGiiPFPn1DdU8B4Nyz9dBFJwJlrr+HkfGEWFdSfjUPcUjcBtkYLyCw+GKp96WpK4UDKSbUc0Tzo/Z+7afusd6lhW6XpW/bChPE4sGIpZ2ZT0hei5fgjpEni8unzx4wweHXsklBqMkM7aCDIKz9UmlwaBmeWPiVeTcpQHkv49njqmAHxw+Zz1eZP38TDw/E371Mk6BicErGlnEk+Q2EXMKDTssh26bkMgdqbjPZYK9wKRzq272NAXkVZWq0IINRw6QSCc8cYD4mnLlM2/hpVnZaxcPcgoYG+Px70xQyxkZSbW15hTM5fI5B0GgNG07ZJ3ZXjMkKGEr3RnNgjWFeQv8XVMX9WU2vjAIwrCYInA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(38070700005)(2906002)(8936002)(38100700002)(8676002)(5660300002)(52536014)(33656002)(86362001)(55016003)(7696005)(71200400001)(9686003)(6506007)(26005)(110136005)(54906003)(478600001)(83380400001)(186003)(316002)(4326008)(82960400001)(66556008)(66476007)(64756008)(66446008)(450100002)(76116006)(66946007)(122000001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE5UM2hTaW5UaERUQy9CMkdIbDlwWlVwR3BrY1daUll5amdOK1dja1IvWDB4?=
 =?utf-8?B?NXBYK1pVYWxpSUxNaDhuK1B2SDZPS2JRY3F6UGgwR244b2pZZlcxRUFkblZH?=
 =?utf-8?B?YTNFbmpIMUh6R3J4UGNCYkVVeUlya0hPcmFwVkxQelM5VElMK1BqMHpxRWUw?=
 =?utf-8?B?b2FkcDVuZFNmRUIrdXJlQzZtTEozMG9nNncvV09nYzg1eDB4L08wT0Y0aUw1?=
 =?utf-8?B?aXdETHdGK3NPVXdZNll3bVI2WXBBeDFCYWZoeG0wZkNMTS8yOU9jdDJ5R3ZI?=
 =?utf-8?B?V1c3TTU0U3RUV0VsdXR4SmhtTFZ2eUdyS1hYaWUwTHJrQWhOL2F3eUltb0Z6?=
 =?utf-8?B?T2ZWa2t1WkM2a3AwOFpqRWl5b1VoU21NQ1pxYVdvTzIvRTNlVGZacjRqYkpl?=
 =?utf-8?B?cm5tdjBCaDVid2dmVVlOVVFiZ0huM096WHZRR3B3MlBpZlNuZmZvN1pDZ3l4?=
 =?utf-8?B?T0pyQ1Z5V1YwV1h5d2svKzhIbGFqUWRMREdNUDd6QjhpWTA1M0lvTk1YdGhn?=
 =?utf-8?B?dDdoUUx0cmtLSVpRZzhUcEo3djhvTklkUVppYkpkb2VQT0llek9QSGliMnYr?=
 =?utf-8?B?RnlrQ2ZDWkV2cXJkOWE1L3E2SlNNY0RocXpMYnlFM2xrUzJ6WWdBams5SUt5?=
 =?utf-8?B?dlZSc1lxcDUzeVlrWi9GUUkzT1NjUzM0MS9PVGJRWXFGSXFnL1pQOUtVUitF?=
 =?utf-8?B?NmVoRjNOcldodDl4aXNQd1p5QnhOc01uQ3gxOUpaNXRYbHBsSGJmTU4xSkxK?=
 =?utf-8?B?cmNtZnVXWXZuaVo2ZitwdkkzaVJRamx4Yis3SDVLOU5rbTBteEVTNHExZHBN?=
 =?utf-8?B?L1ZnaTlmZWZFZGxiUlo4ZG1SbmJNZk5MQWl5NWRkS0oxQnRtRUpwcnlJUndx?=
 =?utf-8?B?TnJvSVkyak1xcUw4VzZOS1VTbVJXS051bmwrL0RRY0tCUVZibElvTE9IbWdC?=
 =?utf-8?B?clkzdzBhUFlpUDkwZkhEUTV2SFRXSG1QTk9jNHVaVElXTlVocUtCdFFYUDRJ?=
 =?utf-8?B?U2hTS1pDVDdCZjFacXk1bTFCT2JiVUhlNGZmaVZWZjNoTlhadlVQaDAyK091?=
 =?utf-8?B?enorY290OURMa080RXM4aERqbGlNeVN4K1Nub0k0MUprMXM4eHdrUDBNYjhh?=
 =?utf-8?B?SFBkeFpNcmpFVUV2M2RLL21OZWpRVHJUanU1M1JZUWQ1bElsTVFuZEttMFVu?=
 =?utf-8?B?ZUN6cTFuY1Z2TFVmaXg3TjZZY0drY1c1ZVBpaXlNT3lxbTdFSi9EMzlYdTFH?=
 =?utf-8?B?RUkvTndweFBPSWliZHg0RXNxRGFQbi9yLzBUemcrei9pOE1TUWgyQ3l5OTRN?=
 =?utf-8?B?K2FQRU9CdmlYRTZCV3ZsK2JhbWNTRlEyOXFTNjdYZlF6aHZDaVduK0g1eW5K?=
 =?utf-8?B?TnUxNCt6Z3FiaFhZMnBWYWdJckU0aVZkMEVvVHNMOUpBNisvcG5waXF2cGdu?=
 =?utf-8?B?dEV5UE1tM21MN3VEaWR3eTEwZHpKMEgvYWlNOW5YbzhwQlUxTURaekVZUTJk?=
 =?utf-8?B?eDB2Z0d2N1h4VHMzQ00rNFB2b3VpemFTNU9XeWtQM29zL0o4NVZONWFieDlK?=
 =?utf-8?B?aGFWQURtNHlvUVc3WHZMS1BmS0Zidmw0KzFsalNxaU1GcVNRTnRvQVVRNGhS?=
 =?utf-8?B?WU92T1JDdkVDWUxkWGhhZ0ZJYjFSaGl2OGtNbDZxbjg3MlRqL3psMktUK01X?=
 =?utf-8?B?a1Y4MFBZZktQekhTeXBoNGF2RjlMZFpNYzUwYXkvdlllOC9lZHY0aC92aXcv?=
 =?utf-8?B?RHNhNUtUUjgrYkdVVUxycDJXTzB3NGlqZk9TVC9GaDVuTDJrMGp3UUVQMzkr?=
 =?utf-8?B?bi80Yy82YTlUdUhEWlVRVFFhK29rRW50bUNIYU5meTIvbVZ4d1ZBdldOaUEz?=
 =?utf-8?B?clo2dkpUSGdOS0tGZmpvekZSVFVFaEN4MnFNYVI2MjJCSlovNlN5N1JVMGRI?=
 =?utf-8?B?UzBKUCtHZEFkMHhxdlk5NUNjL1llZUsvNmlIK1hDRTRDeTFCWXRrR0o5cFBK?=
 =?utf-8?B?b1lRUG9wZFRRNFJCNlByRituQlMyc01qaUJEVWgydkNWYjc4YStZeUhWQ25V?=
 =?utf-8?B?REIxM0NaM0RqRWNKbUdDSDE3d0ZuNXh6UDA4V0xIdlhUV29qQkdaV3Fkb3Zs?=
 =?utf-8?Q?cfKo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da0fbce-b8fc-4116-e579-08db40efaa62
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 16:03:50.2793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tlr2ZIAVilIcaZTj9/9rBskC0olgJXxmEHnR04L/YpV9/jtiu1Uu6NSy+2+wskEb1MC48KB2gm3UpHeS3CNEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gdm9pZCBzZXR1cF9wcml2YXRlX3BhdChzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQ0KPj4NCj4+ICAg
ICAgR0VNX0JVR19PTihHUkFQSElDU19WRVIoaTkxNSkgPCA4KTsNCj4+DQo+PiAtICAgIGlmIChH
UkFQSElDU19WRVJfRlVMTChpOTE1KSA+PSBJUF9WRVIoMTIsIDUwKSkNCj4+IC0gICAgICAgICAg
ICB4ZWhwX3NldHVwX3ByaXZhdGVfcHBhdChndCk7DQo+PiAtICAgIGVsc2UgaWYgKEdSQVBISUNT
X1ZFUihpOTE1KSA+PSAxMikNCj4+IC0gICAgICAgICAgICB0Z2xfc2V0dXBfcHJpdmF0ZV9wcGF0
KHVuY29yZSk7DQo+PiAtICAgIGVsc2UgaWYgKEdSQVBISUNTX1ZFUihpOTE1KSA+PSAxMSkNCj4+
IC0gICAgICAgICAgICBpY2xfc2V0dXBfcHJpdmF0ZV9wcGF0KHVuY29yZSk7DQo+PiAtICAgIGVs
c2UgaWYgKElTX0NIRVJSWVZJRVcoaTkxNSkgfHwgSVNfR0VOOV9MUChpOTE1KSkNCj4+IC0gICAg
ICAgICAgICBjaHZfc2V0dXBfcHJpdmF0ZV9wcGF0KHVuY29yZSk7DQo+PiAtICAgIGVsc2UNCj4+
IC0gICAgICAgICAgICBiZHdfc2V0dXBfcHJpdmF0ZV9wcGF0KHVuY29yZSk7DQo+PiArICAgIGlm
IChndC0+dHlwZSA9PSBHVF9NRURJQSkgew0KPj4gKyAgICAgICAgICAgIHhlbHBtcF9zZXR1cF9w
cml2YXRlX3BwYXQoZ3QtPnVuY29yZSk7DQo+PiArICAgIH0gZWxzZSB7DQo+PiArICAgICAgICAg
ICAgaWYgKEdSQVBISUNTX1ZFUl9GVUxMKGk5MTUpID49IElQX1ZFUigxMiwgNzApKQ0KPg0KPiBZ
b3UgY291bGQganVzdCB1c2UgImVsc2UgaWYiIGhlcmUgdG8gYXZvaWQgaW5kZW5kYXRpb24sIGZv
ciBub3cgaXQgd291bGQgd29yaywgdXAgdG8geW91Lg0KDQpXaWxsIHVwZGF0ZS4NCg0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgeGVscGdfc2V0dXBfcHJpdmF0ZV9wcGF0KGd0KTsNCj4+ICsgICAg
ICAgICAgICBlbHNlIGlmIChHUkFQSElDU19WRVJfRlVMTChpOTE1KSA+PSBJUF9WRVIoMTIsIDUw
KSkNCj4+ICsgICAgICAgICAgICAgICAgICAgIHhlaHBfc2V0dXBfcHJpdmF0ZV9wcGF0KGd0KTsN
Cj4+ICsgICAgICAgICAgICBlbHNlIGlmIChHUkFQSElDU19WRVIoaTkxNSkgPj0gMTIpDQo+PiAr
ICAgICAgICAgICAgICAgICAgICB0Z2xfc2V0dXBfcHJpdmF0ZV9wcGF0KHVuY29yZSk7DQo+PiAr
ICAgICAgICAgICAgZWxzZSBpZiAoR1JBUEhJQ1NfVkVSKGk5MTUpID49IDExKQ0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgaWNsX3NldHVwX3ByaXZhdGVfcHBhdCh1bmNvcmUpOw0KPj4gKyAgICAg
ICAgICAgIGVsc2UgaWYgKElTX0NIRVJSWVZJRVcoaTkxNSkgfHwgSVNfR0VOOV9MUChpOTE1KSkN
Cj4+ICsgICAgICAgICAgICAgICAgICAgIGNodl9zZXR1cF9wcml2YXRlX3BwYXQodW5jb3JlKTsN
Cj4+ICsgICAgICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgICAgICAgICBiZHdfc2V0dXBf
cHJpdmF0ZV9wcGF0KHVuY29yZSk7DQo+PiArICAgIH0NCj4+ICAgfQ0KLi4uLi4uDQoNCg==
