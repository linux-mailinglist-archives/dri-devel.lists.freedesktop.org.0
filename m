Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDB18D1D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 17:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFFE89DD5;
	Thu,  9 May 2019 15:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E034A89DCF;
 Thu,  9 May 2019 15:39:22 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id s4so1716087vsl.2;
 Thu, 09 May 2019 08:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd8RkYcSwt5CH746lToN3J7dxLcl9P87HyYsL7ViWQY=;
 b=IV7qcNWDEMRcFys1895umlza8oDnEMDSGb/3Phe8OVCd0gJ+uEf4z4jIY7vKMlkEra
 PqsTCBoXe9n6L2wpRxoKeT2OQTPq6FZ72kHestorJdDPuTVMLO5/VUWPk3XU6zrse7VC
 g9Kt/9MweRDMxxd/BC8zzPRS+GfZvS6YJqle6oeTYkizBbQQPhSapn0EwfoYHX5WvNa0
 ySbkOa+fVbfsAf0GEzKTxbjhGcy9bzmtLgfHJFd6fMSBHL9w87F2VFjA+h85Sa9hyTJA
 v1Fex2GmxwhqKhvBO8yRY0V+nD6LJzV4r5pCaCT1j+hCOh/27e+VRcbqhoivg7hKByQG
 2iJQ==
X-Gm-Message-State: APjAAAXKHRLsU3vULk3+Dbhh4GZXZp1tHx/d5IYO9zvEfM2K3grh3D7q
 RZ/dwHewK9ZOgo96Km4BMIIQyBVPYOeCFV+hHY4LKg==
X-Google-Smtp-Source: APXvYqwTohibUJuLYdL5JMayoegLe/NsHqe3cEirwttrcoCdPnewPhpehYhcNpc+Ijr0lSu8NCtkxTFBC/JKsFj+/lM=
X-Received: by 2002:a67:f153:: with SMTP id t19mr2504897vsm.148.1557416361757; 
 Thu, 09 May 2019 08:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
 <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1557252127-11145-3-git-send-email-jcrouse@codeaurora.org>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Thu, 9 May 2019 08:39:10 -0700
Message-ID: <CAOeoa-d4tC9VYR_O_Nfrx=hm1Xi4JpsLEDWCibv39CGxsSFt=Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm: Print all 64 bits of the
 faulting IOMMU address
To: Jordan Crouse <jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Yd8RkYcSwt5CH746lToN3J7dxLcl9P87HyYsL7ViWQY=;
 b=FCiSzQoJkd2cwXjtOL7ovFDazzwL9mHcuR2iZx/UnXJT9pvM3vefzQ7noANymRwlC1
 Bt3c7yLSzPVoq3t7tOroTOidR0w9JyCZqqU0HtMRFRu+ziouU9DQvJZ8QzEQIXgIpNPi
 L3DwfbQdAxh+boYjL57aB2PtN0foQz5Rl1NYT/ztQLhAM8rbpWoHgxeYfiCpNnMAD9U5
 u3XxCLfTy+FRxK+mk5bk0w90ELsQ+NVf4YfIPrr1O0KuBpt5PgZmE+PYoiDS9enSpS0y
 l+dmJAjNeXWXIkODKKjFCZpmwEaUym5zHcCVzPKRLad448LW35UqYbWHjYj3I5b2/A1f
 S1DA==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCAxMTowMiBBTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKPgo+IFdoZW4gd2UgbW92ZSB0byA2NCBiaXQgYWRkcmVzc2lu
ZyBmb3IgYTV4eCBhbmQgYTZ4eCB0YXJnZXRzIHdlIHdpbGwgc3RhcnQKPiBzZWVpbmcgcGFnZWZh
dWx0cyBhdCBsYXJnZXIgYWRkcmVzc2VzIHNvIGZvcm1hdCB0aGVtIGFwcHJvcHJpYXRlbHkgaW4g
dGhlCj4gbG9nIG1lc3NhZ2UgZm9yIGVhc2llciBkZWJ1Z2dpbmcuCgpZZXMgcGxlYXNlLCB0aGlz
IGhhcyBjb25mdXNlZCBtZSBtb3JlIHRoYW4gb25jZS4KClJldmlld2VkLWJ5OiBLcmlzdGlhbiBI
LiBLcmlzdGVuc2VuIDxob2Vnc2JlcmdAZ29vZ2xlLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogSm9y
ZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPgo+ICBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9pb21tdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9pb21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUuYwo+IGluZGV4IDEy
YmI1NGMuLjE5MjYzMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9t
bXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2lvbW11LmMKPiBAQCAtMzAsNyAr
MzAsNyBAQCBzdGF0aWMgaW50IG1zbV9mYXVsdF9oYW5kbGVyKHN0cnVjdCBpb21tdV9kb21haW4g
KmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgc3RydWN0IG1zbV9pb21tdSAq
aW9tbXUgPSBhcmc7Cj4gICAgICAgICBpZiAoaW9tbXUtPmJhc2UuaGFuZGxlcikKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIGlvbW11LT5iYXNlLmhhbmRsZXIoaW9tbXUtPmJhc2UuYXJnLCBpb3Zh
LCBmbGFncyk7Cj4gLSAgICAgICBwcl93YXJuX3JhdGVsaW1pdGVkKCIqKiogZmF1bHQ6IGlvdmE9
JTA4bHgsIGZsYWdzPSVkXG4iLCBpb3ZhLCBmbGFncyk7Cj4gKyAgICAgICBwcl93YXJuX3JhdGVs
aW1pdGVkKCIqKiogZmF1bHQ6IGlvdmE9JTE2bHgsIGZsYWdzPSVkXG4iLCBpb3ZhLCBmbGFncyk7
Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBGcmVlZHJlbm8gbWFpbGluZyBs
aXN0Cj4gRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
