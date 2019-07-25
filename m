Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99474B1B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D726E6BE;
	Thu, 25 Jul 2019 10:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E9D6E6BE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:06:59 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r4so35892387qkm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iDpc/h+t5HFPyYg4DUmqC3W/qj3IevlDqgxyrC8qmFg=;
 b=qIKXlTEAQIiyAOAYxUZj2CKcankNW/4yfw8OAoDZpGcsE//+7cRcJGh1QJqzXCC+PF
 e6+A0+G3z3W5lHcXrWPcbsC6gmJnj3/1l0XDDEa7wWOpY+T0X2Uxzm1EsLKVwKbJW5Sa
 eS/GC56dkjMlORPsHLw+49ZlCSaTk4+rDnrc2brzfC8X4IEdDHkRZGqGEIb71D43bBRS
 zlXGp2r1V/iwAL/ICsj09mgQUdZf69oyPeEvmya0DBKc/kbgSDdUhDJcdz9qoCJtX3Fs
 ssggFbhBx8D8rzthah2QUW8USsz6zmmW+9pjaUWDF8jQb+PkJie36dn5I/v1e3fWt3q0
 At2A==
X-Gm-Message-State: APjAAAXHlgdW+zOALzniAVLQrlIMHzKJnCZf3H95Kiue/tHKG4UwyYcY
 e0VGduBYwOOXvC+Aqf0P02FDhDWHRClVFXo5OllSBdrXsfM=
X-Google-Smtp-Source: APXvYqwM5mUhz7rtyBZANnmdZKEEAOrmxIhFLIoB8HQG4cb7P+EEkjkvxv8hFVfZ1gPWOziZXmVet9TbybYpvNSqnPs=
X-Received: by 2002:a37:9c94:: with SMTP id
 f142mr52099337qke.427.1564049218292; 
 Thu, 25 Jul 2019 03:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190712084228.8338-1-l.stach@pengutronix.de>
 <e09dc82c-51dc-830c-a297-fe951faeb306@st.com>
In-Reply-To: <e09dc82c-51dc-830c-a297-fe951faeb306@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:06:47 +0200
Message-ID: <CA+M3ks4TgL=+gzCNL_c4Dwa5AiohM-uDFw7tk-bQ8gD9uu4v0A@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: attach gem fence to atomic state
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iDpc/h+t5HFPyYg4DUmqC3W/qj3IevlDqgxyrC8qmFg=;
 b=D48sYZRL49X/JEbjE/r+QGhbeKkMsgqVaKMFLmOjCdr3YqKIT05SYNaAAMElekTSdy
 grLASidXkibREaU6S2+N3uGDYzXDx0wAcWLyM9t6J0TSwTkMpE9Nu0CsUDS/0p3lNHNx
 7AXO0fG9OQFtDA3RquO9nbP1Ba1/YPUR9PvzFvSdG52vMXOppoJHj6uTM1AauVgLRoT5
 qawGIHUhMJGV2jQg8TDNFz7Bzj8vgpsUy29QDy/TLL/U0LlWRdCiFuPoGWlzYbprWYz3
 gx9FjcyMa+K0wrOsEhtKpTlI9CWJw+mRJtZVLQGefAHOWwyNtwfVLkJ9WwBbMp/D0Wd1
 S/JQ==
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
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiAxOSBqdWlsLiAyMDE5IMOgIDE1OjM1LCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBMdWNhcyAmIEFobWFkLAo+Cj4gTWFueSB0
aGFua3MgZm9yIHlvdXIgcGF0Y2gsCj4KPiBUZXN0ZWQgc3VjY2Vzc2Z1bGx5IG9uIHN0bTMybXAx
NTctZGsyICh3ZXN0b24gJiBkcm0pLgo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGls
aXBwZS5jb3JudUBzdC5jb20+Cj4gVGVzdGVkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPgoKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LgpUaGFua3MsCkJlbmphbWlu
Cgo+Cj4gUGhpbGlwcGUgOi0pCj4KPiBPbiA3LzEyLzE5IDEwOjQyIEFNLCBMdWNhcyBTdGFjaCB3
cm90ZToKPiA+IEZyb206IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+Cj4g
Pgo+ID4gVG8gcHJvcGVybHkgc3luY2hyb25pemUgd2l0aCBvdGhlciBkZXZpY2VzIHRoZSBmZW5j
ZSBmcm9tIHRoZSBHRU0KPiA+IG9iamVjdCBiYWNraW5nIHRoZSBmcmFtZWJ1ZmZlciBuZWVkcyB0
byBiZSBhdHRhY2hlZCB0byB0aGUgYXRvbWljCj4gPiBzdGF0ZSwgc28gdGhlIGNvbW1pdCB3b3Jr
IGNhbiB3YWl0IG9uIGZlbmNlIHNpZ25hbGluZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBaG1h
ZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVj
YXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmMgfCAyICsrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gaW5kZXggMmZlNmM0YThkOTE1Li4zYWI0ZmJm
OGViMGQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+IEBAIC0yNiw2ICsyNiw3IEBACj4gPiAg
ICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4KPiA+ICAgI2luY2x1ZGUgPGRybS9k
cm1fZm91cmNjLmg+Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+Cj4g
PiArI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgo+ID4gICAjaW5j
bHVkZSA8ZHJtL2RybV9vZi5oPgo+ID4gICAjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIu
aD4KPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gPiBAQCAtOTIyLDYg
KzkyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGx0ZGNfcGxhbmVf
ZnVuY3MgPSB7Cj4gPiAgIH07Cj4gPgo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFu
ZV9oZWxwZXJfZnVuY3MgbHRkY19wbGFuZV9oZWxwZXJfZnVuY3MgPSB7Cj4gPiArICAgICAucHJl
cGFyZV9mYiA9IGRybV9nZW1fZmJfcHJlcGFyZV9mYiwKPiA+ICAgICAgIC5hdG9taWNfY2hlY2sg
PSBsdGRjX3BsYW5lX2F0b21pY19jaGVjaywKPiA+ICAgICAgIC5hdG9taWNfdXBkYXRlID0gbHRk
Y19wbGFuZV9hdG9taWNfdXBkYXRlLAo+ID4gICAgICAgLmF0b21pY19kaXNhYmxlID0gbHRkY19w
bGFuZV9hdG9taWNfZGlzYWJsZSwKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
