Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB1108B3A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B74C6E053;
	Mon, 25 Nov 2019 09:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594166E053
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:56:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so14025634wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQLXL4wEvCHiGZx1WE499NjfF/ywAujK0jr8uEANUhc=;
 b=kF13M4Ks1lB5rKUeLrPgLZFxCID7cgHftbJ5BdG6bAv5VDlRiGV6wVhhNKIVzqxhB1
 zbTTP8TTfESjgoEJLMeatVGvwplPdsdc+QsAD/oy/HA6GDIdjumIHqawY7cxz39Z8RfV
 7WInbGIti6CNhscM6mrvqsOiYC/aaHNXuba83iIYVy7GikJrn1TLeLUHkHx5DpJeN9Ug
 dt/Y569i8fogB6mNCD3X4jZl+oSu7CclaDGmU011S13qm5IF/DveokdJx5X79/hLZbmD
 tLfJltUToxfJSuWUD4Li/wG7QfP1KRN6xipiHURMr6PABOLyAsOcdtJjhGzRaKVf8shB
 iFsQ==
X-Gm-Message-State: APjAAAWkc+LPpoRwH2tnfsv7Gl8+W26BiEHh+cNKrKVsTa42uCpclVjL
 Kkz6htuQdl91CO31ILCp7wgxHQ==
X-Google-Smtp-Source: APXvYqxT2jc/vj80jYZH5pCOS2C3bSf/Y0E/TFujPDmPYxHwgfOnnJiIxnMWRiZ/oSAW6UMxuNP5Uw==
X-Received: by 2002:adf:f18e:: with SMTP id h14mr31979916wro.348.1574675792033; 
 Mon, 25 Nov 2019 01:56:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y15sm9349438wrh.94.2019.11.25.01.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:56:30 -0800 (PST)
Date: Mon, 25 Nov 2019 10:56:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: vic: Export module device table
Message-ID: <20191125095629.GK29965@phenom.ffwll.local>
References: <20191122133215.1317039-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122133215.1317039-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQLXL4wEvCHiGZx1WE499NjfF/ywAujK0jr8uEANUhc=;
 b=C2KaDLiFnlOYsWP3jS8XknzxzkuuBZxi9r3cHIV+ylP0OxOLzS8e+bYjxtNS7ODOlo
 RE9RB1cDEI4wPLl537d/Q6XHkyN14me1kHnTZMS04AEjfIWS8n3+YXkQs1kiI3Ugsioj
 Jaoy02TQnSYhVgnchkhrrpwsrVj9NVUpjSefI=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDI6MzI6MTVQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBF
eHBvcnQgdGhlIG1vZHVsZSBkZXZpY2UgdGFibGUgdG8gZW5zdXJlIHRoZSBWSUMgY29tcGF0aWJs
ZSBzdHJpbmdzIGFyZQo+IGxpc3RlZCBpbiB0aGUgbW9kdWxlJ3MgYWxpYXNlcyB0YWJsZS4gVGhp
cyBpbiB0dXJuIGNhdXNlcyB0aGUgZHJpdmVyIHRvCj4gYmUgYXV0b21hdGljYWxseSBsb2FkZWQg
b24gYm9vdCBpZiBWSUMgaXMgdGhlIG9ubHkgZW5hYmxlZCBzdWJkZXZpY2Ugb2YKPiB0aGUgbG9n
aWNhbCBob3N0MXggRFJNIGRldmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGlu
ZyA8dHJlZGluZ0BudmlkaWEuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+CgpJIG5vdGljZWQgdGhhdCB0aGUgZHJtIHN1YmRldiBkcml2ZXIg
YWxzbyBsYWNrcyB0aGUgbWF0Y2hlcy4gSG93IGRvZXMgdGhhdAp3b3JrPyBKdXN0IGJ5IGdldHRp
bmcgbG9hZGVkIHdoZW4gYW55IG9mIHRoZSBzdWJkZXYgZHJpdmVycyBtYXRjaD8KLURhbmllbAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIHwgNSArKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmlj
LmMKPiBpbmRleCA5NDQ0YmExODM5OTAuLmM0ZDgyYjhiMzA2NSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmlj
LmMKPiBAQCAtMzg2LDEzICszODYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aWNfY29uZmln
IHZpY190MTk0X2NvbmZpZyA9IHsKPiAgCS5zdXBwb3J0c19zaWQgPSB0cnVlLAo+ICB9Owo+ICAK
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdmljX21hdGNoW10gPSB7Cj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRlZ3JhX3ZpY19vZl9tYXRjaFtdID0gewo+
ICAJeyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExMjQtdmljIiwgLmRhdGEgPSAmdmljX3Qx
MjRfY29uZmlnIH0sCj4gIAl7IC5jb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTIxMC12aWMiLCAu
ZGF0YSA9ICZ2aWNfdDIxMF9jb25maWcgfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRl
Z3JhMTg2LXZpYyIsIC5kYXRhID0gJnZpY190MTg2X2NvbmZpZyB9LAo+ICAJeyAuY29tcGF0aWJs
ZSA9ICJudmlkaWEsdGVncmExOTQtdmljIiwgLmRhdGEgPSAmdmljX3QxOTRfY29uZmlnIH0sCj4g
IAl7IH0sCj4gIH07Cj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHRlZ3JhX3ZpY19vZl9tYXRj
aCk7Cj4gIAo+ICBzdGF0aWMgaW50IHZpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICB7Cj4gQEAgLTUxNiw3ICs1MTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
bV9vcHMgdmljX3BtX29wcyA9IHsKPiAgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB0ZWdyYV92aWNf
ZHJpdmVyID0gewo+ICAJLmRyaXZlciA9IHsKPiAgCQkubmFtZSA9ICJ0ZWdyYS12aWMiLAo+IC0J
CS5vZl9tYXRjaF90YWJsZSA9IHZpY19tYXRjaCwKPiArCQkub2ZfbWF0Y2hfdGFibGUgPSB0ZWdy
YV92aWNfb2ZfbWF0Y2gsCj4gIAkJLnBtID0gJnZpY19wbV9vcHMKPiAgCX0sCj4gIAkucHJvYmUg
PSB2aWNfcHJvYmUsCj4gLS0gCj4gMi4yMy4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
