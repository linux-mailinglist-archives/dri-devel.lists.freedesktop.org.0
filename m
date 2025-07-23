Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B31B0F7BB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 18:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F46D10E810;
	Wed, 23 Jul 2025 16:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m3yhEFpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7218910E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 16:03:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-af0dc229478so500596766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753286629; x=1753891429;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q7xv7dB05a0bq7wMlNS1QxIiv1Ilfjn0v+vSe8yJNg=;
 b=m3yhEFpLRazhgs+lN3+eCXOeWHa5/XE9/nsiZqXsnuBXj/3aIUQIUK/4jE2oc0eGj7
 VQzzTGtl+gD1v5sY8DRl+D0ZA9AV1L4+ci1fqkVry9wOhGyo0PUVnijklCbDuW0tiwXq
 Fv9WTu4gZaHokbvcEXkowwY6EsFyOQzvLOC2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286629; x=1753891429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Q7xv7dB05a0bq7wMlNS1QxIiv1Ilfjn0v+vSe8yJNg=;
 b=XLK84vMfas+qmG0wLUVJF45n0TapGW/H32BMCULzB+0Olf20EweciBZuDHvO5rKGxc
 oQezYKEwgWN7dG3Bkl/tm+x4yfalRl8r0zo7b8FKdGP/5chBO0luFwp6uwrCwrypyqfP
 TylrlT3XsHQ+EoOxEYdp9iLstTeLqKJG24RRMoQ6DqyucUcuffPpZy98ZeJUjY8OPoOc
 U2rnreg7PDuYKwXgvipIQyEOflsrtLLerNsNr1ytrVPiY1kmOguRa+TrMfgUmbTmWP6g
 n0YX4LKzous8+i4JFIpPdqSA2u0MvZNDDO6IjwcPtZKZrBw8DL1wDLgoQNB2/7mqGlGj
 cqCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6cxXMTcqK/yQdLyizk5HwJcekgZcrcQhLTV7605mhT1T6aRaxcPATng67QFydsnGtF4EBDEz4xAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5QXiAWJkw+97XgnbkbGV0VnKjvAWe6YtVX6Jnn/NDpGuNOEXE
 1N/sMmLeojCd3FoShht1zjwtBvJ6WEZ4J6oKpy9B3xMlHQV5+gXQ8F4LJvTpJvEZ1ym/GAvhpO9
 WA40iFw==
X-Gm-Gg: ASbGncuBhNN/mAK9DFdxcJ92WwY5kWUQFXd6dVjPuZUknzVbpkp359NEcz/HazBBqXQ
 aEPTTzzaxdo15UTn4YS+gf2LsUGEp5c+nEF/BJGVGHL+NekHxiXebK2l88E82jIt0ciSSxE3iuF
 mJRXPtpDqAzyqrlrwIVDhwpdepTU5CYRSdaIhjUFsFhT9SduHlq9Pw6T8noltjntcKpZZOkX4Fs
 pOeKi1e5FiJllsYY7npnweOEA0wcaZfXLKWbrC3lMO6Idrqwmy39NRJFMbTYe7D6Rl2P8N3d5Dv
 IYO6x38sSGo/LP1tdyhusuoHg05flNsprfGlteGLCll7KI8wD1GfVVTMa7uVxWV+p8xA8D7zH0k
 oEa3AcajrK2FSVbJVkvxytc6Ridl6b/qm229hynagwysVUlFXhGxyWddBnJCEE+bvtWUARuk8
X-Google-Smtp-Source: AGHT+IGkIyTeH4B+wNeHKGPThX/OGkOaAdLRJzKW8oo5JiknwOm08bZviAAE1AEtp5h0iZeb71zgpQ==
X-Received: by 2002:a17:907:e916:b0:ae6:efe1:5baf with SMTP id
 a640c23a62f3a-af2f6bfcd52mr410304866b.19.1753286628480; 
 Wed, 23 Jul 2025 09:03:48 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca310c1sm1064023766b.71.2025.07.23.09.03.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 09:03:47 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so113063a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 09:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2dYKg+5G54F3So0gmyqVx8MY0+SLr8pzKV2KTcY7hi6dWXfz7vK8dyIR8f8FN9aPNTmfAAuqoilU=@lists.freedesktop.org
X-Received: by 2002:a17:907:94cc:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af2f8762776mr368390066b.28.1753286625900; Wed, 23 Jul 2025
 09:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250723072513.2880369-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250723072513.2880369-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Jul 2025 09:03:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XB0s_-qxm0p+vV96iJUxAwhcsvzFkOh1nhso2WkDoC2g@mail.gmail.com>
X-Gm-Features: Ac12FXwPjOsbwvF6lFtTC0ghMcxi51ZA2W2nWz8FIaHzuI_Dwx1tzkAytibzqGA
Message-ID: <CAD=FV=XB0s_-qxm0p+vV96iJUxAwhcsvzFkOh1nhso2WkDoC2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add 50ms disable delay for four panels
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Jul 23, 2025 at 12:25=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add 50ms disable delay for NV116WHM-N49, NV122WUM-N41, and MNC207QS1-1
> to satisfy T9+T10 timing. Add 50ms disable delay for MNE007JA1-2
> as well, since MNE007JA1-2 copies the timing of MNC207QS1-1.
>
> Specifically, it should be noted that the MNE007JA1-2 panel was added
> by someone who did not have the panel documentation, so they simply
> copied the timing from the MNC207QS1-1 panel. Adding an extra 50 ms
> of delay should be safe.
>
> Fixes: 0547692ac146 ("drm/panel-edp: Add several generic edp panels")
> Fixes: 50625eab3972 ("drm/edp-panel: Add panel used by T14s Gen6 Snapdrag=
on")
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
> v2:
>   - Deleted "delay_200_500_e50_d50_p2e200" structure and renamed/replaced=
 "delay_200_500_e50_p2e200"
>   - Link to v1: https://lore.kernel.org/all/20250722024512.983313-1-yelan=
gyan@huaqin.corp-partner.google.com/
> ---
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Thanks! This looks good to me now:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I looked at pushing this to drm-misc-fixes but it didn't apply cleanly
due to context. Given that the original patch is 1.5 years old and the
only reported problems are that timings were violated (probably tested
on a scope), I'm going to say it's not worth it to make someone deal
with a merge conflict so I'm just applying to drm-misc-next.

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add 50ms disable delay for four panels
      commit: 1511d3c4d2bb30f784924a877f3cef518bb73077
