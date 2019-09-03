Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C5A6E23
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731A389358;
	Tue,  3 Sep 2019 16:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EEA89358;
 Tue,  3 Sep 2019 16:25:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42CA323697;
 Tue,  3 Sep 2019 16:24:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 12/23] drm/i915: Disable SAMPLER_STATE prefetching
 on all Gen11 steppings.
Date: Tue,  3 Sep 2019 12:24:13 -0400
Message-Id: <20190903162424.6877-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527900;
 bh=jYhDg5UDXZYUyQ39bpjATWDx2ysRzftfB+YW2M0TD88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yb9xZlEs8RPxRt/1MXmIzMaXEb+8ih0WjfB9AbOmN36KmfVzYP5NDnWSk/z84vnub
 t/QsigSi0usA23OXjdCDsoE7HrNZfeU8ZnFdlKwlJNNKV4a4gjqn5a5VcxYI76xxHd
 9bfXFbc+KTIZFLoYGm2yZhYbIrAGJsmSTvUUyqnA=
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBHcmF1bmtlIDxrZW5uZXRoQHdoaXRlY2FwZS5vcmc+CgpbIFVwc3RyZWFt
IGNvbW1pdCAyNDhmODgzZGI2MTI4M2I0ZjVhMWM5MmE1ZTI3Mjc3Mzc3YjA5ZjE2IF0KClRoZSBE
ZW1hbmQgUHJlZmV0Y2ggd29ya2Fyb3VuZCAoYmluZGluZyB0YWJsZSBwcmVmZXRjaGluZykgb25s
eSBhcHBsaWVzCnRvIEljZWxha2UgQTAvQjAuICBCdXQgdGhlIFNhbXBsZXIgUHJlZmV0Y2ggd29y
a2Fyb3VuZCBuZWVkcyB0byBiZQphcHBsaWVkIHRvIGFsbCBHZW4xMSBzdGVwcGluZ3MsIGFjY29y
ZGluZyB0byBhIHByb2dyYW1taW5nIG5vdGUgaW4gdGhlClNBUkNIS01EIGRvY3VtZW50YXRpb24u
CgpVc2luZyB0aGUgSW50ZWwgR2FsbGl1bSBkcml2ZXIsIEkgaGF2ZSBzZWVuIGludGVybWl0dGVu
dCBmYWlsdXJlcyBpbgp0aGUgZEVRUC1HTEVTMzEuZnVuY3Rpb25hbC5jb3B5X2ltYWdlLm5vbl9j
b21wcmVzc2VkLiogdGVzdHMuICBBZnRlcgphcHBseWluZyB0aGlzIHdvcmthcm91bmQsIHRoZSB0
ZXN0cyByZWxpYWJseSBwYXNzLgoKdjI6IFJlbW92ZSB0aGUgb3ZlcmxhcCB3aXRoIGEgcHJlLXBy
b2R1Y3Rpb24gdy9hCgpCU3BlYzogOTY2MwpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEdyYXVua2Ug
PGtlbm5ldGhAd2hpdGVjYXBlLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2Vk
LWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KTGluazog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjI1MDkw
NjU1LjE5MjIwLTEtY2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrCihjaGVycnkgcGlja2VkIGZyb20g
Y29tbWl0IGY5YTM5Mzg3NWQzYWYxM2NjMzI2NzQ3Nzc0NjYwOGRhZGI3ZjE3YzEpClNpZ25lZC1v
ZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF93b3JrYXJvdW5kcy5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfd29y
a2Fyb3VuZHMuYwppbmRleCA4NDFiOGU1MTVmNGQ2Li4yZmI3MGZhYjJkMWM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX3dvcmthcm91bmRzLmMKQEAgLTExNjcsOCArMTE2NywxMiBAQCBy
Y3NfZW5naW5lX3dhX2luaXQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lLCBzdHJ1Y3Qg
aTkxNV93YV9saXN0ICp3YWwpCiAJCWlmIChJU19JQ0xfUkVWSUQoaTkxNSwgSUNMX1JFVklEX0Ew
LCBJQ0xfUkVWSURfQjApKQogCQkJd2Ffd3JpdGVfb3Iod2FsLAogCQkJCSAgICBHRU43X1NBUkNI
S01ELAotCQkJCSAgICBHRU43X0RJU0FCTEVfREVNQU5EX1BSRUZFVENIIHwKLQkJCQkgICAgR0VO
N19ESVNBQkxFX1NBTVBMRVJfUFJFRkVUQ0gpOworCQkJCSAgICBHRU43X0RJU0FCTEVfREVNQU5E
X1BSRUZFVENIKTsKKworCQkvKiBXYV8xNjA2NjgyMTY2OmljbCAqLworCQl3YV93cml0ZV9vcih3
YWwsCisJCQkgICAgR0VON19TQVJDSEtNRCwKKwkJCSAgICBHRU43X0RJU0FCTEVfU0FNUExFUl9Q
UkVGRVRDSCk7CiAJfQogCiAJaWYgKElTX0dFTl9SQU5HRShpOTE1LCA5LCAxMSkpIHsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
