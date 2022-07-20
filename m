Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0057C04E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D16911B491;
	Wed, 20 Jul 2022 22:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDA311B491
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 22:51:31 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id tk8so111535ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xtJOydR/EOQiDwYXa/x4r5uSnbSPUKnC9SXoK7SwIus=;
 b=JXYOeZ0kA3+i7MNhIuCn5Wb24GcLkYwIYt7IIms7VAQzB0elQZha+S5+kbGHJJGhGq
 pQ91RGDS9Qe0RAtZFi8FLvlu14jX1pL0pjvSRF7cCCCReIiDsc5G3F/+P6KoGQL8r03q
 rX3v/3M9d0B9Hz7yU9b99kd1CV2V+tf4lK37I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xtJOydR/EOQiDwYXa/x4r5uSnbSPUKnC9SXoK7SwIus=;
 b=pbMYtC+8gFbuERcK7RPNSg4npiN4JQOCR3+iWKXCVqSkdcz+eQ87mri3utCtFk9ml0
 4ySXIEbJqO10bgwu0FTIPdd8wgnoQDRVWpDZFjLM77BqDdr0RZiO+0m1UPOgQLQ334z+
 6Qk7gduxtSha8pWKG9ugfUJ/BBQQP24LYoVqvR7LW+Q7gz6CEXH9Tn5S4I6o0FvS5tPZ
 JUU4E32noXlcbwIT5Yk0qm4nlCyh6pqd0UAVORRbActZpPGpyi7UEaWEPdwHSvB0+aJl
 oeQ0ui5vqOgdm1ZMVEM6jPG+I+E+O9jX2yX1kv7+AgVbB2DyfC44FSwTu9zM+wR3VPRX
 xFJQ==
X-Gm-Message-State: AJIora+vhhZPqR0jXbcRCFgvFRKTNs4YzVOdW+0DFQtLjgk+5fiAlFJ9
 1fibqFB6w6dv5ZDEGbTl6ou92x0Fsf+REwXJ
X-Google-Smtp-Source: AGRyM1tbKE/jIBkjqyQLokDP3LrWGGkZY1fRqEm+51wkcxDbPy5JU649Rfg/IdpTEF+y6fmDhdjHLQ==
X-Received: by 2002:a17:907:761b:b0:72b:379e:39ea with SMTP id
 jx27-20020a170907761b00b0072b379e39eamr38158824ejc.591.1658357489929; 
 Wed, 20 Jul 2022 15:51:29 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906301000b0072efb6c9697sm137333ejz.101.2022.07.20.15.51.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 15:51:28 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id a11so75201wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:51:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr995134wmq.85.1658357487010; Wed, 20 Jul
 2022 15:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220720191158.1590833-1-nfraprado@collabora.com>
In-Reply-To: <20220720191158.1590833-1-nfraprado@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Jul 2022 15:51:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbXus=BBaEEP390ivdB3VsMVV_Kpz8hrADrt8qkvzMGA@mail.gmail.com>
Message-ID: <CAD=FV=UbXus=BBaEEP390ivdB3VsMVV_Kpz8hrADrt8qkvzMGA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add panel entry for B120XAN01.0
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 20, 2022 at 12:12 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add panel identification entry for the AUO B120XAN01.0 (product ID:
> 0x1062) panel.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
> v1: https://lore.kernel.org/all/20220719203857.1488831-3-nfraprado@collab=
ora.com
>
> Changes in v2:
> - Move entry to the top so it respects the sorting
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


Nothing controversial here, so I went ahead and pushed to drm-misc-next:

b68735e8ef58 drm/panel-edp: Add panel entry for B120XAN01.0

-Doug
