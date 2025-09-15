Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0EEB57FB1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7D810E361;
	Mon, 15 Sep 2025 14:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZU3QOdYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E110E361
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:57:32 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7761b392d50so3357486b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757948249; x=1758553049;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSuuPi0RBraKWGef/U6swz7Geuge5FseMwxYOTQoMUI=;
 b=ZU3QOdYQzyO1/pQgt5Ykzt9V+4Tij8L/FdvqvZrkgevuGf5xDI5muJfneVZlxvLu79
 J2FmcbxXq3E1k5N2EHlafJROfNyPwPb9C+zPU1D0OWqP+af1X3iCZAGswP6uJa9idZEL
 wjMg4KaTUp78ReQY2VIH4dgq7RfFwvlHrrq6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757948249; x=1758553049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSuuPi0RBraKWGef/U6swz7Geuge5FseMwxYOTQoMUI=;
 b=whBiTgW0rIMSNfY9tReFUhpeTN7LcMPfkr4emaw8o15XznozXVVh1jPOBH8CA+uyDB
 F5pjRZtXI1KvWBdd2FhrvO+qXtdSIqwTj0Vr8NiS86WgkR3ThuQ8f71aKLfwHnxaKIfP
 caE/SAJSJ8zQTwP2y5jyDy0yPG+dHWg0WuczSnSjVYI9d+jYpbYjxWNTebdgVmLXyVC/
 GItk7ZOXrltk4cu5NEbrngJwDmQqkxQwC4ktYVdPPasiOZQNP7p+lsi54SJ0XSHHTE1x
 5PBi0yo0hhP8ZnJL7Pv3uSwWFZhGX8o8Gae0p5wBJ4lA+p+g5+Vvpn5o/euz2olgV2do
 cM5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPWNGYQ/omiuDdoilnWjSIuYlIKREmher7vb21AvahuNSKalOcuEgHFn9BET/ykKHpQemYLyiVoXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW5klIwAVmNsv0ksDa2Cfu4F27J0jqGZIOgt2gOdW8e6nTl/Ob
 cm8RuYdThn3A7brBVwK3p3y9twlaPAmUDlICgPqKQ0tOERiRvlB9DjxYzYMvG/wT6TGfoAnOw7/
 7Q+M=
X-Gm-Gg: ASbGncvwKpDl3zc5AED+n8kBmA7wXFsjb7IvAh9I2KoHuVenfso38zpafh7uq2TP4Ey
 RGVxHfVgFuMXYTGh49qUWe6QWEeDcIlJzvVgOJP/UAw2y90mAUqh29gw3gjinq9VS2PeIUo+74E
 xqNFJ6yfNF5GtvEib4QSY3QmlU+Ko3xem3ak+Lj0CEUSziWDQ35xpTQXiigsD0Y74cwHQw8O1td
 8m7xXYMvn/faKDup19ffWiwaOU/iZ3iMpI+2iwanuwhoqGjewl+3/rElGhVzHbhqwso40yHVl4s
 FNs34EbW/nyHrbXhl2JgjZg3i+y/CggOUwcgOqXFQgogNSdgYF6yjye747A0R7i9meW1nzPbJHo
 5ET16SwGrvB0Ckmt8DWMysIxNnJJrsx1lSCu35iv5a/XmO279KuPp+caEC1YXc9cd/Q==
X-Google-Smtp-Source: AGHT+IG2HCvKiSgD5Bp4sJBS4ln49LzlXeQ37mPxGvbbACWuUIIeiMjWuui2zSYt0OuJEcVctxiVbg==
X-Received: by 2002:a05:6a21:99a9:b0:247:b1d9:77c with SMTP id
 adf61e73a8af0-2602a49d9fbmr15730312637.3.1757948249535; 
 Mon, 15 Sep 2025 07:57:29 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a35b877bsm12160287a12.3.2025.09.15.07.57.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 07:57:27 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2570bf6058aso56912315ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyMKnFrU444n/4xhp0m8vpNRxdWQMMZhv6b9kHge0ueo3sk8oSJc4xCek667eMOGQ91HLBtA9Uh30=@lists.freedesktop.org
X-Received: by 2002:a17:902:ecc7:b0:25c:7434:1c03 with SMTP id
 d9443c01a7336-25d24101631mr160114095ad.10.1757948246579; Mon, 15 Sep 2025
 07:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250915113437.665345-1-wuzhongtian@huaqin.corp-partner.google.com>
In-Reply-To: <20250915113437.665345-1-wuzhongtian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Sep 2025 07:57:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xan-C9hUzv8UfNOom6dkrHFxH1f5ke1KNGwdxFmEK9JQ@mail.gmail.com>
X-Gm-Features: Ac12FXwTTBHdoxEkLghyvQJZND2VLlss32KjtpSsfoG9ZAk_xu4tjzACy3J_x4g
Message-ID: <CAD=FV=Xan-C9hUzv8UfNOom6dkrHFxH1f5ke1KNGwdxFmEK9JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several panel configurations for
 mt8189 Chromebook
To: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
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

On Mon, Sep 15, 2025 at 4:34=E2=80=AFAM Zhongtian Wu
<wuzhongtian@huaqin.corp-partner.google.com> wrote:
>
> @@ -2006,11 +2008,13 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N=
140BGA-EA4"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, "N=
140JCA-ELK"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N=
140HGA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x148f, &delay_200_500_e80, "N140H=
CA-EAC"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140H=
GA-EA1"),

The one above is mis-sorted...

...I've fixed it for you while applying.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add several panel configurations for mt8189 Chromebook
      commit: e3e4110610671027e3b56bda1ad9f6c51d5ac477
