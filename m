Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122E3B85A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 17:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8478915E;
	Mon, 10 Jun 2019 15:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E646E8915E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:31:58 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A71662089E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:31:58 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id w187so5734847qkb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 08:31:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUMiIEpKeRNYiDmWslIC0n/2dW3/xQkn7eLpv9zXd25FVacEQfh
 RwzDckgg3sevvJAY2xS8vK+RCWOqsJfKM/67nw==
X-Google-Smtp-Source: APXvYqw0OxqMSWs8+SYXZNvQbXxxZSJg0agNd56eOYVyTD4ihyKNkQhw4HsEujYAb3s4Y2JMOfvcVEc4gMBFnpnkxgQ=
X-Received: by 2002:a05:620a:5b1:: with SMTP id
 q17mr54931831qkq.174.1560180717905; 
 Mon, 10 Jun 2019 08:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190605184859.9432-1-ezequiel@collabora.com>
In-Reply-To: <20190605184859.9432-1-ezequiel@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Jun 2019 09:31:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JFuj4r+ROeAcsg+E77uNeR+JwSgC2QSdzhD-AVdZ0BA@mail.gmail.com>
Message-ID: <CAL_Jsq+JFuj4r+ROeAcsg+E77uNeR+JwSgC2QSdzhD-AVdZ0BA@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Require the simple_ondemand governor
To: Ezequiel Garcia <ezequiel@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560180718;
 bh=ZgX6bL9ewbzBRq3r+lqiy5GpvVLmWrhGH5awYHEdxWc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hA+fhz+RCj52GclgzSiDs/fuEFv1m6Ia4wvjD3p+dy79ExKzT6DyCr1NOIGzgp/zG
 sj1nm6FK4zv5HaT0+EjcWO9Kc444qgCyEYpThCtgyD5O96+LP+qvwWCeR0qoY5xj1Z
 6sy2o2q7t97TA2HGAS5XAxSjaZeX4fPXSGvRJTwk=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gNSwgMjAxOSBhdCAxMjo0OSBQTSBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVs
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gUGFuZnJvc3QgZGVwZW5kcyBvbiB0aGUgc2ltcGxl
X29uZGVtYW5kIGdvdmVybm9yLCBhbmQgdGhlcmVmb3JlCj4gaXQncyBhIHJlcXVpcmVkIGNvbmZp
Z3VyYXRpb24uIFNlbGVjdCBpdC4KPgo+IEZpeGVzOiBmMzYxN2I0NDlkICgiZHJtL3BhbmZyb3N0
OiBTZWxlY3QgZGV2ZnJlcSIpCj4gU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lhIDxlemVx
dWllbEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvS2Nv
bmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkFwcGxpZWQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
