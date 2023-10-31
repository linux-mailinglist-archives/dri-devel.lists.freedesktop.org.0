Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752677DC5AC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 06:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9801910E0E6;
	Tue, 31 Oct 2023 05:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28E210E0E6;
 Tue, 31 Oct 2023 05:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698728937; x=1730264937;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=i0oNOc2wqj+f0v4psVgaiNYXScr5zCrIjBUqogIH3Bs=;
 b=iVwEM884hV7LENNI6Lysiy4F5Q2mmi71BNLn7j3qpWxYTTZppmTeVX5s
 /i0O4rpOyD/ljqd2aY3FUsWfrbQRr8T2G+6sFwPLpL38TOTAm0rCVIXh+
 qM8Zyvmas1XDPopgLoKEc/aEpnQWXc2TAIlIWJq80BUySEu8Wy6+Y/MzN
 7NVav99STYf8Y9cURwZI2NwzpR1LqoK3sJxPFTaJ6GNpCTJTztloA6QnJ
 BKa2iM/oq15dfUA0WJRDFc1T/5OoFRoRv8njd8R5quIFEqDWIva5RAydt
 rUabtvXkI9HHCyLXpE6ioWhT1P+iZXR9NQIMTJIuo6ZNEhIk0cRC84pkJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368425389"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="368425389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 22:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8590259"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 22:08:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 22:08:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 22:08:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 22:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTRq+bAJ55X+82njb8iYDCW1UYPWIQFUAiRy0lsoyuaRkOXzXqKlYNqxmxroIvklLUljaJuCsCH//nk9itAeil5VIMAfVBR+2TE7AO1biIxEBP9iivuQSIsyWofvxVJ5B9/DqimQluRxnp1mmdbPtlvU9jzd/OzN/KxJf9CD3NuBMIAFTuBQI0YT1MUDKc8b/14s+s7Pg+QfuoEbZWp05lwqQGPx/tdTuiVyNYqpewLkO+GPHW6F2xrn3AL/+oFBk9DFtH+PPqciZ+hXpxAR8MviJiBPYEmf5VpqvyQ5ZUQuJDwqQdHBsEHgS5WOjNmFnIth+U7454HJo6zJMkbvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0oNOc2wqj+f0v4psVgaiNYXScr5zCrIjBUqogIH3Bs=;
 b=je/iXAGj5CB4jQsglWq1fH4Lzk1s2E0aBEGcggLteb6piqMVtaWF2zDIoOjkwQBZxquz67hVymnRjuPELOAEAkAz06q4/C9USzOU9ETnsqucVwAANIUXEDiRjC6bDN1+5Y8VZpsWN1SBuUo6oO0CEja62oXt2nTI6Bx0qPfph8J297a5CPTPglLVpN3tRGGyTWtaDHZwPxs2rIs0bxNlU2DC9LoJyygDumKri/hrj4AXTcevcK5foSqhRtvN0whX2Wi8vAGRLRAga9ipqgl+Gk3TsPDYwKpgf3oIOYQr+w4wQeEy0TUlLS3qtCRACPyQWGf9tFele1naN8tDv31bgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 05:08:49 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::9bdd:1d20:1b4e:3e92%7]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 05:08:49 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "mario.limonciello@amd.com" <mario.limonciello@amd.com>
Subject: Build broken in drm-tip
Thread-Topic: Build broken in drm-tip
Thread-Index: AdoLt162ne2GlDzsQMCYNHkLIkPwDw==
Date: Tue, 31 Oct 2023 05:08:49 +0000
Message-ID: <SJ1PR11MB61297BF7764AF1207571A872B9A0A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA0PR11MB4719:EE_
x-ms-office365-filtering-correlation-id: 1bfc79ed-9208-4296-fb86-08dbd9cf77ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sEovpuzVWuZwG9CgLiFgOaRgDMMKYQgcJETY3P5e86jbfrcDCeAy73q6kJh5WPhDLAxVqIPJxO1gxOsCYfUxahEqVzuKtNLacbhBt/Ifaf8dD9VFun+2mSB8a/3bbts4pN56JyFCThKUt6IRXoyFAdysHsPhkYoM6az5UaBAScVlZtA8035m1irPSjsAOH52s3QlHFosJ+tQfDsBqzKdSCE43Dp/cgcBhV5fOtBzUGbdNWSD45QNllo3CUpEzZOy9tA1xGLr7kY4b7TW4HZsdiR/yRs/l4hasvVaAq1sIi5MGWb3Mmn/pou4Q9Li8knCmeKUTXwbrxJUfRMMe4OOe+el1+Uc/Zq5U6UJSwJ5UIdMfuChLhuXtBBG466kCUcKBzIrT88bsgk2JnDD2LTE99V19ZIrrW1gpZbzz+j/tJq3PaBYfTfbr0TZ1PJcbnPaFNwj/cd8PcjQFQZ9tHfgaKGqY0FdwoYmu6k08sJOIcRey0fFXRizziqiwwwu2Smep/+BpVoT2hDXpXGSD9Wb+J1FKn6H5GDbekurn1ZWPkr7OmX25oZdk01BoGzov1lZ4PZI7TG6m7vXnQE7XFXIeJCpD6dQj5/MOCysU6GpoJ5a/r7rIq8fbhSdOuPxKRg6cN4gw45QPX8uFaOcdssxXHAMpJndoId9hEvP/etrLV5Mu8l0QFpXzAbKs6Txdb6u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(107886003)(8936002)(4326008)(8676002)(6506007)(9686003)(7696005)(6916009)(66476007)(76116006)(54906003)(316002)(64756008)(66946007)(2906002)(66556008)(33656002)(38070700009)(66446008)(55016003)(52536014)(83380400001)(26005)(5660300002)(38100700002)(86362001)(122000001)(966005)(71200400001)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW9YT3F3M0lKVnFBa2Q4MmJxWHo3cFVVVEFkLzQzeFZNMkg3eXZpUTRpZ1Bz?=
 =?utf-8?B?V3JTYTNPVDhUUER1RkRSUHVYMGx2ZzBRL2lha3pFdUhPa3M3RnRtT05ISTBz?=
 =?utf-8?B?MnMvWGpmdk5yWitPem9KSGFaeE1kZnJPNEpBclJYMllJV1B4QTZrelhUOWFh?=
 =?utf-8?B?eVhLWHI2c1lNQlVXUndUQ0ZtVDY2TUJUSUxIVmRqMEVMQU42eituZmhXZ2Rh?=
 =?utf-8?B?ZXpoQVJ5Y3p5WUlrSlQ2UzdHNkRCRldHakVTaUY2b3g0NjUvZUQvODBtNFBV?=
 =?utf-8?B?WVUvQ1RROFRQUU8xT1Y0V3VuYmxKaGdldlc1eVZlRHFqZGZ5aXZMM0RCbDhY?=
 =?utf-8?B?OVhDc1lEaDVoamxoM21KalNhUWZMa3V6UERId2R1QUl6cEhVbzl4QnMydm1H?=
 =?utf-8?B?RXNlVHBZNDZQcmlPRm5oZjc5NDZrNm13dmNSNjhPMXQ0dlA5MG9JNHNWQ0ox?=
 =?utf-8?B?WlpZSFg3NmhmbnkrUUpoTnh5b0hUOWxsbjNFOWd0NklvUzZwNUltQlBjQytF?=
 =?utf-8?B?aEhkL2Q1K3p0QjFMSllUSWl5b0xSdm0wa1JmM0xHa3ZVeFphL2pCejRZNWlZ?=
 =?utf-8?B?MlVjTTZaTHNGNXFKWURMVXNMbTNVbW1kMHNxaWJKOUxLV0FoZ0ZpYmdTWnEz?=
 =?utf-8?B?YTJURm42WW5ValNlSkcxM2Jlejl4SFUveTFqRDFaSnBCZ0tqQlczdGhndDE0?=
 =?utf-8?B?VlN4K09sYjQrWlBtQUZlSnFxV1dxL1h1cEN1RThEajZQeTZQRm1vNm1yKyt2?=
 =?utf-8?B?Z2pXZE1oalJiWnlvQ0lDRkpFcTNvenp0b0JQOUJUbkpyRG4yRm1JalJsUEZX?=
 =?utf-8?B?WkpyTWc2MlZTR2dHSnQ2UVVMY2REVFlrYWxtL3N5WTQvdkk0RVhkNTc2ME4v?=
 =?utf-8?B?ckRtWFI3MWFLMWRwNGNyWG9JQU1WQ2xJMDB4MU5ZODZsOWN3RklWZHlrMnNv?=
 =?utf-8?B?WjlYbkUyUXNTR0I1T3ZvaGI1WXRqZnozbnV6TDhUaE0zOUJQMG52YTdZYXJU?=
 =?utf-8?B?eGtJcUIwVml0WFM3VGVpZU9tQjRlS0ZLSXo1NEFjYng4dXN0eHI3LzhBMEEx?=
 =?utf-8?B?UVNGR2s2cWFvWWRqUXBDOGNQckNyakRJaUt3SFV5alVsWjJxd3ZKK2gzQU96?=
 =?utf-8?B?Slo2czM2cEp0ZWkzMVZlWEM4UERvUCtPdkVsTFJscmpyNE10VUh0UzQzSFN3?=
 =?utf-8?B?cWx0NHhNdGpwdFg5cGcwMXN4dnlQZC9KRWV4RFE2Qy9SazVEUnNRMTZONDVw?=
 =?utf-8?B?VU9Ba2JrQ2hYUE9PcjV0OFNEZHZzalZyTlBYTzFla2Z4Q21hbng1N0Era2Qx?=
 =?utf-8?B?LzlPZGdSK1VpLzR3cWdyRnZGaU5sUzNFV0hOM1g0cmNyaGVyNkdYZi93dFR4?=
 =?utf-8?B?RjY0QXpIR29jZjZNMEhudFBLZmVlOWxiM2xWb0ZxMldiUnJEc3JaYnBYMHN2?=
 =?utf-8?B?QWNtTmdtVWcvelVzWStpTTlPRFc2LzB4Ni90SVk2NEVuZ0ZaTzBvQjFBcEVa?=
 =?utf-8?B?cjRrZkFlR1VjeXdCRzhkZWV0Y2VOUlZWNFRYeXdIWGI0MlBKa1E4NnR3QXpG?=
 =?utf-8?B?bVhpNkNxQjU1ZEJZWDZ5ck03VlFUc01iY24wdjR0OC96V3FHZW80S1V0L3FK?=
 =?utf-8?B?Mk11amZYV0ROK0wrSkFYZ2xWTFdDMWViVmJnNU94RDV2YThJVmZEZDFtazdY?=
 =?utf-8?B?SmorUnppbEJORjZNQUxNd0Y4V0hpR3pEVjBWMFlsakNobHZVcGtZTTMwVnFI?=
 =?utf-8?B?WkVJbkNRQ1ZIY1Y5dStvcmhrb05seGxEaGdvNHF0SHRMRmJnaXIySSt2UGQw?=
 =?utf-8?B?L2xmaDNNUEgvaG4vNHZLOUNDQjhybVZaSS84L2tHcmlJcklFbFhheTJNRU9H?=
 =?utf-8?B?WkhObXFOdnJSNVliYmhFbnZUZmpERGhQdlp5SElnRHNTM1MxOFdWZ0gvQ0hO?=
 =?utf-8?B?R1JyVUFNOWJYMjZ5V2U3cWhRcTZCMFRrbEZkenF1MGV5MFVuZkFxcjFHZ3Jz?=
 =?utf-8?B?SjZSVUhheGZFcFNRdDI4ZVZtb0dHbHJ6ZXhNczM5NEVSVzdLek8wSWdlVEJh?=
 =?utf-8?B?bFpPV0lkZVZ1elhuRGxuVGxuNHpvM3hoRnVFdFhIbTBNNEpCcDZ4ak5NVGZY?=
 =?utf-8?B?NFQ5OXJFMHA3cGUycjIwNWdkbHJqYzJyR1R1RlA2UCtsZXN3VStPYk8vbkxt?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfc79ed-9208-4296-fb86-08dbd9cf77ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 05:08:49.2877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNqrLHu9ahwh0vLo/W8E3xqk/qmFuR2AkAwtplnat9nwGgeFNQwHTm97EGnq6143ce792JgA5UWwnJZpj4pqZWisra+jSJaZmhzI0tbaKrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
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
 "Saarinen, Jani" <jani.saarinen@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gTWFyaW8sDQoNClRoaXMgaXMgQ2hhaXRhbnlhIGZyb20gdGhlIExpbnV4IGdyYXBoaWNz
IHRlYW0gaW4gSW50ZWwuDQoNCldlIGFyZSBzZWVpbmcgYSBidWlsZCBpc3N1ZSBpbiBkcm0tdGlw
WzFdDQoNCmBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGAN
CiAgQ0FMTCAgICBzY3JpcHRzL2NoZWNrc3lzY2FsbHMuc2gNCiAgREVTQ0VORCBvYmp0b29sDQog
IElOU1RBTEwgbGlic3ViY21kX2hlYWRlcnMNCiAgQ0MgW01dICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92aS5vDQpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jOiBJbiBmdW5jdGlv
biDDouKCrMucdmlfcHJvZ3JhbV9hc3Btw6LigqzihKI6DQpkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92aS5jOjExMjc6NDc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biDDouKCrMucYW1kZ3B1X2RldmljZV9wY2llX2R5bmFtaWNfc3dpdGNoaW5nX3N1cHBvcnRlZMOi
4oKs4oSiIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KIDExMjcgfCAg
aWYgKCFhbWRncHVfZGV2aWNlX3Nob3VsZF91c2VfYXNwbShhZGV2KSB8fCAhYW1kZ3B1X2Rldmlj
ZV9wY2llX2R5bmFtaWNfc3dpdGNoaW5nX3N1cHBvcnRlZCgpKQ0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0
ZWQgYXMgZXJyb3JzDQptYWtlWzZdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQzOiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5vXSBFcnJvciAxDQptYWtlWzVdOiAqKiogW3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDgwOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdV0gRXJy
b3IgMg0KbWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4MDogZHJpdmVycy9n
cHUvZHJtXSBFcnJvciAyDQptYWtlWzNdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDgw
OiBkcml2ZXJzL2dwdV0gRXJyb3IgMg0KbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjQ4MDogZHJpdmVyc10gRXJyb3IgMg0KbWFrZVsxXTogKioqIFsvaG9tZS9rYnVpbGQyL2tl
cm5lbC9NYWtlZmlsZToxOTEzOiAuXSBFcnJvciAyDQptYWtlOiAqKiogW01ha2VmaWxlOjIzNDog
X19zdWItbWFrZV0gRXJyb3IgMg0KYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYA0KDQpJdCBzZWVtcyB0byBiZSBjYXVzZWQgYnkgdGhlIGZvbGxvd2luZyBj
b21taXQgWzJdDQoNCuKAnGRybS9hbWQ6IEV4cGxpY2l0bHkgZGlzYWJsZSBBU1BNIHdoZW4gZHlu
YW1pYyBzd2l0Y2hpbmcgZGlzYWJsZWTigJ0NCg0KQ291bGQgeW91IHBsZWFzZSBjaGVjayBhbmQg
cHJvdmlkZSBhIGZpeCBpZiBuZWNlc3Nhcnk/DQoNClsxXSBodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL2RybS10aXAvdHJlZS8NClsyXSBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS10aXAvY29tbWl0Lz9pZD0yNzU3YTg0OGNiMGYxDQoNCg==
