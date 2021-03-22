Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46026344E4D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 19:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C6B6E045;
	Mon, 22 Mar 2021 18:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D6A6E4F8;
 Mon, 22 Mar 2021 16:31:54 +0000 (UTC)
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1lONSm-0008Gw-T8; Mon, 22 Mar 2021 16:31:33 +0000
Date: Mon, 22 Mar 2021 17:31:31 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
Message-ID: <20210322163131.yaovowes2raydgyg@wittgenstein>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322160253.4032422-4-arnd@kernel.org>
X-Mailman-Approved-At: Mon, 22 Mar 2021 18:19:57 +0000
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
Cc: dri-devel@lists.freedesktop.org, James Morris <jmorris@namei.org>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Martin Sebor <msebor@gcc.gnu.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6MDI6NDFQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IGdjYy0xMSBp
bnRyb2RjZXMgYSBoYXJtbGVzcyB3YXJuaW5nIGZvciBjYXBfaW5vZGVfZ2V0c2VjdXJpdHk6Cj4g
Cj4gc2VjdXJpdHkvY29tbW9uY2FwLmM6IEluIGZ1bmN0aW9uIOKAmGNhcF9pbm9kZV9nZXRzZWN1
cml0eeKAmToKPiBzZWN1cml0eS9jb21tb25jYXAuYzo0NDA6MzM6IGVycm9yOiDigJhtZW1jcHni
gJkgcmVhZGluZyAxNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJp
bmdvcC1vdmVycmVhZF0KPiAgIDQ0MCB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWVtY3B5KCZuc2NhcC0+ZGF0YSwgJmNhcC0+ZGF0YSwgc2l6ZW9mKF9fbGUzMikgKiAyICogVkZT
X0NBUF9VMzIpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAKPiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdG1wYnVmIGlzIGluaXRpYWxpemVk
IHRvIE5VTEwsIHNvIGdjYyBhc3N1bWVzCj4gaXQgaXMgbm90IGFjY2Vzc2libGUgdW5sZXNzIGl0
IGdldHMgc2V0IGJ5IHZmc19nZXR4YXR0cl9hbGxvYygpLiAgVGhpcyBpcwo+IGEgbGVnaXRpbWF0
ZSB3YXJuaW5nIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBidXQgdGhlIGNvZGUgaXMgY29ycmVjdCBz
aW5jZQo+IGl0IGNvcnJlY3RseSBoYW5kbGVzIHRoZSBlcnJvciB3aGVuIHRoYXQgZnVuY3Rpb24g
ZmFpbHMuCj4gCj4gQWRkIGEgc2VwYXJhdGUgTlVMTCBjaGVjayB0byB0ZWxsIGdjYyBhYm91dCBp
dCBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gLS0tCgpTZWVtcyByZWFzb25hYmxlLApBY2tlZC1ieTogQ2hyaXN0aWFuIEJyYXVuZXIg
PGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
