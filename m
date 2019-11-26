Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D8109A57
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5046E286;
	Tue, 26 Nov 2019 08:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577C46E286
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 08:42:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s5so21347454wrw.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 00:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=JHNZUTPIMG+8vm9Xx7nqvxw7Hrw7f/tddmrI9dcAnk8=;
 b=p8InpKpPxIL0PWBWUud3aSbxO/dPwFXIiMpJqHSN34nE8V7AWJ3gdSaf6AcC++Z0T6
 qlfZKaWjqISjGh/v3sbMe4e/g2Los0LDWnXvNohBOBRhzdpTbUBp1Kf7T85uSU+/qn+1
 Bfn2Ng6i8GWBpDTIMr9zcwGVawoAaCt2a3D/rK6ASIIVvO3h2IrDWd7u/k/hA0VZFa5U
 thnVA7IvrfdRte7RXPDHqaMLp91Zk514DD5pZvOl1XwFFA3xVP0afIB2QOGgDWWfaeM0
 Utxl4I8Vnic19qEvXYumFdvXCdmmL67XpG4kJTsHzefG0q26oqGcJi1Cl8LlwpHnfzE6
 mOgg==
X-Gm-Message-State: APjAAAW7nBCjHjt6eDAQ8O0LZOqOaewT9IgsjAnKsfathK/Sp539M4M2
 wOfZsM7hGPLFPHrtn399c2HJYg==
X-Google-Smtp-Source: APXvYqyLSv+QdXGnFV3g1p8B1aJHrD8G2pitYUfElplL8wg7O0YAPimG7NTzRuqe30vr+WEPIOitpQ==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr22353641wrj.340.1574757775944; 
 Tue, 26 Nov 2019 00:42:55 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b1sm14040556wrs.74.2019.11.26.00.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 00:42:55 -0800 (PST)
Date: Tue, 26 Nov 2019 09:42:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+1e46a0864c1a6e9bd3d8@syzkaller.appspotmail.com>
Subject: Re: WARNING in md_ioctl
Message-ID: <20191126084253.GP29965@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+1e46a0864c1a6e9bd3d8@syzkaller.appspotmail.com>, 
 airlied@linux.ie, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 rafael.antognolli@intel.com, rodrigo.vivi@intel.com,
 shli@kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000a52337056b065fb3@google.com>
 <000000000000f4160705983366e8@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000f4160705983366e8@google.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JHNZUTPIMG+8vm9Xx7nqvxw7Hrw7f/tddmrI9dcAnk8=;
 b=CJV6ZYyKMABUO8sf/kvxRG1FphfBIzrIl/CVoIglL0z9uB6aMJrRc6kD0mwGKBlb5w
 IqPm6qOrqH2nyG0KPUls1bgLf9VGY6Hv+QYX8BF0KfscBWJmjkuurdbFuAXutMeSvhMP
 dG5tRgq7FJSADMvInlQA/GdDSbTK2HFx4h590=
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, shli@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDI6Mzc6MDFQTSAtMDgwMCwgc3l6Ym90IHdyb3RlOgo+
IHN5emJvdCBoYXMgYmlzZWN0ZWQgdGhpcyBidWcgdG86Cj4gCj4gY29tbWl0IDRiNmNlNjgxMGE1
ZGMwYWYzODdhMjM4ZThjODUyZTBkMzgyMjM4MWYKPiBBdXRob3I6IFJhZmFlbCBBbnRvZ25vbGxp
IDxyYWZhZWwuYW50b2dub2xsaUBpbnRlbC5jb20+Cj4gRGF0ZTogICBNb24gRmViIDUgMjM6MzM6
MzAgMjAxOCArMDAwMAo+IAo+ICAgICBkcm0vaTkxNS9jbmw6IFdhUGlwZUNvbnRyb2xCZWZvcmUz
RFN0YXRlU2FtcGxlUGF0dGVybgoKVGhpcyBzZWVtcyB2ZXJ5IHVubGlrZWx5LCB0aGUgcmVwcm9k
dWNlciBkb2Vzbid0IG9wZW4gYSBkcm0gZGV2aWNlLCBhbmQKSSdkIGJlIHN1cnByaXNlZCBpZiB5
b3VyIGdjZCBpbnN0YW5jZXMgaGF2ZSBhbiBhY3R1YWwgaTkxNSBkZXZpY2UgaW4gdGhlbQooYnV0
IEkgY2FuJ3QgY2hlY2sgYmVjYXVzZSBib290IGxvZyBpc24ndCBwcm92aWRlZCwgZGlkbid0IGZp
bmQgaXQgb24gdGhlCmRhc2hib2FyZCBlaXRoZXIpLgoKU2luY2UgaTkxNSBpcyBidWlsdC1pbiBJ
IHN1c3BlY3QgdGhpcyBzaW1wbHkgbW92ZWQgc29tZXRoaW5nIGVsc2UgaW4gdGhlCmtlcm5lbCBp
bWFnZSBhcm91bmQgd2hpY2ggcHJvdm9rZXMgdGhlIGJ1Zy4KLURhbmllbAoKPiAKPiBiaXNlY3Rp
b24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTNh
ZWI1MjJlMDAwMDAKPiBzdGFydCBjb21taXQ6ICAgYzYxYTU2YWIgTWVyZ2UgYnJhbmNoICd4ODYt
dXJnZW50LWZvci1saW51cycgb2YgZ2l0Oi8vZ2l0Li4uCj4gZ2l0IHRyZWU6ICAgICAgIHVwc3Ry
ZWFtCj4gZmluYWwgY3Jhc2g6ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVw
b3J0LnR4dD94PTEwNmViNTIyZTAwMDAwCj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE3YWViNTIyZTAwMDAwCj4ga2VybmVsIGNvbmZp
ZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTQwMTMxODBlN2M3
YTlmZjkKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVn
P2V4dGlkPTFlNDZhMDg2NGMxYTZlOWJkM2Q4Cj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9MTZiY2EyMDc4MDAwMDAKPiBDIHJlcHJv
ZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTQ4MTlh
NDc4MDAwMDAKPiAKPiBSZXBvcnRlZC1ieTogc3l6Ym90KzFlNDZhMDg2NGMxYTZlOWJkM2Q4QHN5
emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBGaXhlczogNGI2Y2U2ODEwYTVkICgiZHJtL2k5MTUv
Y25sOgo+IFdhUGlwZUNvbnRyb2xCZWZvcmUzRFN0YXRlU2FtcGxlUGF0dGVybiIpCj4gCj4gRm9y
IGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wv
dHBzbUVKI2Jpc2VjdGlvbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
