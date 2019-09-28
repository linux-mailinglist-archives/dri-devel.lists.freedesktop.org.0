Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319CC0F23
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 03:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B96D6E102;
	Sat, 28 Sep 2019 01:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7216E102
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 01:28:58 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id A4A9461544; Sat, 28 Sep 2019 01:28:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jsanka@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DECE9611DC;
 Sat, 28 Sep 2019 01:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DECE9611DC
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Add framebuffer max width/height fields to drm_mode_config
Date: Fri, 27 Sep 2019 18:28:50 -0700
Message-Id: <1569634131-13875-1-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569634138;
 bh=kbPZarCkYnlJWtdPyEyjjRJbhqhbOcPRYQvgulMnMvY=;
 h=From:To:Cc:Subject:Date:From;
 b=O0L0ahWkKvLy6IZGm3VGL/RvsTxlYN41OBCib2zthF35LJ6AufeCnvVlpxMKsSCVf
 9CSQ1/1pRUq23Z+PTxErUhLG/+BKtAZzcyUhPH/aOJv58t5L7uBgPeAIM1wKeMZXVz
 Tf8JQDuMvPwoa/7EcEPHvZ3E5yKHNcTQbzDtCtO8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1569634138;
 bh=kbPZarCkYnlJWtdPyEyjjRJbhqhbOcPRYQvgulMnMvY=;
 h=From:To:Cc:Subject:Date:From;
 b=O0L0ahWkKvLy6IZGm3VGL/RvsTxlYN41OBCib2zthF35LJ6AufeCnvVlpxMKsSCVf
 9CSQ1/1pRUq23Z+PTxErUhLG/+BKtAZzcyUhPH/aOJv58t5L7uBgPeAIM1wKeMZXVz
 Tf8JQDuMvPwoa/7EcEPHvZ3E5yKHNcTQbzDtCtO8=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jsanka@codeaurora.org
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
Cc: seanpaul@chromium.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVsb3cgdHdvIGRpc2N1c3Npb24gdGhyZWFkcyB3aWxsIHByb3ZpZGUgdGhlIGNvbnRleHQgYmVo
aW5kIHRoaXMgcGF0Y2guCgpodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwv
bXNnMjI5MDcwLmh0bWwKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLW1zbS9kYjI2
MTQ1Yi0zZjY0LWEzMzQtZjY5OC03NmY5NzIzMzI4ODFAYmF5bGlicmUuY29tL1QvCgpTZXBlcmF0
aW5nIG91dCB0aGUgY29yZSBmcmFtZXdvcmsgcGF0Y2ggZnJvbSB2ZW5kb3IgaW1wbGVtZW50YXRp
b24uCgpKZXlrdW1hciBTYW5rYXJhbiAoMSk6CiAgZHJtOiBhZGQgZmIgbWF4IHdpZHRoL2hlaWdo
dCBmaWVsZHMgdG8gZHJtX21vZGVfY29uZmlnCgogZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1
ZmZlci5jIHwgMTcgKysrKysrKysrKysrKy0tLS0KIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZp
Zy5oICAgICB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBh
IG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xs
YWJvcmF0aXZlIFByb2plY3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
