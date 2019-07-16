Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626676B735
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1076E265;
	Wed, 17 Jul 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4E189DA8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 23:59:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so21458815qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfE+1oH2ev9A7CB6B7OCM0HfuvGIKPETwgwy1wYPeZk=;
 b=WjCUOtkJC5gQPzRlV0PBK2yzRREMNJnqk25VxTGZTPNWAmq108XXzJ3JqNQYKOFXrZ
 Te5eEa0tw+T+j3MO4YL4iU8NK9osJZFWRp/RrgmzZ2XkHZesxKc9WFwPS50yEiJ22sgw
 OrNqGf4DU+UBD7NlN5b0cwSJGuxroEfWskKr4+4hWlONgsFz78gEkDX1TNVC+dkKMVyE
 j8FMYN4qJAYKjt++v9bY9ZO6E1nECUnT/uzbShY0Shjqpwl7psv9egHe67Op4huaDOj0
 xdJd4aLQ2sZvrEx786VZE2sJ29h7295O5p8a4mP3/jarp8btyHcw2P1UeuVSb/wecL5D
 0ePw==
X-Gm-Message-State: APjAAAUQYI1NLoD4bZSo3J1jxGnNaaD2jOxW6ZcfkvCqkHOUjxpl/9CG
 7diziilhV7a+1ofTLTcuY5SCvLZB11XO/gnZv1RizA==
X-Google-Smtp-Source: APXvYqyCn5WDabT9u/P+OGBvnjMb2lK0frfpzoQz2UZeeBoGFN9gytFn4nfFqeUwNxxQx3qvg3WhGoAnUFfps5oKIQ4=
X-Received: by 2002:aed:3b1c:: with SMTP id p28mr24024945qte.312.1563321575377; 
 Tue, 16 Jul 2019 16:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1562625253-29254-7-git-send-email-yongqiang.niu@mediatek.com>
From: Ryan Case <ryandcase@chromium.org>
Date: Tue, 16 Jul 2019 16:59:23 -0700
Message-ID: <CACjz--k0wVpxWTBXQeUHqm50RgvaCNkNb3DO+KviCOtq-e9gTQ@mail.gmail.com>
Subject: Re: [PATCH v4, 06/33] dt-bindings: mediatek: add mutex description
 for mt8183 display
To: yongqiang.niu@mediatek.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zfE+1oH2ev9A7CB6B7OCM0HfuvGIKPETwgwy1wYPeZk=;
 b=myAjYl3qrrjUdybw3rfkkqgxLpxX2EWxa6gWin7tovqVhvuC1kAEj0YUMz0a+INMKn
 k34dHtcAcHsWoDetwCiVgDi03O2ZbX6tn7T6FBnKsTPf2BLewHVVFqVnoOY7p/UiUCEe
 +2TMI/XehWPm3bOXRcM82WCBDwbCShBjLtw7Y=
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCAzOjM3IFBNIDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVr
LmNvbT4KPgo+IFRoaXMgcGF0Y2ggYWRkIG11dGV4IGRlc2NyaXB0aW9uIGZvciBtdDgxODMgZGlz
cGxheQo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBpbmRleCBiYjkyNzRhLi40YTIyZDQ5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZGlzcC50eHQKPiBAQCAtNTMsNiArNTMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChh
bGwgZnVuY3Rpb24gYmxvY2tzKToKPiAgICBGb3IgbW9zdCBmdW5jdGlvbiBibG9ja3MgdGhpcyBp
cyBqdXN0IGEgc2luZ2xlIGNsb2NrIGlucHV0LiBPbmx5IHRoZSBEU0kgYW5kCj4gICAgRFBJIGNv
bnRyb2xsZXIgbm9kZXMgaGF2ZSBtdWx0aXBsZSBjbG9jayBpbnB1dHMuIFRoZXNlIGFyZSBkb2N1
bWVudGVkIGluCj4gICAgbWVkaWF0ZWssZHNpLnR4dCBhbmQgbWVkaWF0ZWssZHBpLnR4dCwgcmVz
cGVjdGl2ZWx5Lgo+ICsgIGZvciBNVDgxODMgbXV0ZXgsIHRoaXMgaGFyZHdhcmUgaXMgYWx3YXlz
IGZyZWUgcnVuLCBoYXMgbm8gY2xvY2tzIGNvbnRyb2wKClRoaXMgc2hvdWxkIGhhdmUgY2FwaXRh
bGl6YXRpb24sIHB1bmN0dWF0aW9uLCBhbmQgZHJvcCB0aGUgdHJhaWxpbmcgc3BhY2UuCgpJdCBh
bHNvIHJlYWRzIGEgbGl0dGxlIHN0cmFuZ2VseS4gWW91IG1heSB3YW50IHNvbWV0aGluZyBsaWtl
ICJBbgpleGNlcHRpb24gaXMgdGhhdCB0aGUgbXQ4MTgzIG11dGV4IGlzIGFsd2F5cyBmcmVlIHJ1
bm5pbmcgd2l0aCBubwpjbG9ja3MgcHJvcGVydHkuIgoKPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVz
IChETUEgZnVuY3Rpb24gYmxvY2tzKToKPiAgLSBjb21wYXRpYmxlOiBTaG91bGQgYmUgb25lIG9m
Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
