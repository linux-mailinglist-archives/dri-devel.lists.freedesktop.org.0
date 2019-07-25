Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C774B11
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705B6E6BD;
	Thu, 25 Jul 2019 10:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108A46E6BD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:06:22 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so48505978qto.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zQMVxe3WoXIZNphAhnksatgFc1GF8rTdTdgr2SLV9iE=;
 b=gbLBGrs7rpk4x1tH93PsqX3bZ+fNOvqQ8stmmTlfdwJtw5wO/ap1B1RKkYQPkB5mm4
 loNNxK/5jeQgJHg35rRfoQD/uSmFaCs2KOtHMvElimcKgqhVyMwvbZl7ZmcIopyZDoI7
 c/b4/kiYFr7VkvByEB+/JEgGv34dhYATdRhPx+APJJsbkL7f2WwKLjQ2oDWtfz+xFasK
 M+Ri2xUrChKQxfNGBOP+yYNI1FPQ1foZyRYIkGpzY2AK3jJTVzTNNec1ebvFqIjWoT/P
 QhngFP3hkPVNlznEcEEBHT1d4Mf7QK6FYmy7dpeyJnSKqxB74acg7u+sJ/kpaSH+po0y
 YR9Q==
X-Gm-Message-State: APjAAAVCZuD4rVo8E532SRMnpWbaSbUZ8IepmvrrzzpOPr56+8G7jq4f
 Z4zbEDw8WFRnYxweGcWKx08BYeVbgIa0OplLKud7oA==
X-Google-Smtp-Source: APXvYqxiUgtD1Oqp5s64OPc9Tv6xDA0YAOE0HLwM37Elo/1REVFSdGgH6ZMP+A2uMINEanG0dwqemHajRYVCdHtY8NM=
X-Received: by 2002:ac8:7402:: with SMTP id p2mr59799351qtq.250.1564049181185; 
 Thu, 25 Jul 2019 03:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:06:10 +0200
Message-ID: <CA+M3ks6ZRrLAa=xMPi5UfdLEzMCBCjeovUei2O9m8V4PW3bh-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: sii902x: make audio mclk optional
To: Olivier Moysan <olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zQMVxe3WoXIZNphAhnksatgFc1GF8rTdTdgr2SLV9iE=;
 b=kDPaigz0G8Pu7nH11KHGXyzXzcWIGm8p48us4Zolu2noXTfmgTxNEGRY9ENB0JwjaL
 GAuiJMo3VWyDGeJ8iaGqgT7ou/XAFWXqi4J7XyA3YnPE2QbNirtXBhWdIiQ3j0sJGPL+
 55c+K3owfz2iMnuXKKivBARspjVkdOjLySJyyNiiNhiEY0yHomFtSMJp6HDRLu5fnQrg
 iNLM1w9zDj/QxyOFNkat6bw50e6EP0NMzk6p3cBmi5UGRM4XhEXiRpCCienLXFg6+RJB
 lgjO869eVfc0mfQSTuuUSAJxC0LmLbDN9AfP4IqsCCvOOtPrjuZVxSZ75f3PRtPV4oXj
 9KVA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 jernej.skrabec@siol.net, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBUaGUgbWFzdGVyIGNsb2NrIG9uIGkycyBidXMg
aXMgbm90IG1hbmRhdG9yeSwKPiBhcyBzaWk5MDJYIGludGVybmFsIFBMTCBjYW4gYmUgdXNlZCBp
bnN0ZWFkLgo+IE1ha2UgdXNlIG9mIG1jbGsgb3B0aW9uYWwuCgpBcHBsaWVkIG9uIGRybS1taXNj
LW5leHQuClRoYW5rcywKQmVuamFtaW4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNh
biA8b2xpdmllci5tb3lzYW5Ac3QuY29tPgo+IFJldmlld2VkLWJ5OiBKeXJpIFNhcmhhIDxqc2Fy
aGFAdGkuY29tPgo+IEFja2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDE5ICsrKysrKysr
KystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IDk2MjkzMWMyMGVmZS4u
YTMyMzgxNWFhOWI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAy
eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNTY4LDEz
ICs1NjgsMTQgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAg
ICAgICB9Cj4KPiAtICAgICAgIG1jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRp
by5tY2xrKTsKPiAtCj4gLSAgICAgICByZXQgPSBzaWk5MDJ4X3NlbGVjdF9tY2xrX2RpdigmaTJz
X2NvbmZpZ19yZWcsIHBhcmFtcy0+c2FtcGxlX3JhdGUsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtY2xrX3JhdGUpOwo+IC0gICAgICAgaWYgKG1jbGtfcmF0ZSAhPSBy
ZXQgKiBwYXJhbXMtPnNhbXBsZV9yYXRlKQo+IC0gICAgICAgICAgICAgICBkZXZfZGJnKGRldiwg
IkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0gJXUpXG4iLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBsZV9yYXRlKTsKPiAr
ICAgICAgIGlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKSB7Cj4gKyAgICAgICAgICAgICAgIG1jbGtf
cmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdfcmVnLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJhbXMtPnNhbXBsZV9y
YXRlLCBtY2xrX3JhdGUpOwo+ICsgICAgICAgICAgICAgICBpZiAobWNsa19yYXRlICE9IHJldCAq
IHBhcmFtcy0+c2FtcGxlX3JhdGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhk
ZXYsICJJbmFjY3VyYXRlIHJlZmVyZW5jZSBjbG9jayAoJWxkLyVkICE9ICV1KVxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBs
ZV9yYXRlKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgbXV0ZXhfbG9jaygmc2lpOTAyeC0+bXV0
ZXgpOwo+Cj4gQEAgLTc1MSwxMSArNzUyLDExIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19j
b2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAgICAgICAgICAgICAgICBzaWk5
MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19maWZvX2lkW2ldIHwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9pZFtsYW5lc1tpXV0gfCBTSUk5MDJYX1RQ
SV9JMlNfRklGT19FTkFCTEU7Cj4KPiAtICAgICAgIHNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZt
X2Nsa19nZXQoZGV2LCAibWNsayIpOwo+ICsgICAgICAgc2lpOTAyeC0+YXVkaW8ubWNsayA9IGRl
dm1fY2xrX2dldF9vcHRpb25hbChkZXYsICJtY2xrIik7Cj4gICAgICAgICBpZiAoSVNfRVJSKHNp
aTkwMngtPmF1ZGlvLm1jbGspKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiJXM6
IE5vIGNsb2NrIChhdWRpbyBtY2xrKSBmb3VuZDogJWxkXG4iLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCBQVFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKTsKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNpaTkw
MngtPmF1ZGlvLm1jbGspOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBzaWk5MDJ4LT5hdWRpby5w
ZGV2ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoCj4gLS0KPiAyLjcuNAo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
