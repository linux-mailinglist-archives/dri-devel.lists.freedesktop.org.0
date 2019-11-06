Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B78F1A0A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD286EDAA;
	Wed,  6 Nov 2019 15:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256C6EDAA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:32:07 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m15so12404375otq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZfcZe9oAWNS5cY+zOKEHcifoIj+GXmX62KAGJO2tELE=;
 b=OiWWNveQHJ1f1XVxpjguGGNboWy/RLvUAiSekaN9/S46DKXqAd05DD6aQkJzfmd96G
 xb0n6kxZpLyaJvJvNQc9FePRzA4H6LisCMg9rJchO7bP/S8ScRrWgXgZPTMsdmnRzgqj
 NHT+0k/xmoGF8WdcErYmxLd4HWSgVWYjRXJuIu9tbeUD17baoKPSYnsJAD7JwoN7omo7
 wdmkMEWWuXSH8w6nU0cv7YqYcWFkY3kNs+NjXglg42+usx5PVkTnPPNZQnWzuNvF+VxC
 4Nveptkuyep1hvj/PoYAy1/Lfnkf9d/ORa/KQcOKDexbsryhhZh4OzlXQ4ZS2mBTcZTS
 Cx7g==
X-Gm-Message-State: APjAAAVl4aEICddtXSsicNSMmc81RKklotFoZMOzMF1j4SwqZY01Tsev
 sJ9tP35DJD0LAi84jVjCH4d3qFRGnJLjVwVj3FITGQ==
X-Google-Smtp-Source: APXvYqw///Krsse2DBdzdG/Ka2FfTS2Yrqhg8d4s7w790j42sEyA6RynvjYQk6BR3wvplC+Qo9T0aGtE99YzD1fI/Tc=
X-Received: by 2002:a9d:6343:: with SMTP id y3mr2195352otk.106.1573053846999; 
 Wed, 06 Nov 2019 07:24:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b2de3a0594d8b4ca@google.com>
 <00000000000012ff570596af15cc@google.com>
In-Reply-To: <00000000000012ff570596af15cc@google.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 6 Nov 2019 16:23:55 +0100
Message-ID: <CAKMK7uFQt+=7XMo9jvz77QvDWLAAU_V7-_qZ=iKe-GXG7cqeJg@mail.gmail.com>
Subject: Re: WARNING in drm_mode_createblob_ioctl
To: syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZfcZe9oAWNS5cY+zOKEHcifoIj+GXmX62KAGJO2tELE=;
 b=ksjGv+rDVrfFKq4SrfX25KHYUoZD40eY/vdrA1L1rRwKvhWwyM/U8/0JTcSouughJ2
 ShNHkRzqbWvGVvZJRJImFTkTpOhBDsvVSyZYEHXjAxs0Z9Ye62gnr6g17tOHWJ979lRD
 fQVdCoTe2+R8x57FHmFv0U/56bzLXn6zpcrTQ=
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

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA0OjIwIFBNIHN5emJvdAo8c3l6Ym90K2ZiNzdlOTdlYmYw
NjEyZWU2OTE0QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gc3l6Ym90IGhh
cyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKPgo+IGNvbW1pdCA5ZTVhNjRjNzFiMmY3MGJhNTMwZjgx
NTYwNDZkZDdkZmI4YTdhMGJhCj4gQXV0aG9yOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KPiBEYXRlOiAgIE1vbiBOb3YgNCAyMjo1NzoyMyAyMDE5ICswMDAwCj4KPiAgICAgIHVh
Y2Nlc3M6IGRpc2FsbG93ID4gSU5UX01BWCBjb3B5IHNpemVzCgpBaCBjb29sLCB0aGlzIGV4cGxh
aW5zIGl0LgoKZndpdyBJIG5ldmVyIG1hbmFnZWQgdG8gZ2V0IHRoZSBXQVJOSU5HIGluIHRoZSBi
YWNrdHJhY2UgdG8gbGlnbiB1cAp3aXRoIGFueSBjb2RlLiBObyBpZGVhIHdoYXQncyBiZWVuIGdv
aW5nIG9uLgoKSSdsbCB0eXBlIGEgcGF0Y2ggdG8gcGFwZXIgb3ZlciB0aGlzLgotRGFuaWVsCgo+
Cj4gYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0
LnR4dD94PTEyNWZlNmRjZTAwMDAwCj4gc3RhcnQgY29tbWl0OiAgIDUxMzA5YjlkIEFkZCBsaW51
eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDE5MTEwNQo+IGdpdCB0cmVlOiAgICAgICBsaW51
eC1uZXh0Cj4gZmluYWwgY3Jhc2g6ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
cmVwb3J0LnR4dD94PTExNWZlNmRjZTAwMDAwCj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE2NWZlNmRjZTAwMDAwCj4ga2VybmVsIGNv
bmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWE5YjFhNjQx
YzFmMWZjNTIKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
YnVnP2V4dGlkPWZiNzdlOTdlYmYwNjEyZWU2OTE0Cj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9MTIxMmRjM2FlMDAwMDAKPiBDIHJl
cHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTQ1
ZjYwNGFlMDAwMDAKPgo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrZmI3N2U5N2ViZjA2MTJlZTY5MTRA
c3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiA5ZTVhNjRjNzFiMmYgKCJ1YWNjZXNz
OiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcyIpCj4KPiBGb3IgaW5mb3JtYXRpb24gYWJv
dXQgYmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9u
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
