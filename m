Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30C1B1F9C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 09:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430F96E8C5;
	Tue, 21 Apr 2020 07:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C806289F6F;
 Tue, 21 Apr 2020 07:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtDVAJZ3Rw5UqFGWpgXgs+PFTQGQhsEPEWp6fqrLXS2F2BcexERZaFVk9JT4I91NJdSfnamBkLWDqtIH/4nHiO0MluxQX9411TUmLtE6KTn8XDh42Bp99cwCtbUuIMomC3Lps3OirZqv2YtGXS9UYrMHA6PTDeH/fD/IvyqW3GyPXVmpKf2Tj89KaIYOT1XjvVPPemYGxsw6AtetarJ+lGk7IEwx7nAvoThYlFvdlDLf0KiNXdEIFgOokpZ8GIPafCB9tqmLOieTufnFSG7DPQ6Qab8UOu405voCGfrO6EkV/m1ZECYoWYXYFM+QyIk+c7zb2CzpS44dnRdN24fp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ltdoucZOITdQbh1fX2vCxgIh/JmWzB4cOdFlPR38zY=;
 b=esceFaTScoD5k0lCC2n9Na9RrX/u89c7r8HLy+Lt4Ql++i//D7AGvvcBrnAn9NPWQ0ajZgc7CrK+AMLMCjefYiCb78R+W31q88AvW3EJtmTEjUuKx5oet4aL+5pacwZCq9VWyWZQbQlyuWUgqhqwNkPIZG7Dfj2DzqhULNoie6dqNHyx/+Qb6UZ2fziOUik40QKtcYsCuGCHJVuog/fhCo8Uo8uaTm4nnk6tM34/lHAZMFFMsL2wgrRA6UmPRXJhnvjM3/yPtRIxUNr6+U0o6/DZWKeryzqnu7ggNJMhN7Q239AvDHEmpTnIeIWH3vMYG2JrIhUrNi+m3sRkt1Nbsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ltdoucZOITdQbh1fX2vCxgIh/JmWzB4cOdFlPR38zY=;
 b=TmbOSlFfiZ5s4ptIAnY0FbfTrUZw20fgnAJAI7kyCoFhhbqap/sbgwL5tda91OYKkfekuqc4x/zmKngdryTdfxOegU84XvxI0sumkBHvsga884fyPQjUVYAgZVc5hbh+5od0HHwkh8sgj97PUhX0wgJnR6tYSWcVizA45Ao9kiA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3851.namprd12.prod.outlook.com (2603:10b6:5:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:14:33 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 07:14:32 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable
 'priority'
To: YueHaibing <yuehaibing@huawei.com>, alexander.deucher@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 andrey.grodzovsky@amd.com
References: <20200421024125.29992-1-yuehaibing@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c6166e9e-46e1-5e4f-e93a-a3c170e81efb@amd.com>
Date: Tue, 21 Apr 2020 09:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200421024125.29992-1-yuehaibing@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::31) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:208:ac::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.6 via Frontend Transport; Tue, 21 Apr 2020 07:14:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2071363-c7e7-44c5-50c5-08d7e5c3a3d4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3851:|DM6PR12MB3851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB385156250AEC159E52E0FB8C83D50@DM6PR12MB3851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(5660300002)(66574012)(6666004)(186003)(4326008)(316002)(2616005)(16526019)(66556008)(66476007)(66946007)(2906002)(6636002)(36756003)(8936002)(8676002)(81156014)(6486002)(86362001)(31686004)(478600001)(31696002)(52116002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZcie0BHmMkOQvfT+2hm7jKlMLxOtK7C5XkUx2WRLnQl9Yz6ga+DFs2s0bi0igeMu6Qn2wvLy9/SahDeO9XrcEMe7OXnthgfMQ71Y4O+PkIV7/Fn0HlSFSiVLZAcgOyXNEdMYLdOAJYp+ygnB4xzI0hgvxAhyzx/mbha5MD8DucBp/8TBhx7vn3FHDrNry7cgT+XsRzCa4uof1eoXqxYmOkmH+qjLZ4HgfAO48IFcCqjB9sOhnfRG8SMevz/rRuAFNtCTYtBh3D6BCnTqQD0YC+lBw1ymu+0idQoIRUBQJrKVYxEMZIMlnnhfnhdgwP81UNinF0wW5ZmSTf15zXIlU+JVd2xn5lcp/ID8LXYHDwBHyGJwRzBEoPE9v0PAF7KEMir8hN+xeQG9rbKPqN8Cooouc/Nwsv8TGpJlrBjbuDFy8d30K+KUF4/ZKHhak7e
X-MS-Exchange-AntiSpam-MessageData: Lj7Uq8lbQ8PgP/bBM7MW9icBAftF9EqQn2pzSWLv8FZQBZ9G6amJfUqqy2lNyzyvLTMgTvfBr1UXuG0/4k/iWr0EgcFCPukey52ul/uYA4n4JeGhdmG+TBWxtsCgs9A2tWoUXh/okrGq/DgHlMZ9/qOdHjwpUsZe8CQqKJIE5woRQtwB2u4uFZLKg8qNa20+LjK2ARaC+7Q7svAYCaIlmgb3tttoBNOFpJ7fpRc0yxmfHHXporZhwjBggH/sxnBZP+Q9q90KWkfEc+3v93fI0SO8QUCbqe9Gbg++dkpxJ7y7PQCECvR9GBwVhR1qSslk1I0IBqdzMrxJEGtt5KpB935Yt25b/iLyVNhx86dpGyYXfvaxrtyA0ff3iGCMi37ujxWlHRxVh8XNtgq1Ir9EzgiVZrjh6pe5yx2UUsXmU2RVzPAFJN4sM6UTxDsNaiKPKjNkf6Egdqq5skEHaxYmYHEJZOdahweaQBUnWiw+oQz0peJHAguEWlzw7TpQJEa2w8d4NqthQ/NlNVvVAVDkRtOnbL+t+77cN1Kfmn3i81T4T5bxAMnECvNNMpXrY3y0yazFUGkGV6+W07zg0t+AwJkoPudjU4DjEIqnkw1tDgIG1s8oJjSHMkXiCRNytdq2q0IWKKwMCcaQr85fqOkrTLxpDq1Ek6pEIvH0PC9iNieOkkuPhwMaXBOgS1nQKsFmjEDSo0zQ+qeeFVDWufybZzHTbGEij4JeJoBQb7hE3ne6BZhxqbtsk+nn9TzImbTF8ezyMTkn79U5/rzzv1MgiY+kYnQrk0Ch0ltAjA13YaJ3+sOisWUY+jPkKaT4rKDQzw2686mfHIl1Js5jGQ9JuoHtgNzdan1yueE0rSX3R7w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2071363-c7e7-44c5-50c5-08d7e5c3a3d4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:14:32.8508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaJ3wC+x63XLjZ+Vxuefvo196A6+X3/DGpTgILskmealbpcyi/LufiYdIkGeSUEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3851
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDQuMjAgdW0gMDQ6NDEgc2NocmllYiBZdWVIYWliaW5nOgo+IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYzogSW4gZnVuY3Rpb24gYW1kZ3B1X2pvYl9zdWJtaXQ6
Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jOjE0ODoyNjogd2Fybmlu
ZzogdmFyaWFibGUgcHJpb3JpdHkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KPgo+IGNvbW1pdCAzM2FiY2IxZjVhMTcgKCJkcm0vYW1kZ3B1OiBzZXQgY29tcHV0
ZSBxdWV1ZSBwcmlvcml0eSBhdCBtcWRfaW5pdCIpCj4gbGVmdCBiZWhpbmQgdGhpcywgcmVtb3Zl
IGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
PgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgfCAy
IC0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPiBpbmRleCAzNWMzODFlYzA0MjMuLjQ3MjA3MTg4YzU2
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPiBAQCAtMTQ1
LDcgKzE0NSw2IEBAIHZvaWQgYW1kZ3B1X2pvYl9mcmVlKHN0cnVjdCBhbWRncHVfam9iICpqb2Ip
Cj4gICBpbnQgYW1kZ3B1X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgc3RydWN0
IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKPiAgIAkJICAgICAgdm9pZCAqb3duZXIsIHN0cnVj
dCBkbWFfZmVuY2UgKipmKQo+ICAgewo+IC0JZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3Jp
dHk7Cj4gICAJaW50IHI7Cj4gICAKPiAgIAlpZiAoIWYpCj4gQEAgLTE1Nyw3ICsxNTYsNiBAQCBp
bnQgYW1kZ3B1X2pvYl9zdWJtaXQoc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgc3RydWN0IGRybV9z
Y2hlZF9lbnRpdHkgKmVudGl0eSwKPiAgIAo+ICAgCSpmID0gZG1hX2ZlbmNlX2dldCgmam9iLT5i
YXNlLnNfZmVuY2UtPmZpbmlzaGVkKTsKPiAgIAlhbWRncHVfam9iX2ZyZWVfcmVzb3VyY2VzKGpv
Yik7Cj4gLQlwcmlvcml0eSA9IGpvYi0+YmFzZS5zX3ByaW9yaXR5Owo+ICAgCWRybV9zY2hlZF9l
bnRpdHlfcHVzaF9qb2IoJmpvYi0+YmFzZSwgZW50aXR5KTsKPiAgIAo+ICAgCXJldHVybiAwOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
