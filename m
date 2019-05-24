Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDD29BFD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E7A6E11B;
	Fri, 24 May 2019 16:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8ED6E11B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 16:19:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l25so15106779eda.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=CPXRqRXi1dkgpDWgkFmv18S2UXCoASA126/ZLDqpep8=;
 b=m54HCQBJN/7S8iL0Osxoq1TvGr0LiW46hdfG/Qf7oh6vdw0duOYO0TumpMDl/I5c3/
 CB0E7PpX9vAWjXZeyeiWqAzp7TFDXrIAJ/I8+lJ4HFGo3J9GztcB7qDYVKSCViccQIeW
 KQ1KQu79Y3k2Pvw/pcDpUCPfNwsO9zxXlc27oEQlVGTLnhpxxdsfXvmtnl9LwDy6ckiq
 6PB3x1KacU3pI4kO7OeYxJokWr8ysiv/dNCBYLA3FTBu2toBffDxtY84UUbO/f9RABPI
 rkjL/c8KK+te51qGJ/n2hz2vYZIjZkMQDEZjOU3bU6jBk1YNuY5k9MF8awNXILs4Lj2i
 nMpQ==
X-Gm-Message-State: APjAAAUOiOUslfGDrotgOL19afcMkiQx7tXt9m2BVrv7Zd7aAJNTjgc7
 W+YBLqTYjj4k2PkJRMnQYfiFRg==
X-Google-Smtp-Source: APXvYqxgOqPPzrf9EfWwfmeL3Crqrk0YFhsfqKE5TlV0QEK2AcOGsS18h9BWypj8BrokO9/WGm1gEQ==
X-Received: by 2002:a17:906:ecee:: with SMTP id
 qt14mr79168553ejb.96.1558714765767; 
 Fri, 24 May 2019 09:19:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g18sm848038edh.13.2019.05.24.09.19.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 09:19:24 -0700 (PDT)
Date: Fri, 24 May 2019 18:19:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Message-ID: <20190524161922.GB21222@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
 <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
 <20190524201548.2e8594a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524201548.2e8594a2@canb.auug.org.au>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CPXRqRXi1dkgpDWgkFmv18S2UXCoASA126/ZLDqpep8=;
 b=UylskouGfFzdz9k+rD+nBUfnMYwu3B0Nrzz9IwSBv0raqC8VeO7Lkj9KRYotH32kPR
 nHWepxV6u3vgwH2ef+aZf2ztNNBaHS3ozEOEmxUDfkARJoFeLSU91+wVtTaehbyEkGlW
 WkJRGJNPShq1SMDUDasYCQlV9bDsrgqX/R4nk=
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDg6MTU6NDhQTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gRnJpLCAyNCBNYXkgMjAxOSAxMDowOToyOCAr
MDIwMCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IE9uIEZy
aSwgTWF5IDI0LCAyMDE5IGF0IDEyOjI5IEFNIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1
dWcub3JnLmF1PiB3cm90ZToKPiA+ID4KPiA+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLWZpeGVz
IHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0Cj4gPiA+IGFsbG1vZGNvbmZp
ZykgZmFpbGVkIGxpa2UgdGhpczoKPiA+ID4KPiA+ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6IEluIGZ1bmN0aW9uICdsb2FkX2Rt
Y3VfZncnOgo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYzo2Njc6NzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uICdBU0lDUkVWX0lTX1BJQ0FTU08nOyBkaWQgeW91IG1lYW4gJ0FTSUNSRVZfSVNfVkVH
QTEyX1AnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ID4gICAg
aWYgKEFTSUNSRVZfSVNfUElDQVNTTyhhZGV2LT5leHRlcm5hbF9yZXZfaWQpKQo+ID4gPiAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiA+ICAgICAgICBBU0lDUkVWX0lTX1ZFR0ExMl9QCj4g
PiA+Cj4gPiA+IENhdXNlZCBieSBjb21taXQKPiA+ID4KPiA+ID4gICA1NTE0M2RjMjNjYTQgKCJk
cm0vYW1kL2Rpc3BsYXk6IERvbid0IGxvYWQgRE1DVSBmb3IgUmF2ZW4gMSIpCj4gPiA+Cj4gPiA+
IEkgaGF2ZSByZXZlcnRlZCB0aGF0IGNvbW1pdCBmb3IgdG9kYXkuICAKPiA+IAo+ID4gU2VlbXMg
dG8gY29tcGlsZSBmaW5lIGhlcmUsIGFuZCBEYXZlIGp1c3Qgc2VudCBvdXQgdGhlIHB1bGwgc28g
SSBndWVzcwo+ID4gd29ya3MgZm9yIGhpbSB0b28uIFdoYXQncyB5b3VyIC5jb25maWc/Cj4gCj4g
U2VlIGFib3ZlICJ4ODZfNjQgYWxsbW9kY29uZmlnIgo+IAo+IExvb2tpbmcgYXQgaXQgY2xvc2Vs
eSBub3csIEkgY2FuJ3Qgc2VlIGhvdyB0aGF0IGVycm9yIGNvbWVzIGFib3V0Lgo+IAo+IEFoLCBp
biB0aGUgZHJtLWZpeGVzIHRyZWUsIHRoZSBkZWZpbml0aW9uIG9mICBpcyBwcm90ZWN0ZWQgYnkK
PiAKPiAgICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDEpCj4gCj4gd2hpY2gg
Z2V0cyByZW1vdmVkIGluIHRoZSBhbWRncHUgdHJlZSAobWVyZ2VkIGxhdGVyKS4gIFNvIEkgY2Fu
IG9ubHkKPiBwcmVzdW1lIHRoYXQgQ09ORklHX0RSTV9BTURfRENfRENOMV8wMSB3YXMgbm90IHNl
dCBmb3IgdGhlIGJ1aWxkIEkgZGlkLgo+IAo+IGNvbmZpZyBEUk1fQU1EX0RDCj4gICAgICAgICBi
b29sICJBTUQgREMgLSBFbmFibGUgbmV3IGRpc3BsYXkgZW5naW5lIgo+ICAgICAgICAgZGVmYXVs
dCB5Cj4gICAgICAgICBzZWxlY3QgRFJNX0FNRF9EQ19EQ04xXzAgaWYgWDg2ICYmICEoS0NPVl9J
TlNUUlVNRU5UX0FMTCAmJiBLQ09WX0VOQUJMRV8KPiBDT01QQVJJU09OUylLQ09WX0lOU1RSVU1F
TlRfQUxMICYmIEtDT1ZfRU5BQkxFX0NPTVBBUklTT05TCj4gICAgICAgICBzZWxlY3QgRFJNX0FN
RF9EQ19EQ04xXzAxIGlmIFg4NiAmJiAhKEtDT1ZfSU5TVFJVTUVOVF9BTEwgJiYgS0NPVl9FTkFC
TEVfQ09NUEFSSVNPTlMpCj4gCj4gU28gbWF5YmUgS0NPVl9JTlNUUlVNRU5UX0FMTCAmJiBLQ09W
X0VOQUJMRV9DT01QQVJJU09OUyBhcmUgc2V0IGZvcgo+IGFsbG1vZGNvbmZpZy4gIEkgbm8gbG9u
Z2VyIGhhdmUgdGhlIGFjdHVhbCAuY29uZmlnIGZpbGUgYW55IG1vcmUsIHNvcnJ5LgoKQWggeWVz
LiBEYXZlIGZpZ3VyZWQgaXQgb3V0IHRvbyBhbmQgYWRkZWQgYSByZXZlcnQgb24gdG9wIGFuZCBy
ZWRpZCB0aGUKcHVsbCB0byBMaW51cy4gVGhhbmtzIGZvciBzcG90dGluZyZyZXBvcnRpbmcgdGhp
cy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
