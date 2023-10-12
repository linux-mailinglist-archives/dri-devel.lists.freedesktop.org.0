Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C77C674A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8396210E433;
	Thu, 12 Oct 2023 07:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1A10E433
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:59:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-579de633419so8279397b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 00:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097589; x=1697702389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNdfcf5RJbVw3euD+r2W2z32tRPcDJdoEVJcQdZ60Yk=;
 b=GEBIoBWKw2BM+zJEGK2G1nl/K8wEYup6xsAmtLRcJd4gDhPFHCsSH9VbOMPHPnBW8+
 dIiCalG+x/F16x/DrfGsqxuQJLsw7sYPiqcyH9C3Hdp9PZ/9WTSwhEUWTMKhoOA4MlEl
 NyWr3Zo4vLiCX/WftR/7/NNhAkYDQ7uhKuqJIxUi/SHxNkUeaGaEIWGBmjxl2rLVZzuk
 bB3+HVbGZLrkfaRGmIuEZD4lAGPREpFiHx8AHej95KCcxoe7/ENBbsF2FE3AXe8YZLcT
 +YQiI4HikebSsH3wFoRWT8u7OosuHagXF2NL5RZw7yziZt7d0J/Xq8JGANQlf+Ik6/0F
 nB3A==
X-Gm-Message-State: AOJu0YyXFlMMvmnZjpO+BfH2Y/vEOfY6CE9fYTjDl+gCY+/nOMaEn9xW
 13Gj92eXLeH3LOOQFYOUMwWD9KvLmomMDQ==
X-Google-Smtp-Source: AGHT+IHvx+glfwUrLnOHb2PS2YuHs5nAdblHKp1oVM0mMz06/eqzluxaH6E84A0oFd6p8rtQpq4amQ==
X-Received: by 2002:a0d:db11:0:b0:5a7:e400:b23b with SMTP id
 d17-20020a0ddb11000000b005a7e400b23bmr3725528ywe.5.1697097589094; 
 Thu, 12 Oct 2023 00:59:49 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 u84-20020a816057000000b00583803487ccsm5737713ywb.122.2023.10.12.00.59.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 00:59:48 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5a7af20c488so8392367b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 00:59:48 -0700 (PDT)
X-Received: by 2002:a0d:cb49:0:b0:5a7:c97e:39e3 with SMTP id
 n70-20020a0dcb49000000b005a7c97e39e3mr6477357ywd.15.1697097587925; Thu, 12
 Oct 2023 00:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-6-javierm@redhat.com>
In-Reply-To: <20231012065822.1007930-6-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 09:59:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR=aM-fr6SLfZMyA-Mdw23Tv+rX-iQQmw5u5U3vW5Ajg@mail.gmail.com>
Message-ID: <CAMuHMdVR=aM-fr6SLfZMyA-Mdw23Tv+rX-iQQmw5u5U3vW5Ajg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: Split common Solomon
 properties in their own schema
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Oct 12, 2023 at 8:58=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> There are DT properties that can be shared across different Solomon OLED
> Display Controller families. Split them into a separate common schema to
> avoid these properties to be duplicated in different DT bindings schemas.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> (no changes since v1)

New patch in v2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
