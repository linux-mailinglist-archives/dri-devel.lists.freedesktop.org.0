Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349EA1773C9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1E46E9BE;
	Tue,  3 Mar 2020 10:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E2C6E9BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:17:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id j1so775853wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YfpfnT9N+enxbVfw8OUfHW35/Eys7WMdDnf9Q3fUgeo=;
 b=NKfeuU6PsS0I/cnkSHorRy9uISdCdIHIdHCNfo1YVON/zbC7attc5yn0ODbRKD0H+b
 9owqpSDnkSLsYm/ku3TISi58CaGEzCX84WV07V5xHOch4NtbuoPQB221HWwYBg/V51r2
 ekzK7YCN1CcAEpGzVUUiydQPDf//7srFD5Iz0+iWFdDq5sUU6vf+t8JFY71jOUqH+gDE
 vv9ODutAa1HIrx7ubIpuHfwdftrV+voWpKz/HFiHs7zTtR94aWjh5UZrTWdhI23ZQFF4
 gxbHsB8m8KrJZqUpc3aYQJ9k/o1+KuI+duF7WPXRKGIbWdC8g0+u8v+IKQTXssCYOQdw
 dwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YfpfnT9N+enxbVfw8OUfHW35/Eys7WMdDnf9Q3fUgeo=;
 b=LHdilRnuXH1l2WPWDh5C0nxtneLIs1AjXULdUp1N5I8yVBFsq657OyTgZDDp7tv1Ch
 Y4gg9+slTc9CEzFyr35HQVdVARt7IInueilHw6NMre5jM1iH/PXL990bLBDYt339If42
 JNDBfILTMKUvl0p7MsWJ4yjdcpY7dlRwpMK9RvVLVtL2rCcjHNU89QkAxroz5IezZWGY
 YiGLWuMI7o/atqmzjwNSUhiVr3uPHhT8nKMnqIz/nfPZ5f2FKpLdbuK2irlx/YXobh0f
 B+pajzJQo2JC8fYFGXEmzC/zFjKJlIWEHLi7TtpHA6uWCujVF7eTbQxL9gBpm8yFfo17
 XaKA==
X-Gm-Message-State: ANhLgQ38V0DMyGndZzeeYLnYWsV+2sheQKlH9Py4jIKYuI1Q6V5i4vWd
 jn74QNjtlg1Hi+jBBdLfgfMWfA==
X-Google-Smtp-Source: ADFU+vtffG/wEOzgw5QP8a52SN+d9kOR9DZgHxqSjx90JgazrgkKvPaXb4KlQUwOFoY/oMn7RnA9HQ==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr3841579wmj.137.1583230664639; 
 Tue, 03 Mar 2020 02:17:44 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i204sm3284696wma.44.2020.03.03.02.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 02:17:44 -0800 (PST)
Subject: Re: [PATCH 2/4] drm/bridge: dw-hdmi: Fix color space conversion
 detection
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 a.hajda@samsung.com
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-3-jernej.skrabec@siol.net>
 <c1cbcdc0-61a7-e5cb-4ad0-7057c33da154@baylibre.com>
 <1955232.bB369e8A3T@jernej-laptop>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <610707a3-1596-252d-f507-c3c70179683d@baylibre.com>
Date: Tue, 3 Mar 2020 11:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1955232.bB369e8A3T@jernej-laptop>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDMvMjAyMCAxNzo0MiwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+IERuZSBwb25lZGVs
amVrLCAwMi4gbWFyZWMgMjAyMCBvYiAxMDoyNjowOSBDRVQgamUgTmVpbCBBcm1zdHJvbmcgbmFw
aXNhbChhKToKPj4gSGkgSmVybmVqLAo+Pgo+PiBPbiAyOS8wMi8yMDIwIDE3OjMwLCBKZXJuZWog
U2tyYWJlYyB3cm90ZToKPj4+IEN1cnJlbnRseSwgaXNfY29sb3Jfc3BhY2VfY29udmVyc2lvbigp
IGNvbXBhcmVzIG5vdCBvbmx5IGNvbG9yIHNwYWNlcwo+Pj4gYnV0IGFsc28gZm9ybWF0cy4gRm9y
IGV4YW1wbGUsIGZ1bmN0aW9uIHdvdWxkIHJldHVybiB0cnVlIGlmIFlDYkNyIDQ6NDo0Cj4+PiBh
bmQgWUNiQ3IgNDoyOjIgd291bGQgYmUgc2V0LiBPYnZpb3VzbHkgaW4gdGhhdCBjYXNlIGNvbG9y
IHNwYWNlcyBhcmUKPj4+IHRoZSBzYW1lLgo+Pj4KPj4+IEZpeCB0aGF0IGJ5IGNvbXBhcmluZyBp
ZiBib3RoIHZhbHVlcyByZXByZXNlbnQgUkdCIGNvbG9yIHNwYWNlLgo+Pj4KPj4+IEZpeGVzOiBi
MjFmNGI2NThkZjggKCJkcm06IGlteDogaW14LWhkbWk6IG1vdmUgaW14LWhkbWkgdG8KPj4+IGJy
aWRnZS9kd19oZG1pIikKPj4+IFNpZ25lZC1vZmYtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4KPj4+IC0tLQo+Pj4KPj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyB8IDMgKystCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyBpbmRleAo+Pj4gMjQ5NjVlNTNkMzUxLi45ZDdiZmIxY2IyMTMg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPj4+
IEBAIC05NTYsNyArOTU2LDggQEAgc3RhdGljIHZvaWQgaGRtaV92aWRlb19zYW1wbGUoc3RydWN0
IGR3X2hkbWkgKmhkbWkpCj4+Pgo+Pj4gIHN0YXRpYyBpbnQgaXNfY29sb3Jfc3BhY2VfY29udmVy
c2lvbihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPj4+ICB7Cj4+Pgo+Pj4gLQlyZXR1cm4gaGRtaS0+
aGRtaV9kYXRhLmVuY19pbl9idXNfZm9ybWF0ICE9Cj4+PiBoZG1pLT5oZG1pX2RhdGEuZW5jX291
dF9idXNfZm9ybWF0OyArCXJldHVybgo+Pj4gaGRtaV9idXNfZm10X2lzX3JnYihoZG1pLT5oZG1p
X2RhdGEuZW5jX2luX2J1c19mb3JtYXQpICE9Cj4+PiArCQloZG1pX2J1c19mbXRfaXNfcmdiKGhk
bWktCj4+IGhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpOwo+Pj4KPj4+ICB9Cj4+PiAgCj4+
PiAgc3RhdGljIGludCBpc19jb2xvcl9zcGFjZV9kZWNpbWF0aW9uKHN0cnVjdCBkd19oZG1pICpo
ZG1pKQo+Pgo+PiBJIHRoaW5rIGluIHRoaXMgY2FzZSB5b3Ugc2hvdWxkIGFsc28gZml4IHRoZSBD
RUMgZW5hYmxlbWVudCB0bzoKPj4gaWYgKGlzX2NvbG9yX3NwYWNlX2NvbnZlcnNpb24oaGRtaSkg
fHwgaXNfY29sb3Jfc3BhY2VfZGVjaW1hdGlvbihoZG1pKSkKPj4KPj4gaW4gZHdfaGRtaV9lbmFi
bGVfdmlkZW9fcGF0aCgpIG90aGVyd2lzZSBDU0Mgd29uJ3QgYmUgZW5hYmxlZCBhbmQgd2lsbCBi
ZQo+PiBieXBhc3NlZCBpbiBkZWNpbWF0aW9uIGNhc2Ugb25seS4KPiAKPiBPbiBzZWNvbmQgdGhv
dWdodCwgSSB0aGluayBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBpcyBjb3JyZWN0LCBqdXN0IG1p
c25hbWVkLiAKPiBMYXVyZW50LCBOZWlsLCBkbyB5b3UgYWdyZWUgaWYgSSByZXBsYWNlIHRoaXMg
cGF0Y2ggd2l0aCBwYXRjaCB3aGljaCByZW5hbWVzIAo+IGlzX2NvbG9yX3NwYWNlX2NvbnZlcnNp
b24oKSB0byBpc19jb252ZXJzaW9uX25lZWRlZCgpID8KClN1cmUsCk5laWwKCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IEplcm5lago+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
