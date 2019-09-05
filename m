Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3CAB2DE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877736E184;
	Fri,  6 Sep 2019 07:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FAA6E121;
 Thu,  5 Sep 2019 18:33:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l16so3875836wrv.12;
 Thu, 05 Sep 2019 11:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=B5O8eGkbGw+ETECQevuBRCR0HQOeLcREPjZ6QhzTv+c=;
 b=XwXpW4cW0ZD9lF4L5BP57k8/nu3Lt5lP4lkV7LPjH+a2He/z7iMzAmRqwMhkY+IZiG
 lk/pYnFKVzK9CTmqugZbxVKmzQNKAnzL1QaRklMvJrrfJdF6IcccKh67+w8Ilq1ycv0R
 uEmnwB8DLqNEOVOPkPVCbAUlsJGuj/cqI+ZvVSHPBykzwvGBZmnw/lF/gAs7ExXZSSPZ
 vaJtpZP5OcPI5tH8eQsLwMaOrZAK967wzenbmezeKtzbLxG7vs/+q/ej0hAkgw63Yd4n
 Kxcw+GfunHsyNJwS/v9HIKXJWTPTwRi63qbDBs+ZC+jiN8zoSCvBY8zAZ9N0Hstam6mJ
 UapQ==
X-Gm-Message-State: APjAAAUZyR277Yi8KRnkCqyU/HWsFoBp6PY7V0Ix6Fw2nmJWM60NpIy+
 OlT8cvuR7sFmd7pFPiYeTJg=
X-Google-Smtp-Source: APXvYqx+x9GUtN1lafnRmnXBSsfRNt5BA2TCgYoqdrKwy2zQ5dAjLgpIHWfDFQEmcv3vzIlepZ6/tw==
X-Received: by 2002:adf:9050:: with SMTP id h74mr3739633wrh.191.1567708389260; 
 Thu, 05 Sep 2019 11:33:09 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de.
 [91.64.150.195])
 by smtp.gmail.com with ESMTPSA id o22sm5997845wra.96.2019.09.05.11.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 11:33:08 -0700 (PDT)
From: Krzysztof Wilczynski <kw@linux.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Move static keyword to the front of
 declaration
Date: Thu,  5 Sep 2019 20:33:06 +0200
Message-Id: <20190905183306.32670-1-kw@linux.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5O8eGkbGw+ETECQevuBRCR0HQOeLcREPjZ6QhzTv+c=;
 b=Vmsh8nYxnAh2orLd9VI9I62UBJ6glfX/55rAjzstLrdFRdhaw5ET8IGXbqkKIZ59vS
 iHkfgmCqjZnoS0r9kpEWt4IyjeNE7dO/HGlzmJWqno8p8FSjJQwBEAxfdD83PG+hrE2+
 I/S27/3KA+hzqQNIw29MPHO4Gt/qiufVujeeMafwUCNpWmw1Bby3/Xp7EJ9ppnC1ZddH
 Yyb+XzhE3D3wBD99xpBqMw0bw+JU+3IT3tw2w+3pLq+thSPkDS+8MKShOywUd9sy3FWp
 7Kq84cbsEUYcWzOJ1RczkqxM6rIhVRPxGhHJO5DzEjGD2dVHIcuOzM7Zva/Spudqaian
 TcNA==
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
Cc: Chris Park <Chris.Park@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Aidan Wood <Aidan.Wood@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <anthony.koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSB0aGUgc3RhdGljIGtleXdvcmQgdG8gdGhlIGZyb250IG9mIGRlY2xhcmF0aW9uIG9mIERD
X0JVSUxEX0lELAphbmQgcmVzb2x2ZSB0aGUgZm9sbG93aW5nIGNvbXBpbGVyIHdhcm5pbmcgdGhh
dCBjYW4gYmUgc2VlbiB3aGVuCmJ1aWxkaW5nIHdpdGggd2FybmluZ3MgZW5hYmxlZCAoVz0xKToK
CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kYy5jOjc1OjE6
IHdhcm5pbmc6CiAg4oCYc3RhdGlj4oCZIGlzIG5vdCBhdCBiZWdpbm5pbmcgb2YgZGVjbGFyYXRp
b24gWy1Xb2xkLXN0eWxlLWRlY2xhcmF0aW9uXQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdp
bGN6eW5za2kgPGt3QGxpbnV4LmNvbT4KLS0tClJlbGF0ZWQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAxOTA4MjcyMzMwMTcuR0s5OTg3QGdvb2dsZS5jb20KCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMKaW5kZXggODdjYTVhMjkwZDEyLi5hNWE4OWJjMGUxZDEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAtNzIsNyArNzIsNyBAQAogI2RlZmluZSBEQ19M
T0dHRVIgXAogCWRjLT5jdHgtPmxvZ2dlcgogCi1jb25zdCBzdGF0aWMgY2hhciBEQ19CVUlMRF9J
RFtdID0gInByb2R1Y3Rpb24tYnVpbGQiOworc3RhdGljIGNvbnN0IGNoYXIgRENfQlVJTERfSURb
XSA9ICJwcm9kdWN0aW9uLWJ1aWxkIjsKIAogLyoqCiAgKiBET0M6IE92ZXJ2aWV3Ci0tIAoyLjIy
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
