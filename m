Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AFE11DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 07:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB556E0F6;
	Wed, 23 Oct 2019 05:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FD36E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 05:57:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 22:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; d="scan'208";a="203865982"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2019 22:57:49 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iN9eW-0006xh-Pd; Wed, 23 Oct 2019 13:57:48 +0800
Date: Wed, 23 Oct 2019 13:55:38 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Message-ID: <201910231343.cn5i5UQp%lkp@intel.com>
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
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
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKSSBsb3ZlIHlvdXIgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5nIHRvIGltcHJv
dmU6CgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMvbWFzdGVyXQpbY2Fubm90IGFw
cGx5IHRvIHY1LjQtcmM0IG5leHQtMjAxOTEwMjJdCltpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQg
dG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscAppbXBy
b3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBvcHRp
b24gdG8gc3BlY2lmeSB0aGUKYmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBz
ZWUgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9hLzM3NDA2OTgyXQoKdXJsOiAgICBodHRwczov
L2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0RhbmllbC1WZXR0ZXIvZHJtLXNpbXBs
ZS1rbXMtU3RhbmRhcmRpemUtYXJndW1lbnRzLWZvci1jYWxsYmFja3MvMjAxOTEwMjMtMDczNzMx
CmJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0IDNiN2M1OWExOTUwYzc1ZjJjMDE1MmU1YTljZDc3Njc1YjA5MjMz
ZDYKcmVwcm9kdWNlOgogICAgICAgICMgYXB0LWdldCBpbnN0YWxsIHNwYXJzZQogICAgICAgICMg
c3BhcnNlIHZlcnNpb246IHYwLjYuMS1kaXJ0eQogICAgICAgIG1ha2UgQVJDSD14ODZfNjQgYWxs
bW9kY29uZmlnCiAgICAgICAgbWFrZSBDPTEgQ0Y9Jy1mZGlhZ25vc3RpYy1wcmVmaXggLURfX0NI
RUNLX0VORElBTl9fJwoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZwpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgoKc3Bh
cnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL2dwdS9k
cm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmM6Mjg5OjIzOiBzcGFyc2U6IHNwYXJzZTogaW5jb3Jy
ZWN0IHR5cGUgaW4gaW5pdGlhbGl6ZXIgKGluY29tcGF0aWJsZSBhcmd1bWVudCAxIChkaWZmZXJl
bnQgYmFzZSB0eXBlcykpIEBAICAgIGV4cGVjdGVkIGludCBlbnVtIGRybV9tb2RlX3N0YXR1cyAo
ICptb2RlX3ZhbGlkICkoIC4uLiApIEBAICAgIGdvdCBpbnQgZW51bSBkcm1fbW9kZV9zdGF0dXMg
KCAqbW9kZV92YWxpZCApKCAuLi4gKSBAQAo+PiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnRfa21zLmM6Mjg5OjIzOiBzcGFyc2U6ICAgIGV4cGVjdGVkIGludCBlbnVtIGRybV9tb2Rl
X3N0YXR1cyAoICptb2RlX3ZhbGlkICkoIC4uLiApCj4+IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVu
X2RybV9mcm9udF9rbXMuYzoyODk6MjM6IHNwYXJzZTogICAgZ290IGludCBlbnVtIGRybV9tb2Rl
X3N0YXR1cyAoICogKSggLi4uICkKCnZpbSArMjg5IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYwoKYzU3NWI3ZWViODlmOTQgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gMjAx
OC0wNC0wMyAgMjg3ICAKYzU3NWI3ZWViODlmOTQgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gMjAx
OC0wNC0wMyAgMjg4ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBl
X2Z1bmNzIGRpc3BsYXlfZnVuY3MgPSB7CmM1NzViN2VlYjg5Zjk0IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDIwMTgtMDQtMDMgQDI4OSAgCS5tb2RlX3ZhbGlkID0gZGlzcGxheV9tb2RlX3ZhbGlk
LApjNTc1YjdlZWI4OWY5NCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyAyMDE4LTA0LTAzICAyOTAg
IAkuZW5hYmxlID0gZGlzcGxheV9lbmFibGUsCmM1NzViN2VlYjg5Zjk0IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDIwMTgtMDQtMDMgIDI5MSAgCS5kaXNhYmxlID0gZGlzcGxheV9kaXNhYmxlLApk
ZDM4OGVlMWVjYmI4YyBEYW5pZWwgVmV0dGVyICAgICAgICAgICAyMDE4LTA0LTA5ICAyOTIgIAku
cHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfc2ltcGxlX2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiLApj
NTc1YjdlZWI4OWY5NCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyAyMDE4LTA0LTAzICAyOTMgIAku
dXBkYXRlID0gZGlzcGxheV91cGRhdGUsCmM1NzViN2VlYjg5Zjk0IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDIwMTgtMDQtMDMgIDI5NCAgfTsKYzU3NWI3ZWViODlmOTQgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gMjAxOC0wNC0wMyAgMjk1ICAKCjo6Ojo6OiBUaGUgY29kZSBhdCBsaW5lIDI4OSB3
YXMgZmlyc3QgaW50cm9kdWNlZCBieSBjb21taXQKOjo6Ojo6IGM1NzViN2VlYjg5Zjk0MzU2OTk3
YWJkNjJkNmQ1YTA1OTBlMjU5YjcgZHJtL3hlbi1mcm9udDogQWRkIHN1cHBvcnQgZm9yIFhlbiBQ
ViBkaXNwbGF5IGZyb250ZW5kCgo6Ojo6OjogVE86IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KOjo6Ojo6IENDOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CgotLS0KMC1EQVkg
a2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXIKaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwg
ICAgICAgICAgICAgICAgICAgSW50ZWwgQ29ycG9yYXRpb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
