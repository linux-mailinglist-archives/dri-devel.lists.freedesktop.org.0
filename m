Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C861277D2C2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 21:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BCA10E262;
	Tue, 15 Aug 2023 19:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1F910E262;
 Tue, 15 Aug 2023 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692126056; x=1723662056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=183h9gC2wbiggseXj7wNlk+5evsasjGplJbYlC3V5bY=;
 b=brJIT0ErtK7Ik8qA0kIwvmO9YrJX0XsNn+60ukUghaIp4DFOPRIUFkMw
 6bc4yFwkwOOfY99jL1AU1fAEN9Uvu7sdYIBlZCVx0rVSUhpQ7TegboNHJ
 Q5xI4BSebJXb11zT/Cg+fzrbpxlX64Q2Bu3JmH+TSgxqSw2w4XdWBjTxf
 Sb39dOXNScdGdhZzs817jeJWmHk9xlD5BkcyDYFjbyBasDwpCqg5ZAdP9
 C/hteYR8sWE7AiZskH9AzH/I/OJLsUSqGjzHJe6u3byiEkAHWHj0PtyHT
 yV4L62SxLZVOTngQGy7zYA1ozjKqnzTpY6q6pUssaPVfzbaRWD8z51LVh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357330731"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="357330731"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 12:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768911272"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="768911272"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 12:00:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 12:00:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 12:00:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 12:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrw83lLcqaUzBdhnqqM0Mz05KeC/NN8c15B09QGm6pZdfW2BZVqgg2ivUyWoma7EII3QHVYiSHINT+FBWIomQy3lN22myZIjYAUlnI0UafF4mOLtwy7M5gRU8L1tvrDT06VTMvSt3BvAGJEG68k+3CMCvBnPETz1pUxthToEXTx7wBqBtHZwJSRBDcF4vc1qPh7kbALWZsPRMiUdiBcQyJEWDxcApd0qjjQkHQJ/HZRbFBxGcKZiP7b1oUX+fhx13t6Sru6/gxeJZf9EeEkYjBCLUcgs44O6Y1PH6PzKjQu9GXio4LMh7wpRN4VPOaL+zy0vk3XMiCwGVU8vPEk5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=183h9gC2wbiggseXj7wNlk+5evsasjGplJbYlC3V5bY=;
 b=hLhHkg6IAsESuW/8mTo0pMRy7mg0/o4kF+VmhWfmJ8Kl+UoJwgZFW/cbhY0UMvytXtZzQx198dN5ehZpATeRpuZ6zyMwwTG2GVMI2UVx08En2KUvtZmXPDyAQ5GbG+TNU3UFPUWsHhXCXQlTiq2/v9Mf7BGE2RSZEYmFifxyki7fEFq34PWHRDsXORX7tuYWvrJDf+0CuJb3nEH/dbts94+O4S+4wu3WSyz3jY3tjKFjGeV8FIKjQNFBexD77Jv5vWlsFJ963tJs2R6XMtlv4ipTRt/udwBckEFCdmjZVHgdEE3Rmz8IeN86jkWxOS83Jp7DbQHQrTTrad1BEjyxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 19:00:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 19:00:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Thread-Topic: [PATCH v2 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Thread-Index: AQHZzxWQy5JGxDFqNkeINz7P18LlUa/rYQ+AgABWVgA=
Date: Tue, 15 Aug 2023 19:00:42 +0000
Message-ID: <927613bebc8049a75691d6014ac54c50ebff49f3.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-4-alan.previn.teres.alexis@intel.com>
 <ZNuC63EL/i+jiVU7@intel.com>
In-Reply-To: <ZNuC63EL/i+jiVU7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW4PR11MB6958:EE_
x-ms-office365-filtering-correlation-id: 5af2bae9-cbfe-406f-1c56-08db9dc1ec5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lzA6yQOIeiqKvBsGiTmXMry6Ifj8qNBiXBfLsLyrR790XBB6sBghTagSqITL+drK4eqpm2hL3WsnAppRDCG+U++f5kBL2C2pHJEXx7EdV45yBycrol1kwa9s2xuZzqpkX+T/C6v8kX+10bmv/xT21SOn9haMjjIRi4GI+Ux1csiiU4o9mN6azIbg9cUzW3TaXTZ8oY5PcZ+fzoduy/FkKMiKvwz8gw/mqnwzldlJXRgNfQbH+RE5aNhoCJRrOph73ySySv0km4Ld+rl4GIYTYtY48PUEntfx3ET+lquqHLTD2MIJQbkWWUOH54yWQAvTmDWcimOyjbbCTewrNWnKjYsUyuSgbeV+U8sS1tpMOG2lDWI/LzWpBdQ6VnWU96jL07j97dqeCF/WMZ8QMgWG6K71Q4H0u3S1LQ6FQltqw+eGtMPEm8cbNC+egs7X2X8iJ+75tlni6SuWzXEDwbZx2cRNumagiE1yoFq6cRe2ZCppIcbfSBRvlbirzfzANBxZ0z7k5U/wJ4FAd4ma6Jv7rGD5eh4C/ZIytSW9rJh+urrSRHPJxl8FUQ2y90hCxV/S50d9Xebqi9ItBwxc/PjXEnwgacnKpzUkzeCH7MHbLGRh0KvQWv5fJbcVpjs814Wr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199024)(1800799009)(186009)(107886003)(38070700005)(15650500001)(66946007)(66556008)(66476007)(36756003)(86362001)(6512007)(4326008)(66446008)(6636002)(316002)(71200400001)(2906002)(6506007)(26005)(478600001)(8676002)(122000001)(6486002)(6862004)(2616005)(83380400001)(82960400001)(5660300002)(38100700002)(37006003)(54906003)(41300700001)(8936002)(64756008)(450100002)(91956017)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlkMEhvSXNXUnlMZ0xLK09VODFzc3p5RDhHTDBaL0I1eXFhRXg4VzduSzdO?=
 =?utf-8?B?R3o1QlA4TVQ4T3JSMlMyNUtsOUJvK2o0UTdWSXE2ajRaQXYwNjg0V3ljdk1R?=
 =?utf-8?B?MEo0NVY1ZWR6SzQyZVp2MjBaZ3MxTkNCSDYzcDQ2RHlOd3I3Q0lvTkN6dStU?=
 =?utf-8?B?V2RXU2Uwa1VsbE9zcnc0aG03K0hHcFd0TkV3VmN3R0paMlUwK3pmd0t4WGxl?=
 =?utf-8?B?UUxCcFZHUzl3YWRCUFo0cXluU0swb0ZVdnY2VXczeXJ6M2U2Z1hnTzlpeCtk?=
 =?utf-8?B?bUJQQkFKZVNJMEdjZ0FSaUt4R2o0SE1mZjE5WC9HMk9LaHpLQkF2SUVmSUl6?=
 =?utf-8?B?RWxCd3FhYTJ1bkVRcWtSS2ROazU4L1JlZEpET2dHSUVQQkRGTU0wVFhTU1Ri?=
 =?utf-8?B?ODErVXB2NCtub2F0dytzSFFYaVRvYWJkNm5MVVRmOFRHMENTbS90dkRvWW5m?=
 =?utf-8?B?L1Bic1F2TW5oSGY1OVpNSUVZWitwOGFuNXUreFlNVDFjakxmdUxtaEc0Z3hS?=
 =?utf-8?B?ejJzY3hjZzNFQUpaYjRybjRjUSt3TGpLU29VT0VCNzNvaHhncHRJOFlFRndD?=
 =?utf-8?B?Q0F2Y0NaREdISzVkajJYT1pobXBodGovem1QOWJ1TEFGWk1ZTnRkbC85ajhl?=
 =?utf-8?B?OE5KQUxJWWNCejhHRGg1QkRuTHc2LytkaENiMGs5MHUzTTkvT01FTmVvMitK?=
 =?utf-8?B?TlV3UWorUVhkT3lQWGtvSVFrc2c5bWhMS0lXT2hmaitkQUIrZVkzMjQ4YlVm?=
 =?utf-8?B?MkoyanhmNHRGa1BCN0VpcWRweUwzVUV6OWw0akRjNjJrbjVmSk5YUE1VSkU3?=
 =?utf-8?B?QUFjdi8zQ3BZYTFUYXJia1dpd2VYOVJTaUphN2krWDBZVisyVHhZQ2RNTDBi?=
 =?utf-8?B?SFE3RkFQcFJYRzlWUHh5ZVNWZjV6b0FleVZJM1Qvc2VkZ2VONnd4eGRuY1lz?=
 =?utf-8?B?QmVGalpDTUN3VVZMOG1SNTVPdUVnUUtlTlh1THNyNmpNYTg2M2ZzT1FrWlY2?=
 =?utf-8?B?TUU2NEdqa1JIRXB2blFac3FlanQ0b0VndzB5S012Vk1pejlDRGNiMVFjVzNW?=
 =?utf-8?B?c1ZwRkRNUXgrMXZIOEY5V2M1NFUvWFZoK2J6V2RlSGhUT0dwOEkvSy9hcXhW?=
 =?utf-8?B?dUJUVmtQM0krU2RJVnRUelE5TWNyRlN2R1grOVpkTGpQM2ZWNkRwblRPNlBj?=
 =?utf-8?B?MktZTHRScGVJdS85V29maEhIY0R0Q3hOeTFFYm1aU0tBK1Ria2taZHNFZE9t?=
 =?utf-8?B?UnFqRFkvWGxycE03NWhlVjdBWXFPOVFoOW12V3lQK0UxS29tM1pjYlFWbTZi?=
 =?utf-8?B?ZHZMWm00azdOQ3g4T0N3WHg3QjhEVlRxMnV2eWZVQTlQMms5aDRTNnY2SFJK?=
 =?utf-8?B?Z21CQUVvU0ZvS21hL1Blb0puNGJSQUJhOEJsVitXNWNWcXBPaVl5dVNTK01Z?=
 =?utf-8?B?aUVaSGJaWE5kd2VSZ1hxOVJrb2xJRkk0LzlXcTREUzBXL3F2SmR5L3lndExF?=
 =?utf-8?B?eCtqTjZTWnFudjNzdGNYUGwwdzhpakRYVi8xeHpMbFIvOVo4cWYvZ21tRXg0?=
 =?utf-8?B?S3B6R2JQb3FMZElPR29Lbm1DWTU3UzdLeDlVWmdiYSs1ejFGYkRoaHJFd1Rp?=
 =?utf-8?B?MFF4dGk0dmo5SmJTaS9KQmZUUnRVek9Nb3o4bzcwbFlTVXJ4SjY2WnpaZUJ1?=
 =?utf-8?B?UXNXSU5wS2JYTGMzT1lMdWtiT05iT3hhS1RqbUVweDJHaTZudzVKNTNjT0ll?=
 =?utf-8?B?U04xck9qaG9YdmlGWHMvYk9GVHpGVXdUdWZpcWVJTW9xblZPWS8wZEZBbkpX?=
 =?utf-8?B?QVJaZk40QkRsajE2cFZYVnNwL3Vrb0hxRXZJVklWK2ttOVJPREw3blNrUnox?=
 =?utf-8?B?OWk5bW9DUDl2dHRQUDljZ2NGR0NFdDBTaDhJNXdicHA4VXNicnIzaWpodXVy?=
 =?utf-8?B?YUJtTEZZczRzUUhQWGs0R1gxL1liVmhGZ3p3ejhlbHFEYXNtQlNmVldCbjdh?=
 =?utf-8?B?SWxNUXh5OHVsTS90VGdJN3FIZXpZMXp0VTJuZ3ZFS3ExY045Nnd5Q1cwOVNj?=
 =?utf-8?B?UldWSUZHTlFlb0ZDN0FMelV3MmsraG40VTlheEhaWEZWeld2NEJ6V0tVOGtK?=
 =?utf-8?B?NWtMUnBjZVpGYjhWZFE2TFhCQ0lER2Y5RTRrcUE1UkVhMDVCNnFGdmZTWmY2?=
 =?utf-8?Q?B3eTjcIov0BQiJFytOnxy44=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33DAC0050806547A899240FA38316E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af2bae9-cbfe-406f-1c56-08db9dc1ec5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 19:00:42.2506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDmyZdMQemNgjnb6rwu2s8+JHtHkEip1zyAumurh7ajU+goD5UYCihO27s26zOHYuzCmMBx8fKDTsODM3QODOzls5YL7Os6fmpe2pk59haRCbJZ/5So4yKbHWC0dQcJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFJvZHJpZ28gLSBhZ3JlZWQgb24gZXZlcnl0aGluZyBiZWxvdyAtIHdpbGwgcmUtcmV2
Lg0KDQpPbiBUdWUsIDIwMjMtMDgtMTUgYXQgMDk6NTEgLTA0MDAsIFZpdmksIFJvZHJpZ28gd3Jv
dGU6DQo+IE9uIE1vbiwgQXVnIDE0LCAyMDIzIGF0IDA2OjEyOjEwUE0gLTA3MDAsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+IFdoZW4gc3VzcGVuZGluZywgYWRkIGEgdGltZW91dCB3aGVuIGNhbGxp
bmcNCj4gPiBpbnRlbF9ndF9wbV93YWl0X2Zvcl9pZGxlIGVsc2UgaWYgd2UgaGF2ZSBhIGxvc3QN
Cj4gPiBHMkggZXZlbnQgdGhhdCBob2xkcyBhIHdha2VyZWYgKHdoaWNoIHdvdWxkIGJlDQo+ID4g
DQpbc25pcF0NCg0KPiA+IEBAIC0zMDEsNyArMzAzLDEwIEBAIHN0YXRpYyB2b2lkIHdhaXRfZm9y
X3N1c3BlbmQoc3RydWN0IGludGVsX2d0ICpndCkNCj4gPiAgCQlpbnRlbF9ndF9yZXRpcmVfcmVx
dWVzdHMoZ3QpOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCWludGVsX2d0X3BtX3dhaXRfZm9yX2lk
bGUoZ3QpOw0KPiA+ICsJLyogd2UgYXJlIHN1c3BlbmRpbmcsIHNvIHdlIHNob3VsZG4ndCBiZSB3
YWl0aW5nIGZvcmV2ZXIgKi8NCj4gPiArCWlmIChpbnRlbF9ndF9wbV93YWl0X3RpbWVvdXRfZm9y
X2lkbGUoZ3QsIHRpbWVvdXRfbXMpID09IC1FVElNRSkNCj4gDQo+IHlvdSBmb3Jnb3QgdG8gY2hh
bmdlIHRoZSBlcnJvciBjb2RlIGhlcmUuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLl4NCj4gDQo+
IGJ1dCBtYXliZSB3ZSBkb24ndCBldmVuIG5lZWQgdGhpcyBoZXJlIGFuZCBhIHNpbXBsZQ0KPiBp
ZiAoaW50ZWxfZ3RfcG1fd2FpdF90aW1lb3V0X2Zvcl9pZGxlKGd0LCB0aW1lb3V0X21zKSkgc2hv
dWxkIGJlIGVub3VnaA0KPiBzaW5jZSB0aGUgZXJyb3IgZnJvbSB0aGUga2lsbGFibGUgb25lIGlz
IHVubGlrZWx5IGFuZCB0aGUgb25seSBwbGFjZQ0KPiBJIGVycm9yIEkgY291bGQgY2hlY2sgb24g
dGhhdCBwYXRoIHdvdWxkIGJlIGEgY2F0YXN0cm9waGljIC1FUkVTVEFSVFNZUy4NCj4gDQo+IGJ1
dCB1cCB0byB5b3UuDQphbGFuOiBteSBiYWQgLSBJJ2xsIGZpeCBpdCAtIGJ1dCBpIGFncmVlIHdp
dGggbm90IG5lZWRpbmcgdG8gY2hlY2sgdGhlIGZhaWx1cmUgdHlwZS4NCmFuZCBJJ2xsIGtlZXAg
dGhlIGVycm9yIHRoZSBzYW1lICgiYmFpbGluZyBmcm9tLi4uIikNCltzbmlwXQ0KDQo+ID4gK3N0
YXRpYyBpbmxpbmUgaW50IGludGVsX2d0X3BtX3dhaXRfdGltZW91dF9mb3JfaWRsZShzdHJ1Y3Qg
aW50ZWxfZ3QgKmd0LCBpbnQgdGltZW91dF9tcykNCj4gPiArew0KPiA+ICsJcmV0dXJuIGludGVs
X3dha2VyZWZfd2FpdF9mb3JfaWRsZSgmZ3QtPndha2VyZWYsIHRpbWVvdXRfbXMpOw0KPiA+ICB9
DQo+IA0KPiBJIHdhcyBnb2luZyB0byBhc2sgd2h5IHlvdSBjcmVhdGVkIGEgc2luZ2xlIHVzZSBm
dW5jdGlvbiBoZXJlLCBidXQgdGhlbiBJDQo+IG5vdGljZWQgdGhlIGFib3ZlIG9uZS4gU28gaXQg
bWFrZXMgc2Vuc2UuDQo+IFRoZW4gSSB3YXMgZ29pbmcgdG8gYXNrIHdoeSBpbiBoZXJlIHlvdSBk
aWRuJ3QgdXNlIHRoZSBzYW1lIGNoYW5nZSBvZg0KPiB0aW1lb3V0ID0gMCBpbiB0aGUgZXhpc3Rl
bnQgZnVuY3Rpb24gbGlrZSB5b3UgdXNlZCBiZWxvdywgYnV0IHRoZW4gSQ0KPiBub3RpY2VkIHRo
YXQgdGhlIGFib3ZlIGZ1bmN0aW9uIGlzIGNhbGxlZCBpbiBtdWx0aXBsZSBwbGFjZXMgYW5kIHRo
ZQ0KPiBwYXRjaCB3aXRoIHRoaXMgY2hhbmdlIGlzIG11Y2ggY2xlYW5lciBhbmQgdGhlIGZ1bmN0
aW9uIGlzIHN0YXRpYyBpbmxpbmUNCj4gc28geW91ciBhcHByb2FjaCB3YXMgZ29vZCBoZXJlLg0K
YWxhbjogeWVzIHRoYXQgd2FzIG15IGV4YWN0IHJlYXNvbiAtIHRodXMgbm8gaW1wYWN0IGFjcm9z
cyBvdGhlciBjYWxsZXJzLg0KW3NuaXBdDQoNCg0KPiBQbGVhc2UgYWRkIGEgZG9jdW1lbnRhdGlv
biBmb3IgdGhpcyBmdW5jdGlvbiBtYWtpbmcgc3VyZSB5b3UgaGF2ZSB0aGUgZm9sbG93aW5nDQo+
IG1lbnRpb25zOg0KYWxhbjogZ29vZCBjYXRjaCAtd2lsbCBkby4NCg0KPiANCj4gLyoqDQo+IFtz
bmlwXQ0KPiAqIEB0aW1lb3V0X21zOiBUaW1lb3V0IGluIHVtcywgMCBtZWFucyBuZXZlciB0aW1l
b3V0Lg0KPiAqDQo+ICogUmV0dXJucyAwIG9uIHN1Y2Nlc3MsIC1FVElNRURPVVQgdXBvbiBhIHRp
bWVvdXQsIG9yIHRoZSB1bmxpa2VseQ0KPiAqIGVycm9yIHByb3BhZ2F0aW9uIGZyb20gd2FpdF92
YXJfZXZlbnRfa2lsbGFibGUgaWYgdGltZW91dF9tcyBpcyAwLg0KPiAqLw0KPiANCj4gd2l0aCB0
aGUgcmV0dXJuIGVycm9yIGZpeGVkIGFib3ZlIGFuZCB0aGUgZG9jdW1lbnRhdGlvbiBpbiBwbGFj
ZToNCj4gDQo+IFJldmlld2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+DQo+IA0KPiA+IC1pbnQgaW50ZWxfd2FrZXJlZl93YWl0X2Zvcl9pZGxlKHN0cnVjdCBpbnRl
bF93YWtlcmVmICp3ZikNCj4gPiAraW50IGludGVsX3dha2VyZWZfd2FpdF9mb3JfaWRsZShzdHJ1
Y3QgaW50ZWxfd2FrZXJlZiAqd2YsIGludCB0aW1lb3V0X21zKQ0KPiA+ICB7DQo+ID4gLQlpbnQg
ZXJyOw0KPiA+IA0KW3NuaXBdDQo=
