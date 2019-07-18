Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EF6D1BB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112796E444;
	Thu, 18 Jul 2019 16:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076A6E444;
 Thu, 18 Jul 2019 16:15:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p197so19603161lfa.2;
 Thu, 18 Jul 2019 09:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UlOLkWz9OCQuOLcSNJtSJ4+8TzZuh+LJDaeiwowcFEQ=;
 b=Ro/t9Sf7Lfjt3CDxONuTkkZKe+LBGAihomXcotZ2zk9yaVjfbvAkg9QnN0doomkC2g
 ocYtasnshLchsAoLna+rqHuEzPhb3DHR7Nvn+hjG1R9LE5jcyBgVvMDtke1cmtTkW2Rw
 9LSGJ5VTppbXdHRoQJDF8VxfCr2eLGE6jC5ZXfcpzXN87B0J5LxNosquixfHYYpwSPSo
 FAy5+5lsRNNRq6VOVeov7NM21EE6eXRoFftAgzMNDbZ1L65UOfbekPU3JZL3NdzWVVsx
 5TT8f7kVM8FRrTtvrQ/D12g9qnhwURjf9C2+On2vh614W5nOSbBKtMFNGG+80qi5eFij
 y0Zw==
X-Gm-Message-State: APjAAAVYnN5m+qw1wtEt6FtYbSllyZ2suIqCPzjSahLCVe54KGt5HOgl
 gB4QR2ow8LpzJ0U8j2Ah8majFxenCu2+7Q==
X-Google-Smtp-Source: APXvYqxYBrArSH1t7goxG0eRWhOTlhkk7mSDSycDPhnE9EVqrjdusk6P3foX4G6hPkEh6dmQ1VTAyQ==
X-Received: by 2002:a19:c514:: with SMTP id w20mr21730371lfe.182.1563466541152; 
 Thu, 18 Jul 2019 09:15:41 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Date: Thu, 18 Jul 2019 18:15:07 +0200
Message-Id: <20190718161507.2047-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UlOLkWz9OCQuOLcSNJtSJ4+8TzZuh+LJDaeiwowcFEQ=;
 b=d2LniV1TStQHaiWmIBMTYC+PjTLCHouyWKGpmJ+7CMGnK+gTJA+cBCRsj6jZDNTvJ/
 4GhmHbHYJ9hnDNp70wOSyILt3N4zZUXgBuUtjWxFlzwoSFUgshoux+3kWDF8bG9bgwD8
 Vbhvgg60g5ByAdW1bL7Nif8sBeXiWyjcbHvdWeq33btV0vU4tIyw3w4Gh2tTYormeCCF
 OBWUfeuDa2f+CeaO3dke7aqRgwpjKQWUkbcAQ5B7wubS+besUXOgPfRYOew0FIDlu6P6
 yp/dQr2mJ4MfXQexj1lDz3S+twdz7hTxdAFfA8KsPkFsQiDe7AJc02Q4zDi2Di14kEo+
 noSQ==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2ZpbGUgdXNlZCBkcm1fbWFnaWNfdCBmcm9tIHVhcGkvZHJtL2RybS5oLgpUaGlzIGlzIGEg
c2ltcGxlIHVuc2lnbmVkIGludC4KSnVzdCBvcGVuY29kZSBpdCBhcyBzdWNoIHRvIGJyZWFrIHRo
ZSBkZXBlbmRlbmN5IGZyb20gdGhpcyBoZWFkZXIgZmlsZQp0byB1YXBpLgoKU2lnbmVkLW9mZi1i
eTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTdWdnZXN0ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4KQ2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgpDYzogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0
PgotLS0KIGluY2x1ZGUvZHJtL2RybV9maWxlLmggfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fZmlsZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAppbmRleCA2N2FmNjBiYjUyN2EuLjA0
NmNkMWJmOTFlYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAorKysgYi9pbmNs
dWRlL2RybS9kcm1fZmlsZS5oCkBAIC0zNCw4ICszNCw2IEBACiAjaW5jbHVkZSA8bGludXgvY29t
cGxldGlvbi5oPgogI2luY2x1ZGUgPGxpbnV4L2lkci5oPgogCi0jaW5jbHVkZSA8dWFwaS9kcm0v
ZHJtLmg+Ci0KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW1lLmg+CiAKIHN0cnVjdCBkbWFfZmVuY2U7
CkBAIC0yMjcsNyArMjI1LDcgQEAgc3RydWN0IGRybV9maWxlIHsKIAlzdHJ1Y3QgcGlkICpwaWQ7
CiAKIAkvKiogQG1hZ2ljOiBBdXRoZW50aWNhdGlvbiBtYWdpYywgc2VlIEBhdXRoZW50aWNhdGVk
LiAqLwotCWRybV9tYWdpY190IG1hZ2ljOworCXVuc2lnbmVkIGludCBtYWdpYzsKIAogCS8qKgog
CSAqIEBsaGVhZDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
