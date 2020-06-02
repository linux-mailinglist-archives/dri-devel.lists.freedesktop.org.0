Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821791EB2B1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 02:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A636E102;
	Tue,  2 Jun 2020 00:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F696E102
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 00:30:51 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id w20so654650uaa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lqhRyfHZO73MQUhs/Zp+nXZxRgQZUkjcr+cmXrXbt9M=;
 b=M/qPqkswDTql5gLZURjB2misYwhlTWCt6vGvmf0pPgHX1sQ0kYud8H/urR5O3Fd2qx
 uQiopd9+Z6tzHF45NjOHJObxbHM2rftiZjtQtSf/0ebx7rDAxz81SiVJR++rY1SjP3qe
 N/gygBELwUH9Q+fV4LeSdiSQk+ZdV0jg2Xh+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqhRyfHZO73MQUhs/Zp+nXZxRgQZUkjcr+cmXrXbt9M=;
 b=QCgBYXTfkn4ps9LMVl7S91E2HzOvbaMHZT34etA/8TMYE8frBIEKx0R7oZ30/4wNZO
 lRDZslqgLAz9XW1MkiW0aMvS/Xw71m4F1NptVpkkRuTcmeEVnuDpXr+9mWlWfKMiqlGq
 OdYk6kPSJ+1Yyan+Bx9ER41e55RXweaA9gA5+A3IfbtJhU+Zfgkvn9EdbMybHB0QJjq9
 wg/kUsKAQpDmy8xbC4eZJ7WUP8hYI9tJo27e5CETT9FP3LU7P5cAmUcaN3BunTXxYC5s
 MF5CH1a5e1bYMl/gs5xXub34deG4CJ9CSOP9Vt1w/H+PXGuV2L9L/e2NBCYNFqixokRY
 QzMg==
X-Gm-Message-State: AOAM533B/Rv50ypPaaRg8NZ9quVmyX7i5soGhPpn2JOo9z3hHxwcjG3p
 civzUbZCXB3CnqyaKYENofDtYEaAHo4=
X-Google-Smtp-Source: ABdhPJzAH5dTQ//mHZ0ih1xTvk64ULeckenwWHG1905/w0u7DhNeAsW5XvuGZkYzog2U0u43DFEa4A==
X-Received: by 2002:ab0:2eb5:: with SMTP id y21mr1061554uay.92.1591057850466; 
 Mon, 01 Jun 2020 17:30:50 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id p75sm189119vkf.1.2020.06.01.17.30.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id k3so1055465vsg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr16770923vsx.169.1591057849210; 
 Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-7-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-7-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Jun 2020 17:30:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUiczTNUT6SU5WMV+Vye7p4YhGb+ZSuJ82NW7oSH2yHg@mail.gmail.com>
Message-ID: <CAD=FV=UUiczTNUT6SU5WMV+Vye7p4YhGb+ZSuJ82NW7oSH2yHg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm: panel-simple: add LOGIC Technologies panels
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> +static const struct drm_display_mode logictechno_lttd800480070_l6wh_rt_mode = {
> +       .clock = 33000,
> +       .hdisplay = 800,
> +       .hsync_start = 800 + 154,
> +       .hsync_end = 800 + 154 + 3,
> +       .htotal = 800 + 154 + 3 + 43,
> +       .vdisplay = 480,
> +       .vsync_start = 480 + 47,
> +       .vsync_end = 480 + 47 + 3,
> +       .vtotal = 480 + 47 + 3 + 20,
> +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,

This is different than the "typ" mode from the random spreadsheet I
found on the internet:

https://logictechno.com/wp-content/uploads/2016/11/LTTD800480070-L6WH-RT-v1.1.pdf

As per my other comments, I wonder how important "vrefresh" is and if
we should include it.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
