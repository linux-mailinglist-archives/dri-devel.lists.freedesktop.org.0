Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B517C566
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 19:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6A6E34C;
	Fri,  6 Mar 2020 18:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134A56E34C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 18:26:23 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id c18so2134250vsq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 10:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTGoDBwTk5dBlcKfQF8+N/hurhu0+0rawPM0E7p1sTQ=;
 b=QPP3FW0SQmo1eV9SMEWHMsKlbnbV1lVPR7CH1StrDve2bSCs7w3bRl6Fa6smjVpoj0
 UMXehI1XESsZTOv7B9WCt5u9TJrcvJuhjEhcaJG4pMuqddpfaRgi1QZ56+Wunm9Urq+9
 aywMAOf0u0GQu0GxFtLSO2VPvQFT5tm/kAlVGM92Nzc6k5Fi/gMTxR9ovafDU2vs+xYf
 4/9o3PD+pphbHavxRXpq+/dYqM4bkTxvRNtjVbPOMBE51sJkiROZ0zkA+WgcTAuC3Y09
 LS96eXIwBMFo/xb6LLdTw1Ti1rqRVQQnqGtADdz2hmwynDkkNo+w832OAtZCBKl6saDA
 NjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTGoDBwTk5dBlcKfQF8+N/hurhu0+0rawPM0E7p1sTQ=;
 b=ZwKWSW+xxyhzGNE9txiQcdGtv2Ej1oYqB3N8gjh06qo+GHg48RwaCmpsrxM8cnanDo
 KG8zwA9ZDKLv0X42Lcf104Qh5KFIATzSZnjsqq6mna79I8S777L5E5pNTRBMPylqC7H7
 yGYheyC4ZT/KmkK4Vq6jymTLUgOJ4gENOwrGfyqqYyqmmKHM6H6dpIwxu6Kb61cObbgy
 YhuoMEMumMz5jH1/cDO7CzBqiN5hQCjFz195C16BOaFvfP7CbbYoGiO+9TBYVJglQ08Z
 UNUWA9geVovqb5rz99yEllTdOaTj0YFj3L82m0hDsTlD/jp9nF0+asGCmK60EAPXLBlE
 Eh6g==
X-Gm-Message-State: ANhLgQ2KvXTSvL5H3oz8Jd/Csr+FNIoxP7DJ4hkyVIo+biaLuUZyY8K7
 1i6QwqYCxb2S/nMjHsnDO3OE+KjMJ3dggAHfS7w=
X-Google-Smtp-Source: ADFU+vtzYQQ2eEIAFAObyeYOGEFTO9PLbX7MKs3ynZY0zn+sY9OWtHx4f3nGlKE5wq4owiTXgXATovgiZHP814zEeDw=
X-Received: by 2002:a67:ab43:: with SMTP id k3mr3264309vsh.138.1583519182237; 
 Fri, 06 Mar 2020 10:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20200303120136.18294-1-andrzej.p@collabora.com>
 <20200303120136.18294-4-andrzej.p@collabora.com>
 <CACvgo52PpN2oqp9q5K_YSd+J1EQuzcmRyq4tPGu-T28ZHjFq4Q@mail.gmail.com>
In-Reply-To: <CACvgo52PpN2oqp9q5K_YSd+J1EQuzcmRyq4tPGu-T28ZHjFq4Q@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 6 Mar 2020 18:25:43 +0000
Message-ID: <CACvgo50uyGnnpv_woJgewdDuJnAonbo=CvGS63fbNiH=YtEQ_Q@mail.gmail.com>
Subject: Re: [PATCHv6 3/6] drm/arm/malidp: Factor-in framebuffer creation
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Mar 2020 at 16:51, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> > +               objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
> > +               if (!objs) {
> > +                       DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> >
> > -       objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
> > -       if (!objs) {
> > -               DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> > -               return false;
> > -       }
> > +               if (objs->size < afbc_size) {
> > +                       DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
> > +                                     objs->size, afbc_size);
> > +                       drm_gem_object_put_unlocked(objs);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> >
> We're missing the drm_gem_object_put_unlocked() after the if block.
>
Please ignore this comment - it's there, I'm simply blind :-\

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
