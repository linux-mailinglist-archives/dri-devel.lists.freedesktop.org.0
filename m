Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34B92C567A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDED66E956;
	Thu, 26 Nov 2020 13:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CC86E956
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:56:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so2232270wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MlSKa9SzW7tV05r9J8yh1C/GcEEmHuhq2z7iKSDUD3s=;
 b=MegZ4q3xM/nXtE8bFSbvICWs38kMLrPlhROvmVCx1jJO1z1x69aoBKsh3cgyjzqA5a
 KXhJwaAmTVBCj3F6ZLEopJ3KYECGvvYAW6arwqBMIahYqsOpFRyHBjeh3DeGrx4HFFTV
 3sOg29o5zrNEr1lyeoZaVyN2A3y+Pdm/vekA/yfkuRECWGryCxh7xJlodTAssHV5yjLe
 g0Wh4k8Yv0A4TOuowBalJzdzINEox4QTwL6w62lh/3N6tK69AEHmuQYvQlRRvLHHppf0
 ByMfvp3UsMo5MM+Unxiub9alS0nZJrRTnlA0jp7hSUq9Fy4JtsqMJzRvrH365ugPQoAC
 TlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MlSKa9SzW7tV05r9J8yh1C/GcEEmHuhq2z7iKSDUD3s=;
 b=BzHquoY7aHuBHLFQYpK0Cwlhw9Xjc7Is3Fcd/EJk0upni+d7miTbY3QNTVmvQJxkmS
 Q6dwNsv2xqWBCsFmxlheMoqPSD6wEo0marKAlj9Lnna1MHjrtDj9lYsNRUQui5PbE4q2
 Vh0C9O+X6HHbBpOb66ahlf3UIbJUQ+COJT55ZoKuZIODRkJhlFQjVrmz7/MVIt2v0cLL
 KOcA5VquQZj3s2Lx8QeM/FcOvy/x7wsJMT7y+zAuM0krLtwnZuBLiv4Qjcy8/8aJb7MI
 R6weUSBoZH/RJyJ1g2zJRKt1sW1iJC9jvmO0ZrLbXCjeCDOSAvBlGhC+fhDEaB6sToLI
 YtSg==
X-Gm-Message-State: AOAM532p8vt63t+WBFAcaHYSjZkHyol9pzIJANnOw022cOh/jczBbf/j
 XahobygysQzLJ+XKy4KrErnaxA==
X-Google-Smtp-Source: ABdhPJzKDFqiT8yWHg4vy4m8fsJiB8F+Ed5gYSvcw2oyFJAQofyhEZQ8FjDDfNK+UauvnPhPwzXUtA==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr4089315wrq.224.1606398975823; 
 Thu, 26 Nov 2020 05:56:15 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id w186sm8889134wmb.26.2020.11.26.05.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:56:15 -0800 (PST)
Date: Thu, 26 Nov 2020 13:56:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: locomo: make locomo bus's remove callback return void
Message-ID: <20201126135613.GE2455276@dell>
References: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kernel@pengutronix.de,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNiBOb3YgMjAyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZSBkcml2
ZXIgY29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2Ygc3RydWN0IGJ1c190eXBlOjpyZW1v
dmUKPiBiZWNhdXNlIHRoZXJlIGlzIG9ubHkgbGl0dGxlIHRoYXQgY2FuIGJlIGRvbmUuIFRvIHNp
bXBsaWZ5IHRoZSBxdWVzdCB0bwo+IG1ha2UgdGhpcyBmdW5jdGlvbiByZXR1cm4gdm9pZCwgbGV0
IHN0cnVjdCBsb2NvbW9fZHJpdmVyOjpyZW1vdmUgcmV0dXJuCj4gdm9pZCwgdG9vLiBBbGwgdXNl
cnMgYWxyZWFkeSB1bmNvbmRpdGlvbmFsbHkgcmV0dXJuIDAsIHRoaXMgY29tbWl0IG1ha2VzCj4g
aXQgb2J2aW91cyB0aGF0IHJldHVybmluZyBhbiBlcnJvciBjb2RlIGlzIGEgYmFkIGlkZWEgYW5k
IGVuc3VyZXMgZnV0dXJlCj4gdXNlcnMgYmVoYXZlIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Cj4gLS0tCj4gSGVsbG8sCj4gCj4gaWYgZGVzaXJlZCB0aGUgY2hhbmdlIHRvIGFyY2gvYXJtL21h
Y2gtc2ExMTAwL2NvbGxpZS5jIGNhbiBiZSBzcGxpdCBvdXQKPiBvZiB0aGlzIHBhdGNoLiBUaGUg
Y2hhbmdlIG9mIHByb3RvdHlwZSB0aGVuIGRvZXNuJ3QgYWZmZWN0IHRoaXMgZHJpdmVyCj4gYW55
IG1vcmUuIFRoZXJlIGlzIG9uZSBsb2NvbW8tZHJpdmVyIHRoYXQgaXMgYWxyZWFkeSBub3cgdW5h
ZmZlY3RlZDoKPiBkcml2ZXJzL2xlZHMvbGVkcy1sb2NvbW8uYy4gVGhpcyBkcml2ZXIgZG9lc24n
dCBoYXZlIGEgcmVtb3ZlIGNhbGxiYWNrLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+ICBh
cmNoL2FybS9jb21tb24vbG9jb21vLmMgICAgICAgICAgICAgICB8IDUgKystLS0KPiAgYXJjaC9h
cm0vaW5jbHVkZS9hc20vaGFyZHdhcmUvbG9jb21vLmggfCAyICstCj4gIGFyY2gvYXJtL21hY2gt
c2ExMTAwL2NvbGxpZS5jICAgICAgICAgIHwgNiAtLS0tLS0KPiAgZHJpdmVycy9pbnB1dC9rZXli
b2FyZC9sb2NvbW9rYmQuYyAgICAgfCA0ICstLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
bG9jb21vbGNkLmMgICAgfCAzICstLQoKQWNrZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Cgo+ICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
