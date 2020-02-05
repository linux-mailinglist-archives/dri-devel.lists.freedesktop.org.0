Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01107153FDC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403D6F9E7;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDBD6E9D1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:11:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so3310437wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c3yHxHXOFvWJiYAgSKuZerQDF45N4Lz8/Qbl2P6sbW0=;
 b=qwjJhJxVvKxtdGtAoKzW+6g8gLPLQUt2TmhsLh3m3WlQhgLL3c+UjLqKaXByqQcO7U
 92hS5deCJj20Xq7Ortj92OD0nAhXwiTCuOqY66A0MgTtBJjGAwmUG3NSoCOqk+mjzuIU
 h68/CnUa7KWfEBD3H6jz2GNmPV3mOlLJ5c7D/Jt3OhylUpeFbDzIhreyC9gbAyspJI68
 nMsWtXU9OZUIkNrtKx7+JXrpYZh2EfVD9PL86HS61GZg5TRVecFPZ54U71oKOcVlfzcT
 OWURlxN6Am/cODdLRpB3ZJar3i/3Lovfk4CnvVpgzU9gjjNfnU3WUv6PyjjcyR5CAOp8
 yJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c3yHxHXOFvWJiYAgSKuZerQDF45N4Lz8/Qbl2P6sbW0=;
 b=S0kpw07yPizb7aG/7XKgp+GB+e4mR3jgfHHHfAb31evUmWM0Fla9eixzilNWkZ/IAD
 Tto3n7XjCh1XH3bIzJokdZt3vB3SK7L2BFtiTyRCkuDh0J0EL8uWUio3dCfgMHVFXWuh
 kHXFtPKXFM7j3W8cvYHCCH82aySMOgDOBfZhPMoTAeUUX0mLpCyphdSFPgBe5Kvxdx92
 8wjQckRHAALUYtcRBneN9+Y8a8bHS9BtFgbYFYt/QxHLwJXFN01Wzh8L/c2t2fdi17Ue
 +6ibYi9JPTOiHUL3oAHTXcjIsPnugowUtBpygp/tc0YhMwMuXgYeAh1pIqALt+rkt0uj
 Wubw==
X-Gm-Message-State: APjAAAWn7aBYnM94sZQqBJYGEi1I6hQ4SW7uWkvSooA8apmYk3T/JJ0/
 +yMUpvqY0z4Ah864lreGkOHlcHRc
X-Google-Smtp-Source: APXvYqyt5fWl1XC4rlumOaIwAet+nh2GPYJgXARxM9v4x72ycfukvTE+TpaVODQpw1Q/vdWL2JmF3w==
X-Received: by 2002:a1c:a752:: with SMTP id q79mr6356428wme.64.1580922687811; 
 Wed, 05 Feb 2020 09:11:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d22sm218322wmd.39.2020.02.05.09.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:11:27 -0800 (PST)
Subject: Re: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6520041-f760-a74b-0250-1108e61b899c@gmail.com>
Date: Wed, 5 Feb 2020 20:11:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEhpLAo+IAo+IHRoaXMgY29udGFp
bnMgYSBjb3VwbGUgb2YgZml4ZXMgZm9yIGEgRE1BIEFQSSBwZXJmb3JtYW5jZSByZWdyZXNzaW9u
Cj4gdGhhdCB3YXMgaW50cm9kdWNlZCBpbiB2NS41IGZvciBvbGRlciBUZWdyYSBkZXZpY2VzLiBQ
YXRjaGVzIDEgYW5kIDIKPiB3aWxsIGxpa2VseSBoYXZlIHRvIGJlIGJhY2twb3J0ZWQgdG8gdjUu
NS4KPiAKPiBUaGllcnJ5Cj4gCj4gVGhpZXJyeSBSZWRpbmcgKDMpOgo+ICAgZHJtL3RlZ3JhOiBS
ZWxheCBJT01NVSB1c2FnZSBjcml0ZXJpYSBvbiBvbGQgVGVncmEKPiAgIGRybS90ZWdyYTogUmV1
c2UgSU9WQSBtYXBwaW5nIHdoZXJlIHBvc3NpYmxlCj4gICBncHU6IGhvc3QxeDogU2V0IERNQSBk
aXJlY3Rpb24gb25seSBmb3IgRE1BLW1hcHBlZCBidWZmZXIgb2JqZWN0cwo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZHJtLmMgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyAgIHwgMTAgKysrKysrLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYyB8IDQ0ICsrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvaG9zdDF4L2pvYi5jICAgICAgfCAzNCArKysrKysrKysr
KysrKysrKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCA0MSBk
ZWxldGlvbnMoLSkKCldvcmtzIG9uIFRlZ3JhMjAgYW5kIFRlZ3JhMzAsIHRoYW5rIHlvdSB2ZXJ5
IG11Y2ggOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
