Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B47ABB0EE
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5B410E0C6;
	Sun, 18 May 2025 16:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF7A10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:46:29 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-861525e9b0aso290979539f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747586784; x=1748191584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H8auBAsWmzOyx9AlQEKXQW3lYZT3R7zY1mzxA5CFuTA=;
 b=rPcADgHCLgyhms3sU4hdnfSBtJIwu/d5jNAUUwPQrpkFYTSe7bPE+ZOKFRvjbQ3LJi
 dx1GMjARU8P6ViTHJN3HXOxZzI1fJ/iGNDCwG1Yc+ay0lRSrmLgxL9+MnjLXG01Tg46Z
 F12YZnHauUoiAOyL85M9iRR/+Sr6SQtjOAfNmTJCSCSpQCFMe97ho7WHt5XD9TEiNSM0
 hQV2VqyoUbzGj2gAtema4qBvb79Xub+EXREZ7mURawG6BKXjSlQsKvhVsZgg7RxZXfUF
 kU/5a2DA/4Nz++LNNXf8QTbnrouq1j2BmjcWVh6M0tYIF6f81qJWunap4cx0662+krhj
 VCUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTIJBocA/ygQofn/fLUWuiDZcZhYQG5j6nPyZhLz+YbAGJwr1zZuKIYavK/DvypS2/jzXJdEXnYhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywFMJJlwazWi/wJwyDOjHGnoRaHmQFfkUXYOh7+BF66SD6O8cv
 PZO1cJmA1JdqZkTSwZj/UGToHoGSyeFLNYrvEPHe2XkMwnReE9a6uT+VhpImjk2NC48=
X-Gm-Gg: ASbGncssscILFfqaoQ30iJLqmQOQXLIDCSwt76rOmdAQVoJ+bX7UJU2NW2NULmbJ7rN
 6tOEEL41FDpIf1rwEdV6wqaPptL6cKmd7J6nnQwd8B5mAwS0+sFx+nkO7WQuijj58yK+dXb77FM
 UD+KDiVJpo2FhnAUVuN7dRiqGCIiHwfK4ICZhW4sFenc/YALasY8FTblUHilbjryXpaFOLOuoca
 Dk5B0e2HRqn1/jqI1CmZJopyEqnKc3IM8NoIZyREc6VidFnbcyROS/uUXzftm840cnTyz0de02t
 EjcBvboogVH9I3imMIP9ANDvDBtDAzvCi2sZJor8JuNuJv8BQKpcd4NrrHGThf6koLCa14XsAt2
 m69lWaLVC
X-Google-Smtp-Source: AGHT+IH3Iaudi0g3tDaoS5jgD+XGcFYjtnR7rGxe304Fz16t83X+6YWWncOa2QXHH6Mn/qGWvhdhvw==
X-Received: by 2002:a05:6e02:b4a:b0:3da:7cbe:f47b with SMTP id
 e9e14a558f8ab-3db843348fbmr108941265ab.21.1747586783683; 
 Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3db843d471fsm15500965ab.10.2025.05.18.09.46.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:46:23 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3da73df6c4eso33241685ab.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:46:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvcGU+aF6GPBjRZfP8PdgD29QsV9MtCGpAsilCw5a0eu4oSCSOAclh9q++LpDEn6r/WTQ1wfd9ox8=@lists.freedesktop.org
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id
 e9e14a558f8ab-3db84296d9amr115461995ab.5.1747586782845; Sun, 18 May 2025
 09:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-8-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-8-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:46:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
X-Gm-Features: AX0GCFt32y8vwGnO09UOLDY6RStkxid4HewGHZjKOLQgFiYtO_lDbLwjct7FmIQ
Message-ID: <CAGb2v66Lw9bne9Zch4kyAbWx4Zz=VPh3EJAta0M6XxdaSi-d7w@mail.gmail.com>
Subject: Re: [PATCH v11 7/8] drm: sun4i: de33: vi_scaler: add Display Engine
 3.3 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
>
> Enable support for this scaler.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
