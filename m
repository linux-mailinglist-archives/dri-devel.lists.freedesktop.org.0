Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A57E31E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 21:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE526E790;
	Thu,  1 Aug 2019 19:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE986E78F;
 Thu,  1 Aug 2019 19:12:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so49659156wrr.4;
 Thu, 01 Aug 2019 12:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29eX/7Ti8XYPdnzI29FfnnfKBQG8Yx8Y8+IXP8UDyjQ=;
 b=YJti9lgbHV6o3UsdjyNydQLabFQywOdlMp8tgjPyo7LY7p1HPZ7VbBvbz2FsyZs6ny
 VJhmV13GZ16USJbv5EJZxAEq9lU4ljkBVkCtk1Mqbgv9V4V+O7Gkt0yuJcL/Ej9kJgqa
 QA3JbzRCXkrPpV0C/hXIvqdq39e6gFR3XGYtZAnEBVvBmv9/GwSwaCQLgm7PgR0g0JGt
 DiU+vRMWVMKQWpkCIu6ppbcm/ymm+S27xNqDpoDe0zLicowbZJlg533+kup52h4N+dp/
 YNlW6u1iH7uIlJ3f+nnwGhU60A7YMU4h8e8UwhaN+PStnjs7NKxvdgY7ANh4zIDDlG4Z
 5isQ==
X-Gm-Message-State: APjAAAWt7k0VmbIzhq0ITXqfnFdViatlGhwnE8uD3L331vxl9hbNUSHk
 p/fIIm+mft68zPdLHMyvqn7wZklH1ftvOVQreMD9HQ==
X-Google-Smtp-Source: APXvYqz1dtgJsKtH3HyoA320M+YjnfJkgSzjwkowOb7aXNJJczt8kJkwziW03I18NJKTuyBaxgF+2VNOywn1TUuBUTQ=
X-Received: by 2002:adf:a299:: with SMTP id s25mr134496190wra.74.1564686748120; 
 Thu, 01 Aug 2019 12:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190801110145.10803-1-colin.king@canonical.com>
In-Reply-To: <20190801110145.10803-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 15:12:16 -0400
Message-ID: <CADnq5_Oo8AthzgGsRCRaiNqn7skzGCGMZGdMcNo8Et+5Zt12Og@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amdgpu: fix unsigned variable instance
 compared to less than zero
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=29eX/7Ti8XYPdnzI29FfnnfKBQG8Yx8Y8+IXP8UDyjQ=;
 b=IyYiP0D64J6DV1eYBS943TYBTz8YgAE88T9bDGFQVgMS2JdnLsmgSB3nY/zz4tLmCV
 bISNAx/148/e0txOpysXy3hWzALkLZ8Gk70I2YfSlIwMW8YQVDTfHNyhDa2FjuvRRBCp
 0M+XN9hlp8rlRFUiyGrXK/llF6njsT0mqv83BLKi1RfWXq0GyOe8p3oQwonFahspM698
 E+TM5d8NI+M5voTh5UeWCNnsOS7KFbgvur8iqB8O5E0SiLAwJm/gtzPZ3hauk81Ffl05
 CdB3fVDmwon7Tu5WkEEXcBWWPhp9zKXiWvQKFjQN709TI8/U/6k7honECL8ZUxsqlcmJ
 aUHw==
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Le Ma <le.ma@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA3OjAxIEFNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gQ3VycmVubHkgdGhlIGVycm9yIGNoZWNrIG9uIHZhcmlhYmxlIGlu
c3RhbmNlIGlzIGFsd2F5cyBmYWxzZSBiZWNhdXNlCj4gaXQgaXMgYSB1aW50MzJfdCB0eXBlIGFu
ZCB0aGlzIGlzIG5ldmVyIGxlc3MgdGhhbiB6ZXJvLiBGaXggdGhpcyBieQo+IG1ha2luZyBpdCBh
biBpbnQgdHlwZS4KPgo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnNpZ25lZCBjb21wYXJlZCBh
Z2FpbnN0IDAiKQo+IEZpeGVzOiA3ZDBlNjMyOWRmZGMgKCJkcm0vYW1kZ3B1OiB1cGRhdGUgbW9y
ZSBzZG1hIGluc3RhbmNlcyBpcnEgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkFwcGxpZWQuICB0aGFua3MhCgpBbGV4
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDMgKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCj4gaW5kZXggYTMzYmQ4NjcyODdlLi45
MjI1N2YyYmYxNzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwo+
IEBAIC0xOTYyLDcgKzE5NjIsOCBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3RyYXBf
aXJxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICBzdGF0aWMgaW50IHNkbWFfdjRfMF9w
cm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKPiAgewo+IC0gICAgICAgdWlu
dDMyX3QgaW5zdGFuY2UsIGVycl9zb3VyY2U7Cj4gKyAgICAgICB1aW50MzJfdCBlcnJfc291cmNl
Owo+ICsgICAgICAgaW50IGluc3RhbmNlOwo+Cj4gICAgICAgICBpbnN0YW5jZSA9IHNkbWFfdjRf
MF9pcnFfaWRfdG9fc2VxKGVudHJ5LT5jbGllbnRfaWQpOwo+ICAgICAgICAgaWYgKGluc3RhbmNl
IDwgMCkKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
