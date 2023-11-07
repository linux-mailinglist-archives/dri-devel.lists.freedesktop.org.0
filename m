Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AECD7E4B2C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CCD10E031;
	Tue,  7 Nov 2023 21:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDDC10E031
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:52:35 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6d2de704f53so3951271a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699393954; x=1699998754;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hr6OJPuRPVCp0RXxF4a/PiIEDPuvoDXkbrySHNg/Fqs=;
 b=kXkXQ6Vy3LlNQpImlBpNK/cDK9OsviFcOqXqss72x78nNCoJ/+yyY0rHxDTlpNbqVo
 8jUrRt6wlKaWbLkInYBLGM6aVXYWqrldUtHx8cvQQfX46HyWGMs9Epvj049FxpWWtNjC
 fqqCA0T8/Zhb3D01qNf/VkseA4UG5ojBY6RIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699393954; x=1699998754;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hr6OJPuRPVCp0RXxF4a/PiIEDPuvoDXkbrySHNg/Fqs=;
 b=ud8iLKdeC6gkp7valIOtde096N+xNROtahS/6NOpiQscLWxolEElO+bNJZhlqI6b0W
 2W5GgSsOEecrTrRTBqlQE414O4ICv51ILTQRVmY1LtVeNA6kKiuxCIMeuhNyy8F3LdoX
 tMx5c8V1SZ7aQGr7MOMvlkP446ZefAbaxRXNVqs5bsJcyJTjWK16ytG+3C0Gj6zozRD1
 FVLnh3q81QhhNd2EJOsFceVTdEPte1iHjHp9wwnQhFa6YpFVImsZJwq0Lemkp7MJLXhL
 cByTqOkMqM+eXvqpfl50TZFCZAKGw/TFg0Q+nhEwbXOqh5aTZDbNB10NdnCI3GWJ1x3l
 bd0g==
X-Gm-Message-State: AOJu0YxeNdl97LfPE/nSK0pZLwGmz0noxCsA2Wg1FJAO99I+LidIE8Sr
 Mm7HUnfevvO2jumLUH5O2y/KsGXYkRDwPwI4dvEGRw==
X-Google-Smtp-Source: AGHT+IHWdfR3bifkBdaoItNqZgulqc9J+gktiX1J+gjiJGeRkyvmNQ2VXl6l87uKMgSgtxr3xR3fX2EtFYyzpaToq3g=
X-Received: by 2002:a9d:7e91:0:b0:6d2:e1fd:9f5e with SMTP id
 m17-20020a9d7e91000000b006d2e1fd9f5emr127321otp.6.1699393954786; Tue, 07 Nov
 2023 13:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-4-hsinyi@chromium.org>
 <2023110739-parmesan-exposure-8225@gregkh>
In-Reply-To: <2023110739-parmesan-exposure-8225@gregkh>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Nov 2023 13:52:08 -0800
Message-ID: <CAJMQK-g-hSN_dY5EjhuvAU4sAL0dMR7s=3murQm8E_GubS1+pw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] drm/panel-edp: drm/panel-edp: Add several generic
 edp panels
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 7, 2023 at 12:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Nov 07, 2023 at 12:41:53PM -0800, Hsin-Yi Wang wrote:
> > Add a few generic edp panels used by mt8186 chromebooks.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > no change.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 51 +++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.
>
Sorry for confusion, only patch 1 & 2 need to be picked to stable. 3~5 don'=
t.

> </formletter>
