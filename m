Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204016A02C8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 07:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315E310E028;
	Thu, 23 Feb 2023 06:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790C010E01F;
 Thu, 23 Feb 2023 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677133646; x=1708669646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OB3ukNz+caK23LfP8HXerSdz6y1odBhTNlgh8/gFcMY=;
 b=LgG2bqkDOAqlbt+RqFDjp9Af33BvVZk1RXgd1yK8NYVsOZTeKfgaHDdX
 +bOVO+uHEs1krLeL3a9DslNChLMTWjAlb2zsw8SKXiV6bpzsGOw62vIl7
 ioQnVmyrLsq27LXpfXP/7PA5z36yK/nPzplKx8aoO/oWuyneRjl/ujyYC
 1/08BOAevlerzpdZCYvpOKIKP6vjSKGh4tnJEt/H99odJcxwTyDm/VZ0i
 NiUjvqm3S35lA/Rkn7j7NkbIjjQFqgzxVaPiex2tJ+YhrIuz7jDiUNvFD
 gjtm9isuW/Xhoe0qkM7L0AKxOg4leU9aLkLw4FGWWgp7bcObz/I5TIthl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331799310"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="331799310"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 22:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="736222907"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="736222907"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2023 22:27:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 22:27:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 22:27:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 22:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHMxewYfxVsdBvebpQ8lFPSqdOv2tYqyZ5yDY15UG1Lo4DX8WGQ1lH566vXuUvmib5YscUP9/OIAnffzfVvFs1hQyFUHRP+1VS0OVFTiUyLyIoHdgImgUxErUJadQGuT3oX4wIGCSjJF3U8q9MRDR5+JsxQP0zSUqURp5JsGSrVN0effTg/yNq3NgdZq299jaUiZb4B1mULEBqN/l6HxvcioZzDDATnjXqIFCQKB8QKLYsUvt+y/OmY/gFiAtZVzPRCBiQdry04CfLD7qnHZQsmI4RNPwNH9cRrdGB5sNqmvfGBZn91f10g9dVcXaamSUyzpr9L9oOd2cDhxnaN9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB3ukNz+caK23LfP8HXerSdz6y1odBhTNlgh8/gFcMY=;
 b=lrvgiDWc1olwPLnmqO2c78dg0B7pAhIrFgQn2IN1fPvV9UsnjMrSw6Zpx9OP7ud8Au2ZSDWjgzA7Er7xJO0K+4ztlLmqdifex+9si4VQsZa1P/N0LfESKCbD36LSpndqXXJcM38Uc+MQsd4Lv2T+pEn9lU6ZfBoFxc1fGU1Rud74t2DQ454s0JMnLdGUoTwhAQSU2jzWq4vGOWCIHRbGsHcTtt9DChf8VTt/Q40uzD9OMhACKdvNe8yzHr+f5/4R1Op/i3k0WCff5NHNvqvI6SPAAMVTrdN3LQyt1Fl/YfimS5XYfxbYu9F0emzrpi/F16Sd65xR04j1O1QWS8/p5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 06:27:12 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::6723:483:53a2:5569%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 06:27:11 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "wse@tuxedocomputers.com"
 <wse@tuxedocomputers.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] Apply quirk to disable PSR 2 on Tongfang
 PHxTxX1 and PHxTQx1
Thread-Topic: [Intel-gfx] [PATCH 2/2] Apply quirk to disable PSR 2 on Tongfang
 PHxTxX1 and PHxTQx1
Thread-Index: AQHZRsiHNO78TpLnaUWNbEYaLGMxFK7bZqoAgACrfAA=
Date: Thu, 23 Feb 2023 06:27:11 +0000
Message-ID: <d254b88a99e0a979efb07d9298afdeb7016f0e0f.camel@intel.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
 <20230222141755.1060162-3-wse@tuxedocomputers.com>
 <Y/Z3ZJjYQIKb2LQ0@intel.com>
In-Reply-To: <Y/Z3ZJjYQIKb2LQ0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB7764:EE_
x-ms-office365-filtering-correlation-id: db52d1d3-2f53-4141-2584-08db1566ff54
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q1u2n2H61gFFXZJSOmNhnDHRput4nBNGbsW9GzXEoGdbX09DcArrrbl8R8r8+enthPmtloCWCaoHp64tl5ddNHzM7/Ov4fISnFB5oj3iwAjj4vW+MOdBI9E6hsZyP+u1x9FPWx64PAuc22ZjtFSx4WqRiLXc8dFUkA1Y2Xks8W2+sZ1833L4CdVmxyVjG0LsrNVFhNRNh6BAX+P2w+pjJDAI0mPBfsYgYv8TEYiGYNr98YQ0IWofzZkDQtY3Lx7Fw8ygbcDatZrMTgvV4RQqC8lgomnYt4tQoW6pV5m/NY7l2fDhZ15SmMZKnklKSMyf9E6xaxATVmlDSItrFlvXTar5Cj11J/kPGyaa/b/7B73uw+HGmwiqRWI8hJhH/T1b5TECBfUAeXQ8/vyjW1kOoqyFURTg2B4UgZVPO83bucsbhIqd6RjHOt1rSpZvH2Sff7W9dWiRH1Pkb1UzhUaCwsFL92oI3REODZIrkuuUQey7oUpjGlb5d1dl9xiOumJbeqEUCFrg+6QLDgRq66+0J/yz+ZwlDK0WKX0v0TVebOVTWmETYALc0hHlTFPHxNDNFwcFF4dpVYquPoK2C+8t3fRJvyXo1wP0GpWNSbi32PxLbFqGd4AquLHB07u9+iaImMi+MTpoTF1UwAmQR2zoIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199018)(38100700002)(8676002)(66946007)(64756008)(66446008)(66556008)(66476007)(76116006)(91956017)(36756003)(122000001)(83380400001)(2616005)(186003)(6512007)(6506007)(26005)(86362001)(110136005)(82960400001)(316002)(478600001)(6486002)(4326008)(966005)(54906003)(71200400001)(38070700005)(5660300002)(2906002)(8936002)(7416002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjZOUDVnTEN0S1RsQXpwM0FYczhFVmY4YU1ZaGlNZkc5Z0tTWDVDTlpsQWcx?=
 =?utf-8?B?YUxMS3poVGNGR05wMndFR1R4d1o5KzBoYXhhT0YvYUg4Q2Vqdm4zRFBPd1Y0?=
 =?utf-8?B?TEs3YndDUVhhSUlnUllkTjRPS1pEN0luLzFHTWluREdSV1k1UnhYNjVhSjRE?=
 =?utf-8?B?ODdINW9lWGd4aFU0eGJWTFkzcDlUUWFVdUc1RU9YK3poakVBMDZBWDVHYW9y?=
 =?utf-8?B?M0J5RkJlQWl0U1JuWVpPNjVMc09pb1NwVVJtU2ZydVpxM01FcnAyK1laNFdj?=
 =?utf-8?B?S1ZZNE9uWTJSU1M1aWZCdlZiZktBcmxHbDZUV2xKVFRQaENRbDlvbTNOcW1M?=
 =?utf-8?B?SytkRFVCSzhQMkQ2S1VUd1RrYTgvTjh5U1BZU3lRcGJZZzF1MERDdlF1bXNK?=
 =?utf-8?B?RWk5aUZkMkpBWHFsWDl3dmhsaEtLbjBJQ05HQTEwSW1Gd2RnYjczVWQ2QXpr?=
 =?utf-8?B?QUtadThEcG9DV3Y5bU04dmZYZmoxL2VOMExqWm1IYkd2dUYxcG9mdFFKZDA1?=
 =?utf-8?B?eVZFeEt2Z2diS3BHQXFyU0E2bDdsM2l0YU9XZ2JySnp1SnYyWXR5MmUzTTBF?=
 =?utf-8?B?N2ZnOUozaThQYmFZK1FwNTM1T1BtcFgvRDRYZ01qVWovMG1nSnlyRTcrQXE2?=
 =?utf-8?B?MFlPRW8reDQzUnJ3eEFrM1lFZSswZHdIR2FQYTF3Z0JzUUpyaGRpUWN3N1lH?=
 =?utf-8?B?U0plODg3eXluY043bXpJM0tMdGpFbUM5dmcvZ3lwWk9VQTNKUEZGSzdZemFp?=
 =?utf-8?B?ampKTWJRZmorZSt3R1czVVlxQ3hJYUM0Vjcva3NYYmNVZWRtaXdyQTVjR2g4?=
 =?utf-8?B?S0lqdGYxaEVlTFZHRkZZRlQ1eUcvOWtDcllNY1RrMG1GSzRIbkV5dDAreGRa?=
 =?utf-8?B?L0ZCdzFKWlhYaE0rRVBPNnlnb3lWNFNkMWxFeVVkanBId2tiOVRNUTUzbjVw?=
 =?utf-8?B?VVMrbkpUUHBnVWNHM05XTDJMNys2SEQxMHRNSkNIbjJaQ2crN2JuS2gvdGla?=
 =?utf-8?B?TWVLSTFJMTcreE9WUDhQNnlsaFo1UWZJNS9sVkp5T0xYeTdHMlZLWkZWdVNa?=
 =?utf-8?B?R2dKNDFOZ2xkdjE5RXJFN0t1NDF5eUliVjNuTDNyRTA0aDBoN0NVM3hsZHpZ?=
 =?utf-8?B?KzZHL3RNbXpXYnhoOVdGaitrVWlCTk54Z29TbCt5OXVOVERTK0h0clJ1RGZj?=
 =?utf-8?B?UW16RUVBeGpQYlZUL0h0eVdBc1B2SldDdUp0WGIxam55TkNOSC9nNjdpR1BL?=
 =?utf-8?B?c2lOdHdQWjZCYllTdEY5OFRCZjduV21YUjdxZjhIREpxeDQ2TEVUQ0dPUy9w?=
 =?utf-8?B?Y1ZRenViY2xVOERmWDNrQjBuU1cvVmMxS0Y2SjRqVE1pcFQrWm41cW5vQUlt?=
 =?utf-8?B?Tnk5UmZYUzV2eGMwNkhSV01COHk2T1p0VmovM3QyRlBJUktRdGtEdm9wWEJo?=
 =?utf-8?B?Q25vVXY0REk2bGVoUE1vNXpseU1pYnkvY2M4a2ljY0s4NGlkR200Q1U4bG5B?=
 =?utf-8?B?bHFQKzRFRnFBclRmdjluVmdyK01ZTEpUM0laUmo2cXNpRUMxdDNyRkpsNTdG?=
 =?utf-8?B?dFd2R2ZDanVFdURVa05TVnJseXFxVENWMll2Yis4TEVldzRyZk81TkR6dWNt?=
 =?utf-8?B?Wmd1MWhtTEExQVdjb1ZLaWxwWGZ6aXdSZHplNmpmVUlLRjlrZ3lsY2xvVHQy?=
 =?utf-8?B?T09POTFvOWRER3dEdlNwZWxUVERhSU9YcHZMbG9hOXJ5K016VUNiMHlQa0ti?=
 =?utf-8?B?Z0xGMWZSb0ZGSG5pTFZWTWNHTXB3ZXhpNy9qZVV4MXdwbE9jcWtWdmRwNm9P?=
 =?utf-8?B?VFhWQk9lempjcldTR1lrKytzZTFUelFOcGhmQWxwdzNrWk00L1F4eVJDYXZy?=
 =?utf-8?B?MHVsME03RXd0eXFHa1J0bDRWNVczUnQwZjFUeEF0K1c0K0k4MEh0Z2VuOVZW?=
 =?utf-8?B?WE5hWnc2cTFvNnpoU2swZ1M0QXBMd1NSUWZEUFprQnR0VWFLZTNoVW16SFlU?=
 =?utf-8?B?TkFnbHRoUEFUai9kRHdxRUxHU09kK0RIVHB5eG5xaFdWbnRiV1k0ZHh3NU1Q?=
 =?utf-8?B?Y2xVTjNxRDNablZQdlhJZ0tzalZmQWVOa1hYS1owUVZmVC9ldUJET2FwYlR5?=
 =?utf-8?B?TmhzMkZSK3VlemUyaVlXekhzSzRkOHdqQXBaTk10ZVhYdW9uZU1nR0pXaG5u?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4482072CBEAA814C9DD8589358117839@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db52d1d3-2f53-4141-2584-08db1566ff54
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 06:27:11.7296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVdEy0uOEg54Jrxh6nfzlcxzIFrJ/Uh9md3PdwxPhkcS66fyMdfsmP9CUtBWv5A3vVa/C3+71PlNImto+sf77XGGOCFs3AUj5znoz5ys1gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Souza,
 Jose" <jose.souza@intel.com>, "Santa Cruz,
 Diego" <Diego.SantaCruz@spinetix.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Kahola,
 Mika" <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAyLTIyIGF0IDE1OjEzIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgRmViIDIyLCAyMDIzIGF0IDAzOjE3OjU1UE0gKzAxMDAsIFdlcm5lciBTZW1iYWNo
IHdyb3RlOg0KPiA+IE9uIHRoZXNlIEJhcmVib25lcyBQU1IgMiBpcyByZWNvZ25pemVkIGFzIHN1
cHBvcnRlZCBidXQgaXMgdmVyeQ0KPiA+IGJ1Z2d5Og0KPiA+IC0gVXBwZXIgdGhpcmQgb2Ygc2Ny
ZWVuIGRvZXMgc29tZXRpbWVzIG5vdCB1cGRhdGVkLCByZXN1bHRpbmcgaW4NCj4gPiBkaXNhcHBl
YXJpbmcgY3Vyc29ycyBvciBnaG9zdHMgb2YgYWxyZWFkeSBjbG9zZWQgV2luZG93cyBzYXlpbmcN
Cj4gPiBiZWhpbmQuDQo+ID4gLSBBcHByb3hpbWF0ZWx5IDQwIHB4IGZyb20gdGhlIGJvdHRvbSBl
ZGdlIGEgMyBwaXhlbCB3aWRlIHN0cmlwIG9mDQo+ID4gcmFuZG9tbHkNCj4gPiBjb2xvcmVkIHBp
eGVscyBpcyBmbGlja2VyaW5nLg0KPiA+IA0KPiA+IFBTUiAxIGlzIHdvcmtpbmcgZmluZSBob3dl
dmVyLg0KPiANCj4gSSB3b25kZXIgaWYgdGhpcyBpcyByZWFsbHkgYWJvdXQgdGhlIHBhbmVsJ3Mg
UFNSMiBvciBhYm91dCB0aGUNCj4gdXNlcnNwYWNlDQo+IHRoZXJlIG5vdCBtYXJraW5nIHRoZSBk
aXJ0eWZiPyBJIGtub3cgSSBrbm93Li4uIGl0IGlzIG5vdCB1c2Vyc3BhY2UNCj4gZmF1bHQuLi4N
Cj4gDQo+IEJ1dCBJIHdvbmRlciBpZiB0aGUgY2FzZSB5b3UgZ290IGhlcmUgaGlnaGxpZ2h0cyB0
aGUgZmFjdCB0aGF0IHdlDQo+IGhhdmUNCj4gYSBzdWJzdGFudGlhbCBidWcgaW4gdGhlIGk5MTUg
aXRzZWxmIGluIHJlZ2FyZHMgdG8gUFNSMiBBUEkuDQo+IA0KPiBKb3NlLCBKb3VuaSwgaWRlYXMg
b24gaG93IHRvIGNoZWNrIHdoYXQgY291bGQgYmUgaGFwcGVuaW5nIGhlcmU/DQoNClRoZXJlIGlz
IGFscmVhZHkgZml4IGZvciB0aGlzIChUaGFua3MgdG8gV2VybmVyIFNlbWJhY2ggZm9yIHRlc3Rp
bmcgdGhlDQpwYXRjaCk6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvMTE0MjE3Lw0KDQo+IA0KPiBvaCwgYnR3LCBXZXJuZXIsIGRvIHdlIGhhdmUgYW7CoCBvcGVu
IGdpbGFiIGlzc3VlIGZvciB0aGlzPw0KDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2ludGVsLy0vaXNzdWVzLzczNDcNCg0KPiANCj4gVGhhbmtzLA0KPiBSb2RyaWdvLg0KPiAN
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZXJuZXIgU2VtYmFjaCA8d3NlQHR1eGVkb2NvbXB1
dGVycy5jb20+DQo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9xdWlya3MuYyB8IDggKysrKysr
KysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9xdWlya3MuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9xdWlya3MuYw0KPiA+IGluZGV4
IGNlNmQwZmU2NDQ4ZjUuLmVlYjMyZDMxODlmNWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9xdWlya3MuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcXVpcmtzLmMNCj4gPiBAQCAtNjUsNiArNjUsMTAgQEAg
c3RhdGljIHZvaWQNCj4gPiBxdWlya19ub19wcHNfYmFja2xpZ2h0X3Bvd2VyX2hvb2soc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGRybV9pbmZvKCZp
OTE1LT5kcm0sICJBcHBseWluZyBubyBwcHMgYmFja2xpZ2h0IHBvd2VyDQo+ID4gcXVpcmtcbiIp
Ow0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gKy8qDQo+ID4gKyAqIFRvbmdmYW5nIFBIeFR4WDEgYW5k
IFBIeFRReDEgZGV2aWNlcyBoYXZlIHN1cHBvcnQgZm9yIFBTUiAyIGJ1dA0KPiA+IGl0IGlzIGJy
b2tlbg0KPiA+ICsgKiBvbiBMaW51eC4gUFNSIDEgaG93ZXZlciB3b3JrcyBqdXN0IGZpbmUuDQo+
ID4gKyAqLw0KPiA+IMKgc3RhdGljIHZvaWQgcXVpcmtfbm9fcHNyMihzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqaTkxNSkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfc2V0X3F1
aXJrKGk5MTUsIFFVSVJLX05PX1BTUjIpOw0KPiA+IEBAIC0yMDUsNiArMjA5LDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgaW50ZWxfcXVpcmsgaW50ZWxfcXVpcmtzW10gPSB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoC8qIEVDUyBMaXZhIFEyICovDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHsgMHgzMTg1LCAweDEw
MTksIDB4YTk0ZCwgcXVpcmtfaW5jcmVhc2VfZGRpX2Rpc2FibGVkX3RpbWUNCj4gPiB9LA0KPiA+
IMKgwqDCoMKgwqDCoMKgwqB7IDB4MzE4NCwgMHgxMDE5LCAweGE5NGQsIHF1aXJrX2luY3JlYXNl
X2RkaV9kaXNhYmxlZF90aW1lDQo+ID4gfSwNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgLyog
VG9uZ2ZhbmcgUEh4VHhYMSBhbmQgUEh4VFF4MS9UVVhFRE8gSW5maW5pdHlCb29rIDE0IEdlbjYN
Cj4gPiAqLw0KPiA+ICvCoMKgwqDCoMKgwqDCoHsgMHg5YTQ5LCAweDFkMDUsIDB4MTEwNSwgcXVp
cmtfbm9fcHNyMiB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoHsgMHg5YTQ5LCAweDFkMDUsIDB4MTE0
YywgcXVpcmtfbm9fcHNyMiB9LA0KPiA+IMKgfTsNCj4gPiDCoA0KPiA+IMKgdm9pZCBpbnRlbF9p
bml0X3F1aXJrcyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkNCj4gPiAtLSANCj4gPiAy
LjM0LjENCj4gPiANCg0K
