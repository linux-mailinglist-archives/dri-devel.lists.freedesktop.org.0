Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70551C58
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5411689DC7;
	Mon, 24 Jun 2019 20:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C5F89DC2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:31:26 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bi6so7534206plb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZKHvCx8L/nRTrUb/ohywx0d3IXX3vcHyiOoGdIF2Vg=;
 b=NUDgWWxxf4nvayWGVWhtq8ePv6VQ2RCC/FtdllCYiuFJfe0yVRB+8Evc3LfIoOyans
 VCHVGIsfffBLVCU9xKySMtWlA1I7huAcglFRFnTXJvq1PZ8T1aL8tib2HD4EjBfpTJ1+
 1AuHxRgvweEhjTW9IUd4OnKr4Mrg6FJ/fE/ZDty9caQ5sh/yULjGn5yCzqzfG7hV9qvW
 kxwGhqDALRCJP1SoGMA5iYdJJJ+PoOXzSIfJGmrT6dAToNhkPgtAROPN6x1R1KA1uAEH
 O3ytSR6EQux3BbiC/efaUb1916XHXhL8MygAY7ZOxddnXa9KKzbyhv7gPt4ByA/xDzti
 VmSw==
X-Gm-Message-State: APjAAAXNal2q5vPF5KfIj0UahyqXOq8CbGAMYdo/1VaGWNiA0CKC/ei8
 dnAid6kAIXsfCwatKxRXP+qDVQ==
X-Google-Smtp-Source: APXvYqzY0+srP89wCVDbPca+cx8EHxAJHQuHwUe5lX3IaE2YnttbyJ+9Ii8mxU7OnlFea1FBJZ1y0Q==
X-Received: by 2002:a17:902:2006:: with SMTP id
 n6mr94261265pla.232.1561408286127; 
 Mon, 24 Jun 2019 13:31:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id r2sm21887470pfl.67.2019.06.24.13.31.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:31:25 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Date: Mon, 24 Jun 2019 13:31:13 -0700
Message-Id: <20190624203114.93277-5-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190624203114.93277-1-mka@chromium.org>
References: <20190624203114.93277-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZKHvCx8L/nRTrUb/ohywx0d3IXX3vcHyiOoGdIF2Vg=;
 b=G/bUhQslRBb9yDeN/Ju1v2H78Jn3pcV6lvi6ZsyGVCuBbzJ+oIhAcvU04QfS10U/4R
 pdE3J6hWbwxyP4QcHwwtH00UNcd1LgYEz2XOvY5wmOr4tiTSrA/9uD0OATvj9bqrmoPn
 id+vaY8rgFoQ9n7vUdhFL4XPoNNii/WHKNs9A=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgaWYgYSBicmlnaHRuZXNzIGN1cnZlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUg
aXMgbGluZWFyIG9yCm5vdCBhbmQgc2V0IHRoZSBjb3JyZXNwb25kaW5nIHByb3BlcnR5IGFjY29y
ZGluZ2x5LiBUaGlzIG1ha2VzIHRoZQpzY2FsZSB0eXBlIGF2YWlsYWJsZSB0byB1c2Vyc3BhY2Ug
dmlhIHRoZSAnc2NhbGUnIHN5c2ZzIGF0dHJpYnV0ZS4KClRvIGRldGVybWluZSBpZiBhIGN1cnZl
IGlzIGxpbmVhciBpdCBpcyBjb21wYXJlZCB0byBhIGludGVycG9sYXRlZCBsaW5lYXIKY3VydmUg
YmV0d2VlbiBtaW4gYW5kIG1heCBicmlnaHRuZXNzLiBUaGUgY3VydmUgaXMgY29uc2lkZXJlZCBs
aW5lYXIgaWYKbm8gdmFsdWUgZGV2aWF0ZXMgbW9yZSB0aGFuICsvLTUlIG9mICR7YnJpZ2h0bmVz
c19yYW5nZX0gZnJvbSB0aGVpcgppbnRlcnBvbGF0ZWQgdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIHVz
ZSAxMjggKHBvd2VyIG9mIHR3bykgaW5zdGVhZCBvZiAxMDAgYXMgZmFjdG9yIGZvciB0aGUgc2xv
cGUKLSBhZGQgY29tbWVudCBhYm91dCBtYXggcXVhbnRpemF0aW9uIGVycm9yCi0gYWRkZWQgRGFu
aWVsJ3MgJ0Fja2VkLWJ5JyB0YWcKLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwu
YyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21f
YmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IGYwNjdmZTdhYTM1
ZC4uMjI5N2ZiNGFmNDlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21f
YmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAtNDA0LDYgKzQw
NCwzMSBAQCBpbnQgcHdtX2JhY2tsaWdodF9icmlnaHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmlj
ZSAqZGV2LAogfQogI2VuZGlmCiAKK3N0YXRpYyBib29sIHB3bV9iYWNrbGlnaHRfaXNfbGluZWFy
KHN0cnVjdCBwbGF0Zm9ybV9wd21fYmFja2xpZ2h0X2RhdGEgKmRhdGEpCit7CisJdW5zaWduZWQg
aW50IG5sZXZlbHMgPSBkYXRhLT5tYXhfYnJpZ2h0bmVzcyArIDE7CisJdW5zaWduZWQgaW50IG1p
bl92YWwgPSBkYXRhLT5sZXZlbHNbMF07CisJdW5zaWduZWQgaW50IG1heF92YWwgPSBkYXRhLT5s
ZXZlbHNbbmxldmVscyAtIDFdOworCS8qCisJICogTXVsdGlwbHlpbmcgYnkgMTI4IG1lYW5zIHRo
YXQgZXZlbiBpbiBwYXRob2xvZ2ljYWwgY2FzZXMgc3VjaAorCSAqIGFzIChtYXhfdmFsIC0gbWlu
X3ZhbCkgPT0gbmxldmVscyB0aGUgZXJyb3IgYXQgbWF4X3ZhbCBpcyBsZXNzCisJICogdGhhbiAx
JS4KKwkgKi8KKwl1bnNpZ25lZCBpbnQgc2xvcGUgPSAoMTI4ICogKG1heF92YWwgLSBtaW5fdmFs
KSkgLyBubGV2ZWxzOworCXVuc2lnbmVkIGludCBtYXJnaW4gPSAobWF4X3ZhbCAtIG1pbl92YWwp
IC8gMjA7IC8qIDUlICovCisJaW50IGk7CisKKwlmb3IgKGkgPSAxOyBpIDwgbmxldmVsczsgaSsr
KSB7CisJCXVuc2lnbmVkIGludCBsaW5lYXJfdmFsdWUgPSBtaW5fdmFsICsgKChpICogc2xvcGUp
IC8gMTI4KTsKKwkJdW5zaWduZWQgaW50IGRlbHRhID0gYWJzKGxpbmVhcl92YWx1ZSAtIGRhdGEt
PmxldmVsc1tpXSk7CisKKwkJaWYgKGRlbHRhID4gbWFyZ2luKQorCQkJcmV0dXJuIGZhbHNlOwor
CX0KKworCXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZShjb25zdCBzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQogewogCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSA9IHBiLT5kZXYtPm9mX25vZGU7CkBAIC01NjcsNiArNTkyLDExIEBA
IHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCiAJCQlwYi0+bGV2ZWxzID0gZGF0YS0+bGV2ZWxzOwogCQl9CisKKwkJaWYgKHB3bV9i
YWNrbGlnaHRfaXNfbGluZWFyKGRhdGEpKQorCQkJcHJvcHMuc2NhbGUgPSBCQUNLTElHSFRfU0NB
TEVfTElORUFSOworCQllbHNlCisJCQlwcm9wcy5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9OT05f
TElORUFSOwogCX0gZWxzZSBpZiAoIWRhdGEtPm1heF9icmlnaHRuZXNzKSB7CiAJCS8qCiAJCSAq
IElmIG5vIGJyaWdodG5lc3MgbGV2ZWxzIGFyZSBwcm92aWRlZCBhbmQgbWF4X2JyaWdodG5lc3Mg
aXMKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
