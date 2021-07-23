Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9223D3D3F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 18:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0654E6ED8E;
	Fri, 23 Jul 2021 16:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFBC6ED8E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627056773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NTO18YcF2qw6Kpg/GloKqP6tZBxoy9gh8XmkGeF9NE=;
 b=Zdjq+0NmIV1cinRkd4HYhlDIepfNIIB53q2WbZuVfooRtpBpgHAalS/fDWG903C9ZTEELT
 YNcZglg7d0ulZWISclDAVooR6o62i7Rv4OLjkYwdKONHuufjOykGKa5H14bb18JxAdxAG3
 oz5kb4ajlLJZBC3jEBv4qWknbiOQppU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-_FSiP_TkOlWbOB1fs-6pNA-1; Fri, 23 Jul 2021 12:12:50 -0400
X-MC-Unique: _FSiP_TkOlWbOB1fs-6pNA-1
Received: by mail-qk1-f197.google.com with SMTP id
 13-20020a370e0d0000b02903a5eee61155so1493150qko.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1NTO18YcF2qw6Kpg/GloKqP6tZBxoy9gh8XmkGeF9NE=;
 b=CobT68dO3DiRGe9E7oie4aBM6u9VZ3tb76P+0VFaQdQhmqkEqGV4wNr68cDurRo0YY
 slcGPagJeENep9WFJrvCOSjc0p+sTLmbY3wGpoorCL9exddWgXfTjAHcDvCagNSYboBM
 +elGJHUl6XoJZlYyvurlwc49eV4K7ByxSnMY8HOMpoDXIl29rsoUiruPx2i0jhCzT9oX
 2yH/EHQUrjfs0nxTYCmpATiYb++dYiaILTKQZ2i0t38whUd3rOcghHPJUptLetBrW87W
 lmKlnqJnNDW5O7w0xUEv+bf/y4fwtAjpVzY96Yu2Ta2xe+j+3ZnAJ3E/P8AWDHkOtSZd
 P6GQ==
X-Gm-Message-State: AOAM531nZIqoiG9JDrBmOjquPY7bUOZ+vVCWmjLiF1ZbNehwmlzQGC9X
 WGgiWCK2MrcRyx9ULoclRKsQT9as8ZJSSPSoPpLRFZYE74C6jjpRhJSMRc3OxRcD39e0EfO5yX1
 dlTccH2VR/zLZfeFJnFS2E3dkCcw2
X-Received: by 2002:a37:a557:: with SMTP id o84mr5316592qke.323.1627056770324; 
 Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzYXo962QZa+/2DWnJ5qoJGgdqtJlvieTRJp2rDEjkb+nPOP4CbJIp7neDMagHLOxSUTHzkQ==
X-Received: by 2002:a37:a557:: with SMTP id o84mr5316567qke.323.1627056770077; 
 Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c11sm11667633qth.29.2021.07.23.09.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:12:49 -0700 (PDT)
Message-ID: <d529bd638b394c7c918ff4753cf5cf18afc99989.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 12:12:47 -0400
In-Reply-To: <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-07-23 at 11:24 +0200, Daniel Vetter wrote:
> On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When the backlight support is disabled, the driver fails to build:
> > 
> > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function
> > 'nv50_sor_atomic_disable':
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct
> > nouveau_connector' has no member named 'backlight'
> >  1665 |         struct nouveau_backlight *backlight = nv_connector-
> > >backlight;
> >       |                                                           ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of
> > undefined type 'struct nouveau_backlight'
> >  1670 |         if (backlight && backlight->uses_dpcd) {
> >       |                                   ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of
> > undefined type 'struct nouveau_backlight'
> >  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight-
> > >edp_info);
> >       |                                                                ^~
> > 
> > The patch that introduced the problem already contains some #ifdef
> > checks, so just add another one that makes it build again.
> > 
> > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight
> > support for nouveau")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Can we just toss the idea that BACKTLIGHT=n is a reasonable config for
> drm drivers using backlights, and add depends BACKLIGHT to all of
> them?

Yeah - I'm fine with this IMHO, at least for the drivers actually supporting
backlights in some manner (I assume this is most of them though)

> 
> I mean this is a perfect source of continued patch streams to keep us
> all busy, but beyond that I really don't see the point ... I frankly
> have better things to do, and especially with the big drivers we have
> making backlight optional saves comparitively nothing.
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 093e1f7163b3..fcf53e24db21 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1659,20 +1659,23 @@ static void
> >  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct
> > drm_atomic_state *state)
> >  {
> >         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> > -       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> >         struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
> >         struct nouveau_connector *nv_connector =
> > nv50_outp_get_old_connector(state, nv_encoder);
> > -       struct nouveau_backlight *backlight = nv_connector->backlight;
> >         struct drm_dp_aux *aux = &nv_connector->aux;
> > -       int ret;
> >         u8 pwr;
> > 
> > +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> > +       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> > +       struct nouveau_backlight *backlight = nv_connector->backlight;
> > +
> >         if (backlight && backlight->uses_dpcd) {
> > -               ret = drm_edp_backlight_disable(aux, &backlight-
> > >edp_info);
> > +               int ret = drm_edp_backlight_disable(aux, &backlight-
> > >edp_info);
> > +
> >                 if (ret < 0)
> >                         NV_ERROR(drm, "Failed to disable backlight on
> > [CONNECTOR:%d:%s]: %d\n",
> >                                  nv_connector->base.base.id, nv_connector-
> > >base.name, ret);
> >         }
> > +#endif
> > 
> >         if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> >                 int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> > --
> > 2.29.2
> > 
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

