Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E210D2F1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95B56E897;
	Fri, 29 Nov 2019 09:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196D6E897
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:07:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so34228627wro.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Idebi7aDiIoMw7jaPD0CLZqQMMLW9tREgDMduPZ4dyA=;
 b=ovcu1KjGrDBqvdRezX4pxKB44RBu0082P7VWaRFBRcZ97x64f0zhn3V4WWq4wOO635
 1E2IhNGdvsE7T6qQJAIZSoI/Z7tL8qTxQDZUy9qxHuw0PpKxVY0LpHdz9Ixnifh5pLGL
 37QKqT8jo0ev3rMccwf4HiachzsY8onr0mYTgY+X5FYptnyV2e7Uv0OjA4LCwCASU9J3
 p5KhWCPr8Hiy8+dyTth7GNrzbFB+L7olozVeq0WqZiNSv8j2nq/9ujelXdEZRiTGkQHa
 JXNEvAKEeCI7+xjugZb38/rO91PdefRP083+Mm3l1503hHCsjEvf8pq79+Q+Y3fsPnyu
 MuaA==
X-Gm-Message-State: APjAAAWumynw1M2DlXMjx/CJdvKCnXuwy6i1VMnV17/fqf7lSAs9lXbH
 9AKeUDqjgClMXpHUIqclRsGSEQ==
X-Google-Smtp-Source: APXvYqxAAzZDg8wPwIWoyjm+arnlJgyEQPm4OtB7PXELLnIVSX/SJh1uju9yOKzdZpsqNGL7bNJlFg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr1813752wrt.339.1575018430314; 
 Fri, 29 Nov 2019 01:07:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 72sm27374023wrl.73.2019.11.29.01.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:07:09 -0800 (PST)
Date: Fri, 29 Nov 2019 10:06:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129090643.GA624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-2-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Idebi7aDiIoMw7jaPD0CLZqQMMLW9tREgDMduPZ4dyA=;
 b=XSdGLZ8ZlgNkq06U3t3aL5Y5HkM1bHV5PqzBxZl1Aw4kUy5rIHkNWObg2FnGz1zhLo
 LZwKV9X6hjB3PekoU3DQdo845xn0JtDjp+JKLWlkJpQKDLjI8m8gIxImV0TWdrWKuJ7b
 wwxw+ZjvEYjLxmJ0m7L9oGgGARdM28EHDAmt8=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6Mzc6MzNQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBJ
IGhhdmUgbm8gcmVjb2xsZWN0aW9uIHdoeSB0aGF0IGNoZWNrIGlzIHRoZXJlLCBidXQgaXQgc2Vl
bXMgdG8gdHJpZ2dlcgo+IGFsbCB0aGUgdGltZSwgc28gcmVtb3ZlIGl0LiBFdmVyeXRoaW5nIHdv
cmtzIGZpbmUgd2l0aG91dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMgfCAz
IC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5j
Cj4gaW5kZXggNmFjYTBmZDVhOGU1Li5lNTZjMGY3ZDNhMTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2h1Yi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5j
Cj4gQEAgLTYxNSwxMSArNjE1LDggQEAgc3RhdGljIHN0cnVjdCB0ZWdyYV9kaXNwbGF5X2h1Yl9z
dGF0ZSAqCj4gIHRlZ3JhX2Rpc3BsYXlfaHViX2dldF9zdGF0ZShzdHJ1Y3QgdGVncmFfZGlzcGxh
eV9odWIgKmh1YiwKPiAgCQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiAg
ewo+IC0Jc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0YShodWItPmNsaWVu
dC5wYXJlbnQpOwo+ICAJc3RydWN0IGRybV9wcml2YXRlX3N0YXRlICpwcml2Owo+ICAKPiAtCVdB
Uk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZHJtLT5tb2RlX2NvbmZpZy5jb25uZWN0aW9u
X211dGV4KSk7CgpJIHN1c3BlY3QgY29weXBhc3RhIGZyb20gdGhlIG1zdCBwcml2YXRlIHN0YXRl
IHN0dWZmLCB3aGljaCByZWxpZWQgb24gdGhpcwpsb2NrIHRvIHByb3RlY3QgaXQuIEV4Y2VwdCB5
b3VyIGNvZGUgbmV2ZXIgYm90aGVyZWQgdG8gZ3JhYiB0aGF0IGxvY2sgKG9yCmFueSBvdGhlcikg
c28gd2FzIHRlY2huaWNhbGx5IGJyb2tlbiB1bnRpbCB3ZSBhZGRlZCBnZW5lcmljIGxvY2tpbmcg
aW4KCmNvbW1pdCBiOTYyYTEyMDUwYTM4N2U0YmJmM2E0ODc0NWFmZTFkMjlkMzk2YjBkCkF1dGhv
cjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpEYXRlOiAgIE1vbiBPY3QgMjIgMTQ6
MzE6MjIgMjAxOCArMDIwMAoKICAgIGRybS9hdG9taWM6IGludGVncmF0ZSBtb2Rlc2V0IGxvY2sg
d2l0aCBwcml2YXRlIG9iamVjdHMKCkhlbmNlIHRoaXMgaXMgbm93IG9rIHRvIGRyb3AsIG9yaWdp
bmFsbHkgaXQgd2FzbnQuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KCkFzaWRlOiBZb3UncmUgc2luZ2xlLXRocmVhZCBhbGwgeW91ciBhdG9taWMg
dXBkYXRlcyBvbiB0aGUgaHViLT5sb2NrLAp3aGljaCBtaWdodCBub3QgYmUgd2hhdCB5b3Ugd2Fu
dC4gQXQgbGVhc3QgdXBkYXRlcyB0byBzZXBhcmF0ZSBjcnRjIHNob3VsZApnbyB0aHJvdWdoIGlu
IHBhcmFsbGVsLiBVc3VhbCB3YXkgdG8gZml4IHRoaXMgaXMgdG8gYWRkIGEKdGVncmFfY3J0Y19z
dGF0ZS0+aHViX2NoYW5nZWQgdGhhdCB5b3VyIGVhcmxpZXIgY29kZSBzZXRzLCBhbmQgdGhlbiB5
b3UKd2FsayB0aGUgY3J0YyBzdGF0ZXMgaW4gdGhlIGF0b21pYyBjb21taXQgKG9ubHkgdGhvc2Us
IG5vdCBhbGwsIG90aGVyd2lzZQp5b3UganVzdCByZWJ1aWxkIHRoYXQgZ2xvYmFsIGxvY2sgYWdh
aW4pLCBhbmQgdGhlbiBvbmx5IGdyYWIgdGhlIGh1YiBzdGF0ZQp3aGVuIHlvdSBuZWVkIHRvIHVw
ZGF0ZSBzb21ldGhpbmcuCgpDaGVlcnMsIERhbmllbAoKPiAtCj4gIAlwcml2ID0gZHJtX2F0b21p
Y19nZXRfcHJpdmF0ZV9vYmpfc3RhdGUoc3RhdGUsICZodWItPmJhc2UpOwo+ICAJaWYgKElTX0VS
Uihwcml2KSkKPiAgCQlyZXR1cm4gRVJSX0NBU1QocHJpdik7Cj4gLS0gCj4gMi4yMy4wCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
