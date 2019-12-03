Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E21110150
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 16:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968C36E9D8;
	Tue,  3 Dec 2019 15:30:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
X-Greylist: delayed 877 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:30:41 UTC
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75046E9D4
 for <dri-devel@freedesktop.org>; Tue,  3 Dec 2019 15:30:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25712C4479F
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] Add support for A618 GPU
Date: Tue, 3 Dec 2019 15:16:03 +0000
Message-ID: <0101016ecc5529f2-3155d8b5-f4a3-4840-ae63-a5597ed0c061-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.12.03-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386163;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
 b=WWQa6+QlNSRcoip4lpQDxSI8d+Bz2gHA87bDWY/qmtl8JnyqwGI4dSlV3G71LOqQ
 E0MNlM70BSy3HUR8W9neYEmNQ9IGmBA77KG+vzIfZzrVuiqaT8SgJtusb0ZOGSDbSef
 AJJFVTFtsSnkPks/nubZdn04XJhBeOiMqcaUQCoI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386163;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=hpHeJVb7EJbjQPotxf9qoETKMkrBAc2t8j9KkouUgoc=;
 b=PjMsqOmkgixt41smCi4sBzoX3SWgPysAVF0MU2T7c0gBT1L2iZ/VQSdKsdgoS5df
 L///4B0Fy641gH780Yw91RN1zQswcU3ccjtlt7hN/QeLwFamK0L+KrGSA/6IoMD3Zga
 Og3hMJ5Qa7EJlq+Cy9gfazW0chzw+d+IC0HUyOp0=
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

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIEE2MTggR1BVLiBQbGVhc2UgcmV2aWV3LgoKU2hh
cmF0IE1hc2V0dHkgKDUpOgogIGRybTogbXNtOiBBZGQgNjE4IGdwdSB0byB0aGUgYWRyZW5vIGdw
dSBsaXN0CiAgZHJtOiBtc206IGE2eHg6IEFkZCBzdXBwb3J0IGZvciBBNjE4CiAgZHJtOiBtc206
IGE2eHg6IER1bXAgR0JJRiByZWdpc3RlcnMsIGRlYnVnYnVzIGluIGdwdSBzdGF0ZQogIGRybTog
bXNtOiBhNnh4OiBmaXggZGVidWcgYnVzIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24KICBhcm06IGR0
czogc2M3MTgwOiBBZGQgQTYxOCBncHUgZHQgYmxvYgoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9zYzcxODAuZHRzaSAgICAgICAgfCAxMTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eC54bWwuaCAgICAgICB8ICA1MiArKysrKysr
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jICAgICAgIHwgIDI0
ICsrKysrLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyAgICAgICB8ICA3
MCArKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUu
aCAgICAgICB8ICAgOSArKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0
YXRlLmMgfCAgNzYgKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdV9zdGF0ZS5oIHwgIDE2ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2FkcmVub19kZXZpY2UuYyAgfCAgMTEgKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
ZHJlbm9fZ3B1LmggICAgIHwgIDEyICsrLQogOSBmaWxlcyBjaGFuZ2VkLCAzNDggaW5zZXJ0aW9u
cygrKSwgMzggZGVsZXRpb25zKC0pCgotLQoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
