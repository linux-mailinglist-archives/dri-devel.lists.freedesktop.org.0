Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933BFA54CD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194E10E1FC;
	Thu,  6 Mar 2025 14:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA6A10E1FC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:04:31 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-47519994f25so8494171cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269869; x=1741874669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVN3i5PuRzQd5GnIu45kxsywYrlcAkKHUI5lcUWEDuA=;
 b=RDN8PSDiNer/wK+2s/JlmyLOz9SN2nTtFwdKqL3aPgYBhfU12Vyaqklljc+Cu56GHY
 +H5ftBaP9uv1K69gBJEfM2Gd43Y//15hskg8MnxGBfmzv4U5a5DJzWQYEwUfijybbcVq
 mf37cFVlWGom6uv+7OxqtZ/39XU1n72K54yMqMgeVOuYKiZryFSE7tHCjJI/r0EQxbkb
 C7VLKOF4SeCHplxbMR052XPEGfOl1PPx7rRvRnBoJ95s9F4gLCz2I+6qxKIq+jJQGNpt
 9LlFl4pwFXWTT2IgL134HJfyOTbzrBGlAwU1PW9Z53hFStOs6HnsehRdrYqD+YVjv/I6
 Ac+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSBACca3ExaFPzEj+FDO8u5s0/mCL/wS4CCMStCtxuUON6RCOt6hDo/9NNO1U1pcTyKlKVJUGoOd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykbPIf22VvPmNRqJE8OoywRB6lwPEiIXY+CkFpt4of3KpNotOk
 xLiWAGQ1yh29ild1A3kdu5GgkSrsd9oML0U0tiswNEgDMvQtYc6T2X64fVnM
X-Gm-Gg: ASbGncsfTcUWXAcPLImpIr2j/py2Gp0PjlAMDzcPw7jjF+jXiDg4JFiuZD4j4PTXZlO
 KHS5sOjsZS2YwM35CEn8tHOAtfn2ZmbxB8oIqwmX9PrcdFcPPKYQ4+23Cvg0Wmp/kXm92p7U5eX
 JtcbKi//OvKgqgBzAVDlGOXkfraTozVLgJm0cmrrbBrwYge3Mk02UA/Jn+gmvT8DekhQTl4vYdB
 GosdLBElHX+CxMr7YHQe830fR1pI0M2Uxs5qoH0diVXU+hDTbW+2YfBk+C/xXMhw3RKHkSh1hFv
 42I8g0qWV1irmesFI3A9Oco8raRJEVnmR3sYX0RxDc2+Z2KSF69S2mmJVEMJoc1bXlio7QYt3Lh
 Elh1Nxdoxgno=
X-Google-Smtp-Source: AGHT+IHQsu0pmBNzSpt2Q4b8dJNQlQ7soR6QcpsF9uxB89hpAjxkqJyS4yMyL34Ud0cI03xPZj9Mug==
X-Received: by 2002:a05:622a:11c8:b0:475:999:21b4 with SMTP id
 d75a77b69052e-4750b4c94c1mr109764361cf.37.1741269867706; 
 Thu, 06 Mar 2025 06:04:27 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4751d94b1easm7771291cf.8.2025.03.06.06.04.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:04:27 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7c0155af484so98869085a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:04:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtsiK6P0Uu3ufVoXmcbQJOk3QNorP6MwYMWLGMzQYO0nQdIv8oLSN9Qq2G2gR2QKeW5INnhhCx+5s=@lists.freedesktop.org
X-Received: by 2002:a05:620a:8082:b0:7c3:bdce:d1f7 with SMTP id
 af79cd13be357-7c3d8eec180mr1208781785a.58.1741269867178; Thu, 06 Mar 2025
 06:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:04:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmfcJCc9eMYZkROYOsXnwZh9QCNHFzsRKiV41_Jcs=KA@mail.gmail.com>
X-Gm-Features: AQ5f1JrYPsfu25PIeNIu60xL2O69zif9ZzXRhar4BbB7hfkcOwb3D_-DKEmgPEo
Message-ID: <CAMuHMdUmfcJCc9eMYZkROYOsXnwZh9QCNHFzsRKiV41_Jcs=KA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, 18 Feb 2025 at 12:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Mali-G31 GPU node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
