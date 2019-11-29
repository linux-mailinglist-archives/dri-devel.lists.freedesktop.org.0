Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB610D218
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 08:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0398A6E893;
	Fri, 29 Nov 2019 07:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 739 seconds by postgrey-1.36 at gabe;
 Fri, 29 Nov 2019 07:52:11 UTC
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569A96E891;
 Fri, 29 Nov 2019 07:52:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FA06C433A2
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] rnndb: Add GBIF registers for a6xx GPU
Date: Fri, 29 Nov 2019 07:39:49 +0000
Message-ID: <0101016eb61a06b4-ab4b5804-7373-401f-a67f-6b7371fcc811-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.11.29-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575013189;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=ZbBL0YlCdFMCj/S3gwNbtzQ3ZaZijak+AHAvDHCVEKg=;
 b=W/AF3OpRYlzQZM9VE589x7dBv7c2emjwjXj/YWcEt/kfaM6oGPMeH8HzWBfkYhYB
 AIFWJnX0SDXryrDipdPN0cPwnqSmyY81DIH6iXnq2/qZbhdpvjfFp5QsyuHFnOt6DCS
 fNjL3XjPqHecXSBqre2k+ydKn5oMN81eY9uoxN1M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575013189;
 h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
 bh=ZbBL0YlCdFMCj/S3gwNbtzQ3ZaZijak+AHAvDHCVEKg=;
 b=APvNEZH0SgAZadPI/grxZQk5mh+hovz92ZOjTlQ4/7ELyMVCwoU+W2tofteMZpyZ
 WOHZ8C0EV2MyGbJl80ktYGC7PbwbpHo2ZokyOmQuqbfQb2LS4AKQq8bhvwjyGx5SJuT
 U8O/eAvMhCZ+awrHcXhfqXd4G5nJRGA7SQ0UOuJQ=
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
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEdCSUYgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgcmVxdWlyZWQgdG8gaW1wbGVtZW50IGE2MTgK
R1BVIHJldmlzaW9uCgpTaWduZWQtb2ZmLWJ5OiBTaGFyYXQgTWFzZXR0eSA8c21hc2V0dHlAY29k
ZWF1cm9yYS5vcmc+Ci0tLQogcm5uZGIvYWRyZW5vL2E2eHgueG1sIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvcm5uZGIvYWRyZW5vL2E2eHgueG1sIGIvcm5uZGIvYWRyZW5vL2E2eHgueG1sCmluZGV4
IDc0N2YwNzEuLjJkMjA2M2EgMTAwNjQ0Ci0tLSBhL3JubmRiL2FkcmVuby9hNnh4LnhtbAorKysg
Yi9ybm5kYi9hZHJlbm8vYTZ4eC54bWwKQEAgLTE3NDgsNiArMTc0OCwzMiBAQCB0byB1cGNvbnZl
cnQgdG8gMzJiIGZsb2F0IGludGVybmFsbHk/CiAJPHJlZzMyIG9mZnNldD0iMHgzMTE5IiBuYW1l
PSJWQklGX1BFUkZfUFdSX0NOVF9ISUdIMSIvPgogCTxyZWczMiBvZmZzZXQ9IjB4MzExYSIgbmFt
ZT0iVkJJRl9QRVJGX1BXUl9DTlRfSElHSDIiLz4KIAorCTwhLS0gR0JJRiByZWdpc3RlcnMgLS0+
CisJPHJlZzMyIG9mZnNldD0iMHgzYzAyIiBuYW1lPSJHQklGX1NDQUNIRV9DTlRMMSIvPgorCTxy
ZWczMiBvZmZzZXQ9IjB4M2MwMyIgbmFtZT0iR0JJRl9RU0JfU0lERTAiLz4KKwk8cmVnMzIgb2Zm
c2V0PSIweDNjMDQiIG5hbWU9IkdCSUZfUVNCX1NJREUxIi8+CisJPHJlZzMyIG9mZnNldD0iMHgz
YzA1IiBuYW1lPSJHQklGX1FTQl9TSURFMiIvPgorCTxyZWczMiBvZmZzZXQ9IjB4M2MwNiIgbmFt
ZT0iR0JJRl9RU0JfU0lERTMiLz4KKwk8cmVnMzIgb2Zmc2V0PSIweDNjNDUiIG5hbWU9IkdCSUZf
SEFMVCIvPgorCTxyZWczMiBvZmZzZXQ9IjB4M2M0NiIgbmFtZT0iR0JJRl9IQUxUX0FDSyIvPgor
CisJPHJlZzMyIG9mZnNldD0iMHgzY2MwIiBuYW1lPSJHQklGX1BFUkZfUFdSX0NOVF9FTiIvPgor
CTxyZWczMiBvZmZzZXQ9IjB4M2NjMiIgbmFtZT0iR0JJRl9QRVJGX0NOVF9TRUwiLz4KKwk8cmVn
MzIgb2Zmc2V0PSIweDNjYzMiIG5hbWU9IkdCSUZfUEVSRl9QV1JfQ05UX1NFTCIvPgorCTxyZWcz
MiBvZmZzZXQ9IjB4M2NjNCIgbmFtZT0iR0JJRl9QRVJGX0NOVF9MT1cwIi8+CisJPHJlZzMyIG9m
ZnNldD0iMHgzY2M1IiBuYW1lPSJHQklGX1BFUkZfQ05UX0xPVzEiLz4KKwk8cmVnMzIgb2Zmc2V0
PSIweDNjYzYiIG5hbWU9IkdCSUZfUEVSRl9DTlRfTE9XMiIvPgorCTxyZWczMiBvZmZzZXQ9IjB4
M2NjNyIgbmFtZT0iR0JJRl9QRVJGX0NOVF9MT1czIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2M4
IiBuYW1lPSJHQklGX1BFUkZfQ05UX0hJR0gwIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2M5IiBu
YW1lPSJHQklGX1BFUkZfQ05UX0hJR0gxIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2NhIiBuYW1l
PSJHQklGX1BFUkZfQ05UX0hJR0gyIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2NiIiBuYW1lPSJH
QklGX1BFUkZfQ05UX0hJR0gzIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2NjIiBuYW1lPSJHQklG
X1BXUl9DTlRfTE9XMCIvPgorCTxyZWczMiBvZmZzZXQ9IjB4M2NjZCIgbmFtZT0iR0JJRl9QV1Jf
Q05UX0xPVzEiLz4KKwk8cmVnMzIgb2Zmc2V0PSIweDNjY2UiIG5hbWU9IkdCSUZfUFdSX0NOVF9M
T1cyIi8+CisJPHJlZzMyIG9mZnNldD0iMHgzY2NmIiBuYW1lPSJHQklGX1BXUl9DTlRfSElHSDAi
Lz4KKwk8cmVnMzIgb2Zmc2V0PSIweDNjZDAiIG5hbWU9IkdCSUZfUFdSX0NOVF9ISUdIMSIvPgor
CTxyZWczMiBvZmZzZXQ9IjB4M2NkMSIgbmFtZT0iR0JJRl9QV1JfQ05UX0hJR0gyIi8+CiAJPCEt
LSBtb3ZlL3JlbmFtZSB0aGVzZS4uIC0tPgogCiAJPHJlZzMyIG9mZnNldD0iMHg4OGQ0IiBuYW1l
PSJSQl9XSU5ET1dfT0ZGU0VUMiIgdHlwZT0iYWRyZW5vX3JlZ194eSIvPgotLSAKMS45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
