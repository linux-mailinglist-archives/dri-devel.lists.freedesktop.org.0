Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3686E972
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 18:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABED6E819;
	Fri, 19 Jul 2019 16:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81B6E819
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 16:45:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so14708859pgi.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ox+hcUaXeVD4tc0YldET6IMK+Omc2FU2Q1gv/EWehQ=;
 b=T4hzj/lwHXNdWNKN/epz+2BObEQfA4qxgDN2unuRLkmobFt+vSpNDwtNHXN8i48TEW
 pNOB0eSGQEyidE2KGURDujKVAswJPOdk4TK++dUNfi39cUqzCx1IqKkwkB3bKK6urMW/
 AhBVvCYIba1wd6cS3zsE6pXFAi1wkQqOs9r0fXpouEng4k80sHj/yixMqkvHYXOwRb4P
 DEg76lsZxnNdmwEYfuPvhNwFv0ToNs05Pg8jcBWcYQ6ztH9Hl020mVkmnUItOSZ48aZz
 YRii7iy0oy7o/e5Uy7wIk4RlZyZ36Ojoj/L2woXIeGhvxWFJLYkfUkaycycmS3nEbm4c
 9bKg==
X-Gm-Message-State: APjAAAW+tFGngEDuWHqRgQFLfD9g2SLTr1vLtW0g7wh1ACW8kcAc0mnL
 RDklME8t+4hVoA4yajB7pEY+Lg==
X-Google-Smtp-Source: APXvYqxlCE3BwSLOJCCg8GbPXFzSE34jYnVwv7lx4A5VeODhSmUC9VAnFub1+04PhbSEoSw7mGeV0Q==
X-Received: by 2002:a17:90a:2562:: with SMTP id
 j89mr59051915pje.123.1563554749429; 
 Fri, 19 Jul 2019 09:45:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id 81sm52126164pfx.111.2019.07.19.09.45.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 09:45:49 -0700 (PDT)
Date: Fri, 19 Jul 2019 09:45:45 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Adam Jackson <ajax@redhat.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190719164545.GU250418@google.com>
References: <20190718214135.79445-1-mka@chromium.org>
 <617ef7670a35f0be6beba79ecdaba8be26154868.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <617ef7670a35f0be6beba79ecdaba8be26154868.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9ox+hcUaXeVD4tc0YldET6IMK+Omc2FU2Q1gv/EWehQ=;
 b=X44x0V9a+sokJTAGdlKVeu6VcXVl/zAIOWaTLIT4dXyg1q+zOA40uFDPd27HZzgJnE
 K27Z1heRoupSPaK7W8N/1YYgItwR+A4YVHCpMjjo81DTd3a+VClJkSEkMmQgiykgW6SZ
 KzSGo4wnPK8ZEQYJS/FdqgPkStyyOfypjyU6c=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTI6MjM6MjZQTSAtMDQwMCwgQWRhbSBKYWNrc29uIHdy
b3RlOgo+IE9uIFRodSwgMjAxOS0wNy0xOCBhdCAxNDo0MSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+ID4gaW5kZXggMDQ1YjFiMTNmZDBlLi5lNDk0MDJlYmQ1NmYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiA+IEBAIC0zNSw2ICszNSw3IEBA
Cj4gPiAgCj4gPiAgI2luY2x1ZGUgPG1lZGlhL2NlYy1ub3RpZmllci5oPgo+ID4gIAo+ID4gKyNk
ZWZpbmUgRERDX0kyQ19BRERSCQkweDM3Cj4gCj4gVGhpcyBjb25mdXNlZCB0aGUgaGVjayBvdXQg
b2YgbWUgdG8gcmVhZCwgRERDIGJ5IGRlZmluaXRpb24gaGFwcGVucwo+IG92ZXIgSTJDIGFuZCB0
aGlzIG9uZSBhZGRyZXNzIGlzIGp1c3QgZm9yIGEgc3BlY2lmaWMgc3Vic2V0IG9mIEREQy4KPiBQ
ZXJoYXBzIHRoaXMgd291bGQgYmUgY2xlYXJlciBpZiBpdCB3YXMgbmFtZWQgRERDX0NJX0FERFIu
CgpJIHdhcyBhbHNvIGEgYml0IGNvbmZ1c2VkIGFib3V0IHRoZSB0ZXJtaW5vbG9neSwgc29tZSBw
bGFjZXMgY2FsbCAweDM3CnRoZSBEREMgYWRkcmVzcyBhbmQgMHg1MCB0aGUgRURJRCBhZGRyZXNz
LgoKRERDX0NJX0FERFIgc291bmRzIGdvb2QgdG8gbWUsIHRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rp
b24hCgpJJ2xsIHdhaXQgYSBkYXkgb3IgdHdvIGJlZm9yZSByZXNwaW5uaW5nLCBmb3IgaWYgdGhl
cmUgYXJlIG1vcmUgY29tbWVudHMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
