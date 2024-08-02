Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B0945875
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 09:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4B10E0E5;
	Fri,  2 Aug 2024 07:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CTCbY0Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B9110E0E5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 07:16:20 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f035ae1083so96391921fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722582979; x=1723187779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+sapha34Lxn3Kxqsm1snFFVFaOu7AQoIhw5OgcrrpE=;
 b=CTCbY0LtgSbjrlF4w/Llmemey/EAHZurT6ANMGkdyrNWn2N23kNdQs1+swWXZNh923
 +HZsBDN9L4fcwy8P0WGxjXaSPT8qaGofPciiVe2un9TrOYdk33k4RNFB8EkidjoWwxhT
 zHWorDzjPGfmR4LS3Nqme0s4H3PFZFLzka2lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722582979; x=1723187779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+sapha34Lxn3Kxqsm1snFFVFaOu7AQoIhw5OgcrrpE=;
 b=lGM/cgFd1ixJMUd++BUu1zEQYAlc/UBjDpejuQwZJNKrqxQtoJsKXK3IENFUQDO7Ve
 KUFj2Q17qWcIxGhe1R7nChUPLOohQmS/OmjemMDySir3ehG+VRu+ci+hYVPUz3WdGegg
 xyfKCWfOpssMhsVqaz3XhzA/IyabYh/YbUXvIQgo/ySRW5iJak4OJkCJBnXdku48gGy8
 w+xmfvZm6RCYk1F0B44KZrLhfwQvkiB7XmbTUg6fAEj5s+uuW9Hieun2qoAgEe9YyA1r
 UWjecxydaz6x41Vyx6ELpX1dhEmlpyP5XjcElTWfUgfq8nkRND/NKhfbpTXZUavF+RJ3
 Qtlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0v+tL0sJb76NN3CxOmfcpt/Z5p+egBDWml81VZ5gIh3O6H9u6VA8Ygm49NL68UBZlLEY+pDQtF3y0f+3HCx70SIPWNS1fJs/oeYoVtvzu
X-Gm-Message-State: AOJu0YztsQdg0V+igyKIbmVl9j/JZK0iuX9SmtXSpdCnhnW6Nt1+2fcT
 oZAUG3qJ8uV278vpo7M7RmXNq8Xb6AA5ZJtxwcjGF7g2arJWFVaEoc7xJoy7Xq9ibJy7b84SbZR
 YT43uef9b1Ash2uJcCvRKk5yb5G0aVfoumHMl
X-Google-Smtp-Source: AGHT+IHlBY9J6wgUSTXFPOTeGDo91vUxRviE1wDTIp9ZeLiUGJ8zLKg/jFuA/tu3qejE7r+JLa1Geqa6c47CZ1VZMic=
X-Received: by 2002:a2e:9081:0:b0:2ef:2ed2:25b1 with SMTP id
 38308e7fff4ca-2f15aaba811mr17537031fa.20.1722582978759; Fri, 02 Aug 2024
 00:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
 <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
In-Reply-To: <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 2 Aug 2024 15:16:06 +0800
Message-ID: <CAGXv+5EkZCDT4LGvSGqHmHu7SmnH+63WE4A=ZKgB4MsBJAsHYw@mail.gmail.com>
Subject: Re: panel-simple-dp-aux: "DP AUX done_probing() can't defer" on
 MT8186 w/ Collabora kernel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 30, 2024 at 7:24=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, Jul 27, 2024 at 08:33:10PM GMT, Alper Nebi Yasak wrote:
> > Hi,
> >
> > I have a MT8186 "Magneton" Chromebook that I'm trying to boot a kernel
> > based on Collabora's for-kernelci branch [1], using a config from
> > postmarketOS [2] (intended for that), on a Debian sid installation.
> > This sometimes fails to enable the display with:
> >
> > > panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer
>
> The error is caused by mtk_dp_edp_link_panel() returning -EPROBE_DEFER
> (most likely because something is missing). However this callback must
> not defer, it's called at at a different point.
>
> The actual issue seems to be in these lines. The callback tries to bind
> all components, however it should not as the DPI isn't available yet.

My guess is that I upstreamed an incomplete external display pipeline.
The pipeline is still missing a representation for a mux that routes
the signal to either the left or right side type-C port.

I will send a patch to disable it.

ChenYu

> [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000=
 to encoder TMDS-32: -517
> [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
> anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to h=
ost.
>
> >
> > I know this is a weird out-of-tree combination of things but I've been
> > asked to report this on the mailing list by wens on the #linux-mediatek
> > IRC channel.
> >
> > [1] https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-k=
ernelci/
> >
> > [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testi=
ng/linux-postmarketos-mediatek-mt81xx/config-postmarketos-mediatek-mt81xx.a=
arch64
> >
> > Serial output from the system starting with dmesg and some more info co=
pied below.
>
>
> [trimmed the log]
>
> --
> With best wishes
> Dmitry
