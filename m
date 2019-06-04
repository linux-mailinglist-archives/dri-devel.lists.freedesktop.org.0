Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029D357D7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485FA895C8;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D218923C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 16:07:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h11so20293525ljb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 09:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VF44+WYtB7En5GNeSO4eswVwBmaeX+wh57RI5M6cz6Q=;
 b=sxzqYBVu0KCc882nkau6v5EyA9bdKn/yazqjajeuCCiWB6BP4wjfABndR8Sx0OZnsh
 n6leJ/E/3rafsLxulU1lCeiAVJLH5NE3liC1wvjrRVWs+UL9H3zbdE/KCxW7FvlVi+fl
 sq7pEz3+yS0pCHJ9V3EdthckCtcq8C0uQiQZsykCdadRSjAgZAaxPS/yWmaqH+ipfqN7
 Rwzz1GcfASrwFFma7oRfRDUrHlT4Hk7A7g6GPvSNqj1QEmEDDKkp9D4aq3FPzQqGOc+R
 gd2Ux9qx9Px0VxDViWu5736TRVJjnIZYvS/CPAHNNDoEQw/HMDV7Fc+L3cn3RcV0hhMq
 /C5Q==
X-Gm-Message-State: APjAAAU8z21vLZa/XUS6/GF7ycrPN9WbNpdf22UxJJtau5Qc8xyXKfLy
 T7U9iaIl5WxevDxv03XaYvjPYneu
X-Google-Smtp-Source: APXvYqwcyYVSud5I4XEFwrZTha4GIe0mgcmUTecv6gTyyubTSfmBVu9KFIFcykfctoSbMo5peq3r+w==
X-Received: by 2002:a2e:9bc5:: with SMTP id w5mr17814995ljj.87.1559664467688; 
 Tue, 04 Jun 2019 09:07:47 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
 by smtp.googlemail.com with ESMTPSA id u13sm3812882lfi.4.2019.06.04.09.07.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 09:07:46 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To: Thierry Reding <thierry.reding@gmail.com>
Newsgroups: gmane.comp.video.dri.devel,gmane.linux.ports.tegra
References: <20190604153150.22265-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
Date: Tue, 4 Jun 2019 19:07:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VF44+WYtB7En5GNeSO4eswVwBmaeX+wh57RI5M6cz6Q=;
 b=oFyRJLfRytrvPMZvCzvn5QO5LhmHtFBiaeLWsle1aw2B6kGF6xMd3QZ1LVBbl4hhkT
 9THLoZAIBA6txtQADsyeRz9W9yBg2fD40v5l8wfI0WXJhOpXjxBEIL0NpUWJIXI38y8G
 dD8TmR3OWNWUdrTk3SzmA6QES8VnpF7SSjaWqSnAe40aXyohMpdAn5Js35DXcecn2BVz
 NWsLzrYfA57kf2C/QLXBOyte42eJPbrtIAM2FWVN0WAwGXqFyj2OfaPkSkB2MQl4Lgac
 EfspCYV0Lp1hjBWoPXclHwqOGJNY90nYNu2UQcb51M+m/uv4OBiyFRInrtO0kuW6ZkNm
 KiQg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDYuMjAxOSAxODozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFdoZW4gZGVmZXJyaW5nIHByb2Jl
LCBhdm9pZCBsb2dnaW5nIGEgY29uZnVzaW5nIGVycm9yIG1lc3NhZ2UuIFdoaWxlIGF0Cj4gaXQs
IG1ha2UgdGhlIGVycm9yIG1lc3NhZ2UgbW9yZSBpbmZvcm1hdGlvbmFsLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2hvc3QxeC9kZXYuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0
MXgvZGV2LmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiBpbmRleCBjNTVlMmQ2MzQ4ODcu
LjVhM2Y3OTcyNDBkNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMKPiBAQCAtMjQ3LDggKzI0NywxMSBAQCBzdGF0
aWMgaW50IGhvc3QxeF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAg
CWhvc3QtPmNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCBOVUxMKTsKPiAgCWlmIChJU19F
UlIoaG9zdC0+Y2xrKSkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQg
Y2xvY2tcbiIpOwo+ICAJCWVyciA9IFBUUl9FUlIoaG9zdC0+Y2xrKTsKPiArCj4gKwkJaWYgKGVy
ciAhPSAtRVBST0JFX0RFRkVSKQo+ICsJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
Z2V0IGNsb2NrOiAlZFxuIiwgZXJyKTsKPiArCj4gIAkJcmV0dXJuIGVycjsKPiAgCX0KClRoZSBj
bG9jayBkcml2ZXIgc2hvdWxkIGJlIGF2YWlsYWJsZSBhdCB0aGUgdGltZSBvZiBob3N0MXgncyBw
cm9iaW5nIG9uCmFsbCBUZWdyYSdzIGJlY2F1c2UgaXQgaXMgb25lIG9mIGVzc2VudGlhbCBjb3Jl
IGRyaXZlcnMgdGhhdCBiZWNvbWUKYXZhaWxhYmxlIGVhcmx5IGR1cmluZyBib290LgoKSSBndWVz
cyB5b3UncmUgbWFraW5nIHRoaXMgY2hhbmdlIGZvciBUMTg2LCBpcyBpdCBiZWNhdXNlIHRoZSBC
UE1QCmRyaXZlcidzIHByb2JlIGdldHRpbmcgZGVmZXJyZWQ/IElmIHllcywgd29uJ3QgaXQgYmUg
cG9zc2libGUgdG8gZml4IHRoZQpkZWZlciBvZiB0aGUgY2xvY2sgZHJpdmVyIGluc3RlYWQgb2Yg
bWFraW5nIHN1Y2ggY2hhbmdlcyBpbiB0aGUgYWZmZWN0ZWQKZHJpdmVycz8KCi0tIApEbWl0cnkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
