Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9D3622B4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40EA6EC0E;
	Fri, 16 Apr 2021 14:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC86EC0E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:47:29 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u21so42530633ejo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=g0XKUS1TlHQQdNyUmvZMzlYJbLqAhGmFHXulH+uYRNc=;
 b=f2ZDTmiEuxYYa86N6C2qnat3M3pM2bVpaAu8VGRFYHaK2P0DpmovNk6o3hjJWiPUlD
 o7G+UY8ZoobPKwIv1mPIMzcC6jIIsrQnz9MmvkFQQDbJESSFCCtp4DI555jrRDVsnAFq
 lqLTXtBHIRmFIPOJr469vpYRjut7wS7s5Z2I4UdSPsC0JOoF/6nihD0rAqCQGONxFceB
 aIPTbvELdUWV3srRx4qBjZklNeztXm++7k5YcAGOiVoe72zUDwYVB2GZTRtq9cEUzK3R
 h8MDLgKeQtLVZ5EnMn6IxlNxQSD/CSrHJA7qWSnvUh/SU/CIxia85W7Vv0HRuI15Pc9q
 w9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g0XKUS1TlHQQdNyUmvZMzlYJbLqAhGmFHXulH+uYRNc=;
 b=J0k/4sgjyzRdidYaAPiu5R5lm64FPTN6WR9LnUeD/eYygdDVWj9PH5aJD6Are63LD0
 eVoHoW8q2HyAFk1kaArOoOCoRwoYKFHSBE9iDwpQWeSt+VW9ncfty0DIefF9LspMSVP6
 1hrr2TeVlwYwGH87lwrQ+NCSt5Z+oIFwddgOo0CMDmSFQ6MFBJmcFJqV87smdmp5XT2X
 WNGxFkdeV/FhrQLWuIhstZotr3mxay9VWfPQmabg4Qdx1RAmnlcokBc6WlkDPL3HC9H4
 8WCO0RusGQpAh0fhuZTl2tX4RmOdjWkxblEIrNPg3sN9E5Bh9LWErMDhbnFeGRPQ+5JB
 fG9Q==
X-Gm-Message-State: AOAM532AGqqi9rqfQ+O5YnvRcfZ+zy8j/+4fc58QB1Kwzp/8NjwcmkGy
 CDA0k/fWFpEsT/eENqwBOpRSWw==
X-Google-Smtp-Source: ABdhPJwK7OS5GZ6fsGB4Jf+dnVda/NwOxPrNHCrgw7AUMQ4UAFFNFcBcXSU20uxtVOc2TeiOy2SjEg==
X-Received: by 2002:a17:906:1c17:: with SMTP id
 k23mr8876981ejg.266.1618584448071; 
 Fri, 16 Apr 2021 07:47:28 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id o6sm5646765edw.24.2021.04.16.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:47:27 -0700 (PDT)
Date: Fri, 16 Apr 2021 15:47:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 34/40] drm/exynos/exynos_drm_fimd: Realign function name
 with its header
Message-ID: <20210416144721.GZ4869@dell>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-35-lee.jones@linaro.org>
 <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f871839d-6b1b-84b4-19d1-860d209ef193@canonical.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNiBBcHIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMTYv
MDQvMjAyMSAxNjozNywgTGVlIEpvbmVzIHdyb3RlOgo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBX
PTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmltZC5jOjczNDogd2FybmluZzogZXhwZWN0aW5nIHByb3RvdHlwZSBm
b3Igc2hhZG93X3Byb3RlY3Rfd2luKCkuIFByb3RvdHlwZSB3YXMgZm9yIGZpbWRfc2hhZG93X3By
b3RlY3Rfd2luKCkgaW5zdGVhZAo+ID4gCj4gPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1
bmcuY29tPgo+ID4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4K
PiA+IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+ID4gQ2M6IEt5
dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiA+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4g
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gQ2M6IGxpbnV4LXNh
bXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9maW1kLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gSGkgTGVlLAo+IAo+IEkgYWxyZWFkeSBzZW50IGEgZml4
IGZvciB0aGlzIG9uZSBvbiA1dGggb2YgQXByaWw6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIxMDQwNTE4MTUyNC41MjQyNi0xLWtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2Fs
LmNvbS8KCk5vIHByb2JsZW0uICBUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4KCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZp
Y2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
