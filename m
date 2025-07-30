Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6512B165A6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 19:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BA010E38E;
	Wed, 30 Jul 2025 17:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P0lThqwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFFE10E38E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 17:40:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2406fe901fcso1403985ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753897204; x=1754502004;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmS6bVYq3PqzYjaFJqOEs6GoaJfi+gAn12+ufIU/vGg=;
 b=P0lThqwImVBYqmADBX/FO6Oy+w4k8yquWjV387+bSBzKKnz35m2gNKPnk4bL+akxf7
 rhtKN2io+nVFLYeFkq7ygdEH8Fe/qeK7isLF36QRUNkKCqPkNsQa2vWLQVMSROvyTlBV
 T1hwSt/cIcmh2AeC2o4Jrem1O9GEyxsvZs4Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753897204; x=1754502004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BmS6bVYq3PqzYjaFJqOEs6GoaJfi+gAn12+ufIU/vGg=;
 b=pY25DJeCE8n9AryvxIBHncDwEVE+7B/Xkf7IbNBT7IstjZG2uaXcqU+NrFdWdEESuk
 l/11yiEm1/TvwpN342wC+HOO9ejtAheDYaUgJpE9IEYj2Lceo2rPc1V0ts2uue8IV6iZ
 E3h++CAnEuBeMK1LvUR9MKUemxxWfmKVBAesJomFEvBZGadc/GZGDs2nEjW9iX5gwIlS
 dIltCHCQfaO/BbO/lsOhiLX9dua/I4xdVSNhqOWRT87af8QkiPq6HYuLPCX6JntjW9TT
 W5jl3iLnjYsTyoV+On3kGnVdEgWgyxfGW/1w5zRoirzWvTdCUGYXqWWsUwCLq+NKcNb2
 kPhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA+iH/3yUIeZ98xtenqpGJ31SvUukQi58WGqHDE0epFbQp0VKaM43Nu7yeWmoUMDXjY455veV/P7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiH/Bz9tNWiB/3plXkU+/5ANX3nB916L/4Hqr+SjUTVv2txRGQ
 l/ZHACZObG4jDTds1COEQsDYsZD7UzEQpwJojFV/aaBq7TMA///2YjMC5GvXNZG8MPjkgIu3Eo+
 zjzQ=
X-Gm-Gg: ASbGncvDaplt2YXuVTsSiiOFzspC7WTShlJnuhJVs1OWhZDN+WwILwd/iL0WkcVnJ0h
 SmrFwYdrkPpcdk243GjGsklx7eoc9hQTA9XVELELnVFkt28iXRcpnvbCf0Z1eBgj1CXKBjl2OlY
 tASqcNLL04vGSq8YlG9LHZh6PVFPZB+yKK0WXZcrGzkmStwTMBq1GopfRHcfkO3g0dCR8YMu8VM
 S9+FSu6jqfF3R3hpOzitzpiCRB6gnxpfDfrn6uBsLYYgEfQQc138C1wbQpviNgdEaMw9llluhmb
 89EUwr0McAK56cuHMv1hRsiuNhwp6yoF00VDZXce+edsEQQpRRZcIM8l59/9aQjGphoUfTVbXr1
 d9/v7Wr2j18vXgJukol0pwR8SxIhPIw0/CQAVDmPoer/qa/4VW/hTHAkcPb28tlTz0axY+S1X
X-Google-Smtp-Source: AGHT+IE25ED4Vb6NOK09vSB2LKr2lkDhkRAFwJmmYTPqmWPH2Pn0yOin0ggm/mUxTdpVtqV5NYRF9w==
X-Received: by 2002:a17:903:2f05:b0:235:779:edfd with SMTP id
 d9443c01a7336-24096b24650mr58875075ad.39.1753897203758; 
 Wed, 30 Jul 2025 10:40:03 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24049da18c4sm61594545ad.26.2025.07.30.10.40.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 10:40:02 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-31f325c1bc1so132999a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 10:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRR68h0kXg/TYYhWaTaXeYhOhJMavpTH73l/z9OZtBZ55PUizwENevNYvoEesniDw/RzfCFPAG3Po=@lists.freedesktop.org
X-Received: by 2002:a17:90b:33d2:b0:31e:c8fc:e630 with SMTP id
 98e67ed59e1d1-31f5de73bf9mr5384683a91.26.1753897201409; Wed, 30 Jul 2025
 10:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250730071629.495840-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20250730071629.495840-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Jul 2025 10:39:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XThBbAwQcuR8Po6KfR0LwsfwR0HCr7j0Pk57n5XeQu9g@mail.gmail.com>
X-Gm-Features: Ac12FXxQZr0-8IcS7sB8WEKDBJN3gQrS50vttC8EXroWdTPe0EPqDAF2tpw__8E
Message-ID: <CAD=FV=XThBbAwQcuR8Po6KfR0LwsfwR0HCr7j0Pk57n5XeQu9g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several generic edp panels
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 30, 2025 at 12:16=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add a few generic edp panels used by mt8189 chromebooks, most of them use
> the same general timing. For CMN-N116BCA-EAK, the enable timing should be
> 200ms. For TMA-TL140VDMS03-01, the enable timing should be 80ms and the
> disable timing should be 100ms.
>
> 1. AUO B122UAN01.0
> 2. AUO B116XAK02.0
> 3. AUO B140UAN08.5
> 4. AUO B140UAX01.2
> 5. BOE NV116WHM-N4B
> 6. BOE NV116WHM-T01
> 7. CMN N122JCA-ENK
> 8. CMN N140JCA-ELP
> 9. CMN N116BCA-EAK
> 10. CSW MNE007QS5-2
> 11. SCW MNE007QB2-2

nit: CSW, not SCW.


> 12. TMA TM140VDXP01-04
> 13. TMA TL140VDMS03-01
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Please make the subject line a little less generic so we can tell one
change for the next. If all changes just say "add more panels" then
when cherry-picking and looking at patch subject lines it's hard to
tell which patches have been picked and which haven't.

In this case you could mention that the panels are used by mt8180
Chromebooks, like:

drm/panel-edp: Add edp panels used by mt8180 Chromebooks

Also: even though it's a bit of a pain, can you please include the
EDIDs in your commit message? I know there are 13 panels and that can
make a long commit message, but I'd still rather see it here just in
case we have to later go back and reference exactly what panel you
were working with in case some manufacturer re-uses panel IDs (it's
happened in the past).


> @@ -1865,6 +1880,7 @@ static const struct panel_delay delay_200_500_e50_d=
100 =3D {
>   * Sort first by vendor, then by product ID.
>   */
>  static const struct edp_panel_entry edp_panels[] =3D {
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x04a4, &delay_200_500_e50, "B122U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x105c, &delay_200_500_e50, "B116X=
TN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x125c, &delay_200_500_e50, "Unkno=
wn"),
> @@ -1883,6 +1899,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAK01.0",
>                          &auo_b116xa3_mode),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unkno=
wn"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x52b0, &delay_200_500_e80_d50, "B=
116XAK02.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
> @@ -1890,10 +1907,12 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140X=
TN07.2"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116X=
TN02.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e80_d50, "B=
140UAN08.5"),

All the old AUX panels seem to use just "e50" but all the new ones
you're adding use "e80_d50". That looks really suspicious. Are you
sure that these new panels need "e80_d50"? Were the old definitions
wrong?
