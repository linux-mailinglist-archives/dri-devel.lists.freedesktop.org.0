Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9573F86411
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856FF6E841;
	Thu,  8 Aug 2019 14:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DC46E851
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 14:12:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so4828829wrj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 07:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ExDUSZOSQEdf5biuijIvsrr6rzY8cxJRGGa/I5FOVwg=;
 b=nUWHm4PRGtm/Z3CzrgktloCBbw1yXH2sT58x62KfgCdAAaa0UY2hS2pgupPCP8GyJ3
 y2T9cwbfGqzaQmxlimICGD0l+9XJ0Oyi6n1ON3klnG3A+YlHcmwzWRQwDimm3z+lzTbV
 ofmJTxZJODD3DGLPZfNtoIcTb36LjooCUyZxVh2/M4DbznKD6W6H2281DwD17krP7W/E
 AVgjxFb00lJ0fdbIpKhNOhR4gaILZQBs9Gw/D++9HEpMnk4Tw3BqqpbJHNb3ngl90cXj
 BOkWn5lhvHWOBI19OrbJgbJbxnUapU7+b/4Ks/fCiVF4+5ncCL+VyKsO03zreNRGO2iW
 10Fg==
X-Gm-Message-State: APjAAAWdQff85ljcA/d23E3t+OtbNmqt31Uivy/rycAF6jd/WHO3/qRH
 B2lhRPDwFMVXCZbZ2ljvcyUOig==
X-Google-Smtp-Source: APXvYqyUytHgBqCyShqZVeFxRsGm9x+bjwGGiSEdSqmXh3YKR142ZN5ppB8CB6Y7nMd9oIxmX/q61A==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr16932318wrn.198.1565273551697; 
 Thu, 08 Aug 2019 07:12:31 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w7sm109173384wrn.11.2019.08.08.07.12.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:12:30 -0700 (PDT)
Subject: Re: [PATCH 0/9] drm: meson: global clean-up (use proper macros,
 update comments ...)
To: Kevin Hilman <khilman@baylibre.com>, Julien Masson <jmasson@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com> <7ho92mwor0.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <61b73415-73be-bb72-37f4-0a6060f85ffa@baylibre.com>
Date: Thu, 8 Aug 2019 16:12:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ho92mwor0.fsf@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ExDUSZOSQEdf5biuijIvsrr6rzY8cxJRGGa/I5FOVwg=;
 b=cgvVzjB6DHtktJO59X1wY3+KA4w34S6aE9FrLDBhKSSegTF9mMGN/VwCF4XO73X/C3
 sqXPy8JBX4I8ZEJZRb4e3C3i0MOl4te/J4H3X3P5PRAQjuPy+NYeGwIEwMfUVihjlNGv
 SjCHpjTq7o6TlFeO6H+LiYvDRAX42zZM8tO/xMtKwY+q+XAQ1BV6AUtJAuGVOJzfmivc
 DA80BE81PLFgShgf/SQ73OJe/JAvOj2swnu4NrC2XzUhX89E7E499XYsofc9ZT4Z1onI
 31VEj1HkUDurq4OoT7U8PTDLDHKdW+gjRv6zKQyjFtkTju8xewyoePizH63MVzNKgUYp
 9aTg==
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjAxOSAwMToyNCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IEp1bGllbiBNYXNzb24g
PGptYXNzb25AYmF5bGlicmUuY29tPiB3cml0ZXM6Cj4gCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gY2xlYW4tdXAgZGlmZmVyZW50cyBwYXJ0cyBvZiB0aGUgZHJtIG1lc29uCj4+IGNvZGUg
c291cmNlLgo+Pgo+PiBDb3VwbGUgbWFjcm9zIGhhdmUgYmVlbiBkZWZpbmVkIGFuZCB1c2VkIHRv
IHNldCBzZXZlcmFsIHJlZ2lzdGVycwo+PiBpbnN0ZWFkIG9mIHVzaW5nIG1hZ2ljIGNvbnN0YW50
cy4KPj4KPj4gSSBhbHNvIHRvb2sgdGhlIG9wcG9ydHVuaXR5IHRvOgo+PiAtIGFkZC9yZW1vdmUv
dXBkYXRlIGNvbW1lbnRzCj4+IC0gcmVtb3ZlIHVzZWxlc3MgY29kZQo+PiAtIG1pbm9yIGZpeC9p
bXByb3ZtZW50Cj4gCj4gTmljZSBzZXQgb2YgY2xlYW51cHMsIHRoYW5rcyEgIEkgZXNwZWNpYWxs
eSBsaWtlIHRoZSBleHRyYSBpbi1jb2RlCj4gY29tbWVudHMuCj4gCj4gQ291bGQgeW91IGFsc28g
YWRkIHRvIHRoZSBjb3Zlci1sZXR0ZXIgaG93IHRoaXMgd2FzIHRlc3RlZCwgYW5kIG9uIHdoYXQK
PiBwbGF0Zm9ybXMgc28gd2Uga25vdyBpdCdzIG5vdCBnb2luZyB0byBpbnRyb2R1Y2UgYW55IHJl
Z3Jlc3Npb25zLgo+IAo+IFRoYW5rcywKPiAKPiBLZXZpbgo+IAoKQXBhcnQgdGhlIHdyb25nIG1h
Z2ljIHZhbHVlIGluIHBhdGNoIDQgdGhhdCBJJ2xsIGZpeCB3aGlsZSBhcHBseWluZywKUmV2aWV3
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KCkknbGwgcnVu
IGEgZmV3IHRlc3RzIG9uIGFsbCB0aGUgc3VwcG9ydGVkIFNvQyB2ZXJzaW9uczoKLSBHWEJCCi0g
R1hMCi0gR1hNCi0gRzEyQS9HMTJCCgphbmQgcHVzaCB0byBkcm0tbWlzYy1uZXh0LgoKTmVpbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
