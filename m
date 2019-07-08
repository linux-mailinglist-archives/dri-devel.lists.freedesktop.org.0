Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8676315F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C365489819;
	Tue,  9 Jul 2019 07:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB056E041
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:42:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so14263185qkl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 12:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2520ZhVAOQoNGXYuUGDLJjBfxAVnsIhGVD7re8gWhA=;
 b=ZLFgtgXBfrNLbKuQksNBnJfMnpaEGmzy2hCfhPbqYJEMCt6hZGZ/pwpujJ2259G5eX
 gIP6xK6KIxc/179Mgnh+QcnQK+5OIh3hwn763gLdnqd6mEG1ANg3w4jDvJAWJrAulLxo
 eqCgOarSUVd3yu7uGLovAqYtQt43ST1eOjG53Vs9IO8H1HuCkfJl7iZ9IvEGzzpwXHee
 io6e7GX1c9hVPURt3bubMyIozhddh5HziL9yvjbY5rrIH0HRlDgYYpSnkD+67fpgAlby
 Z/+6M602te//Vo8eb2z1WeforkBSTONBd+dDy/zTVKa5MypexPZM+9LPnmOFLsI+CMvN
 VUxg==
X-Gm-Message-State: APjAAAXINqUYup1C+GqySyGmL6M45iAPfYid9EQCypmnhdI+BkK/PUy5
 LayRy6u1ZDB3cxrg+xHhg7WP8n2oVXIizw==
X-Google-Smtp-Source: APXvYqzDnPKRcu4yowhPT1O3C/U/0l/RxhU7tbYwxwZhmqrWUP3bSIXP+QDg2CkP3cGtGBrlp6jLXA==
X-Received: by 2002:a37:a013:: with SMTP id j19mr15574885qke.401.1562614922050; 
 Mon, 08 Jul 2019 12:42:02 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id a18sm7509573qkk.69.2019.07.08.12.42.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 12:42:01 -0700 (PDT)
Message-ID: <1562614919.8510.9.camel@lca.pw>
Subject: Re: [PATCH v2] gpu/drm_memory: fix a few warnings
From: Qian Cai <cai@lca.pw>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 08 Jul 2019 15:41:59 -0400
In-Reply-To: <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
References: <1562609151-7283-1-git-send-email-cai@lca.pw>
 <CAKb7UvhoW2F5LSf4B=vJhLykPCme_ixwbUBup_sBXjoQa72Fzw@mail.gmail.com>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2520ZhVAOQoNGXYuUGDLJjBfxAVnsIhGVD7re8gWhA=;
 b=FwXdqIF/gpAygHufUZMo4KWVn6X3sII2NMiwCVW4yEdYt73bF+jPuZARQTIXXSrEOL
 2MPhssfotLjGgvN5mmKY6jPn+Ks8ycpjrqfacgetYaStCQjKHZKq04WQpNP3Exek0J+q
 3I83OxfacKbyb+EqHLIybI2E3trBwoNfbBbPV25f59uRRAKCsxMz5oMGUKt4S1CDgLaY
 9epbEvq1KXXDLYvqNvTit3j8CT57G/FI8DFwsbw3pTNTEzViLcvaEUvkt+bDhRXuSHRr
 DAU7fmxgjJB9JtUk0SbLo6Awp9TBXnSP0mO561x7qCrrRLSS1/i4sMZ+foxvGp3KGXWt
 xTVw==
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
Cc: corbet@lwn.net, David Airlie <airlied@linux.ie>,
 torvalds@linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, rfontana@redhat.com,
 gregkh@linuxfoundation.org, joe@perches.com, linux-spdx@archiver.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Sean Paul <sean@poorly.run>,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjIxIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBNb24sIEp1bCA4LCAyMDE5IGF0IDI6MDYgUE0gUWlhbiBDYWkgPGNhaUBsY2EucHc+IHdyb3Rl
Ogo+ID4gCj4gPiBUaGUgb3BlbmluZyBjb21tZW50IG1hcmsgIi8qKiIgaXMgcmVzZXJ2ZWQgZm9y
IGtlcm5lbC1kb2MgY29tbWVudHMsIHNvCj4gPiBpdCB3aWxsIGdlbmVyYXRlIGEgd2FybmluZyB3
aXRoICJtYWtlIFc9MSIuCj4gPiAKPiA+IGRyaXZlcnMvZ3B1L2RybS9kcm1fbWVtb3J5LmM6Mjog
d2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmTCoMKgKiBcZmlsZQo+ID4gZHJtX21lbW9yeS5jCj4g
PiAKPiA+IEFsc28sIHNpbGVuY2UgYSBjaGVja3BhdGNoIHdhcm5pbmcgYnkgYWRkaW5nIGEgbGlj
ZW5zZSBpZGVudGZpdGVyIHdoZXJlCj4gPiBpdCBpbmRpY2F0ZXMgdGhlIE1JVCBsaWNlbnNlIGZ1
cnRoZXIgZG93biBpbiB0aGUgc291cmNlIGZpbGUuCj4gPiAKPiA+IFdBUk5JTkc6IE1pc3Npbmcg
b3IgbWFsZm9ybWVkIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyIHRhZyBpbiBsaW5lIDEKPiA+IAo+
ID4gSXQgYmVjb21lcyByZWR1bmRhbnQgdG8gYWRkIGJvdGggYW4gU1BEWCBpZGVudGlmaWVyIGFu
ZCBoYXZlIGEKPiA+IGRlc2NyaXB0aW9uIG9mIHRoZSBsaWNlbnNlIGluIHRoZSBjb21tZW50IGJs
b2NrIGF0IHRoZSB0b3AsIHNvIHJlbW92ZQo+ID4gdGhlIGxhdGVyLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiA+IC0tLQo+ID4gCj4gPiB2MjogcmVtb3Zl
IHRoZSByZWR1bmRhbnQgZGVzY3JpcHRpb24gb2YgdGhlIGxpY2Vuc2UuCj4gPiAKPiA+IMKgZHJp
dmVycy9ncHUvZHJtL2RybV9tZW1vcnkuYyB8IDIyICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9tZW1vcnkuYwo+ID4gaW5kZXggMTMyZmVmOGZmMWI2Li44NmExMWZjOGU5NTQg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX21lbW9yeS5jCj4gPiBAQCAtMSw0ICsxLDUgQEAKPiA+IC0vKioK
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCj4gPiArLyoKPiA+IMKgICogXGZp
bGUgZHJtX21lbW9yeS5jCj4gPiDCoCAqIE1lbW9yeSBtYW5hZ2VtZW50IHdyYXBwZXJzIGZvciBE
Uk0KPiA+IMKgICoKPiA+IEBAIC0xMiwyNSArMTMsNiBAQAo+ID4gwqAgKiBDb3B5cmlnaHQgMTk5
OSBQcmVjaXNpb24gSW5zaWdodCwgSW5jLiwgQ2VkYXIgUGFyaywgVGV4YXMuCj4gPiDCoCAqIENv
cHlyaWdodCAyMDAwIFZBIExpbnV4IFN5c3RlbXMsIEluYy4sIFN1bm55dmFsZSwgQ2FsaWZvcm5p
YS4KPiA+IMKgICogQWxsIFJpZ2h0cyBSZXNlcnZlZC4KPiA+IC0gKgo+ID4gLSAqIFBlcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhCj4gPiAtICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZQo+ID4gIlNvZnR3YXJlIiksCj4gPiAtICogdG8gZGVhbCBpbiB0
aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQKPiA+IGxp
bWl0YXRpb24KPiA+IC0gKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwKPiA+IC0gKiBhbmQvb3Igc2VsbCBjb3Bp
ZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKPiA+
IC0gKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOgo+ID4gLSAqCj4gPiAtICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3Rp
Y2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1ZGluZyB0aGUKPiA+IG5leHQKPiA+
IC0gKiBwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3Rh
bnRpYWwgcG9ydGlvbnMgb2YKPiA+IHRoZQo+ID4gLSAqIFNvZnR3YXJlLgo+ID4gLSAqCj4gPiAt
ICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0Yg
QU5ZIEtJTkQsIEVYUFJFU1MKPiA+IE9SCj4gPiAtICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBO
T1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCj4gPiAtICog
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC7CoMKg
SU4gTk8gRVZFTlQgU0hBTEwKPiA+IC0gKiBWQSBMSU5VWCBTWVNURU1TIEFORC9PUiBJVFMgU1VQ
UExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTCj4gPiBPUgo+IAo+IFRoaXMg
dGFsa3MgYWJvdXQgVkEgTGludXggU3lzdGVtcyBhbmQvb3IgaXRzIHN1cHBsaWVycywgd2hpbGUg
dGhlIE1JVAo+IGxpY2VuY2UgdGFsa3MgYWJvdXQgYXV0aG9ycyBvciBjb3B5cmlnaHQgaG9sZGVy
cy4KPiAKPiBBcmUgc3VjaCB0cmFuc2Zvcm1hdGlvbnMgT0sgdG8ganVzdCBkbz8KCkZyb20sCgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9Eb2N1bWVudAphdGlvbi9wcm9jZXNzL2xpY2Vuc2UtcnVsZXMucnN0Cgoi
VGhlIExpbnV4IGtlcm5lbCByZXF1aXJlcyB0aGUgcHJlY2lzZSBTUERYIGlkZW50aWZpZXIgaW4g
YWxsIHNvdXJjZSBmaWxlcy4iCgpUaGF0IGlzIHRoZSBjbG9zZXN0IGxpY2Vuc2UgSSBjYW4gdGhp
bmsgb2YuCgpBbnl3YXksIEkgaGF2ZSBhZGRlZCBhIGZldyBwZW9wbGUgd2hvIG1heSBrbm93IGJl
dHRlciBvZiB0aGUgbGljZW5zaW5nLgoKPiAKPiDCoCAtaWxpYQo+IAo+ID4gLSAqIE9USEVSIExJ
QUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJX
SVNFLAo+ID4gLSAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBU
SEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgo+ID4gLSAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBT
T0ZUV0FSRS4KPiA+IMKgICovCj4gPiAKPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4K
PiA+IC0tCj4gPiAxLjguMy4xCj4gPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
