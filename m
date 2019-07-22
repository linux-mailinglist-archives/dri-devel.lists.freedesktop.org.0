Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10E708E7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA9889D2E;
	Mon, 22 Jul 2019 18:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3D889D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:51:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z23so12993145ote.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjJupYIc6xWc8gLFfPCwhmNtFxBF1s29Cj+SrhBx5Is=;
 b=PmfipGZUrpn1PKqX9wwZMVqqaGzf3ifnOvhg2CxeFUWGHK+aFE0+jZ9rRVXHufcB8c
 McLD3XE54rXdRIgxD5RKNsKDZ2UD2iX5zcPpW8C2jwTol9F+vhdB1j7Fr9f2g4Y+Vngp
 +4j11KMmeJTgnilXH24bmLGO/uWfkTv2FLyJQ+boCZkFGPJ7PXnMqRTN2+cePtjSsz3G
 i1MPGIAf28ALELByj+Ucir1EwErkq5Ax8H7/fMjixwHjZqBvXUdSJW+5jcebKVWwa3ql
 c6BiSjepCFaFVwK678QOHUovB9GevnHXj+7H1kn8z3adaCsRTcLXF6jDGjLPqpE7IkTO
 uMpw==
X-Gm-Message-State: APjAAAUp1xBbfyId727AZxX+29pO6I/s6wD2OKZd/JHOLs/15ZJiZHCa
 7LWh8QU+rKox0oAz9ZPdLC8bjEIQ7Tjl3OKiwnE=
X-Google-Smtp-Source: APXvYqxJ1cmuAUD5O0KF/ePYZbRJdJ5aTWAG9K+yO/+94qQbz28EEpCc4OtsYtwRR4vQw7JKfy3sOGJoQP+tXdUEhp8=
X-Received: by 2002:a9d:4b02:: with SMTP id q2mr16501766otf.312.1563821505561; 
 Mon, 22 Jul 2019 11:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190722151202.5506768B20@verein.lst.de>
In-Reply-To: <20190722151202.5506768B20@verein.lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 22 Jul 2019 11:51:36 -0700
Message-ID: <CA+E=qVdu3Hf7ufst-t_CiWkquximGFX8B2RcoQ1x0m++cc8n8Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xjJupYIc6xWc8gLFfPCwhmNtFxBF1s29Cj+SrhBx5Is=;
 b=bm8hR45ywmygZ8NW0eNp6YDk/NoCpAjuyMaoMf5JVUbHHpaC7V+k2GEyK/Sxbub2Io
 10P9Eqp7mwTpApV9roRtHUIppuq9fRxcVehIInvSLpuWNk3JdidqKDG7RO5zsMfYiz04
 M2CRABNHRuqfxifSuEgV7kO5xBzUcuv5s0n3ma/hI9X3iO+XsAlF6LZjgFeAQMq1mlNZ
 q7C/CD1aTbdIdyP0ZkBhU+q765+neevpRfJfRG/X7YJSC3P2MuuwZ/Ulup6VUHuwLSEi
 JMn8Jt2ACGXiSOJ6H/2giqHKf7zjFeZtRoF1Fw7MhYblXHt0DLaYrP42uXq1SO9Rz01j
 qpYA==
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
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODoxMiBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IFRoZSBhbng2MzQ1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciBEaXNwbGF5UG9y
dC9lRFAgdHJhbnNtaXR0ZXIgZGVzaWduZWQKPiBmb3IgcG9ydGFibGUgZGV2aWNlcy4KPgo+IEFk
ZCBhIGJpbmRpbmcgZG9jdW1lbnQgZm9yIGl0LgoKSSBiZWxpZXZlIHlvdSdsbCBoYXZlIHRvIGNv
bnZlcnQgaXQgdG8geWFtbCBmb3JtYXQuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8aWNlbm93eUBhb3NjLmlvPgo+IFNpZ25lZC1vZmYtYnk6IFZhc2lseSBLaG9ydXpoaWNrIDxh
bmFyc291bEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Cj4gUmV2
aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54
NjM0NS50eHQgfCA1NyArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQKPgo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0
NS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
YW54NjM0NS50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MGFmMDkyZDEwMWM1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dAo+IEBAIC0wLDAgKzEsNTcg
QEAKPiArQW5hbG9naXggQU5YNjM0NSBlRFAgVHJhbnNtaXR0ZXIKPiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1RoZSBBTlg2MzQ1IGlzIGFuIHVsdHJhLWxvdyBwb3dl
ciBGdWxsLUhEIGVEUCB0cmFuc21pdHRlciBkZXNpZ25lZCBmb3IKPiArcG9ydGFibGUgZGV2aWNl
cy4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKwo+ICsgLSBjb21wYXRpYmxlICAgICAg
ICAgIDogImFuYWxvZ2l4LGFueDYzNDUiCj4gKyAtIHJlZyAgICAgICAgICAgICAgICAgOiBJMkMg
YWRkcmVzcyBvZiB0aGUgZGV2aWNlCj4gKyAtIHJlc2V0LWdwaW9zICAgICAgICAgOiBXaGljaCBH
UElPIHRvIHVzZSBmb3IgcmVzZXQgKGFjdGl2ZSBsb3cpCj4gKyAtIGR2ZGQxMi1zdXBwbHkgICAg
ICAgOiBSZWd1bGF0b3IgZm9yIDEuMlYgZGlnaXRhbCBjb3JlIHBvd2VyLgo+ICsgLSBkdmRkMjUt
c3VwcGx5ICAgICAgIDogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwgY29yZSBwb3dlci4KPiAr
IC0gVmlkZW8gcG9ydCAwIGZvciBMVlRUTCBpbnB1dCwgdXNpbmcgdGhlIERUIGJpbmRpbmdzIGRl
ZmluZWQgaW4gWzFdLgo+ICsKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArCj4gKyAtIFZpZGVv
IHBvcnQgMSBmb3IgZURQIG91dHB1dCAocGFuZWwgb3IgY29ubmVjdG9yKSB1c2luZyB0aGUgRFQg
YmluZGluZ3MKPiArICAgZGVmaW5lZCBpbiBbMV0uCj4gKwo+ICtbMV06IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiArRXhh
bXBsZToKPiArCj4gK2FueDYzNDU6IGFueDYzNDVAMzggewo+ICsgICAgICAgY29tcGF0aWJsZSA9
ICJhbmFsb2dpeCxhbng2MzQ1IjsKPiArICAgICAgIHJlZyA9IDwweDM4PjsKPiArICAgICAgIHJl
c2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0ICovCj4gKyAg
ICAgICBkdmRkMjUtc3VwcGx5ID0gPCZyZWdfZGxkbzI+Owo+ICsgICAgICAgZHZkZDEyLXN1cHBs
eSA9IDwmcmVnX2ZsZG8xPjsKPiArCj4gKyAgICAgICBwb3J0cyB7Cj4gKyAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKPiArCj4gKyAgICAgICAgICAgICAgIGFueDYzNDVfaW46IHBvcnRAMCB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFueDYzNDVfaW5fdGNvbjA6IGVuZHBvaW50
QDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRf
YW54NjM0NT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAg
fTsKPiArCj4gKyAgICAgICAgICAgICAgIGFueDYzNDVfb3V0OiBwb3J0QDEgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwxPjsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYW54NjM0NV9vdXRfcGFuZWw6IGVu
ZHBvaW50QDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5l
bF9pbl9lZHA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAg
IH07Cj4gKyAgICAgICB9Owo+ICt9Owo+IC0tCj4gMi4xNi40Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
