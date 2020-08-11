Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CD24187E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E6589E47;
	Tue, 11 Aug 2020 08:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B189E47
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:49:40 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id c16so12208418ejx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JyhuuMWd7YogCrS59pt8uDMySG2jKj/OWGQTIbewN6Y=;
 b=GefliBg9MiDwclBx0GFo6aCzJiaNUZqc30XFibnTfjfq87VhNZKthMqRVtW+BmvLzv
 ewzDVyYWF7jMYCKcFg0Q+1NxMme3JcsD7/FKMsRMBQosLR16rV6iBOPBqaQDkyTbx9bI
 l1QbsxGESxpiBCoaMuaTYiDv/z1uerVaMuS0isz+tcoymFRqW1Eag1xjPgt7bo3HPuFT
 0sj07Kz+XrTQb0/SCKZfYgjg0pU2bNYE8/+xGvJR8uqjw87Z00Ul7JmRM20s4qOsx/1z
 0+eP70/9D80AJ5u1STqkAyeYkYhNgKy9JS+wwGmVid7DpL5DeVZzh3JmhpebEIfTT7na
 rQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JyhuuMWd7YogCrS59pt8uDMySG2jKj/OWGQTIbewN6Y=;
 b=PckYiV/Mq2TNsoPiCwGs7byDzxu2Gmab2JFoNuuX4/K27pp5APz3svV+kbtX5NPUhf
 EFlu/EtMCKfNYluuNDG+vMeBqGB1x8u9O5JFEo7vVOA9PTn86zZQu+67+IHl8p81TgSz
 SMTOqcKDO51u5yjSKBpV3+mcjdhrfET/3ng6FRp5pnnn/S3Lj7b3w5r0caHa11BJhTdU
 C9TD5zJ3rkUMJ/jv5m7sSefs7J8o1BrAQOGB2VuL/++X9Dddnp939ircaemgzkowkRMT
 YQ8jsJquRFf+3htXjJfdR2DKUrV6hRvtQqvceevD6iQgZSTfjBM9hdXkIU/HqluD8n0C
 0Osg==
X-Gm-Message-State: AOAM5320Ve26ctXBjUEsUieqPerrxHg02TxNUPwQk8fopg71jJAtqAuI
 V1WNI4ob42ljRQbUq3lUwQy3IV7xoa3vnmrFD0END14+
X-Google-Smtp-Source: ABdhPJx0vEUYAYzWk3DRvltT2WRb2F9kwcEygMH1AVA/g46EaIJ2NPJQJhsk4gHwVHHXXYFWmCDGmLyqbfaBtDszLX0=
X-Received: by 2002:a17:906:13d8:: with SMTP id
 g24mr24608037ejc.317.1597135777987; 
 Tue, 11 Aug 2020 01:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200811074658.58309-1-airlied@gmail.com>
 <CAPM=9tw2nZB569FUw_KGhhP07m0n8ZugcFNrAsa0kn+9xtndsg@mail.gmail.com>
 <ceca6880-201f-a4b1-4d07-caac3e570e93@gmail.com>
In-Reply-To: <ceca6880-201f-a4b1-4d07-caac3e570e93@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 11 Aug 2020 18:49:26 +1000
Message-ID: <CAPM=9tzgiwR3kLKo92ncAL+D7dxJbSNVA6BUF8Pic7-NM_8vDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: init mem->bus in common code.
To: "Koenig, Christian" <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBBdWcgMjAyMCBhdCAxODo0MiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSSd2ZSB0b3RhbGx5IG1pc3NlZCB0
aG9zZSBhbmQgc3RpbGwgZG9uJ3Qgc2VlIGFueSByZWZlcmVuY2UgaW4gYW55IGluYm94Cj4gdG8g
dGhlIG9yaWdpbmFsIG1haWwgb3IgcGF0Y2ggIzIgaW4gdGhpcyBzZXJpZXMuCgpJIGZvcmdvdCB0
byBjYyB5b3Ugb24gdGhlIG9yaWdpbmFsIHBvc3RpbmcsIGJ1dCB0aGV5IHNob3VsZCBiZSBvbiBk
cmktZGV2ZWwKCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODA1MTcv
Cj4KPiBCdXQgdGhpcyBwYXRjaCBhdCBsZWFzdCBsb29rcyBsaWtlIGl0IG1ha2VzIGEgbG90IG9m
IHNlbnNlLgo+Cj4gQlRXOiBEb2VzIGFueWJvZHkga25vdyB3aHkgd2Ugc2VwYXJhdGUgYmFzZSBh
bmQgb2Zmc2V0IGhlcmU/IFRoYXQKPiBkaXN0aW5jdGlvbiBzZWVtcyB0byBiZSBzdXBlcmZsdW91
cyBhcyB3ZWxsLgoKSSB0aGluayBiYXNlIGlzIG9ubHkgdXNlZCBmb3IgcHJlbWFwcGVkIG9iamVj
dHMsCgpEYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
