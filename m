Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7A217229
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 17:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0589A0E;
	Tue,  7 Jul 2020 15:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D8989A0E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:43:58 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B6D02075B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594136638;
 bh=tkn4NlQVOLAk5KZbJigJqGpfKJwjOJ8SNc8IkCbR+Dk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=02f2nq1TD02EjCllQACMbAYlzzCl2AEEgLDm6S8QwvzzTyZFlD1MH/32n4ll78mnX
 2MicAVcqjCwzpbMND4tyQ58JtyKF9l6YRQaZlvQ6MfnUbBsUIhywPLupP5zxaDRiwI
 +fu75lxR932kl8ESezuRN21efUJE8z5ub0T4P024=
Received: by mail-ej1-f51.google.com with SMTP id p20so47003419ejd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 08:43:58 -0700 (PDT)
X-Gm-Message-State: AOAM530Vb5HHz7z2wR+dnak0DoJP3s1Ri/Vn9STL0Z6SELOYw4K4Y+ZD
 GAKD+RDNdoXPhLMal/QSRNBitX6fg0k1ETqFtw==
X-Google-Smtp-Source: ABdhPJy0vJeuoK0xQfh+uPUTYL0crelToPxcOJUKuQQy42Kahj+1FocmJlfddSjWmifyTDyiJQ00ADpPWaCkJT5NL+M=
X-Received: by 2002:a17:906:9354:: with SMTP id
 p20mr11919ejw.187.1594136636992; 
 Tue, 07 Jul 2020 08:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200707153944.604-1-chunkuang.hu@kernel.org>
In-Reply-To: <20200707153944.604-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Jul 2020 23:43:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__BqCm67p1ywKqJsR3NfZb7QbVYVg9f2cLaURHPMaQTCg@mail.gmail.com>
Message-ID: <CAAOTY__BqCm67p1ywKqJsR3NfZb7QbVYVg9f2cLaURHPMaQTCg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes for 5.8
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbDoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwg
MjAyMOW5tDfmnIg35pelIOmAseS6jCDkuIvljYgxMTozOeWvq+mBk++8mgo+Cj4gSGksIERhdmUg
JiBEYXZpZDoKClNvcnJ5IGZvciB5b3VyIG5hbWUuCgo+Cj4gVGhpcyBpbmNsdWRlIGZpeHVwIGZv
ciBjbWRxLCBtbXN5cywgdmlzaWJpbGl0eSBjaGVja2luZyBhbmQgc29tZSByZWZpbmVtZW50Lgo+
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IGIzYTllM2I5NjIyYWUxMDA2NDgyNmRjY2I0ZjdhNTJiZDg4Yzc0MDc6Cj4KPiAg
IExpbnV4IDUuOC1yYzEgKDIwMjAtMDYtMTQgMTI6NDU6MDQgLTA3MDApCj4KPiBhcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdCB0YWdzL21l
ZGlhdGVrLWRybS1maXhlcy01LjgKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA1
YWI1NDZmNWU2MzA5MzczYWVmMDFhOGQzOThlMTYzYWI3YTc4NDMxOgo+Cj4gICBkcm0vbWVkaWF0
ZWs6IG10a19oZG1pOiBSZW1vdmUgZGVidWcgbWVzc2FnZXMgZm9yIGZ1bmN0aW9uIGNhbGxzICgy
MDIwLTA3LTA1IDA2OjM5OjIxICswODAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IE1lZGlhdGVrIERSTSBGaXhl
cyBmb3IgTGludXggNS44Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQmVybmFyZCBaaGFvICgxKToKPiAgICAgICBk
cm0vbWVkaWF0ZWs6IFJlbW92ZSB1bm5lY2Vzc2FyeSBjb252ZXJzaW9uIHRvIGJvb2wKPgo+IEVu
cmljIEJhbGxldGJvIGkgU2VycmEgKDMpOgo+ICAgICAgIGRybS9tZWRpYXRlazogUmVtb3ZlIGRl
YnVnIG1lc3NhZ2VzIGZvciBmdW5jdGlvbiBjYWxscwo+ICAgICAgIGRybS9tZWRpYXRlazogbXRr
X210ODE3M19oZG1pX3BoeTogUmVtb3ZlIHVubnVzZWQgY29uc3QgdmFyaWFibGVzCj4gICAgICAg
ZHJtL21lZGlhdGVrOiBtdGtfaGRtaTogUmVtb3ZlIGRlYnVnIG1lc3NhZ2VzIGZvciBmdW5jdGlv
biBjYWxscwo+Cj4gSHNpbi1ZaSBXYW5nICgyKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IEZpeCBk
ZXZpY2UgcGFzc2VkIHRvIGNtZHEKPiAgICAgICBkcm0vbWVkaWF0ZWs6IENoZWNrIHBsYW5lIHZp
c2liaWxpdHkgaW4gYXRvbWljX3VwZGF0ZQo+Cj4gTWF0dGhpYXMgQnJ1Z2dlciAoMSk6Cj4gICAg
ICAgZHJtL21lZGlhdGVrOiBEZWxldGUgbm90IHVzZWQgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
Cj4KPiBZdWVIYWliaW5nICgxKToKPiAgICAgICBkcm0vbWVkaWF0ZWs6IEZpeCBLY29uZmlnIHdh
cm5pbmcKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICAg
ICB8ICA4ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAg
ICAgICB8ICA2ICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
ICAgICAgIHwgMjUgKysrKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jICAgICAgICAgICAgIHwgIDUgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jICAgICAgICAgICAgfCAxMiArLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19tdDgxNzNfaGRtaV9waHkuYyB8IDUyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDcgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgODggZGVsZXRpb25zKC0pCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
