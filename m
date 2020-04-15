Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1081A9400
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656E6E85D;
	Wed, 15 Apr 2020 07:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A506E81D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 01:48:18 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j14so1324403lfg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=871UxjBdggCjSPvo7fytf1ugzP/6XaBJPXc3zm0RbzI=;
 b=mab98fNdiJbs2kn65jBxwPTFilqaqYE9wvjL2PsR6wYG4VcNO86Bliwx8oE4qBiuaY
 4TnlG+QmY107a/dtQ82ChlRjmZEWBXd5HnoPVcJWM22Gxn35Zcq/tOcwH91uBIhYhwqk
 PDL8kxoUWTMF+C9W6i2FGr75lpx1xBo+Rz8G/XRzrwD49WVJ5beYCDKxZ9oiZj24jtUf
 suoSGpE1MrX9710nxM7MBZucY1X560yO/wVZ1/kuM1R9zOD0pbnfn2V6GBHAPVkSC4av
 DowKOfdp0CwsU3yx5h+ZNHD2ZJlXtQt8i3vorc5JFUbxuqJB3rUEFS87TxByBTKMsECX
 T3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=871UxjBdggCjSPvo7fytf1ugzP/6XaBJPXc3zm0RbzI=;
 b=ciexGDrY73JzwhLXgBILw9RiBcYZQtGhvBd50sBLGXZ+7BjJ6ysnUA17GHQywRbqO2
 R0AndcaTbO9FmODGxpZSj3MubEq6sWhc7vO45XrlxLj8YKuh9ZuLsM9ZP9+/76187Ptp
 ktRew2EtYXutRqEHexH1ZscRAjg9UGcUi+e7dQlBCXBiWDrX3stOM9vOEPn3yqI1UhFZ
 1p/2Jz5MfmelTdzcq1z+Vcw6cqMqtYbboieF+zBLtvCbSPR+PTIiTvVn/Vl33T+Sefss
 jDiAyzNtCOrFg38t8EW75JZqgVHctnnne+HygsBEbYv7wRxNgOt4RDp5E3NGGZ47B2Qd
 1JCg==
X-Gm-Message-State: AGi0PuZEja3OZJJjNzLciELtr99QdMS23RayPPLlQmxcdF40USrC3tzS
 xO9EKncEmUoWIOUXh4vllzMHx9YtU5J7G3jrA4hs/J22
X-Google-Smtp-Source: APiQypJo5OAqdTYBHi1J/hyuSLzFwxa4JDzt887P717fJDiqeareS0ezIEjMsad4Ka2txr6TLCiozGB7+JmfP6OwbAo=
X-Received: by 2002:a19:9109:: with SMTP id t9mr1538457lfd.10.1586915296379;
 Tue, 14 Apr 2020 18:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200224230155.120894-1-ytht.net@gmail.com>
 <20200225102928.vnaamhecu5tnoaq2@sirius.home.kraxel.org>
 <CALqoU4wtYQtLg=wVkepP29wYZYKKVx3PA1Nytfy+fZdqrp-_Jg@mail.gmail.com>
 <20200226071517.4cbgfcaeknmmvyo3@sirius.home.kraxel.org>
 <CALqoU4z7GYNu3DWRQcK=boGFZ=n7yHLEhEeOgXHZQ=17DMrjzQ@mail.gmail.com>
 <20200226153845.nyyq4quatznhetio@sirius.home.kraxel.org>
 <CALqoU4ztV6KGZDYdd2-fUY2+bJgie3-RhrgoC8B9anqTUO06zQ@mail.gmail.com>
 <20200327082000.vhjs2wixv4ouxuj4@sirius.home.kraxel.org>
In-Reply-To: <20200327082000.vhjs2wixv4ouxuj4@sirius.home.kraxel.org>
From: lepton <ytht.net@gmail.com>
Date: Tue, 14 Apr 2020 18:48:05 -0700
Message-ID: <CALqoU4yuzkTDPsYCaXRT-n9xv1h0ZfqLmrgTUQ3VdSczWGr_gg@mail.gmail.com>
Subject: Re: RFC: drm/virtio: Dummy virtio GPU
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 1:20 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > Hmm, yes, I can see loopback virtio being useful for various cases.
> > > Testing being one.  A dummy virtio-gpu could be done too, or a more
> > > advanced version which exports the display as vnc.
> > So what's your suggestion on this? Changing this to drivers/virtio dir
> > and then add some user space api?  I am thinking about introducing a new
> > /dev/dummy-virtio, then user space can open it, use ioctl to create new virtio
> > hardware, and can handle the virtio traffic with read/write to simulate the
> > different virtio hardware.
>
> Yep, sounds useful.  You might want check out the uinput driver which
> does something simliar for input devices.  I wouldn't name this dummy,
> maybe uvirtio.
>
> cheers,
>   Gerd
>
Add back mail list so other people can follow.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
