Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8B1135CA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 20:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38F26EA32;
	Wed,  4 Dec 2019 19:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA36EA32;
 Wed,  4 Dec 2019 19:36:17 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v140so398388oie.0;
 Wed, 04 Dec 2019 11:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4l/JtwjXT1qBF416IXv0Ieqm2uxNXQ8tl4ay1L+NPDw=;
 b=mn5Pvt6SqB3Bt4I4i/Ut8n1FGmtQSjaJClvhSvW+SD7ZQMc+jc2B643m4GfMVPgCzm
 FUyeu5zfnw3oQq79OAKkfemQMiGP8qRBTzZiDFPd45vSh5E6XMTKGBgJtD4fzjxuiIIk
 jYaobEMTtC5Ri6lD/ZyN9kL5+gKlLPXnfT849fd0DlXaBeanuI5ITyoW2r0jnYCUtrOM
 yJ6Ge84+rC7ticDTiEhXtBR/sbPP63WRaE15YTbwW520941P68QN8kupgDJkBOFQl14r
 BbuukYkGsnhh6XXuDk/P2/Su3DLSdlT6N19NOn7rAQGabRtbvnaLkO9HEsvnh3Z2DiSz
 vsag==
X-Gm-Message-State: APjAAAXTgxBkUPH7dclalLF8i/EqRxTwDQPn5UTj2/m7b5w6dEP79CqM
 AVXd+NWEcQReMUZnMeWh0oz07Q8=
X-Google-Smtp-Source: APXvYqwbYbRZksHTtKqsDfJTwU2S/KsK6vdSez9yw9Sp1yFW45VcbvaETJUBHHTwFZidWzmuVFrCmg==
X-Received: by 2002:a05:6808:b26:: with SMTP id
 t6mr3792135oij.123.1575488176840; 
 Wed, 04 Dec 2019 11:36:16 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m68sm2634826oig.50.2019.12.04.11.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 11:36:16 -0800 (PST)
Date: Wed, 4 Dec 2019 13:36:15 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second
 interconnect
Message-ID: <20191204193615.GA20880@bogus>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBOb3YgMjAxOSAyMDoyNjo0MiAtMDUwMCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+
IFNvbWUgQTN4eCBhbmQgYWxsIEE0eHggQWRyZW5vIEdQVXMgZG8gbm90IGhhdmUgR01FTSBpbnNp
ZGUgdGhlIEdQVSBjb3JlCj4gYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0p
IGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuCj4gVGhlcmUncyBhIHNlcGFyYXRlIGludGVyY29u
bmVjdCBwYXRoIHRoYXQgbmVlZHMgdG8gYmUgc2V0dXAgdG8gT0NNRU0uCj4gTGV0J3MgZG9jdW1l
bnQgdGhpcyBzZWNvbmQgaW50ZXJjb25uZWN0IHBhdGggdGhhdCdzIGF2YWlsYWJsZS4gU2luY2UK
PiB0aGVyZSdzIG5vdyB0d28gYXZhaWxhYmxlIGludGVyY29ubmVjdHMsIGxldCdzIGFkZCB0aGUK
PiBpbnRlcmNvbm5lY3QtbmFtZXMgcHJvcGVydHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9ncHUudHh0IHwgNiArKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
