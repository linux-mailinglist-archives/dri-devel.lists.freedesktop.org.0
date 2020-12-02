Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15E2CC481
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 19:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8B6EA5E;
	Wed,  2 Dec 2020 18:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9B646EA5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 18:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0497B2A6048;
 Wed,  2 Dec 2020 19:06:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LpKQWqjKEjHu; Wed,  2 Dec 2020 19:06:10 +0100 (CET)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 9E2F42A6016;
 Wed,  2 Dec 2020 19:06:10 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kkWW2-0021LX-1i; Wed, 02 Dec 2020 19:06:10 +0100
To: Daniel Vetter <daniel@ffwll.ch>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
Date: Wed, 2 Dec 2020 19:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
Content-Language: en-CA
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
Cc: James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0wMiAxOjQ2IHAubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBE
ZWMgMiwgMjAyMCBhdCAxMjo0MyBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PiB3cm90ZToKPj4KPj4gT24gMjAyMC0xMi0wMSAxMTowMSBhLm0uLCBKYW1lcyBQYXJrIHdyb3Rl
Ogo+Pj4gVGhpcyB3aWxsIGFsbG93IE1lc2EgdG8gcG9ydCBjb2RlIHRvIFdpbmRvd3MgbW9yZSBl
YXNpbHkuCj4+Cj4+IEFzIGRpc2N1c3NlZCBpbgo+PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvNjE2MiNub3RlXzcxMjc3OQo+PiAsIGlu
Y2x1ZGluZyBkcm0uaCBtYWtlcyBubyBzZW5zZSB3aGVuIGJ1aWxkaW5nIGZvciBXaW5kb3dzLgo+
IAo+IFllYWggSSB0aGluayBpdCdkIGJlIGNsZWFuZXN0IGlmIHdlIGNhbiBhdm9pZCB0aGlzLiBJ
ZiBub3QgSSB0aGluayB0aGUKPiByaWdodCBmaXggd291bGQgYmUgdG8gc3BsaXQgb3V0IHRoZSBh
Y3R1YWxseSBuZWVkZWQgcGFydHMgZnJvbSBkcm0uaAo+IGludG8gYSBuZXcgaGVhZGVyIChzdGls
bCBpbmNsdWRlZCBieSBkcm0uaCBmb3IgYmFja3dhcmRzIGNvbXBhdAo+IHJlYXNvbnMpIHdoaWNo
IG1lc2EgY2FuIHVzZS4gU2luY2UgaXQgbG9va3MgbGlrZSB0aGUgcHJvYmxlbWF0aWMgcGFydHMK
PiBhcmUgdGhlIGxlZ2FjeSBndW5rLCBhbmQgbm90IHRoZSBuZXcgaW9jdGwgc3RydWN0dXJlcy4g
UHVsbGluZyBvdXQKPiBkcm1fcmVuZGVyLmggZm9yIGFsbCB0aGUgcmVuZGVyIHN0dWZmIGFuZCBt
YWJlIGRybV92YmxhbmsuaCBmb3IgdGhlCj4gdmJsYW5rIHN0dWZmICh3aGljaCB3b3VsZCBmaXQg
YmV0dGVyIGluIGRybV9tb2RlLmggYnV0IG1pc3Rha2VzIHdlcmUKPiBtYWRlLCBvb3BzKS4KCklm
IGFueXRoaW5nIGN1cnJlbnRseSBpbiBkcm0uaCBpcyBuZWVkZWQgd2hpbGUgYnVpbGRpbmcgZm9y
IFdpbmRvd3MsIGl0IApwb2ludHMgdG8gYSBicm9rZW4gYWJzdHJhY3Rpb24gc29tZXdoZXJlIGlu
IHVzZXJzcGFjZS4gKFNwZWNpZmljYWxseSwgCnRoZSBNZXNhIEdhbGxpdW0vVnVsa2FuIHdpbnN5
cyBpcyBzdXBwb3NlZCB0byBhYnN0cmFjdCBhd2F5IHBsYXRmb3JtIApkZXRhaWxzIGxpa2UgdGhl
c2UpCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAg
ICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
