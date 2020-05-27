Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2041E460A
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994C6E0D2;
	Wed, 27 May 2020 14:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B406E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:36:47 +0000 (UTC)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MMoT4-1jLBph2ppk-00IoHn; Wed, 27 May 2020 16:36:45 +0200
Received: by mail-qt1-f179.google.com with SMTP id h9so9089451qtj.7;
 Wed, 27 May 2020 07:36:45 -0700 (PDT)
X-Gm-Message-State: AOAM5325E12Fvyrw22ECjLbTtpfltQNY9JcRlFJxq3PbDaA9+lmRdRUx
 EwpbKYd9Wrd3elcs3VYASpt3XwPEiI2K1VJzXQU=
X-Google-Smtp-Source: ABdhPJz5OgKXuoYgmUdLE+csUDsEEOEF0XSfC8Ij+VwLLkemZAcY7xiTkXrFOUDNARvgard005IXgUtkM4rz7IvR6EA=
X-Received: by 2002:ac8:691:: with SMTP id f17mr4501313qth.204.1590590204402; 
 Wed, 27 May 2020 07:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
 <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 16:36:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
Message-ID: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Provags-ID: V03:K1:wPLUGXzIU22TEM4rhPoBzP7+pLmG140YzfOjOF0+rTU0/17V0rS
 5xShDckg36/7tAEUPmK7zHPpxlrtHOi7BlvM3XwE79KnEKmKiRHzE7RafdaayUb8gcvJXgo
 F63BMfrvKn1tEdgmZFH+Mm5lYap9oSHv8IafksiPKU6t2z49QBoJfK6d0FIrW+SS2UGgdYv
 exB+XVC208kUgSJFZ6Zjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YpDpGlzdGrw=:+1RBwX30MvZDrgTGiGXQL/
 FobqehVBIC5W8i0XpHQw232248eFDeGUFXb9DQ3sU1HfTwPuj5srUjQAnYmTNgsef6AE0wOgr
 nS7V6GNF6RNXusBSkd7Tkn3tUumRT7Yi6kLsqk8ZEI5c2MvCi8XH9u8A3vggnXdK1BLvi/MBB
 oQjcNheUM2C9S+FtEZ87gnzeorelYrg2i1tY4UMoLUzwgaQ1M7i2Na9Cq0E6C/JunQV6e24B1
 ybtVAhVtvGoOsQ4SVwchX/xFHPt9KLKOzxJ1/gi36YUiYC2sg42Vbgcm8Q3/Cjk/zirUOfbLc
 ZyyeYKD2I3lezFLJcMoLMBcnoed6ozx0lKPipj3gIEZHpqbT9m44AV4qyGKhypqowCp4iYUiW
 k334/eWC5z2zZt1JgqKUJZBpeC/5zOIcJ/kNLuFA7ice5v0w22e/6JWy3cAVAOEId1UXjDeoa
 jxkh05eOaFW+3mOqTirlzvsKiMN5r0Z+7ftqxv6A0bsqNvtbWi74O5fa+deZS5Cuh3VRGNEoW
 hnmLHVOWRBx8sPLg+QKw5mkczXD/KkV52GKTGCSYTGrJf3aqXKjT0dd+FiPLzjdXLw1TaHEtd
 21cySsIudaHiY27uwaVw2cdYZ20rlMhfnKB+VhRqYMi6MXFhLU90rvTBKDIwsoylvjg1eGReq
 x5pYxfmW2v5VfTRaYnYKyggxj8/TgVpyuc+Sac/Ueb/ZBmRmuJVnD5iC8SmyKYoZ/BYp3UZ0j
 +cH9x1B4E5fr4iIKlHGDUp4tH4Xx2+D0tbPfByclgRy7Z3VFl67mcD6NE4DMlaDrqVwMlOW+q
 aI3boi4ZF1QZaistD0PK5i4NdB7RdEa85y6VJOxtXdG6ovR8cw=
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Isn't this already fixed by
>
> https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403

Ok, I see that fixes the link error, but I when I created my fix, that did
not seem like the correct solution because it reverts part of the original
patch without reverting the rest of it. Unfortunately there was no
changelog text in the first patch to explain why this is safe.

Could you double-check if the behavior is still correct after the two patches?

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
