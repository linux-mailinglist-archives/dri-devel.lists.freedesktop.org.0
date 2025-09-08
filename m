Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E2B4850A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F2B10E190;
	Mon,  8 Sep 2025 07:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v2/rmdTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8414110E052
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:41:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45ddddbe31fso8777755e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757313684; x=1757918484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkXagCl/AYgtldzrQyVYMLNKfsSUwxilFSVrqkOB0fg=;
 b=v2/rmdTeilzqnHjav08FOOt30Rm+DclnHeiKAuoydLnCcnKZtpmqmL8R4mY6uC2fxQ
 rJSbuiFD2hzDhgLepWWKN7NnUYLdeYVqRjjJNZGjPPTPdXigBTwcJ2DddZ/Sky7zeXHC
 UXqIcNOMAV3lC8fJqDNG/JJpU1j5ZbM0+vasxI845OF8/buppMMWtQqzsTqJJHMuQRkC
 em86s7itst+KzW+5qb00qxUo2z6mlaYtcquD0UJnhogI6/XQ1pFJYcUX8QboN1C+ETrl
 qx5Qye9P1/gFisB7Xh+DWqDJJtQqohTDEAGR/ObY6n0d6/ZTat5PoZUcQIOAdp2FYKWb
 Js1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757313684; x=1757918484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkXagCl/AYgtldzrQyVYMLNKfsSUwxilFSVrqkOB0fg=;
 b=YuhNd9SuX4lvUndNUnUmvR7+GcyTbdMiRySc2M3k+SyEG/o/awj0KvCbmoopgsEJvt
 iWJ9mZNN4kPXbB23snqLJAANb7GfaRjdYTXRzQneb77Yyh7PI4+XPNGZyes/wEVcQe0k
 KNIzmPCLqYeTj4hPk+DuYpDjq9UVmEiuc0NTvJWBXyZfPhcow2YwclNDcy3txxl4FXtz
 E8rpb26uqFGrlUk1un+WCFiYgeYFYsaKclmqHX41oZXZYq28O0HMW1zBRhNbOdaRMKMc
 bvLVGwdgxp1iE3EcXnOXlOVoiW9ZWI8dsOC6/A4svM0m8YxrrybIxZcNe8A87DbwRviU
 NZDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsyoKF5nhVCHwPSgx3DAPReDvZxolDRMfKjNQtwa9ecZq7jlFgdrIQO/3YpIhXmX5SgwIHE3M7qGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiZuzu6z2+LdoyA9GL+hJU1rT2UNkjiBQ+uidhIsMx+jNJTdt5
 dVy8wrbXvK+FpH59AcnxbtgI+M0OGh8Dqw/HVtfb+Mj+lZrPaW4Q7LZl/G9qk1oBID2z9JqL3tQ
 3jXTI3J2qBjisHb4naoljLJcfulKeNQTqByzbgeJ2LQ==
X-Gm-Gg: ASbGncsQcJ2OmpGnTSCRFzR4knHX5BISssXy6y3K12ciTpaF3jSxX5uiwLioPQ64jtG
 AZMyOxARJPgfzJLIt5Z8I7m3eUP3PJQmCsqT5u1ga8uahODSZz5Ew0xalzSXmQdiwv1JvVpkYu8
 2jE9OQmIEcEMa2XC91dSbBCeWC4aS1vVAdayiUfZF+3fcfnsyY4Xj4S4FoXWFWaahV6q51spKF8
 2b0ezc=
X-Google-Smtp-Source: AGHT+IHfg86okQAaqA2qPatL5ihHv5DDUErenS6tECvB2YYrt6RqWL76iuGx0WtCqAU2MP1oam8FMCdRi+ULTYTtuSg=
X-Received: by 2002:a05:600c:840f:b0:45b:6365:794e with SMTP id
 5b1f17b1804b1-45dddecdacemr60624255e9.24.1757313683943; Sun, 07 Sep 2025
 23:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250905075114.1351267-1-wuzhongtian@huaqin.corp-partner.google.com>
 <CAD=FV=WZAXnTGHhrMHTu3p0GL2ky2W1Xqmw2x2cL6FvvdYgG1g@mail.gmail.com>
In-Reply-To: <CAD=FV=WZAXnTGHhrMHTu3p0GL2ky2W1Xqmw2x2cL6FvvdYgG1g@mail.gmail.com>
From: zhongtian wu <wuzhongtian@huaqin.corp-partner.google.com>
Date: Mon, 8 Sep 2025 14:41:12 +0800
X-Gm-Features: AS18NWBVVIYARbo9jGChFGToa9tLqcqLCFn_Os-0iwAz9fvFKHyHFp6ByrImigM
Message-ID: <CAJUL2LOwJd3t2oEZwx5Q5iZhg4DDtnqAcb82bvmxotKNonO6yA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add edp panels used by mt8189
 chromebooks
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 08 Sep 2025 07:25:13 +0000
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

Thanks for you review.

I have update patch v3:
https://lore.kernel.org/all/20250908063732.764289-1-wuzhongtian@huaqin.corp=
-partner.google.com/


On Sat, Sep 6, 2025 at 12:41=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Sep 5, 2025 at 12:51=E2=80=AFAM Zhongtian Wu
> <wuzhongtian@huaqin.corp-partner.google.com> wrote:
> >
> > Add a few generic edp panels used by mt8189 chromebooks. For
> > BOE-NV140WUM-N44 V8.2 , the enable timing required 80ms. For
> > CSW-MNE007QB3-1, the hpd_absent timing rquired 80ms, the enable timing
> > required 50ms, the disable timing required 50ms. For CSW-MNE007QS3-6,
> > the enable timing required 50ms. For CMN-N140JCA-ELK, the enable timing
> > required 80ms and disable timing required 50ms.
>
> What makes this patch v2? I don't remember seeing a v1.
>
> Also: this has the _exact_ same subject as a patch that already
> landed. Please try to make patch subjects at least somewhat unique,
> even if it's "drm/panel-edp: Add 4 more panels needed by mt8189
> Chromebooks"
>
>
> > @@ -1949,6 +1956,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT=
116WHM-N44"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV1=
16WHM-A4D"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE1=
40WUM-N6S"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a6a, &delay_200_500_e80, "NV1=
40WUM-N44 V8.2"),
>
> Please sort properly. 0x0a6a definitely doesn't come after 0x0d73.
>
> Also, from the EDID I see:
>
> ASCII string: NV140WUM-N44
>
> ...it's better to use this exact string and get rid of the "V 8.2" at the=
 end.
>
>
> > @@ -1978,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, =
"N140BGA-EA4"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, =
"N140HGA-EA1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, =
"N160JCE-ELL"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, =
"N140JCA-ELK"),
>
> Please sort properly.
>
>
> > @@ -1987,6 +1996,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB=
601LS1-4"),
> >         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE=
007QS3-7"),
> >         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200=
, "MNE007QS3-8"),
> > +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "=
MNE007QB3-1"),
> > +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE=
007QS3-6"),
>
> Please sort properly.
>
> -Doug
