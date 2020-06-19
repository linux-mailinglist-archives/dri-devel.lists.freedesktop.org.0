Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD6200A08
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0A6ECB8;
	Fri, 19 Jun 2020 13:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA66ECB4;
 Fri, 19 Jun 2020 13:27:49 +0000 (UTC)
IronPort-SDR: iopnGM7jPBLpyTc/3LLLJ4BIyyvDaRigkbGx2/I/4aexohlIJDiwiRQ2wq2A5Pd54tv+gdKyDL
 6qISjrLU3dhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="208188889"
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="208188889"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 06:27:49 -0700
IronPort-SDR: L78Qz8sH+qjrsAReprFAkkkcVdqcgsgUk0PWlbigH7Y0gbWn0944aI7LHi0YLqH8BL7b5kBXDq
 iVL69QpU+4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="421849374"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by orsmga004.jf.intel.com with ESMTP; 19 Jun 2020 06:27:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v6 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
Date: Sat, 20 Jun 2020 02:53:54 +0530
Message-Id: <20200619212356.19285-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
References: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KCkRQIHNpbmsg
ZGV2aWNlIHNldHMgdGhlIElnbm9yZSBNU0EgYml0IGluIGl0cwpEUF9ET1dOU1RSRUFNX1BPUlRf
Q09VTlQgcmVnaXN0ZXIgdG8gaW5kaWNhdGUgaXRzIGFiaWxpdHkgdG8KaWdub3JlIHRoZSBNU0Eg
dmlkZW8gdGltaW5nIHBhcmFtZXRlcnMgYW5kIGl0cyBhYmlsaXR5IHRvIHN1cHBvcnQKc2VhbWxl
c3MgdmlkZW8gdGltaW5nIGNoYW5nZSBvdmVyIGEgcmFuZ2Ugb2YgdGltaW5nIGV4cG9zZWQgYnkK
RGlzcGxheUlEIGFuZCBFRElELgpUaGlzIGlzIHJlcXVpcmVkIGZvciB0aGUgc2luayB0byBpbmRp
Y2F0ZSB0aGF0IGl0IGlzIEFkYXB0aXZlIHN5bmMKY2FwYWJsZS4KCnYzOgoqIEZpIHRoZSB0eXBv
IGluIGNvbW1pdCBtZXNzYWdlIChNYW5hc2kpCnYyOgoqIFJlbmFtZSB0byBkZXNjcmliZSB3aGF0
IHRoZSBmdW5jdGlvbiBkb2VzIChKYW5pIE5pa3VsYSkKCkNjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29t
PgpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCAxMTY1ZWMxMDU2MzguLmU0
N2RjMjJlYmY1MCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBi
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTQ1Nyw2ICsxNDU3LDE0IEBAIGRybV9k
cF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcChjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVS
X0NBUF9TSVpFXSkKIAkJCURQX0FMVEVSTkFURV9TQ1JBTUJMRVJfUkVTRVRfQ0FQOwogfQogCisv
KiBJZ25vcmUgTVNBIHRpbWluZyBmb3IgQWRhcHRpdmUgU3luYyBzdXBwb3J0IG9uIERQIDEuNCAq
Lworc3RhdGljIGlubGluZSBib29sCitkcm1fZHBfc2lua19jYW5fZG9fdmlkZW9fd2l0aG91dF90
aW1pbmdfbXNhKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXJldHVy
biBkcGNkW0RQX0RPV05fU1RSRUFNX1BPUlRfQ09VTlRdICYKKwkJRFBfTVNBX1RJTUlOR19QQVJf
SUdOT1JFRDsKK30KKwogLyoKICAqIERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCiAgKi8KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
