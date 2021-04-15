Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF2360421
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCE6E138;
	Thu, 15 Apr 2021 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE36E138
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:19:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z13so20803419lfd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FfnqRo/ZbtdxVGZff5uYV7HooY4ykDd6sr4h4ImhvwQ=;
 b=N6ZsqXWlokRSDYCT4+xA6odNxdJnv7grSWwu0sxH4elIwp7jQ6MPiwZZuCO2fTU59v
 rnLylYpfOHfv0AQjYQ/KPNDosT2vGm+Nqy0OBHKuT3ZhgCH/+ZK7mOEZlaTOwZmzya/u
 U/lgzKFdEwK6KwdxaRYfFNpXa2DBCwgn93RaUKeivGYNXzwSD650kY6H+M4gPAVye1HL
 lE/tXudQTuHTo/JF/3VdfvR7JPQ1fr1PXbyMHtlvprJqct7EYtkY6F03g32R7i+NPxXC
 pJMWQ8L+qrqsF7Pc3E0TTfxlCvQ2RZ6Nl9H1sfo8OKJ2pL03AEYeKHggmfjmMpluverF
 uBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfnqRo/ZbtdxVGZff5uYV7HooY4ykDd6sr4h4ImhvwQ=;
 b=I0SQijkuuAYuI75tQx0RehSukJDl7kX+jbpGcc5qqJ04AiRRgB7tLaurcYzJkfX2v/
 +CkytJJD/ydWR6Gi6IxN8s7ag9x/TLoGQCsNRhNSbDHYD6yvQXq0bmMcrwv7V2LEwaaG
 vCwHQInqeizCHhfZX+yF7lF6O90YcbMfCTKUnzl7LWAFFd3TV3v0TQ19QGH7dDj6pnFD
 mqDtniZw8fRntV5L0TW6qekx8gmhN7AHu69xQOnia3TuvyYnrCu3pl57mNEI2mbBhRAo
 WlkK+cmaVMF7s0d5IoQtWQFq4a9ggeorQeRqw3XQVIyzhbNwfq3Pag+pH4L53d9m6hS8
 mYIw==
X-Gm-Message-State: AOAM530NvKN/+bU5YVQZi8aOkHaSn8g287cxlQ87uw4NglYe3WUURsoL
 T3k+zftAQvpofGFEOcCMJSA3Rqw6dRD0DuWd1wk=
X-Google-Smtp-Source: ABdhPJyxWDC9p3efVyUxwazeMnyrL0/ToYsX1iaQQo8kZRbCfX6/ATFc5gfc1kCCW7fV3A8PYyjwxikEp2L07Fv0Fpo=
X-Received: by 2002:a05:6512:1050:: with SMTP id
 c16mr1866048lfb.295.1618474795857; 
 Thu, 15 Apr 2021 01:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-7-kevin3.tang@gmail.com>
 <20210324112745.n76qhrbhzyfunmkd@gilmour>
 <CAFPSGXYK0Hi2-eYkukO2pNhHrJVZ=f79sj_hjXnGBZ_meVmkFg@mail.gmail.com>
 <20210407104854.fgn67pvau7dchcm2@gilmour>
In-Reply-To: <20210407104854.fgn67pvau7dchcm2@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Thu, 15 Apr 2021 08:19:44 +0800
Message-ID: <CAFPSGXbJwNd47UAwVu4c1t5K7j4sgMtTLtDZ15woHZbRTghVfA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IOS6jjIwMjHlubQ05pyIN+aXpeWRqOS4
iSDkuIvljYg2OjQ45YaZ6YGT77yaCj4KPiBPbiBXZWQsIE1hciAzMSwgMjAyMSBhdCAwOTo0Nzox
MkFNICswODAwLCBLZXZpbiBUYW5nIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3ByZC9NYWtlZmlsZQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL01ha2Vm
aWxlCj4gPiA+ID4gaW5kZXggNmMyNWJmYTk5Li5kNDlmNDk3N2IgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvTWFrZWZpbGUKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3ByZC9NYWtlZmlsZQo+ID4gPiA+IEBAIC0xLDUgKzEsOCBAQAo+ID4gPiA+ICAjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ID4KPiA+ID4gPiAgb2JqLXkgOj0g
c3ByZF9kcm0ubyBcCj4gPiA+ID4gLSAgICAgc3ByZF9kcHUubwo+ID4gPiA+IC0KPiA+ID4gPiAr
ICAgICBzcHJkX2RwdS5vIFwKPiA+ID4gPiArICAgICBzcHJkX2RzaS5vIFwKPiA+ID4gPiArICAg
ICBkd19kc2lfY3RybC5vIFwKPiA+ID4gPiArICAgICBkd19kc2lfY3RybF9wcGkubyBcCj4gPiA+
Cj4gPiA+IFNvIGl0J3MgYSBkZXNpZ253YXJlIElQPyBUaGVyZSdzIGEgZHJpdmVyIGZvciBpdCBh
bHJlYWR5IHRoYXQgc2VlbXMKPiA+ID4gZmFpcmx5IHNpbWlsYXI6Cj4gPiA+IGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwo+ID4gPgo+ID4gT3VyIGR3IGRzaSBj
b250cm9sbGVyIGlzIG5vdCBhIHN0YW5kYXJkIHN5bm9wc3lzIGlwLCB3ZSBoYXZlIHVwZGF0ZWQg
YSBsb3QKPiA+IG9uIHRoZSBiYXNpYyBpcCB2ZXJzaW9uLAo+ID4gdGhlIGVudGlyZSBjb250cm9s
IHJlZ2lzdGVyIGlzIGRpZmZlcmVudCwgaSBoYXZlIGNjIHRvIGRybS9icmlkZ2UgcmV2aWV3ZXJz
Cj4gPiBhbmQgbWFpbnRhaW5lcnMuCj4KPiBZb3Ugc2hvdWxkIG1ha2UgaXQgbW9yZSBvYnZpb3Vz
IHRoZW4gaW4gYSBjb21tZW50IG9yIGluIHRoZSBuYW1lIG9mIHRoZQo+IGRyaXZlci4gSWYgaXQn
cyBmYWlybHkgZGlmZmVyZW50IGZyb20gdGhlIG9yaWdpbmFsIElQIGZyb20gU3lub3BzeXMsCj4g
bWF5YmUgeW91IHNob3VsZCBqdXN0IGRyb3AgdGhlIHJlZmVyZW5jZSB0byB0aGUgbmFtZT8KVGhr
cywgaSB3aWxsIGJlIGZpeCBpdC4KPgo+IE1heGltZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
