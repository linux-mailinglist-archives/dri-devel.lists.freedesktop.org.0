Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EEE10D9E1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 20:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FD26EA31;
	Fri, 29 Nov 2019 19:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289966EA31
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 19:03:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so6757672wrq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 11:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1QZu4RGS+J5yqrMyWN6jTUeaD/ZNnaysfdlkpKKSsCc=;
 b=GSVFBQWDR8SUngv8j/T622MyDG/2eR5M12ikf0StUNbpjaRNulHi+nAL1IEQZzs030
 PcY+/jLyvFV5T7NJpNYBrqkfjh8k+vlBJ6LVdtMKE/bz2X75R1HLHdLkMcFG5iBqpOtW
 3BZL0FxVjLQ3ENu8Xt+ugesZFV3d3msr1RsE5PdMLFX1484FwurWyVYDl4nmZ1ms8IQQ
 BrFyY1OuPkXHhFARCwCa05pWAb2tX2+Li3nvwiRhL1eo+YcLu0IuEjcTEdgB632fWDy5
 HkRUMyumIAWkCVivsETt925Fox5FIGmAmVo+1ZF1rocfMn1pl9Y6EKAb3pPJhYNGssXW
 6qsA==
X-Gm-Message-State: APjAAAX4bmR/iAZWphOxTQPdlWUEoeTIOORynUsVNb2Pnf113FH9vJvH
 pQ0oVeuDDjhcvwbRyKBujSl4lA==
X-Google-Smtp-Source: APXvYqwkXqOoa23FK2UWm7yNVnK2HSPgqLRWd4QnR/Kv93AMCRNwoH5jgs5SR2PlyilyqKiDr3o/ww==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr41102795wrt.219.1575054191703; 
 Fri, 29 Nov 2019 11:03:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c144sm14301683wmd.1.2019.11.29.11.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 11:03:10 -0800 (PST)
Date: Fri, 29 Nov 2019 20:03:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129190309.GM624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
 <20191129090643.GA624164@phenom.ffwll.local>
 <20191129101255.GA2771912@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129101255.GA2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1QZu4RGS+J5yqrMyWN6jTUeaD/ZNnaysfdlkpKKSsCc=;
 b=Ld6oBMZlsDrpYTFkWfX2nRy7QJe5aHfgFeywZeep+lUqZo9ieNoCDwe7ijWQU+iKyE
 Ric9R0wZEX4IFGGRX1nEjo+N2vM4wd0XsAh/PwV8uuSuTV+tR2Cmch0WFutksAvk3iHA
 kA1PQB58+ZVv6nrHrXMi7dN5chcxq07oHs7U8=
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

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTE6MTI6NTVBTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MDY6NDNBTSArMDEwMCwgRGFuaWVs
IFZldHRlciB3cm90ZToKPiA+IE9uIFRodSwgTm92IDI4LCAyMDE5IGF0IDA0OjM3OjMzUE0gKzAx
MDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+ID4gPiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgo+ID4gPiAKPiA+ID4gSSBoYXZlIG5vIHJlY29sbGVjdGlvbiB3aHkg
dGhhdCBjaGVjayBpcyB0aGVyZSwgYnV0IGl0IHNlZW1zIHRvIHRyaWdnZXIKPiA+ID4gYWxsIHRo
ZSB0aW1lLCBzbyByZW1vdmUgaXQuIEV2ZXJ5dGhpbmcgd29ya3MgZmluZSB3aXRob3V0Lgo+ID4g
PiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMgfCAzIC0tLQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2h1Yi5jCj4gPiA+IGluZGV4IDZhY2EwZmQ1YThlNS4uZTU2YzBmN2QzYTEzIDEwMDY0NAo+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMKPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2h1Yi5jCj4gPiA+IEBAIC02MTUsMTEgKzYxNSw4IEBAIHN0YXRpYyBzdHJ1
Y3QgdGVncmFfZGlzcGxheV9odWJfc3RhdGUgKgo+ID4gPiAgdGVncmFfZGlzcGxheV9odWJfZ2V0
X3N0YXRlKHN0cnVjdCB0ZWdyYV9kaXNwbGF5X2h1YiAqaHViLAo+ID4gPiAgCQkJICAgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+ID4gIHsKPiA+ID4gLQlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtID0gZGV2X2dldF9kcnZkYXRhKGh1Yi0+Y2xpZW50LnBhcmVudCk7Cj4gPiA+ICAJ
c3RydWN0IGRybV9wcml2YXRlX3N0YXRlICpwcml2Owo+ID4gPiAgCj4gPiA+IC0JV0FSTl9PTigh
ZHJtX21vZGVzZXRfaXNfbG9ja2VkKCZkcm0tPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgp
KTsKPiA+IAo+ID4gSSBzdXNwZWN0IGNvcHlwYXN0YSBmcm9tIHRoZSBtc3QgcHJpdmF0ZSBzdGF0
ZSBzdHVmZiwgd2hpY2ggcmVsaWVkIG9uIHRoaXMKPiA+IGxvY2sgdG8gcHJvdGVjdCBpdC4gRXhj
ZXB0IHlvdXIgY29kZSBuZXZlciBib3RoZXJlZCB0byBncmFiIHRoYXQgbG9jayAob3IKPiA+IGFu
eSBvdGhlcikgc28gd2FzIHRlY2huaWNhbGx5IGJyb2tlbiB1bnRpbCB3ZSBhZGRlZCBnZW5lcmlj
IGxvY2tpbmcgaW4KPiA+IAo+ID4gY29tbWl0IGI5NjJhMTIwNTBhMzg3ZTRiYmYzYTQ4NzQ1YWZl
MWQyOWQzOTZiMGQKPiA+IEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+
ID4gRGF0ZTogICBNb24gT2N0IDIyIDE0OjMxOjIyIDIwMTggKzAyMDAKPiA+IAo+ID4gICAgIGRy
bS9hdG9taWM6IGludGVncmF0ZSBtb2Rlc2V0IGxvY2sgd2l0aCBwcml2YXRlIG9iamVjdHMKPiA+
IAo+ID4gSGVuY2UgdGhpcyBpcyBub3cgb2sgdG8gZHJvcCwgb3JpZ2luYWxseSBpdCB3YXNudC4K
PiA+IAo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gCj4gR3JlYXQsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuIEknbGwgdXBkYXRl
IHRoZSBjb21taXQgbWVzc2FnZSB3aXRoCj4gdGhhdCBleHBsYW5hdGlvbi4KPiAKPiA+IEFzaWRl
OiBZb3UncmUgc2luZ2xlLXRocmVhZCBhbGwgeW91ciBhdG9taWMgdXBkYXRlcyBvbiB0aGUgaHVi
LT5sb2NrLAo+ID4gd2hpY2ggbWlnaHQgbm90IGJlIHdoYXQgeW91IHdhbnQuIEF0IGxlYXN0IHVw
ZGF0ZXMgdG8gc2VwYXJhdGUgY3J0YyBzaG91bGQKPiA+IGdvIHRocm91Z2ggaW4gcGFyYWxsZWwu
IFVzdWFsIHdheSB0byBmaXggdGhpcyBpcyB0byBhZGQgYQo+ID4gdGVncmFfY3J0Y19zdGF0ZS0+
aHViX2NoYW5nZWQgdGhhdCB5b3VyIGVhcmxpZXIgY29kZSBzZXRzLCBhbmQgdGhlbiB5b3UKPiA+
IHdhbGsgdGhlIGNydGMgc3RhdGVzIGluIHRoZSBhdG9taWMgY29tbWl0IChvbmx5IHRob3NlLCBu
b3QgYWxsLCBvdGhlcndpc2UKPiA+IHlvdSBqdXN0IHJlYnVpbGQgdGhhdCBnbG9iYWwgbG9jayBh
Z2FpbiksIGFuZCB0aGVuIG9ubHkgZ3JhYiB0aGUgaHViIHN0YXRlCj4gPiB3aGVuIHlvdSBuZWVk
IHRvIHVwZGF0ZSBzb21ldGhpbmcuCj4gCj4gSSdtIGNvbmZ1c2VkLiBXaGVyZSBkbyB5b3Ugc2Vl
IGh1Yi0+bG9jaz8gRGlkIHlvdSBtZWFuIHdncnAtPmxvY2s/CgpzdHJ1Y3QgdGVncmFfZGlzcGxh
eV9odWItPmJhc2UubG9jayBJIGhhdmUgbm8gaWRlYSB3aGF0IHdncnAtPmxvY2sgaXMKcHJvdGVj
dGluZyAtIHRoZSBmdW5jdGlvbnMgc2VlbSB0byBiZSBvbmx5IGNhbGxlZCBmcm9tIGRyaXZlciBs
b2FkL2NsZWFudXAKY29kZSwgYW5kIHRoYXQgaXMgc2luZ2xlLXRocmVhZGVkLiBJZiBJJ20gbm90
IG1pc3NpbmcgYW55dGhpbmcgdGhlbgp3Z3JwLT5sb2NrIGRvZXMgbm90aGluZyBmb3IgeW91LgoK
Q2hlZXJzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
