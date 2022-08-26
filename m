Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABE5A26F0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CCF10E661;
	Fri, 26 Aug 2022 11:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D776E10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:36:08 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w20so1726028edd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+nipqDE83bz9kAsEmPs1BnJkXrhpzhTufjYl4vfyxB4=;
 b=uZ12h1GgtOPIgJ/AIJpP9HkdiXFkQQ1Y7zcbHcaZY19jqhuQ0BbfA4uiuPSRJ/xwyf
 eM/Dz65/INoWt1IvJv4DWowDER430g3WyZC1WMXNIlttoQnD66Zo38bKlufMhF9/5hnd
 08jmIO0mB/jBaF8TLj3TiRGveHKqMZfb87rKebf8MZen4pL16Q3mcvqFqTs2Yu3ywqoE
 XuT1+oiMJFpceEsVy11nzHIbO4byPTps0BliuJM2yPgPlm02ENMh9hgj/l7sNHu1kdjy
 rpKyhhaYNzWx72P660eDckXioUX6DLzpDYx3LgEZMMG2WJyfT7IFDXUXtvP+Hdwb1wNp
 3Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+nipqDE83bz9kAsEmPs1BnJkXrhpzhTufjYl4vfyxB4=;
 b=iY0reUdLv1aBBQsNskD7b7wDQjMc0gOfKA3iHs6LlhRgmA526eWdYl2HRbTu+a0qrQ
 11E2QlhajvZwmjke2Po+wjW0anhpmM8MLxV6U/1mL2whqvCopjMBTFoaxyYtRUdUIBu0
 R8qTtOcFK4SXL09ar3jgCZSY0+5IX+dg8EjEDX6rA6Flx2nrdRgeTpuRZSS/b1WMU6h5
 cJProEPm7VTm7UMfCHR3UQqd2sIXTM4RaDaxk9CXgMgnLsv88b0LDV+dQhwn8ZDxwlzU
 34YeYuNDK44vyUltg7FfWnYSFzRXU+3GspkIZaCh+AxxK9MMx3t6mwDgZh/lqjCrJids
 xPjg==
X-Gm-Message-State: ACgBeo3LGU8KJWpF2ouGHC6LzSjVX3APYSxtkUbtHOGyMWAHWteuO7ap
 kO9byiDb0gyJzKQWvn6bDrCGJgb6IFa2vpJmhdgIx4LtUDQ=
X-Google-Smtp-Source: AA6agR61ESMoT8OYyz58vS1WLKSep5OBIH5VQ0wBD8aVOpeCMXZprL+ZTRi2Gkqgwd5ZJ844bPALN8pGsYIX/YrAG8g=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr6491715edb.133.1661513767322; Fri, 26
 Aug 2022 04:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220505215019.2332613-1-linus.walleij@linaro.org>
In-Reply-To: <20220505215019.2332613-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:35:56 +0200
Message-ID: <CACRpkdZKUGu_BCP1sUWU_-ObNuc9MhgO98WRi-6OT4Vv-VYibg@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Fix smatch warning
To: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 11:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The "ret" variable is ambiguously returning something that
> could be zero in the tve200_modeset_init() function, assign
> it an explicit error return code to make this unambiguous.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Would someone show mercy on this patch and review it so I
can apply it?

Dan maybe? If it solves the problem you reported.

Yours,
Linus Walleij
