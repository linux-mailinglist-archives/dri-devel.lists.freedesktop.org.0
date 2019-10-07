Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66224CEA4B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C986889B22;
	Mon,  7 Oct 2019 17:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DF889B22
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:12:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c195so9830374lfg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d56Tb1Fhf04I8cNYscsuS4R54ppje7oBpTKsxE6/V6o=;
 b=dYmReXG/dTGu7ADUI2UT/2YhLpqvJkJuGuJENgk/hnl8f2oEnCeq1WVFr0meBWcVjd
 5KNeuZ62vipesvvT7Ofa+AOQqUN+j8s+mOZ4LZfkZ37rGbpmvF6Oc1BF76l8teb/Mlll
 6iVCWNNwt3y0lvoRP8yoNpyALPBgHV7Xn2hHtxYihPhL87gi48IDW9qCdLJNl8upNim7
 5wsWwZvykDuOvIq8ACq66BmZdVBYtNmzhu5cwBEsDumtJ/jcOXqHZ8q8YKUkSKKx1L7F
 ySn5HRLegVogEnZFutaxYSJZNkXQrRCgDeoieqB83BmagIX/3qeM20oOqoAzUbIlsGT0
 iBag==
X-Gm-Message-State: APjAAAUWr/VleCauvo6zxZT5Y4K9QoHWsbq8uqF4pOC7vqi1JvdfISCQ
 wHt6o6t21ddAI/pWrtBmeNPaUNhx
X-Google-Smtp-Source: APXvYqyaZEnxwfOADg/A60hXa+TcicWrh5LMUyUm8VgDQghN3TtzpZtGJjHWcNE2glQUmlM6ke0X1A==
X-Received: by 2002:a19:4bd7:: with SMTP id y206mr17845192lfa.9.1570468360238; 
 Mon, 07 Oct 2019 10:12:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 t4sm3254663lji.40.2019.10.07.10.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 10:12:39 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm_dp_cec: drop use of drmP.h
Date: Mon,  7 Oct 2019 19:12:23 +0200
Message-Id: <20191007171224.1581-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007171224.1581-1-sam@ravnborg.org>
References: <20191007171224.1581-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d56Tb1Fhf04I8cNYscsuS4R54ppje7oBpTKsxE6/V6o=;
 b=Fen4SFWsrKCyxArNzrOSRDRen3Hp33oshrEwLDYq7zOtHu3Ec8lTENG5Z1UQU3fFgX
 57nbKBaUHl7ZeqQfYwyFZg5lnF0L0800pjGpdqUB2w4e3N20HjszB9TY7g2XuGDwsPTB
 edGUA7L6WbYeMWQ/2D76PFfTvHS2mxBhpiu7RwGED/Q8YSN05CBYuV6dWwzHgzNv8HaE
 zDVXXyqhfdS7T+L5TLgsTVfiZPTjEs9IgAcapMRf/Hjb0DAFqM2A4JMKjWaWdaB+gUpS
 /9siL8gNMGFnANMCl6WH0RYkIYQRVchgWH5WYJnErH19F7zGXiCdEcLaaTFQVZrIyyVk
 RtBg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtUC5oIGlzIGRlcHJlY2F0ZWQgYW5kIHdpbGwgYmUgZGVsZXRlZC4KUmVwbGFjZSB1c2Ugd2l0
aCBwcm9wZXIgaGVhZGVyLgoKRGl2aWRlIGhlYWRlciBpbmNsdWRlcyBpbiBibG9ja3Mgd2hpbGUg
dG91Y2hpbmcgdGhlc2UuCgpCdWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGFyY2h0ZWN0dXJlcyBh
bmQgY29uZmlncy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KRml4ZXM6IGFlODViMGRmMTI0ZjY5MjggKCJkcm1fZHBfY2VjOiBhZGQgY29ubmVjdG9yIGlu
Zm8gc3VwcG9ydC4iKQpDYzogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNv
bT4KQ2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgpDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5jIHwgNiArKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMK
aW5kZXggYjQ1N2MxNmMzYThiLi4zYWIyNjA5ZjllYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfY2VjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYwpAQCAt
OCwxMCArOCwxMiBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKworI2luY2x1ZGUgPG1lZGlhL2Nl
Yy5oPgorCiAjaW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KKyNpbmNsdWRlIDxkcm0vZHJt
X2RldmljZS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZHBfaGVscGVyLmg+Ci0jaW5jbHVkZSA8ZHJt
L2RybVAuaD4KLSNpbmNsdWRlIDxtZWRpYS9jZWMuaD4KIAogLyoKICAqIFVuZm9ydHVuYXRlbHkg
aXQgdHVybnMgb3V0IHRoYXQgd2UgaGF2ZSBhIGNoaWNrZW4tYW5kLWVnZyBzaXR1YXRpb24KLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
