Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B3F7DA6B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD936E4D7;
	Thu,  1 Aug 2019 11:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433FD6E4D7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:38:31 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o101so73865062ota.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2019 04:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=inqwfRmfEk+ixkWc1er0351Xu7C3pd72Cp90CBeM7pw=;
 b=iwhqi55y6yoOsdfzEqupD3ZH8phdRwbiTPvOFBq5JggZE+JaQ2ggDKKA29QhTRTnLQ
 Eao/cLdWNEAsdjJXr2tY3ERLxWCu5/WknbO2K/7tQOk30I1lQ+sRjLds1howkImaCMKX
 uyJcwFSOzqiCjP3QMG9P3JvwoQ4azvC30Ie5Xwlt2Ci5widXGHY5AhjO7gTMp0tVdaqt
 NUXqJqPGAmNzs6mfM4pgwgU656pxyO19YXZGM9cdS/06douzM6ZK5ziesMlU0/hIBeRT
 JlkrxBXycUHKnz+E0wGKg5MSgXWMEjEhmBHcPYqu1LVoniBH+EQaT1h8eTlRbhx0Z9W7
 UlPg==
X-Gm-Message-State: APjAAAXnWsD0EUYrdamsOuX9lRS2Qz669xWxHf73Z/Xnd4vjWGgXKBmL
 yip9g/WJ3VqzcenVenUq9d7LFJ3YkUxukMsX2N8=
X-Google-Smtp-Source: APXvYqyZRZjHvndeR3WlGPmFUAiu4bkGDxPS56T0MOFfbaKeaxR1K2a+EmKAeMlice9p7Y5Wwiv/7S45R1xkix5IUzw=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr13137003oth.281.1564659510526; 
 Thu, 01 Aug 2019 04:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190705092613.7621-1-tzimmermann@suse.de>
 <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
In-Reply-To: <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 1 Aug 2019 13:38:18 +0200
Message-ID: <CAKMK7uFTYJxF_JHwRjAN_nV=OCuFtx376H_7ku2H_0S-r9nRPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=inqwfRmfEk+ixkWc1er0351Xu7C3pd72Cp90CBeM7pw=;
 b=d6Kk6kJbHp2hIOHmyLPIfNtxKsYZ09pHZKaPc/eFEm+ZJIA5hS4XLji6HN044L5xhN
 Wopvvth//rw9L7xLdXGIQlw/rWlQNF/b+O3ntF+MtFjwoAAcXoE7KIJHfWGRCsRR6YJE
 PRjMOWMH1sVjVbUbOX5bWNUlW6g+iB6plCdYo=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA5OjA0IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+IGFuZCByZW1vdmVzIGEgbGFyZ2UgYW1vdW50
IG9mIGZyYW1lYnVmZmVyIGNvZGUgZnJvbSB0aGVzZSBkcml2ZXJzLiBGb3IKPiA+IGJvY2hzLCBh
IHByb2JsZW0gd2FzIHJlcG9ydGVkIHdoZXJlIHRoZSBkcml2ZXIgY291bGQgbm90IGRpc3BsYXkg
dGhlIGNvbnNvbGUKPiA+IGJlY2F1c2UgaXQgd2FzIHBpbm5lZCBpbiBzeXN0ZW0gbWVtb3J5LiBb
MV0gVGhlIHBhdGNoIHNldCBmaXhlcyB0aGlzIGJ1Zwo+ID4gYnkgY29udmVydGluZyBib2NocyB0
byB1c2UgdGhlIHNoYWRvdyBmYi4KPgo+IFNvLCBib2NocyBpbiA1LjMtcmNYIGlzIGJyb2tlbiwg
YW5kIHBhdGNoZXMgMSsyKzMrNSBvZiB0aGlzIHNlcmllcyB1bmJyZWFrCj4gaXQuICBTZXJpZXMg
YWxyZWFkeSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCwgYnV0IHRoYXQgZG9lc24ndCBoZWxwIGJv
Y2hzCj4gaW4gNS4zLgo+Cj4gV2hhdCBpcyB0aGUgdXN1YWwgd2F5IHRvIGhhbmRsZSB0aGlzPwo+
IEp1c3QgY2hlcnJ5LXBpY2sgdGhlIGZvdXIgcGF0Y2hlcyBpbnRvIGRybS1taXNjLWZpeGVzIGFu
ZCBwdXNoPwoKQmVzdCB3b3VsZCBiZSB0byBwdXQgdGhlIHBhdGNoZXMgaW50byAtZml4ZXMgZnJv
bSB0aGUgc3RhcnQuIENoZXJyeQpwaWNrIHdvcmtzIHRvbywgaWYgaXQncyBub3QgdG9vIGludmFz
aXZlLiBPdGhlcndpc2UgcmV2ZXJ0IGluIC1maXhlcywKYW5kIHJlbWVtYmVyIHRvIG5vdCBjYXJy
eSB0aGF0IHJldmVydCBvdmVyIHdoZW4gYmFja21lcmdpbmcuCi1EYW5pZWwKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1
IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
