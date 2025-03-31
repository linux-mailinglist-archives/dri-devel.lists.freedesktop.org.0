Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A3A76948
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944210E415;
	Mon, 31 Mar 2025 15:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cior+5+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5210E415
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:06:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso44891101fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743433610; x=1744038410;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcGdaRNt7zwbYw4AvOVG6yQbALs0693po5JMHnUNj3k=;
 b=cior+5+sr6TgHxjXmx37ZDV1Aq5X3Y9mLFOfaJCj//PYmje07AcxmK1FIHskws8l7X
 yGoRrPY7ROPcnG9epbrTy8wJyJuyDoqOf/0N81GRAwC+SOdsV8+emFz3X6RUkHJZiu/1
 rhTalaNydMedNOxc0CMxGpijaDdlmrJM/qVFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743433610; x=1744038410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcGdaRNt7zwbYw4AvOVG6yQbALs0693po5JMHnUNj3k=;
 b=q51DV4Ux2KjexE1anDIM4NghT3BkMLDVZ4CT/mPlqU5oZY6BdGE5VJ7izNc0AlH8Bc
 tLacHRxZ3Tl3VprsxP24sTE35VeYDNjKLWpwO32MxTPKJ5Pg73eAWoOl3iHaTt4r7Uh1
 IQoTDbBkpaZUzsxCs50OP/HFoZKDla25VyX+GumoLxv6k2xFVhfVCQjO9BF+hQFqBnnh
 GDcuEvdf79QoMPzeSI8y8DDM9gSpUj4hDI2doxpq+Vq9UCR61fmqAglhgIjJl+iNxB4l
 gW6iQSbSrromFNZGq4jil3T0HOEpY1jMy8/xS38tOR9YaXoTvGoNDBuBdj1Qxr40nRDa
 oDcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIiQTqjAx57DWOVm1+j8OOUZjq+p+hRrXDHGPDyhjN+BLK9w2ut29mIwtV1AgJQ5Y57l6rpNLMj7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiGbNnlROzEozz1tVaXDO8MGa99chU9ZRtHzZTQACzkl1CpHp/
 D9lQXAz8q/nunH4pYTvpOHJ3qtrWgvtYzXUoMk12PY/vLlWfejtM/4KV0SX5kewe6QCnwxNc60Z
 4eA==
X-Gm-Gg: ASbGncu9Lt96rZ9Ib1PSxPB1Sb2+/lDlfdgFDmPMNET1fz9K+6RQg6ZTB6S96mDDvDB
 jwQkWeyOAR6AX76THJxdUmTBIXk4D1extMu09PpG5IxaZTXpLGxxwLFy6FaSLHK/yjstzl9ImtN
 6i0KurOAtk6+5rWh60alk8iumLpwATexkol0DxjYQmqaCqav6F7gODzs+ohsz06OxxK1HuzosGb
 7t+RZQrH48t/qxs6E3xkmsPfdqIv1YTne59kW+2zbKACD9k3r86vpVstvfT6E43T38b5EcD5V4M
 YG5YgfaTs3DonMXbBubPNnMdQ90SOdvc1F74/VgK6zbrsN6ZVQ2e6qdR9Cpaw6biU/93f/OzM9N
 TiMlnrYJQ
X-Google-Smtp-Source: AGHT+IEzK6o6OFjQT5j5mXVH+NLnYDEPNHMCqYEeUevxCkDyTtR0fGb5TZ4fS63zKhL+DbYURkLiEQ==
X-Received: by 2002:a05:651c:1142:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-30de02f7108mr36390301fa.36.1743433609954; 
 Mon, 31 Mar 2025 08:06:49 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2b59468sm15065791fa.103.2025.03.31.08.06.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 08:06:48 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so3595399e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGmStTvkVOiCxsokFhRZRKX6HvF/WGi5nH4gUXfsbQhIZHFhQotCy6cMN/dHru3d9aZo1rYj8a89I=@lists.freedesktop.org
X-Received: by 2002:a2e:9b05:0:b0:30d:626e:d03a with SMTP id
 38308e7fff4ca-30de02f8530mr27295971fa.34.1743433607807; Mon, 31 Mar 2025
 08:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
In-Reply-To: <20250331061838.167781-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Mar 2025 08:06:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
X-Gm-Features: AQ5f1JpNALqbXefbGr_-OhdG6T9nJRItrlLN0TLPzRg4IlCEn1c8nByQj4w1VJw
Message-ID: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
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

On Sun, Mar 30, 2025 at 11:18=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel =
*panel)
>
>         ret =3D boe_bf060y8m_aj0_on(boe);
>         if (ret < 0) {
> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
>                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
>                 return ret;

It's not new, but the error handling here looks wrong to me. Instead
of just returning after setting the GPIO, this should be turning off
the regulators, shouldn't it? That would mean adding a new error label
for turning off "BF060Y8M_VREG_VCI" and then jumping to that.

Given that we're already squeezing an error handling fix into this
patch, maybe it would make sense to add this one too (and, of course,
mention it in the commit message).

-Doug
