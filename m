Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F788B217F3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21B610E562;
	Mon, 11 Aug 2025 22:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E05nT3MS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2C10E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:10:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-76aea119891so5638546b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754950209; x=1755555009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKoHHjT8yFfyfYeN+QtJgAeYV97GirwWW9p34VHnmmA=;
 b=E05nT3MSFWFd//PopegF3QvPZY56GhrM8uO6pL01i9gXVjiF4CQDNrchgyZ0iK5R4j
 U4kLTwEiheoeHLHUxxlUEmLzZI1/ntRWODvPKxe5DfC0cR3meLfAoTu98SOXFxreQJ6E
 FnPPKRUrbF8/CcGegIUTbMnfRx2nw1Z+z4G6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950209; x=1755555009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKoHHjT8yFfyfYeN+QtJgAeYV97GirwWW9p34VHnmmA=;
 b=vVaqR5uu1+fMF4fMbFY2GPlvwwEe73hcNhUBcK17IlYAkacBARW/EsSkTb6uCPjklj
 mo+8jI9VzAGXsrfVZJpzx5crZ2+qzNmJU+8wPrMfqs+CJKYBeYIRfBcTKfXrF3H8mO+c
 1a25PR671EkefFnYZDYqNRekpMZLzNCLwWx42twm2GzGv9YPcBZBfWAw9WX5u8kG3NRA
 nSAzlRavYnp4+nOdve2hg5VyFcrvHdhmg6rC2vXyh6ORKVDY8SV+O0rbL7VIWidTJs5R
 gD3ExR29EpQvuwjUVl2AxrHi3v9h9wmzinOnxFdFmNPTldunMWefAFZ4Tmh2gCqbWhzg
 3S0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV82Luo/7SXhLcjoAif169rd/EYyJ93917cGjVFutdCxHZOXyHAageKAx22120n+dl0+51sr+FPi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFZKo6kq6/5EIvXLaZ89UIRno9L+EUrXAmsSGVTsy5kVqc/dEk
 Sa1UBYCKWfurQbVJhIpFHTRilTZUv3ruu5CeGzssNd3VvIqpIny+uDdWbzzkumFn+REVZxaqBrg
 9c5A=
X-Gm-Gg: ASbGncvBxO0TMHLUq4ndIT6BpgbR7+q9xRoIuQae7aMoM9KTugxGCk7IM9X4/FuqKFB
 Ix7t/HMLfIYRdxx2lXM8rV6OvOq9cl26Sljd8YsZ0VLfYSc7yBBOdX5Y62VTkmR5yx9Ahuc8/Za
 PVb+bXmOO6Qli1i1MKtZaaIM6Rc0Co2a0uKG6MxSZGUHz0aA9c+jQ6JeTydi6s2ydRVMF/U2oVo
 xIrUgpu/uqowLX0KYTef5XE9vP7ouU8OJgpDjG7117UIaLWJyX+WjXrkPExpCB1wUGjnSfcB9HS
 3/VNicrzoBecyhKiDCXf1PlESAtsQOsw8rxPHtwcz/3yDp8hWtFaQb9UfEstnUXs3qZCzRstfuy
 +y+GXLw78LfTARyw5OMAY2PoeEr8EUXlIMWk6B4cri3Ec0rKHz+xslZdTV6mEZI1d0NfPH4RNAT
 Sz
X-Google-Smtp-Source: AGHT+IFC4aG2HQwQY0+JEU8AcgO0j4fD9A6W/ayazASdO1xSG8b7GLx78Z8rPX5IgOWaztgpG5tVkQ==
X-Received: by 2002:a05:6a20:6a0c:b0:240:26e:a976 with SMTP id
 adf61e73a8af0-2409a3b9a8bmr2257925637.1.1754950208744; 
 Mon, 11 Aug 2025 15:10:08 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b428ba4cf35sm10998940a12.14.2025.08.11.15.10.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 15:10:07 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b4233f86067so2890270a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:10:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfeHQ++9DchPFQ20EJwJyun5UARspW7zbpiCwoMHXY6fzGobPJOqV17f9j3j1/1MG8mZoOVLU+QDY=@lists.freedesktop.org
X-Received: by 2002:a17:903:22c1:b0:240:ac96:e054 with SMTP id
 d9443c01a7336-242fc39c707mr16059165ad.23.1754950206336; Mon, 11 Aug 2025
 15:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <aJKvm3SlhLGHW4qn@jander>
In-Reply-To: <aJKvm3SlhLGHW4qn@jander>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Aug 2025 15:09:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UGVi0q2Vgp_JALjcBJMzw+C9uOfzfzGGE_YnJOgYVjAg@mail.gmail.com>
X-Gm-Features: Ac12FXyJsKrTSQ36G9lHnh52Fq9-wqIdM2Q0ZgO3RGoXAGLXCYzUVarebSqfLfA
Message-ID: <CAD=FV=UGVi0q2Vgp_JALjcBJMzw+C9uOfzfzGGE_YnJOgYVjAg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345
To: Christopher Orr <chris.orr@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Tue, Aug 5, 2025 at 6:28=E2=80=AFPM Christopher Orr <chris.orr@gmail.com=
> wrote:
>
> Introduce high-res OLED panel for the Dell XPS 9345
>
> These timings were selected based on Alex Vinarkskis' commit,
> (6b3815c6815f07acc7eeffa8ae734d1a1c0ee817) for the LQ134N1
> and seem to work fine for the high-res OLED panel on the 9345.
>
> The raw edid for this SHP panel is:
>
> 00 ff ff ff ff ff ff 00 4d 10 8f 15 00 00 00 00
> 2e 21 01 04 b5 1d 12 78 03 0f 95 ae 52 43 b0 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 fd d7 00 a0 a0 40 fc 66 30 20
> 36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 cc
> cc 38 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 37 31 4d 31 81 4c 51 31 33 34 5a 31 00 00 00 00
> 00 02 41 0c 32 01 01 00 00 0b 41 0a 20 20 01 ea
>
> 70 20 79 02 00 20 00 13 8c 52 19 8f 15 00 00 00
> 00 2e 17 07 4c 51 31 33 34 5a 31 21 00 1d 40 0b
> 08 07 00 0a 40 06 88 e1 fa 51 3d a4 b0 66 62 0f
> 02 45 54 d0 5f d0 5f 00 34 13 78 26 00 09 06 00
> 00 00 00 00 41 00 00 22 00 14 d9 6f 08 05 ff 09
> 9f 00 2f 00 1f 00 3f 06 5d 00 02 00 05 00 25 01
> 09 d9 6f 08 d9 6f 08 1e 78 80 81 00 0b e3 05 80
> 00 e6 06 05 01 6a 6a 39 00 00 00 00 00 00 58 90
>
> Signed-off-by: Christopher Orr <chris.orr@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345
      commit: 754dbf164acd4d22dd7a5241b1880f54546d68f2
