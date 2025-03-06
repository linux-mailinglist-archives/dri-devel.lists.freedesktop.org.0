Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1969A54CE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EB710E998;
	Thu,  6 Mar 2025 14:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648510E998
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:05:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4750ca77db0so2939771cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269903; x=1741874703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvdtDEC9XOZ4SiNShBFndqkvatMXAPv3rT5wVsIIH7w=;
 b=C53veKH2/mcvE8+bwgjuhKfqCZ+n1phlQSyTeoOC6ihRBiVCXuPsEo8vfh6scsVCjo
 E/G6M2nTVdIR2bOjr2FIGUP5ri75E0PRv6iIYZt5r15XKjZJq+ausJabQeRM9afyPkW6
 ISSuFL5iCDM5MJ2t36vayAJC8u2jL4KaZMiOmb62qs4am5J4tQQP9DzCpNffo+CxuW6Z
 wKlpJjQXaPwYU+wJ/nLJIrt19Gz9GMxoiihzujqZi/TKxdz8uxb/t4cMLtreb0kPkc0z
 BIs5eQz42suLe8ZNQ4G8864t69Ed/MDiKN0ayu1Zkv5JUyQwM924fB+mzSstkI2y5wge
 LdjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvfXUe8PmV2yYYYmswVxGCJPkbhaCqtNFTUpQD7+Of/h/mMDAR56vkWS0HdA90D6p9MQf1gxd4l9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTZBzQrUn7VgF28iHp48mj5Z++UhHlugUezvrBITDuTp8uc8uO
 vK48ciaap0KYT7om+EBEl3BZfO1A46ad/DPlgzGbH7GjMjtjuNUTq3oPdAnP
X-Gm-Gg: ASbGncvW7TOGhnTRnQkRVv3ysoqw+p0mZ3LAhRtYvu5GidY76vlj/Fhg0B2vMZz2TxR
 Cu6L3YJtr76kmKqKJ/bQrEBLHxjDadatwEoFwcEDEMTuPeoxb8srftnflcFdVdy2wvMKbhtT2/t
 AE7jc3PD3QI+oPUYgmUsMVPowlIx6QuZgSHnVq7lMt9hLW07CLhb5RmWp51kgWcP6YQ9+PQCw6r
 fbLm6A4jKCUOaLQMx96y3jvXgmjrcaGFukDndXHoWtSxVdXRLVYlTu5PYblNB6ZEGgutuB+XU0D
 +aQpRt8dXMjh/FOEgsf30OdmyyWwvkMP70HEr09s32LzpAlB97SjPzFog2DCZjwXNU3W+RgOLe4
 UIlHSfHwPhGk=
X-Google-Smtp-Source: AGHT+IHEFvbZ3cEqG0DoO0vSylFPwO21jmkshuQxmL44Lmt7rCNDSYxF7D/hu3VwG1Ols0InMM1Eww==
X-Received: by 2002:a05:6214:1d28:b0:6e8:9dfa:d934 with SMTP id
 6a1803df08f44-6e8e6d9422amr97817376d6.42.1741269903200; 
 Thu, 06 Mar 2025 06:05:03 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8f70a4eb7sm7489276d6.58.2025.03.06.06.05.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:05:02 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-47509ac80cbso2415211cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVL08Xpoxgy3ehpqxb4S7No/9Wap/Dli92JYJtUcToh3oJ3TON9qCh5emaaIpFwkmG9ZtmjLaugvoY=@lists.freedesktop.org
X-Received: by 2002:a05:622a:4f:b0:474:dc44:28c4 with SMTP id
 d75a77b69052e-4750b4d3938mr107138931cf.38.1741269902594; Thu, 06 Mar 2025
 06:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:04:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUN-wGtZPZMOKjK9jLoG4v36XWON-G-1x01vk+pX3bsXw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr5FGGmyRUsY7dF6NNrna-C1X_Xx4h4D0DCZ6Sms6J1TfoVs9ByrC17zCQ
Message-ID: <CAMuHMdUN-wGtZPZMOKjK9jLoG4v36XWON-G-1x01vk+pX3bsXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 Mali-G31
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
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable Mali-G31 (GPU) node on EVK board.
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
