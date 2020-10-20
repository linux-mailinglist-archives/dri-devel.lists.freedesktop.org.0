Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF241293AF0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 14:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D986EC53;
	Tue, 20 Oct 2020 12:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E906EC53
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 12:06:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSGiKHl4J7FZsu3sCxPmpn5wl4E48e9m5B2dhvIfich3odCSe3t7EdG93PC2ZOIO+vyrukFhfX3mCsIy8sXTj5A2rDdgiDOr2u/KDdEvyeXyCkRTcNdqaaKuVeGjvKTCDMC+G/cf5p9MoskH5S/Z5/bYHrF4L7S/maEnkOJ3nAVhhXAvmpoRcz1Nv5AXGn6QS138na1ip2UrAGbr3A/OMiKNbIs/tE1sMyIJYhRQNTj2HH/1d39FWe/glBMTsa4mL1UJ0wFEyAFsRHkUEuF8LPGP3m/fLgzffgohrk5vaFhXMo96xuG12xD56dNiSAxwSjhQHB9WSplhO9ocLLx3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7YQOY8NPMsBTf1s6fdimdBlkfJb/mxsBeHDNNcjEJs=;
 b=CcvVKfqUCV7J3N6uRwnnFRWNC6ztRA5VNFEcksqymJ1Ar1OMt/iDWvIs68QHLO6JiHMCxa5s7HSYcnFj3GYOwZqjTXh+x+5Q9mnIN0QMCQY9OiSVE1McYnSBVmsALeqUmyTC5qSV/5hRWYJKJJPifqa5pRDIIAG9ecMiEzrp7hx6X5g6k/7AYAXPqsUqhe4kqQteRxBEd7X9dTiye3VA4jvhl8TGfeEP3/4kYIdTKwdEchjMRjyC7ApxvSwzyAicYcBLOmqKo0Ktr1XSVdJfKOqB7aUJO0sddyyU+0jI9oyWO3TVwiNbdUpVQNpGVcwjJQ4J+5/BbasqONtY7iXK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7YQOY8NPMsBTf1s6fdimdBlkfJb/mxsBeHDNNcjEJs=;
 b=z5XIKsfwtymrTYXSBQhHnTx0c1xY/D9fTi3TCotK6pXkGBHYqmzfhiDGaugwb9hdb55iIzxLWfSMgay+GpwgMJz3nAQN2UfoNOqf/z25EH1Y04cVnPLw5awv5Pd1fIbncqQi7WBZ9Liegwe8ygugR+sBaFCjTukWxuqJsSHuPxQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 20 Oct
 2020 12:06:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 12:06:08 +0000
Subject: Re: [PATCH 5/7] drm/ttm: remove move to new and inline into
 remainging place.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201020010319.1692445-1-airlied@gmail.com>
 <20201020010319.1692445-6-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <abb5fd9c-ad63-b1d7-2268-1b8834e60fce@amd.com>
Date: Tue, 20 Oct 2020 14:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020010319.1692445-6-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:208:be::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0106.eurprd04.prod.outlook.com (2603:10a6:208:be::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 12:06:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47035892-88cc-461f-d531-08d874f08750
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4689EB13694CE283A712E000831F0@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDcivHRwf9YsyQTbeR8IrBRGVyPBbXlpwRiStU8NCytc/0oPVJ29/tAtijwF8zwQmP8sGB+AZvpEa2cA5WMFuZ7D53Wgc8UiChG43yWgfsMaGgw2/ydrSXJhtJovS0/j5XUYLSJc0gEEKgDIFE30PJibMXYQeq0CrKHLE1nEAVYhJIs4VvV7cppj/zArIWEWmnf+xqmBbD1ynVCdI/FQK2vVkczRXnzv/XE/bwNfE6kDSZIRMB+NtX88gRAb3Vk4OX/IRqRH/zNMai5aWhUVGz+wZ0heu7zaTmLPXPX23pAX6rSlTGK+QxjrJyKaQlOoIqKJ7D3hJCIrzSKFfL/ojxyMaCvVOQsTkcj7VPsnzSJJtIhX5CVx4793cB19ejep
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(66476007)(66556008)(66946007)(6666004)(31686004)(86362001)(83380400001)(5660300002)(2906002)(16526019)(186003)(36756003)(316002)(8676002)(31696002)(6486002)(52116002)(8936002)(478600001)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B4RAPNNsP+xHXBSupDUL00Q3Zi39jcRRyEnvUNIOoQfwAsLZ37aYYpyiOI9jThF+aN760mC/TmRnXG3S5CWFjHH+t2+E33V0BnBWldqQsABljIm+bjj4ersXoC/ZLJlZLQzQkkzNLc09epeN4bzi/5fC8wBHx/oiBdB/ZhOWKViJvk5eGo/b+MOSKmwZtILuCLJbexu04TdlGlSRv+pyb4FhtasjzSh22PDxZw3+BT4nqRLnDmVXFokhHuOA5Ctq8x1m1qYcqBRrR5MfGptZAy6nRzRXbRAWdaLerrPIc2VwrzfoTShvY3JU+hYZqNOBfOSsZ4VgJLYxwWCG29fSpY5XgZJPwsN0hytHQwdxDClBc9RmupmN6SnDJIQ1BTwDGU8XNZjGGsMV1hjC7cw7NkHDoVIiRkRlQtjG/5AHi6NUh19Bity2YtoWUhvgfaCj+MDcnlI0wPEd1Eu/GDmFuHNA0a6/6AIGL9X7ods4NvCOzwe4yeXRxB4MQXXyQnUBt35Cpo/+ul+XOkhHDFlk/bkzP1zUeRYauvc10tguA2Ny5J9gCAqXqeQFul5wNGKicNNOanKl3iduvY9k1FzfQTTnkm+FBN6cCGKCRTE+M1J2yc9M6a8emtHH62X9FRQlQk0PnsfST1J+sUkVCL1quEHh5xgwhueKpRpTimBcAOUOD9hmAiNdKdSKPS+YqFNi+9I/zvMH08AUIuYHCN5LWQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47035892-88cc-461f-d531-08d874f08750
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 12:06:08.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfflOjrbe31F2dr+64nCvO4KD33xW1vvTUD+k54CqX7l8PE8GUYmHkuuQ3CNit6T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMTAuMjAgdW0gMDM6MDMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBzaG93IHRoZSByZW1haW5pbmcgYmlu
ZCBjYWxsYmFjaywgd2hpY2ggbXkgbmV4dCBzZXJpZXMgb2YKPiBwYXRjaGVzIHdpbGwgYWltIHRv
IHJlbW92ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgICB8IDE2ICsr
KysrKysrKy0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDIw
IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
ICAgfCAgNCAtLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzEgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRleCAzNThkMDllZjg1MmEuLjcwNWVh
M2VmOTFmOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC0yNTIsOSArMjUyLDE1IEBAIHN0
YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAo+ICAgCQlpZiAocmV0KQo+ICAgCQkJZ290byBvdXRfZXJyOwo+ICAgCj4gLQkJcmV0ID0g
dHRtX2JvX21vdmVfdG9fbmV3X3R0X21lbShibywgY3R4LCBtZW0pOwo+IC0JCWlmIChyZXQpCj4g
LQkJCWdvdG8gb3V0X2VycjsKPiArCQlpZiAobWVtLT5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVN
KSB7Cj4gKwkJCXJldCA9IHR0bV90dF9wb3B1bGF0ZShiby0+YmRldiwgYm8tPnR0bSwgY3R4KTsK
PiArCQkJaWYgKHJldCkKPiArCQkJCWdvdG8gb3V0X2VycjsKPiArCj4gKwkJCXJldCA9IGJkZXYt
PmRyaXZlci0+dHRtX3R0X2JpbmQoYm8tPmJkZXYsIGJvLT50dG0sIG1lbSk7Cj4gKwkJCWlmIChy
ZXQpCj4gKwkJCQlnb3RvIG91dF9lcnI7Cj4gKwkJfQo+ICAgCX0KPiAgIAo+ICAgCWlmIChiZGV2
LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+IEBAIC0xNDg5LDcgKzE0OTUsMyBAQCB2b2lkIHR0bV9i
b190dF9kZXN0cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gICAJYm8tPnR0bSA9
IE5VTEw7Cj4gICB9Cj4gICAKPiAtaW50IHR0bV9ib190dF9iaW5kKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8sIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAtewo+IC0JcmV0dXJuIGJv
LT5iZGV2LT5kcml2ZXItPnR0bV90dF9iaW5kKGJvLT5iZGV2LCBiby0+dHRtLCBtZW0pOwo+IC19
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IGluZGV4IDIxODExYmJkYTJlNC4uZmFlMzFm
N2Y1YzM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IEBAIC00NSwyNiArNDUs
NiBAQCBzdHJ1Y3QgdHRtX3RyYW5zZmVyX29iaiB7Cj4gICAJc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibzsKPiAgIH07Cj4gICAKPiAtaW50IHR0bV9ib19tb3ZlX3RvX25ld190dF9tZW0oc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAtCQkJICAgICAgc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgsCj4gLQkJCSAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4g
LXsKPiAtCWludCByZXQ7Cj4gLQo+IC0JaWYgKG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0pCj4gLQkJcmV0dXJuIDA7Cj4gLQo+IC0JcmV0ID0gdHRtX3R0X3BvcHVsYXRlKGJvLT5i
ZGV2LCBiby0+dHRtLCBjdHgpOwo+IC0JaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiAtCQlyZXR1
cm4gcmV0Owo+IC0KPiAtCXJldCA9IHR0bV9ib190dF9iaW5kKGJvLCBuZXdfbWVtKTsKPiAtCWlm
ICh1bmxpa2VseShyZXQgIT0gMCkpCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gLQlyZXR1cm4gMDsK
PiAtfQo+IC0KPiAgIGludCB0dG1fbWVtX2lvX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCj4gICAJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0pCj4gICB7Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oCj4gaW5kZXggZmJiY2YxMDY3MGMxLi4wYzRlZmMxNjlmNDYgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBAQCAtNTYwLDEwICs1NjAsNiBAQCBpbnQgdHRt
X21lbV9pb19yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgdm9pZCB0dG1f
bWVtX2lvX2ZyZWUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJCSAgICAgc3RydWN0
IHR0bV9yZXNvdXJjZSAqbWVtKTsKPiAgIAo+IC1pbnQgdHRtX2JvX21vdmVfdG9fbmV3X3R0X21l
bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+IC0JCQkgICAgICBzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCwKPiAtCQkJICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21l
bSk7Cj4gLQo+ICAgLyoqCj4gICAgKiB0dG1fYm9fbW92ZV9tZW1jcHkKPiAgICAqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
