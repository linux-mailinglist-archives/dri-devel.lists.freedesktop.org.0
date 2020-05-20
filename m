Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5B1DB084
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 12:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7B89D6C;
	Wed, 20 May 2020 10:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C3A89D6C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 10:48:01 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 14so1071437uaq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vg81YZ11MbDWpDXKxv66z4ejnYYlm2/xxGtzMeNWMhs=;
 b=EMX7fQn5U3srepsHrkjbIB4aWoXbUaophu0U0Omos66kObg0me9Vb2mytHaA8Kkrhz
 QyF0umb1bVg2R6vB61kXI1IDombYO7Esbf/IiUxQMM+6F2Ryh3zlAypWQkWKXSaWRhYX
 dBRzY/8233pbRA3dglQaRI+shDReW0lVD6k/7JwYb97vrYfruLlv5okhopvDLX2wm1VG
 gWeQVWargxsulPTFVjRN+30nSrzOSNYW7VdoeTcGY6OBvlINFfDXgAMlnm6QIefBSd83
 f0gPW84VfRjvmAukxAnBSY0F3fsfoHelOSS0Iwxg6ZiZFMVHpP/XrZLKNzKMRsGXGXgn
 sTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vg81YZ11MbDWpDXKxv66z4ejnYYlm2/xxGtzMeNWMhs=;
 b=D/w0W6+SfaoBQLNrUo3s0PpQ4Jo7IqgxysxNpqcqiN2z9qLyBKmkBapxZjKCzyif8w
 rxo199USTqUsYd5EOSVpvmsO7WgbMApY8I8V33wDFgnzFi4oDkRz96dkT2ooRHKGBgta
 NPWjToekp0BOusTQPizZVuKaIA1+Swi1YHaPez21auvWp0kiGjRJQD9/fXom9jMXzJJn
 r0MirXBwnnOYi0zGLrsIX+tig5x0amDlFDd3ymQagtpVcze3vZ9SV6f0g0qfHW0F5Yio
 eFyV7D/vWabt6a8ta0KSIK58gsLRhFAiYH7oIHtuOl8U64OKAbP0UFsVCL6VfNOydePo
 REXg==
X-Gm-Message-State: AOAM531/I9uGoo1jk1JFImGOoEEf49RKDmV9jjV/Mv3ftQ9nir4ohjKf
 HuDk6w1u8+orlEoeByeGeiSp3HAKp2X1mt9F9uuKYQ==
X-Google-Smtp-Source: ABdhPJxKtUis9QH1uXArzW66ACDexrbsCIO0BhIGEmcFEix0kbYyKDeCpt2ONtofmkZIVMY1POgJJo3lOB4rcz0R9AY=
X-Received: by 2002:ab0:b93:: with SMTP id c19mr3023403uak.69.1589971681089;
 Wed, 20 May 2020 03:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-4-sam@ravnborg.org>
In-Reply-To: <20200517190139.740249-4-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 11:45:06 +0100
Message-ID: <CACvgo52AegdsmfOsVoTHH=oporeMMV8bShQMJC11JiO5bNXwrQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] backlight: add backlight_is_blank()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 May 2020 at 20:02, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> The backlight support has two properties that express the state:
> - power
> - state
>
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler for drivers
> to get the check of the state correct.
>
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> and thus not needed in this helper function.
> But added anyway to avoid introducing subtle bug
> due to the creative use in some drivers.
>
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.
>
Nit: please tweak your editor to wrap commit messages at 72 columns.

> v2:
>   - Added fb_blank condition (Daniel)
>
I was going to mention this, but Daniel beat me to it.

Please add an extra NOTE in the commit message. The fb_blank is a
behaviour change, albeit in the right direction.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
