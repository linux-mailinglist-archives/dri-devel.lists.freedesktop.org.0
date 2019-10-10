Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B5D30FD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 20:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42736E3D3;
	Thu, 10 Oct 2019 18:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203596E3DB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 18:57:19 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id r134so2567879ywg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mYkYKZa/IAW40qve7RH1LUnrxfude3aPqx7Bo9IiEv4=;
 b=ltG/+J4nAgpcEd2wh+juXAqSyj4gY3NGinzxY4vX0qFze2t7ijPMrGu05AeQ7rdDJp
 T+tbG0H3oQrsnnFLf4aHAGXdkZ0dHAsdYpWR/Bj4CA24ymQP4GAoL6wdt41BwMLs8LV5
 Ee2Z0DMbSBg89YKfK7NE/GiI0Qq8L5OWkCtqGHc6wHeJk1r5ppz5oiLS+xx+Hr+0VXJT
 Q7UujBfezEJ1EbMdwpXh5qnrS7EY/M/09v7QjHL+Tu2f6n5EZhbBWYMYp60BF3vejsW6
 S+HIqSvrkFTkuTm+od6LRAwb5cJRsMnkfHyIfaiY0WkmdDPIQl5mz7DfcWk+fipuAKa0
 wq5A==
X-Gm-Message-State: APjAAAV3R/7EVxgryRskU/XV4IlgVRwlQxzbH6hjs77+Awidpu+Zc4KB
 zoyZK9vLzHN7zY7wb5YHgIcEsg==
X-Google-Smtp-Source: APXvYqySCH3C8J2Ty5BHwit0g2ny5UP/WmSooJooTN0l8IoUdxx0irRLuBVLWsOUjetHHXeo07b9Ug==
X-Received: by 2002:a81:33cf:: with SMTP id z198mr8509359ywz.165.1570733838187; 
 Thu, 10 Oct 2019 11:57:18 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id f127sm1653890ywe.89.2019.10.10.11.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 11:57:17 -0700 (PDT)
Date: Thu, 10 Oct 2019 14:57:17 -0400
From: Sean Paul <sean@poorly.run>
To: kholk11@gmail.com
Subject: Re: [PATCH v2 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Message-ID: <20191010185717.GL85762@art_vandelay>
References: <20190926105256.61412-1-kholk11@gmail.com>
 <20190926105256.61412-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926105256.61412-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mYkYKZa/IAW40qve7RH1LUnrxfude3aPqx7Bo9IiEv4=;
 b=UZFnzXEhuzt61QVzj95dAbZOvJ0ddWU6/oG5/XPc8ZqLaDrICqCqw8WzVXKn8RxcRB
 b9xkIHX8nJuKhNF3/T39PDCFj4R/87HfwO8bquG1h/RWWlwXrTC11Cj5JoAr7c6LUapy
 EotDLgJoyENJw8z96hVdo4QYqeiDqtJNBCOycKtSdH+4w8fhYbHJiL+Bj6GZufLw46JX
 kwPtlQxKLV2KfGXQubdbuHW+zzdnwlLPZA7nutvPnPPc0gqL8jhRpZA1h1gpQm5uIkuN
 eXfRSsl0Exhuqs9eCqbnQv5fwyz8IACv620I+/EeyhO1L5DAl0o0oyh6ohkiEjGLP3jX
 oEOg==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
 sean@poorly.run, georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NTI6NTJQTSArMDIwMCwga2hvbGsxMUBnbWFpbC5j
b20gd3JvdGU6Cj4gRnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNv
bT4KCkhpIEFuZ2VsbywKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoZXMhCgo+IAo+IFNvbWUgU29D
cywgbGlrZSBNU004OTU2Lzg5NzYgKGFuZCBBUFEgdmFyaWFudHMpLCBkbyBmZWF0dXJlIHRoZXNl
Cj4gY2xvY2tzIGFuZCB3ZSBuZWVkIHRvIGVuYWJsZSB0aGVtIGluIG9yZGVyIHRvIGdldCB0aGUg
aGFyZHdhcmUgdG8KPiBwcm9wZXJseSB3b3JrLgoKQ291bGQgeW91IGFkZCBhbiBleHBsYW5hdGlv
biB0byB0aGUgY29tbWl0IG1lc3NhZ2Ugb2Ygd2hhdCB0aGVzZQpjbG9ja3MgYXJlL2RvLCBmb3Ig
dGhvc2Ugb2YgdXMgd2hvIGRvbid0IGtub3c/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZ2VsbyBH
LiBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50eHQgfCAgMiArKwo+ICBkcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jICAgICAgICAgICAgICAgfCAxMCArKysr
KysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmggICAgICAg
ICAgICAgICB8ICAyICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vbWRwNS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vbWRwNS50eHQKPiBpbmRleCA0ZTExMzM4NTQ4YWEuLjQzZDExMjc5YzkyNSAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vbWRwNS50
eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
bWRwNS50eHQKPiBAQCAtNzYsNiArNzYsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ICAtIGNsb2NrLW5hbWVzOiB0aGUgZm9sbG93aW5nIGNsb2NrcyBh
cmUgb3B0aW9uYWw6Cj4gICAgKiAibHV0Igo+ICsgICogInRidSIKPiArICAqICJ0YnVfcnQiCgpC
aW5kaW5ncyB1cGRhdGVzIHNob3VsZCBiZSBpbiB0aGVpciBvd24gcGF0Y2gsIGFuZCB5b3UnbGwg
bmVlZCB0byBjYyB0aGUgY29ycmVjdApkdCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgKGVzcGVjaWFs
bHkgUm9iIEhlcnJpbmcpIGluIG9yZGVyIHRvIGdldCB0aGVpcgphdHRlbnRpb24uIChoaW50OiB1
c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCkKClNlYW4KCj4gIAo+ICBFeGFtcGxlOgo+ICAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCBmZWM2ZWYx
YWUzYjkuLjIzYmU5Yjk1ZGQ3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUv
bWRwNV9rbXMuYwo+IEBAIC0yOTMsNiArMjkzLDEwIEBAIGludCBtZHA1X2Rpc2FibGUoc3RydWN0
IG1kcDVfa21zICptZHA1X2ttcykKPiAgCW1kcDVfa21zLT5lbmFibGVfY291bnQtLTsKPiAgCVdB
Uk5fT04obWRwNV9rbXMtPmVuYWJsZV9jb3VudCA8IDApOwo+ICAKPiArCWlmIChtZHA1X2ttcy0+
dGJ1X3J0X2NsaykKPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMtPnRidV9ydF9j
bGspOwo+ICsJaWYgKG1kcDVfa21zLT50YnVfY2xrKQo+ICsJCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShtZHA1X2ttcy0+dGJ1X2Nsayk7Cj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWRwNV9rbXMt
PmFoYl9jbGspOwo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1kcDVfa21zLT5heGlfY2xrKTsK
PiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShtZHA1X2ttcy0+Y29yZV9jbGspOwo+IEBAIC0zMTMs
NiArMzE3LDEwIEBAIGludCBtZHA1X2VuYWJsZShzdHJ1Y3QgbWRwNV9rbXMgKm1kcDVfa21zKQo+
ICAJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5jb3JlX2Nsayk7Cj4gIAlpZiAobWRwNV9r
bXMtPmx1dF9jbGspCj4gIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG1kcDVfa21zLT5sdXRfY2xrKTsK
PiArCWlmIChtZHA1X2ttcy0+dGJ1X2NsaykKPiArCQljbGtfcHJlcGFyZV9lbmFibGUobWRwNV9r
bXMtPnRidV9jbGspOwo+ICsJaWYgKG1kcDVfa21zLT50YnVfcnRfY2xrKQo+ICsJCWNsa19wcmVw
YXJlX2VuYWJsZShtZHA1X2ttcy0+dGJ1X3J0X2Nsayk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0K
PiBAQCAtOTQ4LDYgKzk1Niw4IEBAIHN0YXRpYyBpbnQgbWRwNV9pbml0KHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIAo+ICAJLyogb3B0aW9u
YWwgY2xvY2tzOiAqLwo+ICAJZ2V0X2NsayhwZGV2LCAmbWRwNV9rbXMtPmx1dF9jbGssICJsdXQi
LCBmYWxzZSk7Cj4gKwlnZXRfY2xrKHBkZXYsICZtZHA1X2ttcy0+dGJ1X2NsaywgInRidSIsIGZh
bHNlKTsKPiArCWdldF9jbGsocGRldiwgJm1kcDVfa21zLT50YnVfcnRfY2xrLCAidGJ1X3J0Iiwg
ZmFsc2UpOwo+ICAKPiAgCS8qIHdlIG5lZWQgdG8gc2V0IGEgZGVmYXVsdCByYXRlIGJlZm9yZSBl
bmFibGluZy4gIFNldCBhIHNhZmUKPiAgCSAqIHJhdGUgZmlyc3QsIHRoZW4gZmlndXJlIG91dCBo
dyByZXZpc2lvbiwgYW5kIHRoZW4gc2V0IGEKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDUvbWRwNV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmgKPiBpbmRleCBkMWJmNGZkZmM4MTUuLjEyODg2Njc0MjU5MyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuaAo+IEBAIC01Myw2ICs1Myw4IEBA
IHN0cnVjdCBtZHA1X2ttcyB7Cj4gIAlzdHJ1Y3QgY2xrICphaGJfY2xrOwo+ICAJc3RydWN0IGNs
ayAqY29yZV9jbGs7Cj4gIAlzdHJ1Y3QgY2xrICpsdXRfY2xrOwo+ICsJc3RydWN0IGNsayAqdGJ1
X2NsazsKPiArCXN0cnVjdCBjbGsgKnRidV9ydF9jbGs7Cj4gIAlzdHJ1Y3QgY2xrICp2c3luY19j
bGs7Cj4gIAo+ICAJLyoKPiAtLSAKPiAyLjIxLjAKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJl
IEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
