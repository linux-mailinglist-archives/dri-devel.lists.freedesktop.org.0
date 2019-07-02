Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B334A5DE88
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3C46E0EA;
	Wed,  3 Jul 2019 07:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815CA8996F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:09:54 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id w25so38702254ioc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqaJi0HrAK4+dk3eMEGg3q9k+ySNsfHxhG2IP9d4UEs=;
 b=IG0Q1q3ngmPjvY4DdzBrup0+P5ZBTbURXXy6Gbv8CZrxnq3RLob4jUuMecZQtO/qeC
 pOinCq/gM0W2M5RjJ3YWnFkBUs1e6uVwZme5bHvZWfOPuAuLuMAPf1hilvv78fAdw0+/
 5Z3MD87PsEkWceZbIH9hqUOC0wltLgDTx7hWyOjUlCM2zXj8ARfwHIpeZHd5sMqCWIA9
 47AHgLYoJTG7X6jlDqL9GukxOdPR/1iVRNPbMrrWmhQV3Tnol8nMlTRbmBAzgr1HhDH+
 +JnkMBKJ9PVIMBTlduMvXhnPY8ngU2euIk1Cda88+f3Sqxo0gNBFSEWUjKyx96lH6XAz
 HX+Q==
X-Gm-Message-State: APjAAAVOGtFGCKmgW8vDcS38cLiNqsD8Tw48Hr6fepQ6gvkfYXbSEflf
 FIx192DGQFumslfAvOHb7hmZWv6+Qnqw7xJH+FU=
X-Google-Smtp-Source: APXvYqxnE/1cmrQUM28RI827W1EzrQ/YJ3EPJcW0btqKWfjxAt/uEzHidZYDJ5JH7Hc2zy6sNje0jpAisnfX9c2LPAE=
X-Received: by 2002:a6b:b987:: with SMTP id
 j129mr31360848iof.166.1562087393986; 
 Tue, 02 Jul 2019 10:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-4-robdclark@gmail.com>
In-Reply-To: <20190702154419.20812-4-robdclark@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 2 Jul 2019 11:09:43 -0600
Message-ID: <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fqaJi0HrAK4+dk3eMEGg3q9k+ySNsfHxhG2IP9d4UEs=;
 b=AVTZR9N4fUw9Rrth0jwcYm+mer+PVCcsHJlQbUWbkebZAGe6S0bsqdJ2WC2VpYZ7OC
 e6A3Az1SaumtPiznF/a16IrnPY1Y+9kKOSh4QtrGrp5fXq3rVJ+AIDYVnGBLMcACNBYL
 BIyrfH5EgMdhFAo3jb+hRIwPFnBChAtmB+i1wo41CtcqC+V8EFdc4lHisj+VkuZqC3AP
 MXBH0+UlYDeHOeEP67NpZTU1b0FcWVOJ5QI7P6D/jin8usF0OYNKgLTFOKKfv908OyhT
 9MIb/3xfjEAk7tPgOqr3CBPNmu3h3Y7nubuhGlDj5KJMGAJZKvn5HMfWjYwJqUv9FgKX
 CSuw==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA5OjQ2IEFNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+
Cj4KPiBOb3RpY2VkIHdoaWxlIGNvbXBhcmluZyByZWdpc3RlciBkdW1wIG9mIGhvdyBib290bG9h
ZGVyIGNvbmZpZ3VyZXMgRFNJCj4gdnMgaG93IGtlcm5lbCBjb25maWd1cmVzLiAgSXQgc2VlbXMg
dGhlIGJyaWRnZSBzdGlsbCB3b3JrcyBlaXRoZXIgd2F5LAo+IGJ1dCBmaXhpbmcgdGhpcyBjbGVh
cnMgdGhlICdDSEFfREFUQVRZUEVfRVJSJyBlcnJvciBzdGF0dXMgYml0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jCj4gaW5kZXggYTZmMjc2NDhjMDE1Li5jOGZiNDVlN2IwNmQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMKPiBAQCAtMzQyLDggKzM0Miw3IEBAIHN0
YXRpYyBpbnQgdGlfc25fYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+
ICAgICAgICAgLyogVE9ETzogc2V0dGluZyB0byA0IGxhbmVzIGFsd2F5cyBmb3Igbm93ICovCj4g
ICAgICAgICBkc2ktPmxhbmVzID0gNDsKPiAgICAgICAgIGRzaS0+Zm9ybWF0ID0gTUlQSV9EU0lf
Rk1UX1JHQjg4ODsKPiAtICAgICAgIGRzaS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklE
RU8gfCBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0UgfAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUIHwgTUlQSV9EU0lfTU9ERV9WSURFT19I
U0U7Cj4gKyAgICAgICBkc2ktPm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9NT0RFX1ZJREVPOwoKRGlk
IHlvdSBjaGVjayB0aGlzIGFnYWluc3QgdGhlIGRhdGFzaGVldD8gIFBlciBteSByZWFkaW5nLCBF
T1RfUEFDS0VUCmFuZCBWSURFT19IU0UgYXBwZWFyIHZhbGlkLiAgSSBkb24ndCBrbm93IGFib3V0
IFZJREVPX1NZTkNfUFVMU0UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
