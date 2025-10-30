Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7BC1F135
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18D510E930;
	Thu, 30 Oct 2025 08:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="eI1oDLut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAEB10E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:19:50 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88025eb208bso429316d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761812389; x=1762417189;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4GGA8C+qC7scQxhEzEwo/Uv+6XLnYJQPV015WHzIvo=;
 b=eI1oDLut0YcyyZll7o0+XsakYs95s16dfDgpaUOv8Yw4Mgbz3tyfrC+dBwlh8RPCia
 ivtk3ZLFgIxJoac6XcSGpiZxxBDDvjfXbaNfG/OZ5vpG+YXUiMcm3Zwg6SkKU7AR1pZL
 2ivkn2ZIh6X+2uaGh60N+fmcg/UOFJ5T/vme5sydAVWF4REZIbHVpGCg7cz/SNQhsOoJ
 zdAjJe6yx2T2lr5NP7M2SAvbP4i70e8lm3LRjO3H4tIqlk+tCg8Sg/pwnupqLOmAl2N8
 KWalkySZkU1NhAOQY2JxdjhxkSA60lAmyfXEBGZdB6zpv8XfDaPszheCDchploOkb11A
 /YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812389; x=1762417189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4GGA8C+qC7scQxhEzEwo/Uv+6XLnYJQPV015WHzIvo=;
 b=F/TEbfMois+2jyPVqfURVKAPm6M3f/KvFLNI+UmFfkiU1GMf/2GbisITApy6d5IzFk
 1hGwlEmQJGTOrbc/fIfXT5+HYVulUrPJnyoYvKkvGWapKjY8RmzD6vh5lMNuhEYkf1PI
 7sG8xE3p44dJHvQwrPkk9riCe6DS9dPR9bMqctKuADoZw6Q1I6dkvnxCp1LFVBta9dyX
 GKj1ew4+NkJbmlEHhDnJr07+RY4LRLlAzq6Q+f2ZbA7RNXgOFH8PP5T2wx/fZ+JCOxQb
 DJ5gVxBcMNBtnufYJIIRSZIZdRgeD7RfrJsCgOFbYsjMT3cdtWGWxjfusW3QXSzGnNkI
 Hm9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBupWPi2hDhhhLoEAoC7Us14Cb2085360ja9LK/XlV5MF3VT96PbIe2LHMst7oaRmbGWqjL76rySE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxpawCfk5zjkwQlK1oApSOcgwRwQaUQ/4EbyXMSZz2zz53yn9h
 M5Zhn3Dwp5NlONlRaf/E54HQPi9T6aW2fqOweJu9eELY6SCFCz5VecjPZRUigqgOP2hCK459HtO
 x2JK1JCH1pgZmmi1rpOiBTFN6hU1J7lghXXCph3zRQQ==
X-Gm-Gg: ASbGnctWdowWQNea8SrcjoOxlNTopyu3IM6h9zYzqlTI6r/gYxuRp95Unp9rMDGaNlI
 vwLUhvUssXVWeEUTOpvoEvUA7gc2yEVSg/pYPQ8iqAYbKRbICZqt3RhXS53DLPQFmvlH+YH+gp6
 Iy0pGVMoQMdSAci+XJeIDSMu1DRnP5yq7ZGtO781yYUWA5UMqbvpPQXlOH0TIFo+4I71aPAqwIm
 C/IFAVLaB7UePSlFmGr2nI7MqjvffJWuZSrsINAM3RTdvL5pDBgjWr4mm/x8g==
X-Google-Smtp-Source: AGHT+IHKzySlh2xWjemjoRxA6aM24KBgvKC6QJyiKtCgLvO8M5KIMZs6/sRSPGVe6C1H6y5uA+B4ZPDxG0J76bunyP0=
X-Received: by 2002:a05:6214:2023:b0:87c:2bb6:741 with SMTP id
 6a1803df08f44-88009b34e02mr75373716d6.29.1761812389033; Thu, 30 Oct 2025
 01:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
In-Reply-To: <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Thu, 30 Oct 2025 16:19:38 +0800
X-Gm-Features: AWmQ_bn2Qk2jFJLn5w35Gc8DD2H6IZiJTPJVsyZgXXmXukoxzjMCmpAu4IXuxtU
Message-ID: <CALprXBYk5YE+bwKToKPez=QGv=KeJOwAgpCFxjhxdg4vAGNquQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for generic
 edp
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com, 
 Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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

Hi Doug,

On Thu, Oct 30, 2025 at 7:21=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:

> At first I was thinking that the quirks in "drm_edid.c" were probably
> just for "DP" display, but then I just realized that they probably
> also are for "eDP" panels. Specifically I think Intel hardware doesn't
> use panel-edp.c so I think the only place quirks could get applied (if
> an eDP panel was also used on Intel hardware) was from "drm_edid.c".
>
> Any chance you could confirm if EDID_QUIRK_FORCE_6BPC works for you?

The following quirks added in drm_edid.c is workable,
+       /* Sharp LQ116M1JW10 reports 8 bpc and it  will display noise,
but display noiseless as 6 bpc  */
+       EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),

I will send upstream a new patch for modifying the drm_edid.c , thank
you so much
