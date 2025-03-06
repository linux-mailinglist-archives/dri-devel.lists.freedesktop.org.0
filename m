Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB103A54D1F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162FD10E935;
	Thu,  6 Mar 2025 14:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BC810E935
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:12:38 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6ddcff5a823so4350466d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741270357; x=1741875157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9w95l6741tt/4ainrJVSGUVwqtU9mkEIQhAfIpu6hIQ=;
 b=iMPmeJSxD8JQWssuIyETyRextkHL/VyNVMWRhJYxO6PlCanWJ5Xbv4Omv3OqYsS1Ed
 3EiKoiUDKw5VZsjadqpCY4a3lmXVlVwyGsX1UILGtXCMbU3Pd39Wd1caF0FX5rhMPzSX
 MdTsEG4ksK3wi/9H5B5YDJcT0h0eRdOK+TEoCVPCbtadrz7DRg9sIzyQyHPiU3x1Lp6w
 K+eu27oJYZctmetfrYR/PekjvdsvIHdbd9coZT1h+pQF8ZdLE4nlzivOohjMXodV56AE
 Z9CLVjeYnVsTjxWdF/vtMqzrVnCjvAF4T8j60TGuzvbE79JbnupxF4oAEdOggwWlxCu6
 oopQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvKVoPONgryG5aaCC+4KM319MiJnPWxWFVsprwkeZUgJBp92yjsY7uSWP2kFQPvey0Nk5IJYbrEqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiXiVeKQOY7J2FaCrE1R9SXqHwBF8+bPaDYsY0Rp8qXpcMnhck
 4OWmpH5gGOVuSMkRtMPafib/MrttXvCw5QveNWSiTGDh3WZqMrex/HPKkO9h
X-Gm-Gg: ASbGnct3aoQqvKyWSQrXMWPqRwcGxgQm8sNcnjIj50BeALbGqP+cGQvrM8b64No03A0
 Nwhw1Pzl3KFDpMQtuPdGo1evfmelpXaxy63S/UMazBbC42saqXYGVg/rMp1tuoBYoSa7xyKhveg
 ci9EcO6beeYRGTbrMgNthGhJ62R3n/7PBXXO2qNHCfga1mJ69qaKTLwZ4GK/9NKzfgZ5bzVOy2+
 fBKFB6fMWOGQRaEv2AAHv27hKbybtNffJGxcecSm9fWky4N7nRfme/OCZJAnxuNWN95Id7IvBDP
 lpcTx5LU4jYrcGe1+ptqZz4XUL7jB93e2A2vzrtQwCpp8kxlCxgpkCqkhLlapz0f70CAZsS8+Lh
 sDtqqa2Q=
X-Google-Smtp-Source: AGHT+IG4BnVi7vXsH/uGX/cSiX4ZZ7Pm0C0+VGl8cO6Z8z2PqTGlyWN3meNE73AiE3CeYcVpu3WCWg==
X-Received: by 2002:a05:6214:c28:b0:6e8:8934:337e with SMTP id
 6a1803df08f44-6e8e6daab83mr101078286d6.38.1741270357358; 
 Thu, 06 Mar 2025 06:12:37 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8f715b4fcsm7558986d6.78.2025.03.06.06.12.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:12:37 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6ddcff5a823so4349566d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBN0I2ACHm4F753nFpuV8/uz3VP5lqdj+54DdoCE6JqYDz6xxGGmvPehGgce7iEZzBartm1350Abo=@lists.freedesktop.org
X-Received: by 2002:a05:6214:5287:b0:6e6:683c:1e32 with SMTP id
 6a1803df08f44-6e8e6cfe364mr103086106d6.8.1741270353722; Thu, 06 Mar 2025
 06:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20250225210316.3043357-1-robh@kernel.org>
 <20250225210316.3043357-2-robh@kernel.org>
In-Reply-To: <20250225210316.3043357-2-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:12:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuTgOnTw_xXZ23-+RTvPxgQFpMQD=fPgu0CaeP2bQE2Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-7DXJEQQeg30O9jhmPV8jIkRv8kW6lNjjvAd7Gsc4GXS7ywNeuGDPxjI
Message-ID: <CAMuHMdVuTgOnTw_xXZ23-+RTvPxgQFpMQD=fPgu0CaeP2bQE2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: mitsubishi,aa104xd12: Adjust
 allowed and required properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 25 Feb 2025 at 22:03, Rob Herring (Arm) <robh@kernel.org> wrote:
> The Mitsubishi aa104xd12 panel requires an external backlight driver
> circuit, so allow the "backlight" property.
>
> There are users of this panel without a vcc-supply, so it shouldn't be
> required.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
