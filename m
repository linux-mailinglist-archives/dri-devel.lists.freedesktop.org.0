Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E07220733
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 14:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAA2894E3;
	Thu, 16 May 2019 12:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A351894E3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 12:47:25 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id r136so2382143oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gVdTtQqgDIeiOVJVsy6vocPQW87LYiXpUsnu+J8DpPA=;
 b=fvn9eyjRYlm0rA4VHoDGRiVh05N+NMVeVzS6jQuSz+Z2HbgaRBP0ZmlZ5ml1qgzCTE
 JmTu5uB3OEBvLy8fJ7MvX/ljs5g/XI1N4fQ9+00CnADOBBMqmm3MsCA4Y7xC3IW17lqx
 oI3V171WDJ7BVI5NgATNGwIBP8jSqzaCZhiduugEdZn89vWyZ+ySoUcGbYYXwj3xns4J
 A60Ur6BOz2DrH7ECdTU9262aum0Bu2whACH/RUVennf6oUj44j1hb7sHQYpL0E24F0y5
 1e2gaY7J7KoKCAAgk7b17KMKhB46VNMnjH9BV0KTzCHxAz7DVXe/nBOrejw0MNbKyCbf
 dBUQ==
X-Gm-Message-State: APjAAAV7/Txxs5Ii2VCFnnenzzO85tVynAn3IIDRZ06NLOaNmJlQGkez
 FYSuoR9ohy20ZPCluSyatBXSoDYqPVNJMTVesmmVaA==
X-Google-Smtp-Source: APXvYqwik11ZnSMF4VVSIsIrZV+zT24XKBRL0Ib9XxNA+HrEb7RBra1hZT9xWQryADP+2HRapdh8Ca+rELXhhohtuCM=
X-Received: by 2002:aca:e4c8:: with SMTP id
 b191mr10641303oih.110.1558010844526; 
 Thu, 16 May 2019 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190516080714.14980-1-david1.zhou@amd.com>
 <20190516080714.14980-7-david1.zhou@amd.com>
 <e9b4e467-775f-e3e0-b842-07e4d12cf093@amd.com>
 <212b7506-58cc-fd48-a0cf-4e6098d0d4b1@gmail.com>
 <fef207ec-90e0-5fbe-5743-56c9d5a04e6d@daenzer.net>
In-Reply-To: <fef207ec-90e0-5fbe-5743-56c9d5a04e6d@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 May 2019 14:47:12 +0200
Message-ID: <CAKMK7uEjU2vCuV0WPFKNkQw_mzojWEEax-YSXU_04o3Uf3uvmg@mail.gmail.com>
Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gVdTtQqgDIeiOVJVsy6vocPQW87LYiXpUsnu+J8DpPA=;
 b=WtYkTyJ4HeOSRV365SisiLGyM81rTkjrhQQvC515wUaxDAchJprF71VPp5Sgpkdibj
 rZVT6FgCNwBfGyFHlNYe3IoCf6Rs+Ehro5ynDqhEEGZtpA3SIdIjs5CQ0/rcTBwxhIwc
 5vAO8K4SiqVVTbyK9oZ8sMF0hsilK74hC9LbQ=
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
Cc: zhoucm1 <zhoucm1@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMjo0NiBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMTktMDUtMTYgMTI6MDkgcC5tLiwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToKPiA+IEFtIDE2LjA1LjE5IHVtIDEwOjE2IHNjaHJpZWIgemhvdWNtMToK
PiA+PiBJIHdhcyBhYmxlIHRvIHB1c2ggY2hhbmdlcyB0byBsaWJkcm0sIGJ1dCBub3cgc2VlbXMg
YWZ0ZXIgbGliZHJtIGlzCj4gPj4gbWlncmF0ZWQgdG8gZ2l0bGFiLCBJIGNhbm5vdCB5ZXQuIFdo
YXQgc3RlcCBkbyBJIG5lZWQgdG8gZ2V0IGJhY2sgbXkKPiA+PiBwZXJtaXNzaW9uPyBJIGFscmVh
ZHkgY2FuIGxvZ2luIGludG8gZ2l0bGFiIHdpdGggb2xkIGZyZWVkZXNrdG9wIGFjY291bnQuCj4g
Pj4KPiA+PiBAQ2hyaXN0aWFuLCBDYW4geW91IGhlbHAgc3VibWl0IHRoaXMgcGF0Y2ggc2V0IHRv
IGxpYmRybSBmaXJzdD8KPiA+Cj4gPiBEb25lLgo+Cj4gVGhpcyBicm9rZSBhbWRncHUtc3ltYm9s
LWNoZWNrOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RybS9waXBlbGlu
ZXMvMzcxNzcKPgo+Cj4gSSBwdXNoZWQgdGhlIHRyaXZpYWwgZml4LiBQbGVhc2UgY29uc2lkZXIg
dXNpbmcgR2l0TGFiIE1Scywgc28gdGhhdCB0aGUKPiBDSSBwaXBlbGluZSBjYW4gY2F0Y2ggaXNz
dWVzIGxpa2UgdGhpcyBiZWZvcmUgdGhleSBjYW4gYnJlYWsgdGhlIG1hc3Rlcgo+IGJyYW5jaC4K
ClNob3VsZCB3ZSBzd2l0Y2ggZG9jcyB0byByZWNvbW1lbmQgTVI/IE1ha2UgaXQgdGhlIGRlZmF1
bHQ/IEkgZ3Vlc3MKbWVzYSBoYXNuJ3QgbWFkZSB0aGVtIG1hbmRhdG9yeSB5ZXQsIHNvIGRvaW5n
IHRoYXQgZm9yIGxpYmRybSBpcyBhIGJpdApqdW1waW5nIGFocmVhZCAuLi4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
