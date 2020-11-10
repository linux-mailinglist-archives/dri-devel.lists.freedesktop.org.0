Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647482AE258
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717AE89CD9;
	Tue, 10 Nov 2020 22:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC889CB5;
 Tue, 10 Nov 2020 22:00:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 23so2865389wmg.1;
 Tue, 10 Nov 2020 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kQXXRFyXwxRS/I2RgZpEGIowDOXzMpZPv5s9Y3k7QhI=;
 b=j2cdkNt2/4bsAh1RBkbd/u0wSdArQ78T4xxdeBsW+/M6f6LD/81+RHepLgSU8jEJ9c
 f9WemXa2FyA/zxrsTylztAKXuq0YJuj9cxdDPXcF7kjC/E/wnutNAoTNsa9/fRwyPiWc
 +78MWhXNIm57moM4vMRvWf1DcGUnsFSno5zHoldcv7YKQV4FGO0ZtFk2dcIByjtQAluG
 A1AXBA7Dw8JTOoDYGL3iJ5mulzzCccTJTlyU+yBela+/iTpOeOh4bAXiakRfdECIEnLG
 1LS6PeRzptHzcsSiTkg+tTBbKxjaYaB3ughnn3vmOkXcH4rq3iY2DLIXN3VvS84y2WHj
 K6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kQXXRFyXwxRS/I2RgZpEGIowDOXzMpZPv5s9Y3k7QhI=;
 b=XTRpv83o3UrYCDAg+l27ZleHO/obaHo/mWj2Ld7AoVN2ZgGaZk1he2tUwRInmbNWM+
 UH/ri7AvnOPVaoIYi4ZjVEEX6VB2fForV/nmVYe/pPdZ6oIsTcxR3Ic+jwrgLC+TpGZk
 LK0GcIextdm6RWYco6KGYnEHCWQLPArXP/x+1Qpd6WWHs56RASUwgnBorakcnKS40szV
 EGtcqPzQw6hv37YYlHVpl9rYX+4JZCJh3K/cG1cDSyjj6oQ0S1mKvpg18g0tPHVajE7a
 esz1tdyydcCgbivKjYz4zLrKlSpZq09hT579D20IzkPPCdgrzCvGDRxqhyH4tWr9sQ3B
 rLQw==
X-Gm-Message-State: AOAM530g/+hMb7C+c+maSyKQq1tAJlZofE4rRc4QAyee3hUC50NcYwWE
 ESJFGnm65mS5FMCsRk9s7Lth0xurPgnjlng7S0o=
X-Google-Smtp-Source: ABdhPJyA6KMQLGspxDQuMB3AJjwy1n4N6vTF1NTBv7oDFWmt8buswnwQw/m1E/kYfC65a/uWB9XotDCuHrLZ3DbVAI0=
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr192270wma.79.1605045601646; 
 Tue, 10 Nov 2020 14:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-16-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 16:59:50 -0500
Message-ID: <CADnq5_MYU0FMVm-ALPRAeF1O29TnZc83xpY+W-=iiSJY2AX2LQ@mail.gmail.com>
Subject: Re: [PATCH 15/19] drm/radeon: Move prototypes to shared header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjUwIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6NzU2OjU6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2dldF92Ymxhbmtf
Y291bnRlcl9rbXPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICA3NTYgfCB1MzIgcmFkZW9u
X2dldF92YmxhbmtfY291bnRlcl9rbXMoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB8IF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2ttcy5jOjgyNjo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVv
bl9lbmFibGVfdmJsYW5rX2ttc+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDgyNiB8IGlu
dCByYWRlb25fZW5hYmxlX3ZibGFua19rbXMoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICB8IF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9r
bXMuYzo4NTM6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25f
ZGlzYWJsZV92Ymxhbmtfa21z4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgODUzIHwgdm9p
ZCByYWRlb25fZGlzYWJsZV92Ymxhbmtfa21zKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgfCBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhh
bmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmggICAg
ICAgICB8IDYgKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXku
YyB8IDQgLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAo+IGluZGV4IGUxMTMyZDg2ZDI1MDcuLjk2
MWEzMWI4ODA1YzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24u
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKPiBAQCAtMjgzMiw2ICsy
ODMyLDEyIEBAIGV4dGVybiB2b2lkIHJhZGVvbl9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHUzMiBhcnJheV9zaXplKTsKPiAgc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJhZGVvbl9nZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4KPiAr
LyogS01TICovCj4gKwo+ICt1MzIgcmFkZW9uX2dldF92YmxhbmtfY291bnRlcl9rbXMoc3RydWN0
IGRybV9jcnRjICpjcnRjKTsKPiAraW50IHJhZGVvbl9lbmFibGVfdmJsYW5rX2ttcyhzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpOwo+ICt2b2lkIHJhZGVvbl9kaXNhYmxlX3ZibGFua19rbXMoc3RydWN0
IGRybV9jcnRjICpjcnRjKTsKPiArCj4gIC8qCj4gICAqIHZtCj4gICAqLwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiBpbmRleCBiNzk2ODZjZjhiZGJkLi5iZDYwZjE2
ZmQwZDc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3Bs
YXkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+IEBA
IC00NSwxMCArNDUsNiBAQAo+ICAjaW5jbHVkZSAiYXRvbS5oIgo+ICAjaW5jbHVkZSAicmFkZW9u
LmgiCj4KPiAtdTMyIHJhZGVvbl9nZXRfdmJsYW5rX2NvdW50ZXJfa21zKHN0cnVjdCBkcm1fY3J0
YyAqY3J0Yyk7Cj4gLWludCByYWRlb25fZW5hYmxlX3ZibGFua19rbXMoc3RydWN0IGRybV9jcnRj
ICpjcnRjKTsKPiAtdm9pZCByYWRlb25fZGlzYWJsZV92Ymxhbmtfa21zKHN0cnVjdCBkcm1fY3J0
YyAqY3J0Yyk7Cj4gLQo+ICBzdGF0aWMgdm9pZCBhdml2b19jcnRjX2xvYWRfbHV0KHN0cnVjdCBk
cm1fY3J0YyAqY3J0YykKPiAgewo+ICAgICAgICAgc3RydWN0IHJhZGVvbl9jcnRjICpyYWRlb25f
Y3J0YyA9IHRvX3JhZGVvbl9jcnRjKGNydGMpOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
