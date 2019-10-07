Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F9CE93D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57D16E22A;
	Mon,  7 Oct 2019 16:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A022B6E22A;
 Mon,  7 Oct 2019 16:30:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m18so162138wmc.1;
 Mon, 07 Oct 2019 09:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JvJ3PfJ+p6jBSzSy2TDmj0xCxcaMiVBdzdXftupnGY=;
 b=JncNmI5Wl8Y0Latbe+hMulQJ1+e7Uf93PB42PBz3hBpTIdoS8dmsx+Qm1aEWpT8pyd
 BR7iRKqCpSb7hcWAE6B8wvktrrKSkankBMM7A0e50FIuPMe2YxAGplE1t9/SUkH7doly
 JQY33uLPGla0WEXW5cfSrmIUJ+WSm1Z2Wo3FRCNFe9a40Ux5SJjHC0TmNm6KFaFywITU
 1Z5h/MiEoZnbgKtSBW2Ezvm+/12Fjw2Y8H7deO0B23T24ojLMAP4ARaiYQNBtP/cjf+P
 GfTRKkTarNNLFC1mcq0d+XALWl8bRnQy39lOzPHsSd6ovwonKbDAbSLhUH+7IWd14Bxj
 RRvA==
X-Gm-Message-State: APjAAAXtQWMK8k/oi2az93tXMM3DtYYUpG6MBAtXhLB7sQAZngt8hjHD
 vGbcb2Rwv9KhC4bdfFps9rWQx3fjHc83YNMMxzOUow==
X-Google-Smtp-Source: APXvYqyH2d0GgePOwaEp5KTgrIp/WdeRGQqGVV4V90yRxCNENZ4zD2hlbXMq23JlCxHf6frJxzH24RhD+an675EQgCo=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr83023wmb.127.1570465854163;
 Mon, 07 Oct 2019 09:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191007085210.GC3865@mwanda>
In-Reply-To: <20191007085210.GC3865@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:30:41 -0400
Message-ID: <CADnq5_NHDwYhF+Z7Kn6a4=qp9S9==7hSjKWQWwsJT9SPTdfePg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix a && vs || typo
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5JvJ3PfJ+p6jBSzSy2TDmj0xCxcaMiVBdzdXftupnGY=;
 b=iK/2afJmOoTLjgJMkkMngZRuA+iSA4W1OpmBaxAyHq66/7ptnvGL/Vl2C3xCatRQIl
 eCU/e3NtIQspPY34AdL1OG0asLTWzvMgE0aqHyj1AStQS3yBeQf90BUXKfq/CHdxPGtq
 4vVcybPorC/FjWlDw0jbXHVQNrMzeso84KeBAcisT01ApgrHUUc9C0qv5zP2bMNdL/NL
 E6XA8OwlWOp58BRFAnk/HxoEkE7ZOVC03dOEgh3QZPpXRiFtW+13zJc5HYQrEX7GkAc6
 IKyv3Gsma0UcupZ8NBT5EfJ/F+agbLQX4KxIJXpyctPdYo5d4ZtdMRXZb57CxTp2Mv41
 xIMQ==
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
Cc: Yong Zhao <Yong.Zhao@amd.com>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCA0OjUyIEFNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgY3VycmVudCBjb2RlIGlmICJkZXZpY2Vf
aW5mbyIgaXMgZXZlciBOVUxMIHRoZW4gdGhlIGtlcm5lbCB3aWxsCj4gT29wcyBzbyBwcm9iYWJs
eSB8fCB3YXMgaW50ZW5kZWQgaW5zdGVhZCBvZiAmJi4KPgo+IEZpeGVzOiBlMzkyYzg4N2RmOTcg
KCJkcm0vYW1ka2ZkOiBVc2UgYXJyYXkgdG8gcHJvYmUga2ZkMmtnZF9jYWxscyIpCj4gU2lnbmVk
LW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKQXBwbGll
ZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gaW5k
ZXggMGRiMjczNTg3YWY0Li4wNzBjOWI1NTkzYzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jCj4gQEAgLTQ5OCw3ICs0OTgsNyBAQCBzdHJ1Y3Qga2ZkX2RldiAq
a2dkMmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+ICAgICAgICAgZGV2aWNlX2luZm8g
PSBrZmRfc3VwcG9ydGVkX2RldmljZXNbYXNpY190eXBlXVt2Zl07Cj4gICAgICAgICBmMmcgPSBr
ZmQya2dkX2Z1bmNzW2FzaWNfdHlwZV07Cj4KPiAtICAgICAgIGlmICghZGV2aWNlX2luZm8gJiYg
IWYyZykgewo+ICsgICAgICAgaWYgKCFkZXZpY2VfaW5mbyB8fCAhZjJnKSB7Cj4gICAgICAgICAg
ICAgICAgIGRldl9lcnIoa2ZkX2RldmljZSwgIiVzICVzIG5vdCBzdXBwb3J0ZWQgaW4ga2ZkXG4i
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9hc2ljX25hbWVbYXNpY190eXBlXSwg
dmYgPyAiVkYiIDogIiIpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiAtLQo+IDIu
MjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
