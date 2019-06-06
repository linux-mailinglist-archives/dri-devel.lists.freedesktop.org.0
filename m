Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7959E379E1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3A2892B0;
	Thu,  6 Jun 2019 16:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C82892B0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:42:23 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so1873316qkl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5QPjMBZ7QhHbHLNmjjqsDaYi7y/cyLKjCBZGOMHoSEM=;
 b=qWPR+0wsy9MWrvOS3YthufgAULAcqBbk3iBgFnBV48fTd9Ib9tpqVn+AcuP5ituAw9
 AMXYbBmBpoyjxUHjAR/p6gLpI+sw8fUpGm4SN/bOquesVUybhlTcuTjTRkamsxsqp/CZ
 V5nVdfFifW/aVfF7EUsrgDw3/FaIc1gqxkZG9IQMClwLXtkTf+mC+JVa8NHU3hMAxZcV
 Xpyjq09g7kAdE0YBhve34L9w3Myk5Qg6F7nkBImq/Q/HUpVOnSTxVxsRPwK1ByVVQz3I
 Vxc0VL68B2i9RvbuXIZ5KGysdLSMg7yP+jTyqEdNZoVfkKAS5UkjPSifJL8y0IkWpqfa
 zTWg==
X-Gm-Message-State: APjAAAUZvddwwlY8296S8KXp+b1FXmg87CWOEhxxHaGPqHvlTAPLJ5q9
 CifL1QI9SAsuHKtuYqigp8tFkw==
X-Google-Smtp-Source: APXvYqwDhHGG37UbtEUsjlslSQxaipRrUqUsFH2C+nCiwkgDH0iYGuNgjedUKpFCxqL2WIrawISaTQ==
X-Received: by 2002:a37:7a47:: with SMTP id v68mr25644536qkc.56.1559839342745; 
 Thu, 06 Jun 2019 09:42:22 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d123sm1224349qkb.94.2019.06.06.09.42.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:42:22 -0700 (PDT)
Date: Thu, 6 Jun 2019 12:42:21 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/2] drm/rockchip: dw_hdmi: Handle suspend/resume
Message-ID: <20190606164221.GI17077@art_vandelay>
References: <20190604204207.168085-1-dianders@chromium.org>
 <20190604204207.168085-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604204207.168085-2-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5QPjMBZ7QhHbHLNmjjqsDaYi7y/cyLKjCBZGOMHoSEM=;
 b=PmHXHYVp6HOkCqaTqZemv5nyGH4FlSL0ZuPiDcmSv5FFWeztRTukCpz/zF5umFyIF7
 4je6OpUcXwr9MhnH+dUacPzDzOiGFu/lP3laPt023f0oct1OV/EEyTcH5GhBWHvXLFxK
 vKCUR+DAFolYNwYYr/Cge6hSW3ditkcGKysmai/+ch0RqByKpmJe9Cd5GkK65gU0U4Pp
 LrEWbGJLa6vvzJ/p/5edCgDWYufEVxSjT2bXgvsP6sQBbQYYKpC8A3kBe8Zk3kv2HE90
 UmGUMJbUF1qisGKUvh0WZTCZVRDcV7TyoVZnpbUtquwGTLSsgYt5qbp62PSAp2I1wRBL
 9nxw==
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDE6NDI6MDdQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNv
biB3cm90ZToKPiBPbiBSb2NrY2hpcCByazMyODgtYmFzZWQgQ2hyb21lYm9va3Mgd2hlbiB5b3Ug
ZG8gYSBzdXNwZW5kL3Jlc3VtZQo+IGN5Y2xlOgo+IAo+IDEuIFlvdSBsb3NlIHRoZSBhYmlsaXR5
IHRvIGRldGVjdCBhbiBIRE1JIGRldmljZSBiZWluZyBwbHVnZ2VkIGluLgo+IAo+IDIuIElmIHlv
dSdyZSB1c2luZyB0aGUgaTJjIGJ1cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMK
PiB3b3JraW5nLgo+IAo+IExldCdzIGNhbGwgdGhlIGNvcmUgZHctaGRtaSdzIHN1c3BlbmQvcmVz
dW1lIGZ1bmN0aW9ucyB0byByZXN0b3JlCj4gdGhpbmdzLgo+IAo+IE5PVEU6IGluIGRvd25zdHJl
YW0gQ2hyb21lIE9TIChiYXNlZCBvbiBrZXJuZWwgMy4xNCkgd2UgdXNlZCB0aGUKPiAibGF0ZS9l
YXJseSIgdmVyc2lvbnMgb2Ygc3VzcGVuZC9yZXN1bWUgYmVjYXVzZSB3ZSBmb3VuZCB0aGF0IHRo
ZSBWT1AKPiB3YXMgc29tZXRpbWVzIHJlc3VtaW5nIGJlZm9yZSBkd19oZG1pIGFuZCB0aGVuIGNh
bGxpbmcgaW50byB1cyBiZWZvcmUKPiB3ZSB3ZXJlIGZ1bGx5IHJlc3VtZWQuICBGb3Igbm93IEkg
aGF2ZSBnb25lIGJhY2sgdG8gdGhlIG5vcm1hbAo+IHN1c3BlbmQvcmVzdW1lIGJlY2F1c2UgSSBj
YW4ndCByZXByb2R1Y2UgdGhlIHByb2JsZW1zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHYz
Ogo+IC0gZHdfaGRtaV9yZXN1bWUoKSBpcyBub3cgYSB2b2lkIGZ1bmN0aW9uIChMYXVyZW50KQo+
IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBBZGQgZm9yZ290dGVuIHN0YXRpYyAoTGF1cmVudCkKPiAt
IE5vIGVtcHR5IHN0dWIgZm9yIHN1c3BlbmQgKExhdXJlbnQpCj4gCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAxNCArKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+IGluZGV4IDRjZGM5Zjg2YzJlNS4uN2JiMGY5MjJiMzAz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlw
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCj4g
QEAgLTU0MiwxMSArNTQyLDI1IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9yb2NrY2hpcF9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3X2hkbWlfcm9ja2NoaXBfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiArewo+ICsJc3RydWN0IHJvY2tjaGlwX2hkbWkgKmhkbWkgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiArCj4gKwlkd19oZG1pX3Jlc3VtZShoZG1pLT5oZG1pKTsKClRoZSBy
b2NrY2hpcCBkcml2ZXIgaXMgYWxyZWFkeSB1c2luZyB0aGUgYXRvbWljIHN1c3BlbmQvcmVzdW1l
IGhlbHBlcnMgKHZpYSB0aGUKbW9kZXNldCBoZWxwZXJzKS4gV291bGQgeW91IGJlIGFibGUgdG8g
YWNjb21wbGlzaCB0aGUgc2FtZSB0aGluZyBieSBqdXN0IG1vdmluZwp0aGlzIGNhbGwgaW50byB0
aGUgZW5jb2RlciBlbmFibGUgY2FsbGJhY2s/IAoKLmVuYWJsZSBpcyBjYWxsZWQgb24gcmVzdW1l
IHZpYSB0aGUgYXRvbWljIGNvbW1pdCBmcmFtZXdvcmssIHNvIGV2ZXJ5dGhpbmcgaXMKb3JkZXJl
ZCBwcm9wZXJseS4gT2YgY291cnNlLCB0aGlzIHdvdWxkIHJlc2V0IHRoZSBkd19oZG1pIGJyaWRn
ZSBvbiBlYWNoIGVuYWJsZSwKYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCB3b3VsZCBiZSBhIHByb2Js
ZW0/CgpTZWFuCgo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRldl9wbV9vcHMgZHdfaGRtaV9yb2NrY2hpcF9wbSA9IHsKPiArCVNFVF9TWVNURU1fU0xF
RVBfUE1fT1BTKE5VTEwsIGR3X2hkbWlfcm9ja2NoaXBfcmVzdW1lKQo+ICt9Owo+ICsKPiAgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBkd19oZG1pX3JvY2tjaGlwX3BsdGZtX2RyaXZlciA9IHsKPiAg
CS5wcm9iZSAgPSBkd19oZG1pX3JvY2tjaGlwX3Byb2JlLAo+ICAJLnJlbW92ZSA9IGR3X2hkbWlf
cm9ja2NoaXBfcmVtb3ZlLAo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJkd2hkbWktcm9j
a2NoaXAiLAo+ICsJCS5wbSA9ICZkd19oZG1pX3JvY2tjaGlwX3BtLAo+ICAJCS5vZl9tYXRjaF90
YWJsZSA9IGR3X2hkbWlfcm9ja2NoaXBfZHRfaWRzLAo+ICAJfSwKPiAgfTsKPiAtLSAKPiAyLjIy
LjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
