Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D465E4E9DE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681CB6E8B7;
	Fri, 21 Jun 2019 13:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571F56E8B7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:48:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so6642494wru.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVMU7oaSKdkRdlofymJ5DYfLIF+rwC/yvVaWh3kOoEw=;
 b=fGrCMQGrpqI3lVqmmdUB1S6auqewkmGku3qGFH3DWoGXSeV8QvtxRxCfUrCCpxammi
 MNGWkKbclcQn85+HZ92wulm/I9i0dTLHYTYf8brfdw/BaA1kMg4rQrDE8xeDF7cJcpZR
 /QeJ092ghFzcD6MaZjp++FEgizm8++9csmzZIdL6rHfESCnU08MmKYm5+PeEAL7diAsK
 fumwJeeOvPh7CLso3GpH74wfbQd/PTDJ/K5OkO04NrgF+ckq4g+IZdy4zh1R1z9Bq8mP
 OkgNE7LsNmKHuf7bCAXAcz3mbbyEw2im9tmJn/uO2z78kEKpU/6O/JtEpfIf3RHe1vaa
 WAHg==
X-Gm-Message-State: APjAAAWfDbXUrWQCJ1fbbhC4Kn1BwBuuzCVFQW3JX6vKGnozIgZaNBge
 PpIfztxEAP0z4LfdnvYBXkpABRpYD26dvw==
X-Google-Smtp-Source: APXvYqwR9joQI2E3Vm5sKE/BzZA1o04AWct01TioDhmMeym+jKVOUv8KuGh9LmMdwjzUIU+jGE4/2w==
X-Received: by 2002:adf:f946:: with SMTP id q6mr10474826wrr.109.1561124932997; 
 Fri, 21 Jun 2019 06:48:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id 5sm5076469wrc.76.2019.06.21.06.48.51
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 06:48:52 -0700 (PDT)
Subject: Re: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To: Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <da193d14-5cb7-3a1a-148e-fb8554c5def7@linaro.org>
Date: Fri, 21 Jun 2019 14:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hVMU7oaSKdkRdlofymJ5DYfLIF+rwC/yvVaWh3kOoEw=;
 b=JgTh/4RaznsHwkTN653/84e9sr7CP/NNg3yehyl8WKHWGl0VbSpb8RVRqYFsGV7EWo
 LHVmS2028eAVgaoA36BkKonyKPyJhPREea/eOHDTH1R4xJtCMwwLY3WfoCC8p8kWXFCu
 zy5qu7gv46sJfHcgCqEx6cfCfFEFJi48fvpL3sfOX9fyYMAMW/M9Dz2lXEaQyFOTki4s
 jxDFwmpbiI3ycbK9UpNNJ7N/1/+QrDDmRKzxAp6JaahNzBnT80KH25uBBtwaXGQav74E
 lNgkT4HZBdmB9HFHWlbNSpIB6X5H91uOoR7sE2bBo14aK6OHLjGE4mbVa2PKDpEYVW8Z
 GqRQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDYvMjAxOSAxNDo0NiwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IFtTb3JyeSB0byB0
aG9zZSByZWNlaXZpbmcgdGhpcyB0d2ljZS4uLiBoYWQgdG8gZGlnIHRoaXMgb3V0IGZyb20gdGhl
IAo+IGFyY2hpdmVzIGFuZCBzZW50IGl0IHRvIHRoZSBsaXN0cyBmcm9tIHRoZSB3cm9uZyBtYWls
ZXJdCj4gCj4gT24gMjcvMTEvMjAxOCAwMDo0NCwgQnJpYW4gRG9kZ2Ugd3JvdGU6Cj4+IFRoYW5r
IHlvdSBQYXZlbCwgdGhhdCBpcyBhIGdvb2QgcG9pbnQuCj4+Cj4+IFRoZSBjaGlwIHZlbmRvciBo
YXMgaW5kaWNhdGVkIHRoYXQgdGhlcmUgaXMgbm8gcmVhc29uIHRvIG1haW50YWluIHRoZSAKPj4g
b2xkL2ltcHJvcGVyIHByZWZpeCBhbmQgd2lzaGVzIHRvIGdvIGZvcndhcmQgKG9ubHkpIHdpdGgg
dGhlICJhcmN0aWMiIAo+PiBwcmVmaXggYW5kIGFueSBleGlzdGluZyBkdHMgZmlsZXMgYXJlIG9y
IHdpbGwgYmUgdXBkYXRlZC4KPiAKPiBMb29rcyBsaWtlIHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBm
YWxsZW4gaW50byB0aGUgY3JhY2tzIGEgbGl0dGxlLgo+IAo+IEkgdGhpbmsgSSBhc3N1bWVkIHRo
aXMgaW5mbyB3b3VsZCBlbmQgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIHBhdGNoIHYyIDEvMyAKPiAo
aW4gb3JkZXIgdG8gYW5zd2VyIFJvYidzIGZlZWRiYWNrKSBhbmQgSSBzYXQgYW5kIHdhaXRlZCBm
b3IgYSByZXNwaW4uIAo+IE9uIHRoZSBvdGhlciBoYW5kLi4uIEkgZGlkbid0IGFjdHVhbGx5IHNh
eSB0aGF0IGV4cGxpY2l0bHkgYW55d2hlcmUhIAo+IFNvLi4uIEknZCByZWNvbW1lbmQgYSByZXNw
aW4gcGVyaGFwcyB3aXRoIGEgc21hbGwgYml0IG9mIHRleHQgZXhwbGFpbmluZyAKPiBob3cgdGhl
IHZlbmRvciBjYW4gc3RhdGUgdGhhdCBhbnkgZXhpc3RpbmcgZHRzIGZpbGVzIHdpbGwgYmUgdXBk
YXRlZC4gCj4gVGhpcyBpcyBhIHBlcmlwaGVyYWwgZGV2aWNlIHNvIHRoZXNlIHN0cmluZ3MgYXJl
IHByb2JhYmx5IGVtYmVkZGVkIGludG8gCj4gT0VNIGRldmljZXRyZWVzIHJhdGhlciB0aGFuIGV4
Y2x1c2l2ZWx5IHVuZGVyIHRoZSBjb250cm9sIG9mIHRoZSB2ZW5kb3IuCgpJbiBmYWN0IHRoZXJl
J3MgYSBwdWJsaWNseSBhdmFpbGFibGUgZXhhbXBsZSB1c2luZyB0aGlzIGJpbmRpbmc6Cmh0dHBz
Oi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5l
bC8rL2ZhY3RvcnktZ3J1LTg2NTIuQi1jaHJvbWVvcy00LjQvYXJjaC9hcm02NC9ib290L2R0cy9y
b2NrY2hpcC9yazMzOTktZ3J1LWdydS5kdHNpCgpJJ20gbm90IHN1cmUgaXQgY291bGQgYmUgY2hh
bmdlZCB3aXRob3V0IG1haW50YWluaW5nIHN1cHBvcnQgZm9yIG9sZCBuYW1lcy4KCgpEYW5pZWwu
CgoKPiAKPiAKPiBEYW5pZWwuCj4gCj4gCj4+Cj4+IE9uIDExLzExLzE4IDY6MzAgQU0sIFBhdmVs
IE1hY2hlayB3cm90ZToKPj4+IEhpIQo+Pj4KPj4+PiBUaGUgdmVuZG9yLXByZWZpeGVzLnR4dCBm
aWxlIHByb3Blcmx5IHJlZmVycyB0byBBcmN0aWNTYW5kCj4+Pj4gYXMgYXJjdGljIGJ1dCB0aGUg
ZHJpdmVyIGltcHJvcGVybHkgYWJicmV2aWF0ZWQgdGhlIHByZWZpeAo+Pj4+IHRvIGFyYy4gVGhp
cyB3YXMgYSBtaXN0YWtlIGluIHRoZSBvcmlnaW5hbCBwYXRjaAo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQnJpYW4gRG9kZ2UgPGJkb2RnZTA5QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMgfCAyMiArKysrKysrKysrKy0tLS0t
LS0tLS0tCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQo+Pj4+Cj4+Pj4gwqDCoCAqCj4+Pj4gLSAqIENvcHlyaWdodCAyMDE2IEFyY3RpY1Nh
bmQsIEluYy4KPj4+PiAtICogQXV0aG9yIDogQnJpYW4gRG9kZ2UgPGJkb2RnZUBhcmN0aWNzYW5k
LmNvbT4KPj4+PiArICogQ29weXJpZ2h0IDIwMTggcFNlbWksIEluYy4KPj4+PiArICogQXV0aG9y
IDogQnJpYW4gRG9kZ2UgPGJkb2RnZUBwc2VtaS5jb20+Cj4+PiBVbW1tLiBDb3B5cmlnaHQgMjAx
Ni0yMDE4Pwo+Pj4KPj4+PiBAQCAtMjAyLDI3ICsyMDIsMjcgQEAgc3RhdGljIHZvaWQgYXJjeGNu
bl9wYXJzZV9kdChzdHJ1Y3QgYXJjeGNubiAqbHApCj4+Pj4gwqDCoMKgwqDCoCBpZiAocmV0ID09
IDApCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxwLT5wZGF0YS0+aW5pdGlhbF9icmlnaHRuZXNz
ID0gcHJvZ192YWw7Cj4+Pj4KPj4+PiAtwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5vZGUsICJhcmMsbGVkLWNvbmZpZy0wIiwgJnByb2dfdmFsKTsKPj4+PiArwqDCoMKgIHJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsbGVkLWNvbmZpZy0wIiwgCj4+Pj4g
JnByb2dfdmFsKTsKPj4+PiDCoMKgwqDCoMKgIGlmIChyZXQgPT0gMCkKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgbHAtPnBkYXRhLT5sZWRfY29uZmlnXzAgPSAodTgpcHJvZ192YWw7Cj4+Pj4KPj4+
IElmIHRoZXJlJ3MgYSBkdHMgdXNpbmcgdGhpcywgeW91IHdhbnQgdG8gdXBkYXRlIGl0IGF0IHRo
ZSBzYW1lCj4+PiB0aW1lLiBZb3UgbWF5IHdhbnQgdG8gc3VwcG9ydCBib3RoIG5hbWVzIGdvaW5n
IGZvcndhcmQuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBhdmVsCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
