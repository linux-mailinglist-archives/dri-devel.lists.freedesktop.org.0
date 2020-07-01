Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA62108BA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824366E03E;
	Wed,  1 Jul 2020 09:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56C6E03E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:57:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f18so22561364wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=C1HCCI3gAeUf4XPpDlNsAKByfjTK0WUcaIj2Km9aWNo=;
 b=S+khBUeC+65rhuY6mY5EoqNdUpVHkrj9E9FxXlPfSRtTokPfBSFMFEpJetZ7J5II6z
 M+xdoxHbDlhGRg5WA+J3l+ji9WmjVxp7U6tAQ2M+tAfaQvlJnQKQ3NhR6hUDJ68iwP1b
 le6wRQVtNLslJGlzjenULA882EXU7E1SbeahxaRYnAUXK9M2fVK40Xx1edHLxOVXG/v2
 0T3JfmVqr8nD+7Du563zvu3m4kahUDV/8CVuYlZmccGfQhBw4DhCwQe2sgCz27AEfdZF
 L33nyJZkW7hXcYZXNytzzdIwi4fr7I0w2+22tsYmhQRP8qEgcjAv4uE4GPzKtFzH6IIE
 Puhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C1HCCI3gAeUf4XPpDlNsAKByfjTK0WUcaIj2Km9aWNo=;
 b=cMnVXnpZIQySG3gcaPdVdVcXkuCSTLeSIl09yM7/GHoeFjgAndimSPp4kvPWOHPiqL
 YoFtL7g4OoxfcCdQGVUgv8AKN2l93zxFC7rBtdKJ1kXTr+UGbjeNdo3EDMdvxLkfLNQp
 DsbaOvItBOmo93WsIcCK8dDkb8niJkqBJpfB3jN8mwzYyF6QfakFOKKAJAYB9XdUA3LN
 PsJ/Mg+Z4HVZqRduoBYE47hyrBXqHDsy6u1Vk95HoRiBhvIgouQ5l9tBJYvGkGZzZDW4
 cVpQGooFSE3ZbXR79yfUYDYH7grnG0mrflBG/wB0TCWYG5afshs9R2cwyDpf3XmpAGZL
 YkbA==
X-Gm-Message-State: AOAM532CuYzw34OFcLIW99sqtrRlcINM5PbLRkBlnX/cR3xVaa2cAbV9
 HPjlvWUSYvbrFmfExMdrEBFJmG2y5X8=
X-Google-Smtp-Source: ABdhPJyhyTv/S/6b4lH0jcBktJWL5ja44aRXQxEBR0IoJguJ+gkhAmmXg9Rxnbk69OdvB1goKJgk4g==
X-Received: by 2002:a1c:5986:: with SMTP id
 n128mr14232488wmb.112.1593597425526; 
 Wed, 01 Jul 2020 02:57:05 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f16sm6485142wmf.17.2020.07.01.02.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 02:57:04 -0700 (PDT)
Date: Wed, 1 Jul 2020 10:57:03 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: Delete the OT200 backlight driver
Message-ID: <20200701095703.GD1179328@dell>
References: <20200626102500.292230-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626102500.292230-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBkcml2ZXIg
aGFzIG5vIGluLWtlcm5lbCB1c2Vycy4gVGhlIGRldmljZSBjYW4gb25seSBiZSBwb3B1bGF0ZWQK
PiBieSBib2FyZCBmaWxlcyBzaW5jZSBpdCBkb2VzIG5vdCBzdXBwb3J0IGRldmljZSB0cmVlIG5v
ciBBQ1BJLAo+IGFuZCBub3RoaW5nIGluIHRoZSBrZXJuZWwgY3JlYXRlcyBhIGRldmljZSBuYW1l
ZCAib3QyMDAtYmFja2xpZ2h0Ii4KPiAKPiBUaGlzIGRyaXZlciBoYXMgYmVlbiBpbiB0aGUga2Vy
bmVsIHNpbmNlIDIwMTIuIElmIGl0IGlzIHVzZWQgYnkKPiBvdXQtb2YtdHJlZSBjb2RlIHRoYXQg
Y29kZSBzaG91bGQgaGF2ZSBiZWVuIHVwc3RyZWFtZWQgYnkgbm93LAo+IGl0J3MgYmVlbiA4IHll
YXJzLgo+IAo+IEl0IHVzZXMgdGhlIGlkaW9tYXRpYyBmb3JrZWQgR1BJTyBvZiB0aGUgQ1M1NTM1
IHdoaWNoIGNvbWJpbmVzCj4gcGluIGNvbnRyb2wgYW5kIEdQSU8gaW50byBpdHMgcHJpdmF0ZSBj
dXN0b20gaW50ZXJmYWNlLCB3aGljaAo+IGNhdXNlcyBtZSBhIGhlYWRhY2hlIGJlY2F1c2UgdGhh
dCBpcyBub3QgaG93IHdlIGRvIHRoaW5ncyB0aGVzZQo+IGRheXM6IHdlIGNyZWF0ZXMgc2VwYXJh
dGUgcGluIGNvbnRyb2wgYW5kIEdQSU8gZHJpdmVycy4KPiAKPiBEZWxldGUgdGhpcyB1bnVzZWQg
ZHJpdmVyLgo+IAo+IENjOiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21h
aWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICB8ICAg
NyAtLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSAgIHwgICAxIC0KPiAgZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvb3QyMDBfYmwuYyB8IDE2MiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE3MCBkZWxldGlvbnMoLSkKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L290MjAwX2JsLmMKCkFwcGxpZWQs
IHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
