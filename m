Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171E29334
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDF26E02B;
	Fri, 24 May 2019 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA026E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:35:21 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t64so6039215qkh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=stihjVpyL81uND5ibC7iaE+uqyg/RcZbMfoVKMB+mtE=;
 b=Jz+XY/LGYi15F2fr/A5Nrb3qBAVNci+7ZEd8epmQ32Vh9FfNEhEr7awNidRusUd8UC
 PpG2lmjQNHYi0fenfH4Q3C5Rcu5riR/HRRUA6GQI+ij+H5wqLbkp5FkJGqVtbRHujCgX
 mDSD4L/sXZ0aWtAc9Mk67dKR+9FctRu7/tDmrJHd5BbuWRfDcAJn8MjJ28cvL0g0HzIF
 IQTbM8PYZhlfYi7043BpB4GofAKLbjHByxPs16UieEO0MyEFFttydvcJKrivabJemUfI
 XZzhyZZgK9orwpHx1h54ikfFlKWwv/GKMoWaap/mtzFr4swVThOFMeAP4RioDkN3IsdH
 0fuw==
X-Gm-Message-State: APjAAAVlB6oaesz18Z5Wvt7T9X3QJWNk3t1TjvzGVNGNexiqiiYgCRIC
 75F4Tuu+dSFj3BUU9xVqm+nytwM7jAV2Xsb3gkwjgac5xAE=
X-Google-Smtp-Source: APXvYqzoub85iC3qRkUT/1rqPcbCAqf2PraA42mUh6gZCy1soKl7824Xl/NLHnNFN2zZSje+ohS+z/SwZ9ZQTmdisuQ=
X-Received: by 2002:a0c:ad85:: with SMTP id w5mr11932788qvc.242.1558686920808; 
 Fri, 24 May 2019 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <1557753318-11218-1-git-send-email-yannick.fertre@st.com>
 <317f94d6-846f-92e2-bd0f-b44377ea7845@st.com>
In-Reply-To: <317f94d6-846f-92e2-bd0f-b44377ea7845@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 24 May 2019 10:35:10 +0200
Message-ID: <CA+M3ks77XPTZubS8icLdTF3mpQ3OHsvSqX35hHQik3ygRiGSZg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/stm: ltdc: remove clk_round_rate comment
To: Philippe CORNU <philippe.cornu@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=stihjVpyL81uND5ibC7iaE+uqyg/RcZbMfoVKMB+mtE=;
 b=COOin8sWa/lSfTHzEbCe7QsWKGFHiwbo+Kuqmt7jQDTjGn3ID2t5iZEWRjwnG6By71
 uv4qD+B6V+lTSd1cGxfjm6xdUqKzNvZcPCCozGAex2g3HPLoSyGt0NRZJNju326CVrUV
 MZiPPpSrfATRPBRj69TBl8hi4mwSD9d9Ry0RIkDRDarSJhV7v4vh0sMntfyLf1zjBRF6
 ur+A0Nr18atc8xLW4L1cLh+ev5aI/b8CI+deN/SFEn4H6FL/TkNMHhBha/cCFesIbyQj
 44MwusoS5aJ1WsuHrDOHZoGBVhNW/7ciTNwIzlDSGh3AbxWasZnSztVK7nzT87PYKu6H
 HZOg==
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuLiAxMyBtYWkgMjAxOSDDoCAxNjo0NiwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gRGVhciBZYW5uaWNrLAo+Cj4gQWNrZWQtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4KQXBwbGllZCBvbiBkcm0tbWlz
Yy1uZXh0LAoKQmVuamFtaW4KCj4gVGhhbmsgeW91LAo+Cj4gUGhpbGlwcGUgOi0pCj4KPiBPbiA1
LzEzLzE5IDM6MTUgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiA+IENsa19yb3VuZF9yYXRl
IHJldHVybnMgcm91bmRlZCBjbG9jayB3aXRob3V0IGNoYW5naW5nCj4gPiB0aGUgaGFyZHdhcmUg
aW4gYW55IHdheS4KPiA+IFRoaXMgZnVuY3Rpb24gY291bGRuJ3QgcmVwbGFjZSBzZXRfcmF0ZS9n
ZXRfcmF0ZSBjYWxscy4KPiA+IFRvZG8gY29tbWVudCBoYXMgYmVlbiByZW1vdmVkICYgYSBuZXcg
bG9nIGluc2VydGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFu
bmljay5mZXJ0cmVAc3QuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAgICAg
LSBDbGtfZW5hYmxlICYgY2xrX2Rpc2FibGUgYXJlIG5lZWRlZCBmb3IgdGhlIFNPQyBTVE0zMkY3
Cj4gPiAgICAgICAgKG5vdCBmb3IgU1RNMzJNUDEpLiBJIHJldHVybiB0aGlzIHBhcnQgb2YgdGhl
IHBhdGNoIHRvIG1ha2Ugc3VyZSB0aGUKPiA+ICAgICAgICBkcml2ZXIgaXMgY29tcGF0aWJsZSB3
aXRoIGFsbCBTT0MgU1RNMzIuCj4gPgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8
IDggKysrLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gaW5kZXggOTc5MTJlMi4uMTEwNGU3OCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTUwNywxMSArNTA3LDYgQEAgc3RhdGljIGJv
b2wgbHRkY19jcnRjX21vZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gICAgICAg
c3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwo+ID4gICAgICAg
aW50IHJhdGUgPSBtb2RlLT5jbG9jayAqIDEwMDA7Cj4gPgo+ID4gLSAgICAgLyoKPiA+IC0gICAg
ICAqIFRPRE8gY2xrX3JvdW5kX3JhdGUoKSBkb2VzIG5vdCB3b3JrIHlldC4gV2hlbiByZWFkeSwg
aXQgY2FuCj4gPiAtICAgICAgKiBiZSB1c2VkIGluc3RlYWQgb2YgY2xrX3NldF9yYXRlKCkgdGhl
biBjbGtfZ2V0X3JhdGUoKS4KPiA+IC0gICAgICAqLwo+ID4gLQo+ID4gICAgICAgY2xrX2Rpc2Fi
bGUobGRldi0+cGl4ZWxfY2xrKTsKPiA+ICAgICAgIGlmIChjbGtfc2V0X3JhdGUobGRldi0+cGl4
ZWxfY2xrLCByYXRlKSA8IDApIHsKPiA+ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJDYW5ub3Qg
c2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOwo+ID4gQEAgLTUyMSw2ICs1
MTYsOSBAQCBzdGF0aWMgYm9vbCBsdGRjX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCj4gPgo+ID4gICAgICAgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSBjbGtfZ2V0X3JhdGUo
bGRldi0+cGl4ZWxfY2xrKSAvIDEwMDA7Cj4gPgo+ID4gKyAgICAgRFJNX0RFQlVHX0RSSVZFUigi
cmVxdWVzdGVkIGNsb2NrICVka0h6LCBhZGp1c3RlZCBjbG9jayAlZGtIelxuIiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgbW9kZS0+Y2xvY2ssIGFkanVzdGVkX21vZGUtPmNsb2NrKTsKPiA+
ICsKPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gICB9Cj4gPgo+ID4gLS0KPiA+IDIuNy40Cj4g
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
