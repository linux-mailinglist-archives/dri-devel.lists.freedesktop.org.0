Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF66DE332
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A179210E34D;
	Tue, 11 Apr 2023 17:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW2PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11013005.outbound.protection.outlook.com [52.101.49.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8434F10E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 17:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNr0yLV0CCoKTjQfCoJqME2SgA3yYtoXiVauvymMaiR+aueXPCpHTwN1sN+mORq30m/PLb5z3YAA71EbqO3D/VVGA+UqPP9dfeC5ZaIGmIdB4rIHiV6xT1XNnX0zhf3ccj8BM2NveLgCgFF35S6XzGCUPhzkXlbROGNfjNTSNyCl4jYvK7Hc7Hly3EBamODVaYuvufZxpi6lps3vaHg8ufYPwXqdsrDaksnry13QICY9m9ItE2T82zqhnPigfDMDLAOmiPZEbGWPIRJw8EZC2tjbpgVm/HQnDIRjeVCmzFtPSV/tN6g9svpqrSf9Ez5sTyPU9nI0lMATzApg+DdVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc4KD0zweSE20s1/cw8qWDR4AhSBC15h9rjxz9ud2ow=;
 b=ZMqfdMY3J/p9REJZP6zk7flwTGcmgNXz8Nbm9kBBEs8eI+/snRBE6S3E6vOrKcyXSVVkoKlO9GE1Ko2eQ/XnqBlAysloKQ1tuIclghU7437AtNb+HO76B0i7elr1F9CCEJfEjIcLpgkVXOPMEw7/zBI+mJyyoBwJzOeOKzknNpbOgyXDCqUL5b0Fo70uG79qMeNTLmW5qDb4cwHvCfJocMWTnY2sOVa2r9ZER6oGqjNlX9gOBoNvQWpIzJmi4I/d7LvptCvwcbN6CUt5T3DMlAgHQRlk9hsD4YLxbHE1Yxd82v9Jk3wQF7uOSRpEWZECygyH9UhrZpsIYcAQoAOGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc4KD0zweSE20s1/cw8qWDR4AhSBC15h9rjxz9ud2ow=;
 b=EvoLoI/EUghGnqu2vNNZlQKHvFmKqUEWUyBSPR5bSgSCfnQ641AHfjY/gWqVlAb6IvCn2gbYS1H3V0jlZCBTPWp4l4fvkkuHRMS0WFlh8gAIKQI2xntzCOqBlzSgGDh3uIrs5X9OiI28UrtDyFX0hZRwYVHKmDGa4dpTPw1PsyE=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by MN2PR05MB6048.namprd05.prod.outlook.com
 (2603:10b6:208:d0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 17:54:26 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8%6]) with mapi id 15.20.6298.028; Tue, 11 Apr 2023
 17:54:26 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "nathan@kernel.org"
 <nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "trix@redhat.com" <trix@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
Thread-Topic: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
Thread-Index: AQHZXCJfQ+s7JMgTuEarwKwV+53z968mhQmA
Date: Tue, 11 Apr 2023 17:54:26 +0000
Message-ID: <466f4517100964537142f698e82cffb87acd39fb.camel@vmware.com>
References: <20230321182414.1826372-1-trix@redhat.com>
In-Reply-To: <20230321182414.1826372-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|MN2PR05MB6048:EE_
x-ms-office365-filtering-correlation-id: b21a6cca-89a6-47df-2466-08db3ab5caa8
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: puq21ZqvtA/7MGmyx2xXaRiFzwcS+IaPSlMH+dpdWPq40MX7kMaPwkjPfS0c/cgR+MINy+5yWsqz2LQMSm+QDSs4Ant48Cg+l1Tw9+od+GwNL6DJO2ArxPaMIuMo1iFpMtFplTuMhUihK7Z6lQUPxqRp0K982kboJOQvsDqD2e0DnzDIfFy4sJXtf7aVNW3l1bD8SAx79TN7185e0/XnmdRRxlxECfKa2jCq1vrc5b9Ow9tURNl9OuKm8SHKVnfwK7yVswUX5ahoSlmflA012CJD0zhwby+mbCCpirSAOiWXbMHgXeFrML55ku2sDgELE5hRO498BGzGSWFzTPL7shsoLZ9mGdOmSPhs29SPBVjWpA3JujtIGckFpiuHRcoiAHz2X3zSDgvYXyHu0D7zPN9pcjncJOv18oQo45eE2LKJv2sCzalEtNxZoq5GYRXVEq1SLaI8SRgcbtHsHoi9kiJWq32ivyg1CTSr8n/ytLH7rtdXWuqYwEKjyucCZSwPt+HQWDWXP2uHYRVG1kfueYhahq/Xlm6w8D+aLAELzDL+9RQiSAK27bJrF7QpftazLHvVJyAQgPe+GdB7LsbLh+syQaGZ1TLhJ7Uro6xDiwn9iKww3wNPo10LS5bXL0B2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(478600001)(71200400001)(6506007)(316002)(6512007)(110136005)(26005)(54906003)(186003)(5660300002)(6486002)(91956017)(4744005)(2906002)(66556008)(76116006)(66946007)(4326008)(64756008)(41300700001)(66446008)(8676002)(8936002)(66476007)(38100700002)(122000001)(36756003)(2616005)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3FZSE5naVpNVHk5aFR2Sk85ZHgrdldQSmk4NVJCaTZ0REpnM3JaOWxlLzNl?=
 =?utf-8?B?Q3Q1MlpFZDJRMEFHK1VJcnFyUlY3bXZ5M0xSUVU2RkEvOXc4ZE1YWmd2aERV?=
 =?utf-8?B?STYya3prelVrQ2RGR2pTeklWbHpseGdTNU1RcitPMWQ5eVg1RHFzQkM0MFZx?=
 =?utf-8?B?NFR2N3g1MTJuYUMxT1U4SmxQdENpNlBqTUZXK3ExMlEzT29XbGUyOFErUkti?=
 =?utf-8?B?UWJTV015enlyWlh3YnVOb0Q4c2s4RitVRXR6K21JZ1BiVWVhaW8ya1BWK3Mv?=
 =?utf-8?B?ejJLRUdXR3VlcDIxMGw5OGY3TG9EQlgxbklvMXpRbHZSL2VKcXpaTGREamJG?=
 =?utf-8?B?bUpESkpKZWFydGFPTkRNaUtRbU9mSVVWWVVncXN3a2RpOWhncXBQaUxFYVJB?=
 =?utf-8?B?UFhaVEpnVWFvVVZTQ2tWWFZhUjJXb0g2OUgxejVNRG5DOUQrZWFiN3pmYjRV?=
 =?utf-8?B?bmIraW9hU2d0UHV4VEpzWlJSdTRRc1AwSjNGTjh0cncxbFNKaHZZY1BpcmVo?=
 =?utf-8?B?QkFKS1Nkc05hOERsU05WeXljeDlwYW1YS0FVMDlEVE05dkx5T21XK3hiNkdt?=
 =?utf-8?B?L1cyVUpjK1JWQktsRndSMlJyUDZ4Z1lHUnZUNXlHZEVCeFhXNFVCVXdsVnZP?=
 =?utf-8?B?bEF1TE5XenBoSzR4bTFLQ2YzQVlaeWw3U1VUY0JhcXdxcXE0RWZPUUxvckEr?=
 =?utf-8?B?cnJqdXJBLzJDNW52bjFWS2tNZkFwdk9aMzRWY1RZQyswWmVDcU9QUTY1SjAy?=
 =?utf-8?B?bXRGYzVCRHg1MkZoL2ZZR0VjVDJNVW5oYU5OeWJES1E3Q2FndlFpWTFjSVhT?=
 =?utf-8?B?NEhJOGFsYnIrQ0ZPeUVhRHpOY29Mc2R0ZGtXWWlMK29TRm1GOTdKRkpJbnpl?=
 =?utf-8?B?V3UyZXNqd05YY2dheHVJZE9YbEtIT0FwWEdlTjdhbzBkWUxiY0ZzYUY3MldR?=
 =?utf-8?B?K01FZ010TnJMQmVhSndhRXFsczBncnQ3dU9SUTJmdHUzNUc1T2tRdUg2NHlY?=
 =?utf-8?B?MDdVbzNDSnlLUWl2Mmoxd3NoOE1rU3NyUWtaQWdQSEVTL2ErT1M1NzY5ZGZ5?=
 =?utf-8?B?c0dvNFdHd21rUnV3ZXdYdTc1bWlSZGUrS0pIeGpJOFo3U3dzYUtPaDg5WUdS?=
 =?utf-8?B?ZXRnRVA4bEx0em91YURFUk1sck1DUUJUd0VBU0xmWThsMGh2VjhyZ1NUVm1M?=
 =?utf-8?B?Y1BMaGF4UkR6Ri9CZHFaZHN0bzF0QzVIaWtqdzV5UE1EWTlFU2x4NGZobkVL?=
 =?utf-8?B?VWpUSWlWdGpyOTBHOS82QWd2eFNiNHRoS0R1bEZUZm8wbER1alZDK3U1cGZG?=
 =?utf-8?B?RVlnYVd4QWplWTB5UkNaVU1KV3dIbWR4U2I1T2t5T1FlTTNqOExFQjJiTlVO?=
 =?utf-8?B?dS95aUx1MGdwZVFhRXh3MUNHcmZrNFcyM0RDMmU3UHQwWkEwZ3NOV05qVnlN?=
 =?utf-8?B?VWxDVVhTTkxTZjNJejdmSmdUUzZ5V1ZSTHVFR01PSFQ1VWFXUnN6dE1oQkNE?=
 =?utf-8?B?RkdGcHZBbWFRL1dsM0ViS0pyTXM2bGwyTysxb3lyS1UxclNvM3lYekVlL2NW?=
 =?utf-8?B?Q09YMVRHMUE5VEEyOWN5aU1lYWI3bkh5ZWZWYlhpQ1BGempYR3Fyakp4STlZ?=
 =?utf-8?B?SWVFUm5hREx2NUZiQjhMQWtndVllN3lGV2J4enJBYXhFcFZkbVd6SmFZQ3Bp?=
 =?utf-8?B?OFp2dDZacjlpMXNEM2JKSWN3R2NKWU9rVVZsQno5c0JjSmRXVk8xOEJkcUFl?=
 =?utf-8?B?amV4QkJJNk84cTZLcHNDMGticlkra1Z0QTVoZ3lHY0VWZld5eTgrUXVFMGVD?=
 =?utf-8?B?MEM3elhCeHlPK3FmbnZwR1IxNFRaVDlJUS9UWUFTQXluai9WV3FDT3BTVmdR?=
 =?utf-8?B?Q20yNDVJY09RQU5qWmdwWFl4ZktGTjdEc1dkKzgrMEIwNWd0VWJMS09GY3No?=
 =?utf-8?B?TFIwdWVYc1pLREpGakFNekVtVFhqb1NPNGdlaUQ1RVRYem92ak4yWXNmMTNu?=
 =?utf-8?B?TkdjZFcwcUtWQy91WXJHaWNXNEF4NjQ0M0plQ3VNY2JoWVBkMTErcjJ6cmJw?=
 =?utf-8?B?dVRkdnlXblVhYVNwdW1udmdYbVpGVEptbTRFYUhRZzhDOStETm9YTE5CREpt?=
 =?utf-8?Q?ziVy3XOXqA8XATEcxykYnWTF/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A30070B6451B3E4C9233F0734BD70154@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21a6cca-89a6-47df-2466-08db3ab5caa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 17:54:26.6202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aJOECwb//QAFF13BxPX4fQeidI3xmLVOCAI7uB7clGS7WQRq9KFkASWgv3+x2jN7LrDPwgEocX4hX2VRCmAXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6048
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAzLTIxIGF0IDE0OjI0IC0wNDAwLCBUb20gUml4IHdyb3RlOg0KPiBjbGFu
ZyB3aXRoIFc9MSByZXBvcnRzDQo+IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X292ZXJs
YXkuYzo1NjozNTogZXJyb3I6DQo+IMKgIHVudXNlZCBmdW5jdGlvbiAndm13X292ZXJsYXknIFst
V2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQ0KPiBzdGF0aWMgaW5saW5lIHN0cnVjdCB2bXdfb3Zl
cmxheSAqdm13X292ZXJsYXkoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4N
Cj4gVGhpcyBmdW5jdGlvbiBpcyBub3QgdXNlZCwgc28gcmVtb3ZlIGl0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPg0KDQpUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4gSSB3ZW50IGFoZWFkIGFuZCBwdXNoZWQgaXQgdG8gdGhlIGRybS1taXNjLW5leHQgYnJh
bmNoIGluDQpkcm0tbWlzYyB0cmVlLg0KDQp6DQo=
