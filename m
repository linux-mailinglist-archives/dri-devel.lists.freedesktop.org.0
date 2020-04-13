Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289E1A687B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAA789DA3;
	Mon, 13 Apr 2020 15:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CE89DA3;
 Mon, 13 Apr 2020 15:08:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k1so3263203wrx.4;
 Mon, 13 Apr 2020 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lmXdNG7xBS4HYOxfe0aKo5VaQiBEjto7UlYRcKbMIBk=;
 b=NJiZYCUSLiuhyUkWZ/51MM7ZoS/pr/Rjd/1JM/5+yC6o1ffI+oyOkWnnL0lCNS+IYY
 nzovxt4dozYeB9UX6GZ5Gt91FQv3FrOLt+8JCpHubkXFcOJZsIVqi0IBYf4m65B8vJef
 Sml9ddEQ7CBt2kOyMwuWspVjKzDftw5jAe4B01txMaU834r1cNQquq5MLrexj9PKuy+8
 sN0vn6p6VieBkBAbioOn6DHP4GbqmUq6q5dThpw9wENcCCHc2e16KEU4NITIcyAwUcAh
 Tsjr6j/zJpNcuMlncfgTyPZwBCDMYkSFaxVMiZMj1FrcMUBl3O7ke0g64DURYjaWUZiA
 dNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lmXdNG7xBS4HYOxfe0aKo5VaQiBEjto7UlYRcKbMIBk=;
 b=r0h3ZBD96WAitD+QRMZeduop4woQIq7lYsZ9XnI9su/cuuNc0aMFzDodhKvTJC0Ao3
 gDAsovYo1BQ8igTWrc5DUyqDnrLR5vj3T4+8WEhYjkwDZL5kux+UCjErUAoDU5Nudg7m
 0D+g3FYmW9aTSUcMmxDnrXByCRapdg1nQGHEh9oHnOrf+JCLDGyhATdWx/+TfRfxdCgz
 xYC/HfSCygTaTdR67Yk+atQQI+Fgr6MItRpt7Ih27CPjpeilpnU1AZIyHM9fj76wK84l
 4B1nmlA7QFy5JAQBYNga4rSjZK0kww7Zk+kyl/J9D7j58BMrAK73iBBPyLkuCCrjBfsH
 vsdg==
X-Gm-Message-State: AGi0PuZeTgNUl9syCEzAelmqraA/dUSObg6R5uOdDQdBYSQEYA1ew92E
 3wZ1X97h9TnuGBWBOhz8UGDB36bnAnySYE6+AOAwYA==
X-Google-Smtp-Source: APiQypKWKFV+YEIjqwbr/X00Qq4OT5SRvkZuOT0CS3Tzf7C520HWjeFaeOiqOB44PBaFnwKSzs96FrHRsavN2XY4UDg=
X-Received: by 2002:adf:fe45:: with SMTP id m5mr10952707wrs.124.1586790529368; 
 Mon, 13 Apr 2020 08:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200413082249.23271-1-yanaijie@huawei.com>
In-Reply-To: <20200413082249.23271-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:08:38 -0400
Message-ID: <CADnq5_MkfeC+0pVqOOBfHMp3hA3-wHJN2fNcg0s10XAcFM+DTA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: code clean up in dce80_hw_sequencer.c
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 "Cheng, Tony" <Tony.Cheng@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMTMsIDIwMjAgYXQgNToyOSBBTSBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdl
aS5jb20+IHdyb3RlOgo+Cj4gRml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cj4KPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX2h3X3NlcXVl
bmNlci5jOjQzOjQ2Ogo+IHdhcm5pbmc6IOKAmHJlZ19vZmZzZXRz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGNlODBfaHdfc2VxX3JlZ19vZmZzZXRzIHJlZ19vZmZzZXRzW10gPSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4KPiBSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFz
b24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4g
LS0tCj4gIC4uLi9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9od19zZXF1ZW5jZXIuYyB8IDI4
IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4
MF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9k
Y2U4MF9od19zZXF1ZW5jZXIuYwo+IGluZGV4IDg5MzI2MWM4MTg1NC4uZDJjZWViZGJkZjUxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9o
d19zZXF1ZW5jZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4
MC9kY2U4MF9od19zZXF1ZW5jZXIuYwo+IEBAIC0zNiwzNCArMzYsNiBAQAo+ICAjaW5jbHVkZSAi
ZGNlL2RjZV84XzBfZC5oIgo+ICAjaW5jbHVkZSAiZGNlL2RjZV84XzBfc2hfbWFzay5oIgo+Cj4g
LXN0cnVjdCBkY2U4MF9od19zZXFfcmVnX29mZnNldHMgewo+IC0gICAgICAgdWludDMyX3QgY3J0
YzsKPiAtfTsKPiAtCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNlODBfaHdfc2VxX3JlZ19vZmZz
ZXRzIHJlZ19vZmZzZXRzW10gPSB7Cj4gLXsKPiAtICAgICAgIC5jcnRjID0gKG1tQ1JUQzBfQ1JU
Q19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCj4gLX0sCj4gLXsKPiAtICAgICAg
IC5jcnRjID0gKG1tQ1JUQzFfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCks
Cj4gLX0sCj4gLXsKPiAtICAgICAgIC5jcnRjID0gKG1tQ1JUQzJfQ1JUQ19HU0xfQ09OVFJPTCAt
IG1tQ1JUQ19HU0xfQ09OVFJPTCksCj4gLX0sCj4gLXsKPiAtICAgICAgIC5jcnRjID0gKG1tQ1JU
QzNfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCj4gLX0sCj4gLXsKPiAt
ICAgICAgIC5jcnRjID0gKG1tQ1JUQzRfQ1JUQ19HU0xfQ09OVFJPTCAtIG1tQ1JUQ19HU0xfQ09O
VFJPTCksCj4gLX0sCj4gLXsKPiAtICAgICAgIC5jcnRjID0gKG1tQ1JUQzVfQ1JUQ19HU0xfQ09O
VFJPTCAtIG1tQ1JUQ19HU0xfQ09OVFJPTCksCj4gLX0KPiAtfTsKPiAtCj4gLSNkZWZpbmUgSFdf
UkVHX0NSVEMocmVnLCBpZClcCj4gLSAgICAgICAocmVnICsgcmVnX29mZnNldHNbaWRdLmNydGMp
Cj4gLQo+ICAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKiBQcml2YXRlIGRlZmluaXRpb25z
Cj4gICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovCj4gLS0KPiAyLjIxLjEKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
