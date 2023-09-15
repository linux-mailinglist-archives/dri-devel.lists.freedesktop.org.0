Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532A7A23F2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 18:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499810E654;
	Fri, 15 Sep 2023 16:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125CC10E650;
 Fri, 15 Sep 2023 16:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn7e8lEGQ17lnWjXUgw1GlOCFSkcMPLt6GS9dxgrNd6xGH/esiaBtFlG6TH9hhmeyvV9OHaAnTZuwrM2by98Ty72BHaCJGDiMeKQbkcvS8AgLZ9KdT2BP3M0bfKoFyPiU5YFiZ1SQUQYEd0SScAp6ZjxPaPGxn0tRV+zBZuld1yng4HfZNurRX1GpnG5zHy5NaY7nycbiuTD+w1hBZQCTtBrIZY0KYsc0CfUKWkeDGQiIOuB3+39b1HZOdOVB06b+DWZga+rdKmO3ZazB1XV/oYHV0Z1nJ1nLHQVQbSMsS0SrnYqMzyqMW9EKY9r4ANEv8nj+yvpQl/0DBN8mWvpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d20pUGBAzpV2TzgSdbpVbqGJRtec8kV5bSXGlfrhr10=;
 b=BetNYWxxzIagSAwf6WN0+6XanyfNdTcVRCWVDCi4UTTfXPeU4e3W7UCEXmghbFQAjxE9l9xuFmR/0E0pQoKA991nEQGkT8kJiUILgVId3ym2oTkrAMqyOXK0EhoLGd9xBxy4Sxy8NN7M+fhDYyshF2Glhtj/+MbPOfdZ9Bz19N3qf1KPNnmPRe6mb3YFwvCrVIPgOt95WC0fOUDuEgPvSpZMQrOU6ud1yJ4EDPXeUOlqgPwt7BROnpyi9pXK8iIu8A8PkWPUSOT1lWXzaMB2qb2fMWa0FdgWd/T7NVRKFsaUn/2c9D9LADnyjK3KFJDqGnDQz4iX4XdDnvz9z5g3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d20pUGBAzpV2TzgSdbpVbqGJRtec8kV5bSXGlfrhr10=;
 b=VZHWkt/8wRApxec/SX845nGMZ+cqkZngkbkhssa7/mNMAAqt+HfHy//ue2EwsPfl7/y/zVTZJ+7cwF8FwcpMTESvw3a0HFXJXzJoDF9AnGl3qkFm1QRurDu1nekymvdU/DuPcE3JhNAO1DvEfnxCe2FriMs2UGV3JPtTFhT1X3c=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Fri, 15 Sep 2023 16:52:36 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6768.042; Fri, 15 Sep 2023
 16:52:36 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Thread-Topic: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Thread-Index: AQHZ5F82qJ0nSbk17kC9ALrdxBJq37AVeaOAgAanaqA=
Date: Fri, 15 Sep 2023 16:52:36 +0000
Message-ID: <MW4PR12MB56671D0C13D58F32DC169BCFF2F6A@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20230911030018.73540-1-andrealmeid@igalia.com>
 <20230911030018.73540-2-andrealmeid@igalia.com>
 <4a6622b8-231e-74fc-f558-0f124b851308@amd.com>
In-Reply-To: <4a6622b8-231e-74fc-f558-0f124b851308@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=4edb7b4d-acfa-4a62-9839-2db3a7f05a8d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-15T16:51:39Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|DS7PR12MB8252:EE_
x-ms-office365-filtering-correlation-id: a7cbbe9d-0d6c-419d-6dea-08dbb60c2a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qTlhTU6UB2sATywcR5hsgLa8zdrOB2jKNskbyfcpPO4+O8Up9GuRSRbu1IxWjeVU4XwREYq9CgsFKI6B+Kc2bowPxENYGT5Dr2DQfLanFp4oQOsRNcuE79hnsuz8cI7MOcaeGJxlDhKXNiF9KOMiyRifwrlq0RhdhPtk/U4h0cX5wZKRAq+vmv5jXVxDtxdtlaK4xnfIUc4462egSHeCa+yj9IaOJMghhwPoN9w02r7+jfPTTwqjtlu45+BAYlLUPRIX8optA3jgNMe12pMiQWcVnYlG3/hd5Lwe5ucxx7dK5oirs99MHCDq+hxj0RV2Ml1q8k2mf3R3axYeYe4/xEByFfJpM41B2RvHh09LsFaDn2g3Yr3WXqEXlrkoRMZ2QIrtRnO6vFWCOHlMwpjF6LBYz6At0tEBM7dZ1driHZIwdg2zYLmy0RjV+jlZ0yUjSksM5/lkDAbgfvr0NSPOFf5DTQHqVRTGvkR+VFai9Pyb4msx+8RVxWTvszxXnPSs1vPSwlA3dkf1mDrXbnadqROlANQ0FEoOdh7bQemp7xoR/zSB+tzu18v0Yry8HhiKjo/T4OAam9SI7EvHIJHbLvLmeVa1+EQBMUZiV52ea4uKlN9gDU44tWW+U9v/rKCp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199024)(1800799009)(186009)(38070700005)(66446008)(5660300002)(8936002)(8676002)(4326008)(66476007)(41300700001)(66946007)(54906003)(64756008)(66556008)(9686003)(53546011)(2906002)(316002)(71200400001)(7696005)(6506007)(52536014)(76116006)(26005)(66574015)(83380400001)(478600001)(55016003)(122000001)(110136005)(38100700002)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVVRZW4xVzRybGpBZkJRNVZlTDhhdGhNc0JiNmh0WmI0eE1mZ29HWVdpYUxv?=
 =?utf-8?B?c3E1SmVFdVowVmpKN0xnZHJmQi9nOTlrWXVpUlhpV2RyY3orY2c3eFhCbjk0?=
 =?utf-8?B?MFBlelgweU9GU3BWWmpVNkgxVnVTS0pPajZ4QnVWWm9WMnhkVDFYMjZRejQr?=
 =?utf-8?B?UXpGbFVIdzg3ZzQzUkVSZGsyWWVvdmhEM3IrQ2xmeHlTNEx2cThaWFRoOFdB?=
 =?utf-8?B?YmNpOE5VRW5XQ1Q0ZktrTXB3bnBTNER0ZmtRR0dDQXJ4TzhvaFlHaE50bGFN?=
 =?utf-8?B?TVd0L0lreE9pNEZFY082cmIyRHdkUW5uVEIrekZRK0tQNW94V3I1K2NmR2dX?=
 =?utf-8?B?SElUWEpQWnBucERDUlJGMGJKQlJLbzNBaG4vTW9tSEpRUEVKWGxWZGdTNDhm?=
 =?utf-8?B?SkF2V2h2YzJDVTJLWWV2MDdxdDVwM2ZxTUFvUmFWVms3ZENvUVJEckY1M21H?=
 =?utf-8?B?SkxUYTVROXBlM1J4d1B3QW5HNytQVUJ4Vi8rR2VLMGZFcGQxeVBhdEFWTlBo?=
 =?utf-8?B?VVQ1dWE3TVVacXp4TVNEZStaSkIzc1lPNXpqNDZRYkVRdEpYaTBHcTczckFF?=
 =?utf-8?B?NVVwUE95d0pYbE5yc3ZnU3NZOWZ5VzFaQkcwbWppS08rZFZ4djFsYVEwR2Zy?=
 =?utf-8?B?WnNKSGNFZEZwclQ5ZlFUdUIyaHpuSVI1UlAwNEk2RHZpMFAvRmg4clFZaS9q?=
 =?utf-8?B?T0g0RXNOQTBYV2dwMmhFY3BaSFM1N0xBQUp1VmpTSnJIMDViaVl6VERackZo?=
 =?utf-8?B?NFBHUFMyc2JSMktuQUd2OU50WnlBbHNXQTVjWmtEQlR4eStqczd0OERaNnJu?=
 =?utf-8?B?U1NUcHZsS1pVeUVGMXlxb0ZnREdIcmtOenhHWlFJM0RGbDBRVlFxbkVTSjNl?=
 =?utf-8?B?N1NVWndld25mVWdNVGJ5Z3AzSEw1UTB5SndrV2JBQS84T0xXc3BRVG12QVpC?=
 =?utf-8?B?MGdxY0lsdkIrUHJrY1lFWCtZYXk4enFrVXhYY1JiK21sZEZ3L3dydzI5SVZW?=
 =?utf-8?B?MUx6c3hpR0VKNzdqM2ZFczZIWU9EZzY3eis1V01xczVPUG9PelBic2VZU3hX?=
 =?utf-8?B?WXZMbW5HdlpQYWNLTUE1TlFNYjRHNVBtN1diekhlWHo3UmJJWHNhYnFnZ3Rk?=
 =?utf-8?B?blk2bndXbklKZFRrNTFBQUxJY2pqejRhY1JBQUdYeGxYdWh4d2crYUU0alJL?=
 =?utf-8?B?U0hQNW9NTzlCeEV0N3FRQ0R2dkhKS1gxbmZObkJHbjlTTE9JY0pwSXE2YUdV?=
 =?utf-8?B?ZjNlaEVab2NRTUkya0R3S2pIdERZSlRQcHBWWi9KWnhhUnBzRFpPMGRSM0tM?=
 =?utf-8?B?NUF5eFVlVzI0aGMwazZicE9ZaGJRUDVBMm9uV0VDZEFhSUdncEQrQ0hGbU1W?=
 =?utf-8?B?dGQzTFdUVW1NeGx1eHNnSWUwNjhZclB6c3p1TnNiWngvSXdzcDBXNjhGaG9k?=
 =?utf-8?B?Yk53aGNJQjBYZWJ6RTBsd3hQRnoxMTlNbmVWM04zTGR1VmVSQlRJOTdjcUli?=
 =?utf-8?B?eFFmVGlMemFUZDNocEFpUGRubE9yVENLM2gwdmpvcUdiTEtpemNEdkJxREJ1?=
 =?utf-8?B?ZHJDbUk5OFlLZ0sxZjE4VDFILzdrSk9iUHZ6REtTRkEraFpRMEZxNzZ4WDky?=
 =?utf-8?B?WDFMaExaUW5LWXovcnJMUWtBTWd2ODl6c3FPV3llZm9tanY0RVNoQ1dtdm9v?=
 =?utf-8?B?RXM3a3B1RGdZTHJQWjlMR0J4MVFMTC8rWVBQSWZhNThYL1pzNTVldjZpQ1JB?=
 =?utf-8?B?czNKbGsyUWF4ZDJPanBBb3p4emE5OG4xMDM0T0R4Nm5FQkxYb0dnNnFHOWEy?=
 =?utf-8?B?WGZId1RpZnI5a2FLcHloSkpqaWJ6a3h1MzhGcDMyNUVjNGFnT1huTlIzQlNZ?=
 =?utf-8?B?MXBmdGVqVE5kUWdTSlY2L0ZMRTZ0dmlqQ2VLR2NYcy9qaCtXcjh5OVo0WGxM?=
 =?utf-8?B?d2dFU2FibFZ0OEZ0S29DaVN1YUNRUzRnQWxtYS9ITndIQUZpNzd0SlN0c1lT?=
 =?utf-8?B?amhLMEVDam1VNmhKR0FCRlVZYjZwSnI4K0YzWUd5OGFXNE1UTzYySXpocUVI?=
 =?utf-8?B?bEt6Y2ZqTmIwTEVaVVFEd3haNHhWakgra0hWeGFtNkFBSVAwUVduVmQ3azQ2?=
 =?utf-8?Q?DurU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cbbe9d-0d6c-419d-6dea-08dbb60c2a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 16:52:36.7245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyjPvuQo7a+8BMGlAzvYfiXCAMfebN0sH70Vy/eA5tUFNX0WkE9z/TcN9lotDg9Rkc8b6bbYrXMCOCijloFcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-Prayer,
 Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClB1c2hlZCB0aGUgcmVzdCBvZiB0
aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIHRvIGFtZC1zdGFnaW5nLWRybS1uZXh0Lg0KDQpSZWdh
cmRzDQpTaGFzaGFuaw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW5pZywg
Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTZW50OiBNb25kYXksIFNlcHRl
bWJlciAxMSwgMjAyMyAxOjE1IFBNDQpUbzogQW5kcsOpIEFsbWVpZGEgPGFuZHJlYWxtZWlkQGln
YWxpYS5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2hhcm1hLCBT
aGFzaGFuayA8U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+DQpDYzoga2VybmVsLWRldkBpZ2FsaWEu
Y29tOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBQZWxs
b3V4LVByYXllciwgUGllcnJlLUVyaWMgPFBpZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5j
b20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvNV0gZHJtL2FtZGdwdTogQWxsb2NhdGUgY29y
ZWR1bXAgbWVtb3J5IGluIGEgbm9uYmxvY2tpbmcgd2F5DQoNCkFtIDExLjA5LjIzIHVtIDA1OjAw
IHNjaHJpZWIgQW5kcsOpIEFsbWVpZGE6DQo+IER1cmluZyBhIEdQVSByZXNldCwgYSBub3JtYWwg
bWVtb3J5IHJlY2xhaW0gY291bGQgYmxvY2sgdG8gcmVjbGFpbQ0KPiBtZW1vcnkuIEdpdmluZyB0
aGF0IGNvcmVkdW1wIGlzIGEgYmVzdCBlZmZvcnQgbWVjaGFuaXNtLCBpdCBzaG91bGRuJ3QNCj4g
ZGlzdHVyYiB0aGUgcmVzZXQgcGF0aC4gQ2hhbmdlIGl0cyBtZW1vcnkgYWxsb2NhdGlvbiBmbGFn
IHRvIGENCj4gbm9uYmxvY2tpbmcgb25lLg0KDQpTaW5jZSBpdCBpcyBhIGJ1ZyBmaXggSSd2ZSBh
bHJlYWR5IHB1c2hlZCB0aGlzIG9uZSBpbnRvIG91ciBpbnRlcm5hbCBicmFuY2ggcXVpdGUgYSB3
aGlsZSBhZ28uDQoNClNoYXNoYW5rIGNhbiB5b3UgdGFrZSBjYXJlIG9mIHBpY2tpbmcgdXAgdGhl
IHJlbWFpbmluZyBwYXRjaGVzIGFuZCBwdXNoaW5nIHRoZW0gdG8gYW1kLXN0YWdpbmctZHJtLW5l
eHQ/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kg
QWxtZWlkYSA8YW5kcmVhbG1laWRAaWdhbGlhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+IHY1OiBubyBjaGFu
Z2UNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+
IGluZGV4IGFhMTcxZGI2ODYzOS4uYmY0NzgxNTUxZjg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC00ODQ3LDcgKzQ4NDcsNyBAQCBz
dGF0aWMgdm9pZCBhbWRncHVfcmVzZXRfY2FwdHVyZV9jb3JlZHVtcG0oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+ICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBhZGV2X3RvX2Ry
bShhZGV2KTsNCj4NCj4gICAgICAga3RpbWVfZ2V0X3RzNjQoJmFkZXYtPnJlc2V0X3RpbWUpOw0K
PiAtICAgICBkZXZfY29yZWR1bXBtKGRldi0+ZGV2LCBUSElTX01PRFVMRSwgYWRldiwgMCwgR0ZQ
X0tFUk5FTCwNCj4gKyAgICAgZGV2X2NvcmVkdW1wbShkZXYtPmRldiwgVEhJU19NT0RVTEUsIGFk
ZXYsIDAsIEdGUF9OT1dBSVQsDQo+ICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2RldmNvcmVk
dW1wX3JlYWQsIGFtZGdwdV9kZXZjb3JlZHVtcF9mcmVlKTsNCj4gICB9DQo+ICAgI2VuZGlmDQoN
Cg==
