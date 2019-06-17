Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D42484EB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BADC89265;
	Mon, 17 Jun 2019 14:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83A38923C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:08:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k8so16328227edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QclIRmGgE6e1NwC0LyK0y/gOsKzmfG48w5Q/Ut94Q+k=;
 b=fOlyLTrqoN4CgUaN0ZLSibqev1vOC5tuVRGIsfcFmDScl7A+8E0+xDh7iLksgsKUjW
 rEowvMrpdh95PExU+YhS8qHu+sGIUi/9V7tdGHhCAfpxXCa92jS1Jd4QqyiqeMoQw3JP
 jMcNHDg5LXcIyzqvW2+KF3lN/H7FvYvzB4vugeP1oIlEUTxRK8KJJZ6fRRWDMCvzXUG3
 lCic197FMiBk8VMCaSGQHH1jg2gpf+k4u/IOFn9e262LYjADcfG/fdNzRld2Q75aPD35
 KDNbWXZTdt2xsTKu3xn8sNeoUR4g7BATxCCWxWDLBjX+fzbR3rXfVmJV9NI1tYiZDX9w
 wZtw==
X-Gm-Message-State: APjAAAXft96UuHA50fnDMNP29NOdqTRmM1jltI95cJgA6DvyvpInoxQO
 gOX44RMdlzHEuTUtCNe9eOjJOXdSqK0=
X-Google-Smtp-Source: APXvYqxFgofUOrCrJe8Zusip83q+AIHX7wVQGYRBZyLeOZT0aLmRPes/a8REwHA8Uo/EXqXeQFakrw==
X-Received: by 2002:a05:6402:8d7:: with SMTP id
 d23mr76998441edz.17.1560780509384; 
 Mon, 17 Jun 2019 07:08:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y3sm3688780edr.27.2019.06.17.07.08.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:08:27 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:08:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/4] drm/virtio: pass gem reservation object to ttm init
Message-ID: <20190617140825.GD12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-2-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QclIRmGgE6e1NwC0LyK0y/gOsKzmfG48w5Q/Ut94Q+k=;
 b=YyLeBzVYVYsicyyTQaxOj8/wVRXFIWW/Pk135d0I16nxXxId1a6hq5l4MbpdrVDb1q
 6K00J3TChDALBDD04GdAyKBMsE45rcW3gx1uphcbzC7nmtufgwJsA9J9KKokP6xZk8RF
 IokXKwK/8xTC7O5fOi/xUwQMKRgUFj4H+SzJw=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MTQ6MDNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBXaXRoIHRoaXMgZ2VtIGFuZCB0dG0gd2lsbCB1c2UgdGhlIHNhbWUgcmVzZXJ2YXRp
b24gb2JqZWN0LAo+IHNvIG1peGluZyBhbmQgbWF0Y2hpbmcgdHRtIC8gZ2VtIHJlc2VydmF0aW9u
IGhlbHBlcnMgc2hvdWxkCj4gd29yayBmaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKV2hpbGUgZG9pbmcgbXkgcHJpbWUgZG9jK2NsZWFu
dXAgc2VyaWVzIEkgd29uZGVyZWQgd2hldGhlciB3ZSBzaG91bGQgZG8KdGhpcyBmb3IgZXZlcnlv
bmUsIGFuZCBwZXJoYXBzIGV2ZW4gcmVtb3ZlIHR0bV9iby50dG1fcmVzdi4gT25seSBkcml2ZXIK
d2hpY2ggZG9lc24ndCB5ZXQgaGF2ZSBhIGdlbV9ibyBlbWJlZGRlZCBpbiB0aGUgc2FtZSBhbGxv
Y2F0aW9uIGlzIHZtd2dmeCwKYW5kIHRoYXQgd291bGQgYmUgZWFzeSB0byBmaXggYnkgYWRkaW5n
IGEgdm13Z2Z4X3Jlc3Ygc29tZWh3ZXJlLgoKQW55d2F5LCBsb29rcyBsaWtlIGEgc29saWQgc3Rh
cnQgaW50byB0aGUgY29udmVyZ2VuY2Ugc3RvcnkuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9vYmplY3QuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29i
amVjdC5jCj4gaW5kZXggYjJkYTMxMzEwZDI0Li4yNDI3NjZkNjQ0YTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gQEAgLTEzMiw3ICsxMzIsOCBAQCBpbnQg
dmlydGlvX2dwdV9vYmplY3RfY3JlYXRlKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYs
Cj4gIAl2aXJ0aW9fZ3B1X2luaXRfdHRtX3BsYWNlbWVudChibyk7Cj4gIAlyZXQgPSB0dG1fYm9f
aW5pdCgmdmdkZXYtPm1tYW4uYmRldiwgJmJvLT50Ym8sIHBhcmFtcy0+c2l6ZSwKPiAgCQkJICB0
dG1fYm9fdHlwZV9kZXZpY2UsICZiby0+cGxhY2VtZW50LCAwLAo+IC0JCQkgIHRydWUsIGFjY19z
aXplLCBOVUxMLCBOVUxMLAo+ICsJCQkgIHRydWUsIGFjY19zaXplLCBOVUxMLAo+ICsJCQkgIGJv
LT5nZW1fYmFzZS5yZXN2LAo+ICAJCQkgICZ2aXJ0aW9fZ3B1X3R0bV9ib19kZXN0cm95KTsKPiAg
CS8qIHR0bV9ib19pbml0IGZhaWx1cmUgd2lsbCBjYWxsIHRoZSBkZXN0cm95ICovCj4gIAlpZiAo
cmV0ICE9IDApCj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
