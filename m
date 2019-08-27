Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE39EC0D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 17:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFB389322;
	Tue, 27 Aug 2019 15:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5756892DC;
 Tue, 27 Aug 2019 15:09:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so3460700wmg.0;
 Tue, 27 Aug 2019 08:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Qq0g1XL+PbeMFceNKBAmH7iRX3/JfNtU8Nq/VEW2ks=;
 b=VlzQI6Xll+RHg2xTrFT5JckSm1p1BOX4o+7hM8jMWcmyOrXC6JT8ab+ANZpkgyz3lY
 Wou11KsOn5Llb36qDSvzFCXGK8laDwkIZhxNONGXZ+I0sosLlTfLEUJR1WU0PKzc4GNk
 l3UL8eT8+xHilD4hTLnS8rTwQLUMgQ2MBEtwu3pqBFo6n9NvcVklkr1sEMBuu9cu6i2U
 Brntmkg8zp9KfWwuKir5uGSRLBpoxwtDGYvXaH/k4bXmQKTTZlCD1SYSiAGCWe7XPDRg
 9PZ2eg0SWRDYC/yAH077+YikVjXAZf7jgaa/5GkZDMlkO79L6l+ioaYY2ot6arK/Igc1
 lRjg==
X-Gm-Message-State: APjAAAVkjsE9V3/occjjwTOQjXaXgdBech5DC2aPDJiRXh8RSZegJiOV
 K6U61t2xytb+WhuZE324M0Ymi1I3a9CEOaKvCR0=
X-Google-Smtp-Source: APXvYqwXAxK4qE/kfjKMd/jlTPp+yDppDz4AMPQr+Hz42Vgnu4UxoeuKdCuXbSMp+hx7UWIC0reBZcWVTh99hk0ZtFo=
X-Received: by 2002:a05:600c:352:: with SMTP id
 u18mr29119665wmd.141.1566918591384; 
 Tue, 27 Aug 2019 08:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190827064425.19627-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190827064425.19627-1-yamada.masahiro@socionext.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Aug 2019 11:09:38 -0400
Message-ID: <CADnq5_OUC_Wtwe2+w-DRtEUoBEmNa6GkoQ10_qD8=28xF32jBg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: remove meaningless descending into amd/amdkfd/
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9Qq0g1XL+PbeMFceNKBAmH7iRX3/JfNtU8Nq/VEW2ks=;
 b=PLln4fpd0YhSY8pSpNl44r1UmZv2vqlKnFyViLPoAd1mnWo4OIjHPPURJoj2rKCdBh
 fAWeNLWPIxIhMOiIMJA6yOibIUt8iBghTSzVn1Xefjz3tcRqiUd5CTSWEz/u9PL1xm5u
 7HDylFoozw9wrhl2n9guPuDxSp92vS3sMXAsnezNFd4nMGan3Bc5Yidb4F7FGDDEeSFB
 o0AUevQMHGDtP4gvfVqumaCHgjwoZfzHIC1N2/Hzuh64J7al1OCBZjvDhQcnUagqsB2l
 aWple+A7KtLS+xtjGCUs4yQL7oT+MnvB3fM3mgonL8xNwMUO/UsaPp34PTshPZ3P2F3O
 Taaw==
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
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?B?Q2hyaXN0aWFuIEvvv73vv73Dk25pZw==?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMzoyOSBBTSBNYXNhaGlybyBZYW1hZGEKPHlhbWFkYS5t
YXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZToKPgo+IFNpbmNlIGNvbW1pdCAwNGQ1ZTI3NjU4
MDIgKCJkcm0vYW1kZ3B1OiBNZXJnZSBhbWRrZmQgaW50byBhbWRncHUiKSwKPiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9NYWtlZmlsZSBkb2VzIG5vdCBjb250YWluIGFueSBzeW50YXggdGhh
dAo+IGlzIHVuZGVyc3Rvb2QgYnkgdGhlIGJ1aWxkIHN5c3RlbS4KPgo+IFNpZ25lZC1vZmYtYnk6
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CgpBcHBsaWVk
LiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgfCAx
IC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiBpbmRleCA5
ZjBkMmVlMzU3OTQuLjNmOTE5NWI3YWQxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
TWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPiBAQCAtNjIsNyArNjIs
NiBAQCBvYmotJChDT05GSUdfRFJNX1RUTSkgKz0gdHRtLwo+ICBvYmotJChDT05GSUdfRFJNX1ND
SEVEKSAgICAgICAgKz0gc2NoZWR1bGVyLwo+ICBvYmotJChDT05GSUdfRFJNX1RERlgpICs9IHRk
ZngvCj4gIG9iai0kKENPTkZJR19EUk1fUjEyOCkgKz0gcjEyOC8KPiAtb2JqLSQoQ09ORklHX0hT
QV9BTUQpICs9IGFtZC9hbWRrZmQvCj4gIG9iai0kKENPTkZJR19EUk1fUkFERU9OKSs9IHJhZGVv
bi8KPiAgb2JqLSQoQ09ORklHX0RSTV9BTURHUFUpKz0gYW1kL2FtZGdwdS8KPiAgb2JqLSQoQ09O
RklHX0RSTV9NR0EpICArPSBtZ2EvCj4gLS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
