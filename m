Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06016F918
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA0F6E1B8;
	Wed, 26 Feb 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454F16EB8B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:33:25 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q8so30696ljb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e5EGcMO8YtdeJxBau2+zHu8607za5d5qtbP1osazEoQ=;
 b=ifyvEaoLmwd+b6Bswlk1zg8jXTn3f6NtO8iYcfMtPiYuqydC38F38UP41PM0STGATd
 VgTlgNpgNXMlqu9Fey/wCWJh5JbhgnjL99vLyX0HFeLJDZE/ANhTLYSoGA9uiMmpZdGD
 SiuTf81jtxTLxXSk3T/FEcO7PWE9f/Wbw5gEpewIlMwTa6t6UfN9qXP1EFUxc8Y27mtp
 Sv3F31EhxLBJII1ajmSLKWMb8haHJkp9+N/AHlJIeguDKCvKAuoNw13+4O8VD3t+fU+Y
 tDVD8StghRHgTKYDMJrTLqSQLzKOM38ZL4hgwVrEFB1M5wXtg1eyU3f+OXS3b84B/rgU
 gwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e5EGcMO8YtdeJxBau2+zHu8607za5d5qtbP1osazEoQ=;
 b=hq/6lQp0rnUXe2gYlRg7VXoMPYUufCrjdn/vMbgbEGTQCqSPrcrasDvQbusCBvhsgJ
 01iDo/OVe6V3GyqiuGsfqfHOKXAO5fMJ8mQNQVyEKeZwE0bl4PSh8XS945BYDd8hwsqL
 QkyAfhdOLY8Ec/w8IvTlN+Qj7PbeNm2DS48pzmh5RY8hwEWZwbYmiox5V1X0kBwcOxWm
 /AnX2jvPGFLUt20P32WwnCASVlzZN5nk+NDd74XWhSTHJONsjJfigXxVhkby9WVvi1D8
 xHXupk6X3KpdlTJbsOuyfTzQKZOSJzoUEfMbXHjKU2P5xQCgVlpesoDyeMCFS69vGoPm
 hllw==
X-Gm-Message-State: ANhLgQ3Uff3ut4CJhYBZX5li/6t04wmbiXP417s7YHJkmAZd+4zebpNj
 320CPLP/1xnSLPUS1W4LjUvU6YdQRtaVq0e9Qgc=
X-Google-Smtp-Source: APXvYqwcppQXzUDhu0fmcgOvTxCvhiMOKeT3KaPbAavAzvh4Ef9vtyHxPHrJhYoEIn71WJL6/qtnmtGH06weSoNnZ2k=
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr210314ljc.279.1582655603192; 
 Tue, 25 Feb 2020 10:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20200224230155.120894-1-ytht.net@gmail.com>
 <20200225102928.vnaamhecu5tnoaq2@sirius.home.kraxel.org>
In-Reply-To: <20200225102928.vnaamhecu5tnoaq2@sirius.home.kraxel.org>
From: lepton <ytht.net@gmail.com>
Date: Tue, 25 Feb 2020 10:33:11 -0800
Message-ID: <CALqoU4wtYQtLg=wVkepP29wYZYKKVx3PA1Nytfy+fZdqrp-_Jg@mail.gmail.com>
Subject: Re: RFC: drm/virtio: Dummy virtio GPU
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 2:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Feb 24, 2020 at 03:01:54PM -0800, Lepton Wu wrote:
> > Hi,
> >
> > I'd like to get comments on this before I polish it. This is a
> > simple way to get something similar with vkms but it heavily reuse
> > the code provided by virtio-gpu. Please feel free to give me any
> > feedbacks or comments.
>
> No.
>
> First, what is wrong with vkms?
The total lines of vkms driver is 1.2k+. I think it doesn't work along
itself to provide things like  mmap on prime fd? (I tried it months
ago). Of course, that could be fixed, but then it will bring more
code.  While my "dummy
virtio" code is only around  100 lines. And more, my "dummy virtio"
device actually doesn't really depends on drm system so it's easier to
back port to old kernel.



>
>
> Second, if you really want something simple with the minimal set of drm
> features possible you can write a rather small but still self-contained
> driver when using all the drm helpers (shmem, simple display pipe) we
> have these days.  Copy cirrus, strip it down: drop modesetting code,
> drop blit-from-shmem-to-vram code, drop pci probing.  Maybe add module
> options for max/default video mode.  Done.
I need features like prime export/import, mmap on prime fd etc. And
I'd like the code could work on different kernel version. So if go
with this ways, the actually add more maintain cost in the long term?
since any
changes at drm frame work could need change to it.
>
> What is the use case btw?
We have images works well under qemu + virtio vga, we'd like to run
these images on public cloud service like Google GCE directly.  So I
got the idea that if some how we can run virtio stack without vmm
support. That
actually would help and also let the same image run on other cloud services.
>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
