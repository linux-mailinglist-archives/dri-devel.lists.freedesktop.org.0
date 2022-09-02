Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0C5AACF3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD2F10E7F3;
	Fri,  2 Sep 2022 11:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5410E7F5;
 Fri,  2 Sep 2022 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662116402; x=1693652402;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GV2yynK2QnHZ9op/eX1uB5eVKHSK9KAO+nOgo0ZCPm4=;
 b=fl/NRcMrRfbQMZ/sBAxge+U/dquFfpy4Og1csJQrxKX3YRSmlmaPHaBv
 LsiSObRCJAgPw3wxN9tfkCIctALJIjUl4HtF1YQmvGnpVCEAzvWq14NpJ
 MwojwBZHkj9qRy+7YCH3HhoQM7ngHUbnJxMUABcslZpO5qwb73WQ5MPGN
 rJHCPunnKa8iT4pRgcAYj2s/NvPiXkiAhpbCyiVHpI4Mok1TZs364aZqj
 kFcX8fc3IMtmx/4B5erlWzq9S62NM0dSTq1scw7LJ09RwXxopWny4ReTX
 B5LPNBpx2QpnR825LgJZBmdhbPOwnBKMx4MQHtxZItbPVph/rQAdjhZh0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359914486"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359914486"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="681254078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 04:00:01 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:00:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:00:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 04:00:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 04:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+ECciMOMZ9XRVktGFsS1aBuGNF8jtBbz1gY3CUpNlvLPU6aojkfbgNhDytc1VVLRgAqtikVcGj7N4nJtbBPdnOYFrxjpxmMPNAvAYv5ayBJN+HDDsl9640Q8iuBWDIsHtQaw6j7FT76DYTKrgMKwLl7GO5ORDXw8zVO+3VgWjD3czczrITdwiJKQ191I9MytfN2HQeLgHWuwGn/ZW8sLAg6HLGB/nuawj85mAo9G2gVy8h0GTUjndCOvtRxUagLd8NMLk1bCWttD9q3f8a1hfJn5CmWcBj4LAPKaDSojoVicf8EbteV0olP4gi//bm1cPzYG4GlEPaVXZGAzFLKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV2yynK2QnHZ9op/eX1uB5eVKHSK9KAO+nOgo0ZCPm4=;
 b=GvbBgaHQr9lUgkZN77YG3lQug/st5bLzmuiyqH8cC5GXYeHvbTvQB3U7Ur+OBsEL/Vhojoqb4gSzIvBN1qKdvB0daVm1k7YWRyBRG0ATlacUtRxZNLRj9wXhKNkRPldojZiKoPWvd1huhyGsFU3iyO81DyxQ9rChS5RD17BxMQFcM2P1dvgYMTf6ZhrCaOlZ7WfVZ2nuBVr4W2CI1Oj6W3plcmsTLlVy0EVtH/gPFwYft0JKFVYGDoM+SodWU+FRedqznYFBszXLHITOb7Q4QdovPlAhhto1DmOHdInCAsaV/fWSOulcJbHZbj58RwtZhD5eLnXwFud/HqkGPhYuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB4316.namprd11.prod.outlook.com
 (2603:10b6:5:205::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 10:59:58 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 10:59:58 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 2/4] drm/i915/display: Use original src in
 psr2 sel fetch area calculation
Thread-Topic: [Intel-gfx] [PATCH v2 2/4] drm/i915/display: Use original src in
 psr2 sel fetch area calculation
Thread-Index: AQHYtuPkkrjg7RAWhUWPwpavJ4q6ka3MCFnw
Date: Fri, 2 Sep 2022 10:59:57 +0000
Message-ID: <MWHPR1101MB2157CBD45BA04603CEABC75CEF7A9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <20220823112920.352563-3-jouni.hogander@intel.com>
In-Reply-To: <20220823112920.352563-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 870be4f2-8ef4-4ef1-45ac-08da8cd24686
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QiRflQ1kLxaeKQDYXIXx66p35aTBYw+Lit6YpG25sPYlO7+ArFhU20523Lj3bsFlm0/uhIU7aJMnCb077ZXrP1up2B4v/LisMdja4arluQxIWPDhnoWe0Bg2vRq6aZddefz04CAVgD5z0w1kRvFUWs2hjktKCHdSFgmqYeAHjiJneFLMzFRXvBjxDwfbJp4ZuuvmHjKcQcl4RFGbA+Nrn6laydMcfvtfwdQT37kjIqC3lxs5qNcD0vNkRakCzjqmUufLuu26VcWhBwBNMG26xn+ofVfbJHbqvgmACOSWgro93VMNmcU0fZ5BaNCP+yahIBWVJPcG6Zh8+GV1PmXYwWxaFerQ8HTUAuzrY8k+ZT1zCsGv9goaY08QShszzsWneg6i5xAUsPycbXBYlhiO46sVlFSX5Bl/uNRDGh4tfrrAMU16f55yss6mNDx5a+HtD/bwvaSeHsKN1MClTbUKePnbG+d6fHWjNDpasci+7H5qcVvM83Re1VyrhLlPtxxRmu6K6ptEYD9EC+fcCLtDJwl2PesPD43C2sMQXCquv2Q8XOzyhMD7EkUXsKfpn4YP0EpbbIDga7oNH5PdMokeX/y+e5njDIP5HPZnq9BjSmN5MQi94jujSrnnpl6kjJcySeT2Z4Dv3R4ON+Qqoj/2nrACD0Uu4YT2HN5/Twez39MZdgi2niq0yP9xAwiMMYhSroSwwMnI00ymaZaQBRHexXGRyiSRHDuHuiAYe++jezz/TylZtEI3JnKzNonufwXmaBX9Cy5rx3UqCZ9KlqQWrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(396003)(346002)(366004)(33656002)(2906002)(86362001)(66446008)(66556008)(66476007)(66946007)(450100002)(64756008)(76116006)(82960400001)(110136005)(38070700005)(8676002)(316002)(7696005)(186003)(83380400001)(53546011)(5660300002)(6506007)(9686003)(478600001)(52536014)(122000001)(71200400001)(38100700002)(8936002)(26005)(41300700001)(55016003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjRpZ1JmNVNlVVNaNmZZeWd3U3BqWnNKeHRnUnUzWnpUYXRGRk5pOE5hTGVh?=
 =?utf-8?B?bG9kdS8rYll5RFVOR0NpNGZ6eWFBU0pwdjFLbTB6b2IvKzFPRmFTSS84YnU0?=
 =?utf-8?B?OHR1L1QzMWw0KzJrQjZPNE1rd0tmWU9aUXlxVWREUXJRVFlwTmN4dUZnUGdJ?=
 =?utf-8?B?QVhQaFBHdlZKeFNjNW1rSExGU05YeW8ydytqb28zTlNURXBGZGEycmF6cmNV?=
 =?utf-8?B?bVNPN0craGNqSTVTQ0hvMktCT09BdjQ1S2lTL0h1WU9FZHVLUnoxbEhUVVl4?=
 =?utf-8?B?eGFkVXh1aUVHNTgyTlNXNENFRS9BbDloMC9zdU5vK3NqRWl6cFY0M0llS29q?=
 =?utf-8?B?S3UxSHhtaklxWkw3bFdYQzBvYVN5U01jR2JhRE92Z0MrUmlYZTdMdnFnMjRJ?=
 =?utf-8?B?OHFENUY5Q2hEWnRrK2RjQWpBVnN1OWQ1bEdYRm93Y0dmR3hCVTNteVhyTlhG?=
 =?utf-8?B?Z1JZUjdjcDk5VUg5dzRKWHdna0JSbnlvcnRubHBUdkk2WEgxYi9NcWhRdHhq?=
 =?utf-8?B?c0Naak9QdmdpUHRMZ1JSV2QrMjZ2VlIwRlp6Y2RJYXVQL2ZONmRGMFpzckd6?=
 =?utf-8?B?MUtDR0RmTDhMSjN6MFd3S1VPMWJqcEZtd25WS2hxcFlvSmsvK2FVN0JtS0dW?=
 =?utf-8?B?YVVqVHMrYXc5QU5mcUZzOEQ4Q0VMS2lFTUVaUHpiTUNYZFhRYSswRnBzL1Zm?=
 =?utf-8?B?ODA1UU1CMjNVd2lhUEhodmhGTVB5bzQzSEVnTGJkSUw3SVczeUtWcENBenFj?=
 =?utf-8?B?QjU2dWpSNU1FOU13bEM2TjAzb3dFSFE2ZS9RbjFYMU02VmRsZlkvM3NISXBD?=
 =?utf-8?B?Tk1qQlgvME5rSG1Jd1RmMFdFQ3ZNUGlmWHBaZ1U2UDVOU2UvYTFGbEFUUGhj?=
 =?utf-8?B?YkFyRXlkTEJwc2ovSElraWNCclFIVGJ3VTFYSDFlUlZudUhmYml6T3dJeERU?=
 =?utf-8?B?bDRZODhrRFN2TWVwWjRqaDBZN3UyY0ZzUnpqcVp6OWxSVnB4TmlkaXRweGlO?=
 =?utf-8?B?NnJPckNxVTdYZ01CRHhjZXpKOVplekgxTU9reGlEWHpUanoxcXJUY1Vsby9J?=
 =?utf-8?B?bGlwTWNzSERLeTV0OW5VWWVRdVlCcjJpQjR0ZU9NZFd0bXJocGs3cXdhU3kw?=
 =?utf-8?B?aEE1cWVSYk1Rd0luVkVJdmsyMnM4eXBETHJIOGVPMmFhT0o5MTRQdzMyTUN4?=
 =?utf-8?B?UGl1OHJXSlRENlQ5TWpoMDhjVzdMbG16M0VSV3BrTWYvb3pURVZUL0tRaHMr?=
 =?utf-8?B?ZnBSaTRlTG9oWnFWUkxFSytxaWRxRWp2eS93OFFZbE40c0xoaFFrc2RwMXZB?=
 =?utf-8?B?VzJ5SHdDdUZSclErTStBNTFvalRJby85Mm9ObFN3cHJUNHAyQkgvL1VrZW9K?=
 =?utf-8?B?eDBDZHZId0JFc204NzJQaitJL242WXZmQm5Fc2VqYm5PaUViWUJsVTFubmlB?=
 =?utf-8?B?ZjhxSXUxNkUxVXdwQ3I0eUdxOGhVbWMydmRweXlIQUFWQTdhQmY1Y2dQanox?=
 =?utf-8?B?SFY4ZUM0SHlNUktVQlE5S3h2OFRpNHdRWVUvYmJkNTY1ZU9qZkdwbWhkeGpl?=
 =?utf-8?B?eDAyMVh3cnA2NXFyaGNsd1BXK1NrcVJSaE43bnRKSUtXbUtnQzg3ZUtlZ2pB?=
 =?utf-8?B?YlNjVmRYTGJNT1BuczU2aE9LOVdSU21QNVlFeFJ2bllSdy8vc1dKSkUraTZC?=
 =?utf-8?B?d2tqdE9ZakhzMEoxNmgvOS9RdVZIblhuRmVKS3hVZ3FjLzFCRVJTdHdZVlNC?=
 =?utf-8?B?KzdlUE16ODM4a0I4Q0ljWG9DVXRHSEVKUjN0bUVNTW51akxETWRIMnhnRmdC?=
 =?utf-8?B?Tll6V3dLSFRzdStlS1NITWxvOS9xRG9VUEFhN0c0UUNMdDlRQVgrdldGQWJH?=
 =?utf-8?B?QkpzSjV5bDg5ZGdrU0RCNU1mY2t4andSWE1xWkM5TkRINm5xUzVmVWx2VUVn?=
 =?utf-8?B?Y216d21MZGk1ZkR2Q3dWTDZpaktGT0s1andsTVZVOUJ1WnJPbENETXZoK0ZR?=
 =?utf-8?B?V1VBR3IvWGRoa3hzSHkvd0tMU3RKK1hETCtNeFdvUmE4eTByRXFuTlFYdTNy?=
 =?utf-8?B?TkMvb0htZ2dhaDRBbG95eVZyNk5iM0s1Ry9oMUVGb2ZnUk13UndMaWpSNjZy?=
 =?utf-8?Q?iK/gfFwJodfmU4GSK4np2usjl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870be4f2-8ef4-4ef1-45ac-08da8cd24686
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 10:59:58.0103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3P/17dfzXv/YtTu51wY1PJc5Hi7SRmr4ObGsO5ydpncj1EDefgmvFuZ3UcF4EVB/HHTxAsvhXTK46bJLs7pBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4316
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pDQo+IEjD
tmdhbmRlcg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjMsIDIwMjIgMjoyOSBQTQ0KPiBUbzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgMi80XSBkcm0vaTkxNS9k
aXNwbGF5OiBVc2Ugb3JpZ2luYWwgc3JjIGluIHBzcjIgc2VsDQo+IGZldGNoIGFyZWEgY2FsY3Vs
YXRpb24NCj4gDQo+IGRybV9wbGFuZV9zdGF0ZS0+c3JjIGlzIG1vZGlmaWVkIHdoZW4gb2Zmc2V0
IGlzIGNhbGN1bGF0ZWQ6DQo+IA0KPiBiZWZvcmUgY2FsY3VsYXRpb246DQo+IHNyYy54MSA9IDgx
OTIsIHNyYy55MSA9IDgxOTINCj4gDQo+IGFmdGVyIGNhbGN1bGF0aW9uIChwaXRjaCA9IDY1NTM2
LCBjcHAgPSA0LCBhbGlnbm1lbnQgPSAyNjIxNDQpDQo+IHNyYy54MSA9IDgxOTIsIHNyYy55MSA9
IDAsIG9mZnNldCA9IDB4MjAwMDAwMDANCj4gDQo+IERhbWFnZSBjbGlwcyBhcmUgcmVsYXRpdmUg
dG8gb3JpZ2luYWwgY29vZHJkaW5hdGVzIHByb3ZpZGVkIGJ5IHVzZXItc3BhY2UuIFRvDQo+IGNv
bXBhcmUgdGhlc2UgYWdhaW5zdCBzcmMgY29vcmRpbmF0ZXMgd2UgbmVlZCB0byB1c2Ugb3JpZ2lu
YWwgY29vcmRpbmF0ZXMgYXMNCj4gcHJvdmlkZWQgYnkgdXNlci1zcGFjZS4gVGhlc2UgY2FuIGJl
IG9idGFpbmVkIGJ5IHVzaW5nIGRybV9wbGFuZV9zdGF0ZV9zcmMuDQo+IA0KDQpSZXZpZXdlZC1i
eTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgMyArKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCA5OGMzYzgwMTVhNWMu
LjE2OTg1ZGUyNDAxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Bzci5jDQo+IEBAIC0xNzY3LDcgKzE3NjcsOCBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hf
dXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJY29udGlu
dWU7DQo+ICAJCX0NCj4gDQo+IC0JCWRybV9yZWN0X2ZwX3RvX2ludCgmc3JjLCAmbmV3X3BsYW5l
X3N0YXRlLT51YXBpLnNyYyk7DQo+ICsJCXNyYyA9IGRybV9wbGFuZV9zdGF0ZV9zcmMoJm5ld19w
bGFuZV9zdGF0ZS0+dWFwaSk7DQo+ICsJCWRybV9yZWN0X2ZwX3RvX2ludCgmc3JjLCAmc3JjKTsN
Cj4gDQo+ICAJCWRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQoJml0ZXIsDQo+ICAJ
CQkJCQkgICAmb2xkX3BsYW5lX3N0YXRlLT51YXBpLA0KPiAtLQ0KPiAyLjM0LjENCg0K
