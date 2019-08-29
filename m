Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BCBA21C7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 19:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63AD6E129;
	Thu, 29 Aug 2019 17:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEB76E129
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 17:07:01 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53081C05686D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 17:07:01 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id h18so4001982qto.18
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KpaKBQvzLpG9KqBr01yVnQX/M7rpnfov/U+0afjVNGM=;
 b=cAEhx3fl6i+YHzkmCo1cX385Rv7oOL+g5aOiAek5Fwf9/P4jLwISwkim6NQD856rWv
 +/ym867sUDjbP/LvjUdaI7O6eNxNjUzc3y00w4mk3NFAMAWbzmCA+Q8lNgqlw9XUAkX7
 nJeGfhmhrArXqNkcw+BxfHL81I4Ln30T6Z7YlWvh2XpzQQhgI8HiEFC7kENzeLpry26R
 +BHNt0Zm3D3aVlGfu/p8TmOnjuQwpshZ+2D1mghybN+Xsl1lk9h9OXV+1XcQb8wi0NNh
 keZWwwRlHZYMQSVkPXPpa790YnotKc7Y7Y8/5AJIgkfp3HcUE7BUgZd7FMyYMFjXQtrX
 k8tg==
X-Gm-Message-State: APjAAAX7n4+gcb7X/lQ5OSme/KIgS95K5qrrmA0yh/rLLk5qW3d/9a7W
 U7WUaVdOYdq88zbKz/apWtxBEgpGdHEhKIUE90Q2tZB1obJDdjSF5STiUOhgE5I/rOL8/eFDMDb
 bMFHntYWqUD2Td2OIUEbn1ZUV/UvD
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr11039774qtp.9.1567098420632;
 Thu, 29 Aug 2019 10:07:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySnAmJD972UE5D4SPQYuunb3ayy3uKj3F2Wmm1K7rPh/8PeVLff00Q5E5OQ+gtUvslFoUsyA==
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr11039741qtp.9.1567098420385;
 Thu, 29 Aug 2019 10:07:00 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c13sm1591981qtg.3.2019.08.29.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 10:06:59 -0700 (PDT)
Message-ID: <9927a099fc5f0140ea92e34f017186d9ffe0bb13.camel@redhat.com>
Subject: Re: [PATCH] drm: mst: Fix query_payload ack reply struct
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Date: Thu, 29 Aug 2019 13:06:58 -0400
In-Reply-To: <20190829165223.129662-1-sean@poorly.run>
References: <20190829165223.129662-1-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: Todd Previte <tprevite@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXMgaXQgd29ydGggYWN0dWFsbHkgQ0Npbmcgc3RhYmxlIG9uIHRoaXM/IFRoaXMgcGF0Y2ggaXMg
Y2VydGFpbmx5IGNvcnJlY3QgYnV0CkkgZG9uJ3QgdGhpbmsgd2UgdXNlIHRoaXMgc3RydWN0IGZv
ciBhbnl0aGluZyBxdWl0ZSB5ZXQuCgpPdGhlcndpc2U6IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgoKT24gVGh1LCAyMDE5LTA4LTI5IGF0IDEyOjUyIC0wNDAwLCBT
ZWFuIFBhdWwgd3JvdGU6Cj4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+
Cj4gCj4gU3BlYyBzYXlzWzFdIEFsbG9jYXRlZF9QQk4gaXMgMTYgYml0cwo+IAo+IFsxXS0gRGlz
cGxheVBvcnQgMS4yIFNwZWMsIFNlY3Rpb24gMi4xMS45LjgsIFRhYmxlIDItOTgKPiAKPiBGaXhl
czogYWQ3ZjhhMWY5Y2VkICgiZHJtL2hlbHBlcjogYWRkIERpc3BsYXlwb3J0IG11bHRpLXN0cmVh
bSBoZWxwZXIKPiAodjAuNikiKQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+
IENjOiBUb2RkIFByZXZpdGUgPHRwcmV2aXRlQGdtYWlsLmNvbT4KPiBDYzogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IDxz
dGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHYzLjE3Kwo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZHBfbXN0
X2hlbHBlci5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIu
aAo+IGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+IGluZGV4IDJiYTYyNTNlYTZk
My4uZmMzNDkyMDRhNzFiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVs
cGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gQEAgLTMzNCw3
ICszMzQsNyBAQCBzdHJ1Y3QgZHJtX2RwX3Jlc291cmNlX3N0YXR1c19ub3RpZnkgewo+ICAKPiAg
c3RydWN0IGRybV9kcF9xdWVyeV9wYXlsb2FkX2Fja19yZXBseSB7Cj4gIAl1OCBwb3J0X251bWJl
cjsKPiAtCXU4IGFsbG9jYXRlZF9wYm47Cj4gKwl1MTYgYWxsb2NhdGVkX3BibjsKPiAgfTsKPiAg
Cj4gIHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5IHsKLS0gCkNoZWVycywKCUx5
dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
