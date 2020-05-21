Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC411DD25D
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 17:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823EC6E946;
	Thu, 21 May 2020 15:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FFA6E946
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 15:52:28 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 328BA20884
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590076348;
 bh=h2AUaH4aXHpccCQhYPuCaSjyjozytmLuDN9MpHk9uAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P+44JUYXp74xl52H9qZMibt93w7fm0My+qOb69Jq83i/ssBrQ7QN7Iz6c12Wdxw4y
 hj0BFJhE35dYsuSF0Gaii+4BO3amtmPX/rcIshbwfh76e/nCyRgesYpfdgxzm9U62k
 o3TUTD85NlbAeeGVW/qIS9l2OPHfMKQpFviS3qJ8=
Received: by mail-ed1-f48.google.com with SMTP id b91so6971684edf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 08:52:28 -0700 (PDT)
X-Gm-Message-State: AOAM533Qa5+HNi9OYEPU8j1lIvx6tHzGGWZ2uhL0O+mv5GSYuEaPP0c2
 B+34R0b+OJUbk8/k4M5Orkx48V/+Q5NPnDpAmw==
X-Google-Smtp-Source: ABdhPJxoiAfY3EqoTUIgSN9uajnmVi63rqA+DLND8x6vbz3lwCQqSeZV1VZDDqNPOfQOaHKUOkbcditLoeQVCQlQWVM=
X-Received: by 2002:a05:6402:1775:: with SMTP id
 da21mr8334701edb.271.1590076346559; 
 Thu, 21 May 2020 08:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
In-Reply-To: <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 May 2020 23:52:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9UYVZJipizdHoHiReaW4e4qbcKWygs0wVNfYQHR49txg@mail.gmail.com>
Message-ID: <CAAOTY_9UYVZJipizdHoHiReaW4e4qbcKWygs0wVNfYQHR49txg@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Dave Airlie <airlied@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhdmU6CgpEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IOaWvCAyMDIw5bm0Neac
iDIw5pelIOmAseS4iSDkuIvljYgxOjQ05a+r6YGT77yaCj4KPiBPbiBNb24sIDE4IE1heSAyMDIw
IGF0IDEwOjA2LCBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gSGksIERhdmUgJiBEYW5pZWw6Cj4gPgo+ID4gVGhpcyBpbmNsdWRlIGRwaSBwaW4g
bW9kZSBzd2FwLCBjb25maWcgbWlwaV90eCBjdXJyZW50IGFuZCBpbXBlZGFuY2UsCj4gPiBhbmQg
c29tZSBmaXh1cC4gSSBkcm9wIGRybV9icmlkZ2UgcGF0Y2hlcyBpbiB0aGlzIHZlcnNpb24uCj4g
Pgo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4ZjNkOWYzNTQyODY3NDVj
NzUxMzc0ZjVmMWZjYWZlZTZiM2YzMTM2Ogo+ID4gICBMaW51eCA1LjctcmMxICgyMDIwLTA0LTEy
IDEyOjM1OjU1IC0wNzAwKQo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4gPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQKPiA+IHRhZ3MvbWVkaWF0ZWstZHJtLW5leHQtNS44Cj4g
PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMDA3ZDI3NGEwMTdiYjRlMmVmN2I5MjJj
MmY1NGY0MGNmMjA3MzY2NDoKPgo+IERpZCB5b3UgZWRpdCB0aGlzIGJ5IGhhbmQgb3IgcGFzcyBp
dCB0aHJvdWdoIHNvbWUgbWFpbHNlcnZlciB0aGF0Cj4gY2hld2VkIGl0IHVwLCBJIGhhZCB0byBy
ZWNvbnN0cnVjdCB0aGlzIHB1bGwgZnJvbSB0aGUgYWJvdmUgYml0cywgSSd2ZQo+IG5vIGlkZWEg
d2h5IGl0J3Mgc28gbWVzc2VkIHVwIGluIHRoZSBmaXJzdCBwbGFjZS4KClRoZSBpZGVhIGlzIHRo
YXQgZ21haWwgd291bGQgd3JhcCB3b3Jkcywgc28gSSBjaGFuZ2UgdG8gdXNlICdnaXQKc2VuZC1l
bWFpbCcgaW4gdjMuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IERhdmUuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
