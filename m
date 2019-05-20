Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33624316
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 23:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E4891EC;
	Mon, 20 May 2019 21:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44217891C7;
 Mon, 20 May 2019 21:46:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 14:46:21 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 20 May 2019 14:46:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hSq6s-0009N1-FT; Tue, 21 May 2019 05:46:18 +0800
Date: Tue, 21 May 2019 05:45:53 +0800
From: kbuild test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 18/33] fbdev: make unregister/unlink
 functions not fail
Message-ID: <201905210520.GS4ztecg%lkp@intel.com>
References: <20190520082216.26273-19-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520082216.26273-19-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Mikulas Patocka <mpatocka@redhat.com>, kbuild-all@01.org,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKSSBsb3ZlIHlvdXIgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5nIHRvIGltcHJv
dmU6CgpbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMvbWFzdGVyXQpbYWxzbyBidWls
ZCB0ZXN0IFdBUk5JTkcgb24gdjUuMi1yYzEgbmV4dC0yMDE5MDUyMF0KW2lmIHlvdXIgcGF0Y2gg
aXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0
byBoZWxwIGltcHJvdmUgdGhlIHN5c3RlbV0KCnVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBk
YXktY2kvbGludXgvY29tbWl0cy9EYW5pZWwtVmV0dGVyL2ZiY29uLW5vdGlmaWVyLWJlZ29uZS8y
MDE5MDUyMS0wMjE4NDEKcmVwcm9kdWNlOgogICAgICAgICMgYXB0LWdldCBpbnN0YWxsIHNwYXJz
ZQogICAgICAgIG1ha2UgQVJDSD14ODZfNjQgYWxsbW9kY29uZmlnCiAgICAgICAgbWFrZSBDPTEg
Q0Y9Jy1mZGlhZ25vc3RpYy1wcmVmaXggLURfX0NIRUNLX0VORElBTl9fJwoKSWYgeW91IGZpeCB0
aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwpSZXBvcnRlZC1ieToga2J1aWxkIHRl
c3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgoKc3BhcnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJl
Zml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jOjg5NDoz
ODogc3BhcnNlOiBzcGFyc2U6IGluY29ycmVjdCB0eXBlIGluIHJldHVybiBleHByZXNzaW9uIChk
aWZmZXJlbnQgYmFzZSB0eXBlcykgQEAgICAgZXhwZWN0ZWQgaW50IEBAICAgIGdvdCB2aW50IEBA
Cj4+IGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmM6ODk0OjM4OiBzcGFyc2U6ICAg
IGV4cGVjdGVkIGludAo+PiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jOjg5NDoz
ODogc3BhcnNlOiAgICBnb3Qgdm9pZAotLQo+PiBkcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZm
Yi5jOjEyNjE6NDM6IHNwYXJzZTogc3BhcnNlOiBpbmNvcnJlY3QgdHlwZSBpbiBjb25kaXRpb25h
bCAobm9uLXNjYWxhciB0eXBlKQo+PiBkcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jOjEy
NjE6NDM6IHNwYXJzZTogICAgZ290IHZvaWQKLS0KPj4gZHJpdmVycy92aWRlby9mYmRldi9uZW9m
Yi5jOjIxMzA6NDM6IHNwYXJzZTogc3BhcnNlOiBpbmNvcnJlY3QgdHlwZSBpbiBjb25kaXRpb25h
bCAobm9uLXNjYWxhciB0eXBlKQo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L25lb2ZiLmM6MjEzMDo0
Mzogc3BhcnNlOiAgICBnb3Qgdm9pZAotLQo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhdmFnZS9z
YXZhZ2VmYl9kcml2ZXIuYzoyMzQxOjQzOiBzcGFyc2U6IHNwYXJzZTogaW5jb3JyZWN0IHR5cGUg
aW4gY29uZGl0aW9uYWwgKG5vbi1zY2FsYXIgdHlwZSkKPj4gZHJpdmVycy92aWRlby9mYmRldi9z
YXZhZ2Uvc2F2YWdlZmJfZHJpdmVyLmM6MjM0MTo0Mzogc3BhcnNlOiAgICBnb3Qgdm9pZAoKdmlt
ICs4OTQgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYwoKYzI5NmQ1ZjkgVGhvbWFz
IFBldGF6em9uaSAyMDE0LTEyLTMxICA4NzcgIApjMjk2ZDVmOSBUaG9tYXMgUGV0YXp6b25pIDIw
MTQtMTItMzEgIDg3OCAgLyoqCmMyOTZkNWY5IFRob21hcyBQZXRhenpvbmkgMjAxNC0xMi0zMSAg
ODc5ICAgKglmYnRmdF91bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyIC0gcmVsZWFzZXMgYSB0ZnQgZnJh
bWUgYnVmZmVyIGRldmljZQpjMjk2ZDVmOSBUaG9tYXMgUGV0YXp6b25pIDIwMTQtMTItMzEgIDg4
MCAgICoJQGZiX2luZm86IGZyYW1lIGJ1ZmZlciBpbmZvIHN0cnVjdHVyZQpjMjk2ZDVmOSBUaG9t
YXMgUGV0YXp6b25pIDIwMTQtMTItMzEgIDg4MSAgICoKYzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9u
aSAyMDE0LTEyLTMxICA4ODIgICAqICBGcmVlcyBTUEkgZHJpdmVyZGF0YSBpZiBuZWVkZWQKYzI5
NmQ1ZjkgVGhvbWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4ODMgICAqICBGcmVlcyBncGlvcy4K
YzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4ODQgICAqCVVucmVnaXN0ZXJz
IGZyYW1lIGJ1ZmZlciBkZXZpY2UuCmMyOTZkNWY5IFRob21hcyBQZXRhenpvbmkgMjAxNC0xMi0z
MSAgODg1ICAgKgpjMjk2ZDVmOSBUaG9tYXMgUGV0YXp6b25pIDIwMTQtMTItMzEgIDg4NiAgICov
CmMyOTZkNWY5IFRob21hcyBQZXRhenpvbmkgMjAxNC0xMi0zMSAgODg3ICBpbnQgZmJ0ZnRfdW5y
ZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKYzI5NmQ1ZjkgVGhv
bWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4ODggIHsKYzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9u
aSAyMDE0LTEyLTMxICA4ODkgIAlzdHJ1Y3QgZmJ0ZnRfcGFyICpwYXIgPSBmYl9pbmZvLT5wYXI7
CmMyOTZkNWY5IFRob21hcyBQZXRhenpvbmkgMjAxNC0xMi0zMSAgODkwICAKYzI5NmQ1ZjkgVGhv
bWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4OTEgIAlpZiAocGFyLT5mYnRmdG9wcy51bnJlZ2lz
dGVyX2JhY2tsaWdodCkKYzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4OTIg
IAkJcGFyLT5mYnRmdG9wcy51bnJlZ2lzdGVyX2JhY2tsaWdodChwYXIpOwpjMjk2ZDVmOSBUaG9t
YXMgUGV0YXp6b25pIDIwMTQtMTItMzEgIDg5MyAgCWZidGZ0X3N5c2ZzX2V4aXQocGFyKTsKMTEx
MDdmZmUgQXlhIE1haGZvdXogICAgICAyMDE1LTAyLTI3IEA4OTQgIAlyZXR1cm4gdW5yZWdpc3Rl
cl9mcmFtZWJ1ZmZlcihmYl9pbmZvKTsKYzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9uaSAyMDE0LTEy
LTMxICA4OTUgIH0KYzI5NmQ1ZjkgVGhvbWFzIFBldGF6em9uaSAyMDE0LTEyLTMxICA4OTYgIEVY
UE9SVF9TWU1CT0woZmJ0ZnRfdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcik7CmMyOTZkNWY5IFRob21h
cyBQZXRhenpvbmkgMjAxNC0xMi0zMSAgODk3ICAKCjo6Ojo6OiBUaGUgY29kZSBhdCBsaW5lIDg5
NCB3YXMgZmlyc3QgaW50cm9kdWNlZCBieSBjb21taXQKOjo6Ojo6IDExMTA3ZmZlMmNkMWMxZGM1
OTQ4NzEzZmMwOGExMzcyMTg1YmUwZDUgc3RhZ2luZzogZmJ0ZnQ6IHJlbW92ZSB1bnVzZWQgdmFy
aWFibGUKCjo6Ojo6OiBUTzogQXlhIE1haGZvdXogPG1haGZvdXouc2FpZi5lbHlhemFsQGdtYWls
LmNvbT4KOjo6Ojo6IENDOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAg
ICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL3Bp
cGVybWFpbC9rYnVpbGQtYWxsICAgICAgICAgICAgICAgICAgIEludGVsIENvcnBvcmF0aW9uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
