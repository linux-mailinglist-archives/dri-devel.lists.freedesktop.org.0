Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB9ED26A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2019 08:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C691D6E07D;
	Sun,  3 Nov 2019 07:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B76E07D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2019 07:51:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Nov 2019 00:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,262,1569308400"; d="scan'208";a="352542670"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 03 Nov 2019 00:51:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRAfT-000DzM-E7; Sun, 03 Nov 2019 15:51:23 +0800
Date: Sun, 3 Nov 2019 15:51:00 +0800
From: kbuild test robot <lkp@intel.com>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Message-ID: <201911031510.4s2wqcIN%lkp@intel.com>
References: <1572595463-30970-1-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572595463-30970-1-git-send-email-allen.chen@ite.com.tw>
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
Cc: kbuild-all@lists.01.org, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsZW4sCgpJIGxvdmUgeW91ciBwYXRjaCEgUGVyaGFwcyBzb21ldGhpbmcgdG8gaW1wcm92
ZToKClthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBsaW51cy9tYXN0ZXJdClthbHNvIGJ1aWxk
IHRlc3QgV0FSTklORyBvbiB2NS40LXJjNSBuZXh0LTIwMTkxMDMxXQpbaWYgeW91ciBwYXRjaCBp
cyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRv
IGhlbHAKaW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0t
YmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhlCmJhc2UgdHJlZSBpbiBnaXQgZm9ybWF0LXBhdGNo
LCBwbGVhc2Ugc2VlIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4Ml0KCnVybDog
ICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9hbGxlbi9kcm0tZWRp
ZC1maXh1cC1FRElELTEtMy1hbmQtMS00LWp1ZGdlLXJlZHVjZWQtYmxhbmtpbmctdGltaW5ncy1s
b2dpYy8yMDE5MTEwMi0yMDAzNTcKYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgMTIwNGM3MGQ5ZGNiYTMxMTY0
Zjc4YWQ1ZDhjODhjNDIzMzVkNTFmOAoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQg
Zm9sbG93aW5nIHRhZwpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+CgpzbWF0Y2ggd2FybmluZ3M6CmRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jOjIwNDIgZHJt
X21vbml0b3Jfc3VwcG9ydHNfcmIoKSB3YXJuOiBhbHdheXMgdHJ1ZSBjb25kaXRpb24gJyhjbG9z
dXJlLnN1cHBvcnRfcmIgPj0gMCkgPT4gKDAtMjU1ID49IDApJwoKdmltICsyMDQyIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jCgogIDIwMzAJCiAgMjAzMQkvKiBFRElEIDEuNCBkZWZpbmVzIHRo
aXMgZXhwbGljaXRseS4gIEZvciBFRElEIDEuMywgd2UgZ3Vlc3MsIGJhZGx5LiAqLwogIDIwMzIJ
c3RhdGljIGJvb2wKICAyMDMzCWRybV9tb25pdG9yX3N1cHBvcnRzX3JiKHN0cnVjdCBlZGlkICpl
ZGlkKQogIDIwMzQJewogIDIwMzUJCXN0cnVjdCBlZGlkX3N1cHBvcnRfcmJfY2xvc3VyZSBjbG9z
dXJlID0gewogIDIwMzYJCQkuZWRpZCA9IGVkaWQsCiAgMjAzNwkJCS5zdXBwb3J0X3JiID0gLTEs
CiAgMjAzOAkJfTsKICAyMDM5CQogIDIwNDAJCWlmIChlZGlkLT5yZXZpc2lvbiA+PSA0KSB7CiAg
MjA0MQkJCWRybV9mb3JfZWFjaF9kZXRhaWxlZF9ibG9jaygodTggKillZGlkLCBpc19yYiwgJmNs
b3N1cmUpOwo+IDIwNDIJCQlpZiAoY2xvc3VyZS5zdXBwb3J0X3JiID49IDApCiAgMjA0MwkJCQly
ZXR1cm4gY2xvc3VyZS5zdXBwb3J0X3JiOwogIDIwNDQJCX0KICAyMDQ1CQogIDIwNDYJCXJldHVy
biB0cnVlOwogIDIwNDcJfQogIDIwNDgJCgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1
Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0cHM6
Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAgSW50
ZWwgQ29ycG9yYXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
