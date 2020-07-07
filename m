Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7AF217B6F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 01:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E077D6E3A2;
	Tue,  7 Jul 2020 23:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDF6E3A2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 23:01:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5860F20771
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594162889;
 bh=4qJEKQQJcDJ7ghgfJoXN9/TcliJkC9rBFhJEq8AKAaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pid8eg/X7TWu5oQ8D71nKDtkDO8KtHQjV+IIyaY5BUtDBgetVYrRuZ9TlpnFwDDK+
 Wd2CW2uDvrIhRkC5CSjvo/bz4xcCA4p54ZKnG7J8XZdeBTen2XI63NHEI9flHq48W0
 Gn2Ct2XkGWr8+Kz54wmfV/L6UEuVdOgYCBktcIPA=
Received: by mail-ed1-f52.google.com with SMTP id h28so40099092edz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 16:01:29 -0700 (PDT)
X-Gm-Message-State: AOAM533ma3JKRf1ZKOk9MHXLfNOEAvFooFmkk3PoVGNorF4p6XTqLAOT
 5jMEqDbQiVdZpqAZlx6q4KtS77SCYIc2cGBrwg==
X-Google-Smtp-Source: ABdhPJwN63+iLNiej03gzID1NxPCPP+r0o1MDFI0VjDfCehdz0KEDSLVG+M6Dv9Ka1UwMaw0JXkczgR7RHvqXl9MfPE=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr54721396edb.271.1594162887967; 
 Tue, 07 Jul 2020 16:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Jul 2020 07:01:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
Message-ID: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERlbm5pczoKCkRlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhzaWVoQG1lZGlhdGVrLmNv
bT4g5pa8IDIwMjDlubQ35pyIN+aXpSDpgLHkuowg5LiL5Y2IMTE6NDflr6vpgZPvvJoKPgo+IE5v
IG5lZWQgdG8gY2xlYXIgZXZlbnQgYWdhaW4gc2luY2UgZXZlbnQgYWx3YXlzIGNsZWFyIGJlZm9y
ZSB3YWl0Lgo+IFRoaXMgZml4IGRlcGVuZCBvbiBwYXRjaDoKPiAgICJzb2M6IG1lZGlhdGVrOiBj
bWRxOiBhZGQgY2xlYXIgb3B0aW9uIGluIGNtZHFfcGt0X3dmZSBhcGkiCgpBY2tlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gRml4ZXM6IDJmOTY1YmU3
ZjkwMDggKCJkcm0vbWVkaWF0ZWs6IGFwcGx5IENNRFEgY29udHJvbCBmbG93IikKPiBTaWduZWQt
b2ZmLWJ5OiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2llaEBtZWRpYXRlay5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8ICAgIDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCj4gaW5kZXggYzg0ZTdhMTRkNGE4Li5i
YTZjZjk1NmIyMzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
Cj4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfaHdfY29uZmln
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgICAgICAgICBtYm94X2Zs
dXNoKG10a19jcnRjLT5jbWRxX2NsaWVudC0+Y2hhbiwgMjAwMCk7Cj4gICAgICAgICAgICAgICAg
IGNtZHFfaGFuZGxlID0gY21kcV9wa3RfY3JlYXRlKG10a19jcnRjLT5jbWRxX2NsaWVudCwgUEFH
RV9TSVpFKTsKPiAgICAgICAgICAgICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQoY21kcV9oYW5k
bGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPiAtICAgICAgICAgICAgICAgY21kcV9wa3Rfd2Zl
KGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVudCwgdHJ1ZSk7Cj4gKyAgICAgICAgICAg
ICAgIGNtZHFfcGt0X3dmZShjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIGZhbHNl
KTsKPiAgICAgICAgICAgICAgICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBjbWRxX2hhbmRs
ZSk7Cj4gICAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFfaGFuZGxlKTsKPiAg
ICAgICAgICAgICAgICAgY21kcV9wa3RfZmx1c2hfYXN5bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRx
X2NiLCBjbWRxX2hhbmRsZSk7Cj4gLS0KPiAxLjcuOS41Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
