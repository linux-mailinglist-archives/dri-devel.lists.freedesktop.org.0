Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ABA7845E1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EDD10E39C;
	Tue, 22 Aug 2023 15:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAE210E398;
 Tue, 22 Aug 2023 15:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9ldhlkUpKsIrik1j3ZuJGi/s5tBhuOQpzmVNbDtqND3jMoynS/+V8n+AK2cMpBRjW6GgmjdX6Q/FtzH+1nNjLjfm1v8tLtmA9Ip9RWB58MzrshM/a/HQWKZZibd9vVA5Nn9tA8OmgFwMuXYyAV+N0VS0qjAQAbgBNg/i4CfEvCIpKeJKXtChKX/20N1OSPzWB30FuGqWLiYl3+M6Nxqgx04ErLuA8x4NamO7Dd/aY7gUaWSjfuzSffYKUgl8pa7KiofuNa5LzIzUl9FKf5TrEP+qzEtfxCl+ln7MJP/HlalUZkc3ZN5JeTuJhrNZvTrkR+kNd/8AnJXN7EEr+tP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Ti9Rpfwa2X5QApoEdm26JgeIchUL7yw5NAdt1r8ls=;
 b=ihNblRRXulS/Rynexq10KzKa7OLtSr3s0Ai1v3BS/6yhzPwL7zgfW8rOZXVotr+Xc9pe7Uh4LoiQVBx1WGdykNunv9aaRK9YuGuo1WCFWcGP0Cc9CZ3HVmsL8MpaJOQYZAHHF68hHOScK8dXupI4brIEwCk0mnU0XtnItxptHsVOYEdwitW/faWIEpWeW+kHXgmEd77bsFnsrtCOIhsY/+YyP53wnfCZGFpxAlYNS3gAkgNqJq4fx4rjHwiGJfilzsceCC3qxyNf5i/2DCD7Sxxe/yMSwF3RG+TFRvlOSI4ahTv+6gO+vrjcWz/sFyRBkvf6ZqsAqfgAr37CSaSVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7Ti9Rpfwa2X5QApoEdm26JgeIchUL7yw5NAdt1r8ls=;
 b=acS6t1+shKHuMqA7u6uyRauKs5Gg9Kurz3kQWAL43CiRNJP0vRJiYr03UpgQRRp6nzgCcVJ9tRpVaTog9E4m6DSQnn90dwmHeyA7ZnxlBRQKkH70HLXqUlPbNO9zmHPEzeHZ9pSqodWi5HSmihejtlgcvS4JXGEKSFLmtLsoPVg=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:20 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:19 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.1 10/10] drm/amdkfd: disable IOMMUv2 support for
 Raven
Thread-Topic: [PATCH AUTOSEL 6.1 10/10] drm/amdkfd: disable IOMMUv2 support
 for Raven
Thread-Index: AQHZ1Oz3g06BzyQ2p0aHNzZRAa0i/K/2dCdw
Date: Tue, 22 Aug 2023 15:41:19 +0000
Message-ID: <BN9PR12MB5146039C403A640CAD50A574F71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113628.3551393-1-sashal@kernel.org>
 <20230822113628.3551393-10-sashal@kernel.org>
In-Reply-To: <20230822113628.3551393-10-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=3694ab45-581f-466a-880f-6cd3c938acdc;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:40:46Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 3d1aa7c0-eb49-4eab-7c3c-08dba3263b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0d0f0ZcsDx3E7WIFFgOct8ZYXlbSKfSdh/0gbe0QTZ6P67QChta7zT40oDyGWcAUNgzhd9IfrDPX5fxZ0HGbkmp2T2cNzTLF4Fn1ob/X84vglc3LfY1Gg1104KRCPyvxn1ZNC+QWBbyB9nAAxbJ11iMZXUR5aPDDJ3HLTLumu2CQvK84CZc8OrDFzXy96adIy7tTfo0m5nry7zAEFBswDSCklecsN6/WjEhnG58hrHXM2BvcGN3KirQvWNa4FN3GooAUoYiVzSOdZ3gkySIBM61ClO+Pw7RMq73DjF+p3UwMiyno95yRrJqu8zJMq/3tfNnQS/sBNRCyqz9poH9F/6RiWgoulK/u2jdrEcHs5x3Ij2gjqNDfIx5Ymb9R56ihg+ypXc9Hp+GJZd6FUAX53dCsxH3tUDRlt4WkE56uc0D1jjdd2cPvExWa4hmqCYC2min9sqmh1zlogjxGBfurHTZTQaDawK+RGQ9ipLAOPhEmx7X5ge7GHsPB28FRIZHR+r38hadVrYOL+1SaoVAPjGmfgjb2mrWjuPLpg4E2mUqMMb9tmHcOh6bbfz9YwP8so0ylIBWoc729OeIXbicXcACYKZQr3V7H4ssdXMdgSzQylacCcIKw1zDNGdAvInR+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW53RzVTMHZlVkpnWlhWTUwwaS92cVdxeU5aOVI1a0c4Vzg2Q3V2ZmpPQlhT?=
 =?utf-8?B?bUU4cUo1d1BRby9VY0k1Y3NhV2hSMlBxcXN5VDhHV2FPKzFSZTRaZ3FpdGFn?=
 =?utf-8?B?Y1RGd0hESGJlLzVtRTJzMEhSaXZRNXBnbTNaa0NPSjMyeGQvMldPdGRLc2Q5?=
 =?utf-8?B?L1hSTFhrdWVMT3BhOHN1QXl2UkoyZGU2RWFPMmpGbGp3TUlBU0w1eU13M0px?=
 =?utf-8?B?WTRVb0wrMS9iS0dhZUxHOUtUREJ3QXVwNW1vbVJ6b3NydzZOaW0xUWtCQVNt?=
 =?utf-8?B?RGFZUHB2MnFOeDRRSTg4bkY0dzhUdkJBNWp4amdEVVdJZHRKSEVVR1N2TTF2?=
 =?utf-8?B?QW9HMmV6VkFKOTVyZnBIdzNEUGJpcmJHMXYvSld1SVQ4b29aOVVIY0RuUjV6?=
 =?utf-8?B?Y3c4Si9PL1AyZGlLV1FUY2lMT0N6RWtseEpZcEw0a09BU0JYa0hEV1IzVHBL?=
 =?utf-8?B?c0tuWWhPaGovbm94MTNEckUrY2FMbWw4bHJSc2MwbUwyTEFaSzBBSmlTSFZz?=
 =?utf-8?B?VGRQTllDUTBBMk9wUjhkRTQ2UVEzdzBCT2JCcVM3N2h5OFVwMG9COUtEYndn?=
 =?utf-8?B?Z1luaEgzTHhHZmlmNVVicTJnN1R3RUNYUVdmT1IwV1NiY3NFaUl6ZGRHWWRu?=
 =?utf-8?B?RzU2KzN2b2VFdGpUWnhpOS9FOVZWOWgyREFRbDEzTFBkeTNnSzhSM2NLY1ND?=
 =?utf-8?B?L004dlpqZEFLb0orQ3RtdDRZOUdLendWenhEWE40RXBKb1hFRkJUY29WM01z?=
 =?utf-8?B?OXp4TVJIWjkxRWV2c0l1YllKSnc3Uk40azVHRVZHN09jMVByd2tvUmZDV1o0?=
 =?utf-8?B?VnJZTlhxSDNGRDQxR0RNTm1PUjNTU3FFK2VHLzRuQjVzVDVCbWI2SUp0ZjJz?=
 =?utf-8?B?eDhCV3dpaktiRGhETldaRXhReWlmYkZWMG9BMlp2clBjQzYySDZEQ1lmZWp4?=
 =?utf-8?B?Nitwak5kNW1obDQwcllHNTFGUGg3dFo1c3Vweng3MVVBbFVwUkkyK3ZFK2Q3?=
 =?utf-8?B?V3hHS0I0cjh1ODNzWUpzRGRrRHpTUk82dGVEb3JSVFBFdTFDOGtTLytlRUlm?=
 =?utf-8?B?N0YxNnd3UnpQSEJIai9tTUl2Z3VrYTRHT1ZJMnk4aEFXaDFXMW93Q0g2dHBx?=
 =?utf-8?B?emhWN0hENU9MbDU5MTh6RGlPVWJlaGI5d0Z4ZFRubEdpZmF3RndZekNmS2ZN?=
 =?utf-8?B?TVFFYUI4SlVoUW1oWVVKWEtidUFzVDUxUHhnTERadGpDQnB1L25jNTV6MG13?=
 =?utf-8?B?NWFieUNrQzlxaitsNlcxci9WWjYrNVBhM2RydlpTelYyUE1jOHEzOElPMlFK?=
 =?utf-8?B?L2V4SU1iS0YrMk44aFA5M2pPL21LeVZCLzlCUzNwMVV5VXRLQzVnbmpJQ0VI?=
 =?utf-8?B?aGFkdnV5VUZKYVU3VWJsY2M5RVBtSzQ3WWp1d3lJMk4xOFIrWHgrSy9rWU5o?=
 =?utf-8?B?LzZqc3BhdVJwSkRqUS8rWURzV0w4UFpDMzM0TndPTlZ4V1pKbG42aE4rK3Aw?=
 =?utf-8?B?UDFmUjI4RmZFTHpHV2tOdEs3SDh3SmFRNVkwbUFQbUluUURic0NYUnZlek1E?=
 =?utf-8?B?SkxVSUFNR2hsM1Fqd1NsNjBjYlprZ3Q5Zll5SHpqVFhaVFl1RjhlOE1BUGNq?=
 =?utf-8?B?N25PUkx3UFBFMVptT0x6eGExMWhOV2NaUWlONmpEdTZhNzZyZ0V5aVZpSS9U?=
 =?utf-8?B?RnFaU2k1OU1wOUwwRDgzaUtQcFJqWWRzRjZqVVFmZDBVL1psbjlreWdMRll0?=
 =?utf-8?B?MFpOOUdHY0FjYnBZVy9ESVZ6UUJSVUhDZVJLYUZLUnZFTWZNemxvVVdWUzA0?=
 =?utf-8?B?Vzg2Ym4yVWk3cjRZSEt3bXNWb0dqWll5Q0ZmeWQ5a0xPaEZuVjRSOU9uYzFG?=
 =?utf-8?B?NGsyZzBVZWJjZVIwMTVSckZ6dW44ZmhpSW1TVCtsUURSdlNFOE91aEdDWGFy?=
 =?utf-8?B?UXhTR1c1SU1LOFlIWGQ4TEtra2ZoOXpkZVcxUlhrcGdIbmFhQ0FWbUx5T1lN?=
 =?utf-8?B?WWljY0RyeXlJaVpyUm4xZkY1L3dzRnFSR3NaeWZaUE9lbWo1V2owTnVvYUp3?=
 =?utf-8?B?d05TamE1UmR2QlRDeldoUE1YR0RhaFdrd2h5cWhrNFdzbDUwSmtKc3c1U2Ra?=
 =?utf-8?Q?cRwk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1aa7c0-eb49-4eab-7c3c-08dba3263b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:19.8410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNL8ouNspcZhz7MOs8QTw4OdYHC8wm1w6Jxisd7c72+VPjtRcdpNZNR6zLdhPKPdEFmUGhebc9gZzVT1tfin0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMiwgMjAy
MyA3OjM2IEFNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsNCj4gTWlrZSBMb3Ro
aWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PjsgUGFuLA0KPiBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggQVVUT1NFTCA2
LjEgMTAvMTBdIGRybS9hbWRrZmQ6IGRpc2FibGUgSU9NTVV2Mg0KPiBzdXBwb3J0IGZvciBSYXZl
bg0KPg0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
DQo+IFsgVXBzdHJlYW0gY29tbWl0IDA5MWFlNTQ3M2Y5NmNlZDg0NGFmNmJhMzliOTQ3NTczNTli
MTIzNDggXQ0KPg0KPiBVc2UgdGhlIGRHUFUgcGF0aCBpbnN0ZWFkLiAgVGhlcmUgd2VyZSBhIGxv
dCBvZiBwbGF0Zm9ybSBpc3N1ZXMgd2l0aCBJT01NVQ0KPiBpbiBnZW5lcmFsIG9uIHRoZXNlIGNo
aXBzIGR1ZSB0byB3aW5kb3dzIG5vdCBlbmFibGluZyBJT01NVSBhdCB0aGUgdGltZS4NCj4gVGhl
IGRHUFUgcGF0aCBoYXMgYmVlbiB1c2VkIGZvciBhIGxvbmcgdGltZSB3aXRoIG5ld2VyIEFQVXMg
YW5kIHdvcmtzDQo+IGZpbmUuICBUaGlzIGFsc28gcGF2ZXMgdGhlIHdheSB0byBzaW1wbGlmeSB0
aGUgZHJpdmVyIHNpZ25pZmljYW50bHkuDQoNCg0KVGhpcyBpcyBub3QgbmVlZGVkIGZvciBzdGFi
bGUuDQoNCkFsZXgNCg0KPg0KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+DQo+IFRlc3RlZC1ieTogTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVidXJu
LmNvLnVrPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCA3
IC0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IGluZGV4IDRjYzVkZWJkZDExOWIu
LmFmMTgzNzhlNThkOWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMNCj4gQEAgLTE4NSwxMSArMTg1LDYgQEAgc3RhdGljIHZvaWQga2ZkX2RldmljZV9pbmZv
X2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCj4NCj4gICAgICAgICAgICAgICBrZmRfZGV2aWNl
X2luZm9fc2V0X2V2ZW50X2ludGVycnVwdF9jbGFzcyhrZmQpOw0KPg0KPiAtICAgICAgICAgICAg
IC8qIFJhdmVuICovDQo+IC0gICAgICAgICAgICAgaWYgKGdjX3ZlcnNpb24gPT0gSVBfVkVSU0lP
Tig5LCAxLCAwKSB8fA0KPiAtICAgICAgICAgICAgICAgICBnY192ZXJzaW9uID09IElQX1ZFUlNJ
T04oOSwgMiwgMikpDQo+IC0gICAgICAgICAgICAgICAgICAgICBrZmQtPmRldmljZV9pbmZvLm5l
ZWRzX2lvbW11X2RldmljZSA9IHRydWU7DQo+IC0NCj4gICAgICAgICAgICAgICBpZiAoZ2NfdmVy
c2lvbiA8IElQX1ZFUlNJT04oMTEsIDAsIDApKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAv
KiBOYXZpMngrLCBOYXZpMXgrICovDQo+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoZ2NfdmVy
c2lvbiA9PSBJUF9WRVJTSU9OKDEwLCAzLCA2KSkgQEAgLTI4Nyw3DQo+ICsyODIsNiBAQCBzdHJ1
Y3Qga2ZkX2RldiAqa2dkMmtmZF9wcm9iZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4g
Ym9vbCB2ZikNCj4gICAgICAgICAgICAgICAgICAgICAgIGdmeF90YXJnZXRfdmVyc2lvbiA9IDkw
MDAwOw0KPiAgICAgICAgICAgICAgICAgICAgICAgZjJnID0gJmdmeF92OV9rZmQya2dkOw0KPiAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IC0jaWZkZWYgS0ZEX1NVUFBPUlRfSU9NTVVf
VjINCj4gICAgICAgICAgICAgICAvKiBSYXZlbiAqLw0KPiAgICAgICAgICAgICAgIGNhc2UgSVBf
VkVSU0lPTig5LCAxLCAwKToNCj4gICAgICAgICAgICAgICBjYXNlIElQX1ZFUlNJT04oOSwgMiwg
Mik6DQo+IEBAIC0yOTUsNyArMjg5LDYgQEAgc3RydWN0IGtmZF9kZXYgKmtnZDJrZmRfcHJvYmUo
c3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgdmYpDQo+ICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoIXZmKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmcgPSAm
Z2Z4X3Y5X2tmZDJrZ2Q7DQo+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gLSNlbmRp
Zg0KPiAgICAgICAgICAgICAgIC8qIFZlZ2ExMiAqLw0KPiAgICAgICAgICAgICAgIGNhc2UgSVBf
VkVSU0lPTig5LCAyLCAxKToNCj4gICAgICAgICAgICAgICAgICAgICAgIGdmeF90YXJnZXRfdmVy
c2lvbiA9IDkwMDA0Ow0KPiAtLQ0KPiAyLjQwLjENCg0K
