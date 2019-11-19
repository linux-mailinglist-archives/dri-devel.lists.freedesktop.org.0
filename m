Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC631028C4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 17:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147FF6E8DC;
	Tue, 19 Nov 2019 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC66E2B1;
 Tue, 19 Nov 2019 16:00:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id o12so9258133oic.9;
 Tue, 19 Nov 2019 08:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOp09REXBJlIhxRQLG3yF3pkOzVMqVXKGYr5zOkYKTU=;
 b=YK1ex+fbSSEvL4IHPtHVkewSUgWnlnzo7ibi9v2YMb0E/efcj5wIhVIVnAi5nyxVtr
 CyjJgJl47dNLpoKWMSJ9gVTa+tqS297hP6T7NSVrEWJcpLV0jx7SDdkI4xUnQb2yZnu9
 cRX1E/vYqzDlJUWK/o2iZwA3nd+2lAC1USEVW7Wmlbv+iBH3lQSQqi84t11QCx/Wj5Io
 PxLU5N/tS3+UtOTka9hqRejPqncsv1RCMI63sVb8VDKkqR/gsArwjqkSx+C7//bfVL5T
 YS0V37ReUspbX2FkatAydajUnAmG5Xdj5ZZuz7YWJJv4H3EhM3FMVIOX7nXocCJDHPAR
 UL4A==
X-Gm-Message-State: APjAAAUqp4mZOHUQxYOu2vqab7mUDSz9C+9OuLHD5LYtcAyam9ZVtyKW
 e6WeJ/lQ1DMc3GInIihRd/Sv6Poulx2zVVq7LD8=
X-Google-Smtp-Source: APXvYqyFjVcr3DV/kDkPHFaPjGoNOAPUlx3qgBTMVdhzS/Ov2hib4acxOvn1dSc2R4bN1wN/M0QqvauTflblBxgZCm8=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr4573964oii.153.1574179223502; 
 Tue, 19 Nov 2019 08:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20191119144315.11261-1-krzk@kernel.org>
In-Reply-To: <20191119144315.11261-1-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Nov 2019 17:00:05 +0100
Message-ID: <CAMuHMdUnn8uYyQ+D=6rp1+R1sE_W-SS1t+EuNHm=vWaKQ9Z6tQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Fix path to power-domain.txt bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, freedreno@lists.freedesktop.org,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMzo0MyBQTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFdpdGggc3BsaXQgb2YgcG93ZXIg
ZG9tYWluIGNvbnRyb2xsZXIgYmluZGluZ3MgdG8gcG93ZXItZG9tYWluLnlhbWwsIHRoZQo+IGNv
bnN1bWVyIHBhcnQgd2FzIHJlbmFtZWQgdG8gcG93ZXItZG9tYWluLnR4dC4gIFVwZGF0ZSB0aGUg
cmVmZXJlbmNlcyBpbgo+IG90aGVyIGJpbmRpbmdzLgo+Cj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gRml4ZXM6IGFiYjQ4MDVlMzQzYSAo
ImR0LWJpbmRpbmdzOiBwb3dlcjogQ29udmVydCBTYW1zdW5nIEV4eW5vcyBQb3dlciBEb21haW4g
YmluZGluZ3MgdG8ganNvbi1zY2hlbWEiKQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKClJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKPiAgLi4u
L2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMscmNhci1nZW4yLWNwZy1jbG9ja3MudHh0ICAgICAgICAg
ICB8IDIgKy0KClBsZWFzZSBub3RlIHRoaXMgZmlsZSBpcyBubyBsb25nZXIgcHJlc2VudCBpbiBu
ZXh0LgpCdXQgcm9iaC9mb3ItbmV4dCBzdGlsbCBoYXMgaXQuCgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
