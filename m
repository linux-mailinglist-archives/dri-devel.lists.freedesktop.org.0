Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC980262E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 19:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2B010E0B7;
	Sun,  3 Dec 2023 18:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EF610E155
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 18:15:07 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5cd81e76164so40800897b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701627307; x=1702232107; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VBw8A5WuhAfyasORYk3sNHDucWPtvrzZdNlLhqgrg1E=;
 b=g3te0d48pUVV3lbLgVk26T13OENPR+nEGLY0Q/+5iwmGT0e2dHHDwiwK5nkPLr8NKg
 mWxpYKWCRfa+Zx0SyFZAc/z/KLgQN21Rtohru0MIUN38dGlamEQXRYJgFFz2kc/Otxtn
 xqkeRUCVlGxKPV/tBFSdodLzUIq+Ta7UpsUrJoV5WrbOc+LIkrEnUKeVZ+Pf9Y7HyIBM
 b2r5deFyqo4r3aFaXizsu1aEftDTCVzOR2BIX6BYJbSurVBkypAQebOhlC/obV+WGSDu
 qA7se6njCvKNry3aGqSkRqrHEn+PrHHRLHEu9TLDFXiudZznNZaKaPsdwM3BIs9G9zLZ
 NWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701627307; x=1702232107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBw8A5WuhAfyasORYk3sNHDucWPtvrzZdNlLhqgrg1E=;
 b=BkV9Sjn8OBuRpbXwDTWaosJqbpep404hA2DVVx7PuBd4TIy3AwozUkUdv/X//OgNaL
 jNAybl1yBYLC3BhM8dH2UhLx+eVtho3ANghKCJkai48RQ1cxlYgDNWuXTYj2OW5WfJ7F
 J3Kmcnjc4HvflQyOHZUdW/Myw0LDBmQt30p5dCD/oXlRjRC+g//vQvcrKa71F62gPUyf
 7ckH3vRe2sxjMflrddqACRG43Wj+3CgsuWweDnGmD2LpSPJ0rcI96zgHv33AL6nG/JS6
 e1FaE35HeFr3gEZD1duikSDX6IZQ6qan7xYCpvNRAXGfcLe8EiDZ2jbHa5AGmGA+3DqS
 OmBQ==
X-Gm-Message-State: AOJu0Yz3I7RpB/2w68RsJgbFrpDWsBtUaXXaLtYnd7GQcQYlila3xiFC
 vN0hoeRqjgKPyKq5pIPVDp6BJ9CoOggVeDtqJQcVeA==
X-Google-Smtp-Source: AGHT+IFUy8B/4S31oVJp9dqmSc+u4tDNY7+u9M9vX7qbZTp0uUteKIcgNDwDYa2dp4XivmCNvukRiq8p2gb2GfW9Zyg=
X-Received: by 2002:a05:690c:3381:b0:5d6:c347:4b11 with SMTP id
 fl1-20020a05690c338100b005d6c3474b11mr1829719ywb.42.1701627307031; Sun, 03
 Dec 2023 10:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
 <20231203142441.GA26644@pendragon.ideasonboard.com>
In-Reply-To: <20231203142441.GA26644@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:14:56 +0200
Message-ID: <CAA8EJpoykwsMWX+msDAB3TZaBmwE4iA4fiDiA-iOELmWd50s-w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm: improve the documentation of connector
 hpd ops
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 quic_parellan@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 3 Dec 2023 at 16:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Abhinav,
>
> Thank you for the patch (and thank to Dmitry for pinging me on IRC, this
> patch got burried in my inbox).
>
> On Wed, Sep 20, 2023 at 01:13:58PM -0700, Abhinav Kumar wrote:
> > While making the changes in [1], it was noted that the documentation
> > of the enable_hpd() and disable_hpd() does not make it clear that
> > these ops should not try to do hpd state maintenance and should only
> > attempt to enable/disable hpd related hardware for the connector.
>
> s/attempt to //

I can probably fix this while applying the patch.

>
> >
> > The state management of these calls to make sure these calls are
> > balanced is handled by the DRM core and we should keep it that way
> > to minimize the overhead in the drivers which implement these ops.
> >
> > [1]: https://patchwork.freedesktop.org/patch/558387/
> >
>
> You could add a
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  include/drm/drm_modeset_helper_vtables.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index e3c3ac615909..a33cf7488737 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1154,6 +1154,11 @@ struct drm_connector_helper_funcs {
> >        * This operation is optional.
> >        *
> >        * This callback is used by the drm_kms_helper_poll_enable() helpers.
> > +      *
> > +      * This operation does not need to perform any hpd state tracking as
> > +      * the DRM core handles that maintenance and ensures the calls to enable
> > +      * and disable hpd are balanced.
> > +      *
> >        */
> >       void (*enable_hpd)(struct drm_connector *connector);
> >
> > @@ -1165,6 +1170,11 @@ struct drm_connector_helper_funcs {
> >        * This operation is optional.
> >        *
> >        * This callback is used by the drm_kms_helper_poll_disable() helpers.
> > +      *
> > +      * This operation does not need to perform any hpd state tracking as
> > +      * the DRM core handles that maintenance and ensures the calls to enable
> > +      * and disable hpd are balanced.
> > +      *
> >        */
> >       void (*disable_hpd)(struct drm_connector *connector);
> >  };
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
