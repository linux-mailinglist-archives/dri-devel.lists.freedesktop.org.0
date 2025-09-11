Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2DB535B8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDAA10EB56;
	Thu, 11 Sep 2025 14:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A610EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 14:38:04 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-80a59f06a4fso115663485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757601484; x=1758206284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hiuhbKCWVVhxdsKroAmlHWewkQOhNypPZ4OriaNJghs=;
 b=cFPS5bpHNi4tB2+eSywGEiKbGmF0SNZmFFE6nBVAYTVlw4zlfZfmtFK4Kljv68BE8Y
 6ctUkgurLZCZeRdYhgScsQud20XKOpHQjrGXxbsadsZCst27R3OAAa38h02CuNERpLWa
 wMO0p1qpxtjDn3T78Op7IsyzttC41aaDLzQ/Idrm4FuFA3GgshgF3F5gjc1w7tedVmpR
 Bc+kgHyU+soFHLtennUy+OFAengx37wT3HsKL38t4jIPM3vAA97sku2+Nyibr71CFEH+
 SM3V0vLIri/TyNKlLqvZp/H8EO6UrNRa/pc7mNU+daQIgAduErkNGxp/j4aWv0Hnh1EB
 pk9A==
X-Gm-Message-State: AOJu0Yzclu0eGIjr3dvFVtcwYRTZ6Lbd8zcvaE52uEHlkkfnyVB+MdYt
 JoxKotgVmoRZJEl7Pa76TNkmZWtUZ5bupIhtayHKPCnyqeirhNKyaBSLRHvI4vn6
X-Gm-Gg: ASbGncvBlAXLjHoQBW3Cr5UGUyk4M+VdFgmao0KEhEO6E/Ol7soQ1+IbzhCC1i4/Iu1
 DqODuky9kaQgwMY4K2I4wEkiOYaa5cUfm65jWLSJQeHDVCZnbg3NzCNLjHFuV08PdfLgPqSElDx
 1jf6X60gRJNAUOMsio0slZgHPBADojaDImQkJ1ETUOIl5ewOQMEosOFryzp9dLWBhQa7TKlAWEA
 uOcGlKYNW13aFF2fm+Bc4GQOC6KQNyRpeQBv5c4WILYZnIhMiTZKsTXeJadBGL7dZlgbMifpqnj
 1a3PlwvgIttO036pzYOf6zBDIW0frdwDwYq+8+WXqMvtE/OYasv9FBJqj3XbmZBl9iqqSHlzqMc
 sVX+XTpUaCtEfPwX9sZC/+tRKKWLV7gq8iBB5vhUJnfgk3uUd53g6dEhpldbIQcTwdYF34gZxXt
 4=
X-Google-Smtp-Source: AGHT+IHXr3zjSnuYK96sGmHvm1SZ5e/wf0kmwM3C8YuQGEH2wBAiM9ngKvXvOke/AIik8097yb+LvA==
X-Received: by 2002:a05:620a:2889:b0:816:c37e:452 with SMTP id
 af79cd13be357-816c37e0c1emr1494275285a.79.1757601483292; 
 Thu, 11 Sep 2025 07:38:03 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
 [209.85.222.177]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-820c974c303sm113612785a.15.2025.09.11.07.38.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 07:38:03 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-81076e81a23so95984485a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:38:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3e04:b0:527:4113:6ad6 with SMTP id
 ada2fe7eead31-53d0dfbd7e7mr5509483137.9.1757601170806; Thu, 11 Sep 2025
 07:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:32:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMZ2rexeLrJsL9CNh_uG+1eHJndG=bn8K3_yRUNURXqg@mail.gmail.com>
X-Gm-Features: AS18NWCyQKXgN_PFlTPOYFuyv0ojGKrxYAZJ8mJkuqXIyr4JRZyFSZyPUiP0jDo
Message-ID: <CAMuHMdVMZ2rexeLrJsL9CNh_uG+1eHJndG=bn8K3_yRUNURXqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@
 to dsi@
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Thu, 4 Sept 2025 at 23:02, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Rename dsi-encoder@ node to dsi@ node to follow node name pattern
> in Documentation/devicetree/bindings/display/dsi-controller.yaml .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, combined with the previous
patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
