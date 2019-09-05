Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F61AB2C5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF136E15D;
	Fri,  6 Sep 2019 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31450890D8;
 Thu,  5 Sep 2019 14:26:51 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j4so5234185iog.11;
 Thu, 05 Sep 2019 07:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q+357KwvNyY+wJyemee0wqrc8e6AXwO2zGyzu6liuT8=;
 b=Coe3PlwsYbXIvi3Uo/rC6kObFAkJvwrLVq131HwTWz9SMW3mqAejYJhpytVACG64E1
 2jBMtys2V3bzddVWtpHqbxqHVYtBit8HV9DWZYs1EyIpFuum3sMFcUhoyLdlbyB+oL8f
 6w159Yfx6/zyHfQxh9BoHpQDw8GE1U3vdX91dc8MPM3rhu01+bLmtvcVe5l2XsHp5E4p
 9HKInqFpnKwSWRKqS8cXjj2JB1565E4sH6X1tvL5icac8Bms2W4AMXeabo0swfn9RTJY
 ee+fbQ0PJTMKY4/goSOpsu8UAW1E665Pmf67h8kRL+u8+aXcTBWVF2yoy4NjtiPSkVcC
 o3fw==
X-Gm-Message-State: APjAAAUqG3X+3kG8dH8+1Rulmgm+q08ZaVFKz6NNgkrS8aptZv2JKx5L
 InwhhJEdsjVOYBA8k5DgpZOtAO3ygdWfy0xE3Ic=
X-Google-Smtp-Source: APXvYqy4Vhcn6NpXRW6OYhDvJUR0iWbZKP2tTqahRcLHyyWlL2k9Yc37MptJ06YkHBxEtkO4k2uf396d5KZGjx1lJ58=
X-Received: by 2002:a05:6638:8e:: with SMTP id
 v14mr4293784jao.72.1567693610586; 
 Thu, 05 Sep 2019 07:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190904211551.10381-1-kw@linux.com>
In-Reply-To: <20190904211551.10381-1-kw@linux.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 5 Sep 2019 08:26:39 -0600
Message-ID: <CAOCk7Npab7Ffi1fKQ8p9s6_XbrGJaG6tTa7W2dXNqn+rrP2Onw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Move static keyword to the front of
 declarations
To: Krzysztof Wilczynski <kw@linux.com>
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q+357KwvNyY+wJyemee0wqrc8e6AXwO2zGyzu6liuT8=;
 b=ZXx8UvfzqCNfutH7x8/UBhR2N6yi7+q+BF5eMZ7i4fCdz+eFMVy8WHsWZd7lqNobgf
 XTIycr3EdIGl9yBCPLJ0LwDWslY0X+If2OQsEtJoaiMvj2X+6YZu+MTSJ0V1FaBfyPpj
 WRXMzgSyz7wEy+lmnIQ8rqI0iUA83IIuWcbiH4vS8UswSEoC193CIRh1MSAC6M8AtfLA
 g8vcBRgcJo3bYwOVzQUVdrS4XbFNSVR9Xsx9c+rY9vWTqckksvpXfY0weCozatthiA8W
 czq3Y2w0xn116mC7d6f3oanKz9IFytA57NarXn1B3DD7sZYnj+SNslOmW4KUI4KbKh7F
 cVjw==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alexios Zavras <alexios.zavras@intel.com>, MSM <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAzOjE1IFBNIEtyenlzenRvZiBXaWxjenluc2tpIDxrd0Bs
aW51eC5jb20+IHdyb3RlOgo+Cj4gTW92ZSB0aGUgc3RhdGljIGtleXdvcmQgdG8gdGhlIGZyb250
IG9mIGRlY2xhcmF0aW9ucwo+IG9mIG1zbV9kc2lfdjJfaG9zdF9vcHMsIG1zbV9kc2lfNmdfaG9z
dF9vcHMgYW5kCj4gbXNtX2RzaV82Z192Ml9ob3N0X29wcywgYW5kIHJlc29sdmUgdGhlIGZvbGxv
d2luZwo+IGNvbXBpbGVyIHdhcm5pbmdzIHRoYXQgY2FuIGJlIHNlZW4gd2hlbiBidWlsZGluZwo+
IHdpdGggd2FybmluZ3MgZW5hYmxlZCAoVz0xKToKPgo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L2RzaV9jZmcuYzoxNTA6MTogd2FybmluZzoKPiAgIOKAmHN0YXRpY+KAmSBpcyBub3QgYXQgYmVn
aW5uaW5nIG9mIGRlY2xhcmF0aW9uIFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KPgo+IGRyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYzoxNjE6MTogd2FybmluZzoKPiAgIOKAmHN0YXRp
Y+KAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9uIFstV29sZC1zdHlsZS1kZWNs
YXJhdGlvbl0KPgo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYzoxNzI6MTogd2Fy
bmluZzoKPiAgIOKAmHN0YXRpY+KAmSBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0aW9u
IFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBX
aWxjenluc2tpIDxrd0BsaW51eC5jb20+CgpTZWVtcyBmaW5lIHRvIG1lLgoKUmV2aWV3ZWQtYnk6
IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
