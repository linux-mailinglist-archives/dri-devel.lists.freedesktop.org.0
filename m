Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02961E44AD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E816E8C5;
	Fri, 25 Oct 2019 07:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620646E8C5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:39:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g24so928134wmh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 00:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=BYaRODZZNDh9FPysJmJSS0JC568XGbxHOWWJdpk/VgA=;
 b=UC2JRYTD2tGs+01uH/ILuu+KfiKpjFRJ2ckbm6u9eZuL5Fa4NnPqwy7rxA+DH6ozRl
 Wj8FlYSa1TK+mF+JAZE+lqfljmyl+dbldva4j+ahdsfT2uxfJ1IIYE6XBWrCXdg2ZTpI
 amCCQPRAs6zYvKo6xBXS7sjq4VWqn/f7ts+A4GQCetQr9vlMjo7t7QyNuGJ2Uyjnq9nj
 r23gl3DuI4uO/qWgozse7X9TYy5ck2Puku5/ApOt8kVBryc5GswG3O1ujZFdLlkXoiVV
 ZQQV0xet1Z8wgMcLNg2bkKLNS4i5HMdAxOp9KpfpKXgc6DWp7gnghcBNY5xYy0OYNMFO
 Hjaw==
X-Gm-Message-State: APjAAAWxbT9Zdm7c1+pNFaYFOkOkL798uhNxLGE/YU4oBwJCBtvymZDW
 DFkJ9ELUjxhCdP5Ushf5mZxBiA==
X-Google-Smtp-Source: APXvYqyaQcx6jMa0QaIjedyNC4WpJci1P2vTk9clxDqdVgN1wQgbusuDDr7CpMcTc4cqc12HoG/t0Q==
X-Received: by 2002:a1c:5f42:: with SMTP id t63mr1974688wmb.163.1571989157928; 
 Fri, 25 Oct 2019 00:39:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id i18sm1475112wrx.14.2019.10.25.00.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:39:16 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:39:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm/udl: Clear BO vmapping pointer after unmapping
 BO memory
Message-ID: <20191025073915.GP11828@phenom.ffwll.local>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024144237.8898-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BYaRODZZNDh9FPysJmJSS0JC568XGbxHOWWJdpk/VgA=;
 b=Sm5YBlIQHmv33UVjZvg3Bnsn0UH2sISaGszHDJz519BEXcLc1lMsQqB1jWSF1siQj+
 1A0ihRbEyRbY/IoZ0Z7FhOLJOIB0nzwGoB4gyVq1gCKj3CUXX4gaaDtvhn3Un4zidpoU
 cc2ttOlH2XhYxOXTo4afP/Y5+ofkTLJhYHtMI=
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDQ6NDI6MzNQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVW5tYXBwaW5nIHRoZSBCTyBtZW1vcnkgd2l0aCB1ZGxfZ2VtX3Z1bm1hcCgp
IGNyZWF0ZXMgYSBkYW5nbGluZyBwb2ludGVyCj4gaW4gc3RydWN0IHVkbF9nZW1fb2JqZWN0LnZt
YXBwaW5nLiBUaGlzIGNhbiBjcmFzaCB1ZGxfaGFuZGxlX2RhbWFnZSgpLAo+IHdoaWNoIGNoZWNr
IHRoZSBwb2ludGVyJ3MgdmFsdWUgZm9yIE5VTEwuIENsZWFyIHRoZSBwb2ludGVyIHRvIE5VTEwg
YW5kCj4gbGV0IHVkbF9oYW5kbGVfZGFtYWdlKCkgcmUtZXN0YWJsaXNoIHRoZSBtYXBwaW5nIGlm
IG5lY2Vzc2FyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KCkhtIHJpZ2h0IG5vdyB0aGlzIGlzIG5vdCBhIHByb2JsZW0sIGJlY2Fz
ZSB3ZSByZW1vdmUgdGhlIHZtYXBwaW5nIG9ubHkKd2hlbiB3ZSBmcmVlIHRoZSB1bmRlcmx5aW5n
IG9iamVjdC4gSWYgdGhhdCBjaGFuZ2VzIHNvbWVob3csIHRoZW4gd2hhdCB3ZQphY3R1YWxseSBu
ZWVkIGlzIHRvIHN0YXJ0IHJlZmNvdW50IHRoZSB2bWFwcGluZyAoYW5kIGRyb3AgdGhlIHRyaWNr
IGluCnVkbF9oYW5kbGVfZGFtYWdlIGFuZCB1bmNvbmRpdGlvbmFsbHkgdm1hcC92dW5tYXApLiBN
aWdodCBiZSBlYXNpZXIgdG8KanVzdCBjdXQgb3ZlciB0byBzaG1lbSBoZWxwZXJzLgotRGFuaWVs
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYwo+IGluZGV4IGIy
M2E1YzJmY2Q4MC4uM2VhMGNkOWFlMmQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKPiBAQCAt
MTc0LDYgKzE3NCw3IEBAIHZvaWQgdWRsX2dlbV92dW5tYXAoc3RydWN0IHVkbF9nZW1fb2JqZWN0
ICpvYmopCj4gIAl9Cj4gIAo+ICAJdnVubWFwKG9iai0+dm1hcHBpbmcpOwo+ICsJb2JqLT52bWFw
cGluZyA9IE5VTEw7Cj4gIAo+ICAJdWRsX2dlbV9wdXRfcGFnZXMob2JqKTsKPiAgfQo+IC0tIAo+
IDIuMjMuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
