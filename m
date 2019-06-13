Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9B44C77
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 21:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43F7892C2;
	Thu, 13 Jun 2019 19:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB19D892C2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:43:37 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so12440510pfe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pqXyxTTAbi5aST0rw8BM87gXyR3d1+ROgexg6G5YkyQ=;
 b=jCJ5Sirp+D+tnVPhigDuJDMKYw5RvFz1uBt4B9HLCJEkmd4CuxRyJjz46JJG/esaq+
 Wu5wBTBxj1kSw2SiXULDxBVVENgax+rmxGHHmtNHnya3DrL50ZKnUx5Q8V/HmWZMb+Yt
 MHaIXc3vYeR3upN5Blsco1TALqvi4ieZTYOVdlWlSIJgn2cUi2PqqraTTLpSMsw6wGZz
 MDgYE4CUw4wC+1LndIlBWxKqq1sLwOaPGcW8C9ALmQVM+iU3UcgY1xPk0vhzCrouwTnU
 /MSHJdlciJxNYqg0gFYJooWDE/4XfSxjFxOQybA8iebpqUHY2DD/VDOUoWPBjMRu+v8d
 xuNw==
X-Gm-Message-State: APjAAAWZbbOzh5h3r1nGUwweTO4SNtOZk3ylulG6MMVFFwt4UgTcLQOY
 KAIelFHXLyDhNvDQgMuPZpwUXQ==
X-Google-Smtp-Source: APXvYqyj6R9zaxDLlDqwPo077OY+vPSo/K4pYOSOfb40+7Tt58DAXZ7DMLGY75TjBV8lSKyivOQt1Q==
X-Received: by 2002:a17:90a:898e:: with SMTP id
 v14mr7218671pjn.119.1560455017445; 
 Thu, 13 Jun 2019 12:43:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id 5sm557967pgi.28.2019.06.13.12.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 12:43:37 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 4/4] backlight: pwm_bl: Set scale type for brightness curves
 specified in the DT
Date: Thu, 13 Jun 2019 12:43:26 -0700
Message-Id: <20190613194326.180889-5-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613194326.180889-1-mka@chromium.org>
References: <20190613194326.180889-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pqXyxTTAbi5aST0rw8BM87gXyR3d1+ROgexg6G5YkyQ=;
 b=g7PzxI3g42K7LJ1ywDPo6EXnhLkUuGu9zje5jOJWOtwmgEfQQqo/EhoS1ZZt31I04+
 fL1PiB7Ex9sJ7fFijAjKJXwHIRQGwUDJKGx1a2snaLaeGJ5l7VIa4Ae5wrAbEPSfcrWL
 huLjIf47PLe+/0vlbh03Nc3iTlYmithF5Qyts=
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
YXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9wd21fYmwuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwppbmRleCBm
MDY3ZmU3YWEzNWQuLjkxMjQwN2I2ZDY3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKQEAg
LTQwNCw2ICs0MDQsMjYgQEAgaW50IHB3bV9iYWNrbGlnaHRfYnJpZ2h0bmVzc19kZWZhdWx0KHN0
cnVjdCBkZXZpY2UgKmRldiwKIH0KICNlbmRpZgogCitzdGF0aWMgYm9vbCBwd21fYmFja2xpZ2h0
X2lzX2xpbmVhcihzdHJ1Y3QgcGxhdGZvcm1fcHdtX2JhY2tsaWdodF9kYXRhICpkYXRhKQorewor
CXVuc2lnbmVkIGludCBubGV2ZWxzID0gZGF0YS0+bWF4X2JyaWdodG5lc3MgKyAxOworCXVuc2ln
bmVkIGludCBtaW5fdmFsID0gZGF0YS0+bGV2ZWxzWzBdOworCXVuc2lnbmVkIGludCBtYXhfdmFs
ID0gZGF0YS0+bGV2ZWxzW25sZXZlbHMgLSAxXTsKKwl1bnNpZ25lZCBpbnQgc2xvcGUgPSAoMTAw
ICogKG1heF92YWwgLSBtaW5fdmFsKSkgLyBubGV2ZWxzOworCXVuc2lnbmVkIGludCBtYXJnaW4g
PSAobWF4X3ZhbCAtIG1pbl92YWwpIC8gMjA7IC8qIDUlICovCisJaW50IGk7CisKKwlmb3IgKGkg
PSAxOyBpIDwgbmxldmVsczsgaSsrKSB7CisJCXVuc2lnbmVkIGludCBsaW5lYXJfdmFsdWUgPSBt
aW5fdmFsICsgKChpICogc2xvcGUpIC8gMTAwKTsKKwkJdW5zaWduZWQgaW50IGRlbHRhID0gYWJz
KGxpbmVhcl92YWx1ZSAtIGRhdGEtPmxldmVsc1tpXSk7CisKKwkJaWYgKGRlbHRhID4gbWFyZ2lu
KQorCQkJcmV0dXJuIGZhbHNlOworCX0KKworCXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgaW50
IHB3bV9iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZShjb25zdCBzdHJ1Y3QgcHdtX2JsX2Rh
dGEgKnBiKQogewogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBiLT5kZXYtPm9mX25vZGU7
CkBAIC01NjcsNiArNTg3LDExIEBAIHN0YXRpYyBpbnQgcHdtX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJCQlwYi0+bGV2ZWxzID0gZGF0YS0+bGV2ZWxz
OwogCQl9CisKKwkJaWYgKHB3bV9iYWNrbGlnaHRfaXNfbGluZWFyKGRhdGEpKQorCQkJcHJvcHMu
c2NhbGUgPSBCQUNLTElHSFRfU0NBTEVfTElORUFSOworCQllbHNlCisJCQlwcm9wcy5zY2FsZSA9
IEJBQ0tMSUdIVF9TQ0FMRV9OT05fTElORUFSOwogCX0gZWxzZSBpZiAoIWRhdGEtPm1heF9icmln
aHRuZXNzKSB7CiAJCS8qCiAJCSAqIElmIG5vIGJyaWdodG5lc3MgbGV2ZWxzIGFyZSBwcm92aWRl
ZCBhbmQgbWF4X2JyaWdodG5lc3MgaXMKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdv
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
