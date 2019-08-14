Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB838D01E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 11:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD4C89A61;
	Wed, 14 Aug 2019 09:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D96489A61
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 09:54:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z23so3896512wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=S0qffjmHFNR1Sy40wwuOSColl5UwNxzdHwfmzhDqELM=;
 b=tBmdTD7cGYt31eTmvfokTKiMqEzY0nXbPJy06BnItN3AOlztaU2gN/3aF903rtA56P
 y1TV1MwUBxHULDxw6mbksSzwr1pmFXr/QPYv1ybUCq5QeV3lLafJWxcLSKjp8vk8PULE
 3rYI/bMKIzuzOAnUb0Hj4ablrHGcv9H9dCJ6qMBjY4tziyVRyF74ZRANw0YEBFaTHOy0
 fABQJJxdafyilzGJvOuppTaIVPp8+T3yZdlWvLzYOtURwO/FSj+xlnU174swR0cqQyyi
 eCIJzZLmqcVWlwcv0okPNQCUzvFFcg+DZlwfdcRgy4BmLxFxszVwca/sRKGzPtxb8GlK
 5XKg==
X-Gm-Message-State: APjAAAU5KU93U2n7ZKgYp9/arlpTF1YvoZbWb1FyrRnGA4Oa8o+PGY27
 NORRmEiVMhQYAPNQNhH1arpA/w==
X-Google-Smtp-Source: APXvYqw/xCXZ/ntaYTSZDBFoiPx5UEcHFMETlTLRVVK72L8nHQhjC0Jv/k7Nj/gzbl6rVG1TmR1okg==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr7423263wmu.67.1565776486644; 
 Wed, 14 Aug 2019 02:54:46 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y7sm2789491wmm.19.2019.08.14.02.54.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:54:46 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] drm/meson: convert bindings to YAML schemas
To: robh+dt@kernel.org
References: <20190808085522.21950-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b0363e6e-4d73-a483-41b7-7849f48a9ff3@baylibre.com>
Date: Wed, 14 Aug 2019 11:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808085522.21950-1-narmstrong@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=S0qffjmHFNR1Sy40wwuOSColl5UwNxzdHwfmzhDqELM=;
 b=LdX9bmgt4s6x4/ZP8x1+XQ1L/RBYjEzeAtDRH+YjIDi7FU2dlfebUcjRayATdNpdc+
 pBKu9KPx/kywff4EGdq9oFicNv4Ym9AWl5I7dx553hKs+kTV0lNMNdeUsRHp7FMNf3yN
 THmCOz4Iykn8dwZ6CVZwEWHA65tjYGB21WPDXTWXVq+Jei1JuK1HQ2i0G0v9x8jykoar
 j8c/ma/RGKiKE7Hi1nmndGuSMaZCDpJGTPR5g3is8qtDI+g8dYgTtgV/VnA87pih0ZVc
 lNUIfogH6qSdvw0FDzqgaViM4onT/T7zZxurTAFaI14OkBfgOhfq5SUch3OsuYOrzheA
 DI7Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMDgvMjAxOSAxMDo1NSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gVGhpcyBwYXRjaHNl
dCBjb252ZXJ0cyB0aGUgZXhpc3RpbmcgdGV4dCBiaW5kaW5ncyB0byBZQU1MIHNjaGVtYXMuCj4g
Cj4gVGhvc2UgYmluZGluZ3MgaGF2ZSBhIGxvdCBvZiB0ZXh0cywgdGh1cyBpcyBpbnRlcmVzdGlu
ZyB0byBjb252ZXJ0Lgo+IAo+IEFsbCBoYXZlIGJlZW4gdGVzdGVkIHVzaW5nIDoKPiAkIG1ha2Ug
QVJDSD1hcm02NCBkdGJzX2NoZWNrCj4gCj4gSXNzdWVzIHdpdGggdGhlIGFtbG9naWMgYXJtNjQg
RFRzIGhhcyBhbHJlYWR5IGJlZW4gaWRlbnRpZmllZCB0aGFua3MKPiB0byB0aGUgdmFsaWRhdGlv
biBzY3JpcHRzLiBUaGUgRFQgZml4ZXMgd2lsbCBiZSBwdXNoZWQgb25jZSB0aGVzZSB5YW1sCj4g
YmluZGluZ3MgYXJlIGFja2VkLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBBZGRlZCByZXZp
ZXcgdGFnIG9uIGFtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4gLSBSZW1vdmVkIHBvd2VyLWRv
bWFpbnMgdHlwZSBmcm9tIGFtbG9naWMsbWVzb24tdnB1LnlhbWwKPiAKPiBOZWlsIEFybXN0cm9u
ZyAoMyk6Cj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogYW1sb2dpYyxtZXNvbi1kdy1oZG1pOiBj
b252ZXJ0IHRvIHlhbWwKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBhbWxvZ2ljLG1lc29uLXZw
dTogY29udmVydCB0byB5YW1sCj4gICBNQUlOVEFJTkVSUzogVXBkYXRlIHdpdGggQW1sb2dpYyBE
Uk0gYmluZGluZ3MgY29udmVydGVkIGFzIFlBTUwKPiAKPiAgLi4uL2Rpc3BsYXkvYW1sb2dpYyxt
ZXNvbi1kdy1oZG1pLnR4dCAgICAgICAgIHwgMTE5IC0tLS0tLS0tLS0tLS0tCj4gIC4uLi9kaXNw
bGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sICAgICAgICB8IDE1MCArKysrKysrKysrKysr
KysrKysKPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi12cHUudHh0ICAgIHwg
MTIxIC0tLS0tLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24t
dnB1LnlhbWwgICB8IDEzNyArKysrKysrKysrKysrKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDI4
OSBpbnNlcnRpb25zKCspLCAyNDIgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3
LWhkbWkudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dp
YyxtZXNvbi12cHUudHh0Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLXZwdS55YW1sCj4gCgpBcHBsaWVk
IHRvIGRybS1taXNjLW5leHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
