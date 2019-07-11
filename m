Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E065A9C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48E89533;
	Thu, 11 Jul 2019 15:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FEF89533
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:40:30 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id t10so2789739ybk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Kp/UjcKX4d3fGS4+a6U2+TFTmgaXbiI+gcGrXwX2RUM=;
 b=dtlGv7QwZvDpcbpX2NK+CYEAJVMznpy9vsfGPro17CujAiNgBEpnNjteI0KF/BllKE
 PvruVMru7NYalOcV6PhC0rz8nAmEkXhCXNM6Us7+nGvBITXJ1sh9srE9Ov9S7tewbbnr
 8vRTG751T4sRGPpyC53YqNZQPYf8IIpHbUNRTwUnUnTvxB4cHbzaxWSn3eFnZSaMiY8O
 rVrGlLUK6A9Ys8k8sLDFPQDlTeYL0iQHHQ25blj5GG8dpqvUDoh6x5h1McuC++FUnucS
 Tc4zlv+SrYMitRa/Nl4tqN3vbcmBSxpzQPE3LE6tolp1TSEDDuotjPatE53afNKpECDn
 WDeQ==
X-Gm-Message-State: APjAAAX6WVxjXD88qh6cmEkqoW5iIuLFmCLE1mqaJSkMItA+X/ELejoh
 QC5Y+VCC67HytgtRme2Yigfj6tQGYnQ=
X-Google-Smtp-Source: APXvYqzD10yleRQqupYA1lUZuA7ykZDzMF8oFMrojdqOb8yqtCPp9iSbk2QRjPsSkwG4RTVOOMug4g==
X-Received: by 2002:a25:42d6:: with SMTP id p205mr2591484yba.148.1562859629956; 
 Thu, 11 Jul 2019 08:40:29 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j67sm1496718ywa.39.2019.07.11.08.40.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 08:40:29 -0700 (PDT)
Date: Thu, 11 Jul 2019 11:40:28 -0400
From: Sean Paul <sean@poorly.run>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 5/5] drm: Fix return type of crc .poll()
Message-ID: <20190711154028.GG136584@art_vandelay>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
 <20190710125143.9965-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710125143.9965-5-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Kp/UjcKX4d3fGS4+a6U2+TFTmgaXbiI+gcGrXwX2RUM=;
 b=Wz/f+p/jalVKXM1x71KcePKa4Vw9ke1w8/4Kkn9U0lQC7r5nbXykkT6Uc9irAL/lpF
 HtU+o1zqpeLpdZLkN3FTFVsjrcMWXKfR3gmj+j4x9bpleZ2MbELv+qRVWJiC0sIftqy8
 XQ/pXcsODdHxAO7cel6g2WlXF5qDgSXrBZEVeT2cMjFg0/lwuJHTrgnKGYK9RGNdZMF+
 Z2BWcAm8Bi1OaJSFp9ati3lFeyRusn8UhXq+Vp/93QVuEaeIDywKh0/AT2Gjt6WYOmL+
 x3nG35/qO23eyBAtBjgY2gRc+Wvi0FQykrbo9aa3NDhs+yf17bqlS/dJRw3mCrMfH9jc
 Lobg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6NTE6NDNQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFNwYXJzZSBjb21wYWluczoKPiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmM6MzUwOjE3OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBpbml0aWFsaXplciAo
ZGlmZmVyZW50IGJhc2UgdHlwZXMpCj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2Ny
Yy5jOjM1MDoxNzogICAgZXhwZWN0ZWQgcmVzdHJpY3RlZCBfX3BvbGxfdCAoICpwb2xsICkoIC4u
LiApCj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jOjM1MDoxNzogICAgZ290
IHVuc2lnbmVkIGludCAoICogKSggLi4uICkKPiAKPiBDaGFuZ2UgdGhlIC5wb2xsKCkgcmV0dXJu
IHR5cGUgdG8gX19wb2xsX3QgdG8gc2lsZW5jZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6
IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9kZWJ1Z2ZzX2NyYy5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiBp
bmRleCA3Y2E0ODZkNzUwZTkuLjI4NGQ2MTVlZDA4YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnNfY3JjLmMKPiBAQCAtMzI1LDE5ICszMjUsMTcgQEAgc3RhdGljIHNzaXplX3QgY3J0Y19jcmNf
cmVhZChzdHJ1Y3QgZmlsZSAqZmlsZXAsIGNoYXIgX191c2VyICp1c2VyX2J1ZiwKPiAgCXJldHVy
biBMSU5FX0xFTihjcmMtPnZhbHVlc19jbnQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdW5zaWduZWQg
aW50IGNydGNfY3JjX3BvbGwoc3RydWN0IGZpbGUgKmZpbGUsIHBvbGxfdGFibGUgKndhaXQpCj4g
K3N0YXRpYyBfX3BvbGxfdCBjcnRjX2NyY19wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBwb2xsX3Rh
YmxlICp3YWl0KQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBmaWxlLT5mX2lub2Rl
LT5pX3ByaXZhdGU7Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwo+
IC0JdW5zaWduZWQgcmV0Owo+ICsJX19wb2xsX3QgcmV0ID0gMDsKPiAgCj4gIAlwb2xsX3dhaXQo
ZmlsZSwgJmNyYy0+d3EsIHdhaXQpOwo+ICAKPiAgCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7
Cj4gIAlpZiAoY3JjLT5zb3VyY2UgJiYgY3J0Y19jcmNfZGF0YV9jb3VudChjcmMpKQo+IC0JCXJl
dCA9IFBPTExJTiB8IFBPTExSRE5PUk07Cj4gLQllbHNlCj4gLQkJcmV0ID0gMDsKPiArCQlyZXQg
fD0gRVBPTExJTiB8IEVQT0xMUkROT1JNOwo+ICAJc3Bpbl91bmxvY2tfaXJxKCZjcmMtPmxvY2sp
Owo+ICAKPiAgCXJldHVybiByZXQ7Cj4gLS0gCj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
