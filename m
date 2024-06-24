Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDEC91549E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9E810E4EE;
	Mon, 24 Jun 2024 16:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OyTTs5O8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03DB10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:45:52 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-443586c2091so841cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719247551; x=1719852351;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7+3fE/z2eqo4JMbpyr9vRiW9tYZPuPhGSl35o712FI=;
 b=OyTTs5O83Si+0W3k8TthvySMh7nfyod34EYlIXfqnYfJYSYwzLDSifYyfvp3R1Hmmc
 4e9TAkfe0H0iXiy/lsHkyL/1SG95dmfMX/Mwtih0+VptinSGw/FPar2slC7u4TWoDwFp
 yHqqgQ6XDHsGppRCOPGkARV4RUXD8LzV8fLfB8kVjACmK+UiQpHIao5P5Qa+MQQQj0VC
 MtNFIVqoy738WW/a0gPGGYMQKBU+QrimZHTHSXbJ3qbNaS8709TGLIrOkGoPVHMV87OR
 sRkDKElI0Yg7V13b8ZDlHy9utJwOg8zbx352JIZ3V39A1Kg8mwm2zAbeCRJa3YVHvTX3
 hwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247551; x=1719852351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7+3fE/z2eqo4JMbpyr9vRiW9tYZPuPhGSl35o712FI=;
 b=v2DlzBE0fGq0TN+f/BHiWKx6IhA1ogXDgGHsvi15TZ69iYspNVP25Pbab+e4PZ/CeY
 eK3zthlwtwCoJikk4SjdSoNoTUPtS7Vcy74kVPeNn0jQLrTl18hWYwGLfpzEkW8SxsrK
 KNo3nR+1ezCzRCOXFNEdMml+KeuvvxleArkWh41HqmnyptOcU9SVzqevFFaQAqypuYDV
 fu/5WgG//heuh3vwX44Mwm3SiGSm9PgeTVBaKmtNPO66w7QDaxROdO0mZbYv6Ht67/gg
 1ftdcRbOrn3JQsjeEm1Uu00wRoflI1SPSnfGo7SzKI5v5+9MwrxNsPFHwKOOEHj1dkGV
 YnCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbd4QQrG/55jzBBHJbLOu25cwVJTIBBOltSuyGW7UxxFGElOMRVXI3SDfqDKCr7ifoRaT7c3GVKaF/mSpvioyRrYNH8D8Xe1kugBvgnP4X
X-Gm-Message-State: AOJu0YwKVwlhuoL/iO9wRk8h3ZPSRpzfQf8A14dpFREYD5X2jO4T/XX1
 t2DMFNel45pZR3//kEKJLfeceXV+4nhXa80U/SuZLA9TwcURs81SG9W7agO07MPqI8NWpRGMLv6
 XHpfs1Hr4A6MxaoKV5Fv1y8fKqAlcodobaSSw
X-Google-Smtp-Source: AGHT+IFaxMpEm2LuOUeg0YWpZpls4eMoSSiEoi4Mw3USzXJofjJV3Rc5g2Eg/oubpc2kMeXq42i1kSjw/vsIL8qpsQs=
X-Received: by 2002:ac8:5748:0:b0:444:cdc4:fef5 with SMTP id
 d75a77b69052e-444ce38fbebmr6032061cf.27.1719247551241; Mon, 24 Jun 2024
 09:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-5-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240624141926.5250-5-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 24 Jun 2024 09:45:39 -0700
Message-ID: <CAD=FV=Wcn7GGhdOCS3BOZj2AX1N3SCG5psco-4X75yO83DkpRg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drm/panel: jd9365da: Support for kd101ne3-40ti
 MIPI-DSI panel
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, jagan@edgeble.ai, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 24, 2024 at 7:21=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> The K&d kd101ne3-40ti is a 10.1" WXGA TFT-LCD panel, use
> jd9365da controller,which fits in nicely with the existing
> panel-jadard-jd9365da-h3 driver.Hence,we add a new compatible
> with panel specific config.
>
> Although they have the same control IC, the two panels are different,
> and the timing will be slightly different, so we added some variables
> in struct jadard_panel_desc to control the timing.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V5 and V4:
> -  1. Add a "_ms" suffix to the variables.
> -  2. Use more "_multi" in the enable/disable function
> -  3. Use mipi_dsi_dcs_write_seq_multi() in the init() function.
>
> V4:https://lore.kernel.org/all/20240620080509.18504-4-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> Changes between V4 and V3:
> -  1. Use mipi_dsi_msleep.
> -  2. Adjust the ".clock" assignment format.
> -  3. Adjust "compatible" positions to keep the list sorted.
>
> V3:https://lore.kernel.org/all/20240614145510.22965-4-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> Changes between V3 and V2:
> -  1. Give up creating a new driver and re-add K&d kd101ne3-40ti
> -     configuration to the panel-jadard-jd9365da-h3.c driver.
>
> V2:https://lore.kernel.org/all/20240601084528.22502-3-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> Changes between V2 and V1:
> -  1. Use the new mipi_dsi_dcs_write_seq_multi() function.
> -  2. Modify Move mipi_dsi_dcs_set_display_off() and mipi_dsi_dcs_enter_s=
leep_mode() to disable(),
> -  and drop kingdisplay_panel_enter_sleep_mode().
> -  3. If prepare fails, disable GPIO before regulators.
> -  4. This function drm_connector_set_panel_orientation() is no longer us=
ed. Delete it.
> -  5. Drop ".shutdown =3D kingdisplay_panel_shutdown".
>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 277 ++++++++++++++++++
>  1 file changed, 277 insertions(+)

It still seems weird to me that the other variants of the same panel
don't need similar delays, but the code looks fine to me now:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
