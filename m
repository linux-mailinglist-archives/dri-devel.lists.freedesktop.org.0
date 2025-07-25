Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA11B12617
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 23:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AC10E23A;
	Fri, 25 Jul 2025 21:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mlAMlln5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791010E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 21:17:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-23fc5aedaf0so313375ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753478235; x=1754083035;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETkxLDxYY1VgsCRsmN7I3Wj916ZLSMePTLbGFUiSWPc=;
 b=mlAMlln5nPixNr5+pmFNkVf5hfPqqZnjB/qDdfhB5NZMb+1a9xPzFx/2u84RZExMjc
 Aw6P3LeKzwkp6ukX65mYamLEG2sL1VEEnhb6pmgJ6ExqwcEigdRveUqzYKgSVqskmc+x
 pd182ZcF7Ax4NZu8bSTX4Q/a26pdHgU2K1teo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753478235; x=1754083035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETkxLDxYY1VgsCRsmN7I3Wj916ZLSMePTLbGFUiSWPc=;
 b=WrE7/acJLo3IWU+tNd2Vj7BdE0mh5Aol4P53O/5P+qp7oo/1Lg1XFRJCoPSfFsdwbX
 9P9sHLpWPJCwRLck5pLgHLjk96OBIBMWQ/x4TKW6nsm24kcdeaMK8yOOKinFg4Pyvtp6
 zxKtliOQhj5DlZCfwaMkcEgGEzatx5nS2UV+NKG0aFiBqLQpeXHxCv3r8y7bHU2RZRQm
 OkbKG4FHcVoIN12I6P0Hr8WMKgmJBvblreXTGObBh3hwQC4CttsLxEKaz+PgKA/LNTV+
 MXHW11iuZH2xODPGlWpbl+MQAArdFzJ+ZT7qrpQ2q/2AzJ9qzNWw6KG0HhxhwpNp/0oJ
 +KeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfjlLWFO0y0KZL/TT90mnRYQ5ZtQzgn/AFMSiDppYF2c67Q5JFOdt48+qUqIIn6M71k3ue8fObpWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUjPLsCjACmcDzkyhrFYdTehl2G3lJYCbLYKkge26zZlkCk/I0
 IiGBxbJjhJcSDkb8e5arQulGJWPFbWR7wTq2IuEoydIXDn5fbkisO2Xf9b2Vt03p8cqVCgJcw5g
 0rsI=
X-Gm-Gg: ASbGncuOMLLjRQX5uUbjPfL/+Smo6ddO0mU60IX/8uIuHY99VIP94lz5NxgD5qrextO
 mMqrBPRRY3zJTffzHG8K5Mw8CLeXGywIm0MqKR93Xyw7vkrevwIlEX/7mqD+IhLY2cb90HcJHQu
 fd4i8yzW1tw7Zow+kTR8ph+sjmLfOrMd0/Wf9GUr/LxcUIQ2WfHUk/cxCkcRViqQgZzCEye8IHR
 UCF2zVNQ9NJDnNcYVNqhhU0xxFh6jcO8QduDglaqNIOsG0+lq1aznA5OrelYc7P7YwH84aHDeU2
 3Rnow/mcNe/aqYVVvSKdFuVixqQFG2QfZMdQc0oTRMel3UcOrQVOi/UpLsBCVNqRBdowPpT08ZQ
 Q9ZKyLPhWOkXdj3fYpDqse3ya+ELQGKLyTABiN82M/oVJrCw1Wn57mxdeIenpBWE0H2kD/qrUge
 nv
X-Google-Smtp-Source: AGHT+IEcU4Af5ic6YjIYkurishsfON9vSOJls2fwKJEHrLGz47pxscLta2JTAiZONIURN93WfvQdcA==
X-Received: by 2002:a17:903:1b43:b0:234:f580:a11 with SMTP id
 d9443c01a7336-23fb304452cmr46497585ad.19.1753478234811; 
 Fri, 25 Jul 2025 14:17:14 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bb5esm4275035ad.11.2025.07.25.14.17.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 14:17:09 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so1901709b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5SNE1tC5YBbQ5vHF/xl+SRxeAj/l6VBbBOA8B/DHk6XfVSFM9A2muh2IJDmMMLdjG7T+KByp4K/Y=@lists.freedesktop.org
X-Received: by 2002:a05:6a21:99aa:b0:232:ac34:70ec with SMTP id
 adf61e73a8af0-23d6ffe455amr5790082637.7.1753478227853; Fri, 25 Jul 2025
 14:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250724202338.648499-1-me@brighamcampbell.com>
In-Reply-To: <20250724202338.648499-1-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Jul 2025 14:16:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V65Pa0p-ckGAHTCgkqd00M9gE2Py99QcYmaq13jOdX9g@mail.gmail.com>
X-Gm-Features: Ac12FXxmzjj5lJEikgMEtUTC8c1N1dj-92vpoAep7aMMBdfPQfUJq6k3EPzR0JU
Message-ID: <CAD=FV=V65Pa0p-ckGAHTCgkqd00M9gE2Py99QcYmaq13jOdX9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: novatek-nt35560: Fix bug and clean up
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
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

Hi,

On Thu, Jul 24, 2025 at 1:23=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> This series does the following:
>  - Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
>    handling in drivers which use mipi_dsi_dcs_read() such as the
>    novatek-nt35560 driver.
>  - Fix a bug in nt35560_set_brightness() which causes the driver to
>    incorrectly report that it "failed to disable display backlight".
>  - Clean up novatek-nt35560 driver to use "multi" variants of MIPI
>    functions which promote cleaner code.
>
> If there's a reason that mipi_dsi_dcs_read_multi doesn't exist, I'm
> happy to drop it.

It's a _little_ weird since one would normally assume that the caller
would want to immediately act on whatever was read and to do that
they'd need to look at the error code right away.

...but then again, there are places where a driver might want to read
multiple things and then check for errors once in the end (like the
driver you're changing here does). So I'm not against it. I'm not sure
I'd expect it to be universally used, though...
