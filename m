Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B956ACF068
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877910E867;
	Thu,  5 Jun 2025 13:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OpdKopXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202E110E882
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:26:06 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-32a72cb7e4dso10720171fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749129963; x=1749734763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
 b=OpdKopXkbtwXTHhDZ+ElmjPqIIBzdEqPmWE29iLwFBKRSxfAyytgD5Hny3yRA2+YgE
 NLcj5SMLP3lf4VZlyLyyYC39EQVFku81p03C/z4H6YudHd32iDhHV7hUMVb3SFKD1JWF
 cSc+1SeVk6t5voxYaO3NV+wICkc7oDreu8rRwzwzH+3lJzNck/WsrAchslR21B5MuI84
 YgJoyy9pPix/iDYDOz25B45Iq8p0XCkxQz0Nu9ZU1Dy02OPGj1+NbfjJvAUWvV43xUIu
 mwGzntXT4mKl8/IEeXz1LLpEg+8w+JcsJo0F+BT3JtsQVR5gGog1Mivx8BqTxy2Bo/ox
 GY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749129963; x=1749734763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
 b=w655MyjhhvukfTzCqDbNWgoQBSab8/rl25O7oVS/5lql/f1obn8tuIuy1byTITVl9L
 rCpn4itRS8y1YzXMAP25T5AUNGhx4mEzBovMXLM7Te8A6X2XQxz8N3XRt68uJ8rU5igB
 iwNgQ1ALdji67fDGMUOz/b1cXn1lgSe0icf6MvRyuRnLnq6RKtlrelDz9wQeYysdYgDy
 M4b2g5keTPQVKeQWWslR5F9Jne7fpgsS8emf4QgSImo77jZIWrnU8l/2DkENSgQhxJuy
 U1SfXSDJZYECFlQKeK1dJQqUSQ4PFRcKO0B4xfOOW1NmjVwAI8Jdfndldd6P0kfUFUqj
 agPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWlOdxm6FrZz+KwpeS8fIVM9v7WMF3tm0kBjLs1RWRntnB2uZZ8PIWXl7eHpSzxXi0l+jaKrm84cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxeo5g3GXZdojp9EfNySsf9ykF+XpoL/gRv5jRnATtYqIE0gyUa
 E5f4x5JfCYygTZpEf6sl90t7PF1TKuGT/Gxa3KUJgbf/6sTrLx9ozTNNIzirs+4VVDY0S1xeG+N
 NeipLymnGDYLSUv9cxCyWxSvOtm80HJWpmG7+RxECAg==
X-Gm-Gg: ASbGnctzn60s4rH5dOCHWFjQo8ugctUv/ZTh6A+iq5VzV16NPWmzrsWl08yIqR9EDjf
 e7XB5X07IBCBkwVs+H6j6DQUM5Yv1uf+ek3AJc2Tmyo5EoMjErtWUMkrIKbyaehUI+Einju6Ex4
 E/2PBObsN187e/Rlz8byGNfAj9wfNgYue6ZMc8av/ezRA=
X-Google-Smtp-Source: AGHT+IGzkG6Ev8DgBi85YJ8sl3jbCPXRA28i4r/pxYrAP5o+fCPD/kuEmxicVyoL2xsSDiMRi26UOm+0/MOqiRfdIq4=
X-Received: by 2002:a2e:a902:0:b0:32a:7a4d:9450 with SMTP id
 38308e7fff4ca-32ac72ac20fmr31835671fa.33.1749129962831; Thu, 05 Jun 2025
 06:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:50 +0200
X-Gm-Features: AX0GCFs01csf8csUF9o0pkVY61rk8HDa8aAw9AQmVv_cMVBcNF9E297jzPpGnpg
Message-ID: <CACRpkdYTXwhuAWHvpMNj1w3ekmPoRkXE2k5TnrWwB+hFjG9QUQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/46] panel/widechips-ws2401: Use refcounted
 allocation in place of devm_kzalloc()
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

On Fri, May 30, 2025 at 4:53=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
