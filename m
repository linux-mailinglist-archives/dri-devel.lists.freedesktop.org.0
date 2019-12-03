Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411E1100E6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFFA6E9BD;
	Tue,  3 Dec 2019 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:11:55 UTC
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF296E9BD
 for <dri-devel@freedesktop.org>; Tue,  3 Dec 2019 15:11:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C6B6C447A1
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] drm: msm: Add 618 gpu to the adreno gpu list
Date: Tue, 3 Dec 2019 15:06:09 +0000
Message-ID: <0101016ecc4c16bb-cf7f33d2-f769-4c99-8686-3ca8761db59a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385569;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
 b=iThYSHSk00nqNjlugtejX4cHtINASom6C0aEdZVQlEDzPmPM7ahdEeuvQPv8VymZ
 Y+NawnDmKppj/V6TyoF6uX5Hj0OcsWcLTdb/ygkriemm9jLEFp0OoLpW7FLEpcPhn73
 QWifJ3DalsMH3G3DSyx7yxZsZhqqgzXj3cc8ilQY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385569;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=HdBA3U6/eIISRmvCxk1G8NAyQEuTQY3aLr9PX/rQf1A=;
 b=Q87n/MPWsX0qS+/t0Dm1BLiFKdELIEq+z9RO/Qn1rlyyzmRGwaiYonE8yU3DK14K
 PavOCuDLPSoxdQ0zv0zOH2Z0VwJV5CqWdbRBlHqVleR0+AO/JNxGP55F0ns2L/Xm2Rb
 rTHyfZD+akePbM86tL/r3YOMIQr4BV/Em2ESV+Ns=
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
cnRpZXMKdG8gdGhlIGdwdWxpc3QgZW50cmllcy4KCkNoYW5nZS1JZDogSWUxNGJhMDlmMzI1MTNi
YTZhNmM4ODJmZGEwZDk4ZWUxNzQyYjQ2ZDUKU2lnbmVkLW9mZi1ieTogU2hhcmF0IE1hc2V0dHkg
PHNtYXNldHR5QGNvZGVhdXJvcmEub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVu
b19kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwpp
bmRleCAwODg4ZTBkLi5lNzI4ZWE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRy
ZW5vX2RldmljZS5jCkBAIC0xNTIsNiArMTUyLDE3IEBACiAJCS5pbml0ID0gYTV4eF9ncHVfaW5p
dCwKIAkJLnphcGZ3ID0gImE1NDBfemFwLm1kdCIsCiAJfSwgeworCQkucmV2ID0gQURSRU5PX1JF
Vig2LCAxLCA4LCBBTllfSUQpLAorCQkucmV2biA9IDYxOCwKKwkJLm5hbWUgPSAiQTYxOCIsCisJ
CS5mdyA9IHsKKwkJCVtBRFJFTk9fRldfU1FFXSA9ICJhNjMwX3NxZS5mdyIsCisJCQlbQURSRU5P
X0ZXX0dNVV0gPSAiYTYzMF9nbXUuYmluIiwKKwkJfSwKKwkJLmdtZW0gPSBTWl81MTJLLAorCQku
aW5hY3RpdmVfcGVyaW9kID0gRFJNX01TTV9JTkFDVElWRV9QRVJJT0QsCisJCS5pbml0ID0gYTZ4
eF9ncHVfaW5pdCwKKwl9LCB7CiAJCS5yZXYgPSBBRFJFTk9fUkVWKDYsIDMsIDAsIEFOWV9JRCks
CiAJCS5yZXZuID0gNjMwLAogCQkubmFtZSA9ICJBNjMwIiwKLS0gCjEuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
