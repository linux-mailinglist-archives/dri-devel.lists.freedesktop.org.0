Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC8295148
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 19:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3266EE1D;
	Wed, 21 Oct 2020 17:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF586EDDD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:01:59 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 095AD22447
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603299719;
 bh=IJgP+WkiF3CiHKbL4th8n+DlWtgkXJlshw3WQkre9Vo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Tuba3q90fK5U2WA7mvzxLgOqxbPw/EQZoiVM3r5oWZCEuU5rF7+NGJdnskc6nPf4P
 HBHRKlBTeJm40ahzN5JXhWl5uIbupAXdR6yLJ23bbQb6iU71gxNBxPSFLkmnNElDuX
 498wJme6ornfQfWRav8E0bI5Ldoo7TWtVy4SJh08=
Received: by mail-ed1-f45.google.com with SMTP id cq12so3328098edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 10:01:58 -0700 (PDT)
X-Gm-Message-State: AOAM5312/W4HpSZWYimqVhBmQJAPzaNYaUbapHazsAAQUN6uhWEM1ihY
 HXb37yv5n91+LcQXar0HpjyHuVMOhv6IVoXHZg==
X-Google-Smtp-Source: ABdhPJxNYB5JrbgWoRZWM5b1UPk2c0NH+oFqgGIXB/umtBUJcVJOEuxHlHRZ5MwpQlcJDN+lPwb7BOCwm2vT1B8hJaw=
X-Received: by 2002:aa7:c3ca:: with SMTP id l10mr4071238edr.72.1603299717347; 
 Wed, 21 Oct 2020 10:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201020174253.3757771-1-fparent@baylibre.com>
 <20201020174253.3757771-3-fparent@baylibre.com>
In-Reply-To: <20201020174253.3757771-3-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 01:01:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
Message-ID: <CAAOTY_9m-nqCe1HanPv5xa3mVLpyG6mC1pF1FRAFJdU1jqza_A@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mediatek: dsi: add
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
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DLiBUaGUgU29DIG5lZWRzCj4gYW4gYWRk
aXRpb25hbCBjbG9jayBjb21wYXJlZCB0byB0aGUgYWxyZWFkeSBzdXBwb3J0ZWQgU29DOiBtaXBp
MjZtLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFiaWVuIFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5j
b20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZHNpLnR4dCAgfCA3ICsrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNp
LnR4dAo+IGluZGV4IGYwNmYyNGQ0MDVhNS4uMTBhZTZiZTcyMjVlIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRzaS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0Cj4gQEAgLTcsMTIgKzcsMTMgQEAgY2hhbm5lbCBv
dXRwdXQuCj4KPiAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgLSBjb21wYXRpYmxlOiAibWVkaWF0
ZWssPGNoaXA+LWRzaSIKPiAtLSB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEsIG10NzYy
MywgbXQ4MTczIGFuZCBtdDgxODMuCj4gKy0gdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAx
LCBtdDc2MjMsIG10ODE2NywgbXQ4MTczIGFuZCBtdDgxODMuCj4gIC0gcmVnOiBQaHlzaWNhbCBi
YXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgY29udHJvbGxlcidzIHJlZ2lzdGVycwo+ICAt
IGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2Nr
Lgo+ICAtIGNsb2NrczogZGV2aWNlIGNsb2Nrcwo+ICAgIFNlZSBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLgo+IC0t
IGNsb2NrLW5hbWVzOiBtdXN0IGNvbnRhaW4gImVuZ2luZSIsICJkaWdpdGFsIiwgYW5kICJocyIK
PiArLSBjbG9jay1uYW1lczogbXVzdCBjb250YWluICJlbmdpbmUiLCAiZGlnaXRhbCIsICJocyIK
PiArICBDYW4gb3B0aW9ubmFsbHkgYWxzbyBjb250YWluICJtaXBpMjZtIgoKSXQgc2VlbXMgdGhh
dCBtaXBpMjZtIGlzIHRoZSBjbG9jayBvZiBtaXBpLXR4LiBJbiBtdDgxNzMuZHRzaSBbMV0sCm1p
cGktdHgncyBjbG9jayBpcyAyNm0uCgptaXBpX3R4MDogbWlwaS1kcGh5QDEwMjE1MDAwIHsKY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtbWlwaS10eCI7CnJlZyA9IDwwIDB4MTAyMTUwMDAg
MCAweDEwMDA+OwpjbG9ja3MgPSA8JmNsazI2bT47CmNsb2NrLW91dHB1dC1uYW1lcyA9ICJtaXBp
X3R4MF9wbGwiOwojY2xvY2stY2VsbHMgPSA8MD47CiNwaHktY2VsbHMgPSA8MD47CnN0YXR1cyA9
ICJkaXNhYmxlZCI7Cn07CgpJZiB0aGlzIGlzIHRoZSBjbG9jayBvZiBtaXBpLXR4LCBpdCBzaG91
bGQgYmUgY29udHJvbGxlZCBieSBtaXBpLXR4IGRyaXZlci4KClsxXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpP2g9djUuOQoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCj4gIC0gcGh5czogcGhhbmRsZSBsaW5rIHRvIHRoZSBNSVBJIEQtUEhZIGNv
bnRyb2xsZXIuCj4gIC0gcGh5LW5hbWVzOiBtdXN0IGNvbnRhaW4gImRwaHkiCj4gIC0gcG9ydDog
T3V0cHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb25zIGFzIGRlc2NyaWJlZCBp
bgo+IEBAIC0yNiw3ICsyNyw3IEBAIFRoZSBNSVBJIFRYIGNvbmZpZ3VyYXRpb24gbW9kdWxlIGNv
bnRyb2xzIHRoZSBNSVBJIEQtUEhZLgo+Cj4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gY29t
cGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1taXBpLXR4Igo+IC0tIHRoZSBzdXBwb3J0ZWQgY2hp
cHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTczIGFuZCBtdDgxODMuCj4gKy0gdGhlIHN1cHBvcnRl
ZCBjaGlwcyBhcmUgbXQyNzAxLCA3NjIzLCBtdDgxNjcsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICAt
IHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIn
cyByZWdpc3RlcnMKPiAgLSBjbG9ja3M6IFBMTCByZWZlcmVuY2UgY2xvY2sKPiAgLSBjbG9jay1v
dXRwdXQtbmFtZXM6IG5hbWUgb2YgdGhlIG91dHB1dCBjbG9jayBsaW5lIHRvIHRoZSBEU0kgZW5j
b2Rlcgo+IC0tCj4gMi4yOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
