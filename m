Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C05B125F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 04:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30F910E11C;
	Thu,  8 Sep 2022 02:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768C610E050;
 Thu,  8 Sep 2022 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662603198; x=1694139198;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BSPNeSz1TVOWqJ0IVPhGIUAxZn7xvyL1Xux6xjk1UVg=;
 b=oG2TqfMLzV2g413C8YeCLXJBaJ8+2XX10GycCg9TcS8MT7FSujWrp29E
 fSrGbT30Q3eaTVWZX673EasrKFdnwkPggZwWFJ3piCbGQc1X36S6G6PWp
 xD+UtrP5DbqnOdOK3nGnHxp1pGOrnIbngIvp9mYzNkWS+e72eyuE1K89C
 D87Op/A2ZRNqJbqCdf0Nx6Le6gL8uDUgZ/ZxP930cCs6q9jG7KSBesrv1
 s9LFXj/Dafsp6pDV4u2aJbVMX33r0BjW9UlYgSqqMyW5+cTsu4LnD3e/j
 QmL4KvTaWvDBfpI6ohPUt/eQyVlPA+F5MWUFUEb+xxRJkut0yjFKedKwK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276780420"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="276780420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 19:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="644876178"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 19:13:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 19:13:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 19:13:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 19:13:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 19:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePSeFV3Lk92+egCBjt/frXUyExUH6Q6Yl/eQR1rV2+GV5KoEMCvyFRZdnybLydXULh4c6M8Vqrp6/S1rSIAgermjU2cbFSRzyeJPMu/zbrSSchNU8XHzvC3xDcVK/1QBMhrx3DGg/c3hwlJEclokmHMWqh/zzWGMHFwcQzWUTNbE3AtMrwJTlpGEpGnDWGVKVNlc8ksug/oUqu0O74RZNR+iygoZuUNDFTC1I1zbqq46DhOOCRQY1a9qe6xGJSmiAe3xDj8OJ4/9kA3QdIfjp7QSN2Eyhp1cSo7DgdvdaLUPHREZYDDuEbDhEfod6EpULb30c1Q2/O/6uVMfa80ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSPNeSz1TVOWqJ0IVPhGIUAxZn7xvyL1Xux6xjk1UVg=;
 b=MG7Uoy5wp85HNRX0llYRI6J/JonW5igmn8pjXIm5QboK3r3AaxjgtozE2DduWrS4Zz2xcrb/EUo5cA5MM0DsoKyyH5BHSf5nHhU+bRGa/MJwqM/RMFXd52BYINho7HJBe1UKKqXrLzTbSRijHdIM5MOdk0WCNss9Pbi1SHWxnDzXSR5hXKDDtMaC/StPpXWoF1F68kPxgTxF6tmJKcfiIJf4rA/XaEHew2LKGR4L7U0Qqr5hpDdUFQi1Bu90YDNub6QIZ0C7dH/4DIDMxs0UDWTh6X/0OcyGRRfg4RePryW1xYGxmA247HqsnZOlMwMBa6+RriPW7P2/2mG6OopVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB5215.namprd11.prod.outlook.com (2603:10b6:a03:2d9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 8 Sep 2022 02:13:14 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6f3a:c6aa:731c:d1fd]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6f3a:c6aa:731c:d1fd%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 02:13:14 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 13/15] drm/i915/huc: better define HuC
 status getparam possible return values.
Thread-Topic: [Intel-gfx] [PATCH v3 13/15] drm/i915/huc: better define HuC
 status getparam possible return values.
Thread-Index: AQHYtB7FwDhYN17/3Uiv32hUVuwAwa3U6UwA
Date: Thu, 8 Sep 2022 02:13:14 +0000
Message-ID: <b5e8f8e41b34b65188a33d7e1609ae1b96bcc7f2.camel@intel.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
 <20220819225335.3947346-14-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220819225335.3947346-14-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB5215:EE_
x-ms-office365-filtering-correlation-id: c691bb24-cc47-4558-644f-08da913fafb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DI7Q0ZLpFlS/Wvf0r/nqlobjalwE+h+27Fk9ZtLufnHK9V+jBtC8LRWH6hsPECqkBvPyAnHh+jgqJez+d+Bm3Pi9FJGDV8WOXUrvgFxFb+BeIES3BCM1MmT1LrUsqhVwKTe45+K/7dDVGo5ilpzjHaGlaVG9YeDYgbdD1sFBAaQ5q/2VNUCD81RzfzSbw2dHJzQelMv6kpScdDT2TudwK5VPaQSWGBQ4/r6Hm5eaCQbm0McNyzZqFWrX+r9igocWa6eZ1WO5l1f1s8p9rllsP3YB1L6kYsUV3VRKK5+D9yh8yHM6iv1DqfaAUbLW0LQ9HLYmEAmB1kg9yfeyFxW8CGlKZx2YfG9eJMSexUWpG9d1uZGTnQmeCR5EBpzWJgIWZraj8lXbsjxHip+dlQVPltv573yW4RJJFf8eDzNxo9n22yZpIKUoe6/ex6x1RGmmbDL+dpjNbMX3hdTmN4rGBa0K4Uy33D0ZuGED2SQ07ew0byJeTB0STi1hNJjuVHk/D9wJ1alJiSNGJHPkBBZO/6wKiHRaqPi4BsAdeo0PvBRmdAId5XGRclEm2Cpc64dzdHkBvSPITK9iAKwze3zEGySz2ZzUkFavWTzpJCZR1D2GF4KkBKbn6LKX8bzHBjtFEnCRQY28btXPxUX8fBe3o3Cj/+KUuBun3Qe4URKPFNRetURURxO+fOGQU+hOxJ2lRh/yEoe9/IhbjJm+8VQpLd/BP+P2yYEaNGmRU99VQejZJw1KmdBX1gOgHBFQYDGX2cSG3FrDM0f9jlQRcJDCrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(366004)(396003)(39860400002)(136003)(86362001)(41300700001)(5660300002)(316002)(6506007)(6512007)(2906002)(110136005)(26005)(71200400001)(64756008)(66476007)(186003)(66446008)(76116006)(2616005)(66946007)(66556008)(8936002)(6486002)(8676002)(450100002)(4326008)(82960400001)(122000001)(91956017)(36756003)(478600001)(83380400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRzOU5Fam1kZlRCdVRVUCsyeXlUSEJjbm1kWTBrbCtXaHcwZGFLaWpMZlVh?=
 =?utf-8?B?VHJJUTB0dlBXVm80TnIyQUdoTDFYUVZJaWVPWEJ6QjNzRmtSM0ZVbG1YeEVX?=
 =?utf-8?B?RWVTUWZ6Uk4rQjY1ZW14ZUNqbjEyeUpuVnhTSGpRUS81akV5aFN2azZsVTJI?=
 =?utf-8?B?SFF1Rnh0NTVvT29lZGxaQkhZU013NHhXWFJYVGlKV1ptcDZheEwrSUVlVHRi?=
 =?utf-8?B?dmxpem9kV1VHQXc3dU9OQ0FFUFMxOU9zTGJsTyt1eXFBaXFLbDhIS2Uva3Jm?=
 =?utf-8?B?dEx0d0RXVythcEZlVzNvQTdQdGZUMm93ZWttcisyM0ozSGQrcFdyRFUrOTB2?=
 =?utf-8?B?V2cwMHdSQUFpTUpON200bk53SkxOdnNGRjYxRlp4dzhlczlzZzdiZWhBajY0?=
 =?utf-8?B?Q00reHZJVFdxRVhXUDBUSS94bFUxRmhlR0ZhdDJmMjlkM3FPR3UzVFAwUVJM?=
 =?utf-8?B?RFl3dGNMWjg3RHpxUmFCVUVScTFBeTR0ai9VeFNNS1lpWUs5T0tPTE96cDZz?=
 =?utf-8?B?L3REdTFVeHZPODMzbkpKdjBwYXA2cklpQ1BYQWlBVHpCcWJTREh6aDM3Nlk5?=
 =?utf-8?B?cjRwNTlVSHliN2lDWnVsWUdSMndTbURUMHQ2a2oyWDR0NVk1TFdMd0JUMU91?=
 =?utf-8?B?a0VQcDRpTVE4SEVVN3FmWCtVVW96TW0vcWFiQlNUeHhzbVlVbEoxcVNiV0Nj?=
 =?utf-8?B?SThEY1RRRnF5eWt1bTg4YnJCbTJseTFuTlFwMmgzTVhWeEw2QnJSUGtRMTBu?=
 =?utf-8?B?L0FWdUhpb1pBNC9XUWg4NEl5NU9aOENHdjgrdFFLUUVZdWI4ajJ4c0dQZnVz?=
 =?utf-8?B?Y3FqYjYwbTFCcFdmM2wxaVZDaHhYZCs1VDF2TTBIOTUrK3FnaHVuM0ZsQlVJ?=
 =?utf-8?B?V0RqMTdwSWpnczN6WEYrMEYzZGZyc25acjBFZXZkYTdGbUZqZmF5eUgrQUU2?=
 =?utf-8?B?U3NLZU1HYkw3K0FOQjdyenpHUmI3Y1Z2c1IvOHpvMXh5bWUrRTNrOUFwS2xa?=
 =?utf-8?B?R2hacUN0VVAvZG96YVZEaEpnRjB2bFdWb2U2d29GdkhEbUFBalNBem1PUmpv?=
 =?utf-8?B?cWU0aDVKWTBOWUloMVliRG5iSVdDT2hWRnJaMFhHY0Y0VnVOcUtUUTUwM2dQ?=
 =?utf-8?B?UFR1eDZFSE8yRlJMUWpiN3dIQ09paDhYdnh4M0NLQU9XY2FTM1ZZQ3dMOUUr?=
 =?utf-8?B?bDZvVDJudzRrdVFJNVlINlRnU3h6U1ZVTkRHVXFrQlE4UE5tK0d6MEt4RE9z?=
 =?utf-8?B?dFlRcTlUN01DdkRsUCtubGtkb0RVaEZlbEhIM1Q4eldUS0srbi9LU3JUZmxi?=
 =?utf-8?B?V2lVL1NmVHR3a0F6dUFhRTZIZlZzV1k5VkdMTnU3cDhUamVtQWkyNFF4d1p3?=
 =?utf-8?B?eEFnWFVCVTVvSmJ6QkhwNm5iYlpsWHVIUktvdEpPbTNBUk56R0VIczNROUda?=
 =?utf-8?B?V1l0Y2tVbmNRVnhiUWtUUkNWcDgwcFNmVDBEVk5GNDlEQ0dPWTlGcGc2ellW?=
 =?utf-8?B?OEIxdmxPZEVwTkVGbk1JWGFUalJJNGFZcitaaUdEb2tTakluRWszcGsra3BD?=
 =?utf-8?B?SGxsMlJaWDlLeHg3MHVTVHhEdEZLQ3MybGgzTi9ST2t2M0tTMlFJU2hPZDQ4?=
 =?utf-8?B?V1Y3aU9icmZDSzkwRUNwTndWb2VKKzBVZDhoMExpdFFSUTRDVHl3WU5qYU04?=
 =?utf-8?B?WFpTWkl2Kyt3VWZydzllZFU2a0plTE5kTHEwNk9CVUFjVEJXcHRsaEN3N21p?=
 =?utf-8?B?K3RsTWNFbGdPQUs4T2IwVVV4K0E4UDZuSXl4c0hVNWFaWjNjNVVuRTl1UzBl?=
 =?utf-8?B?SWYwamExM1FVSTZ1alF3VmoyN0RucHpXU2dzeUg5WmJnMU1xYnNNOUNXbGVo?=
 =?utf-8?B?QXh3WGZ6aytwZHZxMWEyc3JVVHpxRXVzVzdIckIxUzdDNHZkOGlMS2lkSDZE?=
 =?utf-8?B?Nzc5eXp3RFV2WlNXb0I3RkV0V1M0dkVQNUd5MmNCNk5idXdieVUyMUV0SjZZ?=
 =?utf-8?B?R1pmNHFac2IyS0lZY3NiV0xpSU9ybTBwZDBZRklRSE0wTlNHRkZTT3VhbFdk?=
 =?utf-8?B?RTVJTW52Sk9pZWJWMko4V21QbVRwMjI4cjE0T3lNbWREdVBEYklWQkJlNVRz?=
 =?utf-8?B?c3ZKR216bGVPWEpyVWhNTjZYV05DZm5LQS8wQ0MyeWF4OWxoWlR1UWhDYk45?=
 =?utf-8?Q?+mllIG3xqwFicL4jOMh0LJiksB2JpOYOS7mYl2sR6VMW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ABF2FB429685943B64416771FD43620@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c691bb24-cc47-4558-644f-08da913fafb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 02:13:14.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZASyk7DwfPos246qqXGZ9gDvT1O+8t5zxpAi9dF7m0wsh3H7UQ3ah8gHUZZ/MyTcvQ6K+LcRwEBT7PEzc01n84SquqZW4PHca1cUNNOxAVBfu0JUu83M6rvwWUfyese
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

WXVwIC0gc2ltcGxlIHN0dWZmIC0gTEdUTToNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxh
bGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQpPbiBGcmksIDIwMjItMDgtMTkg
YXQgMTU6NTMgLTA3MDAsIERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gd3JvdGU6DQo+IFRoZSBjdXJy
ZW50IEh1QyBzdGF0dXMgZ2V0cGFyYW0gcmV0dXJuIHZhbHVlcyBhcmUgYSBiaXQgY29uZnVzaW5n
IGluDQo+IHJlZ2FyZHMgdG8gd2hhdCBoYXBwZW5zIGluIHNvbWUgc2NlbmFyaW9zLiBJbiBwYXJ0
aWN1bGFyLCBtb3N0IG9mIHRoZQ0KPiBlcnJvciBjYXNlcyBjYXVzZSB0aGUgaW9jdGwgdG8gcmV0
dXJuIGFuIGVycm9yLCBidXQgYSBjb3VwbGUgb2YgdGhlbSwNCj4gSU5JVF9GQUlMIGFuZCBMT0FE
X0ZBSUwsIGFyZSBub3QgZXhwbGljaXRseSBoYW5kbGVkIGFuZCBuZWl0aGVyIGlzDQo+IHRoZWly
IGV4cGVjdGVkIHJldHVybiB2YWx1ZSBkb2N1bWVudGVkOyB0aGVzZSAyIGVycm9yIGNhc2VzIHRo
ZXJlZm9yZQ0KPiBlbmQgdXAgaW50byB0aGUgY2F0Y2gtYWxsIHVtYnJlbGxhIG9mIHRoZSAiSHVD
IG5vdCBsb2FkZWQiIGNhc2UsIHdpdGgNCj4gdGhpcyBjYXNlIHRoZXJlZm9yZSBpbmNsdWRpbmcg
Ym90aCBzb21lIGVycm9yIHNjZW5hcmlvcyBhbmQgdGhlIGxvYWQNCj4gaW4gcHJvZ3Jlc3Mgb25l
Lg0KPiANCj4gVGhlIHVwZGF0ZXMgaW5jbHVkZWQgaW4gdGhpcyBwYXRjaCBjaGFuZ2UgdGhlIGhh
bmRsaW5nIHNvIHRoYXQgYWxsDQo+IGVycm9yIGNhc2VzIGJlaGF2ZSB0aGUgc2FtZSB3YXksIGku
ZS4gcmV0dXJuIGFuIGVycm5vIGNvZGUsIGFuZCBzbw0KPiB0aGF0IHRoZSBIdUMgbG9hZCBpbiBw
cm9ncmVzcyBjYXNlIGlzIHVuYW1iaWd1b3VzLg0KPiANCj4gVGhlIHBhdGNoIGFsc28gaW5jbHVk
ZXMgYSBzbWFsbCBjaGFuZ2UgdG8gdGhlIEZXIGluaXQgcGF0aCB0byBtYWtlIHN1cmUNCj4gd2Ug
YWx3YXlzIHRyYW5zaXRpb24gdG8gYW4gZXJyb3Igc3RhdGUgaWYgc29tZXRoaW5nIGdvZXMgd3Jv
bmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51
cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFRvbnkgWWUgPHRvbnkueWVAaW50ZWwuY29t
Pg0KPiBBY2tlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4N
Cj4gQWNrZWQtYnk6IFRvbnkgWWUgPHRvbnkueWVAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5jICAgfCAgMSArDQo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYyAgIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMgfCAgMSAtDQo+ICBpbmNsdWRl
L3VhcGkvZHJtL2k5MTVfZHJtLmggICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0K
PiAgNCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjLmMNCj4gaW5kZXggMDFmMjcwNWNi
OTRhLi4xMGIyZGE4MTBhOGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2d1Yy5jDQo+IEBAIC00NDMsNiArNDQzLDcgQEAgaW50IGludGVsX2d1Y19pbml0KHN0cnVjdCBp
bnRlbF9ndWMgKmd1YykNCj4gIGVycl9mdzoNCj4gIAlpbnRlbF91Y19md19maW5pKCZndWMtPmZ3
KTsNCj4gIG91dDoNCj4gKwlpbnRlbF91Y19md19jaGFuZ2Vfc3RhdHVzKCZndWMtPmZ3LCBJTlRF
TF9VQ19GSVJNV0FSRV9JTklUX0ZBSUwpOw0KPiAgCWk5MTVfcHJvYmVfZXJyb3IoZ3QtPmk5MTUs
ICJmYWlsZWQgd2l0aCAlZFxuIiwgcmV0KTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYw0KPiBpbmRleCA5YTk3YjhjYzkwYzcuLjFh
MzRjOTAyZDA4MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfaHVjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjLmMN
Cj4gQEAgLTI4NCw2ICsyODQsNyBAQCBpbnQgaW50ZWxfaHVjX2luaXQoc3RydWN0IGludGVsX2h1
YyAqaHVjKQ0KPiAgCXJldHVybiAwOw0KPiAgDQo+ICBvdXQ6DQo+ICsJaW50ZWxfdWNfZndfY2hh
bmdlX3N0YXR1cygmaHVjLT5mdywgSU5URUxfVUNfRklSTVdBUkVfSU5JVF9GQUlMKTsNCj4gIAlk
cm1faW5mbygmaTkxNS0+ZHJtLCAiSHVDIGluaXQgZmFpbGVkIHdpdGggJWRcbiIsIGVycik7DQo+
ICAJcmV0dXJuIGVycjsNCj4gIH0NCj4gQEAgLTQwMywxMyArNDA0LDggQEAgYm9vbCBpbnRlbF9o
dWNfaXNfYXV0aGVudGljYXRlZChzdHJ1Y3QgaW50ZWxfaHVjICpodWMpDQo+ICAgKiBUaGlzIGZ1
bmN0aW9uIHJlYWRzIHN0YXR1cyByZWdpc3RlciB0byB2ZXJpZnkgaWYgSHVDDQo+ICAgKiBmaXJt
d2FyZSB3YXMgc3VjY2Vzc2Z1bGx5IGxvYWRlZC4NCj4gICAqDQo+IC0gKiBSZXR1cm5zOg0KPiAt
ICogICogLUVOT0RFViBpZiBIdUMgaXMgbm90IHByZXNlbnQgb24gdGhpcyBwbGF0Zm9ybSwNCj4g
LSAqICAqIC1FT1BOT1RTVVBQIGlmIEh1QyBmaXJtd2FyZSBpcyBkaXNhYmxlZCwNCj4gLSAqICAq
IC1FTk9QS0cgaWYgSHVDIGZpcm13YXJlIHdhcyBub3QgaW5zdGFsbGVkLA0KPiAtICogICogLUVO
T0VYRUMgaWYgSHVDIGZpcm13YXJlIGlzIGludmFsaWQgb3IgbWlzbWF0Y2hlZCwNCj4gLSAqICAq
IDAgaWYgSHVDIGZpcm13YXJlIGlzIG5vdCBydW5uaW5nLA0KPiAtICogICogMSBpZiBIdUMgZmly
bXdhcmUgaXMgYXV0aGVudGljYXRlZCBhbmQgcnVubmluZy4NCj4gKyAqIFRoZSByZXR1cm4gdmFs
dWVzIG1hdGNoIHdoYXQgaXMgZXhwZWN0ZWQgZm9yIHRoZSBJOTE1X1BBUkFNX0hVQ19TVEFUVVMN
Cj4gKyAqIGdldHBhcmFtLg0KPiAgICovDQo+ICBpbnQgaW50ZWxfaHVjX2NoZWNrX3N0YXR1cyhz
dHJ1Y3QgaW50ZWxfaHVjICpodWMpDQo+ICB7DQo+IEBAIC00MjIsNiArNDE4LDEwIEBAIGludCBp
bnRlbF9odWNfY2hlY2tfc3RhdHVzKHN0cnVjdCBpbnRlbF9odWMgKmh1YykNCj4gIAkJcmV0dXJu
IC1FTk9QS0c7DQo+ICAJY2FzZSBJTlRFTF9VQ19GSVJNV0FSRV9FUlJPUjoNCj4gIAkJcmV0dXJu
IC1FTk9FWEVDOw0KPiArCWNhc2UgSU5URUxfVUNfRklSTVdBUkVfSU5JVF9GQUlMOg0KPiArCQly
ZXR1cm4gLUVOT01FTTsNCj4gKwljYXNlIElOVEVMX1VDX0ZJUk1XQVJFX0xPQURfRkFJTDoNCj4g
KwkJcmV0dXJuIC1FSU87DQo+ICAJZGVmYXVsdDoNCj4gIAkJYnJlYWs7DQo+ICAJfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMNCj4gaW5kZXggNTg1NDcyOTJlZmEw
Li5jZWM2YmY2YmFkM2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX3VjX2Z3LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxf
dWNfZncuYw0KPiBAQCAtNzQ5LDcgKzc0OSw2IEBAIGludCBpbnRlbF91Y19md19pbml0KHN0cnVj
dCBpbnRlbF91Y19mdyAqdWNfZncpDQo+ICBvdXRfdW5waW46DQo+ICAJaTkxNV9nZW1fb2JqZWN0
X3VucGluX3BhZ2VzKHVjX2Z3LT5vYmopOw0KPiAgb3V0Og0KPiAtCWludGVsX3VjX2Z3X2NoYW5n
ZV9zdGF0dXModWNfZncsIElOVEVMX1VDX0ZJUk1XQVJFX0lOSVRfRkFJTCk7DQo+ICAJcmV0dXJu
IGVycjsNCj4gIH0NCj4gIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9pOTE1X2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+IGluZGV4IDUyMGFkMjY5MWE5OS4u
NjI5MTk4ZjFkOGQ4IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2k5MTVfZHJtLmgN
Cj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+IEBAIC02NDUsNiArNjQ1LDIy
IEBAIHR5cGVkZWYgc3RydWN0IGRybV9pOTE1X2lycV93YWl0IHsNCj4gICAqLw0KPiAgI2RlZmlu
ZSAgIEk5MTVfU0NIRURVTEVSX0NBUF9TVEFUSUNfUFJJT1JJVFlfTUFQCSgxdWwgPDwgNSkNCj4g
IA0KPiArLyoNCj4gKyAqIFF1ZXJ5IHRoZSBzdGF0dXMgb2YgSHVDIGxvYWQuDQo+ICsgKg0KPiAr
ICogVGhlIHF1ZXJ5IGNhbiBmYWlsIGluIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW9zIHdpdGggdGhl
IGxpc3RlZCBlcnJvciBjb2RlczoNCj4gKyAqICAtRU5PREVWIGlmIEh1QyBpcyBub3QgcHJlc2Vu
dCBvbiB0aGlzIHBsYXRmb3JtLA0KPiArICogIC1FT1BOT1RTVVBQIGlmIEh1QyBmaXJtd2FyZSB1
c2FnZSBpcyBkaXNhYmxlZCwNCj4gKyAqICAtRU5PUEtHIGlmIEh1QyBmaXJtd2FyZSBmZXRjaCBm
YWlsZWQsDQo+ICsgKiAgLUVOT0VYRUMgaWYgSHVDIGZpcm13YXJlIGlzIGludmFsaWQgb3IgbWlz
bWF0Y2hlZCwNCj4gKyAqICAtRU5PTUVNIGlmIGk5MTUgZmFpbGVkIHRvIHByZXBhcmUgdGhlIEZX
IG9iamVjdHMgZm9yIHRyYW5zZmVyIHRvIHRoZSB1QywNCj4gKyAqICAtRUlPIGlmIHRoZSBGVyB0
cmFuc2ZlciBvciB0aGUgRlcgYXV0aGVudGljYXRpb24gZmFpbGVkLg0KPiArICoNCj4gKyAqIElm
IHRoZSBJT0NUTCBpcyBzdWNjZXNzZnVsLCB0aGUgcmV0dXJuZWQgcGFyYW1ldGVyIHdpbGwgYmUg
c2V0IHRvIG9uZSBvZiB0aGUNCj4gKyAqIGZvbGxvd2luZyB2YWx1ZXM6DQo+ICsgKiAgKiAwIGlm
IEh1QyBmaXJtd2FyZSBsb2FkIGlzIG5vdCBjb21wbGV0ZSwNCj4gKyAqICAqIDEgaWYgSHVDIGZp
cm13YXJlIGlzIGF1dGhlbnRpY2F0ZWQgYW5kIHJ1bm5pbmcuDQo+ICsgKi8NCj4gICNkZWZpbmUg
STkxNV9QQVJBTV9IVUNfU1RBVFVTCQkgNDINCj4gIA0KPiAgLyogUXVlcnkgd2hldGhlciBEUk1f
STkxNV9HRU1fRVhFQ0JVRkZFUjIgc3VwcG9ydHMgdGhlIGFiaWxpdHkgdG8gb3B0LW91dCBvZg0K
PiAtLSANCj4gMi4zNy4yDQo+IA0KDQo=
