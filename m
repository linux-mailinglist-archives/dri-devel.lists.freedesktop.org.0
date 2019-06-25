Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85859551B0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D2289B12;
	Tue, 25 Jun 2019 14:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C5B89199
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:29:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d4so27399545edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 07:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=G6JtZL8+U2ZkwL0/tzXXiHIEAOss9zM+ZL3Pgbc8Mpk=;
 b=b4oIg7WLHZfuKJl70YbYDh01iF05CMq9ZtT3a+3RKPkHralbUKpsVkKWnYIeeux+JG
 MfJlgbSYavlYnMT5gaIbG/zeHwN0UpJ07hLcHs5sjxzJX3j2HpdLELq60mVSraW+oA21
 kAKrlXLJbYgE4Djyqf3RDBnQqKBqTRbdwCgZ8kP5Svdfj5GYFYKbHcnKuG1DlgaIcyng
 KTHn2I1Az5hlYAGsucVQU6gL0rYGW/cHVJflG5HZ0elBRASPW7Vllg//F0F0LOIpqkKI
 UTGP/BmTDH87w6MVMSAojJsgvzHGFgoKW8mXklXzEJ207dSnDe5lSJi6qpXeNrn1vSMz
 pAaA==
X-Gm-Message-State: APjAAAUDlN/dTpvIZycJg5JzjQ00RiC8PUK9q+1iJw17yzKksvghnFWv
 Ze29vkEdeFwlQIPtRY95lVfC8Q==
X-Google-Smtp-Source: APXvYqzf+qJgnUeqQvG0q196yIL7BFlfF2ImhuXnDKq2Nc9RZ6ZHCnGm/JBXEdesWWdkz8OViVV3qw==
X-Received: by 2002:a05:6402:78c:: with SMTP id
 d12mr111470360edy.160.1561472434802; 
 Tue, 25 Jun 2019 07:20:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm4863868edd.49.2019.06.25.07.20.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 07:20:33 -0700 (PDT)
Date: Tue, 25 Jun 2019 16:20:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625142031.GV12905@phenom.ffwll.local>
Mail-Followup-To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
 <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=G6JtZL8+U2ZkwL0/tzXXiHIEAOss9zM+ZL3Pgbc8Mpk=;
 b=PiKb0pq4SASNR7D3rZRPPn6hYPGCPxODqKLMDAnrrKgPg9InzXFNxhgfcjJ0osnNob
 vyTtVKNuYim6MRswZ9WjaRBlsW8RMJPiwWKoyq3uAyYbDouZ9ZJClJkEADyVHPrEnO5E
 2dv49ZPpK3sQqXzRaWmoTu0NM4VYZANoTUsRE=
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 m.szyprowski@samsung.com, kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDM6MTA6MzJQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA0OjA3OjU1
UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPdGhlcndpc2UgSSBsaWtlIHRoaXMu
IEJpZ2dlc3QgcHJvYmxlbSBJJ20gc2VlaW5nIGhlcmUgaXMgcm9sbGluZyB0aGlzIG91dAo+ID4g
ZXZlcnl3aGVyZSwgdGhpcyBpcyBhIGxvdCBvZiB3b3JrLiBBbmQgd2l0aG91dCB3aWRlc3ByZWFk
IGFkb3B0aW9ucyBpdCdzCj4gPiBub3QgdGVycmlibHkgdXNlZnVsIGZvciB1c2Vyc3BhY2UuCj4g
Cj4gVGhlcmUgd2lsbCBiZSBjYXNlcyB3aGVyZSBpdCdzIG5vdCBwb3NzaWJsZSwgYmVjYXVzZSB0
aGUgSTJDIGJ1cyBpcwo+IGhpZGRlbiBiZWhpbmQgYSBjaGlwIHRoYXQgZG9lc24ndCBnaXZlIHlv
dSBkaXJlY3QgYWNjZXNzIHRvIHRoZSBEREMKPiBidXMuCgpPaCBzdXJlLCBwbHVzIGxvdHMgb2Yg
Y29ubmVjdG9ycyB3aGVyZSB0aGVyZSdzIGp1c3Qgbm90IGRkYyBidXMgYXQgYWxsLgpCdXQgaWYg
d2Ugb25seSByb2xsIHRoaXMgb3V0IGZvciBhIGhhbmRmdWwgb2YgZHJpdmVycyBpdCdzIGFsc28g
bm90IGdyZWF0LAp0aGF0J3Mgd2hhdCBJIG1lYW50LiBMb29raW5nIGF0CgokIGdpdCBncmVwIGRy
bV9kb19nZXRfZWRpZAoKdGhlcmUncyBvbmx5IHZlcnkgZmV3IGRyaXZlcnMgd2hlcmUgdGhlIGRk
YyBidXMgaXMgaGlkZGVuLiBUaGVyZSdzIGEgbG90Cm1vcmUgd2hlcmUgaXQncyBub3QsIGFuZCBJ
IHRoaW5rIGEgYmlnIHNlcmllcyB0byB0YWNrbGUgdGhvc2Ugd291bGQgc2VydmUKZXh0cmVtZWx5
IHdlbGwgdG8gbWFrZSBhIGNhc2UgZm9yIHRoaXMgc3lzZnMgbGluay4KLURhbmllbAotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
