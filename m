Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794D11938F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FFB6E95B;
	Tue, 10 Dec 2019 21:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BA26E95B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:13:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84AE12077B;
 Tue, 10 Dec 2019 21:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012402;
 bh=V+vvRML/SZghVHDbOg+jjdRXMepQC3mzOMs2iv2J2Dw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CnEGJDfuJCzGFwb+YLJoHTIwYzeddXQW6q1wJfTiyXuqCautXgmMYUBME6jNN/ZBi
 1E+cpzdWsFmzZ72N4oD83e2A91JBbL3YeQBjxwhfzMXXPyP+JUI6SQ4NUS8XveXiDC
 e3v7rI0RiMwCN8YMhFdTVDaZEaaBChHWfWnhEiSQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 321/350] fbtft: Make sure string is NULL terminated
Date: Tue, 10 Dec 2019 16:07:06 -0500
Message-Id: <20191210210735.9077-282-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+
CgpbIFVwc3RyZWFtIGNvbW1pdCAyMWY1ODU0ODBkZWI0YmNmMGQ5MmIwODg3OWMzNWQwNjZkZmVl
MDMwIF0KCk5ldyBHQ0Mgd2FybnMgYWJvdXQgaW5hcHByb3ByaWF0ZSB1c2Ugb2Ygc3RybmNweSgp
OgoKZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYzogSW4gZnVuY3Rpb24g4oCYZmJ0
ZnRfZnJhbWVidWZmZXJfYWxsb2PigJk6CmRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3Jl
LmM6NjY1OjI6IHdhcm5pbmc6IOKAmHN0cm5jcHnigJkgc3BlY2lmaWVkIGJvdW5kIDE2IGVxdWFs
cyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmluZ29wLXRydW5jYXRpb25dCiAgNjY1IHwgIHN0cm5j
cHkoaW5mby0+Zml4LmlkLCBkZXYtPmRyaXZlci0+bmFtZSwgMTYpOwogICAgICB8ICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKTGF0ZXIgb24gdGhlIGNvcHkg
aXMgYmVpbmcgdXNlZCB3aXRoIHRoZSBhc3N1bXB0aW9uIHRvIGJlIE5VTEwgdGVybWluYXRlZC4K
TWFrZSBzdXJlIHN0cmluZyBpcyBOVUxMIHRlcm1pbmF0ZWQgYnkgc3dpdGNoaW5nIHRvIHNucHJp
bnRmKCkuCgpTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MTEy
MDA5NTcxNi4yNjYyOC0xLWFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbQpTaWduZWQt
b2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9m
YnRmdC9mYnRmdC1jb3JlLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jCmlu
ZGV4IGEwYTY3YWE1MTdmMGUuLjYxZjAyODZmYjE1N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYnRmdC1jb3JlLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0
LWNvcmUuYwpAQCAtNjY2LDcgKzY2Niw3IEBAIHN0cnVjdCBmYl9pbmZvICpmYnRmdF9mcmFtZWJ1
ZmZlcl9hbGxvYyhzdHJ1Y3QgZmJ0ZnRfZGlzcGxheSAqZGlzcGxheSwKIAlmYmRlZmlvLT5kZWZl
cnJlZF9pbyA9ICAgICBmYnRmdF9kZWZlcnJlZF9pbzsKIAlmYl9kZWZlcnJlZF9pb19pbml0KGlu
Zm8pOwogCi0Jc3RybmNweShpbmZvLT5maXguaWQsIGRldi0+ZHJpdmVyLT5uYW1lLCAxNik7CisJ
c25wcmludGYoaW5mby0+Zml4LmlkLCBzaXplb2YoaW5mby0+Zml4LmlkKSwgIiVzIiwgZGV2LT5k
cml2ZXItPm5hbWUpOwogCWluZm8tPmZpeC50eXBlID0gICAgICAgICAgIEZCX1RZUEVfUEFDS0VE
X1BJWEVMUzsKIAlpbmZvLT5maXgudmlzdWFsID0gICAgICAgICBGQl9WSVNVQUxfVFJVRUNPTE9S
OwogCWluZm8tPmZpeC54cGFuc3RlcCA9CSAgIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
