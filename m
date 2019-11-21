Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444171053A6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 14:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666066EF42;
	Thu, 21 Nov 2019 13:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C36EF42
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 13:55:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u18so3816960wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 05:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=9ySz0CwRZWHJZeoXGkyjArkEnAI6EPJLUR1wbzYKrBQ=;
 b=Nb9q7OdRBL2YRF7YiYP0AoJbUTEYASQjesxX1QYcqXd5JPtjG/bgkWOp/vZQ31eVwW
 zKMQ6z2Wixx/gIXX9YYPnDxv5bW2eAgA5D1o6LB3uyhPanF00Hy8eGSN9o5fPrsG736S
 HvpCczGm1q1ANROonBbdxiL6wOhWpRGfIip19dAs6R+hOkuoO/rWDrat+3Sbi/6YqsoD
 O57mZa/pLtMDBGsTPrv6m96Na1fKJBbvFTrN3YEsZt4RybZQs4XR4EkRW6/O6DTOxsjY
 yUiyIsaAkPK7ZTIsvGZUmk8BzOBf75h1h07pxfz19JJUySB+nICKt63C75bV9J9l4nGY
 0ghg==
X-Gm-Message-State: APjAAAV8cq2F7FSVmPhG1sY87xQG12Hy5bolc+Wm9mXNGlWe9GTVWQpm
 OLnqkgk+5KLDizz/WXBG3Vgtew==
X-Google-Smtp-Source: APXvYqyPjxCiSx6aRgQWwIldMrYfO6t2JwKnW+USv8OSUlMJ3Cgu+UrDu2H7r9eK85r7VgG7mWz6yA==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr10535918wmm.143.1574344551219; 
 Thu, 21 Nov 2019 05:55:51 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q5sm2956771wmc.27.2019.11.21.05.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 05:55:50 -0800 (PST)
Date: Thu, 21 Nov 2019 14:55:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] drm: share address space for dma bufs
Message-ID: <20191121135548.GF6236@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20191121103807.18424-1-kraxel@redhat.com>
 <20191121103807.18424-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121103807.18424-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ySz0CwRZWHJZeoXGkyjArkEnAI6EPJLUR1wbzYKrBQ=;
 b=NXvERH9x28CAg2d7Yb67iVNC5YQ/S+Mx85h8A/BauEU7nfIXLInBktQXN0epsENDlP
 9Ccqiw+qy2rPeiXmtSZ78sJMmK4f2IAr6MFPNm7WgdSCO0K0nvL4R39ngGn5X0ipbI1u
 Y7IRB3tc3iGQupgccPGXN/bfAnS81ytVunXfU=
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6Mzg6MDdBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBVc2UgdGhlIHNoYXJlZCBhZGRyZXNzIHNwYWNlIG9mIHRoZSBkcm0gZGV2aWNlIChz
ZWUgZHJtX29wZW4oKSBpbgo+IGRybV9maWxlLmMpIGZvciBkbWEtYnVmcyB0b28uICBUaGF0IHJl
bW92ZXMgYSBkaWZmZXJlbmNlIGJldHdlZW0gZHJtCj4gZGV2aWNlIG1tYXAgdm1hcyBhbmQgZG1h
LWJ1ZiBtbWFwIHZtYXMgYW5kIGZpeGVzIGNvcm5lciBjYXNlcyBsaWtlCj4gdW5tYXBzIG5vdCB3
b3JraW5nIHByb3Blcmx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCA0ICsr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMKPiBpbmRleCBhOTYzM2JkMjQxYmIuLmMzZmMzNDE0NTNjMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMKPiBAQCAtMjQwLDYgKzI0MCw3IEBAIHZvaWQgZHJtX3ByaW1lX2Rlc3Ry
b3lfZmlsZV9wcml2YXRlKHN0cnVjdCBkcm1fcHJpbWVfZmlsZV9wcml2YXRlICpwcmltZV9mcHJp
dikKPiAgc3RydWN0IGRtYV9idWYgKmRybV9nZW1fZG1hYnVmX2V4cG9ydChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+ICAJCQkJICAgICAgc3RydWN0IGRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9p
bmZvKQo+ICB7Cj4gKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IGV4cF9pbmZvLT5wcml2
Owo+ICAJc3RydWN0IGRtYV9idWYgKmRtYV9idWY7Cj4gIAo+ICAJZG1hX2J1ZiA9IGRtYV9idWZf
ZXhwb3J0KGV4cF9pbmZvKTsKPiBAQCAtMjQ3LDcgKzI0OCw4IEBAIHN0cnVjdCBkbWFfYnVmICpk
cm1fZ2VtX2RtYWJ1Zl9leHBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCQlyZXR1cm4g
ZG1hX2J1ZjsKPiAgCj4gIAlkcm1fZGV2X2dldChkZXYpOwo+IC0JZHJtX2dlbV9vYmplY3RfZ2V0
KGV4cF9pbmZvLT5wcml2KTsKPiArCWRybV9nZW1fb2JqZWN0X2dldChvYmopOwo+ICsJZG1hX2J1
Zi0+ZmlsZS0+Zl9tYXBwaW5nID0gb2JqLT5kZXYtPmFub25faW5vZGUtPmlfbWFwcGluZzsKCkNh
biB5b3UgcGxzIGFsc28gdGhyb3cgdGhlIGNoYW5nZSB0byBhbWRncHVfZ2VtX3ByaW1lX2V4cG9y
dCBvbiB0b3AgaGVyZT8KSW1vIG1ha2VzIGEgbG90IG1vcmUgc2Vuc2UgdGhhdCB3YXkuIFdpdGgg
dGhhdCBhZGRlZCBJJ20gaGFwcHkgdG8gci1iLgotRGFuaWVsCgo+ICAKPiAgCXJldHVybiBkbWFf
YnVmOwo+ICB9Cj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
