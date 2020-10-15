Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCD28F436
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 16:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD96ED25;
	Thu, 15 Oct 2020 14:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983CF6ED1B;
 Thu, 15 Oct 2020 14:00:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrotYsJjeWOMiRBJ5xl+FV1qRNoMzKcJ1OP7AsXnDSWcsjQwegprSQ6NZjyTDAL1L2eMOuAVE/prj3rlDbWPXRmzf+kF/1kW8qsNGzsuGc5n58DCVzay87yn9U6wQMMAUvzMXLTRw+GasDbs3gOuAHXI7zStmO+ir1XgrTvh5o/NcOR/Ewna7/x4LfvWXhMqlZmd2UMA4DsSPAB7BZDZEMp0JHsMs2M3sPRyA8BIlcm2QP02DWo5siZjh2bwCeTDEkV3Um2PKZgtTNHhzqxcbsM1aM12CsEEGXJCn1xxFMwv/kpl5hfID2hhG77DjwSJJSuxsQn6tXPdctZBOXF/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY0ToQsC5k5lgdXyZsEcz+Mg0BHPMRMwcR+tXpbXx4A=;
 b=YyPKHwimVEGy341RD8VxK7/sj4nkelutvMMNgUe4clA3bW3o4ISYQP49jPgMhcgiEbWLziKoIT1G28d1A4OBQgDEklmdsXXEgyse5dNk1FlYNJ7/s8t6BOJV46xv2RuOWIHU9I7HucieJn4W7BqV+YoD4+AyFv3nGBTO23FZ5huPtEeqVU2T10cD/pHXlLqha0AVsT6yt4aoMQxeZjydsJsm70xuHF0DpyBOz/DZHlamKwMAEWK/MgEtQVlM9rfHd8ON3QmGLthHyDNcIbE68GSJ/8DyNNPiqFo8cGvWRICmSE9H/k22JurK5tlJ2eR4p8JV69I4u+ttqpB3FyFAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY0ToQsC5k5lgdXyZsEcz+Mg0BHPMRMwcR+tXpbXx4A=;
 b=uKtAvUqVZgTElsNEwYDKeRn16OpQfYsG2NOBID5VLUuXcNtsYHNZxLJtO7RE/dq1TeTwzBktkh9eUgGsDwc7XcJU9LT0LfEB7gUsKTebLCfNe42PDky9M2X31mp6VfR9oZngJeHltUsM4opPaxdxVoFgq/lYtI1iCyyQoYdbSPs=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 14:00:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 14:00:08 +0000
Subject: Re: [PATCH v4 03/10] drm/etnaviv: Remove empty
 etnaviv_gem_prime_vunmap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2a01560b-d7f7-e59e-cf71-50b36e0ee078@amd.com>
Date: Thu, 15 Oct 2020 15:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-4-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by
 AM0P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Thu, 15 Oct 2020 14:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 212df4cd-8a35-494f-accb-08d871129f11
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4061D4F28C6CE95C8EA1CBBB83020@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sx09Pw1cjzdKnru49xflPAssGdo4mvXxQIo1KBjpidSpmoaHPvBxVHLHKuWwB90kY+LNLdeOJjeGxh4pG29Jiev+VyYs5jsjF7sIre6kC3p1p9sX9iIT3Q20LamIo9k6ZYygwkHSqUNjhcYS9W2Wbd8Ocd6/muMX2JEJY1Cz0Cj8L6vKKlmE9k5wR3EZ7t4tvadPzBY8BmwXoYlhZ7oE2RANAFuFhDE5Z/BAUFvZ/qnVqqlt/jk6o/YkZdRqTZjaJIR72hynJ0aflfZdfNNKsfEwn23cpYXLA5vObKHzMxja8PgsWSEcTgWoFLSNFfhBnKu+bQBGZCcYeyJygQYZuVF6XY20d5ZlIk94o9Qzx5MwoQ1XEIQEq99NMoLduCvd6oTHzvJivfoqM/3ba2keqGBnIqGGCyvjWNCNhIBPUnmxnd4BxZdYU0PPmPzCoGX2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(2906002)(2616005)(66556008)(66476007)(36756003)(83380400001)(52116002)(31686004)(8936002)(66946007)(7406005)(7416002)(8676002)(4326008)(34490700002)(16576012)(956004)(316002)(5660300002)(31696002)(6486002)(6666004)(86362001)(186003)(16526019)(478600001)(26005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lIj9WfLFMVEVu1L6IQjBPgqlEK8GWxN/L5KU1cZ94QY6UM2xZrbvMR3zX03N56XYrCVX9LGJHz1peLkHaQRk1LmBrhqi89YrGcWg77kuATWQd9aARfq+XN8Y8r+Nse0K/ERjc5OKC9BTcFtGLBgvC6C5ItrfAvzcSNzebmQJpTVUUYwGVJCrvVH/829r37FoDjB8ubN62hmjbVS5e9gmPuDaIPE0cdfMP5edJn5VLwmcmdsOqLEX3YzTxDBC0ct3IGN6s/JZxM6/soiNH8PNFiiQohBSQhIk3k7TO3dmycHI5GVwj8LObq9ZwEL6q1n+6w/5Xm3DsiUO0TvZW45uA6ImZ+Sr64Vs3hxBoPIX5Ezs7UfiqGVzbpzJLMtuYyIFDvpM+UIr0wZH0vcv5uie3wEXIMsaOfOsYXbrcM0gqjtEXeNIcnHfe9u2L6EtRDFDH99L9Q7rq+qU/EnP1O/bRORaxzamDnbFYllxUsNj8LNiiaadfQsKNhJm9L3D2MpmRiyU0llmrVds26SJVg4hJmbpLTZPDuKY1XU7aqsUyDry4uPNdoUKByurkYjaVWYim9kQdtkxdNOjsL6eiuhCrc1XHcAteukh2Csfb0GXZW9rLGw/lafIzVmbGyGG8mbOncDDO0gnCm9l2RWmJEjTow==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212df4cd-8a35-494f-accb-08d871129f11
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:00:07.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6pWEsmfeP4c6Y3uqcywYbYfrQlJ4351IJdGanvoxElYheMV7hkc0+Q74le5xvtg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMTAuMjAgdW0gMTQ6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBUaGUgZnVu
Y3Rpb24gZXRuYXZpdl9nZW1fcHJpbWVfdnVubWFwKCkgaXMgZW1wdHkuIFJlbW92ZSBpdCBiZWZv
cmUKPiBjaGFuZ2luZyB0aGUgaW50ZXJmYWNlIHRvIHVzZSBzdHJ1Y3QgZHJtX2J1Zl9tYXAuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuaCAgICAgICB8IDEg
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyAgICAgICB8IDEgLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYyB8IDUgLS0tLS0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9kcnYuaAo+IGluZGV4IDkxNGYwODY3ZmY3MS4uOTY4MmMyNmQ4OWJiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oCj4gQEAgLTUyLDcgKzUyLDYgQEAg
aW50IGV0bmF2aXZfZ2VtX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKTsKPiAgIGludCBldG5hdml2X2dlbV9tbWFwX29mZnNldChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgdTY0ICpvZmZzZXQpOwo+ICAgc3RydWN0IHNnX3RhYmxlICpldG5hdml2
X2dlbV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwo+ICAg
dm9pZCAqZXRuYXZpdl9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7
Cj4gLXZvaWQgZXRuYXZpdl9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqLCB2b2lkICp2YWRkcik7Cj4gICBpbnQgZXRuYXZpdl9nZW1fcHJpbWVfbW1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiwKPiAgIAkJCSAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KTsKPiAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZXRuYXZpdl9nZW1fcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbS5jCj4gaW5kZXggNjdkOWEyYjllYTZhLi5iYmQyMzU0NzM2NDUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKPiBAQCAtNTcxLDcgKzU3MSw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZXRuYXZpdl9nZW1fb2JqZWN0X2Z1
bmNzID0gewo+ICAgCS51bnBpbiA9IGV0bmF2aXZfZ2VtX3ByaW1lX3VucGluLAo+ICAgCS5nZXRf
c2dfdGFibGUgPSBldG5hdml2X2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCj4gICAJLnZtYXAgPSBl
dG5hdml2X2dlbV9wcmltZV92bWFwLAo+IC0JLnZ1bm1hcCA9IGV0bmF2aXZfZ2VtX3ByaW1lX3Z1
bm1hcCwKPiAgIAkudm1fb3BzID0gJnZtX29wcywKPiAgIH07Cj4gICAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMKPiBpbmRleCAxMzVmYmZmNmZlY2YuLmE2
ZDk5MzJhMzJhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2
X2dlbV9wcmltZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1f
cHJpbWUuYwo+IEBAIC0yNywxMSArMjcsNiBAQCB2b2lkICpldG5hdml2X2dlbV9wcmltZV92bWFw
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgCXJldHVybiBldG5hdml2X2dlbV92bWFw
KG9iaik7Cj4gICB9Cj4gICAKPiAtdm9pZCBldG5hdml2X2dlbV9wcmltZV92dW5tYXAoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKQo+IC17Cj4gLQkvKiBUT0RPIG1zbV9n
ZW1fdnVubWFwKCkgKi8KPiAtfQo+IC0KPiAgIGludCBldG5hdml2X2dlbV9wcmltZV9tbWFwKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+ICAgCQkJICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gICB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
