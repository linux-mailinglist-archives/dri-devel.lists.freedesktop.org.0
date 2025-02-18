Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF79A39BDE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 13:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7010E2BA;
	Tue, 18 Feb 2025 12:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t6UWJqrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153B10E2BA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 12:14:48 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30918c29da2so44321981fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739880886; x=1740485686; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LAbvVw7Ic6dqBTqHKxGeWC/7bVyNwl4nKrDf3x382TY=;
 b=t6UWJqrFnuZrnugWSBq0UotHukvx5ZlpbSlqbQY4XTcuUgdqf4RafvkBwqwdSeGF6x
 sP0Om6dITtWKa4gZQTbKUw3cBH/+uSaTyhdw3F9qQ9HXN+fWp57yePQ9qZZnbbFHZulg
 jBrhvkqIybH6Vd3wBCxlWBJ6gLpxrsLMVnP8+3AwbC3l58VJ4f2TCL7TnMm5PB7hyCD1
 FN63IAwl72C7N/jtS4WU4vFeq9K7Z4wGMTdNv0M0fzGhJeGIQ7VkeWk3g64Iu1vGmhGf
 kCXLngckK+EUak9L+IWuSdFbKlApHle3mOzt1jlBntEIfhX2D3vOtzuuTVIXjXak5oHf
 0pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739880886; x=1740485686;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LAbvVw7Ic6dqBTqHKxGeWC/7bVyNwl4nKrDf3x382TY=;
 b=LhRSOCasM0tRoMbVlOx9egk70ysrfcQK+bKL960JBwGQQ8cckBELaYYLoG1kbe8T0c
 xakpDVZTBVRfYyiZBDbU8i8MUde6rQnTT8L3K/1i9soB3I0pG7oT4Bb4Gej5dRuhyc5b
 wlSP2I4hAHMDUlZvuXCI9BZFxdn8bR7cSm8lEUfdL1hHdCQn54GWjy7sROTPVfDOXZLx
 cyjyRZoLeuZAdZZ8J/q/GJ7JMZTW4ezoMlVJP4LoBn/RT5fVVcXnJirac5U5D6wK06k0
 45ECeHleWmke8crNJ7wU+ccv7ZUiwTznWevfmMGjlAqoBqbSYhUleMiMAep/DS8apq5z
 pnDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgrfrvlek0/VUrs7RDZiW5+5AWPp945wVodA1t1ziUQSbwd+dCDygqVnPzYWE4k1drdmm3rk1JEFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlApRrzvOqwImt0/VGJY4+KG1zlHOngZ4ub1eKGZfMwFZaPayY
 2EN/nxLLBNDlPTY7xok1lNe7JUHjbkJht2ALP/jAAwN4VZ0usB5hl3DN12dk/b0=
X-Gm-Gg: ASbGnct3R/AsVXB2aWqUH39d0SouhSMfOwuiC05oF4G/vhrdLczSG6axCLNQUPZ3u0R
 Lp/xyyAT4Ps1EVjdRudyOkKHYhWE8aQbkpUU6uS0Qs56hhAyil4mnrKJf5Ye9F+/DbxxRP7uofW
 +whLj3SLrtF0YWPRdedXhTh5rC2p1hAfb/TaG0qN5z9BMgqiGEhGgaL7KEI9zhyLvUgjPN/Ooz2
 adfxgMBSQhG/a3nkETel0+9vUErdUQY8BBvY0MUBEsE/bSs9fu3xtKOXiDNorEieo63LMMN0qRu
 FtSQJM0guxKxpt/pKVUMIR/nEW5rrmG8P9YJo7/2H7VCZE9wJRWDTdG6r/lVwDdUyshVBJI=
X-Google-Smtp-Source: AGHT+IF6AAq0z6X4U1x73BkyxvJFRwy8V69OthYTxy/w5cJfeaIMCbsxrPSvj127AN4NZvNVoTBUaw==
X-Received: by 2002:a2e:95d7:0:b0:307:46f3:4e92 with SMTP id
 38308e7fff4ca-30927b128d4mr41674151fa.32.1739880886356; 
 Tue, 18 Feb 2025 04:14:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a303a659fsm7266191fa.106.2025.02.18.04.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 04:14:45 -0800 (PST)
Date: Tue, 18 Feb 2025 14:14:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, 
 Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>,
 Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Jianhua Lu <lujianhua000@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH 00/20] drm/panel: Move to using mipi_dsi_*_multi()
 variants when available
Message-ID: <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218-fabulous-agile-corgi-9a5ee0@houat>
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

On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > Hi,
> > 
> > On Thu, Feb 13, 2025 at 12:44 PM Anusha Srivatsa <asrivats@redhat.com> wrote:
> > >
> > > A lot of mipi API are deprecated and have a _multi() variant
> > > which is the preferred way forward. This covers  TODO in the
> > > gpu Documentation:[1]
> > >
> > > An incomplete effort was made in the previous version
> > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > replacemts and not the rest of the API.
> > 
> > You didn't seem to take most of the suggestions I gave in response to
> > your v1 [3]. Specifically:
> > 
> > a) I asked that you CC Tejas. I've added him again.
> > 
> > b) I asked that you CC me on the whole patch series, which you didn't
> > do. I can find them, but I'd find it convenient in this case for them
> > to be in my Inbox.
> > 
> > The first patch conflicts with what Tejas already landed in
> > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
> > second patch _also_ conflicts with what Tejas already landed. See
> > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > mipi_dsi wrapped functions"). Later patches also also conflict. See
> > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
> > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
> > transition to mipi_dsi wrapped functions"). Maybe you should sync up
> > with drm-misc-next before submitting.
> 
> Yes, you should definitely work from drm-misc-next there, and sync with
> Tejas.
> 
> > I also questioned whether this really made sense to try to do with a
> > Coccinelle script and I still don't think so. It looks like Dmitry has
> > already reviewed the first few of your patches and has repeated my
> > advice. If you want to help with the effort of addressing this TODO
> > item then that's great, but I'll stop reviewing (and start silently
> > deleting) any future submissions of yours that say that they're done
> > entirely with a Coccinelle script unless you address this point and
> > convince me that your Coccinelle script is really smart enough to
> > handle all the corner cases. I'll also assert that you should review
> > Tejas's submissions to see how these conversions are expected to go.
> 
> I couldn't find that in your first answer though. What corner cases do
> you have in mind, and why do you think coccinelle can't handle them?

As can be seen from the reviews:

- sleeps between DSI calls
- properly propagating the error at the end of the function
- making decision whether to create the context at the caller or the
  callee side. E.g. in patch 8 it is better to allocate context in
  hx8394_enable() and pass it to .init_sequence() instead of keeping
  some of error handling.

> Also, why do you think ignoring a contributor after a second mistake is
> a reasonable reaction?
> 
> Anusha, most of those comments aren't the end of the discussion though.
> If you feel like something's not clear enough or ambiguous, feel free to
> ask for more details and keep the discussion going.

From my side: feel free to ask for the details if any of the emails is
not clear enough. At the same time, please review your patches before
sending them. Returning 0 in case there was an error is an obvious
issue.

-- 
With best wishes
Dmitry
