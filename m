Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457509841D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408AD89A9B;
	Wed, 21 Aug 2019 19:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7389A9B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 19:13:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so3089723wrt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ApyQLdi+gYbeJe3vyoHHnQmW9ptBIH59qh3KB/xbWCc=;
 b=IVxEeSndCys+REIZcjEKkBAphQUYPlXlmux6y8yBl5fv/5EcuaIcakZj8UuoIegYIy
 MSUyjTwIji+WQe962vOg6231428sr6lCP58ODjrx4QYIIS63sznYVV9DrKHyfDq5+JpS
 IJOhPaJNQeVM94cUDCqa8XPmwECILvEDxw2mNwh/55ryIeQ9Q4yj7nHkiL+7u6FsTGXT
 1V142WwrJ5RB2ux8s1AB+WcKhn1GT9TEom+NLNltnlskUDQjZZco/L9stz71mN4E+rTN
 kc+oNBsdHfXkEsbnAyWoV+J4TPh86lU+RTnJvQF9VQkUGMqHVRykhtMNcd+J1yj+odmg
 HI9g==
X-Gm-Message-State: APjAAAXBrdVFd6FkD8p3wBM27UfoqWmsOsRnmejWAV7wdp30GvWHh4Kn
 C8tL1EmEZQs/IVR84II5sRSqnRMtBbGClz0zgSu7zg==
X-Google-Smtp-Source: APXvYqwbY47BbnoK+28egtUMifMeXnSKEc9P9m8WLL3GflsH7HXxSqf4yPhOSzZmqRrE3NihPA6fLemHAEo5wBrLZEg=
X-Received: by 2002:a5d:4b05:: with SMTP id v5mr3463137wrq.208.1566414801961; 
 Wed, 21 Aug 2019 12:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190820230626.23253-1-john.stultz@linaro.org>
 <20190821180412.GA8385@ravnborg.org>
In-Reply-To: <20190821180412.GA8385@ravnborg.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 21 Aug 2019 12:13:11 -0700
Message-ID: <CALAqxLVq0rV8DheoF9qy9O0XSQik1L3CeEEAGNh7adBJirNZJA@mail.gmail.com>
Subject: Re: [PATCH v5 00/25] drm: Kirin driver cleanups to prep for Kirin960
 support
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ApyQLdi+gYbeJe3vyoHHnQmW9ptBIH59qh3KB/xbWCc=;
 b=PQLC2I7tYSvd4myZXf2Ilp9iNr53YY66Eo0iCvmXj/DpSK/4QRW0AIe9OlDJg+p5lU
 pXgANzFjfHh8P1vmSlcTVCJgGwCxSLWSG/40iztlI1oZsD14H4iaAJQfesp+FWmdWxBE
 s9cBrKYbWVvwLek8XP9nQRkWpX1WR7/i2pCXkYBbwC2LWoPk6QQ3qXZrPxgFcycjOEQP
 NnhcLm1iy08SrqFZpWr/1fdUqKq0j8RFZXFmDXhWBWzUlOyr0tRDeKWEKvGVWzyDKKPQ
 Y4VExIwrShcvpJOETR+6wCS3Of1RGpsEPELd0UnHR22+bOAEr6WRcff0QhgUxGs7WzxC
 2QhQ==
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTE6MDQgQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToKPgo+IEhpIEpvaG4uCj4KPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAx
MTowNjowMVBNICswMDAwLCBKb2huIFN0dWx0eiB3cm90ZToKPiA+IFNlbmRpbmcgdGhpcyBvdXQg
YWdhaW4gKGFwb2xvZ2llcyEpLCB0byBhZGRyZXNzIGEgZmV3IGlzc3VlcyBTYW0KPiA+IGZvdW5k
Lgo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQgY29udGFpbnMgb25lIGZpeCAoaW4gdGhlIGZyb250LCBz
byBpdHMgZWFzaWVyIHRvCj4gPiBldmVudHVhbGx5IGJhY2twb3J0KSwgYW5kIGEgc2VyaWVzIG9m
IGNoYW5nZXMgZnJvbSBZaVBpbmcgdG8KPiA+IHJlZmFjdG9yIHRoZSBraXJpbiBkcm0gZHJpdmVy
IHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgb24gYm90aAo+ID4ga2lyaW42MjAgYmFzZWQgZGV2aWNl
cyAobGlrZSB0aGUgb3JpZ2luYWwgSGlLZXkgYm9hcmQpIGFzIHdlbGwKPiA+IGFzIGtpcmluOTYw
IGJhc2VkIGRldmljZXMgKGxpa2UgdGhlIEhpS2V5OTYwIGJvYXJkKS4KPiA+Cj4gPiBUaGUgZnVs
bCBraXJpbjk2MCBkcm0gc3VwcG9ydCBpcyBzdGlsbCBiZWluZyByZWZhY3RvcmVkLCBidXQgYXMK
PiA+IHRoaXMgYmFzZSBraXJpbiByZXdvcmsgd2FzIGdldHRpbmcgdG8gYmUgc3Vic3RhbnRpYWws
IEkgd2FudGVkCj4gPiB0byBzZW5kIG91dCB0aGUgZmlyc3QgY2h1bmssIHNvIHRoYXQgdGhlIHJl
dmlldyBidXJkZW4gd2Fzbid0Cj4gPiBvdmVyd2hlbG1pbmcuCj4gPgo+ID4gVGhlIGZ1bGwgSGlL
ZXk5NjAgcGF0Y2ggc3RhY2sgY2FuIGJlIGZvdW5kIGhlcmU6Cj4gPiAgIGh0dHBzOi8vZ2l0Lmxp
bmFyby5vcmcvcGVvcGxlL2pvaG4uc3R1bHR6L2FuZHJvaWQtZGV2LmdpdC9sb2cvP2g9ZGV2L2hp
a2V5OTYwLW1haW5saW5lLVdJUAo+Cj4gQXBwbGllZCBmcm9tIHRoZSBtYWlscyAtIGFzIHRoaXMg
aXMgd2hhdCBteSB0b29saW5nIGV4cGVjdC4KCk9oIHllcywgdGhhdCBVUkwgd2FzIGp1c3QgZm9y
IHJlZmVyZW5jZSBpZiBhbnlvbmUgd2FudGVkIHRvIHNlZSB3aGF0CmFsbCB0aGUgY2h1cm4gaGVy
ZSB3YXMgZm9yLgoKPiBQdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCkdyZWF0ISBUaGFua3Mgc28g
bXVjaCBmb3IgYWxsIHRoZSByZXZpZXcgYW5kIGZlZGJhY2shIEkgcmVhbGx5CmFwcHJlY2lhdGUg
eW91ciB0aW1lIGhlbHBpbmchCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
