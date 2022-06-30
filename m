Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527D5626F4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 01:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816CA10E302;
	Thu, 30 Jun 2022 23:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B7B10E122
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 23:21:41 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 b23-20020a9d7557000000b00616c7999865so547333otl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=kUR5Qxlkv2VG+1nVFyFj0M5xEGNTEOVvRQq3OJdVQgs=;
 b=PSntTRcqPoByfC6Hz4lzpHn3LJzLyjZ6J9v2Gw/9CwqDwUG5K5pYjyGKE60IUpqemz
 csOfaY/EhvtPQSCBjmwtt0xkC+vziMex47gWhtn8+LjQKq3z+dOARW9sQ4F9QC0LZsCz
 vX8ShPn0VqsbDj01CzXSySigIXkRcShlNs8jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=kUR5Qxlkv2VG+1nVFyFj0M5xEGNTEOVvRQq3OJdVQgs=;
 b=Wqk1T9o1065y2LTbwYxLxVvZ+K1/Lo1gbsp2ffHOJ5Utx6XL36CH+S8utIU6kONgJf
 PfdXNWeDmtDECIX7SwN1YDf/uSpM/3BwoRn7iwzoHRX4QoJIrtVC2paghWdPdS8L29cl
 xx8za+/LlKf84DAhNTXwtTswbOBm+Cf1nM2278V8EWx0pqMEasUCFnRN0594cv4fjrHe
 qbcCYJwENQxoTIJjK9WzG7jBxNPKsrS+Do3ZokiguuV1G6SnqZfp3/x1ztyHIJPGXLnJ
 MARB+AJvfAc8ZI2lptpDGsFm5MPa+YMTDW6o6djPG7RwRbYE1miIDN7DqEruuOOqIycO
 sJLg==
X-Gm-Message-State: AJIora+L2bqr97VqWjE3ohLCOWw/Ko3+pmKMQQruhUeaZDYtM6J324rZ
 wirn6Q8HVqXM90OuamoO+ARn+eXeWxWiMz7wDNf2+g==
X-Google-Smtp-Source: AGRyM1vqO13MJJ6cDRR/NbBgbmt0dA/vGMSsOaDTCVXU7xFDY+OyANJR8RR8KiHUFljvGHszFB+vN6QObK5feiOxPBY=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr5246393otl.159.1656631300928; Thu, 30
 Jun 2022 16:21:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jun 2022 16:21:40 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
 <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 30 Jun 2022 16:21:40 -0700
Message-ID: <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Prashant Malani <pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-28 13:56:22)
> On Tue, Jun 28, 2022 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > I suppose none of those things matter though as long as there is some
> > typec switch registered here so that the driver can be informed of the
> > pin assignment. Is it right that the "mode-switch" property is only
> > required in DT if this device is going to control the mode of the
> > connector, i.e. USB+DP, or just DP? Where this device can't do that
> > because it doesn't support only DP.
>
> If the anx7625 is used just to route all lanes from 1 usb-c-connector (i.e
> the USB+DP case), a mode-switch wouldn't be of much use, since one
> would also route the CC lines to the built-in PD controller; so it will
> already have knowledge of what mode the switch is in.
>
> The mode-switch is likely only relevant for this hardware configuration(
> it's "DP only" in the sense that the USB pins to the SoC never go anywhere).
> One only has 2 SS lanes each (from each usb-c-connector).
>
> Since there is no CC-line, the anx7625 needs to know which one has DP
> enabled on it.

Can the CC line be "captured" and not actually sent to the anx7625? I
imagine if that is possible, maybe the CC lines would go to some
micro-controller or something that did more typec management things and
then the anx7625 driver would need to do software control of the mode
and orientation control.
