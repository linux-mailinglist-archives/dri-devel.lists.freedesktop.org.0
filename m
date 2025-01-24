Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E75A1AF6C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 05:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A27010E1B9;
	Fri, 24 Jan 2025 04:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MQoA1nuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7A110E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 04:35:29 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so2026809e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737693326; x=1738298126;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/BuiNKJ6yVH7SYucYouITYrXzZHm2fJW+U85RQTjvo=;
 b=MQoA1nuGrVdbWhpYSfCQyzrc37m7ltsCZBvQOeQQIJSd5yh4+dDohAUk2jGRqRgEus
 /8PGzOvN7UEvy0rMopcZtN3HHsmKci4t25MQZEYuMkzKvX50YRW37Ga+FwKE/8UInDdG
 oVJR0nPdpeAONi3bqF8RaUVIv18KoHZuwyNzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737693326; x=1738298126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/BuiNKJ6yVH7SYucYouITYrXzZHm2fJW+U85RQTjvo=;
 b=h+HlXo6sKwyQCVeRMFhE7amPhTB3zgFy4UZYCaaaA3//M0frlmYmX+lloFzevzEZtr
 yuwnNu6NVogKMCHUBMxcTMTH6CQv0Qkyyk0BzWa9ogKbm8ZActz4Qnj5zglZSqP1+AyS
 u2K9mFRxFeyaN+pP4INgjDzeMgTLCKmIYQk9ZTR885abQgylxQNUuf5ZbXv9zvQ8q/9g
 5dsXDsMCBs/QycAccW+TAsfSK/RTXKSNJVsqo+nDPZnCp/fOe+KoOz5uW5mY3kUloUlG
 3PVdmVIbVc1PBAO8Y6SFyIOhIq6+jWWQVbiMelIkcWASOE9kn411LGoXelgizS5kacX+
 yVyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7hsvcKtKtOWeN4yJR333F18JzlkdfFDLVGKn1rXJdfmHGYS8DPnqTkmxjMrk9+XRzO0Vo3wm+Nds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQc60V9AId0NNiJ32t5dJ649AbDlJeHuT91rF9FvkHAKnPVaLg
 Vdsa2pc1JWxpM6+7iSKgfqcq0Nu/k8owgVBREPGoGxenQ5E1UHbmkrmu0qNLu+E1cJgsBEK2EXW
 AX1zI
X-Gm-Gg: ASbGncsmzdSR/Lwj45bTEParK69yApvSOKz4IvWgwnrzrV5gjRr+2tNIExpmmGMAaQS
 obO1V2SRBltdxHKITQtn0hO0JiyQzuVCbufKj2S1e7ggpukNpz6MSwp5Ej3tV9w4IkRBOysjRBe
 l5MZTJAOvK2sQdbN9NK4Zrstk7X/gMOy4gSVFy+qwBmbKEI3+UW6qqx+co/UPIR3jjLDF03aqTx
 mRFjZNya/nF3/OeCU1EtTKsdBSAAtWJp6G5+JhXOli56ViG1JcX2rkAbxmZ1EnQWNCjA/HPoquQ
 1Of20gt3Hlc4jmgVxiDpx+u4HSSJ9Wjv9URLJeZRL51iz5jAMjKRbOaG4Dk=
X-Google-Smtp-Source: AGHT+IEuxjwPhCBVFHntPrPYClI8fSM4VyQn6noPlYqtNvBzy0WdTxmXUSopEx0W1Bn6Zn5sTBdgkg==
X-Received: by 2002:a19:4314:0:b0:543:bb32:e3fb with SMTP id
 2adb3069b0e04-543bb32e4c7mr3363093e87.18.1737693326213; 
 Thu, 23 Jan 2025 20:35:26 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237459sm157424e87.106.2025.01.23.20.35.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 20:35:24 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so12396821fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 20:35:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnu17C1UCD88a5INflxCuJgTEsmHzjHAH4odMXf+Z544YuvI3SS6/y2MaIlWUA2ugv8Q/vf6aeW10=@lists.freedesktop.org
X-Received: by 2002:a2e:bea1:0:b0:2ff:d044:61fc with SMTP id
 38308e7fff4ca-3072cb249a7mr109162531fa.33.1737692847757; Thu, 23 Jan 2025
 20:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
 <20250123064758.743798-2-yelangyan@huaqin.corp-partner.google.com>
 <CAD=FV=Vr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6vW_azMARZQ@mail.gmail.com>
 <CA++9cvpBHN-i82mMwd_WZZrDGEQog2DmUSWcE9hDxsREyhNdrg@mail.gmail.com>
In-Reply-To: <CA++9cvpBHN-i82mMwd_WZZrDGEQog2DmUSWcE9hDxsREyhNdrg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 20:27:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UNkjPH_i7+wJqbPGpugTmo=Ly2_1bj=-1SKS4fiaRAFQ@mail.gmail.com>
X-Gm-Features: AWEUYZmsKLiAzRAqlcAQdor_5g31Vg2LFMBTq4YC6Rmtxp99wgbUKMuPl0RD4r0
Message-ID: <CAD=FV=UNkjPH_i7+wJqbPGpugTmo=Ly2_1bj=-1SKS4fiaRAFQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add compatible for
 KD110N11-51IE and 2082109QFH040022-50E
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Thu, Jan 23, 2025 at 7:54=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Hi Doug,
> Your suggestion is very helpful to me, thank you.

One note: when responding on mailing lists, please don't "top post". I
personally don't care that much, but many others do. See, for
instance;

https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

I'm sure if you search the internet you can find lots of other
descriptions about top posting, including the usual:

A: No.
Q: Should I ever top-post?


> I confirmed the controller chips of these two panels, and it turned
> out that they use the HX83102 IC, so the correct approach is that I
> should add these two MIPI panels to the binding file/driver of the
> MIPI controller of HX83102.

Yes, that sounds correct to me. So you'd move the bindings patch to
add your compatible strings to:

Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml

...and you'd add the code to:

drivers/gpu/drm/panel/panel-himax-hx83102.c

...when you do this, please make sure you're following the conventions
of the "panel-himax-hx83102.c" driver file, like using the
hx83102_enable_extended_cmds() function when appropriate and using the
defines like "HX83102_SETPOWER", "HX83102_SETDISP", etc.


> I would like to ask if I need to release a
> v5 version or resend a new email if I do this?

IMO you'd call it v5. You should probably drop Neil's Reviewed-by tag
in this case since it's a major enough change that you'd want him to
re-provide a review. You could add a note to the version history like
"Dropped Neil's tags since V5 is very different from V4" or something
like that.

FWIW, for the bindings patch I would personally use the patch description:

Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC so add the
compatible to the hx83102 bindings file.


> Thank you again for taking the time out of your busy schedule to guide me=
.

The best way you can thank me is to teach others that you're working
with the lessons you've learned about working with the upstream kernel
mailing lists and sending patches. Maybe provide some internal
documentation for other new engineers to follow. :-P

-Doug
