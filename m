Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D06E7FC1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE4810E9F6;
	Wed, 19 Apr 2023 16:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7AA10E1C1;
 Wed, 19 Apr 2023 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681922276; x=1713458276;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dZeIVTJUYeyKvE8Kdr0Bvpp2zuqFsGNJ2I0b51h5exw=;
 b=JpQJN3jlYDXwkPKuiukTUmjZ1Xj0heGCM3TMWPZmasAknpqFMQh42mk5
 e7HckBXpPdXmMBqPkak/hnz1D5CqUt3XNw8fzttX/E2jXFCsVLdY8sJb8
 jZPLGZDkSSYJ4NIXCRdos9/LninGmdJfyCEvpzaj/yGegyZdoAhBJJLYI
 jGaodPUrt2r4twXQLrZn6PJP+wQdbNUllM6srIx1asXltgAsBKmaDASnJ
 I6v3BUGpql9N+zevhS/IYavENwJo0GIf4XkSGOSBgoEjq1u0dMqJ2q3s+
 7nLWguG7uLFyVtn6FyTkm01KYhu4QvB0Ul2rNjGoey/ssM3ORDoRfKWa3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345500453"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="345500453"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021279302"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="1021279302"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2023 09:37:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:37:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:37:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:37:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSuLAm8fnLxa/9M6GSxfC63Mfc3Pv9WjAKjtOARgY/dl22z+gfyzAxsPKOnyHAp1Z3QA+8lklkIWvzb0GtGM6ueHgF0gHdkvWR0wy7sjDS7fpDTcqMIp3vhZkBlG7toeqX5gZL/8h19Ox9F6fzjL0Im3euvZZEY5WsTwfXfcVNN8A9ZtPWUQwIwwXsvBCUOfue5sIkHreErFr306SIfHdYdrPPotVO7HiZurhpwzIVGNjneuUHtlUcdEDxhnSy3LFhOoKpV59oyqH2BDd8Cn3i+7zVFY6snAdvBIPV9odhYJnquWzZgq1GWQk44GNl1qBerA67Xyir3y6N5GvYOK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZeIVTJUYeyKvE8Kdr0Bvpp2zuqFsGNJ2I0b51h5exw=;
 b=WuIrRTQXOQ0+asEgOsVMlJfb7vSYiRCt4GBu6ERkGeqgA4nZJBvBybdxxG2fIFSFA2eC0QORgXbNw7T9B0YeVuZdxwcloEonmQJlAMLuRxP9Nb3YDqF+fFlfGduW9JLZRdM/+APubG/plIBaNpVYSpcg52XMvtoNQCVViE7NM+cGOZ7Ch/qtNO6nyoz6FCCCV+jH6+G+PYWbJdLZJQ/5A9r6ux8bTzoKPM71GUEqApKUof/tOSQFzNYAjIMXDnuJfwciy5qkvlAZKU9TZu0g3TJf158oFusQRxSW3Zafb7s6sf8hfCrM6zjXoZJO66UPmsRn3r6snpXCSzIhmBk5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:37:51 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:37:51 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Thread-Topic: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Thread-Index: AQHZcPUztdzx0D4PfUmjBA3bSkOXIK8yyLaAgAAPv8A=
Date: Wed, 19 Apr 2023 16:37:51 +0000
Message-ID: <SN6PR11MB2574462BC46616D1954D40309A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-5-fei.yang@intel.com>
 <e654fc52-b1ce-13f6-adfe-3e108f98e6ce@intel.com>
In-Reply-To: <e654fc52-b1ce-13f6-adfe-3e108f98e6ce@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|CO1PR11MB5010:EE_
x-ms-office365-filtering-correlation-id: f85e7d6c-3cf6-422d-a916-08db40f46aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTvveyFNZKf1fZj5RXuzh4a2sTSUy8H4aEVtkbKE+N3K3Rdf5ndSgru4d+ktyNsjzNFTNYrGMnd28N/S1WqC9kp3OWzob+kRAxNphqGWcixW8mmkEcOoV2F1g7cOg1NQgyRvyNnSbcZdOVOKHBwWO4QNprjlxMb/RsM85fpw5mLFlrkygS+5YsE+2PKOsXdao8FNtBZuiXDZPR2ESe29dQGLW0WE2J1MpwK5kLpA1eFTOLBU/E4saeAXAqQlT9IFBm5EW/3rv9D4X0chEnAS4xTqt/tZpBaFrZN0Ii8JpwbsblBwa1d40qzE2Nd6FhJSwY1SMCRPq2Feg63WPGUxo/GxscGF7IaKZ1FRKWPL84ASdTx5Zo1fiNFtw2YPHvohPjRBKKK/tljVLH9+/TwfKb1bfk7xB8GpTCct7uiDRzrXbBK2NblcdJmAzaqegWkQCcH4APc251f6ueLH1WHe3J20DknWvWWsAtPiDe5UfnXAqrwlYRVz25Syi4k4YTdsMXfgdrc+z9mmfChkNJBLo3U66OAvgkNrZ5KP3uZC+QWVAXs9c0evdc2ocWRAEmsIDP7jGnLg6FXP/tKAm6335xy+C6dlc1O8+WBdDIp9IvbSs44QHxB23y4KMxgzH1+s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(478600001)(71200400001)(86362001)(26005)(33656002)(6506007)(9686003)(7696005)(186003)(38070700005)(55016003)(82960400001)(41300700001)(122000001)(38100700002)(8676002)(8936002)(4326008)(66446008)(66556008)(66476007)(110136005)(450100002)(83380400001)(66946007)(64756008)(76116006)(316002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3BTQ3RaY2V2RGhjb0ZjMlhQUW81d0dGV0VQMytsbVlvOG5TbGl6ektZS1ov?=
 =?utf-8?B?UlZsWlpkMW9uakpqdmdLMVNqNzZtNjFXZjJSNkhMUWg2cE4vRXdpcEcyUmZD?=
 =?utf-8?B?N0hrMlBJQTJ0N1BKc2QwZTkvd2NkaUExZjVhazE0UnBidXlDS09ucmM0Z1E5?=
 =?utf-8?B?L2Jaa0paMnI4Tml6WUxFRFJPTzR6c01rOFA3MWlEZUNJb2tTenFkcDhGU0tI?=
 =?utf-8?B?ay9xUGhlZ05NUGFoUkZqejJQdnRPOGZtUWtKZExJaWxlQmwydXhVWUFGemNq?=
 =?utf-8?B?a0JNOHA1YmQ4WVVodGFwYnIrZTUveXN1SHJNVklSdGlnMFJ6bFRzelNOSUNQ?=
 =?utf-8?B?WVU4MEhjWXAxaDV0VFZSNFRxVytNTXkyM3k1ZTdIVTN2Y3ovU2lYaWM4aUpa?=
 =?utf-8?B?TldCVTZuTTdWUVFjRkRrMkVyemJEYWRmNHJCVS9OMFBOSXUxa2x5Vy91M3Bj?=
 =?utf-8?B?VlVvdERwM3VpSVNYaWFReE5kOTVTV1pENFFhY2xqUDYrM0IwcFM0WlV2TzZs?=
 =?utf-8?B?YU90cXNhdmFsSkRQU3VWZVU5M280SWJLTjgwMEVBWHJUWlVHa3RPZEhNL2VQ?=
 =?utf-8?B?U09zQmIwVDhrN2JIRDEyV0xibzc1eDNaOEJyTTJpRmQzemdXY0ZDZlYwR0hY?=
 =?utf-8?B?UGtpMkltekZ3L2lpTFoxZWNzdUpod2hrMTJ4c0dlVXBPeW9KY3JYbEpuRFdP?=
 =?utf-8?B?eCtVSmZqUVlwcnd5bVNCYkhIMFRidnJ2K1NWSGgzM2VhaGVEWHpyYlYxYk9B?=
 =?utf-8?B?VjZjeDlENHhkQS9WTlBQYlFROWhiWm1pWllyaUpFaVJzdEdLL0NpSk11T2pG?=
 =?utf-8?B?SHBTdTI1Tnc5MEltV205V0F6d2JtZk9lT0JEL2hEQU1NaGJTZlJzdlZnaE1j?=
 =?utf-8?B?WEM1NkRVeWswcm1xLyszeFlSRDBDY2dXaGRsb2pVQ094MXJOWjVkanQ5a0hO?=
 =?utf-8?B?aHlzWW5OSHJxNnMybE5ackZLbnhuWGdtU3djN3pUZWtkalBuS3pwTjRDUnpW?=
 =?utf-8?B?VmRHTjhzY2I2cVl6QmxLZjQxMDNqSUFvdGNHSnFwbTBzenFyUlJ3ZmhzakdD?=
 =?utf-8?B?SW45WE5sdFZMR2h6ZTMzcFo1bUdWQm9hMmNuQW9sbDRFeHFjWTNYU1F0MWJB?=
 =?utf-8?B?cGxJOEw1VVZnWG0ySG1Bd0xHdDZhWng1OUFwK1RiOVJDOXJsZzNMM29XckxX?=
 =?utf-8?B?YlU1enVUUG9QdkZBWU5pSHh1SGc4OThKS2lKejh6WHVxZTJHSVNMRUVaWm1w?=
 =?utf-8?B?VVJFVEJranRhQWxpdmRNY1JrR1g3TnByM09SNlpUOFQyR1Y4M2pFZ0g0cGtl?=
 =?utf-8?B?Y1VidWJCYUxHT2N6NU1mREtQSyttWHFNa2lzd2ZHZGlWZEMwMC91RlJVVktr?=
 =?utf-8?B?Qk9BajlhdWVCaFB1Y1lWenlDNFozRUVRY21DNTE3SVhaSVBnM3h3YlJyM08z?=
 =?utf-8?B?RzJBd3Y2b2tYMm5Uckd3Z2xxck5jRCsyVklOUDM4VG11YmtxQnR6VHJ4a29R?=
 =?utf-8?B?QWtGaVdaMDNJSElUb2RZWURkcnhDT1dVbkZkR1dnRE1JWFVGcE0xVHFUUVVi?=
 =?utf-8?B?OEtHZmg3cENMd0lSN2JCdjAxMFVtOVI2bE1NWCtOWmprOE1BOEZXdXNoNXBW?=
 =?utf-8?B?Tkw1dTR4MGZTZWtXNjNUdk14dmNXRFpSSmJjUWF2VW5oYWkxN2ZuNE5CUFV5?=
 =?utf-8?B?enVQd1loQkN2N3JoUDMyRWdYS08wQUdZOFNvMXlTSGFIeGo3VVJYTWR2RjBa?=
 =?utf-8?B?RzUwMGdnRWZuV3RKN3IreUlxWGJPdlNiaVE4L3dsYko1VGxsWXJoNjV6SCt2?=
 =?utf-8?B?bzgrdmFCRW9lRmxnOXd5UGpYSkVqVTNCU1dGWkpLS0wwRDB5NHovMUZYTmwr?=
 =?utf-8?B?RGJ0WWdxcmNtV1YwbzZGbUNWMDNRTTQyaTRLZEh2UW5La3JnbTZOd2p5b3Iw?=
 =?utf-8?B?ZTB5UHZlMFoycHkyek0vQ2xuRitCUnVzbTVpN2hhSGlXTjUyck9yQ3FVb1Vm?=
 =?utf-8?B?WVN4SjFheEJ6Lzdhand6T21mY3hQS2Z0ZDZ5aUIzZ29kcndxMS9rU1MzQ2FJ?=
 =?utf-8?B?T1BqQTNHOEtpQWJNRFk2aG1SS2czQzZBbG9qamdGWG9sREhucks4aDNXTVhN?=
 =?utf-8?Q?okHE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85e7d6c-3cf6-422d-a916-08db40f46aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 16:37:51.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcG5ZOWqqN4fVX40MscbEhvZa82iR/aB7BXOCAWXgyAuqLVgF/gO6Hieql1MWyOzJLnWSzYbkASUYml855diYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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

Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jdC5j
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jdC5jDQo+PiBpbmRl
eCAxODAzYTYzM2VkNjQuLjk4ZTY4MmI3ZGYwNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jdC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9ndWNfY3QuYw0KPj4gQEAgLTQxNSwxMiArNDE1LDYgQEAgc3RhdGlj
IGludCBjdF93cml0ZShzdHJ1Y3QgaW50ZWxfZ3VjX2N0ICpjdCwNCj4+ICAgICAgfQ0KPj4gICAg
ICBHRU1fQlVHX09OKHRhaWwgPiBzaXplKTsNCj4+DQo+PiAtICAgIC8qDQo+PiAtICAgICAqIG1h
a2Ugc3VyZSBIMkcgYnVmZmVyIHVwZGF0ZSBhbmQgTFJDIHRhaWwgdXBkYXRlIChpZiB0aGlzIHRy
aWdnZXJpbmcgYQ0KPj4gLSAgICAgKiBzdWJtaXNzaW9uKSBhcmUgdmlzaWJsZSBiZWZvcmUgdXBk
YXRpbmcgdGhlIGRlc2NyaXB0b3IgdGFpbA0KPj4gLSAgICAgKi8NCj4+IC0gICAgaW50ZWxfZ3Vj
X3dyaXRlX2JhcnJpZXIoY3RfdG9fZ3VjKGN0KSk7DQo+PiAtDQo+PiAgICAgIC8qIHVwZGF0ZSBs
b2NhbCBjb3BpZXMgKi8NCj4+ICAgICAgY3RiLT50YWlsID0gdGFpbDsNCj4+ICAgICAgR0VNX0JV
R19PTihhdG9taWNfcmVhZCgmY3RiLT5zcGFjZSkgPCBsZW4gKyBHVUNfQ1RCX0hEUl9MRU4pOyBA
QA0KPj4gLTQyOSw2ICs0MjMsMTIgQEAgc3RhdGljIGludCBjdF93cml0ZShzdHJ1Y3QgaW50ZWxf
Z3VjX2N0ICpjdCwNCj4+ICAgICAgLyogbm93IHVwZGF0ZSBkZXNjcmlwdG9yICovDQo+PiAgICAg
IFdSSVRFX09OQ0UoZGVzYy0+dGFpbCwgdGFpbCk7DQo+Pg0KPj4gKyAgICAvKg0KPj4gKyAgICAg
KiBtYWtlIHN1cmUgSDJHIGJ1ZmZlciB1cGRhdGUgYW5kIExSQyB0YWlsIHVwZGF0ZSAoaWYgdGhp
cyB0cmlnZ2VyaW5nIGENCj4+ICsgICAgICogc3VibWlzc2lvbikgYXJlIHZpc2libGUgYmVmb3Jl
IHVwZGF0aW5nIHRoZSBkZXNjcmlwdG9yIHRhaWwNCj4+ICsgICAgICovDQo+PiArICAgIGludGVs
X2d1Y193cml0ZV9iYXJyaWVyKGN0X3RvX2d1YyhjdCkpOw0KPg0KPiBUaGUgY29tbWVudCBhYm92
ZSBuZWVkcyB1cGRhdGUsDQoNCldpbGwgdXBkYXRlIHRoZSBjb21tZW50Lg0KDQo+IGlmIHRoaXMg
aXMgY29ycmVjdCBjaGFuZ2UuIFRoZSBxdWVzdGlvbiBpcyB3aHkgaXQgaXMgY29ycmVjdD8gSWYg
eWVzLCBpdCBpbXBsaWVzDQo+IHRoYXQgb2xkIGJhcnJpZXIgaXMgaW5jb3JyZWN0LCBtYXliZSBp
dCBzaG91bGQgYmUgdGhlbiBzZXBhcmF0ZSBmaXg/DQoNClRoZXJlIGlzIFdSSVRFX09OQ0UoZGVz
Yy0+dGFpbCwgdGFpbCkgcmlnaHQgYWZ0ZXIgdGhlIEgyRyBidWZmZXIgdXBkYXRlIHdoaWNoIGlz
IGFsc28NCnNlZW4gYnkgdGhlIEd1QyBmaXJtd2FyZSwgdGhlIGJhcnJpZXIgaXMgbmVlZGVkIGZv
ciBib3RoLCB0aHVzIG1vdmVkIGl0IGRvd24gYSBmZXcNCmxpbmVzIHRvIGNvdmVyIHRoZW0gYWxs
Lg0KDQo+IEkgYW0gbm90IGFuIGV4cGVydCwgYnV0IHByZXZpb3VzIGxvY2F0aW9uIG9mIHRoZSBi
YXJyaWVyIHNlZW1zIHNhbmUgdG8gbWUgLSBhc3N1cmUNCj4gR3VDIHdpbGwgc2VlIHByb3BlciBi
dWZmZXIsIGJlZm9yZSB1cGRhdGluZyBidWZmZXIncyB0YWlsLg0KDQpUaGF0IGlzIGNvcnJlY3Qs
IGJ1dCB0aGUgYmFycmllciBpcyBuZWVkZWQgZm9yIGJvdGggSDJHIGJ1ZmZlciBhbmQgZGVzY3Jp
cHRvciwgYXMgdGhleQ0KYXJlIGFsbCBzaGFyZWQgd2l0aCBHdUMgZmlybXdhcmUuDQoNCi1GZWkN
Cg0KPiBBbmQgYWNjb3JkaW5nIHRvIGNvbW1pdCBtZXNzYWdlIHRoaXMgbmV3IGJhcnJpZXIgc2hv
dWxkIGZsdXNoIFdDIGJ1ZmZlciwgc28gZm9yIG1lDQo+IGl0IHNlZW1zIHRvIGJlIGRpZmZlcmVu
dCB0aGluZy4NCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4NCj4NCj4gUmVnYXJkcw0KPiBB
bmRyemVqDQo=
