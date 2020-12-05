Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D82CFBEF
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 17:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5EB6E435;
	Sat,  5 Dec 2020 16:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266B66E435
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 16:22:02 +0000 (UTC)
X-Gm-Message-State: AOAM532bsgJIdcXd0QxfmxDIxSV48sCFNgBrWytOj0LvQVRs2bfnQkNj
 KX/AdwSUXauxzLMSk4F2GwUPhPA36v7ts0GzDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607185321;
 bh=HqCL0C0fBHGxybJAYvYG5qc36iWdza1r3+6oQ7q/QYk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TtJl9McoDTm4OO627Yqz78MaeEc4lov2ZnYQKkmPATAcFuvhKtxucO2BDITPFuftx
 hVTzsMORaModcamthtXy46dRtD0/1iZ0ZY0RywfehXS/fFmj/pUpNrupP7/vKUxEV7
 EcxMLfUuEEfN4GGPYcfTlCHkjyf9NsEeaGT6EI8TgcOphkCDEl19PltzMSXEsnTM9O
 XkhXjSYZFlYQCOpNJTPKDjTOsTEUIGKPFUiKJYMuv+YRXhGnNNpz7RRdR5qZ+VM4nA
 5Bapll5WHjlNyxm62RiT+sdWeNOpNh++dzGKIGIlTnT+HZYtb3zluT0K6C/MOYLkoE
 XsSNjBsuzhKTQ==
X-Google-Smtp-Source: ABdhPJxwRKEQCMgyly92qJS7B2s5xnqRdBYASutdDp1ipsbSBixu6U9DGAGmsD6yZUvGOAiiKhKjffVVI+kTdkQiO3c=
X-Received: by 2002:a1c:790f:: with SMTP id l15mr10033938wme.188.1607185320277; 
 Sat, 05 Dec 2020 08:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20201205091146.3184305-1-vkoul@kernel.org>
In-Reply-To: <20201205091146.3184305-1-vkoul@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 6 Dec 2020 00:21:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-_X98x=DeGLnSRDcZ+9wfpW2-EzpqJLQxDJ-UGoYaONw@mail.gmail.com>
Message-ID: <CAAOTY_-_X98x=DeGLnSRDcZ+9wfpW2-EzpqJLQxDJ-UGoYaONw@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: statify mtk_hdmi_phy_driver
To: Vinod Koul <vkoul@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMuac
iDXml6Ug6YCx5YWtIOS4i+WNiDU6MTHlr6vpgZPvvJoKPgo+IG10a19oZG1pX3BoeV9kcml2ZXIg
aXMgbm90IGRlY2xhcmVkIGFzIHN0YXRpYywgc28gc3RhdGlmeSBpdC4KPgo+IGRyaXZlcnMvcGh5
L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jOjIwNDoyNDogd2FybmluZzogc3ltYm9sICdtdGtfaGRt
aV9waHlfZHJpdmVyJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+CgpB
Y2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLWhkbWkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRt
aS5jCj4gaW5kZXggNDdjMDI5ZDRiMjcwLi5jNWM2MWY1YTllYTAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmMKPiArKysgYi9kcml2ZXJzL3BoeS9tZWRp
YXRlay9waHktbXRrLWhkbWkuYwo+IEBAIC0yMDEsNyArMjAxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2hkbWlfcGh5X21hdGNoW10gPSB7Cj4gICAgICAgICB7fSwK
PiAgfTsKPgo+IC1zdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX3BoeV9kcml2ZXIgPSB7
Cj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX3BoeV9kcml2ZXIgPSB7
Cj4gICAgICAgICAucHJvYmUgPSBtdGtfaGRtaV9waHlfcHJvYmUsCj4gICAgICAgICAuZHJpdmVy
ID0gewo+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJtZWRpYXRlay1oZG1pLXBoeSIsCj4gLS0K
PiAyLjI2LjIKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
