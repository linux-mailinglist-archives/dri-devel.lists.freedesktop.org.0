Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC556F2838
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041AC6EEA0;
	Thu,  7 Nov 2019 07:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ABC6EDAB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:36:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h2so20884694qto.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7KpqrJ6c3XzLpPaCXXTrXg1Ygmesx98ds69e2jPzvI=;
 b=jbM/Mz4BYHKN2tw+7sjx+RX8PPLbPQThN7CHaeIqrnnEstlya2aGS13lPcgH84q2hU
 IphIoNb8Zye7b0hFA8wMS8LI3/Lb/IbOowqQ/dJljLImkR1biubdB0j8Fi8xOJIdwmdh
 DdVtbnpuuodMJYAJqpJEtcWyJcBsO7IGADoR6qV03lA4c8OI5bKLUKtXW+512CNnx7gy
 /+/bB2bb8TNYrAV7qI8Qg3dbW5kXCMWk7kyRZ1Bv3JpxHtJmDxWHs+RAY2dNxGZ5JHBT
 BencSMuPcW4SuVdsczVnQCUJoTI5Me1GicI4pZU5niMQrqOik3urJdyUuDUJFH3OwhnY
 qBgg==
X-Gm-Message-State: APjAAAUjgoIzWQWOiz8t3vWN//CLRKrUPSYh7dcXYFHWIZ6deHRlm01y
 y9v+AzqUHQPKscliteEjZOgWZUcXoOB5ZgkeYOMQog==
X-Google-Smtp-Source: APXvYqx01RSgCCKXEJT1Ax6iIpPZvFs2LcH1CVVGp7m6MH+4R7cQDIoZugPLUrxj4JccnSQWE1vErK43/SZV4av/ho8=
X-Received: by 2002:aed:24af:: with SMTP id t44mr2869020qtc.57.1573054616672; 
 Wed, 06 Nov 2019 07:36:56 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b2de3a0594d8b4ca@google.com>
 <00000000000012ff570596af15cc@google.com>
 <CAKMK7uFQt+=7XMo9jvz77QvDWLAAU_V7-_qZ=iKe-GXG7cqeJg@mail.gmail.com>
In-Reply-To: <CAKMK7uFQt+=7XMo9jvz77QvDWLAAU_V7-_qZ=iKe-GXG7cqeJg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 Nov 2019 16:36:45 +0100
Message-ID: <CACT4Y+a3WWKLPoLD7LC44gaDNQ-p13dW5FT4w1MatcL61u_+XQ@mail.gmail.com>
Subject: Re: WARNING in drm_mode_createblob_ioctl
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+7KpqrJ6c3XzLpPaCXXTrXg1Ygmesx98ds69e2jPzvI=;
 b=KIqiCb4EgjrA+TaMrhn0slRxX6kGSDTd6hSnfUa+PqzW9hQ1zpnWnfBX4BS2zzsAG7
 wBKeE4HPyBIZtTHUo+7v1b5oC6oyII2rV0Rci3YhCTLDiwjBeEI4Q4yEh3YbwuN50Zgg
 baG35hf1hTnmvnEUkZ2E5ZOy14VYje3Gf/4Q47a+ee+A5y2esrKj3boyv/q8nTffCAcT
 IES2c/qDl1jctBU6y6GZWmXGAS87QvVKSdDrhWwPvJopiIQZkXfhp/xSlm0PsQ1+vxjZ
 orTzsuULz0wyH2lkTDM+qsVJFtZAiMjbnyeoCzjzeA+Qlhqjdv18Zj7p0Eqh458GqQM+
 YjcA==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>,
 Kees Cook <keescook@chromium.org>, Dave Airlie <airlied@linux.ie>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sean Paul <sean@poorly.run>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA0OjMwIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDQ6MjAgUE0gc3l6Ym90Cj4g
PHN5emJvdCtmYjc3ZTk3ZWJmMDYxMmVlNjkxNEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiBzeXpib3QgaGFzIGJpc2VjdGVkIHRoaXMgYnVnIHRvOgo+ID4KPiA+IGNv
bW1pdCA5ZTVhNjRjNzFiMmY3MGJhNTMwZjgxNTYwNDZkZDdkZmI4YTdhMGJhCj4gPiBBdXRob3I6
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gRGF0ZTogICBNb24gTm92IDQg
MjI6NTc6MjMgMjAxOSArMDAwMAo+ID4KPiA+ICAgICAgdWFjY2VzczogZGlzYWxsb3cgPiBJTlRf
TUFYIGNvcHkgc2l6ZXMKPgo+IEFoIGNvb2wsIHRoaXMgZXhwbGFpbnMgaXQuCj4KPiBmd2l3IEkg
bmV2ZXIgbWFuYWdlZCB0byBnZXQgdGhlIFdBUk5JTkcgaW4gdGhlIGJhY2t0cmFjZSB0byBsaWdu
IHVwCj4gd2l0aCBhbnkgY29kZS4gTm8gaWRlYSB3aGF0J3MgYmVlbiBnb2luZyBvbi4KPgo+IEkn
bGwgdHlwZSBhIHBhdGNoIHRvIHBhcGVyIG92ZXIgdGhpcy4KPiAtRGFuaWVsCgpJZiBJIGdldDoK
Z2l0IGNoZWNrb3V0IDhhZGEyMjhhCnRoZW4gaW5jbHVkZS9saW51eC90aHJlYWRfaW5mby5oOjE1
MApwb2ludHMgcmlnaHQgdG86CmlmIChXQVJOX09OX09OQ0UoYnl0ZXMgPiBJTlRfTUFYKSkKCklz
IHRoZSBzaXplIHVzZXItY29udHJvbGxhYmxlIGhlcmU/CgoKPiA+Cj4gPiBiaXNlY3Rpb24gbG9n
OiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTI1ZmU2ZGNl
MDAwMDAKPiA+IHN0YXJ0IGNvbW1pdDogICA1MTMwOWI5ZCBBZGQgbGludXgtbmV4dCBzcGVjaWZp
YyBmaWxlcyBmb3IgMjAxOTExMDUKPiA+IGdpdCB0cmVlOiAgICAgICBsaW51eC1uZXh0Cj4gPiBm
aW5hbCBjcmFzaDogICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBvcnQudHh0
P3g9MTE1ZmU2ZGNlMDAwMDAKPiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjVmZTZkY2UwMDAwMAo+ID4ga2VybmVsIGNvbmZpZzog
IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWE5YjFhNjQxYzFmMWZj
NTIKPiA+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/
ZXh0aWQ9ZmI3N2U5N2ViZjA2MTJlZTY5MTQKPiA+IHN5eiByZXBybzogICAgICBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTEyMTJkYzNhZTAwMDAwCj4gPiBDIHJl
cHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTQ1
ZjYwNGFlMDAwMDAKPiA+Cj4gPiBSZXBvcnRlZC1ieTogc3l6Ym90K2ZiNzdlOTdlYmYwNjEyZWU2
OTE0QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+IEZpeGVzOiA5ZTVhNjRjNzFiMmYgKCJ1
YWNjZXNzOiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcyIpCj4gPgo+ID4gRm9yIGluZm9y
bWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVK
I2Jpc2VjdGlvbgo+Cj4KPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKPgo+IC0tCj4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBh
cmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAic3l6a2FsbGVyLWJ1Z3MiIGdyb3Vw
Lgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1h
aWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gc3l6a2FsbGVyLWJ1Z3MrdW5zdWJzY3JpYmVA
Z29vZ2xlZ3JvdXBzLmNvbS4KPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZp
c2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9zeXprYWxsZXItYnVncy9DQUtN
Szd1RlF0JTJCJTNEN1hNbzlqdno3N1F2RFdMQUFVX1Y3LV9xWiUzRGlLZS1HWEc3Y3FlSmclNDBt
YWlsLmdtYWlsLmNvbS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
