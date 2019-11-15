Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670EAFE5E3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 20:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EAE6EA97;
	Fri, 15 Nov 2019 19:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8926EA97
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 19:44:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l1so10770299wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 11:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=U8bumcIJOZn96oV8lnOQBzBOjsHxwXhRHmUegv8BjF8=;
 b=lnIRrvT8AFzIKxXW+1Z4BKhQ4kHFKcgtduJEvme9LwM+05vur4YQk6IY8oxzozHDrq
 7TNZ/iV8N0AltqafxdKNGC2yV3/tOYlmI9C8iGSr70sJEa29TTPYo6X6kruS4Y+0tQV+
 MqcGHcXf4Z6Z2NhQZd7XMUD/I8dK37ZIpohPy2vEbDGhoB+rAiHqoarrv9sQba7F+E+6
 RcGx0I7NwzjhE2/8YOn+DUGusOnIJC1vi57FcZLUwuu8+1kTB9rMtbKK9Y5JvgXMajU1
 pOcaZZTTAe9uSlFAOfWa4sVGnGSBqr7PVvJAYH+uXBJzEg+HXbEyNz6EdSYpkhqzJwcI
 BzOQ==
X-Gm-Message-State: APjAAAWw379FmckK0I2IvB6It6qMAgkp5yC1cZ4Zgt3WmXVceREVqsgN
 U1a1KMZQCNl4n1jjmMro5RJAOA==
X-Google-Smtp-Source: APXvYqzpfnDvozxdZ+RE+S2OgsX/RaXzw1tmUgULah7E9ZWhCQKvti136Mn2DMZrqeL9bXkr56JSZA==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr16111438wml.47.1573847050505; 
 Fri, 15 Nov 2019 11:44:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d11sm12512244wrn.28.2019.11.15.11.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:44:09 -0800 (PST)
Date: Fri, 15 Nov 2019 20:44:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 0/3] drm/gma500: remove some set but not used variables
Message-ID: <20191115194407.GB23790@phenom.ffwll.local>
References: <1573828027-122323-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573828027-122323-1-git-send-email-zhengbin13@huawei.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U8bumcIJOZn96oV8lnOQBzBOjsHxwXhRHmUegv8BjF8=;
 b=Q88fBqkHisVnz1BCJGsq2rFPvvTgrT1/p0sWm4yCsquNGiCGbNyOes2xmqo9yz2TtX
 o5qeDL5vj75fwKpRkUX296O4wMcY6yj5FwyGFlhkBih1xEBToIzCedvmquIOZhxTatQq
 sA2OCyw+LHIosbo0EPif2kl5mNZv5Omope9jg=
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6Mjc6MDRQTSArMDgwMCwgemhlbmdiaW4gd3JvdGU6
Cj4gemhlbmdiaW4gKDMpOgo+ICAgZHJtL2dtYTUwMDogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQg
dmFyaWFibGUgJ2h0b3RhbCcKPiAgIGRybS9nbWE1MDA6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2Vk
IHZhcmlhYmxlICdlcnJvcicKPiAgIGRybS9nbWE1MDA6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2Vk
IHZhcmlhYmxlICdpc19oZG1pJywnaXNfY3J0JwoKQWxsIHRocmVlIGFwcGxpZWQsIHRoYW5rcyBm
b3IgdGhlIHBhdGNoZXMuCi1EYW5pZWwKCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2
X2ludGVsX2Rpc3BsYXkuYyB8IDcgKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29h
a3RyYWlsX2hkbWkuYyAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
aXJxLmMgICAgICAgICAgIHwgMiAtLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gLS0KPiAyLjcuNAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
