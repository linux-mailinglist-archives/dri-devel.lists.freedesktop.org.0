Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85654B380D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 21:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC23010E32C;
	Sat, 12 Feb 2022 20:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99D910E32C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 20:52:50 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id 9so15622868iou.2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 12:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EaOHzElyl19Lio2+IgXQrdRampgn3IJJk51hhGDrqvQ=;
 b=KVqxiJGuWbJrdebicCaB7tX22B4zEAB3wwjo7W3SPoaLHL3BDkZyEKIahLKN/+Q7j4
 77LklzuygOVcwPnNRaGsHGYbwb03QXfYhlnYSPGE2HyHYDZhICdCwwWLowk2l8ume2qS
 HfcyYoUTt9WHC82A/quACBaIPEblBoIG9gfBZY9eRA7F7DFsfP1Dqfcd3k90TOl/HFAv
 IJf704B/KMPjd3lYlrG7cdy1y0zxAxvup8j08GCRHsWveW4wdZG2jV6hA2rXw0HiUg2o
 GWmfYUe0lz1TiKJAqihQbda3S4QRpuwBxUSWOxJiG7k6hEmWmV0vzDcyLxzfP6C/KcyG
 ypMg==
X-Gm-Message-State: AOAM532XJMyxbEt5ZQipSH0OiwTrlrkt6FZ1cPF3gWZRW3b+DAq5VhOm
 L/va8MxWAZXoW+2iuTqDX1554dyS0pvO575X2z8=
X-Google-Smtp-Source: ABdhPJx930dZNCBqHCUogbSTyuDbp2FVQxBA/TLL+y3xo4J5StPz1eItQanT5mUqU7fNh7az3GyCJ7Yxv3mwAOSpRYU=
X-Received: by 2002:a05:6638:37a1:: with SMTP id
 w33mr3957440jal.73.1644699168559; 
 Sat, 12 Feb 2022 12:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <11ac5696-29e3-fefa-31c0-b7b86c88bbdc@189.cn>
 <20220209084908.kub4bs64rzhvpvon@houat>
 <84bfb2fc-595c-3bae-e8a0-c19ccbcfcfd8@189.cn>
 <20220209161624.42ijbnhanaaari46@houat>
In-Reply-To: <20220209161624.42ijbnhanaaari46@houat>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 12 Feb 2022 15:52:37 -0500
Message-ID: <CAKb7UvjJHaDtCnLkVpOpxXC90X6o3TLC+EQOmf9g-BPbS-_rHA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Sui Jingfeng <15330273260@189.cn>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 9, 2022 at 11:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Feb 09, 2022 at 10:38:41PM +0800, Sui Jingfeng wrote:
> > On 2022/2/9 16:49, Maxime Ripard wrote:
> > > On Fri, Feb 04, 2022 at 12:04:19AM +0800, Sui Jingfeng wrote:
> > > > > > +/* Get the simple EDID data from the device tree
> > > > > > + * the length must be EDID_LENGTH, since it is simple.
> > > > > > + *
> > > > > > + * @np: device node contain edid data
> > > > > > + * @edid_data: where the edid data to store to
> > > > > > + */
> > > > > > +static bool lsdc_get_edid_from_dtb(struct device_node *np,
> > > > > > +                                unsigned char *edid_data)
> > > > > > +{
> > > > > > +     int length;
> > > > > > +     const void *prop;
> > > > > > +
> > > > > > +     if (np == NULL)
> > > > > > +             return false;
> > > > > > +
> > > > > > +     prop = of_get_property(np, "edid", &length);
> > > > > > +     if (prop && (length == EDID_LENGTH)) {
> > > > > > +             memcpy(edid_data, prop, EDID_LENGTH);
> > > > > > +             return true;
> > > > > > +     }
> > > > > > +
> > > > > > +     return false;
> > > > > > +}
> > > > > You don't have a device tree binding for that driver, this is something
> > > > > that is required. And it's not clear to me why you'd want EDID in the
> > > > > DTB?
> > > > 1) It is left to the end user of this driver.
> > > >
> > > > The downstream motherboard maker may use a dpi(XRGB888) or LVDS panel
> > > > which don't have DDC support either, doing this way allow them put a
> > > > EDID property into the dc device node in the DTS. Then the entire system works.
> > > > Note those panel usually support only one display mode.
> > > I guess it depends on what we mean exactly by the user, but the DTB
> > > usually isn't under the (end) user control. And the drm.edid_firmware is
> > > here already to address exactly this issue.
> > >
> > > On the other end, if the board has a static panel without any DDC lines,
> > > then just put the timings in the device tree, there's no need for an
> > > EDID blob.
> >
> > Loongson have a long history of using PMON firmware, The PMON firmware
> > support flush the dtb into the the firmware before grub loading the kernel.
> > You press 'c' key, then the PMON will give you a shell. it is much like a
> > UEFI shell. Suppose foo.dtb is what you want to pass to the vmlinuz.
> > Then type the follow single command can flush the dtb into the PMON firmware.
> >
> > |load_dtb /dev/fs/fat@usb0/foo.dtb|
> >
> > For our PMON firmware, it**is**  totally under developer/pc board maker's control.
> > You can flush whatever dtb every time you bootup until you satisfied.
> > It(the pmon firmware) is designed to let downstream motherboard maker and/or
> > customers to play easily.
> >
> > Support of reading EDID from the dtb is really a feature which downstream
> > motherboard maker or customer wanted. They sometimes using eDP also whose
> > resolution is not 1024x768. This is out of control for a graphic driver
> > developer like me.
>
> And, to reinstate, we already have a mechanism to set an EDID, and if it
> wasn't an option, the DT is not the place to store an EDID blob.

Note that it's pretty common on laptop GPUs to have the attached
panel's EDID be baked into the VBIOS or ACPI (for LVDS / eDP). The hw
drivers in question (e.g. nouveau, radeon, probably i915) know how to
retrieve it specially. I'm no DT expert, but I'd imagine that it's
meant to allow mirroring those types of configurations. Stuff like
"drm.edid_firmware" isn't really meant for system-configuration-level
things, more as an out in case something doesn't work as it should.

Cheers,

  -ilia
