Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB730051E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 15:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195026E9F6;
	Fri, 22 Jan 2021 14:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85D6E9F7;
 Fri, 22 Jan 2021 14:17:08 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f2so1473863ljp.11;
 Fri, 22 Jan 2021 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8mwIEDpENHQPtwMCv6y4VpkGncW2XJYSp++OhLzpYA=;
 b=FRBjvbSwVivVTxWnYEWwg4AouTZMQEH5Y1rUZuPiiwnslT4Cu3m5MPUjO9ynXqVQlW
 pDetYZSSe0KsN53qMQLIzuYNpxBlyEeA6tPJWO5ta3x03XAXRrECbCDxVzfgqeN1bH8T
 th9L1zbnmU8PIB+4Vg9vIqQLI0cGYeARtbJ7MZ3XYqlwmv9VQrgkNLI9AIaxvxQn8S+G
 CE1eyOx06iKWIneyUcTflyJlyOoljSlH08XACHfNZjl61NEBDq1WM2I1RRf96ClXJVka
 gXScf7Xr5Qs+dGFcZs52Hk1x9oJw61VB3txeudE6cYcUbZ/gJSba8h+XKyFXJfWfSnxu
 sBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8mwIEDpENHQPtwMCv6y4VpkGncW2XJYSp++OhLzpYA=;
 b=oFHTDjVxIOoTJw9HBJM4XEw/i6w71EER6yPPEQdyBb/LUHaXCdWQ2/9ZA2neV6qa7H
 5vHsSkXpapxZTiLEskyqQd2OyBcw4sHPFmgEnillk05NY8KPRBZyZkiXEVKFv51Ln0ia
 acsNL7jYWaZ8gKq2O16mfEiJXqk91uOo+z9DIyUdp6WVIlokLHX2Otbb0JD7W5vZeBDq
 n59M79Qj2O97ztVKvGsfzUzFK16TIkVh80IDkGyyxEpNtgt6JevDQa7lpIBzvlmBc0hL
 beDFbAln+S4Vz5AyhkBNpmcA0h7Kpkjc+JgqDDrBB1SCkYSFirpKJAwUXOZzIN1hpvY8
 hECQ==
X-Gm-Message-State: AOAM530xlQgVMpkT2sVw26ItN5ruA6pfl8DyXbSA7uxIBpq7Oy22ueB8
 0Tg4h/vw8FEbHKtx2w6crKgXaF5hWSkpZn9CyC8=
X-Google-Smtp-Source: ABdhPJzyisHq22Ug6u0KO4MdJ4uEr89O5oqn0gzi6cM0EjaFF7KBpntpUSBtybFHfqIgtdWD5xh6CUxgIKWEIqXteQk=
X-Received: by 2002:a2e:b556:: with SMTP id a22mr849240ljn.264.1611325026603; 
 Fri, 22 Jan 2021 06:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 22 Jan 2021 15:16:55 +0100
Message-ID: <CAMeQTsa4byizTHkno_ndGpNskAgrEUU3f43p3qAfnGsXt2OoVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/gma500: Convert to use new SCU IPC API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 12:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Convert the GMA500 driver to use the new SCU IPC API. This allows us
> to get rid of the duplicate PMC IPC implementation which is now covered
> in SCU IPC driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Both patches look good. Do you want me to take them through drm-misc? Otherwise:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
