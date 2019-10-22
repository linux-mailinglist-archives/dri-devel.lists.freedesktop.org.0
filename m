Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB030E01A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21446E55C;
	Tue, 22 Oct 2019 10:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74026E55E;
 Tue, 22 Oct 2019 10:10:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:10:12 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="201624132"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:10:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/dsi: add missing DSI DCS commands
Date: Tue, 22 Oct 2019 13:09:45 +0300
Message-Id: <9e106fcf26e0612fbec09fc7746a61442c237497.1571738674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1571738674.git.jani.nikula@intel.com>
References: <cover.1571738674.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIGZyb20gdGhlIERDUyBzcGVjaWZpY2F0aW9uLgoKQ2M6IFZhbmRpdGEgS3Vsa2Fybmkg
PHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvdmlkZW8vbWlwaV9kaXNwbGF5Lmgg
fCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdmlkZW8vbWlwaV9kaXNwbGF5LmggYi9pbmNsdWRlL3ZpZGVvL21pcGlf
ZGlzcGxheS5oCmluZGV4IDZiNjM5MGRmYTIwMy4uOTI4ZjhjNGI2NjU4IDEwMDY0NAotLS0gYS9p
bmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oCisrKyBiL2luY2x1ZGUvdmlkZW8vbWlwaV9kaXNw
bGF5LmgKQEAgLTc5LDcgKzc5LDkgQEAgZW51bSB7CiBlbnVtIHsKIAlNSVBJX0RDU19OT1AJCQk9
IDB4MDAsCiAJTUlQSV9EQ1NfU09GVF9SRVNFVAkJPSAweDAxLAorCU1JUElfRENTX0dFVF9DT01Q
UkVTU0lPTl9NT0RFCT0gMHgwMywKIAlNSVBJX0RDU19HRVRfRElTUExBWV9JRAkJPSAweDA0LAor
CU1JUElfRENTX0dFVF9FUlJPUl9DT1VOVF9PTl9EU0kJPSAweDA1LAogCU1JUElfRENTX0dFVF9S
RURfQ0hBTk5FTAk9IDB4MDYsCiAJTUlQSV9EQ1NfR0VUX0dSRUVOX0NIQU5ORUwJPSAweDA3LAog
CU1JUElfRENTX0dFVF9CTFVFX0NIQU5ORUwJPSAweDA4LApAQCAtOTQsNiArOTYsOCBAQCBlbnVt
IHsKIAlNSVBJX0RDU19FWElUX1NMRUVQX01PREUJPSAweDExLAogCU1JUElfRENTX0VOVEVSX1BB
UlRJQUxfTU9ERQk9IDB4MTIsCiAJTUlQSV9EQ1NfRU5URVJfTk9STUFMX01PREUJPSAweDEzLAor
CU1JUElfRENTX0dFVF9JTUFHRV9DSEVDS1NVTV9SR0IJPSAweDE0LAorCU1JUElfRENTX0dFVF9J
TUFHRV9DSEVDS1NVTV9DVAk9IDB4MTUsCiAJTUlQSV9EQ1NfRVhJVF9JTlZFUlRfTU9ERQk9IDB4
MjAsCiAJTUlQSV9EQ1NfRU5URVJfSU5WRVJUX01PREUJPSAweDIxLAogCU1JUElfRENTX1NFVF9H
QU1NQV9DVVJWRQk9IDB4MjYsCkBAIC0xMDUsNiArMTA5LDcgQEAgZW51bSB7CiAJTUlQSV9EQ1Nf
V1JJVEVfTFVUCQk9IDB4MkQsCiAJTUlQSV9EQ1NfUkVBRF9NRU1PUllfU1RBUlQJPSAweDJFLAog
CU1JUElfRENTX1NFVF9QQVJUSUFMX0FSRUEJPSAweDMwLAorCU1JUElfRENTX1NFVF9QQVJUSUFM
X0NPTFVNTlMJPSAweDMxLAogCU1JUElfRENTX1NFVF9TQ1JPTExfQVJFQQk9IDB4MzMsCiAJTUlQ
SV9EQ1NfU0VUX1RFQVJfT0ZGCQk9IDB4MzQsCiAJTUlQSV9EQ1NfU0VUX1RFQVJfT04JCT0gMHgz
NSwKQEAgLTExNCw3ICsxMTksMTAgQEAgZW51bSB7CiAJTUlQSV9EQ1NfRU5URVJfSURMRV9NT0RF
CT0gMHgzOSwKIAlNSVBJX0RDU19TRVRfUElYRUxfRk9STUFUCT0gMHgzQSwKIAlNSVBJX0RDU19X
UklURV9NRU1PUllfQ09OVElOVUUJPSAweDNDLAorCU1JUElfRENTX1NFVF8zRF9DT05UUk9MCQk9
IDB4M0QsCiAJTUlQSV9EQ1NfUkVBRF9NRU1PUllfQ09OVElOVUUJPSAweDNFLAorCU1JUElfRENT
X0dFVF8zRF9DT05UUk9MCQk9IDB4M0YsCisJTUlQSV9EQ1NfU0VUX1ZTWU5DX1RJTUlORwk9IDB4
NDAsCiAJTUlQSV9EQ1NfU0VUX1RFQVJfU0NBTkxJTkUJPSAweDQ0LAogCU1JUElfRENTX0dFVF9T
Q0FOTElORQkJPSAweDQ1LAogCU1JUElfRENTX1NFVF9ESVNQTEFZX0JSSUdIVE5FU1MgPSAweDUx
LAkJLyogTUlQSSBEQ1MgMS4zICovCkBAIC0xMjYsNyArMTM0LDkgQEAgZW51bSB7CiAJTUlQSV9E
Q1NfU0VUX0NBQkNfTUlOX0JSSUdIVE5FU1MgPSAweDVFLAkvKiBNSVBJIERDUyAxLjMgKi8KIAlN
SVBJX0RDU19HRVRfQ0FCQ19NSU5fQlJJR0hUTkVTUyA9IDB4NUYsCS8qIE1JUEkgRENTIDEuMyAq
LwogCU1JUElfRENTX1JFQURfRERCX1NUQVJUCQk9IDB4QTEsCisJTUlQSV9EQ1NfUkVBRF9QUFNf
U1RBUlQJCT0gMHhBMiwKIAlNSVBJX0RDU19SRUFEX0REQl9DT05USU5VRQk9IDB4QTgsCisJTUlQ
SV9EQ1NfUkVBRF9QUFNfQ09OVElOVUUJPSAweEE5LAogfTsKIAogLyogTUlQSSBEQ1MgcGl4ZWwg
Zm9ybWF0cyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
