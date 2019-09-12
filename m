Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4FB0C6D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63F6ECA7;
	Thu, 12 Sep 2019 10:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2D6ECA7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:15:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 7so6793091wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 03:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qV/8aDUA0K+Uc5KBI6c3mxsT5gQYmiuGy0QNU9fogWY=;
 b=fytdFHDZfesLCBXTQrAP+TsQW6tz/ESnEkRjL2AJj+P8IrVkddLSLj5NgI059QU43N
 8a/qa2tfZNR0Pr+tGjUK7VqmSuZF93VtGWnd60DMCbWMXuB3jvdM/MRlkaAyFJni2d8K
 2Kywa6bIgZSaYxVuMMvr7TAbe0oUXoW0KXssgPOwSUXp4enSSCfO8DDJEaKx7d0OKRZX
 kgujvA/BSbWPsSIyEPW/XIUgMz1EYZ7+B1IFogqEd5IWy2J4RvLSSTh9Z9DwvDzoRhaE
 qfIuu2xaA6Z4DX2raNLS5jv0xUJ4NJLUxM81W+2aZ7QIDzGer1eVAc7tnP5tvtqX1dLx
 uPHA==
X-Gm-Message-State: APjAAAVohVdNvL4RX2wepL8N8goutawJmgt3zILtlu1XU/Bmx8P3vsf0
 8vvFFwcFIjRzNVgBxM9O+brNHA==
X-Google-Smtp-Source: APXvYqwEOebgxZSBp13laDErgGyI2+sHKBFq4eelialn4eIjvYIachYOGeJu7mTeLm3/dq7MUiKVsw==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr7626852wmb.104.1568283354131; 
 Thu, 12 Sep 2019 03:15:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q9sm4061169wmq.15.2019.09.12.03.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 03:15:53 -0700 (PDT)
Date: Thu, 12 Sep 2019 11:15:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
Message-ID: <20190912101551.7uwu23o3dqyon35p@holly.lan>
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813085855.8302-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qV/8aDUA0K+Uc5KBI6c3mxsT5gQYmiuGy0QNU9fogWY=;
 b=HLjGOu+sn5ATRNqb1gwBenUe3YEznyBNgtpyNgD/hKYBSs2QWWj3q18VgmisjNAewd
 RNmV62/glB9NMWlTYreMQ8i988/9Jjm214Dz5RAkH7cCtvhHHfw6Mk1ERT6Y8GPhYORJ
 kd5DxajIDHvhtYq5FeINW0DJ8J718ZDT2WY7pioOc9NiqXhScZdwWhwh55PVYqwP2G5L
 r6CVnpKMGSH2XwHnGVwwKW7BcDOS6lDh1FgQh/PaZGipA+5obnd/Z7NiIpVfV/jd9AmP
 zSnrZZdWYVO8Qq4DzJt0TaurCl50dJKbmXbH2HFzmR7RUFq/JBMlDLx8PHTD9pQjeZYE
 eL2g==
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6Mjg6NTVQTSArMDUzMCwgTmlzaGthIERhc2d1cHRh
IHdyb3RlOgo+IFN0YXRpYyBzdHJ1Y3R1cmUgbWljcm9fYmxfcHJvcHMsIGhhdmluZyB0eXBlIGJh
Y2tsaWdodF9wcm9wZXJ0aWVzLCBpcwo+IHVzZWQgb25seSBvbmNlLCB3aGVuIGl0IGlzIHBhc3Nl
ZCBhcyB0aGUgbGFzdCBhcmd1bWVudCB0byBmdW5jdGlvbgo+IGRldm1fYmFja2xpZ2h0X2Rldmlj
ZV9yZWdpc3RlcigpLiBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoKSBpcwo+IGRlZmlu
ZWQgd2l0aCBpdHMgbGFzdCBwYXJhbWV0ZXIgYmVpbmcgZGVjbGFyZWQgY29uc3RhbnQuIEhlbmNl
IG1ha2UKPiBtaWNyb19ibF9wcm9wcyBpdHNlbGYgY29uc3RhbnQgYXMgd2VsbC4KPiBJc3N1ZSBm
b3VuZCB3aXRoIENvY2NpbmVsbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRh
IDxuaXNoa2FkZy5saW51eEBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29u
IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2lwYXFfbWljcm9fYmwuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2lwYXFfbWljcm9fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWlj
cm9fYmwuYwo+IGluZGV4IDExMjNmNjdjMTJiMy4uODViMTZjYzgyODc4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYwo+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYwo+IEBAIC00NCw3ICs0NCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBtaWNyb19ibF9vcHMgPSB7Cj4gIAkudXBkYXRl
X3N0YXR1cyAgPSBtaWNyb19ibF91cGRhdGVfc3RhdHVzLAo+ICB9Owo+ICAKPiAtc3RhdGljIHN0
cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBtaWNyb19ibF9wcm9wcyA9IHsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBtaWNyb19ibF9wcm9wcyA9IHsKPiAgCS50
eXBlID0gQkFDS0xJR0hUX1JBVywKPiAgCS5tYXhfYnJpZ2h0bmVzcyA9IDI1NSwKPiAgCS5wb3dl
ciA9IEZCX0JMQU5LX1VOQkxBTkssCj4gLS0gCj4gMi4xOS4xCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
