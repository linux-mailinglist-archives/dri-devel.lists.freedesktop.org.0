Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B013B728B3B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 00:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390D10E619;
	Thu,  8 Jun 2023 22:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7EC10E619;
 Thu,  8 Jun 2023 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686264537; x=1717800537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6xVAc2N2+Mn5khWyerlbCkh2y3CamtjAMLilHvv+CIs=;
 b=nKy38PBGVeQ3ZUngFDi0ShPinZEOq7VIr/x01k58UtLCr8yZKPmI2NDw
 AIoT2cTw7cSW5J9AgkRItra5vwD6Y/Cl7d+Fy5Efy1fT6ildxeycrvHk1
 0RlQwagM5lGR0YzdxtFW0i9ykaKPSOqw+rtSjKTdksJsYzQ6kBwAdmIFM
 lxZqXaGenr5sFlOi3gbfl6EkZ1FlmQDX6NNWLB2ZzMy9txgGFkCxjegw9
 +ohG9uDQ8gyq7E4FBuNDzMntGeOY+if/PrTMiVG52EaYkrCBE42vE1CUx
 5XA5uFCDoa0fSltPG71fckyolHDvHWuiHYDLNropLKunbMZVdVvEIDiZU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359939537"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="359939537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 15:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713279811"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="713279811"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 15:48:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 15:48:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 15:48:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 15:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTaXbUqL1fOMNzhuPrtKUz6LVajvcrMbOVBQDwod9rsVn4XC9+XSgPhe70uVGt5M/UPbxyA9dQvrPATkL2bciUEsVkzRT6QO1tPynR9bF5b11gD028gxwx7HZ2YYPX2BeCj2UW1V6Z26DFgDk9YKOKBnya7wR9pz/M0nmqLAwcmdFS9okC2Y+L3PlEs0M6dIhHDt7PciENUIofGPa+8gWoeD3Yl6g3NTafQ2kd/a77squ1symLw2c1AZ8TNVnwTYlHuAOiSmDhWfwqRo+fZOtdxWVMlUzsI6zh5DXn6bMCgFiwQNq6AZEmo+EH8a62Ab2FQmgGZr8p7C8iNGK763mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xVAc2N2+Mn5khWyerlbCkh2y3CamtjAMLilHvv+CIs=;
 b=Jf12cWXXUqyLlV8kp3NrrsdZN1mea3+77+77NoIaNkFFlWrGVyIeBwN99FRcvFL4nA9r1NR4pwARbkjXaDN4cuK0U6PR8z6TawmuJZl5QCDnMbsKgqCjyy9TIksgXLU9CKjG4KLlLUDsJnWXWsFSqnW8s2iCBIK0/lop4rg3MKUthFH6gWsGRQhE5ZlQj3NsEXFHBobaEoc5etO6yMxjnMA0QvdpuVTbl7jnkOu+tIiayo3P7V85RicyzTR/kZSgYmwzRKXVeaaZ9Bak8jJNBlOrtwC94fgzSyPkYKHeaZq9XJen6Z5ASNIOu3dq6KLd4hfmF3ErWZTbfgM0+6pwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 22:48:54 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 22:48:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/i915/gsc: take a wakeref for the
 proxy-init-completion check
Thread-Topic: [PATCH v1] drm/i915/gsc: take a wakeref for the
 proxy-init-completion check
Thread-Index: AQHZmjOlaqRI1fn010qnQ+FdqNkN+6+BNzYAgABLKwA=
Date: Thu, 8 Jun 2023 22:48:53 +0000
Message-ID: <40affeb1a7b77c0abad8ad66f7820e249b993aa0.camel@intel.com>
References: <20230608180405.3059026-1-alan.previn.teres.alexis@intel.com>
 <0c7cb50b-413d-c63a-985d-79e5b19bf016@intel.com>
In-Reply-To: <0c7cb50b-413d-c63a-985d-79e5b19bf016@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB6569:EE_
x-ms-office365-filtering-correlation-id: 3fdddfdd-cbb4-45f0-785e-08db687288d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwQ3122Sb++oBffNxo9J92U0U9L86bm+vhzryN6LH87turIDSlk9ydzOKqT0raievN69y4Fpvn+6lE6+A0loKbZL5f7YwA+hbRIN+d6K3KccSc3DuY7G+3+cxv+5zSCZP6c4s4YVXB+mOaE0RVpRM323as5WTv+2PjMB1lpDaklduq+NuZj8gyCz3DbTbBBchReD46eVnTIj5U9JiMe3XIvpVxQyBaa6ocsTWWabKJyieeZLwxWf2pQ8mLAoRPvEQK+pJLcvA+tYQ6cISeGr+Kh9eRPuk4CSVlmvdqxfbsw0XfhwMygRVD5qSYBJxS5860PrUd+lhZ62TbME7omHpQ/cRdU+lUdBLYNvJhyH9AdCNZ1FpFAJrn6ZNERU7ZPOS65s9L4UcYrbT5MUrQBNXT2DfL8TKyECEDOHmQ9N8cbSqI56gHlTQc/WWPr0M2duwdOQVxc3wd5KG0JdF5U0dIt5hPMNPq59lCyuJvTV8BPisHQ4wzxVBD5cHUo3B6ESAssbywxufwfH+eqfTkecBBYjcGFH4Z3M+99K3AhF8lwKCLS1duVvvzjFLvPBwR8iy4fsBhgwH8jc2tSunnaOzQQsd8L3lWaOp1rzLlk+QL8GI+u1LZUbPADmV532Nhfo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(86362001)(64756008)(4326008)(66476007)(4744005)(2906002)(110136005)(41300700001)(38100700002)(8676002)(36756003)(5660300002)(82960400001)(450100002)(122000001)(66556008)(66446008)(316002)(91956017)(76116006)(66946007)(6486002)(71200400001)(478600001)(38070700005)(186003)(8936002)(2616005)(53546011)(6506007)(6512007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGJzdGNkZ1Zjb3JCQlVWeXBXNVdtZTNhYThSQW9UY1FoaGtzaHNNSG9Wc1Ra?=
 =?utf-8?B?WWZOTGpGRW5YN0NERUpRcVQvVnIyTmFJL0ZCMlp0SnRnVXorWmJ6cWFYeXlF?=
 =?utf-8?B?eDJQT3g4dW5DMFAybUl5Um11SzhhclpaOHhSOCtkUzZVYlA1U0M1WlJRSFpY?=
 =?utf-8?B?dmwvWGQ0UGM5VXQzTVdRZ2F0T25BY2RyZERPMFNubWFhZXFJSFBzS3p2Mktn?=
 =?utf-8?B?Y2cvQ3A1ak41akNDL3QyeXFGNkJPYmI3RHYwRHM5d0YvaFpaUXBnN2c2Nk9j?=
 =?utf-8?B?b2pUUmpRL09Oc0V5Ujh4WisrZDBzWXltNTU0TTliKzJVZ2J4QnJTc3BPdXZY?=
 =?utf-8?B?RFVDM1hiL2dFbDlGZXk1UzIrUTZxVUc3c2NwbHMxU2lFR2dNNXVySlAzeVJZ?=
 =?utf-8?B?NlMzeDZqLzZhdzlsa1piaE9YZTNXWXdTaktpcXJLcStyempiZUtvT3BhWGlL?=
 =?utf-8?B?U1dyR1JDK1JaR1Fsekt5elVUT2hNeDc4ZC9vUWVPeVpBOUVKZlAvZ0FUcG5m?=
 =?utf-8?B?czZaaUJ4Mk5mU2QzZ25pZ29SNXlsK0ZQTW9sODFRVkY5djZaUkZuazBwQmlr?=
 =?utf-8?B?TXpNc2NrRjVDVDBuS0c3TzVlSWM2RDhZaldheUpOZGdJVFg2RlhvR01OamUx?=
 =?utf-8?B?RE45U3lKK05YMFlxZWw3cEh0STY2dFBHTWVxUE5yekVIL1NNd0M0WGVMMUk0?=
 =?utf-8?B?VmVCaHNaenZYK3NwY2hzM1JBNEIzRit1eUE5QXZmT0VsQitKOWtvOGVsbXdQ?=
 =?utf-8?B?cEdWZGhSeHR5S1JoVzIvbkJCWmVDU3dnalhpY1Y0djZQSXA4OFgvV3M5NzEy?=
 =?utf-8?B?T3VPVndQeEoyVWxOY1c3NlRjcHJtVFJaMGRvbmU5SUttUjBvMG9nZTk4ak1x?=
 =?utf-8?B?TVRzR0NpS2Nud0t2SFdMWmxvcUszdzAzT1I0VzRodGZLVGQ3QUJHbVNYS1pp?=
 =?utf-8?B?NEdGUHBZYlpyRXU1TlFua2FEcUJFV2I1enBJMjlwQ25PVTc1R1FGcTNPZ0dU?=
 =?utf-8?B?eDQ3RmdtN3VVdTdnUS81T2RXYW9PTFd1MHdXTHI0NmNzVVhTMTRKN2RKK2hw?=
 =?utf-8?B?QlZ5SWhHWXE0Nno1djcxam9CTFBpaU10V1dKakZiTFpiMlBpbVI4czVFMFND?=
 =?utf-8?B?b01SMnJTcU1pb0c0eFFwamRyYUFJL0lvQTJoVndkRUdSS2Myck90NzB3YkJp?=
 =?utf-8?B?Wk1DVDlJUU1FWUpuRnJDV0ZmVDNrdnljSC8wZitoTXJ1d3hMMzhpbmFaeEJT?=
 =?utf-8?B?b0JtV3M2OHhqelhNNDE3NXp3MXNReWpxMGRGMjhEdHRMUDBRZFlDZGliL2pS?=
 =?utf-8?B?YkJGYkU4YUJjYzhnSzNVazRHZk1HRjhRNGhhSzBiT3FrZ3pEUWlwbHNscFNv?=
 =?utf-8?B?Tzg5QWVlRTdKK0M5MkozMktoRXkrbWZSS1MzcjYyUWZvRXdjVWJxSXYzdGVl?=
 =?utf-8?B?N0V4ajNOYUhXMU5Oc0pKczBZQTRML2J6UUpodytnOXQyRTBBY1FXcHNabllI?=
 =?utf-8?B?Ykt4RDJOSCtuUERESzJMOHBncWdobTJlUjFwSURpVFhMVXFiZG1UQ0RpUEY4?=
 =?utf-8?B?UzZqTWZRd1hsdlYvSmpuWFVEZmswZUVCT1RhS0M1MXIwK09td043VG5zaS9Z?=
 =?utf-8?B?QUVmVHZtb3JHU2gwRTNoUTN2NnlIV1VKYVpsRjBBVmJaWkpJSjVkSkViSWIr?=
 =?utf-8?B?S1dNeGpkQTBFR0JXNnFTYXBINkNIVEh6VWJPYmdRRVpwMDNxbUZpSUpKR0VJ?=
 =?utf-8?B?TkhOcEhoVm5NdldvNGpLNk1wZEpaVTVHZnA1VEt0VjRxK1J4dFlFSURqSlZI?=
 =?utf-8?B?a3BSQlVMQlY5d0V1NTZCL012Z2MzbThwN1dZaE14NjJGN2dJUzR0YlJTbytB?=
 =?utf-8?B?UmViY2pFeU00T0Y5ZjliaWo3Um80R2Z4cHBKUE5POVNER09iMWRkU1o5dXFp?=
 =?utf-8?B?Y2VqKys2bzJEMjN2U1hFdHA3c25OWUpNOHp5TjBITUhUbkVGaTE3VDM4Y2Rs?=
 =?utf-8?B?NVFheTdaTkFUMEt0MjZlSWVpRHRocjBvT25tSVE4TlJ3TGF6K0R5QklkZmI2?=
 =?utf-8?B?NWluRnAvWExFQ25Fclp6NkFMVXJaTzZqdkxHUzdqa0U4dklYT0NLbG5zOHdp?=
 =?utf-8?B?OFU2UGl4QUlxNnkxZDViUEorZkxOQm9jZTVDaTN0ckpoTjF5MlZ2NjhYdy9Y?=
 =?utf-8?Q?LzD0mQcRc/9Hf249o9dWnno=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53A23F7748F0E144AF050DF6C08EB2B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdddfdd-cbb4-45f0-785e-08db687288d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 22:48:53.4423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ65mQTbV9rZbNJURK/p6Wv5EWjegmiaj1MiarpVK8UHz8JvgK9asC1i1Uxx3e4aJLq/mjj8CBfcjwvTpqIHNSiEgfqtQbhm3bdWprcZ8Eehk5bHmj4AbPFb6DJClanm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

T24gVGh1LCAyMDIzLTA2LTA4IGF0IDExOjE5IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gT24gNi84LzIwMjMgMTE6MDQgQU0sIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+
IEVuc3VyZSBpbnRlbF9nc2NfdWNfZndfaW5pdF9kb25lIGFuZCBpbnRlbF9nc2NfdWNfZndfcHJv
eHlfaW5pdA0KPiA+IHRha2VzIGEgd2FrZXJlZiBiZWZvcmUgcmVhZGluZyBHU0MgU2hpbSByZWdp
c3RlcnMuDQphbGFuOnNuaXANCj4gDQo+ID4gICBib29sIGludGVsX2dzY191Y19md19wcm94eV9p
bml0X2RvbmUoc3RydWN0IGludGVsX2dzY191YyAqZ3NjKQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVj
dCBpbnRlbF91bmNvcmUgKnVuY29yZSA9IGdzY191Y190b19ndChnc2MpLT51bmNvcmU7DQo+ID4g
LQl1MzIgZndfc3RhdHVzID0gaW50ZWxfdW5jb3JlX3JlYWQodW5jb3JlLCBHU0NfRldfU1RBVFVT
X1JFRyk7DQo+ID4gKwlpbnRlbF93YWtlcmVmX3Qgd2FrZXJlZjsNCj4gPiArCXUzMiBmd19zdGF0
dXM7DQo+ID4gKw0KPiA+ICsJd2l0aF9pbnRlbF9ydW50aW1lX3BtKHVuY29yZS0+cnBtLCB3YWtl
cmVmKQ0KPiA+ICsJCWZ3X3N0YXR1cyA9IGludGVsX3VuY29yZV9yZWFkKHVuY29yZSwgR1NDX0ZX
X1NUQVRVU19SRUcpOw0KPiANCj4gSSB0aGluayB0aGlzIGNvdWxkIGJlIG1vdmVkIHRvIGFuIGhl
bHBlciAoZ3NjX3VjX2dldF9md19zdGF0dXM/KSwgc28gd2UgDQo+IGRvbid0IGhhdmUgdG8gcmUt
ZG8gdGhlIHdha2VyZWYgaW4gYWxsIHRoZSBjYWxsZXJzLg0KYWxhbjogdGhhbmtzIC0gd2lsbCBm
aXguDQoNCg==
