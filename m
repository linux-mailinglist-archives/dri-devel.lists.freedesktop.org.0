Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4DE3754
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 17:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4216E452;
	Thu, 24 Oct 2019 15:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79F6E452
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 15:59:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g24so3437858wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NJbQ89hF9RW6SSlk8EDSb3r+Mf7JAiqwXmPkxbcOPek=;
 b=grhtcY1fedTj0DLZPiz1dCVdVfnanIOl3YzaVZ1if/8UKCJF2UdVZiMHSB23fWR27M
 z0HPLAcjc+fN8QCguOpNWM2DoyXG5guPxRcugKM32KJ7qFXWBACoKMMZBO53+bsfS683
 so7uxhqDP2qw19DotLu1sd9GhXVVmR8+cDYwWVAXeeLWXeVFs51+IprfIyMbC/yA4uCt
 jN695TzC2xYCEZ9yZgLQeqj/oT7FIDLSGlQ6ddDK9lNEPueSV8GurgeP5jrbj0XimNiV
 +tNjzbFudyHSe6u8PWI/3uJeOCXvui/J8ER53Eqlb5Bw0QjdAX82Pff1IOvsKObCkJAA
 kTgw==
X-Gm-Message-State: APjAAAUGDzlPFvd06D1n49oSkxjeSCxfH1z/uQtCJboQ35czU/chCoh7
 btCVYdrdJ1raOvKsqO6ssWt2dA==
X-Google-Smtp-Source: APXvYqwHh+NpYPMqC8toe5xDBmGW+H7S71mUP4y3yRJQ/zyv9OC6TruS/Yu0iRjoqGFuyVvu3g9i7A==
X-Received: by 2002:a1c:6854:: with SMTP id d81mr5933299wmc.75.1571932781046; 
 Thu, 24 Oct 2019 08:59:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z13sm29372745wrm.64.2019.10.24.08.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 08:59:40 -0700 (PDT)
Date: Thu, 24 Oct 2019 17:59:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial] drm: Spelling s/connet/connect/
Message-ID: <20191024155938.GJ11828@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Jiri Kosina <trivial@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20191024151737.29287-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024151737.29287-1-geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NJbQ89hF9RW6SSlk8EDSb3r+Mf7JAiqwXmPkxbcOPek=;
 b=JuzUwj7xmxtzYGSHjKQchMasKYs0hf2WWPDVInp7z0HBv7JPUVZU4yEZ3cT546842v
 sdBLssVvpZp5/VAAQZqdUCyH6Yw2r9DD/fYcNrsUAN8Qx9/uR4u5PO+XfivlUZyl8NKZ
 3BrDcIbrv+v8JjQNn2lV9blvnxj16BRBqk2nw=
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
Cc: David Airlie <airlied@linux.ie>, Jiri Kosina <trivial@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDU6MTc6MzdQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEZpeCBtaXNzcGVsbGluZ3Mgb2YgImNvbm5lY3RvciIgYW5kICJjb25uZWN0
aW9uIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+CgpUaGFua3MsIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dC4KLURhbmllbAoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lfb3V0cHV0LmMgfCAyICst
Cj4gIGluY2x1ZGUvdWFwaS9kcm0vZXh5bm9zX2RybS5oICAgICAgICAgICAgIHwgMiArLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lfb3V0cHV0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RzaV9vdXRwdXQuYwo+IGluZGV4IDAzMDIzZmEwZmI2
ZjlkM2MuLmYzNTBhYzFlYWQxODIxM2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dt
YTUwMC9tZGZsZF9kc2lfb3V0cHV0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21k
ZmxkX2RzaV9vdXRwdXQuYwo+IEBAIC00OTgsNyArNDk4LDcgQEAgdm9pZCBtZGZsZF9kc2lfb3V0
cHV0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+
IC0JLypjcmVhdGUgYSBuZXcgY29ubmV0b3IqLwo+ICsJLypjcmVhdGUgYSBuZXcgY29ubmVjdG9y
Ki8KPiAgCWRzaV9jb25uZWN0b3IgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgbWRmbGRfZHNpX2Nv
bm5lY3RvciksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFkc2lfY29ubmVjdG9yKSB7Cj4gIAkJRFJN
X0VSUk9SKCJObyBtZW1vcnkiKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9leHlu
b3NfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2V4eW5vc19kcm0uaAo+IGluZGV4IDNlNTliODM4
MmRkOGNlYWQuLjQ1YzY1ODJiM2RmMzFkYmYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9leHlub3NfZHJtLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2V4eW5vc19kcm0uaAo+IEBA
IC02OCw3ICs2OCw3IEBAIHN0cnVjdCBkcm1fZXh5bm9zX2dlbV9pbmZvIHsKPiAgLyoqCj4gICAq
IEEgc3RydWN0dXJlIGZvciB1c2VyIGNvbm5lY3Rpb24gcmVxdWVzdCBvZiB2aXJ0dWFsIGRpc3Bs
YXkuCj4gICAqCj4gLSAqIEBjb25uZWN0aW9uOiBpbmRpY2F0ZSB3aGV0aGVyIGRvaW5nIGNvbm5l
dGlvbiBvciBub3QgYnkgdXNlci4KPiArICogQGNvbm5lY3Rpb246IGluZGljYXRlIHdoZXRoZXIg
ZG9pbmcgY29ubmVjdGlvbiBvciBub3QgYnkgdXNlci4KPiAgICogQGV4dGVuc2lvbnM6IGlmIHRo
aXMgdmFsdWUgaXMgMSB0aGVuIHRoZSB2aWRpIGRyaXZlciB3b3VsZCBuZWVkIGFkZGl0aW9uYWwK
PiAgICoJMTI4Ynl0ZXMgZWRpZCBkYXRhLgo+ICAgKiBAZWRpZDogdGhlIGVkaWQgZGF0YSBwb2lu
dGVyIGZyb20gdXNlciBzaWRlLgo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
