Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D23B29DB6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 11:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5210E40C;
	Mon, 18 Aug 2025 09:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wTotU0ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618710E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:25:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-55ce5097638so3993398e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755509144; x=1756113944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wo4TENj/CKIqy8SYXhJJLguOY5BaEq786MRtklI+vUA=;
 b=wTotU0ffPinyqmpNS9hDERCey88kg8+q2gZ3CvVosKEJzQ/JN0OFDbh8OFemJ1OD3Y
 u9p53zh7Lt6bWMDQm72O0tnObGwmsNO50YFhWo1ESOZ4+ZnxmpWfqyVhRXrZqHq8m2rr
 8kFIPov+kb+Oa3EYwrshUFIA4/GJEmmKVqcU8r7a3FXllVk5RaGQ9cjSvm2Wr1aodY5j
 bgPWMI9iFbV7KEBYwf2sYJrUA33YMEnRlY6RNfOo7HrTONa3OnbNuY4VyVcG7+KDFEV0
 Ovau8SHLBbGcdiVMCmLKx+JxPp+vwCQL9dSCsih/2yti3pdd2jFSOTFvtdgWYnjnqOSl
 S/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755509144; x=1756113944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wo4TENj/CKIqy8SYXhJJLguOY5BaEq786MRtklI+vUA=;
 b=gLA9ex/cjXPv6vBtuYXAr6TOXJtp9SEmpffL+Antl12H6aHHZgekniV8Ho/k6f0Id2
 EcsXIBo8tR12eQGNYC3T5/CsUlzgxpVZzcXFdzEriXvxj2BQGRmnufdL1du2/cenX8NU
 s/DAMjHHXgtJtbiiLYrevFWUBxMTP3DzIZDpxc6EHdoaosIPOfJ7qzoiCceLeCaxa5WH
 7wAZHblbsgddl7QJ9Q0JKTjZJudb/DR92P6HSmi3OOMT52ZqBra5xfW0T008K6Rf87XF
 mu9ZdQvKCrWfUmwm8HPggDrNzj6rWYehmxrFbp4thtKDSy7kibHUzwODbE+RlLoTo7i2
 hAwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLbNKTCR6tjLv20Q32u6bqTot10Y6040XzV2gSDIi/dm3DSJUJ0oqTE5IZeIMxfE7VvUwFZ5LVxuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcGAC5IflLDw1kID6lr6Gz4DZJelNL7h96qfBO+VTNtsQuiW2r
 d4gjrUXe9GpaCZs6YlufmlX4yB7h//wZAgB9CFZR6cQGnPo26YAM2yw+JvxTTSJvxtJtzjSBq+y
 ECWcOrA02RtX+a5U/e4l64tUkSqk+CypnM76GVoWpXw==
X-Gm-Gg: ASbGncuztsRl5EBoDYzpBFq2fP82QW0qEkCr1kfQZrhQbJmsRje+Yk+0T+UpXqcc3tR
 LiZGKN5iMvrt124rlhZk07p1R1Sj66+Lh8wz81b+jn6TWymR2Pp4kLEcfi0FcBVf6SYj9/xHoPB
 bzsBFLXOizWA6OoS9GSMzYKw0NmIL+JAlL9fbYjG4QxcD67De5ozu85GT4U62W0b4bhiy4V2a9k
 AjjduI=
X-Google-Smtp-Source: AGHT+IHNbZouPA+9w/Eg1wGgKXMzUtJ39CaSfzmACFke7a6lYkpcnvTkjJpS7aaVbzjtwG3r/4970mFH4ZdlzWsxTU4=
X-Received: by 2002:a05:651c:555:b0:332:3691:a50b with SMTP id
 38308e7fff4ca-33409963f8fmr35371671fa.33.1755509144347; Mon, 18 Aug 2025
 02:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250730061748.1227643-1-me@brighamcampbell.com>
 <20250730061748.1227643-4-me@brighamcampbell.com>
In-Reply-To: <20250730061748.1227643-4-me@brighamcampbell.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:25:33 +0200
X-Gm-Features: Ac12FXysXacOEMS_v8Dyu_3gMUa5CFOxftr3HHbH5tzkVfiT0eAfebU-wggGo3w
Message-ID: <CACRpkdYZrBze=MrixPpp8psUus+i2h_iz7CPfYtRCjspVGC9_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel: novatek-nt35560: Clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
 jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, dianders@chromium.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 30, 2025 at 8:18=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:

> Update driver to use the "multi" variants of MIPI functions which
> facilitate improved error handling and cleaner driver code.
>
> Remove information from a comment which was made obsolete by commit
> 994ea402c767 ("drm/panel: Rename Sony ACX424 to Novatek NT35560"), which
> determined that this driver supports the Novatek NT35560 panel
> controller.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(Maybe this is applied already...)

Yours,
Linus Walleij
