Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85E7845C0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4910E069;
	Tue, 22 Aug 2023 15:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AEF10E069;
 Tue, 22 Aug 2023 15:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma4jVaDf6gUolvzhGUCen9Znmq1HbUj92YdonQy2lH/lJvFc3e++v5ONMDQ6aA0iuEBPDP4kAfZ1576AYRd7PFNtfhbXmtsUmrzJcfYnqsll1PZ17Z/gECVHTOZ0MTVHAyXwqhQFGk0na8Vtt+qFzEw6RMaYtBpcKlBiNetT4kNEoKXyBJpZKsJ7NL8+buIpTyy5e8zXyp/kD/kiW+q+FGhmFkMwewUeE1cFCa4bT/GGV+CVt/heFjqmQ9IJiSIf9eSkznXf9mHHeQ5WnOrALzxKhW2SDc7grmTRpGt+8IK4YZDvC8qGVfqKjP1tH308Qg49TzZXsRVqAYzrguaQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/NW/n5hrhuhqXjmsYPNtc8fYDZKiUwOQ3qh7fJ7Ey0=;
 b=fG/1VAakmQG5KxBkzgWmLMcOfyeZJglRs1rHpLyQkoVzZDKiNCosPN8si/VOzykvy80tA6jKzKjyKQ2ypenkK5uMhvownoekFRNNjoW6EBO/DNTsd/80nqrFGth+4TvjTule8m36N8MKqCc7w06XTN4A+nxeVXxoOFJOSdCVirJZIJfJsu3qLwf3cVvMOlhAAap7zdf8WdJY6xn2lq03/YJ3K0fS91ShHjW03RCemrzDdRfyZf8iH3ghz381vdg7WFaLB2TymzbsGlic9PZl8bpE/sWisQLi5RNorlqO6v2T/4F5+yiRfWBA1vSt4S7YIl7l2gYNChtAZOWWQkT/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/NW/n5hrhuhqXjmsYPNtc8fYDZKiUwOQ3qh7fJ7Ey0=;
 b=r5YIDBBjfQwfpdtm6xtS2rcikSMqHPkmUr6Ka65NeZQfEGjaG80OQeOzwSos/uD1l2ciGB6NkpMJVmHjr1GSSmmmUp7dEg9IwZg0Gfw7AXa+QN56aqjlVW1cONTPDEPKCbnRTo5HCnCPpkUYewXm+77kMBWU6FUqnBlEbSZmWlk=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:39:11 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:39:11 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.4 10/11] drm/amdkfd: disable IOMMUv2 support for
 KV/CZ
Thread-Topic: [PATCH AUTOSEL 6.4 10/11] drm/amdkfd: disable IOMMUv2 support
 for KV/CZ
Thread-Index: AQHZ1OzkBqBYp37PZki+0JvPTSnzYK/2c5QA
Date: Tue, 22 Aug 2023 15:39:11 +0000
Message-ID: <BN9PR12MB5146C9B54B9D21CFA0751890F71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113553.3551206-1-sashal@kernel.org>
 <20230822113553.3551206-10-sashal@kernel.org>
In-Reply-To: <20230822113553.3551206-10-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=97341a3c-6c86-4298-acba-5fcc951cdc3a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:38:43Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|PH7PR12MB9075:EE_
x-ms-office365-filtering-correlation-id: ca4f8b36-196d-40c5-6b19-08dba325ee6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OP+MwBBcUPQc2Mt4dytPaP6R/aloAOrY/tRBNP1uDNZOwJAUmp+XVNHyCk69TCdO/6tA0wIo7m7605if89XFOmh1XmubK/L2+gUvs9gjCKZ1qHMB7yxFax8ZP4O5tcmBK5zMtA7q4K7GM4pvpDLIkqdnnA0eryGZd8l5ArKcZnSTCXgfkTl0HO1VuxXxdGI8KhpdkVH91qq2KH4FsMviQt8/r7v1AgW3UBHzhnZl4bOi4D2I0dCrQLZtSVPd/vaUXzE/HX/1+OOVAaAwlcHsP4rZnxA4hc/hhfvrE9WpMxj5Hmnw2AuVJwQhLEfYGgF3KfWKKw67UpyzA7ifecyphHFyPOLznOYOzZya3kI6GBldXDHucMORBALj9iwTi3Jy+2NJLhq0XyosS67JmFnRD7ELXt9p4eDFVgQKG6RSqI1acBi6L2kD/1aVDOZnof3+unOOL6pe1RxFcALmREk1s+3KCqZFZULcVrscaFuRlDfFQ8SLdczVKZxq5FnXYHsnH2ylQFOR2xmSjScPi1af7N29hvzo0fz9n+Xf5rf46J0oHE/I3p3Lxa0a673AEjScjqYdR91ZYGzpNYoIAA5GPgcjbtUL1kkX5+l/OMQJ8SUvt/X6sLcZ4Y7qBWOEaVIn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66446008)(54906003)(66556008)(66946007)(64756008)(9686003)(66476007)(76116006)(316002)(110136005)(8936002)(8676002)(4326008)(41300700001)(122000001)(478600001)(71200400001)(55016003)(7696005)(6506007)(53546011)(38100700002)(66574015)(2906002)(83380400001)(86362001)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWtsb0dKMnd1bklWZnJVZHE3T1ZhRzZpaEx3VXMxQVhCdDFrdGtzM01RZENs?=
 =?utf-8?B?Nk01T2J1c3ZrdkVBc3QrNnM0b0Y4aVNaM2hDSjVzbTVIZytLcDZYZ1NaejV5?=
 =?utf-8?B?SnNsTE1sS1Bldk5NYVZ1WlA4T0l5OE1Rc2o2TDlndXhUVkpYbnFXK0pIamRP?=
 =?utf-8?B?RXVCRGRHZVU4clFHVzVUV2tDbUtrbnZxclpqK2dmYmJBMXZPdnVoNjZuYTlx?=
 =?utf-8?B?ZG1oM0lwOXAxcWNTcjVqUGpnSHdzQk5hK0Fmay8yUng5bysyWXR2cmMvLzgy?=
 =?utf-8?B?WFhUeHhtT3N2WVoxVEJtVUtERVVXc1M5TmxNZVVGUzE2Uy8vVTFBYTdmRitk?=
 =?utf-8?B?WkM0emFkSjA1blQxVkxDbEFMQ0JJT1NGS3pjV0ZYR1pxTHptQ3QySytSUUtI?=
 =?utf-8?B?OWNrbksraDZoRVVKQVdnd3ljWDRmVmdZWm8xS1FMMDgwQ3hreWR1emtvc2dG?=
 =?utf-8?B?eFVZamxGR3Zoc2ZiMkYvTTdrT2tXZ3hvU1Q0Vm5RV2loemdYZW9Eekp1SkJJ?=
 =?utf-8?B?enRLa0poVkpUc2ZFNG5ZYXBydmtXdDBoN3FZdXVxRUdINFg0R0l1Mm9NYnc3?=
 =?utf-8?B?a2RrOHBYSThMcmZQN2ZtYWhQWnJvNEJvc2YxS0hNTVhhK3hnVFd0TjM1dHhW?=
 =?utf-8?B?VnJnUXpsbGIvQmU0ZTRTVnFGdGhvajA3dVcrNWJYTDFCT1pLR1oxQkdtUmcr?=
 =?utf-8?B?Q2JBTlp4V2xCaDFkZ01wNFQ4cWdKVGoxaDJyMDNFZzMrZDVEcVo4cEdEbWRj?=
 =?utf-8?B?dkxPYlRLQit6dzRlR3NZOUVjenRLN0ZrTWhpRE9KUWVzSnlicDdDbC93WTZ3?=
 =?utf-8?B?cUhyYVNUVFdHUkFxTEp5OEZ4a2ozU01HV3NmNmlFY1U2Zk0wSzlSMlp6ZUlO?=
 =?utf-8?B?QnU5TkF0WWFKV1dwNUpSTFV6eXlYZHh5R1IrdXFHb1UxOVM2b2tkN01LNFEw?=
 =?utf-8?B?MmR3azNDYmJXMFhqdU82dXpZdzg3NU1SLzhLYnh2d1FOY2VPUnB6ZjI5bVhr?=
 =?utf-8?B?WDBUVGplWWpGV0UzM2VWWUJqR0E2MWxDL2NKbGl4aHFKNlVPU3d2ZU9qN2th?=
 =?utf-8?B?NkRGZGxwdUdHNmt3Q2YrUlg1eG9STXFEb21LVHJhSHl6dC9mRk1mSk0wd0tk?=
 =?utf-8?B?TElmTkI1OGRYYlJjNzFmTGZJMVFWcFlNZnZSb05RMlp3ZzVRc1YxMFhxRkZ6?=
 =?utf-8?B?WFBHZllDWmxaVlJJYW5jbTNyZkJpcGRLUG9YQXRXc090d3h6R1o3a1pCdlZx?=
 =?utf-8?B?bk1MMFJxVVR1UXpJek92ZGRmdkFrUlVMNWUrcytPQ29wYWVMMDVNVk05aEUy?=
 =?utf-8?B?SGFTLzhrcS9RVDZWVFh3aElPSnRPTzRKOXFlN2tQZ3hnU2pUcjZ4ZjQyOC9o?=
 =?utf-8?B?ZzR2c0Zack9JVUluYlhPRk5vbnRtYytlSWVwQktTRXBmSGRrS001cjE0cEJ6?=
 =?utf-8?B?TXgrMXpmVnRQTkw4QW1Fa1pNOEk3T2hnbkVWY0M1ckIyZUx0UTlnblpJTita?=
 =?utf-8?B?QjNEcjJNdVhtV3kvQ0pOU2JiNWJnV0VYT2J5aFNmVTZOQlJSMnZzS1pBVUor?=
 =?utf-8?B?UnVEa3laallmQmJIWktUb1NLSEt3dlVWT3JFZmRNakRJY1VMR1pMdS9yOFR1?=
 =?utf-8?B?RUZKTnNHZm1QSTBEaW1KaEtWbEswZkF0eEZPRU52Tkw3YnlpY0N6UWl6WnBK?=
 =?utf-8?B?ZkxDcXdtRnVDcFREODV0bWY2SmV2T2p3KzIzZjNHZ3ozNVpHRmhDamhjNi9n?=
 =?utf-8?B?aVVkQTFSbkFOMEFFRDNMYjdLLzJkOVdOU1g5WE44MTdyd0F2QWdZZzJsQTI3?=
 =?utf-8?B?Smk0R1o0MEJTS2VkVDB4eS9rWndKSjJQMzVCS3I1N2JIMWNhUGFOSmljRTUw?=
 =?utf-8?B?TkRYanBJTWRjVi9VUHhTQUpwY0w0WkxWaGdEZjZndUkrSE9TOUhxUnZQei9U?=
 =?utf-8?B?QndoOFdKb001bjQ3eUtWaVhKNTc3RWh3cUhuVVBDSEJ4K3VlVXd0OEdOVTdV?=
 =?utf-8?B?OGFRbTcwVTI4VTlRZm9EcndYZEdWSXVQT3VRcE1lVXgya3pVMWRWUTVKNnNK?=
 =?utf-8?B?Rzk4NTJkd1U5amNoTkFzR3pab2kyTFdEWS9KcDVDenR6emg3NmxKbWhvQVhF?=
 =?utf-8?Q?ZuGg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4f8b36-196d-40c5-6b19-08dba325ee6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:39:11.2298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQJ+SxIQFRgYbTw3Ja8dJ7/EGE3aZiospy9+6cnj/wjCzvqFqSp/YZh7mQrX5GInUGPCzPiH1krbeYYnL6XjIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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
LjQgMTAvMTFdIGRybS9hbWRrZmQ6IGRpc2FibGUgSU9NTVV2Mg0KPiBzdXBwb3J0IGZvciBLVi9D
Wg0KPg0KPiBGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
DQo+IFsgVXBzdHJlYW0gY29tbWl0IDYxNmY5MmQxODhlZTcxNDJhOTVhNTIwNjhlZmRiZWE4MjY0
NWY4NTkgXQ0KPg0KPiBVc2UgdGhlIGRHUFUgcGF0aCBpbnN0ZWFkLiAgVGhlcmUgd2VyZSBhIGxv
dCBvZiBwbGF0Zm9ybSBpc3N1ZXMgd2l0aCBJT01NVQ0KPiBpbiBnZW5lcmFsIG9uIHRoZXNlIGNo
aXBzIGR1ZSB0byB3aW5kb3dzIG5vdCBlbmFibGluZyBJT01NVSBhdCB0aGUgdGltZS4NCj4gVGhl
IGRHUFUgcGF0aCBoYXMgYmVlbiB1c2VkIGZvciBhIGxvbmcgdGltZSB3aXRoIG5ld2VyIEFQVXMg
YW5kIHdvcmtzDQo+IGZpbmUuICBUaGlzIGFsc28gcGF2ZXMgdGhlIHdheSB0byBzaW1wbGlmeSB0
aGUgZHJpdmVyIHNpZ25pZmljYW50bHkuDQo+DQo+IHYyOiB1c2UgdGhlIGRHUFUgcXVldWUgbWFu
YWdlciBmdW5jdGlvbnMNCg0KVGhpcyBpcyBub3QgbmVlZGVkIGZvciBzdGFibGUuDQoNCkFsZXgN
Cg0KPg0KPiBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+DQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+IFRlc3RlZC1ieTogTWlrZSBMb3RoaWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgICAgICAgICB8
IDYgLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVl
X21hbmFnZXIuYyB8IDggKy0tLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jDQo+IGluZGV4IDAwZjUyOGViOTgxMjYuLjljODE5NzU3M2RlZTcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4gQEAgLTIyNCwxMCArMjI0
LDYgQEAgc3RhdGljIHZvaWQga2ZkX2RldmljZV9pbmZvX2luaXQoc3RydWN0IGtmZF9kZXYgKmtm
ZCwNCj4gICAgICAgICAgICAgICAgICAgYXNpY190eXBlICE9IENISVBfVE9OR0EpDQo+ICAgICAg
ICAgICAgICAgICAgICAgICBrZmQtPmRldmljZV9pbmZvLnN1cHBvcnRzX2N3c3IgPSB0cnVlOw0K
Pg0KPiAtICAgICAgICAgICAgIGlmIChhc2ljX3R5cGUgPT0gQ0hJUF9LQVZFUkkgfHwNCj4gLSAg
ICAgICAgICAgICAgICAgYXNpY190eXBlID09IENISVBfQ0FSUklaTykNCj4gLSAgICAgICAgICAg
ICAgICAgICAgIGtmZC0+ZGV2aWNlX2luZm8ubmVlZHNfaW9tbXVfZGV2aWNlID0gdHJ1ZTsNCj4g
LQ0KPiAgICAgICAgICAgICAgIGlmIChhc2ljX3R5cGUgIT0gQ0hJUF9IQVdBSUkgJiYgIXZmKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAga2ZkLT5kZXZpY2VfaW5mby5uZWVkc19wY2lfYXRvbWlj
cyA9IHRydWU7DQo+ICAgICAgIH0NCj4gQEAgLTI0MCw3ICsyMzYsNiBAQCBzdHJ1Y3Qga2ZkX2Rl
diAqa2dkMmtmZF9wcm9iZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCB2ZikN
Cj4gICAgICAgdWludDMyX3QgZ2Z4X3RhcmdldF92ZXJzaW9uID0gMDsNCj4NCj4gICAgICAgc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gLSNpZmRlZiBLRkRfU1VQUE9SVF9JT01NVV9WMg0K
PiAgI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSw0KPiAgICAgICBjYXNlIENISVBfS0FWRVJJ
Og0KPiAgICAgICAgICAgICAgIGdmeF90YXJnZXRfdmVyc2lvbiA9IDcwMDAwOw0KPiBAQCAtMjUz
LDcgKzI0OCw2IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVjdA0KPiBhbWRn
cHVfZGV2aWNlICphZGV2LCBib29sIHZmKQ0KPiAgICAgICAgICAgICAgIGlmICghdmYpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICBmMmcgPSAmZ2Z4X3Y4X2tmZDJrZ2Q7DQo+ICAgICAgICAgICAg
ICAgYnJlYWs7DQo+IC0jZW5kaWYNCj4gICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9DSUsNCj4g
ICAgICAgY2FzZSBDSElQX0hBV0FJSToNCj4gICAgICAgICAgICAgICBnZnhfdGFyZ2V0X3ZlcnNp
b24gPSA3MDAwMTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXggN2E5NTY5OGQ4M2Y3My4uYzczNDE3
ZTc5NzQ1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4gQEAgLTIzMzUsMTggKzIzMzUsMTIgQEAgc3Ry
dWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyDQo+ICpkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0KHN0
cnVjdCBrZmRfZGV2ICpkZXYpDQo+ICAgICAgIH0NCj4NCj4gICAgICAgc3dpdGNoIChkZXYtPmFk
ZXYtPmFzaWNfdHlwZSkgew0KPiAtICAgICBjYXNlIENISVBfQ0FSUklaTzoNCj4gLSAgICAgICAg
ICAgICBkZXZpY2VfcXVldWVfbWFuYWdlcl9pbml0X3ZpKCZkcW0tPmFzaWNfb3BzKTsNCj4gLSAg
ICAgICAgICAgICBicmVhazsNCj4gLQ0KPiAgICAgICBjYXNlIENISVBfS0FWRVJJOg0KPiAtICAg
ICAgICAgICAgIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfY2lrKCZkcW0tPmFzaWNfb3BzKTsN
Cj4gLSAgICAgICAgICAgICBicmVhazsNCj4gLQ0KPiAgICAgICBjYXNlIENISVBfSEFXQUlJOg0K
PiAgICAgICAgICAgICAgIGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXRfY2lrX2hhd2FpaSgmZHFt
LT5hc2ljX29wcyk7DQo+ICAgICAgICAgICAgICAgYnJlYWs7DQo+DQo+ICsgICAgIGNhc2UgQ0hJ
UF9DQVJSSVpPOg0KPiAgICAgICBjYXNlIENISVBfVE9OR0E6DQo+ICAgICAgIGNhc2UgQ0hJUF9G
SUpJOg0KPiAgICAgICBjYXNlIENISVBfUE9MQVJJUzEwOg0KPiAtLQ0KPiAyLjQwLjENCg0K
