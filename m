Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728526A04E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F356E05F;
	Tue, 16 Jul 2019 01:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7090589973
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:56:32 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id l15so17517627otn.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 08:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxdnANqifDB1z1Ih8rPgPPFQ52+wPGcxB0Lct34ID5Q=;
 b=lXCMt3J+hybabeUmCzs4hNTGagKMvYpBLlqSVrOhbFtPYxAglKSIvLB+2AAZD8P3mq
 vofr4D6ZAjjuAZt8NUOaDmmPuzBb0JxxBJqdLApoUrhJ5VaUVct90318TdY/s3FNHYlP
 wUYvVFyadr6p/fG1xC2sku69HOIFlg1FoN7Hm0VKaj2rKagOrookTG9b7mv/Yg8e/DNm
 990lxwlVGybVm/27WPbpSSIPgoBt3rcHmPf42+xmkmp94NEk2TeKAJI+dsy5KJTjaKWx
 EyMKpNunev5fIiJgMilott0ehQ5mndrWXZ6Nd+lEsSUfCnzbEd6ttYUIaXJnGPW385p+
 IjNA==
X-Gm-Message-State: APjAAAU5I+PdEr+0Fw6jo4RjHIu5ZcJnhcXHpGlFWII799f+J2K3yhj2
 JJULj9PLGDZx73Y3C5z7s8TnX0eBcFKpJfoFV721CQ==
X-Google-Smtp-Source: APXvYqwsZvLcK5LidkOK7j4XvKdYHFQb2nVh/AtXUYin5kr5W0WlZFyIM9UGzPAW85pcfSoyZbDk7ZxnfK/q+cptnb0=
X-Received: by 2002:a05:6830:1cd:: with SMTP id
 r13mr8619272ota.99.1563206191242; 
 Mon, 15 Jul 2019 08:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
 <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
In-Reply-To: <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 15 Jul 2019 23:56:19 +0800
Message-ID: <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set callback
 function for plug event
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BxdnANqifDB1z1Ih8rPgPPFQ52+wPGcxB0Lct34ID5Q=;
 b=SA30rmEvAAB/UeWM0cJpboyXWomGji7I7a5x3X8IC2z8RDCcu48fRpx3oXaTPieM78
 hMUBvyfACXuvhVyl7122TsYzmlo3PSQz9JgHl3IzAfFzF4LUSFpBOVOTOS1B1L4yygl7
 QOOGtMtHFpJt8B1LZKpTsfOdvejMLuCIDQCalifs34k7ukv+KzyMS3/rAXEkr2VMjwP1
 SBtlOVlmpKFktDXSl32r68WJn6RZP964o2hS1wrBNhCu42BpzNeAZYsIqnpYlDH19pdT
 IooGaAqomRnAwqqNrb8iHZz4u/RbyBz6uQU3gz+bKjgxr0xq0hFlSy/JRzbwLlHSQ+Nf
 EO5w==
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
Cc: ALSA development <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNjo1OCBQTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgg
YWRtaW4KPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxMiwg
MjAxOSBhdCAwNjowNDozOVBNICswODAwLCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6Cj4gPiBBZGQg
YW4gb3AgaW4gaGRtaV9jb2RlY19vcHMgc28gY29kZWMgZHJpdmVyIGNhbiByZWdpc3RlciBjYWxs
YmFjawo+ID4gZnVuY3Rpb24gdG8gaGFuZGxlIHBsdWcgZXZlbnQuCj4gPgo+ID4gRHJpdmVyIGlu
IERSTSBjYW4gdXNlIHRoaXMgY2FsbGJhY2sgZnVuY3Rpb24gdG8gcmVwb3J0IGNvbm5lY3RvciBz
dGF0dXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0Bj
aHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3NvdW5kL2hkbWktY29kZWMuaCAgICB8
IDE2ICsrKysrKysrKysrKysKPiA+ICBzb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYyB8IDQ1
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA2MSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvaGRt
aS1jb2RlYy5oIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKPiA+IGluZGV4IDdmZWE0OTZm
MWYzNC4uOWE4NjYxNjgwMjU2IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNv
ZGVjLmgKPiA+ICsrKyBiL2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oCj4gPiBAQCAtNDcsNiAr
NDcsOSBAQCBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMgewo+ID4gICAgICAgaW50IGNoYW5uZWxz
Owo+ID4gIH07Cj4gPgo+ID4gK3R5cGVkZWYgdm9pZCAoKmhkbWlfY29kZWNfcGx1Z2dlZF9jYiko
c3RydWN0IGRldmljZSAqZGV2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCBwbHVnZ2VkKTsKPiA+ICsKPgo+IEknZCBsaWtlIHRvIHBvc2UgYSBxdWVzdGlvbiBm
b3IgcGVvcGxlIHRvIHRoaW5rIGFib3V0Lgo+Cj4gRmlyc3RseSwgdHlwZWRlZnMgYXJlIGdlbmVy
YWxseSBzaHVubmVkIGluIHRoZSBrZXJuZWwuICBIb3dldmVyLCBmb3IKPiB0aGVzZSBjYXNlcyBp
dCBzZWVtcyB0byBtYWtlIHNlbnNlLgo+Cj4gSG93ZXZlciwgc2hvdWxkIHRoZSAicG9pbnRlciIt
bmVzcyBiZSBwYXJ0IG9mIHRoZSB0eXBlZGVmIG9yIG5vdD8gIFRvCj4gc2VlIHdoYXQgSSBtZWFu
LCBjb25zaWRlcjoKPgo+ICAgICAgICAgdHlwZWRlZiB2b2lkICgqaGRtaV9mb28pKHZvaWQpOwo+
Cj4gICAgICAgICBpbnQgcmVnaXN0ZXJfZm9vKGhkbWlfZm9vIGZvbyk7Cj4KPiB2cwo+Cj4gICAg
ICAgICB0eXBlZGVmIHZvaWQgaGRtaV9mb28odm9pZCk7Cj4KPiAgICAgICAgIGludCByZWdpc3Rl
cl9mb28oaGRtaV9mb28gKmZvbyk7Cj4KPiB3aGljaCBpcyBtb3JlIGluIGtlZXBpbmcgd2l0aCBo
b3cgd2UgY29kZSBub24tdHlwZWRlZidkIGNvZGUgLSBpdCdzCj4gb2J2aW91cyB0aGF0IGZvbyBp
cyBhIHBvaW50ZXIgd2hpbGUgcmVhZGluZyB0aGUgY29kZS4KSSBoYXZlIGEgZGlmZmVyZW50IG9w
aW5pb24uICBJdHMgc3VmZml4ICJfY2IiIHNlbGYtZGVzY3JpYmVkIGl0IGlzIGEKY2FsbGJhY2sg
ZnVuY3Rpb24uICBTaW5jZSBmdW5jdGlvbiBhbmQgZnVuY3Rpb24gcG9pbnRlciBhcmUgZXF1aXZh
bGVudAppbiB0aGUgbGFuZ3VhZ2UsIEkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBlbXBoYXNpemUg
dGhhdCBpdCBpcyBhCmZ1bmN0aW9uICJwb2ludGVyIi4KCgo+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
dGhlIGxhdHRlciBiZXR0ZXIgbWF0Y2hlcyB3aGF0IGlzIGluIHRoZSBrZXJuZWwncwo+IGNvZGlu
ZyBzdHlsZSwgd2hpY2ggc3RhdGVzOgo+Cj4gICBJbiBnZW5lcmFsLCBhIHBvaW50ZXIsIG9yIGEg
c3RydWN0IHRoYXQgaGFzIGVsZW1lbnRzIHRoYXQgY2FuCj4gICByZWFzb25hYmx5IGJlIGRpcmVj
dGx5IGFjY2Vzc2VkIHNob3VsZCAqKm5ldmVyKiogYmUgYSB0eXBlZGVmLgo+Cj4gb3IgbWF5YmUg
RG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QgbmVlZHMgdXBkYXRpbmc/Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
