Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15992926F6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7806E15D;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217E26E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so8977030wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BKILku0rD3WRHmTvM8/fAn6M/l4/zNBvWSseRCgITa0=;
 b=FUrs9fyi/mUKeXQ6GDX84hfz/o9EEx64p7jV/lj2fKSuKY3QWnW3iP+RIweE/cUpws
 vO6ne40M8WtS7O3l2dKQkuExjE7T3hkPmdyfopx5T0o4MVfJzejd3+RFGUL4csCp+XOy
 kkdgWudf1cyk9WmAxgJXhM4W0QylT59aHMK7KZa9y5EC9v2hIk1RXMq+skKFbuSnXKzU
 XugGwOVtYlgInu5yuZetpUpxz+zdnx3894UzzqRJYYHZtd3cEROmwZdKy75D+2Zzd7MC
 CB4QL1QK4yG5iQuNsQUYqPJ93++Ri5zmnIEuU0cxiABrQLPb08LqV65RY6I2rfEHzVml
 Napg==
X-Gm-Message-State: APjAAAUGotdWUKa9PcPbjrp4foeleGS1MbqQgo/i+ltgSgTGBu6acGng
 rzUgoIaCCMPdsm6LK7FqVW1Qow==
X-Google-Smtp-Source: APXvYqz4t9z7sLyqedg4ygvktfoMo3QLobIsCd8fhnpyEj8AmG3VBAZMNOPOo3BiI45odg6V8ALDnw==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr16057009wrq.332.1566225353375; 
 Mon, 19 Aug 2019 07:35:53 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t8sm40192931wra.73.2019.08.19.07.35.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 07:35:52 -0700 (PDT)
Subject: Re: [PATCH v7 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-4-darekm@google.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2ffa9973-014e-af7c-13ab-d255adf5a8c2@baylibre.com>
Date: Mon, 19 Aug 2019 16:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-4-darekm@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BKILku0rD3WRHmTvM8/fAn6M/l4/zNBvWSseRCgITa0=;
 b=G4xf/0ZAMRyjn5pD66YdqHko+8Hh9+a7C9IPV6Pjs/Ah1XZFEYw8e6IYW/0qQMvafE
 85NVlvHeb8dH4oPetudu1sGucPkCPiQ6rRvKogCITtq/1CprRwXYEXyexEdDCdfe/xik
 3Pn3AurjdsvS17LHWlQqZfx8Wk5TuY2Dk3zAjYfyCJtkZjQv59U5Fa3VBMSd8KwAMGNC
 Ig3HjuyZoEgKQHh+EDV22f6ywlQF/YKQJLbHIlzFXQogT8CCZ+ESAVLzSc/w29US3B2T
 Gese0Gyid/Y/yrDDrpniu8GNZo42YNRCdiPeaBy346ilP7QY1SPLwwXkaoEi04z//lmc
 QYPg==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDgvMjAxOSAxMjo0NSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgbmV3IGNlY19ub3RpZmllcl9jZWNfYWRhcF8odW4pcmVnaXN0ZXIoKSBmdW5jdGlvbnMgdG8K
PiAodW4pcmVnaXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgQ0VDIGFkYXB0ZXIuCj4gCj4gQWxz
byBhZGRzIENFQ19DQVBfQ09OTkVDVE9SX0lORk8gY2FwYWJpbGl0eSB0byB0aGUgYWRhcHRlci4K
PiAKPiBDaGFuZ2VzIHNpbmNlIHYzOgo+IAktIGFkZCBDRUNfQ0FQX0NPTk5FQ1RPUl9JTkZPIHRv
IGNlY19hbGxvY2F0ZV9hZGFwdGVyLAo+IAktIHJlcGxhY2UgQ0VDX0NBUF9MT0dfQUREUlMgfCBD
RUNfQ0FQX1RSQU5TTUlUIHwKPiAJQ0VDX0NBUF9SQyB8IENFQ19DQVBfUEFTU1RIUk9VR0ggd2l0
aCBDRUNfQ0FQX0RFRkFVTFRTLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2ll
d2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxo
dmVya3VpbC1jaXNjb0B4czRhbGwubmw+Cj4gVGVzdGVkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWNlYy5jIHwgMTMgKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMKPiBpbmRleCAwZjk0OTk3OGQzZmNkLi5hYzFl
MDAxZDA4ODI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS1jZWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS1jZWMuYwo+IEBAIC0yNTYsOCArMjU2LDggQEAgc3RhdGljIGludCBkd19oZG1pX2NlY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJZHdfaGRtaV93cml0ZShjZWMs
IDAsIEhETUlfQ0VDX1BPTEFSSVRZKTsKPiAgCj4gIAljZWMtPmFkYXAgPSBjZWNfYWxsb2NhdGVf
YWRhcHRlcigmZHdfaGRtaV9jZWNfb3BzLCBjZWMsICJkd19oZG1pIiwKPiAtCQkJCQkgQ0VDX0NB
UF9MT0dfQUREUlMgfCBDRUNfQ0FQX1RSQU5TTUlUIHwKPiAtCQkJCQkgQ0VDX0NBUF9SQyB8IENF
Q19DQVBfUEFTU1RIUk9VR0gsCj4gKwkJCQkJIENFQ19DQVBfREVGQVVMVFMgfAo+ICsJCQkJCSBD
RUNfQ0FQX0NPTk5FQ1RPUl9JTkZPLAo+ICAJCQkJCSBDRUNfTUFYX0xPR19BRERSUyk7Cj4gIAlp
ZiAoSVNfRVJSKGNlYy0+YWRhcCkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoY2VjLT5hZGFwKTsKPiBA
QCAtMjc4LDEzICsyNzgsMTQgQEAgc3RhdGljIGludCBkd19oZG1pX2NlY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKHJldCA8IDApCj4gIAkJcmV0dXJuIHJldDsK
PiAgCj4gLQljZWMtPm5vdGlmeSA9IGNlY19ub3RpZmllcl9nZXQocGRldi0+ZGV2LnBhcmVudCk7
Cj4gKwljZWMtPm5vdGlmeSA9IGNlY19ub3RpZmllcl9jZWNfYWRhcF9yZWdpc3RlcihwZGV2LT5k
ZXYucGFyZW50LAo+ICsJCQkJCQkgICAgIE5VTEwsIGNlYy0+YWRhcCk7Cj4gIAlpZiAoIWNlYy0+
bm90aWZ5KQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCXJldCA9IGNlY19yZWdpc3Rlcl9h
ZGFwdGVyKGNlYy0+YWRhcCwgcGRldi0+ZGV2LnBhcmVudCk7Cj4gIAlpZiAocmV0IDwgMCkgewo+
IC0JCWNlY19ub3RpZmllcl9wdXQoY2VjLT5ub3RpZnkpOwo+ICsJCWNlY19ub3RpZmllcl9jZWNf
YWRhcF91bnJlZ2lzdGVyKGNlYy0+bm90aWZ5KTsKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAK
PiBAQCAtMjk0LDggKzI5NSw2IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9jZWNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCSAqLwo+ICAJZGV2bV9yZW1vdmVfYWN0aW9uKCZw
ZGV2LT5kZXYsIGR3X2hkbWlfY2VjX2RlbCwgY2VjKTsKPiAgCj4gLQljZWNfcmVnaXN0ZXJfY2Vj
X25vdGlmaWVyKGNlYy0+YWRhcCwgY2VjLT5ub3RpZnkpOwo+IC0KPiAgCXJldHVybiAwOwo+ICB9
Cj4gIAo+IEBAIC0zMDMsOCArMzAyLDggQEAgc3RhdGljIGludCBkd19oZG1pX2NlY19yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3RydWN0IGR3X2hkbWlfY2Vj
ICpjZWMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgCj4gKwljZWNfbm90aWZpZXJf
Y2VjX2FkYXBfdW5yZWdpc3RlcihjZWMtPm5vdGlmeSk7Cj4gIAljZWNfdW5yZWdpc3Rlcl9hZGFw
dGVyKGNlYy0+YWRhcCk7Cj4gLQljZWNfbm90aWZpZXJfcHV0KGNlYy0+bm90aWZ5KTsKPiAgCj4g
IAlyZXR1cm4gMDsKPiAgfQo+IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
