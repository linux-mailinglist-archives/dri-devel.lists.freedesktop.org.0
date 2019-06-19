Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB34B147
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 07:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330F6E28F;
	Wed, 19 Jun 2019 05:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CB06E299;
 Wed, 19 Jun 2019 05:20:29 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id j2so8523246uaq.5;
 Tue, 18 Jun 2019 22:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0PXc5nauUb4o3lsnx5Ny3+HWZRzLpYvPScpFb82/ck=;
 b=JAbHTe1eLAMQR3i6j1Mb5Xojd/DgK9fO4oZomteDcZCM6clBjOoo9hTiRj51SjnNHf
 cDZ4M97Q4ZvZDnBWHDd5Au6GeX46hMvz1SUhLQeKTCj8wYTlhXD/BkwV4S1NWZGzzK4a
 P4BZRwxBWM43/KCankSr4h4nQVWt/iqjabGiNKDw+Zmr2kf+RzAFXBliYp2oJaGrdU4s
 /BWQZJYTnPRU6L7EGt45VnwwYekUo2YWNbJMHR4BNC3Ujp+jQkZUI1jS1Y8kMUYyY1ZS
 SQ7gNjCcOOBoLzXTYGaLCPPU/MuAqaYhO2JE6GLSL7Jpm2itrFsa6Jr+TGeUflgmilfb
 DeKg==
X-Gm-Message-State: APjAAAUkiFNxcnPoHpXaZOQtOKbOo6PJ0haf6KAxHPT94CtX1hK44TO3
 3MxD68NSUPHxi5Ju8vA57SqGx/ZwuFsqDJrzLho=
X-Google-Smtp-Source: APXvYqwRf/92/Ddb/2Bf0CEDUV+3cymdzw6KRPCQW0cUpqPq5iMiVwt1kNX1Y0ekGtWsdMUxoCjbkmMVKH8avR8MfbI=
X-Received: by 2002:a9f:31a2:: with SMTP id v31mr13080252uad.15.1560921628950; 
 Tue, 18 Jun 2019 22:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
In-Reply-To: <20190619050811.GA15221@jagdpanzerIV>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 19 Jun 2019 01:20:17 -0400
Message-ID: <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTowOCBBTSBTZXJnZXkgU2Vub3poYXRza3kKPHNlcmdl
eS5zZW5vemhhdHNreS53b3JrQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAoMDYvMTQvMTkgMTE6
NTApLCBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gPiBkbWVzZwo+ID4KPiA+ICBub3V2ZWF1
IDAwMDA6MDE6MDAuMDogRFJNOiBHUFUgbG9ja3VwIC0gc3dpdGNoaW5nIHRvIHNvZnR3YXJlIGZi
Y29uCj4gPiAgbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IFNDSEVEX0VSUk9SIDBhIFtDVFhT
V19USU1FT1VUXQo+ID4gIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmaWZvOiBydW5saXN0IDA6IHNj
aGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogY2hh
bm5lbCA1OiBraWxsZWQKPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzogZW5naW5lIDY6
IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZmlmbzog
ZW5naW5lIDA6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKPiA+ICBub3V2ZWF1IDAwMDA6MDE6MDAu
MDogZmlyZWZveFs0NzZdOiBjaGFubmVsIDUga2lsbGVkIQo+ID4gIG5vdXZlYXUgMDAwMDowMTow
MC4wOiBmaXJlZm94WzQ3Nl06IGZhaWxlZCB0byBpZGxlIGNoYW5uZWwgNSBbZmlyZWZveFs0NzZd
XQo+ID4KPiA+IEl0IGxvY2t1cHMgc2V2ZXJhbCB0aW1lcyBhIGRheS4gVHdpY2UgaW4ganVzdCBv
bmUgaG91ciB0b2RheS4KPiA+IENhbiB3ZSBmaXggdGhpcz8KPgo+IFVudXNhYmxlCgpBcmUgeW91
IHVzaW5nIGEgR1RYIDY2MCBieSBhbnkgY2hhbmNlPyBZb3UndmUgcHJvdmlkZWQgcmF0aGVyIG1p
bmltYWwKc3lzdGVtIGluZm8uCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
