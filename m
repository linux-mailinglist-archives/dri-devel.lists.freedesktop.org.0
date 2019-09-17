Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E981B54F5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 20:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5E6ED27;
	Tue, 17 Sep 2019 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625A289449
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 18:11:40 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F00D5C0495A3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 18:11:39 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id s3so5203840qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dbTNAJYyJKprAqc5rUVPlVswk+Df0iJaa4bhlT09lHc=;
 b=BxdMpTMnugCKL9xb0at8mQneZk0leML8M9vrSG4J8UoTb/3cBMeqMo9hBn3loZXgfj
 r+YSxTpad6a/sPWf1UCNS7du+zgWwYWoxjuNxbNeykNYF1vmqnEIk2RawMMqz3vGwbw6
 6kLc1Z268wgFAmx3UwMvscM17EFFO55AzXIDiXAQodPeZ/y15v9aiZ5Vh+yPxlFGfVcS
 NuWoM9GtVuO3So9Lg158DFSV0ChDTz9DIfH/u6J4GhnEqZnmY2htDF797MhPHgAWIctu
 En2exdzWqShvTSU75gBInz/8Ard+CFdcDKgpxKM/t7iMmsRwYKMR23gSL5E7uaMnyCwF
 8h8w==
X-Gm-Message-State: APjAAAXOfiZlAhloDMMNIjcxYawlG8P3Nq0hONw87UujugVlHwU3AmEz
 4QNDrZrpNyQkC519SDMnNlNLhu0RMlL6tZ2GSU7UPHR4a+Ucs7fCrmdvCVMgc1HVODV77g7fnIg
 iYUxIX6U0nuAXSvHkVoT1bh1jVfIO
X-Received: by 2002:a0c:8867:: with SMTP id 36mr3913703qvm.177.1568743899238; 
 Tue, 17 Sep 2019 11:11:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj+Y0cx4IxCWpX+U+UX54jgsRbnpNYTchmGI29jP136k5MseLmObfaK6LmqAVA/hh5ZWujCA==
X-Received: by 2002:a0c:8867:: with SMTP id 36mr3913680qvm.177.1568743898950; 
 Tue, 17 Sep 2019 11:11:38 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id g19sm2037468qtb.2.2019.09.17.11.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:11:38 -0700 (PDT)
Message-ID: <da90e46cbadefca51173f42c437fdbec790001c3.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau: tegra: Fix NULL pointer dereference
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 17 Sep 2019 14:11:37 -0400
In-Reply-To: <20190916143606.9272-2-thierry.reding@gmail.com>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
 <20190916143606.9272-2-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHN1cmUgSSB1bmRlcnN0YW5kIGVub3VnaCBhYm91dCB3aHkgQkFSMiBpcyBuZWVkZWQgb3Ig
d2hhdCBpdCdzIHVzZWQgZm9yIHRvCmdpdmUgYSBwcm9wZXIgcmV2aWV3IG9uIHRoaXMgb25lLCBw
cm9iYWJseSBiZXR0ZXIgdG8gd2FpdCBmb3Igc2tlZ2dzYiB0byB0YWtlCmEgbG9vayBhdCB0aGlz
CgpPbiBNb24sIDIwMTktMDktMTYgYXQgMTY6MzYgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3Rl
Ogo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gRmlsbCBp
biBCQVIyIGNhbGxiYWNrcyBmb3IgaW5zdGFuY2UgbWVtb3J5LiBUaGVyZSdzIG5vIEJBUjIgb24g
VGVncmEKPiBHUFVzLCBidXQgYnVmZmVycyBhcmUgYWxsIGluIHN5c3RlbSBtZW1vcnkgYW55d2F5
LCBzbyBqdXN0IHJldHVybiB0aGUKPiBwbGFpbiBhZGRyZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIC4uLi9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBhLmMgICB8IDMwICsrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaW5zdG1lbS9nazIwYS5jCj4gYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBhLmMKPiBpbmRl
eCA5ODVmMjk5MGFiMGQuLmIwNDkzZjhkZjFmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBhLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9pbnN0bWVtL2drMjBhLmMKPiBAQCAtMjYxLDYgKzI2
MSwzNCBAQCBnazIwYV9pbnN0b2JqX3JlbGVhc2VfaW9tbXUoc3RydWN0IG52a21fbWVtb3J5ICpt
ZW1vcnkpCj4gIAludmttX2x0Y19pbnZhbGlkYXRlKGx0Yyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB1
NjQKPiArZ2syMGFfaW5zdG9ial9iYXIyX2RtYShzdHJ1Y3QgbnZrbV9tZW1vcnkgKm1lbW9yeSkK
PiArewo+ICsJc3RydWN0IGdrMjBhX2luc3RvYmpfZG1hICppb2JqID0gZ2syMGFfaW5zdG9ial9k
bWEobWVtb3J5KTsKPiArCXU2NCBhZGRyID0gfjBVTEw7Cj4gKwo+ICsJaWYgKGdrMjBhX2luc3Rv
YmpfYWNxdWlyZV9kbWEoJmlvYmotPmJhc2UubWVtb3J5KSkKPiArCQlhZGRyID0gZ2syMGFfaW5z
dG9ial9hZGRyKCZpb2JqLT5iYXNlLm1lbW9yeSk7Cj4gKwo+ICsJZ2syMGFfaW5zdG9ial9yZWxl
YXNlX2RtYSgmaW9iai0+YmFzZS5tZW1vcnkpOwo+ICsKPiArCXJldHVybiBhZGRyOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgdTY0Cj4gK2drMjBhX2luc3RvYmpfYmFyMl9pb21tdShzdHJ1Y3QgbnZrbV9t
ZW1vcnkgKm1lbW9yeSkKPiArewo+ICsJc3RydWN0IGdrMjBhX2luc3RvYmpfaW9tbXUgKmlvYmog
PSBnazIwYV9pbnN0b2JqX2lvbW11KG1lbW9yeSk7Cj4gKwl1NjQgYWRkciA9IH4wVUxMOwo+ICsK
PiArCWlmIChnazIwYV9pbnN0b2JqX2FjcXVpcmVfaW9tbXUoJmlvYmotPmJhc2UubWVtb3J5KSkK
PiArCQlhZGRyID0gZ2syMGFfaW5zdG9ial9hZGRyKCZpb2JqLT5iYXNlLm1lbW9yeSk7Cj4gKwo+
ICsJZ2syMGFfaW5zdG9ial9yZWxlYXNlX2lvbW11KCZpb2JqLT5iYXNlLm1lbW9yeSk7Cj4gKwo+
ICsJcmV0dXJuIGFkZHI7Cj4gK30KPiArCj4gIHN0YXRpYyB1MzIKPiAgZ2syMGFfaW5zdG9ial9y
ZDMyKHN0cnVjdCBudmttX21lbW9yeSAqbWVtb3J5LCB1NjQgb2Zmc2V0KQo+ICB7Cj4gQEAgLTM1
Myw2ICszODEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG52a21fbWVtb3J5X2Z1bmMKPiAgZ2sy
MGFfaW5zdG9ial9mdW5jX2RtYSA9IHsKPiAgCS5kdG9yID0gZ2syMGFfaW5zdG9ial9kdG9yX2Rt
YSwKPiAgCS50YXJnZXQgPSBnazIwYV9pbnN0b2JqX3RhcmdldCwKPiArCS5iYXIyID0gZ2syMGFf
aW5zdG9ial9iYXIyX2RtYSwKPiAgCS5wYWdlID0gZ2syMGFfaW5zdG9ial9wYWdlLAo+ICAJLmFk
ZHIgPSBnazIwYV9pbnN0b2JqX2FkZHIsCj4gIAkuc2l6ZSA9IGdrMjBhX2luc3RvYmpfc2l6ZSwK
PiBAQCAtMzY1LDYgKzM5NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbnZrbV9tZW1vcnlfZnVu
Ywo+ICBnazIwYV9pbnN0b2JqX2Z1bmNfaW9tbXUgPSB7Cj4gIAkuZHRvciA9IGdrMjBhX2luc3Rv
YmpfZHRvcl9pb21tdSwKPiAgCS50YXJnZXQgPSBnazIwYV9pbnN0b2JqX3RhcmdldCwKPiArCS5i
YXIyID0gZ2syMGFfaW5zdG9ial9iYXIyX2lvbW11LAo+ICAJLnBhZ2UgPSBnazIwYV9pbnN0b2Jq
X3BhZ2UsCj4gIAkuYWRkciA9IGdrMjBhX2luc3RvYmpfYWRkciwKPiAgCS5zaXplID0gZ2syMGFf
aW5zdG9ial9zaXplLAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
