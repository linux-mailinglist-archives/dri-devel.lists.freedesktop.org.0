Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319A37A25
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107178932D;
	Thu,  6 Jun 2019 16:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EC6892F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:54:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id c85so1883422pfc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uP+0RK/olOLeLANX1udo5x/E16Z31PJSvZb1HggqSws=;
 b=R9+Gbd4szSEQj7Ttbt5J3WSd1JlC0CDKYH3boMLqOwaegW592GsKZkZBZkHVXelZ2j
 byuG6Yl2dWRs+mbxFv+PEhuVAInCTNMUecbuuUNlJzIQ9G0HiVNy6LhF/Cwki/S7lRUC
 xWNgQLUHt+A265l840nhjucoGZCIqFt5y6KhwemU67CQs4Vl7JY1fw0cYNGX6rw0ER4R
 nrqX0HpIzAigtPNdVzSnPDmvrvJX8Iqyz0eEVApDLvN3FM3QjklByIO4C6mT+c2F/s/9
 nRrXelaiC+/l6Al+N1XRNG66ctmrQm4o6iHk60CakpwnikISfPg7k/g38dBx1wqgOrDF
 DYNA==
X-Gm-Message-State: APjAAAXSk84VzWrvM1eW+dKBXjp6tZs15O9TA6lU4dUzN/2CVf+zf4LG
 Dvn2ld3GScMjPzOIlygy5DuIuQ==
X-Google-Smtp-Source: APXvYqz6c0pC8u38g28qlOAS2XbmDD8MZ971NxMGdinizUMqohDxRr61H7/m/o7Wl3Ba2JWsSM4ODg==
X-Received: by 2002:a62:2643:: with SMTP id m64mr52532743pfm.46.1559840046284; 
 Thu, 06 Jun 2019 09:54:06 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 132sm4535503pfz.83.2019.06.06.09.54.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:54:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: Add zpos immutable property to planes
In-Reply-To: <20190429075247.7946-1-narmstrong@baylibre.com>
References: <20190429075247.7946-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:54:04 -0700
Message-ID: <7h8suefydv.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=uP+0RK/olOLeLANX1udo5x/E16Z31PJSvZb1HggqSws=;
 b=N63CQleFfxxkHFbTvUxXAUj00SNojMJgEc+8bCzpWUz1SMMaeJKUxegJaRKSTsMDGD
 1dXL8l79JGZivWqLKJiapBgjCIILm1saH34vLs86d0CTrZQtYOHd6/VsvTF4VTF33DxE
 5fAuWLUp0CA31TSfKw1iDCioDpxjx75VLgGB1fA73diiIFdwTIXaIcn330n7y7owgAXi
 ljqZsxObVnsQT+OOpjXyaIV8X0gLvZ20AV6HnZZxfVZiGZmBbfD3tTQto+WJYNzcO6r1
 Dkvo1fjPrA0HVKT0OyHi1NhWbKG11qmOtQBEYhkXv3pC+TbRtof1/eAeSVruo5LY+hhv
 1dAQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IEFkZCBp
bW11dGFibGUgenBvcyBwcm9wZXJ0eSB0byBwcmltYXJ5IGFuZCBvdmVybGF5IHBsYW5lcyB0byBz
cGVjaWZ5Cj4gdGhlIGN1cnJlbnQgZml4ZWQgenBvcyBwb3NpdGlvbi4KPgo+IEZpeGVzOiBmOWEy
MzQ4MTk2ZDEgKCJkcm0vbWVzb246IFN1cHBvcnQgT3ZlcmxheSBwbGFuZSBmb3IgdmlkZW8gcmVu
ZGVyaW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+CgpSZXZpZXdlZC1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
