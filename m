Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC0CC5BD
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 00:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235AE6EC2B;
	Fri,  4 Oct 2019 22:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B2D6EC2B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 22:21:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y127so5534372lfc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 15:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9NX5JuTWafrd7iXTgyMS4RoKwJ5yHBPv8xmUFX4nrZA=;
 b=jlQLwBblnWfn+xofVk+l96FCt6exQZ3PXnz2nx/uDJ5ZKCLhvQ2V0vKYbIKHBjSP7W
 eAXKVTkxRotEfqHobBVzTuvEaXHDC/fZuoRSWFFS7Tjzl8K8FNtl3hmMr+QSME85LcuI
 2zMJdBGzIP/DU9gtlw5+Sp9DcNYR3K8A/ZgNOxpSFGwkqkFYJRwUha1RXoKU12F6QkvV
 2OHn2yb9yjRybe2mDYyMn4tlPXcIgAXzAyJySQM9V/Lr+vKhpPw0ubhJiQU5GDOMrA5e
 s21kvVY+IAgVXSLSL7xDMUj2KH30IdHMuwlCcJg9r0Rm63I7t1DzrRgJPzH3u7SmC4fT
 SUEw==
X-Gm-Message-State: APjAAAWlHghWGvpXPoTIqNGim6hKqLakFOlbiZk8ShPlEowzyKwStcri
 TQDjfDrGHSNBvfrzDsOwGO3xjjI7N0gcQyv9WzxBwA==
X-Google-Smtp-Source: APXvYqxO/Wj6yEjUFPz44eOAVE0OIWbXwEw1qgTNOC8kPeD8B+ai3ePplrGXWyqLgU0QgY9MZ/8+S34Igmsja/QXRvg=
X-Received: by 2002:a19:48c3:: with SMTP id
 v186mr10232582lfa.141.1570227662211; 
 Fri, 04 Oct 2019 15:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
 <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
 <CACRpkdYDuAx6OhFYiXT+79a1NphtfPQfyY=o7jKi0Bas5vr7+g@mail.gmail.com>
 <20191003151555.64qabct3jmd74ypi@gilmour>
In-Reply-To: <20191003151555.64qabct3jmd74ypi@gilmour>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Oct 2019 00:20:50 +0200
Message-ID: <CACRpkdaOxKPd2CrB4F7QQasov85C83f3NEqS8TvrzKXiC8-+uQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9NX5JuTWafrd7iXTgyMS4RoKwJ5yHBPv8xmUFX4nrZA=;
 b=MQiziV51a+gwItEpIvETwGGmI9QP0PC5GgUZXP/g56eByqgN3NZLQopBV1GRv2Bf3O
 U8sZhi4oYdp9BmSQN3toekTctMA9R3y6hXVohUHuYjstpKA3eqv2ulSEbAjwGoBXbtR5
 4XwdUzQsr1XOvxUr51XcmtfeSl1GGHz2QPOWcPL/A+lgIx8EgRx83tJqeUc319yBJiFr
 tiOH+0i9jZMuoIFCNAKKcgrhpB52LNBLj/x9F/yYhwEasRC0f94CKAWg/yS/0qOYsW+B
 UzCRpmdTQ1XF5zhwp6wMByySoDX1m3Jz2OI7Zz+uP8mDLmKkQklsdlVlvHM6UIhDP7Ah
 waKg==
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCA1OjE1IFBNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+ID4gPiA+IEZpeGVzOiA1ZmM1MzdiZmQwMDAgKCJkcm0vbWNkZTog
QWRkIG5ldyBkcml2ZXIgZm9yIFNULUVyaWNzc29uIE1DREUiKQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gPiA+Cj4g
PiA+IEJvdGggcGF0Y2hlcyBhcHBsaWVkIQo+ID4KPiA+IC4uLmJ1dCBJIGNhbid0IHB1c2ggdGhl
IGNoYW5nZXM6Cj4gPgo+ID4gJCBkaW0gcHVzaC1icmFuY2ggZHJtLW1pc2MtbmV4dAo+ID4gZGlt
OiA5ZmExZjk3MzRlNDAgKCJSZXZlcnQgImRybS9zdW40aTogZHNpOiBDaGFuZ2UgdGhlIHN0YXJ0
IGRlbGF5Cj4gPiBjYWxjdWxhdGlvbiIiKTogY29tbWl0dGVyIFNpZ25lZC1vZmYtYnkgbWlzc2lu
Zy4KPiA+IGRpbTogRVJST1I6IGlzc3VlcyBpbiBjb21taXRzIGRldGVjdGVkLCBhYm9ydGluZwo+
ID4KPiA+IE5vdCBldmVuIG15IGNvbW1pdCwgYXBhcnQgZnJvbSB0aGF0IGl0IGxvb2tzIGxpa2Ug
aXQgZG9lcyBoYXZlCj4gPiB0aGUgY29tbWl0dGVyIFNpZ25lZC1vZmYtYnkuIEknbSBjb25mdXNl
ZCBhbmQgZG9uJ3Qga25vdyB3aGF0Cj4gPiB0byBkby4uLiBhbnlvbmUgaGFzIHNvbWUgaGludHM/
Cj4KPiBZZWFoLCBpdCdzIHByZXR0eSB3ZWlyZCwgSSBqdXN0IHB1c2hlZCB3aXRob3V0IGFueSB0
cm91YmxlLgo+Cj4gRGlkIHlvdSByZWJhc2Ugb3Igc29tZXRoaW5nPwoKTm9wZS4uLiBldmVuIHRy
aWVkIHRvIHJlc2V0IGhhcmQgdG8gb3JpZ2luIDovCgpJIGd1ZXNzIGp1c3QgdHJ5IGFnYWluLi4u
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
