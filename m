Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3922F0DCB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C789A4B;
	Mon, 11 Jan 2021 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6726689E43
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 15:35:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id b9so21312238ejy.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=naEHngvAfFaWU0qNEz4MsGy5SHtJ4Fc1pZjtZRQ/R7A=;
 b=SKhejTHVrnmvxoi96I8oG2caR7ZKzOGKmjQdwbghyOYz7IJgq4zgEnak1joV2x0XwI
 RSsMuDayu4oe6gizQfKuvkl0EouzfypKjiq6nAVWS9i87pd0th4TUG7zK/BQYEMnpmCH
 VN/VpDZnDVAR7MqpaPgXovwhPKdUdV6YTdz6oQafe+LBMHGuxV1UDWIftC0Rqze1wCfk
 65RC/VZ4g/Jc0O9wzQOnfVm3JPoqnisJ/ETz/61rdTAdjiOBsRkKCycWbmw8uIK3dlAk
 Kd0YnnI/cdheVRrRTEvaXOa5ShTyVJ8xKR6RiTVse5K3TXb/tJGHJ7H59qVg5kIV9SMP
 uNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=naEHngvAfFaWU0qNEz4MsGy5SHtJ4Fc1pZjtZRQ/R7A=;
 b=KXnnJn6n0+92wmcKZ9oAm0PIyntmYEdKZ5iRkXSR3TT2Qlt/205rd+5xizygef+lTQ
 q2N7p/oKxVEjgVrK+QoUmUYHO7yEtv410gTnU6e5EedkdJh09/DSVbn4Z4/CAj9Ih9DR
 eWCiTdqKgeysfnMIS3ymWLu1N/dm9ltSxqdiWYdabUbQApRO3zn7N4P0vwxxCISl//wi
 /qC6cJ0sW4EhhLjuKDEFYfomkPSriD7e2VLYx1xHDom0Qdoadvj6/9EFx0jtBtKancKv
 h9y+bRgjnC7hlj/P0s8Rh5U5zJf7Z2sj3G1umTPIu0jsMl5hPUhIsipOeXIggFju/CMP
 PlpQ==
X-Gm-Message-State: AOAM531gqoRWsFOtCD77LmhxdvuQVkp/g2O/XcCau6TQbKl3dSSU/d7j
 OsM5eyQOdwQhsu0H4Zy2No0=
X-Google-Smtp-Source: ABdhPJzxnXR0a06rh8Z9nCUeV/eMkVI5BFMVGBdQyXJx+wfhB71QZy4bXa+FxYNnU6mD+fRauHWPLA==
X-Received: by 2002:a17:906:1393:: with SMTP id
 f19mr8083162ejc.431.1610292942807; 
 Sun, 10 Jan 2021 07:35:42 -0800 (PST)
Received: from localhost (ip1f10d3e8.dynamic.kabel-deutschland.de.
 [31.16.211.232])
 by smtp.gmail.com with ESMTPSA id a2sm5852660ejt.46.2021.01.10.07.35.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jan 2021 07:35:41 -0800 (PST)
Date: Sun, 10 Jan 2021 16:35:32 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210110153532.GA7264@ripley>
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/21, Fabio Estevam wrote:
> Hi Oliver,
> 
> On Fri, Jan 8, 2021 at 7:24 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> >
> > On 19/12/20, Oliver Graute wrote:
> > > Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> > > to panel-simple.
> > >
> > > The panel spec from Variscite can be found at:
> > > https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
> >
> > some clue what bus_format and bus_flags I have to use?
> >
> > [   42.505156] panel-simple panel-lcd: Specify missing bus_flags
> > [   42.511090] panel-simple panel-lcd: Specify missing bus_format
> > [   42.615131] mxsfb 21c8000.lcdif: Cannot connect bridge: -517
> 
> Does this patch work?
> https://pastebin.com/raw/diTMVsh8

the first two errors are gone. But I still get this:

[   42.387107] mxsfb 21c8000.lcdif: Cannot connect bridge: -517

The panel is still off perhaps I miss something else. 

Best Regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
