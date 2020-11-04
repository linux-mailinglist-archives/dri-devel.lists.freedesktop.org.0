Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245252A72CC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 00:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A84D6E02D;
	Wed,  4 Nov 2020 23:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8264C6E02D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:50:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B82E222203
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604533844;
 bh=rZVugjYB/4k+eXAwY+hWif6/XHITjDjkK7t3jd5Csy4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EsbawDsGEKH+HSWm5ZqrktZxUyNrCzYQca0ZDpvEtrcVpRXlKY6HNjfKKJ+3WlkQh
 BUK08Kd8M9xHJnWndv2aR9KWEJu5dOWzc5R/c7qA0Y37gn0u3HfLFO48b/npedoL1B
 j23Ym4si1TZbG6lj5jRJmyUiNKEgChO4xSbi2meE=
Received: by mail-ed1-f49.google.com with SMTP id l24so44182edj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 15:50:43 -0800 (PST)
X-Gm-Message-State: AOAM533eAoYARpNszvZI+U3V5pBndZkzga8yuxaSqrWJVv3PofKC2lJ2
 P9h32aDNcYerw1s4cO7iuAeeo+rasVZd02/6pQ==
X-Google-Smtp-Source: ABdhPJw2MFzA4i3gboFt85gvfEIsJhYi9NkO2Z8ek0sVWS6OAHSRmjU7y5MiPocAd0n+Veh84MiPymNv3gkFS0LgVtE=
X-Received: by 2002:a50:d587:: with SMTP id v7mr306527edi.38.1604533842193;
 Wed, 04 Nov 2020 15:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20201005162241.172912-1-enric.balletbo@collabora.com>
 <9752ce85-a3e3-1e2f-c9d8-eae729364fee@collabora.com>
In-Reply-To: <9752ce85-a3e3-1e2f-c9d8-eae729364fee@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 5 Nov 2020 07:50:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__yPAph065cbgL8St5U4auW9H8mfWJrT67q5HVNiAmsBA@mail.gmail.com>
Message-ID: <CAAOTY__yPAph065cbgL8St5U4auW9H8mfWJrT67q5HVNiAmsBA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Fix unused variable
 'mtk_dpi_encoder_funcs'
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQxMeaciDTml6Ug6YCx5LiJIOS4i+WNiDY6NDDlr6vpgZPvvJoK
Pgo+IEhpCj4KPiBPbiA1LzEwLzIwIDE4OjIyLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3Rl
Ogo+ID4gQ29tbWl0IGY4OWM2OTZlN2Y2MyAoImRybS9tZWRpYXRlazogbXRrX2RwaTogQ29udmVy
dCB0byBicmlkZ2UgZHJpdmVyIikKPiA+IGludHJvZHVjZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3
YXJuaW5nIHdpdGggVz0xCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmM6NTMwOjM5OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ210a19kcGlfZW5jb2Rlcl9mdW5j
cycgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlXQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2VuY29kZXJfZnVuY3MgbXRrX2RwaV9lbmNvZGVyX2Z1bmNzID0gewo+ID4KPiA+IFRoaXMgc3Ry
dWN0IGlzIGFuZCB0aGUgJ210a19kcGlfZW5jb2Rlcl9kZXN0cm95KCknIGFyZSBub3QgbmVlZGVk
Cj4gPiBhbnltb3JlLCBzbyByZW1vdmUgdGhlbS4KPiA+Cj4gPiBGaXhlczogZjg5YzY5NmU3ZjYz
ICgiZHJtL21lZGlhdGVrOiBtdGtfZHBpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIiKQo+ID4g
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3Jh
LmNvbT4KPiA+IC0tLQo+Cj4gQSBnZW50bGUgcGluZyBvbiB0aGlzIHNtYWxsIGZpeC4gVGhhbmtz
LAoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tZml4ZXMgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xp
bnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLWZpeGVzCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
Pgo+ICAgRW5yaWMKPgo+ID4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5j
IHwgOSAtLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IDU4OWVmMzNhMTc4MC4uMjYw
OWQ5MTdlM2Y5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gQEAg
LTUyMiwxNSArNTIyLDYgQEAgc3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3Ry
dWN0IG10a19kcGkgKmRwaSwKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtc3Rh
dGljIHZvaWQgbXRrX2RwaV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyKQo+ID4gLXsKPiA+IC0gICAgIGRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7Cj4gPiAt
fQo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgbXRrX2Rw
aV9lbmNvZGVyX2Z1bmNzID0gewo+ID4gLSAgICAgLmRlc3Ryb3kgPSBtdGtfZHBpX2VuY29kZXJf
ZGVzdHJveSwKPiA+IC19Owo+ID4gLQo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9icmlkZ2VfYXR0
YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW51bSBkcm1fYnJpZGdlX2F0dGFjaF9mbGFncyBmbGFncykKPiA+ICB7Cj4gPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
