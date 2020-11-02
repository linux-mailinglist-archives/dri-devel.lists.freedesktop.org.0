Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685EE2A3E9D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5209B6EC34;
	Tue,  3 Nov 2020 08:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50736E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:52:39 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id r10so11556946pgb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HK3WmJW6u7M5Vx/m49h+Vsg1q0S7SYUSgOeAa79ZZJk=;
 b=aFwIY8EW04InPVpjr7nipH18G4FAvswDmuqXCLLvRJjfVAYOc7qSxRnzhEC2rjfdc7
 xJWHaMe0AYzP6PUFnRMr7E0DVDwNN9l9YuIygAuViSk9uOzcoJybD3wYAmsnMlYhgKWV
 FTYNjgdhdw3VBoLrZhgl1rhLzi8TrQ5cEXIWic3oZ/bSWbeuHdonVlWSkBW/GUpizCN8
 ONphXj05E2sTYjX/NawxS/mtdKGBKrDsGtvN4tgUjwrWo8PJbZV9AyN4Oai1nU/9az1k
 DXLfiw811jl5BAOzvT4w7EqrLaStaH/ww0+oOhwMNNSLpQsrtH9L/jg0lSvwFSRUTxdt
 xmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HK3WmJW6u7M5Vx/m49h+Vsg1q0S7SYUSgOeAa79ZZJk=;
 b=BKxboSShkT0jDYp54DdRJqtON57GuOKyTN1BUYUrjHI9YFVxO/JHm9wYCDTalfESZR
 6VbVZpUhrKtIwSD8QiZG/J1UymNwu+de7UwBVYdeALAsamW6gzjb1aZcIa93FVBIQfkz
 GK1sr/6eFsmyjluZjccMRLmzXEj/Z1Ux2Wo5T+k8vN3fLgUptgplrnzZvcjxz2MEUXCF
 rNv/MpFZJpKbiDPLsl4hWVImGZI40mEqYZVvAy+YwypopFt9lZlwp5Xu0dDmvvZXDnEa
 Ppkqvf23oJQQyzZWYzOJojjJT++ERWv7DpXvX3fWU/grhgJP05QA51Gsle9Q4hUn07k7
 rw/A==
X-Gm-Message-State: AOAM5339gA0Pf1PgVyDWrW/oRTcyKVdYrIWh1AAegPqQQEXCCG8UWQNA
 vt4LFlvlFlp4AroXtcQnXu/m2cR2eck=
X-Google-Smtp-Source: ABdhPJxZFZg9a0x6Bf+IQte8IWMpeNM5Kh+wMkhnG24E8lYn1AFwZwa988kzNa4zMg3YHRzGP/ldnA==
X-Received: by 2002:a17:90a:a505:: with SMTP id
 a5mr18272328pjq.76.1604343159258; 
 Mon, 02 Nov 2020 10:52:39 -0800 (PST)
Received: from ?IPv6:2001:df0:0:200c:bd11:f10f:c2c8:538d?
 ([2001:df0:0:200c:bd11:f10f:c2c8:538d])
 by smtp.gmail.com with ESMTPSA id e2sm210215pjw.13.2020.11.02.10.52.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 10:52:38 -0800 (PST)
Subject: Re: [PATCH/RFC v2] video: fbdev: atari: Fix TT High video mode
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab <schwab@linux-m68k.org>
References: <20201101102941.2891076-1-geert@linux-m68k.org>
 <20201101112915.GB1263673@ravnborg.org> <874km91by4.fsf@igel.home>
 <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <609bf047-2c4a-393e-75f6-c86f748682dc@gmail.com>
Date: Tue, 3 Nov 2020 07:52:34 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUMF4R91Nt6mv9Tqz0zSaNh7AV8mghUoKL+uO-_PUH2aQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiAyLzExLzIwIDk6MzkgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiBIaSBBbmRyZWFzLAo+Cj4gT24gU3VuLCBOb3YgMSwgMjAyMCBhdCAxOjQ3IFBNIEFuZHJlYXMg
U2Nod2FiIDxzY2h3YWJAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+PiBPbiBOb3YgMDEgMjAyMCwg
U2FtIFJhdm5ib3JnIHdyb3RlOgo+Pj4gT24gU3VuLCBOb3YgMDEsIDIwMjAgYXQgMTE6Mjk6NDFB
TSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4+IFRoZSBob3Jpem9udGFsIHJl
c29sdXRpb24gKDY0MCkgZm9yIHRoZSBUVCBIaWdoIHZpZGVvIG1vZGUgKDEyODB4OTYwKSBpcwo+
Pj4+IGRlZmluaXRlbHkgYm9ndXMuICBXaGlsZSBmaXhpbmcgdGhhdCwgY29ycmVjdCB0aGUgdGlt
aW5ncyB0byBtYXRjaCB0aGUKPj4+PiBUVE0xOTUgc2VydmljZSBtYW51YWwuCj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+
Pj4+IC0tLQo+Pj4+IFVudGVzdGVkIG9uIGFjdHVhbCBoYXJkd2FyZSwgaGVuY2UgdGhlIFJGQy4K
Pj4+Pgo+Pj4+IHYyOgo+Pj4+ICAgIC0gVXNlIGNvcnJlY3QgYmFzZS4KPj4+PiAtLS0KPj4+PiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvYXRhZmIuYyB8IDQgKystLQo+Pj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0YWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0YWZi
LmMKPj4+PiBpbmRleCBmMjUzZGFhMDVkOWQzODcyLi41ZWNmM2VjOWY5NGNiNzIwIDEwMDY0NAo+
Pj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRhZmIuYwo+Pj4+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvYXRhZmIuYwo+Pj4+IEBAIC00OTUsOCArNDk1LDggQEAgc3RhdGljIHN0cnVj
dCBmYl92aWRlb21vZGUgYXRhZmJfbW9kZWRiW10gX19pbml0ZGF0YSA9IHsKPj4+PiAgICAgICAg
ICAgICAgICJ0dC1taWQiLCA2MCwgNjQwLCA0ODAsIDMxMDQxLCAxMjAsIDEwMCwgOCwgMTYsIDE0
MCwgMzAsCj4+Pj4gICAgICAgICAgICAgICAwLCBGQl9WTU9ERV9OT05JTlRFUkxBQ0VEIHwgRkJf
Vk1PREVfWVdSQVAKPj4+PiAgICAgICB9LCB7Cj4+Pj4gLSAgICAgICAgICAgIC8qIDEyODB4OTYw
LCAyOSBrSHosIDYwIEh6IChUVCBoaWdoKSAqLwo+Pj4+IC0gICAgICAgICAgICAidHQtaGlnaCIs
IDU3LCA2NDAsIDk2MCwgMzEwNDEsIDEyMCwgMTAwLCA4LCAxNiwgMTQwLCAzMCwKPj4+PiArICAg
ICAgICAgICAgLyogMTI4MHg5NjAsIDcyIGtIeiwgNzIgSHogKFRUIGhpZ2gpICovCj4+Pj4gKyAg
ICAgICAgICAgICJ0dC1oaWdoIiwgNTcsIDEyODAsIDk2MCwgNzc2MSwgMjYwLCA2MCwgMzYsIDQs
IDE5MiwgNCwKPj4+PiAgICAgICAgICAgICAgIDAsIEZCX1ZNT0RFX05PTklOVEVSTEFDRUQgfCBG
Ql9WTU9ERV9ZV1JBUAo+Pj4gV2VsbC1zcG90dGVkLiBUaGUgY2hhbmdlIG9mIDY0MCA9PiAxMjgw
IGlzIHN1cmVseSByaWdodC4KPiBUQkgsIEkgc3BvdHRlZCB0aGF0IDcgeWVhcnMgYWdvLCBidXQg
bmV2ZXIgZ290IHRvIGxvb2tpbmcgdXAgYW5kIGNhbGN1bGF0aW5nCj4gdGhlIG90aGVyIHZhbHVl
cy4uLgoKTG9va3MgbGlrZSBvbmUgb2YgbXkgY29weSZwYXN0ZSBlcnJvcnMgdGhhdCB3ZW50IHVu
ZGV0ZWN0ZWQgZm9yIHRvbyBsb25nLi4uCkkgc2VlbSB0byBoYXZlIGNvcGllZCB0aGUgdHQtbWlk
IHZhbHVlcyBhYm92ZSBpbiB0aGF0IGNhc2UuCgpOZWVkIHRvIGdvIGJhY2sgdG8gdGhlIG9sZCBk
cml2ZXIgdG8gc2VlIHdoYXQgaGFkIGJlZW4gdXNlZCB0aGVyZS4gQSBxdWljayBkaWZmIGRpZG4n
dCBzaG93IGFueXRoaW5nIHVzZWZ1bC4KCj4+PiBJIGhhdmUgYSBoYXJkZXIgdGltZSB1bmRlcnN0
YW5kaW5nIHdoeSB0aGUgY2hhbmdlIG9mIHBpeGNsb2NrIGZyb20gMzEwNDEKPj4+IHRvIDc3NjEg
aXMgY29ycmVjdC4gQWxsIG90aGVyIG1vZGVzIGhhdmUgYSBwaXhjbG9jayBjbG9zZSB0byBvciBl
cXVhbAo+Pj4gdG8gMzIwMDAgLSBzbyBpdCBsb29rcyBzdHJhbmdlIHRoaXMgb25lIGlzIG9mZi4K
PiAzMjAwMCBwcyBpcyAzMS4yNSBNSHouIExvb2tzIGxpa2UgdGhlc2UgYXJlIGJvZ3VzLCB0b28s
IGFuZCBvbmx5Cj4gdGhlIFZHQSBhbmQgRmFsY29uIHZpZGVvIG1vZGVzIGFyZSBjb3JyZWN0PwoK
VGhlc2Ugd2VyZSB0aGUgb25seSBvbmVzIEkgY291bGQgdGVzdCAoaGF2ZW4ndCBzZWVuIGEgVFQg
aW4gMjAgeWVhcnMpLiAKQXQgdGhlIHRpbWUgSSB3b3JrZWQgb24gdGhlIEF0YXJpIEZCIGRyaXZl
ciwgSSBkaWRuJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIApQcm9maWJ1Y2ggZWl0aGVyLgoKQXMgQW5k
cmVhcyBtZW50aW9uZWQsIHRoZSBGYWxjb24gKG9yIGV4dGVybmFsKSBoYXJkd2FyZSBpcyB0aGUg
b25seSBvbmUgCnRoYXQgY2FuIGJlIHByb2dyYW1tZWQgZnJlZWx5LCBzbyB3ZSBuZWVkIHRvIHdv
cmsgZnJvbSB0aGUgOTUgTUh6IApwaXhjbG9jayBBbmRyZWFzIGZvdW5kLiBUaGF0J3MgMTAuNSBu
cyBhcHByb3guCgoxMC41IG5zICogMTI4MCAqIDk2MCAob21pdHRpbmcgSEJMIGFuZCBWQkwgdGlt
aW5nKSBnaXZlcyA3NyBIeiByZWZyZXNoIApzbyBJIGRvbid0IHRoaW5rIDk1IE1IeiBmb3IgNzIg
SHogcmVmcmVzaCBhcmUgdW5yZWFzb25hYmxlLgoKTmVlZCB0byBsb29rIHVwIHdoYXQgYWxsIHRo
ZSBvdGhlciBudW1iZXJzIGluIHRoZSBtb2RlIGVudHJ5IG1lYW4gbm93IC4uLgoKQ2hlZXJzLAoK
IMKgwqDCoCBNaWNoYWVsCgoKPgo+PiBBY2NvcmRpbmcgdG8gdGhlIFByb2ZpYnVjaCB0aGUgcGl4
Y2xvY2sgc2hvdWxkIGJlIGFib3V0IDk1MDAwLgo+IDk1IG5zPyBUaGF0J3MgYSAxMC41IE1IeiBw
aXhlbCBjbG9jaz8gRGVmaW5pdGVseSB0b28gbG93Lgo+IFRoZSBUVE0xOTUgbWFudWFsIHNheXMg
MTI4Ljg1IE1Iei4KPgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
