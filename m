Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6FA2D893
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC310E135;
	Sat,  8 Feb 2025 20:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gZu4hSmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D919B10E12B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:25:17 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53f757134cdso3359413e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739046315; x=1739651115;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJDerw/xfRXHgl0oLYxXtpLYP2/HSeFnhpjbjeqGC3M=;
 b=gZu4hSmhG1zLb5cN+opt6UNn5hKUioooxKfwcnYw6ooWbQTiD3/1kHApGprpumzajX
 uriSDMX1Kv2caSuCZs92sP0QbSNMyYZ/o+CHawFC6kC4eLIq7xAM0HA9iA45TvwPyAKn
 9T/agdMn0K2dglI/hkSPu6TS48H7FGgM5q14I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739046315; x=1739651115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJDerw/xfRXHgl0oLYxXtpLYP2/HSeFnhpjbjeqGC3M=;
 b=p+nrp+aQ+w/gYUyGtbZPPWnL29hq20Byf5t3Kv+BD5aK5oHCmq2QzmMRjeFroeUkAm
 Uns6365w/Hpzlb12uheBeKLcIVpS5ZYhV4XHMHH0L7WLtvN5sgj80gliIeRKN8v4qffU
 my9OnqfylSH6UzDMDWPc4NbVwlO0Ggw9wWkd4lto6LKdrlnjrpst5GKZDtO/WvpxzQiF
 hFUPFYNFQlKv0UkDcOfaVpzoflFMONPPH+94c8+ecBqcwul9adan7Acvb13n85JHWE7E
 Os149GqnBnOCRfsGm1M5Rud46FyUjBevf06TgaS5zcLTFYPgTAo/g4d6gSkhIU2zJ8wE
 OOuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkpB1F79nC5032r2ukyqiZ7rXPI1AcuNlyf2ZDrcY5v3U6jWv5MNd3uatrpSJn64mwK0zVSh7Q8tY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEyy1yteihQs9hE2eyOL2XoMD0vYFwSyWFtGWBUJFAGxNYjsg5
 yF2zWlgAGXThh844sgphx/cGaepQSyNUcV3XPEANuN5p60xHR5UlXkPuKRppryLyN0s6ZNt8ro1
 7Ooz7
X-Gm-Gg: ASbGncuujL7vyeQM4OvOtXaRKOFB9ewrLnXugKNDyNoDOvjaNt4XvgTz+MrkjJabTmT
 jaD+90CGM2WzRkYdRAOvV3xzG99N8MLF86bNxLvVqeXueIWotyRQD8DVsFuXLxVxDz/4hk9oenk
 /K9amhvsTUcUEkgxvFveW6thPIGxjCms6N/wVRCE96tHNutitrQ39ccw627Id80VRs3hwazwAGa
 jA689JB3+d15S3+AuV2zDtmKdFh98dxlyGHzqHgtNf8dBGvFSw2AK8UQIuhNtNDWEzHf0z60EMK
 h5DSyL63+owXrXLJGI8JTw44U3s2OOi1IkKKZYY5+ulX4WPBp1mWGmI=
X-Google-Smtp-Source: AGHT+IHcCGuX+rbhwfm1FEgJxwVwj+Yu5NVwa+6mR7eZ0WxmErXNPazQv/nm66Sp75L7GVmYCIxjRg==
X-Received: by 2002:a05:6512:230a:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-54414aed208mr2503786e87.47.1739046315184; 
 Sat, 08 Feb 2025 12:25:15 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504b0c280sm273629e87.137.2025.02.08.12.25.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 12:25:14 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so3500996e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 12:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXi0vrozvdhizULXDhtKJtb9F5c+XtZPXGYxk/XXFsRyCP8rcWi2Fy1wCcqHMLAWfXjgquU/ILhOSo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1282:b0:544:d31:104a with SMTP id
 2adb3069b0e04-54414aa8102mr2388633e87.25.1739046313617; Sat, 08 Feb 2025
 12:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WYNRraERUdZuytYmiWuXR3UwSRybXMZ42+2K2nbkef-A@mail.gmail.com>
X-Gm-Features: AWEUYZmA-CBCC0QRXP02pRtLlgP78Gg6EgzjJkQUKaxMq3eMCZ3nTBRkI-JH_z0
Message-ID: <CAD=FV=WYNRraERUdZuytYmiWuXR3UwSRybXMZ42+2K2nbkef-A@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> add the compatible to the hx83102 bindings file.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx83102.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)

I might have tried to shorten the subject line of the patch a bit, but
I don't think it's a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
