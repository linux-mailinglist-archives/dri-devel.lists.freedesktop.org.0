Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CB5F0127
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 16:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F9C6EAAE;
	Tue,  5 Nov 2019 15:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7397B6EAAE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 15:21:42 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q28so15469173lfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 07:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HE1j4EtAZgGRg2QaYSvsLMcxRZaA6CCtizB7Yqa+lWg=;
 b=TwCUUcVw8T9eT4+1KBLxdQhnSmY0HuX9V45hLsUjX1M9xylCW2701r2FRSsAKbznO/
 F1zS2cU9Wo7FYzCXItll/dTC2dBPGWoTd5I8j30nmofuXufb5yxJ+ptIpKDRbbkYIvnU
 7oid08+HxASJCBPY0NooRxdqhZ7OAWbdhXZN7bZgFwjAdNWYgcgXMvZN+mfYOKOixlKe
 0eXlsc7JcZWPzB7QnoDfyOJRf860sh+5zqQg8W/dEBPEBpBVlD0iQsuVv0mfoBbmpSwu
 g9snBchcbRewuGK8XsxksiiSXmk42ffEnWwTJOPeZBvSDtGh1wVTmOlUi+7PP4M/xOcl
 NT2Q==
X-Gm-Message-State: APjAAAUX/LAXQkQpfnItAxMKeeDYEtBRn099yd9HZdwPonSd9oKaq2q1
 RcawE0TmGSNpdZw9PmMpsQdVnVZRyFUonPbyPY3Reg==
X-Google-Smtp-Source: APXvYqxI0StnJAOryNZBbjRziDjLEli5haRZAFZ6MAJbKJDs42vGLZDjqlF/VP7raZrFQk6Inyr11J2n6egFJpUaxOg=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr21264199lfm.135.1572967300804; 
 Tue, 05 Nov 2019 07:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20191103205459.24965-1-linus.walleij@linaro.org>
 <20191103205459.24965-2-linus.walleij@linaro.org>
 <20191104231946.GA14609@bogus>
In-Reply-To: <20191104231946.GA14609@bogus>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 16:21:29 +0100
Message-ID: <CACRpkdb+uP+j5RmUkeXjioAUaFW3C5kLYUQ9O2NOcb8fOvd=4A@mail.gmail.com>
Subject: Re: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HE1j4EtAZgGRg2QaYSvsLMcxRZaA6CCtizB7Yqa+lWg=;
 b=yjVjEaHtAP37kp9++HI7ooPq2Y4a2G1TuFHB456QcKsOAWsht/SSIaQ5zJJ0YN12h8
 XF/yRHE7xMSI5rQdhsesegEM0MW6p9EBhGy81i+iG1LwwCoRLfoYF1vRflGBGChYrGsW
 PcbY4ld2re/6E2h4DmOGk3mRqrZzftZCUc+ndsiVOG+szOyKpP++6gClynU+4Rfqj0Ft
 Zw+BFf3ICmF1XlKsHK8qEMcz/CUFnVxBa3rPZw4VnZ010RfX4HJu2d0ZGYISpo6HBVcs
 aGU+UUdxac1QHujhQqn7PSuX83+l4GyWxgfYvPCCBaNI+JL5mNv5FTBTl63DHOETbwu/
 3teg==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCAxMjoxOSBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBTdW4sIE5vdiAwMywgMjAxOSBhdCAwOTo1NDo1OVBNICswMTAwLCBM
aW51cyBXYWxsZWlqIHdyb3RlOgoKPiBJIHRob3VnaHQgSSB0b2xkIHlvdSB3aGF0IHRoZSBwcm9i
bGVtIGlzIG9uIHRoZSBsYXN0IHZlcnNpb24uIFNlZSBiZWxvdy4KCkl0IHdhcyBwcmV0dHkgaGFy
ZCB0byBnZXQgZnJvbSBjb250ZXh0IEknZCBzYXkgOkQKCj4gPiArYWxsT2Y6Cj4gPiArICAtICRy
ZWY6IHBhbmVsLWNvbW1vbi55YW1sIwo+ID4gKyAgLSAkcmVmOiAuLi9kc2ktY29udHJvbGxlci55
YW1sIwo+Cj4gVGhpcyBzY2hlbWEgaXMgZm9yIGEgcGFuZWwgbm9kZSwgbm90IHRoZSBkc2ktY29u
dHJvbGxlci4gWW91IG5lZWQgdG8KPiBkcm9wIHRoaXMgbGluZS4gSXQgc2hvdWxkIGJlIGluY2x1
ZGVkIGJ5IERTSSBjb250cm9sbGVycy4KClllYWggYW5kIHNpbmNlIEkgYW0gc3VibWl0dGluZyBh
IHBhbmVsIGJpbmRpbmcgYW5kIG5vdCBhIERTSQpjb250cm9sbGVyIGJpbmRpbmcgdGhhdCB3YXMg
c29tZXRoaW5nIHRoYXQgd2FzIHByZXR0eSBvdXQtb2YtY29udGV4dAp0byBtZS4KCkFueXdheXMs
IHNpbmNlIHBhdGNoIDEgd2l0aCB0aGUgRFNJIGNvbnRyb2xsZXIgYmluZGluZ3MgaXMgdGhlbgpj
b21wbGV0ZWx5IHVucmVsYXRlZCB0byB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzLCBJJ2xsIHdvcmsg
b24gdGhhdApzZXBhcmF0ZWx5IGFuZCBqdXN0IHJlc2VuZCB0aGlzIG9uZSB3aXRoIHRoZSBwYW5l
bCBkcml2ZXIuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
