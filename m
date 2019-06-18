Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80684AD8E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 23:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCE66E0D4;
	Tue, 18 Jun 2019 21:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41696E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 21:51:28 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id c4so7647720uad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYYUQ3e7ONlVseVSNvQlJ7x1YpG18Xt9WTuVNuLCobA=;
 b=LGO8WnUsTU/7FB9+ZyZIYMpAqvJK7ELAxc1YkYHq6LUdiZWTI7IuvLEs3eWvDpNZ42
 aIOZ7ukgQzOIuW55OAYD/dNBC2ogV5W0vLR3pbYCK+f/CWvcYSOudEqWPm6mJ0BRbW0k
 ZEuxJ0aNi5XWfnbe4w2R50HPU9+HwfW0MPbB22SbubEw/PLftqBCuQjIm+A8oiRvUrav
 gyNIaj8p/REJMWSHRzfClzYZ0OSTRAp6vvOA6IxCDCGK0f3rsTiQo4kCRUkHrvazReNH
 c6X4QVYHdO4r6bbWMFla5fll8L+a7VF061rXI4yCCfJOGW4LIEWtjVfVa3eii5aHVRIV
 310w==
X-Gm-Message-State: APjAAAXAoI9mDNBQMsF30D6UeICF5JleMTd7nzZJ2ZCOD1sAbgkgOfXz
 GN4xlVrmfzV4p9KmbfEhAhbvY4S4CLVIwZo6P74=
X-Google-Smtp-Source: APXvYqyDelhTfDEa4jc4T+QXKh2CqnygOwHY3Zf/VM9l/nU/fn1P+SUkyIh9Rlb4jtppJOEy/4PiW1XR65IIyxMOyok=
X-Received: by 2002:ab0:208c:: with SMTP id r12mr46741116uak.27.1560894687847; 
 Tue, 18 Jun 2019 14:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559860606.git.rodrigosiqueiramelo@gmail.com>
 <e3bc263b273d91182e0577ed820b1c4f096834ec.1559860606.git.rodrigosiqueiramelo@gmail.com>
 <20190607073957.GB21222@phenom.ffwll.local>
 <CADKXj+7OLRLrGo+YbxZjR7f90WNPPjT_rkcyt3GrxomCAjOjHA@mail.gmail.com>
 <20190607150420.GI21222@phenom.ffwll.local>
 <20190618021944.7ilhgaswme2a6amt@smtp.gmail.com>
 <WQuF2MGabt8DxA1rdWhTcZIGSaXav-5XOae4hkdkxq51gom6tklMqrfOLnyN6WSm9TY5sLXp_fxoNQhtC3E7zY9A3dLEpfZ1phdw23m0SI8=@emersion.fr>
In-Reply-To: <WQuF2MGabt8DxA1rdWhTcZIGSaXav-5XOae4hkdkxq51gom6tklMqrfOLnyN6WSm9TY5sLXp_fxoNQhtC3E7zY9A3dLEpfZ1phdw23m0SI8=@emersion.fr>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Tue, 18 Jun 2019 18:51:17 -0300
Message-ID: <CADKXj+4R=J0mEs3hYGiMS_iK+yhAZyXi_xOg-nRMtTAvSuCz2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vkms: Use index instead of 0 in possible crtc
To: Simon Ser <contact@emersion.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PYYUQ3e7ONlVseVSNvQlJ7x1YpG18Xt9WTuVNuLCobA=;
 b=qQhSpRvb5Kvqh7fFh1aP152lsn2HY6VLkvsHO6s/bMzpVnI0c30FB7HrI8Vg7DnN5U
 Qa3bqSAgpQMP0SdAO38n9/WniD8wRYqi97LDsaL/QXHwZ2MCCLfPzGG0HrkKyO+G33HR
 splQ1lr4TiCc4MlvGm5HyNg+SLfdtLu1/fFh/BRg/T8EO6QpZ/SXrlbNVGvvtUr2ZE2p
 TMIArJMEjVyNuYsH0EWjZKHex7zgiRpxu5d8isiAzJ+3yn6m6k/QaMfvMhtCZrXGs3SO
 lhkBVKqg/Jz5YBcBIQdLmcdd2K7my3VetDLzrCMYwP8AiQw7iC1ALOVucH8O2vFSzgOt
 mUGg==
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMjoxOCBBTSBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNp
b24uZnI+IHdyb3RlOgo+Cj4gT24gVHVlc2RheSwgSnVuZSAxOCwgMjAxOSA1OjE5IEFNLCBSb2Ry
aWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBJ
IG1hZGUgdGhlIHBhdGNoLCBidXQgd2hlbiBJIHN0YXJ0ZWQgdG8gd3JpdGUgdGhlIGNvbW1pdCBt
ZXNzYWdlLCBJIGp1c3QKPiA+IHJlYWxpemVkIHRoYXQgSSBkaWQgbm90IHVuZGVyc3RhbmQgd2h5
IHBvc3NpYmxlX2NydGNzIHNob3VsZCBub3QgYmUKPiA+IGVxdWFsIHplcm8uIFdoeSBjYW4gd2Ug
bm90IHVzZSB6ZXJvPwo+Cj4gSGksCj4KPiBwb3NzaWJsZV9jcnRjcyBpcyBhIGJpdGZpZWxkLiBJ
ZiBpdCdzIHplcm8sIGl0IG1lYW5zIHRoZSBwbGFuZSBjYW5ub3QKPiBiZSBhdHRhY2hlZCB0byBh
bnkgQ1JUQywgd2hpY2ggbWFrZXMgaXQgcmF0aGVyIHVzZWxlc3MuCgpIaSwKClRoYW5rIHlvdSB2
ZXJ5IG11Y2ggZm9yIHlvdXIgZXhwbGFuYXRpb24uIEknbGwgdHJ5IHRvIGZpbmlzaCB0aGUgcGF0
Y2guCgo+IFRoYW5rcywKPgo+IFNpbW9uCgoKCi0tIAoKUm9kcmlnbyBTaXF1ZWlyYQpodHRwczov
L3NpcXVlaXJhLnRlY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
