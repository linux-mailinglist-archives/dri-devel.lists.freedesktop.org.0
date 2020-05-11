Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C261CE794
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 23:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2364898EA;
	Mon, 11 May 2020 21:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7F8898EA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 21:38:21 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45E3B206D9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589233101;
 bh=APUZo3/WV2kNevqYRH+Ucvs6mDdyWHcwpHNg3vwKyOU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pn18pPp8UXY4ndHqotnJOcKP1kDx7QE1J+wDQJYsQt23EUy6qgZC0Gg3FgLhPBlcl
 iRK/PtNTPsmhEPjeGORmeHTjrwRbIKApllHw87Uh9uRGZm5ui2NWcp5yashNIivUWN
 DFTRNgAAhyw8csaMFbY81jtcJB6lMlkfvFZA6oHw=
Received: by mail-ot1-f47.google.com with SMTP id m33so8855724otc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 14:38:21 -0700 (PDT)
X-Gm-Message-State: AGi0PuZSVS2Cdgo2l5zYv8jhECa5VDo+k0DtCNPejMcAUS41OBaDxvGI
 LqOlyUB+Xe5mxCcMrO9RrJWo/8G3CqSnPsrffA==
X-Google-Smtp-Source: APiQypI3uLQdj5Wxc59CQ2x0CyttJaVUX2j5fQdC/RmLf4fuIfphK8YAvNw/nSvhyK/dMfDWzuFoiL2McIlbnZRpD3c=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr13404384otl.107.1589233100557; 
 Mon, 11 May 2020 14:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
In-Reply-To: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 May 2020 16:38:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+obuG_NxDXDKUe2f4v_YWjQQ3Y+zQVYt5emnJizVqSQ@mail.gmail.com>
Message-ID: <CAL_JsqK+obuG_NxDXDKUe2f4v_YWjQQ3Y+zQVYt5emnJizVqSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjQsIDIwMjAgYXQgNjoyNiBBTSBSaWNhcmRvIENhw7F1ZWxvCjxyaWNhcmRv
LmNhbnVlbG9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNvbnZlcnRzIHRoZSBEVCBi
aW5kaW5nIGZvciB0aGUgQW5hbG9naXggRFAgYnJpZGdlIHVzZWQgaW4KPiB0aGUgRXh5bm9zIDUg
YW5kIFJvY2tjaGlwIFJLMzI4OC9SSzMzOTkgU29DcyB0byB5YW1sLgo+Cj4gQ2hhbmdlcyBmcm9t
IHRoZSBvcmlnaW5hbCBiaW5kaW5nOgo+IC0gcGh5IGFuZCBwaHktbmFtZXMgYXJlbid0IGRlZmlu
ZWQgYXMgJ3JlcXVpcmVkJyAocmszMzk5LWV2Yi5kdHMgZG9lc24ndAo+ICAgZGVmaW5lIHRoZW0p
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9AY29s
bGFib3JhLmNvbT4KPiAtLS0KPiBUaGlzIGJpbmRpbmcgaXMgbWVhbnQgdG8gYmUgdXNlZCBpbiBj
b25qdW5jdGlvbiB3aXRoCj4gRG9jdW1lbnRhdGlvbi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlw
L2FuYWxvZ2l4X2RwLXJvY2tjaGlwLnR4dAo+IGFuZAo+IERvY3VtZW50YXRpb24vYmluZGluZ3Mv
ZGlzcGxheS9leHlub3MvZXh5bm9zX2RwLnR4dAo+Cj4gSSB3YXMgY2FyZWZ1bCB0byBkZWZpbmUg
dGhlIGJpbmRpbmdzIHRvIGJlIGZsZXhpYmxlIGVub3VnaCBmb3IgYm90aAo+IGNhc2VzLCBzaW5j
ZSB0aGUgcHJvcGVydGllcyBtaWdodCBiZSBzbGlnaHRseSBkaWZmZXJlbnQgZGVwZW5kaW5nCj4g
b24gdGhlIFNvQy4KPgo+IFRlc3RlZCB3aXRoCj4gbWFrZSBkdF9iaW5kaW5nX2NoZWNrIEFSQ0g9
YXJtNjQgRFRfU0NIRU1BX0ZJTEVTPTwuLi5hbmFsb2dpeF9kcC55YW1sPgo+IG1ha2UgZHRic19j
aGVjayBBUkNIPWFybTY0IERUX1NDSEVNQV9GSUxFUz08Li4uYW5hbG9naXhfZHAueWFtbD4KPgo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9naXhfZHAudHh0ICAgfCAgNTEgLS0t
LS0tLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnlhbWwgIHwg
MTIwICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyMCBpbnNlcnRpb25z
KCspLCA1MSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbmFsb2dpeF9kcC50eHQKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9hbmFsb2dpeF9kcC55YW1sCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW5hbG9n
aXhfZHAueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5h
MjlhNzlkOTJjNGIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnlhbWwKPiBAQCAtMCwwICsx
LDEyMCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2FuYWxvZ2l4X2RwLnlhbWwjCj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0
bGU6IEFuYWxvZ2l4IERpc3BsYXkgUG9ydCBicmlkZ2UgYmluZGluZ3MKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgoKQW5kIHRoaXMgZW1h
aWwgYWRkcmVzcyBib3VuY2VzLCBzbyBmaW5kIGEgbmV3IG1haW50YWluZXIuCgpSb2IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
