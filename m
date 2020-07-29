Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB043231970
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71AC6E445;
	Wed, 29 Jul 2020 06:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E0D6E445
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:21:39 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id g19so9272296ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1vqQ20bhIDIp6YZYnfUktIqnTjEfD9iacoMyvaBmV8M=;
 b=LEpF3TyucUJkQytJLfP41mH61jFW5QWRuLVoALPOyJEJ3pI5GCkb9jwwflj3uNODZ9
 KNeifT8uyV78QcuZ3AL44l6gEl+0eItImSFJ4vvcWs5LbJWlEKLnZQZHcHq7yQ20WJnB
 ML27x0DHDsIhwDNojB41ka2HeA1NUGFLnug0mhnJamTHy9qg1Yhpa25OKoS49uzchQ0h
 Ho8DdmcXrm1SzbyFR7h7KFbsWgcW8oWpAOz2+KVqizK4IFca6q7x65X7Fk5sK0vbfHaV
 HjqQ57WoLBqWG9SXBZwofDxEQxr7JdJ8+0xa5LrRtBUKx+CsSBDOULkC0+CGZzTCuhUh
 Icxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1vqQ20bhIDIp6YZYnfUktIqnTjEfD9iacoMyvaBmV8M=;
 b=fA/fIhfLBDTU8g6rIt+Z/Hs0nsnql6tS82OBhi2NyO6+zuII666ucvY4tlrfHwUEWF
 0Z7DsO9BQH5jxqiHbo+3bkbKhU/pqu5U7YrjqUabTlVeUCXdUWxECyrsR3UkTsFqBLws
 ucBAF/FHrtPu4ZKOTrAu2WBd1SmzAenwEkZ2OtEUSUKg/bKL3tYctFgkJZuLsq0iHKLP
 Oj0p+5Hczqg3Qy9aqE0YcJlJQKwusjNygWZM2v3V2azclCMQlVOEjPObHAdy4z2TQ5wG
 iKIbFIKnXOMlDarHgcSUSRXWdby6aWmWW+OIeoQ81z9qYpGt2n4Coi6zw5kKhwsDaVSS
 vlFw==
X-Gm-Message-State: AOAM533Aifmm4H0yr1SkI5aWnK5Ij5grzMJ1URX35G6kZFBtJ0CqAsrc
 La1AHG41+/O8+5msGFjGefBmvRPciIHjLqlNBH4=
X-Google-Smtp-Source: ABdhPJw+gkXlvinVLoBB+q8PKeyAgUeaWAlTVdVcRDGySYecSA0XuWD0BsM5vjNFDlIDIXEVFWHuVfREWtjg/n3lHEs=
X-Received: by 2002:a17:906:3ec7:: with SMTP id
 d7mr23758308ejj.9.1596003697950; 
 Tue, 28 Jul 2020 23:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-2-christian.koenig@amd.com>
 <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
In-Reply-To: <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 16:21:26 +1000
Message-ID: <CAPM=9tzxbuRreP36053dfKXwm0AppDKp+y55JEJ6bt=YE5WRLg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBKdWwgMjAyMCBhdCAxNjo0MywgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4KPgo+IEFtIDIzLjA3LjIwIHVtIDE3OjE3IHNjaHJpZWIg
Q2hyaXN0aWFuIEvDtm5pZzoKPiA+IEluc3RlYWQgb2YgcmVwZWF0aW5nIHRoYXQgaW4gZWFjaCBk
cml2ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgoKSSdtIG5vdCBzdXJlIHdoYXQgaGFwcGVuZWQgYnV0IHRoZSBwYXRj
aHdvcmsgY29waWVzIG9mIHRoaXMgc2VyaWVzIGFyZQptYW5nbGVkIGJhZGx5LCBJIGV4cGVjdCBB
TUQgZW1haWwgd2l0aCB0aGUgY3JhcHB5IGhlYWRlcnMgb3Igc29tZXRoaW5nCmdvdCBpbiB0aGVy
ZSBzb21ld2hlcmUuCgpDYW4gd2UgZ2V0IHRoZW0gaW4gZHJtLW1pc2MtbmV4dCBhdCBzb21lIHBv
aW50IHNvIEkgY2FuIGNsZWFubHkgbG9vayBhdCB0aGVtLgoKRGF2ZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
