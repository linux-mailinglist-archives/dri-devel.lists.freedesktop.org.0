Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 045BDD96EE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 18:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883A6E99C;
	Wed, 16 Oct 2019 16:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B728789CA0;
 Wed, 16 Oct 2019 16:19:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id m18so3434434wmc.1;
 Wed, 16 Oct 2019 09:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ClDQ27rib9gTJsQGXTTJRHusNU/eeaE+CiY63Jy96js=;
 b=cnZOIKIUAIstb/WquuJw+N9bBctw7Ve4jNejgvrUfpAYpzKfEMGrSXf4/B5kCat8NF
 Xa4W+rzHW89rITo9gkdvxZLknHsd7awQIkaud/xAgev7nQzqNikU4LK96nB6ZAJ6l1kh
 8bkPnJTezkVe4+fRRKWhwFEx446DuZvpVw1H1SI46RQ61JQHfXizipsg0lSgSpiksW07
 7SfwLIsZalwKyI3OrivXg8vkWmO0MJHdjQRlvDaaG9pfxGajOj0AG8+to47DmhZC/pDs
 kzF8bVzJJfIewQTNuOQU4C5kmgyB4EIVa1HeUGiDAp0wljhAqFdtpv8oXNYPttcRXP8/
 DmPA==
X-Gm-Message-State: APjAAAVwZ4o/p3t2vd5dhEExuKoCWQBsNz97LMGNtApBmxbQi/fQTsab
 F0ynoLmNjuiIQyBp1TbxWQuezatfHxEW8A3bcKQ=
X-Google-Smtp-Source: APXvYqwh8+A8W2StIQF2g+j5jrtEm7yZmJlKM7cnB2ptXcCThx5FPhYGZlDdtFTcJ8UwxXhdehgQHSIszElU/Zr+g78=
X-Received: by 2002:a7b:c395:: with SMTP id s21mr4085418wmj.102.1571242770235; 
 Wed, 16 Oct 2019 09:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191016111541.20208-1-yuehaibing@huawei.com>
In-Reply-To: <20191016111541.20208-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Oct 2019 12:19:15 -0400
Message-ID: <CADnq5_MzELoYV2=Fzioy_YqxdyQg+RXQKL4CUwayGP3_RMRg3A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Make dc_link_detect_helper static
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ClDQ27rib9gTJsQGXTTJRHusNU/eeaE+CiY63Jy96js=;
 b=R8ZUM76BwybIlfHTtRwSrwoeTc0Mm9dKOaxg1WK0QsHiLZlUH+m6fN0gP9qidVD9UO
 rt4KY3Z8S7I4b4fVvyHlt2c3Y5LEhzWqyoSrjgcXq3TPRDi/GDxJWxx8D0qVAksqziO6
 LAXz+tbSR8VjMmLtGRWn0oL0rz/OXkks//cZD0Kpi9iohJ7ZRw3DkXqeqvMZWRTo1Sp9
 IPbuJHaekq415jw2F+9KtXMCBZu/GcvpEYnRGPwT2tbab7MTuSBGt4WFKfFXQCvy3RFU
 K5GcdUL+FW/vh8hltdoCQli7FCk42R7JNG0zQznhzQWbCnSXdgWUKfNakM7kQ0Y/f4JV
 PDSA==
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
Cc: Chris Park <Chris.Park@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Martin Leung <martin.leung@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, david.galiffi@amd.com,
 Jun Lei <Jun.Lei@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgODoyOSBBTSBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gRml4IHNwYXJzZSB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYzo3NDY6NjoKPiAgd2Fy
bmluZzogc3ltYm9sICdkY19saW5rX2RldGVjdF9oZWxwZXInIHdhcyBub3QgZGVjbGFyZWQuIFNo
b3VsZCBpdCBiZSBzdGF0aWM/Cj4KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1
YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWku
Y29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKPiBpbmRleCBmYjE4NjgxLi45MzUwNTM2IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+IEBA
IC03NDMsNyArNzQzLDggQEAgc3RhdGljIGJvb2wgd2FpdF9mb3JfYWx0X21vZGUoc3RydWN0IGRj
X2xpbmsgKmxpbmspCj4gICAqIFRoaXMgZG9lcyBub3QgY3JlYXRlIHJlbW90ZSBzaW5rcyBidXQg
d2lsbCB0cmlnZ2VyIERNCj4gICAqIHRvIHN0YXJ0IE1TVCBkZXRlY3Rpb24gaWYgYSBicmFuY2gg
aXMgZGV0ZWN0ZWQuCj4gICAqLwo+IC1ib29sIGRjX2xpbmtfZGV0ZWN0X2hlbHBlcihzdHJ1Y3Qg
ZGNfbGluayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikKPiArc3RhdGljIGJv
b2wgZGNfbGlua19kZXRlY3RfaGVscGVyKHN0cnVjdCBkY19saW5rICpsaW5rLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGRjX2RldGVjdF9yZWFzb24gcmVhc29uKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgZGNfc2lua19pbml0X2RhdGEgc2lua19pbml0X2RhdGEgPSB7
IDAgfTsKPiAgICAgICAgIHN0cnVjdCBkaXNwbGF5X3NpbmtfY2FwYWJpbGl0eSBzaW5rX2NhcHMg
PSB7IDAgfTsKPiAtLQo+IDIuNy40Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
