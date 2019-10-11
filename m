Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3CCD46FF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 19:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2598A6E3E5;
	Fri, 11 Oct 2019 17:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68BD6E3E5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 17:55:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52A70AC71;
 Fri, 11 Oct 2019 17:55:37 +0000 (UTC)
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
To: Daniel Stone <daniel@fooishbar.org>, Rohan Garg <rohan.garg@collabora.com>
References: <20191011143009.17503-1-rohan.garg@collabora.com>
 <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <41425496-d121-8d51-991e-b3025b787c49@suse.de>
Date: Fri, 11 Oct 2019 19:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
Content-Language: en-US
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
Cc: kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDExLjEwLjE5IHVtIDE5OjA5IHNjaHJpZWIgRGFuaWVsIFN0b25lOgo+IEhpIFJvaGFu
LAo+IAo+IE9uIEZyaSwgMTEgT2N0IDIwMTkgYXQgMTU6MzAsIFJvaGFuIEdhcmcgPHJvaGFuLmdh
cmdAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+IERSTV9JT0NUTF9EVU1CX1NFVF9MQUJFTCBsZXRz
IHlvdSBsYWJlbCBHRU0gb2JqZWN0cywgbWFraW5nIGl0Cj4+IGVhc2llciB0byBkZWJ1ZyBpc3N1
ZXMgaW4gdXNlcnNwYWNlIGFwcGxpY2F0aW9ucy4KPiAKPiBJJ20gbm90IHN1cmUgaWYgdGhpcyB3
YXMgcG9pbnRlZCBvdXQgYWxyZWFkeSwgYnV0IGR1bWIgYnVmZmVycyAhPSBHRU0KPiBidWZmZXJz
LiBHRU0gYnVmZmVycyBfY2FuXyBiZSBkdW1iLCBidXQgbWlnaHQgbm90IGJlLgo+IAo+IENvdWxk
IHlvdSBwbGVhc2UgcmVuYW1lIHRvIEdFTV9TRVRfTEFCRUw/CgpUaGlzIGNoYW5nZSB0byBidWls
ZCB1cG9uIGR1bWIgYnVmZmVycyB3YXMgc3VnZ2VzdGVkIGJ5IG1lLCBhcyBkdW1iIApidWZmZXJz
IGlzIHRoZSBjbG9zZXMgdGhpbmcgdGhlcmUgaXMgdG8gYSBidWZmZXIgbWFuYWdlbWVudCBpbnRl
cmZhY2UuIApEcml2ZXJzIHdpdGggJ3NtYXJ0IGJ1ZmZlcnMnIHdvdWxkIGhhdmUgdG8gYWRkIHRo
ZWlyIG93biBpb2N0bCBpbnRlcmZhY2VzLgoKV2hhdCBJIHJlYWxseSBtaXNzIGhlcmUgaXMgYSB1
c2Vyc3BhY2UgYXBwbGljYXRpb24gdGhhdCB1c2VzIHRoaXMgCmZ1bmN0aW9uYWxpdHkuIEl0IHdv
dWxkIGJlIG11Y2ggZWFzaWVyIHRvIGRpc2N1c3MgaWYgdGhlcmUgd2FzIGFuIGFjdHVhbCAKZXhh
bXBsZS4KCkJlc3QgcmVnYXJkcwoKPiBDaGVlcnMsCj4gRGFuaWVsCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKVGhvbWFzIFppbW1l
cm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRz
dHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVy
LCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKSFJCIDIxMjg0IChBRyBOw7xybmJlcmcpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
