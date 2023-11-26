Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3D7F93C7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 17:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB68710E128;
	Sun, 26 Nov 2023 16:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708710E128
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 16:30:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50abb83866bso4660799e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1701016202; x=1701621002;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sSJ+yeqxuvutnkpSkcqAmI5LAVDWcSBce0PQad7lFBQ=;
 b=gIb9dC0KpaHlQc/4Ea/btQbZWtAi14SShJIEiTMqhQbZt7OMDS0S15OOE1Wyil5Bu1
 uGBKZTkox4OW/FOIp2JGvCgS6+QcV4Rbl57NLWD+Uc4XJZQBW0uD86sargULYs7KOixf
 qVZNgGxexuANyt61BJH/y1ftA32puEr6IVhzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701016202; x=1701621002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSJ+yeqxuvutnkpSkcqAmI5LAVDWcSBce0PQad7lFBQ=;
 b=FUVRX1ly6jZo+ro8Vv9WXDrNeoDdmqa9ZfkK4WtdjSiaBuiv3Blh9QlIq47urz5FeL
 vXqY9U7+0Ll8bquhyDbZBhxPyjXS87SYhrZNA0MFckNnLiDd4TfMptvR0YB/JszVY8ag
 bB0v8RSOhMuzlFXY0phqH4AWKP/ZHTQRupbwPLzVuI1I20J3d0ej7qj0rslDfCXZjQT2
 BFTkKd/VcNuZj9vLr8hIJP2tiJWPK0uOWmZ5q8c1hOLu2nT9xrHFaBjjZTSppo01uhak
 +ntIS2mxqqH9F1fmyrp2Bzspk+XenyDdfKI+PvjMzAxOJdmjEiffuO1chKuU8LLgnLq3
 Ttig==
X-Gm-Message-State: AOJu0YzYl89ubm7WAFoyUljgITW35FRAaTCtrGnhop3pA5P9QSGevDiI
 9lLlF13AV3rC/Hq5GgGlt2xX7cRQ7CgGNM1oFy99CN8a
X-Google-Smtp-Source: AGHT+IHgILqmjiJbGEd3zZtWzYRqciXUTuP5pDaOlekeJLe5rTY7sZMnAXomBp0j5L8cOxTILr/5dA==
X-Received: by 2002:a05:6512:2245:b0:50a:40b6:2d37 with SMTP id
 i5-20020a056512224500b0050a40b62d37mr7833830lfu.40.1701016201590; 
 Sun, 26 Nov 2023 08:30:01 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 er10-20020a05651248ca00b0050ab6109b48sm1234549lfb.193.2023.11.26.08.30.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 08:30:00 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50abb83866bso4660765e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 08:30:00 -0800 (PST)
X-Received: by 2002:a19:5e03:0:b0:509:dec:9f3c with SMTP id
 s3-20020a195e03000000b005090dec9f3cmr4999914lfb.50.1701016200246; Sun, 26 Nov
 2023 08:30:00 -0800 (PST)
MIME-Version: 1.0
References: <ZWLsgGku7j_7_eVE@ls3530>
In-Reply-To: <ZWLsgGku7j_7_eVE@ls3530>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 26 Nov 2023 08:29:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiR5yLK6-n5p=F97unF1bf3DuPdGcv0MZcO51aiik4T0w@mail.gmail.com>
Message-ID: <CAHk-=wiR5yLK6-n5p=F97unF1bf3DuPdGcv0MZcO51aiik4T0w@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.7-rc3
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Nov 2023 at 22:58, Helge Deller <deller@gmx.de> wrote:
>
> please pull some small fbdev fixes for 6.7-rc3.

These all seem to be pure cleanups, not bug fixes.

Please resend during the merge window.

            Linus
