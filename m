Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDE3265A7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 17:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F419D6E40A;
	Fri, 26 Feb 2021 16:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D5E6E40A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=cJovxi5fmivlMzTNFK7Hd5WeerVzqJFBxjTpoKstnCE=; b=XZPpJxh2rt+EtM7F9/8orkDvql
 c48+bn9P+Jx5tgPDS4YA2jYTdMgNUCFYmV5RMiQObH8/i0ZqpsYdVjBKY9gfk79xNxj4MwkTLjOv1
 TtHkJePZ+d+Tzo8AR76MvgknBWL4+NMIifuapua/lzBY8/14zFcRXEidPhikakfSVICX92+ksNN8y
 BB0KL/7QxTEyx4+5q9XgBH0Avk7KlWqaqQVyQ7zGR5AEGO9/l2JOvk3PLVJ1Il9x1UM620k592pMk
 gOPQ27t1MMFBnZzjAguz92FFIR89l9ITBBBHnWhuaWSCHFdksr2vNCG5yDA9l+nbkuifjAMQXgvWX
 DL2rf+kw==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFg80-0004FD-MQ; Fri, 26 Feb 2021 16:38:09 +0000
Subject: Re: [PATCH -next] fbdev: atyfb: use LCD management functions for
 PPC_PMAC also
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210226000537.8674-1-rdunlap@infradead.org>
 <YDjlkzg7/qnPBIKI@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <03364ba0-8266-99e5-9315-34d8820e8732@infradead.org>
Date: Fri, 26 Feb 2021 08:38:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDjlkzg7/qnPBIKI@intel.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yNi8yMSA0OjEyIEFNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVGh1LCBGZWIg
MjUsIDIwMjEgYXQgMDQ6MDU6MzdQTSAtMDgwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBJbmNs
dWRlIFBQQ19QTUFDIGluIHRoZSBjb25maWdzIHRoYXQgdXNlIGF0eV9sZF9sY2QoKSBhbmQKPj4g
YXR5X3N0X2xjZCgpIGltcGxlbWVudGF0aW9ucyBzbyB0aGF0IHRoZSBQTSBjb2RlIG1heSB3b3Jr
Cj4+IGNvcnJlY3RseSBmb3IgUFBDX1BNQUMuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+PiBDYzogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1
bG5pZXJzQGdvb2dsZS5jb20+Cj4+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKPj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gQ2M6IEJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPj4gQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4+IC0t
LQo+PiBEYW5pZWwtIFdlIGFsc28gbmVlZCB0aGlzIHBhdGNoOgo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcmktZGV2ZWwvMjAyMTAyMjQyMTU1MjguODIyLTEtcmR1bmxhcEBpbmZyYWRlYWQu
b3JnLwo+PiB0byBmaXggYSBrZXJuZWwgdGVzdCByb2JvdCBidWlsZCBlcnJvci4KPj4KPj4gIGRy
aXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eWZiX2Jhc2UuYyB8ICAgIDggKysrLS0tLS0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IC0tLSBs
aW51eC1uZXh0LTIwMjEwMjE5Lm9yaWcvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFz
ZS5jCj4+ICsrKyBsaW51eC1uZXh0LTIwMjEwMjE5L2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0
eWZiX2Jhc2UuYwo+PiBAQCAtMTMyLDggKzEzMiw3IEBACj4+ICAjZGVmaW5lIFBSSU5US0koZm10
LCBhcmdzLi4uKQlwcmludGsoS0VSTl9JTkZPICJhdHlmYjogIiBmbXQsICMjIGFyZ3MpCj4+ICAj
ZGVmaW5lIFBSSU5US0UoZm10LCBhcmdzLi4uKQlwcmludGsoS0VSTl9FUlIgImF0eWZiOiAiIGZt
dCwgIyMgYXJncykKPj4gIAo+PiAtI2lmIGRlZmluZWQoQ09ORklHX1BNQUNfQkFDS0xJR0hUKSB8
fCBkZWZpbmVkKENPTkZJR19GQl9BVFlfR0VORVJJQ19MQ0QpIHx8IFwKPj4gLWRlZmluZWQoQ09O
RklHX0ZCX0FUWV9CQUNLTElHSFQpCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfUFBDX1BNQUMpCj4g
Cj4gRGlkIHlvdSBzZW5kIGFuIG9sZCB2ZXJzaW9uIGJ5IGFjY2lkZW50PyBUaGF0J3MgZGVmaW5p
dGVseQo+IG5vdCB3aGF0IHdlIHdhbnQgc2luY2UgaXQgd291bGQgYnJlYWsgZXZlcnl0aGluZyBl
eGNlcHQgUFBDX1BNQUMuCgoKWWlrZXMhCgpZZXMsIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhhdC4K
SSdsbCBnZXQgdGhlIG5ld2VyIHZlcnNpb24gb3V0IHNvb24uCgo+PiAgc3RhdGljIGNvbnN0IHUz
MiBsdF9sY2RfcmVnc1tdID0gewo+PiAgCUNORkdfUEFORUxfTEcsCj4+ICAJTENEX0dFTl9DTlRM
X0xHLAo+PiBAQCAtMTc1LDggKzE3NCw3IEBAIHUzMiBhdHlfbGRfbGNkKGludCBpbmRleCwgY29u
c3Qgc3RydWN0IGEKPj4gIAkJcmV0dXJuIGF0eV9sZF9sZTMyKExDRF9EQVRBLCBwYXIpOwo+PiAg
CX0KPj4gIH0KPj4gLSNlbHNlIC8qIGRlZmluZWQoQ09ORklHX1BNQUNfQkFDS0xJR0hUKSB8fCBk
ZWZpbmVkKENPTkZJR19GQl9BVFlfQkFDS0xJR0hUKSBcCj4+IC0JIGRlZmluZWQoQ09ORklHX0ZC
X0FUWV9HRU5FUklDX0xDRCkgKi8KPj4gKyNlbHNlIC8qIGRlZmluZWQoQ09ORklHX1BQQ19QTUFD
KSAqLwo+PiAgdm9pZCBhdHlfc3RfbGNkKGludCBpbmRleCwgdTMyIHZhbCwgY29uc3Qgc3RydWN0
IGF0eWZiX3BhciAqcGFyKQo+PiAgeyB9Cj4+ICAKPj4gQEAgLTE4NCw3ICsxODIsNyBAQCB1MzIg
YXR5X2xkX2xjZChpbnQgaW5kZXgsIGNvbnN0IHN0cnVjdCBhCj4+ICB7Cj4+ICAJcmV0dXJuIDA7
Cj4+ICB9Cj4+IC0jZW5kaWYgLyogZGVmaW5lZChDT05GSUdfUE1BQ19CQUNLTElHSFQpIHx8IGRl
ZmluZWQgKENPTkZJR19GQl9BVFlfR0VORVJJQ19MQ0QpICovCj4+ICsjZW5kaWYgLyogZGVmaW5l
ZChDT05GSUdfUFBDX1BNQUMpICovCj4+ICAKPj4gICNpZmRlZiBDT05GSUdfRkJfQVRZX0dFTkVS
SUNfTENECj4+ICAvKgo+IAoKCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
