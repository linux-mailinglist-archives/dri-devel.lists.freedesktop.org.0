Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA870975
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72189E0C;
	Mon, 22 Jul 2019 19:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1EB89E06;
 Mon, 22 Jul 2019 19:13:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r1so40552967wrl.7;
 Mon, 22 Jul 2019 12:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=434H4w2+Nc+kEvi+FXRoSbJrlL9XWqOVbmsm61hLvOU=;
 b=Xfcfa8VLVFf0sJHFp0HR4of3veT1WFLuZtNgG5e4E0tjFd/WMe5fNvSy37UkCTg4d0
 eWdV5kPPvYetaKIwHD0aKB8sjWFG+w82Rx0l/AgShFOHouZUTgYMHhkA53VOoDxEjvAR
 kZxa3CRjhWJk9GXw+Zus2ZitHNsn26gYahIEoXzAvxfZDvfyqRbNgR2HJ1XqiNF4eAAE
 TU2lkZGmTkVBWagAqGV/E23t2SbizC9dSXdfMwddl/0H4JI0wUSTsP1csl7wdQFMBjv1
 FJU7atLbEKKizAtlS3pEyba/4DrvFESl2EyPlkX5TgoBQUa76JZCiByS60/744KXFb8B
 gCzQ==
X-Gm-Message-State: APjAAAWTMZSb7xB6L729NVStPPHc6Zg3OdPJmGKKc5Vc/GTUEHC7zHBT
 VS1fojigq6f7Civ7Xk4Z3DenvkRUnJ3eRtB+0yg=
X-Google-Smtp-Source: APXvYqxbCO8wLN0AyatMM8pt/BozR167LVRFbBFFFVOYWBSVlXBfDeCcG+ACzuNYEPgiMaAcFOp8+mUNJmw4xZAPnyM=
X-Received: by 2002:adf:a299:: with SMTP id s25mr68665075wra.74.1563822835637; 
 Mon, 22 Jul 2019 12:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190722174716.GA17037@embeddedor>
 <7769041f-f321-1e99-a94f-52bdb7c016b5@amd.com>
In-Reply-To: <7769041f-f321-1e99-a94f-52bdb7c016b5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2019 15:13:44 -0400
Message-ID: <CADnq5_MqhTXyuAf-UubM7Ht7Ta56+_VmecWg1L2=5mhhox1Otg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Avoid fall-through warning
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=434H4w2+Nc+kEvi+FXRoSbJrlL9XWqOVbmsm61hLvOU=;
 b=iK+PLUANCjf7nhzt+C7nG2htF6gqN4UMXytrLLB3BaNc2rQne0KGhKIf0/AnhNcu67
 5wBj7Wj8CQ/RSCndovwslHymPnaSL+Q4tjB8MGj8MWtH5AIIHm+RUh5D5OclufGLP5Vl
 0OueW8tkYjc1o8S3Z6+P9O5pUdSDgM06jhn85BxinPyfIAVT1YZLJ5mcW2FEYLYSDWL3
 JupiJ30v68TFCSzCnzE5y0mOVCBxcf7/oF1L5VNOy2o9Qvv+qAvjxRKRS4fB5seCZVMm
 s7FJv2sF/10Ba5HvffYgZ+l+swvZzGWKb1oBYkRazd+P2GTrrQbNJWGFkZPTH4L3QUtV
 MBcg==
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Cox, Philip" <Philip.Cox@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDI6MTQgUE0g
TGl1LCBTaGFveXVuIDxTaGFveXVuLkxpdUBhbWQuY29tPiB3cm90ZToKPgo+IFJldmlld2VkLWJ5
OiAgc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+Cj4KPiBPbiAyMDE5LTA3LTIyIDE6NDcg
cC5tLiwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+IEluIHByZXBhcmF0aW9uIHRvIGVu
YWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIHRoaXMgcGF0Y2ggc2lsZW5jZXMKPiA+IHRo
ZSBmb2xsb3dpbmcgd2FybmluZzoKPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jOiBJbiBmdW5jdGlvbiDigJhtcWRfbWFuYWdl
cl9pbml0X3YxMOKAmToKPiA+IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVnLmg6MTIyOjUy
OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZh
bGx0aHJvdWdoPV0KPiA+ICAgI2RlZmluZSBfX2R5bmFtaWNfZnVuY19jYWxsKGlkLCBmbXQsIGZ1
bmMsIC4uLikgZG8geyBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiA+IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVnLmg6MTQz
OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2R5bmFtaWNfZnVuY19jYWxs4oCZ
Cj4gPiAgICBfX2R5bmFtaWNfZnVuY19jYWxsKF9fVU5JUVVFX0lEKGRkZWJ1ZyksIGZtdCwgZnVu
YywgIyNfX1ZBX0FSR1NfXykKPiA+ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vaW5jbHVk
ZS9saW51eC9keW5hbWljX2RlYnVnLmg6MTUzOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhfZHluYW1pY19mdW5jX2NhbGzigJkKPiA+ICAgIF9keW5hbWljX2Z1bmNfY2FsbChmbXQs
IF9fZHluYW1pY19wcl9kZWJ1ZywgIFwKPiA+ICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gLi9p
bmNsdWRlL2xpbnV4L3ByaW50ay5oOjMzNjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYZHluYW1pY19wcl9kZWJ1Z+KAmQo+ID4gICAgZHluYW1pY19wcl9kZWJ1ZyhmbXQsICMjX19W
QV9BUkdTX18pCj4gPiAgICBefn5+fn5+fn5+fn5+fn5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jOjQzMjozOiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYcHJfZGVidWfigJkKPiA+ICAgICBwcl9kZWJ1ZygiJXNAJWlc
biIsIF9fZnVuY19fLCBfX0xJTkVfXyk7Cj4gPiAgICAgXn5+fn5+fn4KPiA+IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmM6NDMzOjI6IG5v
dGU6IGhlcmUKPiA+ICAgIGNhc2UgS0ZEX01RRF9UWVBFX0NPTVBVVEU6Cj4gPiAgICBefn5+Cj4g
Pgo+ID4gYnkgcmVtb3ZpbmcgdGhlIGNhbGwgdG8gcHJfZGVidWcoKSBpbiBLRkRfTVFEX1RZUEVf
Q1A6Cj4gPgo+ID4gIlRoZSBtcWQgaW5pdCBmb3IgQ1AgYW5kIENPTVBVVEUgd2lsbCBoYXZlIHRo
ZSBzYW1lICByb3V0aW5lLiIgWzFdCj4gPgo+ID4gVGhpcyBidWcgd2FzIGZvdW5kIHRoYW5rcyB0
byB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQo+ID4gLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9jNzM1YTFjYy1hNTQ1
LTUwZmItNDRlNy1jMGFkOTNlZThlZTdAYW1kLmNvbS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+ID4gLS0tCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyB8IDEgLQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKPiA+IGluZGV4IDRmOGE2
ZmZjNTc3NS4uOWNkM2ViMmQ5MGJkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKPiA+IEBAIC00MjksNyArNDI5LDYgQEAg
c3RydWN0IG1xZF9tYW5hZ2VyICptcWRfbWFuYWdlcl9pbml0X3YxMChlbnVtIEtGRF9NUURfVFlQ
RSB0eXBlLAo+ID4KPiA+ICAgICAgIHN3aXRjaCAodHlwZSkgewo+ID4gICAgICAgY2FzZSBLRkRf
TVFEX1RZUEVfQ1A6Cj4gPiAtICAgICAgICAgICAgIHByX2RlYnVnKCIlc0AlaVxuIiwgX19mdW5j
X18sIF9fTElORV9fKTsKPiA+ICAgICAgIGNhc2UgS0ZEX01RRF9UWVBFX0NPTVBVVEU6Cj4gPiAg
ICAgICAgICAgICAgIHByX2RlYnVnKCIlc0AlaVxuIiwgX19mdW5jX18sIF9fTElORV9fKTsKPiA+
ICAgICAgICAgICAgICAgbXFkLT5hbGxvY2F0ZV9tcWQgPSBhbGxvY2F0ZV9tcWQ7Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
