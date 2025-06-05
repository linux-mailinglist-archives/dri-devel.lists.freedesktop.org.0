Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52116ACF054
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F8210E894;
	Thu,  5 Jun 2025 13:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gk4ZSLgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728BA10E8F2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:24:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5533c562608so956286e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749129876; x=1749734676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=Gk4ZSLgVAXwGjCJbB5w0AVOejc8Z3LfodE3ogSlbCiBH3GIwtYmZrCioAFPGNYzx1e
 fIzCxuuhkUI4SXcjYTb7jXtKqExb7l4gMxxTolXvJj9d7HzEi788i622oYxU/HzPnkxL
 7XiZuu5sciuRTfXtiva7KIJ2gcSsqmmozGCspqcK0SAzMlGR/67URt3FBYTKXhEh6Fr1
 Ei66jMYEsTUjwj6BfHVtfKP/dR5rPT9bUp20LXC7uDsLpEwN+oSbc+ArY+wJp96IpHLJ
 rKh21xhxnVjZ3fXU+bWlBWQQftMlmxzF/uYTXQt6JbTqwzXXnJwutpkH/mjIOBrX+p2C
 udZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129876; x=1749734676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
 b=nh7qpAwJy0pI8j4ZUalXsmQlnP8CqqUEVVuXav/SMw3XB3yam5M1e18DEuFzjdvgqK
 QzUbYuItNNhD12saXAM/C5VAfPqWg0ofBuS9n5xBI1py8O5Zlvt+hzlmmv2SRQfNO1Mj
 EVK+vySGnNoWlZ6LOdGj6NcgU4tG6xai6WrfF9glDJecJzE+C+cWwXLJphzgChUmBGd6
 jWuj5WurdXYVnJlkpyt/B4xyMHqu2ar91ndgsI6YfylosT7YoScsHOi1YYqU5a2TRtVU
 WdYYE331sJcraL1tMNwIvjVKYv5QcnzT5cWW04aV3KEB+5JnHA+Zsvq0+EL1YvgWmceK
 zIZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlF9JnN9iii/XDywUcLdfpE9Wg5Vd6GUKXuUodhuSgNg9VoKqxZ/rCKISji0yLBFFxNuRTKiQ4n1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynAXGG89NQPbBRzfOUIeyngs+6eMRWAvCTES59JBU6ZJ1RUs0W
 JdAJs9Wa4WEfRaUSQNWts/uwuUl3VN4ZBAfDv13B4crC2gyZgUKIrAKCW40+hDl+5T/kszo9wyO
 b4ryXzDAf29EgTodLjhYawSiNz9TPITCKgiG5XdcNfg==
X-Gm-Gg: ASbGncv3fuIJsFh0qiuni1IhmQE41jXsgi9278cqrVo1+iCOYbfWO9+hG1vHhN3jMPo
 oFDDq61C1W5RnCXkOhK+fOUOGqjLmRcsG8qy6C+zj4FqK5V/lR+VLnwIVrCR1VHATcN7gg5UDJr
 O8ZiK8/GplqRv2tTc31qUbyRKliDA9hpGL
X-Google-Smtp-Source: AGHT+IHcFKkR1DgTHybFc9+cXkjDfNRWO9Y5rsQ/Vs78BAkzeGllU9ZiczF0eVkbFtRkeWxN8XAgTwUOdn8ciwJ5GKY=
X-Received: by 2002:a05:6512:4011:b0:553:26f6:bc01 with SMTP id
 2adb3069b0e04-55356e0492dmr1902010e87.53.1749129876416; Thu, 05 Jun 2025
 06:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:24 +0200
X-Gm-Features: AX0GCFv_P_oe8_LfoK0HrETyIz_pn_ODXYaiFB7vtLAilhJTNSsv4UaB2RLH_HU
Message-ID: <CACRpkdaFYcvq+XsQ6FocXqW-gnoP+66CL4hTiSQ=w0fc1jckig@mail.gmail.com>
Subject: Re: [PATCH v2 29/46] panel/sony-acx565akm: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
