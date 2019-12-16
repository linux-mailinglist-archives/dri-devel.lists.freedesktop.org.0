Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69E1202A2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C056E49C;
	Mon, 16 Dec 2019 10:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3506E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:31:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so6585550wru.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=y4L6wxT2hjkP061x3+FU9sRF+bPdtiBofKXQ8MwvKjw=;
 b=GmnDLHih7reVV4M5U0hPrmWlRAB1tWyqP85WZiLwL7evOr5bi5dfuH9GwYBGqmTCmZ
 xBHdofycxMY2vcpERnmUch9SDOKG7eVgtuwSODg95Hr5zQQWGb3/iUvXHVmcfWiqE/Oo
 KNg3MmS3fS0dqp7WbZTmOsQ5G8EmC9YiS3O8a/wGyHL5Y3GUfrLJSfkkw7EXpLDGsz6Z
 IIGJRGkpkUmbH6XJrS2F6EqKBVwAl5HWfP/1XP5y4TjGNFuE7l3HDvW94k2TXAHScm9a
 gk1XHqF7as6JfYBnfYyqBuiL1XYQeAnnYaJG7hO3+orM60OBZGtSffIVLlQMiea8W9Ic
 38QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=y4L6wxT2hjkP061x3+FU9sRF+bPdtiBofKXQ8MwvKjw=;
 b=G/yDr0xXfw86cbNgxkHv/H1BGBew/XcUNTG+fsxMz1VpNYsAfl64ZW6jPp1W1WMVyJ
 gf80ha4ByiC0smMaM9Axxqt7w457/BUNvInZCNQm4aA9FF1hfYfE21zlkyjTwY68HLSx
 33VPksSurh/JTKjArNhIVPYOmHehnL7XOAkXjVe2a3lhrvvvkZ22vSPSDHn7TX5w1EXz
 MLm3zWFRx5xLj+FrCKG1QnsITiTRMiGGh7PbFv2/usyLY2/56n1IHqgp0LcB+W1k7eHu
 AVp6oLanKvpsnd4O76Nn43rwkK3kF5TDwczUT78ZpwsocXHFMcFWyEcoOMN6Huuq3nN5
 C1Tg==
X-Gm-Message-State: APjAAAVzgkstJ0GdqnvUhf9ck8vE4gkQ0g9NjMrsQHOb01B1l/6HpMrb
 31iXPKrnGvOyhgNxyWLz3yUsdw==
X-Google-Smtp-Source: APXvYqw5UHXSCcdeonf3Fv1rDhfiDVLn7+c/FAgel2lowxSgzItOsTGwLkRtx8BisHtreCN5TKAbvQ==
X-Received: by 2002:adf:fa50:: with SMTP id y16mr29533832wrr.183.1576492291165; 
 Mon, 16 Dec 2019 02:31:31 -0800 (PST)
Received: from dell ([2.27.35.132])
 by smtp.gmail.com with ESMTPSA id w17sm21012537wrt.89.2019.12.16.02.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 02:31:30 -0800 (PST)
Date: Mon, 16 Dec 2019 10:31:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: ams369fg06: Drop GPIO include
Message-ID: <20191216103130.GB3601@dell>
References: <20191202103005.102696-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202103005.102696-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwMiBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIGRyaXZlciBp
bmNsdWRlcyA8bGludXgvZ3Bpby5oPiB5ZXQgZmFpbHMgdG8gdXNlIHN5bWJvbHMKPiBmcm9tIGFu
eSB0aGUgaGVhZGVyIHNvIGRyb3AgdGhlIGluY2x1ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9hbXMzNjlmZzA2LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
