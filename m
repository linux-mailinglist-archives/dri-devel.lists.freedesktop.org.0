Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD6046F00
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 10:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6C289700;
	Sat, 15 Jun 2019 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A5896B0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 08:32:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so3248647lfm.11
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 01:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjwR1P3nYqPWLT9muy0ycj5C07VXeDdv+J5Prl0Wo2o=;
 b=tsvQvlxV0o8h9IRZHOJGRtz9DSObKv6gdtjlFxxbeZFbP1KJ6hP7OMxciPHk0qGdBr
 7WQWfqSoFNpclGL/1k/8rjxziSQudzk7GuspqgbO/geXKpDxtYMhs1d631ra2psMxkwn
 qo0bxEuZ9WsOSqIqRk0BiBP6c6Ep1h9jGwqoTE5Qr+EP9DIIbBI0nk5WM2ZNHaRboyqa
 bquB4u5xhZ5djlYYFR+r6Psz5WO7EbRQmsz4XcYesb3JdvQgtlAfSxopsGOiROe15uUb
 sPHAlQEZpUA8PNOt6FwLBS74JDvlQH1jzskBuGvcDhgLp6sIXv7pUS+Uf+MGCJMOlaB+
 kV9g==
X-Gm-Message-State: APjAAAVrklu4TEGe/L/brsazZM3BxtljavuqBmbGw0E4amXjnyq0cL2W
 BKlf58HlFfrLExDHOWOn8MNQzPJ8BSy9gRJ1efYg+Tf2
X-Google-Smtp-Source: APXvYqx7fV6hUQeo0nV2EzhymNAvcrXOqJ/GJJfRiVJPyYhcXIS8wDg1t0+yKVlJX4viX4vJxz6ck1h9oO17DjQjwfQ=
X-Received: by 2002:a19:7616:: with SMTP id c22mr7556786lff.115.1560587519986; 
 Sat, 15 Jun 2019 01:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-19-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-19-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Jun 2019 10:31:48 +0200
Message-ID: <CACRpkdY6Y5iW+mLVfMAWZMwQav6PqGEaRNnar8WQhM_LV67PxQ@mail.gmail.com>
Subject: Re: [PATCH 18/59] drm/mcde: Drop drm_gem_prime_export/import
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yjwR1P3nYqPWLT9muy0ycj5C07VXeDdv+J5Prl0Wo2o=;
 b=sefGHk9mGFwHoVtwhhHZSQLLy8dRBHmY55s3RCPSLZMLf2avVnkFZRPJpZB0Mwv/qj
 ei17GBEZVJzvFbERlyzSzfXGdtX36AyYCblWxhRo7Mwdfh7/GmtTfyW2w9bNTNzIrZqA
 rLFEgnwzdl/zcSvAnJAN5KpDsnDblpuyM2Lurs2Mng44KxWzZQnskiLyb8w19wWm1pqr
 cBqDVxp05p7JoEfPvzWmzaBGK2GTBflptcBP+IpmxUfilU9nSWqor42n+ReXqF/QraUu
 Z1nLLAOg6i1mUOH42MqFJoZ36RxAO2KUVrBaCrZK3FuE57yVOXDg5MBlPOuw78rFs5K4
 k7hw==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzYgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cgo+IFRoZXkncmUgdGhlIGRlZmF1bHQuCj4KPiBBc2lkZTog
V291bGQgYmUgcmVhbGx5IG5pY2UgdG8gc3dpdGNoIHRoZSBvdGhlcnMgb3ZlciB0bwo+IGRybV9n
ZW1fb2JqZWN0X2Z1bmNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
