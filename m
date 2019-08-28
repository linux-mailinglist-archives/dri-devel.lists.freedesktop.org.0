Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668FC9FD14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E3089232;
	Wed, 28 Aug 2019 08:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BDE89C25
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 07:18:56 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e20so3865389iob.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 00:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LBTmr+u/ll+ec1sXUYsm3kWarWnOtf47U/5VvRHfk0=;
 b=Nv8Ui0ypWdfpl6kpeq9Bz79ZculJljRrO81AgJzHTrl9OG8jsCRvejetdzqr+5guMt
 49aOQWr3OsFUd75g3tkd1w4+I8AKdcfrcPkO8vjWCz1SuxeWaR6v+v00Pm77R7KsJmPA
 iIpc7AvpJWkLYVCiFPOXNPZaRiApemHOEluKbb9plvOET45JJ27LsT79aiYnu8JmA8C7
 A/h2rftFgFEyWPBFaO/KZXYFPb8OgU/+rmHPlvHDaLeFyeaNbW7KKRtciAkFEBp08KeU
 1wROS32PZ1oYAsq9CoWDVGAfo8vonMcd1d5mA9aTJBh//xcT1+szPTGfBr7LMuUM5TCV
 0dzw==
X-Gm-Message-State: APjAAAXcu57pf8+RmurpcGM5vVqOBsW0fZEEBxuBAJj5BZ47+Dfs4bMV
 FvjV+R87A8kVUaOMfKiB2i6Zf8NJXKTczp4z3Tl8lrfbEok=
X-Google-Smtp-Source: APXvYqxA2ZHjkm6bFll8L6S4oXwEng6zqnJkJSqB0zfTBDBET3xsdisBSj5iJaI2tBO9qwReNTBAjoGICoeMx1bPpqk=
X-Received: by 2002:a5d:8e15:: with SMTP id e21mr2845840iod.296.1566976735508; 
 Wed, 28 Aug 2019 00:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-6-darekm@google.com>
 <1e7fdf30-3723-857a-68fd-139f396856b7@xs4all.nl>
In-Reply-To: <1e7fdf30-3723-857a-68fd-139f396856b7@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Wed, 28 Aug 2019 09:18:43 +0200
Message-ID: <CALFZZQFN4M_3vjigmwLbCvP+060hyR5ogx-e2W+=R1NafHcapQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] drm: tda998x: use cec_notifier_conn_(un)register
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/LBTmr+u/ll+ec1sXUYsm3kWarWnOtf47U/5VvRHfk0=;
 b=QURAhAVVbDqA9BitIpPd7bqLRan4epUlRU5WKqfWOn/AtJSvjkCeRukPuQMaiP1aGZ
 3JcrFtcOmz2LTEycDRL0+gH26Po7febdO3ME8tTmZ3A1nL5p3j6YaEOFlUS3OZE1RMoY
 mT3vnuOco1iAkQoU5XebIE4ly6MU/QIihJrMacQEBDjzXUOR4UMe7avA9pk0ZQ7RJUt4
 COx7H47+Ta9dfMLKrro/tlBTOt5stwrmyTraOlKdbsdO7nX0yblpzKemPZ4bvKG1iHCB
 Y3JuprullAkMBzq+QCIP2jGD4m0UkAP7xM/Kd05kdG/JBm4ut0kGYpa3rsxBfnMC//sr
 PoCw==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMzoxMiBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNp
c2NvQHhzNGFsbC5ubD4gd3JvdGU6Cj4KPiBZb3UgZHJvcHBlZCBhICdpZiAoIW5vdGlmaWVyKScg
YmVmb3JlIHRoZSByZXR1cm4hCj4KPiBBZnRlciBhZGRpbmcgYmFjayB0aGlzICdpZicgaXQgd29y
a2VkIGZpbmUgb24gbXkgQmVhZ2xlQm9uZSBCbGFjayBib2FyZCwKPiBzbyBhZnRlciBmaXhpbmcg
dGhpcyB5b3UgY2FuIGFkZCBteToKPgo+IFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3Vp
bC1jaXNjb0B4czRhbGwubmw+Cj4KU3VibWl0dGVkIHY3LjIuIFRoYW5rIHlvdSBmb3IgdGVzdGlu
ZyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
