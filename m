Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE48AF8DC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 23:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BDC1136EC;
	Tue, 23 Apr 2024 21:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HlWB5SYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040381136EC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 21:20:36 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-516d2b9cd69so7586555e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713907235; x=1714512035; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0tn7jHTPlJZyt8GzA2t3AGAiFH5LqDxhof40LZ2i7NE=;
 b=HlWB5SYJcQ1SiWBXnxWaO1KmU/4hvMpEHtE1F8oQMHlo/MvVPQQ9xXHlkaqcFid8/w
 KAKqQuXJBHeIeNyDaW1+3eORQVCGhAe9W3wKB5A03hJdMC9zzhg0Bwup0p/S9YYsPUt5
 a1wkDmrkwXRfgVzk2a4OAyR7xdGlVcOeLV3TqhyVolHhThlBYbd+9XO6jgRsv/iZHwXw
 AcXk5GpYCNUNfuW54ogIiOBUC65+8v4gBcFJjC2fqb1+LB8FdI2LFlOi0g23gkais7D3
 gJin65Jr1edUlJY/CtAlILiA2yIk9HdctBf3BVY8hDLA1rd8EZTcY+ltJ99RaLb1iRj9
 jbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713907235; x=1714512035;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tn7jHTPlJZyt8GzA2t3AGAiFH5LqDxhof40LZ2i7NE=;
 b=OBlDmkXTZx25vcFOCNCeglmoW2/pjCjsSe6tN9mwDjpBZafuxA88kpinlY9r5mLXBu
 nMbPGvZpPiiXmsX/wHzLHG/Uy4aOcBf1iLRrnfg35FnQ4bxicU6gVpGopj9wmvp2Juj1
 NvA56pIlmaophHAQPQOvxJ9ChcHDYnd9cpkigy5hBcrKSBbLPqn23oo2zvdP4DjwIvv3
 zLte7nskgHw+XHui5IXUx6W86VgGy99OJWQg+AKirrGSzZluYI6w4htcozrpJnZYnC5v
 SFT+Uw80YoaPdUCy/gBwoyx5pR8YXI77d+I8mjq7MoIVwo+RJeT1gZaGU7+JKhlsvEt8
 mqMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXryA/ZFQYcSa9SRkI7mdXGe96ClRHaOAlj7Fm9fFahbBDP8cNMAG/YxOm8R4TnAkdz8tLRdwqa3cYqxyM8gatR5SPK3nI3QPwkyu892qd
X-Gm-Message-State: AOJu0YzO/xNRj6Z+gOqSHmcW6r0opHAZonVihu/vvKHhTf6TkkZ1AGTM
 P2UZ9mPp0cfLNJ7cp7L0eo0ARzgfTucRGzoZgM+09BdfYsJ+TSSsoH41hWcMvhg=
X-Google-Smtp-Source: AGHT+IG2fa2zlxzT18mxIztyQmdwN1GLVVd8irrAfD2zS09j2Iua0mDVu6i7JhrunIrd2O8qTOHNcA==
X-Received: by 2002:a05:6512:3253:b0:516:dd4f:d9ea with SMTP id
 c19-20020a056512325300b00516dd4fd9eamr406933lfr.5.1713907234929; 
 Tue, 23 Apr 2024 14:20:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056512090200b0051b0f4e1b0dsm926657lft.276.2024.04.23.14.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 14:20:34 -0700 (PDT)
Date: Wed, 24 Apr 2024 00:20:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@google.com>
Cc: Hsin-Yi Wang <hsinyi@google.com>, 
 lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] drm/panel: kd101ne3: add new panel driver
Message-ID: <an2k3vgynq4as2sd5dy6ccmdiqedmo7qjsab5qyfhesd333i2a@235sqph3bze5>
References: <20240418081548.12160-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418081548.12160-3-lvzhaoxiong@huaqin.corp-partner.google.com>
 <zanx5y3obqmewnbooovf52hx6vh7tpi4zsbse2dyzcqzddmzhw@kewxoa6n3mja>
 <CACb=7PURWtS8bwT5EcAFHhu7deHd2Y8cNOattfdwyEYpOUcbnQ@mail.gmail.com>
 <vbt2nxddw2dc7hkreq4iybv5zv5xyp32oajybeqsphgfrhzmn7@tskvckljmxpe>
 <CACb=7PVTvV9nsFu1ZAXu7YTjSOAGZka+c__EJq3J3qgSJGEShw@mail.gmail.com>
 <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VYAzqsGEBJai9b9n+HxHiG59L1vF73AEWcTwLS_ryjWw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 23, 2024 at 01:41:59PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 23, 2024 at 11:10 AM Hsin-Yi Wang <hsinyi@google.com> wrote:
> >
> > > > > > +#define _INIT_DCS_CMD(...) { \
> > > > > > +     .type = INIT_DCS_CMD, \
> > > > > > +     .len = sizeof((char[]){__VA_ARGS__}), \
> > > > > > +     .data = (char[]){__VA_ARGS__} }
> > > > > > +
> > > > > > +#define _INIT_DELAY_CMD(...) { \
> > > > > > +     .type = DELAY_CMD,\
> > > > > > +     .len = sizeof((char[]){__VA_ARGS__}), \
> > > > > > +     .data = (char[]){__VA_ARGS__} }
> > > > >
> > > > > This is the third panel driver using the same appoach. Can you use
> > > > > mipi_dsi_generic_write_seq() instead of the huge table? Or if you prefer
> > > > > the table, we should extract this framework to a common helper.
> > > > > (my preference is shifted towards mipi_dsi_generic_write_seq()).
> > > > >
> > > > The drawback of mipi_dsi_generic_write_seq() is that it can cause the
> > > > kernel size grows a lot since every sequence will be expanded.
> > > >
> > > > Similar discussion in here:
> > > > https://lore.kernel.org/dri-devel/CAD=FV=Wju3WS45=EpXMUg7FjYDh3-=mvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
> > > >
> > > > This patch would increase the module size from 157K to 572K.
> > > > scripts/bloat-o-meter shows chg +235.95%.
> > > >
> > > > So maybe the common helper is better regarding the kernel module size?
> > >
> > > Yes, let's get a framework done in a useful way.
> > > I'd say, drop the _INIT_DELAY_CMD. msleep() and usleep_range() should be
> > > used instead (and it's up to the developer to select correct delay
> > > function).
> > >
> > > >
> > > > > > +
> > > > > > +static const struct panel_init_cmd kingdisplay_kd101ne3_init_cmd[] = {
> > > > > > +     _INIT_DELAY_CMD(50),
> > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > >
> > > [skipped the body of the table]
> > >
> > > > > > +     _INIT_DCS_CMD(0x0E, 0x48),
> > > > > > +
> > > > > > +     _INIT_DCS_CMD(0xE0, 0x00),
> > >
> > > > > > +     _INIT_DCS_CMD(0X11),
> > >
> > > Also, at least this is mipi_dsi_dcs_exit_sleep_mode().
> > >
> > > > > > +     /* T6: 120ms */
> > > > > > +     _INIT_DELAY_CMD(120),
> > > > > > +     _INIT_DCS_CMD(0X29),
> > >
> > > And this is mipi_dsi_dcs_set_display_on().
> > >
> > > Having a single table enourages people to put known commands into the
> > > table, the practice that must be frowned upon and forbidden.
> > >
> > > We have functions for some of the standard DCS commands. So, maybe
> > > instead of adding a single-table based approach we can improve
> > > mipi_dsi_generic_write_seq() to reduce the bloat. E.g. by moving the
> > > error handling to a common part of enable() / prepare() function.
> > >
> >
> > For this panel, I think it can also refer to how
> > panel-kingdisplay-kd097d04.c does. Create the table for init cmd data,
> > not what operation to use, and use mipi_dsi_generic_write_seq() when
> > looping through the table.
> 
> Even more similar discussion:
> 
> https://lore.kernel.org/r/CAD=FV=UGDbNvAMjzWSOvxybGikQcvW9JsRtbxHVg8_97YPEQCA@mail.gmail.com

It seems I skipped that thread.

I'd still suggest a code-based solution compared to table-based one, for
the reasons I've outlined before. Having a tables puts a pressure on the
developer to put commands there for which we already have a
command-specific function.

-- 
With best wishes
Dmitry
