Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85D36629F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDB06E519;
	Tue, 20 Apr 2021 23:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315966E0BE;
 Tue, 20 Apr 2021 23:54:07 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id k18so35800787oik.1;
 Tue, 20 Apr 2021 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6XeojVc4nyUM/MQvlUlo6lItw91qVr2k9CimuPL8jlQ=;
 b=Ct4dRSFyUsi54UAOvvZIvEg4fPzL45AZTUMb/sdsjtCErpl/mHQMGI5QiTZU/GyRrq
 abRyZtIlu9qx60U1Ft1bOqICI7TkI492gsrG30ZR4nVWcIUiNPIWc8gLfLvXSxh0+s+7
 CUZV1m+DyeJrjQn478NNPrfYKOIFY9K9/aDJzrMYYswwi2jErFXkq+NRnbJAOZq0tgiq
 s+iP5nxz/CvYSqrTYOsmj8mbuB4LBBYWAVWBM0T4dG21A/r0ljBAg8jbjQbBBJe7yX51
 D72F9W9HUdC21PN7s0uMs/Yuvy19IiCM31gTWKHOywbcM27eU5ZBXgPBbFvS0AWdOxRj
 CXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6XeojVc4nyUM/MQvlUlo6lItw91qVr2k9CimuPL8jlQ=;
 b=DnlKz21ZjtJt594iUQhTZRCRUjs2sxZLNRQJKkDARK6OXR8skMJTx+XSvkojCZ9AmV
 7ww4DZ8dcHrjwft0H2rUmzJ0VQv+EX8O38ZOJH9IClfhvuRy7kedaAlmb4T85SdGYYaW
 Iwovl6r7V2UZpPexpiRxAnliTinhmtY4dspePhUAOLv0AFak6SrxIe20QQQeIZ1qxeOy
 pzB41ZN5xhY6es309gqCYMuIS1qvZsoST7IqgCgYxpMrdUSSZzZkHnYStpICEOvbMAAA
 IUIh7C1WNoXEw7t1TCyEi9M6sv2pdjtWwtsrNC8jTb0l5/Eq3dzyV1i/3tejla/TxZpo
 /zQw==
X-Gm-Message-State: AOAM533lDfJJUy+Dy7M2n2J49wKO9XQhDET2DKcJwyqSH8myNS0R+blY
 KkXX824UP3gnW6VT6C1TeR+WpQHo7ebmkohQn74=
X-Google-Smtp-Source: ABdhPJxk1HdpfsnIkAez4V3KMV5UFoxztuT1Gwv0FNgu63EJQOuxbUXCCc2R2DYBsi9R8QOsf/YqzPKQuzS/Bn6QgOM=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr4689757oif.5.1618962846514; 
 Tue, 20 Apr 2021 16:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-27-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Apr 2021 19:53:55 -0400
Message-ID: <CADnq5_N71QW79-MnbeUGrMSrSM7UnESz_4vKteOr_3z1obPM3w@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/amdgpu/amdgpu_device: Remove unused
 variable 'r'
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDEwOjM4IEFN
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfZGV2aWNl
X3N1c3BlbmTigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YzozNzMzOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHLigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IGI0YWQxYzA1NWM3MDIuLmVl
ZjU0YjI2NWZmZGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4gQEAgLTM3MzAsNyArMzczMCw2IEBAIHZvaWQgYW1kZ3B1X2RldmljZV9maW5pKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgZmJjb24pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGV2KTsKPiAtICAgICAgIGludCByOwo+
Cj4gICAgICAgICBpZiAoZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPT0gRFJNX1NXSVRDSF9QT1dF
Ul9PRkYpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+IEBAIC0zNzQ1LDcgKzM3NDQsNyBA
QCBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wg
ZmJjb24pCj4KPiAgICAgICAgIGFtZGdwdV9yYXNfc3VzcGVuZChhZGV2KTsKPgo+IC0gICAgICAg
ciA9IGFtZGdwdV9kZXZpY2VfaXBfc3VzcGVuZF9waGFzZTEoYWRldik7Cj4gKyAgICAgICBhbWRn
cHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UxKGFkZXYpOwo+Cj4gICAgICAgICBpZiAoIWFkZXYt
PmluX3MwaXgpCj4gICAgICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfc3VzcGVuZChhZGV2LCBh
ZGV2LT5pbl9ydW5wbSk7Cj4gQEAgLTM3NTUsNyArMzc1NCw3IEBAIGludCBhbWRncHVfZGV2aWNl
X3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCBmYmNvbikKPgo+ICAgICAgICAg
YW1kZ3B1X2ZlbmNlX2RyaXZlcl9zdXNwZW5kKGFkZXYpOwo+Cj4gLSAgICAgICByID0gYW1kZ3B1
X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMihhZGV2KTsKPiArICAgICAgIGFtZGdwdV9kZXZpY2Vf
aXBfc3VzcGVuZF9waGFzZTIoYWRldik7Cj4gICAgICAgICAvKiBldmljdCByZW1haW5pbmcgdnJh
bSBtZW1vcnkKPiAgICAgICAgICAqIFRoaXMgc2Vjb25kIGNhbGwgdG8gZXZpY3QgdnJhbSBpcyB0
byBldmljdCB0aGUgZ2FydCBwYWdlIHRhYmxlCj4gICAgICAgICAgKiB1c2luZyB0aGUgQ1BVLgo+
IC0tCj4gMi4yNy4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
