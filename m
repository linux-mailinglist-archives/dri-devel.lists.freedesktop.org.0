Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46939F2FEF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A2B6E160;
	Thu,  7 Nov 2019 13:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D656E160
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:38:53 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id i15so939104ybq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 05:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UR+FMpDRyPvXwNuet63hIA/KDaiYBztB4W2oxpuqt4A=;
 b=dNgZUzveqFPYjW9B7AdjKgdjoMx6g8qN5zuYgBh2bn4yDunKAkXaYHkSg4KFJcqLo5
 mcnUXkRMRNwLwwpDOMEciXJ7wc3brPIrzSdFAVnZaui1yd920lgiTDy9LXEhUAhz9iOX
 803RYm9KqEovjLIq7S/I6EEOvRBm4w/Dp2wbfx0KtvlZUEuGdpF7/XRlBkIEjd340Qw0
 I3ZMnTU97p+UfWH8m/qkDR3AAKPR8wHkGD2l3fao3wg9pTHqcFbCgxgLf/a+Y0LHpkGa
 vzD72AQeEuk+4SbyVsWDS2UEDufJ9gm42uk21/opBjrnLOySsJM7l0stPAGQ/OaMyp1X
 62fw==
X-Gm-Message-State: APjAAAWtCs7UebdsySYRbF7TYUbBjLYAnYpsxglSIvM4OXfgjCmZNXZ9
 ws4Co4VvXQx25NhqcymvwvhndQ==
X-Google-Smtp-Source: APXvYqxMAOnQy88pixXrXkLY51EbFIn3dNn0lEnxFRVO0u+p/OxQmgx371p0fYm+lPnMmM6+RPfj8A==
X-Received: by 2002:a5b:d07:: with SMTP id y7mr3445302ybp.313.1573133932475;
 Thu, 07 Nov 2019 05:38:52 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i125sm750756ywa.68.2019.11.07.05.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:38:51 -0800 (PST)
Date: Thu, 7 Nov 2019 08:38:51 -0500
From: Sean Paul <sean@poorly.run>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
Message-ID: <20191107133851.GF63329@art_vandelay>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
 <4c74db2614cefe23f888d0643c2d7c356086745a.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c74db2614cefe23f888d0643c2d7c356086745a.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UR+FMpDRyPvXwNuet63hIA/KDaiYBztB4W2oxpuqt4A=;
 b=csf58IPg/w9lQ2Nl9oTvOEkFzDSskXTPBRw8RrWxLtI2rQy0W4i6vmQjsgLc6BoO+F
 YTwCDTgQVpF7vOqHSlyNAoDkvZPu8DoGhp4BImq5C36qnqFYH+f7ZnATq69eSOifv8Vu
 FSqy2tMQSkpc+MJ5dsMIbD4sVXsKkMrstvBaLhTvk8DoTkXYAaB+uta+3AVkJanTarNL
 EIIb/RnSDc0la+ZBS/pl2Qde1zl1wO453vc7F21/7iTG+a8J6RH+7gXYi/0zBvk5chRL
 se/x7c6J5b1pPsDWS+s/sbSoRs1b+WqYISDDPF9PZqfyCv6ZkcTYwGvP8qxTeqBIOwJ2
 PJTA==
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDE6NTQ6MjJBTSAtMDgwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gVGh1LCAyMDE5LTExLTA3IGF0IDEyOjI5ICswMzAwLCBXYW1idWkgS2FydWdhIHdy
b3RlOgo+ID4gUmVwbGFjZSB0aGUgdXNlIG9mIHRoZSBkZXZfZXJyIG1hY3JvIHdpdGggdGhlIERS
TV9ERVZfRVJST1IKPiA+IERSTSBoZWxwZXIgbWFjcm8uCj4gCj4gVGhlIGNvbW1pdCBtZXNzYWdl
IHNob3VsZCBzaG93IHRoZSByZWFzb24gX3doeV8geW91IGFyZSBkb2luZwo+IHRoaXMgaW5zdGVh
ZCBvZiBqdXN0IHN0YXRpbmcgdGhhdCB5b3UgYXJlIGRvaW5nIHRoaXMuCj4gCj4gSXQncyBub3Qg
dGhhdCBkZXZfZXJyIGlzIHVuY29tbW9uIGluIGRyaXZlcnMvZ3B1L2RybS4KPiAKCkl0IGlzIHVu
Y29tbW9uICh0aGlzIGlzIHRoZSBzb2xlIGluc3RhbmNlKSBpbiByb2NrY2hpcCwgaG93ZXZlci4g
U28gaXQgbWFrZXMKc2Vuc2UgdG8gY29udmVydCB0aGUgZGV2XyogcHJpbnRzIGluIHJvY2tjaGlw
IHRvIERSTV9ERVYgZm9yIGNvbnNpc3RlbmN5LgoKV2FtYnVpLCBjb3VsZCB5b3UgYWxzbyBwbGVh
c2UgY29udmVydCB0aGUgZGV2X3dhcm4gaW5zdGFuY2UgYXMgd2VsbD8KCkknbGwgYXBwbHkgdGhp
cyB0byBkcm0tbWlzYy1uZXh0IGFuZCBleHBhbmQgb24gdGhlIGNvbW1pdCBtZXNzYWdlIGEgYml0
LgoKVGhhbmtzLAoKU2VhbgoKPiAkIGdpdCBncmVwIC13IGRldl9lcnIgZHJpdmVycy9ncHUvZHJt
IHwgd2MgLWwKPiAxOTUwCj4gJCBnaXQgZ3JlcCAtdyBEUk1fREVWX0VSUk9SIGRyaXZlcnMvZ3B1
L2RybSB8IHdjIC1sCj4gNzU2Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
ZHctbWlwaS1kc2ktcm9ja2NoaXAuYwo+IFtdCj4gPiBAQCAtOTE2LDcgKzkxNiw3IEBAIHN0YXRp
YyBpbnQgZHdfbWlwaV9kc2lfcm9ja2NoaXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiA+ICAJfQo+ID4gIAo+ID4gIAlpZiAoIWRzaS0+Y2RhdGEpIHsKPiA+IC0JCWRldl9l
cnIoZGV2LCAibm8gZHNpLWNvbmZpZyBmb3IgJXMgbm9kZVxuIiwgbnAtPm5hbWUpOwo+ID4gKwkJ
RFJNX0RFVl9FUlJPUihkZXYsICJubyBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFt
ZSk7Cj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICAJfQo+IAo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClNlYW4gUGF1bCwg
U29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
