Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B8A86FF4
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 00:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBFF10E15A;
	Sat, 12 Apr 2025 22:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cT565nna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A6310E15A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 22:10:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-736bfa487c3so2770914b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744495849; x=1745100649;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aHcCryjZ51sPp9epA2rO67Bwv4kAWiYpXBGmYoC5II=;
 b=cT565nnaPrVD4bBO5UvEQ3jYvSmZnd4jRKaWth/72H1IbfVWsHmi4PG1oUu6bf7Hgb
 /zRc4cMnhB5tJ2pblKByRGfAUNPXG03Ux7WibsA0Vzf1db8FbhVGxP0i8Tqt0+N7PxI7
 FVA3k1R9h4JzI4neBlHt7ztRVffZ6f79ML4+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744495849; x=1745100649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aHcCryjZ51sPp9epA2rO67Bwv4kAWiYpXBGmYoC5II=;
 b=JGrXJJQohHIi0MAesiie4kiX5DDzgdQUXrnEg+bFvSLg40xtMITn9arKhg3vcW3cL6
 iSdcO+LB9dPZY/pwsKpg6m2sWWv+TomYMEMRa5Cehf9vaqpvYdHUYJCpLUQjONpurehu
 iTxWyEBHOW+L9XVTSadC8HXK8ePD4lQq4lb1EciKEzGyXqkKo5b2SlA0HS0O6NRUZHJ5
 5oCk6PE9FzZZopScjLT6lGeUAHQJsPdQb1kaqrC0WvoSPXN8mQiVovA7/U+xzHXEEgyk
 Tmvq6iRpUTjz/0k/kPZuwDhDg8qcR2PlrsHlr5qYfqU5EyVxeJe0x4eTrDysnus2ZPYQ
 Dxaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd7bLliZyv8+BfUz0yZJwjC2Oigu5waARnRNkwVYxK5Bep/rHbZBFDISjZ7n76RptEIa6125kTCRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9+6wtdD4ZRi/9s8W8tOlxeWvGBMnpZOO/cWrqwlu+jMpKlisg
 KLKA6hp/YAxY6j5aIFv9vqiFh//cAmmkfL0nTtI/5cK9B9SC8Tl3/H6iIXzZpjCNUEqtjI6MK3s
 =
X-Gm-Gg: ASbGncs7Jj5vL61VMwW532q1VgD5SEkzlVAsUxG382Eio7CNdZpF37cFxrLC9/8BPpM
 kRR10yBxfEGhQDXemCcUxju6sJO4OsmTFcEKJ7RZKjSTYl/P0PIsjfWalyZ1v5gqeXj43gEv5vA
 4TFy3k5q5QhWQpzhvp55NxOGAquK+68AG/4lzb3LN8zEmE9LqTHk490ZvV+/0pQb+NZtsxRa0tm
 yM8rqKPIxhPGEakt0AjRC4o7a13Pu3q9XKNoc+3Ui6VudBfpFFXcQiYWVxLbvHbWJwwVU/348/l
 5oivl6DAr579ki1n8D3L03VIrFJvgdlhziC5HCpfj9YI2fyYYAMVHHiAP1GKlNL/RjVCmqHEijf
 DIEOn7gV9
X-Google-Smtp-Source: AGHT+IHXu6r+m/C5KwoTThnEEgFwmpVsdL6ghzsWgSXWPulXCBwxyQ593mrw20vNCArNPG9mMN6H9A==
X-Received: by 2002:a05:6a00:2306:b0:736:9fa2:bcbb with SMTP id
 d2e1a72fcca58-73bd12cdc3cmr10342472b3a.24.1744495848615; 
 Sat, 12 Apr 2025 15:10:48 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2335285sm4021558b3a.170.2025.04.12.15.10.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Apr 2025 15:10:47 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-af50f56b862so2139392a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 15:10:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXukr/8ztmF18Oj0gVG6Ouce7sb2sVf6L6w2K1N9m5zLJgSN1Q8qIrN+Wa7ftKK/7HyMsRlTZtJGhM=@lists.freedesktop.org
X-Received: by 2002:a17:90a:d647:b0:2ee:b6c5:1def with SMTP id
 98e67ed59e1d1-3082363359cmr10624682a91.8.1744495846538; Sat, 12 Apr 2025
 15:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250412043006.188641-1-tejasvipin76@gmail.com>
In-Reply-To: <20250412043006.188641-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 15:10:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
X-Gm-Features: ATxdqUG8oTzU1ud8WY8gkS8QtqDCzk5Os5fWsO0Vr20AO8sNQuStYia_euLNSzs
Message-ID: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asrivats@redhat.com
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

On Fri, Apr 11, 2025 at 9:30=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
> boe_bf060y8m_aj0_prepare fails.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>       boe_bf060y8m_aj0_on fails.
> Changes in v2:
>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>
> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
>  1 file changed, 41 insertions(+), 68 deletions(-)

As far as I can tell, your v2 and v3 are totally identical. Either I
messed up, or maybe you forgot to commit your changes?

-Doug
