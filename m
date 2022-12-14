Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475C64C805
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5543210E0C7;
	Wed, 14 Dec 2022 11:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D9310E0C7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:31:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i7so4336361wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KC7bZibpl6bCUEysBptYk/+CoWih2Ghy8jjFwskOL9I=;
 b=YB9wlrm5MG9YgIRaqIqk13UQYfwrEtJsMLk7/xytR/Xyqe9yY0Awdb9FcZwvpDsfX6
 DBw60fT6R/yzmxHo5fWjCV22cbF1uVBauUkESqVaZxLFOZhTqF0RWNrJM4pKM0PJYXbb
 SYcBv8FEund/ZBxA6OCedObyGSCqJDgkJEpvWH/563W8UTMF15Or501jidgLSGwKr5S3
 f7bUwbi4nEveHpE0lMieFIhR/dXl3yRTztxVZINt4DGIRdi8ePa/uunkKwKwFGH0hPoY
 D+H2RVOjFxomxV+HMCJYsbDdL+Sf6Jb2YeaegmNzHLM2EfHxpmo2cwlYXuuHTBMTl1FZ
 tZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KC7bZibpl6bCUEysBptYk/+CoWih2Ghy8jjFwskOL9I=;
 b=mj1cyenzm6uN5clWDkrspK6bqLYYlQtWEuhILuj4YrbVr/+7VrtQ4m5+MShQ72YEKO
 2y9+rK/6hPmKH3CCCVyI99bM1IUbp5vTTi72njfbVj+FL2teyoFfF+suQU4LV2H4PQKi
 0+dKjts1NOKtsOUwUVwkd0hutbhO9CzSEpZWq+ygcTB63VME3v8uPKNjtaPK8IpACAA6
 7qwe7m8Vi/3Q1jCYtXd0We3u9CEd73z/HR1T1pk7mjLRUHx9qzDkHYRk90TJyrs5sf7T
 aPwJS1z2NI19VesOHa4d99gA3p+Iu4qbgEMKK4IWqJr3HUXPYtIGrHr5EqEcbtS3uUpW
 sIVQ==
X-Gm-Message-State: ANoB5plXHq3zzKGcRVtWE9dcJ+ugIoS8srt7uFdldodgrr1f810t+wEY
 yGoEiQpADqTsgmRoce67wFsLTcAjQbLs56c6VmA=
X-Google-Smtp-Source: AA0mqf6GB9Li0YjAlBu+SkFzcrS/dkYltHtITkCFexcrCk7w5PT/K+RlTyVDR0+HvWaAhte9Ait+DvKDhFI4p7MdxHc=
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id
 h13-20020a5d504d000000b00242246c2f89mr24326068wrt.108.1671017483680; Wed, 14
 Dec 2022 03:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20221214110037.149387-1-cbranchereau@gmail.com>
In-Reply-To: <20221214110037.149387-1-cbranchereau@gmail.com>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Wed, 14 Dec 2022 12:31:12 +0100
Message-ID: <CAFsFa85+U0GJ14+O0zkw-7H83Kw6dhL2+K-8TQbe5GkNWL=PYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for the AUO A030JTN01 TFT LCD
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wrong cover title, should be "Add support for the orisetech ota5601" sorry...

On Wed, Dec 14, 2022 at 12:00 PM Christophe Branchereau
<cbranchereau@gmail.com> wrote:
>
> Changes since v1:
>  fixed the dt-bindings maintainer email adress
>
>  dropped backlight, port, power-supply and reset-gpios as they're
>  provided by panel-common.yaml as pointed by Krzysztof Kozlowski
>
>  changed reg: true to reg : maxItems: 1
>
> Christophe Branchereau (2):
>   drm/panel: add the orisetech ota5601a
>   dt-bindings: display/panel: Add the Focaltech gpt3
>
>  .../display/panel/focaltech,gpt3.yaml         |  56 +++
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-orisetech-ota5601a.c  | 351 ++++++++++++++++++
>  4 files changed, 417 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
>
> --
> 2.35.1
>
