Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB276E6621
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FD210E7B2;
	Tue, 18 Apr 2023 13:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2D310E7B2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:42:16 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id t16so16203943ybi.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1681825335; x=1684417335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpcPHVp4pqmZ80H1ahhEMqFKMXQ5SGv3chjqSfEJN0o=;
 b=RYy9M+bt1OBQ8fNBF/2Qm+GJZDOy7iCd5m0mqsQOzDn32ko/c+WHOh5EB0Jo9uR8f9
 ibjBVAPC0MpKZu1ZtNGYGtMLYv7WOwlMRrYz6Y6W5tabUPR8hRzehp9++O/XhCpdv7yA
 Y9cSSojHbyJc4JEqDFytWR1GQYDuFnPyPskN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681825335; x=1684417335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpcPHVp4pqmZ80H1ahhEMqFKMXQ5SGv3chjqSfEJN0o=;
 b=R0OfMU6+vNX2rptRcCoatQsKTdRYeu76/LODewtN0BTsp5xzXaL6pkQmIcRtTlCyB5
 uXxtoj0VA9ZsysKlfsNHVNX/ddxIVw9fr/Cb0rDba8peY3zxqBS1+vmZbl93YZjmUuky
 kics8XnPidCJ3umMqvWk2U4EWGCM7TI8CWPtET97Fr273/AXIuGQeGqeWbVTIEuse6Vo
 VBHKW3082XohYJ8BXqSJ6l/IftHXBrV05kt3fM3/7iqyxhe+GaCQ+xVe+RCt6+FWUB5M
 kOCC3XUyFJifIjtesI8wkFS4w9j72YQZTs23n3Lq2+m0MXWpsWSwzN11cjyRwCizvdCK
 ys2g==
X-Gm-Message-State: AAQBX9e2sqGBELmmpWef7Rd/WU1SS32rsSfbkrvagqLFbhUPHAYr/epZ
 sIWG44JuatTvDn6KbW9B/pY5lgfeUJcPvEStm+aqrw==
X-Google-Smtp-Source: AKy350bByuEh0nHL5lMIisZjIfjJSMbJiNtCZAXOZUerYXy5rpryfqItNfpXsDZF2iQpFckfbCDjEiz90LyzyJcPbWE=
X-Received: by 2002:a25:d843:0:b0:b8e:efd8:f2c with SMTP id
 p64-20020a25d843000000b00b8eefd80f2cmr11722529ybg.1.1681825335077; Tue, 18
 Apr 2023 06:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
In-Reply-To: <20230418122205.16632-1-fusibrandon13@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Apr 2023 19:12:03 +0530
Message-ID: <CAMty3ZDNv3u+Ye_V6m+zLNnNQM5_2=CfFOuOzmO9bHti8VCuJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: bridge: icn6211: Only warn on invalid chip IDs
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
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
Cc: marex@denx.de, tzimmermann@suse.de, sam@ravnborg.org,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 5:52=E2=80=AFPM Brandon Cheo Fusi
<fusibrandon13@gmail.com> wrote:
>
> Avoid aborting chip configuration after reading invalid IDs and
> instead issue a warning. I have a bunch of these chips and they all
> report "Vendor=3D0x00 Device=3D0x00:0x00 Version=3D0x00" but are successf=
ully
> configured and go on to work just fine.
>
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 0e37840cd..39de9a7c7 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -361,8 +361,7 @@ static void chipone_atomic_enable(struct drm_bridge *=
bridge,
>                 id[0], id[1], id[2], id[3]);
>
>         if (id[0] !=3D 0xc1 || id[1] !=3D 0x62 || id[2] !=3D 0x11) {
> -               dev_dbg(icn->dev, "Invalid Chip IDs, aborting configurati=
on\n");
> -               return;
> +               dev_warn(icn->dev, "Invalid Chip IDs, configuration may f=
ail\n");

Did you test I2C-Configured ICN6211 or non-I2C-Configured? if it's
later then better to fix a valid ID for it or if it doesn't support ID
then a handle via quirk would be a proper solution.

Jagan.
