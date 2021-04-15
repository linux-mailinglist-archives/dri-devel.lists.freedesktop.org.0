Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55F3612F7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E616EAC4;
	Thu, 15 Apr 2021 19:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990E6EAC4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:36:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o20so3196795edc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NNXtYoxo/qwfgdSe6NIOVB0oJtONeFgwJFiktR+gW2w=;
 b=sFmVzGOumL6R9zB3G+mYGAPwaRNK2YIqkVto1Ts6HtUoi1JZVrT+J4kCicgWTkRFSm
 k2IlVN03IcJLq8UK1dCcN25lj/rEDDmkNV1rSvGyAZmZcQ6n+H0mrpoUjwWl+BruHtn5
 anGaNJLqlWFQ195gcQM70z9JOYNP+CrBN3bI8jCvInxXZCHcG24SNgy2PAADehQndk9Z
 RM62OXhFeHs9sXJ6Q5TWLlUWR7onruLmknbTZsOjlIckDL6jvcCI6CYsmsMu485uBLwx
 MQhDs2wYsB37dy8zDqkTvDdIWoLcXfFQSoRUhmSqs6Jz1WQb8eLx8m0PL8FYcp+VLwwf
 pd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NNXtYoxo/qwfgdSe6NIOVB0oJtONeFgwJFiktR+gW2w=;
 b=VYD15MLtZsEBTeynbYAtZ0Yk7kZB5cGTB3qjvRwzSL6/tHQ36Aimd4avjyEKWSo/wk
 G9QBk6Yk10rcu4y5N1xBGX762sAVN14ru8Vt3My0XziNt9Cm+nxVUcFCliAvGEEnaoNQ
 bg563UCMdr/Vxdi1LVobl49/LkuNv42/AH1ZvqDOio+uFoJo0wf8v1GxYPyYd6B6kkcq
 vjMnUiPp2jvvpSCMlOcYCqSDJrxI11V9hmaOoGtpYkA9NrJZvfBFO4fvTFVbRWXBmzi5
 E71FMKFvSbB/BxWj1fqDu+tlluubP/EHVv2BsoRpW2kaA3NLKNBrKFfxxGtUg81xUrHI
 Z/7Q==
X-Gm-Message-State: AOAM532/Mz3y9BQd3MQB1qw1bs6vUYa5WHmIt6E6mTvIlK/V3fx0vgtl
 H9+UoPg664VJ4iCqGpI0w/MsVUR/a2rA3/Qb2BY=
X-Google-Smtp-Source: ABdhPJxPxXCpsLrJ+yyhlGDY0dJrj6JwBfjSHCfxKihJvxo/88csJPF6GRuQxdEfmVLGiQ09+Iqj9dgMMLC1v14H+2M=
X-Received: by 2002:a05:6402:3506:: with SMTP id
 b6mr6393593edd.175.1618515410310; 
 Thu, 15 Apr 2021 12:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210415183639.1487-1-rdunlap@infradead.org>
In-Reply-To: <20210415183639.1487-1-rdunlap@infradead.org>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Thu, 15 Apr 2021 21:36:39 +0200
Message-ID: <CABkfQAGfaxQJ4xdMpJk3CO-VZueM11BBUR-YpAQ8v0-wvwAheg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix LONTIUM use of mipi_dsi_()
 functions
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFkcmVuIEdyYXNzZWluIDxhZHJpZW4uZ3Jhc3NlaW5AZ21haWwuY29tPgoK
TGUgamV1LiAxNSBhdnIuIDIwMjEgw6AgMjA6MzYsIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiBhIMOpY3JpdCA6Cj4KPiBUaGUgTG9udGl1bSBEUk0gYnJpZGdlIGRyaXZlcnMg
dXNlIG1pcGlfZHNpXygpIGZ1bmN0aW9uIGludGVyZmFjZXMgc28KPiB0aGV5IG5lZWQgdG8gc2Vs
ZWN0IERSTV9NSVBJX0RTSSB0byBwcmV2ZW50IGJ1aWxkIGVycm9ycy4KPgo+IEVSUk9SOiBtb2Rw
b3N0OiAibWlwaV9kc2lfYXR0YWNoIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0
OTYxMXV4Yy5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAibWlwaV9kc2lfZGV2aWNl
X3JlZ2lzdGVyX2Z1bGwiIFtkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExdXhj
LmtvXSB1bmRlZmluZWQhCj4gRVJST1I6IG1vZHBvc3Q6ICJvZl9maW5kX21pcGlfZHNpX2hvc3Rf
Ynlfbm9kZSIgW2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2MTF1eGMua29dIHVu
ZGVmaW5lZCEKPiBFUlJPUjogbW9kcG9zdDogIm1pcGlfZHNpX2RldmljZV91bnJlZ2lzdGVyIiBb
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMXV4Yy5rb10gdW5kZWZpbmVkIQo+
IEVSUk9SOiBtb2Rwb3N0OiAibWlwaV9kc2lfZGV0YWNoIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9sb250aXVtLWx0OTYxMXV4Yy5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAibWlw
aV9kc2lfYXR0YWNoIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMS5rb10g
dW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAibWlwaV9kc2lfZGV2aWNlX3JlZ2lzdGVyX2Z1
bGwiIFtkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjExLmtvXSB1bmRlZmluZWQh
Cj4gRVJST1I6IG1vZHBvc3Q6ICJvZl9maW5kX21pcGlfZHNpX2hvc3RfYnlfbm9kZSIgW2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2MTEua29dIHVuZGVmaW5lZCEKPiBFUlJPUjog
bW9kcG9zdDogIm1pcGlfZHNpX2RldmljZV91bnJlZ2lzdGVyIiBbZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sb250aXVtLWx0OTYxMS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0OiAibWlw
aV9kc2lfZGV0YWNoIiBbZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sb250aXVtLWx0OTYxMS5rb10g
dW5kZWZpbmVkIQo+IFdBUk5JTkc6IG1vZHBvc3Q6IHN1cHByZXNzZWQgNSB1bnJlc29sdmVkIHN5
bWJvbCB3YXJuaW5ncyBiZWNhdXNlIHRoZXJlIHdlcmUgdG9vIG1hbnkpCj4KPiBGaXhlczogMjMy
NzhiZjU0YWZlICgiZHJtL2JyaWRnZTogSW50cm9kdWNlIExUOTYxMSBEU0kgdG8gSERNSSBicmlk
Z2UiKQo+IEZpeGVzOiAwY2JiZDViMWEwMTIgKCJkcm06IGJyaWRnZTogYWRkIHN1cHBvcnQgZm9y
IGxvbnRpdW0gTFQ5NjExVVhDIGJyaWRnZSIpCj4gRml4ZXM6IDMwZTJhZTk0M2MyNiAoImRybS9i
cmlkZ2U6IEludHJvZHVjZSBMVDg5MTJCIERTSSB0byBIRE1JIGJyaWRnZSIpCj4gU2lnbmVkLW9m
Zi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IENjOiBEbWl0cnkgQmFyeXNoa292
IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KPiBDYzogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4KPiBDYzogQmpv
cm4gQW5kZXJzc29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4KPiBDYzogU3Jpbml2YXMg
S2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+IENjOiBBZHJpZW4g
R3Jhc3NlaW4gPGFkcmllbi5ncmFzc2VpbkBnbWFpbC5jb20+Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KPiBDYzogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGxpbmFyby5vcmc+Cj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAgICAzICsr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiAtLS0gbGludXgtbmV4dC0y
MDIxMDQxNC5vcmlnL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ICsrKyBsaW51eC1u
ZXh0LTIwMjEwNDE0L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+IEBAIC02Niw2ICs2
Niw3IEBAIGNvbmZpZyBEUk1fTE9OVElVTV9MVDg5MTJCCj4gICAgICAgICBkZXBlbmRzIG9uIE9G
Cj4gICAgICAgICBzZWxlY3QgRFJNX1BBTkVMX0JSSURHRQo+ICAgICAgICAgc2VsZWN0IERSTV9L
TVNfSEVMUEVSCj4gKyAgICAgICBzZWxlY3QgRFJNX01JUElfRFNJCj4gICAgICAgICBzZWxlY3Qg
UkVHTUFQX0kyQwo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBEcml2ZXIgZm9yIExvbnRpdW0g
TFQ4OTEyQiBEU0kgdG8gSERNSSBicmlkZ2UKPiBAQCAtODEsNiArODIsNyBAQCBjb25maWcgRFJN
X0xPTlRJVU1fTFQ5NjExCj4gICAgICAgICBkZXBlbmRzIG9uIE9GCj4gICAgICAgICBzZWxlY3Qg
RFJNX1BBTkVMX0JSSURHRQo+ICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gKyAgICAg
ICBzZWxlY3QgRFJNX01JUElfRFNJCj4gICAgICAgICBzZWxlY3QgUkVHTUFQX0kyQwo+ICAgICAg
ICAgaGVscAo+ICAgICAgICAgICBEcml2ZXIgZm9yIExvbnRpdW0gTFQ5NjExIERTSSB0byBIRE1J
IGJyaWRnZQo+IEBAIC05NCw2ICs5Niw3IEBAIGNvbmZpZyBEUk1fTE9OVElVTV9MVDk2MTFVWEMK
PiAgICAgICAgIGRlcGVuZHMgb24gT0YKPiAgICAgICAgIHNlbGVjdCBEUk1fUEFORUxfQlJJREdF
Cj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiArICAgICAgIHNlbGVjdCBEUk1fTUlQ
SV9EU0kKPiAgICAgICAgIHNlbGVjdCBSRUdNQVBfSTJDCj4gICAgICAgICBoZWxwCj4gICAgICAg
ICAgIERyaXZlciBmb3IgTG9udGl1bSBMVDk2MTFVWEMgRFNJIHRvIEhETUkgYnJpZGdlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
