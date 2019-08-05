Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8715F81EF2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D336E459;
	Mon,  5 Aug 2019 14:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7986E459
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 14:23:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so81397031wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 07:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GlHskR97nvgmJ3JNpZ2xNkvftrX3e0diAeNYBWr8oKQ=;
 b=XbA9CZp8FeYdDcixBNpwx+ygW8yrL6WmqcFby0xvaUmsBnE6JIpKF+cTDXa0gRYbGW
 4eXFepBI0t47Jat6891Le8COkV+o5sjjRmXrniS+f8NdMpRG0nwE2lYB4UC7sHooxxkn
 SeDuKf5YDqJIAF6W14IXmOWCKjMXPxlqeESJxTbNy53kUPmBtnhd52lCLP2WOiA6MLOO
 0pV/FrT74JRulgh9Kru2vRqEo6lteLBaBviOemgXXdlfhUSTfHMbwQdUfPMKWlpKjdUa
 aNq45BXTKUALwuPVKDEgeXevG4O/eMgEah7phm4Exl6kXxgucRUsMDURN8rQtOOf57E/
 Gc0A==
X-Gm-Message-State: APjAAAWwkXJ07JgKodtBiLW7Hl5xTQuB+XpqyebO1nNtRXl1dX/DbKOY
 gU7z+QbISneobh5T88NL7LUNp94jbAQNIg==
X-Google-Smtp-Source: APXvYqzM37sAmWpHR99ArIiNRqKQG0hXPfto9lu199jfBdhUgqbR7babNCTNRoIuGLKdqdUGbGp5QA==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr6674381wre.248.1565015009678; 
 Mon, 05 Aug 2019 07:23:29 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e19sm116608702wra.71.2019.08.05.07.23.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 07:23:29 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge/megachips: Drop GPIO header
To: Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190708112803.12432-1-linus.walleij@linaro.org>
 <CACRpkdYYmVjBV+gjiPfjzGUeP-8w+E8AV392ed2Y8cF6AeNPBg@mail.gmail.com>
 <20190805093107.GA29747@pendragon.ideasonboard.com>
 <CACRpkdb7w7yKJxwt=7-Ao4wfmeJHt=_n6P4085G=+j5D3O0O6A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c15180c6-a64f-1a63-a88f-293b7962c95e@baylibre.com>
Date: Mon, 5 Aug 2019 16:23:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb7w7yKJxwt=7-Ao4wfmeJHt=_n6P4085G=+j5D3O0O6A@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GlHskR97nvgmJ3JNpZ2xNkvftrX3e0diAeNYBWr8oKQ=;
 b=cmISHNVCvp4nOb+UkIFd1e4H1AIoJZzQ/WKewhG9oHfvj2EEIfLLThPGxyf6/LSzN1
 KsZ5g7iDjkBhb4sAcBIwQLagWjRPP+DdK2gMq0rmew/+dCqDHKZ4Qkex9hr1GHlue8Cj
 2HFlQq/Bi4n9HxR2IjI6+fTUPPMpBiRD2YuTxT3GnTZg5L6qxhx23Y6EHBw9xXZPNqht
 U4228rfeZI4TgpE6rfIawlPcKKB7kvYU9QU9uK2ObEAxUWxwwLg98j/nvQAB85o68w+A
 QLLL8wnZD6To1DAHQfo/YjW4aZm/ZCMk7JGqrFov2cH61rDhizs5MZ3NhrB9D5a5mW6X
 c3hA==
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsCgpPbiAwNS8wOC8yMDE5IDExOjQwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9u
IE1vbiwgQXVnIDUsIDIwMTkgYXQgMTE6MzEgQU0gTGF1cmVudCBQaW5jaGFydAo+IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEF1ZyAwNSwgMjAx
OSBhdCAxMTowNTo1NUFNICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+Pj4gT24gTW9uLCBK
dWwgOCwgMjAxOSBhdCAxOjI4IFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4+Pgo+Pj4+IFRoaXMgZmlsZSBpc24ndCB1c2luZyBhbnkgaW50ZXJmYWNl
cyBmcm9tIDxsaW51eC9ncGlvLmg+IHNvCj4+Pj4ganVzdCBkcm9wIHRoZSBpbmNsdWRlLgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgo+Pj4KPj4+IFNvIHdoYXQgZG8gSSBkbyB3aXRoIHRoZXNlIHNpbXBsZSBwYXRjaGVzIGFz
IG5vb25lIHNlZW1zIHRvCj4+PiBBQ0sgb3IgcmV2aWV3IHRoZW0gZm9yIGEgbW9udGg/Cj4+Pgo+
Pj4gSSBndWVzcyBhcyBsYXN0IHJlc29ydCBzaW1wbHkgYXBwbHkgdGhlbSB0byB0aGUgR1BJTyB0
cmVlLCBidXQKPj4+IGhleS4KPj4KPj4gVGhleSBoYXZlIGEgdGVuZGVuY3kgdG8gc2xpcCB0aHJv
dWdoIHRoZSBjcmFja3MgOi1TIE9uZSBwaW5nIGlzCj4+IHNvbWV0aW1lcyBhbGwgaXQgdGFrZXMg
dGhvdWdoOgo+Pgo+PiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgo+IAo+IFRoYW5rcyBMYXVyZW50ISA6KQo+IAo+IEl0IGdv
ZXMgZm9yIGFsbCBvZiB0aGVtIEkgYXNzdW1lLgoKVGVsbCBtZSBpZiB5b3UgbmVlZCBtZSB0byBh
cHBseSBpdC4KCk5laWwKCj4gCj4gWW91cnMsCj4gTGludXMgV2FsbGVpago+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
