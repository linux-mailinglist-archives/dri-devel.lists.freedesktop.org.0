Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB282B3AFA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35C189E41;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED0E6E98E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 07:55:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 142so2360638ljj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w351LFQNF9H2QQU5s9ICrFROPbDSbajAx2THMxGUsJs=;
 b=OIm+9HH5pTxZdbp+Ua7HVxFls3Z4ovdHo+cdgB72BMcXNgmnBEnmCI4Y3H7OQ6x4gw
 6LdLCIWZCK4yvnBzJ4rrQpM8qh52Z6cjpzp3BYZ0LsAB0+U+NdTBL7fsb7M2A93BjOoS
 F+5BEmJfrUukPiDaLmmo33ZgYlVfToC1N8appDAj5YAdVNVgh4Xr7xM+og5YfjgdRhB0
 MOtDqLSSt7qctEfR1/W3YVvH/BheGL9iqz6TW/6pN08k7nXzvprFxWwLM7l3n2k/zkjJ
 +sQwMGMZ3avs+OdiySYlhOmPcfv/XLxfiWaEELaoK2bMTMYctb591BmtQsoQhNY15BJD
 DMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w351LFQNF9H2QQU5s9ICrFROPbDSbajAx2THMxGUsJs=;
 b=EBZoJz64+CVwFb2llWkp8QqWYQCFYVq2Goo2gJAkSf2mPGn3O7XEmaUbVCXnySVOCM
 Fm7djeW94u+4QbKtw1kGa7V3eu08dMW2nxi1ZyoYqSqbUHTdoA48Uf3eACVUj4se9i7l
 1PX7l7fhv5LjDOlczgNes2+7bXxewtYDU9CDp9nE3AUVkVE2fRhtsJYyzaM07/x5PTY5
 Dan83m33zEOPKrg22k7vYPc8DqumCm3kGogxbCmBwpEv4dgYVOGkRtbCiQ82uitiVlsd
 BKyiaQ4SwlOFJ/tY1dFrPvLN9xMcivKfaiXAx2Qa3xiOwLW5WJdBEQ4geuGag1op2n0i
 D7qQ==
X-Gm-Message-State: AOAM533D8ChVV0aHLVLDg6oglINkBHM97SsTqmzslY/mp28jC+UQwcuz
 fSS7zEwlHwzE7kwdxqy+Jxg=
X-Google-Smtp-Source: ABdhPJy9HFFHagEjDNPf4zW//YiPfEdFCCgGSDoM2Y/a2ggo7IJWx8pK8epYfLRru62hfl7EsOJa2Q==
X-Received: by 2002:a05:651c:22e:: with SMTP id
 z14mr3700798ljn.215.1605426920756; 
 Sat, 14 Nov 2020 23:55:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id f22sm1758862ljn.99.2020.11.14.23.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Nov 2020 23:55:20 -0800 (PST)
Subject: Re: [PATCH] drm/tegra: output: Do not put OF node twice
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201113204157.1942919-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c39de51c-9ae5-6f60-16db-6506d792f578@gmail.com>
Date: Sun, 15 Nov 2020 10:55:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201113204157.1942919-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMTEuMjAyMCAyMzo0MSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoZSBvcmlnaW5hbCBwYXRjaCBm
b3IgY29tbWl0IDNkMmU3YWVjNzAxMyAoImRybS90ZWdyYTogb3V0cHV0OiBEb24ndAo+IGxlYWsg
T0Ygbm9kZSBvbiBlcnJvciIpIGNvbnRhaW5lZCB0aGlzIGh1bmssIGJ1dCBpdCB3YXMgYWNjaWRl
bnRhbGx5Cj4gZHJvcHBlZCBkdXJpbmcgY29uZmxpY3QgcmVzb2x1dGlvbi4gVGhpcyBjYXVzZXMg
dXNlLWFmdGVyLWZyZWUgZXJyb3JzCj4gb24gZGV2aWNlcyB0aGF0IHVzZSBhbiBJMkMgY29udHJv
bGxlciBmb3IgSERNSSBEREMvQ0kgb24gVGVncmEyMTAgYW5kCj4gbGF0ZXIuCj4gCj4gRml4ZXM6
IDNkMmU3YWVjNzAxMyAoImRybS90ZWdyYTogb3V0cHV0OiBEb24ndCBsZWFrIE9GIG5vZGUgb24g
ZXJyb3IiKQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8IDEgLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvb3V0cHV0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKPiBpbmRl
eCA1YTRmZDBkYmY0Y2YuLjQ3ZDI2YjVkOTk0NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvb3V0cHV0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMK
PiBAQCAtMTI5LDcgKzEyOSw2IEBAIGludCB0ZWdyYV9vdXRwdXRfcHJvYmUoc3RydWN0IHRlZ3Jh
X291dHB1dCAqb3V0cHV0KQo+ICAKPiAgCQlpZiAoIW91dHB1dC0+ZGRjKSB7Cj4gIAkJCWVyciA9
IC1FUFJPQkVfREVGRVI7Cj4gLQkJCW9mX25vZGVfcHV0KGRkYyk7Cj4gIAkJCXJldHVybiBlcnI7
Cj4gIAkJfQo+ICAJfQo+IAoKUmV2aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdt
YWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
