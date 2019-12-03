Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD31C1100E8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AAC6E9C5;
	Tue,  3 Dec 2019 15:12:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:12:10 UTC
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8A66E9C4
 for <dri-devel@freedesktop.org>; Tue,  3 Dec 2019 15:12:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9865C433CB
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] Add support for A618 GPU
Date: Tue, 3 Dec 2019 15:06:06 +0000
Message-ID: <0101016ecc4c0ad1-015a0892-bb75-4bef-9dd5-e94e008a71e3-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.03-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385566;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=REa2Wa+tZ8FM7aOChhcPh7CiUHkIY9nJS/XdLBVzv/0=;
 b=CdN2SWIfMdOvrrBpuHCZnOJ9oJ7h24/fT5ePKv267BLprg+4V3RF6B4nrx6E4x+/
 Xoe1wno4z0EJjZyMSM9PoJpG6XfXvPYezgGYtmkQqs8WO5wxKh6L726Y+c7oe9nnA6F
 frVIZSJa9ecbI4lJGfn6TzWGtE41k4OPC/HF7ELk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385566;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=REa2Wa+tZ8FM7aOChhcPh7CiUHkIY9nJS/XdLBVzv/0=;
 b=AzZSeMMAIL+TxaxUQXnuLTz08SmmU7tkzCKkz1ruBVgzyGoWK/DusbYk00+daS0L
 MPAkoZcRb0cujXaFCnpHkLq4NQ2BJIUNES22gqTPmmi6fWMd97u9acdv2WdW/HV8Jwq
 7tV0KP7Nxh8EtjKIC1RUCJvJTUhoY/paVN4RQ8Os=
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

VGhpcyBzZXJpZXMgYW5kIHN1cHBvcnQgdG8gZW5hYmxlIEE2MTggR1BVIHJldmlzaW9uLiBQbGVh
c2UgcmV2aWV3LgoKU2hhcmF0IE1hc2V0dHkgKDUpOgogIGRybTogbXNtOiBBZGQgNjE4IGdwdSB0
byB0aGUgYWRyZW5vIGdwdSBsaXN0CiAgZHJtOiBtc206IGE2eHg6IEFkZCBzdXBwb3J0IGZvciBB
NjE4CiAgZHJtOiBtc206IGE2eHg6IER1bXAgR0JJRiByZWdpc3RlcnMsIGRlYnVnYnVzIGluIGdw
dSBzdGF0ZQogIGRybTogbXNtOiBhNnh4OiBmaXggZGVidWcgYnVzIHJlZ2lzdGVyIGNvbmZpZ3Vy
YXRpb24KICBhcm06IGR0czogc2M3MTgwOiBBZGQgQTYxOCBncHUgZHQgYmxvYgoKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcWNvbS9zYzcxODAuZHRzaSAgICAgICAgfCAxMTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eC54bWwuaCAgICAg
ICB8ICA1MiArKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jICAgICAgIHwgIDI0ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHUuYyAgICAgICB8ICA3MCArKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9ncHUuaCAgICAgICB8ICAgOSArKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E2eHhfZ3B1X3N0YXRlLmMgfCAgNzYgKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5oIHwgIDE2ICsrKy0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyAgfCAgMTEgKysrCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmggICAgIHwgIDEyICsrLQogOSBmaWxlcyBjaGFuZ2Vk
LCAzNDggaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgotLQoxLjkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
