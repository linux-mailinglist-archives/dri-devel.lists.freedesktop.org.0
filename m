Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75310BA2E1E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AA210E9EA;
	Fri, 26 Sep 2025 08:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D410E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:07:09 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5565a83f796so1486200137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758874028; x=1759478828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Y6mmsY7MXr31Xv2Qe0va5N8gIEzgHjRMpmqLSakzNQ=;
 b=ckvZmmI6jVFiUmA0GS+DQ3Th6i6H1YblwrabOe28R3iwdAvP/vlk1PBDIFO7In0BUG
 z/lyJmoLlVYPtYgZqBnqwiMLtfboEhph5dzHqrZb6asOv/LJDq6CMEzl/iiRlKrzB8ih
 6TLMmwi+CSXJmVZyMpNpq1U3BUkpY0iownNC3ONVsHsOWavfUlkC6IoUvc/yezpO8dq9
 wRtbi16ZZjZjuGvKWLkRV/NkP+ITnHuRg+VR432VbXyw7HK6hYvplgiilvfiOl0ayA+s
 Y/nHrpPv5j3dX4YlnY1Y1YwUrYNp6m49MLD4QGnEpaa17mgabt0NzwiTc4+84TSGgrpK
 6+6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfnQG7DaD+sObOv8qBkEge2YBfdpjTK2EFWIEmUg5q3sxEkIpjPK8OgO8a+wcvvtpV1irlHlsQGzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb4Yl4WqtkJQC2hJU37ECmiZ/JOn77iJwRv2L08tNh4EdSlsw6
 WtsTyYJHODMtzTn4d/ni/31W7K+huystT7SPms14C/pbOAS/Z5RuweRxj34H/DB+
X-Gm-Gg: ASbGncv5yxlMhT8/r9SdeUqjdF6dGMrpmfO0W6U4qJkDhGpbwT1/ejV2JRq1EgZ7vul
 4R4TkPUXYuJagRbPLNS8Ij7TM5sc+omFQ/a6CdkQd8n7903qBsCNfrHDtl4nGmacacwRT4w0cCz
 T+NKyP24wu6PYxpJ9UqeySzZ+x5TAcbcvjp2Pjja125x/dnSZYhiMDAndgu6f6g/s7usTS/TjCa
 eq/VZt8yXZ11wXfWttGZxxe9NDCbc78Nkdlm43SL0v3Z2BI0ugoh58hD5JnPA4GVx2EFerTVp0k
 8UkU0q/9axlSeuZNiiC+Y5TQbvCpf9WbkT5eYJfBzpg2OGghDg84bIgfawoHaRJc0UAbPXXdcpI
 Tapxhl/Cwgq/+YGbJEY40WKzdWbqG3f999M/c4DgSKiy0nez8J2QWodO9SN7A5QQlIxjMFC3wX+
 o=
X-Google-Smtp-Source: AGHT+IHHbRfNjtQqfBESzWPgWbxehIa1Pwr4MWSCsnJqcF7w0/pziak/wDs13W45W9DwQkr3z5fNYg==
X-Received: by 2002:a05:6102:a52:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-5ae176d25femr2261453137.4.1758874028478; 
 Fri, 26 Sep 2025 01:07:08 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5b5c08f10ecsm178411137.3.2025.09.26.01.07.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:07:08 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-54aa6a0babeso2023464e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:07:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrlX1YuW+HAjt5A22ee6pStCv29oQH/c2JgoXZg1h1UGbLB5qaMDwVbG/lk4FxcRj0PWOidxfaivo=@lists.freedesktop.org
X-Received: by 2002:a05:6122:631a:10b0:54a:8ad3:7b5 with SMTP id
 71dfb90a1353d-54bed435b3bmr1938139e0c.1.1758874027425; Fri, 26 Sep 2025
 01:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
 <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
In-Reply-To: <3006bc88689b2e04785cef6bd9cf4142ed123ee4@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:06:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMx65Y9vTUzCs2QpTSiehoK3x575YtSoX-D8jWAbVWoA@mail.gmail.com>
X-Gm-Features: AS18NWCsdFmtJXpOQtfe78deHc6xL2Pl8YRfLn_hl8Z6ulTifGGwIO6-C7uoGoo
Message-ID: <CAMuHMdVMx65Y9vTUzCs2QpTSiehoK3x575YtSoX-D8jWAbVWoA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/rcar-du: dsi: Convert register bits to
 BIT()/GENMASK() macros
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
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

Hi Jani,

On Fri, 26 Sept 2025 at 09:58, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 24 Sep 2025, Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > Convert register bits to BIT() macro and bitfields to GENMASK()/FIELD_PREP() macros.
> > Most of this patchset is boring mechanical conversion.
>
> I suggest using the relatively new sized BIT_U32() and GENMASK_U32(), or
> other sizes if your register sizes are different. You'll get better
> compile time protection against mistakes, and sometimes the unsigned
> long type of plain BIT() and GENMASK() can be annoying.

Thank you, I wasn't aware of these new macros!

As the commits introducing them do not have Link:-tags, here is a
link to the full patches series that introduced them:
"[PATCH v8 0/6] bits: Fixed-type GENMASK_U*() and BIT_U*()"
https://lore.kernel.org/20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
