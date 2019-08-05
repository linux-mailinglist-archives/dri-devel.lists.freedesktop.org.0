Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C781726
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF58D6E2DF;
	Mon,  5 Aug 2019 10:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA736E2DF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:36:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so83871917wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+eM6Lk3UMptX6p2/MzlUI3lYSYvFMWs9PeIsI7SO8CI=;
 b=EelSltNl6gEmEby+d0YPN8sb6jtwfEXkdYYeOHolpr5Ml8vB6IEWYKmRUdCJHEzQSl
 oE8JsRxCWo2pg+NsGLLafRhVPDX6ifO9lj2t3EiSs0mbJ03Z+waktA9SqoiKOKw8Ko3S
 9tTz7kbl9+zTmUHkIjPyLKFTsQqQTfSusnoscBE9qimaVAE+A9RyKSem9Cbd+ZO8IQh8
 P1lJJATjgp40EHBCgDZQSe6pBhaE1prpxyVLSNYeA+1eufq3U1bbF1nOUlCGu2f6eBp1
 BWOr2sPY0NThCVSXNvWyNczfLFc7XOV3RL6IJW1Zj4XAGxabO8KFJstOu3AQ+JOi5SV9
 vNaA==
X-Gm-Message-State: APjAAAV7Xo3348z6UkuSS2iVf0rpPjI2+nOYD8bbqnVK9FIbY6ssLOgO
 HwGNYJ7Ivo5Yf534QQtWWTz+HA==
X-Google-Smtp-Source: APXvYqxDrni8WZSr39UI+8KlO8PLDdJJjaXonfDDcmHH8YqIkyzKvvAtQWXsTdXATIKSsH8AONwlnA==
X-Received: by 2002:adf:eac4:: with SMTP id o4mr157480823wrn.290.1565001362970; 
 Mon, 05 Aug 2019 03:36:02 -0700 (PDT)
Received: from dell ([109.180.115.177])
 by smtp.gmail.com with ESMTPSA id e6sm83831227wrw.23.2019.08.05.03.36.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 03:36:02 -0700 (PDT)
Date: Mon, 5 Aug 2019 11:36:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
Message-ID: <20190805103600.GF4739@dell>
References: <20190725143224.GB31803@ravnborg.org>
 <20190726095016.wsj7jnni5zdh37dl@holly.lan>
 <20190726112724.GB20065@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726112724.GB20065@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=+eM6Lk3UMptX6p2/MzlUI3lYSYvFMWs9PeIsI7SO8CI=;
 b=DvajJlUhF3ySaZpQGKCuofjs0AMiwxxLZTgjjTvja7QYzHxi++d0ZOjxSO5xkfgXdd
 +Mo1OqrHQqTYpKMQL6x/4hh3OHOn3C/wi618a2jXZSk+/8lCL9/8ooPfE9bFoxBhyPoh
 FkG3QgJ/AAYwn13KLrczURE2S52Gs2poBqH7DX+9V89+/2WuCo/7u063WZJoR4YZyec8
 qFJxalbreEenv9qEatqdT6I9txAkwHa2+qoM8pvLhw3o9OjW0u/ciXF/mYqtDcHMhKx0
 co1iqqSGZ31pUlriLaO2VYf4Y2d578QMBoNre3kk8a53Uj2eCDnXZ8iyMYOffEJ+ENkn
 hb8A==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Gerd Hoffmann <kraxel@redhat.com>, Jingoo Han <jingoohan1@gmail.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBEYW5pZWwuCj4g
Cj4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6NTA6MTZBTSArMDEwMCwgRGFuaWVsIFRob21w
c29uIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDQ6MzI6MjRQTSArMDIwMCwg
U2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPiBUaGVyZSB3YXMgbm8gdXNlcnMgbGVmdCAtIHNvIGRy
b3AgdGhlIGNvZGUgdG8gc3VwcG9ydCBFQVJMWV9GQl9CTEFOSy4KPiA+IAo+ID4gV2h5IGFyZSB3
ZSB1c2luZyBhIGRpZmZlcmVudCBub3VuIGZvciB0aGUgc3ViamVjdCBhbmQgZGVzY3JpcHRpb24/
Cj4gSSBmYXQtZmluZ2VyZWQgdGhlIGRlc2NyaXB0aW9uLgoKPiBXaWxsIGZpeCB3aGVuIEkgYXBw
bHkgLSBvciBzZW5kIG91dCBhIHYyIGlmIHJlcXVlc3RlZC4KCk9rYXksIGp1c3QgYXBwbHkgaXQg
dGhlbjoKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
