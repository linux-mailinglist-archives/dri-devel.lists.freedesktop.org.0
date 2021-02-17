Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE831DCF1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 17:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908F76E125;
	Wed, 17 Feb 2021 16:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705426E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 16:10:09 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id c19so1733385pjq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 08:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=twn7H61LwoasXev40PwLZ/u/tW+/PTLk2sNN/MHHJFM=;
 b=sI43mdtN9/WupK0RaIZVzokjDtXExKNt0RsvM1sZrEOG905NdrUNTWYlFplavSmYBT
 DI+aOOE/g5PdB+Vs/MBXYbdzEdoRK6tGKwL04c9e+Pr5acz8VnIIEw6+n0TCdQqjoTEH
 00XLMmPARctOGwMYFsR/AqghKqgQfrae/k+5Q2Hk39cpq23zPW6mTUMPzHZbHwwmui2J
 ygmeb7I0CJrHM/J5zH74+VwETy7CM7yGjpp6aoh5T/BPSMI1NWN3ND8ERbZfwiJCbfEZ
 C4EvyiC/+q90paXXx90gaDtENU3+EfKGh0ov73I+5EpLqmwJYG+cGiBkwAQbLfwb6oDr
 Rqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=twn7H61LwoasXev40PwLZ/u/tW+/PTLk2sNN/MHHJFM=;
 b=irvqJc1CSB3XH34NtcbjJCPP7F+WQuo12MTB7IlORi7A7zR+gSKfXZvnIbh9+VF7MH
 trQHOdxngZA9uVn2Byc90xPNUuoLv/QtNIGiHIvgLWK5rvORsiRJctNoSbzVXd15CUht
 MCcAR5R3V64Jf2U6kfyggxT1Ut7C+8TOPhB5fdiHlW4ogXICun2XKm7ugI3xaUWQULck
 Jao2d6uNczP9s2TDyVsVkxhf+p1WRj+A/aro2uaperkRVeTKSrqNYh/xMMaRYyq5kbzY
 OCimTMO/UwJl5DRTd2UO9HDNTo6j3BGujS3ZyRoaJKb15LtNgEjxYGj9l4T3hSH9x0qO
 K0Ug==
X-Gm-Message-State: AOAM531tf0eTzUHmfLD1tk/1o0k+amv0fN70v56MbKshhvI4DqkGn1yu
 /nzvXa2YSE7d/yxkKpxBprM=
X-Google-Smtp-Source: ABdhPJwd0B2BYwZK7t1opg93RJ/2yPdvJ/QA/ll57kwYHLt+i9zoW6kJpz3SilXUpZ4Jsv4ux7FMTg==
X-Received: by 2002:a17:90a:77c4:: with SMTP id
 e4mr9529684pjs.185.1613578209165; 
 Wed, 17 Feb 2021 08:10:09 -0800 (PST)
Received: from [192.168.1.8] ([50.47.106.83])
 by smtp.gmail.com with ESMTPSA id f2sm3339169pfk.63.2021.02.17.08.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 08:10:08 -0800 (PST)
Message-ID: <68ec72635c83f5e984e19b3227ab2c5d8d2b4892.camel@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Simon Ser <contact@emersion.fr>
Date: Wed, 17 Feb 2021 08:10:08 -0800
In-Reply-To: <RTH7ReroyaiuwV4na7jvXgaUVHZydoksEf6N1fD_5baGD33auW8TAqtfhOE9WquzDFooXhdGQLZfd5CxgIDRbq7OoM67dtutwHp1SrNRLVA=@emersion.fr>
References: <20210216003959.802492-1-drawat.floss@gmail.com>
 <RTH7ReroyaiuwV4na7jvXgaUVHZydoksEf6N1fD_5baGD33auW8TAqtfhOE9WquzDFooXhdGQLZfd5CxgIDRbq7OoM67dtutwHp1SrNRLVA=@emersion.fr>
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAyLTE3IGF0IDEzOjIyICswMDAwLCBTaW1vbiBTZXIgd3JvdGU6Cj4gT24g
VHVlc2RheSwgRmVicnVhcnkgMTZ0aCwgMjAyMSBhdCAxOjM5IEFNLCBEZWVwYWsgUmF3YXQgPAo+
IGRyYXdhdC5mbG9zc0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gK3N0YXRpYyBpbnQgaHlwZXJ2
X2Nvbm5faW5pdChzdHJ1Y3QgaHlwZXJ2X2RybV9kZXZpY2UgKmh2KQo+ID4gK3sKPiA+ICvCoMKg
wqDCoMKgwqDCoGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaHYtPmNvbm5lY3RvciwKPiA+ICZo
eXBlcnZfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
ZHJtX2Nvbm5lY3Rvcl9pbml0KCZodi0+ZGV2LCAmaHYtPmNvbm5lY3RvciwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICZoeXBlcnZfY29ubmVjdG9yX2Z1bmNzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX01PREVfQ09OTkVDVE9S
X1ZHQSk7Cj4gPiArfQo+IAo+IE5pdDogc2hvdWxkbid0IHRoaXMgYmUgRFJNX01PREVfQ09OTkVD
VE9SX1ZpcnR1YWw/CgpUaGFua3MgU2ltb24gZm9yIHRoZSByZXZpZXcsIEkgdGhpbmsgaXQgbWFr
ZSBzZW5zZSB0byB1c2UKRFJNX01PREVfQ09OTkVDVE9SX1ZpcnR1YWwuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
