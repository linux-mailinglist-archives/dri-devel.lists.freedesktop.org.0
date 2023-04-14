Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4F6E26AF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CEE10E1AF;
	Fri, 14 Apr 2023 15:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22A610E1A9;
 Fri, 14 Apr 2023 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681485482; x=1713021482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YGi2epQ87dGzb7+TwEfXzXPObm7euALRUwX1m4VErVg=;
 b=OalYnN3/asLoRimnWRDecVTqhvkk2by2ns0dq3VXAgC5yC/fk5gJa2L3
 jUky+AX5ytNtPBvQ6I/626/NIuzfjNP1k7uRK0afMxAUPsDG8/6EDjEhC
 pZG0O0fNLz8f5lHaovNLUc8gktDn9ydCo19zC6wDG3uowWwTPVPJu8rdQ
 tR4+wR1h1Ay/3qt9r5FE7fqdaCjqXHk14pyRwcXbX9sWP9gMqEJb6dCTO
 aGr49xON9SBMHgQ92GnIP4dzPjql0We9MzDI487eh30Wiq2R/GIZSZ3iN
 D1pOxU2Q7y9D+YLLI3NB+DTeECuvzx7EzDMBvVcVOA5WnzSJsoTmTO0K6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333261755"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="333261755"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 08:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="720318845"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="720318845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 14 Apr 2023 08:18:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:18:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:18:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 08:18:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 08:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzfQSRN4ptL4Uheozgv8+YwaJhUUnBzvC54DQ0xH6YQub31kiZgIMdcG6+STaJ2yT/s/+bKbNAZdueSj9iZuwl+rfWwZDwNfWEAJLn0XNA/KPVacoF3U45z/5oWV+ZMMduk1N4w6wB6HhPJpF4xEmcnyPuqv6Qz9xORscQGY9WQL71giDMIExv0HOrsmQFkw9xXUWhYnpHI92/L7/J8DT9/v5vBTC3DIGoPvrvOeL/Rw7Slw4OqccKF2D+NISc8ng+4laP0a9D34bcqD3jYoapXaNawkbZmkdrioV9Jwt4iX+tJ3IH6RgFl6Xro/SgJtXOMbUO9nz2sbpIriKyEOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGi2epQ87dGzb7+TwEfXzXPObm7euALRUwX1m4VErVg=;
 b=EUyG9NPUZ2w22xViRqVZTiK0a2UDuwjRYh2pzSO71T8X4FLTbBIuTnT2mR557i57h+lG9DPGsmnyVLwtZzfosbm5H92NBO87QQOPT+mCONLvhicaukrOStbuoqzkI1WXQ1GA7coE9iCnGbN0gSYMslSH2qYkn6W6u96/wJGcmbOWVznGxcDocnkNeQ7aYP5BSjYjN6XcEFmhvO6DEzNskqzklELQ79WizT+mWk3/q8eVW64gPvb09zNVtPfVI8twMFy2JK3py+z9gZy7He165MNntz2j8IeRUZrzci9ZsG7NiGfP8QGJ5djpKToE1U9O54jwJm3WEtqHBpuNKsXwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Fri, 14 Apr 2023 15:17:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 15:17:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Thread-Topic: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Thread-Index: AQHZaK9ya+davEyaqkWPdww46zK+Z68k0KeAgAYmj4A=
Date: Fri, 14 Apr 2023 15:17:59 +0000
Message-ID: <ae72a0dfb157a9944434b773a93d82d40c7cb4e7.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
 <35d5f2da-115e-5873-1e3e-ba4db16537eb@intel.com>
In-Reply-To: <35d5f2da-115e-5873-1e3e-ba4db16537eb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6095:EE_
x-ms-office365-filtering-correlation-id: 5c6bed52-ed06-41a5-efe4-08db3cfb6ea4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y+E0Kzx1hutWWvRGZRzrGLD7/1T29JXetZOEEszroX5lmDVpk57gSI3d9bLdf9Z3L9zz+Hi9yitlP81Iwq4AFqQsMvsCVHhhYoFUhKIsNj4hCIQ4+A5FTO1vYhZDMc/7vGNqmIuonEGWA+PiXrsy9Tl9yw8wvQdmGwuF4bvE70d3qZcY68MqU47AEhJmU6y2aJPMs+MH//nPBuQRtw/bVCXYcXglNUodO6teczogpQ68JDFbTKymjretFfkk2VXfKjqDGF34H7JxgyBspnXQgF9y69ii6ehLzhhQQwbxeEOvGBpgFH9QKgs+iZwBq40TUApheMYAYiaP6OYgLxDT1IAnRzqdECyJyK0pblEQww/MTHjEoK7ZehDOx9cEi8/X4wJWBp5svuyBLocAKGQpgRbKDjVOdDXI9war45J0pXKopsc5EVDQkgyxpH6MxBSHEDYkXMswU+QCYZj9sE7MT5ej9mqvWOAYwCP6QugecIKEGKRngN8/aiNzpBkZtJrUs9aw5Wh6L0JZPDf5i31h9HCHUF+g8ahzJ/c/CtW9kmc1WSuk6CxoqbDOqKaYbJxx8t6LvpTzv7gaOmppXS/CCebxOHcbOf+SuR/68Qn+HUDXRJxyDp5Evq2Jpo7W2ZIs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(66556008)(4326008)(64756008)(66446008)(66946007)(66476007)(76116006)(316002)(107886003)(2906002)(36756003)(8676002)(41300700001)(186003)(8936002)(5660300002)(54906003)(6636002)(478600001)(110136005)(91956017)(86362001)(71200400001)(38070700005)(122000001)(38100700002)(6512007)(26005)(53546011)(6506007)(82960400001)(83380400001)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2kwOWhLNHRHMTJGK3U5VzQxNVovaUk4dFQxOEpLSlVLMlFMV3BKN0lzZ1dQ?=
 =?utf-8?B?aDF6MFFkdEZnTWI3WXg1NGdrbkk4Um5CMjl4UW85ditNSjhRa1VOZzk1OENR?=
 =?utf-8?B?cC9YVGxGTm52L25rWFkzYWZJQUFiamxDb1hraVo0a2hUNHlCVWpsbnByOGxJ?=
 =?utf-8?B?RnN6bUpicUV0bjZXL3NXQWZmSnV0MC96eTNrTXhDU0R5WWk0S01WbUJteHBv?=
 =?utf-8?B?R21HY3ZYYXVkVU9RdmduVnV5Y0pqV2FidUt2T1dHMVVHZWhORmZTV29Xb2Zk?=
 =?utf-8?B?RVFkNVhpVSt3UzVVOHJiWTlzbEZBdUlpaEhLSy9uZUptd2h6ek1nWUU0cUFB?=
 =?utf-8?B?T29ocWhDK1JjTHVTWitqNWI2MEhoaXlocHV5WlFZMTlVL0d2cldGUWlHdTlT?=
 =?utf-8?B?b256RjFuMGdsQ3NxdUtzRHNwRW1vT2VKeUkxZFpCY1dxekdiMHB5emwweTBP?=
 =?utf-8?B?ZFAzYXdDRmdoWWRzTDBub2xOWnVkTlB5d3FVaU43NTJTM1JiNVVXMUpjTjhI?=
 =?utf-8?B?U2dOZ2hsa3BDc1NGaElrZWZKQm53MWt3WXFYcHZaOVZHdGVOenhsWGFNL20v?=
 =?utf-8?B?TlEzcjl2dUNodDZCWXd3TXIzcHJJLzVNN1VJSmtwM1d3UVZ3dEpWb3F3Wk1r?=
 =?utf-8?B?S1MvUEI0aU1QbVU2V0VBaHk3bEVoWE9QSUgyelNJQ3ZmM0RQeTRPYkRCMHhr?=
 =?utf-8?B?dklOZ05FaThMRHdPSk9JM2NPS0tjUkpORFNETTZtelNXZUZTMzJTRStqSVRz?=
 =?utf-8?B?OEN5MzF4VzBKZWVnQk9PWHRtbHZkczZCSC9MUXJCSnloUk4zNFMwdnJKT0RP?=
 =?utf-8?B?SG8rdUVXeDlMMkQzVjBRQkpFZjNvWVNFTzB4VGJTeEZla2R2TkdoSkk4alJR?=
 =?utf-8?B?RThMRVR1SUJSd3dQNjlMZW1ZWEl3Q2FyZG8yaDZiVHhZbVRZRTNCU0xId2pM?=
 =?utf-8?B?TUZFWlNPN0VVeXJZVnBzNkVYNElWdUdqdzg1V0hwQW9CK3ZlYlBsSnFtWk90?=
 =?utf-8?B?ak05M0xPT0l5anlXN0JZcnRsQUwzVmNQOFZEYk9DZ2RMTS8xMTgxWlk2OFdu?=
 =?utf-8?B?MFhubXVEUS8xakVGZTIxK0NMMTBDNHNvSWRoSEUwV2JJTlpNUmdqL1E0MVVw?=
 =?utf-8?B?L2pCbmczaGVwRk43UEZ1dktSTWZmaWtPSkJWVlpHWGZHOFhqU1VXVGJiTWtQ?=
 =?utf-8?B?Zmp5ZlFKeDVqOStTMjF1bTRyUGU5MEk5SHRyUzFzek9tNlo0bVo1OXlieGxS?=
 =?utf-8?B?WXhvczBodzBKYVdDaExGcmRDeStsNDVKaWJueW1acUZBcDZBbHJWZ2R1ZWRF?=
 =?utf-8?B?T0lmQkpMNXpJektTZzA3b3g5TzMxTy9DdjMyNVljRDlFS09YVlRNUGpJWTEz?=
 =?utf-8?B?eGlubzU2eWhhV1hEOEw0SlJUZlJ0NkNmeEw1QVdEc2dOVEhEekVmNmYxUDZJ?=
 =?utf-8?B?SGJXVm1Qdi9WL0tZNyt6ZXhiT0dIL3dmMDdCRXFDa0JCMmw2ZytoWkZCQmw2?=
 =?utf-8?B?OXNYSVVzMWRuVzk2a3NLNGNicnh6RHl5SnlLSDdXVmtkWFlhc2YraVpWRWtR?=
 =?utf-8?B?K29ySC9HSFd5WXAyK3ZGa2llOW90L0p6Ti9zRUs4QWlNWVNJeEZCUUlxYVln?=
 =?utf-8?B?NzR1cEM2Rm5wUEgzN20rTUFQS21zOXlPQ1FIVTNiTkh0RXpXWXFSRm9FM2pt?=
 =?utf-8?B?bFk1d2M5R2lBWXQxVHNXZ1lCamp3SnRHU29uankzRXpMMFgyZEIwMFBRcE85?=
 =?utf-8?B?WWpjZnRWSEM5bkVMU0RtUWdrc3lMbVNsRWl3Q1hOUzJQTDUrdk9YTFllcEM2?=
 =?utf-8?B?TVk5VkcyUnR5U1RlL0VlTWFLOTdlWDFlVHg4TGo0MnJjSmU5V3kzSGpsMzJw?=
 =?utf-8?B?ZXVhTTNzYmo4THdxcEVVamtYeGJhK25LZndvQU5pRVlaYzBNMTBHNFpQRU4v?=
 =?utf-8?B?S3pleUFNWmc5YUhRTzhETjJCUk1QMnpHdnd4SnYwcFJWNUI5bFQ5RDMzNjFs?=
 =?utf-8?B?MTQ3YnZLblBVNnI0UFpDN3Rsc2VBWDdoZjZESWl1UE5Xa1FId3MwWGkrcmk2?=
 =?utf-8?B?ZnNyazlxdWNUZWxCWldFd2RxOXFXb01LUTAycG1lZU04Y1Zpb3dUcFl2QlZH?=
 =?utf-8?B?T0k1Q0hmMGo2d25VMkdacHdSZUwxOWtmWGV5elFpWmo4K3FsdVgrdUJybEM1?=
 =?utf-8?Q?K6h7Axbi7PvUgyjwI4DgDJI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B0DC4951BA0C5499D5BDD5EC2DB7BD9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6bed52-ed06-41a5-efe4-08db3cfb6ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 15:17:59.3747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxJzyKS8UZ2aOc0JqBvpmhNV6QNoMlpZAWxP8s2HRPSH87hye2RGE2iowzxMeMlxKPBBe+i8h7PvDZXFBeNxJCCGpMNu6AfdigCysyKzx9uUDlTwRFMLQolmqIzDW8le
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGlvbmVsLCBkb2VzIHRoaXMgcGF0Y2ggd29yayBmb3IgeW91Pw0KDQpPbiBNb24sIDIwMjMt
MDQtMTAgYXQgMTA6MjIgLTA3MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBP
biA0LzYvMjAyMyAxMDo0NCBBTSwgQWxhbiBQcmV2aW4gd3JvdGU6DQphbGFuOnNuaXANCg0KPiA+
ICsvKg0KPiA+ICsgKiBRdWVyeSB0aGUgc3RhdHVzIG9mIFBYUCBzdXBwb3J0IGluIGk5MTUuDQo+
ID4gKyAqDQo+ID4gKyAqIFRoZSBxdWVyeSBjYW4gZmFpbCBpbiB0aGUgZm9sbG93aW5nIHNjZW5h
cmlvcyB3aXRoIHRoZSBsaXN0ZWQgZXJyb3IgY29kZXM6DQo+ID4gKyAqICAtRU5PREVWID0gUFhQ
IHN1cHBvcnQgaXMgbm90IGF2YWlsYWJsZSBvbiB0aGUgR1BVIGRldmljZSBvciBpbiB0aGUga2Vy
bmVsDQo+ID4gKyAqICAgICAgICAgICAgZHVlIHRvIG1pc3NpbmcgY29tcG9uZW50IGRyaXZlcnMg
b3Iga2VybmVsIGNvbmZpZ3MuDQo+ID4gKyAqIElmIHRoZSBJT0NUTCBpcyBzdWNjZXNzZnVsLCB0
aGUgcmV0dXJuZWQgcGFyYW1ldGVyIHdpbGwgYmUgc2V0IHRvIG9uZSBvZiB0aGUNCj4gPiArICog
Zm9sbG93aW5nIHZhbHVlczoNCj4gPiArICogICAwID0gUFhQIHN1cHBvcnQgbWF5YmUgYXZhaWxh
YmxlIGJ1dCB1bmRlcmx5aW5nIFNPQyBmdXNpbmcsIEJJT1Mgb3IgZmlybXdhcmUNCj4gPiArICog
ICAgICAgY29uZmlndXJhdGlvbiBpcyB1bmtub3duIGFuZCBhIFBYUC1jb250ZXh0LWNyZWF0aW9u
IHdvdWxkIGJlIHJlcXVpcmVkDQo+ID4gKyAqICAgICAgIGZvciBmaW5hbCB2ZXJpZmljYXRpb24g
b2YgZmVhdHVyZSBhdmFpbGliaWxpdHkuDQo+IA0KPiBXb3VsZCBpdCBiZSB1c2VmdWwgdG8gYWRk
Og0KPiANCj4gMSA9IFBYUCBzdXBwb3J0IGlzIGF2YWlsYWJsZQ0KPiANCj4gQW5kIHN0YXJ0IHJl
dHVybmluZyB0aGF0IGFmdGVyIHdlJ3ZlIHN1Y2Nlc3NmdWxseSBjcmVhdGVkIG91ciBmaXJzdCAN
Cj4gc2Vzc2lvbj8gTm90IHN1cmUgaWYgdXNlcnNwYWNlIHdvdWxkIHVzZSB0aGlzIHRob3VnaCwg
c2luY2UgdGhleSBzdGlsbCANCj4gbmVlZCB0byBoYW5kbGUgdGhlIDAgY2FzZSBhbnl3YXkuDQo+
IEknbSBhbHNvIG9rIHdpdGggdGhpcyBwYXRjaCBhcy1pcywgYXMgbG9uZyBhcyB5b3UgZ2V0IGFu
IGFjayBmcm9tIHRoZSANCj4gdXNlcnNwYWNlIGRyaXZlcnMgZm9yIHRoaXMgaW50ZXJmYWNlIGJl
aGF2aW9yOg0KPiANCj4gUmV2aWV3ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IA0KPiBEYW5pZWxlDQoNCmFsYW46c25pcA0K
DQo=
