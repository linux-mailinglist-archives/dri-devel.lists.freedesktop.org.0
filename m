Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8401EBE89
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00F989E33;
	Tue,  2 Jun 2020 14:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D1E89E33
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 14:58:48 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id k13so2173613vsm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R19nSqfwFjKMbuCUuu45u3kNS6yK2MxJbjwL6/Xuo9k=;
 b=QtyDH/oCp6chj8kOasNywBh1tJ4Q7G9pC+F167iYrTPdp1ztf7nbls3DqELN0+00Xo
 IsFgDlS0nAqz+u2di0I2mUjHunwzdNubX0VyAVhYNfWjmHFSXAYLWqyMvPUC1S+Rj2sN
 NOBlljkssJ79TXC2eKmB7fGve+Y186MvRe50O4NwXum67P0KSCWiOrgNz9LE1AmcghMl
 HynI5UNYyUrWiZkLi2rlEPBOlQQVw5YjIjG6bsNWAKsZ5yoAlxFj2Y7J2/VdYHnynN6L
 PvP+k3NgvyaDq9Y90LprGcYw06eMkb/5XKJgVCXRmvV0SjBtLLyM9N1EQnNswRgiVyun
 TlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R19nSqfwFjKMbuCUuu45u3kNS6yK2MxJbjwL6/Xuo9k=;
 b=aafeVwGoIj6rLkP81pMwuXW8ejPB7voAt9KroW0mrlK59EOW0w68tqO8XWneAVydNg
 zUCwfRh53Z/PeeGz5H8OJA2bOmI7A9g61AKEufir4B6BMAsZEOjFWwVw4l84qTK3YgBo
 vy3neqDzZ7s/MHv2U6SgOQZuhvwCHF2VSEUKFW++7++rrOeEstD24F6xe25M7TcnF6Sn
 k4Vv5fLm9GUl2xbmaAsytvK6/N0C648QxUAZFvWrgrjoZ7IrXXpZ2T0JHtI+PS8VRsef
 OuhH1MP6XCpsHEC7V0dXyBLCB7PAU+byo4AvcRhWxx0Y93GtFJjSAXUhGEv3jGghXmBV
 It/w==
X-Gm-Message-State: AOAM532/nXOvtlC5ZKlWnfeNSyR5oQooKs9OK8q5PqlDtLtlklnYUScF
 4kxCQyVjcafrn6LXdbraq9TY2fIHEvUJWHUrzy/Y4g==
X-Google-Smtp-Source: ABdhPJxBsPOjIwVhzgw6ohk6Ca8GFwuXLv/XpCGa7jqnU+naJk9H8cjHrKmn3MpnPlo+JlpG14YvfUu+P80O0TyV+08=
X-Received: by 2002:a67:3291:: with SMTP id y139mr6277739vsy.37.1591109927542; 
 Tue, 02 Jun 2020 07:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-3-sam@ravnborg.org>
 <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
In-Reply-To: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 15:55:29 +0100
Message-ID: <CACvgo52e_VE=oPz=A_rc=gkiSx+TqgPUm7smfe8yG6YYLHn+pA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple
 panel
To: Doug Anderson <dianders@chromium.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyIEp1biAyMDIwIGF0IDAxOjMxLCBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEp1biAxLCAyMDIwIGF0IDE6MzMg
QU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGUgU2Vp
a28gNzBXVlcyVCBpcyBhIGRpc2NvbnRpbnVlZCBwcm9kdWN0LCBidXQgbWF5IGJlIHVzZWQgc29t
ZXdoZXJlLgo+ID4gVGVzdGVkIG9uIGEgcHJvcHJpZXRhcnkgcHJvZHVjdC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogU8O4cmVu
IEFuZGVyc2VuIDxzYW5Ac2tvdi5kaz4KPiA+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgo+ID4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+IGluZGV4
IGIwNjdmNjZjZWEwZS4uODYyNGJiODAxMDhjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMKPiA+IEBAIC0zMTk0LDYgKzMxOTQsMzEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwYW5lbF9kZXNjIHNoZWxseV9zY2EwNzAxMF9iZm5fbG5uID0gewo+ID4gICAgICAgICAu
YnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTgsCj4gPiAgfTsKPiA+Cj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHNpaV83MHd2dzJ0X21vZGUgPSB7
Cj4gPiArICAgICAgIC5jbG9jayA9IDMzMDAwLAo+ID4gKyAgICAgICAuaGRpc3BsYXkgPSA4MDAs
Cj4gPiArICAgICAgIC5oc3luY19zdGFydCA9IDgwMCArIDI1NiwKPiA+ICsgICAgICAgLmhzeW5j
X2VuZCA9IDgwMCArIDI1NiArIDAsCj4gPiArICAgICAgIC5odG90YWwgPSA4MDAgKyAyNTYgKyAw
ICsgMCwKPiA+ICsgICAgICAgLnZkaXNwbGF5ID0gNDgwLAo+ID4gKyAgICAgICAudnN5bmNfc3Rh
cnQgPSA0ODAgKyAwLAo+ID4gKyAgICAgICAudnN5bmNfZW5kID0gNDgwICsgMCArIDAsCj4gPiAr
ICAgICAgIC52dG90YWwgPSA0ODAgKyAwICsgMCArIDQ1LAo+Cj4gSW1wb3J0YW50IHRvIGhhdmUg
YSAidnJlZnJlc2giPwo+ClZpbGxlIHBvc3RlZCBhIHNlcmllcyAobW9zdCBvZiB3aGljaCBhbHJl
YWR5IGxhbmRlZCkgZ2V0dGluZyByZW1vdmluZwp2cmVmcmVzaCBhbGwgdG9nZXRoZXIuIFRoZSBv
dmVyYWxsIGlkZWEgaXMgdG8gY29tcHV0ZSBpdCwgaW4gdGhlIHJhcmUKY2FzZSBpdCdzIG5lZWRl
ZC4KCgo+Cj4gPiArICAgICAgIC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTlZTWU5DIHwgRFJNX01P
REVfRkxBR19OSFNZTkMsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBh
bmVsX2Rlc2Mgc2lpXzcwd3Z3MnQgPSB7Cj4gPiArICAgICAgIC5tb2RlcyA9ICZzaWlfNzB3dncy
dF9tb2RlLAo+ID4gKyAgICAgICAubnVtX21vZGVzID0gMSwKPgo+IERvIHdlIHdhbnQgImJwYyA9
IDYiPwo+ClRoZSBsYXJnZXN0IHVzZXIgb2YgYnBjIGlzIHVzZXJzcGFjZSAtIHRoZSBkYXRhIGdl
dHMgY29waWVkIHZpYSB0aGUgaW9jdGxzLgoKQSBzZWNvbmRhcnksIGFuZCBxdWl0ZSBsaW1pdGVk
LCB1c2VyIGFyZSBkcml2ZXJzIGV4cG9zaW5nIHRoZSAibWF4CmJwYyIgY29ubmVjdG9yIHByb3Bl
cnR5LiBGcm9tIGEgcXVpY2sgbG9vazogYW1kZ3B1LCB0aGUgc3lub3BzeXMKZHctaGRtaSBicmlk
Z2UgYW5kIGk5MTUgZG8gc28uIEluIGNhc2UgdGhlIGRhdGEgbWlzc2luZywgYXRvbWljcwphc3N1
bWUgYSBtYXggOCBicGMuCgo+Cj4gPiArICAgICAgIC5zaXplID0gewo+ID4gKyAgICAgICAgICAg
ICAgIC53aWR0aCA9IDE1MiwKPiA+ICsgICAgICAgICAgICAgICAuaGVpZ2h0ID0gOTEsCj4gPiAr
ICAgICAgIH0sCj4gPiArICAgICAgIC5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MVgyNCwKPgo+IFNob3VsZCB0aGlzIGJlIGEgNjY2IGZvcm1hdD8gIFJhbmRvbSBpbnRlcm5ldC1m
b3VuZCBkYXRhIHNoZWV0IHNheXMKPiAyNjJLIGNvbG9ycy4uLgoKR29vZCBjYXRjaC4gV291bGQg
YmUgbmljZSB0byBoYXZlIGEgc3BlYyBzaGVldCBsaW5rIChldmVuIGlmIHJhbmRvbSkKaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLgoKSFRICi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
