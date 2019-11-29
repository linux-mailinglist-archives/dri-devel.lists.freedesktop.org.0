Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148210D305
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339D06E181;
	Fri, 29 Nov 2019 09:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53FC6E181
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:12:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so31040878wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LM5jSrF8nTgWs4oWxOr3SFgFxskZ6X+DU6VEEtg5wqw=;
 b=uPMbjdy5VjnAlhCxc/msflYLdLbGj4WkbeMG99t6ENNxTr416k+Znzg3vjFuGIhGvA
 wMFJAUjfXnR92/RPuGvJ9lyRpr1XdbHxrgiShj5QRvj3HZbQmAkXl+GTMqUKbQXfj6U+
 1cP6nkoqXJSWFd2qGHQigjpjUVMzS1fE2/AfwARzWJb1/TxxizA4X4kF3gT50amY9get
 tcOQWXOLSgwArOWP6Y4aXrgEYMKFcb3J+t9tul1Co96flKo6cUf1mfmnjE6TwvTQdbmf
 rjucLcFK6ee6WyIA3l/Z7cvtLgqAa7yZzL4pataWb945p27nR9JCYntg13kZZ7MrAzwX
 bQJw==
X-Gm-Message-State: APjAAAV/LWiC9tzL9DN5N225hruw1uuVBKZRsGkAvxx/irlMsZ7yfMbK
 Yk5VTYIbnG0zWT1KBdm/IoZxSA==
X-Google-Smtp-Source: APXvYqw+Z3QWUl2mSYoeyFqzkFQJ0jsPiiG6pisBsnX04UYrnTIoJL+E851+nxXPH8Z0+01EgcJBjQ==
X-Received: by 2002:a5d:6542:: with SMTP id z2mr54928895wrv.371.1575018767329; 
 Fri, 29 Nov 2019 01:12:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id k8sm4553994wrl.3.2019.11.29.01.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:12:46 -0800 (PST)
Date: Fri, 29 Nov 2019 10:12:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Message-ID: <20191129091244.GC624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-4-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LM5jSrF8nTgWs4oWxOr3SFgFxskZ6X+DU6VEEtg5wqw=;
 b=aaiPnOSIqcKQDUdopLJyPvbjE4YsaGKDV8KXbhx84uzfDXIf7RUl7KFNaUuMNAUzpw
 Kyzzm6lBU1o4i1ij1rNpemDp562ywxiWMDMtt2bNTjE7lnJWgQzP8eOskCzmy2QjHlKb
 fvvCu/oE/L+WzHRrqAU1r6VVvHWdcofEjkwYo=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6Mzc6MzVQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBJ
dCdzIG5vdCBrbm93biBhdCBpbXBvcnQgdGltZSB3aGV0aGVyIG9yIG5vdCBhbGwgdXNlcnMgb2Yg
YSBETUEtQlVGIHdpbGwKPiBiZSBhYmxlIHRvIGRlYWwgd2l0aCBub24tY29udGlndW91cyBtZW1v
cnkuIEVhY2ggdXNlciBuZWVkcyB0byB2ZXJpZnkgYXQKPiBtYXAtdGltZSB3aGV0aGVyIGl0IGNh
biBhY2Nlc3MgdGhlIGJ1ZmZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8
dHJlZGluZ0BudmlkaWEuY29tPgoKSSdtIG5vdCBzZWVpbmcgYW55IG90aGVyIGNoZWNrIGZvciBu
ZW50cyAuLi4gZG9lcyB0aGlzIG1lYW4gdGhhdCB0aGVyZSdzCm5vdCBhY3R1YWxseSBhbnkgYmxv
Y2sgdGhhdCByZXF1aXJlcyBjb250aWcgbWVtPwotRGFuaWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZ2VtLmMgfCA3IC0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwo+IGluZGV4IDZkZmFkNTZlZWUyYi4uYmMxNWI0MzAx
NTZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwo+IEBAIC00NDAsMTMgKzQ0MCw2IEBAIHN0YXRpYyBz
dHJ1Y3QgdGVncmFfYm8gKnRlZ3JhX2JvX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAo+
ICAJCWVyciA9IHRlZ3JhX2JvX2lvbW11X21hcCh0ZWdyYSwgYm8pOwo+ICAJCWlmIChlcnIgPCAw
KQo+ICAJCQlnb3RvIGRldGFjaDsKPiAtCX0gZWxzZSB7Cj4gLQkJaWYgKGJvLT5zZ3QtPm5lbnRz
ID4gMSkgewo+IC0JCQllcnIgPSAtRUlOVkFMOwo+IC0JCQlnb3RvIGRldGFjaDsKPiAtCQl9Cj4g
LQo+IC0JCWJvLT5pb3ZhID0gc2dfZG1hX2FkZHJlc3MoYm8tPnNndC0+c2dsKTsKPiAgCX0KPiAg
Cj4gIAliby0+Z2VtLmltcG9ydF9hdHRhY2ggPSBhdHRhY2g7Cj4gLS0gCj4gMi4yMy4wCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
