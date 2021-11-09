Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C344B22E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 18:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF066E83A;
	Tue,  9 Nov 2021 17:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE666E83A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 17:50:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g14so79176033edz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 09:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1U1Z/alLH5teG6ZXXhom8C58uVkGFLqZbSPlueeqFNQ=;
 b=BxyrVDFiV0MtKKeLgw4gmZOfWmi0d1VwMPG8z+dW+NtPVm1ef4X931b0eg1HS7AT0U
 foqK7kQw/dgyDc+BdiBlQdghGFYwAqfmgz15l+UVkHo8rPWzRy4r0HiKJj7lm9itqITm
 OxRME1eHQbEtgKLveNwSUDWHgOPtrbKMB097qE2/B8tER/UHeybbldpRUZ/cjG//upNc
 I+AZENxA4fNEc/03t2hddeVGQs9QtJeXDbkLvoudnQMptsHHT73ICYIMghkJri4wyLw2
 stoAmAQQwmYZjFZeet4uSWs0JONtA1PZ2L7sZFb17QkV1KPOqjAUnRAxxOKIRTs+3M4s
 JkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1U1Z/alLH5teG6ZXXhom8C58uVkGFLqZbSPlueeqFNQ=;
 b=RriuULBs7PI0nj9fVcfrISBgYtoPHrFI1ZTwdcZLXS4e3kaAT3Zk5+5ZUlDhUVuStE
 YQ9bmqGOKDOLxVCG9KGoLsMHc2f779NObq+KSyhYsVktENXlxmPSvUQlRoDCdYMSIbO9
 SCntJlZkOnL6Kvfl+tum1cjDkgorprS6V8/piAbB3g0DNh74yAT2JiwGYJke3uak3aMd
 MfhuHVgsuUzGdKBsgqoH/EAlzB3uBb6Kdv8TIKb22g8NQEcRRc7ba7IrJ4r5VLmGRuLg
 fSVsS7ARCs9Ord3oRFwprAeuzd/0HoH+MmqlWD0MO9y7iy1/YDHFXg/vqBRQWReXJjQ8
 ypcA==
X-Gm-Message-State: AOAM533AHzGAEgcPBNVh3Ae08BMxM1LAA51cTUOIeWtm2mgkhAsXhLGS
 QpfrhCQyo31pyHP3GqmHLL+734IphQCbd2CRAIc=
X-Google-Smtp-Source: ABdhPJyh2kBR5a/ENLTpt6fEqmKQo/M1tGkapnghyjkSVUESJOMk9rakpTO/usO+fCJaNzPd/yN2tneiJdMz4BW/eko=
X-Received: by 2002:a17:906:79c3:: with SMTP id
 m3mr11868633ejo.332.1636480226006; 
 Tue, 09 Nov 2021 09:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAMty3ZBEt5_zcBu0=f5WzbV8DUwsB+fz0vdA3GdOXF84zm16Jw@mail.gmail.com>
In-Reply-To: <CAMty3ZBEt5_zcBu0=f5WzbV8DUwsB+fz0vdA3GdOXF84zm16Jw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Nov 2021 11:50:15 -0600
Message-ID: <CAHCN7xLNQ4YpvkfOsbZO2Kv8=w8P9X_FRP88iYnSjc_nLnfdZQ@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tomm.merciai@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 9, 2021 at 11:38 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Tue, Nov 9, 2021 at 11:04 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Add nodes for MIPI DSI and LCDIF on IMX8MM
> >
> > I'm currently working with a set of patches to convert drm/exynos
> > to a bridge [1] and add IMX8MM support [2] in order to get IMX8MM DSI
> > working for display with a Raspberry Pi DSI touchscreen compatible with
> > a Toshiba TC358762 DSI bridge and Powertip PH800480T013-IDF02
> > touchscreen.
> >
> > I had this working on a 5.10 kernel with the old blk-ctl and
> > power-domain drivers that didn't make it into mainline but my 5.15
> > series with blk-ctl backported from next hangs right after
> > "[drm] Initialized mxsfb-drm 1.0.0 20160824 for 32e00000.lcdif on minor 0"
> > so I assume I have a power-domain not getting enabled.
> >
> > Please let me know if you see an issue with the way I've configured
> > power-domain or clocks here.
>
> I'm reworking back on top of drm-misc-next, may be I will let you know
> in couple of days.

I'll try to look at it tonight or next week.  I'll be traveling
tomorrow through Sunday, but I'd like to see the DSI video working
too, so I'll help where I can.

adam
>
> Jagan.
