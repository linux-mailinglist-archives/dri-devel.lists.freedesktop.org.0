Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B27EFB2E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE17010E799;
	Fri, 17 Nov 2023 22:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D76010E799
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 22:09:01 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6ce2ee17cb5so1294782a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 14:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700258940; x=1700863740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUVc511gN5OSpetib0BtsSnCKuFu68FlIwOoywnOLzA=;
 b=e6Lmn0xb2XrqUykjxu4pQHZJxLjm2lNLFPvwL6OzIxSmgiBZK9+ngx3Gsu/EwfUfD4
 UAir7WyimrOlMa7O/oPX1Q++s3ZCwn6aG4ROM9z97wEDUQU8xYzvngnT17/tXb1kfRZO
 C/2CCrR8NEnMevOhZKKx1fxYq16FfuBNVo9fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700258940; x=1700863740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUVc511gN5OSpetib0BtsSnCKuFu68FlIwOoywnOLzA=;
 b=Al96EfkGJxHGafPQ7igHiQRurPHPtDrl9FZT1KkY6sOrxCCMUisxFvkGX9vSVY2Pz0
 Xu03W51e6IFefg8kys+TCCnDvTM7Twi29FccCT0dMxP5ZCb/B4H/WX4TOW/QHjy/E8hE
 SqWyQYfLIo5q5/0yYmbgBnQoZBwtN5xEiLsbTbgxrMzer1VYb410amETWOjNJyO4IV+j
 pDtFQcgINJFBaaROqQZH2QJAXiwOmL5Vp/ZNW7oTEQOsZh9axlTEbkXtz23LmT7D727i
 Tp8wVM30VeS+Em7R1az3FXAu9ccJ5HrHVBvCiFwa6TINW7r3j5vHDv31X/eZDCt97bSa
 MkYA==
X-Gm-Message-State: AOJu0Ywh8bupHwJXs8bw9cAaCsGIIavhGgKj9yVmVsLhHA+/HIFwhqhV
 xvPzq/X16Koe1CSYmHhzKGcZ22xYUG/4/pGKQcGBhg==
X-Google-Smtp-Source: AGHT+IFiWNTHuBd6H11UhItgAGgFvK9eyWsVkIf8k2d/LqKmWmGRl0fk8DZLVaJKw+Pga2D49h6Wg/xhaA6qM5ggtJY=
X-Received: by 2002:a9d:66d0:0:b0:6ce:29cd:b699 with SMTP id
 t16-20020a9d66d0000000b006ce29cdb699mr584807otm.10.1700258940488; Fri, 17 Nov
 2023 14:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20231117215056.1883314-1-hsinyi@chromium.org>
 <20231117215056.1883314-2-hsinyi@chromium.org>
 <2023111738-bondless-sketch-f201@gregkh>
In-Reply-To: <2023111738-bondless-sketch-f201@gregkh>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 17 Nov 2023 14:08:34 -0800
Message-ID: <CAJMQK-i1CySjb1K7SHR40wnmc+TN5k0MhDef6OhYimPchzGn2g@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 2:06=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Nov 17, 2023 at 01:46:32PM -0800, Hsin-Yi Wang wrote:
> > Generic edp gets mode from edid. However, some panels report incorrect
> > mode in this way, resulting in glitches on panel. Introduce a new quirk
> > additional_mode to the generic edid to pick a correct hardcoded mode.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > v6->v7: split usecase to another patch.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 48 +++++++++++++++++++++++++++++--
> >  1 file changed, 45 insertions(+), 3 deletions(-)
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.
>
Forgot to -cc: stable, these patches don't need to be picked to stable.

> </formletter>
