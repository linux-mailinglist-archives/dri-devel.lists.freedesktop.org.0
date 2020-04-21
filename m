Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016221B29EB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73C46E999;
	Tue, 21 Apr 2020 14:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F96E998;
 Tue, 21 Apr 2020 14:33:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oo6o0dB7K7E51Xn9niJ8rM1u1Cvt0C8GOlSF6kAVPE4MPu4dYP6g7M/pfCqoLAliISDQpnCfef42KzbeBeUj2FNaAxlG0aMudU4kujgpgPQtfHxQB4eEKPhMqenkWs8TLWP9+sadtpNNMCQa+szY6ixAAh/Wwfalstp6r0DLlUPqV46qPlBZ/j3gwtTxClBDcEnVgwcEdGcbgAJNWCb1yRePPbGLOqTzlTVIJVl0iVNOjB9Tm6fUYyPzNNLKwYyC40S5m/g55zsijEPYA2gJoJpNQaSHvKcM4jeuvZjeGmvI6Evq+Hgpg631lWG1fjkUJcP7NWRWFwBiUgDijP3yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk8SnTOMuCtDyziCXVsLuYdKX2mvWN7mhwxtsad9YQc=;
 b=Q5phmUjVjU9hhCY96jxnVKXMEsot7vA1iWzVlIzI++yekWHrRc8Q8piCPxXwbKZCYXmAAZQVlUQ9yrZf9OydT1SYAn2b2fI4um0EVC2ju+s3+LF8zgEgYFIKanRoXJoeMveFbj/qOpOqv1e98QSVjDl7tL6kpKpOugE1n94iS8jZhuosqnfcKBKwudB2Q3BIN3g5ODk8a4PSCuTJnCCcMkPy/3K/mhCPBHBHUWx//XUFtFlbx1RKufjYr88iTtCgU1nHSTqUKmZYuK52gQzzpUZKRnjXLhgouLS/uLxCOGJ696D38HWjADexTJJuKi0MEXW2kSUGwRFrag6e/BZ2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk8SnTOMuCtDyziCXVsLuYdKX2mvWN7mhwxtsad9YQc=;
 b=zutJaPvKGMBlcdOz3GGmqVQnhQSIXGpBARndySgsADP6f0jUJsRAVexzkMSAn4ClDew5vfU14FqaQdzjfWpfrL4gGDKDWhdZ11qTlkWzv2aiiWx9GfJe+KJ0XItFSsWBLvjYWY0HfwV/txcCTu7ZOdA2mSQS7yaswA2TMD2gg38=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3051.namprd12.prod.outlook.com (2603:10b6:5:119::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 14:33:25 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 14:33:23 +0000
Subject: Re: [PATCH] drm: amdgpu: fix kernel-doc struct warning
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20200420015015.27991-1-rdunlap@infradead.org>
 <20200420015015.27991-2-rdunlap@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <128ebc30-e62b-b928-cf92-9ca331bfb6b5@amd.com>
Date: Tue, 21 Apr 2020 16:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200420015015.27991-2-rdunlap@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Tue, 21 Apr 2020 14:33:21 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3357091b-17d5-45c9-f331-08d7e600f201
X-MS-TrafficTypeDiagnostic: DM6PR12MB3051:|DM6PR12MB3051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30518681A2C8A995543337DC83D50@DM6PR12MB3051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(4326008)(16526019)(6666004)(31696002)(86362001)(6486002)(36756003)(478600001)(66476007)(2616005)(5660300002)(8676002)(2906002)(52116002)(81156014)(66946007)(66556008)(31686004)(186003)(8936002)(54906003)(66574012)(316002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pf1VOIJwfAlBcYic+BzWWKfsz4EMfl5V+EF6sLv4XzslkbDYGZtsFiE3Ell+rB+/xgJkXXdvHUiVyeqngLS0A5zAIRlRhXayMYNAnKNeVzBArGHLowTYd0f1koBI4a3+2IJF6M3xftF4/sa6G9OiWSKWN1bY6XQuIiT1nz6aTTBmo9w4/mJDX+XCVK2RpUrjhiQBoxXCNuxhlu6fA9qXGlLa/urEFrj70FIprFcPfHZDhFvZy30Ack+rpegeICF+hffHlHeFpTPtPoOs6BTnYZSQEnG6NmdbsjNqH8ccehGjsJcIuZLZj1TkimtZqdBjPtUYwbQ8DQDsMbNsQfx88oSaVr6OMzKkWoxyYVm0rxrnFozZY5QaEXTwyFis5+9jxZMjhtlbae5XAUMKHFvlGuDNx6iMefUovLOnn6Le7KVdVqnjHx7RfW8lgGOiotxQ
X-MS-Exchange-AntiSpam-MessageData: 1x8DA54TZ0RYpwvm0/a07JJb4htIfWOvvU2BcjR0krtKnEc/RlBg1oco/wzfCxihrmwZS9gh0rWbUgtTcsWXJFBkZ+/zLC7GYQafnr+0ByLmZ2FeitR9rVA7qfCrDTuyPgcTKsVjBNMqFKV2NNzUs5WkxezBiVnAqW1hYsR5yQoORYeD3tbl+mt2Lbcg0cSrSuEDAa6vXcUFVJ42KlxIyRDil4q/BmuSfnTd2M8Fb9sj+XLJxJquHiG8ihTw5mm4VQlx65GSpKpB+Nio6XUDZMJEVNojXdq19yx/1pLw6ozvKo/ByfSBwkOh/VvV8iJRLeaVnLqYndZbxP1APYnPvhay/MgmDFkEC6RHpIz7+qeyHFMjJtdyzU+LlBEM+QQzviEIiz2ah4VmUQP8iPY+y2CL5f3o3nkUxJYhBxnPHQW+KCY5r2l9nB+j3IhjsYyODJ44CP9tRp6AoJH9k1udLC7tiAj2gqnt2pHX1r15PK2wuXw5w8L2mq25aEnlkcYMsL8nPQxF9NoHED++CXofBynhrI6AJqqzHqATOjW5N87f9nV5Hsr4UAlgnyWLAm4W1u8mEhnPNaDo9uNoT7ftXMSxUx6OphZSG/wBFiEjzHWoefuzOrE+VxvA/vPCBXbVoV9hmFwxCDjS98QHjP2NCv2aw8jlK1UxdmU5ZX7uGHKWBOShbasdY2XYnwwV4aFAR+3S32HowPNrrXY4njJGqX7D7fZ4mnteXVjY+CxL9cqlNSsX4tRFn0NadmJnu8f8r7JR7M++CjSppA85L0E5xaqGLyts4oyf5gaNT4yGWo2HjFIhXTU2lI9UuT5rW5tMh/MaW9NQyIRtyv0K89jMVlgS9SHIgsT3utu7hYQWAI4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3357091b-17d5-45c9-f331-08d7e600f201
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 14:33:23.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiHiWuqMiQGBKQyJ0Gh4g4cEFGOXBUWhN6s9KnvtnyPEI0QbBvoocJ4JfeLzqT45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3051
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
Cc: "Signed-off-by : Alex Sierra" <alex.sierra@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDQuMjAgdW0gMDM6NTAgc2NocmllYiBSYW5keSBEdW5sYXA6Cj4gRml4IGEga2VybmVs
LWRvYyB3YXJuaW5nIG9mIG1pc3Npbmcgc3RydWN0IGZpZWxkIGRlc3JpcHRpb246Cj4KPiAuLi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYzo5Mjogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm0nIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92bV9l
dmljdGlvbl9sb2NrJwoKQ2FuJ3Qgd2UganVzdCBkb2N1bWVudCB0aGUgZnVuY3Rpb24gcGFyYW1l
dGVyIGluc3RlYWQ/IFNob3VsZCBvbmx5IGJlIApvbmUgSUlSQy4KClRoYW5rcywKQ2hyaXN0aWFu
LgoKPgo+IEZpeGVzOiBhMjY5ZTQ0OTg5ZjMgKCJkcm0vYW1kZ3B1OiBBdm9pZCByZWNsYWltIGZz
IHdoaWxlIGV2aWN0aW9uIGxvY2siKQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1
bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNpZXJyYSA8YWxl
eC5zaWVycmFAYW1kLmNvbT4KPiBDYzogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBEYXZp
ZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uYyB8ICAgIDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gLS0tIGxueC01Ny1yYzIub3JpZy9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYwo+ICsrKyBsbngtNTctcmMyL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAgLTgyLDcgKzgyLDcgQEAgc3RydWN0IGFtZGdwdV9wcnRf
Y2Igewo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfY2IgY2I7Cj4gICB9Owo+ICAgCj4gLS8qKgo+ICsv
Kgo+ICAgICogdm0gZXZpY3Rpb25fbG9jayBjYW4gYmUgdGFrZW4gaW4gTU1VIG5vdGlmaWVycy4g
TWFrZSBzdXJlIG5vIHJlY2xhaW0tRlMKPiAgICAqIGhhcHBlbnMgd2hpbGUgaG9sZGluZyB0aGlz
IGxvY2sgYW55d2hlcmUgdG8gcHJldmVudCBkZWFkbG9ja3Mgd2hlbgo+ICAgICogYW4gTU1VIG5v
dGlmaWVyIHJ1bnMgaW4gcmVjbGFpbS1GUyBjb250ZXh0LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
