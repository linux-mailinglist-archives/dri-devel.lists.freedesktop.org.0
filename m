Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BC02A9090
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 08:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EFA6E10A;
	Fri,  6 Nov 2020 07:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E806E10A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 07:41:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 23so356615wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6ufj42Bv/86ArnSS/EsHZyzQ98Oc/FG+uTtO5PTygmc=;
 b=oLWx6Bsyrgz3NhKGWzEcRFID//Yk8EMYlq2WgiHL04Xqe+fXjhBHsNNetTodNCTJQg
 YnYjmwFrOO/cAHOSHWakseRDbfJOfr5yeyv1hBfk5mmKEWwZuWpm8zxTgkPcFD3DJLvr
 V55gd+MlEOTjQ4lfpqmtd7rQVYuVZIvxvoqkPojAFPszQ7tXk78SqH2wfcb4ZRU5fngC
 ETrYc7UeUU379hnFLQsmgniteVzGKzFxzSKbWe5wsZwf6qe9RTAqzoL+r8VM7nhPrMHN
 Czt5GXRlXWhkNa+mQ+V22iv5a44QaysNqwMxXjleavTBw/936bKBYuYDJQMrQychEFav
 EbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6ufj42Bv/86ArnSS/EsHZyzQ98Oc/FG+uTtO5PTygmc=;
 b=EQ8E4EEwercxDDILVYolvzWAljlLV+/nSQgwRqtiKQiTRkoNewTqp+OiKHKcI6lyWu
 Y58FM9nivmXXIcOlqFV/D0kq+uRYR0FzRdRAiQbcWK8DxdrvYRedQJpJmmCpHGXUdW7A
 S1VwiIRIR9RrAZzbuf6afgMoFTH17lk7KMa/pDNLt13Urfba376MER64TdT1OjVtAv/n
 ESA2dW87C3Smm4dUHOxiDYc+BJ7h0stgJOCzglUESbVPahVKiF9XE29W79aCaprnHrDK
 9KglTU8PPg1LeAP25/hY9rM4uA1ELRlXJewzgwWCpDQvy1DIOt8jeo5W4EGEwenNzoK7
 /wCg==
X-Gm-Message-State: AOAM533GoxzTK2P1RRT+Vhku3IQECDjq+i0iKlxWKHP0AJHcHf5geemy
 qzKzZl9zBxFaLZlLAlub4fpmsg==
X-Google-Smtp-Source: ABdhPJzLc6OVDukzV94pq5ko/pywJDPvwYQgId12KwgvXF/J8yC5zh/9oAvErhJxoolu/oop54L0Sw==
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr921576wmd.73.1604648514026; 
 Thu, 05 Nov 2020 23:41:54 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id r1sm767193wro.18.2020.11.05.23.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:41:53 -0800 (PST)
Date: Fri, 6 Nov 2020 07:41:51 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 03/19] gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as
 __always_unused
Message-ID: <20201106074151.GU4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-4-lee.jones@linaro.org>
 <15a4a184-74c2-e630-193a-cdea61545a03@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15a4a184-74c2-e630-193a-cdea61545a03@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBOb3YgMjAyMCwgQWhtYWQgRmF0b3VtIHdyb3RlOgoKPiBIZWxsbyBMZWUsCj4g
Cj4gT24gMTEvNS8yMCAzOjQ1IFBNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBJbiB0aGUgbWFjcm8g
Zm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUoKSAnY3J0Y19zdGF0ZScgaXMgcHJvdmlkZWQK
PiA+IGFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRlLCBidXQgaXMg
bm90IHV0aWxpc2VkIGluCj4gPiB0aGlzIHVzZS1jYXNlLiAgV2UgY2Fubm90IHNpbXBseSBkZWxl
dGUgdGhlIHZhcmlhYmxlLCBzbyBoZXJlIHdlIHRlbGwKPiA+IHRoZSBjb21waWxlciB0aGF0IHdl
J3JlIGludGVudGlvbmFsbHkgZGlzY2FyZGluZyB0aGUgcmVhZCB2YWx1ZS4KPiAKPiBmb3JfZWFj
aF9vbGRuZXdfY3J0Y19pbl9zdGF0ZSBhbHJlYWR5ICh2b2lkKSBjYXN0cyB0aGUgZHJtX2NydGMg
YW5kIHRoZSBvbGQKPiBkcm1fY3J0Y19zdGF0ZSB0byBzaWxlbmNlIHVudXNlZC1idXQtc2V0LXZh
cmlhYmxlIHdhcm5pbmcuIFNob3VsZCB3ZSBtYXliZQo+ICh2b2lkKSBjYXN0IHRoZSBuZXcgY3J0
Y19zdGF0ZSBhcyB3ZWxsPwoKRnJvbSB3aGF0IEkgc2F3LCBpdCBvbmx5IHZvaWQgY2FzdHMgdGhl
IG9uZXMgd2hpY2ggYXJlbid0IGFzc2lnbmVkLgoKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0x
IGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My1wbGFuZS5jOiBJbiBmdW5jdGlvbiDigJhpcHVfcGxhbmVzX2Fzc2lnbl9wcmXigJk6Cj4g
PiAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jOjc0Njo0Mjogd2FybmluZzogdmFy
aWFibGUg4oCYY3J0Y19zdGF0ZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+ID4gCj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9A
a2VybmVsLm9yZz4KPiA+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
Cj4gPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4K
PiA+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gPiBDYzogTlhQIExp
bnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgfCAy
ICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKPiA+IGluZGV4IDhhNDIzNWQ5ZDlmMWUu
LmFjYzBhM2NlNDk5MmYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYz
LXBsYW5lLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYwo+ID4g
QEAgLTc0Myw3ICs3NDMsNyBAQCBib29sIGlwdV9wbGFuZV9hdG9taWNfdXBkYXRlX3BlbmRpbmco
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gPiAgaW50IGlwdV9wbGFuZXNfYXNzaWduX3ByZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gIAkJCSAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUg
KnN0YXRlKQo+ID4gIHsKPiA+IC0Jc3RydWN0IGRybV9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0
ZSwgKmNydGNfc3RhdGU7Cj4gPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3Rh
dGUsIF9fYWx3YXlzX3VudXNlZCAqY3J0Y19zdGF0ZTsKPiA+ICAJc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqcGxhbmVfc3RhdGU7Cj4gPiAgCXN0cnVjdCBpcHVfcGxhbmVfc3RhdGUgKmlwdV9zdGF0
ZTsKPiA+ICAJc3RydWN0IGlwdV9wbGFuZSAqaXB1X3BsYW5lOwo+ID4gCj4gCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
