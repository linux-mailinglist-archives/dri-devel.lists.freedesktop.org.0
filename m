Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F441830C0C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 18:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA1C10E75B;
	Wed, 17 Jan 2024 17:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9900489FF9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 17:36:06 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50eaaf2c7deso12784626e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705512903; x=1706117703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMltNFrkMZ6CS156UQXDFciqpUkUbjTQoqkBzQba0M8=;
 b=khRNyqXQZIEXzk1L2Bdkdqo3mP/OLOVqRLZeptIilod4sWtF8oswq+TgFMmmArR1Cw
 778fD+feBp3npLUo+AxkfXkahA7b/GzZVUc5X+5xvrDd8l/Yq1fmxap5/cT0YiEOTMVv
 liwdOrQJUVMWOofanfWvs51FsHkBor6OV2bts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705512903; x=1706117703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMltNFrkMZ6CS156UQXDFciqpUkUbjTQoqkBzQba0M8=;
 b=kx0q0zzBZrzV1yIFHub2Oq1P2e1lC9K42uPvyqBTsKQShgwL4LscIfl1S+AUEtrI1t
 t3g1E2VrnkuLpdCF5d+y4AdVkprJpaRICjk1qE5u1ynDrLjvFdG1l0UIFrKOIGSRa5Tx
 VlkkkvnVKFL3OK0LNpWg51n4gJQFpTaLaW1mpVXSJ7ZUhqehnVSG+8QhfUu/whnmexNy
 OnvH4EavIJNyo1cT3d4N611iZTs0CLOmQyzO+nHjgx9GdrV9/eel5XqjjlSJ3qYotwYX
 Y1sSI5PdnWYIeyBPfiM17BcrZHHTBQDPl9p4RGg0OnN2p2XhvLrWYoPq+h3ZWENHavc9
 pCjw==
X-Gm-Message-State: AOJu0YzhOO/Yt1SxjJmr5Z3WQaiMJdlju0S7Gk6mp8aNWUWfcwek76pS
 +YplXBA/xY4OEnrQrSfZf2yYJaMStOkus83qksTezQ/Ue89r
X-Google-Smtp-Source: AGHT+IGT4Xcc8AeR6RFNTU0mnDO5w7UM53o7ig54yeDNhmE3VFYeVuqVDsv4LS+a8t0CvvL1a01wpw==
X-Received: by 2002:a05:6512:3dab:b0:50f:738:a5b1 with SMTP id
 k43-20020a0565123dab00b0050f0738a5b1mr1708813lfv.61.1705512902754; 
 Wed, 17 Jan 2024 09:35:02 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 h10-20020ac2596a000000b0050e9e09fc59sm314687lfp.215.2024.01.17.09.35.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 09:35:01 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50e70d8273fso4079e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 09:35:01 -0800 (PST)
X-Received: by 2002:a05:6512:1318:b0:50e:84b4:2bdc with SMTP id
 x24-20020a056512131800b0050e84b42bdcmr140208lfu.2.1705512900966; Wed, 17 Jan
 2024 09:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20240109120528.1292601-1-treapking@chromium.org>
 <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
In-Reply-To: <CAD=FV=WjjH3BCDf-OnX=zdk201uMu+YJvKVBhVmMa4GqNinacw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jan 2024 09:34:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Va-67xojWbm-8MBCxaDG19gQhmNr3V_sBwYUkDkny9GQ@mail.gmail.com>
Message-ID: <CAD=FV=Va-67xojWbm-8MBCxaDG19gQhmNr3V_sBwYUkDkny9GQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Ensure bridge is suspended
 in .post_disable()
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 9, 2024 at 8:52=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Jan 9, 2024 at 4:05=E2=80=AFAM Pin-yen Lin <treapking@chromium.or=
g> wrote:
> >
> > The ps8640 bridge seems to expect everything to be power cycled at the
> > disable process, but sometimes ps8640_aux_transfer() holds the runtime
> > PM reference and prevents the bridge from suspend.
> >
> > Prevent that by introducing a mutex lock between ps8640_aux_transfer()
> > and .post_disable() to make sure the bridge is really powered off.
> >
> > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power m=
anagement")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Use mutex instead of the completion and autosuspend hack
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
>
> This looks OK to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll let it stew on the mailing list for ~1 week and then land it in
> drm-misc-fixes unless there are additional comments.

Pushed to drm-misc-fixes:

26db46bc9c67 drm/bridge: parade-ps8640: Ensure bridge is suspended in
.post_disable()
