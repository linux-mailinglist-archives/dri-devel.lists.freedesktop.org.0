Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77F6C8B94
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 07:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618DC10E10D;
	Sat, 25 Mar 2023 06:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A710010E10D;
 Sat, 25 Mar 2023 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679724724; x=1711260724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hp/60AuwIslnKJSivVmn2vjwp8frL2PUUmjAHNt5VwA=;
 b=RszZkKDf0uMyUsexHOYdl/Mc+nHzGQTIg+cSOFKcp8xltJefTPZtu4Vc
 2RezOuoUuXrNocQijhM415PzOUEhyoifEKpYMdLfK1SJGCoGPFOlhB6SL
 ZeEUKE1aqHOsA0PQ78seKwF1id0tzOxQBxM5WN/FZ0bm+FOBm9EZLg11G
 vQ1GZqrkvoZ6leS9pMXfN9AcO6451AdRIDyQIYHe7o4IfaKINcJZhwGDs
 BwODJG8QhKVeCt1v/4HDt943DmjTNgv+plWnqB58f7hPPojoWRDqJ+loL
 IoAPD39NDld+kgj8WnyD8wfjD6IcWq+puMcyvqhcJYIzBWtNvrGYaf0yG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319594089"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="319594089"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 23:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012516827"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="1012516827"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2023 23:12:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 23:12:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 23:12:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 23:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmRcvN/kypiYVfjDLBr7SA5JaAm49uyZrUyIFuayL5w6SqOWQuL6H7ApwBnpDDlrsC8uWFuJ8dmlpP5nUynSqXDhqv8LBaz/D6UBi0FJ9K4v0kXPud70DMU6LrHdjKMoV3iQJybttYu2/847Vh/wZL1tpnLl50ZWwfp8Q+G2zfjqyG/ZU1vZqa36R4q7SbZCJi14pP0hsRuVXc5Gx5vAtoNupMGepmBOS1p3T3Qo9r6l43QXzPUPAZkft/yvKX+bpI+kOZYllUzE0QZI+QKAIZGPy8g7MMkolLaER8Esf4FSHPZFQmIdCeQ0XvhvDcu3TG8N247vTHzegw6EKAgAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp/60AuwIslnKJSivVmn2vjwp8frL2PUUmjAHNt5VwA=;
 b=deJ4N421I6wWMY7yXFseY5DQFKsM8qKmCllCEJOCfLFkZEK5OdvniHt6ICqsOEilCY0HEEBJoKOTE9QKSexFNNXtQmtJIFpDiMyXo2/Hc+A6tldmCJhEK462gMzEKXAPufzOjaRairS0XvCezJmO87vSmR4IGV5rMXqyyTtIRKrBFPhAgO+TVJcNF5c6nAGdp886Pm2mdGx93qpk21qLZ1nyYZggoHQxDwvfAvc0Uu5Kx0X04U8/SvqSZ+Bv2pKN5Kd5ZOW7eDyKdTNsnuSwHlDanzy3tdRhbeuogcqJCH5Jedo37E5vt1TftvvF8oEveiN5VcOB35L4SMhyRnb6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.41; Sat, 25 Mar 2023 06:11:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 06:11:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZSxtxSfUqWny+hUmFCBmRtOC0Wq7p3LIAgCFOeQA=
Date: Sat, 25 Mar 2023 06:11:54 +0000
Message-ID: <ff9f89598ace661db431015974a5b6ad91c4c59d.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
In-Reply-To: <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CYYPR11MB8358:EE_
x-ms-office365-filtering-correlation-id: 2c8c79da-b7d1-4b92-9208-08db2cf7d51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tyub2cy0EBArleI9wpdHezZmIEX73hq2f+Wr4jsJ/0xb9BOQy5qriLbLmeNHct9dAt/sa2on83vd411EiF1fFPB75bPY8kSSiHJ3gmlR5ux5U6NDN678G1xEfcGZR2Re4P8odCjA+a2V2Ygrs8G2WosUiL6nTVjDxHjSpiwip3bNofm29JijU4nWKVbc5g34Cwj82XVTu9xDvkBMTyCXUWYLacwY7srT8jo6jpdiQQZMy0bPvWn4ve1GNKjXgEp0G2ErhEciTYnsZ1jJfEBJtoWaQg+brsANng0fZXJdH6ge/bvF2pYe/L9kQlwctS2jC96UHJBrKkSHlZODUsrnxR2EzAZ31C4cEEQ9kEQPyT//HR8wUUtuu+jZ+pKmIxBxvh6Xv38fXlNXSGQ/dz+fpwHl4tcM9ZKtoIpfNdOzseCOh2OcPajZNxQplDMMABGFGa8DK5KHV3XLSc3i4MXAbsPOs3uY+BLe7DcrXepY70V2CIYTsNFPHhOhTEqnZ29Fk6sd3fbNXl9yB7w3KTlrtux89/UxFq6LyVrEF9mC7OnpAJesnUhAMVRg9d5OLuNi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(71200400001)(122000001)(966005)(6486002)(76116006)(66946007)(8676002)(91956017)(66446008)(2906002)(4326008)(5660300002)(82960400001)(41300700001)(8936002)(36756003)(478600001)(64756008)(66476007)(66556008)(38100700002)(38070700005)(86362001)(316002)(54906003)(83380400001)(110136005)(6512007)(26005)(53546011)(6506007)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhHVXpMeWZDQTlTcDNNalhLcVdOVWFNejVpTFBzSjJqcXMyTVBLV2hrcmh6?=
 =?utf-8?B?azN5WHdlREJ3dFFybHEvc0k4S2xsRXZTUkNtdlVFQndqbURyZ2c1eXZzcVJw?=
 =?utf-8?B?STRnbjdLZHpqWmlOblhnL2dqbmthdzNSRmRUeFlQc0VLWTVzcjYzbnVWMnFL?=
 =?utf-8?B?V3hLMHMxVUhXUTRTeStoOURWMDlBUGJEQ0Vmb1VaQVYxUzZnV214S2NGTE5G?=
 =?utf-8?B?cnY5VHRwNUw5M3RmcDVBQ0lZZ0Jrb1lXV2tEQ1gvVTdiMUo3cHdmUzRHcUEv?=
 =?utf-8?B?ejZHWlVMK1YrYkJwcEpQZmF5aU42ajc1dk5pcC92YnA1NkNwNzN4RzgvbW5v?=
 =?utf-8?B?RUl5ZVVrVUthdytIOHpSRWxWQkhXa3U1M21GUWprVU0xd1BENXBhcU9Dbzh6?=
 =?utf-8?B?YVA4U29ralQ4U2RaVEFhdjdTcWlTbkFxUElhYjJkUUoxZU1iYkRXNXNVZTBC?=
 =?utf-8?B?MXlOeHVYUktzTzlyazNSdEJnM0dhUHFGWTliVW5qTFdZNnRhRjVyd2tFM1Fl?=
 =?utf-8?B?akQwd2FMbGxEQkZoR1BCRXBzOTF6eXd1MHBiSWQ0aEtVNU52TTdydXpjR1hl?=
 =?utf-8?B?c3RmWGFTWWhJUm1MeW5mTjNWV2VDTlljY2dJUW9tRDdOdVJsbHByMG9XMU5x?=
 =?utf-8?B?akpGeUJiVU9QczRBM1ExS3JYM2pMeWhRamIxOVJaa0IvSC9TdkFWTkZmTTdW?=
 =?utf-8?B?TndMdm52dVJVTUU2a1dJa2g5ajRJa3h2aGRaeDhSTXBRYW92VnRUT3FjYjJi?=
 =?utf-8?B?b2p4QXpJSjVCM29heTE3ck9mMm14WU5UUTJLanV1ZTZjQ1NsSENGZ1VSQ3JY?=
 =?utf-8?B?VkV6YmpnbXgvOVhJaDBLVldpMHBCM2t6WHo4em5FTitiSVUyQ2hjdEIrREJi?=
 =?utf-8?B?OGlsV2xzYUdOekpUYmtNcUpvYXJxTTFFV2tIMjZON2lSUStVNjZocGFNcEZS?=
 =?utf-8?B?YVpnNW0wNjdmbEZiSmtxbVVTQ2lxOUd4VldXcjdSR0Fxek5DTDFrSDBmd09y?=
 =?utf-8?B?WTZhU2Nra0pZbWFmZUNiUmx2ZmREYjVieEx1b1FoSDhNNVdDZFBaS0hrZkRP?=
 =?utf-8?B?QTlSM2hXaGpwZFhIM1RnaXgxRWxpTlZJb1RnckVxOGRBc0w2UHdJZXJaZHpW?=
 =?utf-8?B?bGkvTHFKNk82R2ovMUtUUGV4c1NXWVppaElJbHcwUFJJMFV2Y21hWkZETkJj?=
 =?utf-8?B?NmdnOFhZaFNDQVpMOHA0RGtrb0lHbmJiSWJ4RFR1dlpLa29MYzdtK0RGMWcr?=
 =?utf-8?B?ek82emZIVjlMNEhLYVEwcVFzSkU1b0tOU0J6MGdpQ2YrWXdvdFd0SkpLQUJk?=
 =?utf-8?B?S05NVDNWY3UzaXU0L05JZG1pNnc4aUZoQWFXaVdCN25YUEtLNHNzdzN4clpY?=
 =?utf-8?B?eDdsRzVyOVg5WjZTanhqZlpzdGUwV29BR2xKbUtCakd0YXJIdWwzZURMeTdI?=
 =?utf-8?B?RnZwVTRiRWZ0K2RkRGNROWhqTXB0dzlaTyt2YUF6YzlHQXdJTmMzTWR0Rlg3?=
 =?utf-8?B?RCtyK2QvaklwWUZSejNsaWpJUWRBbzEvb3VkUWJHQmlLYUd6RjNhcjlwY0xX?=
 =?utf-8?B?RWx1SXQyRGc0ZmdjbGhsQjFjQW9xTnR3V25YNVUrakNhYWxXbks3ZUhDSDZN?=
 =?utf-8?B?ejZTeFdleDNjTmM0REpXN2Z6MU9GYk1CV3UrUllDaUNCS3g2YUdreGRqMWFP?=
 =?utf-8?B?c1NubzVEQmQ1aHY2VmU3SzZnYXVRRGZ6SlVwYTBBZkM5UG8vQWFZWDRuSE56?=
 =?utf-8?B?d2owVzRZcEh2VUtUcFhydGZzM1FOVGZtT0t2bElKcGltOXdOWWF4TkRxSGU4?=
 =?utf-8?B?QS96MEpmME1OZkFZM214cGlVb1NORzdZQjJOMXRUSzN3SkFxLzZUQlV0YnAy?=
 =?utf-8?B?ay9kZm9GUmYxQ2wzUlJPQTZMeVhmV3N3Y3Yvd05WMkczcDBybGRKUGhhYkVM?=
 =?utf-8?B?WitqT1FQdWplRWU1dU9YNnpGWU9abVQ5VkhjamdRTUxHTnVQMjFFWE5jbDBz?=
 =?utf-8?B?TmJ3SnFyRlV6c2lseDVxbmlyb1ZSV21SSTR0TU1aM1VTK0NCZldkL0FNdkE0?=
 =?utf-8?B?YkNyZm9SMkM5L3BzZ1VnNFNiVlFGM2JZTGtsekxHbTVRYXJRbnNOOVZCYXht?=
 =?utf-8?B?M3R2Yk9aWVo4OGhsME9HOTA5M0YwejRRUzVRbXNWUlZoOHdPM2s1SEZ0Q1Zx?=
 =?utf-8?Q?w8I2NT2A8NsirHOnPPD65rA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A241193CC0A6A747BE8AF87F44AC2A44@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8c79da-b7d1-4b92-9208-08db2cf7d51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2023 06:11:54.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/Yv1DStmXMw26o0EJwn6S5gPRiKH+QklRNl7qYrMyN2B8F1PT9f2Gl7LIMOfdEEkOaQekAMk9zyFL15dj5h8dRhwPMLGnkF/VuYOuxoXaXPMMGPIVyGEHefKtIHEwzJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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

T24gRnJpLCAyMDIzLTAzLTAzIGF0IDE3OjM0IC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IE9uIDIvMjcvMjAyMyA2OjIxIFBNLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBBZGQgTVRMJ3MgZnVuY3Rpb24gZm9yIEFSQiBzZXNzaW9uIGNyZWF0aW9uIHVzaW5nIFBY
UCBmaXJtd2FyZQ0KPiA+IHZlcnNpb24gNC4zIEFCSSBzdHJ1Y3R1cmUgZm9ybWF0Lg0KPiANCmFs
YW46c25pcA0KDQo+ID4gKwlyZXQgPSBnc2Njc19zZW5kX21lc3NhZ2VfcmV0cnlfY29tcGxldGUo
cHhwLA0KPiA+ICsJCQkJCQkmbXNnX2luLCBzaXplb2YobXNnX2luKSwNCj4gPiArCQkJCQkJJm1z
Z19vdXQsIHNpemVvZihtc2dfb3V0KSwgTlVMTCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWRy
bV93YXJuKCZpOTE1LT5kcm0sICJGYWlsZWQgdG8gc2VuZCBnc2NjcyBtc2cgZm9yIGNyZWF0aW5n
LXNlc3Npb24tJWQ6IHJldD1bJWRdXG4iLA0KPiA+ICsJCQkgYXJiX3Nlc3Npb25faWQsIHJldCk7
DQo+ID4gKwllbHNlIGlmIChtc2dfb3V0LmhlYWRlci5zdGF0dXMgIT0gMHgwKQ0KPiA+ICsJCWRy
bV93YXJuKCZpOTE1LT5kcm0sICJQWFAgZmlybXdhcmUgZmFpbGVkIG9uIGNyZWF0aW5nLXNlc3Np
b24tJWQ6IHN0YXR1cz0weCUwOHhcbiIsDQo+ID4gKwkJCSBhcmJfc2Vzc2lvbl9pZCwgbXNnX291
dC5oZWFkZXIuc3RhdHVzKTsNCj4gDQo+IFNob3VsZCB0aGlzIGZvbGxvdyB0aGUgc2FtZSBsb2cg
c3R5bGUgYXMgDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81MjE0
MzEvPyBzYW1lIGZvciB0aGUgZnVuY3Rpb24gDQo+IGJlbG93Lg0KYWxhbjogeWVhaCAtIGkgd2Fz
IHBsYW5uaW5nIHRvIHVwZGF0ZSBvbmNlIHRoZSBvdGhlciBnb3QgYW4gUmIgd2hpY2ggaXMganVz
dCBkaWQuDQpJbiB0aGUgY29taW5nIHJldjcsIEknbGwgcHJvYmFibHkgZHVwbGljYXRlIHNvbWUg
b2YgdGhlIGZ3LWVyci10by1zdHJpbmcgZnVuY3Rpb24NCmZvciBib3RoIEdTQ0NTIGFuZCBURUUg
aW4gdGhlIGV2ZW50IG5ldyBvciBleGlzdGluZyBlcnJvciBjb25kaXRpb25zIGFyZSBkaWZmZXJl
bnRseQ0KZGV0ZXJtaW5lZCBhcyBwbGF0Zm9ybSBwZXJzaXN0aW5nIGlzc3VlIG9yIHJ1bnRpbWUg
aXNzdWVzLiANCg0KYWxhbjpzbmlwDQo+ID4gK3ZvaWQgaW50ZWxfcHhwX2dzY2NzX2VuZF9hcmJf
Zndfc2Vzc2lvbihzdHJ1Y3QgaW50ZWxfcHhwICpweHAsIHUzMiBzZXNzaW9uX2lkKQ0KPiA+ICt7
DQo+ID4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHB4cC0+Y3RybF9ndC0+aTkx
NTsNCj4gPiArCXN0cnVjdCBweHA0Ml9pbnZfc3RyZWFtX2tleV9pbiBtc2dfaW4gPSB7MH07DQo+
ID4gKwlzdHJ1Y3QgcHhwNDJfaW52X3N0cmVhbV9rZXlfb3V0IG1zZ19vdXQgPSB7MH07DQo+ID4g
KwlpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKwltZW1zZXQoJm1zZ19pbiwgMCwgc2l6ZW9mKG1z
Z19pbikpOw0KPiA+ICsJbWVtc2V0KCZtc2dfb3V0LCAwLCBzaXplb2YobXNnX291dCkpOw0KPiAN
Cj4gWW91J3JlIGFscmVhZHkgaW5pdGlhbGl6aW5nIHRoZSBzdHJ1Y3RzIHRvIHplcm8gd2l0aCAi
PSB7MH0iDQo+IA0KYWxhbjogb29wcyAtIGNvcHkrcGFzdGUgZXJyb3IgLSB3aWxsIGZpeC4NCg0K
