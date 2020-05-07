Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F41C8594
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFBB6E0CD;
	Thu,  7 May 2020 09:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EFA6E0BF;
 Thu,  7 May 2020 09:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRwjQP6bLUPTKrujTWdTscIyHhBQCO+Pj8xuf4r252YN53+hyo0c9Ro0pnct5jfaJR23UyOyQRO3AhciQdhDrbCua+iWmjoqHwJLdqGOfnf82BqKKrgyXaYlLswHD2QrwiJOREkzYFQITjAYcgwstswkTZ4N+eyWY4vMDrzmzTGZfCjr1aQ1XFmkFx5dr3wKSS3Jgs3HmtZIGO3NrA83OqTOhLEujKVOtkT6eshA6BIpskYel64StJh9EFgCSHXYtMiNN6oag7SdWEhSo4/0Dt1pAYNIM2k4uOgCdj0P81ebC/55i3Gjm51Wu0ufKsQGoiR0fNxt/M6XivM2rO+Vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCCPTFIUHgWP50dB2ZBZ4ttO3vm4uOwLl7RB5aZRZ2A=;
 b=bf+eIKWCrRnhkJfdGMZektNlyiq8sEKBbNhkqSu0yxYgTsgoAGiwqo0eHKggwnxwxv3DZFiCRfPPQON+rB8w7wk6YVmfbUGLSwQs1+lbAWwdNefgF11XNpEwTvnN7DYMcF5QXoVMJ+wUzo7T3/kW55kXtv+JP6a0AsxC82xdyrRxgJUKAwhGxJRXdibUdkrypJUYJla/UsLSqgyhtDtNpnHQebOu2xLWDYn4IoFlYf0+txp37RyD63BX1t5j06oP2c1c202dWw9GXOzzJDz7bmAhwQ3w07Q87e/ijDJZS0IIIwbPbXEG6HKBAntpqNekAg1aJIJgSZIj/aDYeONhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCCPTFIUHgWP50dB2ZBZ4ttO3vm4uOwLl7RB5aZRZ2A=;
 b=i8I0tydL7GMPTzNA7r6t25PhN9lEHRGfjaFJFkNdcKcAW73KHm0JEJCuja+qYvX5QYXkNiGhAhB1zzNi6NDKneEjcbCCvhvz0Xfx+kOZHlzkmNdaHK+rGjm9O0E/ZMz6FxP0oUsWgjOSARD94qFvjcHRnq+huAnUuAxJof/WuQI=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2620.namprd12.prod.outlook.com (2603:10b6:5:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 09:22:17 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.027; Thu, 7 May 2020
 09:22:17 +0000
Subject: Re: [PATCH v2] drm/amd/amdgpu: cleanup coding style a bit
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tom St Denis <tom.stdenis@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ori Messinger <Ori.Messinger@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200507091311.10898-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <462b6a26-2c25-f83a-887e-6d3a30072e71@amd.com>
Date: Thu, 7 May 2020 11:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200507091311.10898-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::15) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0074.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Thu, 7 May 2020 09:22:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0b449f4-3ce2-4ca2-0340-08d7f26822f3
X-MS-TrafficTypeDiagnostic: DM6PR12MB2620:|DM6PR12MB2620:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2620A6D8686BC313A3DA999E83A50@DM6PR12MB2620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfR0D+JZRYPD515G25K4vZ7IO0ierZLxk8T6OD3XBU1wHE3Ktzq5q26Cb2fYdkuBTl96yeRqyf2XtGgIxz66tTUXgMj8lCUWF/Lyg28+tgmyAZ4TkRR24xg/s1IfcZ5MyoAGov5XnEzzYY89ZSEJlLUYWaZ7iB9QU4JTqGgdfSdpxQgDYikRw00gqqhMBl8+I3yAmUUNrP5H2d6EHUhSSqWJhoQQ61zP5m0/n1rsRjutQ+oNKxRwMLBGb2MaOMjTvbkXJat9NsUqzs3IyH2lbxQWEWiK3M2cqwabII1uEc8mYb66NhKPCx52b/nhQOvsfYudVVWhnQYAI51WLA+y+dJYXyld3PAa9xuvd2YXoHPi24hJbEijGy1JmlQS6OTUDzWMh8ZiVpOaHxiqDdwakXLGeAR7yFxUKZBNwG+9VliLxdALTMJ8SZWQeAJPTD0Pp+ZNARDBPHU4jvgHos+3JcFLz97V6X2RZE1eqcKStD44Go2izfgUd997LNe0qIX5UaU6WUJMxEDaSysKgCrNCUG6JVl91IggQnLRHdZr+AwechYXlPoZmLoE+rwav7z9TKRrLYrz3LNjk6HhLzTeXSJX/dcUfpVM8SVX0A4B0WHs/3fkeLeDnD/kWyRVQ2YOD3WKOcH9lBYpQ5QvmqQL5wGAUIzgHqxoJptYuuKDNhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(33430700001)(66476007)(45080400002)(8936002)(86362001)(6666004)(478600001)(36756003)(2616005)(66574014)(66556008)(5660300002)(83310400001)(4326008)(8676002)(83300400001)(83290400001)(83280400001)(83320400001)(6486002)(33440700001)(110136005)(16526019)(186003)(52116002)(31696002)(316002)(2906002)(31686004)(66946007)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5F8fWlYvCQKKBsymzzPJvmYzY48jyp88dJHUoSvOasclpDrY7J7pqKm14wUVD+W0CaffikJAjc1ljYAcnaOp/quWcHYbrtk/z9psQLJ6CKzQg+RVcLA5Vy/5mk6PNY/wPmOL2jflZ4zf5Fx65y3oV4M6IL3Cech9BCj57FJG2fdzf63l3su/naJUzB9mAOxbGiE8LjU3HxTp1VGiFwPDkF8XFNMC84Q83Muc9Cz6wFFX7TvtZ/F8sqvRAida+eY7mlVoRrXuByYeKd+VOYmy7ejOLlfIMF4OSogd1DIP/NezKsc8UL8m9iZW01myJGdgDT1o3V5hsRWgD+dYN74/hdql7RFEGBDmWIB9L/lG7fU7gIBAfsDYWFzfmy/KHL2Jqp1UWC+ytRAmeNtGAmHW56SaNX7V+V5Wb0D2AAccGkKrjw1uAjhWVzSz++07Zcq+Cptwrkc+yuoPA7eKIGdo85WWmJSPmxaDKuI6tao0Ry26snClOeINRh1VxNNMuFwpBDaiHlbs7nE2XhLDn2MPnVuJe50edTw8wC1/Hpw8wr21GzKMPi5xtYjwv5lIOeVmiYxa1VbKoyxVgsOHH9kMLPKG1aBcgPZkHntWNqQDzy/IPC6/6xTF5UqxZ5bfmEDPMhRPN04RycUBWWcP5c6xmv4esyK25xbNPspZmEGf8Y3bU9/APkHVbi26Lvgla8SiW1zTXkXxbv7xdT6WDg5pkWunWwlzks9zbfwXoQjPQvgYInheUeU+2g5Jx9ilNbKoVcKf7RsWIsvM01uxdD60sfeS/4Fcr5qOzk0dEuqei8FEjuuBD0jS2KOZwEK8dp+6UniggsjB3wq0RNofZNpZcoBmtIEvKECPfKfX0WA+SX8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b449f4-3ce2-4ca2-0340-08d7f26822f3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 09:22:17.4121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwKVN9id8KyVStT0CsZo7RlI5TdFiNsXAJvF2p72/n5ZBcQqmsAPXrzDRIB4SC5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2620
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDUuMjAgdW0gMTE6MTMgc2NocmllYiBCZXJuYXJkIFpoYW86Cj4gVGhlcmUgaXMgREVW
SUNFX0FUVFIgbWVjaGFuaXNtIGluIHNlcGFyYXRlIGF0dHJpYnV0ZSBkZWZpbmUuCj4gU28gdGhp
cyBjaGFuZ2UgaXMgdG8gdXNlIGF0dHIgYXJyYXksIGFsc28gdXNlCj4gc3lzZnNfY3JlYXRlX2Zp
bGVzIGluIGluaXQgZnVuY3Rpb24gJiBzeXNmc19yZW1vdmVfZmlsZXMgaW4KPiBmaW5pIGZ1bmN0
aW9uLgo+IFRoaXMgbWF5YmUgbWFrZSB0aGUgY29kZSBhIGJpdCByZWFkYWJsZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+Cj4gQ2hhbmdlcyBz
aW5jZSBWMToKPiAqVXNlIERFVklDRV9BVFRSIG1lY2hhbmlzbQo+Cj4gTGluayBmb3IgVjE6Cj4g
Kmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRnBhdGNod29yayUyRnBhdGNoJTJGMTIyODA3NiUy
RiZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MwNzNiOTA0
M2JlNTM0NmIzYzkwYzA4ZDdmMjY2ZTZmYiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2MzcyNDQzOTYwOTY3MzUyMjMmYW1wO3NkYXRhPVBqRnNZdm13MnB2Vmlz
WjZUek1xT3lvU3IwbTNEc0ZOJTJGMHElMkIlMkZmQnhBQ2clM0QmYW1wO3Jlc2VydmVkPTAKPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jIHwgNDMg
KysrKysrLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
LCAzMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92cmFtX21nci5jCj4gaW5kZXggODJhMzI5OWU1M2MwLi41N2JiYzcwNjYyZmYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+IEBAIC0xNDgs
NiArMTQ4LDE1IEBAIHN0YXRpYyBERVZJQ0VfQVRUUihtZW1faW5mb192aXNfdnJhbV91c2VkLCBT
X0lSVUdPLAo+ICAgc3RhdGljIERFVklDRV9BVFRSKG1lbV9pbmZvX3ZyYW1fdmVuZG9yLCBTX0lS
VUdPLAo+ICAgCQkgICBhbWRncHVfbWVtX2luZm9fdnJhbV92ZW5kb3IsIE5VTEwpOwo+ICAgCj4g
K3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICphbWRncHVfdnJhbV9tZ3JfYXR0cmlidXRlc1tdID0g
ewo+ICsJJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1fdG90YWwuYXR0ciwKPiArCSZkZXZfYXR0cl9t
ZW1faW5mb192aXNfdnJhbV90b3RhbC5hdHRyLAo+ICsJJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1f
dXNlZC5hdHRyLAo+ICsJJmRldl9hdHRyX21lbV9pbmZvX3Zpc192cmFtX3VzZWQuYXR0ciwKPiAr
CSZkZXZfYXR0cl9tZW1faW5mb192cmFtX3ZlbmRvci5hdHRyLAo+ICsJTlVMTAo+ICt9Owo+ICsK
PiAgIC8qKgo+ICAgICogYW1kZ3B1X3ZyYW1fbWdyX2luaXQgLSBpbml0IFZSQU0gbWFuYWdlciBh
bmQgRFJNIE1NCj4gICAgKgo+IEBAIC0xNzIsMzEgKzE4MSw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZyYW1fbWdyX2luaXQoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICAJbWFu
LT5wcml2ID0gbWdyOwo+ICAgCj4gICAJLyogQWRkIHRoZSB0d28gVlJBTS1yZWxhdGVkIHN5c2Zz
IGZpbGVzICovCj4gLQlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0
dHJfbWVtX2luZm9fdnJhbV90b3RhbCk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJRFJNX0VSUk9SKCJG
YWlsZWQgdG8gY3JlYXRlIGRldmljZSBmaWxlIG1lbV9pbmZvX3ZyYW1fdG90YWxcbiIpOwo+IC0J
CXJldHVybiByZXQ7Cj4gLQl9Cj4gLQlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2
LCAmZGV2X2F0dHJfbWVtX2luZm9fdmlzX3ZyYW1fdG90YWwpOwo+IC0JaWYgKHJldCkgewo+IC0J
CURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1faW5mb192aXNfdnJh
bV90b3RhbFxuIik7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCXJldCA9IGRldmljZV9jcmVh
dGVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9tZW1faW5mb192cmFtX3VzZWQpOwo+IC0JaWYg
KHJldCkgewo+IC0JCURSTV9FUlJPUigiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1f
aW5mb192cmFtX3VzZWRcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQlyZXQgPSBkZXZp
Y2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2luZm9fdmlzX3ZyYW1fdXNl
ZCk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gY3JlYXRlIGRldmlj
ZSBmaWxlIG1lbV9pbmZvX3Zpc192cmFtX3VzZWRcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9
Cj4gLQlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfbWVtX2lu
Zm9fdnJhbV92ZW5kb3IpOwo+IC0JaWYgKHJldCkgewo+IC0JCURSTV9FUlJPUigiRmFpbGVkIHRv
IGNyZWF0ZSBkZXZpY2UgZmlsZSBtZW1faW5mb192cmFtX3ZlbmRvclxuIik7Cj4gLQkJcmV0dXJu
IHJldDsKPiAtCX0KPiArCXJldCA9IHN5c2ZzX2NyZWF0ZV9maWxlcygmYWRldi0+ZGV2LT5rb2Jq
LCBhbWRncHVfdnJhbV9tZ3JfYXR0cmlidXRlcyk7Cj4gKwlpZiAocmV0KQo+ICsJCURSTV9FUlJP
UigiRmFpbGVkIHRvIHJlZ2lzdGVyIHN5c2ZzXG4iKTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAg
fQo+IEBAIC0yMTksMTEgKzIwNiw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX2Zpbmko
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCj4gICAJc3Bpbl91bmxvY2soJm1nci0+
bG9jayk7Cj4gICAJa2ZyZWUobWdyKTsKPiAgIAltYW4tPnByaXYgPSBOVUxMOwo+IC0JZGV2aWNl
X3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1fdG90YWwpOwo+
IC0JZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3Zpc192
cmFtX3RvdGFsKTsKPiAtCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZfYXR0cl9t
ZW1faW5mb192cmFtX3VzZWQpOwo+IC0JZGV2aWNlX3JlbW92ZV9maWxlKGFkZXYtPmRldiwgJmRl
dl9hdHRyX21lbV9pbmZvX3Zpc192cmFtX3VzZWQpOwo+IC0JZGV2aWNlX3JlbW92ZV9maWxlKGFk
ZXYtPmRldiwgJmRldl9hdHRyX21lbV9pbmZvX3ZyYW1fdmVuZG9yKTsKPiArCXN5c2ZzX3JlbW92
ZV9maWxlcygmYWRldi0+ZGV2LT5rb2JqLCBhbWRncHVfdnJhbV9tZ3JfYXR0cmlidXRlcyk7Cj4g
ICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
