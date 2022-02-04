Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A44A92BF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 04:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40F710E9AD;
	Fri,  4 Feb 2022 03:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D003910E9AD;
 Fri,  4 Feb 2022 03:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWy+rbZ5i/F2kiGK3fXOttErxcHHxue19wEErMQX0ChxTns0RCuOgOSGXSkDAoF8bBFn2HO4vgCGm+jJZiMYjjixGrhyphtkMIw03BWqQAmzmhrWf4qUY6OGu2nZpqyevAtuhwJPHTSEjE1trFVpIPJBLwLy216zKofWQaiQXeHC08KOm6ChquDyEVxhBvlWI4Nkm6WDMP3TULQjfRu1Wby2ldwgd1Rj3TcDyd/498GRmDqnoy4Tdl22jpQCQFU6MDe3f9Ao889+neH80MiSVbTMXk/G1htsOmBedVxIfKuEepwWAq87Xqu4f8mJO6Q5oyWwD83xIElj9c7aHRaQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67ntgrbrNSEmpmXyMdvQCoOgCAZZ5DlvM4YSzPd9j5w=;
 b=V/fQhyLyrPB5fry2yk1HnnsrXWk+mNrahpdzi6adm/qkUyE0IctH8+krqn7HGSwptcSsjXPdxNwprDuxmy6CkAzry3ViK7uQHZ155o75I1tlMQrZhvalTEwxHG7U+HiNHR6ycE1WrvDSw+2mdoMY2QcRw2Jy87A2SOlRDK5P1cIbdzQMiM0Q6k5M7dAKW5I9Hsh691PljeLYC9JlryaVgq15MUZWpuGWavnYbWpW30JaD9LsQw8j7Qfl+e+sF0EkxqGDkV082IY0kVMRc8mLnEsLv+gfcf4EQekFxMqPD4tIfOnbObs3mmh7zhM4LYiK60EpA1NKX4qiMRI+hxGrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67ntgrbrNSEmpmXyMdvQCoOgCAZZ5DlvM4YSzPd9j5w=;
 b=2YBzEOHK5tdsgtUDVucz9Kw0d4HfPscvGQtztdMPjmxt+cSYaIYoH0Otf4cbBEiNAf/zaJfaiTNQqAG/YF2YzUFzRNLtKj4rRHr9pcdNaEfepEZqrjF7t3ODaW1Dp5ZMoLlFVQ1+fM6WMVU2AqrPyofkJudO3X/4YD6ksZFcXb8=
Received: from DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) by
 DM4PR12MB5294.namprd12.prod.outlook.com (2603:10b6:5:39e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Fri, 4 Feb 2022 03:23:06 +0000
Received: from DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::d01b:f78:ca43:12cb]) by DM5PR12MB1531.namprd12.prod.outlook.com
 ([fe80::d01b:f78:ca43:12cb%11]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 03:23:06 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [Patch v5 00/24] CHECKPOINT RESTORE WITH ROCm
Thread-Topic: [Patch v5 00/24] CHECKPOINT RESTORE WITH ROCm
Thread-Index: AQHYGN3DJdivIeYFsE2BAA9u5gQbwayCuw+AgAAAKOA=
Date: Fri, 4 Feb 2022 03:23:05 +0000
Message-ID: <DM5PR12MB15318C2CE710B9FCBF5389B3FE299@DM5PR12MB1531.namprd12.prod.outlook.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
 <03ef2993-5972-c71c-c63f-51bea16cf90e@amd.com>
In-Reply-To: <03ef2993-5972-c71c-c63f-51bea16cf90e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-04T03:22:44Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=1fcaaa4c-721c-4e88-b888-f0e52b5f1ead;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-04T03:23:04Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 3b49f0d0-6c95-415b-904c-e74a65d6789d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ffc9f05-a53d-4462-9741-08d9e78da903
x-ms-traffictypediagnostic: DM4PR12MB5294:EE_
x-microsoft-antispam-prvs: <DM4PR12MB52944E2EFB554E3C6ECC4EC2FE299@DM4PR12MB5294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AGNyzhQ/nE8SO555RKPHbVHTfFzeWA6Z7TlmWJsPXG2j/j9UuWOyKigaGvQ/D6pHcS8QlxAvydDRL2J+UpzHkPhwMb3KQJ28/rSxPQSCfnv4LCSxvBWWgbOhcuYH17OAML5dWGivnKKqM3jK7iykGHLoncD9U5VmGuKorTc2oRiThxfLMYIuh7qfaAIkYXO2HZSGTWjbdPtb2cLWoav/OOBj9m6qkdGF2Hqvnm4FP8d49WfAWmMGsML1BUibMq+6ytb6upQLhenLhQm2hLYLxmfqivmIEkwZ5w4HQR9eFyDKLH/AUi3XhMY/OAInrO8dEskEH8AQTQeBhn02TAOZUXa/vpgtjQfzxcDdODzydwHu75kYbVf9O/swYST8mNY9yPDMTpiCJRXPX24TcHyOKHCxtRowDRPH2trw1bPTE4ld0aOpePa64QnoUO+7VQ0DTMWqlv6ld2TrgkgRVUBCyqKVBuYcfkjapz5zQSe/AEwaV8+iUIuZ06czOm0MT1ZdMZckIvGrLTJdI+gkIk0UIefEJkuxUocDg0EfRLgiO4JgMSYeQ0ztQUJxxu5cTlLUY2cAZmETfPb5V9FArFO4GBS7M3RJfV7a66T7fum/Ez7J18dhmjhgrzUGO8LDJX/worT+QYR7W/lq6YzBM0gKow9rD24O90WCa8z9Gs3giLTzCeI24XNMJrwx+mQ2PMMOGUgB+88MldPrxnI0USdbagCMcm8eTBzSqSfnEczubfCllOLDr8k/pH1LYcZf9qJu/HEzU1g/osiLjTnj4FbKh+NU7BOvwGIIOrcnI9Ukqmg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(316002)(66446008)(450100002)(66476007)(66556008)(8936002)(52536014)(26005)(54906003)(86362001)(4326008)(186003)(64756008)(8676002)(76116006)(66946007)(5660300002)(71200400001)(122000001)(83380400001)(2906002)(55016003)(6506007)(33656002)(9686003)(7696005)(38070700005)(110136005)(53546011)(508600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUg3Rk9MdHFUNVlCMlRTS2J5WDRrZXhTZWR2YmdQZnM0SVFqc2gzdGhPWVhv?=
 =?utf-8?B?Y0xSOXRsVXpZSGhzK0I5VElSYnB6TU8rWHN5aVZGQ3gwK3p3UkZSKzE5OStr?=
 =?utf-8?B?SkxtTFN5SzdMeGxGZHkxSVVmOTltM2hmazhoU1orMEdsbDFOK3NFSFFSRlcz?=
 =?utf-8?B?OFdqN1ZsUnQyVUllYU9MTldvTFdxUXNvbGxFSTg3OU1nZlFVd0NHMHVaRGZ2?=
 =?utf-8?B?aThvZVY4SW8yZEQrRGJFZDRDYmlOQWg4ZDUzOGVUeklnZGQyZ2JuSkpxaTlL?=
 =?utf-8?B?ajkzRjVsVnVFMURhWTFqeGxVS3poNE1WZVFrSUYvQ2dPQmpCa20zeWkrTUc4?=
 =?utf-8?B?ZjFvMHFqRGR3ZUlFQzVkYlZjZVdiVzU3VUVpRElkQlFjeHhpN0VSME1RQnMr?=
 =?utf-8?B?UDBhd1J0Y0xOZDRDclZuVGxGdzFYTEt4RndGRmtkcGxVYVZITWFWN0FtNFhu?=
 =?utf-8?B?UUozVUY4VzFrTVRCSDFxR3NoRVhselo4cTUvOTFRbXVKQUlXMzFMVUw4VEtS?=
 =?utf-8?B?Mk1qTi9uRkt1WWNPVFNJT1N4UlFmenJ6Tjk2dWtwd0NIOUNIVTlodWdHbDB4?=
 =?utf-8?B?MXl2SlphMnBMb0tveVdOTS9LVThaM2hBTUE4OW10bnZJQjJXc1FkdS9ZV21Z?=
 =?utf-8?B?enpLRGR4MG1uNXl3Znk2b3YzL2MvL2U0T1RPYzNCRHpmbnJ2eGJxK2pEZitm?=
 =?utf-8?B?VnRYWjRNSTZUVDg4d3l1aGlRVkdYbitYY3g0aG83d20yRDRGUGNqZjhVY3Y1?=
 =?utf-8?B?aVQzRlVNcUJCQkdNSXVtK0ViaDJURzlSaWduY0RlalZ4ZDdWRklYTTJoYjZC?=
 =?utf-8?B?ME9pMUdmczhUamkzcVNSRXBkbm5Rc1ZtR3FFaytZL2I4YmQxT2d5UzVTbG80?=
 =?utf-8?B?bWNSK3gyRHRMUDZWRnF2dmNsbXlLVmVrcUR4VzYrb0JpYld0OGxrVEJOK2Jl?=
 =?utf-8?B?TWlrdVp0Q2xFWk9yTVJpY01EeW5VQ2o1dVhkem5GQTRTdVYrYzJ4MVdnckYv?=
 =?utf-8?B?SEk3R3lzYVVST3QrQmt2SGJOTEhFTVB4OW56MCszbjJSS05TWi9Cc1VlR2x1?=
 =?utf-8?B?ck44Vko5V0N0QldVUy9QYTQ3UDJudkd4R3RIcHh4aURWVUFnRzBYcWNpNjUr?=
 =?utf-8?B?dUVkcEQxQTFEUDUvTXV1aUhnZWY5WXZMQTFlWmxjWjR0WHUvMFF4ell0a1Ex?=
 =?utf-8?B?UjhsZ1BYaDJFeWx2YzZLaE9LeUNZZ1BZYWFMTHNSR3RqajgvK0RsTXRjSDhR?=
 =?utf-8?B?bVFVTWp2YzZuRks5QUJEeURsMnZSWUI2eGYrcjFaMEMza2Q1NGFHVitsMXZi?=
 =?utf-8?B?OTExWXNrbXFNTDViKzZqK1JUUjhBUURzZW1wdDJjU2pDdGxIT3YrOVdQaTdB?=
 =?utf-8?B?aGdtYUM0akNJczBSRU5yTlRLTFUrOUhYMERESGFTSW9rZzA3K2pWekZXMTRo?=
 =?utf-8?B?OWQwNS84NXRqRGlvR2k1OUJIY2pFV05tbVZEMGtsVWg0aE4wRmV3eGduOTln?=
 =?utf-8?B?TXdLb2V6Y3FVdWNMaUEvSWJXR0lOUm1pQVp0Tnh2UlJCU0pUbTVCQktZemRF?=
 =?utf-8?B?SDVWOW05UUdMcy9VKzduNy9QR2V0VkJ2UlQxOEUzbkJDcjg4SEdpK0dZTVpT?=
 =?utf-8?B?S3dYZHJwejZjNTlMTGxhMFVUUEpxWWN3NVNLOFRsdWtCeURaeVRpM01OVGda?=
 =?utf-8?B?R1A5c1ljamQ3NEpYOFlSUkFtQUxzOGN0NzlXUHVwQ1lFd1J4YUdiaDdDRnZ2?=
 =?utf-8?B?NFNSNkNPdWFlZ0lsYW15Z3RXNGc0SXUreHU5d1phR3I4TVRmMy9RSXhCR2N0?=
 =?utf-8?B?U3pGdHhwa0xmN3YvUE1kMzBHUU5WWEw2TWZGRmR5TU1ycG1qUVljbEVxOXVO?=
 =?utf-8?B?RTU4Y212QUgxNnJmM0JSMXprZVVaOHF3ZzY4UUltZnorNSt3VU1yVHRTb3Iz?=
 =?utf-8?B?d1JzeDNJWnJCQ0RCSkEyM3JTZUZLbzRXRUpGL1RDNk9rMkp3UTh4amcwNExN?=
 =?utf-8?B?K2xQeVcxTVFZS1JrKzMxRlRIeGprSmxnamFCWGkxc2p6bFc2M3RvK2srY0tL?=
 =?utf-8?B?UzZBUTBsMmo3YlRVNEpUUmpNT1NDQ3ZYOTlyKzVLa1ZCMzZNenFITExRZkZI?=
 =?utf-8?B?MmlRRTVQRnptYkVQeHpIeTFWRjhzY21PZmxSR25nSEtKdmlES2VJVHJ2Mmxl?=
 =?utf-8?Q?tR7BlKycddaj+hSJEOIAOPk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffc9f05-a53d-4462-9741-08d9e78da903
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 03:23:06.0219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 494N9pGo2LNXygBby6f3KvvR7SpCvdvudlCNpX52CI+IRKm4gL6rjU6NBcUKsWv2zhmB+YE5JOq59ibjICM8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yat Sin,
 David" <David.YatSin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KVGhhbmsgeW91IEZlbGl4IGZvciB0aGUgcmV2aWV3
IGFuZCB5b3VyIGd1aWRhbmNlLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
S3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPiANClNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAzLCAyMDIyIDEwOjIyIFBNDQpUbzogQmhhcmR3YWosIFJham5lZXNoIDxSYWpu
ZWVzaC5CaGFyZHdhakBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBZYXQgU2luLCBEYXZpZCA8RGF2aWQuWWF0U2luQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BhdGNoIHY1IDAwLzI0XSBDSEVDS1BPSU5UIFJFU1RPUkUg
V0lUSCBST0NtDQoNClRoZSBzZXJpZXMgaXMNCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQoNCkFtIDIwMjItMDItMDMgdW0gMDQ6MDggc2No
cmllYiBSYWpuZWVzaCBCaGFyZHdhajoNCj4gVjU6IFByb3Bvc2VkIElPQ1RMIEFQSXMgZm9yIENS
SVUgd2l0aCBjb25zb2xpZGF0ZWQgZmVlZGJhY2sNCj4NCj4gQ1JJVSBpcyBhIHVzZXIgc3BhY2Ug
dG9vbCB3aGljaCBpcyB2ZXJ5IHBvcHVsYXIgZm9yIGNvbnRhaW5lciBsaXZlIA0KPiBtaWdyYXRp
b24gaW4gZGF0YWNlbnRyZXMuIEl0IGNhbiBjaGVja3BvaW50IGEgcnVubmluZyBhcHBsaWNhdGlv
biwgDQo+IHNhdmUgaXRzIGNvbXBsZXRlIHN0YXRlLCBtZW1vcnkgY29udGVudHMgYW5kIGFsbCBz
eXN0ZW0gcmVzb3VyY2VzIHRvIA0KPiBpbWFnZXMgb24gZGlzayB3aGljaCBjYW4gYmUgbWlncmF0
ZWQgdG8gYW5vdGhlciBtIGFjaGluZSBhbmQgcmVzdG9yZWQgbGF0ZXIuDQo+IE1vcmUgaW5mb3Jt
YXRpb24gb24gQ1JJVSBjYW4gYmUgZm91bmQgYXQgaHR0cHM6Ly9jcml1Lm9yZy9NYWluX1BhZ2UN
Cj4NCj4gQ1JJVSBjdXJyZW50bHkgZG9lcyBub3Qgc3VwcG9ydCBDaGVja3BvaW50IC8gUmVzdG9y
ZSB3aXRoIGFwcGxpY2F0aW9ucyANCj4gdGhhdCBoYXZlIGRldmljZXMgZmlsZXMgb3BlbiBzbyBp
dCBjYW5ub3QgcGVyZm9ybSBjaGVja3BvaW50IGFuZCANCj4gcmVzdG9yZSBvbiBHUFUgZGV2aWNl
cyB3aGljaCBhcmUgdmVyeSBjb21wbGV4IGFuZCBoYXZlIHRoZWlyIG93biBWUkFNIA0KPiBtYW5h
Z2VkIHByaXZhdGVseS4gQ1JJVSwgaG93ZXZlciBjYW4gc3VwcG9ydCBleHRlcm5hbCBkZXZpY2Vz
IGJ5IHVzaW5nIA0KPiBhIHBsdWdpbiBhcmNoaXRlY3R1cmUuIFdlIGZlZWwgdGhhdCB3ZSBhcmUg
Z2V0dGluZyBjbG9zZSB0byBmaW5hbGl6aW5nIA0KPiBvdXIgSU9DVEwgQVBJcyB3aGljaCB3ZXJl
IGFnYWluIGNoYW5nZWQgc2luY2UgVjMgZm9yIGFuIGltcHJvdmVkIG1vZHVsYXIgZGVzaWduLg0K
Pg0KPiBPdXIgY2hhbmdlcyB0byBDUklVIHVzZXIgc3BhY2UgIGFyZSBjYW4gYmUgb2J0YWluZWQg
ZnJvbSBoZXJlOg0KPiBodHRwczovL2dpdGh1Yi5jb20vUmFkZW9uT3BlbkNvbXB1dGUvY3JpdS90
cmVlL2FtZGdwdV9yZmMtMjExMjIyDQo+DQo+IFdlIGhhdmUgdGVzdGVkIHRoZSBmb2xsb3dpbmcg
c2NlbmFyaW9zOg0KPiAgIC0gQ2hlY2twb2ludCAvIFJlc3RvcmUgb2YgYSBQeXRvcmNoIChCRVJU
KSB3b3JrbG9hZA0KPiAgIC0ga2ZkdGVzdHMgd2l0aCBxdWV1ZXMgYW5kIGV2ZW50cw0KPiAgIC0g
R2Z4OSBhbmQgR2Z4MTAgYmFzZWQgbXVsdGkgR1BVIHRlc3Qgc3lzdGVtcw0KPiAgIC0gT24gYmFy
ZW1ldGFsIGFuZCBpbnNpZGUgYSBkb2NrZXIgY29udGFpbmVyDQo+ICAgLSBSZXN0b3Jpbmcgb24g
YSBkaWZmZXJlbnQgc3lzdGVtDQo+DQo+IFYxOiBJbml0aWFsDQo+IFYyOiBBZGRyZXNzZWQgcmV2
aWV3IGNvbW1lbnRzDQo+IFYzOiBSZWJhc2VkIG9uIGxhdGVzdCBhbWQtc3RhZ2luZy1kcm0tbmV4
dCAoNS4xNSBiYXNlZCkNCj4gdjQ6IE5ldyBBUEkgZGVzaWduIGFuZCBiYXNpYyBzdXBwb3J0IGZv
ciBTVk0sIGhvd2V2ZXIgdGhlcmUgaXMgYW4gDQo+IG91dHN0YW5kaW5nIGlzc3VlIHdpdGggU1ZN
IHJlc3RvcmUgd2hpY2ggaXMgY3VycmVudGx5IHVuZGVyIGRlYnVnIGFuZCANCj4gaG9wZWZ1bGx5
IHRoYXQgd29uJ3QgaW1wYWN0IHRoZSBpb2N0bCBBUElzIGFzIFNWTXMgYXJlIHRyZWF0ZWQgYXMg
DQo+IHByaXZhdGUgZGF0YSBoaWRkZW4gZnJvbSB1c2VyIHNwYWNlIGxpa2UgcXVldWVzIGFuZCBl
dmVudHMgd2l0aCB0aGUgDQo+IG5ldyBhcHByb2NoLg0KPiBWNTogRml4IHRoZSBTVk0gcmVsYXRl
ZCBpc3N1ZXMgYW5kIGZpbmFsaXplIHRoZSBBUElzLg0KPg0KPiBEYXZpZCBZYXQgU2luICg5KToN
Cj4gICAgZHJtL2FtZGtmZDogQ1JJVSBJbXBsZW1lbnQgS0ZEIHVucGF1c2Ugb3BlcmF0aW9uDQo+
ICAgIGRybS9hbWRrZmQ6IENSSVUgYWRkIHF1ZXVlcyBzdXBwb3J0DQo+ICAgIGRybS9hbWRrZmQ6
IENSSVUgcmVzdG9yZSBxdWV1ZSBpZHMNCj4gICAgZHJtL2FtZGtmZDogQ1JJVSByZXN0b3JlIHNk
bWEgaWQgZm9yIHF1ZXVlcw0KPiAgICBkcm0vYW1ka2ZkOiBDUklVIHJlc3RvcmUgcXVldWUgZG9v
cmJlbGwgaWQNCj4gICAgZHJtL2FtZGtmZDogQ1JJVSBjaGVja3BvaW50IGFuZCByZXN0b3JlIHF1
ZXVlIG1xZHMNCj4gICAgZHJtL2FtZGtmZDogQ1JJVSBjaGVja3BvaW50IGFuZCByZXN0b3JlIHF1
ZXVlIGNvbnRyb2wgc3RhY2sNCj4gICAgZHJtL2FtZGtmZDogQ1JJVSBjaGVja3BvaW50IGFuZCBy
ZXN0b3JlIGV2ZW50cw0KPiAgICBkcm0vYW1ka2ZkOiBDUklVIGltcGxlbWVudCBncHVfaWQgcmVt
YXBwaW5nDQo+DQo+IFJham5lZXNoIEJoYXJkd2FqICgxNSk6DQo+ICAgIHg4Ni9jb25maWdzOiBD
UklVIHVwZGF0ZSBkZWJ1ZyByb2NrIGRlZmNvbmZpZw0KPiAgICBkcm0vYW1ka2ZkOiBDUklVIElu
dHJvZHVjZSBDaGVja3BvaW50LVJlc3RvcmUgQVBJcw0KPiAgICBkcm0vYW1ka2ZkOiBDUklVIElt
cGxlbWVudCBLRkQgcHJvY2Vzc19pbmZvIGlvY3RsDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgSW1w
bGVtZW50IEtGRCBjaGVja3BvaW50IGlvY3RsDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgSW1wbGVt
ZW50IEtGRCByZXN0b3JlIGlvY3RsDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgSW1wbGVtZW50IEtG
RCByZXN1bWUgaW9jdGwNCj4gICAgZHJtL2FtZGtmZDogQ1JJVSBleHBvcnQgQk9zIGFzIHByaW1l
IGRtYWJ1ZiBvYmplY3RzDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgY2hlY2twb2ludCBhbmQgcmVz
dG9yZSB4bmFjayBtb2RlDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgYWxsb3cgZXh0ZXJuYWwgbW0g
Zm9yIHN2bSByYW5nZXMNCj4gICAgZHJtL2FtZGtmZDogdXNlIHVzZXJfZ3B1X2lkIGZvciBzdm0g
cmFuZ2VzDQo+ICAgIGRybS9hbWRrZmQ6IENSSVUgRGlzY292ZXIgc3ZtIHJhbmdlcw0KPiAgICBk
cm0vYW1ka2ZkOiBDUklVIFNhdmUgU2hhcmVkIFZpcnR1YWwgTWVtb3J5IHJhbmdlcw0KPiAgICBk
cm0vYW1ka2ZkOiBDUklVIHByZXBhcmUgZm9yIHN2bSByZXN1bWUNCj4gICAgZHJtL2FtZGtmZDog
Q1JJVSByZXN1bWUgc2hhcmVkIHZpcnR1YWwgbWVtb3J5IHJhbmdlcw0KPiAgICBkcm0vYW1ka2Zk
OiBCdW1wIHVwIEtGRCBBUEkgdmVyc2lvbiBmb3IgQ1JJVQ0KPg0KPiAgIGFyY2gveDg2L2NvbmZp
Z3Mvcm9jay1kYmdfZGVmY29uZmlnICAgICAgICAgICB8ICAgNTMgKy0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggICAgfCAgICA3ICstDQo+ICAgLi4uL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgICA2NCArLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgICB8ICAgMjAgKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCAgICAgICB8ICAgIDIgKw0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8IDE0NzEg
KysrKysrKysrKysrKystLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGJn
ZGV2LmMgICAgICAgfCAgICAyICstDQo+ICAgLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIHwgIDE4NSArKy0NCj4gICAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmggfCAgIDE2ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2V2ZW50cy5jICAgICAgIHwgIDMxMyArKystDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyLmggIHwgICAxNCArDQo+ICAgLi4uL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfY2lrLmMgIHwgICA3NSArDQo+ICAgLi4uL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgIHwgICA3NyArDQo+ICAgLi4uL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYyAgIHwgICA5MiArKw0KPiAgIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3ZpLmMgICB8ICAgODQgKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICB8ICAxNjAgKy0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jICAgICAgfCAgIDcy
ICstDQo+ICAgLi4uL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jICAgIHwg
IDM3MiArKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYyAgICAg
ICAgICB8ICAzMzEgKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0u
aCAgICAgICAgICB8ICAgMzkgKw0KPiAgIGluY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaCAg
ICAgICAgICAgICAgICB8ICAgODQgKy0NCj4gICAyMSBmaWxlcyBjaGFuZ2VkLCAzMTkzIGluc2Vy
dGlvbnMoKyksIDM0MCBkZWxldGlvbnMoLSkNCj4NCg==
