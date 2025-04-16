Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F1A90876
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 18:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC6610E098;
	Wed, 16 Apr 2025 16:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FDBJK4PE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BEA10E098
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:14:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7376dd56f8fso8821855b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1744820094; x=1745424894;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93lYrXJcXYYRNRseEFWo6L1+f89BOQ0v4i7jBvitfWo=;
 b=FDBJK4PEQMbvPqoF2H9neUmDZ2xiwTtBDbC8Dg7zqF2pZmy6g+1S6KNq/cj9al/5SY
 saASwLMdJDoPbFcAH/MPgSKnhel+GMHRg5uZw9gBcuXopG6XsxJ7faFl70xMr2Xjp/A+
 0rmOLf+v8GdQMzARlBC7yCrQDn5RtH+rXHne0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744820094; x=1745424894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93lYrXJcXYYRNRseEFWo6L1+f89BOQ0v4i7jBvitfWo=;
 b=YvjUgiDVP2dAvztVf0Fbi+UZUqcSq6gdJ0e8zYDLz1+RNgKTfYlM+hn4IKqbnWkCcT
 PFInojQSIiIdRcQW1aOTu96crK8423akW1TvqPL3hKDEOLqmJuJmnicAn372VM74cchs
 OZjFGnKg4OfLEIFcRBVT+/P0ABcS1TOHxA4ceB1LV+XxFlunHOKskBV8t3e0RuAWFBXX
 c9t1Oiqv5HLPqt1I5EQ5yiqnitZOGRczw8pCkrx5AXR8SryjD/bxRp73ThrVNDMIDDOh
 hN/JoGTBv5HHLF63DrOAR/08nuClj0ukQUpRnAb/mb1Y8k1OgNjZ9XBREuVBNUBZTKyL
 EyUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0uIfMqSZSFDQBDIItSG9/CiLhfaisDCerfqcQ0vIBxd8aHMgcf4ahlVusfYvDMxvN+tEWRD9jZvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDegncMBN+SfMo9tGpYIPhOgvXGbCJ+mUhWrdjt3aiM2azWWQn
 tTs+/kcNQH4oN0yephKL9UP6aosv5WjFEUgzcv+9d1QJI0kmw3I1gHFEXnO8vlSlEon9iFsVzeE
 =
X-Gm-Gg: ASbGncuXsVitwR3cscjuwvbivADgwGphSuQo6+w31Cd65Ose3Ems9l8h/FzWOfC/hWP
 4uYlgGDuhja5vjJafzPKyERIxY9DpuqGMIxZnnYexoNn5nrzUnSh3+csrTb65j6BhQNSk3Rkws9
 YkIaiN9ix8qW6JNgoZzB0kACjnUFsNvIUacpmVt1glv6efDh7V3NLcz3LWoXoxz+9oxT+U9F4hY
 tdQRNJl3+gH9CBJosvY42If0Mxy4MXsKJk+zLuTOPPMTDtL2wPlVQnQewX89pYcsnAp2bS3w4OW
 jbS6cp1pyIhk0C4QYvgwW+i7VUdgjHqOGHErLX+SAeIdtCxmSzLYtJejRewCD9bd5zr5/yyWUEw
 K+AiqdJO9
X-Google-Smtp-Source: AGHT+IHBbnSKW12RcHr6dYdEEcxe30jRNdy2B01sRlDNOru1ZmnUKAGJEJAXJoHvZ0XV+XlaBGgYHA==
X-Received: by 2002:a05:6a00:3cc2:b0:730:97a6:f04 with SMTP id
 d2e1a72fcca58-73c266e73d9mr3381944b3a.7.1744820094127; 
 Wed, 16 Apr 2025 09:14:54 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230da35sm10953414b3a.131.2025.04.16.09.14.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 09:14:51 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-af9a7717163so7209856a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:14:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUR85+Kmma3cyMywv/QIPdpOZa80o1gMi01E0xL4l0c8Gf7MqfBYO1tJ0VfhUDsjGKvNuBBDVJt49w=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2e10:b0:2ee:e945:5355 with SMTP id
 98e67ed59e1d1-30863f30453mr3359259a91.19.1744820090455; Wed, 16 Apr 2025
 09:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250413035959.255842-1-tejasvipin76@gmail.com>
In-Reply-To: <20250413035959.255842-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Apr 2025 09:14:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaX8s2aPi3V8SfHd0i=+9kMbF83dnO-e7P6CZQ8-iEAA@mail.gmail.com>
X-Gm-Features: ATxdqUFM_zF8N6Cjd3iCDu5vqV251aCLSHWtDUzz5VJNje7onq9bV0FbWP6jAQQ
Message-ID: <CAD=FV=WaX8s2aPi3V8SfHd0i=+9kMbF83dnO-e7P6CZQ8-iEAA@mail.gmail.com>
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

On Sat, Apr 12, 2025 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
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
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
>  1 file changed, 44 insertions(+), 70 deletions(-)

Pushed to drm-misc-next.

[1/1] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
      commit: 734b6f10506c726dc6be23e0ba63ab0310580aa6
