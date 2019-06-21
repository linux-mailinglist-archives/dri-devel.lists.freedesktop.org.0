Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CC4EA0B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6986E8C0;
	Fri, 21 Jun 2019 13:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4D56E8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:59:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 16so6030117ljv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+WQ5L7jyykHtcS1CaXqa3gfb+mYN5tnXeopjV9M8CY=;
 b=fLWSBdHyWkaj/vMcYr03aoKXsg6TJl/UuIx8hWxaLXpU10ANZ3xEV0HwZ2skJ3VRHy
 YgVasWcz8xLGxYBNtOfpm7G9cOdfLCMnMwVdEZFBRLxGJM9LXXGMIPfShlaNc9/3TaWX
 W/RAvYvu3wOqSmQh3N3B94BM2BML0wv8r/cigcfESty/1lNQSwv7wVJPJz7hSrmYdpjZ
 pMrsO63yD6/dYbnpSaDEuQ9slfm/emw8xmoVSm3DjNXn4U4RpvPTtGz6gQkPy3ASX/Mc
 BiaIDpMxwo+jUFHPdceQGjW9l4L8cN7At7lyCiki/g0X9HOK2sKUPKv1uVFb0CORRJjK
 v9fQ==
X-Gm-Message-State: APjAAAVD4curM3HdX2ohk8JjxxY9yRBbm/OqT0ESD73viXaSLC2v00k+
 /B3SVLUpupge6geJJQ0epUsUMi4wHKVZi/ZkQsY=
X-Google-Smtp-Source: APXvYqyt8yBta8bXLwF3TPCIh4vXPw+1C+YH2PaA7n6MW+n+xOcCd+FZKm8ynnqW0f6tzdYQjTVqYzRna3Q4v+GilBY=
X-Received: by 2002:a2e:8650:: with SMTP id i16mr24502679ljj.178.1561125542140; 
 Fri, 21 Jun 2019 06:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-3-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1561037428-13855-3-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Jun 2019 10:59:19 -0300
Message-ID: <CAOMZO5DS2v15h9E=qKg2vKuFkBSQQwdBHA5Th5mZ+ca6DWgQsw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z+WQ5L7jyykHtcS1CaXqa3gfb+mYN5tnXeopjV9M8CY=;
 b=vgUpFjpv5ZZqrSFc78/TAZwdLTsExKEeFmU93mFN3yiJ8vozEvyCLfce/BIT0sk3ZX
 fb4W7rysGrty4ceatf35AHHNPaGDJFsZ+s83f2WToV9Gko+fe3U/fFpD74uHYCMF5r1p
 U+PfUIRAfCvp/0fY+a3BaBCvBdc+PHZkf9tAE4CCg6Cu96fcJsnwYsDZZoBpm2fxNRAW
 wIfA5hq/bmruwJ9X1f21bZr8wmLeT30ZRXo5VIficsOnI9KiLr8CQTH/co8nhFGLLZZH
 131Fl6emwOwazlwG66O/kw9N+SRT7zxvRT6nHm8ltg2by4h8KD6j2/uX14T3jGjNwop4
 b+pQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTA6MzEgQU0gUm9iZXJ0IENoaXJh
cyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKCj4gK2ZhaWw6Cj4gKyAgICAgICBpZiAo
cmFkLT5yZXNldCkKPiArICAgICAgICAgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHJh
ZC0+cmVzZXQsIDEpOwoKZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKCkgY2FuIGhhbmRsZSBOVUxM
LCBzbyBubyBuZWVkIGZvciB0aGUgaWYoKSBjaGVjay4KCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGlzcGxheV90aW1pbmcgcmFkX2RlZmF1bHRfdGltaW5nID0gewo+ICsgICAgICAgLnBpeGVsY2xv
Y2sgPSB7IDEzMjAwMDAwMCwgMTMyMDAwMDAwLCAxMzIwMDAwMDAgfSwKCkhhdmluZyB0aGUgc2Ft
ZSBpbmZvcm1hdGlvbiBsaXN0ZWQgdGhyZWUgdGltZXMgZG9lcyBub3Qgc2VlbSB1c2VmdWwuCgpZ
b3UgY291bGQgdXNlIGEgZHJtX2Rpc3BsYXlfbW9kZSBzdHJ1Y3R1cmUgd2l0aCBhIHNpbmdsZSBl
bnRyeSBpbnN0ZWFkLgoKPiArICAgICAgIHZpZGVvbW9kZV9mcm9tX3RpbWluZygmcmFkX2RlZmF1
bHRfdGltaW5nLCAmcGFuZWwtPnZtKTsKPiArCj4gKyAgICAgICBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihucCwgIndpZHRoLW1tIiwgJnBhbmVsLT53aWR0aF9tbSk7Cj4gKyAgICAgICBvZl9wcm9wZXJ0
eV9yZWFkX3UzMihucCwgImhlaWdodC1tbSIsICZwYW5lbC0+aGVpZ2h0X21tKTsKPiArCj4gKyAg
ICAgICBwYW5lbC0+cmVzZXQgPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX09V
VF9MT1cpOwoKU2luY2UgdGhpcyBpcyBvcHRpb25hbCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNl
CmRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkgaW5zdGVhZC4KCgo+ICsKPiArICAgICAgIGlmIChJ
U19FUlIocGFuZWwtPnJlc2V0KSkKPiArICAgICAgICAgICAgICAgcGFuZWwtPnJlc2V0ID0gTlVM
TDsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNs
ZWVwKHBhbmVsLT5yZXNldCwgMSk7CgpUaGlzIGlzIG5vdCBoYW5kbGluZyBkZWZlciBwcm9iaW5n
LCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZG8gbGlrZSB0aGlzOgoKcGFuZWwtPnJlc2V0ID0g
ZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfTE9XKTsKaWYg
KElTX0VSUihwYW5lbC0+cmVzZXQpKQogICAgICByZXR1cm4gIFBUUl9FUlIocGFuZWwtPnJlc2V0
KTsKCj4gKyAgICAgICBtZW1zZXQoJmJsX3Byb3BzLCAwLCBzaXplb2YoYmxfcHJvcHMpKTsKPiAr
ICAgICAgIGJsX3Byb3BzLnR5cGUgPSBCQUNLTElHSFRfUkFXOwo+ICsgICAgICAgYmxfcHJvcHMu
YnJpZ2h0bmVzcyA9IDI1NTsKPiArICAgICAgIGJsX3Byb3BzLm1heF9icmlnaHRuZXNzID0gMjU1
Owo+ICsKPiArICAgICAgIHBhbmVsLT5iYWNrbGlnaHQgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2Vf
cmVnaXN0ZXIoZGV2LCBkZXZfbmFtZShkZXYpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYsIGRzaSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJhZF9ibF9vcHMs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZibF9wcm9wcyk7CgpDb3VsZCB5b3UgcHV0IG1vcmUgcGFyYW1ldGVycyBpbnRvIHRoZSBz
YW1lIGxpbmU/CgpVc2luZyA0IGxpbmVzIHNlZW1zIGV4Y2Vzc2l2ZS4KCj4gKyAgICAgICBpZiAo
SVNfRVJSKHBhbmVsLT5iYWNrbGlnaHQpKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9F
UlIocGFuZWwtPmJhY2tsaWdodCk7Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodCAoJWQpXG4iLCByZXQpOwo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGRybV9wYW5lbF9pbml0KCZw
YW5lbC0+cGFuZWwpOwo+ICsgICAgICAgcGFuZWwtPnBhbmVsLmZ1bmNzID0gJnJhZF9wYW5lbF9m
dW5jczsKPiArICAgICAgIHBhbmVsLT5wYW5lbC5kZXYgPSBkZXY7Cj4gKyAgICAgICBkZXZfc2V0
X2RydmRhdGEoZGV2LCBwYW5lbCk7Cj4gKwo+ICsgICAgICAgcmV0ID0gZHJtX3BhbmVsX2FkZCgm
cGFuZWwtPnBhbmVsKTsKPiArCgpVbm5lZWRlZCBibGFuayBsaW5lCgo+ICsgICAgICAgaWYgKHJl
dCA8IDApCj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgcmV0ID0g
bWlwaV9kc2lfYXR0YWNoKGRzaSk7Cj4gKyAgICAgICBpZiAocmV0IDwgMCkKPiArICAgICAgICAg
ICAgICAgZHJtX3BhbmVsX3JlbW92ZSgmcGFuZWwtPnBhbmVsKTsKPiArCj4gKyAgICAgICByZXR1
cm4gcmV0OwoKWW91IGRpZCBub3QgaGFuZGxlIHRoZSAicG93ZXIiIHJlZ3VsYXRvci4KCj4gK3N0
YXRpYyBpbnQgX19tYXliZV91bnVzZWQgcmFkX3BhbmVsX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgcmFkX3BhbmVsICpyYWQgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKPiArCj4gKyAgICAgICBpZiAoIXJhZC0+cmVzZXQpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ICsKPiArICAgICAgIGRldm1fZ3Bpb2RfcHV0KGRldiwgcmFkLT5yZXNldCk7
Cj4gKyAgICAgICByYWQtPnJlc2V0ID0gTlVMTDsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiAr
fQo+ICsKPiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCByYWRfcGFuZWxfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPiArewo+ICsgICAgICAgc3RydWN0IHJhZF9wYW5lbCAqcmFkID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICsgICAgICAgaWYgKHJhZC0+cmVzZXQpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIHJhZC0+cmVzZXQgPSBkZXZtX2dwaW9k
X2dldChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9MT1cpOwoKV2h5IGRvIHlvdSBjYWxsIGRldm1f
Z3Bpb2RfZ2V0KCkgb25jZSBhZ2Fpbj8KCkkgYW0gaGF2aW5nIGEgaGFyZCB0aW1lIHRvIHVuZGVy
c3RhbmQgdGhlIG5lZWQgZm9yIHRoaXMgc3VzcGVuZC9yZXN1bWUgaG9va3MuCgpDYW4ndCB5b3Ug
c2ltcGx5IHJlbW92ZSB0aGVtPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
