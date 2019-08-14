Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D365F8E0FC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AF6E69E;
	Wed, 14 Aug 2019 22:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD3E6E69E;
 Wed, 14 Aug 2019 22:47:48 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j17so434956lfp.3;
 Wed, 14 Aug 2019 15:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mh51nkxw4i+pECwFXd8sLzk2KvgQQNpCm3d01V5SCLc=;
 b=U28sgPErsqp93OIl0OAuxaqD9mDtzDJyiYCnbqGHt/9WoVQgo4ABZXe/BGTbBBbmHm
 bUN0YrfPqQ5M4ybaaNgH9f7xuJOmv85kfaFoC6TcLDAf0niGdqVmKtL2L1cpRw5tVZND
 FBcAeZ5fmU0DBZcv/xgVrBYLMLL1oxXcEcyvGveVha+Ymnf2n6/U4OKq937tgqp5IBRT
 cfHkCEqaw6i5YirxoInZQCg3t1Xd9yj4lh52rUDP403N245leFQyGLFp6nsoBcfRqEJS
 eCRM/RNSudTySoY/GLAAJ4WpjS85QOlvSpmkoMbeaXGoSTLljmrIwBHCDB6GA40XWAPu
 BXsA==
X-Gm-Message-State: APjAAAUYuhm8iTdi4Sjz3PQlAr4TDwMicZRZM44Fy9eK8KAHFajuq/Bo
 N99jC1//Xj8tUQYbMN8ldapQtn0VgdcswaIhOcDNlA==
X-Google-Smtp-Source: APXvYqzycF1dfTKo9tsYRCYMSL5GBTHA1deD7nwmys7qc3LSEcP6H7UGH3733ZypXdOc1Uci79kRpKsqDioFqjLAIa4=
X-Received: by 2002:a19:f11a:: with SMTP id p26mr857848lfh.160.1565822866359; 
 Wed, 14 Aug 2019 15:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
In-Reply-To: <20190814213118.28473-2-kherbst@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 15 Aug 2019 08:47:35 +1000
Message-ID: <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mh51nkxw4i+pECwFXd8sLzk2KvgQQNpCm3d01V5SCLc=;
 b=CHvoGp4JQnh7/6igKiv8z9GCoTqJCrYoz+fxQiqhikcLHa4LSTrYMYcDueLpewcbV+
 XsOLYC4hlEUMy0W06WPLP2pbxcMpuNK9WPEKX/Zuqe+ZkRn/7j4TgMFU+g/V3cititf/
 R3VHGCxWAXQ1/UK7pzfhJAlwkcpcu3XDpiphxohzIWFBsDtc5qR7M6OWCkw2kpRVZth/
 527/3uI4ddV8f8XuSpfFD2G7OPazB/kgxg+NKAS6+afixY4TRIJVJW2ReiPubd8TONAD
 18iYDC3Oh3nd3IVbpy+yH1rjKpvDmbGNZgr5rsQcT/SST2W4tCDWuU+2vS7RViLWWnpV
 KAEA==
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBBdWcgMjAxOSBhdCAwNzozMSwgS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMx
YmNhZWYyZjY4ZTRhYmJkODcyNDJjLgo+Cj4gVGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIGRp
ZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9lc18gc3VwcG9ydCBpdCBhbmQKPiBpdCB3b3Jr
cyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPgo+IEFsc28gd2hhdCB3YXMgdGhlIGlzc3VlIGJlaW5n
IHNvbHZlZCBoZXJlPyBObyByZWZlcmVuY2VzIHRvIGFueSBidWdzIGFuZCBub3QKPiBldmVuIGV4
cGxhaW5pbmcgYW55IGlzc3VlIGF0IGFsbCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPgo+
IEFuZCBldmVuIGlmIGl0IG1lYW5zIGEgbXV4ZWQgZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8g
bWFrZSBpdCB3b3JrIGluc2lkZSB0aGUKPiBkcml2ZXIsIG5vdCBhZGRpbmcgc29tZSBoYWNreSB3
b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4KPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBk
cml2ZXJzIGRvIG9yIGRvIG5vdCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXku
Cj4KCkkgdGhpbmsgdGhlIHJldmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJl
ZSBhcyB0aGUgb3JpZ2luYWwKcGF0Y2hlcyB3ZW50IGluIHZpYSB0aGVyZSwgYW5kIHdlIHNob3Vs
ZCBnZXQgdGhlbSBpbiBhc2FwLgoKQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+CkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
