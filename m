Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176E4838FC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 00:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A089DED;
	Mon,  3 Jan 2022 23:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D8F89DCF;
 Mon,  3 Jan 2022 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641251347; x=1672787347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l38ji6oCNtFZkafZlDbo3DRL7QT9UgbdrB7QfscUZwU=;
 b=Tn/RAjf1V0OsXnkQH5qgxq/oNirAnid5xnwKfyrd/CpoJ0iC01+4NNgo
 KYnZjE4a2sUNlKxcAOvH+xNCLz3z+YPbTFJdZ5KU2dBf2lXeAK1HfVKDP
 zWcRFwr0aKdED66a5K9Pdd9eM7y0YishQRqyznEP9Ygqganbdc3cWYTu6
 mOT14sV1EZ26ih7YpiCIF2wOuO+ggM9/fsC1+U4JhbQAwKEwuUPm88Vur
 lN/t/v7WdIIzveWfkj/W2wh2GbRYKxl9FJz3D7DHZxfU0J5gBq0Jgu10O
 nn/Vvi4t8qiqOeAHDHC6fm6FTWkPi2kbOZ+OoTCem0/ze1la1dfN2JFbj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266390393"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="266390393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 15:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="525773531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 03 Jan 2022 15:09:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 15:09:06 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 15:09:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 3 Jan 2022 15:09:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 3 Jan 2022 15:09:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVC3PpsjWLePdcw/+KO7sBDZzbK6AiOAYlbg/W5+u1xPM/6g4FCP/P8QNhSa7c5oGFDX52cAL/YpDbrK5AE6wZvY5Vn58RMnKmznoFWHtfKmyWZGgNayR2HyMqKXTQeSs0957eksCjGj1+eukjQPZXQRcKSQBfV+A6b6EmQNec3+uMlXcPI756OhECTYNixPFwtOZEYq02yDgze5tnZD8hAY762sRCwvHXdFbuNI+9m/bZ5uenPrQIwFCpidVwsY8xWe6LVHlHOx5beS/P2nRrxNDY+qh5DY7U3e14dYyEcilcZZTh/d5LM9RNSjzdHYtjSWeEim90HLJfnGnptzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l38ji6oCNtFZkafZlDbo3DRL7QT9UgbdrB7QfscUZwU=;
 b=LrEpOg/xrkHw/UVbvV5OZy8FZkoH6b/BE+uIkbX9N3GkkPl4OwLpb8ufXET/d/duYTgshCJ+0bAvVur/+UMllqwLIylJ7X9iEW6DBbhqaoalnGNf2j+NORj1/MHe29Q1TIopQKfwcwgxT9MsFfyFn9neiLJOA8oqbvWB+f5nJPy7G18jFN3tc6QunhOSF3l6+T/tTU78RaSYjImMMP5Ek94344eJWYkuTHXMiRVdaZaQhOFH491rJxta2+4b21lti2mHfRyBh+26Tb4zA13JRxCWBDigYK3HyZ6MlJFCZn2IPw2aAew4ZFgEdD4l4xzbNvqn+9dIBTes2rSlxPWfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB1633.namprd11.prod.outlook.com (2603:10b6:405:e::22)
 by BN6PR11MB0068.namprd11.prod.outlook.com (2603:10b6:405:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 23:09:00 +0000
Received: from BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d]) by BN6PR11MB1633.namprd11.prod.outlook.com
 ([fe80::a596:16ca:5cb5:c51d%4]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 23:08:59 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Topic: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Thread-Index: AQHYAJmRthuhDmy2bUeW15AsxzqtF6xRmrIggAALowCAAELn0A==
Date: Mon, 3 Jan 2022 23:08:59 +0000
Message-ID: <BN6PR11MB1633BB7DDA0486B79F6B6C2492499@BN6PR11MB1633.namprd11.prod.outlook.com>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
 <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
In-Reply-To: <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61b0e686-c948-49d0-b472-08d9cf0e06bd
x-ms-traffictypediagnostic: BN6PR11MB0068:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB00689BAF837D8386C07F391192499@BN6PR11MB0068.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 88J0AKR5+b/tC2pD7CdTtfexnD1X0aSJgWRBvQaHnCY9DDmvYFbUHdXi8Qj82Siz+tPVpUh2hVsqSfsVDbA1XNQbp/Xwe6Rf89hSscS1bSaFKnEs5R87LSm1fCy0meYRbVB5ac5m5uqeBsemKraiQ8UqWn8xYoVhiynYm5DoCCrHsnfdewudhBjMnJg0aTWZivvBcFVjuDSRcRgSVGxWq+vmKgUBGnoMctUHc0Wo3npbuYHBeu42VBCZICXttJdHvQbRG+P3BEgZmoJnLqckp05K4dsYjute3lUFkqGmEuF5rD3tCxydr7hQtN3FTNGsAGpbH6DyVzoZKVB+RJiwVN1uNbwNGiVHAM9PzaZOyGm7HBswX/qz7U/bMKn4yyg+CgqVqV5V0Tz1DIgHGodaqF2dGMZfQXAKVM81/0dg7mq9d80UP90joOmpnstY/LyxG1QBG4N8cQF9XrsHB+WKI687XqnTCRdEp1Geo2M3EWsdc1GpLcqc7yL4ZTFW46UElPZLPwi0IMhVIMn1zh46Fzvw5mbJIJNeChCZzSCFNBF4stX4zrR73fxNORkD0Yo/3b1dbbTbS3LDbpLanLBkxqnLwxdUqFcXu8k3dLLCWgFVZmNyiwqzeOTth1EGb+92pEUio2d7FYDAySFcVLKhSg7qtCg2g/mmpa9jqwCIJ3y0Pop9TeWX0fXvTr9yN9UZohl70tptWocNHhSJov6rFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(2906002)(55016003)(53546011)(66446008)(5660300002)(52536014)(71200400001)(33656002)(66556008)(66946007)(66476007)(122000001)(9686003)(86362001)(7696005)(8936002)(38100700002)(38070700005)(76116006)(186003)(508600001)(110136005)(4326008)(83380400001)(8676002)(26005)(316002)(82960400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MldLZTUvb0lDQ1dhUFppeGRNRWtqVFB5dWtHSUhCb0hhTlMvY1c3MWduS290?=
 =?utf-8?B?OTBOMHVVRUJwMndudVJLamdld2dkaW9iWGR6MjA5N2Vsd2tOSmkzVjRKekIw?=
 =?utf-8?B?MFFJeDZ1WGlUQStjOC8yYnp4Sk9mN1daRFp5RTV2bk4wMmE3V3JQQTZ2U1lU?=
 =?utf-8?B?RzFVWXNENlg3bmZVNlRUaEhaQnNrRkMrUURuejlxendpRWNueGFCQXprNE1Z?=
 =?utf-8?B?MHM0S1M3OE9mYzJ2RzdtRXg4OTU4ZkpkNEdxZGZZTlVHQXdVOGt5U2NNLzQ3?=
 =?utf-8?B?ZDlDODhzeHRNdnl1L0lwSXAvdTJEVEt5WXpmZ3NEdHZqT0k1VE5Ub0tqVDJz?=
 =?utf-8?B?K29aQS8wSTdtc2JOcnhHZ1N3VXA3dWtMZmxxcS9CRFFYZzdKRllxc3VxTU1K?=
 =?utf-8?B?bnh5Q0xoQWN6V0ZTZFFmYitrVUUzM2RQbUpZSmlFdUd6L2pUQ2o4VXl4aWU0?=
 =?utf-8?B?YWNDczV4RzJTbUFFbHd2dEpXZitkTEkvQ3lIT2ovd3JZUHk4eFhPR0ZOdEk2?=
 =?utf-8?B?MFBSNWRENjZ6TnZ2ejJ4TEc1TnJNc0ZmekVpaVU5ZEYvTmxjamNJTXJFcjdO?=
 =?utf-8?B?bG52eHdxNENVeTVNS2RHeVBURFZGT1I3czA1WFhvUDFVWXMrdThqRmxWYTRh?=
 =?utf-8?B?c3RkcElHWnNWeTJYcy9FVWlBOFhqalZiRlhvcnhkQmZBbHE3WTJpYkZQV2xZ?=
 =?utf-8?B?NXo3aFJ1TUhuelRORlB3Q0N6ZjZZUWNueWdNN2J5bTRhSTl4WnpBaFptSlAr?=
 =?utf-8?B?czIrcUk0ZGR4SUs5ZjU4VXRuSXcyNTRlMEduVkJSc3lNZDFlQmJCMjBPeHlE?=
 =?utf-8?B?ZGgxZko2aHdQOWlHQ2tmQ2cvdUpJZUtzREdmMGxYTTNSaVA5YUtKdjliRlhZ?=
 =?utf-8?B?VXNQMk5uNEpTR283M2JiRE02YTgzdEpvQ3hKU25sN1lRd05tNWtOMi8vNjlu?=
 =?utf-8?B?WGxSQkRkLzZ5VjM3OFM4UkZkMkp4K2lPWWR5T1lYWHJSaDJxb29CWEZSRWxu?=
 =?utf-8?B?eEtpOTFYTWZqblR3d0toRTNNT2NobXUxenB6cUR4Wkg2Zk5ocUppZENEVGxV?=
 =?utf-8?B?Wkttd0svWDVWc29remdBdzZWSXg2U2szMFJScEE0Z3RTVTEzelNxcmxIT1RL?=
 =?utf-8?B?YUF1L1JhcEpLU01WQUYwa2UxTi83ZGxKTVhHRmZVN2tiZENHNHRLNklKY01N?=
 =?utf-8?B?bzM1RktnSHZNRE5XdUNHMitlOE04RGQ0QUp4aC82aGpONW5tUEUwdUJmYWlQ?=
 =?utf-8?B?SWJsa05paEZLVkFOeExpTHRxS1R4d3k1MVlhYnU5YXd2a1pCMW1oak13WTRl?=
 =?utf-8?B?WDc1RVVMS1Fmdlh0TEJpcVJINHNPRC9Wc0VoS1dZNE8vYTBPZDZqSDlTT0Rq?=
 =?utf-8?B?ZDAxNHljeHJUQXBLNE8xbDllTTRTcFhoandvZDVRci9rd2UzZDdhWm5sdWZt?=
 =?utf-8?B?bzg4R3pHZ05KYUsrNjR3ay9BbElSelRRcm5XTjlzUENhNFZkTGFPelY4WERD?=
 =?utf-8?B?WVBRWS85VFVTaWY1NUxkWFJ6dFBaSFZoOG9nNUh2b291OEpzYzlsRWFBZ1li?=
 =?utf-8?B?REJiR0tVQWVVK1Ixb2JIRnJVYjlBS1pNRkF4WGl6a3JqTkQxQVhhbDdXQlRQ?=
 =?utf-8?B?MDRjU2psbGxKMFNJbG15YWRHTVQwV0MvNFExT0dISTBwS3hkM2hBYms3dmlp?=
 =?utf-8?B?MFkxZ2lVeTJCUGZUTTFiaXRqN3N5OVU0V3BYKzdsYnliTDhkM09EYXoxaldY?=
 =?utf-8?B?T3VpdzkvUWhrNEdpVkR5NnF6U2p5Y2FSQ3FKZExTdFdMTmV4bW9nUkRHUGR2?=
 =?utf-8?B?TDM2Y1E1eERQYnpvRmZkWENBY2JMZmNoUEFmTmtkV2pVT2xYODdwTVpYN3kr?=
 =?utf-8?B?L0x5eWp2VDUzYTlJZ09SenlNaENRbzZUZTBvRlpiRy85bnBBbXpYMWw0Y3Rp?=
 =?utf-8?B?WWhSaVNPcnJnRWltT3l6T0J6R1Y3SkZkbGRNTTVpaTdWSXB3bVZ4TGI5TkNx?=
 =?utf-8?B?SldUeWlLeUwvbGtyUWhoUFVlZUpGdTN4UDZzMXU0RDliWTJldHFNRWs2Z1F1?=
 =?utf-8?B?Qk11bmZiRXMwb0Rab2dqV3l2eTE2SXBseG0zcXVEM2pVd3AzRnk0cVB0SG9Z?=
 =?utf-8?B?TXI4Q0RZdFovKzZEbHNnM1Z0MUUxTmMxUU1GeGtDdllFaWdaN3VyUk9WRVNz?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b0e686-c948-49d0-b472-08d9cf0e06bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2022 23:08:59.8285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jkx/SxCNHHMQQCni3bET/5CzNmk/Gi8+LOZEGcHplRNsbBpc7Dimq4iJxq+8c/nU1+OoR/CZ9SGafr4JRqob5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0068
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNClJlZ2FyZHMsDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IEphbnVhcnkgMywgMjAyMiAxOjU4IFBNDQo+IFRvOiBaZW5nLCBPYWsgPG9hay56ZW5n
QGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjQgMi80XSBkcm0v
aTkxNTogVXNlIHRoZSB2bWEgcmVzb3VyY2UgYXMgYXJndW1lbnQgZm9yIGd0dCBiaW5kaW5nIC8g
dW5iaW5kaW5nDQo+IA0KPiBIaSwgT2FrLg0KPiANCj4gT24gMS8zLzIyIDE5OjE3LCBaZW5nLCBP
YWsgd3JvdGU6DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IE9haw0KPiA+DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGhvbWFzIEhlbGxzdHLDtm0N
Cj4gPj4gU2VudDogSmFudWFyeSAzLCAyMDIyIDc6MDAgQU0NCj4gPj4gVG86IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Pj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNv
bT47IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6
IFtJbnRlbC1nZnhdIFtQQVRDSCB2NCAyLzRdIGRybS9pOTE1OiBVc2UgdGhlIHZtYSByZXNvdXJj
ZSBhcyBhcmd1bWVudCBmb3IgZ3R0IGJpbmRpbmcgLyB1bmJpbmRpbmcNCj4gPj4NCj4gPj4gV2hl
biBpbnRyb2R1Y2luZyBhc3luY2hyb25vdXMgdW5iaW5kaW5nLCB0aGUgdm1hIGl0c2VsZiBtYXkg
bm8gbG9uZ2VyDQo+ID4+IGJlIGFsaXZlIHdoZW4gdGhlIGFjdHVhbCBiaW5kaW5nIG9yIHVuYmlu
ZGluZyB0YWtlcyBwbGFjZS4NCj4gPiBDYW4gd2UgdGFrZSBhbiBleHRyYSByZWZlcmVuY2UgY291
bnRlciBvZiB0aGUgdm1hIHRvIGtlZXAgdGhlIHZtYSBhbGl2ZSwgdW50aWwgdGhlIGFjdHVhbCBi
aW5kaW5nL3VuYmluZGluZyB0YWtlcyBwbGFjZT8NCj4gDQo+IFRoZSBwb2ludCBoZXJlIGlzIHRo
YXQgdGhhdCdzIG5vdCBuZWVkZWQsIGFuZCBzaG91bGQgYmUgYXZvaWRlZC4NCg0KQ2FuIHlvdSBl
eHBsYWluIG1vcmUgd2h5ICJrZWVwaW5nIHZtYSBhbGl2ZSB1bnRpbCB1bmJpbmRpbmcgdGFrZXMg
cGxhY2UiIHNob3VsZCBiZSBhdm9pZGVkPyANCg0KQXMgSSB1bmRlcnN0YW5kIGl0LCB5b3VyIHNl
cmllcyBpbnRyb2R1Y2UgYXN5bmNocm9uaXplZCB1bmJpbmRpbmcuIEJ1dCBzaW5jZSB2bWEgbWln
aHQgYmUgbm8gbG9uZ2VyIGFsaXZlIGF0IHRoZSB0aW1lIG9mIHVuYmluZGluZy4gVG8gb3ZlcmNv
bWUgdGhpcyBkaWZmaWN1bHR5LCB5b3UgaW50cm9kdWNlIGEgdm1hIHJlc291cmNlIHN0cnVjdHVy
ZSBhbmQgeW91IGd1YXJhbnRlZSB2bWEgcmVzb3VyY2UgaXMgYWxpdmUgYXQgYmluZC91bmJpbmQg
dGltZS4gU28geW91IGNhbiB1c2Ugdm1hIHJlc291cmNlIGZvciB0aGUgYmluZC91bmJpbmQgb3Bl
cmF0aW9uLiBNeSBxdWVzdGlvbiBpcywgY2FuIHdlIGFjaGlldmUgdGhlIGFzeW5jaHJvbml6ZWQg
dW5iaW5kaW5nIHN0aWxsIHVzaW5nIHZtYSBzdHJ1Y3R1cmUgYnkga2VlcGluZyB2bWEgc3RydWN0
dXJlIGFsaXZlICggYnkgcmVmIGNvdW50IGl0KS4gVGhpcyB3YXkgdGhlIGNoYW5nZSBzaG91bGQg
YmUgbXVjaCBzbWFsbGVyIChjb21wYXJlZCB0byB0aGlzIHNlcmllcykuIFdoeSBpdCBpcyBoYXJt
ZnVsIHRvIGtlZXAgdGhlIHZtYSBhbGl2ZT8gTWF5YmUgeW91IGhhdmUgb3RoZXIgcmVhc29ucyB0
byBpbnRyb2R1Y2Ugdm1hIHJlc291cmNlIHRoYXQgSSBkb24ndCBzZWUuDQoNClJlZ2FyZHMsDQpP
YWsNCg0KIElmIHRoZQ0KPiB2bWEgaXMgbm8gbG9uZ2VyIGFsaXZlLCB0aGF0IG1lYW5zIG5vYm9k
eSB1c2VzIGl0IGFueW1vcmUsIGJ1dCB0aGUgR1BVDQo+IG1heSBzdGlsbCBoYXZlIHdvcmsgaW4g
dGhlIHBpcGUgdGhhdCByZWZlcmVuY2VzIHRoZSBHUFUgdmlydHVhbCBhZGRyZXNzLg0KPiANCj4g
L1Rob21hcy4NCj4gDQoNCg==
