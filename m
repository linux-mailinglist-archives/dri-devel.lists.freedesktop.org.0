Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FAE11827F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFD36E835;
	Tue, 10 Dec 2019 08:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0722B6E4A7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:24:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so15393408wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3aQgCzVXGjFTrtUbOB4wjQrTUXreQPJyiEx8595ZYo=;
 b=N/OUcju85TvBwEvD5Vm1yWqriQfQ9gJvf/eV0DfrvcmSyj9IR+tj1Mzx8pFVYPugVo
 h9QmytyNRp3GxENU3fqcGfdoqXEU5nm2t52FxN0RE8OIcZKglKfg4hJTxykmKxAOgL5k
 Z9swL+oiNTi3Db4nhRRkArw9hteRcCIkHEWxt4sK8Zz8fCfSzleaChLXd8Tj8d/aamvM
 fd8CuQKicbp/cD33vjNfxXzt/fg2jyjcD26RJD1brI1NLCZUynN0vpEgr9mBYQya9PJl
 AO7LxCzoyICLF7Spr3xox0p/UWYQ/6+90gWX45/UXxzCwl8i9m65QpxKmsCmcddQO0vU
 BPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3aQgCzVXGjFTrtUbOB4wjQrTUXreQPJyiEx8595ZYo=;
 b=hbalPGi6x3bJPFipSYgGorU7UAeh9i9I3GHhNp5dEQu3hXq+FbKB4Gu1xwQttMosXy
 WYwv7G4UwmsuVlXAr/3TJgMkv6Nt4hf2S4U9YWg/Vga6qiH6buqgD0AGYN96jCJNvoNM
 wbWMF3/NY7wWiHXQgjhHdnAGMQ3LDfwSwauae91nTrQi2xj9tcJ21fYmvXWNyYumm0E6
 1ogbVyXAscAdXMvMy97bO0sEVCj4+kSkarRSwL/E5nuc7abb9goKKY9ehNyABq32u8GM
 e/iDij1m4HPAL+8rROSdPTYvgpwNxVwlYGswMK/ynO6cFL3xfoAcy2kEfxNLvtDxvHmo
 cvTA==
X-Gm-Message-State: APjAAAX6CrScBkc0ngnK5gI+6bmwwME5tcddPY59fPXVRLpOjPxtJ89+
 aqoLA4kX1CGt41/XpAf+6dQhEvtPXqsZn1ABNjs=
X-Google-Smtp-Source: APXvYqzAs6PasDmMLo5/mmYTFJLJlTtMzommONDNOTOvYCBpIrsKmuPFEzdq8E2lVXj0f4mHvgzuMsSIyP0wd2Z2rxw=
X-Received: by 2002:a05:600c:2951:: with SMTP id
 n17mr8752023wmd.75.1575905072548; 
 Mon, 09 Dec 2019 07:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20191209050857.31624-1-andrew.smirnov@gmail.com>
 <20191209050857.31624-3-andrew.smirnov@gmail.com>
 <45afdff8-4f91-f5be-a299-d0c7fed71ea7@ti.com>
 <CAHQ1cqH8XTYysd1Nv2Q0EziXfJWeemZeyyZZ3OKoCv8=XrHZWA@mail.gmail.com>
 <f873e4de-eabf-2746-8ad8-3d3c7d64a270@ti.com>
In-Reply-To: <f873e4de-eabf-2746-8ad8-3d3c7d64a270@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Dec 2019 07:24:21 -0800
Message-ID: <CAHQ1cqE-7qof2ogCv-00uK9KBk+Uy2xFQ8RsxKFm_ts1EH75fw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Expose test mode
 functionality via debugfs
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 7:05 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 09/12/2019 16:38, Andrey Smirnov wrote:
> > On Mon, Dec 9, 2019 at 1:38 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >>
> >> (Cc'ing Daniel for the last paragraph)
> >>
> >> On 09/12/2019 07:08, Andrey Smirnov wrote:
> >>> Presently, the driver code artificially limits test pattern mode to a
> >>> single pattern with fixed color selection. It being a kernel module
> >>> parameter makes switching "test pattern" <-> "proper output" modes
> >>> on-the-fly clunky and outright impossible if the driver is built into
> >>> the kernel.
> >>
> >> That's not correct, /sys/module/tc358767/parameters/test is there even if the driver is built-in.
> >>
> >
> > True, I'll drop the "impossible" part of the descrption. Having to
> > unbind and bind device to the driver to use that parameter definitely
> > falls under "clunky" for me still, so I'll just stick to that in the
> > description.
>
> You don't need to re-bind. You can change the module parameter at runtime, and if the driver happens
> to use the value, then it uses the new value. If I recall right, changing the module parameter and
> then doing a full modeset from userspace made the driver to use the test mode (I'm not 100% sure,
> though).
>
> In any case, I'm not advocating for the use of module parameter here =)
>
> >> Hmm, actually, just echoing 0 to tstctl multiple times, it makes the screen go black and then
> >> restores it with every other echo.
> >>
> >
> > Strange, works on my setup every time. No error messages in kernel log
> > I assume? Probably unrelated, but when you echo "0" and the screen
>
> No errors.
>
> > stays black, what do you see in DP_SINK_STATUS register:
> >
> > dd if=/dev/drm_dp_aux0 bs=1 skip=$((0x205)) count=1 2>/dev/null | hexdump -Cv
> >
> > ? Note that this needs CONFIG_DRM_DP_AUX_CHARDEV to be enabled.
>
> I'll check this later, and do a few more tests.
>
> >>> +     debugfs = debugfs_create_dir(dev_name(dev), NULL);
> >>> +     if (!IS_ERR(debugfs)) {
> >>> +             debugfs_create_file_unsafe("tstctl", 0200, debugfs, tc,
> >>> +                                        &tc_tstctl_fops);
> >>> +             devm_add_action_or_reset(dev, tc_remove_debugfs, debugfs);
> >>> +     }
> >>> +
> >>
> >> For me this creates debugfs/3-000f/tstctl. I don't think that's a clear or usable path, and could
> >> even cause a name conflict in the worst case.
> >>
> >
> > I agree on usability aspect, but I am not sure I can see how a
> > conflict can happen. What scenario do you have in mind that would
> > cause that? My thinking was that the combination of I2C bus number +
> > I2C address should always be unique on the system, but maybe I am
> > missing something?
>
> Well, the dir name doesn't have "i2c" anywhere, so at least in theory, some other bus could have
> "3-000f" address too.
>
> Maybe bigger problem is that it's not at all obvious what "3-000f" means. All the other debugfs dirs
> make sense when you look at the name, and "3-000f" looks very odd there.
>

Fair enough, so what if we changed the name say "tc358767-3-000f" (i.
e. used "tc358767-" + dev_name(dev)), would that be a reasonable path
forward?

Thanks,
Andrey Smirnov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
