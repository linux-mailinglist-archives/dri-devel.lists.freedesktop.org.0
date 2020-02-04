Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FE15191F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 11:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2C46E7D2;
	Tue,  4 Feb 2020 10:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAD26E7D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 10:59:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g195so17383922qke.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OkYuSAHSvR9IiWlcEsrQapzeBiIfaoP2obtZIjgXQhs=;
 b=rITuRlnU5/24sQNwIAAIdWCPBPPBD353FYTZvrULxlwi2ajLaJpHIUmUjtLGA4NvOs
 Vw0gnzxypm5dmKpNeYwo9Jr6qEc/iPregoYplOyR8itbWunGqVIzzFqeAClewPy/eJcI
 pOFpyvvCPqg2QPnaMa1baSZ4Epw9tMeEFv4pHP2tb1behBX1096LA6gMrDoL5XeOGa4A
 wK7wwwp0b3LKC8aub/4AljYlboky34EsIRUjoNs1FF+E09Wfqb+ajh8k8vSd8E1UpTt0
 AGTBrMXe9IWJxZWinTXd5Lk72BZl5qU0BqZiYnxcapLmPdJwY5/EvEVEnhuEaZDyxYOY
 ijuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OkYuSAHSvR9IiWlcEsrQapzeBiIfaoP2obtZIjgXQhs=;
 b=ZFKhc3cHvhe9xPVb1EKQR40EOFuedl1ROA1XGhAmeshKzw3H3GXdJBXEdIgDFL/roq
 41ucSGALZukd3Ex7HR4iG7hRZyX01oU2mRzlSJ3alLu8eyGZnmEcTJEf2vWPa+SLimn4
 zhltJkrkbGtOdjGfVAnDBGAngEQ6ATnkYhg4uKl7ggoKjzViA5JvhJ7Og6kbBlJW00df
 yzRfmQFzfc9RbtIps7hEAReZg+JstulQ7m+QOYBypBVLDYtSjZQPvJtYC8VKu1U5XUWH
 vrNltqNSHDfbjOt2htEVQxKnjLmnynGG2F4NODQbNiKxJOmATsfi34yc+aPZ1EZrGvmV
 vzEQ==
X-Gm-Message-State: APjAAAX8dc0fhMfyLKBYHJLgH0fV3eE575h42LWV8vRR86mYcDwagURy
 qsjFv52xoHPs92BccHBN8KGFzipoNOrCDaCYwPkgXQ==
X-Google-Smtp-Source: APXvYqwW+VXZSsGTnbaiHcIw6633UG2ZmqWmA1RIngmVgnjon5IKG3UFUyO2ideE4wKuZmUV4TLy1aHR+b//QPX9+Qw=
X-Received: by 2002:a37:9c07:: with SMTP id f7mr28696197qke.103.1580813980425; 
 Tue, 04 Feb 2020 02:59:40 -0800 (PST)
MIME-Version: 1.0
References: <1579602245-7577-1-git-send-email-yannick.fertre@st.com>
 <1fd9adf5-873b-2b9d-fe22-278f2ea64746@st.com>
In-Reply-To: <1fd9adf5-873b-2b9d-fe22-278f2ea64746@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:59:29 +0100
Message-ID: <CA+M3ks45=r+gQ9bHaiaNObVFBA07XyDm=gPrwSq7o9EHdhVz5g@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: dsi: stm mipi dsi doesn't print error on probe
 deferral
To: Philippe CORNU <philippe.cornu@st.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjU0LCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFycyBZYW5uaWNrICYgRXRpZW5uZSwKPiBU
aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsCj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUg
PHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KPgo+IFBoaWxpcHBlIDotKQo+Cj4gT24gMS8yMS8yMCAx
MToyNCBBTSwgWWFubmljayBGZXJ0cmUgd3JvdGU6Cj4gPiBGcm9tOiBFdGllbm5lIENhcnJpZXJl
IDxldGllbm5lLmNhcnJpZXJlQHN0LmNvbT4KPiA+Cj4gPiBDaGFuZ2UgRFNJIGRyaXZlciB0byBu
b3QgcHJpbnQgYW4gZXJyb3IgdHJhY2Ugd2hlbiBwcm9iZQo+ID4gaXMgZGVmZXJyZWQgZm9yIGEg
Y2xvY2sgcmVzb3VyY2UuCgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQ/ClRoYW5rcywKQmVuamFt
aW4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJy
aWVyZUBzdC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2Rz
aS1zdG0uYyB8IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4g
PiBpbmRleCA0YjE2NTYzLi4yZTFmMjY2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19t
aXBpX2RzaS1zdG0uYwo+ID4gQEAgLTM3Nyw3ICszNzcsOSBAQCBzdGF0aWMgaW50IGR3X21pcGlf
ZHNpX3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgZHNp
LT5wbGxyZWZfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInJlZiIpOwo+ID4gICAgICAgaWYgKElT
X0VSUihkc2ktPnBsbHJlZl9jbGspKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIo
ZHNpLT5wbGxyZWZfY2xrKTsKPiA+IC0gICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8g
Z2V0IHBsbCByZWZlcmVuY2UgY2xvY2s6ICVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICBp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX0VS
Uk9SKCJVbmFibGUgdG8gZ2V0IHBsbCByZWZlcmVuY2UgY2xvY2s6ICVkXG4iLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQpOwo+ID4gICAgICAgICAgICAgICBnb3RvIGVy
cl9jbGtfZ2V0Owo+ID4gICAgICAgfQo+ID4KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
