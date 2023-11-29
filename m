Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A567FDED3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 18:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601A610E649;
	Wed, 29 Nov 2023 17:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257910E649;
 Wed, 29 Nov 2023 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701280180; x=1732816180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oGSkBKVvCip0avlEXq8cBXpJ3zxlYdkf829mknz4Q0g=;
 b=cBkwQTNe4f46dUEy3+JJUHRL/TJTxxeS9odJGS2ES4m2+UQYXVpsEqem
 o8MTberklbiVnvTbpzJJt8M1fpj4GFyO4VUfMUto+tMtV4WJa0uyf5hY4
 tDxVl7ntQgxyaWlvIxLw68xDM5PorVLWRrhoAjmdKOKCMhyp8VEAqPhq2
 Ha5/A23Bag9/9LbSPsPRMFmuwYfEWV6iR9vTgD6pRiXY1MEothSQcRpIw
 0eGEcRpbMreXa7UBo6UTi4dm1x1rJGiAdOR/HpGRd8iI0Hs/suZnR8Hl7
 5O6fvKPwmWuUFt4bLMyzrHR0a6FDfDU+hHeSwyDQuEToaDc4RBlSWD5ML w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383594197"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383594197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="768987929"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="768987929"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 09:49:39 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:49:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 09:49:39 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 09:49:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD/r039B4blJmS+9AkCFxQfSP0jJccw8GN0FV2SuJSHB/qR6bRhjPXbsfS4glNr1+RLOwIgLRfTSMEH9ouk1Oh9U2CzLqscZsPov9cFYO4WwKe19vbLjzlJEm1lpESByEvbol0pUl6BkCjH3dNMy3hDRKuKyr19e+b4/QNOLNfQk0xvrxIpxf9disALUn02R9c4hByBG4cjn4UYdSa790gyRlJgbL878LpAr1odf7t99aPjZlFx8DiqF6LlPS4zVmrQc6ih/O7pJgC5pgUrAXhubJkh/XyDKzDNmFYtjO/0yIkBMcyP8gHCuq/VqNAVH7BJTJ8YHJT9mQtc4uqT79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGSkBKVvCip0avlEXq8cBXpJ3zxlYdkf829mknz4Q0g=;
 b=XdQ+/wmjXtdnfnancYmo0A/FvkHjBfF+NCixrikdSB5D5H2Kky/VUroPxfXeTMXyCXdlCRiUEOvswcRxfFfKyA3tK2dTeUIx4kO8ESQi65UW4/l4MH7rIZclsp4g/d550oNJONk9wgVIOVYAgOYfIVfrydsrBR/1kS1Ir61tuA9EnFk56uRmwx6/SH3s6AmMIRKctKRmtQzksCAe+uSXx8zT/pj1RNZkuSO9AeFUEw62Eclgappr7WvM3y89tWCzWJ63jnElPbX8zWqL5HDbeuFYEvAOCZ83r79T0TYfaoiiGoWzg+Kq9nf0ItTVpfke618weMAI8whrfSLnlGRlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 17:49:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 17:49:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/1] drm/i915/pxp: Add missing tag for
 Wa_14019159160
Thread-Topic: [Intel-gfx] [PATCH v3 1/1] drm/i915/pxp: Add missing tag for
 Wa_14019159160
Thread-Index: AQHaIW39P/kUretC+UmsnOHdOzbQVbCQB3yAgAGOewA=
Date: Wed, 29 Nov 2023 17:49:36 +0000
Message-ID: <b2f47f5669487b0c7a4f5f382064c8e11d8e1fd0.camel@intel.com>
References: <20231127201150.8407-1-alan.previn.teres.alexis@intel.com>
 <20231128180321.GL5757@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231128180321.GL5757@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB8185:EE_
x-ms-office365-filtering-correlation-id: 04ceb544-32d0-4dd2-b155-08dbf1038daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NXYOIpnW0m+eSvZivDgx6pjIjyQFgVNBxzVVZZ0CjW6t/r5/8P1yduNuanJwEmDkqOHGg/4a9IAp45b8T9NG/F5E1xcRdu7CXBx+PeosXqcrvmauUsOTGWNqSkdhLr9oVEYd86T8b+JAp65Y3eBqXYT1GJA8tBklIHwVRxsBWJ6CsmgHVW3s4iaE8curgN2AqxMSvb8eUqwLzhltmDh989vDPCMvELKcHzHs8qAf+15mqr0oBtSJH0w/OCMrNeXM4LOSI8ztCBMMqy96khR2aB68vA6pkKu1+GStKTRY9NfmnycclAyUAh0ZAO5AkMED+GVNmDuoUUqm4oTTtzInD53I0k5uNiF1ImNrM7X4G+0QssptCttD1GAHCqSU18igRVJvQM2zxSjlN1dQIlQabAk4wr5YeiFeOgYcvTWAwA85J0xmmwqVsJnSdpf6EMx08kQAvSKenjUSNSrCGbpkOzwPeIhgX2R0DWsJO6Q0Vb+eh71Xwe+rbuUKN1dlC1EJLbKpKoNHMtpY8y/FImglzenyqdbW/JFEndiRwiui+AbDnpKCMT9H1QdSCF1dODrgG1KepNC/QU1NQI1R8C7nr7omS71/1GORLY3qotdjZzymbEG0Ov6P4HLN9YJ72MgV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(38100700002)(4001150100001)(36756003)(86362001)(38070700009)(2906002)(122000001)(4744005)(5660300002)(82960400001)(26005)(2616005)(6512007)(6506007)(71200400001)(8676002)(6862004)(4326008)(8936002)(450100002)(6486002)(478600001)(66446008)(54906003)(91956017)(76116006)(64756008)(66556008)(37006003)(66946007)(66476007)(316002)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTZGUUpCOHdJbTUrWTNUOGJtcWwxbUhoU2EyUXROOWtzSHlhNmo4QytGOHA2?=
 =?utf-8?B?dmFGSWVKaDBtdUtwa2JZSnVIdWxiOXlxNkNPZldJUzFYM2xFb2FBOGpKaDNv?=
 =?utf-8?B?UXMzMWorWEpBQ2E3TGJ3SWtjZUZFZ0g2em1IaGxxVm1mUm96TGZuY3BrU0hV?=
 =?utf-8?B?Y2RZNnJCWjBjUE12aVFUdjJwMzNicGNwUEw3YXYxc05FeGtJYWR3dDRFeWgx?=
 =?utf-8?B?SkIwZjZVMWdJWVRNb0gwTUVRK2pFSW44TGpoODZvK3pPMzRWRm95MmFZa21q?=
 =?utf-8?B?OUtKd2hpYVRqQTYzSFhZUlBNak5neVVvYzI2YnFEVjh6UEZPVmZSUW8yUFNz?=
 =?utf-8?B?d0N1OU12WFB2cDJ0ZDdNc1kweEFlYXBIWnFmaEd1R21GR2l0OXdROXlFMmRp?=
 =?utf-8?B?VzlydXZvUDlENEZYcnJpb3BENE1RdFU3MjI3UE54eWV5cTA2S3V5NitXYkR1?=
 =?utf-8?B?YXd3YXQzaFVSa1dtbWdoTTlaK21COW03T2NabFI3a1NHQ3NwWEdzZTlyNy93?=
 =?utf-8?B?Zm0zbWVLWUhFS1JPRXUzd0g4MXFQdTc2VDRlRmhFeTI2VFcrV3VTZWJDL3Fr?=
 =?utf-8?B?aEpmVnJTZWhWN0U4WkUvemludzJaMzZ2V3hWMS9tWFAzVUorTUR3em91eVVr?=
 =?utf-8?B?OXR0M3dEZVN2MXFkRFF2RGdwM045V3IvMHVjbnFJekllZVlJSUdKc21EbC9W?=
 =?utf-8?B?Q3pUZ01rT2gwZmNLOWpmWUh5ZkJxM1pLSFUyamF3aDFCbTlzdmtJTGVITHJj?=
 =?utf-8?B?bStVVG91bVZOSC9aZEhOTjB4T3ppNGF3YVJlckFRb1g3eHVSMFYySG4rSGky?=
 =?utf-8?B?bVJsUVVYam5VaDhuOUxJRWFQeHFUWUV1elRNbmdQTmFuR0NoVi9jelQ5cGJr?=
 =?utf-8?B?MXpiVEUrdjEwYU5LK25zVDZOSzdFQTBEZzFJbXNYS0twU2dkYlFUV2JRSERh?=
 =?utf-8?B?b05pNHRqNTBuNjdRTnVxa2FMZDZOTnRQUUVmU3M5YjI0WUV1LzN0Q0M2b3Jp?=
 =?utf-8?B?eGZGVG4zYkNreG9hMlJXZHcwaFRpeGUzdEVoeGdTUklUbVh3Z1ZUM0dhSU1G?=
 =?utf-8?B?Qk4xdFBZUUZyOHVqN0hSb1E0MEY2YW5MbTNVTi9YUms2RG4wOXhsL01uQjBa?=
 =?utf-8?B?VWNhdFB5MENSZ01Gakd4eUdzZE5ObTdRc3puRWlsVERqSEUzaGl1NlRya1hZ?=
 =?utf-8?B?NjJyMG92RG1zQ08ycEJPVHp1QXY4WWRoUis3ZWIzc1pXaStIUlNndEpFR0Np?=
 =?utf-8?B?cUlxZEdCN01MVmpKem4yejV6cTNCaWYzUnBqeEZoamhBNkZwMDA4SXZVMGd5?=
 =?utf-8?B?QitIQUtvNkI1K2M3NkZZQkVZTTRwK2l6L1hWYzBicDd5OTR1TU05SzNqMGZ3?=
 =?utf-8?B?R1BQcGswQjk3bEd2VWtTZ08rcXpWa0RpTTNTQzlhWklaWnZ1cU5keEc1WUFJ?=
 =?utf-8?B?M1NzeFBWQ3F6SHF4VDFXamF5b1ZWckc0VzZXbFk4dEhsbzVvTWRibHpwbnVJ?=
 =?utf-8?B?YmE5UHoweURHTFV3SzUzWkRyNEZ3T3RQclc1UnliaWdqRWR5TG1rc2FKU2FM?=
 =?utf-8?B?TVRtR3lHbTFOTWFtL1IxaTNtQzQxVjU0cFFYV3dOY25MVTNKMkE1N2M4aFFV?=
 =?utf-8?B?dzA2N2NNWjZBYkNiZlllYUtPUEZxbGtJMlhzM0pDRnBubDNnVWpwV25heFNv?=
 =?utf-8?B?U2dPV2hBNERUUlo4UTNha2RxVWNPenhVQmtEK1ZPdkplYzFqZGN5dlk3bHdm?=
 =?utf-8?B?T1lrb2Zkei9oUmNkTitkVzFoWlo3WXlmeHFDcEV6bittSi9kSkNVdGg2a0FC?=
 =?utf-8?B?UHZRUXJpR1BwYVpCZ3BqZ0RwREk1Q1F5T0J6VE9iTEtyZmgrdFFBVzJyakJo?=
 =?utf-8?B?QUxnSGt5UDNQYmlhbDBKd1hBQ1hvbmhWcG5YaHF2Y0dWMVJmLzdNeVVQU2hI?=
 =?utf-8?B?TUtvalhjOXdvc0txanRhTitSaFg5MFRMa3kwUExvaE9NcTA5TGtwSk53RTZx?=
 =?utf-8?B?cEFub0YyeDExM3JEN1VVemQwL1VvZk9DT3BtNUE1RFNWeTI0dUh2b2tjNE1F?=
 =?utf-8?B?TzlicjRwK0RQYkpNdEtXT08xUEZidStWck52a2Y3YlJYOVZYRGxSU25BRGkw?=
 =?utf-8?B?UjA5bjM5TjZQcmMrTmNCaTZKd0o1cENCQldldlhJMFhzUGwwOEJTNXZlTDAw?=
 =?utf-8?Q?Ykvgja2+5tfL4oYgUtMKxVo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6531519ED4A32A4A9F320BF282675A3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ceb544-32d0-4dd2-b155-08dbf1038daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 17:49:36.6922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPUwslCGR7ilBZmx7+jOQABPvR8OqWTA+ujNJPjYxOOHIZRop604lcvV8BgWEcICjBUlIFnnibnUUMN6eOuonzVMUyj57Z/MWTJ9a/Dxu5q6aYOJcu/9NMdG5U/UPGDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTI4IGF0IDEwOjAzIC0wODAwLCBSb3BlciwgTWF0dGhldyBEIHdyb3Rl
Og0KPiBPbiBNb24sIE5vdiAyNywgMjAyMyBhdCAxMjoxMTo1MFBNIC0wODAwLCBBbGFuIFByZXZp
biB3cm90ZToNCj4gPiBBZGQgbWlzc2luZyB0YWcgZm9yICJXYV8xNDAxOTE1OTE2MCAtIENhc2Ug
MiIgKGZvciBleGlzdGluZw0KPiA+IFBYUCBjb2RlIHRoYXQgZW5zdXJlcyBydW4gYWxvbmUgbW9k
ZSBiaXQgaXMgc2V0IHRvIGFsbG93DQo+ID4gUHhQLWRlY3J5cHRpb24uDQphbGFuOnNuaXAuDQph
bGFuOiB0aGFua3MgZm9yIHJldmlld2luZy4NCj4gPiAtCWlmIChHUkFQSElDU19WRVJfRlVMTChj
ZS0+ZW5naW5lLT5pOTE1KSA+PSBJUF9WRVIoMTIsIDcwKSAmJg0KPiA+ICsJaWYgKEdSQVBISUNT
X1ZFUl9GVUxMKGNlLT5lbmdpbmUtPmk5MTUpID09IElQX1ZFUigxMiwgNzApICYmDQo+IA0KPiBU
aGUgd29ya2Fyb3VuZCBkYXRhYmFzZSBsaXN0cyB0aGlzIGFzIGJlaW5nIG5lZWRlZCBvbiBib3Ro
IDEyLjcwIGFuZA0KPiAxMi43MS4gIFNob3VsZCB0aGlzIGJlIGENCj4gDQo+ICAgICAgICAgSVNf
R0ZYX0dUX0lQX1JBTkdFKGd0LCBJUF9WRVIoMTIsIDcwKSwgSVBfVkVSKDEyLCA3MSkpDQphbGFu
OiBzdXJlIC0gd2lsbCBkbyB0aGlzLg0KPiANCj4gY2hlY2sgaW5zdGVhZD8NCj4gDQo+IFRoZSB3
b3JrYXJvdW5kIGlzIGFsc28gbGlzdGVkIGluIHRoZSBkYXRhYmFzZSBhcyBhcHBseWluZyB0byBE
RzI7IGlzDQo+IHRoaXMgImNhc2UgMiIgc3Vic2V0IG9mIHRoZSB3b3JrYXJvdW5kIG5vdCByZWxl
dmFudCB0byB0aGF0IHBsYXRmb3JtPw0KYWxhbjogaSBkb250IGJlbGlldmUgc28gLSBub3QgdGhl
IHB4cCBjYXNlIDIuDQoNCg==
