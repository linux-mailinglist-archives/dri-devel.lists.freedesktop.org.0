Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A967CDA661
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDB26E9F9;
	Thu, 17 Oct 2019 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2168C6E9F9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:25:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r5so1026373wrm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 00:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jAAT95spfsOy4+Rq+gH+u3lTOCghLhGj68CKdrx98lE=;
 b=OdaTLcrDDUNKAO67kK8hznMbmUIWz2wyUuXlVidotJr6IVxdUw1kZV+IGxmIer1VKY
 RJc0PcRiMU1pgkzbY6rHsocL0vlKcGDSgaFJbSO5IeJRQ2ezXfuRjERdIbaFdO6ZdXXR
 YStbvYASRyDrR2wBsvmRi9iNPG/C8hToez5hlYuPScwX1GypCKg2i9jwojuY/ADQFhYJ
 JcX0w2oW9mcU7Ftbtk7ZMXEhupCwu0mxL6qEfOHXrZJ/S8C4Ca6+FNCh6gA8n37qoKff
 VfrVnQBEMXDanARQgU8dU5Ljq8LyujiYpIeQoxzi7J3WVvLFSUBdDLNgB5CpUpDcQ+hT
 QfBA==
X-Gm-Message-State: APjAAAXrCbZI3j4PuAQ3QNGj4WgnSt5XzDFHC5i931nMS6QJu0u3PD9y
 YGMHMVBlEIgujvzvR3D/Ulw1WQ==
X-Google-Smtp-Source: APXvYqx9/y1nF0ofABrlWuRvb2aHc8qYFhZp9RVTdgQNYYfN+rH7FOQdXwZFWhoItjuvwj7hH3/jTA==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr1554836wru.87.1571297152660; 
 Thu, 17 Oct 2019 00:25:52 -0700 (PDT)
Received: from dell ([95.149.164.47])
 by smtp.gmail.com with ESMTPSA id o22sm1351495wra.96.2019.10.17.00.25.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Oct 2019 00:25:51 -0700 (PDT)
Date: Thu, 17 Oct 2019 08:25:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
Message-ID: <20191017072550.GK4365@dell>
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
 <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
 <20191016130536.222vsi5whkoy6vzo@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016130536.222vsi5whkoy6vzo@uno.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=jAAT95spfsOy4+Rq+gH+u3lTOCghLhGj68CKdrx98lE=;
 b=F9UsfomGr2CNeYykZN6yZitMfmX8fyJmBmymlewoU1PXc2q1Vn6t2I3rLUE0QWoC+8
 MhGZC1Xxu/HAPvWEqxlCLTCRMaaDSMkAqReNf/vsQmeJgSro0pTbKA1qHoespSFtIU4T
 hckNX80j47KRUy7XU7YRVWBJJrOhFo29SE2b0tDHsFp6jwXQK2NKPBZS9NbwhF5Qrclh
 wEK1zOlExz/lr5gS1h3P4ujA4JxsgbbgXtH2moIUZpERKAVb7XpXk5V1UuFSDK+DHnkO
 HEdCkGHQMMEirfde1nue9BKxA5pg2UOVVQ7LOxvfko9gpIMy1XcL/1RyLnOW7FZBzwn0
 GIrg==
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
 Jingoo Han <jingoohan1@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBPY3QgMjAxOSwgSmFjb3BvIE1vbmRpIHdyb3RlOgoKPiBIaSwgc29ycnkgZm9y
IG5vdCBoYXZpbmcgcmVwbGllZCBlYXJsaWVyCj4gCj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQg
MDI6NTY6NTdQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDE0
LCAyMDE5IGF0IDEwOjEyIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4KPiA+ID4gPiAgYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jICAgICAg
ICAgfCAgMzMgKysrKy0tCj4gPiA+Cj4gPiA+IEkgZ3Vlc3Mgd2UncmUganVzdCB3YWl0aW5nIGZv
ciB0aGUgU0ggQWNrcyBub3c/Cj4gPgo+ID4gVGhlIG9uZSBtYWludGFpbmVyIHdpdGggdGhpcyBi
b2FyZCBpcyBwcm9iYWJseSBvdmVybG9hZGVkLgo+ID4KPiA+IEkgd291bGQgc2F5IGp1c3QgYXBw
bHkgaXQsIGl0IGNhbid0IGhvbGQgYmFjayB0aGUgZW50aXJlIHNlcmllcy4KPiAKPiBJJ3ZlIGJl
ZW4gYWJsZSB0byByZXN1cmVjdCB0aGUgRWNvdmVjLCBhbmQgSSd2ZSBhbHNvIGJlZW4gZ2l2ZW4g
YSBjb3B5Cj4gb2YgaXRzIHNjaGVtYXRpY3MgZmlsZSBhIGZldyB3ZWVrcyBhZ28uCj4gCj4gSXQn
cyBpbiBteSBUT0RPIGxpc3QgdG8gdGVzdCB0aGlzIHNlcmllcyBidXQgSSBkaWRuJ3QgbWFuYWdl
IHRvIGZpbmQKPiB0aW1lLiBJZiBJIHBpbmt5IHByb21pc2UgSSBnZXQgYmFjayB0byB5b3UgYmVm
b3JlIGVuZCBvZiB0aGUgd2VlaywKPiBjb3VsZCB5b3Ugd2FpdCBmb3IgbWUgPyA6KQoKWWVzLCBu
byBwcm9ibGVtLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
