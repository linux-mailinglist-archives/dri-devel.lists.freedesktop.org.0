Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF220C091
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 12:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029756E0F5;
	Sat, 27 Jun 2020 10:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF546E0F5
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ko1WBuaTVft291cFrh6EMtNl2l+ATUU6FHd28NecRJ8=; b=fllWvduBXw+pXePH+0g7lMXXLn
 TnIl+lBQuYduvXejgmqMp3m2PHJmSQp5swgSSrI6Vx3GPT0dOcAD5QpXEkc3BLVZhm4S5nend6ckp
 FX1R1bKw+FC9D2Y+GxCl+0d7vFAVgyq9nVA/ZFwqYMt1LMgv0oDIuWcAo6iMJIRmeSFc4doNBsrKY
 O6YZOYljqWQFHoJT3Sl4HMt+6cwiiYLIbyBI8bdxQd4aW4ufl7i8H4dLSC+CkXlD/dOqbRcbVMDaH
 AcPgcuWBV05S3tJtFj5coSAigK2qbpurCcgM6GQ1Od6VChxrybvoopd2RaUGwHqFQoR0f+drpT0J1
 lvOn3gpw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:65314
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jp7fO-0001Xk-Tv; Sat, 27 Jun 2020 12:02:34 +0200
Subject: Re: [PATCH v4] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200622140516.10830-1-ppaalanen@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <179d3365-1296-e7a1-bad8-ba7ffd39b3ae@tronnes.org>
Date: Sat, 27 Jun 2020 12:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622140516.10830-1-ppaalanen@gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Karol Herbst <kherbst@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <skeggsb@gmail.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjIuMDYuMjAyMCAxNi4wNSwgc2tyZXYgUGVra2EgUGFhbGFuZW46Cj4gRnJvbTogUGVr
a2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+Cj4gCj4gU2V0IHVwIHRo
ZSBleHBlY3RhdGlvbnMgb24gaG93IGhvdC11bnBsdWdnaW5nIGEgRFJNIGRldmljZSBzaG91bGQg
bG9vayBsaWtlIHRvCj4gdXNlcnNwYWNlLgo+IAo+IFdyaXR0ZW4gYnkgRGFuaWVsIFZldHRlcidz
IHJlcXVlc3QgYW5kIGxhcmdlbHkgYmFzZWQgb24gaGlzIGNvbW1lbnRzIGluIElSQyBhbmQKPiBm
cm9tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIw
LU1heS8yNjU0ODQuaHRtbCAuCj4gCj4gQSByZWxhdGVkIFdheWxhbmQgcHJvdG9jb2wgY2hhbmdl
IHByb3Bvc2FsIGlzIGF0Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQv
d2F5bGFuZC1wcm90b2NvbHMvLS9tZXJnZV9yZXF1ZXN0cy8zNQo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29tPgo+IFJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiBDYzogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4g
Q2M6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiBDYzogTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gQ2M6IEJlbiBTa2VnZ3MgPHNrZWdnc2JAZ21haWwuY29t
Pgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgo+IENjOiBLYXJvbCBIZXJic3QgPGto
ZXJic3RAcmVkaGF0LmNvbT4KPiAKPiAtLS0KPiAKPiBIYXJyeSBhbmQgQ2hyaXN0aWFuLCBjb3Vs
ZCBvbmUgb2YgeW91IGFjayB0aGlzIG9uIGJlaGFsZiBvZiBBTUQKPiBkcml2ZXJzPwo+IAo+IEJl
biBvciBLYXJvbCwgY291bGQgeW91IGFjayBvbiBiZWhhbGYgb2YgTm91dmVhdT8KPiAKPiBOb3Jh
bGYsIHdvdWxkIHRoaXMgd29yayBmb3IgdGhlIHRpbnkgZHJpdmVycyBldGMuPwo+IAoKTG9va3Mg
Z29vZCB0byBtZToKCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KCj4gVGhpcyBpcyBvbmx5IGFib3V0IGxheWluZyBvdXQgcGxhbnMgZm9yIHRoZSBmdXR1cmUs
IG5vdCBhYm91dCB3aGF0Cj4gZHJpdmVycyBkbyB0b2RheS4gV2UnZCBqdXN0IGxpa2UgdG8gYmUg
c3VyZSB0aGUgZ29hbHMgYXJlIHJlYXNvbmFibGUgYW5kCj4gZXZlcnlvbmUgaXMgYXdhcmUgb2Yg
dGhlIGlkZWEuCj4gCj4gVGhhbmtzLAo+IHBxCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
