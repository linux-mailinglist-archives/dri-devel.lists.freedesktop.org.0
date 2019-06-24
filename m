Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4151AFF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 20:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C8289D8D;
	Mon, 24 Jun 2019 18:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E4A89D8D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 18:54:12 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id m30so8034108pff.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b5H8RtrC0Gc1uC0P9BdPRFehSMvKPE2eLTGWQg50TOo=;
 b=qfLFdXPG0XbkvUifI0wmAZdQg1sH+9l+5y4q5hBdNftaqvJBG3U1GuuDpSenMQCGzk
 LFAAaBqIHpglPvkPyRsA2dVH4kwtq6VeTEa20Xudxc/29YWwpJSRqCAO5I7Y+f72xAaM
 /pdexg9sWqdf/CTudLctCC8EMvpyrEO+ju3ZpBbpObQdfeNbugSupnItHFiPsBZnaPft
 HGGEGlN9ieNo4sCXJnjEnuIyBS7H2F8ovpdQlfj0IM1XVeE25G4wkLtqoaM1d7JVctvv
 vIHqLxhSP8JiBJ1rLJaBykn5G+RbFDISsxACl1PGHH9cxyyvvkW5hn7CpylZf4wgNh4W
 49lw==
X-Gm-Message-State: APjAAAV7iwTSVKzgxQxZ0TzrE4LTU9daZV5u1xh36mz+NYCk+olFWSnD
 SjccREy1Knl2lcCP4Swsv9Nxnqj26KY=
X-Google-Smtp-Source: APXvYqyXn1SQMUZwvxp4v/17SbLT1K8S5ekQlOyMcC+7be/m4tA2Bnx7hthlNDGzX/lhBeNI08UitQ==
X-Received: by 2002:a17:90a:8a0b:: with SMTP id
 w11mr26442545pjn.125.1561402452192; 
 Mon, 24 Jun 2019 11:54:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id l7sm14434756pfl.9.2019.06.24.11.54.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 11:54:11 -0700 (PDT)
Date: Mon, 24 Jun 2019 11:54:08 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190624185408.GB137143@google.com>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-5-mka@chromium.org>
 <9ea1bb40-95a6-7a67-a8a6-ecc77a70e547@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ea1bb40-95a6-7a67-a8a6-ecc77a70e547@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b5H8RtrC0Gc1uC0P9BdPRFehSMvKPE2eLTGWQg50TOo=;
 b=VRfzqrCH2jFEWWjjlDlGd02Xe8ZQsb0AVWLLZIFUZPGPtVv9VLFJ+zz8bC8OUOaOUx
 Oqcae7vUarDSmjpET3Ghcc9JlKP5Vf1bg21hv25Rq8NQJgF9ue1AbbSuNNetGP6GzyMs
 qfJaOC3Qph/i6rx21qTIWZqCKCXB8QBPi1VFQ=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDI6MTA6MTlQTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+IE9uIDEzLzA2LzIwMTkgMjA6NDMsIE1hdHRoaWFzIEthZWhs
Y2tlIHdyb3RlOgo+ID4gQ2hlY2sgaWYgYSBicmlnaHRuZXNzIGN1cnZlIHNwZWNpZmllZCBpbiB0
aGUgZGV2aWNlIHRyZWUgaXMgbGluZWFyIG9yCj4gPiBub3QgYW5kIHNldCB0aGUgY29ycmVzcG9u
ZGluZyBwcm9wZXJ0eSBhY2NvcmRpbmdseS4gVGhpcyBtYWtlcyB0aGUKPiA+IHNjYWxlIHR5cGUg
YXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEgdGhlICdzY2FsZScgc3lzZnMgYXR0cmlidXRlLgo+
ID4gCj4gPiBUbyBkZXRlcm1pbmUgaWYgYSBjdXJ2ZSBpcyBsaW5lYXIgaXQgaXMgY29tcGFyZWQg
dG8gYSBpbnRlcnBvbGF0ZWQgbGluZWFyCj4gPiBjdXJ2ZSBiZXR3ZWVuIG1pbiBhbmQgbWF4IGJy
aWdodG5lc3MuIFRoZSBjdXJ2ZSBpcyBjb25zaWRlcmVkIGxpbmVhciBpZgo+ID4gbm8gdmFsdWUg
ZGV2aWF0ZXMgbW9yZSB0aGFuICsvLTUlIG9mICR7YnJpZ2h0bmVzc19yYW5nZX0gZnJvbSB0aGVp
cgo+ID4gaW50ZXJwb2xhdGVkIHZhbHVlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlh
cyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9wd21fYmwuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cHdtX2JsLmMKPiA+IGluZGV4IGYwNjdmZTdhYTM1ZC4uOTEyNDA3YjZkNjdmIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gPiBAQCAtNDA0LDYgKzQwNCwyNiBAQCBpbnQgcHdt
X2JhY2tsaWdodF9icmlnaHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmljZSAqZGV2LAo+ID4gICB9
Cj4gPiAgICNlbmRpZgo+ID4gK3N0YXRpYyBib29sIHB3bV9iYWNrbGlnaHRfaXNfbGluZWFyKHN0
cnVjdCBwbGF0Zm9ybV9wd21fYmFja2xpZ2h0X2RhdGEgKmRhdGEpCj4gPiArewo+ID4gKwl1bnNp
Z25lZCBpbnQgbmxldmVscyA9IGRhdGEtPm1heF9icmlnaHRuZXNzICsgMTsKPiA+ICsJdW5zaWdu
ZWQgaW50IG1pbl92YWwgPSBkYXRhLT5sZXZlbHNbMF07Cj4gPiArCXVuc2lnbmVkIGludCBtYXhf
dmFsID0gZGF0YS0+bGV2ZWxzW25sZXZlbHMgLSAxXTsKPiA+ICsJdW5zaWduZWQgaW50IHNsb3Bl
ID0gKDEwMCAqIChtYXhfdmFsIC0gbWluX3ZhbCkpIC8gbmxldmVsczsKPiAKPiBXaHkgMTAwIChy
YXRoZXIgdGhhbiBhIHBvd2VyIG9mIDIpPwoKSSBndWVzcyBpdCBjYW1lIGZyb20gdGhlIGRlY2lt
YWwgcGFydCBvZiBteSBicmFpbiwgSSBjYW4gY2hhbmdlIGl0IHRvCjEyOCA7LSkKCj4gSXQgd291
bGQgYWxzbyBiZSBnb29kIHRvIGhhdmUgYSBjb21tZW50IGhlcmUgc2F5aW5nIHdoYXQgdGhlIG1h
eGltdW0KPiBxdWFudGl6YXRpb24gZXJyb3IgaXMuIERvZXNuJ3QgaGF2ZSB0byBiZSBvdmVyIGNv
bXBsZXgganVzdCBtZW50aW9uaW5nCj4gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyAoYXNz
dW1pbmcgeW91IGFncmVlIHRoYXQgaXRzIHRydWUgOy0pICk6Cj4gCj4gICBNdWx0aXBseWluZyBi
eSBYWFggbWVhbnMgdGhhdCBldmVuIGluIHBhdGhhbG9naWNhbCBjYXNlcyBzdWNoIGFzCj4gICAo
bWF4X3ZhbCAtIG1pbl92YWwpID09IG5sZXZlbHMgdGhlbiB0aGUgZXJyb3IgYXQgbWF4X3ZhbCBp
cyBsZXNzIHRoYW4KPiAgIDElLgoKU291bmRzIGdvb2QsIHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rp
b24hCgo+IFdpdGggYSBzdWl0YWJsZSBjb21tZW50IGluIHRoZSBmaXhlZCBwb2ludCBjb2RlOgo+
IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoK
VGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
