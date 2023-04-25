Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D86EE7D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 20:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D6810E104;
	Tue, 25 Apr 2023 18:54:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181A310E104;
 Tue, 25 Apr 2023 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682448873; x=1713984873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+6zddbsFJr05X5Ocg0GXfrNervTY3yAgH9xLJ28qUC0=;
 b=KuKUHl5u0FqYw5MPr7pus5dni93J4tgWiUnG1XZf3fYZgOUZfG/vaDAJ
 xu5sJ/HQbZuAmIlkr3BzC431EaRboKNWjypToLb2YSTAfBOCyt3fwUc/D
 3263AZPk0qSFZpN5oQ1PbFoNhDg45KRvwQ+FFCUXKmne8leTTAOgpUJ8S
 0VpQ0ErqYK3o0Vg3OZXyM1d0vvksscfS6oqP0z36RsKKi7M4LJ2g8rTqM
 aSRCXnet/FKGdtGJ+U0pp3nrGu5a4oDCBlSqm3zby3ZuQqqJ7Ew4oNjVH
 +2+wK3obqZf5LrlrFrUeZ37fFy9z8Cxv7Pl6X/LuPCJHpwLdINe6nBKDp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344328778"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="344328778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="687569104"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="687569104"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 25 Apr 2023 11:54:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 11:54:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 11:54:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 11:54:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 11:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mudQ/Xzt0U9rT6vOaCQLZr6ZtJ6R+53/fSuKA2GpJGEnendS+YjkhM9n5OZrqn63c/41IrbgdDPIeXDnYL+VDkvrg+RzhoFksKaArlWtSWic9qflivhOkqo6TB+eXrulqcj2LZxU/+CS+jwAxOVAz0uwzIZKCTLsteEUxGBioM1mQSUD5EsbsqHl8kyQTb6gW+QijgIFfufRFLAQNEIVKMDtt6In0ckNfIFdHG6ZZFh9MCPwxr73v8/36SnGNKl7ANfni2rKvmyGWJtlWBG40DNMBNIf8qt04w2t3seeuwkLKXOrTpjhGvaSEWl7PGx2fpYeCjRJ+S1yt+E8oCrkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6zddbsFJr05X5Ocg0GXfrNervTY3yAgH9xLJ28qUC0=;
 b=mk2NuhnWM9Z3oxVmPq8D2ekYfAHkSJ3dfNwguEeIuu3OgLvOBHFh6iVVh0ZHQvr943e3iejG9Zph+q8hE7WWWIOA5IpnkCqhieB0ZtDnIIAH6OPh8fKS0mL8zWpTTDgCHDk5N2+j4vHD7vYRHGAWKdQlMaVAwKvTfok/u5un0yYnt3r12R5B9pBh7xph/h9389joUBvLhkdhK3P2ug7xjPWycY8v541JQHmvWcqBPv/W7fUxMV8l7TE2Orf1fQGH+cR16wK2Ecnkf9ndfQdSxc9bIXEFRs2xd0BR87njI5EH7ZBuA1cOm7go4wqFrUyL87BMoSOquB/tIsiZAN7e0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Tue, 25 Apr
 2023 18:54:29 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 18:54:29 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/guc: Capture list clean up - 2
Thread-Topic: [Intel-gfx] [PATCH 3/5] drm/i915/guc: Capture list clean up - 2
Thread-Index: AQHZaNbsuwx391nEmUuMi6Bjr9vaSa88fQgA
Date: Tue, 25 Apr 2023 18:54:29 +0000
Message-ID: <f5e1467bf61cafebd14a1b89cd7a1fc6d715f55e.camel@intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-4-John.C.Harrison@Intel.com>
In-Reply-To: <20230406222617.790484-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB6960:EE_
x-ms-office365-filtering-correlation-id: 16291d69-ac87-4ab4-bd0a-08db45be7fb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYV05xGpD/RRbGyNDkFWLI3MYGFFoumnYEDhg1pnnTReL86/2nuu2XQCiehskTCm/Xp1imFG+t+nab4F1shuV9jOgdM7SoEIZhMIKnXvVK6cDhby3T26p0/+ngqYglTExScErJK5LRlrEi6pxgpWGpsHT1qqjJUwrecuIaqT1A5isaUcw9i1+Rza0jU37ZlJRiP63WHDs3epyhlbp6rg/+mMnQUI3sejTdkgGBwa+VNJWFKJtzWkPlDSjZMs+wRUc+PHVEndDS2+71RibYNelgxi5b5sGZJpRE2rA3wQE/J7CfPCA9ZtC9dlq3lFtkZwmEtGsFWrnhCNjq4vmAuojddafYQMPUUESLciYx8NnbfLLW9peRwWjdWpsGvNc5ojSOrAxifojSiSkwMDXFuo+cHMmZSPWGVeA9ltzc9UNNtVRWMqkET1JZ6Pl9mnRUsjqLFwrsEsOpewtR+zgwurgKgRG1EE7u9zdbyU4fbA7jvd/ydnB+ybFZR88PUtJSlZhImxjEMHx8Bk5R/72O7UU42WLCnvK7+ShPqwUxO3rVF/Xk4lP1qY/+OxoNLjRMmpBX5rwtWywy17QPGbom1tUVuut6UMhBvsOw6q6NUFrPstnEw95mbzK0aFpA4yWHmt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(36756003)(122000001)(4744005)(2906002)(5660300002)(38100700002)(86362001)(316002)(38070700005)(82960400001)(8936002)(8676002)(41300700001)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(4326008)(450100002)(6486002)(66946007)(6506007)(186003)(26005)(6512007)(110136005)(478600001)(2616005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QStrUWNuaitWdGN2REpIU1FUMzBHeGpMTWovT054aEM2SlpuQXQ2RzN6V2VI?=
 =?utf-8?B?TFdXM2RmOHE1bTc2K2poR2I0ckFEK0R1VHFMditMaWEwOTBqU3BjTWJ4cjJY?=
 =?utf-8?B?Yys3K2pOR2kwalRva0Jmb2RKM3Z1SXlIaGc2emt0UDdiK2dxUVJwYlUxemhh?=
 =?utf-8?B?TDc5ZWJFbm9TNkswNWtEL0EwR3JtN0ZIVkVmbjhGUnNLd2xMWWYvWWs3Nlhx?=
 =?utf-8?B?dlNNR1hDaC9ENzZqdXdLUmVLT2xLcm5BSHFPbEw0Q3lXVDBkeHdNNjFvYTFv?=
 =?utf-8?B?TVExdjh1SUhmZ2xYWTh2TUdxR1NtYitDRW90ZDFSeVN4dDdIaGlPMmlGNENq?=
 =?utf-8?B?azcyQXZrUGFaYlh3QkdNZnRQdlI0ZS9kT1QySDZiWTJyZEsyZW5PN1BVRVNu?=
 =?utf-8?B?OThsSkRNR1pKOEVVN2RWb1dKS3prSE9lZm9IL0tjV0pBY3BoeTFpci9VdDZh?=
 =?utf-8?B?Y0hHNENsdFRPTHNRUzBDYzBsNkZDQjA5UGhjTVd3b0V3ZmNYaTNZK3UyU28v?=
 =?utf-8?B?M3NHbUxZL2t3N295S0dTNXh3RDAySnVBQjRmYmJqUkdCNjBRTU9hZGFPUi9U?=
 =?utf-8?B?RGtNV1hHS0dqQUJFV1BjWTI1VU1aMURUUWI5V1YvZzBYUFBlelp2VVFzT0V2?=
 =?utf-8?B?Y3dzdlJFb1V6bVRMM1AzNG5UZVFNTisrTTRYYTAvOWw2YS9tZWJnYmVzMW84?=
 =?utf-8?B?d2FlU2NSbk1WdTlETUQwTEc4dDlSWGRQYVBDV2xiSTBQcjlTMlk1b3h5dnlV?=
 =?utf-8?B?M2hzdHJaRVRDcmZuWEMyOGZOS2RoeDRqNG9pcVVFaitoalhXL1J5WDNCTE1I?=
 =?utf-8?B?SHJDdE1ENDNwVEZvT2M0dThaSWJnNDQxV2lJSWQrNnZWTEkvTy96OGZjV3Rs?=
 =?utf-8?B?MXhJQ1ZLWVVGWlJzNFh0RURZRjNuQzAxbW5RVHlXZ0hndFE3Y3hRR3ZLVlNQ?=
 =?utf-8?B?bndVNDNFQVpteE5peHhCeTBEK2lXaDRYV0JXQzcxZmE2TG5oaXFjRzRERWN1?=
 =?utf-8?B?Vlh1Nng3bWYwbXpTZnF0aGhzRnBzaUlmL0l4VjEwTUpZY3Z5MWMxRjhWVDNN?=
 =?utf-8?B?enFHQWhpb2lrYUFsY1BtNWF1Yi9IOE90dGU3MitEeXZNYldBM0JZdXVaZS83?=
 =?utf-8?B?bHJic2d0YkZMS2pjNTFGY3NFMnV4ZWNNS0pjSlVHVGxNVDM5bmo3V3FWM3hO?=
 =?utf-8?B?N2piQ1UxUEcweEd3dHpSZVNoQWk5SnlHdjVOekJWa0dJYVpYaEdzWG9Tdllw?=
 =?utf-8?B?T3hDME00NjBFUDdTUDY4NGVGT3lUNmpOUnVDcjZWQmh6RzZ4cnpmdkVNd0VU?=
 =?utf-8?B?K0ZjTEZRcEJnK0g2cDNaWHNnVzZBZkFhYkNicGkrRGZROHFHdkRlVVFhYWNz?=
 =?utf-8?B?ekZQemVJT3E5VGtTTUlOTnJLNlRmRXF6VnpYVndLVnVGMW5lUlBVLzdCNWNk?=
 =?utf-8?B?a2Vma0lRa0hqT3RFaFJHV0tjazd4NEwzZjB4bGdUQlRNa3l4dW9pc0psMEw3?=
 =?utf-8?B?bU02U0JuYnpPT1JhL0g4QWpOaHJ0YU0yeFRheHIrcHVKbVlpemkzUFJKa05Q?=
 =?utf-8?B?YjZjUnh0bDdLcUhoNXpXZDQ4UVFSdEVkUklnbG5MUmFpUGovUXJEVUNNTnd1?=
 =?utf-8?B?ZWxWaWdndlJ5MkxWcDE5V2t1NkRjT2VNMWFlMUl5ODJPa0FvbE0xcitxQm5n?=
 =?utf-8?B?b2t0ZUFvcnNjbGFQemhsMnNMaGRJaTN2RjFFdnNCb3ZlOE1sQThpdHV5S1Jp?=
 =?utf-8?B?S0RudUVPZjNVd0c1RFRFMHZkWDJOd3d2eTVoK3BGS09wcml5Q09MZVZTSkF1?=
 =?utf-8?B?V0M0Y0FSOUFSUU5mUU5JdzRpbDJxMVo2VXhkemREakN4cHBjNUp3eDB0cHBV?=
 =?utf-8?B?cGs1cWo0WmI1cHlPTnd3anZRWGczQURGZ2tPTnlRU01xZWEvdVFPRFRNN255?=
 =?utf-8?B?M0NqKzBhckw5MkNVckNwZm9EZlJvZmhsUnJESktZT05iekxSQi85b0xNcWw3?=
 =?utf-8?B?V2dJTmpJVW82NzhodHNzZFdWdE9IU21sOWdid3pib0ZTN0ZVdDNKcGo0RDhy?=
 =?utf-8?B?V1JuQXpYeDY5VCtFVzQ0RDViZ0J0TDRmQlJKVW9mRzBiK0ovWkxLWUxYemVr?=
 =?utf-8?B?QTQrcjRxa2hhU0M1aW84bEpkeVRFcEk3SU1XVS8xRXUrU2M3ajhzNmpkR1pr?=
 =?utf-8?Q?CUxR3sk1w6zVZdG2Siu4gq8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFF315F83DA4D344BE8A3AAB71F89370@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16291d69-ac87-4ab4-bd0a-08db45be7fb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 18:54:29.1804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJI9tYh/67EtJ3Q5kN4HXzr0EbEItJFPWx7QYIE2/qLxXojiHoOKy+jF/d6mXoCARZZmrBa5lZuV7rFKXWgVlXj4pMap4+I/lYufcO3bWcavgRgPcLwuJ0vRUC2jYWps
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

T24gVGh1LCAyMDIzLTA0LTA2IGF0IDE1OjI2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gRG9uJ3QgdXNlICd4ZV9scConIHByZWZpeGVzIGZvciByZWdpc3RlciBsaXN0
cyB0aGF0IGFyZSBjb21tb24gd2l0aA0KPiBHZW44Lg0KDQphbGFuOnNuaXANCg0KDQo+IEBAIC0x
NzcsMzIgKzE3NywzMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9fcmVnX2Rlc2Ny
IGVtcHR5X3JlZ3NfbGlzdFtdID0gew0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBfX2d1Y19tbWlv
X3JlZ19kZXNjcl9ncm91cCBkZWZhdWx0X2xpc3RzW10gPSB7DQphbGFuOnNuaXANCj4gLQlNQUtF
X1JFR0xJU1QoeGVfbHBkX2dzY19pbnN0X3JlZ3MsIFBGLCBFTkdJTkVfSU5TVEFOQ0UsIEdVQ19H
U0NfT1RIRVJfQ0xBU1MpLA0KPiArCU1BS0VfUkVHTElTVChlbXB0eV9yZWdzX2xpc3QsIFBGLCBF
TkdJTkVfSU5TVEFOQ0UsIEdVQ19HU0NfT1RIRVJfQ0xBU1MpLA0KYWxhbjogaSBtaXNzZWQgZnJv
bSB0aGUgcmV2aWV3IG9mIERhbmllbGUncyBHU0MgZW5hYmxpbmcgcGF0Y2ggLSB0aGFua3MgZm9y
IGNhdGNoaW5nIHRoaXMuDQo+ICAJe30NCj4gIH07DQo+IA0KPiANCnNpbXBsZSBwYXRjaCAtIGFs
bCBsb29rcyBnb29kOg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJl
cy5hbGV4aXNAaW50ZWwuY29tPg0K
