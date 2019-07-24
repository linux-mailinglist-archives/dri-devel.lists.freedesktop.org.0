Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA773794
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB55F6E634;
	Wed, 24 Jul 2019 19:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3E6E634
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:15:37 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w9so34120462wmd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PWx99XZq+fN9B+Oe8W7y8sLgenk5724DKP3Xv5BSiDY=;
 b=W56NSdRwDUu9bh3+gxNb9t22Mb6FuW0PyyijnJvXcTn8iW4pXZPYzatAwFlN6X8fhb
 SFvjQLwScZ9sXo5do6qKaaar0QahkTCqxh6nVD2WgIPywl4x4Q+m3haZB7sWHuE3Vnih
 RkIfyBbDzXvX0rjeD16+x7yOt+aJbreOQuYtXa/Mvmhc2WhczhQ1OhHYgDJkX8DjkTwF
 hh1CVdpjIJ+4loyYAeIQH3N1k4hoiDIqtpB9xUKScGERhcSI2OKFJ4b9xhJImYWzvJEv
 TB7c9TPoPnJHxDnvX2E4M66EKhWUPPczyttOzHfwbAIdNpqULwdmlbsM0TI9V9ci0i9P
 RnsQ==
X-Gm-Message-State: APjAAAULwWRxHJh/wiCN3DVTsA3tCwRjghfQqu5qDp+5QO0+XrVmWJBw
 Zk/9g7hu7R99vCx/T4jC0bo=
X-Google-Smtp-Source: APXvYqyyLA4OKohlQbHOKG/b+iP0vPhb3YzM7QiNcuaGJ/Ghmpo2+PH/lTWrGKV/KjM/oPB6uYz8QA==
X-Received: by 2002:a1c:be11:: with SMTP id o17mr75123545wmf.115.1563995736502; 
 Wed, 24 Jul 2019 12:15:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id t3sm37844851wmi.6.2019.07.24.12.15.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:15:35 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:15:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 05/11] icc: Export of_icc_get_from_provider()
Message-ID: <20190724191533.GH14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122025eucas1p251df372451e0b27ad7f2e3c89df60b64@eucas1p2.samsung.com>
 <20190723122016.30279-6-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-6-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MTBQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBtYWtlcyB0aGUgYWJvdmUgZnVuY3Rpb24gcHVibGljIChmb3Ig
dXNlIGluIGV4eW5vcy1idXMgZGV2ZnJlcQo+IGRyaXZlcikuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYyAgICAgICAgICAgfCAzICsrLQo+ICBpbmNsdWRlL2xp
bnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oIHwgNiArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
