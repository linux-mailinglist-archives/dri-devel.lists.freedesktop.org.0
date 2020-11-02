Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB102A34CC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245976E301;
	Mon,  2 Nov 2020 20:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05586E301
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 20:01:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 33so5240784wrl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UaIVXRVMwWevb46eUxCvLQO+RJs04UBt25L/wyPmUSM=;
 b=WP9LCtpdPuBBup77TRDDScDei6afrhW/bNBVADolXgMkKNVUgsnGJYJdhytGoxcJj/
 n7Otqv7mre+XqJaKJEwb/pkBemQkdO6SgaROj6SavNrGZe6sO5AoixxyYGQOZQcqoC2d
 gokWdhxYNtU/50dnKxBv2PhIIxrRVI1OICesa2rEw3XPHThOQRbOp4LVI3k1mSNesmmz
 fRq8VgN0X4H7r2NRgCOPoVh7V/5fOq2RdSFJTy0SWVBz/z7bTTK+27A4lBXkyZbYUzMN
 Fu//1qahNma2TyerOUHv/orYm2ql+UOuVlOYDd3O0CYz9prmnJzs338LvWU/SB2pK9cs
 hsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=UaIVXRVMwWevb46eUxCvLQO+RJs04UBt25L/wyPmUSM=;
 b=S3Cum5GwctzlUuEjTHPz2k+7VHKsDib1D2Pbp6s0oNDHTVy0pav2LvwowNyKjdS/mw
 bh2lXg73aHBBe9OR/My6ZftkfKzuzmfZNfr+Bq+tuoH3+6RgqYPUNVxXxQ+BAZVgaFZn
 32EN42N9XObEbnlHSAxUg6yR+2sNw93z6SwHjyyQgPn/8KqWGhsR/ooodLmKFjzOkI+E
 snl/ussJaZmioFYAFAOk962SMKxcaPikndoonCggIZjvXK2cBrNgs9trqTXB+i2wNnGg
 qtjr0kFkVXg0j9Xb2E3xT2DeNzUU+4qkUZBeYaR2A2mj1H8hM26oePmQ8278FZx14SlS
 iYqg==
X-Gm-Message-State: AOAM532IB9QlvpRvoC/0sJBJQBN/WgYsnJv4v6IKa1v5SvSb8IesCIeL
 dc1SuAB7AJDkcBd+97mMACIWvPKw1Ig=
X-Google-Smtp-Source: ABdhPJwA3VzPEITrimXo++LDqjlUkPbubBkQKWFbFUEYSp0nET/0Iz1wyObG30kVHp/D8KkOX2Li+g==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr22716699wru.92.1604347301542; 
 Mon, 02 Nov 2020 12:01:41 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f23sm474486wmb.43.2020.11.02.12.01.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 12:01:40 -0800 (PST)
Subject: Re: [PATCH] drm/nouveu: fix swiotlb include
To: Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
References: <20201030111301.13458-1-christian.koenig@amd.com>
 <CAKMK7uG5_duB_gA2_wce5g_tRo7c+4nbwYTen=NMRsby4ZCXMA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <47f6660f-8167-02a9-1e99-93afd54e7bf0@gmail.com>
Date: Mon, 2 Nov 2020 21:01:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG5_duB_gA2_wce5g_tRo7c+4nbwYTen=NMRsby4ZCXMA@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMTEuMjAgdW0gMTE6MzIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgT2N0
IDMwLCAyMDIwIGF0IDEyOjEzIFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBUaGUgY2hlY2sgZm9yIHN3aW90bGIgaGFzIG1v
dmVkIHRvIG5vdXZldV90dG0uYywgYnV0IHdlIGZvcmdvdCB0byBtb3ZlCj4+IHRoZSBpbmNsdWRl
IGFzIHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBTbyB0aGlzIG5vdyBicm9rZSBkcm0tbWlzYy1uZXh0IGNvbXBp
bGF0aW9uIG9uIGFybSwgd2hpY2ggaXNuJ3QgZ3JlYXQuCj4gUGxlYXNlIG1ha2Ugc3VyZSB5b3Ug
Y29tcGlsZSB0ZXN0IHN0dWZmIGJlZm9yZSBwdXNoaW5nLgoKV2VsbCwgSSBkaWQgY29tcGlsZSB0
ZXN0ZWQgaXQgb24geDg2XzY0IGJlZm9yZSBwdXNoaW5nIGFuZCBhbGwgbG9va2VkIHdlbGwuCgo+
IFNpbmNlIHRoZSBwcm9wZXIgZml4IGlzIG1heWJlIHN0dWNrIGluIHRoZSB1c3VhbCAiZHJtIGFi
dXNlcyBzd2lvdGxiCj4gaW50ZXJuYWxzIiBiaWtlc2hlZCwgbWF5YmUgYmVzdCBpZiB3ZSBwdXNo
IGEgZml4IHRvIGluY2x1ZGluZyBsaW1pdHMuaAo+IGluIG5vdXZlYXUgYW5kIGNhbGwgaXQgZG9u
ZT8gQWxzbyBhZGRpbmcgTWF4aW1lLCB3aG8ncyB0cnlpbmcgdG8gZ2V0Cj4gdGhlIGJhY2ttZXJn
ZSB0aHJvdWdoIHJpZ2h0IG5vdy4KClllYWgsIHRoYXQgaXMgcHJvYmFibHkgdGhlIGJlc3QgYXBw
cm9hY2guIEkgZGlkbid0IHJlYWxpemVkIHRoYXQgdGhlIAppbmNsdWRlIG9mIGxpbWl0LmggbmVl
ZHMgdG8gbW92ZSBhcyB3ZWxsLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPj4g
LS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICB8IDEgLQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMgfCAzICsrKwo+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gaW5kZXggNzQ2YzA2ZWQxOTViLi44MTMzMzc3ZDg2
NWQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gQEAgLTI4LDcg
KzI4LDYgQEAKPj4gICAgKi8KPj4KPj4gICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4K
Pj4gLSNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+Cj4+Cj4+ICAgI2luY2x1ZGUgIm5vdXZlYXVf
ZHJ2LmgiCj4+ICAgI2luY2x1ZGUgIm5vdXZlYXVfY2hhbi5oIgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfdHRtLmMKPj4gaW5kZXggZDY5NmQ4ODJjOWViLi4yYmYzNjIyOWRkNTcgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+PiBAQCAtMjIsNiArMjIs
OSBAQAo+PiAgICAqIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUKPj4gICAgKiBVU0UgT1IgT1RIRVIgREVBTElO
R1MgSU4gVEhFIFNPRlRXQVJFLgo+PiAgICAqLwo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvc3dp
b3RsYi5oPgo+PiArCj4+ICAgI2luY2x1ZGUgIm5vdXZlYXVfZHJ2LmgiCj4+ICAgI2luY2x1ZGUg
Im5vdXZlYXVfZ2VtLmgiCj4+ICAgI2luY2x1ZGUgIm5vdXZlYXVfbWVtLmgiCj4+IC0tCj4+IDIu
MTcuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
