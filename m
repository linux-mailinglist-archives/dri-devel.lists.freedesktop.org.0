Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F04D91B3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 14:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4098D89DF7;
	Wed, 16 Oct 2019 12:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AE089DF7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:57:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y189so22627493qkc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 05:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKYnCxXI+enDKKpRO1ujL8VETmHUaDu3E+T33R6ISPM=;
 b=V8SHJoWoRVrQKkMm01+3qQsBuGglhbFMGCZKGXhk9xlIayAd0YlW3oSf3Oh2Weg03v
 0ZJPWVCyISbUaWchx26RGdWpwbhbyJ9oQ2u7LElzU7BnNzXo+6DIg4U1jFv5r/7IMOjb
 RB8/y3OPCC5QcyQsh8JPQOTd+XL71Dm9pwdBZaW8hjni1PU1MFEPCgMNL7eynJYQoYzc
 T5IoU48slnGgHzB7Y2j3fJmo6wHx/xnRhTNkVUyIn5YlGKjxy1//ZiZa6ptIu0Fwb8ea
 V10/oL2A1gXowv6usks/EKbgNFjnEyJDHGVk5MJZIAyxbDQIJQybccapZMBPZxN8EEAQ
 9svA==
X-Gm-Message-State: APjAAAXQ4HBnpliX6bURs/zUf2yj2LPcJFK9EE8zWbuvtoXP+bbiU8Ov
 6sHUkNuYe4ltnBUacIeAJW2JKx5jO8Ck2GFnj5JawQ==
X-Google-Smtp-Source: APXvYqznfR9xVNBpGb36Jsp8fvtPYC6w0IX8Z65LGupMXk2zMNyuYFGC3dG8oecpreWNjUjM4OyYtcubd/IaRbgJffA=
X-Received: by 2002:a05:620a:34b:: with SMTP id
 t11mr38227900qkm.213.1571230629198; 
 Wed, 16 Oct 2019 05:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
In-Reply-To: <20191014081220.GK4545@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 14:56:57 +0200
Message-ID: <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
To: Lee Jones <lee.jones@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iKYnCxXI+enDKKpRO1ujL8VETmHUaDu3E+T33R6ISPM=;
 b=g+hwROET54h2vndrV5UvySYq7yp4qvTU86tqp4hmxXDtqKunS2ZAkElaa58Q5b4Q8D
 M1ywHBIht82QXc0sQVnbrPHvj/77gY5eosNK8hQ57ufu93BZWmbfvHTwXMyNa6fnpzXa
 1PN3FvGDq+leBePGK/7aSGNWvUDLqMkfCcbyiVYHfRQtVyXktxQg8UuNek2nnYs/epA9
 LTtVGWlzRReML6keZeXR3wcPzCm8eQWLQk3G/4OKsBlnUS3D94qdF20EvR61SCA9XRva
 ssR4DyZSN19wIDjz3MgR9L2lJCmq5uSYaMwXvKF0seOtB1wgHwYAWSVCE58/8T/cafDj
 cjzg==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTA6MTIgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cgo+ID4gIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAu
YyAgICAgICAgIHwgIDMzICsrKystLQo+Cj4gSSBndWVzcyB3ZSdyZSBqdXN0IHdhaXRpbmcgZm9y
IHRoZSBTSCBBY2tzIG5vdz8KClRoZSBvbmUgbWFpbnRhaW5lciB3aXRoIHRoaXMgYm9hcmQgaXMg
cHJvYmFibHkgb3ZlcmxvYWRlZC4KCkkgd291bGQgc2F5IGp1c3QgYXBwbHkgaXQsIGl0IGNhbid0
IGhvbGQgYmFjayB0aGUgZW50aXJlIHNlcmllcy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
