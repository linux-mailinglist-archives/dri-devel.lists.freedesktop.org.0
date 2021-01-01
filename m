Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEC2E91DC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930C989D9B;
	Mon,  4 Jan 2021 08:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB21896C7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jan 2021 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609535908;
 bh=SEBirRQNsdff7T4jVtygRU8Hbx07IqHvJ56BFykpua8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Oo7RTtXBc5rWlVR6wJuYqbyuwwvq4GamzyiTDl4DskGgPByvM9JBwl4MwAgMgMq3D
 WY0RCWHR/QDxHy5y/XenKPnYsh2e1IZKEi3lK85iFmH+Fy60T+iz8vAuDK1hxx/yAi
 H6oumVuVBV6MSVuTuAkrtLfbbzx9zT6Oq/Gnl5X0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDXz-1k11FG3Xp7-00udbE; Fri, 01
 Jan 2021 22:18:27 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mipi-dbi: Switch to new kerneldoc syntax for named
 variable macro argument
Date: Fri,  1 Jan 2021 22:18:17 +0100
Message-Id: <20210101211818.1023919-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:/jcMXDBSXErs310I68+O8MxCNGpK+ySrMql4+hvocEhdCZ4Ywi+
 PJDHDM5RJENBZ5yVRUQnUSCzywEb3+odIpnPJgr3r1PpYG5jtIWhFxv1SwAWd2zaAiMVRT2
 /525Z7UuWbLHgaFZwNNay1El/ykz4YLAIhzkeHR0j1OO2Jxqmz2mpIQ6H+B5+1pbFDgsIx1
 QbcsEaDV5vnlbWbdkm/Rg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5fVYP1534iA=:HCeJZ6esZ+U5WleLXzQP2o
 PMrTjornA64FZDJZYHBEFI0mHjQE9CoUEnIkNUA6EZL789ATeELQHLpnPyMoByZHl39yWaMD5
 0jOCr2tH1TqELLCsMRIntgAxZ0qo4bXNc7DNrseg9PwOjd4TTMHFQ2QNeaZQ+Hv6fA45NIGQu
 4Wx8wiJEFJbJFl9oPB24joQmRxUDEpL4cGlQb2BklKiAA/YlLD/C1JeGe53WDMjgPE6mr9Ww3
 LahxfWyHIdvpBbkAGsYIe/hsZCDpPgMDzfMs9HBahT+rWkluJIQAmbheGJGfAXts96JRa8SjE
 ++NcFvkjT6lBvy2cowSv67Pbmwy5mM7RJkoA8yai8kNZWDbkNZsAefG9/SSIDeoNm0Cj6NRkK
 hF41GsfXxR93y4KKE6kuzgEIyux2/G1CoXCwL62bOSRyAePp/RrnZbjti5LkAFB0l76omH7jk
 0QPBJkaimRgg99ylmzc/zRgkrllz5AR1jqVFC0geMdoCY93XMAEG8T80xIK9tTx6Fp1Nj4v7J
 fu8/BF7OENUiD+QHSz+tr+EByIcxKXaPOVA2HqVJiCW0zu+Y1Ta9cIhAJjoYpaFz+KTfOtxuJ
 a5LHySAWkHwyD9dCmtR0yWmCdHb+YzFTya3UyoeGxjaOid3R3B3VNpieWpG8jcKJ5WO22kHqK
 PiwbMbyDZso6UJoVpunMHGb37V+yMOsvB0QRMfuk+zBsF21NcFArF9l3S/282YCDr8HWjY+Jo
 OFl9GvM42f4AmW7QhojHG5WKVSJzvDlArfrxWGIcpanCny+izUuN+kWSMQtlHvEJL4NNw9Se3
 nvwQ5YfKe3BZ9B7Uw4PJRwQHW0Lc9HewBTHwY87GahFVdzzVjVWrj/7dFb26a83oX/0kD/Ibw
 796Goc/TXN8ZbDxjUlQA==
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN5bnRheCB3aXRob3V0IGRvdHMgaXMgYXZhaWxhYmxlIHNpbmNlIGNvbW1pdCA0Mzc1NmUz
NDdmMjEKKCJzY3JpcHRzL2tlcm5lbC1kb2M6IEFkZCBzdXBwb3J0IGZvciBuYW1lZCB2YXJpYWJs
ZSBtYWNybyBhcmd1bWVudHMiKS4KClRoZSBzYW1lIEhUTUwgb3V0cHV0IGlzIHByb2R1Y2VkIHdp
dGggYW5kIHdpdGhvdXQgdGhpcyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE5ldXNj
aMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX21pcGlf
ZGJpLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbWlwaV9kYmkuaCBiL2luY2x1ZGUvZHJt
L2RybV9taXBpX2RiaS5oCmluZGV4IGMyODI3Y2VhYmEwZDIuLmY1NDNkNmUzZTgyMmMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9taXBpX2RiaS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9t
aXBpX2RiaS5oCkBAIC0xNzIsNyArMTcyLDcgQEAgaW50IG1pcGlfZGJpX2J1Zl9jb3B5KHZvaWQg
KmRzdCwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiAgKiBtaXBpX2RiaV9jb21tYW5kIC0g
TUlQSSBEQ1MgY29tbWFuZCB3aXRoIG9wdGlvbmFsIHBhcmFtZXRlcihzKQogICogQGRiaTogTUlQ
SSBEQkkgc3RydWN0dXJlCiAgKiBAY21kOiBDb21tYW5kCi0gKiBAc2VxLi4uOiBPcHRpb25hbCBw
YXJhbWV0ZXIocykKKyAqIEBzZXE6IE9wdGlvbmFsIHBhcmFtZXRlcihzKQogICoKICAqIFNlbmQg
TUlQSSBEQ1MgY29tbWFuZCB0byB0aGUgY29udHJvbGxlci4gVXNlIG1pcGlfZGJpX2NvbW1hbmRf
cmVhZCgpIGZvcgogICogZ2V0L3JlYWQuCi0tCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
