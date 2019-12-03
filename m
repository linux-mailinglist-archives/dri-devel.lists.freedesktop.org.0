Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A221F110140
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C16E9D1;
	Tue,  3 Dec 2019 15:28:34 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 742 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:28:32 UTC
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14416E9D1
 for <dri-devel@freedesktop.org>; Tue,  3 Dec 2019 15:28:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52C55C447A5
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm: msm: Add 618 gpu to the adreno gpu list
Date: Tue, 3 Dec 2019 15:16:09 +0000
Message-ID: <0101016ecc5541ff-6eb4a795-490a-435f-8585-756ce312e27a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386170;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=D0w2lJ7zOzLs96FDLoCJTUH+DP86bo5IYfSP2DOwF9k=;
 b=jbpApyD5cFZ1QDjAEynBdWVtQ1O3ZEKWiIP7zFjzz9S00ta5Km7R4WC+nuZLW3+5
 Q9uFhee9bYpM8YzQQY+AhxQ8i4q50jnLLrlI2a11tyiVnYwiA1trUM3wlz1wTi0j7vH
 0/p2Vw9Mvrd4GsVQTF8g0+8dVhtPbQGaY8/eazko=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386170;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=D0w2lJ7zOzLs96FDLoCJTUH+DP86bo5IYfSP2DOwF9k=;
 b=gwyMw/Zp8Z6mHkkQQ7VM47vR/QBdOVnP+I2ISkspPwvwV8ty3taX5JD4s2k/iJck
 i3bzbcazSFB6+0zPHkL0TpF9pAN2S/dfkXWcy9HamKtEag0/57kghjrvFAldX4isjnw
 b0WE6wYDnJGA6EcNZVWJuNxC1L0YsO/0/mjJFoqY=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIEFkcmVubyA2MTggZW50cnkgYW5kIGl0cyBhc3NvY2lhdGVkIHByb3Bl
cnRpZXMKdG8gdGhlIGdwdWxpc3QgZW50cmllcy4KClNpZ25lZC1vZmYtYnk6IFNoYXJhdCBNYXNl
dHR5IDxzbWFzZXR0eUBjb2RlYXVyb3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZGV2aWNlLmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
ZHJlbm9fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNl
LmMKaW5kZXggMDg4OGUwZC4uZTcyOGVhNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYWRyZW5vX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYwpAQCAtMTUyLDYgKzE1MiwxNyBAQAogCQkuaW5pdCA9IGE1eHhfZ3B1
X2luaXQsCiAJCS56YXBmdyA9ICJhNTQwX3phcC5tZHQiLAogCX0sIHsKKwkJLnJldiA9IEFEUkVO
T19SRVYoNiwgMSwgOCwgQU5ZX0lEKSwKKwkJLnJldm4gPSA2MTgsCisJCS5uYW1lID0gIkE2MTgi
LAorCQkuZncgPSB7CisJCQlbQURSRU5PX0ZXX1NRRV0gPSAiYTYzMF9zcWUuZnciLAorCQkJW0FE
UkVOT19GV19HTVVdID0gImE2MzBfZ211LmJpbiIsCisJCX0sCisJCS5nbWVtID0gU1pfNTEySywK
KwkJLmluYWN0aXZlX3BlcmlvZCA9IERSTV9NU01fSU5BQ1RJVkVfUEVSSU9ELAorCQkuaW5pdCA9
IGE2eHhfZ3B1X2luaXQsCisJfSwgewogCQkucmV2ID0gQURSRU5PX1JFVig2LCAzLCAwLCBBTllf
SUQpLAogCQkucmV2biA9IDYzMCwKIAkJLm5hbWUgPSAiQTYzMCIsCi0tCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
