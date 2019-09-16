Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA82B341D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 06:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5A16E0F3;
	Mon, 16 Sep 2019 04:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1B6E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 04:27:26 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p10so16983307qkg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 21:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XoVOeFGGpV3NsaCJeRAeZx/5oPFfdQGr3uV2lPYd14=;
 b=SgBdUlKn4YgN9XE0ItbnYO8Qq14A/PcFe4NJY12670F17iAbZn343TdTSXKmjyrTtf
 sAPWtX4XjFlNNcs5FpxHVE6tsF81Z6RuTWtVpdTmADB8BGAMh9KUPNGeJn6w8JQiLKtg
 i+TGuJwTRyTZYlqcq+XvNNY2S1+pOVfmRFdvj04SoKYvqFLs12wPdkcPAnPc/9eUdE5Z
 3oCI95/sdkFZ2DWmzU719qXTSfv0JMu9sHE3h/rt5MpnRlUI5Ws9Xm+Kxc27WAJH4/Mw
 SlDmRGKu36FAw/uNCk+qGpZlOydMWrQMpIAr4JY8HlveyYfM8T4Ld4E2UV6L8yJt/K7I
 yx7w==
X-Gm-Message-State: APjAAAWETHQcCZHzKubS8qJQ9Jtx7SexYH/jviT32pUxF6QRzm9wwz61
 tJW+VC/HRwnQWB8sGAHH/P9IGb9rWz6FyPu9/aEh3w==
X-Google-Smtp-Source: APXvYqy3B5SLSjcNbHTRQV986urbgzRFhAJlX+7JHJVf+p+Rdmhf4pmAdsFzzlWtstjEUkxHrDwxjI5SO425T5cQqFE=
X-Received: by 2002:a37:4c54:: with SMTP id z81mr26591697qka.18.1568608045551; 
 Sun, 15 Sep 2019 21:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190912090404.89822-1-jitao.shi@mediatek.com>
In-Reply-To: <20190912090404.89822-1-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Sep 2019 12:27:14 +0800
Message-ID: <CANMq1KBdZmGEO-MH33mhc4wCheJE2TBiUAXtt=YVr5aARDpiJg@mail.gmail.com>
Subject: Re: [PATCH 0/3] add panel driver for innolux,
 p097pfg with ssd2825 bridge
To: Jitao Shi <jitao.shi@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8XoVOeFGGpV3NsaCJeRAeZx/5oPFfdQGr3uV2lPYd14=;
 b=SiThYn/jHEgjXTKt5tFheJ16F146aA4+g3/oEFUFc9xnOzCIkEkMsfp0W1k/bNvkO2
 Sble5sCBKiFAuTBst2wmEIh7L10XbYxXYXtEetW62FKP788Uv1+uiezj3/272jW5UD8v
 3qyAjU54jI6b/4xDNAV7pW78rOJq+UpM3Of5E=
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 cawa cheng <cawa.cheng@mediatek.com>, Sean Paul <seanpaul@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSml0YW8sCgpPbiBUaHUsIFNlcCAxMiwgMjAxOSBhdCA1OjA0IFBNIEppdGFvIFNoaSA8aml0
YW8uc2hpQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZHJpdmVyIHRvIHN1cHBvcnQgcGFu
ZWwgaW5ub2x1eCxwMDk3cGZnIHdpdGggYnJpZGdlIHNzZDI4NTguCj4gU1NEMjg1OCBjYW4gc3Bp
bHQgZHNpIDQgbGFuZXMgdG8gOCBsYW5lcy4KPgo+IEppdGFvIFNoaSAoMyk6Cj4gICBkcm0vcGFu
ZWw6IHBhbmVsLWlubm9sdXg6IEFsbG93IDIgcmVzZXQgcGlucyBmb3IgcGFuZWwKPiAgIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgaW5ub2x1eCxwMDk3cGZnX3Nz
ZDI4NTgKPiAgICAgcGFuZWwKPiAgIGRybS9wYW5lbDogcGFuZWwtaW5ub2x1eDogQWRkIHN1cHBv
cnQgZm9yIFAwOTdQRlogYmVoaW5kIFNTRDI4NTgKCkknbSB0aGUgYXV0aG9yIG9mIGF0IGxlYXN0
IHRoZSBmaXJzdCBwYXRjaCwgYW5kIGF0IGxlYXN0IHBhcnQgb2YgdGhlCnRoaXJkIG9uZSwgc28g
aXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciBpZiB5b3UgY2xhcmlmaWVkIHRoZSBvcmlnaW4gb2YK
dGhlIHBhdGNoZXMuCgpBbHNvLCBJIGRvIG5vdCBiZWxpZXZlIHRoYXQgdGhpcyBpcyB0aGUgcmln
aHQgYXBwcm9hY2ggKHRoaXMgd2FzCmFsd2F5cyBhIHRlbXBvcmFyeSBoYWNrIHRoYXQgd2UgaGFk
IG5vIGludGVudCB0byB1cHN0cmVhbSBhcy1pcyksIHdlJ2QKcHJvYmFibHkgd2FudCB0byBhZGQg
YSBwcm9wZXIgYnJpZGdlIGRyaXZlciBmb3IgU1NEMjg1OCwgYW5kIGFsbG93CmFyYml0cmFyeSBw
YW5lbHMgYmVoaW5kIGl0LgoKUGxlYXNlIGNvbnNpZGVyIHRoaXMgc2VyaWVzCk5hY2tlZC1ieTog
Tmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+CgpUaGFua3MsCgo+ICAuLi4v
ZGlzcGxheS9wYW5lbC9pbm5vbHV4LHAwOTdwZmdfc3NkMjg1OC50eHQgfCAgMzkgKysrKysKPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlubm9sdXgtcDA3OXpjYS5jIHwgMTQwICsrKysr
KysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgscDA5N3BmZ19zc2QyODU4LnR4dAo+Cj4g
LS0KPiAyLjIxLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
