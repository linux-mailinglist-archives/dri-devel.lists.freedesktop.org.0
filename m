Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BDAA9DE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 19:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D4F6E040;
	Thu,  5 Sep 2019 17:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2589178;
 Thu,  5 Sep 2019 17:21:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f19so3383501eds.12;
 Thu, 05 Sep 2019 10:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lukb3eP+CeEknZWAwQu/dY5fgrYVYVSG9EhQbpjgajU=;
 b=Kz5aPl8ysN1KRGgujC/LgQBYIdwfovtvQGsxc5337SeYj0PEvNI8gmHKOsORoMeqgr
 i17XGE6jrJoRmlNTSatwlQVqtk+LZw+iulzKHRMmB5IxjwqanLu9JZYp2WbW5aNrpWZw
 MN8BmjTb3JK+doj7cSe0vFpFC6ZAdI0Vp2m2IWe0V53EOnyPSq/P7cX/kBIMxOXBqkFA
 KTh4a97Kad8JAF98Q7uNH2F0Z8CEq4CWiH1nI38kefUI/eyHzgisLRO382QcDZwkN/Dn
 xmvlZeadU/yifprLzMyv4zma250s0RXkEl9nkzhfW7rHXAutEIc9DcF2JmPYcNJ5AOHA
 9P+w==
X-Gm-Message-State: APjAAAWT9oy2v4dnmA4Y8Nm86u04P+9lvMUwAyC/UgpXyDKMC8PS4XkK
 +UxXInxDEO4JPHt43E5lDHukkjxLHtbBKP0RNPw=
X-Google-Smtp-Source: APXvYqxhrTCAEPojNYYeJbGOdtXFzEiUAUUdPKfjwOIDCaBwBEoAAtyFgCpHdrIMfzF+uWWF29Wwgq3ZjOOB48o7F+Y=
X-Received: by 2002:a50:935d:: with SMTP id n29mr5106518eda.294.1567704064549; 
 Thu, 05 Sep 2019 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2019 10:20:53 -0700
Message-ID: <CAF6AEGvMa3JcoQeQzznjGbSdERnDPp39AT5rsF8QV1Ns9cBjaw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/atomic: Take the atomic toys away
 from X
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lukb3eP+CeEknZWAwQu/dY5fgrYVYVSG9EhQbpjgajU=;
 b=i29JUZLTG2ydbbvlXVgvnlgoY2XMDycS47cmCEs8pr0UyvlE/oXjNjVJWN+/Z3h9nl
 r2gSXM86H5aPHe/WXfXC8CAOH3FdaT4yXMORtpK9ET3U4ahlTQcWk/N8oguR5xLjlhjV
 qWbwPVXRk6mX7ubo8qnVUdHe/NpOui53CTYpOCl1jMjG03R6bYqTm/jEu/m0G0T3MiO4
 X7FAZR3L777FTpgR6/8s8pyNdauFdNf8Vr38MfUlP3vfYuXrlvRW2ucTAPSgbAFMfLOK
 JKrAlq+bAk7/4GGfSrGMp6LrDEmO4EM3NoNK5Aas3IFBmUgMAY2QAJlAeSWciu5xyMe7
 yGLg==
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAxMjowNyBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IFRoZSAtbW9kZXNldHRpbmcgZGR4IGhhcyBhIHRvdGFs
bHkgYnJva2VuIGlkZWEgb2YgaG93IGF0b21pYyB3b3JrczoKPiAtIGRvZXNuJ3QgZGlzYWJsZSBv
bGQgY29ubmVjdG9ycywgYXNzdW1pbmcgdGhleSBnZXQgYXV0by1kaXNhYmxlIGxpa2UKPiAgIHdp
dGggdGhlIGxlZ2FjeSBzZXRjcnRjCj4gLSBhc3N1bWVzIEFTWU5DX0ZMSVAgaXMgd2lyZWQgdGhy
b3VnaCBmb3IgdGhlIGF0b21pYyBpb2N0bAo+IC0gbm90IGEgc2luZ2xlIGNhbGwgdG8gVEVTVF9P
TkxZCj4KPiBJb3cgdGhlIGltcGxlbWVudGF0aW9uIGlzIGEgMToxIHRyYW5zbGF0aW9uIG9mIGxl
Z2FjeSBpb2N0bHMgdG8KPiBhdG9taWMsIHdoaWNoIGlzIGEpIGJyb2tlbiBiKSBwb2ludGxlc3Mu
Cj4KPiBXZSBhbHJlYWR5IGhhdmUgYnVncyBpbiBib3RoIGk5MTUgYW5kIGFtZGdwdS1EQyB3aGVy
ZSB0aGlzIHByZXZlbnRzIHVzCj4gZnJvbSBlbmFibGluZyBuZWF0IGZlYXR1cmVzLgo+Cj4gSWYg
YW55b25lIGV2ZXIgY2FyZXMgYWJvdXQgYXRvbWljIGluIFggd2UgY2FuIGVhc2lseSBhZGQgYSBu
ZXcgYXRvbWljCj4gbGV2ZWwgKHJlcS0+dmFsdWUgPT0gMikgZm9yIFggdG8gZ2V0IGJhY2sgdGhl
IHNoaW55IHRveXMuCj4KPiBTaW5jZSB0aGVzZSBicm9rZW4gdmVyc2lvbnMgb2YgLW1vZGVzZXR0
aW5nIGhhdmUgYmVlbiBzaGlwcGluZywKPiB0aGVyZSdzIHJlYWxseSBubyBvdGhlciB3YXkgdG8g
Z2V0IG91dCBvZiB0aGlzIGJpbmQuCj4KPiBSZWZlcmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcveG9yZy94c2VydmVyL2lzc3Vlcy82MjkKPiBSZWZlcmVuY2VzOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyL21lcmdlX3JlcXVlc3RzLzE4MAo+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pgo+IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KPiBDYzogQWRhbSBKYWNrc29uIDxhamF4QHJl
ZGhhdC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
aW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYwo+IGluZGV4IDJjMTIwYzU4Zjcy
ZC4uMWNiN2I0YzNjODdjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYwo+IEBAIC0zMzQsNiArMzM0LDkg
QEAgZHJtX3NldGNsaWVudGNhcChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKPiAgICAgICAgICAgICAgICAgZmlsZV9wcml2LT51
bml2ZXJzYWxfcGxhbmVzID0gcmVxLT52YWx1ZTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICBjYXNlIERSTV9DTElFTlRfQ0FQX0FUT01JQzoKPiArICAgICAgICAgICAgICAgLyog
VGhlIG1vZGVzZXR0aW5nIEREWCBoYXMgYSB0b3RhbGx5IGJyb2tlbiBpZGVhIG9mIGF0b21pYy4g
Ki8KPiArICAgICAgICAgICAgICAgaWYgKHN0cnN0cihjdXJyZW50LT5jb21tLCAiWCIpKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKClNlZW1zIGxpa2Ugd2Ug
Y2FuIGJlIGEgYml0IG1vcmUgdGFyZ2V0ZWQgdGhhbiAiYW55dGhpbmcgdGhhdCBoYXMgJ1gnCmlu
IHRoZSBuYW1lIi4uIGF0IGEgbWluaW11bSByZXN0cmljdCB0aGluZ3MgdG8gInN0YXJ0cyB3aXRo
ICdYJyIgc2VlbXMKc2FuZXIuICBCdXQgSSBndWVzcyB3ZSBjb3VsZCBwcm9iYWJseSBzb21laG93
IGxvb2sgYXQgdGhlIHByb2Nlc3NlcwptZW1vcnkgbWFwIGFuZCBsb29rIGZvciBtb2Rlc2V0dGlu
Z19kcnYuc28uCgpCUiwKLVIKCj4gICAgICAgICAgICAgICAgIGlmICghZHJtX2NvcmVfY2hlY2tf
ZmVhdHVyZShkZXYsIERSSVZFUl9BVE9NSUMpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU9QTk9UU1VQUDsKPiAgICAgICAgICAgICAgICAgaWYgKHJlcS0+dmFsdWUgPiAxKQo+
IC0tCj4gMi4yMy4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
