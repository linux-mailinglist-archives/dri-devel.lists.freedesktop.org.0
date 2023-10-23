Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D77D3D7A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 19:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBE810E17D;
	Mon, 23 Oct 2023 17:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C76010E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 17:26:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so544883566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698081965; x=1698686765;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
 b=beFnBdAr35EMoTB3dsAFdgbzQ/okyOCHWCORuiOl4UGwIFlpuigrdnqDdV1kbZQTTb
 N4Mco6xFcMRnq3OV1btlwINCgth7RTWZJ9FyHsEzWLpZj8++PKuw6lOT2jY5qEB2e3GR
 6J9Kzg/JYSaBO07Lwd7v8krno/kRtQvj8HghQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698081965; x=1698686765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fiki+rx48OzrXJWoYglYJgoiu/eOXoM93dwbSSnqdNw=;
 b=pL9axJCoT6ObjYq5e+NGU3SDBwHHU9N/nxaAuZOdDjdj9Q62sBk80umrmeLkT+102i
 /sxa8mQahhc4ga8owWFR7FODU2QVDXBanh+zdpcTgnuSOuXi4i/N7/Ai+FDD4gQupI9x
 bMs2zysWxFZBWYNWEGyQW3sqTBV7pZ7NZrzqzB7sfrQE3eNhTRDXo1oY29IXmOzbmkx3
 D0ENPF20B3totX6Kdhg9+HLFwBT5jL/lWdRR+zV5MHngZHUGXw2M7CoHdKzENZyHZ1EH
 Klyxb0MXD6s3ffOlwr1H7k4szFXomTDsyUV9Zp2nnSnuVlih7FA01xWsCCo7BZY9xAzf
 dVMw==
X-Gm-Message-State: AOJu0Yz8VEYG7co+4ZZfai/B2prJEZLi4V15rU2kh3vzthkSCo45iaIY
 O5t2i9dKN401T5nYDRbPVXjkDlvGzPOnQ2iQxlHPkA==
X-Google-Smtp-Source: AGHT+IGrIz1NpI+yVy1D9WY+O1i+Bk6+EDy+NAEYTqBBEGpZyHLQA/NtZzIS721awxo3DmM9v2l3wQ==
X-Received: by 2002:a17:906:9c82:b0:9a9:eef6:434a with SMTP id
 fj2-20020a1709069c8200b009a9eef6434amr8149674ejc.36.1698081964939; 
 Mon, 23 Oct 2023 10:26:04 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090671c600b009920a690cd9sm6868514ejk.59.2023.10.23.10.26.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 10:26:04 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so4635e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 10:26:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1b:b0:404:74f8:f47c with SMTP id
 m27-20020a05600c3b1b00b0040474f8f47cmr5652wms.5.1698081963601; Mon, 23 Oct
 2023 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Oct 2023 10:25:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Message-ID: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
To: Yuran Pereira <yuran.pereira@hotmail.com>
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
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, corbet@lwn.net,
 sam@ravnborg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 23, 2023 at 9:31=E2=80=AFAM Yuran Pereira <yuran.pereira@hotmai=
l.com> wrote:
>
> Since "Clean up checks for already prepared/enabled in panels" has
> already been done and merged [1], I think there is no longer a need
> for this item to be in the gpu TODO.
>
> [1] https://patchwork.freedesktop.org/patch/551421/
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  Documentation/gpu/todo.rst | 25 -------------------------
>  1 file changed, 25 deletions(-)

It's not actually all done. It's in a bit of a limbo state right now,
unfortunately. I landed all of the "simple" cases where panels were
needlessly tracking prepare/enable, but the less simple cases are
still outstanding.

Specifically the issue is that many panels have code to properly power
cycle themselves off at shutdown time and in order to do that they
need to keep track of the prepare/enable state. After a big, long
discussion [1] it was decided that we could get rid of all the panel
code handling shutdown if only all relevant DRM KMS drivers would
properly call drm_atomic_helper_shutdown().

I made an attempt to get DRM KMS drivers to call
drm_atomic_helper_shutdown() [2] [3] [4]. I was able to land the
patches that went through drm-misc, but currently many of the
non-drm-misc ones are blocked waiting for attention.

...so things that could be done to help out:

a) Could review patches that haven't landed in [4]. Maybe adding a
Reviewed-by tag would help wake up maintainers?

b) Could see if you can identify panels that are exclusively used w/
DRM drivers that have already been converted and then we could post
patches for just those panels. I have no idea how easy this task would
be. Is it enough to look at upstream dts files by "compatible" string?

I've gotten side-tracked at the moment so I haven't been driving
progress on this very quickly. I still plan to poke some of the
drm_atomic_helper_shutdown() patches eventually...


[1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b2=
34f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.or=
g
