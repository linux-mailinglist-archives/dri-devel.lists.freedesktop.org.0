Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C45473308E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B5610E5FF;
	Fri, 16 Jun 2023 11:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920610E5F8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 11:58:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35GB8W4b001743; Fri, 16 Jun 2023 12:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=PFKCsyRhYlFncGXPI+F4VHTYGwh/JJAg/k5A9xdz7ic=; b=
 uKiob4hJYOMaOrVUhVXcFLafpb/0W04nGZJTmjfDkyxHuzNGLYnyjQVJzTnVgwin
 0uQjESlwghfpfIWz1azs0VqpPGdHU2kOvr+SBsFXxqZvJ0wTMPMjEmA3RYq/RmVd
 JwWQJxGbWRPaRRpT/KkIiizXEOkukk1ALed6Sw9TWXCGy9bAKDen7SK2EjY5RB1q
 M8FA2WOdkk3hY61FGTUS3XUuHFfGnzu0TpO2BY0/+tTdHy+UZdINgmulNdfTcZxJ
 g1X6448NeJ1QoLdno68Ss0X8GxmW5WOyUnv8XCgzt8+tLalYC+QO/EK5zrExuBmO
 7R+MJi6Q4nrkKsUDovs0cw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3r4fermr3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Jun 2023 12:23:29 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 12:23:28 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.52) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Fri, 16 Jun 2023 12:23:28 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGbDoyLtxlzwRLe8r9Tq5tZ8pjpJZSEZL77MLyULYJe6ey0kyZLcSF6hZe6TNC4PljlJq/dsvxGCPejsf6iZzNhkqYsiwhAQHBRlHJakZ7otQq/ViWTkg9p/KpwXf2/eGkuxPMj/eRhQd1y0JggzVGEFHQlBPZ1rIT9EMvod6VjkgzNOF3TVkKy5kZXFs7Kbl1HdtolzLPK0jxyjt+r6uMqdNUGaqBQolNnBm9O6LKjgshngK2iI/RFPxTYi3XP6qQRLY6j0b4ewB1LtwpbKSEXRQKasnThPLG9/W2+dR+/Nb7B123Dbh8SMllfG5aQHbJiFUv5r5VlXA4Zs4Uh+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFKCsyRhYlFncGXPI+F4VHTYGwh/JJAg/k5A9xdz7ic=;
 b=OprPuq/AmGeehFQcoGYdtedEeefMZPjvxBWx/kE+tddwZ9mAOQjaHPUypo+pnhe/hFoDhEFX+8KaQpRz+p33R/Aqf3+HKYvA+3uWx8Ghcg1QBNPfOvFjdZ7FOQ8025jRhtuP7OcZVHUgQY4jA9U5zgxd2VL2GLPh8eh/e2GkXiCEnqch7bNm8ksp2nmIhqLH9KfROB2Y87WrneHv9WxatGAGtp/qmwEKFZn0IAA/gjBJRQ6nmS+BpMZMiSfyW3aSvcF0YYNo+LMMsdPcMQ2MCmSeUy5dGLegTGyAcHZRkPwiAmB5D0chfBvdF7eU0Aj8Jgfzn2a8rfzeCtl142UpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFKCsyRhYlFncGXPI+F4VHTYGwh/JJAg/k5A9xdz7ic=;
 b=FUmQk4FxFpVzjEdSp9Ol72cnWtMtSW0TYJI20wklRTOMSCwuLefV5L0ng3y+yGVAmIp7g4M8KoEpUbAt5wV6SAXAR06MjIUHWsIeO353W3w3qfxEimlW8YyIilqERbyG/+k5TJY6drV2zTJuZLhHnuyOaAv3Fet/6nS+ouMalVE=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB1989.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.12; Fri, 16 Jun
 2023 11:23:26 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f976:8df8:e81:d5f4%3]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 11:23:25 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZngYUJoX1+qc/Fkehz30lNP0fw6+I/5SAgAROIIA=
Date: Fri, 16 Jun 2023 11:23:25 +0000
Message-ID: <ad9f5aab4bfd49dbda923dc716dc29dbe719ac4f.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <3f4dd2ca-cf7a-0d1d-e528-097e032c5899@ti.com>
In-Reply-To: <3f4dd2ca-cf7a-0d1d-e528-097e032c5899@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB1989:EE_
x-ms-office365-filtering-correlation-id: cd105ca3-84bd-4d5e-4076-08db6e5c19cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eLPrbMhcjwH9LyYW7r6D2kULmc+8vGyPxLGMRG8/hTf27AEh4OKsSnUNschJmQO+BqjgKCTacty1IzOoLRS5dky+22dlqZ/IIwXMXxhFIHrfc0CUA3A0RbdSWGgzITRhU8bwQnnFP6uHl2QHwRif7Pp/Uk/NpjxZQMp1mbs3FiJkYVWfGoA8GkytSDFQEfNiD2Cn2OjX3O/WZlcU5TdGkWvpq9UxBxReZxBVQ5ulBsTuAv0OjZFAekErN+PbZWWtxP4TZ9QwXJHLEFaBVKBVMuRMQEEeU5GUpS1C09Foo2gBRTwcVntK0t5Jwq5yB+ca0Z78SpMwE2joZ/v/efyhY//kPKQ9ENRegPZB87I+f1kAwqmvTaYFtgIyCCmSOiaBKu99nJ5cjmu2PIx8BDFfzpkhZW6t1YMnedhjZjtpTnwmeSH2IrLkURX29GutpJqAgXWJtUxhZfYdFLjvJy9sWsv21t4oeBWYfniu/VFRtWllF4Wgmf1hpFwUwp+GI5Z1XqDhR2hJ8prTE0nQ9+RX/jCNtg2/5aTslKEvD6EGLYwdU0uk9Au4X3qj6ZI1+oqaIBLrvvqWGnYhoC6ET7Peq+uZHo9JKbdZuLEiP2TH57E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199021)(71200400001)(966005)(6486002)(478600001)(186003)(36756003)(83380400001)(6512007)(38100700002)(38070700005)(53546011)(86362001)(6506007)(2616005)(26005)(122000001)(66476007)(66556008)(66446008)(66946007)(64756008)(6636002)(4326008)(76116006)(316002)(8936002)(8676002)(5660300002)(41300700001)(2906002)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlptWVc4eDFqMXlCNnE4bGtKbDZTK2NIVTZ6eVVrODBnVzIzVWFXdkRGYW1T?=
 =?utf-8?B?aU5TSDN6OHlncjdsekFwZjhHbkcyOFgxMDRBekZha055SFFHbk9iTlpjNEtT?=
 =?utf-8?B?dWprVU4wejQ5UkpKZ3E2TXJ1WTJEZERkQVBtVjdQK2YrRGdmSlhuRFlzd0xs?=
 =?utf-8?B?THFHa1d4eS8rd0g1a0JVRjlWK1c1c1lHdGJzejBpUHA1cnVnK1YvRjB6OFAv?=
 =?utf-8?B?a3I3cXJvdWpuRlAwMTh6QnRTOXllRGpCVlFmOUlETitWb1J3ZmZXZ2Q5NkRM?=
 =?utf-8?B?a043OVNuRE1RWExmRVBmYTRMNjVxeGVCb1JiOWVUamhlQXB5OGpiR3UyZFUx?=
 =?utf-8?B?Z1g4bWhNRUxlbi81SWNkRktaVUJreVJ3VE1jYVdsbUs5RnJkTDZCUjB1eVZv?=
 =?utf-8?B?TzBIcTVlaytFRWlxZDRSQ3Flekx5Z0pGbmo1WnJLT3BsQzBzd2lUaXRPREk1?=
 =?utf-8?B?Rjdla2Q1M0JZem8vSlV4aDBVSm1icWNGQzFsUkJuZ0NPSWhqMzFXY0pvajl4?=
 =?utf-8?B?MnpDRDY2Y2t4d0R1b1BPakZJeVBmN0pVcGJsMU5kN3dsaXE0dTRsOUg2bTJW?=
 =?utf-8?B?Q3BnU2FxSG9uL0wvbTlmMmNhcVVnYkhTNHZZbjRBWGlzUy90SVhVN2xjL1N0?=
 =?utf-8?B?RndpN2hrS1E3S2FuaW54NDlNZDV2WDVBNTBGMGgrRjFKeTN2ZWNXQmk3UXNP?=
 =?utf-8?B?a0lrdUZRZkcxcEh2Y05COFcrTy83Qk00anZmTHlNR0N5aE9kUHN2Ry8zbUNJ?=
 =?utf-8?B?dmVMRm5WNDV3ck9qY3dQaGt3a1UrV0xxczRKcWYrS1R1WXVFejAwcjBaR24w?=
 =?utf-8?B?UHJPdGQyeVI4cmxNM28wcEkyWHcvTno1bWdFS3gwMzRzVmRKeHMrUUo4RFpn?=
 =?utf-8?B?WFZJZ2Rpdld0Vm8rNDF3UW9INHFCdXZuc1Y3bDdSYlVrTW9QQ2EwcGI0MW5r?=
 =?utf-8?B?R2VlMnpnaVhHYmZxa3hKaFVlbHdZYmhSNlhxVFVmS3g2a20xOWdHb0dIM2JS?=
 =?utf-8?B?b29NYVlnT1NCY3VaMDBHTHYyRG9ENG8zUnA1RVROOGp6aVdLc0NHWVhYbWNF?=
 =?utf-8?B?V0dNSFlDRGxHQnpUbCs0aGVGR2JFVDExWTRTb3NtM2dFUllnekZxWXR6cFp5?=
 =?utf-8?B?cWFqUnlTOUpHTjFMOUx5TWhHSHFvbzRZQ2M1Q05XVEFrSUlxeStGUklzVXYx?=
 =?utf-8?B?U25nYnZ2NUplVVlFSmM2ei9sc2dzZWhGVGhPeXljRjRLYjdyd012ZjRrcWZG?=
 =?utf-8?B?MzRFODl5WmtlaXJxNTFJRGRLT0IrRnEvc21kQ1U2NXVRRjE0dTUvdUF2ZWtE?=
 =?utf-8?B?YlhEWG1kWTFxODRGMWdGbGpXWWljOWZqS3ZET1lmdWhhTnJ5VFREVkdWWDBB?=
 =?utf-8?B?Si91MlpybmxHUGo2aEhmOTM1U3REMjJIYjZ1YUdkck0zcWZwQWw5K3BOSElZ?=
 =?utf-8?B?V3IwSGZvTk1OckJXWmVpWTFkckxDTWM3aG1YK096VE9TQm82bWRZSUZYK1Fa?=
 =?utf-8?B?OWxjcGNXaUd2cGxLSCtqTjFib3JxbnVrOVNkeXRrcGZ4SUJCc25mb1FMZ1BK?=
 =?utf-8?B?VDM2R3FTdzhSYmhkQkxnZDRrdWJnbVhPb1BrQW5QUDVaL1NXL0gwS2VNYTYz?=
 =?utf-8?B?UmdMRUM2Sm1jcW5ERndqdkxWWTJTaEh6NC80Z0Joa3pSVmVvSDhoYlo2elFJ?=
 =?utf-8?B?T0w3VzFnSjZLVWlOemdWTkROS3lpMGpLUzQ1Ly9EUldQM1pVOXZZQndCQ0NS?=
 =?utf-8?B?NmNnY2lPRy9aK2ppUGZpUWFyZXJIK0JWMXVWaGNLSnNGaFRFaU5rdzhaUzN4?=
 =?utf-8?B?UmlhVmJLZXZCemdMYUw5Szk5cG1kalJubnk5K1VydGVBcGVXYjdlMFUvMnR0?=
 =?utf-8?B?U2UyMjZBbHFPNS9ES1dxNHRjd1MrZEJaa3B5bTQ4SitjTlZCblBDMURiSUF6?=
 =?utf-8?B?ZUVkZzJQWW9IelJKRVhteEo2REQ0dnl5VmozcXVNbmkzK20yeXlzVEk2MHVm?=
 =?utf-8?B?Wi9KNkl2TXRMT3VjTFFkR1FvUGd5OFZneUdLWDBQQkZ6aDV1YS96bGxEbVds?=
 =?utf-8?B?MXJiMG5TQ1ZUK2NScWo2R1FLYXJGcUwxQ1hwOGNpTEpaYnJ6NkgyVEw1ZHBT?=
 =?utf-8?B?NklrTytNMEpiUXBMdVQ4QWZKbkx4OFVjaTQ2Vy9Qdzd1M25hcE95eHgrSHc0?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3166832E9172D48B7DEF752F7012E86@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd105ca3-84bd-4d5e-4076-08db6e5c19cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 11:23:25.1576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vkPw+AAP5XOMKG0rQURHThe7ACS0NfE4HB6SWKe/Pew5oibBzan1iAWdPgbCniJWJdjxh/LI25R6qg5LhDjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1989
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ex9st3FkZzLGPApWiOIsMhe6KajoHvXi
X-Proofpoint-GUID: ex9st3FkZzLGPApWiOIsMhe6KajoHvXi
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2sgKGNvbW1lbnRzIGJlbG93
KS4NCg0KT24gVHVlLCAyMDIzLTA2LTEzIGF0IDEyOjM4IC0wNTAwLCBBbmRyZXcgRGF2aXMgd3Jv
dGU6DQo+IE9uIDYvMTMvMjMgOTo0NyBBTSwgU2FyYWggV2Fsa2VyIHdyb3RlOg0KPiA+IEFkZCB0
aGUgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgU2VyaWVzIEFYRSBH
UFUgdXNlZCBpbg0KPiA+IFRJIEFNNjIgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBT
YXJhaCBXYWxrZXIgPHNhcmFoLndhbGtlckBpbWd0ZWMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlhbWwgIHwgNzEgKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDcgKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQ0K
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlhbWwNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjUyMzQzODc2ZDFjDQo+ID4g
LS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiA+IEBAIC0wLDAgKzEsNzEgQEANCj4gPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4g
KyMgQ29weXJpZ2h0IChjKSAyMDIyIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcyBMdGQuDQo+ID4g
KyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9ncHUvaW1nLHBvd2VydnIueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogSW1hZ2lu
YXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlIgR1BVDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoN
Cj4gPiArICAtIFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+DQo+ID4gKw0K
PiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBvbmVPZjoNCj4g
DQo+IG9uZU9mIHNob3VsZG4ndCBiZSBuZWVkZWQsIHlvdSBjYW4ganVzdCBkbyB0aGUgZW51bSBm
b2xsb3dlZCBieSBjb25zdC4NCg0KU3VyZSwgd2UnbGwgbWFrZSB0aGlzIGNoYW5nZS4NCg0KPiAN
Cj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAg
ICAgICAgICAtIHRpLGFtNjItZ3B1DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBpbWcscG93ZXJ2
ci1zZXJpZXNheGUNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4g
PiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAgIG1heEl0
ZW1zOiAzDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4g
KyAgICAgIC0gY29uc3Q6IGNvcmUNCj4gPiArICAgICAgLSBjb25zdDogbWVtDQo+ID4gKyAgICAg
IC0gY29uc3Q6IHN5cw0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArDQo+ID4gKyAgaW50ZXJy
dXB0czoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBHUFUgaW50
ZXJydXB0DQo+ID4gKw0KPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0K
PiA+ICsgICAgICAtIGNvbnN0OiBncHUNCj4gPiArDQo+ID4gKyAgcG93ZXItZG9tYWluczoNCj4g
PiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHBvd2VyLXN1cHBseTogdHJ1ZQ0KPiAN
Cj4gV2h5IGRvIHlvdSBuZWVkIHBvd2VyLXN1cHBseT8NCg0KV2UgZG9uJ3QgbmVlZCB0aGlzLCBz
byB3aWxsIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCBpdGVyYXRpb24uDQoNClRoYW5rcw0KRnJhbmsN
Cg0KPiANCj4gQW5kcmV3DQo+IA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21w
YXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gY2xvY2stbmFt
ZXMNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIGludGVycnVwdC1uYW1lcw0KPiA+ICsN
Cj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoN
Cj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9pcnEuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKw0KPiA+ICsgICAgZ3B1OiBncHVAZmQwMDAwMCB7
DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSxhbTYyLWdwdSIsICJpbWcscG93ZXJ2ci1z
ZXJpZXNheGUiOw0KPiA+ICsgICAgICAgIHJlZyA9IDwweDBmZDAwMDAwIDB4MjAwMDA+Ow0KPiA+
ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNvbWVfcGRzIDE4Nz47DQo+ID4gKyAgICAgICAg
Y2xvY2tzID0gPCZrM19jbGtzIDE4NyAwPjsNCj4gPiArICAgICAgICBjbG9jay1uYW1lcyA9ICJj
b3JlIjsNCj4gPiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODYgSVJRX1RZUEVfTEVW
RUxfSElHSD47DQo+ID4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImdwdSI7DQo+ID4gKyAg
ICB9Ow0KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+ID4gaW5k
ZXggYjM0NGUxMzE4YWMzLi5hNDE1MTc4NDNhMTAgMTAwNjQ0DQo+ID4gLS0tIGEvTUFJTlRBSU5F
UlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBAIC0xMDA4NCw2ICsxMDA4NCwxMyBAQCBJ
TUdURUMgSVIgREVDT0RFUiBEUklWRVINCj4gPiAgIFM6CU9ycGhhbg0KPiA+ICAgRjoJZHJpdmVy
cy9tZWRpYS9yYy9pbWctaXIvDQo+ID4gICANCj4gPiArSU1HVEVDIFBPV0VSVlIgRFJNIERSSVZF
Ug0KPiA+ICtNOglGcmFuayBCaW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVjLmNvbT4NCj4gPiArTToJ
U2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJAaW1ndGVjLmNvbT4NCj4gPiArTToJRG9uYWxkIFJv
YnNvbiA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29tPg0KPiA+ICtTOglTdXBwb3J0ZWQNCj4gPiAr
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci55YW1s
DQo+ID4gKw0KPiA+ICAgSU1PTiBTT1VOREdSQVBIIFVTQiBJUiBSRUNFSVZFUg0KPiA+ICAgTToJ
U2VhbiBZb3VuZyA8c2VhbkBtZXNzLm9yZz4NCj4gPiAgIEw6CWxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZw0K
