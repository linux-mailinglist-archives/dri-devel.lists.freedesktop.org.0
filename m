Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBD357CA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932A0895B5;
	Wed,  5 Jun 2019 07:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329EB892A1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:35 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s11so14279199pfm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBDB5XdTP7dfG6WE/Wv8QzDZU0TBBhHw3g3JoSOOGeQ=;
 b=MR4p5uzhlHE/Y757rmPAuZjy8/S9flA+LmpLea+xMoSojIfkEdBdmBla2yYkemqcO4
 jZ6zAmtdltPfc16kJ4DLA0fzfPkct/Oni3yb5Ul278UpViYNX79rYquSyGO1yl9TF6zn
 5ObFimt3+KvU4CZ5riW53p4uWMNjl/CaENMzq7iWy8DHA/b2GXuZt9zzlFQzl1tUnq/n
 1KcDiJTqN/g8fyEmHXe/wJzlIZOikx03xP8bVVIscobFRQT1I/seDmnmK7sIAKzJlCNH
 cAMBDMdpGmv+8y5py1Gn3PDz5q6/OL+RKuqR3PLLrAiIgprc4ykOdN4PLZyq97WL35DU
 HYEw==
X-Gm-Message-State: APjAAAXA78OyM1VEF3rhukJUF8z6BAXNtQEuo26Y7V3jdu3M/bRy2o7Y
 qbTvLdMKRUEWUoj+OEJeRXoh13Juyng=
X-Google-Smtp-Source: APXvYqxH12xJ9obmTAXnsJLtnkeZDdF8uUugVPCYIHscRNujwwAb3eWErduiCWaic9942Ye7N5I12g==
X-Received: by 2002:a63:fa4a:: with SMTP id g10mr2393869pgk.147.1559718334365; 
 Wed, 05 Jun 2019 00:05:34 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:33 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/15] drm/bridge: tc358767: Increase AUX transfer length
 limit
Date: Wed,  5 Jun 2019 00:05:00 -0700
Message-Id: <20190605070507.11417-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBDB5XdTP7dfG6WE/Wv8QzDZU0TBBhHw3g3JoSOOGeQ=;
 b=IsiW0dB95u8meFnmq6fBHoTrfdGSMbu7kMUi4sRnXRsKgAqQ0cY5rJTNe5IEvAos+f
 xPeHHQoLo1sebUFCqzWRJ24IYagKiDZFIZfmOu17ZHgwsMMT4sH82A93yb/0vwTBeHPR
 U83nZrZ1X8xCacIMORgBKfMxy+NZh+1b4fIB2gPNFLQwY4hXhsUawBmB/L8MC3ZXU6E3
 px9cJZkZPMPYVVmaKu0Floi6r8QP4KOhK5VmjP8QDdFpxd8Cwz/3Z4aaxKC0FPosMwve
 2xAa5AQ/yvaLI18Z13lqFMuMHedoUFKLXr02tsTQ2HnlYCdks5kegmgKTTUBv/ku76Q5
 OURg==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgdGMzNTg3NjcgY2FuIHRyYW5zZmVyIHVwIHRvIDE2
IGJ5dGVzIHZpYQppdHMgQVVYIGNoYW5uZWwsIHNvIHRoZSBhcnRpZmljaWFsIGxpbWl0IG9mIDgg
YXBwZXJhcyB0byBiZSB0b28KbG93LiBIb3dldmVyIG9ubHkgdXAgdG8gMTUtYnl0ZXMgc2VlbSB0
byBiZSBhY3R1YWxseSBzdXBwb3J0ZWQgYW5kCnRyeWluZyB0byB1c2UgMTYtYnl0ZSB0cmFuc2Zl
cnMgcmVzdWx0cyBpbiB0cmFuc2ZlcnMgZmFpbGluZwpzcG9yYWRpY2FsbHkgKHdpdGggYm9ndXMg
c3RhdHVzIGluIGNhc2Ugb2YgSTJDIHRyYW5zZmVycyksIHNvIGxpbWl0IGl0CnRvIDE1LgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV5IFNtaXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KQ2M6
IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNjOiBBbmRyemVqIEhhamRh
IDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRl
ZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ29y
eSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlzIEhlYWx5IDxjcGhlYWx5QGdt
YWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwppbmRleCAyNjBmYmNkMDI3MWUuLjAxMjVlMmY3ZTA3NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwpAQCAtMzc0LDcgKzM3NCw3IEBAIHN0YXRpYyBzc2l6ZV90IHRjX2F1
eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCQkJICAgICAgIHN0cnVjdCBkcm1f
ZHBfYXV4X21zZyAqbXNnKQogewogCXN0cnVjdCB0Y19kYXRhICp0YyA9IGF1eF90b190YyhhdXgp
OwotCXNpemVfdCBzaXplID0gbWluX3Qoc2l6ZV90LCA4LCBtc2ctPnNpemUpOworCXNpemVfdCBz
aXplID0gbWluX3Qoc2l6ZV90LCBEUF9BVVhfTUFYX1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNp
emUpOwogCXU4IHJlcXVlc3QgPSBtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1Q7CiAJaW50
IHJldDsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
