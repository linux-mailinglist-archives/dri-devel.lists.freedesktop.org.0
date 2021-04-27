Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F636C87D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84C86E158;
	Tue, 27 Apr 2021 15:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2A86E158;
 Tue, 27 Apr 2021 15:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2NwYxk33sGvYi759Ok+pj8g+QhbjOobBJ4iGKmJmHaLgMfPTSjyMBWrH+fJ1X58uK6EZfLaWIpzzcne3PIOisqSBKaUMBCyGEYgBJT8NyLu4PwZGEkeL6Pj5SRCfP1z6b5KwMIpqbtYkLag/hmoVRoAhqY+lRrZZfcaj0Gkn51F3786ldoEKRYokJV5z9VEwGSz+JIPta8Qkskg1Hql1ZsT/QUZZi1Xxpm6BjwFlvTzX1SA8PEmtxMaxZmytUDSTXTu473cGtsqJMhvGlfcJApJoMGhwjFhMesr6h//Gla93jndXmxzqM3SgbhbbSqJ/2vPBn4+vNEWX4v/j3Q/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rCvqabRGhBKll/jFYQPLucjp5/7QYGMmGs37HD7RtA=;
 b=eM24OrkuyciamzZ9k69CCDDS/7kYol97SyCk64nyJWukR7iN/el/zDqAYuXZwCtry7M4d7buiMvaHUr6K71mI6cxUpehjnedvR+x1CQw5EKCM89p2WbtSWadMtooyrXAZTeXW0lnqRd6nCaYDFQFuc5+QZjtK4xDTiqZxO+AxexCwsBCnGSlt1rhqkl/gc7W4SO36XiX4HjlhmwL2EEhd6kIxGsFdcMlHIAACkEo6I3/BEKt/Gm35tAlBcuP6HBJBSypCBqnlzlMhngaZRHIUq90Y7P7W/Z95Z3GAPVl7hspQH/K+yiVWUbPDdSpc4KmOw3CbjyecjIlWJrzCKVDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rCvqabRGhBKll/jFYQPLucjp5/7QYGMmGs37HD7RtA=;
 b=vzGH1fqNhB0W61P/b24Az+nc4vnfjhlGzy0LJtwqeSFfDbxAhFdXe6k5D5lHrpjs5R2t/AuWopNxvQnYfB3/JOmuHD+OMl0BWqpkxgU3ygn3YdheJNIm5e/9iUzDBzmR+GP7jYwZCfhug8jGYXRYWf1DjP6TJyITzSP4Z/jgKmk=
Received: from SN6PR12MB4734.namprd12.prod.outlook.com (2603:10b6:805:e2::20)
 by SN1PR12MB2559.namprd12.prod.outlook.com (2603:10b6:802:29::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Tue, 27 Apr
 2021 15:16:12 +0000
Received: from SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::117f:6129:3bfe:dbc9]) by SN6PR12MB4734.namprd12.prod.outlook.com
 ([fe80::117f:6129:3bfe:dbc9%7]) with mapi id 15.20.4065.026; Tue, 27 Apr 2021
 15:16:12 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/10] Implement multi-GPU DMA mappings for KFD
Thread-Topic: [PATCH v2 00/10] Implement multi-GPU DMA mappings for KFD
Thread-Index: AQHXNxdBIbYDKM7Xc023cWpGtBltcqrIP0aA
Date: Tue, 27 Apr 2021 15:16:12 +0000
Message-ID: <A4572F97-6ACD-4279-ABA6-37C7969DE0BD@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.46.21021202
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5db0a9ca-c5fe-450a-99d2-08d9098f64aa
x-ms-traffictypediagnostic: SN1PR12MB2559:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2559C5299FB9FE2B1E3C47F380419@SN1PR12MB2559.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XR/6UunNJe5PZ84/bm64xb9pzFvcjSVWGKQB+7t8CF3cjLOUyyQ+knQPCg4AFXEM9CP3zbyayhjgXfUf8VjOGhDkjweu9/28H6ZFVfdZJjcoQAUK5ujzU6yDLraeDz4fMBa3/gXvrq/NBCULMnu+2Dfd/Lo9boF+GJjUt0EFCLyvJIAxVekzCm/pmTq6NJITlkHVNL7Q7sT3PA8LBBrzfXM4RrdhjuV/DC6bCPNdgF/2ig/rkLk1piI47L/LSGYzcrR19dpx600v+iw/mo6sFHliM2JTXYBaGi2y/u9ouTmHvAjlZ0d3o0TSwiHmSed3bysVoIfdII7VZWc5tW2uoPp3cLWP2m8RqP7buqsg7z7cVhk9fEllzG2WfkCqkBdSbm7vXCPc/MaNPfNcTtRIimqZB8UGV/IDlvTM0h7y1lQ79TRZDzWPHVBJDrLQ+62dHaGSc8WXkfsl+z4KVLIcsM9omKXrvFmh54xJe4OgwdGccsWU4jFXHmwLSSib4x0+kY354VHzv5fdzmNIQ6afkNLYB681916zr3HeHP42jQ9y6VJ6naSHDpW/CLoRdo4km8BAJiyeZNdILOrCrprW8h+J3fxez2G/FfPIF8kVRSbL+9kgyixtySRK9nuy1ghz+tFZFmchdS4oIwWfPnmt/AT1DyYdLp5dpmu9h1SlH/fqNH8nYFK83en7ctv3YtroSd9j6vTXfc9ksZMApkK7BQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4734.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(71200400001)(38100700002)(478600001)(2906002)(2616005)(45080400002)(66476007)(450100002)(316002)(966005)(6512007)(6506007)(122000001)(83380400001)(36756003)(91956017)(33656002)(110136005)(86362001)(186003)(26005)(8936002)(5660300002)(6486002)(66556008)(66946007)(64756008)(66446008)(76116006)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QndscXFsN1d3Mm1ub1dGVmlqUFBVemVLV1VIN0hDTHZOY0VDdGxJcGRDYVZM?=
 =?utf-8?B?OFREZ3E1V2lTL1I4c1dNd09LRmJZQTdZRElSVU1HMHBKNE4zZ0NCcWRNTFJr?=
 =?utf-8?B?Yzg5UGdqRlBqZjVzQ09KckVVMzNmam5mZjc0elVlNjhGdHhtNkZDNFVZanlX?=
 =?utf-8?B?bmZsVUwxNVEzYTdvTmFDWkpBRVg1MWFXQmRQT1l1VGpxajdGd1p2OXBtZFY3?=
 =?utf-8?B?bEs1RFlrd1ZJSjdaNGo5V0NxTDMvdithVnJqSGJUK1p4NEhFZ1hZRFJmcFlB?=
 =?utf-8?B?emUyckVlWjA2MHJqVGx4SUJRYnlpZVNZaUFDdlJsRnRpL0cyOHBYTnVRWWo3?=
 =?utf-8?B?SEltaVVNd2YyWFovNzRzaGtxZUpvYTVnUXN1U05OSzNURW5sTUY2TTV2cTNm?=
 =?utf-8?B?cStLMWhsaWpSMFI4LzBwcWtadEt6MmR5R1k4ZzJqQis1aXVKTFU1ZkxLMzNI?=
 =?utf-8?B?bjZMZ3RoOWhUaWo1RUlwaUhXV2p3OWhBZEl3L2RwS2I2cEtweW9SR1JUcDdZ?=
 =?utf-8?B?QjJPdWVQaERCYlBRQXc0NzB3bmJDaXhFTFJHTGxWZHc3QWtrc0J0YXRpRU8w?=
 =?utf-8?B?ZXhKNmRhQ01HaTNVVjFXYm9LYVVMVDNTRWlHRkVuR2hnOERiY0tmelE0Vzdw?=
 =?utf-8?B?dnFGb2hPMUxpZ0lXcXRpdWxWNkVhQVd0VUhneWExb1lXV3EvM0N3ajNWbldn?=
 =?utf-8?B?SXl2a0owS2RRd2RtSlRSa21ZZlZZT1JrenpOS0RrblJEbFhENmgyRkZ2bWhy?=
 =?utf-8?B?T2pRek5IUm1MN2JnL0NJNnNpUEVnblovZE9YUDEwWng3WXRkalRXVmdBaElR?=
 =?utf-8?B?aXpDckZYU25CNkdnakhXS2RZU2gzR1BBd1dudkROWlFsUzZMVG1sTHc3RC92?=
 =?utf-8?B?R2RNOVNKOE42NGVpV1phTzhsZFpQVnY3RWluSmlPb2Z1ajZnSGR4ODBLTUJI?=
 =?utf-8?B?dmloblpzOUNNcEpDYjRVaER3RG9JZFhpRHpoK0lYcFpsWXM5ZUY3aTBjWFZV?=
 =?utf-8?B?bnZGNXpmU1k1K3NvampKS3lJZDVNam8vdjJzOWN1VEF2Z3N4OU1sSzJ6NU5w?=
 =?utf-8?B?am1RaE9DMXhIWWlOamZybzl3Z2paUk53QWJ0YVNpYzZyVjRJL1BuMnJxTFdu?=
 =?utf-8?B?QTQzTTl2SUt5djdDeXNtZktPREplb3ZaSmZNRFFxaDRHZUtoUy9zelpETUhn?=
 =?utf-8?B?K0FHbjZIaldFb1R5SUg1NE9ra2dLMEJmWEtFUE5CVVloUHo4NzlXaFBDa2xh?=
 =?utf-8?B?SmdiSFdWR0xTTUtVVWpkeFRkaktBaEY4TExaTy9NNUtobzd0amVGWWw4eGsy?=
 =?utf-8?B?cnNmbFJ4VkZNcndHNFpUMCsrMUpISFdPbGhCdTZ6bytpV3BCZ0kxTFozMStI?=
 =?utf-8?B?alprQ0E0VFNpV3dTU0FNUHVmSWxxSkdBcFU5QnlORnNpSm00OTBTMmpXOVFx?=
 =?utf-8?B?RmZJZ08zTnZhMzVQMHFtUEhsbDJHWWRkQk1iQ1IxRVVhcnp2MkhWRGhQS3hQ?=
 =?utf-8?B?TlN5NTFPeUwycVlUU3l4cGpxbTZXb29aSEFEcm5lTndGMEYrVHdPaElMWjZC?=
 =?utf-8?B?TWNwV0k2c0xhNzFzOG9aTmJQYXlJTUNiamZtUDY0Z1B2elNJYk12cXhYMWZQ?=
 =?utf-8?B?a3lpOHArb2R3RjQ1MzRTcDVDc3ErdFVybFl2S25MNi9sOE5SOFJhZTJoLzBM?=
 =?utf-8?B?emtPM3ZpT3VTeVp3M1BnNVVUQ0VDMGlPZnRwVHNrK1FQS1JJTWUxY2twa3FW?=
 =?utf-8?B?OUQvUks3ckIxMFlRVHVZS0VLTXd0UE9aanFYTlFvc2FpS1o4QzgyQm1wUTJ0?=
 =?utf-8?B?Z1NTYmlIQmZwLzNFTDFmUT09?=
Content-ID: <DB9D6B423227974A829F984F9AD0B5F1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db0a9ca-c5fe-450a-99d2-08d9098f64aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 15:16:12.2991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mbt9+3EE4wjfiyNaLdPbUiCpdSP5yEg33M7nBtlAd4tBfpQtBnrefP5WXFOA6E3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2559
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaXMgQWNrZWQtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPiANCg0K
UmVnYXJkcywNCk9hayANCg0KIA0KDQrvu79PbiAyMDIxLTA0LTIxLCA5OjMxIFBNLCAiZHJpLWRl
dmVsIG9uIGJlaGFsZiBvZiBGZWxpeCBLdWVobGluZyIgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyBvbiBiZWhhbGYgb2YgRmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gd3Jv
dGU6DQoNCiAgICBUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyBETUEtbWFwcGluZ3Mgb2Ygc3lzdGVt
IG1lbW9yeSAoR1RUIGFuZCB1c2VycHRyKQ0KICAgIGZvciBLRkQgcnVubmluZyBvbiBtdWx0aS1H
UFUgc3lzdGVtcyB3aXRoIElPTU1VIGVuYWJsZWQuIE9uZSBTRy1CTyBwZXINCiAgICBHUFUgaXMg
bmVlZGVkIHRvIG1haW50YWluIHRoZSBETUEgbWFwcGluZ3Mgb2YgZWFjaCBCTy4NCg0KICAgIENo
YW5nZXMgaW4gdjI6DQogICAgLSBNYWRlIHRoZSBvcmlnaW5hbCBCTyBwYXJlbnQgb2YgdGhlIFNH
IEJPIHRvIGZpeCBibyBkZXN0cnVjdGlvbiBvcmRlcg0KICAgIC0gUmVtb3ZlZCBpbmRpdmlkdWFs
aWF0aW9uIGhhY2sgdGhhdCBpcywgbm90IG5lZWRlZCB3aXRoIHBhcmVudCBCTw0KICAgIC0gUmVt
b3ZlZCByZXN2IGxvY2tpbmcgaGFjZSBpbiBhbWRncHVfdHRtX3VucG9wdWxhdGUsIG5vdCBuZWVk
ZWQgd2l0aG91dA0KICAgICAgdGhlIGluZGl2aWR1YWxpemF0aW9uIGhhY2sNCiAgICAtIEFkZGVk
IGEgcGF0Y2ggdG8gZW5hYmxlIHRoZSBJbnRlbCBJT01NVSBkcml2ZXIgaW4gcm9jay1kYmdfZGVm
Y29uZmlnDQogICAgLSBBZGRlZCBhIHBhdGNoIHRvIG1vdmUgZG1hYnVmIGF0dGFjaC9kZXRhY2gg
aW50byBiYWNrZW5kXyh1biliaW5kDQoNCiAgICBJJ20gc3RpbGwgc2VlaW5nIHNvbWUgSU9NTVUg
YWNjZXNzIGZhdWx0cyBpbiB0aGUgZXZpY3Rpb24gdGVzdC4gVGhleSBzZWVtDQogICAgdG8gYmUg
cmVsYXRlZCB0byB1c2VycHRyIGhhbmRsaW5nLiBUaGV5IGhhcHBlbiBldmVuIHdpdGhvdXQgdGhp
cyBwYXRjaA0KICAgIHNlcmllcyBvbiBhIHNpbmdsZS1HUFUgc3lzdGVtLCB3aGVyZSB0aGlzIHBh
dGNoIHNlcmllcyBpcyBub3QgbmVlZGVkLiBJDQogICAgYmVsaWV2ZSB0aGlzIGlzIGFuIG9sZCBw
cm9ibGVtIGluIEtGRCBvciBhbWRncHUgdGhhdCBpcyBiZWluZyBleHBvc2VkIGJ5DQogICAgZGV2
aWNlIGlzb2xhdGlvbiBmcm9tIHRoZSBJT01NVS4gSSdtIGRlYnVnZ2luZyBpdCwgYnV0IGl0IHNo
b3VsZCBub3QgaG9sZA0KICAgIHVwIHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQogICAgImRybS90dG06
IERvbid0IGNvdW50IHBhZ2VzIGluIFNHIEJPcyBhZ2FpbnN0IHBhZ2VzX2xpbWl0IiB3YXMgYWxy
ZWFkeQ0KICAgIGFwcGxpZWQgdG8gZHJtLW1pc2MgKEkgdGhpbmspLiBJJ20gc3RpbGwgaW5jbHVk
aW5nIGl0IGhlcmUgYmVjYXVzZSBteQ0KICAgIHBhdGNoZXMgZGVwZW5kIG9uIGl0LiBXaXRob3V0
IHRoYXQsIHRoZSBTRyBCT3MgY3JlYXRlZCBmb3IgRE1BIG1hcHBpbmdzDQogICAgY2F1c2UgbWFu
eSB0ZXN0cyBmYWlsIGJlY2F1c2UgVFRNIGluY29ycmVjdGx5IHRoaW5rcyBpdCdzIG91dCBvZiBt
ZW1vcnkuDQoNCiAgICBGZWxpeCBLdWVobGluZyAoMTApOg0KICAgICAgcm9jay1kYmdfZGVmY29u
ZmlnOiBFbmFibGUgSW50ZWwgSU9NTVUNCiAgICAgIGRybS9hbWRncHU6IFJlbmFtZSBrZmRfYm9f
dmFfbGlzdCB0byBrZmRfbWVtX2F0dGFjaG1lbnQNCiAgICAgIGRybS9hbWRncHU6IEtlZXAgYSBi
by1yZWZlcmVuY2UgcGVyLWF0dGFjaG1lbnQNCiAgICAgIGRybS9hbWRncHU6IFNpbXBsaWZ5IEFR
TCBxdWV1ZSBtYXBwaW5nDQogICAgICBkcm0vYW1kZ3B1OiBBZGQgbXVsdGktR1BVIERNQSBtYXBw
aW5nIGhlbHBlcnMNCiAgICAgIGRybS9hbWRncHU6IERNQSBtYXAvdW5tYXAgd2hlbiB1cGRhdGlu
ZyBHUFUgbWFwcGluZ3MNCiAgICAgIGRybS9hbWRncHU6IE1vdmUga2ZkX21lbV9hdHRhY2ggb3V0
c2lkZSByZXNlcnZhdGlvbg0KICAgICAgZHJtL2FtZGdwdTogQWRkIERNQSBtYXBwaW5nIG9mIEdU
VCBCT3MNCiAgICAgIGRybS90dG06IERvbid0IGNvdW50IHBhZ2VzIGluIFNHIEJPcyBhZ2FpbnN0
IHBhZ2VzX2xpbWl0DQogICAgICBkcm0vYW1kZ3B1OiBNb3ZlIGRtYWJ1ZiBhdHRhY2gvZGV0YWNo
IHRvIGJhY2tlbmRfKHVuKWJpbmQNCg0KICAgICBhcmNoL3g4Ni9jb25maWdzL3JvY2stZGJnX2Rl
ZmNvbmZpZyAgICAgICAgICAgfCAgMTEgKy0NCiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgIDE4ICstDQogICAgIC4uLi9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDUzMCArKysrKysrKysrKystLS0tLS0NCiAgICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICAgIHwgIDUxICstDQog
ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgICAgICAgICAgICAgICAgICB8ICAyNyAr
LQ0KICAgICA1IGZpbGVzIGNoYW5nZWQsIDQzNyBpbnNlcnRpb25zKCspLCAyMDAgZGVsZXRpb25z
KC0pDQoNCiAgICAtLSANCiAgICAyLjMxLjENCg0KICAgIF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQogICAgZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KICAg
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCiAgICBodHRwczovL25hbTExLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVl
ZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDQl
N0MwMSU3Q29hay56ZW5nJTQwYW1kLmNvbSU3Q2ZiMzE5MjJiZDUwODQ2NjQxZTk1MDhkOTA1MmU2
MzVkJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU0NjUx
OTA1ODIwNDA0NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtz
ZGF0YT15eE5lc1d4RG1NNUg4T2JpTm1lYWEwREJJRXlwdGlCcGpVS1NVcVMlMkI1Mk0lM0QmYW1w
O3Jlc2VydmVkPTANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
