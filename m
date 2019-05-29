Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFB2D574
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 08:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615026E1BB;
	Wed, 29 May 2019 06:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B9B6E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 06:23:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m22so1002835ljc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 23:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
 b=FpIeGvyIIC5+CftsQf9ygBZk+/rxo//FTlpaf+tEQu0pNZR+ZRlSrdj44OF2T3yQ1i
 di+hPJJ2UGl7aXaEhnHo46TIHy9mU5ZorfSPqWdsNRMnDK6FZYPz2wir2W9UTfveUtbv
 xNEhCJwcfPE2IgJsd/8fFJgshPEQFuYnM8pjsb8geV7ppg/ZQ549xr+RErdqZnMpnvHi
 oyq1LWlyhJ9DPwxHmv/f8C+VlLfwSCuyZ19ihDsg6ak/Y4WmcLbnMU0bxXcAzHnM5os+
 EXrPZ5P1+X0iMGJpvQCqGmk7dAp3e3YrSTvUhcrYiuH32ePodqlxcQMuV5Pvb3XKxTIG
 T3ww==
X-Gm-Message-State: APjAAAXyL60ypofLdVQgUf41DqOZwaiRqfqq5KcLhczlRJVNSP9uNzkb
 ZN374CRNJ9uExNoZwdJk0bdTlnkyegT2rKD8o6zaGA==
X-Google-Smtp-Source: APXvYqwIsl1wSDxK9EPcOc6HNZDGzaYIXxohtHwHpz4z0RvbNyq1y2+YZmevdVoB7By354baiJgjeTvrt9wKyS/5rzA=
X-Received: by 2002:a2e:8997:: with SMTP id c23mr1321995lji.94.1559111009909; 
 Tue, 28 May 2019 23:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2019 08:23:17 +0200
Message-ID: <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
 b=oqk/J0AF4QeADPOdicRdeDUwsHkDSXWjWx8dSgJe6kYqicSzaWT6We5F12PmUwMZ65
 LMtry+PPgl9aZ+ehVfQ3aYUPdsUA+0G/0MxVYzVP3GQ7nbyVaWAFtqS14q9Cz/sXTVWw
 WStWmxJlYuL0EZHA9ZLPC+k+8DEk47jsreW/64yj3ouY/mC8ANmDOehvx6T5ccr5eMGf
 1WHWfK+w0dKIuRVlMUYtK5EJTnE70DhNt1doisAzvDA3kA4nYYZdqKIMaavmi3/4P3dM
 OFEXNXqpmonqPRobjHOdNVf7Lw0XFzgEPkX3HUfI1XRrIa4g+PCInqe2zu8U3pN8pT/h
 jBAg==
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMzoxNyBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEl0J3MgaW4gbG93IHNwZWVkIG1vZGUgYnV0IGl0cyB1c2Fi
bGUuCgpIb3cgbG93IHNwZWVkIGlzIHRoYXQ/Cgo+IEkgYXNzdW1lIHRoYXQgaXQncyByZWxhdGVk
IHRvIHRoZQo+IHZibGFuayBldmVudHMgbm90IHdvcmtpbmcgcHJvcGVybHk/CgpUaGV5IGFyZSBv
bmx5IHdhaXRpbmcgZm9yIDUwIG1zIGJlZm9yZSB0aW1pbmcgb3V0LCBJIHJhaXNlZCBpdAp0byAx
MDBtcyBpbiB0aGUgLW5leHQga2VybmVsLiBJJ20gc3RpbGwgc3VzcGljaW91cyBhYm91dCB0aGlz
CmV2ZW4gdGhvdWdoIEkgdGhpbmsgeW91IHNhaWQgdGhpcyB3YXMgbm90IHRoZSBwcm9ibGVtLgoK
Rm9yIGEgY29tbWFuZCBtb2RlIHBhbmVsIGluIExQIG1vZGUgaXQgd2lsbCBuZXZlcnRoZWxlc3MK
YmUgbW9yZSB0aGFuIDEwMG1zIGZvciBzdXJlLCB0aGUgdXBkYXRlIGlzIHZpc2libGUgdG8gdGhl
Cm5ha2VkIGV5ZS4KClJhaXNlIGl0IHRvIDEwMDAwIG1zIG9yIHNvbWV0aGluZyBhbmQgc2VlIHdo
YXQgaGFwcGVucy4KZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM6CiBtc2Vjc190
b19qaWZmaWVzKDUwKQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
