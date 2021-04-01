Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7C351595
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 16:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684946ECBD;
	Thu,  1 Apr 2021 14:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B4C6ECBD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 14:15:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECD0D6135D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617286553;
 bh=pmDesK41LONSTi91JrhFXtlnAIl5KT6c5rqTOesiqVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VGrY4kmH8EHHTWyxrg3HcsoR66tE4YXh6S9mePCOdTaFF339+KqpEgYXhf0wXOpps
 B4QzWM3g3xkRxjzJDVEe96uUqAjIBLZ5tTCEC2Q48OBh0o6zIDveZmFHWJp5aL6AdY
 tUQHpe7f1aO216OG5hDM+3xRg28LePKijAGaX/xD+0Nb3ARQigDVOIpmIvQMcJfcLE
 53HIvikF41lx2C0zoGUeeACL2ZFDEUcAWjOAyVXJ9IAr33ErCZzD4lubqfuXVbpblN
 ZirOsM4TCo0f35jW90aTokhU1P4OvSL6BUdYzpmKbM/MzzfZCpqirryqP2nVSEYJTz
 YLcjoQtXBg0Sw==
Received: by mail-ed1-f46.google.com with SMTP id bf3so2144907edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 07:15:52 -0700 (PDT)
X-Gm-Message-State: AOAM532cBY8z1m06rmSRvkf5+2YESum7JjEQlWIZDypqeupoL50Lcv83
 tUtxkm/10E1GVfLD+7T09YHUutMw180cozuYsg==
X-Google-Smtp-Source: ABdhPJx/x1Pvir9uz6tNOKEPJelZRcuER41Ie69i0uJGB6GBrIi38rDSfnM6IWWeLRt5oSU65aB9EXkOeJfnHtfghlI=
X-Received: by 2002:a05:6402:b48:: with SMTP id
 bx8mr10450006edb.162.1617286551463; 
 Thu, 01 Apr 2021 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210330110902.14178-1-dafna.hirschfeld@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Apr 2021 22:15:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9n-VVPPEfLag7uVuPG+iM_NWccWgbyC3Eo9+DGYyz=Gw@mail.gmail.com>
Message-ID: <CAAOTY_9n-VVPPEfLag7uVuPG+iM_NWccWgbyC3Eo9+DGYyz=Gw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/mediatek: Don't support hdmi connector creation
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dafna3@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhZm5hOgoKRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEu
Y29tPiDmlrwgMjAyMeW5tDPmnIgzMOaXpSDpgLHkuowg5LiL5Y2INzowOeWvq+mBk++8mgo+Cj4g
Y29tbWl0IGYwMTE5NTE0ODk2NyAoImRybS9tZWRpYXRlazogbXRrX2RwaTogQ3JlYXRlIGNvbm5l
Y3RvciBmb3IgYnJpZGdlcyIpCj4gYnJva2UgdGhlIGRpc3BsYXkgc3VwcG9ydCBmb3IgZWxtIGRl
dmljZSBzaW5jZSBtdGtfZHBpIGNhbGxzCj4gZHJtX2JyaWRnZV9hdHRhY2ggd2l0aCB0aGUgZmxh
ZyBEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1IKPiB3aGlsZSBtdGtfaGRtaSBkb2VzIG5v
dCB5ZXQgc3VwcG9ydCB0aGlzIGZsYWcuCgpGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVk
aWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gVGhlc2UgdGhyZWUgcGF0
Y2hlcyBmaXggdGhhdCBieSBhZGRpbmcgc3VwcG9ydCBmb3IgRFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SCj4gaW4gbXRrX2hkbWkgYnJpZGdlIGF0dGFjaG1lbnQuCj4KPiBjaGFuZ2VzIHNp
bmNlIHYyOgo+IDEuIHNxdWFzaCBwYXRjaCAzIHdpdGggcGF0Y2ggMiB0byBub3QgYnJlYWsgYmlz
ZWN0aW9uCj4gMi4gcmVtb3ZlIHRoZSBmdW50aW9uIG10a19oZG1pX2dldF9lZGlkIGFuZCBpbmxp
bmUgaXRzIGNvZGUgaW4gbXRrX2hkbWlfYnJpZGdlX2dldF9lZGlkCj4gMy4gc21hbGwgYWxpZ21l
bnQKPgo+IGNoYW5nZXMgc2luY2UgdjE6Cj4gMS4gc3BsaXQgdGhlIGZpcnN0IHBhdGNoIC0gbm93
IHRoZSBmaXJzdCBwYXRjaCBvbmx5IG1vdmVzIHRoZSBicmlkZ2Ugb3BzIHRvIHRoZSBhdG9taWMg
QVBJCj4gd2hpbGUgdGhlIHJlcGxhY2VtZW50IG9mIHRoZSBmaWVsZCAnY29ubicgd2l0aCB0aGUg
ZmllbGQgJypjdXJyX2Nvbm4nIGlzIGRvbmUgaW4gYSBuZXcgdGhpcmQgcGF0Y2guCj4gMi4gaW4g
dGhlIGZ1bmN0aW9uICdnZXRfZWxkJyB1c2UgdGhlIGN1cnJlbnQgY29ubiBvbmx5IGlmICdlbmFi
bGVkID0gdHJ1ZScuCj4KPiBEYWZuYSBIaXJzY2hmZWxkICgyKToKPiAgIGRybS9tZWRpYXRlazog
U3dpdGNoIHRoZSBoZG1pIGJyaWRnZSBvcHMgdG8gdGhlIGF0b21pYyB2ZXJzaW9ucwo+ICAgZHJt
L21lZGlhdGVrOiBEb24ndCBzdXBwb3J0IGhkbWkgY29ubmVjdG9yIGNyZWF0aW9uCj4KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAxNzQgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0
aW9ucygtKQo+Cj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
