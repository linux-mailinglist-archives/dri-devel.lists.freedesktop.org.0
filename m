Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325616141E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 15:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92B6E95D;
	Mon, 17 Feb 2020 14:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932E6E95D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A7DoHQzMcjstRT4VIaWX5MCnTC30F+k0NRTtXi92u1I=; b=VW3uCl3wq9QgGlam23qVN8I+9+
 SmA/CuXUhWBypAmjgnhxKxt7UkbuEBPCxHY7PCzFHnff7c4NqIHjzmf93OU1B+/QlpLczdp9Wlih+
 T4jpfEBBDwxNCdn6aL65MXFIK4kniY5j9EiGlfMoShjqXyZLGWfB/TMCPQnGPQv6HcDtvMS+LEqVv
 u7Jkd5CSJDtcF4jIl5UUW4o8H0KRh6uzpXF6gwIjI/tQjs5Ncf5KVZjelD9TFDfgBJDc/dmWzivhP
 /8UIT0evjXtary/ejsZQ9V89Qso+x/qqixyfNlEh8DIU6OJSmYTcKp6tsxFYJprzd0ZOVpQmLkjF7
 OUWLlBiA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53127
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j3h1G-00059d-4g; Mon, 17 Feb 2020 15:05:06 +0100
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 balbi@kernel.org, lee.jones@linaro.org
References: <20200216172117.49832-1-noralf@tronnes.org>
 <62e6e9b1-f44a-42ae-a971-8b947763284b@baylibre.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0ae9eda9-3e1a-d231-2a03-1877f5a3a0bb@tronnes.org>
Date: Mon, 17 Feb 2020 15:05:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <62e6e9b1-f44a-42ae-a971-8b947763284b@baylibre.com>
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
Cc: linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDIuMjAyMCAxMS4zMiwgc2tyZXYgTmVpbCBBcm1zdHJvbmc6Cj4gSGksCj4gCj4g
T24gMTYvMDIvMjAyMCAxODoyMSwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+PiBIaSwKPj4KPj4g
QSB3aGlsZSBiYWNrIEkgaGFkIHRoZSBpZGVhIHRvIHR1cm4gYSBSYXNwYmVycnkgUGkgWmVybyBp
bnRvIGEgJDUKPj4gVVNCIHRvIEhETUkvU0RUVi9EU0kvRFBJIGRpc3BsYXkgYWRhcHRlci4KPj4K
Pj4gVGhpbmtpbmcgYWJvdXQgaG93IHRvIHJlcHJlc2VudCB0aGUgZGlzcGxheSB0byB0aGUgZHJp
dmVyIEkgcmVhbGlzZWQKPj4gdGhhdCBoYXJkd2FyZSB1c2UgcmVnaXN0ZXJzIGFzIEFQSS4gQW5k
IExpbnV4IGRvZXMgaGF2ZSBhIGdlbmVyaWMKPj4gcmVnaXN0ZXIgYWJzdHJhY3Rpb246IHJlZ21h
cC4gRnVydGhlcm1vcmUgdGhpcyBtZWFucyB0aGF0IGlmIEkgY2FuIGRvIGEKPj4gcmVnbWFwIG92
ZXIgVVNCIGltcGxlbWVudGF0aW9uLCBpdCB3aWxsIGJlIGVhc3kgdG8gZG8gb3RoZXIgZnVuY3Rp
b25zCj4+IGxpa2UgZ3BpbywgYWRjIGFuZCBvdGhlcnMuIEFmdGVyIGEgZmV3IGl0ZXJhdGlvbnMg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQKPj4gdGhlIFVTQiBzdWJzeXN0ZW0gYW5kIHNhdGlzZnlpbmcg
ZHJpdmVyIHJlcXVpcmVtZW50cywgSSBub3cgaGF2ZQo+PiBzb21ldGhpbmcgdGhhdCBsb29rcyBw
cm9taXNpbmcuCj4+Cj4+IEknbSBzZW5kaW5nIG91dCBhbiBlYXJseSB2ZXJzaW9uIGhvcGluZyB0
byBnZXQgZmVlZGJhY2sgZXNwZWNpYWxseSBvbgo+PiB0aGUgY29yZSBwYXJ0cyB0aGF0IGhhbmRs
ZXMgcmVnbWFwIGFuZCBpbnRlcnJ1cHRzLgo+Pgo+PiBPdmVydmlldzoKPj4KPj4gICAgICAgICAg
IFVTQiBIb3N0ICAgICAgICAgIDogICAgICAgICBVU0IgRGV2aWNlCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA6Cj4+ICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tICA6ICAtLS0tLS0t
LS0tLS0tLS0tLS0KPj4gLS0tLS0tLS0tLSAgfCBtZmQ6IG11ZCAgIHwgIDogIHwgZl9tdWQgICAg
ICAgICAgfCAgLS0tLS0tLS0tLQo+PiB8IERyaXZlciB8ICAtLS0tLS0tLS0tLS0tLSAgOiAgfCAg
ICAgICAgICAgICAgICB8ICB8IERyaXZlciB8Cj4+IC0tLS0tLS0tLS0gIHwgcmVnbWFwLXVzYiB8
ICA6ICB8IChtdWRfcmVnbWFwKSAgIHwgIC0tLS0tLS0tLS0KPj4gICAgICAgICAgICAgLS0tLS0t
LS0tLS0tLS0gIDogIC0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+IAo+IFRoZSBpZGVhIGlzIHJlYWxs
eSBsaWtlIEFSQSdzIGdyZXlidXMsIGJ1dCBtdWNoIHNpbXBsZXIgIQo+IEFueXdheSBuaWNlIGlk
ZWEsIGRvIHlvdSBoYXZlIGdvb2QgcGVyZm9ybWFuY2Ugb3ZlciBVU0IyIGFuZAo+IFJQaSdzIGF3
ZnVsIERXQzIgZ2FnZGV0IGNvbnRyb2xsZXIgPwo+IAoKTm90IGFzIGdvb2QgYXMgSSB3YXMgaG9w
aW5nIGZvci4gSWYgSSBkaXNhYmxlIGNvbXByZXNzaW9uIEknbSBnZXR0aW5nIDUKZnBzIGZvciBh
IDEuNU1CIGZyYW1lYnVmZmVyICg3ODAwIGtCL3MpOgoKJCBtb2RldGVzdCAtTSBtdWRfZHJtIC1z
IDM1OjEwMjR4NzY4QFJHMTYgLXYKc2V0dGluZyBtb2RlIDEwMjR4NzY4LTYwLjAwSHpAUkcxNiBv
biBjb25uZWN0b3JzIDM1LCBjcnRjIDMzCmZyZXE6IDUuMDdIegoKV2hlbiBJIHRyaWVkIHJlYWRp
bmcgSSBkaXNjb3ZlcmVkIHRoYXQgaXQgd2FzIGFsbW9zdCAzIHRpbWVzIGZhc3RlciB0aGFuCndy
aXRpbmcuCgpUaGUgemVybyBnYWRnZXQgKGxvb3AgdGVzdGluZykgY29uZmlybWVkIG15IGZpbmRp
bmdzOgoKRGV2aWNlOgokIHN1ZG8gbW9kcHJvYmUgZ196ZXJvClsgICA0NC4yMjE4OTBdIHplcm8g
Z2FkZ2V0OiBHYWRnZXQgWmVybywgdmVyc2lvbjogQ2luY28gZGUgTWF5byAyMDA4ClsgICA0NC4y
MjE5MDZdIHplcm8gZ2FkZ2V0OiB6ZXJvIHJlYWR5ClsgICA2MC43NTE0NTFdIHplcm8gZ2FkZ2V0
OiBoaWdoLXNwZWVkIGNvbmZpZyAjMzogc291cmNlL3NpbmsKCkhvc3Q6CgokIHN1ZG8gfi90ZXN0
dXNiIC1hIC10IDxuPiAtZyA2NCAtcyAxNjM4NAovZGV2L2J1cy91c2IvMDAxLzAxMCB0ZXN0IDI3
LCAgMTA3LjIzMDY2OSBzZWNzCS0+IDEwMDAgLyAxMDcgPSAgOU1CL3MKL2Rldi9idXMvdXNiLzAw
MS8wMTAgdGVzdCAyOCwgICAzNy43OTEyOTIgc2VjcwktPiAxMDAwIC8gMzcgID0gMjdNQi9zCls3
Mzk4My43OTY1NTJdIHVzYnRlc3QgMS0xLjM6My4wOiBURVNUIDI3OiBidWxrIHdyaXRlIDEwMDBN
Ynl0ZXMKWzc0MjA1LjA2MDIwNF0gdXNidGVzdCAxLTEuMzozLjA6IFRFU1QgMjg6IGJ1bGsgcmVh
ZCAxMDAwTWJ5dGVzCgokIHN1ZG8gfi90ZXN0dXNiIC1hIC10IDxuPiAtZyA2NCAtcyAxNjM4NAov
ZGV2L2J1cy91c2IvMDAxLzAxMCB0ZXN0IDUsICAxMDcuNDIxNTM1IHNlY3MKL2Rldi9idXMvdXNi
LzAwMS8wMTAgdGVzdCA2LCAgIDM4LjE4OTcxMiBzZWNzCls3NDg5My4yMDQxNzBdIHVzYnRlc3Qg
MS0xLjM6My4wOiBURVNUIDU6ICB3cml0ZSAxMDAwIHNnbGlzdHMgNjQgZW50cmllcwpvZiAxNjM4
NCBieXRlcwpbNzUwMTIuNTkyMjIyXSB1c2J0ZXN0IDEtMS4zOjMuMDogVEVTVCA2OiAgcmVhZCAx
MDAwIHNnbGlzdHMgNjQgZW50cmllcwpvZiAxNjM4NCBieXRlcwoKCkkgaGF2ZSB0cmllZCBSYXNw
YmVycnkgUGkxIGFuZCBQaTQgYXMgaG9zdCAoMiBkaWZmZXJlbnQgY29udHJvbGxlcnMpCmFuZCBQ
aSBaZXJvIGFuZCBCZWFnbGVib25lIEJsYWNrIGFzIGRldmljZSwgZ2V0dGluZyBzaW1pbGFyIHJl
c3VsdC4KCkkgZm91bmQgdGhpcyBwb3N0IGhhdmluZyB0aGUgc2FtZSBpc3N1ZToKClJlOiBBc3lt
bWV0cmljIHNwZWVkIHJlc3VsdHMgd2l0aCB0ZXN0dXNiL3VzYnRlc3QvZ196ZXJvCmh0dHBzOi8v
d3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LXVzYi9tc2cxMDA1ODguaHRtbAoKSSBoYXZlbid0
IGdvdCBhIHVzYiBhbmFseXplciwgYnV0IGFkZGluZyBwcmludGsgdG8KZHdjMl9hc3NpZ25fYW5k
X2luaXRfaGMoKSBzaG93ZWQgdGhhdCBJTiBpbnRlcnJ1cHRzIHdlcmUgMi0zIG1zIGFwYXJ0CmJ1
dCBPVVQgaW50ZXJydXB0cyB3ZXJlIH44IG1zIGFwYXJ0LgoKTm9yYWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
