Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC28D1658B3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 08:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDFB6ECE1;
	Thu, 20 Feb 2020 07:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9956ECE0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 07:48:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so3462606wru.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 23:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=D7/ilOTv/yfu8Ewt4axgtGDzooZ+foxh4W/MQRjliDM=;
 b=jMbZPFgAztkpn/Loio4h8rIr0dDunFm7z6lTmGUQtV5OJrvz92wbttJ/+tMh8NowL2
 z1vThmc3N71RgnHF2+g5tJWWOdEsN4mp5kowlGnMiCD73SOu47thpDOMDGL701pUi5aP
 ryZN4nJLqy7fpegqQeTnLcP4zK0Nf8lysNGi6+569kWsh1Q4kXWMG5Ujv2+fD/U6sq3P
 hH5UD9uG3vxYW5fhUP7Ew97APi3TU6OakDzhqdgDf7ExXffBeuYg09pk5uXU6x26uAYX
 HeBk4GGYaDVxODy/6shfrytrKglqKSrWfHtdQGvW2lstWoKJApx+P3W5W9ayhiRUBZec
 kouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=D7/ilOTv/yfu8Ewt4axgtGDzooZ+foxh4W/MQRjliDM=;
 b=aPOp6dVIpy1psquVaffH/P0/iMcnKdEJVoL2xTcXoXTmngLAB27wy47ExArrnPKL1N
 3ePm0gbYPsCJ79UldnavkQsLtkMsoXJnk4VeSu1+rZy2U+F6LmNfwtY2KRONa4gXvqAT
 AswlFikysL20cPE5rdA8kiCROxYDushs7shmZcl0ryO1tc5hnBlz7XSShfcEo93A2B57
 uFBmTvwQwTrxpsIf/onFHfFR4rt55YUbhVC3+ORdiFzVKsYPwNp4dnfaQd4CJagQinTm
 rS60Y2ochvsyEyFaPNtmTZrhclglngC8x/puOb1wXKJ6fEI9WMRcdAAXHweRVU58eTbc
 TnFA==
X-Gm-Message-State: APjAAAVqbqEtNSMZ8l82CaPomKJRBZsRWi5FO6j/JGBtU7zYzhMLiIqD
 2pEiIDfxJser1IlACrTY0EZGWg==
X-Google-Smtp-Source: APXvYqzdP9CBfyqkStiBpbb7vc3kk+lFEglaLS3RelisPlykfjRR3shD5qopiw1lOITr4YUmZpWffw==
X-Received: by 2002:adf:f787:: with SMTP id q7mr40744149wrp.297.1582184902510; 
 Wed, 19 Feb 2020 23:48:22 -0800 (PST)
Received: from dell ([2.31.163.122])
 by smtp.gmail.com with ESMTPSA id t187sm3571099wmt.25.2020.02.19.23.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 23:48:21 -0800 (PST)
Date: Thu, 20 Feb 2020 07:48:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200220074849.GF3494@dell>
References: <20200219191412.GA15905@amd> <20200219194540.GD37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219194540.GD37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, jingoohan1@gmail.com,
 merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com,
 Pavel Machek <pavel@ucw.cz>, jjhiblot@ti.com, linux-omap@vger.kernel.org,
 agx@sigxcpu.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4gKiBQYXZlbCBNYWNo
ZWsgPHBhdmVsQHVjdy5jej4gWzIwMDIxOSAxOToxNV06Cj4gPiBGcm9tOiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBsZWQt
YmFja2xpZ2h0IGRyaXZlciAobGVkX2JsKSwgd2hpY2ggaXMgc2ltaWxhciB0bwo+ID4gcHdtX2Js
IGV4Y2VwdCB0aGUgZHJpdmVyIHVzZXMgYSBMRUQgY2xhc3MgZHJpdmVyIHRvIGFkanVzdCB0aGUK
PiA+IGJyaWdodG5lc3MgaW4gdGhlIEhXLiBNdWx0aXBsZSBMRURzIGNhbiBiZSB1c2VkIGZvciBh
IHNpbmdsZSBiYWNrbGlnaHQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMg
SGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4gPiBBY2tlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZl
bEB1Y3cuY3o+Cj4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KPiA+IEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgo+ID4gQWNrZWQtYnk6IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4gPiBU
ZXN0ZWQtYnk6IFRvbnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L0tjb25maWcgIHwgICA3ICsrCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGln
aHQvTWFrZWZpbGUgfCAgIDEgKwo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5j
IHwgMjYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMjY4IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKPiA+IAo+ID4gSGkhCj4gPiAKPiA+IEhlcmUn
cyB0aGUgdmVyc2lvbiBvZiB0aGUgZHJpdmVyIEkgaGF2ZS4gQUZBSUNUCj4gPiBkZWZhdWx0LWJy
aWdodG5lc3MtbGV2ZWwgaGFuZGxpbmcgaXMgb2ssIHNvIGRvZXMgbm90IG5lZWQgdG8gYmUKPiA+
IGNoYW5nZWQuCj4gPiAKPiA+IExlZSwgaXQgd291bGQgYmUgZWFzaWVzdCBmb3IgbWUgaWYgeW91
IGNvdWxkIGFwcGx5IGl0IHRvIHlvdXIgdHJlZSBhbmQKPiA+IHB1c2gsIGJ1dCBnaXZlbiBlbm91
Z2ggdGltZSBJIGNhbiBwdXNoIGl0IHRvIExpbnVzLCB0b28uCj4gCj4gT2ggeW91J3JlIHVzaW5n
IHF1b3RlZC1wcmludGFibGUgZm9yIHBhdGNoZXMuLiBHb3QgaXQgYXBwbGllZCBub3csCj4gYW5k
IGl0IHN0aWxsIHdvcmtzLiBCZWxvdyBpcyBhbHNvIHRoZSByZWxhdGVkIGR0cyBjaGFuZ2UgdGhh
dAo+IEkgdGVzdGVkIHdpdGguCj4gCj4gRmVlbCBmcmVlIHRvIHBpY2sgdGhlIGR0cyBjaGFuZ2Ug
dG9vLCBuYXR1cmFsbHkgdGhhdCBzaG91bGQKPiBub3QgYmUgYXBwbGllZCBiZWZvcmUgdGhlIGRy
aXZlci4KPiAKPiBJZiB5b3UgZ3V5cyBpbnN0ZWFkIHdhbnQgbWUgdG8gcGljayB0aGVzZSBib3Ro
IGludG8gbXkgZml4ZXMKPiBicmFuY2gsIGp1c3QgbGV0IG1lIGtub3cgYW5kIEknbGwgZG8gdGhl
IGV4cGxhaW5pbmcgd2h5IHRoZXNlCj4gYXJlIG5lZWRlZCBhcyBmaXhlcy4gQmFzaWNhbGx5IHdl
IG5vIGxvbmdlciBoYXZlIGEgd2F5IHRvIGVuYWJsZQo+IHRoZSBMQ0QgYmFja2xpZ2h0IGZvciBk
cm9pZDQgbWFudWFsbHkgc3RhcnRpbmcgd2l0aCB2NS42LXJjMQo+IHVubGlrZSBlYXJsaWVyLgoK
UGxlYXNlIGRvLiAgWW91IGFscmVhZHkgaGF2ZSBteSBBY2suCgotLQpMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
