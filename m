Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C3A572CD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 21:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0910EAF1;
	Fri,  7 Mar 2025 20:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jeBGnTGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462110EA6F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 20:11:40 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6f74b78df93so22865907b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 12:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741378299; x=1741983099; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fl996EB/BPN5hEnQtgwscpPDmaZ06UU290EobaQCcK4=;
 b=jeBGnTGgN9QPWX6Sdw6MTD4bCwNkpxPORx06KkF1nBCxaRHny5IBFzS+yok2xL2zTP
 g/CHkBsqV/rYykfH9vuCYdiwi1+IVzFP8ucGgX36MOnosxHlROYieYBLKM1xYM60CPTr
 W7w9a2SfH4vp8sy7XR8oqwA3ZBnAT46yCROJnxqyvKI1dZd36fzhn1nr7e4+0oBFTbkj
 SbKHE6VNdfVXkNHTEZQU06gWRpzUmcmyjFFP7rt7gtl/Zpz8fS8UC+2XH6l/uIgtqk4C
 XA/oAaSLzfqOQuXGSSAk12ldX0trKX1Ey8KhCNbnGY3/hDde6Hh3DsTB6xB5PgI10n/W
 hxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741378299; x=1741983099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fl996EB/BPN5hEnQtgwscpPDmaZ06UU290EobaQCcK4=;
 b=taNc1jJlq9WFFfL/gNguAXdQ7m6ya61I+4eAMzRPqSxvAE6kkVjH2plodLmKe6pDV6
 UTDzBL8Wvw/20+d9Yp+KOywJjoJUDoxx5/AzHgoD4VD2EMcyQpxALeSQqHue4AvvJWzH
 DoOdXcswg1S+CTLy9txN4ijq6Q0lFwSgEZTRL10JAOhlc3T+A4qiEba/dSxpzEDJewOa
 3mU1qj43QK5xRAiP3g2jDm7ZYM7L0uZFrK0CrgBa0NMiTUusOKamMEAYn3pETjcKlBGs
 vCKalM+tK56UugkDd0YDrZlxf9BMgME9SNiFScM1XFK9ZEJPxWj2VklESGSJMAJ/FIXW
 3vTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8UD79omwuX3Lw9qlqgCtumDUaxuOoIRBUqN/CWjMRYg36V2iVwZe7L4pNW+YVnKlutQuiVNqCwtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH+LYDzW5OPz9UuY1D1PjgDm9ze/EYkYZWM3yZPVqMOX6tlRPL
 5npe8B+Y2pkUI03upsi663cjtA9Ai829wib0VprNY2ow2wG/vSiVr0f8MRLs25SJ6MCeZ0lmjEm
 NdNRtzgU2e7YDVY0owaAEpLOScattxx2I
X-Gm-Gg: ASbGnctNYZ13AHuWKhw4adsGvi5t8FxlSHX1NPDhWM0SsJF9ZlbZ4hvOxe8DAyN5xtZ
 zZU9r2wWb+5KFgRXW3dutcJB9EoqJHgIL+5F8pld2A04t5B6JsM4tmQx35rp4vn3xs0Zwt7oCQ+
 To//V0D6w1WRwNrZy5c21fUFFNdqY=
X-Google-Smtp-Source: AGHT+IG4pG20Yrepe041wDSG8GJC3NZSymhx3boOCHZlIMGASclrEFPEzLQZrlRc2a50xWaYhD2crUw3xuwpdrKBiYM=
X-Received: by 2002:a05:690c:67c7:b0:6f9:b12b:8943 with SMTP id
 00721157ae682-6febf2f3a9bmr72669737b3.19.1741378299319; Fri, 07 Mar 2025
 12:11:39 -0800 (PST)
MIME-Version: 1.0
References: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
In-Reply-To: <14a845e8-54d0-45f8-b8b9-927609d92ede@stanley.mountain>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 7 Mar 2025 21:11:28 +0100
X-Gm-Features: AQ5f1JpZohgGftYZeUPmd7mjaK_v2MjyriIGwTdsUOZcHqxqIzREXd76VJK0afk
Message-ID: <CAMT+MTSHT92Q=Xm62zfDgTnR0MEw5gKEk1rmvmrQSbXgQbww_w@mail.gmail.com>
Subject: Re: [PATCH next] drm: adp: Fix NULL vs IS_ERR() check in
 adp_plane_new()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Fri, 7 Mar 2025 at 10:31, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The __drmm_universal_plane_alloc() function doesn't return NULL, it
> returns error pointers.  Update the check to match.
>
> Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")

Acked-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
