Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADB63CB14
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D910E26E;
	Tue, 29 Nov 2022 22:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568D910E26E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:29:14 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b8so21693919edf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1gKZClLZmEiVOIk1j7cicwzi+DjtZJzvayZlsThxfFA=;
 b=PDQHwMDxqw96E4BjZGoYCNxOxYiUPtBJOTGKZ0b9ugbOYqSmE6ZA0sMsTaMNaew/N3
 6+0JgyBhmhBew5dmm9B/lacTYS4E6x5LeKeHID5zLpYeDKVtNal7+3DKrK0YxVrC6EuG
 TZIs/Pw9H9xFba7BY2ZgWUa93/4soo2uZ3Z6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gKZClLZmEiVOIk1j7cicwzi+DjtZJzvayZlsThxfFA=;
 b=5nqvVtK26uAguB7c2JfA7XbrKOk5NfhECihNWTfMukD1JteXyiMqBOaY1C5BFxboS5
 Is5n6OzAbJTvUlaq2NRAA0tqTn08GKwSYLdtYPLcbM3ptg6wwpEYf0sebn/XLm2AwpH0
 UqI+SBJjZiek8ReRlZNrtI0ML/QRIJGNiVXWi5JJrIxpXxtoWlDEni94TS7TxPANOFBt
 p97PE/Ce0kQLzKhFR4181T/xkuSNfNJpubDiI9CTWNeMi0S4r4rFItdK60Y64HnCTpqe
 GpkHXUtYg0eOpTuMd3Q495lqoI0R/Zt7iRdxW7zSKjUYcyhYW3jHd6xyXh6IzfnGHJuR
 eyrg==
X-Gm-Message-State: ANoB5pkdA+onvKs+xDsZ94gAGdFCsbBqoQRhQPcvFKveVsp2Gm0mJgnw
 3gOpHurMJuuuWjxWLrW6ogjRm2Kui+7M7Nq1
X-Google-Smtp-Source: AA0mqf6fii6Mt3J6gXkYM/kF0VZtx283T0Dd06pONQe+uO4CwKc7WI7LIW7fNPL6c19UiYhqZIjIng==
X-Received: by 2002:a05:6402:550b:b0:45f:9526:e35a with SMTP id
 fi11-20020a056402550b00b0045f9526e35amr54191805edb.256.1669760952503; 
 Tue, 29 Nov 2022 14:29:12 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05640213c100b0044ef2ac2650sm6677396edx.90.2022.11.29.14.29.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:29:11 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id bs21so24357423wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:29:11 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr4295062wrr.617.1669760950923; Tue, 29
 Nov 2022 14:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.5.I96ce2a565ff893eddcbee70174c991179311a3ae@changeid>
 <CAD=FV=W_P3BbxRsPH0vQ4qRW_fiyM+u7RzRj+i0N9G3_4Zhtcw@mail.gmail.com>
In-Reply-To: <CAD=FV=W_P3BbxRsPH0vQ4qRW_fiyM+u7RzRj+i0N9G3_4Zhtcw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 14:28:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbHX5Cz6LLS1eNgjQ6qo6mzDtndeM6BxiXGF=6HtpkXw@mail.gmail.com>
Message-ID: <CAD=FV=XbHX5Cz6LLS1eNgjQ6qo6mzDtndeM6BxiXGF=6HtpkXw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/panel-samsung-atna33xc20: Extend autosuspend delay
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 1:15 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > Avoid the panel oscillating on and off during boot. In some cases it
> > will be more than 1000ms between powering the panel to read the EDID early
> > during boot, and enabling the panel for display. Extending the
> > autosuspend delay avoids autosuspending during this interval.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> >
> > ---
> >
> >  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

8d5d063fd669 drm/panel-samsung-atna33xc20: Extend autosuspend delay
