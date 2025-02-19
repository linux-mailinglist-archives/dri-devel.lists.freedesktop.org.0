Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A143EA3B6FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0613310E792;
	Wed, 19 Feb 2025 09:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tm6icOq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2D710E792
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:11:38 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so730626e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 01:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739956296; x=1740561096; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jza03j0MnQGznKWpKvTiC+4+k6GxgwZi0Po40ysUY6w=;
 b=Tm6icOq+gLSqKmyy9skxxnMx5vMAKtfFSV6vIst6MMDL2tZoV4XmH6ImlUjlcZeR70
 3VKmr8f76iuJZq7O9bHwcjFLy+jg2CwiPm60/QBriU/t4WZKc64/qxOBiqxYXCZhQakz
 jgXn4t//ysE8o8hcVHknMMttj1nwKL5R8OgYVzmkrRd36Pac2LxKqv8uRmlVx5NiIxyB
 44GDwZoLErrvBFyg5g71yD2KrXQMXyEU8ohO8wWRFFbZx78zVHVMCnke1M05NtTYGeLF
 jvvAG6VQqsvP/4qCDzolfBUkLp1KcBoyX77rvxxm/EVD3TDDKrCHeajb8bvjftxJrGh7
 ehAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739956296; x=1740561096;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jza03j0MnQGznKWpKvTiC+4+k6GxgwZi0Po40ysUY6w=;
 b=GADrU7EUXjLuV6IjukGMVwxPWZ+vQAEc9utMkSPDhdTBst597D3TRx7A+ukecjaEui
 Pkf+4d85Ef7Jpr6iYTE9K7wPWONT8OxXK3fv2vjIxMlnLjVzF8AR72jL3xklaSDBN9fi
 XviPbINHVO6spjC3u+wKDQMU6t/gAGjNdpg+vYziuPqilggtg4OUs0v50qEOYRVSZS6Z
 Fa133imuoRp1FHAegwQmQuzZWqnN1eYINjHnGxUcUheKkHOEoYq2zDNom2o3k82F7Tey
 aodPJv0WbfMAGlaKiYePCElV2Co/gDmLjgpyVN6jepNEPYAuLwswONDU6Nl3VD7UuiEO
 InbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEWNQoWf49nldJJfEM8p5cp9K2u7cfb77Q35HIOv5JT+i5WrFWQEjCmWKN+P8xEi4W8lNxG5CtyLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf5CgI319FD6ZcIqED/juISMMM2GIXRFDH7Nsi5YgY3FNKjqu9
 026etmwyA7Z+SYjqPwMQvqNf7Itn15r8Fhy2gggZViBFKgWPH91HuPmo7Sxvx8o=
X-Gm-Gg: ASbGncus+W2qQg+tmTg/C8Vx7GYc+HKgNw7d4oaP/F4v8EbYR0yzmhqc+cWPVzpIqT8
 XgpqZAsGiwBu97XcRs7Wt5lbSv3pKFIkxWugPsEe1fDgpOIPpVUAzJN1WgvM+02lHqWIeW6zEEd
 mkLXv6R1ZeklcdFhX/W6lMeMuKR07yOjG1lpIvDPjuSi6SOjjITgmDckp+LjweHt1sj64dlSIPO
 Lp3L0h1epxr0Rr2Dg9U7vej1UtZ1z9u2nRo1+302lpkahAe4cpyFZ+PnU7DPHXdrrl65s+Vkl81
 HQYKW6XChmD4hFeQzTGx8ahn+rlTJnRtyfUKvItI9HlNo0z3lKAlN6AdSMrq9WTYgGkGSas=
X-Google-Smtp-Source: AGHT+IFa5flmo8YhTuWoDOUEgP1BOmmAOlZ+4HxQtHdeWbJ1wWlQi3XsL8Oh/UDWY10wx8g82SoCHA==
X-Received: by 2002:a05:6512:281b:b0:544:e:cfea with SMTP id
 2adb3069b0e04-5462eaa65c6mr989206e87.6.1739956296217; 
 Wed, 19 Feb 2025 01:11:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462cb28b60sm349095e87.153.2025.02.19.01.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 01:11:35 -0800 (PST)
Date: Wed, 19 Feb 2025 11:11:33 +0200
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
Message-ID: <rg4mctlqofydzexa7uwnmcsv66dhx5u2wrmytslpyltraz6p5q@ohvo7ab2ws7q>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <CAD=FV=Vyx8vAeRohw3W11Tuv26_-zi-GV__G2cXFxF+e76MJkw@mail.gmail.com>
 <20250218-fabulous-agile-corgi-9a5ee0@houat>
 <ynmxaimdwkwfiryz5le5vpnfh5fzh5se4ebyqzkbnq355me76x@yxtyan3niivb>
 <20250218-primitive-kickass-seagull-008bf2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218-primitive-kickass-seagull-008bf2@houat>
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

On Tue, Feb 18, 2025 at 04:52:53PM +0100, Maxime Ripard wrote:
> On Tue, Feb 18, 2025 at 02:14:43PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 10:55:49AM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 14, 2025 at 08:26:02AM -0800, Doug Anderson wrote:
> > > > Hi,
> > > > 
> > > > On Thu, Feb 13, 2025 at 12:44 PM Anusha Srivatsa <asrivats@redhat.com> wrote:
> > > > >
> > > > > A lot of mipi API are deprecated and have a _multi() variant
> > > > > which is the preferred way forward. This covers  TODO in the
> > > > > gpu Documentation:[1]
> > > > >
> > > > > An incomplete effort was made in the previous version
> > > > > to address this[2]. It removed on the mipi_dsi_dcs_write_seq()
> > > > > and mipi_dsi_generic_write_seq_multi() with the respective
> > > > > replacemts and not the rest of the API.
> > > > 
> > > > You didn't seem to take most of the suggestions I gave in response to
> > > > your v1 [3]. Specifically:
> > > > 
> > > > a) I asked that you CC Tejas. I've added him again.
> > > > 
> > > > b) I asked that you CC me on the whole patch series, which you didn't
> > > > do. I can find them, but I'd find it convenient in this case for them
> > > > to be in my Inbox.
> > > > 
> > > > The first patch conflicts with what Tejas already landed in
> > > > drm-misc-next. See commit 8025f23728e9 ("drm/panel:
> > > > xinpeng-xpp055c272: transition to mipi_dsi wrapped functions"). The
> > > > second patch _also_ conflicts with what Tejas already landed. See
> > > > commit f4dd4cb79f9e ("drm/panel: visionox-r66451: transition to
> > > > mipi_dsi wrapped functions"). Later patches also also conflict. See
> > > > commit 0d6c9edf9e5b ("drm/panel: ebbg-ft8719: transition to mipi_dsi
> > > > wrapped functions"), commit ce8c69ec90ca ("drm/panel:
> > > > samsung-s6e88a0-ams452ef01: transition to mipi_dsi wrapped
> > > > functions"), and commit 7e3bf00047cd ("drm/panel: sharp-ls060t1sx01:
> > > > transition to mipi_dsi wrapped functions"). Maybe you should sync up
> > > > with drm-misc-next before submitting.
> > > 
> > > Yes, you should definitely work from drm-misc-next there, and sync with
> > > Tejas.
> > > 
> > > > I also questioned whether this really made sense to try to do with a
> > > > Coccinelle script and I still don't think so. It looks like Dmitry has
> > > > already reviewed the first few of your patches and has repeated my
> > > > advice. If you want to help with the effort of addressing this TODO
> > > > item then that's great, but I'll stop reviewing (and start silently
> > > > deleting) any future submissions of yours that say that they're done
> > > > entirely with a Coccinelle script unless you address this point and
> > > > convince me that your Coccinelle script is really smart enough to
> > > > handle all the corner cases. I'll also assert that you should review
> > > > Tejas's submissions to see how these conversions are expected to go.
> > > 
> > > I couldn't find that in your first answer though. What corner cases do
> > > you have in mind, and why do you think coccinelle can't handle them?
> > 
> > As can be seen from the reviews:
> > 
> > - sleeps between DSI calls
> > - properly propagating the error at the end of the function
> 
> These two are legitimate feedback, but I don't see how coccinelle cannot
> deal with them.

Maybe it can. both issues were pointed out during review of the first
series, there was no improvement here. I'd really ask to perform
conversion of a single driver, so that the script (or post-script
fixups) can be improved. I'd still expect that Anusha actually reviews
the changed driver before posting it and verifies that there is no
regression in the logic / error reporting.

> 
> > - making decision whether to create the context at the caller or the
> >   callee side. E.g. in patch 8 it is better to allocate context in
> >   hx8394_enable() and pass it to .init_sequence() instead of keeping
> >   some of error handling.
> 
> Yeah, that one is definitely subjective, and is going to need manual
> review.

-- 
With best wishes
Dmitry
