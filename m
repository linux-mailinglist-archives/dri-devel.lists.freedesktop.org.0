Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C82A1734
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 13:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39136E0FB;
	Sat, 31 Oct 2020 12:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1E56E0FB
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:12:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w23so5102387wmi.4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 05:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NA2mk2ojzZgcrMT2zOu7idEhtXsilJ2RZg5gFMOuQu0=;
 b=rgT37NYQH0JrZ+w9kmDmvHaorzrQsZ38syQpEBuQRDiiWk+YdlfpmT2ghXW0hyI+Np
 gYqV2T2D1/Dgy21YLv5rah1aqTH157Jntx0NRRWBZVHHsy48hV7i8Zyl7y0hxN3eI5OE
 5j7zAJYcFIR929YPdFEhJFR62g5T5kPflirWj1MYEYiwfcOEW08itezE8o7j6ukzLFdM
 j8+OSvyd1fhZTspdn5Zv7PlihrwpwvS4I4Fw5SEQWu7kiOEkw4WRPA5mohNnEM/eZ0qF
 06gGa6HdJkOxh8UIwxjqM0QoGN/jO8MAVd7fhHvng566QJMUisknYQt+/+LVHz/2+dvL
 tuBg==
X-Gm-Message-State: AOAM530ruLINMB2o/lm9+78cWAP8Nqnu6Ox4lCcP02zuU227CswIxKa9
 KK+M99oZv+WTRXn0AtIZI3w=
X-Google-Smtp-Source: ABdhPJzxJPowOvxVIGz2k7PdLFq9XdeI2/pqi8+tEqW8uyXw33OGR632eyR2MsZ3cnVcMWXiIVpgvg==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr8099208wmc.32.1604146322961; 
 Sat, 31 Oct 2020 05:12:02 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id m8sm14272394wrw.17.2020.10.31.05.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 05:12:01 -0700 (PDT)
Date: Sat, 31 Oct 2020 13:12:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: devfreq: Add documentation for the
 interconnect properties
Message-ID: <20201031121200.GA9399@kozik-lap>
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125257eucas1p29c6b018cfcdda337b2b3d2a496f0c830@eucas1p2.samsung.com>
 <20201030125149.8227-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030125149.8227-2-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMDE6NTE6NDRQTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBuZXcgb3B0aW9uYWwgcHJvcGVydGll
cyBpbiB0aGUgZXh5bm9zIGJ1cyBub2RlczoKPiBpbnRlcmNvbm5lY3RzLCAjaW50ZXJjb25uZWN0
LWNlbGxzLCBzYW1zdW5nLGRhdGEtY2xvY2stcmF0aW8uCj4gVGhlc2UgcHJvcGVydGllcyBhbGxv
dyB0byBzcGVjaWZ5IHRoZSBTb0MgaW50ZXJjb25uZWN0IHN0cnVjdHVyZSB3aGljaAo+IHRoZW4g
YWxsb3dzIHRoZSBpbnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNp
ZmljCj4gYmFuZHdpZHRoIHJlcXVpcmVtZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDF
mndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVy
IE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY3
Ogo+ICAtIGJ1cy13aWR0aCBwcm9wZXJ0eSByZXBsYWNlZCB3aXRoIHNhbXN1bmcsZGF0YS1jbG9j
ay1yYXRpbywKPiAgLSB0aGUgaW50ZXJjb25uZWN0IGNvbnN1bWVyIGJpbmRpbmdzIHVzZWQgaW5z
dGVhZCBvZiB2ZW5kb3Igc3BlY2lmaWMKPiAgICBwcm9wZXJ0aWVzCj4gCj4gQ2hhbmdlcyBmb3Ig
djY6Cj4gIC0gYWRkZWQgZHRzIGV4YW1wbGUgb2YgYnVzIGhpZXJhcmNoeSBkZWZpbml0aW9uIGFu
ZCB0aGUgaW50ZXJjb25uZWN0Cj4gICAgY29uc3VtZXIsCj4gIC0gYWRkZWQgbmV3IGJ1cy13aWR0
aCBwcm9wZXJ0eS4KPiAKPiBDaGFuZ2VzIGZvciB2NToKPiAgLSBleHlub3MsaW50ZXJjb25uZWN0
LXBhcmVudC1ub2RlIHJlbmFtZWQgdG8gc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50Cj4gLS0t
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZyZXEvZXh5bm9zLWJ1cy50eHQgICAgIHwg
NjggKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKCkFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
