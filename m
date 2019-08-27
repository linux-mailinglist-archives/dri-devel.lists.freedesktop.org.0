Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E39EA9F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 16:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13A89951;
	Tue, 27 Aug 2019 14:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3254389951
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 14:15:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id e24so18604661ljg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 07:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfeseVQWz48HAsLr5kcHWdtkdT6kJKG3U+x7h2FYyGM=;
 b=qkUJ3wLsSSvNC4THEFZ8aEq3u8vhxFtVVwWbadevHWQ8CRm+9X1tQEJc95fjNnjfHm
 wOU3G07OJTy0YTc6i+eSEj4AFwb4vcotDDF4OjnZ4lhRa96HpD+RY3mGFgVnDowHsHQy
 TOdUzNRSWJJGyzWzp9dGJ6+jJ9iDydNWVlx1EGZsbHoWhUHC2PJPkQgUxyh1a4ZOhYD+
 +XKEGpRQY+ps8dTRpGRJqmFc4kVVJKdNCav0TRD8UnvlzqoKiT4IuOqLV0EqJ6Q/QreG
 ieLPIR9ftFs2v7TYABNkU1Y87NjmOGH5oNzcknzyaBDAPQiChohc2Kngaq0OVR//8Mmz
 kuVw==
X-Gm-Message-State: APjAAAXgVAlioAUbwcjxjmOztb7KReUp+FNZ5T2LbLcXt87lSulvn8Is
 CJOa4awgn24cdZBeGDVYFF38g6yXrJLsuxmPxGU=
X-Google-Smtp-Source: APXvYqynbPEMJ5NJosXQEn553TI+EwJm9qEyttNHdgRx0B6Cd7hXJqH69rtOKEoglJrjQ9eC04IA7D0x4NcOdaJK7k0=
X-Received: by 2002:a2e:980d:: with SMTP id a13mr14098210ljj.145.1566915310400; 
 Tue, 27 Aug 2019 07:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190822192451.5983-1-scott.branden@broadcom.com>
 <20190822192451.5983-7-scott.branden@broadcom.com>
In-Reply-To: <20190822192451.5983-7-scott.branden@broadcom.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Aug 2019 16:14:54 +0200
Message-ID: <CAK8P3a1WBkmXbJx=rZMumxn7EN4bmA1AdZEgrWBVyQ3XNngU6Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] misc: bcm-vk: add Broadcom Valkyrie driver
To: Scott Branden <scott.branden@broadcom.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Brown <david.brown@linaro.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, James Hu <james.hu@broadcom.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Desmond Yan <desmond.yan@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgOToyNSBQTSBTY290dCBCcmFuZGVuCjxzY290dC5icmFu
ZGVuQGJyb2FkY29tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgQnJvYWRjb20gVmFsa3lyaWUgZHJpdmVy
IG9mZmxvYWQgZW5naW5lLgo+IFRoaXMgZHJpdmVyIGludGVyZmFjZXMgdG8gdGhlIFZhbGt5cmll
IFBDSWUgb2ZmbG9hZCBlbmdpbmUgdG8gcGVyZm9ybQo+IHNob3VsZCBvZmZsb2FkIGZ1bmN0aW9u
cyBhcyB2aWRlbyB0cmFuc2NvZGluZyBvbiBtdWx0aXBsZSBzdHJlYW1zCj4gaW4gcGFyYWxsZWwu
ICBWYWxreXJpZSBkZXZpY2UgaXMgYm9vdGVkIGZyb20gZmlsZXMgbG9hZGVkIHVzaW5nCj4gcmVx
dWVzdF9maXJtd2FyZV9pbnRvX2J1ZiBtZWNoYW5pc20uICBBZnRlciBib290ZWQgY2FyZCBzdGF0
dXMgaXMgdXBkYXRlZAo+IGFuZCBtZXNzYWdlcyBjYW4gdGhlbiBiZSBzZW50IHRvIHRoZSBjYXJk
Lgo+IFN1Y2ggbWVzc2FnZXMgY29udGFpbiBzY2F0dGVyIGdhdGhlciBsaXN0IG9mIGFkZHJlc3Nl
cwo+IHRvIHB1bGwgZGF0YSBmcm9tIHRoZSBob3N0IHRvIHBlcmZvcm0gb3BlcmF0aW9ucyBvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFNjb3R0IEJyYW5kZW4gPHNjb3R0LmJyYW5kZW5AYnJvYWRjb20u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IERlc21vbmQgWWFuIDxkZXNtb25kLnlhbkBicm9hZGNvbS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSHUgPGphbWVzLmh1QGJyb2FkY29tLmNvbT4KCkNh
biB5b3UgZXhwbGFpbiB0aGUgZGVjaXNpb24gdG8gbWFrZSB0aGlzIGlzIGEgc3RhbmRhbG9uZSBt
aXNjIGRyaXZlcgpyYXRoZXIgdGhhbiBob29raW5nIGludG8gdGhlIGV4aXN0aW5nIGZyYW1ld29y
ayBpbiBkcml2ZXJzL21lZGlhPwoKVGhlcmUgaXMgYW4gZXhpc3RpbmcgaW50ZXJmYWNlIHRoYXQg
bG9va3MgbGlrZSBpdCBjb3VsZCBmaXQgdGhlIGhhcmR3YXJlCmluIGluY2x1ZGUvbWVkaWEvdjRs
Mi1tZW0ybWVtLmguIEhhdmUgeW91IGNvbnNpZGVyZWQgdXNpbmcgdGhhdD8KClRoZXJlIGlzIGFs
c28gc3VwcG9ydCBmb3IgdmlkZW8gdHJhbnNjb2RpbmcgdXNpbmcgR1BVcyBpbgpkcml2ZXIvZ3B1
L2RybS8sIHRoYXQgY291bGQgYWxzbyBiZSB1c2VkIGluIHRoZW9yeSwgdGhvdWdoIGl0IHNvdW5k
cwpsaWtlIGEgbGVzcyBvcHRpbWFsIGZpdC4KCiAgICAgIEFybmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
