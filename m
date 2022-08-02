Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F05874B8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 02:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B4A10E4C2;
	Tue,  2 Aug 2022 00:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E58010E4C2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659399030;
 bh=YldzH2kP/t/zX2IFxkwoPVv8Hfd4paU3Hwj5wgqC2D8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UZct7F1pHs6TNr+Eqd7WL1d2Sey8n2UAKxgHR1tkX/cjgYsalP6T1b55zCwbOV1JU
 ijjbxhsRwPvyLvLo9nMO7ianxVIhnuz33TA8rKZMHK1Xh4769RFvgE+jtNVQJ+pveR
 N3mmv2ytKhGZGbtn3CLvJCypMapABultZDx+n7es=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [23.24.200.25] ([23.24.200.25]) by web-mail.gmx.net
 (3c-app-mailcom-bs06.server.lan [172.19.170.174]) (via HTTP); Tue, 2 Aug
 2022 02:10:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-4501b716-d008-4a86-9e0c-681c301e4b87-1659399030120@3c-app-mailcom-bs06>
From: Kevin Brace <kevinbrace@gmx.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Type: text/plain; charset=UTF-8
Date: Tue, 2 Aug 2022 02:10:30 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <Yufl737qQnxlHeGd@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <Yufl737qQnxlHeGd@ravnborg.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:kNAlRD56HluaPMYQwpXHDwCZoaZEwTS4bDHMG55BYyw+b/UQdm5PjWBupA6Mlx8A7f+ox
 xNTQszhaJkT6HOYHDXrk1IVBhSiZtBi4+rokE/4iTLuHvLhSDRM0MG7bSYSNLMYvu+UdqJbSdX1t
 XHRWxubearJgX+F6lvaBF/GO5MQLlxbpQTA+PD0b0Q0Tllzt1iCJZcSQICHY13g5avkUAKoixRgv
 QhkI9OIEN0zRw3zxHEDQ0/Nl3LXctlWcCa8VUSmmYfOCFPV3I024csyL+Ru9oGFae5H7eC1JRInd
 0g=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mNlBuW/Hc5U=:SheEi9dtIrh60x0ACCW9L2
 5dPYHaEJfk6wiNi9VoyWc08h7C/MLBH7yDLFVpxUn9Mt/AMCGDTk8uoBvfZeGXXgW2YNlm4jP
 zwSU8D1X/4k1a5xZ/sxje3FCLOLk1IDTuDVpvl7Xg9/pi86oLtVEjvwXygrjAvJPMgcYjQ6ob
 dg7F6CFePzDK9ZfhTa+pgkDgIdmmhR1ga3asDfUGU8ORZjAhvejHPsZOgBuIyKlZJkMsmMpY+
 8EHqxX1/Opy54sCCPA4cg0YB1H40N/jXDImt12lqdMhd9rCp3QMvhvkgowL21O31rV/usQ/Eu
 VOzDdxqKmbANcTvaJBaNOjTsLKmk75rcaKh1wGuSvVhDY8F4DGRlWPwqvwb3XdXXdvkJmOqYE
 ECEeTmUurB1n3FbiF1+jPl1uDZyOfxeJOcmBuiBdB2oq1URSV/9tNHccgUUlZ5bH8I8jY0FZh
 flswfRkAXyrLZxeyp7oalRPhjzE+CxFkKOSeynVkAfjC6P2Hq0mMNj5orkUski4nQ9ORVT/Nq
 cIanVAcG15PXrzbIXvXsPSy+jARH2oWuw3qiY/bbgkbKNL2W+B1cNTfI6BkJujdll1UWf/toI
 knAsjC3Z9fDQzHsJK4bkdh8JYmWDHA7jJzVKylRCRcNOTrHIxbRCSVhP4MbvZ/o7mHpdBm4a2
 AYKuWXq1tbfvy64kfXBqFBR9c/LREP1HUaDhYUn0zxyEbzpST+zWpFjvxOLOwov/krhlRIkCd
 6wwxFGUu7c1x/mPWSDobro+0sGYCQRCzRHOtoWf3nagUWRHgiSBQ9FAWyRppVYmtR1xWSw08E
 dHQNNuW
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

OpenChrome DDX carries lots of legacy code.

https://cgit.freedesktop.org/openchrome/xf86-video-openchrome/tree/src/via=
_drm.h?h=3Dmain&id=3Ddc661c59257e855cd9b29c14b91a8ee2d9b86ccb

There is a requirement to use the same via_drm.h with both DDX and DRM.
Hence, I need to keep a lot of the legacy DRI1 definitions inside via_drm.=
h.

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Monday, August 01, 2022 at 7:40 AM
> From: "Sam Ravnborg" <sam@ravnborg.org>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, dri-devel@lists.freedeskt=
op.org
> Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
>
> Hi Kevin,
>
> > I cannot drop the older DRI1 based uAPI calls.
> > This is because include/uapi/drm/via_drm.h needs to retain backward
> > compatibility with the existing OpenChrome DDX's XvMC library
> > (it gets compiled when OpenChrome DDX is built) and likely with the
> > existing DDX Xv code as well.
> > If I remove the DRI1 based uAPI calls, the XvMC library will not get
> > compiled (compile error will occur since the XvMC library assumes the
> > presence of DRI1 based uAPI), and I assume the same for the DDX Xv cod=
e
> > (I cannot even reach here since the XvMC library is compiled first).
>
> If you just keep the relevant definitions in drm_via.h then the compile
> issues should be OK - and then there is no need to implement anything in
> the driver. Or did I not understand the problem you are trying to solve?
>
> 	Sam
>
