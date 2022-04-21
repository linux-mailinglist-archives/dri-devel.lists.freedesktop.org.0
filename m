Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96650A80B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0086D10E5C1;
	Thu, 21 Apr 2022 18:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFB910E5C1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 18:24:32 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso6210256fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+GdX+UHkH0eNAo6meXUpaGI295KhOZ6FvwD5VZUQ1q4=;
 b=HLxkEVymYTQCsjUwqen0K6SOKvIDhcrZuxWFvtbOcGQfYdk6NLPdgkpPTek9qryaxg
 eWWdxl6NdFqtLZQTb7+oNmOm7UqWaUNvG3Gg0w3C57LZY/+lsD+2igwTPa9NlOyhZL8s
 Wq0CdIrR8joZbkS6dfZEi3g23f7VYNvNR1OOLQ24FUL6vnD14qvLI5vICXmfu2tyRPRs
 mmsLihqeQYX1WHRCXCQr6PFqBH+kDcKtGx0exxtMX2mT87Pfb6FMblGejIZvudf0cOdh
 EEs/TZUxnbsplsNpcmrBbXJ5880bqjjC8bRzKCyubtRyXOSJ0YM0Hp5iruKH9uveeD9g
 Enug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+GdX+UHkH0eNAo6meXUpaGI295KhOZ6FvwD5VZUQ1q4=;
 b=5737/2Fv4XMnfPRMNOxPmNm3nDYqd+CTB2uUVU2vdPQFQ94pI16OCB4VhTz2dXtvWo
 a3V7q6RJLNWqa5uvcg33woJJU7g8fOfdiF3qGRj+wSxzwMKnZInHJqitpmYcl9OhQdHp
 0lpTu0S1CHiqW6d4qociNW9VLoCKWEhkHobqBgyPNPT5RsFoS5PA2+BuC9MVgkm+LutX
 UyNcD0l2C0aMDtqMLT/DC3sskqGLZTddu1jg8E4zJOeBneaKQBkxhnrEZbytRyQKPOt4
 FqOo8ggPHN6RqRRkoTevcoP0+UcTdE2uhaHGIi1/9kAxPN+JnbJsqUoxhLTn8vn8s3/F
 wc0w==
X-Gm-Message-State: AOAM532yJRKSyMZs5xhTlslzAavaRAxNInViQhQer+iLXlRimnyB3tWP
 uNfbW6BVXHWJWtGKUoVjlM68+/u/iHGrVZ4t5f8=
X-Google-Smtp-Source: ABdhPJxFE3Q94kGfOLByOPoI+McHxYQH8P04zsF1TGjlY1NjCe0CqDJ4K9oR5jaWpu0DTs6dF64eL2C1V+dgGUEPf6c=
X-Received: by 2002:a05:6870:a40d:b0:e5:ea09:df91 with SMTP id
 m13-20020a056870a40d00b000e5ea09df91mr354423oal.99.1650565471898; Thu, 21 Apr
 2022 11:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
 <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
 <dce29330-e40c-860e-2c72-7ddebdd96e20@redhat.com>
 <CAMeQTsYYpw5+uLgmDrbB6PUBotRC4F+_rfK+sxT0CpPHoiOmmw@mail.gmail.com>
 <10c81e57-2f09-f4f8-dc2f-6bd05ef819d7@redhat.com>
 <CADvTj4oms8R1fhFpyZ+juU=4Eozie6f-3fzz4+jtptj3M9VCbw@mail.gmail.com>
 <ce65d1b0-44ad-54cb-d53f-ed0f7df4d247@suse.de>
 <c3ed82bc-cc15-7d0d-8968-b71ad3d4003f@suse.de>
In-Reply-To: <c3ed82bc-cc15-7d0d-8968-b71ad3d4003f@suse.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 21 Apr 2022 13:24:20 -0500
Message-ID: <CADvTj4oyW1yfJhCC_yL2kehPJcSPCYXA2YZU44=oMr5K=6=pTw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 1:23 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 21.04.22 um 20:22 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 21.04.22 um 19:39 schrieb James Hilliard:
> >> On Thu, Apr 21, 2022 at 8:22 AM Javier Martinez Canillas
> >> <javierm@redhat.com> wrote:
> >>>
> >>> On 4/21/22 14:54, Patrik Jakobsson wrote:
> >>>> On Thu, Apr 21, 2022 at 2:47 PM Javier Martinez Canillas
> >>>> <javierm@redhat.com> wrote:
> >>>
> >>> [snip]
> >>>
> >>>>>>>> diff --git a/drivers/gpu/drm/gma500/Kconfig
> >>>>>>>> b/drivers/gpu/drm/gma500/Kconfig
> >>>>>>>> index 0cff20265f97..a422fa84d53b 100644
> >>>>>>>> --- a/drivers/gpu/drm/gma500/Kconfig
> >>>>>>>> +++ b/drivers/gpu/drm/gma500/Kconfig
> >>>>>>>> @@ -2,11 +2,13 @@
> >>>>>>>>    config DRM_GMA500
> >>>>>>>>        tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> >>>>>>>>        depends on DRM && PCI && X86 && MMU
> >>>>>>>> +     depends on FB
> >>>>>>>
> >>>>>>> Why do we need FB here? Framebuffer support should be hidden by
> >>>>>>> DRM's
> >>>>>>> fbdev helpers.
> >>>>>>
> >>>>>> It is not needed but gives him video output since it enables the d=
rm
> >>>>>> fbdev emulation.
> >>>>>>
> >>>>>
> >>>>> I'm not sure to understand this. Shouldn't depend on
> >>>>> DRM_FBDEV_EMULATION then?
> >>>>
> >>>> No, it shouldn't depend on any FBDEV stuff since it's not actually
> >>>> required. It just happens to help in this case since weston + fbdev
> >>>> backend works but not weston with drm backend (or whatever config
> >>>> James have set).
> >>>
> >>> I see. Then the correct approach for them would be to just enable
> >>> CONFIG_FB
> >>> and DRM_FBDEV_EMULATION in their kernel config, rather than making
> >>> this to
> >>> depend on anything FB related as you said.
> >>
> >> Yeah, so it looks like CONFIG_FB_EFI is not needed but
> >> CONFIG_DRM_FBDEV_EMULATION is, I think I just assumed efifb
> >> was what was needed based on the kernel logs.
> >>
> >> This does not work:
> >> CONFIG_FB enabled
> >> CONFIG_DRM_FBDEV_EMULATION disabled
> >>
> >> This works:
> >> CONFIG_FB enabled
> >> CONFIG_DRM_FBDEV_EMULATION enabled
> >>
> >>>
> >>>>
> >>>>>
> >>>>>> I looked some more at the logs and it seems weston doesn't work on
> >>>>>> his
> >>>>>> system without the fbdev backend. So the question is why weston is=
n't
> >>>>>> working without fbdev? Perhaps this is just a Weston configuration
> >>>>>> issue?
> >>>>>>
> >>>>>
> >>>>> But is weston using the fbdev emulated by DRM or the one registered=
 by
> >>>>> efifb? I thought that the latter from what was mentioned in this
> >>>>> thread.
> >>>>
> >>>> It's using drm fbdev emulation with gma500 so EFIFB has nothing to d=
o
> >>>> with this. I believe it was just simply incorrectly reported. If I'm
> >>>> correct then "depends on FB" is what makes video output work for
> >>>> James.
> >>>>
> >>>
> >>> Got it. Thanks for the clarification.
> >>
> >> Here's my weston.ini:
> >> [core]
> >> shell=3Dkiosk-shell.so
> >> modules=3Dsystemd-notify.so
> >> backend=3Ddrm-backend.so
> >> idle-time=3D0
> >> require-input=3Dfalse
> >> use-pixman=3Dtrue
> >>
> >> [shell]
> >> locking=3Dfalse
> >> cursor-theme=3DObsidian
> >> panel-position=3Dnone
> >>
> >> [output]
> >> name=3DDVI-D-1
> >> transform=3Drotate-270
> >>
> >> [output]
> >> name=3DDP-2
> >> mode=3Doff
> >>
> >> [output]
> >> name=3DLVDS-1
> >> mode=3Doff
> >
> > You mentioned that you want to use HDMI, but it's not configured here.
> > Is that intentionally?
>
> Nevermind. I just saw that DVI-D-1 is the HDMI port. (why?)

Not sure why the HDMI output is named DVI-D-1 but that's what
seems to configure it on this board.

>
> >
> > Best regards
> > Thomas
> >
> >>
> >> [libinput]
> >> touchscreen_calibrator=3Dtrue
> >>
> >>>
> >>> --
> >>> Best regards,
> >>>
> >>> Javier Martinez Canillas
> >>> Linux Engineering
> >>> Red Hat
> >>>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
