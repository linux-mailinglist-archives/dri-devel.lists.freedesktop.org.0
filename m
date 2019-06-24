Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837951C57
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B319189DC2;
	Mon, 24 Jun 2019 20:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAA89DBC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:31:22 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so8154713pff.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JP95lZdX+e5+GJVUv6OxKodaA7GTVH/s6o/zZ4o6Yqk=;
 b=KXhlw+DTX+gwmBLyHIgEs4OjFi8cgEJorsNGx0mNJlnUHll83zYX0vN/hvdyXAvcdz
 sxILtT4S0cm+rKKsKDZH9QlMXXonoiXpVKNRHoQhcVZVkX0xv7K7ynJToR4K3v7Rvi6X
 wH3Ia+V+qXUkook7Gvossf4yAG8WCDu97qWvWyHDrKw/4IVbQe3GrzqXdvjxeIX9eG0v
 PF5LWg6q1/JWjEq8FZkrJPqAXz8ViTBPwN22bEnee2W7dhLFbkqajrEsvZVtUZbmApkN
 tE38mEdXuNmPZBH451l0ouqk05T8aBsulgka9pEVQYwzwdZitQFchsgZC7t6XBd2Qoyj
 ubjw==
X-Gm-Message-State: APjAAAWgQ3rQu2yZlRmWwvem8HoGHo8WSRXv4tG+LPMYIz2htqokQfSP
 PQno6YdlrEzFLq85J8cSXFL/cw==
X-Google-Smtp-Source: APXvYqw9jBap6wGYgRpzAJeJ6bDMEgATfqj/PCB+aRPwnHh0ax4ayLJ9RddKSYOnMpDP5vtjzzt8pg==
X-Received: by 2002:a17:90a:cd04:: with SMTP id
 d4mr27797860pju.128.1561408281769; 
 Mon, 24 Jun 2019 13:31:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id r198sm6217026pfc.149.2019.06.24.13.31.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:31:21 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI
 documentation
Date: Mon, 24 Jun 2019 13:31:10 -0700
Message-Id: <20190624203114.93277-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190624203114.93277-1-mka@chromium.org>
References: <20190624203114.93277-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JP95lZdX+e5+GJVUv6OxKodaA7GTVH/s6o/zZ4o6Yqk=;
 b=GH6GaNaGuD+3/lq/E8qiZgIhrqY4POMDMF6xHbas+S9+1gjPhAdu+raSlGPuBLqD9g
 BkKsc+XCH1g3Z10BQaTguBLuGNZWvrF/v7D7o9CGRm3XNhjIs+7yeIKYYcTpDmT9I9R8
 CIvyVtU+X72CfuHwtLu5CTf7kBuk4/yEwY9wE=
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

QWRkIGFuIGVudHJ5IGZvciB0aGUgc3RhYmxlIGJhY2tsaWdodCBzeXNmcyBBQkkgdG8gdGhlIE1B
SU5UQUlORVJTCmZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNo
cm9taXVtLm9yZz4KQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIGFkZGVkIERhbmllbCdzICdBY2tlZC1ieScg
dGFnCi0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNTdmNDk2Y2Zm
OTk5Li5kNTFlNzQzNDA4NzAgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlO
RVJTCkBAIC0yODU3LDYgKzI4NTcsNyBAQCBGOglkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC8KIEY6
CWluY2x1ZGUvbGludXgvYmFja2xpZ2h0LmgKIEY6CWluY2x1ZGUvbGludXgvcHdtX2JhY2tsaWdo
dC5oCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQK
K0Y6CURvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1jbGFzcy1iYWNrbGlnaHQKIAogQkFU
TUFOIEFEVkFOQ0VECiBNOglNYXJlayBMaW5kbmVyIDxtYXJla2xpbmRuZXJAbmVvbWFpbGJveC5j
aD4KLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
