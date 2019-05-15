Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C471F9A5
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 19:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F7A89291;
	Wed, 15 May 2019 17:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75089291
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 17:58:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i26so678975qtr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 10:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T3r53rpcIIdNWUWUX1L2hWGIMIpNyc3n74ZjaoYk6ds=;
 b=WKy6BOqsKzV1565Y2xvziIk524oqWFFivSPnrAn9+weW7/qsLu7CXIViIVwwDmG8y1
 trLq8YvnmunlMPxSRpcg9t46YeKoPGDK+IRML6nYr9tQMVL2L+ZTwNUku6hNwtjZeXHm
 fXGK4co+HOWO7q5oneguFMBjk1m71VM2JM3xyaSHsXH/xfA696Vyk+7Iv4QxvlMtfhon
 RQEktWckzXJjJ0GxMzIS4EgidZ2yPSVS81i/OXdUIWppzwmaD97bwENuENEqTCKQK7Up
 sCcmxL8lIbkwQwLeRVsITIxdxYvx5tbd6ec9WbiGr9ontRqBGf5/HhlJTm9khCqq9FSW
 yKHw==
X-Gm-Message-State: APjAAAX0cVzv/9g/1FqAYRM8CtB/QEgMo3d3kqb3/aWwyHRlhZrw9bt9
 b+APNLRRQTQiTqU7/ruMc0MYig==
X-Google-Smtp-Source: APXvYqxsReEgdKIvYRBuSR8ZyL1XCBJ4JluVaiQzwdUcL6yNsiM2bJ85D/CpKdFK7iN2V1E9k0sWTA==
X-Received: by 2002:a0c:d17b:: with SMTP id c56mr15467538qvh.61.1557943107807; 
 Wed, 15 May 2019 10:58:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k89sm1491911qte.33.2019.05.15.10.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 10:58:26 -0700 (PDT)
Date: Wed, 15 May 2019 13:58:26 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
Message-ID: <20190515175826.GT17077@art_vandelay>
References: <20190502223808.185180-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502223808.185180-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T3r53rpcIIdNWUWUX1L2hWGIMIpNyc3n74ZjaoYk6ds=;
 b=eseIQ+3pKjwi0X7F8OvMJCGH+HwZS6LhXVbIONYoL/PKENiZd2gBx4UBYRuji8jiEz
 tD88w0+QZEhw7cKzTo63UlK+YINRL+VWCip+4N3tBcGJSycvR0Ev+BpmtCGXOEy2yn3q
 JoVdLsd/Wqhl6EcS55EdOIKpoybnyFmpMO9025SzEQrJE+87AypjP1QVb4fqnaJqnf44
 UxjWWas+DUpvhH2w59bKq25kU2Z5a2f5tLERhAySrspY7lXuUdOZ1HmI3cHdAiDuEc8S
 tcTdq4CwbibmjtyJVfzkkupk4W88fJj0J3yhJYwZy4Hv7kOednw2Y4NGqJ4aXF0mMHUf
 5yFA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDM6Mzg6MDdQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNv
biB3cm90ZToKPiBPbiBSb2NrY2hpcCByazMyODgtYmFzZWQgQ2hyb21lYm9va3Mgd2hlbiB5b3Ug
ZG8gYSBzdXNwZW5kL3Jlc3VtZQo+IGN5Y2xlOgo+IAo+IDEuIFlvdSBsb3NlIHRoZSBhYmlsaXR5
IHRvIGRldGVjdCBhbiBIRE1JIGRldmljZSBiZWluZyBwbHVnZ2VkIGluLgo+IAo+IDIuIElmIHlv
dSdyZSB1c2luZyB0aGUgaTJjIGJ1cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMK
PiB3b3JraW5nLgo+IAo+IExldCdzIGFkZCBhIGhvb2sgdG8gdGhlIGNvcmUgZHctaGRtaSBkcml2
ZXIgc28gdGhhdCB3ZSBjYW4gY2FsbCBpdCBpbgo+IGR3X2hkbWktcm9ja2NoaXAgaW4gdGhlIG5l
eHQgY29tbWl0Lgo+IAo+IE5PVEU6IHRoZSBleGFjdCBzZXQgb2Ygc3RlcHMgSSd2ZSBkb25lIGhl
cmUgaW4gcmVzdW1lIGNvbWUgZnJvbQo+IGxvb2tpbmcgYXQgdGhlIG5vcm1hbCBkd19oZG1pIGlu
aXQgc2VxdWVuY2UgaW4gdXBzdHJlYW0gTGludXggcGx1cyB0aGUKPiBzZXF1ZW5jZSB0aGF0IHdl
IGRpZCBpbiBkb3duc3RyZWFtIENocm9tZSBPUyAzLjE0LiAgVGVzdGluZyBzaG93IHRoYXQKPiBp
dCBzZWVtcyB0byB3b3JrLCBidXQgaWYgYW4gZXh0cmEgc3RlcCBpcyBuZWVkZWQgb3Igc29tZXRo
aW5nIGhlcmUgaXMKPiBub3QgbmVlZGVkIHdlIGNvdWxkIGltcHJvdmUgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IC0tLQo+
IAo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDIxICsrKysr
KysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAg
ICAgICB8ICAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGRiNzYxMzI5
YTFlMy4uNGIzOGJmZDQzZTU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBAQCAtMjc4MCw2ICsyNzgwLDI3IEBAIHZvaWQgZHdfaGRtaV91bmJpbmQo
c3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV91
bmJpbmQpOwo+ICAKPiAraW50IGR3X2hkbWlfc3VzcGVuZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkK
PiArewo+ICsJcmV0dXJuIDA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9zdXNw
ZW5kKTsKPiArCj4gK2ludCBkd19oZG1pX3Jlc3VtZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiAr
ewo+ICsJaW5pdGlhbGl6ZV9oZG1pX2loX211dGVzKGhkbWkpOwo+ICsKPiArCWR3X2hkbWlfc2V0
dXBfaTJjKGhkbWkpOwo+ICsJaWYgKGhkbWktPmkyYykKPiArCQlkd19oZG1pX2kyY19pbml0KGhk
bWkpOwo+ICsKPiArCWlmIChoZG1pLT5waHkub3BzLT5zZXR1cF9ocGQpCj4gKwkJaGRtaS0+cGh5
Lm9wcy0+c2V0dXBfaHBkKGhkbWksIGhkbWktPnBoeS5kYXRhKTsKPiArCj4gKwlyZXR1cm4gMDsK
PiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3Jlc3VtZSk7CgpCb3RoIHBhdGNoZXMg
bG9vayBnb29kIHRvIG1lLCBJJ2QgcHJvYmFibHkgcHJlZmVyIHRvIGp1c3Qgc21hc2ggdGhlbSB0
b2dldGhlciwKYnV0IG1laC4KCklmIG5vIG9uZSBtb3JlIGF1dGhvcml0YXRpdmUgY2hpbWVzIGlu
LCBJJ2xsIGFwcGx5IHRoZW0gdG8gLW1pc2MgaW4gYSBmZXcgZGF5cy4KClNlYW4KCj4gKwo+ICBN
T0RVTEVfQVVUSE9SKCJTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Iik7Cj4g
IE1PRFVMRV9BVVRIT1IoIkFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4iKTsKPiAg
TU9EVUxFX0FVVEhPUigiWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPiIpOwo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdl
L2R3X2hkbWkuaAo+IGluZGV4IDY2ZTcwNzcwY2NlNS4uYzQxMzJlOWE1YWUzIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmgKPiArKysgYi9pbmNsdWRlL2RybS9icmlk
Z2UvZHdfaGRtaS5oCj4gQEAgLTE1NCw2ICsxNTQsOSBAQCBzdHJ1Y3QgZHdfaGRtaSAqZHdfaGRt
aV9iaW5kKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAkJCSAgICAgc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAo+ICAJCQkgICAgIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRf
ZGF0YSAqcGxhdF9kYXRhKTsKPiAgCj4gK2ludCBkd19oZG1pX3N1c3BlbmQoc3RydWN0IGR3X2hk
bWkgKmhkbWkpOwo+ICtpbnQgZHdfaGRtaV9yZXN1bWUoc3RydWN0IGR3X2hkbWkgKmhkbWkpOwo+
ICsKPiAgdm9pZCBkd19oZG1pX3NldHVwX3J4X3NlbnNlKHN0cnVjdCBkd19oZG1pICpoZG1pLCBi
b29sIGhwZCwgYm9vbCByeF9zZW5zZSk7Cj4gIAo+ICB2b2lkIGR3X2hkbWlfc2V0X3NhbXBsZV9y
YXRlKHN0cnVjdCBkd19oZG1pICpoZG1pLCB1bnNpZ25lZCBpbnQgcmF0ZSk7Cj4gLS0gCj4gMi4y
MS4wLjEwMjAuZ2YyODIwY2YwMWEtZ29vZwo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5n
aW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
