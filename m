Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999EA0FDA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 05:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9105D89F08;
	Thu, 29 Aug 2019 03:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7308922E;
 Thu, 29 Aug 2019 03:13:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id k2so644741wmj.4;
 Wed, 28 Aug 2019 20:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zezlNocF3MTF6BR+07qgHXs9JkH6PuU5IAluxDhYuf0=;
 b=Lzl9/J7VdWAWPF3g6ewCHi5h++wvmoTdoa4rGiPFPq+AFWIGspWQ1pofQiLas2J3vN
 QRG57Fc47AfdUVKQrE/+G2QAhqotAmbO8d3rfSujN7jNYESd5/ReJqecntuRnPcHiBgg
 lB4u7c9dBbuH5kiUc4RvREEPdYPUNVWGa7N4TNEbNWAiJdi3RG5PPCxyiuiSzIWX5sFD
 J5J9QAjgFBOxlcgswLIaVblKtqhLtUyEX4mZdCSHefdkyMbN4BD1SotiMizxY28gQE9I
 ym7WzvnmUAk62tlyrRdtWYK+Dqa2v0RydVif/LHayUajwue6gKsm5iu2kDAnz4KkP+dd
 VN8A==
X-Gm-Message-State: APjAAAX2ZH21lFe0bcWbnUoA7Eo+EfM7NFy1qhItHGwJZHYN+hPUiIa1
 hm/vy6XpmEl4EPcWxcd4P5xdl0vQM44C5aY1sJc=
X-Google-Smtp-Source: APXvYqy1Wk4FCFLjZuvmFsT8usAlkbYWe3LC2XmffZ9uj5OxcZ059EYoAXO1ngbUz2qX1LH6CpuYTtOdR4mGQzVV0Ko=
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr8316756wmd.141.1567048403406; 
 Wed, 28 Aug 2019 20:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190829005156.26354-1-colin.king@canonical.com>
In-Reply-To: <20190829005156.26354-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2019 23:13:11 -0400
Message-ID: <CADnq5_MrZuX4AXTv=w+7U4=Nw_6ugzErHBxXY3hhvY4-3jxGvQ@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amdgpu: fix spelling mistake "jumpimng" ->
 "jumping"
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zezlNocF3MTF6BR+07qgHXs9JkH6PuU5IAluxDhYuf0=;
 b=gP8dYidy6sTxKhqbX6Hag7AsPbUqaqbdPyR8nBQ+dJK7hwcey8ONy8Lk/O9Fwn9VmO
 NAnVvt+itRbHfo+G5AYGxhWLXvvzydIuxHFH6gH2xfSilIc4jg/78NjqzP5tV8OenADc
 pcMxxt0oUxwwxeguxQBCbHvqnmoxwd0IHuM8v1lyn2YHoEaJADJwOSxw1K+N+7SuHJhR
 IHMD5qf/Vq1NGRQ6M0F69iDpzFRo/B9RvT8edUJHiN4Jl/4pGovfJDy2zbGWxvEDF5Zp
 xzhe4BK8IfifWBadWvz25GKKShj1k6hZsxS7q+T98BTIwsViVCSP8u6cUwX4JYpNWo3E
 Vj3g==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDg6NTIgUE0g
Q29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBUaGVyZSBpcyBhIHNw
ZWxsaW5nIG1pc3Rha2UgaW4gYSBEUk1fREVCVUdfRFJJVkVSIGRlYnVnIG1lc3NhZ2UuCj4gRml4
IGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19l
ZXByb20uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhc19lZXByb20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVw
cm9tLmMKPiBpbmRleCA4NjExMGU2MDk1Y2MuLjhhMzJiNWM5Mzc3OCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwo+IEBAIC0yNTcsNyAr
MjU3LDcgQEAgc3RhdGljIHVpbnQzMl90IF9fY29ycmVjdF9lZXByb21fZGVzdF9hZGRyZXNzKHVp
bnQzMl90IGN1cnJfYWRkcmVzcykKPiAgICAgICAgICAqIGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNv
dXJjZS9lbi9kYXRhc2hlZXQvbTI0bTAyLWRyLnBkZiBzZWMuIDUuMS4yCj4gICAgICAgICAgKi8K
PiAgICAgICAgIGlmICgoY3Vycl9hZGRyZXNzICYgRUVQUk9NX0FERFJfTVNCX01BU0spICE9IChu
ZXh0X2FkZHJlc3MgJiBFRVBST01fQUREUl9NU0JfTUFTSykpIHsKPiAtICAgICAgICAgICAgICAg
RFJNX0RFQlVHX0RSSVZFUigiUmVhY2hlZCBlbmQgb2YgRUVQUk9NIG1lbW9yeSBwYWdlLCBqdW1w
aW1uZyB0byBuZXh0OiAlbHgiLAo+ICsgICAgICAgICAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJS
ZWFjaGVkIGVuZCBvZiBFRVBST00gbWVtb3J5IHBhZ2UsIGp1bXBpbmcgdG8gbmV4dDogJWx4IiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChuZXh0X2FkZHJlc3MgJiBFRVBST01f
QUREUl9NU0JfTUFTSykpOwo+Cj4gICAgICAgICAgICAgICAgIHJldHVybiAgKG5leHRfYWRkcmVz
cyAmIEVFUFJPTV9BRERSX01TQl9NQVNLKTsKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
