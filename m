Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEA06EE727
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 19:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047EB10E17A;
	Tue, 25 Apr 2023 17:56:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E3710E083;
 Tue, 25 Apr 2023 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682445381; x=1713981381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bPf1qtEwJwNi/UuWmy+rdSAVtIAtRqwRjcR/tdQoQM8=;
 b=B9ZfziLpuaAagWah27b4x9Af5gutRQjPx+rc2lqiEyDbejpWS+c/375g
 9lfBT0HBQgPQ4iaWJD/n7R+F4HhbznreNc5+nq4idHeeHfaGfQU2FJvEi
 5w6734Kiqt6akYCt8R9SmlijcoE5aoB4b0i0Tx96TIrgJmaa0znpHvToP
 jbxfAVUzdg6eH8rh8JwE250KQ0/dWH45Ddw9lZceWUNtUqTN/nY0N5w7f
 /hKqkPZPAgiaSLogUm61ALJW8ixurEmT8+TrK8f4IIYtLpllhp6wvlfUJ
 IyLvSNQnNAFqZkV1BgHkAHp/wBNG+MFw5vI5i06fVNYfVjofTRrK1PzpX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326454179"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="326454179"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 10:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="939855177"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="939855177"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 10:56:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 10:56:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 10:56:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 10:56:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 10:56:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2ejPRH/6ONwwoZpwHvcATpjle/YVGjg4m/Lfdt66K3TtwMoaV4lwf3DJIRLRVU+leC2ll0+OWiYUv3k4DNrD6v/WeD76Q1qogglx5Bi3AFsREGEEINSH4nDq5XJ6Vqgi+vZ9/v+POj9D/bG3mJv7Ibi23fVkq/ccKUak0AKV2SjjSDv3490Nx/kwzwz0r8IMyvgRTSTezfmBa8KEE8nEmnoYolGqp8vmf/NM4WVBkT25Y3Xu0+FJ9tIVM6CRPBaAgrVlTzwD45b9ZQJmwV+P0pect/tQS9pKX+Wphw3q7ExETjbbcna3d+3XyjtsOybFsGlYyVqufVM+9O34mBcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPf1qtEwJwNi/UuWmy+rdSAVtIAtRqwRjcR/tdQoQM8=;
 b=NC/K0TfAjP6vlr6S+h8U54Mhpoyt5UKJuiEW8WDQX5wzVsQ16II8wSiBw3v6qz7ZtnCGoyrp9UMQ5vRTLwXECem7cN3AmROGlaokh1Urqv91nbcddn1+qMvmabm89iVJJAIl+jgV8URZhblOff2XiKAKZvZDpNkZuf9LaNTw9JxAHdJ7BbAV6LxGrfu6FtMzuFUmmK433ltp0ktnsCa24xN43zO2N7dh0MuZtxLRVn+3O6H3Rdx5ExjFNcMNanJrlB3qjquifzMtG8h2jhs2m7nG/mBXuWW5KIv+u99amlbDKAoYqN/texAD9jNt+ESDHphR5JckYvRD0XgBBAfpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 17:55:59 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 17:55:59 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH 1/5] drm/i915/guc: Don't capture Gen8 regs on Xe devices
Thread-Topic: [PATCH 1/5] drm/i915/guc: Don't capture Gen8 regs on Xe devices
Thread-Index: AQHZaNbhVLyJb4iKc0OO37ghQOKjoq88bK+A
Date: Tue, 25 Apr 2023 17:55:58 +0000
Message-ID: <97546a0ca475345fd18f8d80fafa5f7a11e34101.camel@intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-2-John.C.Harrison@Intel.com>
In-Reply-To: <20230406222617.790484-2-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN6PR11MB8146:EE_
x-ms-office365-filtering-correlation-id: cf0ef69b-f6f3-4ad2-ab04-08db45b65361
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y93ZMdSM2CXVqG6+XBHFPbldbeEHLf9yfR3KfRbuUajkuDUb0W2HOUaXh63iCkj1U1z28za4MauD4Si0Zrw0R/FqUWs9FyH3VTVuZZlCb4RExwLcUYAovQMAFxhlr2fIFg3Amr+K/UCZjNcflq+iMr77aSS6qTePAFyu7QW31PCKxHsFjigAzId4ZnP/uUH9LIu8sKfDEmP5aQrewjWlw6OUHLdCm5inbToynVfAhKKJHm+eMRCeV9p1G4wYM5NCgfrUlRHSIdLvKs4O9YovSULtHV/HcKT3IRixUErZI/ggZhqoUT4fWYEnKb0MowDXBPGZpthduLoijD9+RxRhadtiP9rm+3kcAqJl/SbZqTOSj7Aa/gSIGXTiUYTfI0S8uKca+rQLAFIExMNPRSCE8RTl9/tKX2d8OL2pKtHR+3X18nThhN/CKCK6aYw8MHaK3YhbsphKO6L7i6kWpjFaiMXrDCAoBkJ7pk+aORX2H2Q+W90bTuXn/VeWlBkfyDx2a6ZP3ncHV/O9L/ULqgSeM2LjWyTbnjiBALtSbE0x1WF62sbxzuUV12934E7sfG/OsBD9QVgYBfy22CXV+r1POirddmNZ+vzfc3RJ/c3iIpS4CGVXbFoZ+6sIwUUO0Kd7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(107886003)(6506007)(6512007)(26005)(38070700005)(2616005)(36756003)(186003)(82960400001)(122000001)(38100700002)(66946007)(76116006)(86362001)(478600001)(66556008)(66476007)(66446008)(8676002)(8936002)(54906003)(450100002)(64756008)(91956017)(110136005)(5660300002)(71200400001)(6486002)(2906002)(41300700001)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2NVZGM5aDZUemcxOXZVckUyTncvQ1RyMXhGbXAwYzhhQkE4SEN1cnUra1VY?=
 =?utf-8?B?c1o4bFlkZEZrcURiUUptVEVNZkZwQ1BvVU0yRHRkTE96V0xkQzh2NHZaT3hx?=
 =?utf-8?B?N2hHR0t2dG16dlFsVTUxQTkvRkgwTFZLTnRNTUU0U1JCVUVCd0pWTm05bjVv?=
 =?utf-8?B?aS8xUC9Sb3JvWjh1VTU1YUcxTVhmRUpWVHk2R1J3aFk1TWVjRHZWRmtKTnJv?=
 =?utf-8?B?RlJKTy9KSU5hVUxUVG5TU1h5RXdjbUpjNTlGNVB1L3BrRU9hcmZVMzQ1blpr?=
 =?utf-8?B?S3lzWDVZeVZNUmhDU002VzRwcDZDTlNEdTlWNXhhZ2lMbTVNTVkyUWlqa2F4?=
 =?utf-8?B?VStZa24reGNEL1JIY3I5TURxVjJQZXdSTGRzOFRDbWhrNkkyMFUzdnlRd01R?=
 =?utf-8?B?RjQzUXJWemVXMnJxTXZOaVppMjFjTlhSSEpWU0lCZ0xCR2tIWDgvNHJSZDNi?=
 =?utf-8?B?Tk1oY3A0OEtPZmhWV3RmWjZVTDJXaENzQVpLeGhyWDB0b0c1WUYvd1JEVmdB?=
 =?utf-8?B?K2JiK205OTVzc0JiWWNKZzZFOUNaM1ZGSVlneFk5SW5hL29mcllZcGZOdGI4?=
 =?utf-8?B?NGtCc1NDTlM3bVZWNUNZQSswaHhreU1ZR2l4UUJUcllSSURQUWQrbmVGcXBw?=
 =?utf-8?B?YVhjcGtLQm9RUmJLYktCblFweUtMQlZCYzcxeEhZcTkxY0hHWDJZdW9aRW5J?=
 =?utf-8?B?Nkc1NG1NbGhpM1FiQ3BIc0dSMTloSy9GdFkyTzdYOUR2dzVnUjRKNHFtcjl6?=
 =?utf-8?B?WTk1VWlSSytMQ0FCbCtiQVpEYUxianV5emZ5ZHBpL0hUUFNSKzZXdFQ5ZW5O?=
 =?utf-8?B?aHo5ZEpjUGo0TklYMlNRdmV5N2ZTN1F5RjZtTldjTUJ6Z0xhdWJEdUgwNytK?=
 =?utf-8?B?aU1pdkcrRERsRVhXRlh2VUU3SU9OR1lDTEkyTUtwMFpUYzNTcXJ0U3oxL2Jv?=
 =?utf-8?B?OS9aYk1nelNTOEk1ZVhBVlcwNWswSE5ZNjlJU293bWpRZWhJLzNqeXFKWlpL?=
 =?utf-8?B?aGtHME5TSnN4S3BpelUzLzZkRGZ3OEtYWkVMSVgyVkxSbFVCR2JVNWVkRkFB?=
 =?utf-8?B?d0lYb0U4TzdjUW9INkNwSUxMTjBFa2JjeDdVTFlyN1dSRVVyMXlwSXRpSnN6?=
 =?utf-8?B?bjhUSlZkT3JWWVFoeFV6eGFUcVpyVGhXdk0vY0ZwQ2tQZEJvY21ad3ZLTllK?=
 =?utf-8?B?ZE14Y3MvZGlhV0dEUnFzQUl1dktQakNRUVB0enlobVF5UUdNbkZDVUdPdkQy?=
 =?utf-8?B?ck4zUW8ySTJoRmY3NzRVSG9GYWdFU2E3MVZRRVZhcmQwRkxtSmFIZnVGWmo0?=
 =?utf-8?B?aS9XNSt4SWlNdDZCUjN5T1FBQlpRQ1lqUk9tODNuTlJkV2RNZDZHdFY1bjV1?=
 =?utf-8?B?bU9McnVaQWlRQkhYZmV6UXE4WkRXYVJ3cTNORGx0dTFXQXFLWFJFeEVZS1J0?=
 =?utf-8?B?MTdCbnFFWmg1QzRkK2NybEhHV3dweCtTMjJ3bDdwa3N3V293SWhjSFYyZjk0?=
 =?utf-8?B?SmxtYzRRbmVkWGdjQzdRZHNkdWxvNm5IZHRid1hTY1hJd2E5UnljYVlQWjFh?=
 =?utf-8?B?R1JEaFZDcS8xK3BYb3YzdWdkZDlKajYwcWdtVFkzbEVpUXFOazdscVl3ZzdH?=
 =?utf-8?B?T2IyTEo0OTZCbW94MnBSTlR3aUFFOUZEdnZZSDJ3RVZlK21Mc2VrUkdaaDFE?=
 =?utf-8?B?eWFjandXRm1jdHlwb2dTdmdTS0FFWG5XWmRSWnlyYzJkdk1PWjNhanpqRkUx?=
 =?utf-8?B?N0JXLzRSSjNvaCsvUHp1WE9OdGkyTEZkY0Nic3dLZUsxS2pwSDNFUlZHS1FK?=
 =?utf-8?B?L29kUThiekJqeVY2M1p4bU14dzNhQ3owTmhObC9EYmpMQUlyUW5FckdsQjFE?=
 =?utf-8?B?VEcxU1M2ZS9aRVk5endqbThsU1dRSkdHcnBIK3ZOL21SYkVXUFZvTk5MWjBN?=
 =?utf-8?B?emErVHJUOW1kSWpxdkt2M0t2cTllM1Z5cE5vNHQ3dmUrQjFCQTJkOXhLcVZq?=
 =?utf-8?B?TnNLWk1PTDVsVUpNMXZuOU1WQXBWTDlmbEV5eXVLVmxqRkNVcG40RCtKb2JZ?=
 =?utf-8?B?MUhQZldoRkQrakYzQi9SWkFSaVpaTWhubDZ4NHNMY1VReWY3YmJFSG9uQ1ky?=
 =?utf-8?B?YzZpdjBnc3JFTGE5ZUpwS3RySUNjZHoyakF6OGdKY1dHeWw4ekxWUEhPSXdF?=
 =?utf-8?Q?2mH/VrPzCNVVwJuMr6OQUQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC5209E11A772E4D95E55BFE2CEB852E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0ef69b-f6f3-4ad2-ab04-08db45b65361
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 17:55:58.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB2p3iZlzVn2lOQ5HnMjV1+6RAnf05SrAFLhWumhwHwTwjs8Nv5WRr+mkaUBhipoBCwNorriCRhW6m1fZY4xOU3cKGdgjBZzS44MiTReDd5LRJISJBrbpF3GtmXTD6TI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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
Cc: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDE1OjI2IC0wNzAwLCBIYXJyaXNvbiwgSm9obiBDIHdyb3Rl
Og0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiAN
Cj4gQSBwYWlyIG9mIHByZS1YZSByZWdpc3RlcnMgd2VyZSBiZWluZyBpbmNsdWRlZCBpbiB0aGUg
WGUgY2FwdHVyZSBsaXN0Lg0KPiBHdUMgd2FzIHJlamVjdGluZyB0aG9zZSBhcyBiZWluZyBpbnZh
bGlkIGFuZCBsb2dnaW5nIGVycm9ycyBhYm91dA0KPiB0aGVtLiBTbywgc3RvcCBkb2luZyBpdC4N
Cj4gDQphbGFuOnNuaXANCj4gICNkZWZpbmUgQ09NTU9OX0dFTjlCQVNFX0dMT0JBTCBcDQo+IC0J
eyBHRU44X0ZBVUxUX1RMQl9EQVRBMCwgICAgIDAsICAgICAgMCwgIkdFTjhfRkFVTFRfVExCX0RB
VEEwIiB9LCBcDQo+IC0JeyBHRU44X0ZBVUxUX1RMQl9EQVRBMSwgICAgIDAsICAgICAgMCwgIkdF
TjhfRkFVTFRfVExCX0RBVEExIiB9LCBcDQo+ICAJeyBFUlJPUl9HRU42LCAgICAgICAgICAgICAg
IDAsICAgICAgMCwgIkVSUk9SX0dFTjYiIH0sIFwNCj4gIAl7IERPTkVfUkVHLCAgICAgICAgICAg
ICAgICAgMCwgICAgICAwLCAiRE9ORV9SRUciIH0sIFwNCj4gIAl7IEhTV19HVFRfQ0FDSEVfRU4s
ICAgICAgICAgMCwgICAgICAwLCAiSFNXX0dUVF9DQUNIRV9FTiIgfQ0KPiAgDQo+ICsjZGVmaW5l
IEdFTjlfR0xPQkFMIFwNCj4gKwl7IEdFTjhfRkFVTFRfVExCX0RBVEEwLCAgICAgMCwgICAgICAw
LCAiR0VOOF9GQVVMVF9UTEJfREFUQTAiIH0sIFwNCj4gKwl7IEdFTjhfRkFVTFRfVExCX0RBVEEx
LCAgICAgMCwgICAgICAwLCAiR0VOOF9GQVVMVF9UTEJfREFUQTEiIH0NCj4gKw0KPiAgI2RlZmlu
ZSBDT01NT05fR0VOMTJCQVNFX0dMT0JBTCBcDQo+ICAJeyBHRU4xMl9GQVVMVF9UTEJfREFUQTAs
ICAgIDAsICAgICAgMCwgIkdFTjEyX0ZBVUxUX1RMQl9EQVRBMCIgfSwgXA0KPiAgCXsgR0VOMTJf
RkFVTFRfVExCX0RBVEExLCAgICAwLCAgICAgIDAsICJHRU4xMl9GQVVMVF9UTEJfREFUQTEiIH0s
IFwNCj4gQEAgLTE0Miw2ICsxNDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9f
cmVnX2Rlc2NyIHhlX2xwZF9nc2NfaW5zdF9yZWdzW10gPSB7DQo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IF9fZ3VjX21taW9fcmVnX2Rlc2NyIGRlZmF1bHRfZ2xvYmFsX3JlZ3NbXSA9IHsNCj4gIAlD
T01NT05fQkFTRV9HTE9CQUwsDQo+ICAJQ09NTU9OX0dFTjlCQVNFX0dMT0JBTCwNCj4gKwlHRU45
X0dMT0JBTCwNCj4gIH07DQo+ICANCmFsYW46IHNwbGl0dGluZyBvdXQgYSBjb3VwbGUgcmVnaXN0
ZXJzIGZyb20gQ09NTU9OX0dFTjlCQVNFX0dMT0JBTCBpbnRvIEdFTjlfR0xPQkFMDQpkb2Vzbid0
IHNlZW0gdG8gY29tbXVuaWNhdGUgdGhlIGludGVudCBvZiBmaXggZm9yIHRoaXMgcGF0Y2guIFRo
aXMgaXMgbW9yZSBvZiBhIG5hbWluZywNCnRoaW5nIGFuZCBpIGFtIG5vdCBzdXJlIHdoYXQgY291
bnRlci1wcm9wb3NhbCB3aWxsIHdvcmsgd2VsbCBpbiB0ZXJtcyBvZiByZWFkaWJpbGl0eS4NCk9u
ZSBpZGVhOiBwZXJoYXBzIHdlIHJlbmFtZSAiQ09NTU9OX0dFTjlCQVNFX0dMT0JBTCIgdG8gIkNP
TU1PTl9HRU45UExVU19CQVNFX0dMT0JBTCINCmFuZCByZW5hbWUgR0VOOV9HTE9CQUwgdG8gQ09N
TU9OX0dFTjlMRUdBQ1lfR0xPQkFMLiBzbyB3ZSB3b3VsZCBoYXZlIHR3byBnZW45LWdsb2JhbA0K
d2l0aCBhIGNsZWFyIGRpc3RpbmN0aW9uIGluIG5hbWluZyB3aGVyZSBvbmUgaXMgIkdFTjlQTFVT
IiBhbmQgdGhlIG90aGVyIGlzICJHRU45TEVHQUNZIi4NCg0KQnV0IHNpbmNlIHRoaXMgaXMgYSBs
aXN0LW5hbWluZyB0aGluZywgaSBhbSBva2F5IGVpdGhlciBhYm92ZSBjaGFuZ2UuLi4gT1IuLi4N
CmtlZXBpbmcgdGhlIHNhbWUgYnV0IHdpdGggdGhlIGNvbmRpdGlvbiBvZiBhZGRpbmcgYSBjb21t
ZW50IHVuZGVyDQpDT01NT05fR0VOOUJBU0VfR0xPQkFMIGFuZCBHRU45X0dMT0JBTCBuYW1lcyB0
aGF0IGV4cGxhaW4gdGhlIGRpZmZlcmVuY2VzIHdoZXJlIG9uZQ0KaXMgZ2VuOS1sZWdhY3kgYW5k
IHRoZSBvdGhlciBpcyBnZW45LWFuZC1mdXR1cmUgdGhhdCBjYXJyaWVzIG92ZXIgdG8gYmV5b25k
IEdlbjkuDQooc2lkZSBub3RlOiBjb2Rpbmcgc3R5bGUgd2lzZSwgaXMgaXQgcG9zc2libGUgdG8g
YWRkIHRoZSBjb21tZW50IHJpZ2h0IHVuZGVyIHRoZSAjZGVmaW5lDQpsaW5lIGFzIG9wcG9zZWQg
dG8gdW5kZXIgdGhlIGVudGlyZSBsaXN0PykNCg0KKGNvbmRpdGlvbmFsKSBSZXZpZXdlZC1ieTog
QWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCg==
