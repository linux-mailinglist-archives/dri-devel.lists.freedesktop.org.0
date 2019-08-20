Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6639738B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFB76E922;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77C508920C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 15:34:43 +0000 (UTC)
Received: from localhost (p54B333DC.dip0.t-ipconnect.de [84.179.51.220])
 by pokefinder.org (Postfix) with ESMTPSA id 744842C3014;
 Tue, 20 Aug 2019 17:34:40 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] video: backlight: tosa_lcd: drop check because
 i2c_unregister_device() is NULL safe
Date: Tue, 20 Aug 2019 17:34:39 +0200
Message-Id: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBjaGVjayB0aGUgYXJndW1lbnQgb2YgaTJjX3VucmVnaXN0ZXJfZGV2aWNlKCkg
YmVjYXVzZSB0aGUKZnVuY3Rpb24gaXRzZWxmIGRvZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBXb2xm
cmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgotLS0KQnVpbGQgdGVz
dGVkIG9ubHksIGJ1aWxkYm90IGlzIGhhcHB5LCB0b28uCgpQbGVhc2UgYXBwbHkgdG8geW91ciB0
cmVlLgoKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Rvc2FfbGNkLmMgfCAzICstLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Rvc2FfbGNkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC90b3NhX2xjZC5jCmluZGV4IDY1Y2I3NTc4Nzc2Zi4uMjlhZjhlMjdiNmU1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC90b3NhX2xjZC5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3Rvc2FfbGNkLmMKQEAgLTIyMiw4ICsyMjIsNyBAQCBzdGF0aWMgaW50IHRvc2Ff
bGNkX3JlbW92ZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogewogCXN0cnVjdCB0b3NhX2xjZF9k
YXRhICpkYXRhID0gc3BpX2dldF9kcnZkYXRhKHNwaSk7CiAKLQlpZiAoZGF0YS0+aTJjKQotCQlp
MmNfdW5yZWdpc3Rlcl9kZXZpY2UoZGF0YS0+aTJjKTsKKwlpMmNfdW5yZWdpc3Rlcl9kZXZpY2Uo
ZGF0YS0+aTJjKTsKIAogCXRvc2FfbGNkX3RnX29mZihkYXRhKTsKIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
