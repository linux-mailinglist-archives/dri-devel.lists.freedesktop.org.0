Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D344613E4A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7FE6EE1C;
	Thu, 16 Jan 2020 17:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE036EE19
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:09:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4E6F2467E;
 Thu, 16 Jan 2020 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194595;
 bh=VEqvj7Y0Mmc3ACabNYSWR3z88ZrthSjokdgjsRhukvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gBA6+k/I69ZSXbPEhcA0m6FrYkXBTFlS13YUZWoGP6Wlhzz0xSqyDQ5prV8wG9KhY
 368vlSJbvr63CtALRNqCG9KLAHk63Q9EUh5C9SrGWYWoHxHQu3gkACzxkIPXMOIh0T
 OlxmTP4DJ5z/x2z9GPlq2FZ99pFit+WE5sga/B84=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 465/671] drm/panel: make drm_panel.h
 self-contained
Date: Thu, 16 Jan 2020 12:01:43 -0500
Message-Id: <20200116170509.12787-202-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGJmM2Y1ZTk4NTU5MzYwNjYxYTNkMmFmMzQwZDQ2NTIyNTEyYzBiMDAgXQoKRml4IGJ1aWxk
IHdhcm5pbmcgaWYgZHJtX3BhbmVsLmggaXMgYnVpbHQgd2l0aCBDT05GSUdfT0Y9biBvcgpDT05G
SUdfRFJNX1BBTkVMPW4gYW5kIGluY2x1ZGVkIHdpdGhvdXQgdGhlIHByZXJlcXVpc2l0ZSBlcnIu
aDoKCi4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6IEluIGZ1bmN0aW9uIOKAmG9mX2RybV9maW5k
X3BhbmVs4oCZOgouL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOjIwMzo5OiBlcnJvcjogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYRVJSX1BUUuKAmSBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKICAgICAg
ICAgXn5+fn5+fgouL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOjIwMzo5OiBlcnJvcjogcmV0dXJu
aW5nIOKAmGludOKAmSBmcm9tIGEgZnVuY3Rpb24gd2l0aCByZXR1cm4gdHlwZSDigJhzdHJ1Y3Qg
ZHJtX3BhbmVsICrigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3Qg
Wy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCiAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn4KCkZpeGVzOiA1ZmE4ZTRhMjIxODIgKCJkcm0vcGFuZWw6IE1h
a2Ugb2ZfZHJtX2ZpbmRfcGFuZWwoKSByZXR1cm4gYW4gRVJSX1BUUigpIGluc3RlYWQgb2YgTlVM
TCIpClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkFj
a2VkLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpSZXZpZXdlZC1ieTog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9y
Zz4KU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpMaW5rOiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA3MTgxNjE1
MDcuMjA0Ny0yLXNhbUByYXZuYm9yZy5vcmcKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
cGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCmluZGV4IDc3NzgxNDc1NWZhNi4uNjc1
YWExZTg3NmNlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAorKysgYi9pbmNs
dWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMjQsNiArMjQsNyBAQAogI2lmbmRlZiBfX0RSTV9QQU5F
TF9IX18KICNkZWZpbmUgX19EUk1fUEFORUxfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4K
ICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
