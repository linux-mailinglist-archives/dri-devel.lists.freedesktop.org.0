Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8759A77E8C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AB210E108;
	Tue,  1 Apr 2025 15:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZPC3IMC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6F210E108
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:07:12 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30c44a87b9cso43763601fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743520030; x=1744124830;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRuO63E+69TadZDhBnj56rdcnGKLJdb/8PuPtgys64c=;
 b=ZPC3IMC2zSNbqlAAou9tsk2Av5f1oZPXztXPOVjnWgpcHYLQxKtpDnBI/ALYZjDxxc
 TBPZMWvo8OqyYsNy0AlGuHjP/TDmNoycDEcUcMDFtjxNSH1sf/qfkEMFgVdpF4xD+Xug
 x0trQRDRkjrPVAnwN06FYz9k1PMjA1DkwJCVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743520030; x=1744124830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRuO63E+69TadZDhBnj56rdcnGKLJdb/8PuPtgys64c=;
 b=ByZvDZ+ccauWMOMndJmjFKvpWKG5o3QahOqBrdpnrrIJyvrU8d5wp0R1UvIBeQgR6J
 wAlN4wlU6JP3Fy9beBHd9A9Zqf9huN9T9ez0vMp7WeJRyLpwc46y3CBIVEL9dnOvrFoq
 5CBf+B9X/c7HDrlCpTx07cSQWcQPhnAEQRDR+fnLggjTA3hizxpZzdY+nVdrHKymFXdM
 Ne6sty5jNhN3UAY9FD4p9DGDCEUGq1iPiJiCjQaOMhFwtgDXS1OGqIHsDm/MyIYtnplX
 WnZpl8yW4H+goR5EbWt4jP0WgOffRi5s14kxCRFHdEdKVJKvSWbmk69wgrDn4uZAL/FD
 SnZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCVFMNixHbs8u0uHcOUHR5YcZ7xW9TQdZCfslXZlTPGAM3v2PwhAnPInbwyoZfNRel6qkyStvbS/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUgU04DmPHW+Qt2gJzBogSANnOrRNVk1oFuO9191pUcmhwUYLw
 pipR/gkJnYbD4o0t6PwHbRpsSo4kObuyIIwEDXNkP5IJCsUjeHW2dtcpmkxDhe/1BKRXfRw0DJH
 J5A==
X-Gm-Gg: ASbGnctqTPUNksBKx6wBVe0xlw3O3IpwGi8ZFoGUE0ZCdxcyC4/AEekRbu7F15RPi4z
 wjUv5V0VK4BfOkAMsrdsz/r6qBzGwiOlh+xjH2EpZ4w4XymmS5lgUalRr0hv8yQ4lqFL4KviiuL
 WDVBC/LAsJBaOmFgIEOTMVzrs14S+w7W9Q7t0b+jqDx1IykjCC4bleZci67r1AfkoO9Uve/I8Cj
 sm4ZuOxEZ8wI1BLBLhmU+WiHCdHlaZUV+1SpQ5GSPtswoTABbf57sZifIAmMmQtU9750cbKaHj3
 F2y4KmPiIoeaEkDuKimejXRoO8927X8vf3W0GQbjkUSCl/IJqSEmboXuIqeBQgWQ65lKP46c3Vy
 fXlobhgufVbVjFIz1cnk=
X-Google-Smtp-Source: AGHT+IHbbJQx4tQ2dG2OrnEDPCXk2siRQ+EAynpKMmwpSLktAtZgX5X5kTf1rRk/ck0M6whNlhLhRA==
X-Received: by 2002:a2e:a882:0:b0:30c:f60:6c6 with SMTP id
 38308e7fff4ca-30de022ecfamr44632801fa.6.1743520029855; 
 Tue, 01 Apr 2025 08:07:09 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2ad3cdfsm17390801fa.54.2025.04.01.08.07.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 08:07:09 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso6758150e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 08:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXeYxA+ymUMIImnVYO6klElkFz69K/HpJu9hF5gBDnTvIDWdKhkbtYGb5j4ya3fN+U1DC1eU0UR0us=@lists.freedesktop.org
X-Received: by 2002:a05:6512:224f:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-54b1113f382mr3140375e87.48.1743520027562; Tue, 01 Apr 2025
 08:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
 <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372>
 <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
In-Reply-To: <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Apr 2025 08:06:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwczaG+FTBv_VxoR=GxNsXemCehkMc_V2=DDoXAepZoA@mail.gmail.com>
X-Gm-Features: AQ5f1JocZ9bptb3nCF0tRv42SZ1SGHwRnbocP0Js32Tf11L8NlMkhlfRqmEasTM
Message-ID: <CAD=FV=XwczaG+FTBv_VxoR=GxNsXemCehkMc_V2=DDoXAepZoA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Mon, Mar 31, 2025 at 6:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > ...although I think you said that the DRM framework ignores errors
> > > from prepare() and still calls unprepare(). I guess this is in
> > > panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> > > code is ignored?
> >
>
> Hmm... Most of the drivers ignore the results of the drm_panel_prepare()
> / _unprepare() / _enable() / _disable(), but then the framework handles
> error values of the callbacks and skips calling the corresponding
> en/dis callback if the previous call has failed. Which means I was
> incorrect here.

Oh, right. LOL, that was even me adding that code in commit
d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel"). It wasn't my intention there to work around the fact that
the panel_bridge ignores the error, but it's a happy accident. I guess
that means that the warning:

dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");

...would also happen any time a panel prepare returned an error code
that was ignored by the bridge. That seems OK-ish to me even if the
comment above the warning doesn't list that as one of the reasons the
warning might be printed. I didn't test this myself, but assuming I
got it right does anyone want to submit a patch to add this reason to
the comment? ...or, maybe even better, we could fix the panel bridge
code to not call the panel unprepare if the prepare failed...

tl;dr for Tejas in this patch is that I still think he should spin his
patch to fix it so the regulators get disabled in the error case.

-Doug
