Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742C23CA3C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF446E525;
	Wed,  5 Aug 2020 11:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B436E525
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:27:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so5483230wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 04:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=KugqoLJzQdyt3zmwjJMiEIC+i2tGmRLU22ZaYueyJpA=;
 b=CoAN2cMV9Mezc4o+Zf4ohK6Y7/7mPE2t7h/mpIRlpS325019IpsFwHyPmJ0wK1S/Iv
 9dgdo/amrdxmaZ4R4HIlromCMiKvRPxwzTlKISMHdsLB+fTpRNZokce+4dm/toWgm7gI
 WG1xbbJUO/TYBb+hT9qhFdH6lD/owL+QLSdyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=KugqoLJzQdyt3zmwjJMiEIC+i2tGmRLU22ZaYueyJpA=;
 b=XOUF/yvkwINvMrLiC6KM6P6zS6UqYkm9q0dN/Hr/uM4uX4BG0vP13TnHANbaLnpvr6
 CIqusfMgJ7AzgzoKuDqcUo3nzJFAcsC9rLOMSUOTohtILkMS1olMBIXOkovfat9QSQGl
 dJBbH0j0cGLdoqzpT630MTMDjksPDSr4S/+5pJXesc93gBp3KOqHTO5Z/+EcT+hXyqjb
 ifFc10LN86ZgtZRMq6Dk2Do0uLWSxDamKfrhlBqrSkHhWQu0ASMABKYihzQMdYOsRj/f
 VA6L70xwb23/aWdc8FzSY/F4ItMVI55DirGtdspVZeFxNyjRF7IEIY72by7SC+r4D+CT
 exvg==
X-Gm-Message-State: AOAM531mxw7i8hVebyb5ecULv3ejVjEk4GJGhPUiNFwqfrrek/x/Yiql
 N1+KXHh1Iy5YWjQRX2+7cL8yjw==
X-Google-Smtp-Source: ABdhPJwnF7KyPv1oaxnSYZ/S0cZMvDnGvur+ycQrH+6V/86KImifUzSQs518q3Bhu0RqapwN5ZnlNA==
X-Received: by 2002:a7b:ca5a:: with SMTP id m26mr2833383wml.27.1596626818763; 
 Wed, 05 Aug 2020 04:26:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p6sm2212467wru.33.2020.08.05.04.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 04:26:57 -0700 (PDT)
Date: Wed, 5 Aug 2020 13:26:55 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm: sysfs: Add to get current mode
Message-ID: <20200805112655.GF6419@phenom.ffwll.local>
Mail-Followup-To: Huang Jiachai <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Tao Huang <huangtao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200805083646.4123-1-hjc@rock-chips.com>
 <CAKMK7uGmKJqZJ0ONQjjquZn6mksKbkScmcUSEA43eg1jFskmTg@mail.gmail.com>
 <693f6555-d9d2-f255-1198-e3798c8f4fe8@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <693f6555-d9d2-f255-1198-e3798c8f4fe8@rock-chips.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Tao Huang <huangtao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Kever Yang <kever.yang@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMDY6MDM6MTVQTSArMDgwMCwgSHVhbmcgSmlhY2hhaSB3
cm90ZToKPiBIaSBEYW5pZWwKPiAKPiDlnKggMjAyMC84LzUgMTc6MzYsIERhbmllbCBWZXR0ZXIg
5YaZ6YGTOgo+ID4gT24gV2VkLCBBdWcgNSwgMjAyMCBhdCAxMDozNyBBTSBTYW5keSBIdWFuZyA8
aGpjQHJvY2stY2hpcHMuY29tPiB3cm90ZToKPiA+ID4gYWRkIHRoaXMgbm9kZSB0byBnZXQgdGhl
IGN1cnJlbnQgdHJ1ZSBtb2RlLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FuZHkgSHVh
bmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiA+IFVoIHdoYXQncyB0aGlzIGZvcj8gU2luY2UgaXQn
cyBzeXNmcywgSSBndWVzcyB0aGVyZSdzIHNvbWV0aGluZwo+ID4gcGFyc2luZyB0aGlzLCB3aGlj
aCBtZWFucyB3ZSdkIGtpbmRhIG5lZWQgdG8gaGF2ZSB0aGF0IHBpZWNlIHRvby4KPiA+IAo+ID4g
SWYgaXQncyBqdXN0IGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMsIHRoZW4gd2UgYWxyZWFkeSBoYXZl
IHRoaXMKPiA+IGluZm9ybWF0aW9uIGluIGRlYnVnZnMsIHRvZ2V0aGVyIHdpdGggZXZlcnl0aGlu
ZyBlbHNlIHRoYXQncyBpbiB0aGUKPiA+IGF0b21pYyBtb2Rlc2V0IHN0YXRlLgo+ID4gLURhbmll
bAo+IAo+IHllcywgdGhpcyBpcyBqdXN0IGZvciBkZWJ1ZzsKPiAKPiBhbmQgaSBnZXQgdGhlIGlu
Zm9ybWF0aW9uIHdoYXQgaSBuZWVkIGZyb20gY2F0Cj4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAv
c3RhdGUsIHRoYW5rcy4KCkNvb2wsIHNvdW5kcyBsaWtlIHRoaXMgaXMgcmVzb2x2ZWQuIEFuZCBp
ZiB5b3UgbmVlZCBhbnkgYWRkaXRpb25hbCBkZWJ1ZwppbmZvcm1hdGlvbiBhYm91dCBkaXNwbGF5
IHN0YXRlLCB0aGVuIGJlc3QgdG8gZXh0ZW5kIHRoYXQgZmlsZS4gSXQgY29tZXMKd2l0aCBkcml2
ZXIgaG9va3MsIHNvIHRoYXQgeW91IGNhbiBpbmNsdWRlIGFueSBhZGRpdGlvbmFsIGRyaXZlciBz
dHVmZiwgb3IKb3V0cmlnaHQgcmVhZCBvdXQgcmVnaXN0ZXJzIGFuZCBldmVyeXRoaW5nLgoKQ2hl
ZXJzLCBEYW5pZWwKCj4gCj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9zeXNmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCj4gPiA+
IGluZGV4IDkzOWYwMDMyYWFiMS4uZjM5YmNkMzQ4NTNiIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jCj4gPiA+IEBAIC0xOSw2ICsxOSw3IEBACj4gPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4KPiA+ID4gCj4gPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fY29ubmVjdG9yLmg+Cj4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fZGV2
aWNlLmg+Cj4gPiA+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgo+ID4gPiAgICNpbmNsdWRl
IDxkcm0vZHJtX21vZGVzLmg+Cj4gPiA+IEBAIC0yMzYsMTYgKzIzNyw0NSBAQCBzdGF0aWMgc3Np
emVfdCBtb2Rlc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldmljZSwKPiA+ID4gICAgICAgICAgcmV0
dXJuIHdyaXR0ZW47Cj4gPiA+ICAgfQo+ID4gPiAKPiA+ID4gK3N0YXRpYyBzc2l6ZV90IGN1cnJl
bnRfbW9kZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldmljZSwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgY2hhciAqYnVmKQo+ID4gPiArewo+ID4gPiArICAgICAgIHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IgPSB0b19kcm1fY29ubmVjdG9yKGRldmljZSk7Cj4gPiA+ICsgICAg
ICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGU7Cj4gPiA+ICsgICAgICAgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwo+ID4gPiArICAgICAgIGJvb2wgaW50ZXJsYWNlZDsK
PiA+ID4gKyAgICAgICBpbnQgd3JpdHRlbiA9IDA7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAo
IWNvbm5lY3Rvci0+c3RhdGUgfHwgIWNvbm5lY3Rvci0+c3RhdGUtPmNydGMpCj4gPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gd3JpdHRlbjsKPiA+ID4gKwo+ID4gPiArICAgICAgIGNydGNfc3Rh
dGUgPSBjb25uZWN0b3ItPnN0YXRlLT5jcnRjLT5zdGF0ZTsKPiA+ID4gKyAgICAgICBpZiAoIWNy
dGNfc3RhdGUpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gd3JpdHRlbjsKPiA+ID4gKwo+
ID4gPiArICAgICAgIG1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsKPiA+ID4gKwo+ID4gPiArICAg
ICAgIGludGVybGFjZWQgPSAhIShtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNF
KTsKPiA+ID4gKyAgICAgICB3cml0dGVuICs9IHNucHJpbnRmKGJ1ZiArIHdyaXR0ZW4sIFBBR0Vf
U0laRSAtIHdyaXR0ZW4sICIlZHglZCVzJWRcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBtb2RlLT5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXksCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcmxhY2VkID8gImkiIDogInAiLCBkcm1fbW9kZV92cmVmcmVz
aChtb2RlKSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gd3JpdHRlbjsKPiA+ID4gK30K
PiA+ID4gKwo+ID4gPiAgIHN0YXRpYyBERVZJQ0VfQVRUUl9SVyhzdGF0dXMpOwo+ID4gPiAgIHN0
YXRpYyBERVZJQ0VfQVRUUl9STyhlbmFibGVkKTsKPiA+ID4gICBzdGF0aWMgREVWSUNFX0FUVFJf
Uk8oZHBtcyk7Cj4gPiA+ICAgc3RhdGljIERFVklDRV9BVFRSX1JPKG1vZGVzKTsKPiA+ID4gK3N0
YXRpYyBERVZJQ0VfQVRUUl9STyhjdXJyZW50X21vZGUpOwo+ID4gPiAKPiA+ID4gICBzdGF0aWMg
c3RydWN0IGF0dHJpYnV0ZSAqY29ubmVjdG9yX2Rldl9hdHRyc1tdID0gewo+ID4gPiAgICAgICAg
ICAmZGV2X2F0dHJfc3RhdHVzLmF0dHIsCj4gPiA+ICAgICAgICAgICZkZXZfYXR0cl9lbmFibGVk
LmF0dHIsCj4gPiA+ICAgICAgICAgICZkZXZfYXR0cl9kcG1zLmF0dHIsCj4gPiA+ICAgICAgICAg
ICZkZXZfYXR0cl9tb2Rlcy5hdHRyLAo+ID4gPiArICAgICAgICZkZXZfYXR0cl9jdXJyZW50X21v
ZGUuYXR0ciwKPiA+ID4gICAgICAgICAgTlVMTAo+ID4gPiAgIH07Cj4gPiA+IAo+ID4gPiAtLQo+
ID4gPiAyLjE3LjEKPiA+ID4gCj4gPiA+IAo+ID4gPiAKPiA+IAo+IC0tIAo+IEJlc3QgUmVnYXJk
Cj4gCj4g6buE5a626ZKXCj4gU2FuZHkgSHVhbmcKPiBBZGRyOiDnpo/lt57luILpvJPmpbzljLrp
k5znm5jot6/ova/ku7blpKfpgZM4OeWPt+emj+W3nui9r+S7tuWbrUHljLoyMeWPt+alvCgzNTAw
MDMpCj4gICAgICAgTm8uIDIxIEJ1aWxkaW5nLCBBIERpc3RyaWN0LCBOby44OSxzb2Z0d2FyZSBC
b3VsZXZhcmQgRnV6aG91LEZ1amlhbixQUkMKPiBUZWzvvJorODYgMDU5MS04Nzg4NDkxOSAgODY5
MAo+IEUtbWFpbO+8mmhqY0Byb2NrLWNoaXBzLmNvbQo+IAo+IAo+IAoKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
