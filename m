Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF5C06F5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 16:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBE26E886;
	Fri, 27 Sep 2019 14:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967756E886;
 Fri, 27 Sep 2019 14:06:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 5so6784779wmg.0;
 Fri, 27 Sep 2019 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xi3+ATvXzmXB/Dt4LOoB4YHPPwUJEINFuh3xzYVNUyg=;
 b=I7Tu4kiffwF44i2H7ukworitmoXxFmHlRTYjpymRdxXBndPBlkyNFg4MgR+dnrhSq/
 WgxOurrrAs7HqeuUKSxR4dfaMJduhtPAMqKVnz/OGs9xLMhykGmoa+6WhKia4aS0SuqP
 Tf4gcbzwtUZPmaUHm/UdJlPaTWDcZdbG8V00LI9s+BuLxmMHv42sSx7PscFxY4am9lRl
 nN4X/1Hxrfb4Jp3cPkK14/u21sYhEhLoZA4bOKK0Ny4IAvvmaN9Po3EvE7XI5W4vmBou
 7xP3epGbm1U5cZkSLoXqLvf5RtJLNjMIn0ByMTzinMPIQL4tTbKOFkBjR2TGWhmZ6nof
 d/+g==
X-Gm-Message-State: APjAAAVHwYAMLOxGfprejgkM1bUjXbzIRltyCHdfKnV+imf8g7Abd8G9
 UtYSct8LjLlon910hmZXRkgexrebo9jFm5Ggbjw=
X-Google-Smtp-Source: APXvYqy724GfC1LKMOovLwoRie2uhk3qAkotzUOMibqrwjt0y8/YsOOfu071krqomAn81ggZE+uK8mj6MX9cFijwB24=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr7325631wmc.141.1569593166157; 
 Fri, 27 Sep 2019 07:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190926225122.31455-1-lyude@redhat.com>
 <20190926225122.31455-3-lyude@redhat.com>
In-Reply-To: <20190926225122.31455-3-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 10:05:54 -0400
Message-ID: <CADnq5_MR_WZHOMa0JQWpm9fZgpsCWFpmO1B5Rph_OVhje6kokg@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/amdgpu/dm/mst: Remove unnecessary NULL check
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xi3+ATvXzmXB/Dt4LOoB4YHPPwUJEINFuh3xzYVNUyg=;
 b=o4VyjfsQmpqzylyql6Fe4TZspDv9dduX8LILxcgo8JecSuLAxMDyXcQlMEJbkxKyR3
 cXGOvJ9f6avucRDBIchg/Kf8o22pmQlaYY2yVrAMOsUBTCjK0FX7O/utMefJ+0H1Jvov
 rfG9JBsp6oXwc/JLRWjT624+YylY3OlLAZO7snD1iVR2efeXRSX47qp8ENgM7dbTW6fK
 P5X5lPG+v5LPpAhwOFmF0P/X1bE72vJRTyfROT+W+FvlNBzNEKjwsIW8pCKAxQrRt8kY
 XN6raMwVzVYL8kxyQ1xMr6kp/iSOQWaFXrXzZYAPohe51uGEBGGDECEN2cjNQVLwnEgr
 wDSw==
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Francis <David.Francis@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNjo1MiBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IGtmcmVlKCkgY2hlY2tzIHRoaXMgYXV0b21hdGljYWxseS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQW5kIGFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwo+
IGluZGV4IDE4NWJmMGUyYmRhMi4uYTM5OGRkZDFmMzA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMKPiBAQCAtMTQ0LDEwICsxNDQsOCBAQCBkbV9kcF9tc3RfY29ubmVjdG9yX2Rlc3Ryb3ko
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgICAgICAgIHN0cnVjdCBhbWRncHVf
ZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rv
cihjb25uZWN0b3IpOwo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9lbmNvZGVyICphbWRncHVfZW5j
b2RlciA9IGFtZGdwdV9kbV9jb25uZWN0b3ItPm1zdF9lbmNvZGVyOwo+Cj4gLSAgICAgICBpZiAo
YW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZWRpZCkgewo+IC0gICAgICAgICAgICAgICBrZnJlZShhbWRn
cHVfZG1fY29ubmVjdG9yLT5lZGlkKTsKPiAtICAgICAgICAgICAgICAgYW1kZ3B1X2RtX2Nvbm5l
Y3Rvci0+ZWRpZCA9IE5VTEw7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBrZnJlZShhbWRncHVfZG1f
Y29ubmVjdG9yLT5lZGlkKTsKPiArICAgICAgIGFtZGdwdV9kbV9jb25uZWN0b3ItPmVkaWQgPSBO
VUxMOwo+Cj4gICAgICAgICBkcm1fZW5jb2Rlcl9jbGVhbnVwKCZhbWRncHVfZW5jb2Rlci0+YmFz
ZSk7Cj4gICAgICAgICBrZnJlZShhbWRncHVfZW5jb2Rlcik7Cj4gLS0KPiAyLjIxLjAKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBt
YWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
