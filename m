Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08BE2B15
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E566E107;
	Thu, 24 Oct 2019 07:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 973 seconds by postgrey-1.36 at gabe;
 Wed, 23 Oct 2019 08:47:43 UTC
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453A6E9EB;
 Wed, 23 Oct 2019 08:47:43 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id B1BFDE93D3079EB8002D;
 Wed, 23 Oct 2019 16:31:26 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x9N8U30j081278;
 Wed, 23 Oct 2019 16:30:03 +0800 (GMT-8)
 (envelope-from zhong.shiqi@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102316302352-91717 ;
 Wed, 23 Oct 2019 16:30:23 +0800 
From: zhongshiqi <zhong.shiqi@zte.com.cn>
To: harry.wentland@amd.com
Subject: [PATCH] dc.c:use kzalloc without test
Date: Wed, 23 Oct 2019 16:32:23 +0800
Message-Id: <1571819543-15676-1-git-send-email-zhong.shiqi@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-23 16:30:23,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-23 16:30:06, Serialize complete at 2019-10-23 16:30:06
X-MAIL: mse-fl1.zte.com.cn x9N8U30j081278
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:27:37 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, Jun.Lei@amd.com,
 anthony.koo@amd.com, David.Francis@amd.com, Wenjing.Liu@amd.com,
 amd-gfx@lists.freedesktop.org, cheng.shengyu@zte.com.cn,
 zhongshiqi <zhong.shiqi@zte.com.cn>, wang.yi59@zte.com.cn, sunpeng.li@amd.com,
 Aidan.Wood@amd.com, xue.zhihong@zte.com.cn, Bhawanpreet.Lakha@amd.com,
 Chris.Park@amd.com, Eric.Yang2@amd.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Dmytro.Laktyushkin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGMuYzo1ODM6bnVsbCBjaGVjayBpcyBuZWVkZWQgYWZ0ZXIgdXNpbmcga3phbGxvYyBmdW5jdGlv
bgoKU2lnbmVkLW9mZi1ieTogemhvbmdzaGlxaSA8emhvbmcuc2hpcWlAenRlLmNvbS5jbj4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjLmMKaW5kZXggNWQxYWRlZC4uNGI4ODE5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC01ODAsNiArNTgwLDEwIEBAIHN0YXRpYyBib29sIGNv
bnN0cnVjdChzdHJ1Y3QgZGMgKmRjLAogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAog
CS8vIEFsbG9jYXRlIG1lbW9yeSBmb3IgdGhlIHZtX2hlbHBlcgogCWRjLT52bV9oZWxwZXIgPSBr
emFsbG9jKHNpemVvZihzdHJ1Y3Qgdm1faGVscGVyKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFkYy0+
dm1faGVscGVyKSB7CisJCWRtX2Vycm9yKCIlczogZmFpbGVkIHRvIGNyZWF0ZSBkYy0+dm1faGVs
cGVyXG4iLCBfX2Z1bmNfXyk7CisJCWdvdG8gZmFpbDsKKwl9CiAKICNlbmRpZgogCW1lbWNweSgm
ZGMtPmJiX292ZXJyaWRlcywgJmluaXRfcGFyYW1zLT5iYl9vdmVycmlkZXMsIHNpemVvZihkYy0+
YmJfb3ZlcnJpZGVzKSk7Ci0tIAoyLjkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
