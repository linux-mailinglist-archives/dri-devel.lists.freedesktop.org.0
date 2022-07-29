Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7D5848FC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 02:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5714310E1C6;
	Fri, 29 Jul 2022 00:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0F510EB95
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 00:18:35 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a89so4061150edf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
 b=EBDfKbN161jfJ2QBSHpfJwdM19oVk8aVJ4xikkdC2kuXRN+8QRATaPmhq8E7nW+CwY
 0BgTL+iXQpYb3/SFbGQJMC8MumsErqG7MH3njWLFzrqPP1pRCjSDD9mvh9NlaP21SyHV
 gJmZF+TK74SlIlGljuDFIZFOnwtouZg04HSZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PyBgADkFmRZGD19YV3bJfXKekitzQhA7zmplwDjvl4A=;
 b=7B36LJk57cEJyN9fBk+SaEwYHyZxfFjnj0Zq6xMiqBeUdIXs9yYpIo6DG93yuu65jR
 UfCILpcQC7cSH1pCSH5V3p1VO94SvSagM0t+jtSonz28YoCu7sDe3+TZe6SocuNUhfxq
 xAO0LMs72Q2gv4HqvHXTf1dha+iCSX0ZQRmJLU2GVsR4e/WagSS7Pr58dPPQ8EtDWy7I
 2qvl1DUgVtUkg7OVItjtV4fL4OyY+qk3Q4Oc6aqxYt0VOrAgoWPjIWGs05srGCdsEQhh
 NgE5h3iW8PeneSmWAzkXx5t45gNl4VUEAtRRngbN61dtKLMFXUSyCNBYrtJ34LwATrzy
 Fasg==
X-Gm-Message-State: AJIora8vV3iY/nzUdLMgJZZG4sG8we+PfFHDiaMmZK7sNJp/wfolC4Qd
 tLe79orB1N5se0mbvfUUGr5YN2N96je8pFQL
X-Google-Smtp-Source: AGRyM1sz5AERDw+OXmqz7R/EnufANcM39kA8NcXBg/tiRKc5AtxuSfBFvIs8mEIpomPtyeaWxdW9Yg==
X-Received: by 2002:a05:6402:388b:b0:42b:5f20:c616 with SMTP id
 fd11-20020a056402388b00b0042b5f20c616mr1295803edb.50.1659053914990; 
 Thu, 28 Jul 2022 17:18:34 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 g17-20020a170906539100b00722dcb4629bsm977484ejo.14.2022.07.28.17.18.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:18:34 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id k8so1989092wrd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:18:33 -0700 (PDT)
X-Received: by 2002:a5d:6843:0:b0:21f:1114:fc54 with SMTP id
 o3-20020a5d6843000000b0021f1114fc54mr146662wrw.138.1659053913662; Thu, 28 Jul
 2022 17:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1657544224-10680-3-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 17:18:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
Message-ID: <CAD=FV=X2Ci6G5c4LNibKTWu5ZC962j8QeHpG2nn7uCCoRCuFdw@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm: add helper functions to retrieve old and
 new crtc
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 5:57 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Add new helper functions, drm_atomic_get_old_crtc_for_encoder
> and drm_atomic_get_new_crtc_for_encoder to retrieve the
> corresponding crtc for the encoder.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  7 ++++++
>  2 files changed, 67 insertions(+)

I don't have a lot of intuition about the code here since I haven't
messed much at this level, but what you have here looks right and
matches other similar helpers. I'm happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
