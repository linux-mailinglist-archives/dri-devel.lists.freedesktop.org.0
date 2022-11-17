Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104362E694
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7410E685;
	Thu, 17 Nov 2022 21:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D5A10E67D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 21:14:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt23so8275892ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M/DuA3/Pzsx3au4LPnKseak3gciQYTCxB9OFJeaSfOo=;
 b=AYvUNnIKTWnfmr6P3d3C+p6IzwACHao5za/pAs9MP8aieYoKmyHi+PBxS93Wp4jVUt
 CgXxgr2fCJCcnrnPa7FCwKMzEbot8+2S3iBr48lamoFuvFt5hKKrjo5w0lkTnnttOQUX
 7NH5WgXKirab3uUHAmboue15BxwxoP32qrCo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/DuA3/Pzsx3au4LPnKseak3gciQYTCxB9OFJeaSfOo=;
 b=KEJg03SNipo9+lKQYOewfxTrlFyrXmxrRt2nWdGDrpUmUpVPWeU1ajqijq17P5SYdX
 Q/s0sKatBfjjvxBNgOFsuqcWvNYRFQQAmP+Ol7AAG0N33un5ZioSKFlZrGMjmpyuWUKX
 WmS23rZhrn2JeIoOrGiUnQ0+YZezo5jLQS4aMUHfC/y7D9trXlreuUvNIMOWOVMFxzNj
 POTq471JjAkLTVFNoCOjpJSxprP5Dt2U85XARpCvq0Gj5xaktHxtAJT+74n8XUIM+wD8
 rNv/pDXbwOXnz/5EL7yRaC5cOvgIdy/RWIonepUI6CNVEBQcJ9Y9y2em2VksM/b5HD9P
 EEZg==
X-Gm-Message-State: ANoB5pnazBMvmTpUtql2h06LiNWAn4nHKa4awJBMy2WzzKW51BEh/bcd
 HUydPdsRMsYkiD620plBcPd6Pi1k8oh6iidS
X-Google-Smtp-Source: AA0mqf7dpj7ONk1av7QhMPMTmbZJaEoD/41j1Hu+qS63vg75HSDsM2X84iB/Q/nJGohP/jQU49pazw==
X-Received: by 2002:a17:906:32c7:b0:7ad:934f:abc2 with SMTP id
 k7-20020a17090632c700b007ad934fabc2mr3350347ejk.690.1668719687696; 
 Thu, 17 Nov 2022 13:14:47 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 dx26-20020a170906a85a00b0078afe360800sm823233ejb.199.2022.11.17.13.14.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 13:14:45 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id v7so2302460wmn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:14:45 -0800 (PST)
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id
 g9-20020a05600c310900b003cf573153dbmr6680730wmo.85.1668719684774; Thu, 17 Nov
 2022 13:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
In-Reply-To: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Nov 2022 13:14:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XFsSoUqkk8zhta1V-oT2AGGvUz=0qFWAcXiJ7m+nnATA@mail.gmail.com>
Message-ID: <CAD=FV=XFsSoUqkk8zhta1V-oT2AGGvUz=0qFWAcXiJ7m+nnATA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/panel-edp: Use ktime_get_boottime for delays
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

On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> ktime_get is based on CLOCK_MONOTONIC which stops on suspend. On
> suspend, the time that the panel was powerd off is recorded with
> ktime_get, and on resume this time is compared to the current ktime_get
> time to determine if the driver should wait for the panel to power down
> completely before re-enabling it.
>
> Because we're using ktime_get, this delay doesn't account for the time
> that the device is suspended, during which the power down delay may have
> already elapsed.
>
> Change to use ktime_get_boottime throughout, which uses CLOCK_BOOTTIME
> which does not stop when suspended. This ensures that the resume path
> will not be delayed if the power off delay has already been met while
> the device is suspended.
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
