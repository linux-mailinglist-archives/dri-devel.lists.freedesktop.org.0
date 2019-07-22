Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F351702E6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0747189C17;
	Mon, 22 Jul 2019 15:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0636989BF4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:00:28 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id v68so4167105vkd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S13hTxeI7vlaeEbQU2EYvTuiXpSHWhJStUCdtHSLc0Y=;
 b=nGXu1QeY27AwtBeXejFspvmXW5fPfOQg29E+pxzCdNUvbs3SeCpE7gr0Sk1PkpmVSt
 4jrYuZWnLDudo16H3ZkOZu2k60vvoIWD4VnbfqvRoVMZlRsIU+Lun+kWgwPR5MtiptQG
 HJCnLKOXpJuUtN+v6jykLK4hMfQ1e04LflNVK1HQlpv1N0Lei0+6Pe2Af2+iTQaBdLxn
 u4FGRGCDuXOxUXXnnAvGtc6S4d4q6i7GEUew5bgWtaDFCzz/fD0ThTdek96MZnAAJsci
 9jiGVjmIDzjbq0ybj+BmP0syPdzKPOSnv8ejU3KTrD+otgzynULknrnKl+oHItQI5/p6
 4iBA==
X-Gm-Message-State: APjAAAXMcy7ti2q2E/4qF9c07PefiZWOl8YmyiWR/C/JWF6kfWezNstD
 kiSM97g/OY84/UCgqRRWfAO/S+Q08GHMZD3iEHA=
X-Google-Smtp-Source: APXvYqwd01HqnlKXyzQiWvWZqdGs1kjrmgxlW6+udV/Hdu2sTHZ0A6GgUEczAm1gJmESvpacK8k0GPCc4DTqNSBACxk=
X-Received: by 2002:a1f:9456:: with SMTP id w83mr9356291vkd.67.1563807627031; 
 Mon, 22 Jul 2019 08:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190722143815.7339-1-tiwai@suse.de>
 <20190722143815.7339-3-tiwai@suse.de>
In-Reply-To: <20190722143815.7339-3-tiwai@suse.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 22 Jul 2019 11:00:15 -0400
Message-ID: <CAKb7UviZ_+6T5yz=p29dTGmVzFov02S+68QZ4_3M5g83pAonLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Add HD-audio component notifier support
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTA6MzggQU0gVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNl
LmRlPiB3cm90ZToKPiArc3RhdGljIHZvaWQKPiArbnY1MF9hdWRpb19jb21wb25lbnRfaW5pdChz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSkKPiArewo+ICsgICAgICAgaWYgKCFjb21wb25lbnRfYWRk
KGRybS0+ZGV2LT5kZXYsICZudjUwX2F1ZGlvX2NvbXBvbmVudF9iaW5kX29wcykpCj4gKyAgICAg
ICAgICAgICAgIGRybS0+YXVkaW8uY29tcG9uZW50X3JlZ2lzdGVyZWQgPSB0cnVlOwo+ICt9CgpQ
YXJkb24gbXkgaWdub3JhbmNlIG9uIHRoaXMgdG9waWMgLi4uIGJ1dCBhcmUgdGhlcmUgYW55IGls
bCBlZmZlY3RzCmZyb20gYWx3YXlzIGRvaW5nIHRoaXM/IEZvciBleGFtcGxlLCB0aGUgYm9hcmQg
aW4gcXVlc3Rpb24gbWlnaHQgbm90CmhhdmUgRUxEIHN1cHBvcnQgYXQgYWxsICh0aGUgb3JpZ2lu
YWwgRzgwLCBjb3ZlcmVkIGJ5IGRpc3BudjUwKSwgb3IgaXQKbWlnaHQgbm90IGhhdmUgYW55IEhE
TUkvRFAgcG9ydHMsIG9yIGl0IG1heSBoYXZlIHRoZW0gYnV0IGp1c3Qgbm90aGluZwppcyBwbHVn
Z2VkIGluLgoKQ291bGQgeW91IGNvbmZpcm0gdGhhdCB0aGlzIGlzIGFsbCBPSz8KClRoYW5rcywK
CiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
