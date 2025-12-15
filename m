Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE1CBEDDA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 17:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636C289A4E;
	Mon, 15 Dec 2025 16:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FFx8jtlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70E89A4E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:20:17 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso718394066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1765815613; x=1766420413;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3Zj2/WKCy5dKa//nCHikFh09+ySjzJtGTKmPrUX2BY=;
 b=FFx8jtlcVOq8vvNT4p8hQDKvKrl1kf7df9GMCWBqH7FECdaaonuEKzGrf9h9D51M/m
 86Q6KNYi4gDn1iqvUQ3jHmwB1OuJjav+eSFAMCWBBZXvWuwTWfxFo7dDkozeqvkLDP+x
 3EWzMixPljNjy2gOxbgWQzgkZcTQ5gsuXQfGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765815613; x=1766420413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o3Zj2/WKCy5dKa//nCHikFh09+ySjzJtGTKmPrUX2BY=;
 b=Fb0NT4COSfM2mzMevsckg9DOsdL1E12e0G/G1aig0fzrAHbJgmIdGiddsHxGljm29h
 tIukPW//APSBsJXR0e/Rp4zs8nCKwWSxOPKCM81G5DgWDoOfSNMNZymx/4iI0gXozUTM
 CJezenjpkCXkGEruvXR07qwjRcujoQXtJrAewZBjdwfKhuJpWA207+00hjilscQB0vjY
 iOhGEEKFwXR9loxjVV6nDI1u2c/N0qvKXoaCfTT1Gv7FpI1zB+xRO/1uG9NZd2vI9016
 yWmJ06MiSoijau7gknZPi63mL3wbHe5kGt0SxYc7G6YTe+N2Tb0GWxdRot4p5bJxZGYF
 E5dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbBUIoUEvzrrmjk7LjcOjSU2HMiyX+Tk0k+8C/BbjYOrnXTfh2q1n2/MUI7vQIuG5N60G7JCmFkzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiZ4iT40CBkOFToA0d0KfD7rqODHrPAGmq1f4neLD3Gt5yWYXV
 Ug+KxzIjXlLHOSoyjjH9XNCDXqXPkqzMe64oAtyZ1u1ITxwhY2tSX4SWZ3xhRPOg0MFUUi61moW
 Nv5UHBQ==
X-Gm-Gg: AY/fxX4hHacYv2EQgYaFZhqPXG39xsePK7/XFlWymR19WOxhEtql4eaLNWbXWdHaYI5
 fa5WXF9IzieNUnMxUfJTqOqLR+9d+4Jut41J2V4iDQOYjnVX4acLXyQdwVhicRBtgeruUa3uPF3
 4pZpNL+c4aBtKuY0q2HtpkzV6GyFnK/O7F5Tcg8WU4F4kUW1amhhR31gBQPrT/MQ47D2Ot2f1X9
 kOKSpi4gXhUhKfDo5T+Ny8CsYBZTQbe4eZlldjVGaudKWYsPGwGGwADSlkPpuZYwlQQ8vot0XBC
 Sm9+fRFniX8Il44u8Uurb99pymwHHjoj0bbWmcu8BgR22weEotFn/r4vmy7NyXSTFVcofSTsGa/
 MhHqgDRPv7QqWJ/SnpzGzbfgovgNn0eb5Bescl+4KND+2oqAhsJnOyk+1VbQhSu3Gz5j8MCEGTq
 ZMaqf8xyoHdohcnXFsl3rPG3ssoGn+H1XHI6LLFfw8QdJsKe1qEQ==
X-Google-Smtp-Source: AGHT+IFOoBMqlGtE79IjIBYa+rj55FiuQWxSyFgiWYNG3vKN4rcEy46ICrbbJrg9kORf6bRGaDwUlg==
X-Received: by 2002:a17:907:728d:b0:b73:42df:29a with SMTP id
 a640c23a62f3a-b7d23a752cfmr1140259866b.59.1765815613335; 
 Mon, 15 Dec 2025 08:20:13 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cf9f38778sm1444630066b.0.2025.12.15.08.20.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 08:20:13 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so2744706f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:20:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVG611H/G+Vzv7hwFci02gfrkwPKBRhJCXH6vorJARt14Lz8sj+TaSR4ye0Kp1BuBQMIElBRDm0l1g=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2909:b0:42f:a025:92b3 with SMTP id
 ffacd0b85a97d-42fb44d4395mr10374894f8f.2.1765815611883; Mon, 15 Dec 2025
 08:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
In-Reply-To: <20251130-sony-akari-fix-panel-v1-1-1d27c60a55f5@somainline.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Dec 2025 08:20:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wq=hcxsKoDVZ-S85Z6Y+ea8rc_qiR-iBq1dwu1jpbvKA@mail.gmail.com>
X-Gm-Features: AQt7F2rjeI17_rnXICCk1mYtC5AH_62rLxVMbrFcyD3F9uvOT-gxE9nL0P_o9UY
Message-ID: <CAD=FV=Wq=hcxsKoDVZ-S85Z6Y+ea8rc_qiR-iBq1dwu1jpbvKA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Sun, Nov 30, 2025 at 2:40=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The DSI host must be enabled before our prepare function can run, which
> has to send its init sequence over DSI.  Without enabling the host first
> the panel will not probe.
>
> Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI h=
osts at modeset")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 2 ++
>  1 file changed, 2 insertions(+)

Pushed to drm-misc-fixes:

[1/1] drm/panel: sony-td4353-jdi: Enable prepare_prev_first
      commit: 2b973ca48ff3ef1952091c8f988d7796781836c8
