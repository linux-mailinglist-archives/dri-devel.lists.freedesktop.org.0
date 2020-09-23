Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E139275E99
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 19:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B96E9DA;
	Wed, 23 Sep 2020 17:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E476E9DA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:27:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t16so586534edw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d6g3455a1ScXUcd3tlYPR8Jrde6qF+MAZeft9+wDWRA=;
 b=hu1UKjWI/j63BvQfyfhnjAt2MIGqGjhgOYGhUlIK/c5GtE/t6U0bB63jEklyVsiEVK
 QvYvmlIZ8R7ZUEW5yefPR5rCmjnDrJ3PRjQq3rGKBAhEgOiMQ2lnFxBKH+DJOEJeU5TY
 86AhQykHhXwNxla1e7leyKsS/K/+yyzpKR782c6UWn3RmAsnjglghfsKOgYT+pO7pY1u
 XSW/8h4gG6vxtRgg6xoGr0i2GyPHWzQFzkAVqBmdLJMfaxhrKUJ5FfzqyHPKXiRD5hrw
 +TFnK7HvyPmaLgDg0YIpah+LgYEwf7X5VSWvWKcEA+6IkAaIM+8rDPdfS12WT1j+biQC
 MxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d6g3455a1ScXUcd3tlYPR8Jrde6qF+MAZeft9+wDWRA=;
 b=Gyz7NIzXj4+z5ZQDqM2GJ/WOnXwQVom2a4Rh9uTzuOOkOS18+PgFTREXc+7pX1PHLr
 1DaKzsMVy6OjCdDI2IAkQlG3vyT6r7rg2xWDYNRhIDvXOH6HI3PhaGrzJXXSegCNCakj
 iLSmvvmwPh2fNcATJaai6sj9WZ99hdZwSN3UUXOvKIQyIlDQeJ2zDwujbSG8O7BsZAbp
 mEZ/EXR2ZZj9ceXkt1A3Yv4F4deeBwW1r4zjssAbUz5MRnV+SRxCWBeVS6uEA+clnzWS
 B4SBu9IBXIHB3ZklbonSd+BI8v7lwNUzo/eT1TAhsj8XZvFwOPNdMQzhChPoiQ8j5+Fj
 EZfQ==
X-Gm-Message-State: AOAM532PttUk2UNaRbw2y3ylc3kEPz9qLjBSMOuFkzNixn4Bay3oyBMn
 LhYp9IOI4EAdP08Opw1loHTbdLpthJ0Ecn25Fo3DpQ==
X-Google-Smtp-Source: ABdhPJwOTvYnWv6mTh5YpDJfYxsxrb5ts1bwRu37E6frcI1J1gT5JzJQ1OeOxJYtayHtad2amfiBfqNoPXP6jSiHTiA=
X-Received: by 2002:aa7:db47:: with SMTP id n7mr362463edt.315.1600882060116;
 Wed, 23 Sep 2020 10:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <1600774764-50332-1-git-send-email-liheng40@huawei.com>
 <CAPY8ntCnsD=LfqxSG-HrkY1ZjUPSaXbGKC=nc4Xkc7a+a7jF3w@mail.gmail.com>
In-Reply-To: <CAPY8ntCnsD=LfqxSG-HrkY1ZjUPSaXbGKC=nc4Xkc7a+a7jF3w@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 23 Sep 2020 10:27:29 -0700
Message-ID: <CADaigPWBgjRPq54_swpEmvHxPB0mY-FdzJpbeWO+1O23BV_zwg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/v3d: Remove set but not used variable
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Li Heng <liheng40@huawei.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjMsIDIwMjAgYXQgNjoxMyBBTSBEYXZlIFN0ZXZlbnNvbgo8ZGF2ZS5zdGV2
ZW5zb25AcmFzcGJlcnJ5cGkuY29tPiB3cm90ZToKPgo+IEhpCj4KPiBPbiBXZWQsIDIzIFNlcCAy
MDIwIGF0IDA4OjUzLCBMaSBIZW5nIDxsaWhlbmc0MEBodWF3ZWkuY29tPiB3cm90ZToKPiA+Cj4g
PiBUaGlzIGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nIHdpdGggIm1ha2UgVz0x
IjoKPiA+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9kcnYuYzo3MzozMjogd2FybmluZzoK
PiA+IOKAmHYzZF92M2RfcG1fb3Bz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1j
b25zdC12YXJpYWJsZT1dCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTGkgSGVuZyA8bGloZW5nNDBAaHVhd2VpLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIHwgNCAtLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2
LmMKPiA+IGluZGV4IDlmN2MyNjEuLjA1MTQwZGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdjNkL3YzZF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2
LmMKPiA+IEBAIC03MCwxMCArNzAsNiBAQCBzdGF0aWMgaW50IHYzZF9ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgfQo+ID4gICNlbmRpZgo+ID4KPiA+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IGRldl9wbV9vcHMgdjNkX3YzZF9wbV9vcHMgPSB7Cj4gPiAtICAgICAgIFNFVF9S
VU5USU1FX1BNX09QUyh2M2RfcnVudGltZV9zdXNwZW5kLCB2M2RfcnVudGltZV9yZXN1bWUsIE5V
TEwpCj4gPiAtfTsKPiA+IC0KPgo+IFRoaXMgbG9va3MgdG8gYmUgdGhlIHdyb25nIGFwcHJvYWNo
LCBhbmQgSSB0aGluayBhIHBhdGNoIGhhcyBnb3QKPiBkcm9wcGVkIHNvbWV3aGVyZS4KPgo+IE9u
IG91ciBSYXNwYmVycnkgUGkgZG93bnN0cmVhbSB2ZW5kb3IgdHJlZSB3ZSBoYXZlIGEgcGF0Y2gg
WzFdIGZyb20KPiBFcmljIHRoYXQgcmVuYW1lcyB2M2RfdjNkX3BtX29wcyB0byB2M2RfcG1fb3Bz
IChkb24ndCBuZWVkIHRoZQo+IGR1cGxpY2F0ZWQgc3VmZml4KSwgYW5kIGFkZHMgaXQgdG8gdjNk
X3BsYXRmb3JtX2RyaXZlci4gV2h5IHRoYXQgbmV2ZXIKPiBtYWRlIGl0IHRocm91Z2ggdGhlIG1h
aW5saW5lIHRyZWVzIEkgZG9uJ3Qga25vdy4KPgo+IEVyaWM6IEhvdyBnb29kJ3MgeW91ciBtZW1v
cnkgb24gdGhpcyBvbmU/CgpUaGUgUlBNIHN0dWZmIGVuZGVkIHVwIGFiYW5kb25lZCBiZWNhdXNl
IEkgZGlkbid0IGhhdmUgYW55IHN1cHBvcnQgaW4KZGVidWdnaW5nIHRoZSBwb3dlciBkb21haW4g
ZHJpdmVyIGFuZCBJIHB1bnRlZCBmb3IgYSBkb3duc3RyZWFtIGhhY2suCldlIHNob3VsZCBhdCBs
ZWFzdCBiZSB1c2luZyB0aGVzZSBvcHMsIHRob3VnaC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
