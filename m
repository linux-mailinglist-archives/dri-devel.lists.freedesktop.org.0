Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3399FD02
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152C89CD8;
	Wed, 28 Aug 2019 08:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1711789BD5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:47:28 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 2sfri8VpszaKO2sfuiJwX8; Wed, 28 Aug 2019 09:47:27 +0200
Subject: Re: [PATCHv10 2/2] cec: document CEC_ADAP_G_CONNECTOR_INFO and
 capability
To: Dariusz Marcinkiewicz <darekm@google.com>
References: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
 <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
 <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2dbba304-5493-9934-1745-480e364b8663@xs4all.nl>
Date: Wed, 28 Aug 2019 09:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQHL0WQVJiHDs6TZbgfD8-PEuAKGfyv1JGA5cLTY4LSm+g@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDX/0Tg3KpITFa1Glcic4bkhqFO76n7FdHnaW1tbm6KszQ3luPPlI3HYhPY6Os3lo2pgbwYEG8T/3MhjoF/tSaCTQ53+qp/4NmYCWV6ZyW/0bGfhunBP
 zHziLuU1Yx9qhEvZK7Id9s3pj6+O2X8ASTxyB+ETgu1MFZZspwbIVT7z6tv9LT1K9Y6PMFfHAg9pxwBjF/rEopHAp7JuGV1Mx6q3SWMvBdinbHnei1M2b4jI
 WeMqfn8QRPY4LPWJApspVOaOBa1yKv/xB5273A281nI=
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yOC8xOSA5OjI3IEFNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogd3JvdGU6Cj4gSGkuCj4g
Cj4gU2hvdWxkIHRoaXMgcGF0Y2ggYWxzbyBoYXZlIGFuIGV4cGxpY2l0IEZyb20gdGFnPwoKT29w
cywgc29ycnksIGl0IHdhcyBsb3N0IGF0IHNvbWUgcG9pbnQuCgpUaGlzIGlzIHRoZSBsaXN0IG9m
IGFsbCBjZWMgcGF0Y2hlcyBmb3IgZHJtOgoKaHR0cHM6Ly9naXQubGludXh0di5vcmcvaHZlcmt1
aWwvbWVkaWFfdHJlZS5naXQvbG9nLz9oPWNlYy1kcm0KClRoZSBmaXJzdCA1IHBhdGNoZXMgYXJl
IHB1c2hlZCAoZHJtX2RwX2NlYyB1cCB0byB2YzQpLCBidXQgdGhlCmRybV9kcF9jZWMvaTkxNS92
YzQgcGF0Y2hlcyB3ZXJlIHB1c2hlZCB0b28gbGF0ZSBmb3Iga2VybmVsIDUuNCA6LSgKClNvIG15
IHBsYW4gaXMgdG8gZ2V0IHRoZSBvdGhlcnMgaW4gZm9yIDUuNS4gSSdsbCBtZXJnZSB0aGUgbGFz
dAp0d28gcGF0Y2hlcyB0aGF0IGVuYWJsZSB0aGUgQVBJIGVhcmx5IGluIHRoZSA1LjUgY3ljbGUg
aW4gdGhlIG1lZGlhCnRyZWUgKHNvIHJpZ2h0IGFmdGVyIHY1LjQtcmMxIGlzIHJlbGVhc2VkKSBh
bmQgd29yayB0byBnZXQgdGhlIHJlbWFpbmluZwpBY2tzIGZvciB0aGUgb3RoZXIgZHJtIGNlYyBw
YXRjaGVzLgoKUmVnYXJkcywKCglIYW5zCgo+IAo+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDI6
MjEgUE0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Pgo+
PiBEb2N1bWVudCB0aGUgbmV3IENFQ19BREFQX0dfQ09OTkVDVE9SX0lORk8gaW9jdGwgYW5kIHRo
ZSBuZXcKPj4gQ0VDX0NBUF9DT05ORUNUT1JfSU5GTyBjYXBhYmlsaXR5Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29nbGUuY29tPgo+PiBDby1k
ZXZlbG9wZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgo+PiBb
aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOiBhZGRlZCBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPXQo+
PiBbaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOiBhZGRlZCBEUUVWRU5UIGhhdmVfY29ubl9pbmZv
XQo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5u
bD4KPj4gLS0tCj4gLi4uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
