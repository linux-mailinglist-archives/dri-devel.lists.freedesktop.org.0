Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441F5714EB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676B58BAA3;
	Tue, 12 Jul 2022 08:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020714A005
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:43:39 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id mi10so2098408qvb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIOsMFmyfqmDsFlj2kK4zCMOMz4/ro5ji3cUAa947/A=;
 b=f1qjYN+B9QBc1iY3kdohe0sievdb6kdsXvY4m2B/0OFxV733wk2AfjfGGsBzOjUoWW
 RyYZyR0b119ct/rHbeeV8zk51N/NJYKT3idkjMUpOARWHhtiuI9tlHDKhfWc9svCh+D8
 X2AjIfjsJV1yu1nXI/8c6FrY0Ipv7tVfVBCr6MPl7bRsULaHMj+yPHb5jqFq0MtGnThx
 KvAR0t8KQESCQDwmjrHAm3KagBpnlADejeNbpNKguHnfIO/Is7zBBWqqvDUoibK5JBkf
 V1qbFwue8duPKU8gpKWegKDzP40th/24EHKbebGd7S/MKBt7L7TrB0Gq4ec3EryMWkCV
 0PCA==
X-Gm-Message-State: AJIora9xEmbupdyX86lLt72YWOwb55j4Q3eobysd8FbScAlKPlaihoJO
 6Q3JeCL217tDq98A5p3AlLuAiJzFzPBwZA==
X-Google-Smtp-Source: AGRyM1sJyab+6GgvjCUSZIQnSsW5lzWwM6Kox1LLU4878ZzP4kfdx7YnpAVR4aQ0r0r4enlhUQR//g==
X-Received: by 2002:a0c:9c03:0:b0:473:2e3b:509d with SMTP id
 v3-20020a0c9c03000000b004732e3b509dmr16983938qve.131.1657615418283; 
 Tue, 12 Jul 2022 01:43:38 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 n7-20020ae9c307000000b006a34a22bc60sm8079946qkg.9.2022.07.12.01.43.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:43:31 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 75so11514897ybf.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:43:29 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr21692729ybh.36.1657615408662; Tue, 12
 Jul 2022 01:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657300532.git.geert@linux-m68k.org>
 <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
 <96a87833-d878-dde9-e335-9ea51a4ba406@mailbox.org>
 <CAMuHMdUgdbZeoFLFL8+Hm-6fG9cg5Wzq++JED3KR5P9YZtRQ4A@mail.gmail.com>
 <20220712074715.kopstlvz4q6npaye@sirius.home.kraxel.org>
 <CAMuHMdVrf7fgzumcSnZJ3OMGqA34YExXcF3O15YXYpA1ykgKyQ@mail.gmail.com>
 <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
In-Reply-To: <20220712083907.3ic7bltstaskz72n@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 10:43:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
Message-ID: <CAMuHMdVhxE9aayG8qRMwUuBryiR_ng08m63_+GY8htFCSmUiWg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and
 RGB565 formats
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Tue, Jul 12, 2022 at 10:39 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> On Tue, Jul 12, 2022 at 10:01:15AM +0200, Geert Uytterhoeven wrote:
> > > It IMHO is not applicable to any physical hardware.  It's used by
> > > virtio-gpu where the supported format depends on the byte order
> > > (it is argb8888 in native byte order).  Only virtual hardware can
> > > have that kind of behavior.
> > >
> > > And we can probably drop the DRM_FORMAT_HOST_* variants for 1555 and
> > > 565, they are not used anywhere.
> >
> > Atari DRM supports (big-endian) RGB565, so it uses
> > DRM_FORMAT_HOST_RGB565.
>
> Fixed big endian should use 'DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN'.

True.

> As described above DRM_FORMAT_HOST_RGB565 means bigendian on bigendian
> hosts and little endian on little endian hosts.  Which is not correct
> when your hardware does big endian no matter what.

But (a) drm_driver_legacy_fb_format() uses DRM_FORMAT_HOST_RGB565
if quirk_addfb_prefer_host_byte_order is set, and (b)
quirk_addfb_prefer_host_byte_order must be set on big-endian as
per commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
bigendian drivers").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
