Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CE73CF8C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 10:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C8410E125;
	Sun, 25 Jun 2023 08:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06510E125
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 08:56:09 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4009cc311d2so3176091cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687683368; x=1690275368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1aLOG1SDXkQ1qzZvF4569LDgLL4VVaMYgtjO2JV4SiE=;
 b=SnQrrXE99q2IpCn8rZ5uG+ZNkvJ6ev3mejUZn8UADvZbUvyWR6/jhLK1JiD4Cxzg+3
 O2ECz4vYbHizrHvEA5IVXEEDcARlk4StcihzKcOEDc+if3/nqW7Fyh48LrpRxWkNyH8G
 NbaPFD613TTmtugBXKl+m5c/ciO99n+ajtSAUUP+jU7XyNzVh92dQuOPIY9mU3IKWUbU
 Mx907Zoa3O2hVwriYvOvJTO99VOj9B8AYz084g7xStX7RxBOmNGZf+H38cV6+CXlvPHx
 pmOv0WsIYdQe/9ks8HCTJOddqjWfenEFseKi42C4GMfysezON1eZJM3IpfhXRVXNmKVE
 4WjA==
X-Gm-Message-State: AC+VfDyvmLLYqdqUvUJ1lW/OjLzIHp3jNt0qhR8PZqRuxgMoTtHnDohT
 vzdCuwjVU640Y4whRRocBT2cAO5VcZq2tA==
X-Google-Smtp-Source: ACHHUZ7Th0o48dC+kbkyUJ4UGCFxscoSCUu2eSKBx00LPbjsJ469Y2Yyo/6uveJj2sDNZKPmk52b3Q==
X-Received: by 2002:a05:622a:191:b0:3f6:913e:5530 with SMTP id
 s17-20020a05622a019100b003f6913e5530mr29499349qtw.61.1687683368495; 
 Sun, 25 Jun 2023 01:56:08 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 i10-20020ac85c0a000000b003e4dab0776esm1685554qti.40.2023.06.25.01.56.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 01:56:08 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3fde9739e20so20975961cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 01:56:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1208:b0:400:8f95:8910 with SMTP id
 y8-20020a05622a120800b004008f958910mr6833378qtx.46.1687683367622; Sun, 25 Jun
 2023 01:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <7b6ffa43307522833103fe29ec6a084b7d621a16.1687423204.git.geert+renesas@glider.be>
 <97bc4380-1a2a-aec7-168e-04536fc74e37@loongson.cn>
In-Reply-To: <97bc4380-1a2a-aec7-168e-04536fc74e37@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 10:55:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8=16pRQr=2CouUWBUhD16Mkh3_WaNZmRTd7Wjwq_pnw@mail.gmail.com>
Message-ID: <CAMuHMdX8=16pRQr=2CouUWBUhD16Mkh3_WaNZmRTd7Wjwq_pnw@mail.gmail.com>
Subject: Re: [28/39] drm: renesas: shmobile: Use drm_crtc_handle_vblank()
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Sat, Jun 24, 2023 at 11:33=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson=
.cn> wrote:
> I'm fine with this patch but I I don't see the benefit.
>
> This reply is more about my personal question.
>
> On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> > Replace the call to the legacy drm_handle_vblank() function with a call
> > to the new drm_crtc_handle_vblank() helper.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >   drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers=
/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > index c98e2bdd888c3274..6eaf2c5a104f451a 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > @@ -86,7 +86,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
> >       spin_unlock_irqrestore(&sdev->irq_lock, flags);
> >
> >       if (status & LDINTR_VES) {
> > -             drm_handle_vblank(dev, 0);
> > +             drm_crtc_handle_vblank(&sdev->crtc.base);
>
>
> After switching to drm_crtc_handle_vblank(),
>
> your driver need another deference to the pointer of 'struct drm_crtc'
> to get the pointer of 'struct drm_device';
>
> Plus another call to get the index(display pipe) of the CRTC by calling
> drm_crtc_index(crtc).

That is correct.

> Consider that shmob-drm support only one display pipe,
>
> is it that the switching is less straight forward than the original
> implement ?
>
>
> ```
>
> /**
>   * drm_crtc_handle_vblank - handle a vblank event
>   * @crtc: where this event occurred
>   *
>   * Drivers should call this routine in their vblank interrupt handlers t=
o
>   * update the vblank counter and send any signals that may be pending.
>   *
>   * This is the native KMS version of drm_handle_vblank().
>   *
>   * Note that for a given vblank counter value drm_crtc_handle_vblank()
>   * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
>   * provide a barrier: Any writes done before calling
>   * drm_crtc_handle_vblank() will be visible to callers of the later
>   * functions, if the vblank count is the same or a later one.
>   *
>   * See also &drm_vblank_crtc.count.
>   *
>   * Returns:
>   * True if the event was successfully handled, false on failure.
>   */
> bool drm_crtc_handle_vblank(struct drm_crtc *crtc)
> {
>      return drm_handle_vblank(crtc->dev, drm_crtc_index(crtc));
> }
>
> ```
>
> Is it that drm_crtc_handle_vblank() function is preferred over
> drm_handle_vblank() in the future?
>
> I'm fine with this question answered.

I think the native KMS version is preferred over the legacy version, cfr.

    /**
     * drm_handle_vblank - handle a vblank event
    [...]
     * This is the legacy version of drm_crtc_handle_vblank().
     */
    bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
