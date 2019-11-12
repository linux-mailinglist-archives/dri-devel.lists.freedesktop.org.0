Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2FF9409
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39B86EB57;
	Tue, 12 Nov 2019 15:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4246EB57
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:21:36 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id y18so6551719ywk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 07:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KnyfkrQ6W9gFBlT143CIffTwTGBEZnopWrAl1Uz5ZO0=;
 b=fa8X7Fa1l0xJ9AmqXWJCDQfGCUi/9j9KBJERNYrJWSBNIBatp/hOIdFShPFoZXCCbC
 HYcaZbL6N30Bm6VvmCx/tSZoqh79lPQMXqLFA2KL0Ra9/q9k6y0JXuI+woLB5JNKs43W
 WLDzjeIgk1i6SuFrxZgbF2hNstjf5tF0mGNO557GbbKc9iR6bQVll+QY3Hp8lgV61ZRo
 f/jDa6JH4kSJM/GzOQ1QCHucBrFQaPNvQTbQc5oVv1gwOcKwWgx6yVpIXprEGj6DADhu
 M/gONi7+37aSkQ2dr5EpOroiyWVEN6DKLOF4w4BhZJRqra3z7MZGJmsMF5MiD7fGXZMe
 jPCg==
X-Gm-Message-State: APjAAAWwK6V2lX+ae7fWyQBmpRFnJcSadMlxT9lso3v93BIjBCCx8cju
 diWhMwhCvsplZDVsP4wpcg/XNQ==
X-Google-Smtp-Source: APXvYqyxBajcKnAb7jh9CLluY/tZ4Wq1x+xGnMjwDeum476x/aRdE3Y/ZKVwxdvJeJ0l95Emz6KtLQ==
X-Received: by 2002:a81:7917:: with SMTP id u23mr20310139ywc.405.1573572095831; 
 Tue, 12 Nov 2019 07:21:35 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b204sm10599183ywe.106.2019.11.12.07.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 07:21:35 -0800 (PST)
Date: Tue, 12 Nov 2019 10:21:34 -0500
From: Sean Paul <sean@poorly.run>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH RESEND 0/8] drm/print: cleanup and new drm_device based
 logging
Message-ID: <20191112152134.GA25787@art_vandelay>
References: <cover.1572258935.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572258935.git.jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KnyfkrQ6W9gFBlT143CIffTwTGBEZnopWrAl1Uz5ZO0=;
 b=ZCjijuCLHBI/IhurFFDsHIVEvSDMAG0aeKz/s9Rm4iBcs+ZrfyHHFXT4V5288ti/Yp
 DvSBr2cVn/EjpaLOYCym/ILtmtiTH5iIAbAcBfQJ6qjoU2VGji39GypYmzPvdIsNCL8l
 OpwVLGYDWKTgNYQPlxPdqUN6iEMWOcS+Pxm17VeCHEw7b6/fG2wMimTzXG8BrbuTfHrO
 bdCr/3+MbZ0c8lX2ujLLg2SZP2f6i0uRPrO2x2WHEgl8xNwRV41nu65OB7qX+dYQU48K
 J2z3edcfGRIhMuvvriI0Uy7TooPsUv8uKMJL5ura3Nzwj9+FrV+6jL7nYFia5HO/F0qV
 KmUQ==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTI6Mzg6MTRQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gUmVzZW5kIG9mIFsxXTsgSSBtYXkgaGF2ZSByZWJhc2VkIGJ1dCBJJ20gbm90IHN1cmUg
YW55bW9yZS4uLgo+IAo+IEZvciBzdGFydGVycyBzb21lIGZhaXJseSBiZW5pZ24gY2xlYW51cCwg
YW5kIGEgcHJvcG9zYWwgZm9yIG5ldyBzdHJ1Y3QKPiBkcm1fZGV2aWNlIGJhc2VkIGRybSBsb2dn
aW5nIG1hY3JvcyBhbmFsb2d1b3VzIHRvIGNvcmUga2VybmVsIHN0cnVjdAo+IGRldmljZSBiYXNl
ZCBtYWNyb3MuCj4gCj4gUGxlYXNlIGxldCdzIGF0IGxlYXN0IGdldCB0aGUgZmlyc3QgNyByZXZp
ZXdlZC9hY2tlZC9tZXJnZWQsIHNoYWxsIHdlPwo+IAoKQWNrZWQtYnk6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPgoKPiAKPiBCUiwKPiBKYW5pLgo+IAo+IAo+IFsxXSBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY3Nzk1Lwo+IAo+IAo+IEphbmkgTmlrdWxhICg4
KToKPiAgIGRybS9pOTE1OiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVi
dWcgY2F0ZWdvcmllcwo+ICAgZHJtL25vdXZlYXU6IHVzZSBkcm1fZGVidWdfZW5hYmxlZCgpIHRv
IGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCj4gICBkcm0vYW1kZ3B1OiB1c2UgZHJtX2RlYnVn
X2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwo+ICAgZHJtL3ByaW50OiBy
ZW5hbWUgZHJtX2RlYnVnIHRvIF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2UgdXNlCj4gICBkcm0v
cHJpbnQ6IHVuZGVyc2NvcmUgcHJlZml4IGZ1bmN0aW9ucyB0aGF0IHNob3VsZCBiZSBwcml2YXRl
IHRvIHByaW50Cj4gICBkcm0vcHJpbnQ6IGNvbnZlcnQgZGVidWcgY2F0ZWdvcnkgbWFjcm9zIGlu
dG8gYW4gZW51bQo+ICAgZHJtL3ByaW50OiBncm91cCBsb2dnaW5nIGZ1bmN0aW9ucyBieSBwcmlu
ayBvciBkZXZpY2UgYmFzZWQKPiAgIGRybS9wcmludDogaW50cm9kdWNlIG5ldyBzdHJ1Y3QgZHJt
X2RldmljZSBiYXNlZCBsb2dnaW5nIG1hY3Jvcwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zbXVfdjExXzBfaTJjLmMgICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW50LmMgICAgICAgICAgICAgICAgICB8ICAxOCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2Rydi5jICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2dlbS5oICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3V0aWxzLmMgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9wbS5jICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmggICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Rydi5oICAgICAgICB8ICAgNCArLQo+ICBpbmNsdWRlL2RybS9kcm1fcHJpbnQu
aCAgICAgICAgICAgICAgICAgICAgICB8IDMwNCArKysrKysrKysrKystLS0tLS0tCj4gIDExIGZp
bGVzIGNoYW5nZWQsIDIyNCBpbnNlcnRpb25zKCspLCAxMjQgZGVsZXRpb25zKC0pCj4gCj4gLS0g
Cj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hy
b21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
