Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773D7845D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1268710E396;
	Tue, 22 Aug 2023 15:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D1210E395;
 Tue, 22 Aug 2023 15:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8RrUCrYDSnmtIWZvFlR35EIlaJsCidjF6favvqAlDmdwhoLaPcfwKXoyF2QmMLaNdgAXK84oEYFodnP0fsJV1r4DdTNznZ1hYfjtdx6etO2glZj1nVckPap/syIU/3EmViIkej8fTgofedxgYDU9to9BiCaiPJrJrw/BAn+NZzyb091RXoEU9s0pdOuaniH68mURy6Yudfwd9p89VYQb85QZZaBhECQ3ROYRQ6xh140jBxgPbm59eQtF4aNCFX9finL8jtelEyS2x+gAdwgbjwmu8TYGV9BB2MAXCqrx1qFqy/YGuZv1arbMqbu62TinuiQDo7tYGwosLgoctnVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saORQhS+b3UKdg5e5Vu1OKDsBlb9lvp9l3B8NvxPAp8=;
 b=BA6PEpl2o9MNr/IU1eY8ooaxFTMawYRHbrshJu4blp1vsgK0MchCKmsJzQIzSy8L07jDYBJsXm0VtPxlBIO6Pgsvtn0EtSbnWI99jmnlqG0n3eaTcigLQqcIa1bdUjkGV5h74eURmg1HZNOn5vYe6s58dRJlaRNawB0bgA+0UURmUE+ANCfXrePB6/Qr+ZKVLjbSmwIknTkXDChDltY720t4OsCTvziEfnKnVoCRzqXDV1iwabs2KVfU0aBASV5qi+AnIPec/Ih58YENmwgHqTWG0iRr6cL991kzzQs9wD6itZTXdmV//oE7RnJRKSuw5X5OZD3r/SPDrlH1SamxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saORQhS+b3UKdg5e5Vu1OKDsBlb9lvp9l3B8NvxPAp8=;
 b=sNTipXBmh2iRim8KY35wstQfjzPYuMs9otMDYIGzCi6EbJkmEZDOD1olicZWOeDfT2N/Lvpp4PdlwefgavD7bgHHiFTimlfQovpm8TmKky5BzA+TwYDtx3Zb3HV3qxH/M4M6Qm541R/sd8tnqTIP16iOtHWsVDVtTELzP6s4lHs=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:17 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.4 09/11] drm/amdkfd: ignore crat by default
Thread-Topic: [PATCH AUTOSEL 6.4 09/11] drm/amdkfd: ignore crat by default
Thread-Index: AQHZ1OzlyLnQ/MuhJE22DciruK0gi6/2c9wg
Date: Tue, 22 Aug 2023 15:41:17 +0000
Message-ID: <BN9PR12MB5146FBE3E3940F3AB59EA79DF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113553.3551206-1-sashal@kernel.org>
 <20230822113553.3551206-9-sashal@kernel.org>
In-Reply-To: <20230822113553.3551206-9-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=466e91d8-62ef-4f1a-8f67-29723289d0ae;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:39:42Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 4b077ae6-c1d9-4870-8d7a-08dba3263995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 50GHkmkHz/QP7VQZBFwz4vNi1inzwY4AmKnHCrmtqXY3b9YDQf5qu1yt+CDd4G5fp9FldTF/tQew0VSht6juOwkhmuGVOj6nqjpm2/nncykk+GY/zT/baP+/nKhc2RBhw9GSc813M0dlbhxTl1tSHFXpIgAJjNADMzSJZpGXdvG89GXpaV3QOQsWQ7gYppqnRcBD0niP+74TJsvlOadOTej/yYhboufYrQBmr4ThfbCmQnHLLykC/vd4DLnvvk7aFGuzPU/7gTxqEGvUVvH7cULZWpEx89GGP7prL7F63/B+YtsFknuqiuE7G0WGA7zWNV9u/9eWlegvjs4SwRI/R6ERaXvp0qVSDsNCbrX3HbaSltxi+4x0i5kqFwWjdBR5PrxSQheHGlTyeFb0q7VoyV/v1xZeXeoBtD6n1Ac/tqSgKF5BiYihwLG4EM1yYDvt7VHcQ0uh2qUFBYgeim6W5812a44kivIYsXSwN4L7zVrFhHLLLYuLCiuO+Z52joLPfCUyVvQkmaJWWFP5hn5Qe8TChCEPQzsral89LJ5FwZR1cLadOi6T2zy3G9uDJlOvCkqKTpAuaXxt4wpEHR/Tosa7aPPGgCCF37TejYDgl7IGM9pbAGxi1cCM7exk56KW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy95ODBkVW5ubVJpclJHdGVJRWZxQlN6b0xFaTRRc2NPWTl5TTlxQlZVamFx?=
 =?utf-8?B?dkx6SStITjQ2d3V3Nm9WM2ZiRm1wZ0xzeEpUenY4NnRzQ3JXL245SnhNeVR4?=
 =?utf-8?B?OWxlSzdUN0tONkdaVkNqRkxQQ1FrQzB2VUJRMEh3LzQ3QVlJMUFjN2c5QUJw?=
 =?utf-8?B?SVo1bENQcHpPNUlXRzZEY1pEWXZNbDdIbEFoQXgzZFJRWEprSEdaOWJobXpm?=
 =?utf-8?B?Q0w0Nk8yRmJ1VDJUUTZjelZ0QWVBRktpZ001aUFicnBFcU9oMnhoS25ETCtH?=
 =?utf-8?B?NWVvUTZJYWptUENRRkNkZVNLdWcwMkFnOVMvMzBKdjYwNlFXUDhXMUhiSGpN?=
 =?utf-8?B?c2FjTHBjTnFJeTdtRExQeE52Q1RCbzRmdlg0Sk5ldlFPUUxRZUx3eGhjaHJK?=
 =?utf-8?B?YW9HN3Erc0ZrVWoybTJBMWxVdVJRVmlDbkEwdnhzdDRXelB5K2I0M3dpa28y?=
 =?utf-8?B?S29YMWZ4THM5cnMyS1UzRThOR29icE80NlMxRUhJQ05McGN6K2FVNlBLRFFD?=
 =?utf-8?B?L0hMREJ0citYeEhpSFpLUFpXK3F2eG5obTUvWmg1cS9zazExUnZwMys3K3J2?=
 =?utf-8?B?MFB3M20zeGFmVmZPTXBzK204QkErbnhLNVZlNUNOU3RqYUQ3Z2JCaWtLa0Rk?=
 =?utf-8?B?UTlTL1NseUVtSEdzMVNRT0xvamZOcUpjQVlHY2VBL1lGbXJQV29oL0hqVDNm?=
 =?utf-8?B?RllvVVB6RmptSm1BTDlIU3o3eVVNSVZ2NzVYWEZ5OE9rRXd6VVc1UlY3TTNl?=
 =?utf-8?B?dkNyR2JuOXltdEpsV0trZm1Oa1lCbTNLYmtQeW12SkkxZi9CRHJoV3hDL2Rj?=
 =?utf-8?B?djJaVCtNaWxaNExvQy94OGc0Y2JMSmcrU0Ewd2NETkNjOFE0dVM3eU1YZnhr?=
 =?utf-8?B?T0VnbndFdVc3SjFaUFkxM2xnaUM5UXZoWWVwdUExMlRHZnhQcDYxbXA3YUdF?=
 =?utf-8?B?ZGtxVjNlb1F1Vm1Sc2NGRURlRXJxTGlIZDdrUVVObWdTdUFzWUROQ1hDZkRx?=
 =?utf-8?B?a0xybTQ3ZFUzaVZaU3NiMHZTTXIwRGJmRlc4TFdNSFEvMGtqbUtYMzFVOC81?=
 =?utf-8?B?NW9SUzdJL1Bteks2eGxIcFNoKzE2TGRNTW1QV0w0VmxYU1JMQmN1aU5pY2U4?=
 =?utf-8?B?bUxlMW1mZVlkcGFoc0RnakdxQTJxRzIyU05OSkZleTBuTXVFd0ZFTWxVS2N2?=
 =?utf-8?B?QTJKWUdnUEY2TnI4U3F0dGw3cGhLZ2gwc1hDYVVrT0pNaURMS0ttMFR1NjVG?=
 =?utf-8?B?ajFJeUxqQVhXR2xDUDlaaCtxOU5WUGNxQllSZ1JnSTByS3hCRC9aUTJ3MlVh?=
 =?utf-8?B?YlpIYlRxYVlLRnRuTnUwVU4wOHBSd2VrUFNjWFJBaGxLWXRXR05hK1pGSE1m?=
 =?utf-8?B?dnZOdzduTUxyRFhDRlo2MmdxRE1PakFnd3lmK2tKSThWQVJCbzlsMWRoMWRE?=
 =?utf-8?B?bE1HT0pQS1BWeFlwL1owK3ZJbjVaZCtyeCt3VytrUG9RN1kyYXdtcDJRb1Vt?=
 =?utf-8?B?WGVFS1p4STgvbWIwZ3E0cE52MkVXejA5Y0Z1VFU2NXVUQlR1NGFza0RQWVdZ?=
 =?utf-8?B?TkxSNzFBZVpLUGZ0R08xWDlIZGpDWHdLc0JwWENtS3JRY1hoYnhrMi9sb3Vp?=
 =?utf-8?B?bWl2eWhxUS9SZk1oNHVaOCtxLzRaWTJWSUFaeittMjNlcDhqeWtUd3lFQ1dy?=
 =?utf-8?B?b2h3SG1ycDZvakQ5aTN4dGZGR1ZXYkUzZmJrdjVBN1N3MnhIWm4zRkxiZy9V?=
 =?utf-8?B?djBLOVdtWmQ5aTNHYjBwcWxrb0tDeStEaHR3aXcwWUk5bndhcWRqaTFvVTJW?=
 =?utf-8?B?YUQrbWg0SDJSbmNMUDRVRjNqOHRrSXloYmppTTdGT1k3VGtMR3ZWcEZiZElv?=
 =?utf-8?B?cW41QlJ2QWZyZi9uOUtSOVdYYlN3TGlSbnpIRGFzY25JVHFUMnRwNVdaUVZn?=
 =?utf-8?B?bFJIaWFNVlZtNnVWajFmbkN0WEkxeXJ0SjJFbDdSTzN6MVJiRTFBbDR2ZmFw?=
 =?utf-8?B?eWYvMHRqL3hsZVJwQVRlMExqa2x3MSt6TmtYdHMxRFF2VlhqU0RvOC9IYjZ1?=
 =?utf-8?B?SC8yYW1jcVo2bGRrdWRjeUxRYkIwcGZrWHRRQzRjaXZjNHRjUEc1QjBva3BM?=
 =?utf-8?Q?1Hqo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b077ae6-c1d9-4870-8d7a-08dba3263995
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:17.2856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCYEo6rxMIqOqQ5wIbdIeLvDbceev847hSXVn+xcQeTgtLf/ZGUwzuzNS/eEH41pI3RCdCcXbultogz1CtcnKA==
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
LjQgMDkvMTFdIGRybS9hbWRrZmQ6IGlnbm9yZSBjcmF0IGJ5IGRlZmF1bHQNCj4NCj4gRnJvbTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPg0KPiBbIFVwc3RyZWFt
IGNvbW1pdCBhNmRlYTJkNjRmZjkyODUxZTY4Y2Q0ZTIwYTM1ZjY1MzQyODZlMDE2IF0NCj4NCj4g
V2UgYXJlIGRyb3BwaW5nIHRoZSBJT01NVXYyIHBhdGgsIHNvIG5vIG5lZWQgdG8gZW5hYmxlIHRo
aXMuDQo+IEl0J3Mgb2Z0ZW4gYnVnZ3kgb24gY29uc3VtZXIgcGxhdGZvcm1zIGFueXdheS4NCj4N
Cg0KVGhpcyBpcyBub3QgbmVlZGVkIGZvciBzdGFibGUuDQoNCkFsZXgNCg0KDQo+IFJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gVGVzdGVkLWJ5
OiBNaWtlIExvdGhpYW4gPG1pa2VAZmlyZWJ1cm4uY28udWs+DQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NyYXQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMNCj4g
aW5kZXggNDc1ZTQ3MDI3MzU0MC4uZWUwY2MzNWQ2OGE4NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfY3JhdC5jDQo+IEBAIC0xNTQzLDExICsxNTQzLDcgQEAgc3RhdGljIGJv
b2wga2ZkX2lnbm9yZV9jcmF0KHZvaWQpDQo+ICAgICAgIGlmIChpZ25vcmVfY3JhdCkNCj4gICAg
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4NCj4gLSNpZm5kZWYgS0ZEX1NVUFBPUlRfSU9NTVVf
VjINCj4gICAgICAgcmV0ID0gdHJ1ZTsNCj4gLSNlbHNlDQo+IC0gICAgIHJldCA9IGZhbHNlOw0K
PiAtI2VuZGlmDQo+DQo+ICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+IC0tDQo+IDIuNDAuMQ0K
DQo=
