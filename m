Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8174B0F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9F86E6B9;
	Thu, 25 Jul 2019 10:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337DF6E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:06:01 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so4146509qto.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dY1dpg/OHfGT/mutmAs25ca6whmcjcdibSv9ZWjkmsM=;
 b=sL9KHSb9sqjtxGSnSrFFbecdqzP0i+zPacPUANgjPpXmkKq2tkIdpL0XCgGxDffXZU
 AQncZeQowMxoEcs8vnaSv8UxYrp1PdcQklDpDG85MABWVoxtWiDrFePIApuF5jxkNdb+
 QfuNTgBfrYAz1bodYi4lQsa0DyZFr/vazsN8yAih3A4R3bL6m0Vvo70Rg0CwRl3Jogop
 HAJFpmwkGSlrfzp36y88qRlKq3qFBzcLER6fnyTad1CIYLa7vdH7h9nwTeDON9Ge0rCK
 mx7mnNtmJUq8Ydm/78084Zo3UR3c/s0xd8EsJdk1I8jntZy7Su6VWseDa05iRpchhSBs
 CtUA==
X-Gm-Message-State: APjAAAUQtUNSZRgHIs+SHlPY8AvHoNLX6DZPsB+dqH1IjP9NmEgIgVAD
 XfXjdXni4X6JD63Aj3J62gD6arPEc7yeWIzWebaV/A==
X-Google-Smtp-Source: APXvYqyNGztGQcRtMMJsWvdYYDKXUmMJH8KY8KYoJe4UVpVBo8GDSkeBtSiY93R7Znfd5M96vEy07a17By30LwrGnqE=
X-Received: by 2002:aed:36c5:: with SMTP id f63mr62620869qtb.239.1564049160250; 
 Thu, 25 Jul 2019 03:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:05:49 +0200
Message-ID: <CA+M3ks6aA2YpHG3Kb+JxxECvdWYkgOVabYqL4-QTUDYkM6N67Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
To: Olivier Moysan <olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dY1dpg/OHfGT/mutmAs25ca6whmcjcdibSv9ZWjkmsM=;
 b=Jfhn1IH6hkL03mon/JSCxCgfxtUbbHpAWLvoKakLq9+OvKHCgOwv54x4UYs6F+oQMn
 pYkQIJEg75i+hHconcv4V1/srr2zzQ2gLAF18fBF3ME7Lvqc9OSkQogjIIcoEHtIYzD7
 NNOk23BB7KD8mkF2N8cBwWxrirrIwIZ3Q64/Qs4CiRdRhGrXqGztvhuRIsUjCcx7OsNh
 1K2hL6DNo+hoWiB/V+VadwE/INHTA+S7S2oEyb+FW0F1AAaeEosEGU3YUvgpHt443Dvu
 NWKMDxuEbXYfUF6UQWng1gU1awRncLz4AvRJgscAlnEgrW9grqqxYPfBxrxKl2dxOCEc
 99bw==
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
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBBcyBzdGF0ZWQgaW4gU2lMOTAyMi8yNCBkYXRh
c2hlZXQsIG1hc3RlciBjbG9jayBpcyBub3QgcmVxdWlyZWQgZm9yIEkyUy4KPiBNYWtlIG1jbGsg
cHJvcGVydHkgb3B0aW9uYWwgaW4gRFQgYmluZGluZ3MuCj4KPiBGaXhlczogM2YxODAyMWY0M2Ez
ICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpaTkwMng6IEFkZCBIRE1JIGF1ZGlvIGJpbmRpbmdz
IikKPgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQuClRoYW5rcywKQmVuamFtaW4KCj4gU2lnbmVk
LW9mZi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4KPiBSZXZpZXdl
ZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiBBY2tlZC1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9z
aWk5MDJ4LnR4dAo+IGluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUwODdjMGQwIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5
MDJ4LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9zaWk5MDJ4LnR4dAo+IEBAIC0yNiw5ICsyNiw4IEBAIE9wdGlvbmFsIHByb3BlcnRp
ZXM6Cj4gICAgICAgICAtIGNsb2NrczogcGhhbmRsZSBhbmQgY2xvY2sgc3BlY2lmaWVyIGZvciBl
YWNoIGNsb2NrIGxpc3RlZCBpbgo+ICAgICAgICAgICAgIHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0
eQo+ICAgICAgICAgLSBjbG9jay1uYW1lczogIm1jbGsiCj4gLSAgICAgICAgICBEZXNjcmliZXMg
U0lJOTAyeCBNQ0xLIGlucHV0LiBNQ0xLIGlzIHVzZWQgdG8gcHJvZHVjZQo+IC0gICAgICAgICAg
SERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGlzIHJlcXVpcmVkIGlmCj4gLSAg
ICAgICAgICAiI3NvdW5kLWRhaS1jZWxscyItcHJvcGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9w
ZXJ0eSBmb2xsb3dzCj4gKyAgICAgICAgICBEZXNjcmliZXMgU0lJOTAyeCBNQ0xLIGlucHV0LiBN
Q0xLIGNhbiBiZSB1c2VkIHRvIHByb2R1Y2UKPiArICAgICAgICAgIEhETUkgYXVkaW8gQ1RTIHZh
bHVlcy4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCj4gICAgICAgICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0Cj4gICAgICAgICAgICBj
b25zdW1lciBiaW5kaW5nLgo+Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
