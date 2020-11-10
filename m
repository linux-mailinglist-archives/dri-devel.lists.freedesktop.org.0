Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD32AE43B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5DB89D4A;
	Tue, 10 Nov 2020 23:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102B789D4A;
 Tue, 10 Nov 2020 23:41:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j7so373620wrp.3;
 Tue, 10 Nov 2020 15:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pdkh/TeTcrXxzoVGpfeQkjHXwIVJvI6CvhggFLBmmww=;
 b=XAz6xZx6IiaLP6fwtSsrDqcYRMbP48Rf5PQyV4pDB87jtLT8PyQ0dNfW36QUykMTw1
 3Fzac6jcVjJsS60Y8JRs8m/FKepN1dAo+5QAkVqdV47CDE4Z7/GK0I71vsLIX+z6h5ef
 dXqiiDpPjc8SbFSMA0dY0ndYODjGmD5MtRatYWW9LfAPsmKAZhldRYuMvqHfm6Js8OJX
 J5XIvEQftHc90oPzAuXAGpt9zsocCThBYGpR72zKLFg6CQaTlhPYevjQXlj/nwSCKfGG
 670VGz+jqFg3qu0reYpcwFkaBa2uv6lLW+sgSsllZ/3gPb4tQAIjX5HNfy4IefYukKu8
 1jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pdkh/TeTcrXxzoVGpfeQkjHXwIVJvI6CvhggFLBmmww=;
 b=U2am5uQg0MhuBYiRx2b/wFKr2FLyBhihzcyC7PKyG1JVbLLZ1Ux0UiiLgEyX41LetT
 7mvIugLoMiS8MtsWD6ZcIBpQq+b9jljyev45O6qBb/1vhvBz78LzbOsZ7vJ8+q56GPRP
 GEPAoAs2a9z0nv6z+i2o1JUss6AWVCaeOMujfi+3zZVBg6r3eQmaOEZCoNfuSGP6K5Vk
 0tlnHGy8Qv41M+XvHNJ+Nykqb4H3MuzxfDjnijhkUDV4oEv177w3ZkWHPxk3UaUzPfi1
 VWRLxqn6gl0FYz357qaOLMB0sa80JCcMKoCwuq3Ey33WAdMP2fyYkCmg9mmn4m0D+JyR
 N9dQ==
X-Gm-Message-State: AOAM5300G4mhZQGArT73OHMzzKEWrImhSkbTu5vl70HPaLGFQZGledKq
 zAl6kg6rTMQR4SSCsqph0+IOz7YklzaNjgWjbn8=
X-Google-Smtp-Source: ABdhPJzeu5w+TynfkV7VT4+0sa/ezxBAw1TViZtEDSSQSGysBaGHrLIZy5hejH8ygZn40cmW5xEziElua9cukTJC9+k=
X-Received: by 2002:adf:e350:: with SMTP id n16mr27364477wrj.419.1605051684728; 
 Tue, 10 Nov 2020 15:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-12-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-12-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:41:13 -0500
Message-ID: <CADnq5_PcMUpn6zupcGjaWt53aF97QpgM9gqzv=NEacGVH7cOKA@mail.gmail.com>
Subject: Re: [PATCH 11/30] drm/radeon/radeon_ib: Supply description for
 'radeon_ib_get's get param
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2liLmM6NjE6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZtJyBub3QgZGVzY3JpYmVkIGlu
ICdyYWRlb25faWJfZ2V0Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pYi5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9p
Yi5jCj4gaW5kZXggOWZkNTVlOWM2MTZiMC4uYzFmY2EyYmE0NDNjOSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25faWIuYwo+IEBAIC00OCw2ICs0OCw3IEBAIHN0YXRpYyBpbnQgcmFkZW9u
X2RlYnVnZnNfc2FfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gICAqCj4gICAq
IEByZGV2OiByYWRlb25fZGV2aWNlIHBvaW50ZXIKPiAgICogQHJpbmc6IHJpbmcgaW5kZXggdGhl
IElCIGlzIGFzc29jaWF0ZWQgd2l0aAo+ICsgKiBAdm06IHJlcXVlc3RlZCB2bQo+ICAgKiBAaWI6
IElCIG9iamVjdCByZXR1cm5lZAo+ICAgKiBAc2l6ZTogcmVxdWVzdGVkIElCIHNpemUKPiAgICoK
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
