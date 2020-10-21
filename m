Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE9295542
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 01:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73FA6EEAF;
	Wed, 21 Oct 2020 23:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06096EEAF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:40:17 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0CB62415A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603323617;
 bh=60CB1P6lj5vilv39JcGYocCEwfSkX0XlX0Q2dSY3mnY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OQrLTALI6RqWKnh7pzPyUOp9HHoZ280Nw/C7Iw8eOrjJ4XzofJDiEVzqHh6lV+yuv
 R+I/EubKjpWUOLMxjd2SbRyjf9889KdfMFEUoXxOkaSK4iFuMaIdnCvLUQqc3n8Smo
 utwKykVJ20PAqcQ2QcqiWbaGXpBgzXGZYQDYXIe4=
Received: by mail-ej1-f47.google.com with SMTP id dt13so5649203ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:40:16 -0700 (PDT)
X-Gm-Message-State: AOAM531LBv9Cj32ktU6rDTnCfoW62G/c1IktIDGEjCTLBXJV+S/aXLCq
 yDy8lh+MDTYP2BWmtD6KxetPcasZV9MdG387IQ==
X-Google-Smtp-Source: ABdhPJxx6xQUTYR8DUpWL6giPFZWBpFC3XJxcgE4mykKR3QL/7w8AP7UsYeOQzysJO0h74S6Fp4Owl4F/mPKkzzwQJo=
X-Received: by 2002:a17:906:c293:: with SMTP id
 r19mr5629737ejz.63.1603323615300; 
 Wed, 21 Oct 2020 16:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-2-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-2-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 07:40:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8oFA8ug1QRcK=OyEbFQGRZJioQXtnE=3y6JT+WFCd3bg@mail.gmail.com>
Message-ID: <CAAOTY_8oFA8ug1QRcK=OyEbFQGRZJioQXtnE=3y6JT+WFCd3bg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjHml6Ug6YCx5LiJIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IEFkZCBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DCj4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4gU2lnbmVkLW9mZi1ieTogRmFiaWVu
IFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggMTIxMjIwNzQ1ZDQ2Li4z
Mzk3N2UxNWJlYmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4
dAo+IEBAIC00Myw3ICs0Myw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBi
bG9ja3MpOgo+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAgICAgICAgICAg
IC0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0Cj4gICAgICAgICAibWVkaWF0
ZWssPGNoaXA+LWRpc3AtbXV0ZXgiICAgICAgICAgICAgLSBkaXNwbGF5IG11dGV4Cj4gICAgICAg
ICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atb2QiICAgICAgICAgICAgICAgLSBvdmVyZHJpdmUKPiAt
ICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYyMywgbXQyNzEyIGFuZCBtdDgx
NzMuCj4gKyAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwg
bXQ4MTY3IGFuZCBtdDgxNzMuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxl
bmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UKPiAgLSBpbnRlcnJ1cHRz
OiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jayAocmVxdWlyZWQs
IGV4Y2VwdCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4KPiBAQCAt
NTksNyArNTksNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwiCj4gICAgICAgICAibWVkaWF0ZWss
PGNoaXA+LWRpc3AtcmRtYSIKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIgo+
IC0gIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSBhbmQgbXQ4MTczLgo+ICsgIHRoZSBz
dXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ4MTY3IGFuZCBtdDgxNzMuCj4gIC0gbGFyYjog
U2hvdWxkIGNvbnRhaW4gYSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBsb2NhbCBhcmJpdGVyIGRl
dmljZSBhcyBkZWZpbmVkCj4gICAgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9tZWRpYXRlayxzbWktbGFyYi50eHQKPiAgLSBpb21tdXM6IFNo
b3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9jayB3aXRoIG1hc3RlciBwb3J0
IGFzCj4gLS0KPiAyLjI4LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
