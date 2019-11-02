Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B2ECFD2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 17:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDA16E122;
	Sat,  2 Nov 2019 16:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FA56E122;
 Sat,  2 Nov 2019 16:54:38 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z22so9805748edr.13;
 Sat, 02 Nov 2019 09:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ghf/p8lPw2FMQrMnoCiCr2PRs7Q4z/vyAzI31fJ4SxI=;
 b=J8MbInLWzqKdOwyTHoR36wcEZK/desn5FxyXRvWGkryYpQL+CAQsRSNLYQE/FpZmnk
 kz/KMx22lhU/C6N2E1Yl2+ovn2HJZsdr05cQ2dYCMe2GzOZLDnrEOp671kah7GgodcvJ
 kUIie1JVVRdOqTLIzBx9eEZuynFIU9tPUYL8IWl+Gh50GbtGthnqFEsKUJ4n9yTaQgbz
 N2YJ0q5lU872l5ONj8sguVc1gIIfsZAkR9Tq5e2lOSpPgRCScFKbe87wbcnMOlZWFQtM
 LHcWad/k4HWXA/mtEzO85mglutTkrCrxhq7hDCm4eoNLsbbGlxwWC4RsmPd/PdEpBs+P
 sOZQ==
X-Gm-Message-State: APjAAAWUkIUyQpmSwLRJP+c+ISuEOi97Ah4tOClvF0tE4iO/Ql0Nof7E
 yfV6YU2EUvjfW4tzO4JQcgVxnM+SecH6P/yjGmE=
X-Google-Smtp-Source: APXvYqwKzyDPWo4pbqmwhzNvzxZORWkf137KMt0HTWuLLvR5uIHmBfYFxzuC+NHnts84g39RnZsy6AiUHKhlKb9s5hs=
X-Received: by 2002:a50:fa83:: with SMTP id w3mr4146132edr.272.1572713676998; 
 Sat, 02 Nov 2019 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191031104402.31813-1-kholk11@gmail.com>
 <20191031104402.31813-6-kholk11@gmail.com>
In-Reply-To: <20191031104402.31813-6-kholk11@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 2 Nov 2019 09:54:24 -0700
Message-ID: <CAF6AEGtXhOeV_7yZ8-px5EjQN9+Cmfgis8JdO3iCWZ2+g0=ukQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: msm/dsi: Add 28nm PLL for family B
 compatible
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ghf/p8lPw2FMQrMnoCiCr2PRs7Q4z/vyAzI31fJ4SxI=;
 b=UFXtrwxgi/6OHKHU5n5I4051h89Jr99VNX4YwB9sQopoN0xVWxEe6LXn3AFXmuiZA0
 FecbWh1b5CQLXzgPwfEYzc0QPuCtRkF7P/s/YcEke4xP64zSoFZ2DltcWcuXPkuqMU5L
 XeAEJuQubo9rbMIMckDVkwmevFn+eiCG42hE3fZg1Sq3gU48+enRs11yf0N4Dfz43xlg
 hokPChWwXFKj6xareYg5l3psm9Qqip8ldDUtPD77XIDMaN6FubmXByFT3DrRjVjHc9mD
 7Nl4//shNVv1CRnnrw+4VKdIL/Igrn+hTHr7gOOebWEP2/aBGHF8bjkDrKGQCbEcmx1g
 891g==
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
 freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 Jonathan <jonathan@marek.ca>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KyBkZXZpY2V0cmVlIGxpc3QKCk9uIFRodSwgT2N0IDMxLCAyMDE5IGF0IDM6NDQgQU0gPGtob2xr
MTFAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxraG9sazExQGdtYWlsLmNvbT4KPgo+IE9uIGZhbWlseSBCIFNvQ3MsIHRoZSAyOG5tIFBMTCBo
YXMgYSBkaWZmZXJlbnQgaW9zcGFjZSBhZGRyZXNzCj4gYW5kIHRoYXQgcmVxdWlyZWQgYSBuZXcg
Y29tcGF0aWJsZSBpbiB0aGUgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dCB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9kc2kudHh0Cj4gaW5kZXggYWY5NTU4NmM4OThm
Li5kM2JhOWVlMjJmMzggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZHNpLnR4dAo+IEBAIC04Myw2ICs4Myw3IEBAIERTSSBQ
SFk6Cj4gIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gY29tcGF0aWJsZTogQ291bGQgYmUgdGhl
IGZvbGxvd2luZwo+ICAgICogInFjb20sZHNpLXBoeS0yOG5tLWhwbSIKPiArICAqICJxY29tLGRz
aS1waHktMjhubS1ocG0tZmFtLWIiCj4gICAgKiAicWNvbSxkc2ktcGh5LTI4bm0tbHAiCj4gICAg
KiAicWNvbSxkc2ktcGh5LTIwbm0iCj4gICAgKiAicWNvbSxkc2ktcGh5LTI4bm0tODk2MCIKPiAt
LQo+IDIuMjEuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
