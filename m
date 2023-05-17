Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073EE706E36
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63DC10E443;
	Wed, 17 May 2023 16:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A275410E443
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:33:00 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-ba87337c0c3so493097276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684341179; x=1686933179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=seiQZ9YiOuM9ev2SDnncT8dHc6tNpiemL2yol+RQQmc=;
 b=rARhUCmEST2pQfbq/THE9kQrsVUKD5cL8fz4mXj7808tMytYuZe7snXExsaIC0DinJ
 r9gp+0RQBbC+st99eMXxz+oXJPzKNXaMQZohevPlt6IJR1f1ziqr22locJ6EsLGMVw/1
 s+EMTIB0qyD6ZMGffR4ZeD2WQ0swHln2rxkCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684341179; x=1686933179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=seiQZ9YiOuM9ev2SDnncT8dHc6tNpiemL2yol+RQQmc=;
 b=hJ998tqQSm+oYBR669gIZdiCsCzs2lheI83EzD9gKpJWahyewjg9j80CgqbKO/uMOp
 juIPIH3x8AZ3UA29WbsJulxeDh7w1FbxshZ+K/9R0RTD8mGqF9kkGIub85HbXhUxfppJ
 btzXFBnkSfvAVx9nkQN6uDjdVQRBsShzDRDR0MHjTwMCQ4id9Tz0dR6yEB2wkmwN24FV
 MZI6RhtVJNH5Z/6VIrdXHjNfqRMlwgwddsiieNK178XPYck0rCs73yOAtsOZrEm0thXz
 RSjKrVAJBTE3BZcsFANVb8+0dVawURTOGoH/mj3wxktIJ54aOvkUa0JlfWDzbr1ulZAB
 tZtA==
X-Gm-Message-State: AC+VfDx1qwed7I+amMO77Tp6eFUqq+Xbo8avEbp/Z03O2SXluAuQOGWa
 R6wpo7sE8tG5oL7/xIHqP+Vqs+o3b3S8vEko2ehVHA==
X-Google-Smtp-Source: ACHHUZ5G6ubA44duLT/TEAQihOcSC/J+UBoHnxsofv8biC5kLtL6cO4NiUzdIWWkBRLS62id8kmDPVQbLVllmNv99s8=
X-Received: by 2002:a81:1b4c:0:b0:55a:776e:95f3 with SMTP id
 b73-20020a811b4c000000b0055a776e95f3mr1957775ywb.25.1684341179202; Wed, 17
 May 2023 09:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
 <HB0TUR.1IPEEV2C5LMB1@gmail.com>
In-Reply-To: <HB0TUR.1IPEEV2C5LMB1@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 17 May 2023 22:02:47 +0530
Message-ID: <CAMty3ZCSUx-81m4SQcJZvUq3NyhzZbe8ow+LiV7iyUmVLCmNYQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Paulo <pavacic.p@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Please don't post, use inline replies.

On Wed, May 17, 2023 at 6:34=E2=80=AFPM Paulo <pavacic.p@gmail.com> wrote:
>
> On Wed, May 17 2023 at 05:50:22 PM +0530, Jagan Teki
> <jagan@amarulasolutions.com> wrote:
>  > Just to add a few pieces of information for you to understand better
>  > on the context of dsi panels. DSI panels can be part of
> panel-simple.c
>  > or panel-<vendor-part>.c DSI panels whose init and exit sequence is
>  > generic are suitable to add it in panel-simple and have bindings on
>  > panel-simple.yml.
>
> This panel doesn't fit that well into panel-simple.c since it has
> initialization sequence. For that reason it would fit more into
> panel-sortofsimple.c which didn't exist so I have created new driver
> and called it panel-mipi-dsi-bringup.c.
>
>  > Some DSI panels have specific init and exit
>  > sequences in terms of power, reset and DCS then those have separate
>  > drivers to handle and whose driver name must be panel-<vendor-part>.c
>  > or similar and bindings also follow a similar naming convention.
>
> I have made a driver exactly for that purpose. Driver that allows
> adding new panels which have specific init sequences (and of course
> timings and other stuff). fannal,c3004 can be seen as a working example.
>
> Here is code snippet from the driver:
> ```
> static const struct brup_panel_info brup_fannal_c3004_panel_info =3D {
>  .display_mode =3D &brup_fannal_c3004_display_mode,
>  .num_of_dsi_lanes =3D 2, //how many wires are connected to the panel
>  .video_mode =3D BRUP_VIDEO_MODES[BRUP_SYNC_PULSE],
>  .mipi_dsi_format =3D MIPI_DSI_FMT_RGB888,
>  .mipi_dsi_mode_flags =3D
>   MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH |
>   MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET,
>  .bus_flags =3D DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE=
,
>  .panel_enable_function =3D &brup_panel_fannal_c3004_enable_function
> };
> ```
> where enable function is function with init sequence and other values
> are values that might be different for different displays.
>
> All the inputs are appreciated as this is my first time submitting
> patch. If you see anything that is odd to you please reach out to me.
> All in all I believe I now understand how should device tree look and
> the reasons/ideology behind it.

So, the driver has to be panel-fannal-c3004.c and binding to be
fannal,c3004.yaml.

Thanks,
Jagan.
