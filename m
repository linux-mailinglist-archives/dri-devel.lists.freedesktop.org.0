Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2CA3D3DA7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 18:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62E6ED03;
	Fri, 23 Jul 2021 16:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF006ED03
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627058108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jBKfujrZeXlnAEPqRseOsz+DSjWxEDmI89ivOTZgHQY=;
 b=A+krUlqCDQ9g4WQPhZTdlLq4ApcONuD3c1KWzTAGFDPiW3+BKXI41ZV4OvL3ehH9cCW2Fx
 ice3lQsRmBRkH/7KfAXgd+GG3EoXS9mWCtH5fFFSElMG40INw/gMP9zmkkgoSgu08Tsekh
 SfKe68biYNt/87Zd8dyh2bqoVMEgLxU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-p3b1nEHpMP2gXC_zW0gwnw-1; Fri, 23 Jul 2021 12:35:07 -0400
X-MC-Unique: p3b1nEHpMP2gXC_zW0gwnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020a5d4a4f0000b0290141a87409b5so1168412wrs.16
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jBKfujrZeXlnAEPqRseOsz+DSjWxEDmI89ivOTZgHQY=;
 b=oi8ZO9ShssVoq3e0Hqj5HAA9EFU1rkCvoqbMMW7cp2pzSCLdqNp5D6Y0K1R1/cdHCc
 dDg8QuzagLId2i/Qik3I195QYA7F53sQaGVH2LDltckOEKwvWRi/N1QS0NUSRv4CNYAg
 lBMonzpCAeK8EauSwLUTYDEMMzU+5jgNujVpim5NygVsastuOcXGMO9+ayEI4rHImyng
 CbISMQoEZDgdq0gHTnKmPLTWC3ziQsy/n/S7uIWv8ALfCxzDt8yS2LW1qcUe/woaf5tD
 LY42MhzXXT7iv8/xlXpgQNWqzMyKLStCPo9gsFtmU/kvbWdEvftLrjJ8bVDkBhnX/wlq
 qZeg==
X-Gm-Message-State: AOAM533ob4YrWIF6ehHWJdcY4LEyaWjSm+YjjpvtH8G/Rhd1zXEZ6xdP
 EVrkbK7u18S0kU4YBP9gE3wsedqxCWR+FBoDbdwAjfvOZhPsRsUGCJemVrXQX6KwQvoeFSrqYJX
 ozT7VRAvIIourWBhpL/ADc+J87zhRXpJiuPY8FbtPnflZ
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr6485201wrn.113.1627058090730; 
 Fri, 23 Jul 2021 09:34:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjZmLFiXzbRdB1FSZxk6Ci9/11PUg5q7Gnq6fHY+P642HnHn3ZO13MsX1/M3WvfMfwQhNQ9sYSLAOwuVdUjA0=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr6485172wrn.113.1627058090493; 
 Fri, 23 Jul 2021 09:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
 <CACO55tvQoCnjQWRJhrJ+8TzY5MuDDSUSnwd5AU8G1qsQYCSCBg@mail.gmail.com>
 <7ddd0c7c-9bdc-9ea3-c635-f1d141d1e870@infradead.org>
In-Reply-To: <7ddd0c7c-9bdc-9ea3-c635-f1d141d1e870@infradead.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 23 Jul 2021 18:34:39 +0200
Message-ID: <CACO55ttjQO5kUeEA7opvGLAwT+a1t0vAguncKDhB4bdy96K7LA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
To: Randy Dunlap <rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 6:31 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/23/21 8:15 AM, Karol Herbst wrote:
> > On Fri, Jul 23, 2021 at 5:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> On 7/23/21 2:15 AM, Arnd Bergmann wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> When the backlight support is disabled, the driver fails to build:
> >>>
> >>> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> >>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
> >>>  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
> >>>       |                                                           ^~
> >>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
> >>>  1670 |         if (backlight && backlight->uses_dpcd) {
> >>>       |                                   ^~
> >>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
> >>>  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> >>>       |                                                                ^~
> >>>
> >>> The patch that introduced the problem already contains some #ifdef
> >>> checks, so just add another one that makes it build again.
> >>>
> >>> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> >>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >>> ---
> >>>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
> >>>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> index 093e1f7163b3..fcf53e24db21 100644
> >>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> @@ -1659,20 +1659,23 @@ static void
> >>>  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
> >>>  {
> >>>       struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> >>> -     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> >>>       struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
> >>>       struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
> >>> -     struct nouveau_backlight *backlight = nv_connector->backlight;
> >>>       struct drm_dp_aux *aux = &nv_connector->aux;
> >>> -     int ret;
> >>>       u8 pwr;
> >>>
> >>> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> >>> +     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> >>> +     struct nouveau_backlight *backlight = nv_connector->backlight;
> >>> +
> >>>       if (backlight && backlight->uses_dpcd) {
> >>> -             ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> >>> +             int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> >>> +
> >>>               if (ret < 0)
> >>>                       NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
> >>>                                nv_connector->base.base.id, nv_connector->base.name, ret);
> >>>       }
> >>> +#endif
> >>>
> >>>       if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> >>>               int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> >>>
> >>
> >> Hm, only Lyude Paul replied to this patch:
> >>
> >> https://lore.kernel.org/lkml/20210714171523.413-1-rdunlap@infradead.org/
> >>
> >
> > what's actually the use case of compiling with
> > CONFIG_DRM_NOUVEAU_BACKLIGHT=n anyway?
>
> Dunno. In this case it was just a randconfig. Still, it needs to be
> handled in some way - such as the other suggestion in this thread.
>

sure, I was just curious if there was a specific use case or just
something random as you mentioned.

