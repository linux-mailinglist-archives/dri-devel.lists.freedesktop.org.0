Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE88BAE0D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2118D6E0FE;
	Mon, 23 Sep 2019 06:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5F6E0A5;
 Mon, 23 Sep 2019 00:45:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r26so29340400ioh.8;
 Sun, 22 Sep 2019 17:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqpLn56ftCZ3D2OqkmnD8h0ixYYYiXCXrh0JwWenL8g=;
 b=iJr4hTa3oSjQAS5hIedRTPavN4dodCtLcyCEkf9CEgVRGetpffVMZyHyR7t6l34MMr
 1irTr4DZ1rICdqKZKN+FxtBZbjIxmJHs1+tzzrdEzCDiZ7I/i0+UDdYyjr/wO7pkOLqD
 PLToAuHo0hx+xxdfGI9nFIXi4j8P6YPoxwoJDKlRe0W9PMS+1fcg7oDJ2YOZsaKMyEt0
 lFGI/EuHsBtaXZsMh9QeUbxaFcxPJTOfI5U4dWQ/lt4Dka9iXRx6wIWr2R3TJfMjD6vy
 tUddahnse0SYQVvCSQ1rXVGCE3v+y3kKXDGKmPXAgmyc+UhxKJOlr0MCoFS1POFiKyvD
 EPLA==
X-Gm-Message-State: APjAAAW5ueYgLSXASvIxIczb6FILVNJMD58Y+HFp06wIeRbmCpIl7Cy5
 MBpDAXQ2/zb5dfTDM06HJ8p1GbHoP9/ga9K96tQ=
X-Google-Smtp-Source: APXvYqyMIbEO0sNm1MdaPV8JwkGnFJVnNrH75QeI6zGjPiZYD5y/r31davFH2Y7jcs+UrwZ8FTBhPw2LDZOVWvLcZHk=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr16874651iod.263.1569199527197; 
 Sun, 22 Sep 2019 17:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190921100439.64402-1-kholk11@gmail.com>
 <20190921100439.64402-2-kholk11@gmail.com>
In-Reply-To: <20190921100439.64402-2-kholk11@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Sun, 22 Sep 2019 18:45:16 -0600
Message-ID: <CAOCk7NrAoZw3NDPoW-f+Od+zb6WXav7OqGqoGJR3vcV8doTSqw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT
 clocks
To: kholk11@gmail.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=cqpLn56ftCZ3D2OqkmnD8h0ixYYYiXCXrh0JwWenL8g=;
 b=ZeuGpGJpAEjBfJH1N0u9mPuHqif+b2Bn6YI+YUXHDTbISBlqC9ugWAA7U9re1L7n6R
 y5FQ9jU4LTv48aDVAbzB2EDkg+laBqcqrP+gDJ9pJv1TRzjvmmVm5fzzZf7cCLCZc3jw
 tg/1QUn7X9uDWRQ7B6M3Bk/VFQjowuFxQv8x13IwlrW0DSack9yxox+EeTuShX5tIVjH
 My5TlFBVlnocLhrlBJq4CRUkDLYnuNPw1/NF2kT4hrkwXezaguaRSRyd3jR70KtUjeGO
 ahVHOtq49iKv5pmA7f2cBdqwrKqfjv4bH1ukkpgyqSjRIGikYwuEHsE+Z2U1Utekx8Q0
 FVmA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, marijns95@gmail.com,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 freedreno <freedreno@lists.freedesktop.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjIsIDIwMTkgYXQgODoxNiBBTSA8a2hvbGsxMUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gRnJvbTogIkFuZ2VsbyBHLiBEZWwgUmVnbm8iIDxraG9sazExQGdtYWlsLmNvbT4KPgo+
IFNvbWUgU29DcywgbGlrZSBNU004OTU2Lzg5NzYgKGFuZCBBUFEgdmFyaWFudHMpLCBkbyBmZWF0
dXJlIHRoZXNlCj4gY2xvY2tzIGFuZCB3ZSBuZWVkIHRvIGVuYWJsZSB0aGVtIGluIG9yZGVyIHRv
IGdldCB0aGUgaGFyZHdhcmUgdG8KPiBwcm9wZXJseSB3b3JrLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QW5nZWxvIEcuIERlbCBSZWdubyA8a2hvbGsxMUBnbWFpbC5jb20+CgpJIGRvbid0IHNlZSB0aGVz
ZSBjbG9ja3MgZG9jdW1lbnRlZCBpbiB0aGUgbWRwNSBEVCBiaW5kaW5ncyBkb2N1bWVudC4KVGhl
eSBuZWVkIHRvIGJlIGFkZGVkIGluIHRoZSBEVCBmaXJzdC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
