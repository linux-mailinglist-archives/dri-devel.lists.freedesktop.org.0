Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBD59E6E0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 18:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297610E5F9;
	Tue, 23 Aug 2022 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFB410E283
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 16:18:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w20so2944110edd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qBmENqBoQXy/+aSofPNfjZLLSbSwHzLJ2Q0dBEjqihk=;
 b=c2nbAKyW0RV/CCqHslllWFfK+HE+RggEN0oTuMFboUEuR3vdgq3130ADGjsOBvd1Ea
 kzXkYpD/Y/x/Jtk6QnD392r4MCN/i+u1seTWeYfdY1XOY1mCtMXhzyiFiwpbieajUNvv
 x2wCzv76IXxenL07SlB6L8U4jlW69Oyo/3gdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qBmENqBoQXy/+aSofPNfjZLLSbSwHzLJ2Q0dBEjqihk=;
 b=qAMP/m26bZmwPtdCbbiWeb8U9ppewTLa67cR2vVrtxEQicSNWpxNEYzvkl6jcnqg0R
 namNopP35lYSDReBfvFT7vuhBU12/GiYZEu4hucvDpIzlv3zwB1TLiPpPblknkZD3heP
 2PKnKzR83jFGThBDFE2plbKCRTJS77XhnRa5AAlTcBHXRg/NxqwEDFNUcyHQ2y3M1mEV
 9FurMKwoGRRNkNmT63OK3YJrAJ4ONCCCIhet2Arw95FoFA/8obR4nyv7/hlLWpzuyu7N
 MzRD5rgj7udArD/2x5JSUd2nYJTY8/KWSLVFFPfXGteOAXiekpRre1HMZI1D6lQDtPiV
 DpfA==
X-Gm-Message-State: ACgBeo2ICD2umFJVqjCovZScf/OPV5/xAOATx0OeV5pke8WNFYow6pS+
 uu/29LxAkoMZMKb66sbSDDs8zWSD0q37ZPhB2Gs=
X-Google-Smtp-Source: AA6agR5FvsxrpaesiwTtfGgb1rrvSJUPf0mHRo9bejq8a8ER9V6X3KK9+JZm+hZcLfAam3PAHQoc3Q==
X-Received: by 2002:a05:6402:3210:b0:43d:20bc:5e4 with SMTP id
 g16-20020a056402321000b0043d20bc05e4mr4292574eda.276.1661271501536; 
 Tue, 23 Aug 2022 09:18:21 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 fb17-20020a1709073a1100b0072b32de7794sm67073ejc.70.2022.08.23.09.18.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 09:18:20 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so8008707wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 09:18:20 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr2650530wms.93.1661271499947; Tue, 23
 Aug 2022 09:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220720052841.1630-1-steev@kali.org>
 <20220720054152.2450-1-steev@kali.org>
In-Reply-To: <20220720054152.2450-1-steev@kali.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Aug 2022 09:18:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9Z49Qmw+Dy7C7x=c5k3NjmqaoRxbU+1BJEje3t-SW7g@mail.gmail.com>
Message-ID: <CAD=FV=V9Z49Qmw+Dy7C7x=c5k3NjmqaoRxbU+1BJEje3t-SW7g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: add IVO M133NW4J-R3 panel entry
To: Steev Klimaszewski <steev@kali.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Johan Hovold <johan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 19, 2022 at 10:42 PM Steev Klimaszewski <steev@kali.org> wrote:
>
> Add an eDP panel entry for IVO M133NW4J-R3.
>
> Due to lack of documentation, use the delay_200_500_e50 timings for now.

Doesn't actually match the commit, which uses "delay_200_500_p2e100".
Fixing while applying.


> Signed-off-by: Steev Klimaszewski <steev@kali.org>
>
> ---
> v2 - actually mark it as R3 in the change, not R2...
>
> I'm basing my information gathering off what I could find for the IVO
> M133NW4J panels on panelook.com.  R0 is glossy, and mine is not.  R2
> says it is discontinued, and I am just guessing that I have the R3 as
> the Thinkpad X13s just came out, roughly a month ago.
>
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 5024ba690abf..870b98041c60 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1883,6 +1883,7 @@ static const struct edp_panel_entry edp_panels[] = {
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
>
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),

I resolved the merge conflict and applied. Pushed to drm-misc-next:

0f9fa5f58c78 drm/panel-edp: add IVO M133NW4J-R3 panel entry

-Doug
