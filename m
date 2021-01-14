Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346222F6EB5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 23:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5299A89970;
	Thu, 14 Jan 2021 22:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE7089970
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:56:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B31BB23A5C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 22:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610664969;
 bh=uXGJ6xCEysiGL4Hzw3Uu8vrJXyYKiGWf1f8PXzrKYZo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T0OYHM0DE9MxSFhjc+wnS050JkMkxrfkLbuJ9FBqrk4S3OUzL7++4cDszksupy22F
 XJ10HvCzRzb9+VaoeIs9WkDS/CzFm9MI3dd6+4WbZepqbmZXHNHrG6PmMJAPPiYqk5
 II3N6J46S/kljP87jktuL+bZNDH9qImPRcYS0zczAWCgAevk6aPcGt3ajSJijEDVRd
 kHJpf6aIPg9uqKLZxjAMgNqyOOsN9pwJHLM6EaPHZ6ClEd4BVoiLQGW39whevDNNal
 m7PqT0gL5GbK+GjGvMmpedOlNdG/jyBk6UmQskq4Bw+f2FbzX9joKG+XwRWyU8fTce
 5L3lfWBxeBjbA==
Received: by mail-ed1-f54.google.com with SMTP id g1so6862135edu.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 14:56:08 -0800 (PST)
X-Gm-Message-State: AOAM533tcfj9KrYmjGKVPBPKZQHu35rK/5fmbJkFDP4EFbQwiYFX2VgU
 mZOX/tbgsKJD0tq25WK+Y35i3niVVXv/1z4bwA==
X-Google-Smtp-Source: ABdhPJzKHMc6mf/hOkNc8AU+Eybq1geWp6Y8iOKubI270z1OJwevJFI1fq4ScBjoTzAbQLMHBTJ9Z/F6mN1e3WoR/rE=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr7742818edq.162.1610664967322; 
 Thu, 14 Jan 2021 14:56:07 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-12-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-12-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 15 Jan 2021 06:55:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_98=hJvQibAUfk3f9NF+3sEZ4JuANEDgp6WJ7cVAOygQQ@mail.gmail.com>
Message-ID: <CAAOTY_98=hJvQibAUfk3f9NF+3sEZ4JuANEDgp6WJ7cVAOygQQ@mail.gmail.com>
Subject: Re: [PATCH v3, 11/15] drm/mediatek: fix aal size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gdGhl
IG9yZ2luYWwgc2V0dGluZyBpcyBub3QgY29ycmVjdCwgZml4IGl0IGZvbGxvdyBoYXJkd2FyZSBk
YXRhIHNoZWV0Lgo+IGlmIGtlZXAgdGhpcyBlcnJvciBzZXR0aW5nLCBtdDgxNzMvbXQ4MTgzIGRp
c3BsYXkgb2sKPiBidXQgbXQ4MTkyIGRpc3BsYXkgYWJub3JtYWwuCj4KCkFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVk
aWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IEZpeGVzOiAwNjY0ZDEzOTJj
MjYgKGRybS9tZWRpYXRlazogQWRkIEFBTCBlbmdpbmUgYmFzaWMgZnVuY3Rpb24pCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBpbmRleCBmYzAxZmVh
Li42MDgxODAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jCj4gQEAgLTE3NCw3ICsxNzQsNyBAQCBzdGF0aWMgdm9pZCBtdGtfYWFsX2NvbmZpZyhz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgdywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3Br
dCAqY21kcV9wa3QpCj4gIHsKPiAtICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwg
MTYgfCB3LCBjb21wLCBESVNQX0FBTF9TSVpFKTsKPiArICAgICAgIG10a19kZHBfd3JpdGUoY21k
cV9wa3QsIHcgPDwgMTYgfCBoLCBjb21wLCBESVNQX0FBTF9TSVpFKTsKPiAgfQo+Cj4gIHN0YXRp
YyB2b2lkIG10a19hYWxfc3RhcnQoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiAtLQo+IDEu
OC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
