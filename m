Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9297A366BC3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 15:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16DD6E104;
	Wed, 21 Apr 2021 13:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9ED6E104
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 13:06:00 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j4so27268331lfp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JmUkovJ4PF+YyKy/jY+0gRoy2D+XF6hMzgTd5ze+4xg=;
 b=aImxsQYwp6kUAL2GogTKXZeIFbCiw845KWa6WLKWiH2R2pDvvWqyuEd08Swnrz79LQ
 htxKev6DLtaTTPhelPLHcbGoGJKsyYFIPAkMX1k5pvGtOrgQ4fTFnzbSzgE4kTihGi8Z
 pDA+WRoBlkKmN5kQ9M6PMwC7T+74JIiOovWl5o/2GZTxrwrohmjxQHNR7mQNIyCIsiT8
 joRMrpfFiJZ2hR5D4vC4VxlfK8UpCC1Xx0RZhU04sYRV0V5izQkrOu3xszroITfthKjB
 J6m8juZ2EOK4xE2ywgum61B8ahqR+v/2ykHY/Wcki2yWmJLn3jwBTlCFP140P67oH6Ld
 1cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JmUkovJ4PF+YyKy/jY+0gRoy2D+XF6hMzgTd5ze+4xg=;
 b=nCtImMTBAQDjsrHQdeA7JKVPZl/ZrXYIY5XS+1Z0Fd3KCO8Rl7FSGeJgI+5gyvEh0s
 nV/KY9S963xwZyVlgdWyAGVclD4zsmOuwjUvsRkidM/xRlQnXywzR9Qwu7AyL0XHDRf1
 EqGYCkTDPjL6hZR7sFm6CZYN2VCfoY6stEcRb+fEh1GArhOrF8zyrRmyq5//3hc4wygU
 k6hfuUxB8v9Vp1ClsWznnysLDTZ9tsxNl2d8AIQGDUtxXVXQwXeaYVjaKbqWEjlsmlkK
 o/15RcoBLCE49kLhhVp10ubuuM1C+GKQWAmf7OTs4Q27Z/FMY9p6UYQ1kcU1G5qPAGrf
 TE5A==
X-Gm-Message-State: AOAM531YFloLg7o7LclQ0I1sjK8EKBacTyHUZ/VPbvOIY2zgiCBV9Whb
 /qnzzJ4s9I3JvGMHz7Hd3WU=
X-Google-Smtp-Source: ABdhPJw2O58VpMVpU+gR1j223w9p5DmKGY1H7WzcXBxLkb3E7wEvrE/DzxeCxpyIHOSevNFox4N+Uw==
X-Received: by 2002:a19:e4a:: with SMTP id 71mr19781865lfo.218.1619010358462; 
 Wed, 21 Apr 2021 06:05:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b10sm199558ljr.109.2021.04.21.06.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 06:05:57 -0700 (PDT)
Date: Wed, 21 Apr 2021 16:05:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: <Peter.Enderborg@sony.com>
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <20210421160546.7045245f@eldfell>
In-Reply-To: <cbde932e-8887-391f-4a1d-515e5c56c01d@sony.com>
References: <20210417163835.25064-1-peter.enderborg@sony.com>
 <YH6Xv00ddYfMA3Lg@phenom.ffwll.local>
 <176e7e71-59b7-b288-9483-10e0f42a7a3f@sony.com>
 <YH63iPzbGWzb676T@phenom.ffwll.local>
 <a60d1eaf-f9f8-e0f3-d214-15ce2c0635c2@sony.com>
 <YH/tHFBtIawBfGBl@phenom.ffwll.local>
 <cbde932e-8887-391f-4a1d-515e5c56c01d@sony.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: mhocko@suse.com, willy@infradead.org, neilb@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 adobriyan@gmail.com, linaro-mm-sig@lists.linaro.org, shakeelb@google.com,
 rppt@kernel.org, samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 christian.koenig@amd.com, guro@fb.com, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0397463599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0397463599==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T2Q=aDoIbEuzeKlHNow=Dcn"; protocol="application/pgp-signature"

--Sig_/T2Q=aDoIbEuzeKlHNow=Dcn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Apr 2021 10:37:11 +0000
<Peter.Enderborg@sony.com> wrote:

> On 4/21/21 11:15 AM, Daniel Vetter wrote:
> > On Tue, Apr 20, 2021 at 11:37:41AM +0000, Peter.Enderborg@sony.com wrot=
e: =20

> >> But I dont think they will. dma-buf does not have to be mapped to a pr=
ocess,
> >> and the case of vram, it is not covered in current global_zone. All of=
 them
> >> would be very nice to have in some form. But it wont change what the
> >> correct value of what "Total" is. =20
> > We need to understand what the "correct" value is. Not in terms of kern=
el
> > code, but in terms of semantics. Like if userspace allocates a GL textu=
re,
> > is this supposed to show up in your metric or not. Stuff like that. =20

> That it like that would like to only one pointer type. You need to know w=
hat
> you pointing at to know what it is. it might be a hardware or a other poi=
nter.

To clarify the GL texture example: a GL texture consumes "graphics
memory", whatever that is, but they are not allocated as dmabufs. So
they count for resource consumption, but they do not show up in your
counter, until they become exported. Most GL textures are never
exported at all. In fact, exporting GL textures is a path strongly
recommended against due to unsuitable EGL/GL API.

As far as I understand, dmabufs are never allocated as is. Dmabufs
always just wrap an existing memory allocation. So creating (exporting)
a dmabuf does not increase resource usage. Allocation increases
resource usage, and most allocations are never exported.

> If there is a limitation on your pointers it is a good metric to count th=
em
> even if you don't=C2=A0 know what they are. Same goes for dma-buf, they
> are generic, but they consume some resources that are counted in pages.

Given above, I could even argue that *dmabufs* do not consume
resources. They only reference resources that were already allocated
by some specific means (not generic). They might keep the resource
allocated, preventing it from being freed if leaked.

As you might know, there is no really generic "dmabuf allocator", not
as a kernel UAPI nor as a userspace library (the hypothetical Unix
Device Memory Allocator library notwithstanding).

So this kind of leaves the question, what is DmaBufTotal good for? Is
it the same kind of counter as VIRT in 'top'? If you know your
particular programs, you can maybe infer if VIRT is too much or not,
but for e.g. WebKitWebProcess it is normal to have 85 GB in VIRT and
it's not a problem (like I have, on this 8 GB RAM machine).


Thanks,
pq

--Sig_/T2Q=aDoIbEuzeKlHNow=Dcn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCAIyoACgkQI1/ltBGq
qqdgcA/+OU3upziPx5lqynmqoiFPG1bUHAZHL5yi5T2jmhfS7JPQT5Hkjv3wUtNe
1liYgsv2ATY/B6EPnwB85cH7mwBdWa2b20cbgld3yoUrTYbGVD6mG5C9xGwgnT/3
Yu7gABmOPTmnBwjYDpQm/C98QhWDTTeizPYUJzIeb36+Zf1cItMjUhG1dcokslp3
T0LcPJnttN5WKbmZCPVvAZJ02mWDx6/k6VYbT77NvSRJ+GPMZBL3wNxkY4hzMC4l
LAmZm2biGahXtgsG93kblsM4DjWppAti0ToJF9OQlnTdzeFWEm8OMuZMrDj7gT6X
MPfMDR3l+pmfB3VM6QeBxhWC6swl3RvWIEpti6gaHy/JcNdhuDYWuYBFVPosLxQV
zHEe+wXTuUoQyGtINR0F8aU+pgT7lHp6BBZxHbQyHlxoxo05mM7hSupHt1yFfY+U
vUvggaM50URJjG+t88DLyYaB0tX3APSkUY8wVuKB/vO3VYb3v9g+dgCN+GJBD4/q
Yqhjf7PWG3aHU6kwEWIJDHXiXOMKVZnALodzAloRck/vh4zs8QDgGE7MGDnj5NUI
GdPjTDK6xMx7Xhx0tlZgtkPhbiQdkhN+r0jqgeNlNm2VTUv/T6UerfWOkN9BlS2k
/6Es9bwDrvvL+MKC2XCylqSNRHQkDMmayMtymQCEIitRZLTYbVg=
=1pAh
-----END PGP SIGNATURE-----

--Sig_/T2Q=aDoIbEuzeKlHNow=Dcn--

--===============0397463599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0397463599==--
