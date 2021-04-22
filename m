Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37795368511
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9846E098;
	Thu, 22 Apr 2021 16:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365F46E098;
 Thu, 22 Apr 2021 16:40:22 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso40827950otb.13; 
 Thu, 22 Apr 2021 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=88HnI483fJxvDdvPuNllK0SIphjU/Sv3iv4Nfuq3XeI=;
 b=MKsH5Fn4CoU1UME6/OvAKiBbCZ4p+nj1p6ozPUIRTM8c0AXqc/CuzrY1XbU5qd27eI
 CAw+U2rvOcpbBDMLWrMcVwtgk5DqfWRH3kVr8uxkjZFOwwZt0n5MD2ofWfPOTihmf3eS
 ChdzA/HlXtyYPKGKm/UXCVVhSu4yl19+wZ2LgvQDvcOmyecxs2zZp/qvTBoid4GxzVms
 DNzO8wmkg1Mu616bAsaFWHhhKBkipy/Kci7a6iuNxkYQG0rw0BdjyOQ/AkYvBcN2vJpu
 El4bUMxKtx7sQa+FDPs9vFhSlzH12gvy/stOzs0DWB883nRbp2KdI8k5JdWHlbJnNr+F
 Ykug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=88HnI483fJxvDdvPuNllK0SIphjU/Sv3iv4Nfuq3XeI=;
 b=AdSYhNsS9RC+ChLpSiDaIF6PE7YdWRzFPoIAslCbr2mHD3+1zGL8jk2N7LSRqqo4Ej
 f4MhXHJJseNwZeMSPA/g+Qj5jlsIPuQEEYo5sHpEuYl2opC2CnEdV5YDYnnH/qSehh3E
 CPWLzWvADcyja8QJ0yPBYe1mzyenCyJz89bz/g0dPgtJUOJTP1hO+yHMuHkUeTKkUuqy
 uWShJGzxr3DIUgZ4ZEnZIxw0H/1G712a0lieS7tpsTRJKGX/UUMJD8coH/uassF4tUL4
 vd+yFfJje9G9EUine6p3rl3hwFBFn7a28Pu+3Z5LLWDR4+3fpQQUPNkiWwx9p+htqhcG
 qCeQ==
X-Gm-Message-State: AOAM533T6bDCn686J53afeUtSCSZ2qe5EUzlt9mIu+D1AkZYc3v6lUi+
 NHGyHhcvs0fbWi6UOF78lteBB268Lqb+ZPoZMWg=
X-Google-Smtp-Source: ABdhPJy949+gEuiuUdBsp43DOePQ4cKenGO7K1x3lB5uwpkiaPMAQ3RT0cbNhsQpNhYrBx59P3y1ALH4tV0iRnWPKtY=
X-Received: by 2002:a05:6830:15d3:: with SMTP id
 j19mr3629569otr.23.1619109621542; 
 Thu, 22 Apr 2021 09:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210422163329.dvbuwre3akwdmzjt@gilmour>
In-Reply-To: <20210422163329.dvbuwre3akwdmzjt@gilmour>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Apr 2021 12:40:10 -0400
Message-ID: <CADnq5_O39XAV+EF=CeKGK3UEG6E_6Gt_goW6u1+5siC5ROtz4Q@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjIsIDIwMjEgYXQgMTI6MzMgUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNl
cm5vLnRlY2g+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwgRGFuaWVsLAo+Cj4gSGVyZSdzIHRoaXMgd2Vl
ayBkcm0tbWlzYy1uZXh0LWZpeGVzIFBSLCBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93Cj4KCkNh
biB3ZSBhbHNvIGNoZXJyeS1waWNrIHRoaXMgcGF0Y2g6Cmh0dHBzOi8vY2dpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9ZDUxMGM4OGNmYmIyOTRkMmIxZTJkMGI3MTU3
NmU5Yjc5ZDBlMmU4MwpJdCBzaG91bGQgaGF2ZSByZWFsbHkgZ29uZSBpbnRvIGRybS1taXNjLW5l
eHQtZml4ZXMgcmF0aGVyIHRoYW4KZHJtLW1pc2MtbmV4dCwgYnV0IEkgbWlzanVkZ2VkIHRoZSB0
aW1pbmcuCgpUaGFua3MsCgpBbGV4Cgo+IFRoYW5rcyEKPiBNYXhpbWUKPgo+IGRybS1taXNjLW5l
eHQtZml4ZXMtMjAyMS0wNC0yMjoKPiBBIGZldyBmaXhlcyBmb3IgdGhlIG5leHQgbWVyZ2Ugd2lu
ZG93LCB3aXRoIHNvbWUgYnVpbGQgZml4ZXMgZm9yIGFueDc2MjUKPiBhbmQgbHQ4OTEyYiBicmlk
Z2VzLCBpbmNvcnJlY3QgZXJyb3IgaGFuZGxpbmcgZm9yIGx0ODkxMmIgYW5kIFRUTSwgYW5kCj4g
b25lIGZpeCBmb3IgVFRNIHBhZ2UgbGltaXQgYWNjb3VudGluZy4KPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IDljMGZlZDg0ZDU3NTBlMWVlYTZjNjY0ZTA3M2ZmYTI1MzRhMTc3
NDM6Cj4KPiAgIE1lcmdlIHRhZyAnZHJtLWludGVsLW5leHQtMjAyMS0wNC0wMScgb2YgZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCBpbnRvIGRybS1uZXh0ICgyMDIx
LTA0LTA4IDE0OjAyOjIxICsxMDAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlz
YyB0YWdzL2RybS1taXNjLW5leHQtZml4ZXMtMjAyMS0wNC0yMgo+Cj4gZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGE0Mzk0YjZkMGEyNzM5NDFhNzVlYmU4NmE4NmQ2NDE2ZDUzNmVkMGY6
Cj4KPiAgIGRybS90dG06IERvbid0IGNvdW50IHBhZ2VzIGluIFNHIEJPcyBhZ2FpbnN0IHBhZ2Vz
X2xpbWl0ICgyMDIxLTA0LTIxIDE1OjM1OjIwICswMjAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEEgZmV3IGZp
eGVzIGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3csIHdpdGggc29tZSBidWlsZCBmaXhlcyBmb3Ig
YW54NzYyNQo+IGFuZCBsdDg5MTJiIGJyaWRnZXMsIGluY29ycmVjdCBlcnJvciBoYW5kbGluZyBm
b3IgbHQ4OTEyYiBhbmQgVFRNLCBhbmQKPiBvbmUgZml4IGZvciBUVE0gcGFnZSBsaW1pdCBhY2Nv
dW50aW5nLgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFkcmllbiBHcmFzc2VpbiAoMSk6Cj4gICAgICAgZHJtL2Jy
aWRnZTogbHQ4OTEyYjogZml4IGluY29ycmVjdCBoYW5kbGluZyBvZiBvZl8qIHJldHVybiB2YWx1
ZXMKPgo+IENocmlzdGlhbiBLw7ZuaWcgKDEpOgo+ICAgICAgIGRybS90dG06IGZpeCByZXR1cm4g
dmFsdWUgY2hlY2sKPgo+IEZlbGl4IEt1ZWhsaW5nICgxKToKPiAgICAgICBkcm0vdHRtOiBEb24n
dCBjb3VudCBwYWdlcyBpbiBTRyBCT3MgYWdhaW5zdCBwYWdlc19saW1pdAo+Cj4gUmFuZHkgRHVu
bGFwICgyKToKPiAgICAgICBkcm06IGJyaWRnZTogZml4IEFOWDc2MjUgdXNlIG9mIG1pcGlfZHNp
XygpIGZ1bmN0aW9ucwo+ICAgICAgIGRybTogYnJpZGdlOiBmaXggTE9OVElVTSB1c2Ugb2YgbWlw
aV9kc2lfKCkgZnVuY3Rpb25zCj4KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAg
ICAgICAgICB8ICAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25m
aWcgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jIHwg
MzIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fdHQuYyAgICAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
