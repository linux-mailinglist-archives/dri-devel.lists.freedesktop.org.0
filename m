Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC6FCC1F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 18:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321876EE77;
	Thu, 14 Nov 2019 17:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0FD6EE77;
 Thu, 14 Nov 2019 17:47:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b72so5808513edf.1;
 Thu, 14 Nov 2019 09:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIo531B/cUq75IiN6qR4DNybSGADhsaWaGA4/dANrUU=;
 b=ShawJ0CaTWbzSulHzQreW4oUhg/tjRKqG/dup0cShPo4ItTwWZ5pD7R2/qw86PFXs3
 VeOdKPrJl9stY/zf6XEo+j14SNGNhEAF1pw6KKSom9LA8MGMJZITcjGjy+XTR7flkYZN
 pi9cO2ZtLjY80CbyfsGfwgFVtPhYhTxdBJLDd09LNKBv7h9Qp2bhGpJRyhwq0DiKBu/u
 c52knAhZc8nMTh3EeVF1qUGOosl4LAyzdJN7hmGBwXQdJ2wnTNs6eCI1yxfV4b4vT8pe
 nN4/iNwpIHaA9to3N7dJ/IKrobtD2wPE0ErmKlzj4FsvbNAuBRI6A194b+KeX9B5+Co4
 9i8w==
X-Gm-Message-State: APjAAAU3/koJ4A/xkHTaKgFNR0CDeYixuKeNTbfEBixMzNAEIV3LC9o/
 qTpeFBRKgvG96YgKI9g+MpDY4WDun255EcSFk58=
X-Google-Smtp-Source: APXvYqw3CejNmaVz5GldVr/MDvSo09GNjIMxV6cGEH5VCjX8kpYok2NSUnjdMbIQdf5qOmCQs3bB2RJx5SRQqmEzN2w=
X-Received: by 2002:a17:906:f209:: with SMTP id
 gt9mr9586553ejb.241.1573753634099; 
 Thu, 14 Nov 2019 09:47:14 -0800 (PST)
MIME-Version: 1.0
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
 <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 14 Nov 2019 09:47:02 -0800
Message-ID: <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/msm: add DSI config changes to support DSI
 version
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uIo531B/cUq75IiN6qR4DNybSGADhsaWaGA4/dANrUU=;
 b=rw6xzVmS7zdh8IO41zKmyH1EwS5ub484ZDfPzqMFnsZ8/bNOCwpsqUJT3eapWamnoa
 hRE3otsinYDkEiNefw82XE+uOulf3MvWrhYEfNyY7RFgYcmWNcyS/yvHKJpQpenMAgLM
 OD4hNu5S8VQ6WRXzgydzo0hjCt3n4IYDjIc9OYPRlSLy0Q5wGmBEhYZ1KLElSAnxuk4d
 LWiULGeDyeTj3t8PP+E9iAPFSqc5jjeaUG9F3W0rEzd8rIu5HXHvb6X0nfY0Cz3eSSEj
 t7aWD0smLhxLrybsj8804sTrjcFhPRFAbZdOCdNXQIwjN0lZiRGqA2mKWsppRsa4E9aE
 UdAw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMjoxNiBBTSBIYXJpZ292aW5kYW4gUCA8aGFyaWdvdmlA
Y29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+Cj4gQWRkIERTSSBjb25maWcgY2hhbmdlcyB0byBzdXBw
b3J0IERTSSB2ZXJzaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFyaWdvdmluZGFuIFAgPGhhcmln
b3ZpQGNvZGVhdXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdt
YWlsLmNvbT4KCkZvciBwYXRjaCAxLzIgd2l0aCB0aGUgcGFuZWwgZHJpdmVyLCBwcm9iYWJseSBi
ZXN0IHRvIHNwbGl0IHRoYXQgb3V0CmludG8gYSBkaWZmZXJlbnQgcGF0Y2goc2V0KSwgc2luY2Ug
cGFuZWwgZHJpdmVycyBhcmUgbWVyZ2VkIGludG8KZHJtLW5leHQgdmlhIGEgZGlmZmVyZW50IHRy
ZWUKCkJSLAotUgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9j
ZmcuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvZHNpX2NmZy5jCj4gaW5kZXggYjdiN2MxYS4uZDJjNDU5MiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMKPiBAQCAtMTMzLDYgKzEzMywxMCBAQCBzdGF0aWMgY29u
c3QgY2hhciAqIGNvbnN0IGRzaV9zZG04NDVfYnVzX2Nsa19uYW1lc1tdID0gewo+ICAgICAgICAg
ImlmYWNlIiwgImJ1cyIsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBkc2lf
c2M3MTgwX2J1c19jbGtfbmFtZXNbXSA9IHsKPiArICAgICAgICAiaWZhY2UiLCAiYnVzIiwKPiAr
fTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9j
ZmcgPSB7Cj4gICAgICAgICAuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKPiAgICAgICAg
IC5yZWdfY2ZnID0gewo+IEBAIC0xNDcsNiArMTUxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXNtX2RzaV9jb25maWcgc2RtODQ1X2RzaV9jZmcgPSB7Cj4gICAgICAgICAubnVtX2RzaSA9IDIs
Cj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBzYzcxODBfZHNp
X2NmZyA9IHsKPiArICAgICAgIC5pb19vZmZzZXQgPSBEU0lfNkdfUkVHX1NISUZULAo+ICsgICAg
ICAgLnJlZ19jZmcgPSB7Cj4gKyAgICAgICAgICAgICAgIC5udW0gPSAxLAo+ICsgICAgICAgICAg
ICAgICAucmVncyA9IHsKPiArICAgICAgICAgICAgICAgICAgICAgICB7InZkZGEiLCAyMTgwMCwg
NCB9LCAgICAvKiAxLjIgViAqLwo+ICsgICAgICAgICAgICAgICB9LAo+ICsgICAgICAgfSwKPiAr
ICAgICAgIC5idXNfY2xrX25hbWVzID0gZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzLAo+ICsgICAg
ICAgLm51bV9idXNfY2xrcyA9IEFSUkFZX1NJWkUoZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzKSwK
PiArICAgICAgIC5pb19zdGFydCA9IHsgMHhhZTk0MDAwIH0sCj4gKyAgICAgICAubnVtX2RzaSA9
IDEsCj4gK307Cj4gKwo+ICBjb25zdCBzdGF0aWMgc3RydWN0IG1zbV9kc2lfaG9zdF9jZmdfb3Bz
IG1zbV9kc2lfdjJfaG9zdF9vcHMgPSB7Cj4gICAgICAgICAubGlua19jbGtfZW5hYmxlID0gZHNp
X2xpbmtfY2xrX2VuYWJsZV92MiwKPiAgICAgICAgIC5saW5rX2Nsa19kaXNhYmxlID0gZHNpX2xp
bmtfY2xrX2Rpc2FibGVfdjIsCj4gQEAgLTIwMSw2ICsyMTksOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgZHNpX2NmZ19oYW5kbGVyc1tdID0gewo+ICAgICAgICAg
ICAgICAgICAmbXNtODk5OF9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29wc30sCj4gICAg
ICAgICB7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lfNkdfVkVSX01JTk9SX1YyXzJfMSwK
PiAgICAgICAgICAgICAgICAgJnNkbTg0NV9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9ob3N0X29w
c30sCj4gKyAgICAgICB7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lfNkdfVkVSX01JTk9S
X1YyXzRfMSwKPiArICAgICAgICAgICAgICAgJnNjNzE4MF9kc2lfY2ZnLCAmbXNtX2RzaV82Z192
Ml9ob3N0X29wc30sCj4gKwo+ICB9Owo+Cj4gIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NmZ19oYW5k
bGVyICptc21fZHNpX2NmZ19nZXQodTMyIG1ham9yLCB1MzIgbWlub3IpCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9jZmcuaAo+IGluZGV4IGUyYjdhN2QuLjk5MTk1MzYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvZHNpX2NmZy5oCj4gQEAgLTE5LDYgKzE5LDcgQEAKPiAgI2RlZmluZSBNU01fRFNJXzZH
X1ZFUl9NSU5PUl9WMV80XzEgICAgMHgxMDA0MDAwMQo+ICAjZGVmaW5lIE1TTV9EU0lfNkdfVkVS
X01JTk9SX1YyXzJfMCAgICAweDIwMDAwMDAwCj4gICNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlO
T1JfVjJfMl8xICAgIDB4MjAwMjAwMDEKPiArI2RlZmluZSBNU01fRFNJXzZHX1ZFUl9NSU5PUl9W
Ml80XzEgICAgMHgyMDA0MDAwMQo+Cj4gICNkZWZpbmUgTVNNX0RTSV9WMl9WRVJfTUlOT1JfODA2
NCAgICAgIDB4MAo+Cj4gLS0KPiAyLjcuNAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
