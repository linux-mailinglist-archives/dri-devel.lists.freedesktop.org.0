Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8315A0BDB0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529F610E71F;
	Mon, 13 Jan 2025 16:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="apABHokL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793B10E721
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 16:37:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-540254357c8so4102220e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736786270; x=1737391070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggfsWvKVeX6voblu5KcqCZc4YpC78LY+7yJBPT00S+g=;
 b=apABHokLUQhSjfDTKxg82ZMcI/sR+BTqgFf2yLGESuSLxXdCIwOy7S1wFJyxGybmhR
 W04vXz+P4vidstqf1gHek3+jS6H7NJp3HdJxz3Qx0+NfHrk55QGsUk1fm0uNnxZt2Xhf
 gtjdEroVH0wdh99zQpjXDTgjbxLu+ap8KAYug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736786270; x=1737391070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ggfsWvKVeX6voblu5KcqCZc4YpC78LY+7yJBPT00S+g=;
 b=wXdvZfRo4xVqoDlYOOIwhJcwY0KjoFHaI98iqUTTnlhKCBdoDlGlTA6RNWq8SWjfCK
 Um73BBvbWLK5ucPukFLJz1Rm3rVpZKSKYdFTlAiOAAfb5yVIQbZoT7yKJIQBMqJeWlqo
 CsODoHOdYoWw61buJAXLTExOhjC3Se7+Z/x/MUKJQTAxsiLN+w+cxxt1QnzfVxiO7vf+
 qc/NyVicQziQiuOjyGLTUnzanlU5OK66eOBDZx564nRmjxfLnSZ9S5YYaRg6Z5QifHRi
 ysCkOrroZi6v/UNDFMs7vfBijmtKL1WStQ5F7LgSI6ZcuX8XAPgtYCFL3TCEtq04c2sV
 KAwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlF4qhdYpfHBIZkgXa4gA1gqRXabRyF7yxTkN8reUelFMBlZn1qARyMsyX+QzHvrRhqZBkHCVtAb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvVHIcHpQujd1Os5HM8dbHetxsYM1iorkOmb+MZHm9QejxJu2B
 1QaS7KBW1CT1UQDwJukYo52nnBSCjeF0eOhMmmjHfx5e//73N1R3dIGHyBxO5HAqQpznuBecZdO
 l2Q==
X-Gm-Gg: ASbGnctpF2PSLy9zle1wCqZEAHvyzhna8zpB9pblXaClII/uJDD47hJNJqqrYwCVvq+
 7rbLQrsQaJATEQCp0EMx5ucNXLz/GgRlJGXbyVL8fv8R79fFYUuY4a6OFv88Rz3YttGnj+ImjWr
 LVcw9s6SOXcN2GckILFz7bdBT9vqxvR2NQc2b7SfrfsM6q1DFrETdQtPIH/8+E95WbcNL4zGGt/
 7Tpf+k8/vrOFeoL39pMWsgokA7MCU2OMx2LCTZ/3If7dHYxPFMfDHhX8sm8Hv1dvfPTJ8rq7z1L
 GCDqiwy40m0Asg3cqIoZMfOi
X-Google-Smtp-Source: AGHT+IGaVAFRJBG046i15zreKYz7eIwHtH4ugh9O766E+s5Rht11Q6NpTgz/t8j1nGDqA5Y7FFMZKw==
X-Received: by 2002:a05:6512:1281:b0:540:3561:666f with SMTP id
 2adb3069b0e04-54284526e49mr7082123e87.20.1736786270448; 
 Mon, 13 Jan 2025 08:37:50 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6778sm1417422e87.131.2025.01.13.08.37.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 08:37:46 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30613037309so18775331fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7IGDaivMVFlDQZozVuRAIWMUuSuDFZAKXkNiNYDIMeTun62I1e5MrsUUFEfNDZJCVbnfiPUrQja0=@lists.freedesktop.org
X-Received: by 2002:a05:651c:2109:b0:300:3e1c:b8b1 with SMTP id
 38308e7fff4ca-305f45da72dmr92093451fa.18.1736786266119; Mon, 13 Jan 2025
 08:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20241227101913.1711071-1-yelangyan@huaqin.corp-partner.google.com>
 <CA++9cvomH1ozs_wyHWN=wKadXThZwMj29r=6tjEe_MRnXTqWkg@mail.gmail.com>
In-Reply-To: <CA++9cvomH1ozs_wyHWN=wKadXThZwMj29r=6tjEe_MRnXTqWkg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Jan 2025 08:37:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X9FpixqAJbxjhuAe2qt4L-OmOgtY6tSOqB6i12vzVLLw@mail.gmail.com>
X-Gm-Features: AbW1kvaltej-AXRtZ0ta47kQaaGiE5d8KJkxsWxmQe6QVguu_yF5pHi3jdeIDLU
Message-ID: <CAD=FV=X9FpixqAJbxjhuAe2qt4L-OmOgtY6tSOqB6i12vzVLLw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CSW MNB601LS1-3
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
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

On Mon, Jan 13, 2025 at 1:43=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> ---------- Forwarded message ---------
> From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> Date: Fri, Dec 27, 2024 at 6:19=E2=80=AFPM
> Subject: [PATCH] drm/panel-edp: Add CSW MNB601LS1-3
> To: <dianders@chromium.org>, <neil.armstrong@linaro.org>, <quic_jesszhan@=
quicinc.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <t=
zimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dri-devel@lis=
ts.freedesktop.org>, <linux-kernel@vger.kernel.org>
> Cc: <dianders@google.com>, Langyan Ye <yelangyan@huaqin.corp-partner.goog=
le.com>
>
>
> Add support for the CSW MNB601LS1-3, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 0e 77 03 11 00 00 00 00
> 00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
> 30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 42 36 30 31 4c 53 31 2d 33 0a 20 00 32
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add CSW MNB601LS1-3
      commit: 29e93d0a04b6c546a2557486029219e5f6146e65
