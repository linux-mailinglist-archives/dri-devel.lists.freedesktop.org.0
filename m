Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF117B807
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6476EC9F;
	Fri,  6 Mar 2020 08:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2020 06:31:09 UTC
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA2089BCD;
 Fri,  6 Mar 2020 06:31:09 +0000 (UTC)
Date: Fri, 06 Mar 2020 06:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1583475936;
 bh=FlHURuThUCG/XaGtNSdhGq8awZ3MLFHA6LRuJDlmsKo=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=p2MvK8yzQsjXMIVyYOEvFaVEb7jgu01RLg3lW5hxvRt19PVVotao6F2jDO9rTefGW
 dpkr0oPDE6rm0cnnZxfhSFnnJK2fLRtsvKdhDmkZRSvTIbgMHugdpOKBxcVE5CEibF
 R1D0dCx//2c++lBaCFDL5YLHQ+dwfvneqd9L1fVk=
To: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] Corrected the core clock speed for AMD HAINAN
Message-ID: <8N050z-kDUI3K6yjVnSIW52u4n8Q8SdAiAlWcmlMHx83oMerf70JNWvSl20GN_5ETbg92aBksrR1bGO2f3ADv3DnI5eEWIYMGFqD8F8v7Uw=@protonmail.com>
Feedback-ID: v3gTakqywBIYXeKntrQ6yy6583pNqH_nSJEjbgzjmBjMaZTDq3nLe0D-jSYppQY2NgolnS_R3Ad-LHjkRMDnTQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="b1_bda15a5c3b3dd6a00ac9884c78f02c61"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--b1_bda15a5c3b3dd6a00ac9884c78f02c61
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Empty Message

--b1_bda15a5c3b3dd6a00ac9884c78f02c61
Content-Type: application/octet-stream; name="mutt-yassine-HP-1000-4480-19426451861488017513"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mutt-yassine-HP-1000-4480-19426451861488017513

U2lnbmVkLW9mZi1ieTogWWFzc2luZSBPdWRqYW5hIDx5Lm91ZGphbmFAcHJvdG9ubWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2lfZHBtLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NpX2RwbS5jCmluZGV4IDRjYjRjODkxMTIwYi4uYzEzNzRmZTEzY2U4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaV9kcG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zaV9kcG0uYwpAQCAtMzQ0NCw3ICszNDQ0LDcgQEAgc3RhdGljIHZvaWQg
c2lfYXBwbHlfc3RhdGVfYWRqdXN0X3J1bGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQkgICAgKGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDY2NjQpIHx8CiAJCSAgICAoYWRldi0+cGRl
di0+ZGV2aWNlID09IDB4NjY2NSkgfHwKIAkJICAgIChhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHg2
NjY3KSkgewotCQkJbWF4X3NjbGsgPSA3NTAwMDsKKwkJCW1heF9zY2xrID0gMTAzMDAwOwogCQl9
CiAJCWlmICgoYWRldi0+cGRldi0+cmV2aXNpb24gPT0gMHhDMykgfHwKIAkJICAgIChhZGV2LT5w
ZGV2LT5kZXZpY2UgPT0gMHg2NjY1KSkgewotLSAKMi4yNS4xCgo=


--b1_bda15a5c3b3dd6a00ac9884c78f02c61
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--b1_bda15a5c3b3dd6a00ac9884c78f02c61--

