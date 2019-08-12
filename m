Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E989B65
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 12:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE806E4C9;
	Mon, 12 Aug 2019 10:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905396E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 10:24:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v15so11645310wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 03:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=s4c+tCeURwefVMli54iWLwLzBmEiKHEDXmTByXMYRso=;
 b=NAjOhi3Xb7PnCWgsakxNfzCyEai4Vlo1rrrHwINdUNiUgxOTvz0oailRBnPTnNhM8J
 K2TUWyXbtuTjrSKHAiWBUaJb72vkcwhpB4cPBUCnjBuBqAGO/Hna2zCaWAX+ta44wSzq
 S8XoPZsTmY+2knKF7twSmi7SUP951caNpVVT0TxXVih5wagb93WlzOtF51Uo31GwVI0t
 vzU/WV6xd0nbIN0uZFyxfqTbQoN5j35u2wwMl5rI8J1zfGrdUyJyfAOoalYOukxBU0z0
 1QFQ6Y9bKj/Xt0Ky3TKCZsNKJWXRNPMWwctYh2WvsLUrA9tf6enZ0h/es/bo2fyDCBAt
 StDw==
X-Gm-Message-State: APjAAAUb7NngWstL8Ss1Ic4Ul9zHPJWd7EhfDZv3y0rDq5hLHiFPldkc
 eN8zRJPDSLWabnDb3jLMzt/xxg==
X-Google-Smtp-Source: APXvYqyxkApIE8+Qfsn+A8tYWpIpvwdj9Lwb/49n7m31aXieEdChiennESHmI1ox7hWldcSQUf7guw==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr27612402wmc.95.1565605493088; 
 Mon, 12 Aug 2019 03:24:53 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id l14sm10411976wrn.42.2019.08.12.03.24.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 03:24:52 -0700 (PDT)
Date: Mon, 12 Aug 2019 11:24:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, arnd@arndb.de
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Message-ID: <20190812102450.GK26727@dell>
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=s4c+tCeURwefVMli54iWLwLzBmEiKHEDXmTByXMYRso=;
 b=Pdwnw6J67H7oh9kG9MSsgYoXkdh501ITQ+vyaKqx8I5koutjUs8WxYTHY5P0rqX6Kq
 FaJXpKcfefMm4VvtL/T6xaZGzTTQbUvKGJjM3I/VFvcQ0DCQNwC3aIyfjU8ZQE8aV7g7
 9g3kQVmNLS6toK1woedUfVsC4xMma3jCX71ZaUNgjQXgWMjSKTalINYNo0lIBdu0I+hJ
 17w3MPAddEkIGRcFIe2LvCBFqSgsJmdDHFVMgeMzpZduUCHCqzSgED1SJRfCyUPNakpL
 9xeXwF0IS9HV4qQurL3bnDZLlZ71Z80zwSqsUy4bpkmEiqz8FUjO1UEe+jypGDtzO1uA
 w5kw==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwOSBBdWcgMjAxOSwgR3VpZG8gR8O8bnRoZXIgd3JvdGU6Cgo+IFRoaXMgYWRkcyBh
bGwgdGhlIGdwciByZWdpc3RlcnMgYW5kIHRoZSBkZWZpbmUgbmVlZGVkIGZvciBzZWxlY3RpbmcK
PiB0aGUgaW5wdXQgc291cmNlIGluIHRoZSBpbXgtbndsIGRybSBicmlkZ2UuCj4gCj4gU2lnbmVk
LW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiAtLS0KPiAgaW5jbHVk
ZS9saW51eC9tZmQvc3lzY29uL2lteDhtcS1pb211eGMtZ3ByLmggfCA2MiArKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDhtcS1pb211eGMtZ3ByLmgKCkkg
d291bGQgbGlrZSBBcm5kIHRvIGxvb2sgYXQgdGhpcyBwbGVhc2UuCgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14OG1xLWlvbXV4Yy1ncHIuaCBiL2luY2x1ZGUvbGlu
dXgvbWZkL3N5c2Nvbi9pbXg4bXEtaW9tdXhjLWdwci5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjYyZTg1ZmZhY2ZhZAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14OG1xLWlvbXV4Yy1ncHIuaAo+IEBAIC0wLDAg
KzEsNjIgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+
ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTlhQCj4gKyAqICAgICAgICAgICAgICAgMjAx
OSBQdXJpc20gU1BDCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfX0xJTlVYX0lNWDhNUV9JT01VWENf
R1BSX0gKPiArI2RlZmluZSBfX0xJTlVYX0lNWDhNUV9JT01VWENfR1BSX0gKPiArCj4gKyNkZWZp
bmUgSU9NVVhDX0dQUjAJMHgwMAo+ICsjZGVmaW5lIElPTVVYQ19HUFIxCTB4MDQKPiArI2RlZmlu
ZSBJT01VWENfR1BSMgkweDA4Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjMJMHgwYwo+ICsjZGVmaW5l
IElPTVVYQ19HUFI0CTB4MTAKPiArI2RlZmluZSBJT01VWENfR1BSNQkweDE0Cj4gKyNkZWZpbmUg
SU9NVVhDX0dQUjYJMHgxOAo+ICsjZGVmaW5lIElPTVVYQ19HUFI3CTB4MWMKPiArI2RlZmluZSBJ
T01VWENfR1BSOAkweDIwCj4gKyNkZWZpbmUgSU9NVVhDX0dQUjkJMHgyNAo+ICsjZGVmaW5lIElP
TVVYQ19HUFIxMAkweDI4Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjExCTB4MmMKPiArI2RlZmluZSBJ
T01VWENfR1BSMTIJMHgzMAo+ICsjZGVmaW5lIElPTVVYQ19HUFIxMwkweDM0Cj4gKyNkZWZpbmUg
SU9NVVhDX0dQUjE0CTB4MzgKPiArI2RlZmluZSBJT01VWENfR1BSMTUJMHgzYwo+ICsjZGVmaW5l
IElPTVVYQ19HUFIxNgkweDQwCj4gKyNkZWZpbmUgSU9NVVhDX0dQUjE3CTB4NDQKPiArI2RlZmlu
ZSBJT01VWENfR1BSMTgJMHg0OAo+ICsjZGVmaW5lIElPTVVYQ19HUFIxOQkweDRjCj4gKyNkZWZp
bmUgSU9NVVhDX0dQUjIwCTB4NTAKPiArI2RlZmluZSBJT01VWENfR1BSMjEJMHg1NAo+ICsjZGVm
aW5lIElPTVVYQ19HUFIyMgkweDU4Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjIzCTB4NWMKPiArI2Rl
ZmluZSBJT01VWENfR1BSMjQJMHg2MAo+ICsjZGVmaW5lIElPTVVYQ19HUFIyNQkweDY0Cj4gKyNk
ZWZpbmUgSU9NVVhDX0dQUjI2CTB4NjgKPiArI2RlZmluZSBJT01VWENfR1BSMjcJMHg2Ywo+ICsj
ZGVmaW5lIElPTVVYQ19HUFIyOAkweDcwCj4gKyNkZWZpbmUgSU9NVVhDX0dQUjI5CTB4NzQKPiAr
I2RlZmluZSBJT01VWENfR1BSMzAJMHg3OAo+ICsjZGVmaW5lIElPTVVYQ19HUFIzMQkweDdjCj4g
KyNkZWZpbmUgSU9NVVhDX0dQUjMyCTB4ODAKPiArI2RlZmluZSBJT01VWENfR1BSMzMJMHg4NAo+
ICsjZGVmaW5lIElPTVVYQ19HUFIzNAkweDg4Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjM1CTB4OGMK
PiArI2RlZmluZSBJT01VWENfR1BSMzYJMHg5MAo+ICsjZGVmaW5lIElPTVVYQ19HUFIzNwkweDk0
Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjM4CTB4OTgKPiArI2RlZmluZSBJT01VWENfR1BSMzkJMHg5
Ywo+ICsjZGVmaW5lIElPTVVYQ19HUFI0MAkweGEwCj4gKyNkZWZpbmUgSU9NVVhDX0dQUjQxCTB4
YTQKPiArI2RlZmluZSBJT01VWENfR1BSNDIJMHhhOAo+ICsjZGVmaW5lIElPTVVYQ19HUFI0Mwkw
eGFjCj4gKyNkZWZpbmUgSU9NVVhDX0dQUjQ0CTB4YjAKPiArI2RlZmluZSBJT01VWENfR1BSNDUJ
MHhiNAo+ICsjZGVmaW5lIElPTVVYQ19HUFI0NgkweGI4Cj4gKyNkZWZpbmUgSU9NVVhDX0dQUjQ3
CTB4YmMKPiArCj4gKy8qIGkuTVg4TXEgaW9tdXggZ3ByIHJlZ2lzdGVyIGZpZWxkIGRlZmluZXMg
Ki8KPiArI2RlZmluZSBJTVg4TVFfR1BSMTNfTUlQSV9NVVhfU0VMCQlCSVQoMikKPiArCj4gKyNl
bmRpZiAvKiBfX0xJTlVYX0lNWDhNUV9JT01VWENfR1BSX0ggKi8KCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
