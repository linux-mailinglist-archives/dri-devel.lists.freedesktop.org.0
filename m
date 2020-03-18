Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D021893F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 03:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC06E1B1;
	Wed, 18 Mar 2020 02:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC256E1B1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 02:17:53 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id x5so6380115oic.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XU33WwkXD0BKNUHEBeawwcVOr7NO52b7Q9Wfl473unU=;
 b=Eri3E0pc00RVqx53R/HGK7DIWlYIeCFq9X9hhmYugYpj3BXDspzYH021PskOCK576g
 tzzh3/2dMPpMFSbHzmyAwoJNexW32vC9cyM0bu7sJ0RYOcbEIBbjl1V8kqnp6OUEm7tN
 ZS+fTuyiWHJNopNYxx3X21AfDg8EZt1OXcFimEye5KYcHopkdnOlQDSNY3SDGqePGsQ2
 nQBMcj4nJn52d4LoAD9LxnH2Ug7/tPmuw7Jco0EKmx3OgnG3wy89hwVK3pt2TQ7xvEwn
 /HkKDNaelKAZ67mtT4wA7F/kLwrsv2eK922LmcAuguIpZBO+VeyMTWRxvP8md/0vvK0r
 p++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XU33WwkXD0BKNUHEBeawwcVOr7NO52b7Q9Wfl473unU=;
 b=Krsmy/fnQyP7f1LyOVXnOsjFpVSPhXKnOTWaK0dv7VKOOvu6rV9g7bOtt+F1IvNRh1
 raKmypqwKauFUp8T8b6GoKx/hISn6o3Tmt4BOuNAdah1W7IBJO7v1IENI9ko4sn5xrKu
 rgeBjwCHckabTo5Kd5dVHSNnI901gPEWmCZPGpXmZj2kRF05+fgy9qL9s11rTD7XPGgV
 KxMLnLTV6f3m4FgxD5l+wQP8Qw9IiNrkbr43xbo5oyRVLJ3YSS5WSojY693vHQkUKqpT
 MUdxzJB+Y8SGTTUalXU1EKTiUB6NMqFp0JVOZe1fy3lgatZ4qyNzrMyf88BHXu7SAM4M
 LZGQ==
X-Gm-Message-State: ANhLgQ2OxWJUiaSpgUYs2knnPuqMeppFNSnjOgp+KNTrbVG8jV+XjFJ5
 KCg9gZjCED85gkVHoi/UDtNMa5mZzOMO3RwgDfE=
X-Google-Smtp-Source: ADFU+vuDta7z67KicNE0COfJQoW2Bh+5Qz71x/Iv2ZlzgKYwAzyvni/PHNYSIGFyNfrtXaEGft/iuWTUjt3sZla0yHc=
X-Received: by 2002:aca:f0d7:: with SMTP id o206mr1441237oih.41.1584497872923; 
 Tue, 17 Mar 2020 19:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
 <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
In-Reply-To: <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 18 Mar 2020 12:17:41 +1000
Message-ID: <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To: Inki Dae <inki.dae@samsung.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyB0byBjb250YWluIGEgZXh5bm9zIGRybSBmaXhlcyBiYWNrbWVyZ2UsIHBsZWFz
ZSBkb24ndCBkbwp0aGF0IHdpdGhvdXQgYSBoZWFkc3VwLgoKQ2FuIHlvdSBzZW5kIG9uZSB3aXRo
b3V0IHRoYXQgb3IgZG8geW91IG5lZWQgYSBmaXhlcyBiYWNrbWVyZ2UsIGlmIHNvCnBsZWFzZSBy
ZXF1ZXN0IG1lIHRvIGRvIHRoYXQgZmlyc3QsIHRoZW4gcmViYXNlIHRoaXMgYW5kIHNlbmQgaXQu
CgpEYXZlLgoKT24gTW9uLCAxNiBNYXIgMjAyMCBhdCAxMTowNCwgSW5raSBEYWUgPGlua2kuZGFl
QHNhbXN1bmcuY29tPiB3cm90ZToKPgo+ICAgICAgICAgSnVzdCB0d28gY2xlYW51cHMgLSBvbmUg
aXMgdG8gbWFzayBlbmNvZGVyIGJpdG1hc2sgdXNpbmcKPiAgICAgICAgIGRybV9lbmNvZGVyX21h
c2soKSwgYW5kIG90aGVyIGlzIHRvIHVzZSBtb2RlLT5jbG9jawo+ICAgICAgICAgaW5zdGVhZCBv
ZiBjYWxjdWxhdGluZyBpdCBhZ2Fpbi4KPgo+ICAgICAgICAgUGxlYXNlIGtpbmRseSBsZXQgbWUg
a25vdyBpZiB0aGVyZSBpcyBhbnkgcHJvYmxlbS4KPgo+IFRoYW5rcywKPiBJbmtpIERhZQo+Cj4g
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2OWRkY2UwOTcwZDlkMWRlNjNiZWQ5
YzI0ZWVmYTA4MTRkYjI5YTVhOgo+Cj4gICBNZXJnZSB0YWcgJ2FtZC1kcm0tbmV4dC01LjctMjAy
MC0wMy0xMCcgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggaW50
byBkcm0tbmV4dCAoMjAyMC0wMy0xMyAwOTowOToxMSArMTAwMCkKPgo+IGFyZSBhdmFpbGFibGUg
aW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9zIHRhZ3MvZXh5bm9zLWRybS1u
ZXh0LWZvci12NS43Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMGM5YTYwOWNh
NDQ0Mjk4ZTQzOGVlOWM2ZGFhZjUzYzE0Mjc3ZjFhZDoKPgo+ICAgZHJtL2V4eW5vczogVXNlIG1v
ZGUtPmNsb2NrIGluc3RlYWQgb2YgcmV2ZXJzZSBjYWxjdWxhdGluZyBpdCBmcm9tIHRoZSB2cmVm
cmVzaCAoMjAyMC0wMy0xNiAwOTo1MDoyOCArMDkwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBUd28gY2xlYW51
cHMKPiAuIFJlcGxhY2UgdGhlIGhhbmQgcm9sbGVkIGVuY29kZXIgYml0bWFzayB0aGluZyB3aXRo
IGRybV9lbmNvZGVyX21hc2soKQo+IC4gVXNlIG1vZGUtPmNsb2NrIGluc3RlYWQgb2YgcmV2ZXJz
ZSBjYWxjdWxhdGluZyBpdCBmcm9tIHRoZSB2cmVmcmVzaAo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IElua2kgRGFl
ICgxKToKPiAgICAgICBNZXJnZSB0YWcgJ2V4eW5vcy1kcm0tZml4ZXMtZm9yLXY1LjYtcmM1LXYy
JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy8uLi4vZGFlaW5raS9kcm0tZXh5bm9zIGludG8gZXh5
bm9zLWRybS1uZXh0Cj4KPiBNYXJlayBTenlwcm93c2tpICgxKToKPiAgICAgICBkcm0vZXh5bm9z
OiBGaXggY2xlYW51cCBvZiBJT01NVSByZWxhdGVkIG9iamVjdHMKPgo+IFZpbGxlIFN5cmrDpGzD
pCAoMik6Cj4gICAgICAgZHJtL2V4eW5vczogVXNlIGRybV9lbmNvZGVyX21hc2soKQo+ICAgICAg
IGRybS9leHlub3M6IFVzZSBtb2RlLT5jbG9jayBpbnN0ZWFkIG9mIHJldmVyc2UgY2FsY3VsYXRp
bmcgaXQgZnJvbSB0aGUgdnJlZnJlc2gKPgo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
czU0MzNfZHJtX2RlY29uLmMgfCAgNSArKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vczdfZHJtX2RlY29uLmMgICAgfCAgNyArKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kbWEuYyAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgICAgICAgfCAgNSAr
Ky0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmggICAgICAgfCAg
NiArKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyAgICAg
IHwgIDUgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyAg
ICAgIHwgIDUgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5j
ICAgICAgIHwgIDUgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dz
Yy5jICAgICAgIHwgIDUgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X3JvdGF0b3IuYyAgIHwgIDUgKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX3NjYWxlci5jICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX21peGVyLmMgICAgICAgICB8ICA3ICsrKysrLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNTYg
aW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
