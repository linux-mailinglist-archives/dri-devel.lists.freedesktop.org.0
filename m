Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E2F330B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 16:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C866E0FF;
	Thu,  7 Nov 2019 15:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB696E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 15:29:18 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id o49so2787616qta.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 07:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kj+RMnwa9bAM6y6Y3sVjyaJSaw0mEdf8JHAxyNOdU+I=;
 b=qXydraVhBgVBUUxQjItG9q2sZvyUcG52BOaxzRPDy3fqhYAfhIBRqBJdHRoNoW9rjW
 YiIWrNvmLPuJm+gYo7py3Vr2EWvLTVPw75d+kQ03jRRB5y/mjVZLKL2tPsKptepzQfUz
 WK6znuYnsLdbxCDV7waWXnbp+9t+RAMnc2R0PIew7yVTup7NHdIr0v2rrnFGxMJy7+KQ
 bVwAOFAyZ1wx8oKmz1mvPm15mkRynBCOWcqarE4VH49OLiQzRuxeIrmyIafl8BbfhPWb
 9zrEdIHPlKTlOg562qQQHKpWyvRE/zruDMUCfquEgLWdSl9NPUqezEXmkKbmw8XCLKmS
 y8lg==
X-Gm-Message-State: APjAAAXcMmUs3tNZTpe0W+WAEOT0+PAbmZiKaXwC8eugCOSOAHZXXaMS
 NTFYO517F88Eqls4qqM49r4=
X-Google-Smtp-Source: APXvYqz/xJmeYKPcsq77wNyL9N551x2ABFW1E4nOUvPNyDlyubWRQS0kwJ1fbQsbiDRp97AFQ+Zohw==
X-Received: by 2002:aed:3b6c:: with SMTP id q41mr4358043qte.11.1573140557672; 
 Thu, 07 Nov 2019 07:29:17 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::2:3f13])
 by smtp.gmail.com with ESMTPSA id b13sm1095706qtj.64.2019.11.07.07.29.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Nov 2019 07:29:16 -0800 (PST)
Date: Thu, 7 Nov 2019 07:29:14 -0800
From: Tejun Heo <tj@kernel.org>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [RFC PATCH] cgroup: Document interface files and rationale for
 DRM controller
Message-ID: <20191107152914.GU3622521@devbig004.ftw2.facebook.com>
References: <20191104220847.23283-1-brian.welty@intel.com>
 <20191105001505.GR3622521@devbig004.ftw2.facebook.com>
 <d565fc2c-0bd0-a85a-c7ce-12ee5393154d@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d565fc2c-0bd0-a85a-c7ce-12ee5393154d@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Kj+RMnwa9bAM6y6Y3sVjyaJSaw0mEdf8JHAxyNOdU+I=;
 b=U090f3nYuGHfqONSML4lw2ShHwu1EhvZQFByH/J0b/yoysoNRMzQ/7710BtLuraRo6
 z39Z9ZyUrWnIP79yLiCn+kPEyKD0a+ZPpVbwDtHM/4VJcvgkG2pQswD5oTx7GwKvh/hE
 BZEpuBQBJB3UurrSHyU1/Rk6FCcFeLFn+TSD7uaKwrETX9IfH+vW+IQwpfnqWnEYLsmm
 HRu0PB3Adlm6JnThxhWpLqeSUzZ4X9JV++c4ZOL1lY1oAhgv7s53zhvKQly0HaoXYMzl
 4NRiPNrbjdzzMnNvnxAtMXe4xpk/8EZR2g9MWdewoQYDgXrAuc8DLOQ4iiF3mDxhikg7
 T/vw==
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
Cc: Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 Kenny Ho <Kenny.Ho@amd.com>, cgroups@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwNDowODoyMlBNIC0wODAwLCBCcmlhbiBX
ZWx0eSB3cm90ZToKPiBJIHdhcyBtb3JlIGludGVyZXN0ZWQgaW4gaGVhcmluZyB5b3VyIHRob3Vn
aHRzIG9uIHdoZXRoZXIgeW91IGxpa2UKPiB0aGUgYXBwcm9hY2ggdG8gaGF2ZSBhIHNldCBvZiBj
b250cm9scyB0aGF0IGFyZSBjb25zaXN0ZW50IHdpdGggCj4gc29tZSBzdWJzZXQgb2YgdGhlIGV4
aXN0aW5nIENQVS9NRU0gb25lcy4gIEFueSBmZWVkYmFjayBvbiB0aGlzPwo+IERpZG4ndCByZWFs
bHkgbWVhbiB0byBzdWdnZXN0IHRoYXQgYWxsIG9mIHRoZXNlIHdvdWxkIGJlIGluY2x1ZGVkCj4g
ZnJvbSB0aGUgc3RhcnQuCgpJIGRvbid0IHNlZSB3aHkgdGhleSBzaG91bGQgYmUgc3luY2hyb25p
emVkLiAgSWYgaXQgZW5kcyB1cCBiZWluZwphYm91dCB0aGUgc2FtZSBhbnl3YXksIHRoZXJlJ3Mg
bm8gcmVhc29uIHRvIG5vdCBzeW5jIHRoZW0gYnV0IHRoYXQKZG9lc24ndCBzZWVtIHZlcnkgbGlr
ZWx5IHRvIG1lIGFuZCB0cnlpbmcgdG8gc3luYyBzb3VuZHMgbGlrZSBhZGRpbmcKYW4gdW5uZWNl
c3NhcnkgY29uc3RyYWludC4gIE9uZSBzaWRlIG9mIHRoZSBiYWxsb3QgaXMgcG9zc2libHkgbWlz
c2luZwpvbiBhZXN0aGV0aWNzIGEgYml0IHdoaWxlIHRoZSBvdGhlciBzaWRlIGlzIGNvbnN0cmFp
bmluZyBpbnRlcmZhY2UKZGVzaWduIGV2ZW4gYmVmb3JlIHVuZGVyc3RhbmRpbmcgdGhlIGRlc2ln
biBzcGFjZSwgc28uLi4KCj4gV291bGQgeW91IGFncmVlIHRoYXQgdGhpcyByZWR1Y2VkIHNldCBp
cyBhIHJlYXNvbmFibGUgc3RhcnRpbmcgcG9pbnQ/Cj4gKyAgc2NoZWQud2VpZ2h0Cj4gKyAgbWVt
b3J5LmN1cnJlbnQKPiArICBtZW1vcnkubWF4Cj4gCj4gVGhvdWdodHMgb24gd2hldGhlciB0aGlz
IHNob3VsZCBiZSB2ZXJ5IEdQVS1zcGVjaWZpYyBjZ3JvdXBzIGNvbnRyb2xsZXIKPiBvciBzaG91
bGQgYmUgbW9yZSBmb3J3YXJkIHRoaW5raW5nIHRvIGJlIHVzZWZ1bCBmb3Igb3RoZXIgJ2FjY2Vs
ZXJhdG9yJwo+IHR5cGUgZGV2aWNlcyBhcyB3ZWxsPwoKTXkgcHJlZmVyZW5jZSBpcyBzdGFydGlu
ZyBzbWFsbCBhbmQgZm9jdXNlZC4gIEdQVSBieSBpdHNlbGYgaXMgYWxyZWFkeQphIGJpZyBlbm91
Z2ggcHJvYmxlbSBhbmQgdGhlIHByb2dyZXNzIHVwdG8gdGhpcyBwb2ludCBldmlkZW50bHkKaW5k
aWNhdGVzIGV2ZW4gdGhhdCBhbG9uZSBpcyBwb29ybHkgbWFwcGVkIG91dC4gIFBsZWFzZSBzdGFy
dCB3aXRoIHRoZQpzbWFsbGVzdCBhbmQgbW9zdCBjb21tb24gKHRpZWQgdG8gdXNhZ2UsIG5vdCBo
YXJkd2FyZSkgaW50ZXJmYWNlCnRoYXQncyB2aWFibGUuCgpUaGFua3MuCgotLSAKdGVqdW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
