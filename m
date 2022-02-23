Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C805F4C1594
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3D10E47F;
	Wed, 23 Feb 2022 14:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBEF10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:39:39 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id d11so3392968vsm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmmQlNyVcUCdviTAxSsLNE1aECg5vn2qlb2k3lj39A0=;
 b=Vz5Pn2R+nXVq+TvMJIahZH7oKagsmqhn8ya3RIlrgDCh/cbZ1oJzMTnzfafQxqRjJA
 /DqufiGgXg+cXruCS6o3Mw2pQ4rpePdFzog7595tl4nZPKz024zsjqYGpdA5zmmCtKTp
 oVeY3T11Gqr22Y+EWBtx/B10KpR+epPUmbzbx2HD7/G0I1UE4dpZEV5RN85OdB3YMJlo
 yYHA6xjiYIL4e5AaOpgcx/O1CsoOZckQZT0mH89TN6hixX/6w036FXwa7bEGs2TbolFA
 /tZw4caloH99xPUAXpD5M43R9x+1rp08dMzGgjE+1jhmN/mPIuxYnnkxdPUyqz9BI6As
 gHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmmQlNyVcUCdviTAxSsLNE1aECg5vn2qlb2k3lj39A0=;
 b=WtXR5bXFuUkbNJSFtnVqZXZEleaRnEGpHHHErGt4cJanM4NBdnI+BuneMMdzW3puGu
 tU0YJ9Nu2rBxAgcwLovpzHuaODWStIpS46nplXlRRRUcBokxp9Vb8z9pRNtYs/tTJZ9o
 0SQ025fUvFUmhPx/6fftfdfdKkY6bhE3Fv+53UxKuLW3LlWPXoopOqpkzjmqXF9bzDtT
 nEPzfQZt8WVuz/efXi0cpTtotS6tRad6QRYd0aqyTR8K2GcUed3V+S7OnthV3zKl9S3/
 rldNGbA0xe+HBJGPBijWQ0iuJNkp+Vhwa78q9dysUN2X/yBTdihTTLEt6siSmwqppXHZ
 vJ4g==
X-Gm-Message-State: AOAM53254FbiMXAaygJnhdzK80gY2dVTHcshdYMJTmYRg6Vp+0wDUE5S
 tLFKSrlrCpzphMAnBr3ePGPT00NJEsf90wPF3z8=
X-Google-Smtp-Source: ABdhPJyshi+8CDq60UDU3QRjjbvt8yMiPSFfv8v2eMlIWpoeiU8s/6mGPOYceMerw5Hx7jpV6kpqeBBW+CP5lQyhsO8=
X-Received: by 2002:a67:e046:0:b0:30d:c59c:7f06 with SMTP id
 n6-20020a67e046000000b0030dc59c7f06mr12490670vsl.86.1645627178162; Wed, 23
 Feb 2022 06:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20220221220045.11958-1-hdegoede@redhat.com>
 <99294308-3d33-f24c-1292-20a88980e973@suse.de>
 <e84ea711-69ce-62ac-cb2e-2d87d75355fa@redhat.com>
In-Reply-To: <e84ea711-69ce-62ac-cb2e-2d87d75355fa@redhat.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 23 Feb 2022 14:39:26 +0000
Message-ID: <CALeDE9MpzLhq2mU_k_hBsf=4vb3RL1Fi6UzJW+1PT23ksVLnEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 11:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/22/22 20:14, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 21.02.22 um 23:00 schrieb Hans de Goede:
> >> Some devices use e.g. a portrait panel in a standard laptop casing made
> >> for landscape panels. efifb calls drm_get_panel_orientation_quirk() and
> >> sets fb_info.fbcon_rotate_hint to make fbcon rotate the console so that
> >> it shows up-right instead of on its side.
> >>
> >> When switching to simpledrm to fbcon renders on its side. Call the
> >
> > Maybe '... fbcon renders sidewards.'
>
> that does not sound entirely right to me, so I've gone with:
>
> "When switching to simpledrm the fbcon renders on its side."

Not to completely bike shed but you could say "... the fbcon renders
with the incorrect orientation"

> as suggested by Javier (so s/to/the/ ).
>
> >
> >> drm_connector_set_panel_orientation_with_quirk() helper to add
> >> a "panel orientation" property on devices listed in the quirk table,
> >> to make the fbcon (and aware userspace apps) rotate the image to
> >> display properly.
> >>
> >> Cc: Javier Martinez Canillas <javierm@redhat.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Thank you both for the review/ack. I'm currently doing a
> test-build of drm-misc-next with the patch with amended
> commit msg applied. Once that is done I'll push this out
> to drm-misc-next.
>
> Regards,
>
> Hans
>
>
>
> >> ---
> >>   drivers/gpu/drm/tiny/simpledrm.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> >> index 04146da2d1d8..11576e0297e4 100644
> >> --- a/drivers/gpu/drm/tiny/simpledrm.c
> >> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> >> @@ -798,6 +798,9 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
> >>       if (ret)
> >>           return ret;
> >>       drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
> >> +    drm_connector_set_panel_orientation_with_quirk(connector,
> >> +                               DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> >> +                               mode->hdisplay, mode->vdisplay);
> >>         formats = simpledrm_device_formats(sdev, &nformats);
> >>
> >
>
