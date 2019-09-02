Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E4A576E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FDD8991A;
	Mon,  2 Sep 2019 13:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412C8991A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:11:34 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j15so15479271qtl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 06:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PZv22NgyAy4cpGO8nvyQHGric91X1UzIHSt4+HMcQy0=;
 b=tw1zG2cBunkXokZQRVZIcTv/Ktu0gyrPPdqdK8o1Hc/xX6KYY+6LhEloIVYxdnbymK
 85Zy7Xm4Wnt5LWp50ZXKS01BYFBaBV2YHfrSlbgtNtMHFDWIN2CWUBGz2TkbmA6pywnM
 G5twt+ho4dtQEMt3avhlW/Pc1Ppp1UYP7YZWuFziXLcehtuwQHC7Q1IRWPKv49Ii3QQM
 pkKuLE2Iv+koZGijha4jQSixjGBsNAQLMLQY0cyVEzmRBf+Lw+rcZYZ/mLHPMU1KmS9E
 1kpUpT0AgjvSBM1bnIJo73XlfQRBVQx8fxIiDuNOyPcA5lboHlm3B7qsuuzJfbz4k3h0
 BbZA==
X-Gm-Message-State: APjAAAU1v2iIjMkc5ncsERiyDqlAsZYwklu0EGdW/W5I9ZSA3/dq5Wzu
 p3uDEzUvyeBG0gQMqlbbVpx2EOtmnLj+uQhReISNrQ==
X-Google-Smtp-Source: APXvYqxEna7P0g0Bcyf5yaueoracYZLNFgddoZxTQyK2mxM0F5w6o3XIUtpvDIp7islXuRjcdOl+JjDzPJJdEmQZDWQ=
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr24868461qtm.250.1567429893126; 
 Mon, 02 Sep 2019 06:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-7-darekm@google.com>
 <00515839-a4bd-6721-8563-a16fbbaa7159@xs4all.nl>
In-Reply-To: <00515839-a4bd-6721-8563-a16fbbaa7159@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 2 Sep 2019 15:11:22 +0200
Message-ID: <CA+M3ks6zkg9nh39tLr-fzHR8_UJeaxADTM9yeRSECtkyBuUbFw@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] drm: sti: use cec_notifier_conn_(un)register
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PZv22NgyAy4cpGO8nvyQHGric91X1UzIHSt4+HMcQy0=;
 b=VfyOjtZ8aWgjvf651FHyhOAmwULu+NSuKIFmWFDbTRWli+KD2QjI1GYeqiw61Zjm2m
 7aaaBlmkKkRFGyH+0e/2tfli/Lzx3ClE2/e2G5QLJQYnubJJ3JYzZLvgyXXSK4+1L+EE
 Z7LbQ3jZDzcbqs+UdWR7g5QpEcTndIQMh46gYQkp6+SayViDEjVz6qOCIWbXrzCYf9qd
 7mQnrP/NU6T4dEn9pN39cR1iiOpk8+HPk9FvMT4BxOIGOTrnmYFYwqdtsOMeIh+WZXQZ
 YbLPKeJAaT7hmIolpfVwwIm0YOCT6huuORR8Dat7ZQQzEFC7TrlK3q7zqruDx4uHmJk/
 oj0w==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Vincent Abriou <vincent.abriou@st.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAyMiBhb8O7dCAyMDE5IMOgIDEwOjExLCBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNp
c2NvQHhzNGFsbC5ubD4gYSDDqWNyaXQgOgo+Cj4gQWRkaW5nIEJlbmphbWluIEdhaWduYXJkLgo+
Cj4gQmVuamFtaW4sIGNhbiB5b3UgdGFrZSBhIGxvb2sgYXQgdGhpcyBhbmQgQWNrIGl0IChvciBt
ZXJnZSBpdCBpZiB5b3UgcHJlZmVyKSBhbmQKPiBpZGVhbGx5IHRlc3QgaXQgYXMgd2VsbC4gVGhp
cyBpcyB0aGUgb25seSBwYXRjaCBpbiB0aGlzIHNlcmllcyB0aGF0IEkgY291bGQgbm90Cj4gdGVz
dCBzaW5jZSBJIGRvbid0IGhhdmUgYW55IGhhcmR3YXJlLgoKTG9va3MgZ29vZCBmb3IgbWUuCgpB
cHBsaWVkIG9uIGRybS1taXNjLW5leHQsClRoYW5rcywKQmVuamFtaW4KCj4KPiBSZWdhcmRzLAo+
Cj4gICAgICAgICBIYW5zCj4KPiBPbiA4LzE0LzE5IDEyOjQ1IFBNLCBEYXJpdXN6IE1hcmNpbmtp
ZXdpY3ogd3JvdGU6Cj4gPiBVc2UgdGhlIG5ldyBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0
ZXIoKSBmdW5jdGlvbnMgdG8KPiA+ICh1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBI
RE1JIGNvbm5lY3RvciwgYW5kIGZpbGwKPiA+IGluIHRoZSBjZWNfY29ubmVjdG9yX2luZm8uCj4g
Pgo+ID4gQ2hhbmdlcyBzaW5jZSB2MjoKPiA+ICAgICAgIERvbid0IGludmFsaWRhdGUgcGh5c2lj
YWwgYWRkcmVzcyBiZWZvcmUgdW5yZWdpc3RlcmluZyB0aGUKPiA+ICAgICAgIG5vdGlmaWVyLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2ds
ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCAxOSAr
KysrKysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdGkv
c3RpX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYwo+ID4gaW5kZXggOTg2
MmMzMjJmMGM0YS4uYmQxNTkwMmI4MjVhZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX2hkbWkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5j
Cj4gPiBAQCAtMTI1Niw2ICsxMjU2LDcgQEAgc3RhdGljIGludCBzdGlfaGRtaV9iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ID4gICAg
ICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkYXRhOwo+ID4gICAgICAgc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyOwo+ID4gICAgICAgc3RydWN0IHN0aV9oZG1pX2Nvbm5lY3RvciAq
Y29ubmVjdG9yOwo+ID4gKyAgICAgc3RydWN0IGNlY19jb25uZWN0b3JfaW5mbyBjb25uX2luZm87
Cj4gPiAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3RvcjsKPiA+ICAgICAg
IHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7Cj4gPiAgICAgICBpbnQgZXJyOwo+ID4gQEAgLTEz
MTgsNiArMTMxOSwxNCBAQCBzdGF0aWMgaW50IHN0aV9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gPiAgICAgICAgICAgICAg
IGdvdG8gZXJyX3N5c2ZzOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIGNlY19maWxsX2Nvbm5f
aW5mb19mcm9tX2RybSgmY29ubl9pbmZvLCBkcm1fY29ubmVjdG9yKTsKPiA+ICsgICAgIGhkbWkt
Pm5vdGlmaWVyID0gY2VjX25vdGlmaWVyX2Nvbm5fcmVnaXN0ZXIoJmhkbWktPmRldiwgTlVMTCwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNv
bm5faW5mbyk7Cj4gPiArICAgICBpZiAoIWhkbWktPm5vdGlmaWVyKSB7Cj4gPiArICAgICAgICAg
ICAgIGhkbWktPmRybV9jb25uZWN0b3IgPSBOVUxMOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAgICAgIC8qIEVuYWJsZSBkZWZhdWx0IGlu
dGVycnVwdHMgKi8KPiA+ICAgICAgIGhkbWlfd3JpdGUoaGRtaSwgSERNSV9ERUZBVUxUX0lOVCwg
SERNSV9JTlRfRU4pOwo+ID4KPiA+IEBAIC0xMzMxLDYgKzEzNDAsOSBAQCBzdGF0aWMgaW50IHN0
aV9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZv
aWQgKmRhdGEpCj4gPiAgc3RhdGljIHZvaWQgc3RpX2hkbWlfdW5iaW5kKHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRh
KQo+ID4gIHsKPiA+ICsgICAgIHN0cnVjdCBzdGlfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+ID4gKwo+ID4gKyAgICAgY2VjX25vdGlmaWVyX2Nvbm5fdW5yZWdpc3RlcihoZG1p
LT5ub3RpZmllcik7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVu
dF9vcHMgc3RpX2hkbWlfb3BzID0gewo+ID4gQEAgLTE0MzYsMTAgKzE0NDgsNiBAQCBzdGF0aWMg
aW50IHN0aV9oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAg
ICAgICAgICAgIGdvdG8gcmVsZWFzZV9hZGFwdGVyOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAg
IGhkbWktPm5vdGlmaWVyID0gY2VjX25vdGlmaWVyX2dldCgmcGRldi0+ZGV2KTsKPiA+IC0gICAg
IGlmICghaGRtaS0+bm90aWZpZXIpCj4gPiAtICAgICAgICAgICAgIGdvdG8gcmVsZWFzZV9hZGFw
dGVyOwo+ID4gLQo+ID4gICAgICAgaGRtaS0+cmVzZXQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0
KGRldiwgImhkbWkiKTsKPiA+ICAgICAgIC8qIFRha2UgaGRtaSBvdXQgb2YgcmVzZXQgKi8KPiA+
ICAgICAgIGlmICghSVNfRVJSKGhkbWktPnJlc2V0KSkKPiA+IEBAIC0xNDU5LDE0ICsxNDY3LDEx
IEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IHN0aV9oZG1pICpoZG1pID0gZGV2X2dldF9kcnZk
YXRhKCZwZGV2LT5kZXYpOwo+ID4KPiA+IC0gICAgIGNlY19ub3RpZmllcl9zZXRfcGh5c19hZGRy
KGhkbWktPm5vdGlmaWVyLCBDRUNfUEhZU19BRERSX0lOVkFMSUQpOwo+ID4gLQo+ID4gICAgICAg
aTJjX3B1dF9hZGFwdGVyKGhkbWktPmRkY19hZGFwdCk7Cj4gPiAgICAgICBpZiAoaGRtaS0+YXVk
aW9fcGRldikKPiA+ICAgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoaGRt
aS0+YXVkaW9fcGRldik7Cj4gPiAgICAgICBjb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZzdGlf
aGRtaV9vcHMpOwo+ID4KPiA+IC0gICAgIGNlY19ub3RpZmllcl9wdXQoaGRtaS0+bm90aWZpZXIp
Owo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
