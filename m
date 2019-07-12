Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1967A81
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E1A6E3DD;
	Sat, 13 Jul 2019 14:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEBF89B18
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 18:49:17 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id ay6so5175310plb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 11:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRVC5IMZoa5o9Lk6/1pZnpghBb7QNpMZIqJdxQxjH40=;
 b=k9A1zsEE6Y2M+My31aT3q7WU238ux0IucJdTWDcpqK4AZ6g5GZ9HqV8eW4mHd7BdYa
 7kh4nAHoyEyHvgwEVCtfC3HnNnz3CWb/0I94HFvi6Vb1pIsXGd6BU/vTm118j7ZpKfVK
 qkcswq9++/h4xqsQ0yOPp1L5w0ojNSUU103cBoYaFeQIdksY9kjWFlwGrrXmyY/WaKEa
 LOpATZVmk8qK0OQS3rQL69hWQIrKzdpOxyGC/OvwkUR/7dT6KqnI+Y7nxE4wCqxMorRk
 ItKP6yW5zKCgVH1uvY8CZ3tkeHuwOnh9mMd/IZjVvYEYP/viPANfZ960LmWl5J4gzgAP
 O/1g==
X-Gm-Message-State: APjAAAWVsO3BWMX1eiBm+Q+KiTHpiN+PYwpdg/uj91Fd1P551CNDk0KC
 0YFi8cvN7Hzu+2irrjhLMA8mOtqcdwpAG224SkFMJg==
X-Google-Smtp-Source: APXvYqxBLbwppsbzxjlJ9R2+QpWY9Uc7vDpVh0ziWCRQc3SKPvW+WWR0k4LO6QLqnD1Ja2x1b0JF77dK64H4hN7TBAw=
X-Received: by 2002:a17:902:9f93:: with SMTP id
 g19mr13242312plq.223.1562957356404; 
 Fri, 12 Jul 2019 11:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190712093720.1461418-1-arnd@arndb.de>
In-Reply-To: <20190712093720.1461418-1-arnd@arndb.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 12 Jul 2019 11:49:05 -0700
Message-ID: <CAKwvOd=Xdp_=G3UU9ubayeTvkKCJ9hak0a-7yK90-RPUBQKrpw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Support clang option for stack alignment
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MRVC5IMZoa5o9Lk6/1pZnpghBb7QNpMZIqJdxQxjH40=;
 b=PShQDYtfPEgQskYO6b88lcP+62BM211EGSGUonfZjCevTp6bMxwg8wiYIm73nchh4p
 1NhRTLriTnIWs5iTgUQ/JCZZ3yElVWunsKFQwXqdfCbyzDhdyoPqtOINHwE9cMrnlBVR
 vkrtq+g1VxQsdgQtI6/Ut/zOauwjdfhl1YOCQ270GqOWAjdnQdO+u4i0l4/Z6RNHWrKY
 UaJaqAbKqijc8Y2jQ5lsrum4KA46TAxTqA0x+d2vrSRelEtEIeCusL4gU+rVHZukUNtQ
 Qv7c/Mcy+lTG+97vgNxcGUzoPcHYfdPj3uSVzAilrB8ssmS+ylLiZAYzzMA8VMMBRMQV
 r0Pw==
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
Cc: Duke Du <Duke.Du@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Matthias Kaehlcke <mka@google.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMjozNyBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IEFzIHByZXZpb3VzbHkgZml4ZWQgZm9yIGRtbCBpbiBjb21taXQgNDc2
OTI3OGU1YzdmICgiYW1kZ3B1L2RjL2RtbDoKPiBTdXBwb3J0IGNsYW5nIG9wdGlvbiBmb3Igc3Rh
Y2sgYWxpZ25tZW50IikgYW5kIGNhbGNzIGluIGNvbW1pdAo+IGNjMzJhZDhmNTU5YyAoImFtZGdw
dS9kYy9jYWxjczogU3VwcG9ydCBjbGFuZyBvcHRpb24gZm9yIHN0YWNrCj4gYWxpZ25tZW50Iiks
IGRjbjIwIHVzZXMgYW4gb3B0aW9uIHRoYXQgaXMgbm90IGF2YWlsYWJsZSB3aXRoIGNsYW5nOgo+
Cj4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3VtZW50OiAnLW1wcmVmZXJyZWQtc3RhY2stYm91
bmRhcnk9NCcKPiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MTogcmVjaXBlIGZvciB0YXJnZXQg
J2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UubycgZmFpbGVkCj4KPiBVc2UgdGhlIHNhbWUgdHJpY2sgdGhhdCB3ZSBoYXZlIGluIHRo
ZSBvdGhlciB0d28gZmlsZXMuCgpNYXliZSB0aW1lIGZvciBhIG1hY3JvIGluIEtidWlsZC5pbmNs
dWRlIG9yIHNvbWUgc3VjaCwgaWYgd2Ugc2VlIHRoaXMKcGF0dGVybiBiZWluZyByZXBlYXRlZD8K
Cj4KPiBGaXhlczogN2VkNGU2MzUyYzE2ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMiBIVyBT
ZXF1ZW5jZXIgYW5kIFJlc291cmNlIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvTWFrZWZpbGUgfCAgOCArKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZHNjL01ha2VmaWxlICAgfCAxNiArKysrKysrKysrKystLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvTWFrZWZpbGUKPiBpbmRleCAxYjY4ZGUyN2JhNzQuLmU5
NzIxYTkwNjU5MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvTWFrZWZpbGUKPiBAQCAtMTAsNyArMTAsMTMgQEAgaWZkZWYgQ09ORklHX0RSTV9BTURfRENf
RFNDX1NVUFBPUlQKPiAgRENOMjAgKz0gZGNuMjBfZHNjLm8KPiAgZW5kaWYKPgo+IC1DRkxBR1Nf
ZGNuMjBfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2st
Ym91bmRhcnk9NAo+ICtpZm5lcSAoJChjYWxsIGNjLW9wdGlvbiwgLW1wcmVmZXJyZWQtc3RhY2st
Ym91bmRhcnk9NCksKQo+ICsgICAgICAgY2Nfc3RhY2tfYWxpZ24gOj0gLW1wcmVmZXJyZWQtc3Rh
Y2stYm91bmRhcnk9NAo+ICtlbHNlIGlmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXN0YWNrLWFs
aWdubWVudD0xNiksKQo+ICsgICAgICAgY2Nfc3RhY2tfYWxpZ24gOj0gLW1zdGFjay1hbGlnbm1l
bnQ9MTYKPiArZW5kaWYKPiArCj4gK0NGTEFHU19kY24yMF9yZXNvdXJjZS5vIDo9IC1taGFyZC1m
bG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+Cj4gIEFNRF9EQUxfRENOMjAgPSAkKGFkZHBy
ZWZpeCAkKEFNRERBTFBBVEgpL2RjL2RjbjIwLywkKERDTjIwKSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZQo+IGluZGV4IGM1ZDViOTRlMjYwNC4uZTAx
OWNkOTQ0N2U4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
c2MvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL01h
a2VmaWxlCj4gQEAgLTEsMTAgKzEsMTggQEAKPiAgIwo+ICAjIE1ha2VmaWxlIGZvciB0aGUgJ2Rz
Yycgc3ViLWNvbXBvbmVudCBvZiBEQUwuCj4KPiAtQ0ZMQUdTX3JjX2NhbGMubyA6PSAtbWhhcmQt
ZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NAo+IC1DRkxBR1NfcmNfY2Fs
Y19kcGkubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9
NAo+IC1DRkxBR1NfY29kZWNfbWFpbl9hbWQubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVm
ZXJyZWQtc3RhY2stYm91bmRhcnk9NAo+IC1DRkxBR1NfZGNfZHNjLm8gOj0gLW1oYXJkLWZsb2F0
IC1tc3NlIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQKPiAraWZuZXEgKCQoY2FsbCBjYy1v
cHRpb24sIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQpLCkKPiArICAgICAgIGNjX3N0YWNr
X2FsaWduIDo9IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQKPiArZWxzZSBpZm5lcSAoJChj
YWxsIGNjLW9wdGlvbiwgLW1zdGFjay1hbGlnbm1lbnQ9MTYpLCkKPiArICAgICAgIGNjX3N0YWNr
X2FsaWduIDo9IC1tc3RhY2stYWxpZ25tZW50PTE2Cj4gK2VuZGlmCj4gKwo+ICtkc2NfY2NmbGFn
cyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgJChjY19zdGFja19hbGlnbikKPiArCj4gK0NGTEFHU19y
Y19jYWxjLm8gOj0gJChkc2NfY2NmbGFncykKPiArQ0ZMQUdTX3JjX2NhbGNfZHBpLm8gOj0gJChk
c2NfY2NmbGFncykKPiArQ0ZMQUdTX2NvZGVjX21haW5fYW1kLm8gOj0gJChkc2NfY2NmbGFncykK
PiArQ0ZMQUdTX2RjX2RzYy5vIDo9ICQoZHNjX2NjZmxhZ3MpCi0tIApUaGFua3MsCn5OaWNrIERl
c2F1bG5pZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
