Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1DA874D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 20:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB2B895E1;
	Wed,  4 Sep 2019 18:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9968895E1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 18:43:20 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o101so21617712ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2019 11:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Op9qnQ3jr/N1XfDaE97newQpe/vOf3uhWlsq9msStkc=;
 b=VCzSCri132Ij3h9abFEnK4vE6RsJjxPUlab4aCZhcNCusdHWxqOQGAy+e8V4pzfzRn
 milkWmXKFI4onvDbJ5mWw25ZqM1qn2ZCdqd9ABNJYJKk3SESBMeQ3fFyNu5lpR9Vzd0/
 fwbCnMIXzhW3+3MUcSKbt3nMx30UrpKpyvIVVJ3uW9w48E1ogZYVN+VUttGrAYQHKcTy
 TP8BLFzbDjiVvWqu0iPhcpADpE+T8Tun+wU1w6cRooBsvkxCOJlDBmDLzaLi0jM0M0Gh
 BcK+FFAIy3aYIx2DQ+dv6UdgTqMi3luZPFhep9BQiFhpnrHaVl4NF8VboliGhIam7v0U
 uTbA==
X-Gm-Message-State: APjAAAUcPDnkxO8Yze6YGY0xUQZ4JU9Y1br6oxrJavSkmJ/ozb5dqyOe
 W4kH1jLI3ZIh4UqxSEUEjcti2QLG2G83w162nAIEiQ==
X-Google-Smtp-Source: APXvYqzAtEr8Xr1bNAXp4QS1LyGgyTO2pgZSwsKmZ7IeRxcn83f0DJyi0dFtJ+qcC/nBvT5V0w+fEdGw39OCehM+7Nk=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr31009352oto.204.1567622599908; 
 Wed, 04 Sep 2019 11:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
 <20190904171415.6kn6t2kvct3663us@linux-r8p5>
In-Reply-To: <20190904171415.6kn6t2kvct3663us@linux-r8p5>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 20:43:08 +0200
Message-ID: <CAKMK7uEftBT0HfgkEMR5LfpcXJoGReGAvk=_f4EdcUAfBaE_Pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ast,
 mgag200: Map console BO while it's being displayed
To: Davidlohr Bueso <dave@stgolabs.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Op9qnQ3jr/N1XfDaE97newQpe/vOf3uhWlsq9msStkc=;
 b=F/AV2QM3juyrUB6ZLqj5KDk8vImYdx+DTFlJZjKTXPOc8nWzCBG+X3hgDmm/ZpjsHR
 QJgO0dUtJuhZ8/wiFt8cvudQ57JCf3S45tRHG1uS10KmHA/UJPEEVRH3X3qjjyBESoIi
 Yf3T4HQmDBIcxBb2DOVJj4Wcn6DWegD80VgEc=
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
Cc: Feng Tang <feng.tang@intel.com>, kernel test robot <rong.a.chen@intel.com>,
 Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCA3OjE0IFBNIERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBzdGdv
bGFicy5uZXQ+IHdyb3RlOgo+IE9uIFdlZCwgMDQgU2VwIDIwMTksIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4gPkknbSBhbHNvIG5vdCBzdXJlIHdoZXRoZXIgd2UgaGF2ZSBhIHJlYWwgcHJvYmxlbSBo
ZXJlLCBpdCdzIGp1c3QgZGVidWcKPiA+bm9pc2UgdGhhdCB3ZSdyZSBmaWdodGluZyBoZXJlPwo+
Cj4gSXQgaXMgbm9uIHN0b3AgZGVidWcgbm9pc2UgYXMgdGhlIG1lbW9yeSByYW5nZSBpbiBxdWVz
dGlvbiBpcyBiZWluZyBhZGRlZCArCj4gZGVsZXRlZCBvdmVyIGFuZCBvdmVyLiBJIGRvdWJ0IHdl
IHdhbnQgdG8gYmUgYnVybmluZyBjeWNsZXMgbGlrZSB0aGlzLgoKWWVhaCB0aGUgcHJvcGVyIGZp
eCBpcyBzZXR0aW5nIHVwIGFuIGlvX21hcHBpbmcgaW4gdHRtIChvciBkcml2ZXJzKSBzbwp0aGUg
cGF0IHRyYWNraW5nIGlzIGNhY2hlZCwgYW5kIHRoZW4gdXNpbmcgdGhlIHJpZ2h0IHB0ZSB3cmFu
Z2xpbmcKZnVuY3Rpb25zLiBCdXQgdGhhdCdzIGEgbG90IG1vcmUgaW52b2x2ZWQgZml4LCBhbmQg
ZnJvbSBhbGwgdGhlCnRlc3Rpbmcgd2UndmUgZG9uZSB0aGUgcHRlIHJld3JpdGluZyBpdHNlbGYg
ZG9lc24ndCBzZWVtIHRvIGJlIHRoZQpiaWdnZXN0IGlzc3VlIHdpdGggbWdhZzIwMCBiZWluZyBz
bG93IC4uLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
