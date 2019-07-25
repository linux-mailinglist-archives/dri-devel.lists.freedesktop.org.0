Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1974B0C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79826E6BA;
	Thu, 25 Jul 2019 10:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297786E6BA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:05:44 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so35941673qkl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 03:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7MqY5TdYDukrmEcvyvH1Gy2JxiZVpxAfuPKcTJpAIOc=;
 b=NFqAXpBoxGFD7zCMlv1NwRrMPBYeuBKq+uu3zfDhmAHgAN+ssPcnGr/hTwUzN7bGnP
 T0a4DFycZfuVsIENbOFzXdTJENPI7hN32YtakYnd8uIPBNvddDoSzaD/ggDzRMFedRnq
 EYzrt6X19V/ntu+psKlbSVsa9oE3R3MNYALkERHaueO1ANc04mVVXW5s42WblnyifgdC
 fXzNMIFJNhuIzqYN0Q/2oyK1IDRHocntt/N7IyhMKaNGZJm91m75Nf+JOoVYnXMS+jk/
 8P9pGBbQU+2ylPPXZu531SJqAz++n04Amnzom2za6yxcE9WHqmw8UcDTkbK7oJ4h360P
 kbpg==
X-Gm-Message-State: APjAAAXTdy89oLa5EQo5ZgZ/NPikjErA6GvpsDrcyOd6IhJaa+/XWojc
 2t7VZ40HoEKuWOQEatyyjxAf8dCoRv97HBcf08Q2AA==
X-Google-Smtp-Source: APXvYqyhCeRsfUMKnaFdLn3aJWF2r7C0su+s5w1UqLu1cTlcNydCdWit5JkkqefwAGH3hmKajOG/V6rCyDq9aRuGQfA=
X-Received: by 2002:a37:bcc7:: with SMTP id
 m190mr56245928qkf.433.1564049143158; 
 Thu, 25 Jul 2019 03:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:05:32 +0200
Message-ID: <CA+M3ks5v7vF_mPBr4mkwsHidc-N4jfJDgqWWE7qRv0LDsYJ-pQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
To: Olivier Moysan <olivier.moysan@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7MqY5TdYDukrmEcvyvH1Gy2JxiZVpxAfuPKcTJpAIOc=;
 b=bZG05YAAVga3Lrh/0yIRiZu0OwBZ1sptqRJR8ItXyufWxbjZiVGIoqJ0QpP+TPerhF
 VS0hlrNFycUS3jM5WWtRoTESWbMzjpbMJgoMIj2JvhSvGV8FVTTpKMFtDJdX9DvdLpM6
 9DRwIIX/Qy19YhgVSoNRaga21XU0ELRRBHGN2XVRcrCVDHwsYoEyrRoa/m2wMLE0DfON
 diKx1f2P1O9zbznpnDIteD9wOHwQ/zzPS3GCxbbLKKO1EAKn3XcjR9ESC3eEnrRNBXfq
 D5x8VcJmwr7IFSNLpFwemFmEYv6f9thE4MW8BI/eQmHOwtYrPEkfgzCM7MUc4qpuJRo3
 GiUw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 jernej.skrabec@siol.net, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBBZGQgZGV2bV9jbGtfZ2V0IGNhbGwgdG8gcmV0
cmlldmUgcmVmZXJlbmNlIHRvIG1hc3RlciBjbG9jay4KPgo+IEZpeGVzOiBmZjU3ODE2MzRjNDEg
KCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbyBzdXBwb3J0IikKPgo+
IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBzdC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gQWNrZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4K
VGhhbmtzLApCZW5qYW1pbgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkwMnguYwo+IGluZGV4IGMyZjk3ZTU5OTdhMS4uOTYyOTMxYzIwZWZlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzUxLDYgKzc1MSw3IEBAIHN0YXRpYyBpbnQg
c2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAgICAg
ICAgICAgICAgICBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19m
aWZvX2lkW2ldIHwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9pZFtsYW5lc1tp
XV0gfCBTSUk5MDJYX1RQSV9JMlNfRklGT19FTkFCTEU7Cj4KPiArICAgICAgIHNpaTkwMngtPmF1
ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOwo+ICAgICAgICAgaWYgKElTX0VS
UihzaWk5MDJ4LT5hdWRpby5tY2xrKSkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IiVzOiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Cj4gLS0K
PiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
