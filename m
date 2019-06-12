Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F342B39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBEE89709;
	Wed, 12 Jun 2019 15:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F91D896FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:46:48 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a27so10607411qkk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EaXkV9Y6yTvtmpk3wBzIPzCK+33hr152hUGG4POmIv8=;
 b=auXru/8Fcf9ZvBCjjUufJl5JLQoDuohfkbXe4HolHoM4V0Yx30yFC/2WNROuAeRic0
 bCs8knek+fr+0eKvXCR19WOy79rert1m8Aem2WqPwg9WR1PmGvw+6un55AfiT1TXHxQl
 ncZ2DBthOF03TK/5RvjWOER+lBsxDm4hNmFsAoD4Krwa3Uf1HxTiHAfrqintkP5RM7Yb
 tgftbUPyhjrsolUiBQr8ZLwkwejxElsKxVcfUJHP0THJqs7wExyhnQ0RsU5+wGUwvHej
 KgQ6j6cmf8+DBomsEsiJesBHd4xXZqdbRdjsMUY8eEGdlyL3OcXO3gCz/pmExUDQSyDN
 jOFg==
X-Gm-Message-State: APjAAAXuRIwyTvQMpoukq/tlas965cq9IwkOnTiPa8KR2kqfFSKXTx9D
 d/DqGAuzkavHi5uU2EUw8QzZlg==
X-Google-Smtp-Source: APXvYqxA6lVWUQC35FpRjtlzQjSW7W+dSRH2sdWbvFPU/Hi8hgHXsTmK3fuKtPaJatqEfZW5+MImjA==
X-Received: by 2002:ae9:e608:: with SMTP id z8mr58295030qkf.182.1560354407171; 
 Wed, 12 Jun 2019 08:46:47 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g2sm3230qkb.80.2019.06.12.08.46.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 08:46:46 -0700 (PDT)
Date: Wed, 12 Jun 2019 11:46:46 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: Tweak drm_encoder_helper_funcs.enable kerneldoc
Message-ID: <20190612154646.GF179831@art_vandelay>
References: <20190612150038.194843-1-sean@poorly.run>
 <20190612150927.GA5030@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612150927.GA5030@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EaXkV9Y6yTvtmpk3wBzIPzCK+33hr152hUGG4POmIv8=;
 b=Az+c9OrQWBVNAXL3fVrlTOZEVCT4Qc9ZNGWdu+RjK/7M/fIKIGwmwGP+UlcazUEo6v
 sLgGjTEtTQFNcmS6px6mES8Hs1zdpCrGhA6SE2SNuCD2OoCunL529DQG/beP+bxtdB8h
 8DWB813tEdrJ69rxIHmnM6IzUVRaCxS7EdD42VASebkqo295CMXyZLX1GcJwH4e1WBR6
 s0xfT7Ty1Nx+uJ5btiuxKk79fa8lPSIHr+9pOXnwbRU9ezHci0GE1eyw2YDPXs0d5RWj
 ObOvlKdc/DfA9+Cl4C+WdM5SspRkrXPREgPyxwiRcaqqsRVf5FvuYaOjOX/g1xaxns0s
 YcMQ==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDU6MDk6MjdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDExOjAwOjM0QU0gLTA0MDAsIFNlYW4gUGF1
bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4g
Cj4gPiBJIGNvcGllZCB0aGUga2VybmVsZG9jIGZvciBlbmNvZGVyX2Z1bmNzLmF0b21pY19lbmFi
bGUgZnJvbSBlbmNvZGVyX2Z1bmNzLmVuYWJsZQo+ID4gaW4gYSByZWNlbnQgcGF0Y2ggWzFdLiBT
YW0gcmlnaHRseSBwb2ludGVkIG91dCBpbiB0aGUgcmV2aWV3IHRoYXQgImZvciBzeW1tZXRyeQo+
ID4gd2l0aCIgdGV4dCBpcyBhd2t3YXJkIFsyXS4gU28gaGVyZSdzIGEgcGF0Y2ggdG8gZml4IHVw
IHRoZSBzb3VyY2Ugb2YgdGhlIGF3a3dhcmQKPiA+IGxhbmd1YWdlLgo+IAo+IExvb2tzIGdvb2Qu
Cj4gPiAKPiA+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNn
aWQvMjAxOTA2MTExNjA4NDQuMjU3NDk4LTItc2VhbkBwb29ybHkucnVuCj4gPiBbMl0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjExMTg1MzUyLkdB
MTYzMDVAcmF2bmJvcmcub3JnCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KCkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCB3aXRoIHlvdXIgUi1iLCB0aGFua3MhCgpTZWFu
Cgo+IAo+ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMu
aCB8IDEwICsrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVz
ZXRfaGVscGVyX3Z0YWJsZXMuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFi
bGVzLmgKPiA+IGluZGV4IGY5Yzk0YzJhMTM2NDYuLmRmODAxMzFiYjEwZmMgMTAwNjQ0Cj4gPiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oCj4gPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oCj4gPiBAQCAtNzE5LDExICs3
MTksMTEgQEAgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyB7Cj4gPiAgCSAqIGhvb2tz
IGFuZCBjYWxsIHRoZW0gZnJvbSBDUlRDJ3MgY2FsbGJhY2sgYnkgbG9vcGluZyBvdmVyIGFsbCBl
bmNvZGVycwo+ID4gIAkgKiBjb25uZWN0ZWQgdG8gaXQgdXNpbmcgZm9yX2VhY2hfZW5jb2Rlcl9v
bl9jcnRjKCkuCj4gPiAgCSAqCj4gPiAtCSAqIFRoaXMgaG9vayBpcyB1c2VkIG9ubHkgYnkgYXRv
bWljIGhlbHBlcnMsIGZvciBzeW1tZXRyeSB3aXRoIEBkaXNhYmxlLgo+ID4gLQkgKiBBdG9taWMg
ZHJpdmVycyBkb24ndCBuZWVkIHRvIGltcGxlbWVudCBpdCBpZiB0aGVyZSdzIG5vIG5lZWQgdG8K
PiA+IC0JICogZW5hYmxlIGFueXRoaW5nIGF0IHRoZSBlbmNvZGVyIGxldmVsLiBUbyBlbnN1cmUg
dGhhdCBydW50aW1lIFBNIGhhbmRsaW5nCj4gPiAtCSAqICh1c2luZyBlaXRoZXIgRFBNUyBvciB0
aGUgbmV3ICJBQ1RJVkUiIHByb3BlcnR5KSB3b3Jrcwo+ID4gLQkgKiBAZW5hYmxlIG11c3QgYmUg
dGhlIGludmVyc2Ugb2YgQGRpc2FibGUgZm9yIGF0b21pYyBkcml2ZXJzLgo+ID4gKwkgKiBUaGlz
IGhvb2sgaXMgb25seSB1c2VkIGJ5IGF0b21pYyBoZWxwZXJzLCBpdCBpcyB0aGUgb3Bwb3NpdGUg
b2YKPiA+ICsJICogQGRpc2FibGUuIEF0b21pYyBkcml2ZXJzIGRvbid0IG5lZWQgdG8gaW1wbGVt
ZW50IGl0IGlmIHRoZXJlJ3Mgbm8KPiA+ICsJICogbmVlZCB0byBlbmFibGUgYW55dGhpbmcgYXQg
dGhlIGVuY29kZXIgbGV2ZWwuIFRvIGVuc3VyZSB0aGF0Cj4gPiArCSAqIHJ1bnRpbWUgUE0gaGFu
ZGxpbmcgKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBuZXcgIkFDVElWRSIgcHJvcGVydHkpCj4g
PiArCSAqIHdvcmtzIEBlbmFibGUgbXVzdCBiZSB0aGUgaW52ZXJzZSBvZiBAZGlzYWJsZSBmb3Ig
YXRvbWljIGRyaXZlcnMuCj4gPiAgCSAqLwo+ID4gIAl2b2lkICgqZW5hYmxlKShzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIpOwo+ID4gIAo+ID4gLS0gCj4gPiBTZWFuIFBhdWwsIFNvZnR3YXJl
IEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
