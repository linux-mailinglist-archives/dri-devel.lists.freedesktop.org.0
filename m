Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5BF78B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 17:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1C6E946;
	Mon, 11 Nov 2019 16:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293E36E946;
 Mon, 11 Nov 2019 16:25:18 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MtwQm-1hcEOu3QUu-00uMby; Mon, 11 Nov 2019 17:25:17 +0100
Received: by mail-qt1-f169.google.com with SMTP id t20so16245210qtn.9;
 Mon, 11 Nov 2019 08:25:16 -0800 (PST)
X-Gm-Message-State: APjAAAVocy9fe3OyxP9lRnqq6JWaHQ2EKZXc2sAovc2C0tsVETqWen7T
 4ks2zjDeOrpKVLLlNp49H4rBNioKEnWVAGdCn+M=
X-Google-Smtp-Source: APXvYqzhEX+Ry63FPgxImqPVdNg3+01We4bix3tpiOsVLV3c4EpCOOaUFn43GI00Tsjcb2HTxmGTLXXXT8IHHLMKa0E=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr26604573qtk.304.1573489515656; 
 Mon, 11 Nov 2019 08:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20191108213257.3097633-1-arnd@arndb.de>
 <20191108213257.3097633-16-arnd@arndb.de>
 <3a0cfce79620152facfe31b442a735db1dcda436.camel@pengutronix.de>
 <CAK8P3a13jSRqzZ-aDETdxk-BKgfXaAhdWiSn7aW+u3MFf06fWw@mail.gmail.com>
 <7379bfe6c530132caab4cd930cd94f0e28c935ff.camel@pengutronix.de>
In-Reply-To: <7379bfe6c530132caab4cd930cd94f0e28c935ff.camel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 17:24:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SA+LbVCnm8qhc-Xk1kboGhkRQsK0XAuMya8TmaD4+TA@mail.gmail.com>
Message-ID: <CAK8P3a0SA+LbVCnm8qhc-Xk1kboGhkRQsK0XAuMya8TmaD4+TA@mail.gmail.com>
Subject: Re: [PATCH 15/16] drm/etnaviv: use ktime_t for timeouts
To: Lucas Stach <l.stach@pengutronix.de>
X-Provags-ID: V03:K1:TX9eDjE5QT/+4mxM9rQ1BaNqeRkgbmbFVOyYdXCJZdswN6Zxwtc
 7b1CLv9dqOUue6c3qOSQt/apkPVXdeoq+VSl0qtcPmpPRHej+zqjLtFJr6rcq1zcA2qlZrY
 rPSD6qiqs6QuGLaSXt+umOONbW+VTb27XIGcaG0FcQlc4VmOczJ7O8UWeXHXm9clf36Qu7B
 7a1VPKHhToxRQtVwbJzPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YDqU36Nicqg=:ATQe/O/YoWw5W5kVvkFRRP
 FyczyCcHhy9P0QTJmNZmQAEVWbVQ7D0qiY6VAhJnNQylR0GCLHjF6VAf7+FbAiar1bKultZfG
 DVh0OvT5pdeHQBdaLgOQejnF8bfyR5Pegy2uurGoXLMrXTUz3F+VqmQBT2gQP7Ma3ZrRAX2e/
 UJQB/YtqUVHLtcY8bOUR9UbxH4Mt3B/f6pH8nScOPL52yEVmlluMlahAzbPKcWEzlu+xqfEpJ
 SceSTGSa1dx8GfDjXkZ5eVz1yYo87tXTJg4MqLPDgLU1JV1bRRtRME66Q1YKVG+qlUqoJDDg1
 n0+f5is3+ZCl0kLH+8d9RbFE4Re+ykBtWaUOAU7EqM7HqEqry8tqUf+FuZriq6o/dSPowwvIT
 syRVtJMTQdXTv42SJIx7fzKk1eVM3rZhUng2qIVsyrmZ0VyOYMp4Tb7KHHAo/TYxEhsGU2nFH
 2y6xDZdEX8ZkKmMkFBODclVqaUfb0BiRa0JKq2BO1JfhlIwHs0G5AVTUbdIqH0JD4aPwukjap
 K9kpJCdHZnM9uvaVmYgdFGi60nx29RztZMfRPJlFfuyXKLaFnLaj3bdae9ei5VRtdN7eMwxt2
 702u+ctTOED5oQWvXvTh7wP5/r9eR48urIpIvWSw4dIHv0+s9H0fRcfHaE3NTrke1BxrsoC93
 Ps9sBBOe3ISiFTCVjw82sH10cPdRy6NSo//6633HUj5XUQIXF+nZ3RCUHLhVAiYiipP4slBqz
 D2v++xLajos3gJW9x62pDx102rGcV+7DRP1F/Vj7JuljvJG9++ThQTLgcNg7Ug7ODVokgBG9v
 OtN0CZeA33LmejPRKUX9S2kuPuy/z1vqH7RlbuNN3uBC/HOcLxPWGySkYusQYhVjABj+OUlBT
 cNQkKNv+966Gyd5lH0ag==
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTA6NTUgQU0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+IHdyb3RlOgo+ID4KPiA+ID4gSWYgdGhhdCdzIHRoZSBjYXNlIHRoZW4gd2Ug
c2hvdWxkIG5ldmVyIGVuY291bnRlciBhIGdlbnVpbmUgMCB0aW1lb3V0Cj4gPiA+IGFuZCB0aGlz
IGNoYW5nZSB3b3VsZCBiZSBva2F5Lgo+ID4KPiA+IFRoYXQncyBxdWl0ZSBsaWtlbHksIEknZCBz
YXkgYW55IHByb2dyYW0gcGFzc2luZyB7MCwwfSBhcyBhIHRpbWVvdXQgd2l0aG91dAo+ID4gRVRO
QV9XQUlUX05PTkJMT0NLIGlzIGFscmVhZHkgYnJva2VuLCBidXQgaWYgd2UgbGVhdmUgaXQgbGlr
ZSB0aGF0LAo+ID4gaXQgd291bGQgYmUgYmVzdCB0byBkZXNjcmliZSB0aGUgcmVhc29uaW5nIGlu
IHRoZSBjaGFuZ2Vsb2cuCj4gPgo+ID4gU2hvdWxkIEkgY2hhbmdlIHRoZSBjaGFuZ2Vsb2csIG9y
IGNoYW5nZSB0aGUgcGF0Y2ggdG8gcmVzdG9yZSB0aGUKPiA+IGN1cnJlbnQgYmVoYXZpb3IgaW5z
dGVhZD8KPiA+Cj4gPiBJIGd1ZXNzIEkgY291bGQgZm9sZCB0aGUgY2hhbmdlIGJlbG93IGludG8g
bXkgcGF0Y2ggdG8gbWFrZSBpdCB0cmFuc3BhcmVudAo+ID4gdG8gdGhlIGFwcGxpY2F0aW9uIGFn
YWluLgo+Cj4gSWYgd2UgYXNzdW1lIDAgdG8gbmV2ZXIgYmUgYSB2YWxpZCB0aW1lb3V0LCBkdWUg
dG8gbW9ub3RvbmljIGNsb2NrCj4gc3RhcnRpbmcgYXQgMCBhbmQgbmV2ZXIgd3JhcHBpbmcgdGhl
biBJIHRoaW5rIHdlIHNob3VsZG4ndCBpbnRyb2R1Y2UKPiBhbnkgYWRkaXRpb25hbCBjb2RlIGNv
bXBsZXhpdHkgdG8gZml4IHVwIHRoZSByZXR1cm4gdmFsdWUgZm9yIHRoaXMKPiBzcGVjaWZpYyBj
YXNlLiBJJ20gbm90IGF3YXJlIG9mIGFueSBldG5hdml2IHVzZXJzcGFjZSBiZWluZyBicm9rZW4g
aW4KPiB0aGlzIHdheSB0byByZWx5IG9uIHRoZSByZXR1cm4gdmFsdWUgZm9yIGFuIGludmFsaWQg
dGltZW91dCBpbnB1dC4KPgo+IFBsZWFzZSBqdXN0IGFtZW5kIHRoZSBjb21taXQgbWVzc2FnZSB0
byBtZW50aW9uIHRoZSBjaGFuZ2UgaW4gYmVoYXZpb3IKPiBhbmQgd2h5IHdlIHRoaW5rIGl0IGlz
IHNhZmUgdG8gZG8uCgpSdXNzZWxsIGhhZCBzb21lIGFkZGl0aW9uYWwgY29uY2VybnMgdGhhdCBo
ZSByYWlzZWQgb24gSVJDLAphbmQgSSBkaWQgYSBuZXcgc2ltcGxlciBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgcGF0Y2gsIHBsdXMgYSByZWxhdGVkCmJ1Z2ZpeC4KClBsZWFzZSBoYXZlIGEgbG9vayBh
dCB0aG9zZS4KCiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
