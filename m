Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510362409C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CEB89247;
	Mon, 20 May 2019 18:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1215 seconds by postgrey-1.36 at gabe;
 Mon, 20 May 2019 18:41:35 UTC
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com
 [192.185.48.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8A89247
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 18:41:35 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 765E616B75
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:21:19 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id SmuVhYO6MdnCeSmuVhEsLs; Mon, 20 May 2019 13:21:19 -0500
X-Authority-Reason: nr=8
Received: from [189.250.71.100] (port=36326 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hSmuS-002cjf-EH; Mon, 20 May 2019 13:21:18 -0500
To: xiaolinkui <xiaolinkui@kylinos.cn>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <CADnq5_PE-mvW2zwNeHn6prvTQvh-en9E9F7VE-hCS=a8jJWhAQ@mail.gmail.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
Message-ID: <f17d994b-c498-4002-dd72-2999574d84ec@embeddedor.com>
Date: Mon, 20 May 2019 13:21:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_PE-mvW2zwNeHn6prvTQvh-en9E9F7VE-hCS=a8jJWhAQ@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.71.100
X-Source-L: No
X-Exim-ID: 1hSmuS-002cjf-EH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.71.100]:36326
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzIwLzE5IDEyOjQxIFBNLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gRnJpLCBNYXkg
MTcsIDIwMTkgYXQgODo0MyBBTSB4aWFvbGlua3VpIDx4aWFvbGlua3VpQGt5bGlub3MuY24+IHdy
b3RlOgo+Pgo+PiBVc2Ugc3RydWN0X3NpemUoKSBoZWxwZXIgdG8ga2VlcCBjb2RlIHNpbXBsZS4K
Pj4KCkFnYWluLCB0aGlzIGlzIG5vdCB0aGUgcmVhc29uIHdoeSB0aGlzIGhlbHBlciB3YXMgY3Jl
YXRlZC4KCj4+IFNpZ25lZC1vZmYtYnk6IHhpYW9saW5rdWkgPHhpYW9saW5rdWlAa3lsaW5vcy5j
bj4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAz
ICstLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IFRoaXMgcGF0Y2ggcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yOgo+ICAg
REVTQ0VORCAgb2JqdG9vbAo+ICAgQ0FMTCAgICBzY3JpcHRzL2NoZWNrc3lzY2FsbHMuc2gKPiAg
IENISyAgICAgaW5jbHVkZS9nZW5lcmF0ZWQvY29tcGlsZS5oCj4gICBDQyBbTV0gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMubwo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAu
L2luY2x1ZGUvbGludXgva2VybmVsLmg6MTUsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4vaW5j
bHVkZS9saW51eC9saXN0Lmg6OSwKPiAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xp
bnV4L3dhaXQuaDo3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvd2Fp
dF9iaXQuaDo4LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvZnMuaDo2
LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvZGVidWdmcy5oOjE1LAo+
ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmM6MjQ6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOiBJbiBm
dW5jdGlvbiDigJhhbWRncHVfcmFzX2luaXTigJk6Cj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1
Zy5oOjE2OjQ1OiBlcnJvcjogbmVnYXRpdmUgd2lkdGggaW4gYml0LWZpZWxkCj4g4oCYPGFub255
bW91cz7igJkKPiAgI2RlZmluZSBCVUlMRF9CVUdfT05fWkVSTyhlKSAoc2l6ZW9mKHN0cnVjdCB7
IGludDooLSEhKGUpKTsgfSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgo+IC4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjM0OToyODogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvCj4g4oCYQlVJTERfQlVHX09OX1pFUk/igJkKPiAgI2RlZmluZSBf
X211c3RfYmVfYXJyYXkoYSkgQlVJTERfQlVHX09OX1pFUk8oX19zYW1lX3R5cGUoKGEpLCAmKGEp
WzBdKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KPiAu
L2luY2x1ZGUvbGludXgvb3ZlcmZsb3cuaDozMDY6MzA6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhfX211c3RfYmVfYXJyYXnigJkKPiAgICAgICAgc2l6ZW9mKCoocCktPm1lbWJlcikg
KyBfX211c3RfYmVfYXJyYXkoKHApLT5tZW1iZXIpLFwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmM6MTU1NjoxNjogbm90ZTogaW4gZXhwYW5zaW9uIG9mCj4gbWFjcm8g4oCYc3RydWN0
X3NpemXigJkKPiAgIGNvbiA9IGttYWxsb2Moc3RydWN0X3NpemUoY29uLCBvYmpzLCBBTURHUFVf
UkFTX0JMT0NLX0NPVU5UKSwKPiAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KPiBtYWtlWzRd
OiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjc2Ogo+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMub10gRXJyb3IgMQo+IG1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1
bmZpbmlzaGVkIGpvYnMuLi4uCj4gbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjQ5MjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHVdIEVycm9yIDIKPiBtYWtlWzNdOiAqKiog
V2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5idWlsZDo0OTI6IGRyaXZlcnMvZ3B1L2RybV0gRXJyb3IgMgo+IG1ha2VbMV06ICoq
KiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTI6IGRyaXZlcnMvZ3B1XSBFcnJvciAyCj4gbWFr
ZTogKioqIFtNYWtlZmlsZToxMDQyOiBkcml2ZXJzXSBFcnJvciAyCj4gCj4gQWxleAo+IAoKWW91
IGNvbnRpbnVlWzFdWzJdIHNlbmRpbmcgdGhlc2Ugc29ydHMgb2YgcGF0Y2hlcyB3aXRob3V0IHJl
YWxseSB1bmRlcnN0YW5kaW5nIHdoYXQKeW91IGFyZSBkb2luZy4gQW5kIHlvdSBkb24ndCBldmVu
IGNvbXBpbGUgdGhlbS4gV2h5PwoKLS0KR3VzdGF2bwoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvZDgzMzkwYTktMzNiZS0zZDc2LTNlMjMtYjk3ZjBhMDViNzJmQGtlcm5lbC5kay8K
WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYjRkMzMxMDctNzVkNS1mYTE4LTUzNmUt
NmQyMWM5NmU0OTcyQGtlcm5lbC5kay8KCj4gCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKPj4gaW5kZXggMjJiZDIxZS4uNDcxN2E2NCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+PiBAQCAtMTM3NSw4ICsxMzc1LDcgQEAg
aW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gICAgICAg
ICBpZiAoY29uKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Cj4+IC0gICAgICAgY29u
ID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGFtZGdwdV9yYXMpICsKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKHN0cnVjdCByYXNfbWFuYWdlcikgKiBBTURHUFVfUkFTX0JMT0NLX0NP
VU5ULAo+PiArICAgICAgIGNvbiA9IGttYWxsb2Moc3RydWN0X3NpemUoY29uLCBvYmpzLCBBTURH
UFVfUkFTX0JMT0NLX0NPVU5UKSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5F
THxfX0dGUF9aRVJPKTsKPj4gICAgICAgICBpZiAoIWNvbikKPj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+PiAtLQo+PiAyLjcuNAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
