Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6B515DE6C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523A06FA2D;
	Fri, 14 Feb 2020 16:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990B6FA3C;
 Fri, 14 Feb 2020 16:04:38 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14DCE24654;
 Fri, 14 Feb 2020 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696277;
 bh=ubf65owY3R1jt2S2MSLqWNz0w0EIJ38dB3SvZMalPsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=igCf/LGtGdxRXQFyE6yfhXRuvcZvRpGeF/Ncv/wK+Y5VRtYn120iqdfdVevMYlY1W
 npHteed2nyHUIMuqEfj+Ns704jTX+Xpqt/l2cOUIEzzqkYF9zGvkjQUm9Pm+O86rin
 DUNeQBhNdEUpCFuXLiyZinXqGLhvksa9G4T85M7s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 127/459] drm/amdgpu: remove set but not used
 variable 'amdgpu_connector'
Date: Fri, 14 Feb 2020 10:56:17 -0500
Message-Id: <20200214160149.11681-127-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgNGYy
OTIyZDEyZDZjNjNkMGY0YWE0ZTg1OWFkOTVhZWU2ZDBkNGVhMCBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGlzcGxheS5jOiBJbiBmdW5jdGlvbgrigJhhbWRncHVfZGlzcGxheV9jcnRjX3Nj
YWxpbmdfbW9kZV9maXh1cOKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c3BsYXkuYzo2OTM6Mjc6IHdhcm5pbmc6IHZhcmlhYmxlCuKAmGFtZGdwdV9jb25uZWN0b3LigJkg
c2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkZpeGVzOiBkMzhj
ZWFmOTllZDAgKCJkcm0vYW1kZ3B1OiBhZGQgY29yZSBkcml2ZXIgKHY0KSIpClNpZ25lZC1vZmYt
Ynk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZp
biA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc3BsYXkuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmluZGV4IDgyZWZjMWUy
MmU2MTEuLjIxYzljZmE0MGU5ZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc3BsYXkuYwpAQCAtNjg3LDcgKzY4Nyw2IEBAIGJvb2wgYW1kZ3B1X2Rpc3BsYXlfY3J0
Y19zY2FsaW5nX21vZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXN0cnVjdCBhbWRn
cHVfY3J0YyAqYW1kZ3B1X2NydGMgPSB0b19hbWRncHVfY3J0YyhjcnRjKTsKIAlzdHJ1Y3QgYW1k
Z3B1X2VuY29kZXIgKmFtZGdwdV9lbmNvZGVyOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3I7Ci0Jc3RydWN0IGFtZGdwdV9jb25uZWN0b3IgKmFtZGdwdV9jb25uZWN0b3I7CiAJdTMy
IHNyY192ID0gMSwgZHN0X3YgPSAxOwogCXUzMiBzcmNfaCA9IDEsIGRzdF9oID0gMTsKIApAQCAt
Njk5LDcgKzY5OCw2IEBAIGJvb2wgYW1kZ3B1X2Rpc3BsYXlfY3J0Y19zY2FsaW5nX21vZGVfZml4
dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJY29udGludWU7CiAJCWFtZGdwdV9lbmNvZGVy
ID0gdG9fYW1kZ3B1X2VuY29kZXIoZW5jb2Rlcik7CiAJCWNvbm5lY3RvciA9IGFtZGdwdV9nZXRf
Y29ubmVjdG9yX2Zvcl9lbmNvZGVyKGVuY29kZXIpOwotCQlhbWRncHVfY29ubmVjdG9yID0gdG9f
YW1kZ3B1X2Nvbm5lY3Rvcihjb25uZWN0b3IpOwogCiAJCS8qIHNldCBzY2FsaW5nICovCiAJCWlm
IChhbWRncHVfZW5jb2Rlci0+cm14X3R5cGUgPT0gUk1YX09GRikKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
