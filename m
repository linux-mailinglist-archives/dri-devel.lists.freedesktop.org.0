Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A139558BA3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 01:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEAE10E180;
	Thu, 23 Jun 2022 23:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDDE10E180
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656026260;
 bh=kxiF+PhI5BK0kM4EMFGRBKuRUyAAMYK8/HtbkzUDZ9k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B/ubuehzPm08VTKda4DIxHOf641WHqAe39SCFfLfa0/D0KXvR14/pvtsNYaJ8SobL
 VG8u+h1KCUDn7PqmxMey4dbjbHATfSX4hzKlZ5yLuXHCsR0gWB37B9Vj32v1iAbs6f
 67r7DbD/WCSrWx/h1PN7X/ic7QcGUnOwMVDuOyBc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [174.250.50.2] ([174.250.50.2]) by web-mail.gmx.net
 (3c-app-mailcom-bs15.server.lan [172.19.170.183]) (via HTTP); Fri, 24 Jun
 2022 01:17:40 +0200
MIME-Version: 1.0
Message-ID: <trinity-de86d66e-c2f7-4643-8a47-4771e9751cfd-1656026260387@3c-app-mailcom-bs15>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: How do I gather up new code to be converted as patches?
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jun 2022 01:17:40 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YrNaJBiAEKaoreGw@ravnborg.org>
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
 <YrNaJBiAEKaoreGw@ravnborg.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:nYqdUijjjTSxOMOvuwxVc9FDDXaG6glpOw+WGUHCyJ5/XJY/etrpMElWjq+BnB1/o40uC
 ulQlFz5DsnEWEyOSl1HcQzjqLD3dMDplsmCxPsB2HKjadbSHJT14ZglrRKp5gHdGNxtvqhXHcMDK
 v2oV0JW7vDERFa7biZ0iHkK7qDDLfsJnU6r4xoEAq36KvYlrFGbL5CN8OVxdp4oEuYuI2wzFzKf9
 G9B2DlOeTz6rffIl15ls94wIAcZONpy6b+jeCcC56qdI/joH3R39ad2gZjsIsTsBsR/JgenYZ5mv
 ho=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kbNokIZl6MQ=:FwHbKHbQ4D8kZp0POFGbzs
 YZMuxMVC4XEDIdWuxK2JGU7jFB38kzba32nzOFYzvtAhgcWmjT+dOnkcp5ozR/+6HtLhj9V9Q
 WUC60fR18WQ9wJE6nKkQBvDfWfCh9qqWfo13yfwPDAaz7MiB6vMHKUsnrrhKZF/O0gtdDfGo8
 hbw0eSTmpuHLvRnq489YDha+jeTVLGSZvrThXAhJ47j0vFViKGrEssUD9Xp+I1OYI4AH8LfjL
 0e3nj5d3sLy1c+G1L9+mTuOjRaSq+zkwIOEzIy1mdaX3Hz9XlQ7NBU/vdqXvLeTjykVAXRN1T
 052aDghVSWmZQYdxCFzucMVU3sd96ANQEErSon+SiaoXy+73cklv+QEaMLKE1nY74C6rBrBm0
 ehTBcijYcdcsJ7WiVHF+WlncldbcO4D3bHFB2IrUEYv6QYC06Yq1HjSl0CL8L5HAkm9C9MAK6
 9GmTjdCVUGtVhoINzxGovNWlq2ORANZOaOh/jFGyjdS4H/gv0S8oeNoCmX2kyIHHjDJFyoE2u
 kbE90WBxuYOg+qTWeHzM6Styc+FU7wXXrvF/qq88n6kM1lT9KZcXD17LeSejSZ+Px+F96vldB
 ZHSZ3rDmOQL6FNecKBeUoEDVjvUvgSjcLuFBYvIgQxCEDtCktFmFq18EelFdDajdqbQS/WyBi
 pYZeBudrkVj7TRP1uZ/iPaBYn8I6clJu+CBeGi50ZKNjiQ9Qi8fTPGStt0rbAcyEYscbDLjzO
 P98vYfcs3vN3Im6kAJQgzEiApZYfcz/z+klIO7eRI+8NxGBBcfXGkJBG5gRogGW+wYv4hlXzy
 JZZ2CeZ
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Okay, I think what you proposed works out for me, although adding 20+ file=
s, one by one, is a pain.
I wish there is a way to automate this.
FWIW, this is how I did it.

________
1) Create a new branch from the current one just for sending the patches

$ git branch Code_Review_1

2) Switch to the new branch

$ git checkout Code_Review_1

3) Copy original drivers/gpu/drm/via/ contents (i.e., *.c, *.h, Kconfig, a=
nd Makefile) and include/uapi/drm/via_drm.h
4) Delete drivers/gpu/drm/via/ contents and include/uapi/drm/via_drm.h
5) Delete from DRM core make file (Makefile) located at drivers/gpu/drm/ i=
ts OpenChrome DRM build switch

. . .
obj-$(CONFIG_DRM_OPENCHROME) +=3Dvia/
. . .

6) Commit the change (Note: this commit will not be posted as a patch)

$ git commit -as

7) Move back the preserved files to drivers/gpu/drm/via/ (i.e., *.c, *.h, =
Kconfig, Makefile) and include/uapi/drm/ (i.e., via_drm.h)
8) Add and commit *.h located at drivers/gpu/drm/via/ one file at a time

$ git add drivers/gpu/drm/via/("Name of the file").h
$ git commit -as

9) Add and commit *.c located at drivers/gpu/drm/via/ one file at a time

$ git add drivers/gpu/drm/via/("Name of the file").c
$ git commit -as

10) Add and commit via_drm.h located at include/uapi/drm/

$ git add include/uapi/drm/via_drm.h
$ git commit -as

11) Commit Kconfig located at drivers/gpu/drm/via/

$ git add drivers/gpu/drm/via/Kconfig
$ git commit -as

12) Commit Makefile located at drivers/gpu/drm/via/

$ git add drivers/gpu/drm/via/Makefile
$ git commit -as

13) Add back to DRM core make file (Makefile) located at drivers/gpu/drm/ =
the OpenChrome DRM build switch

. . .
obj-$(CONFIG_DRM_OPENCHROME) +=3Dvia/
. . .

14) Commit the change

$ git commit -as

15) Generate the commits as patches

$ git format-patch -28

The (-28) may be adjusted to match the number of relevant commits.
It is basically derived from,

- 26 files under drivers/gpu/drm/via/
- 1 file under include/uapi/drm/
- 1 commit to change Makefile located at drivers/gpu/drm/

The first commit that deletes the relevant files should not be included in=
 the patch being generated here.
________

I wish there is a easier, more automated way of doing this, but at least t=
his is the best I can do for now.
I will likely e-mail the mailing list the code in patch form shortly.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Wednesday, June 22, 2022 at 1:06 PM
> From: "Sam Ravnborg" <sam@ravnborg.org>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: How do I gather up new code to be converted as patches?
>
> Hi Kevin,
>
> On Wed, Jun 22, 2022 at 07:18:58PM +0200, Kevin Brace wrote:
> > Hi,
> >
> > How to I use git to gather up new code to be converted to patches?
> > Specifically, I have 20+ new files in one location (drivers/gpu/drm/vi=
a)
> > and a small change to DRM main make file (drivers/gpu/drm/Makefile).
>
> One simple way to do this is to start with a clean tree, and then add
> files step by step.
> 20+ files in one patch is too much to review, so decide for a
> reasonable split between the files.
>
> Maybe something like (as inspiration find your own split):
> 0) Documentation - or add this in you cover letter. Enough info to give
> the reader a rough understanding of the HW and the driver structure.
> 1) Driver files
> 2) Util files
> 3) Files for the memory handling
> 4) Files for irq handling
> 5) HW specific files
> 6) A the final patch - the Kconfig, and Makefile adjustments.
>
> It is important that the final patch is final as you would otherwise
> break the build.
>
> I look forward to see the patches!
>
> 	Sam
>
