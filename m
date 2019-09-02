Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DFA555D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36335890D2;
	Mon,  2 Sep 2019 11:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516C890D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:56:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 04:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="211666220"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2019 04:56:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i4kwv-0002n8-Uk; Mon, 02 Sep 2019 19:56:45 +0800
Date: Mon, 2 Sep 2019 19:56:01 +0800
From: kbuild test robot <lkp@intel.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: [PATCH] habanalabs: fix semicolon.cocci warnings
Message-ID: <20190902115601.54xum2okgpv2ekoa@48261080c7f1>
References: <201909021944.2gR6o8Zw%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201909021944.2gR6o8Zw%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Omer Shpigelman <oshpigelman@habana.ai>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cgpkcml2ZXJzL21pc2MvaGFi
YW5hbGFicy9kZXZpY2UuYzo1NTI6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24KCgogUmVtb3ZlIHVu
bmVlZGVkIHNlbWljb2xvbi4KCkdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL21pc2Mv
c2VtaWNvbG9uLmNvY2NpCgpGaXhlczogMTI3ZDIwYzFkYTYxICgiaGFiYW5hbGFiczogYWRkIHVh
cGkgdG8gcmV0cmlldmUgZGV2aWNlIHV0aWxpemF0aW9uIikKU2lnbmVkLW9mZi1ieToga2J1aWxk
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Ci0tLQoKdHJlZTogICBnaXQ6Ly9wZW9wbGUuZnJl
ZWRlc2t0b3Aub3JnL35nYWJiYXlvL2xpbnV4IGhhYmFuYWxhYnMtbmV4dApoZWFkOiAgIGYzZDQw
ZmZlYjg5NTY0ZDMxMjk1ZmIwMWJjMDQ5Mjk2NjFlMmJiY2YKY29tbWl0OiAxMjdkMjBjMWRhNjEw
NDVhNzkwM2M1ZDc2YWZlMTRiM2EzYTA5N2MyIFsyNS8yOV0gaGFiYW5hbGFiczogYWRkIHVhcGkg
dG8gcmV0cmlldmUgZGV2aWNlIHV0aWxpemF0aW9uCgogZGV2aWNlLmMgfCAgICAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCi0tLSBhL2RyaXZlcnMv
bWlzYy9oYWJhbmFsYWJzL2RldmljZS5jCisrKyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2Rl
dmljZS5jCkBAIC01NDksNyArNTQ5LDcgQEAgdWludDMyX3QgaGxfZGV2aWNlX3V0aWxpemF0aW9u
KHN0cnVjdCBobAogCQl0cyA9ICZoZGV2LT5pZGxlX2J1c3lfdHNfYXJyW2xhc3RfaW5kZXhdOwog
CiAJCW92ZXJsYXBfY250Kys7Ci0JfTsKKwl9CiAKIAlyZXR1cm4gRElWX1JPVU5EX1VQKCgodG90
YWxfYnVzeV90aW1lX3VzIC8gVVNFQ19QRVJfTVNFQykgKiAxMDApLAogCQkJCXBlcmlvZF9tcyk7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
