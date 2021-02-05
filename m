Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A9B3109CE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 12:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9976F409;
	Fri,  5 Feb 2021 11:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0774F6F404;
 Fri,  5 Feb 2021 11:07:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id l18so3583323pji.3;
 Fri, 05 Feb 2021 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nhU2mG//9BiHxfOHGEyX4R2P+B0rQePtnOzA7WvugBo=;
 b=ub0craqaAfA6SIaKFIUTQyc3gR/X3+ZokWLMxMtEG1CfDLWoaojnksd8bgR8Ukar8F
 KsVdeZfDqPwQ7QEMhlGkSw85OYOb/0qP1uDeqAjCLGnpHZnRYVfyVAPDZ8Qzwz07xVL+
 DQJLm1UNrypr0leMTBsZWJeq1jEU1fnHIGF2WqDiAYwAu8wmZ3TtfnSh8HzP8YdMYims
 +vxV6mFZfzkRzvuMydO91vbvlPKSpXMs+MA2XcsyozcA/n+eYTyxI/ZXf2WMTdcRgMto
 2aduFMoJMbUhlpxJGSvTPGggnAMvwIIRzHrjym+zP54h/N1DoM60dx85ucVKNQOFf3qN
 Q7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nhU2mG//9BiHxfOHGEyX4R2P+B0rQePtnOzA7WvugBo=;
 b=lL1dHu/gJCHmjuj7Vjcru+MJY1Oh74YFlAFlEEHwYpt5CIdRi/0UNv4LZTHMq2Kg2Z
 rjkq7YJslFvHk0Xc4FleiwcNQ66RfNN+f5mjspXPkk9i3cX1WQzma31+50McQGzwXb/4
 PTkVN1zyLK6uY6r+JboprZTIlvZFsRj3YKVrO0yI0Vgut/ZNvH/hXoNaCEJCpoNSmKpD
 9Nc2ajQu8ZvSEJjDEeAE3BvUcTsSkMzlB4cj5aFw7Coxxl06wIz8OKcPiB9SwB2A+aFC
 ZlpNhNyV/jKBoeKvc+yti+Jqz7jsDd1etGjVQN+wuG1iw51Rm+ZfUXsNF52tBU+SA2Ce
 nwHw==
X-Gm-Message-State: AOAM5309F1T0qEKFPX1uUDVSVmsymnXw7RXGKhuswMoKFXTcKuF+99ZM
 CXcZhbzYQUHMOXu7W0YCWxY+UML3PvqcngB9FyVi8NvoTX9gqg==
X-Google-Smtp-Source: ABdhPJzIsiRDxMPtSxoHGSTBvJJCZvHfnres8cQ9vFRuI2omv6Pg/k51VMnFe3zrd/k0F4m0rL+DRnYivOm/mvw5i68=
X-Received: by 2002:a17:902:b190:b029:df:fff2:c345 with SMTP id
 s16-20020a170902b190b02900dffff2c345mr3486428plr.17.1612523235627; Fri, 05
 Feb 2021 03:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au>
 <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
In-Reply-To: <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Feb 2021 13:06:59 +0200
Message-ID: <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Mark Gross <mark.gross@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
> Thanks. I already asked Patrik yesterday day if DRM missed to pull an immutable tag I provided. I think they can pull and resolve conflicts themselves. Alternatively it would be easy to resolve by Linus by removing Kconfig lines along with mentioned files,

Patrik, I have sent a PR again, so you may consider pulling it, thanks!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
