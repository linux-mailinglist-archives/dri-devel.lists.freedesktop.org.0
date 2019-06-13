Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C4D44B20
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0693989823;
	Thu, 13 Jun 2019 18:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4475F89826;
 Thu, 13 Jun 2019 18:52:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so11801217wru.10;
 Thu, 13 Jun 2019 11:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wF2lkDhjSFApoIX2SzKaCuD9I+vf8Vpj5caLDxf35+o=;
 b=mgRVnWJbNS5HHsWb35ZLD6cMFVly7MhLXemQkHyGEkOkNVkp9LVVCoRdgssD6tq2Tt
 h9lm9IdTNiwU14Uf9c9vyKkS4ABpyKVD+I0SQFo7Lt+UJCQK52wjIV1q/eRacfXURHf3
 9cDI5W1eWxRCkh2cYcl0btjoslHHc7UQ5aUP/YxL+jSBlCPnrfsCGOaO/qmQi5xahwPb
 0OB+MGHE0IoryPR7t0sooGsM68IFbX8MhDlzEQwwZj6YgH+yqDLC6RAr+Fegisum4gTa
 jATJ2gXzbQF5TkCWmExb8PlV4w7khcKBy8u7uRhARTFWp7T0k8vEUIIdzNsWUJek+2zP
 85tQ==
X-Gm-Message-State: APjAAAWKmiXFMnnODSxGsLO03AwCa/2qYOcParJiLDyc+nO705/V5a4S
 N0qf9myCK7QUxvH4gkJxGCV3a1T89Mh2y2lNDF4=
X-Google-Smtp-Source: APXvYqz65TzXVExemKM65WYyNEKOoA5AJHrWLhsVDtVW9SOWURsb3zfBCUNgnQbyfrShxmr87zPG9wDFtS2xCWSEGOk=
X-Received: by 2002:adf:f68f:: with SMTP id v15mr10763850wrp.4.1560451966892; 
 Thu, 13 Jun 2019 11:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190613023208.GA29690@hari-Inspiron-1545>
 <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
 <20190613184217.GA2385@ravnborg.org>
In-Reply-To: <20190613184217.GA2385@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jun 2019 14:52:34 -0400
Message-ID: <CADnq5_OSjJad7QGOCrWQL+LcjtCHQsCefpJ=K0mYUayFe9bUAA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix compilation error
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wF2lkDhjSFApoIX2SzKaCuD9I+vf8Vpj5caLDxf35+o=;
 b=AKeuB0I58ke460ynxyqX4+mFv2g4TegQbeImOxNCfMfyFsDied0f2UkwWeSUzabyxL
 XN4/m+xKjVR2ysnHrDJhul5Ezm6ZNBX0sNHXzUcrn8/Om/ayxXPeQKR6C8DzXSUwBOIi
 BxW28g4p2jpnLM6+DphXrs6V1LAi4d00MesmFGsBroqcJ/yT9HIfIfu9f4WwtVvhsW9p
 PaSpOCjpMWgWYBtZIR0nSJ8fRPP9cvokb2vDJqm/kHSpejndIsa+O/i9TvnawipNO9q+
 X51wWbjK5F22t0ic653gOiEOxyVVJAqbV69W0+6xOvnelXd8GxCioB9EAnuHVYp4zLjX
 d7Mg==
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
Cc: Charlene Liu <charlene.liu@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Tony Cheng <tony.cheng@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Gloria Li <geling.li@amd.com>,
 David Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMjo0MiBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgQWxleC4KPgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDEw
OjM1OjI2UE0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDEyLCAy
MDE5IGF0IDEwOjM0IFBNIEhhcmlwcmFzYWQgS2VsYW0KPiA+IDxoYXJpcHJhc2FkLmtlbGFtQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IHRoaXMgcGF0Y2ggZml4ZXMgYmVsb3cgY29tcGls
YXRpb24gZXJyb3IKPiA+ID4KPiA+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzogSW4KPiA+ID4gZnVuY3Rpb24g4oCY
ZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNl4oCZOgo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jOjIzNzg6MzoK
PiA+ID4gZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHVkZWxheeKA
mQo+ID4gPiBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ID4gICAg
dWRlbGF5KHVuZGVyZmxvd19jaGVja19kZWxheV91cyk7Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEhhcmlwcmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgo+Cj4gQW0g
SSByaWdodCBpbiBhc3N1bWluZyB5b3UgdG9vayB0aGlzIHBhdGNoPwo+Cj4gSSBleHBlY3QgdGhh
dCBuZXcgY29kZSB1c2luZyB1ZGVsYXkgd2FzIGFkZGVkIHRvIHRoZSBhbWQgdHJlZSwKPiBhbmQg
d2hlbiBtZXJnZWQgd2l0aCBkcm0tbWlzYy1uZXh0IGl0IGZhaWxlZCwgYmVjYXVzZSBkcm0tbWlz
Yy1uZXh0IG5vCj4gbG9uZ2VyIGhhZCBkcm1QLmggaW5jbHVkZWQgc28gbm8gaW1wbGljaXQgaW5j
bHVkZSBvZiBkZWxheS5oCj4KPiBUaGUgcm9vdCBjYXVzZSB3YXMgdGhhdCBteSBvcmlnaW5hbCBw
YXRjaHNldCBzaG91bGQgaGF2ZSBiZWVuIGJhc2VkCj4gb24gdGhlIGFtZCB0cmVlLCBhbmQgYXBw
bGllZCB0aGVyZSA6LSgKCk5vIHdvcnJpZXMuICBJJ3ZlIHBpY2tlZCBpdCB1cC4KCkFsZXgKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
