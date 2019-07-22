Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00370A54
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F889DE3;
	Mon, 22 Jul 2019 20:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013D89DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:06:27 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id l124so16245038ywd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HwvJiB020PdHZrr6dRx+YAOsgzbnAkiZvqKqCv91HY0=;
 b=R0Rncm02BaTZ4F2FzVbl4cmIKc/8vwGyA1MP6Q8AnW61gFpWL9N0RW10tr8EnX3Xv5
 f/FDphuctzys7q9dZWtFfeXUt6xy47nvQ/lBB0D6YoHugHFyWTzi4JhOiP+gsRKtIQVh
 2BubxKRAEWb4AeiX8zfaMMPh0cP8PImmAAv+NEeHE67w2vuJSdcuZGqG43YXLjLl/qwP
 urDCRAQv01md7MpPbwEvDrXgoXfNapv9ceEZ5WliwnicW5nW89PuXAIkUv9LvR3sungh
 Hx5/BS8Yd9stJRCiWlZMq7QGPi09TEd6iQKdmD0dMpFZ4XO7gFPRpn4BGz70HlPp/GKC
 Lf9w==
X-Gm-Message-State: APjAAAWJkubFxgog67LXyt8dmN9Ig/7EmPUQmubmWXFG7y0a48V2cT8t
 YfWsANy/UY4NEiN01L85qNZcoA==
X-Google-Smtp-Source: APXvYqzI5OqP4T4u5XK4DV6I74KUqwu9SCJCcgyXgPpUcws2Jxp6KM4gJRYUdFkGTCujjYBQpMHQPQ==
X-Received: by 2002:a81:aa50:: with SMTP id z16mr41029409ywk.278.1563825986781; 
 Mon, 22 Jul 2019 13:06:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 131sm9412431ywq.21.2019.07.22.13.06.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:06:26 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:06:25 -0400
From: Sean Paul <sean@poorly.run>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] drm: silence variable 'conn' set but not used
Message-ID: <20190722200625.GJ104440@art_vandelay>
References: <1563822886-13570-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563822886-13570-1-git-send-email-cai@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HwvJiB020PdHZrr6dRx+YAOsgzbnAkiZvqKqCv91HY0=;
 b=JtIYbjWtQYouQdTV52R6hWVjmr3h57dT7O21FB17MAyvKSdf74C8ZQ/+UWuVXvOJPp
 aKOjxaacmyjkLvWwvM4/prsMKdiimEZ9YgK3Fcv2V7GMLb/sIaU6zTApATxI39pVHQWV
 lyNwl6s5dbvE73l0D+VnMm2cQWYc8y1prkn79WgdqihoOcXQaiZ9L44hPGAqOvspPIYf
 sVsWG16yFJULB+qnmzLAjFYcKLfidEqT5RbRJW4cYbtVj0sIOkBygQRSny/9K7KoROeD
 SKOl/vT9+KCDofXbNh/M8kkSINAXNf3Fsw0LqEzLhh1zlzGwFA8KzmNo/2ySLN3D/puE
 fTnA==
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
Cc: maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDM6MTQ6NDZQTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gVGhlICJzdHJ1Y3QgZHJtX2Nvbm5lY3RvciIgaXRlcmF0aW9uIGN1cnNvciBmcm9tCj4gImZv
cl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUiIGlzIG5ldmVyIHVzZWQgaW4gYXRvbWljX3Jl
bW92ZV9mYigpCj4gd2hpY2ggZ2VuZXJhdGVzIGEgY29tcGlsYXRpb24gd2FybmluZywKPiAKPiBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmM6IEluIGZ1bmN0aW9uICdhdG9taWNfcmVt
b3ZlX2ZiJzoKPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmM6ODM4OjI0OiB3YXJu
aW5nOiB2YXJpYWJsZSAnY29ubicgc2V0Cj4gYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+IAo+IFNpbGVuY2UgaXQgYnkgbWFya2luZyAiY29ubiIgX19tYXliZV91bnVz
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUWlhbiBDYWkgPGNhaUBsY2EucHc+CgpUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghIEkndmUgYXBwbGllZCBpdCB0byBkcm0tbWlzYy1maXhlcwoKU2VhbgoKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
cmFtZWJ1ZmZlci5jCj4gaW5kZXggMGI3MjQ2OGU4MTMxLi41NzU2NDMxOGNlZWEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCj4gQEAgLTgzNSw3ICs4MzUsNyBAQCBzdGF0aWMgaW50
IGF0b21pY19yZW1vdmVfZmIoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCj4gIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gZmItPmRldjsKPiAgCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZTsKPiAgCXN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lOwo+IC0Jc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm47Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiBfX21heWJlX3VudXNlZDsK
PiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlOwo+ICAJaW50IGksIHJl
dDsKPiAgCXVuc2lnbmVkIHBsYW5lX21hc2s7Cj4gLS0gCj4gMS44LjMuMQo+IAoKLS0gClNlYW4g
UGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
