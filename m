Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC669A726
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BE110EF17;
	Fri, 17 Feb 2023 08:39:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6A10EF17;
 Fri, 17 Feb 2023 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676623165; x=1708159165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G5on/nBAMQF0SSP19TyBrJMO0qdlda824GLCwG0bCpM=;
 b=DEiDRnUSf2J06d9o2DArNiEeKN+qNBJB3UM9hlv/SJOPe+On6W00jxUI
 Vx+bb5Cn5pMwM03HdpKJEU9eo2MuW5Cj4B9g5ZJan8nnVkYqMjHeKxS91
 dSuSxj035S0HbRNgc10I1ixjvu92XIKxc382WfVHKWgyyTn63uz8trfim
 EdP6ucL8KxSdetmcBQgCnPUfisGNXKBleMbMqOpNOBAfnSN3gQRvIiJal
 18Kv47djsoJd1bandSNxTcD4zNLrnT2/fWwlr0o6sv41cL/ktItDGrx9o
 GbIlOXX1qJx1+ckwFKPPjKzEuRnNGEKKOqud1rM6b0JRB1qSAAauXIBx0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396617834"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="396617834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 00:39:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734226956"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="734226956"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2023 00:39:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 00:39:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 00:39:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 00:39:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVLipktB7UX9oca4f9Aj24WAXF1LTBKPbQPxcu39GTRggMfVea2ujbA9sc1dWWLC7wSzXTzY3RkB6xxMO7V8ARBCveDVBDbadVlc1Wpme6axjOvG1h3B3dMtXelgjFEPP2E/bJU8b29GsY4k1FcZdZVuWAFtsgap8JMJGqS8VTrrerqTyt4x0qud7TF5mCiehk12W+xELsZTrBJKxCK+dHR/vGxKvAG51nG1WU8vBbOS4vrOHGf6Ywe2EhfVKlkhGeRO/LJi2yDVI+c3rbxSASk67JHnxCJrt4llPYPYjgHCIU6WXhWOL8uoesD0TEscyt/yVFeMX6H86x6IXr+/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5on/nBAMQF0SSP19TyBrJMO0qdlda824GLCwG0bCpM=;
 b=KuW5qlB1scMfERXvi7phweQazoRuUivLFzFJZ+Kvq4loPMET1uzkrjxoC8OTz/u5/RIWajZICyYhd9gnm5DN4D5BFIMQoli3MDKCKSLAw3uPT/iA+PwSy0ln0vFWUnq1EHKxoO/XVE9aNYUMgX6iFIOeua0QAVJIafBO07n51ZzsNW7g8GU5Z3QZvfwU6zZWg3bKKsdlsdFj5D7zBzpUb190OehiUtls38iyHO3IJgPsrUVUk7wTE/grYXUC+/1dEQKFwArkk5rp+kT1XshvEa/JeR/FlWnhuBO79HgwyUISL+hPR8vUkq/EjTJYmMY7/WtwBLrcczF7lkrbS3363A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.15; Fri, 17 Feb 2023 08:39:01 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569%6]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 08:39:01 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Thread-Topic: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Thread-Index: AQHZQaOw6xdxOPOm/UG+MwrtGUL7Rq7S00eA
Date: Fri, 17 Feb 2023 08:39:01 +0000
Message-ID: <03de3c68458fd5c44e9fe1d4bba4687ea49c4788.camel@intel.com>
References: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
In-Reply-To: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW3PR11MB4572:EE_
x-ms-office365-filtering-correlation-id: 2594c813-db51-4741-52ea-08db10c26b3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u16h3881fYhm+DwVhCVwNRGgr6TPzA6J9VhxXbBh/01QPkZSr9vQgH5mAiWf6NxrWIXOcjOQe1acO7GnV/VDmllfHMuaYTU0dRBe9u3VYj46ffF8b5vPgTtmGgkSMO+lQMeBcny8dIw8OYzrQuyjhgkXAOvHLIR3b0F6YAMLSjAiCMa7kbv8wJrUWSlCCQsUNZPXnTiLvqegnNbUb3oYNNjSCgpgDos8TOuQtes8GiLTS5/eqwwycdSoT03A7oGTyqWp5wBflQTuPl5c/7eaHkEKi88IWN3pY0Q3+YXXPxDSBZ96ZWeG+MFCb+tLA2ai2yTvDw1HV9IxRjNS5XNpjAtR1ECTN7saS270+6O2UwCk1rWMvZRM3PXDNRM072uCNbjjQ+MoUF0VP6Z8OMBaHDF70oGa+e2h6CF8xIOW2+qdWqaW0JWx6i8dY3BzBpUbmfFIArnChBDeJkyVFo9YTXC8E3Sox/lzLs5M9VJo67QAYnkYIcOwdt8ysludf7sYsYoxOiTkme8l4viSEuvI/Er7i5jLRMMHt2Gcrt18zHIHAFPQuMwJEgXdQL7ct1OZ7HVii5HzTboeX3xH0JAq8IZ0kqki11wR4TNQSPEJ4s+SeBXfcdwl84ZL9/Hd3WZZE5vC7eRZinUeKvAay5Kq1AN6pGT72EFQKldJf01mTGO/oUlgaDeRH7lipvP8d0dqgWbHgidCM5Jb3lOWijEqfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199018)(38100700002)(82960400001)(36756003)(66574015)(83380400001)(2616005)(122000001)(8936002)(6486002)(4744005)(4326008)(91956017)(2906002)(76116006)(8676002)(66476007)(66446008)(64756008)(66946007)(66556008)(450100002)(38070700005)(478600001)(86362001)(71200400001)(41300700001)(316002)(5660300002)(110136005)(6506007)(6512007)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MCsydlp1a1JJSC9mWk91TGhWMEU4VGtMSHpPZ2VNWVVld3lNU2JKSU5PWU56?=
 =?utf-8?B?cUpLNWNEUmhwYWt4bllxUjVkVUU4d3VSMlJ1RG94ZWJiU2Q3SVUxWFpKbC85?=
 =?utf-8?B?ejc5TnkxMWFYOW12YVRuVy9FNmt2a0RHNy9pS1NCV3R5UVJXMVdyK1FTOERZ?=
 =?utf-8?B?WGRHL0VSckFBaGorb2ZCd1NuVzVaZ1BuVUxvN0ZaZE1PTUVYRnNyb1V6V2ht?=
 =?utf-8?B?L3Iyb0E4WndHRGZmSjZacU9nblFPbTRRVEVZSWY5VTJQYU1nUnc3S21JcjZ1?=
 =?utf-8?B?VmRzeWNVM1lBQ0F3MkdTcmYrdnNQN2loZjJ0eThOY1F3dTdIZDlIRERQcHJs?=
 =?utf-8?B?b0k3WVVpVDBKeWJONEtLZ1RJcXhrWVVKeFU0TXFHNTVxckhYVGlzdHR0bVQ4?=
 =?utf-8?B?UTNlY2FOVjFvZEFaZE5aYlp6aGtKWkFJSGNwcHdMdk5kSE5LM29WSFYrZWZt?=
 =?utf-8?B?bEZOelk0dUJ1L0dmVTJOclo5WWZOc2o3ZkQ3d0dEQWxPK1Brek1XWlJhdnFZ?=
 =?utf-8?B?Z08vMm5KeHhBb2hYR2QxQU9iVGRHUkptU1lEbTlBeHRqZTBBUUNqditNcUd4?=
 =?utf-8?B?Tkh6SWRadTdJRXVkVmUzK1MrVzJzR3VkU3RFeUZDMm9YaVArUFZPRElBY2lR?=
 =?utf-8?B?anlobTNTdW5jMkdMVmhlTmdmSDArUk91bjJveVZybzZiSlQrQWxSQUNEVXJz?=
 =?utf-8?B?OE1EQ3A0b0FjcmVUOG5aVldVdS9GQldjVGxjdEhiWEFNSHVJOWtxZ29lQkRp?=
 =?utf-8?B?dXJKblJFZ09ZdWlIeFBRaml5VUNXSVFwNjRjVHVTYzBwUGYrRzk0VXExdGhT?=
 =?utf-8?B?NU01ZXhVWVNpRGxTSitqR3M3RytUSHZubnJ4ZzRTYjNCdlBhRXVBUlhBUk85?=
 =?utf-8?B?S2kvN2dydlZKYjlGZUNVVnVOcUlWVHQwb3hyWm51dWZmc3lGTEo3T3RyRWxX?=
 =?utf-8?B?cVJhTXZaOXNFbnZYbDBUYUVrM2dnak9KVXlZa3ZHK0VNczBYNStNNm5MMUI4?=
 =?utf-8?B?bTUremFsVG51bVJKMmpWc1pRTUdGVVI0WmZTWHBsWUoyclVrNEFjUk9aV09X?=
 =?utf-8?B?ZzFleTdiUy9wVEFNamEzVGI5QllRSWpORWNqN0dOMG05VE0xK0pyc2FEY3VX?=
 =?utf-8?B?elVPQkRSTGV6Y0hNbkFqT082b0t6N0lOcFhFTExYa3hsaEJEdVlDVDIzN0Jy?=
 =?utf-8?B?eTN1MS9sMlNZREdHNnd6dXBNdXY1THZITGNsNnJrcFJrVGg0SWloVTFFaTh5?=
 =?utf-8?B?dzBEWExBYjlyQjZJdVJKa09ubDNzK0FDNkVYSzJZM2RsdmlUK25oNFczcCsy?=
 =?utf-8?B?N1dKN1hoYVpUbDByNi9MNHlUdjA2bWVQRnFrYmV4SWRPZnkzMVRDV01qU3gw?=
 =?utf-8?B?WU5jTTErOGVxVE9nMFc4UmY0bjBQb1F2bHRGV0hONW5oaEhEV0dNcTM4VGxx?=
 =?utf-8?B?MFI1YlF0UkpsQklNZG1ndmFscUZyZDNkSEdJUVBVVC93RU9XRUM5VlBYY09p?=
 =?utf-8?B?V1oyZUFNTENFY1lvcmJ3V1p6WkhpalV3eEpBQ0p6VWNQU01URDhTY1YrSTVM?=
 =?utf-8?B?WUpHb3JrekpGang5aHUxOC9qdmpreVZxVVM4dHgrb0lvc1NhaHRNeFF2NU55?=
 =?utf-8?B?b1ZubElhQ2l5ZC9ENDVIOHJ1T09sMHlSWlhXQWU3dGFkV0QvUDExSlB1MEUw?=
 =?utf-8?B?bEgyL1VZazN4WjdaWGMyVGdwNlJxZFhNMUR1elhkR3ZUeWJsT0xvc0tRcS9D?=
 =?utf-8?B?ZTRudFZBZXNYa25Xa3lPRmFTUHVoMVRUV0tvSlhmemlQbXpESVl6UzBmOWJG?=
 =?utf-8?B?a2VpZGxzZGJIWjRTV1lVcUptY1lDRC96TDZFemxLdWxiNGQ5OCtxc0RDc2s4?=
 =?utf-8?B?eGIxOHBrWHJ2NnE0WHdJMVo1a05CVDBwNVc1cXZteEVQeGxKRExZbEhSK09O?=
 =?utf-8?B?bTh5NXIvRElJN3VGQzJiK2NVSzFRWFQ4VUgvTEZwLzUzQWFSeC9OTWF1L2px?=
 =?utf-8?B?QVJKaCtRWlJIWmRSV2EyY2t2REZLMG44bmI5dDV0YXFxYkRLVnhndzAraXAr?=
 =?utf-8?B?Q1Y1b2Z0MXpQWWlUMXppRGVLU2E5VVpNbDJYYWR3eitxUmp0c0ZmTWljTjlQ?=
 =?utf-8?B?MFFlcmE2bmRNOTlUTVM1OW1LNStTQm1OTmoyWjh4VU1OUXUxMGlqcHA4Ykhh?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <760A2115BA0FF8449B9987E542AC8F59@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2594c813-db51-4741-52ea-08db10c26b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 08:39:01.1313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrSV2CwdFZCHXp+Ky4idxiFw9FiSdN48dsDQIVMK57Qf7FE5dlWjMSryXsI1/B6z+0fMn2kg3Vgu9UEf2kR1/bymCkBmG9Y5IHGhdLKyLQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAyLTE1IGF0IDE3OjEwIC0wODAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gSW5zdHJ1Y3Rpb24gZnJvbSBoYXJkd2FyZSBhcmNoIGlzIHRoYXQgc3RvbGVu
IG1lbW9yeSBhbmQgQkFSIG1hcHBpbmdzDQo+IGFyZSB1bnNhZmUgZm9yIHVzZSBhcyByaW5nIGJ1
ZmZlcnMuIFRoZXJlIGNhbiBiZSBpc3N1ZXMgd2l0aCBjYWNoZQ0KPiBhbGlhc2luZyBkdWUgdG8g
dGhlIENQVSBhY2Nlc3MgZ29pbmcgdG8gbWVtb3J5IHZpYSB0aGUgQkFSLiBTbywgZG9uJ3QNCj4g
ZG8gaXQuDQoNClRlc3RlZCB0aGVzZSBwYXRjaGVzIGZvciBHUFUgSGFuZyBJIHdhcyBkZWJ1Z2dp
bmcuIFNlZW0gdG8gZml4IHRoYXQgb25lDQphcyB3ZWxsOg0KDQpUZXN0ZWQtYnk6IEpvdW5pIEjD
tmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQo+IA0KPiB2MjogRG9udCB1c2Ug
QkFSIG1hcHBpbmdzIGVpdGhlci4NCj4gTWFrZSBjb25kaXRpb25hbCBvbiBMTEMgc28gYXMgbm90
IHRvIGNoYW5nZSBwbGF0Zm9ybXMgdGhhdCBkb24ndCBuZWVkDQo+IHRvIGNoYW5nZSAoRGFuaWVs
ZSkuDQo+IEFkZCAnRml4ZXMnIHRhZ3MgKFR2cnRrbykuDQo+IHYzOiBGaXggZHVtYiB0eXBvLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVs
LmNvbT4NCj4gDQo+IA0KPiBKb2huIEhhcnJpc29uICgyKToNCj4gwqAgZHJtL2k5MTU6IERvbid0
IHVzZSBzdG9sZW4gbWVtb3J5IGZvciByaW5nIGJ1ZmZlcnMgd2l0aCBMTEMNCj4gwqAgZHJtL2k5
MTU6IERvbid0IHVzZSBCQVIgbWFwcGluZ3MgZm9yIHJpbmcgYnVmZmVycyB3aXRoIExMQw0KPiAN
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9yaW5nLmMgfCA2ICsrKy0tLQ0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KDQo=
