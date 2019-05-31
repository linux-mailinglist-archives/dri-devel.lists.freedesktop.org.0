Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB8306D6
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 05:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE736E188;
	Fri, 31 May 2019 03:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0206E188
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 03:03:53 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h20so13424663itk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 20:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXjk4EabF/9GMSniDWqhkev/Ug2c+H2S6xMvNNJvkwQ=;
 b=IKVJo8mjW4ClhNTOjGg4TdvTr2l2iuowr4vz5WYe5rFZZy/PHYZUqzfcO6bzU997Bz
 FeYniUk/NTUopM93IH2crW/Ep7bYCVZurHtEC4AZQvbE7S25n7JxmPR1Gj4afBk0WJO9
 H4XaAYVkh5V2+i9W8L0Nzge7ZI/+Th72mVcMWoKL9jgWCYneEntirLwA2yfaOHGN0x5F
 YpxQ8JfilGgjXFiMHcYXTxfuqkc0OhPsS3cwQkE4m3gRjnIsAQQj+rCjMGwzs/UYrxIP
 OKTNyRqBO/4TY3BsBKbEHS0M2yPJLluDs+CYuUUPS8b7wSpQuE1tFpea8vNx9fEVAT28
 ntjw==
X-Gm-Message-State: APjAAAXTgNPSxj8AggvYm/ZjQMqHlQLEOzf9kr8+ytyMF5mqTiFA19eF
 7TTBrSX0ACTNXrljkWEDFM9n5Syok2g=
X-Google-Smtp-Source: APXvYqycjAIesHQO8aw2S0s8BndtexMdDNNrTaT6MSif2EdBANx0calzF3mytXBIflxcOoxEPD2Rog==
X-Received: by 2002:a05:660c:a8e:: with SMTP id
 m14mr5288810itk.169.1559271832226; 
 Thu, 30 May 2019 20:03:52 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id s187sm1999933itb.22.2019.05.30.20.03.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 20:03:51 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id k20so6927688ios.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 20:03:51 -0700 (PDT)
X-Received: by 2002:a5e:8505:: with SMTP id i5mr5159405ioj.101.1559271830934; 
 Thu, 30 May 2019 20:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190527120910.18964-1-maxime.ripard@bootlin.com>
 <CAGb2v66uhrm20BwmODkPZjSM6Ek+xEg23w2Cs49ikW3WcU1Lqg@mail.gmail.com>
 <20190530185347.aql4znrk5msk2q6o@flea>
In-Reply-To: <20190530185347.aql4znrk5msk2q6o@flea>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 31 May 2019 11:03:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v66apz30Jy1BjU==s1a5Vwcr6GJsaswNqORSZc8fFKmzWQ@mail.gmail.com>
Message-ID: <CAGb2v66apz30Jy1BjU==s1a5Vwcr6GJsaswNqORSZc8fFKmzWQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert Allwinner DSI to a schema
To: Maxime Ripard <maxime.ripard@bootlin.com>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMjo1NCBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVGh1LCBNYXkgMzAsIDIwMTkg
YXQgMDk6NDg6MDJQTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkg
MjcsIDIwMTkgYXQgODowOSBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIEFsbHdpbm5lciBTb0NzIGhhdmUgYSBNSVBJLURT
SSBhbmQgTUlQSS1ELVBIWSBjb250cm9sbGVycyBzdXBwb3J0ZWQgaW4KPiA+ID4gTGludXgsIHdp
dGggYSBtYXRjaGluZyBEZXZpY2UgVHJlZSBiaW5kaW5nLgo+ID4gPgo+ID4gPiBOb3cgdGhhdCB3
ZSBoYXZlIHRoZSBEVCB2YWxpZGF0aW9uIGluIHBsYWNlLCBsZXQncyBjb252ZXJ0IHRoZSBkZXZp
Y2UgdHJlZQo+ID4gPiBiaW5kaW5ncyBmb3IgdGhhdCBjb250cm9sbGVyIG92ZXIgdG8gYSBZQU1M
IHNjaGVtYXMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPgo+ID4gTG9va3MgZ29vZCB0byBtZS4gSG93ZXZlciBu
b3Qgc3VyZSB3aHkgeW91IHJlcGxhY2VkIHRoZSBjbG9jayBpbmRleCBtYWNyb3MKPiA+IHdpdGgg
cmF3IG51bWJlcnMuCj4KPiBUaGUgZXhhbXBsZXMgYXJlIGNvbXBpbGVkIG5vdywgYW5kIHVuZm9y
dHVuYXRlbHkgd2UgY2FuJ3QgdXNlIHRoZQo+IGRlZmluZXMgYXQgdGhpcyBwb2ludC4KClRoYXQg
d2FzIHdoYXQgSSBzdXNwZWN0ZWQuIFRoYW5rcy4KTXkgUmV2aWV3ZWQtYnkgc3RpbGwgc3RhbmRz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
