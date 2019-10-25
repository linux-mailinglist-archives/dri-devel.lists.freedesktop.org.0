Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E1E506A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 17:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9B16EABD;
	Fri, 25 Oct 2019 15:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B639E6EABD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 15:48:37 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57877
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iO1pL-0001Gm-QL; Fri, 25 Oct 2019 17:48:35 +0200
Subject: Re: [PATCH 2/2] drm/todo: Clarify situation around fbdev and defio
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch
References: <20191025092759.13069-1-tzimmermann@suse.de>
 <20191025092759.13069-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ec95eb62-3109-c53e-a58c-06cceb1dbc11@tronnes.org>
Date: Fri, 25 Oct 2019 17:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025092759.13069-3-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=soJKfWu1FKnz72O4UoQskBa/vHb6JEcrciHYT14ts+4=; b=Qzt+J4SxJSPBreefYpqj3kQgxO
 at5aDbXqdWVxk8FfxzIfNyGY6S3klq/XkN98zQWtRDyZyJYHx5d8tKP5Dco1OWPFgi6EuX20oHJxD
 oAztUT7+fTYLg3GlCe+MNF8HTDn9xwtCkwZ+BeKv0ZOHbDcTJH/PnMHc4B86OpH5ORLQ1NFyDFFd8
 l/vqoz2oZjiSFa12wf63+aRP56NwC20F7fwtH0mHMA5GMkoXBkDgTVDo1D6XwX9P5+y82bvmTu6Bd
 qz4zmqFE3evjxsIni2KDUagEkRWvKG7eCYswHQzRUBCO6tgQyJJjBnnt9s6iW0fprBXnVgdM43CmE
 yENK2XYw==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjUuMTAuMjAxOSAxMS4yNywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhlIFRP
RE8gaXRlbSBpcyBtaXNsZWFkaW5nIGFuZCBtYWtlcyBpdCBzZWVtIHRoYXQgZmJkZXYgZW11bGF0
aW9uCj4gY2Fubm90IGJlIHVzZWQgd2l0aCBTSE1FTS4gUmVwaHJhc2UgdGhlIHRleHQgdG8gZGVz
Y3JpYmUgdGhlIGN1cnJlbnQKPiBzaXR1YXRpb24gbW9yZSBjb3JyZWN0bHkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4g
IERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gaW5k
ZXggNzNjNTFiNWEwOTk3Li42NzkyZmE5YjZiNmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+IEBAIC0y
MDYsMTAgKzIwNiwxMCBAQCBHZW5lcmljIGZiZGV2IGRlZmlvIHN1cHBvcnQKPiAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIAo+ICBUaGUgZGVmaW8gc3VwcG9ydCBjb2RlIGluIHRoZSBm
YmRldiBjb3JlIGhhcyBzb21lIHZlcnkgc3BlY2lmaWMgcmVxdWlyZW1lbnRzLAo+IC13aGljaCBt
ZWFucyBkcml2ZXJzIG5lZWQgdG8gaGF2ZSBhIHNwZWNpYWwgZnJhbWVidWZmZXIgZm9yIGZiZGV2
LiBXaGljaCBwcmV2ZW50cwo+IC11cyBmcm9tIHVzaW5nIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxh
dGlvbiBjb2RlIGV2ZXJ5d2hlcmUuIFRoZSBtYWluIGlzc3VlIGlzCj4gLXRoYXQgaXQgdXNlcyBz
b21lIGZpZWxkcyBpbiBzdHJ1Y3QgcGFnZSBpdHNlbGYsIHdoaWNoIGJyZWFrcyBzaG1lbSBnZW0g
b2JqZWN0cwo+IC0oYW5kIG90aGVyIHRoaW5ncykuCj4gK3doaWNoIG1lYW5zIGRyaXZlcnMgbmVl
ZCB0byBoYXZlIGEgc3BlY2lhbCBmcmFtZWJ1ZmZlciBmb3IgZmJkZXYuIFRoZSBtYWluCj4gK2lz
c3VlIGlzIHRoYXQgaXQgdXNlcyBzb21lIGZpZWxkcyBpbiBzdHJ1Y3QgcGFnZSBpdHNlbGYsIHdo
aWNoIGJyZWFrcyBzaG1lbQo+ICtnZW0gb2JqZWN0cyAoYW5kIG90aGVyIHRoaW5ncykuIFRvIHN1
cHBvcnQgZGVmaW8sIGFmZmVjdGVkIGRyaXZlcnMgcmVxdWlyZQo+ICt0aGUgdXNlIG9mIGEgc2hh
ZG93IGJ1ZmZlciwgd2hpY2ggbWF5IGFkZCBDUFUgYW5kIG1lbW9yeSBvdmVyaGVhZC4KPiAgCgpB
aCB5ZXMsIHRoZXJlJ3MgYSB0b2RvIG9uIHRoaXMuIExvb2sgZ29vZCB0byBtZToKCkFja2VkLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KCj4gIFBvc3NpYmxlIHNvbHV0
aW9uIHdvdWxkIGJlIHRvIHdyaXRlIG91ciBvd24gZGVmaW8gbW1hcCBjb2RlIGluIHRoZSBkcm0g
ZmJkZXYKPiAgZW11bGF0aW9uLiBJdCB3b3VsZCBuZWVkIHRvIGZ1bGx5IHdyYXAgdGhlIGV4aXN0
aW5nIG1tYXAgb3BzLCBmb3J3YXJkaW5nCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
