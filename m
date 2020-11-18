Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7542B77E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2776E3F4;
	Wed, 18 Nov 2020 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B0389C09
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 01:04:38 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CbPhz4Ffjz6vPC;
 Wed, 18 Nov 2020 09:04:19 +0800 (CST)
Received: from [10.174.177.160] (10.174.177.160) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Wed, 18 Nov 2020 09:04:23 +0800
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: fix error return code in
 sun8i_dw_hdmi_bind()
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <1605488969-5211-1-git-send-email-wangxiongfeng2@huawei.com>
 <2294800.5ACB0rnJnf@kista>
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Message-ID: <2b800d8c-90c0-42a6-8335-acc5e9e84258@huawei.com>
Date: Wed, 18 Nov 2020 09:04:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2294800.5ACB0rnJnf@kista>
X-Originating-IP: [10.174.177.160]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, chenzhou10@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIwLzExLzE4IDE6NDcsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPiBEbmUgcG9uZWRl
bGplaywgMTYuIG5vdmVtYmVyIDIwMjAgb2IgMDI6MDk6MjkgQ0VUIGplIFhpb25nZmVuZyBXYW5n
IAo+IG5hcGlzYWwoYSk6Cj4+IEZpeCB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGZy
b20gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UgaW5zdGVhZAo+PiBvZiAwIGluIGZ1bmN0aW9uIHN1
bjhpX2R3X2hkbWlfYmluZCgpLgo+Pgo+PiBGaXhlczogYjdjNzQzNmE1ZmYwICgiZHJtL3N1bjRp
OiBJbXBsZW1lbnQgQTgzVCBIRE1JIGRyaXZlciIpCj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90
IDxodWxrY2lAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWGlvbmdmZW5nIFdhbmcgPHdh
bmd4aW9uZ2ZlbmcyQGh1YXdlaS5jb20+Cj4+IFJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8
amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gCj4gQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcywg
dGhhbmtzIQo+IAo+IEluIGZ1dHVyZSwgcGxlYXNlIENDIGFsbCBwZW9wbGUgZ2l2ZW4gYnkgZ2V0
X21haW50YWluZXIucGwgc2NyaXB0LiBJbiB0aGlzIAo+IGNhc2UgeW91IG1pc3NlZCBNYXhpbWUg
UmlwYXJkIGFuZCBDaGVuLVl1IFRzYWkuCgpTdXJlLCB0aGFua3MgZm9yIHJlbWluZGluZyBtZS4K
ClRoYW5rcywKWGlvbmdmZW5nCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPiAKPiAKPiAu
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
