Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C825F873
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 12:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FBD6E2DC;
	Mon,  7 Sep 2020 10:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1A56E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 10:33:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w2so13884164wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIB9drnk+63RQtsyAIplq/mv+KlE9BKKo/XmkOjk4g0=;
 b=PFBDX2Qnav8ff2C4wQssiZzMB4M9DCVZBFLrzaii6nGXOsd/DNL9243R0j08j6wzUJ
 +lMutk6809Lm5o/ydKEGBIkT7lXc4Bog6TkM609moxbvWL7IyPHtKh/fIEcL86TDjBw/
 V+71GzvUOM/iXM8AYzQlSDgGw84nG4EhMRC9EURTD9ju2XZ/O0rMHQjI8SM/lcKDWyfa
 v8SEPlnwAvRsRm2Enr/X4VCaP9R4yLIxCe9jDOA/Of2sEzlbhOQPd8Uu2T/0yH4sTl3z
 wt//Yo9C8OYuYUgxpPiIFeellnIQdD+70b3jm3Nx3vsDzMDXSyrtrnm2JucoUgc9vR8g
 fSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dIB9drnk+63RQtsyAIplq/mv+KlE9BKKo/XmkOjk4g0=;
 b=RBysx5APCt60oGH1cdmi2EOoIwiy7WdNrcjJsbOcA/7NkfFVNMbt7SX1+LG27IYOgE
 juqHgmDubKjc6hr1apgL+KG88DKPixVMKgSgWg6UffXjSnVryOaAJmv//YfG4UUNVy2c
 1rk/JAuemRoCGoOOsKHphuID8sxnaWbfjp/AK7t+a2AtKhDWH+6/eSQ5t8Ia+2eLlgF1
 04SzpCYsOc7ltsRZ9culcIcQbeoW6e6rrpWEBqRd/X7U/P20GNRmoIA6C0y7/iCEUHNJ
 VY0tZODgi/0RyS679leSpZgqfdE6gLYJTpfDRtBBNQeQjT/DpEhxuKOWGLLbKT09IrI/
 S32Q==
X-Gm-Message-State: AOAM531iIAeCfYje7nf3laFh+zu+xXxyi0AOz+H9q8YS3TdoQedfbP+8
 aThDrcO1N/GFe9cGYSQ5C3ZRIg==
X-Google-Smtp-Source: ABdhPJxR1rKDcT/H7YbACgBs00drzH6YN0Hl6+FZAoKoAwPQcNN6ejFcCzcgfWgjowqvMkJF9BSU1w==
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr20086427wmo.186.1599474823185; 
 Mon, 07 Sep 2020 03:33:43 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id 59sm7465602wro.82.2020.09.07.03.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:33:42 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
To: thierry.reding@gmail.com, sam@ravnborg.org
References: <20200904161504.23915-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
Date: Mon, 7 Sep 2020 12:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904161504.23915-1-narmstrong@baylibre.com>
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpQbGVhc2UgaWdub3JlIHRoaXMgc2VyaWUsIHRoZSB2ZW5kb3JzIHBhdGNoIGlzIG1pc3Np
bmcgYW5kIHRoZSBwYW5lbCBkcml2ZXIKc3RpbGwgaGFzIHRoZSB2cmVmcmVzaC4uLgoKV2lsbCBy
ZXBvc3QuCgpOZWlsCgpPbiAwNC8wOS8yMDIwIDE4OjE1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiBUaGlzIGFkZHMgc3VwcG9ydCBiaW5kaW5ncyBhbmQgc3VwcG9ydCBmb3IgdGhlIFRETyBUTDA3
MFdTSDMwIFRGVC1MQ0QgcGFuZWwKPiBtb2R1bGUgc2hpcHBlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0
MDAgRGV2ZWxvcG1lbnQgS2l0Lgo+IFRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlv
biBhbmQgdXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KPiBJdCBwcm92aWRlcyBhIE1JUEkgRFNJ
IGludGVyZmFjZSB0byB0aGUgaG9zdCwgYSBidWlsdC1pbiBMRUQgYmFja2xpZ2h0Cj4gYW5kIHRv
dWNoIGNvbnRyb2xsZXIuCj4gCj4gTmVpbCBBcm1zdHJvbmcgKDIpOgo+ICAgZHQtYmluZGluZ3M6
IGRpc3BsYXk6IHBhbmVsOiBhZGQgVERPIHRsMDcwd3NoMzAgRFNJIHBhbmVsIGJpbmRpbmdzCj4g
ICBkcm06IHBhbmVsOiBhZGQgVERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCj4gCj4gIC4uLi9k
aXNwbGF5L3BhbmVsL3Rkbyx0bDA3MHdzaDMwLnlhbWwgICAgICAgICB8ICA1OCArKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10ZG8tdGwwNzB3c2gzMC5jICB8IDI2MyArKysrKysr
KysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzMzMgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvdGRvLHRsMDcwd3NoMzAueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdzaDMwLmMKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
