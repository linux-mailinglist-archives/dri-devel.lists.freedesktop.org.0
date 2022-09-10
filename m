Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CC5B435B
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 02:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556710E1F6;
	Sat, 10 Sep 2022 00:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1B10E1D7;
 Sat, 10 Sep 2022 00:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662769128; x=1694305128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=O/L2EqtP2vI4fr+9C9bd1EmIajtt7t4ZXO6KIH9iUsg=;
 b=anWSlqG2bKpQqEtuC8CLLaOkup0/eKIUSWoMe1iIAgSpiOwH0r8tAURd
 8uiHjoVvr8u0CQlUnmpvMLVDXfG6Sbf2+rbNd78byF7YeB22IfgQgMOjn
 EQp5yicmfH1FVJ3YdlSMH11SkWLkwdagcgRl6+N5hEgTYgoZlPS2bm+S9
 /X9Q67AY2k30/DI3pqsueQYQqB2/Zr2V/qmxDaavrDbKKaF17xyHqjGL5
 Z5oBMYrJcxfmBcnVwr1yhTp/dRJed8KYB8BURXM+dOB5uKFeGfOMrtvuK
 uhJQFWpM+kfwovMsyVbLUFPLCv9d842Xe7HZJ+hMBWcir4UaAI5yPXJmi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="383891947"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="383891947"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="592799703"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2022 17:18:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 17:18:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 17:18:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 17:18:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 17:18:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1yDpicaJ0QHnCVWvx1OG9bQUDKwWY/7i639aY2u3HjunEAEkcmm6f7lGZ5wu0fOxN3uxA6+ni5aa8Hn0kLKPMGAv8LHKFsgKf1Oi3vB/wUzVb5n7ooDFN09G+PzOrSa2HTH42gaHdUNjCXxEpgnn5+IYpJ8UW7vA/PSgELVI5vP+e8PCNzyDswFIGAG6M+v+/IJ4c1FpLEpA8t8ZTWQlkMHsJTXwt8U68lBbgLNQTtlLubb/Hokj4ZpHyoYTLOND2oJaWmdezNJbQIdQdqdSNcllpsi1LyITiR0nVvDpJ/aYKbG57/CS/OMVGUnedvQYQYvqVGZtg3SJeg+ZXNfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/L2EqtP2vI4fr+9C9bd1EmIajtt7t4ZXO6KIH9iUsg=;
 b=CfI0Xz39gmvyqBKyXENS3EOANmuVBQxQ5XjTNQVs0Tkfa/88nrnLIAa3JuhlsUb2cf1RUHWaiBUkFBh3SwSZxxcCNJ5Sxolmc4889o5o61jNbmNhKWLw9fFyTqKMJoZfUNloV5Z9tG9nfEx9agqL5bU5PY5mzC5s+qDGVcz2iaE19uZJkle5qv5aX6F0NSBnLePO9buKNP71oMegf6t4xqnkasTGKNT63FF4X8sH29/ltYW2j9CQRyZHCVD+aGWAxMvcN037hoC7XEiXGh6OTfkDSXtiZxFhrIYIabdt4uceaNVbtd0KFa+aEkErNFZSF6r6XtS0JYG6rAmAna2vKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Sat, 10 Sep
 2022 00:18:39 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b57b:6a79:eb1a:5c63]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::b57b:6a79:eb1a:5c63%4]) with mapi id 15.20.5612.020; Sat, 10 Sep 2022
 00:18:39 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 14/15] drm/i915/huc: define gsc-compatible HuC fw for
 DG2
Thread-Topic: [PATCH v4 14/15] drm/i915/huc: define gsc-compatible HuC fw for
 DG2
Thread-Index: AQHYw+F+64Vk+S/Vo0WqtHqps4yKwK3XznUA
Date: Sat, 10 Sep 2022 00:18:39 +0000
Message-ID: <abcc099f0eab58e008b741fa660ee73661cb93d0.camel@intel.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-15-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220909001612.728451-15-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|SA2PR11MB4938:EE_
x-ms-office365-filtering-correlation-id: 6953341b-3f34-454f-544b-08da92c202a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5zW1r4+yMS7j143f2qT6Ezh3hOWXI3ROMvQF3tTD2AhPopb9mFi37/S0+3kAGSN38FOHwvGhpLeZz84YMol9BLpQ9TK7eDm3XtjSugnLG4QJfsYMpUFvD1mA+Frdno8Qso5W9S/dZDsUA3y+rhqnT2xaLwVR7ljGrKSF23P/9+tNOjohtU1NGE3LenXBHDmOxX8LFRvVwAkCoSOHnQPMo4xXiuSJuOQk+7oHs8ybNFgrRs7M0Bsqkz5vygV69Q1agEstStXhp5n1M03xlmV1MvWmXxuy+ArqW9C6RG8gNjNODiEK8yhJyBiWvz8s49DlJY7NlKhIuKdc0aOGGU6UJZJYgaftGMZKbOy56Tz3EHhq2STOr2QH9O/GzuoRE+6rEAyGZJdkrrnCdc2NEuMddJWN4+1QZwCDm+a8Bs9JSA7W2bN4o1fAsryidaaMywbrFW72Fgm7ZvQVP78OLN24ww+n4VGOw+G38Bng+eSMdd4rvYjHlofl79Cv9s1I2G4+scMItIK2yukKBWk3lNw4SbVfz6IDQDhqoybIL8k4RKl6P0PeQpo3J4RZlsT6Vg5f+0BKMdgQLGCTIRAl5DpkgucOfpbAn2RsffgAi44243UdqemiTVBAM6iuomvXWfTkH3FgRpOSM9bqJEH1b6YYF3y0z2ZcvcgYjZfoJyZSis3EsvZSKzilJn7b8BQyKOxYlQNDW4PH97pMWzjHgWSWeN20jexmm+tdLGfNoMaMocAvmpYdtEzQs1YlG8gAS/1W18YFnwoMnNEElBjWC/QRgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(39860400002)(396003)(136003)(366004)(38070700005)(36756003)(91956017)(82960400001)(122000001)(38100700002)(66946007)(8676002)(450100002)(4326008)(66476007)(66446008)(64756008)(66556008)(76116006)(6506007)(5660300002)(41300700001)(107886003)(54906003)(71200400001)(6486002)(316002)(478600001)(83380400001)(186003)(110136005)(2906002)(8936002)(26005)(6512007)(86362001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG9jTDlXREIvMmxocFhEcUpSaUE1VWhSYWZnNFNCRldNS3NaRWt0VWpCeGc2?=
 =?utf-8?B?OGNFcWUyaEF2VW13SEhPSGY1blBHZXZrQUduY0FTRHZaWUl3LzVSa0laWk9I?=
 =?utf-8?B?dnBPSXhyWUVxWkh6Z3FzTnNPcmYwRGZGdk9iRDU5RTVRais0ck1nbk5GVVNJ?=
 =?utf-8?B?dFNNdWtEbDZqWW1NNlhsWlBpL2N2RW5Vb0pPTnliUW9nR3lPeU9uSjgrUFNs?=
 =?utf-8?B?c0laODBySGpWdW5FeG5aREFsVXpIZUEvUHQzNDdsa3I5NEtzOC8waFd3V3Vi?=
 =?utf-8?B?VHZmZGpMRld6YnMxNldBT3ZaekpEaWJXNjQzK05KS3ZhRjNKQjF4VDRoTk5i?=
 =?utf-8?B?UGFzdG9SQy9hbk5JUFpkck9BdmRMQmo4YnlnOFVJQndoc0IwVGN2elRXNzgr?=
 =?utf-8?B?LzhRWXdQTGxoVXhIUldYcUlLdnlRK1h5QkYxNk8xeW1oNU11ekV6aG5oSzY2?=
 =?utf-8?B?cW1Wbk9kRHRFSlMyYmNIVURMSm5STk5ONE94RHFwendxcm05VFp3N0hUSjJv?=
 =?utf-8?B?VkJjRENCZFluaVFsN3dnWEQvQnR4bjU2QTZBZXhiMHdQeW1Obno0VjlWNHJK?=
 =?utf-8?B?Q29NTkNUUkxtdU1iYlJnMDZTSXhaYTBUa3dMc3dzbEsrejFrQ0M5TXB5M0pW?=
 =?utf-8?B?RUdIcEpFUEx3Z0ZjUCtXY2tpdHpWTjBxUnQ4Q25kMWtBa2gzN25CdWYyeDVG?=
 =?utf-8?B?VkZ1TVJYRUl1QXI2Ykl2OUNuMDU3Uk13NkMxVmpYWnZWVGV2dFpKRld1QjQ5?=
 =?utf-8?B?WDJjWDNjemhlWHZNWVV1ZDl3dWU4dkRRbG9LUFQ1cHZ4MFFVOXJmK1FTMzFE?=
 =?utf-8?B?MFZXMUZmVFZya20waHQxN2FCZHZvMnc4TE1hWVV5TTdzWVVhU3hBTGM3M1p4?=
 =?utf-8?B?ejBQaEdoSExnK1J3Unk2MnRBQ0FvMkV2V0h1MjExZ21zQTBIUEQyZk9qdGEr?=
 =?utf-8?B?a0szcEZFUHI2QlJyQzByU25sT00zVG1wVmY5eEIzR1FuN0xvWVFoVzdIV05M?=
 =?utf-8?B?Rkl6RWZYeVVJUEhrbmdnWUZ5b29LRUZWU0xOOENCQzY1OExJbStrYmw4dmVH?=
 =?utf-8?B?ekpZVk85aTlSWERHUXgrV3ExY0hFdm5WRVFVRSt2RVZYdWpMV3F5LzJsUzFk?=
 =?utf-8?B?MU9qSEExS0xuaEY2emYyZ0VRLzNMQkhvTEIyd1JqN3BoR1dQME13SUtSSUQv?=
 =?utf-8?B?OCtqOXRrQkI3TFRhVFB1a2xDWTNJSlR2YmFrKzhsdHV1T3ZaSHlGM2RmZnoy?=
 =?utf-8?B?RmVXUGdOVFJHU0U4d1FEVHIwM0Z6RCtSRi9GejQxdTFTTVg0czFMOXpnRWEy?=
 =?utf-8?B?QWY5eGRNeFBONVFjaVB3VjA2cEpTcDNBOEI1SkdDUVkxc0t5cENiUVczNy9V?=
 =?utf-8?B?TWthQWtVN2RSQXJxbXE1bHRmcDBWbHJ4ZkF1cTd2K0IwUnVwdEl1c0NPK0VF?=
 =?utf-8?B?ZWMvY1NUaFJEUXBQSmNGWS9jcTJDWnBKaVdHbC9NUzlNR1FncWdZcmhHZ1BL?=
 =?utf-8?B?am9tSEVGUUZDSEt0UTZ1aFpmU0VLWjdiSHp3UlZEeGYrRTljektYZDBERHN0?=
 =?utf-8?B?aWUzMXAxVXZtRlhFOGx1U2thdkxPQk5saUdFR2hVbXRaWUFYNjQrVjl3amxV?=
 =?utf-8?B?dzdPbGRrNHoyRkhjYWp3WHZtTVBoSGp0R0NBYi9vWUNvYzJmZG1qUFRzbXpk?=
 =?utf-8?B?WWlKOW4rUk1LcmdmQWszclBmVUpLNVdDckllNitCVG5JdklGTFZRR3JyaVJR?=
 =?utf-8?B?Zm15TlE1Qnp3SjJVK3FHNnpCYkRPUWNJSGFqS2EzU3ZDa1hjRjh0WGpqcVVh?=
 =?utf-8?B?UkVSb2Uvb2VrQURQSXFXbW4wUU5XU01lb2VMVFJkZ0FUdTZWY01LeTBpUjhH?=
 =?utf-8?B?U3U5VzYwdTMxcUhIY2tlYlFzMEVnWG5QTjAwbFEwM0xoNEJnR2JlNFYzUUl6?=
 =?utf-8?B?eHlFekpyZThBOW50c2xCRVJSeWxLOW1vUElmRkZibDhlRllKa2tKV2R6V1Jo?=
 =?utf-8?B?YlA2N1hYWElSUm95WHNEdWE5UXhDZG1JeW1EYkZ0S1Y2aVhZUFRwSTZIdStu?=
 =?utf-8?B?WjZVaWZTMDFocGxJaWNLRHFtTXpZcXY4Z09Xb1huQUdvajdSa1NsKzBERmlx?=
 =?utf-8?B?R1laRm45WnhRdmE2VkZPeUF2Tm9Rbk5SSUtsTlc1N2FCZmRqMEoyU2R6b1lp?=
 =?utf-8?Q?Td/Y53YN8wzI/WwLl9O0mMPfy6oHgSd/5C5ECp41Zl6H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88A0B53C03C6D4469FA773CA48346295@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6953341b-3f34-454f-544b-08da92c202a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2022 00:18:39.1618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWdKR7JIrlfskSwgR2GrOGIg+BUzXUQE6gAA8YeX77n4yHtBnawWNAAwp8RLBi0Pv/ImXhyRHpHV+OYkJGM7FXSIPwie5CSf6E4QVTtFkClHYzTsOde9G2UFXG/Pu5wO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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
Cc: "Ye, Tony" <tony.ye@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tml0OiB3aXNoIHNvbWUgb2YgdGhvc2UgbWFjcm8gcGFyYW0gbmFtZXMgd2VyZSBtb3JlIGRlc2Ny
aXB0aXZlLCBleGFtcGxlIDogZndfZGVmIC0+IGZ3X25hbWVyIG9yIHByZWZpeCAtPiBnZW4NCkJ1
dCB0aGF0J3MgaXJyZWxldmFudCBoZXJlLCBzbw0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4g
PGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCg0KT24gVGh1LCAyMDIyLTA5
LTA4IGF0IDE3OjE2IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4gVGhl
IGZ3IG5hbWUgaXMgZGlmZmVyZW50IGFuZCB3ZSBuZWVkIHRvIHJlY29yZCB0aGUgZmFjdCB0aGF0
IHRoZSBibG9iIGlzDQo+IGdzYy1sb2FkZWQsIHNvIGFkZCBhIG5ldyBtYWNybyB0byBoZWxwLg0K
PiANCj4gTm90ZTogQS1zdGVwIERHMiBHMTAgZG9lcyBub3Qgc3VwcG9ydCBIdUMgbG9hZGluZyB2
aWEgR1NDIGFuZCB3b3VsZA0KPiByZXF1aXJlIGEgc2VwYXJhdGUgZmlybXdhcmUgdG8gYmUgbG9h
ZGVkIHRoZSBsZWdhY3kgd2F5LCBidXQgdGhhdCdzDQo+IG5vdCBhIHByb2R1Y3Rpb24gc3RlcHBp
bmcgc28gd2UncmUgbm90IGdvaW5nIHRvIGJvdGhlci4NCj4gDQo+IHYyOiByZWJhc2Ugb24gbmV3
IGZ3IGZldGNoIGxvZ2ljDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1
cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiBDYzogVG9ueSBZZSA8dG9u
eS55ZUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4u
dGVyZXMuYWxleGlzQGludGVsLmNvbT4gI3YxDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfdWNfZncuYyB8IDIzICsrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19mdy5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuYw0KPiBpbmRleCA0NzkyOTYwZDlj
MDQuLjA5ZTA2YWM4YmNmMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
dWMvaW50ZWxfdWNfZncuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF91Y19mdy5jDQo+IEBAIC05MSw3ICs5MSw4IEBAIHZvaWQgaW50ZWxfdWNfZndfY2hhbmdlX3N0
YXR1cyhzdHJ1Y3QgaW50ZWxfdWNfZncgKnVjX2Z3LA0KPiAgCWZ3X2RlZihCUk9YVE9OLCAgICAg
IDAsIGd1Y19tbXAoYnh0LCAgNzAsIDEsIDEpKSBcDQo+ICAJZndfZGVmKFNLWUxBS0UsICAgICAg
MCwgZ3VjX21tcChza2wsICA3MCwgMSwgMSkpDQo+ICANCj4gLSNkZWZpbmUgSU5URUxfSFVDX0ZJ
Uk1XQVJFX0RFRlMoZndfZGVmLCBodWNfcmF3LCBodWNfbW1wKSBcDQo+ICsjZGVmaW5lIElOVEVM
X0hVQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgaHVjX3JhdywgaHVjX21tcCwgaHVjX2dzYykgXA0K
PiArCWZ3X2RlZihERzIsICAgICAgICAgIDAsIGh1Y19nc2MoZGcyKSkgXA0KPiAgCWZ3X2RlZihB
TERFUkxBS0VfUCwgIDAsIGh1Y19tbXAodGdsLCAgNywgOSwgMykpIFwNCj4gIAlmd19kZWYoQUxE
RVJMQUtFX1MsICAwLCBodWNfbW1wKHRnbCwgIDcsIDksIDMpKSBcDQo+ICAJZndfZGVmKERHMSwg
ICAgICAgICAgMCwgaHVjX21tcChkZzEsICA3LCA5LCAzKSkgXA0KPiBAQCAtMTM3LDYgKzEzOCw5
IEBAIHZvaWQgaW50ZWxfdWNfZndfY2hhbmdlX3N0YXR1cyhzdHJ1Y3QgaW50ZWxfdWNfZncgKnVj
X2Z3LA0KPiAgI2RlZmluZSBNQUtFX0hVQ19GV19QQVRIX0JMQU5LKHByZWZpeF8pIFwNCj4gIAlf
X01BS0VfVUNfRldfUEFUSF9CTEFOSyhwcmVmaXhfLCAiX2h1YyIpDQo+ICANCj4gKyNkZWZpbmUg
TUFLRV9IVUNfRldfUEFUSF9HU0MocHJlZml4XykgXA0KPiArCV9fTUFLRV9VQ19GV19QQVRIX0JM
QU5LKHByZWZpeF8sICJfaHVjX2dzYyIpDQo+ICsNCj4gICNkZWZpbmUgTUFLRV9IVUNfRldfUEFU
SF9NTVAocHJlZml4XywgbWFqb3JfLCBtaW5vcl8sIHBhdGNoXykgXA0KPiAgCV9fTUFLRV9VQ19G
V19QQVRIX01NUChwcmVmaXhfLCAiX2h1Y18iLCBtYWpvcl8sIG1pbm9yXywgcGF0Y2hfKQ0KPiAg
DQo+IEBAIC0xNDksNyArMTUzLDcgQEAgdm9pZCBpbnRlbF91Y19md19jaGFuZ2Vfc3RhdHVzKHN0
cnVjdCBpbnRlbF91Y19mdyAqdWNfZncsDQo+ICAJTU9EVUxFX0ZJUk1XQVJFKHVjXyk7DQo+ICAN
Cj4gIElOVEVMX0dVQ19GSVJNV0FSRV9ERUZTKElOVEVMX1VDX01PRFVMRV9GVywgTUFLRV9HVUNf
RldfUEFUSF9NQUpPUiwgTUFLRV9HVUNfRldfUEFUSF9NTVApDQo+IC1JTlRFTF9IVUNfRklSTVdB
UkVfREVGUyhJTlRFTF9VQ19NT0RVTEVfRlcsIE1BS0VfSFVDX0ZXX1BBVEhfQkxBTkssIE1BS0Vf
SFVDX0ZXX1BBVEhfTU1QKQ0KPiArSU5URUxfSFVDX0ZJUk1XQVJFX0RFRlMoSU5URUxfVUNfTU9E
VUxFX0ZXLCBNQUtFX0hVQ19GV19QQVRIX0JMQU5LLCBNQUtFX0hVQ19GV19QQVRIX01NUCwgTUFL
RV9IVUNfRldfUEFUSF9HU0MpDQo+ICANCj4gIC8qDQo+ICAgKiBUaGUgbmV4dCBleHBhbnNpb24g
b2YgdGhlIHRhYmxlIG1hY3JvcyAoaW4gX191Y19md19hdXRvX3NlbGVjdCBiZWxvdykgcHJvdmlk
ZXMNCj4gQEAgLTE2NCw2ICsxNjgsNyBAQCBzdHJ1Y3QgX19wYWNrZWQgdWNfZndfYmxvYiB7DQo+
ICAJdTggbWFqb3I7DQo+ICAJdTggbWlub3I7DQo+ICAJdTggcGF0Y2g7DQo+ICsJYm9vbCBsb2Fk
ZWRfdmlhX2dzYzsNCj4gIH07DQo+ICANCj4gICNkZWZpbmUgVUNfRldfQkxPQl9CQVNFKG1ham9y
XywgbWlub3JfLCBwYXRjaF8sIHBhdGhfKSBcDQo+IEBAIC0xNzIsMTYgKzE3NywxNiBAQCBzdHJ1
Y3QgX19wYWNrZWQgdWNfZndfYmxvYiB7DQo+ICAJLnBhdGNoID0gcGF0Y2hfLCBcDQo+ICAJLnBh
dGggPSBwYXRoXywNCj4gIA0KPiAtI2RlZmluZSBVQ19GV19CTE9CX05FVyhtYWpvcl8sIG1pbm9y
XywgcGF0Y2hfLCBwYXRoXykgXA0KPiArI2RlZmluZSBVQ19GV19CTE9CX05FVyhtYWpvcl8sIG1p
bm9yXywgcGF0Y2hfLCBnc2NfLCBwYXRoXykgXA0KPiAgCXsgVUNfRldfQkxPQl9CQVNFKG1ham9y
XywgbWlub3JfLCBwYXRjaF8sIHBhdGhfKSBcDQo+IC0JICAubGVnYWN5ID0gZmFsc2UgfQ0KPiAr
CSAgLmxlZ2FjeSA9IGZhbHNlLCAubG9hZGVkX3ZpYV9nc2MgPSBnc2NfIH0NCj4gIA0KPiAgI2Rl
ZmluZSBVQ19GV19CTE9CX09MRChtYWpvcl8sIG1pbm9yXywgcGF0Y2hfLCBwYXRoXykgXA0KPiAg
CXsgVUNfRldfQkxPQl9CQVNFKG1ham9yXywgbWlub3JfLCBwYXRjaF8sIHBhdGhfKSBcDQo+ICAJ
ICAubGVnYWN5ID0gdHJ1ZSB9DQo+ICANCj4gICNkZWZpbmUgR1VDX0ZXX0JMT0IocHJlZml4Xywg
bWFqb3JfLCBtaW5vcl8pIFwNCj4gLQlVQ19GV19CTE9CX05FVyhtYWpvcl8sIG1pbm9yXywgMCwg
XA0KPiArCVVDX0ZXX0JMT0JfTkVXKG1ham9yXywgbWlub3JfLCAwLCBmYWxzZSwgXA0KPiAgCQkg
ICAgICAgTUFLRV9HVUNfRldfUEFUSF9NQUpPUihwcmVmaXhfLCBtYWpvcl8sIG1pbm9yXykpDQo+
ICANCj4gICNkZWZpbmUgR1VDX0ZXX0JMT0JfTU1QKHByZWZpeF8sIG1ham9yXywgbWlub3JfLCBw
YXRjaF8pIFwNCj4gQEAgLTE4OSwxMiArMTk0LDE1IEBAIHN0cnVjdCBfX3BhY2tlZCB1Y19md19i
bG9iIHsNCj4gIAkJICAgICAgIE1BS0VfR1VDX0ZXX1BBVEhfTU1QKHByZWZpeF8sIG1ham9yXywg
bWlub3JfLCBwYXRjaF8pKQ0KPiAgDQo+ICAjZGVmaW5lIEhVQ19GV19CTE9CKHByZWZpeF8pIFwN
Cj4gLQlVQ19GV19CTE9CX05FVygwLCAwLCAwLCBNQUtFX0hVQ19GV19QQVRIX0JMQU5LKHByZWZp
eF8pKQ0KPiArCVVDX0ZXX0JMT0JfTkVXKDAsIDAsIDAsIGZhbHNlLCBNQUtFX0hVQ19GV19QQVRI
X0JMQU5LKHByZWZpeF8pKQ0KPiAgDQo+ICAjZGVmaW5lIEhVQ19GV19CTE9CX01NUChwcmVmaXhf
LCBtYWpvcl8sIG1pbm9yXywgcGF0Y2hfKSBcDQo+ICAJVUNfRldfQkxPQl9PTEQobWFqb3JfLCBt
aW5vcl8sIHBhdGNoXywgXA0KPiAgCQkgICAgICAgTUFLRV9IVUNfRldfUEFUSF9NTVAocHJlZml4
XywgbWFqb3JfLCBtaW5vcl8sIHBhdGNoXykpDQo+ICANCj4gKyNkZWZpbmUgSFVDX0ZXX0JMT0Jf
R1NDKHByZWZpeF8pIFwNCj4gKwlVQ19GV19CTE9CX05FVygwLCAwLCAwLCB0cnVlLCBNQUtFX0hV
Q19GV19QQVRIX0dTQyhwcmVmaXhfKSkNCj4gKw0KPiAgc3RydWN0IF9fcGFja2VkIHVjX2Z3X3Bs
YXRmb3JtX3JlcXVpcmVtZW50IHsNCj4gIAllbnVtIGludGVsX3BsYXRmb3JtIHA7DQo+ICAJdTgg
cmV2OyAvKiBmaXJzdCBwbGF0Zm9ybSByZXYgdXNpbmcgdGhpcyBGVyAqLw0KPiBAQCAtMjIwLDcg
KzIyOCw3IEBAIF9fdWNfZndfYXV0b19zZWxlY3Qoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5
MTUsIHN0cnVjdCBpbnRlbF91Y19mdyAqdWNfZncpDQo+ICAJCUlOVEVMX0dVQ19GSVJNV0FSRV9E
RUZTKE1BS0VfRldfTElTVCwgR1VDX0ZXX0JMT0IsIEdVQ19GV19CTE9CX01NUCkNCj4gIAl9Ow0K
PiAgCXN0YXRpYyBjb25zdCBzdHJ1Y3QgdWNfZndfcGxhdGZvcm1fcmVxdWlyZW1lbnQgYmxvYnNf
aHVjW10gPSB7DQo+IC0JCUlOVEVMX0hVQ19GSVJNV0FSRV9ERUZTKE1BS0VfRldfTElTVCwgSFVD
X0ZXX0JMT0IsIEhVQ19GV19CTE9CX01NUCkNCj4gKwkJSU5URUxfSFVDX0ZJUk1XQVJFX0RFRlMo
TUFLRV9GV19MSVNULCBIVUNfRldfQkxPQiwgSFVDX0ZXX0JMT0JfTU1QLCBIVUNfRldfQkxPQl9H
U0MpDQo+ICAJfTsNCj4gIAlzdGF0aWMgY29uc3Qgc3RydWN0IGZ3X2Jsb2JzX2J5X3R5cGUgYmxv
YnNfYWxsW0lOVEVMX1VDX0ZXX05VTV9UWVBFU10gPSB7DQo+ICAJCVtJTlRFTF9VQ19GV19UWVBF
X0dVQ10gPSB7IGJsb2JzX2d1YywgQVJSQVlfU0laRShibG9ic19ndWMpIH0sDQo+IEBAIC0yNjYs
NiArMjc0LDcgQEAgX191Y19md19hdXRvX3NlbGVjdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
aTkxNSwgc3RydWN0IGludGVsX3VjX2Z3ICp1Y19mdykNCj4gIAkJdWNfZnctPmZpbGVfd2FudGVk
LnBhdGggPSBibG9iLT5wYXRoOw0KPiAgCQl1Y19mdy0+ZmlsZV93YW50ZWQubWFqb3JfdmVyID0g
YmxvYi0+bWFqb3I7DQo+ICAJCXVjX2Z3LT5maWxlX3dhbnRlZC5taW5vcl92ZXIgPSBibG9iLT5t
aW5vcjsNCj4gKwkJdWNfZnctPmxvYWRlZF92aWFfZ3NjID0gYmxvYi0+bG9hZGVkX3ZpYV9nc2M7
DQo+ICAJCWJyZWFrOw0KPiAgCX0NCj4gIA0KPiAtLSANCj4gMi4zNy4yDQo+IA0KDQo=
