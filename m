Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3314D23B9C2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9AE6E466;
	Tue,  4 Aug 2020 11:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB826E466
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvbE3bzTnUIlvcYRMc+zL+M4UaWA2yWR/U/5N2n0TojDDnGfT/N6PW6CH2ZbhWI5SZe+QAKpBJQglX1x73C2VQXBBezxsO5IzMP+H2C8/jIEz4BXYSJ1jNp2iOfcHS6lKrTmZHB/tFRP6CJOxeSOGry7xCoqsYe5TwNNrEfYQrURqRoxCIDSxbAYmV/YS5VP2DhkygwdgK7yzJUgJ+PZIim6XpmtlsJPPTxhOkX0/mULBMCEIvzPLeGKt3ejQMkoXjzL/9FdKVWLwrMx7xbMQzu1NITgpgXpwCLnpDpyGZmiyYXOM8IfVWx888mkCDA9RLAqDg267NbM26NJC89+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqM8xV2A2Wesc+I9IEfIzFlxymKf8lEdURAbD2s9xxY=;
 b=MwODDlRo72rADgCVCPy0HhE8kBtr6VY/s00gW2LwN+D/cBQXSRBVlb9YoFhf4WkTTG0Rq9n6PefvGDgQt0OiKGvBpc63Ww+IWBOJ5bFwyO9pa6wJvBjp/GH1H5Kpg538SqN8IKLhdE6LXCo+fKEPMMalBuWuLIPoR2PO7Ga+j3cV3H7JxVW7TFTr5p0etvbK64Pe3PibM2Ctgv2A5s4PnlMoSKNT5XjeYpeR2Kao3hWMtAQlUAgvPdbDRnUv9N+hC6QlQupj+4tV1j4NUd7P6UpZQIsFeHpcbJubH4WZ/4DrN0qyiwxo6zJM1D7bbqpFFxx0HBFWlAK3+OkldQPDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqM8xV2A2Wesc+I9IEfIzFlxymKf8lEdURAbD2s9xxY=;
 b=GTNSgis2QsuxtJzw4YmmA2mLgTC5PSYt8m2Ge8dI+5lrOl/KvUootyElvtYlEowBEWTvrBazqrzEJkIH6xeaQJ245vQfnbXhWJpNdVPUoXMx86dnjfazTRT/iGpaucDL4xM6AMTKUYEKJwX24F7aXyDKu/2hApjEtZznArNn2eY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:40:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:40:30 +0000
Subject: Re: [PATCH 57/59] drm/ttm: rename bo manager to range manager.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-58-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f60f9270-6942-26bc-c590-56d51213117a@amd.com>
Date: Tue, 4 Aug 2020 13:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-58-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0169.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0169.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Tue, 4 Aug 2020 11:40:29 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9cd0cfc-0089-4c43-d9aa-08d8386b30ba
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111DC64537578CC54A41776834A0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GiYgfJ2A1MQD5iqD69W9l/C/AOaQvtORKVyDBBWzcoSVXKbXni0ZgdyaHaGlp4OpLxaxQMDENXp+iOBaCWti87MsRNvKlxyTcBuGNTR8VppdXnOD+BgI2W2YqU3FKIBnSKkt2Pc8pjkbDj6d1jhS3i+QDersfgi9UkclyET2aNyf/vtYiJNlCLRsrAt3qOWbeF7U5fQG+gYcV4iXPy0hJOhmPGSxCN6yMSwuBL06HyKgSQrAi/4O9dKn1YxTQMaQvXnMRkumZcfFk5LtoIREuMe64coytpLLMziz9+Yp54tGTEyWoCkcREjIAhM6S6UPQkyrdc782+BXu49NysvVxvgQyfnvkYaTYwYkoZfg+ufvqni7l1xytLdG3zuQWuw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(4326008)(8936002)(31696002)(66556008)(66476007)(8676002)(5660300002)(36756003)(66946007)(2616005)(31686004)(2906002)(6666004)(478600001)(86362001)(6486002)(316002)(52116002)(16526019)(186003)(83380400001)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Zz4yUIIVEsoUPJ0UDM/HEVsgxRx9KMRHOZIw0uMBOgPLZwOZmC90DzpbCslM36abNkA2S27R5wwDWLBjhLinLL8iqMliJlu78nuhaRjvoU4FnmDrjyvILkq5/AO/Y6/7TzM+b63eq1q0FdLApRAkxhFcly7h8ilZ+nlXHpUMS6TzCnFw8HyHNLGnilkInhHNYIJ54jCz005I4hbOjOs+JSmSIt9eaAHPw2kM8bEtBaVSe9v7UZjkhgSjCUobFRaZJ0sR689S0ZeBsBk9Fz3n7vooncVUJ5CzxEDwYbeYaQHukHeDHy3fjBxMcbM1NsL0M3JGwLIBhINg+OyzQRWG2DLzguT+FmDlUHN3tCDmoO4fBIedDgUYBgS2q7PvJBvFizoS2gz0SQT0jvI3/WAz28mmsTcdTDlyChfsFDUX1mzZWROBuFgw/tYGkuwSeHXNt80Jdz+geqT9t6wFAzRf9sX8JgWfeAHxVaD9giFUqyqf3WVnqJE85l/n46L0aPhqpsnAVfcKzmfMi5fooqVxBFCpYSCl1HRQirlQ7ebz2oLdek/WGcsLw3b9UiMSHgytzIB/LBrcm/t8KF6/JzBKukVK2iWCmvU0TaUJzrQWy/lDfaMNgu5siFHp4wbwRwEdxex0ie/i0U/66Jc6GtsH68WLSSchRnvqhUowKXww3X9ElRZCkuoxNokSAFMkUF/qw+tkERHmyCCtklqpRAyIlA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cd0cfc-0089-4c43-d9aa-08d8386b30ba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:40:30.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsUBz5S0wHYeLyXCqdRK/lUvmnwRw+4IlXIDnjv5tWCny+eRGEoHe/nLUNK0V1JF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlIGdlbmVyaWMgbWFuYWdlciBpcyBjYWxs
ZWQgdGhlIHJhbmdlIG1hbmFnZXIgbm93LCByZW5hbWUKPiB0aGUgZmlsZSBhbmQgc29tZSBpbnRl
cm5hbHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
PgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICAgLi4uL3t0dG1fYm9fbWFuYWdlci5jID0+IHR0bV9yYW5nZV9tYW5hZ2Vy
LmN9IHwgMjYgKysrKysrKysrLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAgIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vdHRt
L3t0dG1fYm9fbWFuYWdlci5jID0+IHR0bV9yYW5nZV9tYW5hZ2VyLmN9ICg4OCUpCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vTWFrZWZpbGUKPiBpbmRleCBjYWVhMmEwOTk0OTYuLmU1NDMyNmU2Y2VhNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS9NYWtlZmlsZQo+IEBAIC00LDcgKzQsNyBAQAo+ICAgCj4gICB0dG0teSA6PSB0dG1fbWVt
b3J5Lm8gdHRtX3R0Lm8gdHRtX2JvLm8gXAo+ICAgCXR0bV9ib191dGlsLm8gdHRtX2JvX3ZtLm8g
dHRtX21vZHVsZS5vIFwKPiAtCXR0bV9leGVjYnVmX3V0aWwubyB0dG1fcGFnZV9hbGxvYy5vIHR0
bV9ib19tYW5hZ2VyLm8KPiArCXR0bV9leGVjYnVmX3V0aWwubyB0dG1fcGFnZV9hbGxvYy5vIHR0
bV9yYW5nZV9tYW5hZ2VyLm8KPiAgIHR0bS0kKENPTkZJR19BR1ApICs9IHR0bV9hZ3BfYmFja2Vu
ZC5vCj4gICB0dG0tJChDT05GSUdfRFJNX1RUTV9ETUFfUEFHRV9QT09MKSArPSB0dG1fcGFnZV9h
bGxvY19kbWEubwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3JhbmdlX21hbmFnZXIuYwo+IHNp
bWlsYXJpdHkgaW5kZXggODglCj4gcmVuYW1lIGZyb20gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fbWFuYWdlci5jCj4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3JhbmdlX21h
bmFnZXIuYwo+IGluZGV4IDY2NzlkYzExOTM0Zi4uNTJkOWEwZWQ3MTY1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3JhbmdlX21hbmFnZXIuYwo+IEBAIC01NCwxMCArNTQsMTAgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKnRvX3JhbmdlX21hbmFnZXIoc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW4KPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKG1hbiwgc3RydWN0IHR0
bV9yYW5nZV9tYW5hZ2VyLCBtYW5hZ2VyKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IHR0bV9i
b19tYW5fZ2V0X25vZGUoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gLQkJCSAg
ICAgICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+IC0JCQkgICAgICAgY29uc3Qgc3Ry
dWN0IHR0bV9wbGFjZSAqcGxhY2UsCj4gLQkJCSAgICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1l
bSkKPiArc3RhdGljIGludCB0dG1fcmFuZ2VfbWFuX2dldF9ub2RlKHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuLAo+ICsJCQkJICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
ICsJCQkJICBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKPiArCQkJCSAgc3RydWN0IHR0
bV9tZW1fcmVnICptZW0pCj4gICB7Cj4gICAJc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFu
ID0gdG9fcmFuZ2VfbWFuYWdlcihtYW4pOwo+ICAgCXN0cnVjdCBkcm1fbW0gKm1tID0gJnJtYW4t
Pm1tOwo+IEBAIC05NSw4ICs5NSw4IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21hbl9nZXRfbm9kZShz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAlyZXR1cm4gcmV0Owo+ICAgfQo+
ICAgCj4gLXN0YXRpYyB2b2lkIHR0bV9ib19tYW5fcHV0X25vZGUoc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyICptYW4sCj4gLQkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiArc3RhdGlj
IHZvaWQgdHRtX3JhbmdlX21hbl9wdXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiwKPiArCQkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQo+ICAgewo+ICAgCXN0cnVj
dCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IHRvX3JhbmdlX21hbmFnZXIobWFuKTsKPiAgIAo+
IEBAIC0xMTAsNyArMTEwLDcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX21hbl9wdXRfbm9kZShzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAl9Cj4gICB9Cj4gICAKPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5hZ2VyX2Z1
bmM7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyB0dG1f
cmFuZ2VfbWFuYWdlcl9mdW5jOwo+ICAgCj4gICBpbnQgdHRtX3JhbmdlX21hbl9pbml0KHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgCQkgICAgICAgdW5zaWduZWQgdHlwZSwKPiBAQCAt
MTMxLDcgKzEzMSw3IEBAIGludCB0dG1fcmFuZ2VfbWFuX2luaXQoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsCj4gICAJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBkZWZhdWx0X2NhY2hpbmc7Cj4g
ICAJbWFuLT51c2VfdHQgPSB1c2VfdHQ7Cj4gICAKPiAtCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFu
YWdlcl9mdW5jOwo+ICsJbWFuLT5mdW5jID0gJnR0bV9yYW5nZV9tYW5hZ2VyX2Z1bmM7Cj4gICAK
PiAgIAl0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KG1hbiwgcF9zaXplKTsKPiAgIAo+IEBAIC0x
NzAsNyArMTcwLDcgQEAgaW50IHR0bV9yYW5nZV9tYW5fZmluaShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX3JhbmdlX21hbl9maW5pKTsKPiAg
IAo+IC1zdGF0aWMgdm9pZCB0dG1fYm9fbWFuX2RlYnVnKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuLAo+ICtzdGF0aWMgdm9pZCB0dG1fcmFuZ2VfbWFuX2RlYnVnKHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCQkJICAgICBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnBy
aW50ZXIpCj4gICB7Cj4gICAJc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gdG9fcmFu
Z2VfbWFuYWdlcihtYW4pOwo+IEBAIC0xODAsOCArMTgwLDggQEAgc3RhdGljIHZvaWQgdHRtX2Jv
X21hbl9kZWJ1ZyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAlzcGluX3Vu
bG9jaygmcm1hbi0+bG9jayk7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5hZ2VyX2Z1bmMgPSB7Cj4gLQkuZ2V0X25v
ZGUgPSB0dG1fYm9fbWFuX2dldF9ub2RlLAo+IC0JLnB1dF9ub2RlID0gdHRtX2JvX21hbl9wdXRf
bm9kZSwKPiAtCS5kZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9yYW5nZV9tYW5hZ2VyX2Z1bmMgPSB7Cj4g
KwkuZ2V0X25vZGUgPSB0dG1fcmFuZ2VfbWFuX2dldF9ub2RlLAo+ICsJLnB1dF9ub2RlID0gdHRt
X3JhbmdlX21hbl9wdXRfbm9kZSwKPiArCS5kZWJ1ZyA9IHR0bV9yYW5nZV9tYW5fZGVidWcKPiAg
IH07CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
