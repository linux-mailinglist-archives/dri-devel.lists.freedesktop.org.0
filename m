Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA4A363CB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2C210ED13;
	Fri, 14 Feb 2025 17:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="B/lVjl7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CA110ED13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:01:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2406342e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739552465; x=1740157265;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfSWvTDVuKBwzqLK0PPm55nCocWKZqvFQZj7DIziw3A=;
 b=B/lVjl7HYlBob0AgATYBYGsWYNCjKxVzWwJ1l9v41R3474r1Etmiwrh3rVLeZ7IEHZ
 RKPSH8qLoEqltijWbFdnaHSsKK7WQ3+wMNABP/qIaLQ9D627ypo/OiVC5OpMlO4hxghL
 ut688vYSZv3EKTQtuxdK6k7tE1tcflMtoJBXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739552465; x=1740157265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfSWvTDVuKBwzqLK0PPm55nCocWKZqvFQZj7DIziw3A=;
 b=BwUoNDfCVglStN1vsAiwiJ1B/itjrin0X1714Bd1w+sR3ttP1xSC02u32DK/yMNgD3
 ZgTqKe3PfflCMMiNvsviUWxRigp/cnRjP89NjiMjLxTARdNiDYPqEqFZNEXoIcZ3j5jn
 iEvfWc8EvAJj/mWl6atmmnZHvQ0XJN0lmqDGfkacyB5x18bLxpUBDv3zX2hynDTuFKRm
 IjxEpSVy8PQgvUB/+bVbM1yaJroxNQSdpv4blTnnQzagrtc0XlIKYvQsuJxeRue4UxZl
 /Zt4ozU97oHOKiB8Dbowq0lCQC905oH3UebsPfF6a2qiCE19oC4vZdsZMGm91exdiOcr
 y2OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKgVfk7ryCyrtujg3ru/RwzjAhlRfMihSvsFDU4PTVK55kr/33c18LoLAfazNBbrFRZJRJHuJ8q5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUxwQGIkXixy/Jk03NeHt8AJ1qMybef+1SRzVn4cw1/PDCP3yR
 9JKMJgjb/19h2Qn6z2EiZ+uciMpNYU3fONMfQq1udvReGEpyhLpSikW+sK/OkOpswIs9CYo4K9f
 KTeZ1
X-Gm-Gg: ASbGncvceknfGYdB9c60wrtuog9Hyw7s6ETjgcdaQPHGqvz+GcgvOOg5otVfb+SmaBd
 QnEId3nhttTEURbu9Wt6wkGN9Be8pGT53TqKf8o83Gt41C4viRCysBy1kDlkeXeaonUlFfNLAdl
 RXDzqpCt/2qxrJdFTjfnF5GFoAA3wlJ+548G4xhy0WEXgJBb2Lzs2ZC8MsQDgQAuD8SxuC7Gf+F
 690Oga9kxOIUJvQFGg1eGM0mqY6g8z4HcRsjPK4k7oCck99jOO8/nuTtI+RgU+fhVv2i3+SYCfO
 tqQXNZ4DXGoUfbbrQ6Iv9zNFm/fmPAZdGrgWuAOA2YjsZUSCm/hLVvse94M=
X-Google-Smtp-Source: AGHT+IHNHy8sw/NIeRgBHNM+AmffWkX0KXOphXpA857rxyf1Cr6YGWO0Q79+TdpQ5/EZJt4/AS4/Tw==
X-Received: by 2002:a05:6512:ba6:b0:545:49d:547a with SMTP id
 2adb3069b0e04-5452fe45df3mr32648e87.18.1739552464517; 
 Fri, 14 Feb 2025 09:01:04 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54527276909sm314915e87.213.2025.02.14.09.00.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 09:00:55 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso23546641fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:00:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXCu5JGc1FIRlxXAtZaJGtsCC6s3oZ71WwSiVsMLPKeODy/tiROFsu3OLeMt5OZLT9OvvfuUCpE5o4=@lists.freedesktop.org
X-Received: by 2002:a2e:878c:0:b0:309:2627:8b04 with SMTP id
 38308e7fff4ca-30927a6f375mr745551fa.9.1739552451496; Fri, 14 Feb 2025
 09:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-27-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-27-e71598f49c8f@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 09:00:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XtRg_sqbLMuE9FTtPvDtkMTRBFfAbgekhBWokjAQ4LfQ@mail.gmail.com>
X-Gm-Features: AWEUYZlycZGUKuhTCeIZrvmtO14Z1ZtvZMcFxiavcA6wW5KOV4XKvByQZ_fdTVQ
Message-ID: <CAD=FV=XtRg_sqbLMuE9FTtPvDtkMTRBFfAbgekhBWokjAQ4LfQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/37] drm/bridge: Add encoder parameter to
 drm_bridge_funcs.attach
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Thu, Feb 13, 2025 at 6:45=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The drm_bridge structure contains an encoder pointer that is widely used
> by bridge drivers. This pattern is largely documented as deprecated in
> other KMS entities for atomic drivers.
>
> However, one of the main use of that pointer is done in attach to just
> call drm_bridge_attach on the next bridge to add it to the bridge list.
> While this dereferences the bridge->encoder pointer, it's effectively
> the same encoder the bridge was being attached to.
>
> We can make it more explicit by adding the encoder the bridge is
> attached to to the list of attach parameters. This also removes the need
> to dereference bridge->encoder in most drivers.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

From the point of view of ti-sn65dsi86 and parade-ps8640:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
