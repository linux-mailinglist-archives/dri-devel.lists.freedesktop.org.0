Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC1F1A01
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231F6EDA8;
	Wed,  6 Nov 2019 15:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B046EDA8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:28:58 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id d5so9114312otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbAyue93JyznNmIkmVtLZ6UFGX/hYzHCJSClDp//lSU=;
 b=dTqmBzBX3cofrpI8PnI8HTNYszukxa2P4GU2H0Uq9bOpCcaPYHEpknoWV9rcF1V5jb
 cYwmKPKQGYs07KOzk70wl8g2Q4NuFfuPE+gprYQ2eMztHNLJijaS/Y4Hiw6ilnznD5sH
 pAPiV1iBNNX3bRZlk9nsa1rRIXYNHpw1BsDaBnym1jY3rOYXJRN1oxNcESvo6f2tAwy9
 lfMSGfbzNZhOIXgjFOaH7wW8CnqFpSJZLrwwcJdPW3TfjNB+ITaZNW7nSV3grEvvnmyU
 6VpP5NcqcXpdm1BeB5DnJMImYFKD/PX5v7DMaJZ5ToFkpIQ22Z+Z5wSeulVXnoul4oCo
 Cf/w==
X-Gm-Message-State: APjAAAUHXS3AOUNTOFlp3gWZlpVYYDX0BLVWndvddfreRssfiZZ31Stc
 lz6NfI5noPwrMKk6q7pWZVQq2w9i1ydEAEMA02JZYg==
X-Google-Smtp-Source: APXvYqyxueFwRfdmFPePSR8qR4fActa/wTsu04mQA4xgR708Ttyv/aa8hlt4sEajeG3ZyaEmp+JOrKN82PphiaNMMs8=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr2347792otr.281.1573054137416; 
 Wed, 06 Nov 2019 07:28:57 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b2de3a0594d8b4ca@google.com>
 <00000000000012ff570596af15cc@google.com>
 <CAKMK7uFQt+=7XMo9jvz77QvDWLAAU_V7-_qZ=iKe-GXG7cqeJg@mail.gmail.com>
In-Reply-To: <CAKMK7uFQt+=7XMo9jvz77QvDWLAAU_V7-_qZ=iKe-GXG7cqeJg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 6 Nov 2019 16:28:46 +0100
Message-ID: <CAKMK7uEeQnxMXeyMTvqJ-8H3wFeSexkbL1OJ0oJeUoep=YXcVg@mail.gmail.com>
Subject: Re: WARNING in drm_mode_createblob_ioctl
To: syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DbAyue93JyznNmIkmVtLZ6UFGX/hYzHCJSClDp//lSU=;
 b=LB3Yx/BIrvYNHBhojEUI5CCO9pO+SgV4R6zirmvgFlVakaQAKRibjBYbNVvzoG/bfB
 csaWoZma1z+qD+QlIIgAA2uI7p8yPXjS5CwnFBh3sBDf9JN05pnOQw8w5NPLzfaLi7Gq
 mGL6cYrgTYF9CcStKGZZ01c2XmYvB4tYTxqFs=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@linux.ie>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sean Paul <sean@poorly.run>,
 Dmitry Vyukov <dvyukov@google.com>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA0OjIzIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDQ6MjAgUE0gc3l6Ym90Cj4g
PHN5emJvdCtmYjc3ZTk3ZWJmMDYxMmVlNjkxNEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiBzeXpib3QgaGFzIGJpc2VjdGVkIHRoaXMgYnVnIHRvOgo+ID4KPiA+IGNv
bW1pdCA5ZTVhNjRjNzFiMmY3MGJhNTMwZjgxNTYwNDZkZDdkZmI4YTdhMGJhCj4gPiBBdXRob3I6
IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gRGF0ZTogICBNb24gTm92IDQg
MjI6NTc6MjMgMjAxOSArMDAwMAo+ID4KPiA+ICAgICAgdWFjY2VzczogZGlzYWxsb3cgPiBJTlRf
TUFYIGNvcHkgc2l6ZXMKPgo+IEFoIGNvb2wsIHRoaXMgZXhwbGFpbnMgaXQuCj4KPiBmd2l3IEkg
bmV2ZXIgbWFuYWdlZCB0byBnZXQgdGhlIFdBUk5JTkcgaW4gdGhlIGJhY2t0cmFjZSB0byBsaWdu
IHVwCj4gd2l0aCBhbnkgY29kZS4gTm8gaWRlYSB3aGF0J3MgYmVlbiBnb2luZyBvbi4KCk9rIEkg
dGhpbmsgSSBoYXZlIGFuIGlkZWEsIHRoZSBhYm92ZSBjb21taXQgaXNuJ3QgaW4gdGhlIGxpbnV4
LW5leHQgSQpoYXZlIGhlcmUuIFdoZXJlIGlzIHRoaXMgZnJvbT8KLURhbmllbAoKPgo+IEknbGwg
dHlwZSBhIHBhdGNoIHRvIHBhcGVyIG92ZXIgdGhpcy4KPiAtRGFuaWVsCj4KPiA+Cj4gPiBiaXNl
Y3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9
MTI1ZmU2ZGNlMDAwMDAKPiA+IHN0YXJ0IGNvbW1pdDogICA1MTMwOWI5ZCBBZGQgbGludXgtbmV4
dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAxOTExMDUKPiA+IGdpdCB0cmVlOiAgICAgICBsaW51eC1u
ZXh0Cj4gPiBmaW5hbCBjcmFzaDogICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9y
ZXBvcnQudHh0P3g9MTE1ZmU2ZGNlMDAwMDAKPiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5
emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjVmZTZkY2UwMDAwMAo+ID4ga2VybmVs
IGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWE5YjFh
NjQxYzFmMWZjNTIKPiA+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS9idWc/ZXh0aWQ9ZmI3N2U5N2ViZjA2MTJlZTY5MTQKPiA+IHN5eiByZXBybzogICAgICBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTEyMTJkYzNhZTAwMDAw
Cj4gPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBy
by5jP3g9MTQ1ZjYwNGFlMDAwMDAKPiA+Cj4gPiBSZXBvcnRlZC1ieTogc3l6Ym90K2ZiNzdlOTdl
YmYwNjEyZWU2OTE0QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+IEZpeGVzOiA5ZTVhNjRj
NzFiMmYgKCJ1YWNjZXNzOiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcyIpCj4gPgo+ID4g
Rm9yIGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28u
Z2wvdHBzbUVKI2Jpc2VjdGlvbgo+Cj4KPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ICs0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
