Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA351E00
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECAB89E4C;
	Mon, 24 Jun 2019 22:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F3189E4C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:13:23 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p17so14183125ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6ucUb/4G6TX7U6IlvaXO7Noph77Huv96zwgj/iVbk4=;
 b=lrykwSbW51eVA6FKws7HIxhRWVNo0haT8RLBT8NC8dglTX76ZjuJjSLmFnzCT8wfrg
 BVjKxQUe/ym1LquoAuTaKilrr+q+VX1m5hR9OiAgzvzpvab/Q/6TL4tHfPeBjwK20cEs
 nTECkL6PrO8iFrC58Dc5OgiQUtSeinOJO9m/RXqPzrsZNAGg5neujFLEmgqbLEordSQ/
 eh2CpFX7wozI4T5LIUSA3PI178s+UqgoOJzzPZjnEHAMXJ3mODcI6a6JGdEJq/EoPvc4
 s5vNnUIrDdMpWk/xI7Y4XcrZ/FNHt6Cwcezca3BCIaMlflyV8q9MqcIQnk+NMIxlXoQ0
 6nxA==
X-Gm-Message-State: APjAAAVhzXgcQC8fVh7KG658I1/Krd+WHaXZfViMWb+TDATQD6+Vrse6
 4tCc+6LE3DtsGSAO/w54pgv2G1/hD9tgoBkqJz4wug==
X-Google-Smtp-Source: APXvYqzuILOmlRlfzB4LigJuOFz6xkIbsL4hLOVKc/1qZByIgUnbCmOIDWO1UqiLgRGGrL9IShuXg3gaJHpmgCB46gU=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr59447382ljg.62.1561414402129; 
 Mon, 24 Jun 2019 15:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-11-robh@kernel.org>
In-Reply-To: <20190624215649.8939-11-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 00:13:10 +0200
Message-ID: <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=E6ucUb/4G6TX7U6IlvaXO7Noph77Huv96zwgj/iVbk4=;
 b=Mdb29tXw/X8t1nTGw1Tb/az/GIy3MBpx/mG9kBd3XormoeMtZIiNk11sY5SclYB087
 C4XYpgkY6bBM5A1LgC+8ChSE8+hNnU/P6pDAwmHzzKztl4+9pGlxydZkItv+oZMfKfUh
 eJoCleDb/9fpZjoJJW99YaiZgFBCS5YnLl40mGgfl3C4X9D6QqPNnu7BJnshXGGDg+vm
 R9XtYGNyVdy5alZNZIwaHwAsmqrVCzdLhDdeMEh2Ulfg3Jz1LQqx08VSyPa0eGTuvAF1
 oBpQjRHm08vzaaolL5N3HfBcXBSaJidGyvBdAS7/ByxXCq4MsuGqdIGvpYxc4v4J+wRy
 o7Uw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NTkgUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IENvbnZlcnQgdGhlIHRwbyx0cGcxMTAgcGFuZWwgYmluZGluZyB0byBE
VCBzY2hlbWEuCj4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
Pgo+IENjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpBd2Vz
b21lLCBmaXhlZCB1cCB0aGUgTUFJTkFUSU5FUlMgZW50cnkgYW5kIGFwcGxpZWQgYW5kCnB1c2hl
ZCBmb3IgRFJNIG5leHQgd2l0aCBteSBSZXZpZXdlZC1ieS4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
