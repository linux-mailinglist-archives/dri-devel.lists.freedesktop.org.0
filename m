Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390C808FCA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ABD10E92E;
	Thu,  7 Dec 2023 18:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085310E92E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 18:24:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1d93da3eb7so150005066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701973445; x=1702578245;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1+mw4SiyS10BP2umvAUCHz7TwGmpLRvebGSA3Xe9k4=;
 b=PBvx0DfjStEPUG4+nOAe9XCyKNJatjKjDCHnw0//5ZXjSeczDEYn9V99sZiAQX/Vrb
 Ape2U81EWh1X34KnqUuSdWb+q30uK+Srlqo0rFz6/a3u71IWInyfTLQyDPSB2iEgu+Ox
 6bx0fR41q8i9nxJP148hBrTCr+gv0cYlX1WJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701973445; x=1702578245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1+mw4SiyS10BP2umvAUCHz7TwGmpLRvebGSA3Xe9k4=;
 b=LyamMAuu1ldstLaZl3gL1OfHiAUq8rBGTh2yhlyHXjg5kaetRRMrPnvm1WGN8TO7h3
 0boHK8aeC6c5cOjugJPrAebAYQ0XCTpXmRGssgoHSIDt+27/wNzCCe3VnqfY1sNSIpRS
 xtAMNgUGANiWW+ZA318QQnllclkXsRXb2DM1WORrzPNzcCTQkT/njI5lR0EmIZm1wjl4
 vmX3Icido/8A6bL4AiEPnl0NB1Tk1vYrt9JwxCsc6AHA4LUwSElsl31hMQJ5R86lDuyY
 /nzv1F+8Fga5+6faLhu/nwMf2ZYgKldC6C8c3K5mFve8X/fIY7fDoKiMfsXBIphefEgN
 wDPg==
X-Gm-Message-State: AOJu0Yxt5bY9v2aWPKZFg24t9sA5VpZ7Cax63JUJd3hsta8TO/NwmG8Y
 F6Psasc8WsGvgYtRhHojaatWXucdsNJvT/p3B6v7q6Eh
X-Google-Smtp-Source: AGHT+IHW/u0wV1BWE7ao629qGoHP2BBs8BZbllDtVVHfTgul3KVwfkSUBHOLNs6Ur/hIcAuh5o84Hw==
X-Received: by 2002:a17:906:b896:b0:a1c:c318:4bd9 with SMTP id
 hb22-20020a170906b89600b00a1cc3184bd9mr1701542ejb.154.1701973445169; 
 Thu, 07 Dec 2023 10:24:05 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a170907160d00b00a1c9f65a31csm58407ejd.4.2023.12.07.10.24.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 10:24:04 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so3765e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:24:04 -0800 (PST)
X-Received: by 2002:a7b:c8d3:0:b0:3f7:3e85:36a with SMTP id
 f19-20020a7bc8d3000000b003f73e85036amr226433wml.7.1701973444086; Thu, 07 Dec
 2023 10:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-4-treapking@chromium.org>
In-Reply-To: <20231207081801.4049075-4-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 10:23:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8hN=vfXRggRZgL7dPtv1ptn_vxgTChvzBJGx+mbFaVQ@mail.gmail.com>
Message-ID: <CAD=FV=U8hN=vfXRggRZgL7dPtv1ptn_vxgTChvzBJGx+mbFaVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/edp-panel: Add panels delay entries
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add panels used by Mediatek MT8173 Chromebooks.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-edp.c | 39 +++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
