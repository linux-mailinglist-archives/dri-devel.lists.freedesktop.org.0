Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4BA527E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8887F89C18;
	Mon,  2 Sep 2019 09:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318989AB9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:06:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so13180909wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0GID28MOVw3IqgOtjsXJT38X0mktzIfxk7qKPFjEw8Y=;
 b=Kq6oADmtlcBQpkRDwmk7VEop3mM2PuFOcWSGEyIOgxGJuvGihu//HZO0tGwn6LgJ1n
 f9CUtAxRrQm3tc9D+5ILrmzSDsogm5lEnk/Qj23gsCu1jpeOuVMGC5erdgTqnNV4uqbd
 w2RWXJrwGLnJoGYTZpPfOO+FDrVeiTfBEz1C3jAyo6gojSsUdqVyml/tf7kXxd9ggSGy
 /tKrm+0spWswWypvqmhIY727wtjYZ0ZbeuKIwbfca9wGWG/VDhGxFwwraPQorAcK+qcb
 EtxzULUhan9Fw04l7aIaLFjmk95NqzXrtEtlOgQ1AVXwjWKxy4Ol5YsiZ79AteBDi07x
 wxYA==
X-Gm-Message-State: APjAAAXdWgTiJj0fTp6Xpn8gcf0+M22tyqTYgcykEhUEHuItjAG7RkbG
 r4TjCekMlZ9U6IBLwS6JazPPBQ==
X-Google-Smtp-Source: APXvYqyGchDBpbIV0gXn9irGSUfGOAygOBZe+P22P17+hvKlBQgWDe2vziKLR0WrBSi+Ty7HtNTYKA==
X-Received: by 2002:adf:d1a4:: with SMTP id w4mr36364617wrc.331.1567415208695; 
 Mon, 02 Sep 2019 02:06:48 -0700 (PDT)
Received: from dell ([95.147.198.93])
 by smtp.gmail.com with ESMTPSA id n14sm49290434wra.75.2019.09.02.02.06.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Sep 2019 02:06:48 -0700 (PDT)
Date: Mon, 2 Sep 2019 10:06:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] video: backlight: tosa_lcd: drop check because
 i2c_unregister_device() is NULL safe
Message-ID: <20190902090646.GE32232@dell>
References: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=0GID28MOVw3IqgOtjsXJT38X0mktzIfxk7qKPFjEw8Y=;
 b=B4t36eTzRUg10X2oYdNxqdht2V8mmilid7efZANO7l/f0AtKhN/HTTcWldm5et9WB/
 D8zgaoG3x9ANGJmSrXDSeKvaanVJl5cIdOJK7Mmk0Luvj35cpHGC5V5EjWHwfStmeMea
 yl2kob86RjHU0biSFMF/44xWdj07sODUCQygtk4Rb6fff9NaNPfs27G1QGJcCYTaGF3c
 uw74a3Ro9TE0GVaEjpfh4jgmUZPWIK+RBo4/r5OwH477Z3OWl7dj4KxLtm4qrfAwgzew
 65ia/DVRC1GBFpzPQTH0iMAuFW8lrYm66R2B1LtFF96qrkoPG1dgNXVg+6mZhjv29f8f
 99bA==
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
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSwgV29sZnJhbSBTYW5nIHdyb3RlOgoKPiBObyBuZWVkIHRvIGNo
ZWNrIHRoZSBhcmd1bWVudCBvZiBpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoKSBiZWNhdXNlIHRoZQo+
IGZ1bmN0aW9uIGl0c2VsZiBkb2VzIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2Fu
ZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gQnVpbGQgdGVzdGVk
IG9ubHksIGJ1aWxkYm90IGlzIGhhcHB5LCB0b28uCj4gCj4gUGxlYXNlIGFwcGx5IHRvIHlvdXIg
dHJlZS4KPiAKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9sY2QuYyB8IDMgKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCkFwcGxpZWQs
IHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
