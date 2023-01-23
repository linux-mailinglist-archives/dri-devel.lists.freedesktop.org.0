Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B125678945
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 22:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D56C10E589;
	Mon, 23 Jan 2023 21:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D68010E588;
 Mon, 23 Jan 2023 21:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674508293; x=1706044293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9mpAQ1BRrKLUeKFKkAnQN8J/4EPT8cUB0Wjv43U7n4E=;
 b=jitZWOEK281R9dybfnmFsjS0M666corDizXkT9nE0odNIuSmW9SDh/EQ
 gsRsI2CrtgRVGvFtRatWNgaEfgRkAYueDig1u+WUY0GYyLmbFazOlBCUq
 8JPy2XXIqVARYjsUJPfZhpLoXoik1szX40DtGDW/9fbd8TBqX5FbpOEPW
 bALHR48Sn6Xg2y/SGSR/yNTyM/ogXCe4iL4Jf/fA9xvBwR1Vkira7Ku9v
 /Dgkzg83b9qKwYvO58WjvKRlf7Dh1RoSg6JmP34C9z6qGhdzsgkl4rkF/
 VeilIsEUgRr4BHaIIVlLt3AUHDsjyPw+Eub1vyqiV9tLOqGsj108WkpRY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390655545"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="390655545"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 13:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725223208"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="725223208"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 13:11:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 13:11:31 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 13:11:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 13:11:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inJI95A71YNluuwx1uO1WiMlXkBjYXCqFSYt5A3xEnx/5svjKqnQSKFu1xE7aB08p1uj14S7vVAIAPdt87noaVJwd29nAGPm60LeLgKKd4XcO4woOvo7B9Reo6G6YnQAuA1LVKJTtMHqzc/fEDSpCBgJWxE+HpnE08I5PZp4URd6+bMrGO25LhhHf9utjEC3cWQDpG0JzdSbgA5Ngrr2kf/UwbrEp793c5FepSIgy3Uqs2OA7C7WXDAHwCZa/dIN494STvr9X/XPF5CR7rj4bUYbz1QVAwVus/KSJiMgi4citvwsg0WQndjobzn2YT1uO130au54/gV+hAQ7ERmZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mpAQ1BRrKLUeKFKkAnQN8J/4EPT8cUB0Wjv43U7n4E=;
 b=bZrnAfUPBYoclDTw3zEfkpdu0izw0pEbWKd/VdojgLffAjMqCmTHErOV7IAjoh73lRz0afVHz9f67kgq9EJGgZxygrohd9sHgk812pYwJamv/AKxLUGgB+0dDPOLnMQHpwfTzuumzeFXIb/4gw1H476uzwP6a2Dp05mkVU/IfMzpUjS2TtO3ReO3QKNtmEHmvuf3oEox+viY0nbhSmIqJmhUCReRD24W08lu1yIrTmNR+UAL1j4aGZEyK3vh5xDqX+hSJ3ZwRwi4t8/9LlajL41jdYVYKJjsuR9x+QCXzDLyLZ9MQdO+00yhsSbPCds+ndkwpLDvDfDpyyff/HG8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Mon, 23 Jan 2023 21:11:29 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 21:11:29 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/9] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Thread-Topic: [PATCH v2 7/9] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Thread-Index: AQHZJgWjWnHwQwuRUEWG0rEtoWmLLK6lB92AgAeKmoA=
Date: Mon, 23 Jan 2023 21:11:29 +0000
Message-ID: <6b5e95af47042348601e6fd3423cceb7d5eaaa7d.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-8-alan.previn.teres.alexis@intel.com>
 <c8b6c0a9-0030-c356-f6dc-64fda4f90559@intel.com>
In-Reply-To: <c8b6c0a9-0030-c356-f6dc-64fda4f90559@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB7738:EE_
x-ms-office365-filtering-correlation-id: d68b2861-cffc-4d85-d4d0-08dafd866540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8VUFUjreQ0OIFaoTfSUjdcZckZ+MDJH5AqzA/K+23EGYKSOj/zQ9XGlWK38zU+7vCFBglbCmZkt5RB5IFdMm79eFWsCMqsd9BbTI5dPdvuLoPKgjQuEyrj9U4IVhhY+kk24J668CpFMDxq1p/xluL+PJDIos4PSpuEGCQV3lRHhRiAtx/cEXj8yv9Dm80uQzlhG1+TgWP75ooDbcgD/PiCLdlg4SzH33ZeDuVMoiSOuJQu52DJwyMTgLinOvs70ZcyWP96n33Tauy93UC/PaPYE8FSB+r9AflZERXl+n6eUo8KNubgQHBrTZIt5PibctSOxCczqzAADAgEitmtNjW17VaFh1xVdmq+myVy65awckb3bg8LO6cjFlktFQZmEtLumXypqq6okp0YQk03GuQ2pJ9lQnVK/vR6bjvNIWa+u4QydqdqU9B1Vc9jEv8HVk0TMANOARN382pRm4w8c06fgtA4oJ6zJlx2J5dPGx/u5x6qjZ9RNQhJlK7EDqt/saYIoF4VjWgZYUXujQp2L0Fl0E3tbh8btAOZs+w5eloXA6i7NKs9cPcRTyxIknobmbgmkKk6R3av4Jr23YrREqPgwrs7EhH/zv9I7dyc0flyH1ngYnDRfXcpUvEqVZrY0KdlQR1eMo/akHwg5+WxcHjiru5rLtiljgqIXhvMrkIbX8xdHWP6511E7N796PpZVaSnPgo6bS2UoaudYAyMea/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199015)(71200400001)(41300700001)(110136005)(54906003)(2616005)(66946007)(76116006)(66556008)(316002)(64756008)(91956017)(66446008)(66476007)(4326008)(8676002)(83380400001)(5660300002)(8936002)(2906002)(38100700002)(122000001)(38070700005)(82960400001)(6486002)(478600001)(6512007)(186003)(86362001)(26005)(36756003)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3BzWUM2Rm5rWGdCenFuU0d5cDBHcEE1MHRqY2Iwdlc3bTBuNlBiclZnOGJF?=
 =?utf-8?B?dDNNa0k3MTRkU2hJencvRzhaVCsrTFJuM2svOTZzUXNMM2Jza0pyYUJsME1I?=
 =?utf-8?B?TVlYUmZTLzRJSGVTUXZlQ0haVU5IbjJXdEZTYUNia3RnM2pUSjlCRmJxaTFJ?=
 =?utf-8?B?VU9FR1R5QW9xaGJGYVM1Tzh2blBaTkJnOGtLbmRtMjdiZ0RnMUwvU3B3MlVV?=
 =?utf-8?B?cm1laDJNV0tvd3FTa1J4RFVwWXNtTnFuRmdLR2tOZ2tqMFN2YWl0QnFITzRo?=
 =?utf-8?B?NytqOEdvN3VTVmhOemtoSDVSYWZxYmYxS2xubTQyV1JQL1JrZTlUWmhBbXlL?=
 =?utf-8?B?OVVFMi8xbFlSV0RzSklrODJTbURXQ0lyaTMwZlczVWZHM0VzWTY0bDlmNWtX?=
 =?utf-8?B?M3FnMzEyNDRqTnlxWThuSHkyRWdxSWdsbnUxRitSTnE5ckhDTHB3M0JuTGZo?=
 =?utf-8?B?TldzY3R2YXhWYklpQ2NScGIvUG9UQUFHSW1SSEFmZnZ0RlJTKzRNZXkyWUVm?=
 =?utf-8?B?SUZOMFlGN0lLTXBRSEFmTUoyblJuNVd5QUVaUUp1R2I4K2RDNDd3UjRCSUZN?=
 =?utf-8?B?aHlaVWxTR3NiNFFLVnVlTU5OYk1JMUpJVWFaWGNjQ3Brd1NIeDY3M042bjQ4?=
 =?utf-8?B?dkx5Rnl3bHVoYURJV3QwL3R4SFNoSWRJQ25UNFUwaGpIQmlwZW9XRVladU1u?=
 =?utf-8?B?bWk3UnRpMmpPRFMyN051Z0gySkluWWtIVzB6MkE5WTJwTGNrbTNxelFNK2Nm?=
 =?utf-8?B?VFBQRmFJek9kR1VQMVJLOUtTbVRkRkhzQ3JGc0t4dGY0NjBzVFByU0tKR2Vo?=
 =?utf-8?B?MSsvQVJoV2tTTTFsWWVmK1N4NHRzM2w3bXZoV0wvZ2dCUDdLWG5IRDBQU2Zs?=
 =?utf-8?B?ODE0ai9pMFVkekwyTGI1cGtlNDk0aUs4NE5BYmY5MjUvS1IzZGh4RWM2UWJu?=
 =?utf-8?B?Vk41ZWI3aDR2Y3gwT1B6dWt3d3d6ZXJLT3B6NzhxZUFUR0RBSC9NakNjRlJw?=
 =?utf-8?B?TFYvQWgwTFZUbXhhenlWakpiUmJ6QzZPaXZFTURqRGYvWVExUXdENlU3M3dP?=
 =?utf-8?B?SXNoMkhUZ1Zzd0hRYlRzZ1R0Q0s2VGFvUXBoNk1aQUlKUWs1Vm53dHk5MXJ5?=
 =?utf-8?B?UzVVMUFhL0YxNUpuUmtMZmc5ODBUT1haeTlCQ1lNbUppNjFnS3BScmNhM0dN?=
 =?utf-8?B?c3paK0RxR2M3dWZtYm5DVDFXTDdpS0dmS3lKTjdnMTdjUFpPWk5remxIWmlY?=
 =?utf-8?B?bUl1ei9pV3NhNkVzd2h2TVRGcVVqa2QwOHQ2bnUrNDB5RnRsR3A1RGsrb21V?=
 =?utf-8?B?cXN0OS95RjllZWxJSGhMMW02a2xqcVNpdU5IWm5Gb2haeTlxRnNYYkZXeDlk?=
 =?utf-8?B?NndrWDAxOEZGZ1hhSi9nMTI3eVAwM0x4blM4U2o5T1ltR0NNd1pGQjBOVnhs?=
 =?utf-8?B?emlvaWtndlRmY05hRFBKV2g4LzNWaUxJajVJVjFodXh2N2lCY0hmZlQ4bWgx?=
 =?utf-8?B?TjViaUh5Ry8rU2FIaWxkOEluelJBMFRCUCtVZ3UzTjdwMGNRVjVUcnR6V01F?=
 =?utf-8?B?cEg0Nm4vQi96VlRwKytRVXExQ0t5clRrQUtJT21KT2svYVhwWWhvdXlhSU0v?=
 =?utf-8?B?UEZJZjdiUEpyRjRzcGFCL1pDVmZJR3BmdzhwNk9wdFlqWWRzNFd3L1o1aEJ6?=
 =?utf-8?B?ZlpYMnZES3NDV1NwSDhWb21xeXE1Q1FlVEIvOGU4Sm9WRkdxeHJwWkp2bzh0?=
 =?utf-8?B?a3d3QWE3dkIxV0gveFRvN0xTUE9LV2lqY0JOMGdQZ1BjL0Y3MzBOQjd3TFRy?=
 =?utf-8?B?d1FtYU0wNG13aVFYbUxIczBQVlVQdXY0Q2pCK2pCNnVWbzRSSTA1OUFMK1lW?=
 =?utf-8?B?VTJHZFNGaWw2VFNuWlV4azlpWERiVnpIODVGUWtTTkpxWWhLUXFBMjF2T1N6?=
 =?utf-8?B?VDRxcUdBa0VRRXFGWGFEaldNVlN0TnRBd0ExVmpCekhtN3BlZEVLczRjYW1J?=
 =?utf-8?B?ZFZOenl6R3ZLcjFKZ1ZYd052V2xTNjR5a1E5OURqRTVPUmxHUGpPdjJieDJa?=
 =?utf-8?B?NUZHdi9ieWZqZ3VNMG9rMVROeFEyZjdKSHZzOExwdytDSE13aHVmeFlXT3Ju?=
 =?utf-8?B?RDdMWVhwRFZRUUlTQmd4empiL2MxZXRMWVhML2ExMDZHYkRRRlpsWE1uQTAy?=
 =?utf-8?Q?JaQlIr7CZRLSs2V8e+agX2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D759CE745287D04D97D88764EF92AE2A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68b2861-cffc-4d85-d4d0-08dafd866540
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 21:11:29.2070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qP/cQhuL1GQ+T5MZqrkElUfEqhS+EtK3YLLGdiccFvm9aPE883vKGW1So+Gydq/Y1nK5sXkwo7V8HId6Go4SOx/b6vM+ByzeyhFtbKZYrYtvMCZ5mYuxThxdVE8e5rso
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAxLTE4IGF0IDE4OjAxIC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IA0KPiBPbiAxLzExLzIwMjMgMTo0MiBQTSwgQWxhbiBQcmV2aW4gd3Jv
dGU6DQo+ID4gRGVzcGl0ZSBLQ1Igc3Vic3lzdGVtIGJlaW5nIGluIHRoZSBtZWRpYS10aWxlIChj
bG9zZSB0byB0aGUNCj4gPiBHU0MtQ1MpLCB0aGUgSVJRIGNvbnRyb2xzIGZvciBpdCBhcmUgb24g
R1QtMCB3aXRoIG90aGVyIGdsb2JhbA0KPiA+IElSUSBjb250cm9scy4gVGh1cywgYWRkIGEgaGVs
cGVyIGZvciBLQ1IgaHcgaW50ZXJydXB0DQo+ID4gZW5hYmxlL2Rpc2FibGUgZnVuY3Rpb25zIHRv
IGdldCB0aGUgY29ycmVjdCBndCBzdHJ1Y3R1cmUgKGZvcg0KPiA+IHVuY29yZSkgZm9yIE1UTC4N
Cj4gPiANCj4gPiBJbiB0aGUgaGVscGVyLCB3ZSBnZXQgR1QtMCdzIGhhbmRsZSBmb3IgdW5jb3Jl
IHdoZW4gdG91Y2hpbmcNCj4gPiBJUlEgcmVnaXN0ZXJzIGRlc3BpdGUgdGhlIHB4cC0+Y3RybF9n
dCBiZWluZyB0aGUgbWVkaWEtdGlsZS4NCj4gPiBObyBkaWZmZXJlbmNlIGZvciBsZWdhY3kgb2Yg
Y291cnNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZp
bi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L3B4cC9pbnRlbF9weHBfZGVidWdmcy5jIHzCoCAyICstDQo+ID4gwqAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9pcnEuY8KgwqDCoMKgIHwgMjMgKysrKysrKysrKysr
KysrKystLS0NCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX2lycS5o
wqDCoMKgwqAgfMKgIDggKysrKysrKw0KPiA+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9weHAvaW50ZWxfcHhwX2RlYnVnZnMuYw0KPiA+IGluZGV4IDRiOGU3MGNhYTNhZC4uOWY2ZTMw
MDQ4NmI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9w
eHBfZGVidWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4
cF9kZWJ1Z2ZzLmMNCj4gPiBAQCAtNDQsNyArNDQsNyBAQCBzdGF0aWMgaW50IHB4cF90ZXJtaW5h
dGVfZ2V0KHZvaWQgKmRhdGEsIHU2NCAqdmFsKQ0KPiA+IMKgIHN0YXRpYyBpbnQgcHhwX3Rlcm1p
bmF0ZV9zZXQodm9pZCAqZGF0YSwgdTY0IHZhbCkNCj4gPiDCoCB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoHN0cnVjdCBpbnRlbF9weHAgKnB4cCA9IGRhdGE7DQo+ID4gLcKgwqDCoMKgwqDCoMKgc3Ry
dWN0IGludGVsX2d0ICpndCA9IHB4cC0+Y3RybF9ndDsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgaW50ZWxfZ3QgKmd0ID0gaW50ZWxfcHhwX2dldF9pcnFfZ3QocHhwKTsNCj4gDQo+IFRoaXMg
ZG9lc24ndCBzZWVtIHRvIGJlIHJlcXVpcmVkIGhlcmUuIFRoZSBvbmx5IHVzZSBvZiBndCBpbiB0
aGlzIA0KPiBmdW5jdGlvbiBpcyBhbiBhc3NlcnQgYmVsb3cgYW5kIGJvdGggdGhlIHJvb3QgYW5k
IG1lZGlhIGd0IHBvaW50IHRvIHRoZSANCj4gc2FtZSBpcnFfbG9jaywgc28gaXQgZG9lc24ndCBt
YXR0ZXIgd2hpY2ggb25lIHdlJ3JlIHVzaW5nLiBTaG91bGQgd2UgDQo+IGtlZXAgaXQgYW55d2F5
IGp1c3QgZm9yIHNhZmV0eSBpbiBjYXNlIHRoaW5ncyBjaGFuZ2UgaW4gdGhlIGZ1dHVyZT8gb3Ig
DQo+IGp1c3QgYWRkIGEgY29tbWVudCBpbnN0ZWFkPw0KPiANCkkgcmF0aGVyIHdlIGtlZXAgdGhp
cyBoZWxwZXIgZm9yIGNvbnNpc3RlbmN5OiBldmVyeXRoaW5nIGVsc2UgaW4gZnJvbnQtZW5kDQpw
eHAgY29kZSBpcyB1c2luZyBweHAtPmN0cmxfZ3QsIGJ1dCBpZiB3ZSB1c2UgcHhwLT5bcm9vdF9n
dF0gaGVyZSwgaXQgd291bGQNCmp1c3QgcmVhZCBsaWtlIGEgYnVnIHdpdGhvdXQgdW5kZXJzdGFu
ZGluZyB0aGUgaHcgZGV0YWlscy4NCkFzIHlvdSBoYXZlIHBvaW50ZWQgb3V0IGZhcnRoZXIgZG93
biwgdGhlIGhlbHBlciBjb3VsZCBqdXN0IHJldHVybiByb290IGd0DQphbHdheXMgKHNpbmNlIHRo
ZXkgYm90aCBwb2ludCB0byB0aGUgc2FtZSBJUlEgcmVnaXN0ZXIpLiBJIHdpbGwgZ28gYWhlYWQg
YW5kDQpmb2xsb3cgeW91ciByZWNvbW1lbmRhdGlvbiBmb3IgdGhlIGhlbHBlciBpbnRlcm5hbHMg
KHdpdGggdGhlIGNvbW1lbnRzDQpleHBsYWluaW5nIGluIGRldGFpbCkgYnV0IGhhdmUgdGhlIGNh
bGxlcnMgY29udGludWUgdG8gdXNlIHRoYXQgaGVscGVyLg0KDQo+ID4gwqAgDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlmICghaW50ZWxfcHhwX2lzX2FjdGl2ZShweHApKQ0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9ERVY7DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX2lycS5jDQo+ID4gaW5kZXggOTFlOTYyMmMwN2QwLi4yZWVmMGMx
OWU5MWEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4
cF9pcnEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfaXJx
LmMNCj4gPiBAQCAtOCw2ICs4LDcgQEANCj4gPiDCoCAjaW5jbHVkZSAiZ3QvaW50ZWxfZ3RfcmVn
cy5oIg0KPiA+IMKgICNpbmNsdWRlICJndC9pbnRlbF9ndF90eXBlcy5oIg0KPiA+IMKgIA0KPiA+
ICsjaW5jbHVkZSAiaTkxNV9kcnYuaCINCj4gPiDCoCAjaW5jbHVkZSAiaTkxNV9pcnEuaCINCj4g
PiDCoCAjaW5jbHVkZSAiaTkxNV9yZWcuaCINCj4gPiDCoCANCj4gPiBAQCAtMTcsNiArMTgsMjIg
QEANCj4gPiDCoCAjaW5jbHVkZSAiaW50ZWxfcHhwX3R5cGVzLmgiDQo+ID4gwqAgI2luY2x1ZGUg
ImludGVsX3J1bnRpbWVfcG0uaCINCj4gPiDCoCANCj4gPiArLyoqDQo+ID4gKyAqIGludGVsX3B4
cF9nZXRfaXJxX2d0IC0gRmluZCB0aGUgY29ycmVjdCBHVCB0aGF0IG93bnMgS0NSIGludGVycnVw
dHMNCj4gPiArICogQHB4cDogcG9pbnRlciB0byBweHAgc3RydWN0DQo+ID4gKyAqDQo+ID4gKyAq
IEZvciBwbGF0Zm9ybXMgd2l0aCBhIHNpbmdsZSBHVCwgd2UgcmV0dXJuIHRoZSBweHAtPmN0cmxf
Z3QgKGFzIGV4cGVjdGVkKQ0KPiA+ICsgKiBidXQgZm9yIE1UTCsgdGhhdCBoYXMgYSBtZWRpYS10
aWxlLCBhbHRob3VnaCB0aGUgS0NSIGVuZ2luZSBpcyBpbiB0aGUNCj4gPiArICogbWVkaWEtdGls
ZSAoaS5lLiBweHAtPmN0cmxfZ3QpLCB0aGUgSVJRIGNvbnRyb2xzIGFyZSBvbiB0aGUgcm9vdCB0
aWxlLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGludGVsX2d0ICppbnRlbF9weHBfZ2V0X2lycV9n
dChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAo
cHhwLT51c2VzX2dzY2NzKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gdG9fZ3QocHhwLT5jdHJsX2d0LT5pOTE1KTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKg
cmV0dXJuIHB4cC0+Y3RybF9ndDsNCj4gDQo+IEFGQUlDVCBoZXJlIHdlIGNhbiBza2lwIHRoZSBp
ZiBhbmQgYWx3YXlzIHJldHVybiB0aGUgcm9vdCBndCwgYmVjYXVzZSANCj4gdGhhdCdzIHdoYXQg
aGFwcGVucyBpbiBib3RoIGNhc2VzLiBJZiB5b3Ugd2FudCB0byBtYWtlIHN1cmUgd2UgZG9uJ3Qg
Z2V0IA0KPiBpc3N1ZXMgaW4gdGhlIGZ1dHVyZSBtYXliZSBpbnN0ZWFkIGFkZCBhOg0KPiANCj4g
R0VNX0JVR19PTighaTkxNS0+bWVkaWFfZ3QgJiYgIWd0X2lzX3Jvb3QocHhwLT5jdHJsX2d0KSkN
Cg0Kd2lsbCBkby4NCg0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiDCoCAvKioNCj4gPiDCoMKgICog
aW50ZWxfcHhwX2lycV9oYW5kbGVyIC0gSGFuZGxlcyBQWFAgaW50ZXJydXB0cy4NCj4gPiDCoMKg
ICogQHB4cDogcG9pbnRlciB0byBweHAgc3RydWN0DQo+ID4gQEAgLTI5LDcgKzQ2LDcgQEAgdm9p
ZCBpbnRlbF9weHBfaXJxX2hhbmRsZXIoc3RydWN0IGludGVsX3B4cCAqcHhwLCB1MTYgaWlyKQ0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoR0VNX1dBUk5fT04oIWludGVsX3B4cF9pc19lbmFibGVk
KHB4cCkpKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiA+
IMKgIA0KPiA+IC3CoMKgwqDCoMKgwqDCoGd0ID0gcHhwLT5jdHJsX2d0Ow0KPiA+ICvCoMKgwqDC
oMKgwqDCoGd0ID0gaW50ZWxfcHhwX2dldF9pcnFfZ3QocHhwKTsNCj4gDQo+IEhlcmUgYWxzbyB3
ZSBvbmx5IGhhdmUgdGhlIGFzc2VydCBiZWxvdw0KaSB3aWxsIGZvbGxvdyB0aGUgYWJvdmUgcmVj
b21tZW5kYXRpb24uDQo+IA0KPiBEYW5pZWxlDQo+IA0KPiA+IMKgIA0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBsb2NrZGVwX2Fzc2VydF9oZWxkKGd0LT5pcnFfbG9jayk7DQo+ID4gwqAgDQo+ID4gQEAg
LTY4LDcgKzg1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHB4cF9pcnFfcmVzZXQoc3RydWN0IGlu
dGVsX2d0ICpndCkNCj4gPiDCoCANCj4gPiDCoCB2b2lkIGludGVsX3B4cF9pcnFfZW5hYmxlKHN0
cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiDCoCB7DQo+ID4gLcKgwqDCoMKgwqDCoMKgc3RydWN0
IGludGVsX2d0ICpndCA9IHB4cC0+Y3RybF9ndDsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
aW50ZWxfZ3QgKmd0ID0gaW50ZWxfcHhwX2dldF9pcnFfZ3QocHhwKTsNCj4gPiDCoCANCj4gPiDC
oMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycShndC0+aXJxX2xvY2spOw0KPiA+IMKgIA0KPiA+
IEBAIC04Myw3ICsxMDAsNyBAQCB2b2lkIGludGVsX3B4cF9pcnFfZW5hYmxlKHN0cnVjdCBpbnRl
bF9weHAgKnB4cCkNCj4gPiDCoCANCj4gPiDCoCB2b2lkIGludGVsX3B4cF9pcnFfZGlzYWJsZShz
dHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gwqAgew0KPiA+IC3CoMKgwqDCoMKgwqDCoHN0cnVj
dCBpbnRlbF9ndCAqZ3QgPSBweHAtPmN0cmxfZ3Q7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGludGVsX2d0ICpndCA9IGludGVsX3B4cF9nZXRfaXJxX2d0KHB4cCk7DQo+ID4gwqAgDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoC8qDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGFsd2F5cyBuZWVk
IHRvIHN1Ym1pdCBhIGdsb2JhbCB0ZXJtaW5hdGlvbiB3aGVuIHdlIHJlLWVuYWJsZSB0aGUNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9pcnEuaCBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfaXJxLmgNCj4gPiBpbmRleCA4YzI5
MmRjODZmNjguLmVlYTg3YzllYjYyYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX2lycS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
cHhwL2ludGVsX3B4cF9pcnEuaA0KPiA+IEBAIC05LDYgKzksNyBAQA0KPiA+IMKgICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiA+IMKgIA0KPiA+IMKgIHN0cnVjdCBpbnRlbF9weHA7DQo+ID4g
K3N0cnVjdCBpbnRlbF9ndDsNCj4gPiDCoCANCj4gPiDCoCAjZGVmaW5lIEdFTjEyX0RJU1BMQVlf
UFhQX1NUQVRFX1RFUk1JTkFURURfSU5URVJSVVBUIEJJVCgxKQ0KPiA+IMKgICNkZWZpbmUgR0VO
MTJfRElTUExBWV9BUFBfVEVSTUlOQVRFRF9QRVJfRldfUkVRX0lOVEVSUlVQVCBCSVQoMikNCj4g
PiBAQCAtMjMsNiArMjQsOCBAQCBzdHJ1Y3QgaW50ZWxfcHhwOw0KPiA+IMKgIHZvaWQgaW50ZWxf
cHhwX2lycV9lbmFibGUoc3RydWN0IGludGVsX3B4cCAqcHhwKTsNCj4gPiDCoCB2b2lkIGludGVs
X3B4cF9pcnFfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfcHhwICpweHApOw0KPiA+IMKgIHZvaWQgaW50
ZWxfcHhwX2lycV9oYW5kbGVyKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgdTE2IGlpcik7DQo+ID4g
K3N0cnVjdCBpbnRlbF9ndCAqaW50ZWxfcHhwX2dldF9pcnFfZ3Qoc3RydWN0IGludGVsX3B4cCAq
cHhwKTsNCj4gPiArDQo+ID4gwqAgI2Vsc2UNCj4gPiDCoCBzdGF0aWMgaW5saW5lIHZvaWQgaW50
ZWxfcHhwX2lycV9oYW5kbGVyKHN0cnVjdCBpbnRlbF9weHAgKnB4cCwgdTE2IGlpcikNCj4gPiDC
oCB7DQo+ID4gQEAgLTM1LDYgKzM4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlbF9weHBf
aXJxX2VuYWJsZShzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gwqAgc3RhdGljIGlubGluZSB2
b2lkIGludGVsX3B4cF9pcnFfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gwqAg
ew0KPiA+IMKgIH0NCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGludGVsX2d0ICpp
bnRlbF9weHBfZ2V0X2lycV9ndChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gK3sNCj4gPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsNCj4gPiArfQ0KPiA+IMKgICNlbmRpZg0KPiA+IMKg
IA0KPiA+IMKgICNlbmRpZiAvKiBfX0lOVEVMX1BYUF9JUlFfSF9fICovDQo+IA0KDQo=
