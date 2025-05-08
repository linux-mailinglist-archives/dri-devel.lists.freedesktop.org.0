Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B0AAFA2B
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DF810E180;
	Thu,  8 May 2025 12:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yh8gl7GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17310E180
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:38:52 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30db1bc464dso8729421fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746707930; x=1747312730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym/GGePTtcR6pPbHuXLLIC6Kw58vqtqImYgRJwNLr5w=;
 b=yh8gl7GItuwac9hhgQu/rSYrYyynvvXStgfOh/o6buZd0i5ztKXlMWR7maVO0QrAlT
 yT1oF46Aj/duJwopCxsIucHFSsHeuXOlhof1fnciQ3Q2RRLLC/YGMysWDisGa/Hd9aVu
 dRIt/ALovtlcUy44OYq6V1FT16GWECNAqesBtJHgB6OTUS4iaDV0WT/fNGJJphYLK6SV
 HQam9bZdKvOrYE0FUnA78s2Vi3wARrQ+DyXBT1Ckidw4jiKR78yxPAaauXIbS66WcUUG
 bGf/80sCLCYFnxgeczReu97l3CWpU80VDd3QpO/LywmN/kEvfhZnRqfpKnGltIg2I2b8
 nhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746707930; x=1747312730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym/GGePTtcR6pPbHuXLLIC6Kw58vqtqImYgRJwNLr5w=;
 b=wbO52w0OLj9zMkafZyc7z/pfy9j0dy52mpvW7Yl67Ye0fT8RlSNfwUbWWSbwp7CkRk
 k1ptmM+S3KCryA60ayso+EqDM+n6ogjJZA3gRY5wpm6w6ow1P80yeu87Cq6x0J1VYgle
 zu/LS8ARQQn3vlSWveXvim21AUe8oYb+/9CX1dALYAyuGTS0NBha0yksm1Z3sUenpcog
 Q5wX5SDMRwcTDbsYryjtkyTT5D751QXidhndjk5l/mTkOHlRVHFUghJ1i4kvYTbOXsgU
 6wgITjOfKgBYuv4tiCCDtzwjenmxSiI0wW/UKej94GsifEoZidnhze8esKm9jxK2k1lJ
 C8FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuGJ4bLo2SN60pmJaz92OFnpQJUaoHKbpu3sYcASkOf23reqAKGakWNSfumvMfixIoDin8fVaFY94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCq7+jMLUBmut9GvpPih6iB1AmlwCfdnQKPEBTL0aOhsLtf1kJ
 Liclya8ZY56VmMeKgNkFFi7nJSuCj+jZ1H/RsjhWz36bPoyJUDmLgSKmsV44tEwV/Islv/RQxuP
 kX/aCM/rP4SE+ogRBYvA+9G5/WF+A1tV9mzeEHg==
X-Gm-Gg: ASbGncsAg9pLduQgP2rPE8wncCV032FEkBhnFv0745Ids3TmxusU5YzTM/v/Lk/uGSK
 zNi4S/m2/ZFUEd8+9Vau0LuSZhIq7Uc7815SKk3aDmGWNkZOxeXMyh+mTadn4MpAJP9W04RsapU
 7gC28D6CN5BDw+H2XNuuZCwA==
X-Google-Smtp-Source: AGHT+IGJqMyrmkCUIQDg8PE9y89S4un8Sptn+ne9CkBnqLfvsuKGyDCGNoAKWRWwcnckQHjTgl6OjpG8jsiCqQsITZg=
X-Received: by 2002:a2e:b893:0:b0:30b:d543:5a71 with SMTP id
 38308e7fff4ca-326ad17460dmr28868011fa.1.1746707930459; Thu, 08 May 2025
 05:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250506092718.106088-1-clamor95@gmail.com>
 <20250506092718.106088-2-clamor95@gmail.com>
In-Reply-To: <20250506092718.106088-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 May 2025 14:38:39 +0200
X-Gm-Features: ATxdqUHd6nS8kMJuc0f8MXMDIRZHhCR46AYmqFnKzqCQqTYWz7YZni31Y68Ocio
Message-ID: <CACRpkdZCv2RV1ioXsuJnLHsiErbrfv5jjzvPWMire94+OznY2g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document Renesas
 R61307 based DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, May 6, 2025 at 11:27=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:

> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

I see you have gone the extra mile and deduced the underlying
display controller, excellent work.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
