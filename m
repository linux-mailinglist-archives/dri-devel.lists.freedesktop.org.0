Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942C558754
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584610E6E1;
	Thu, 23 Jun 2022 18:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71010E6E1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:24:15 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-101b4f9e825so531562fac.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7KHPbnVlHnkB0EVrXTQL+f9XDuEF911Owwju7ndnO+8=;
 b=limsfAyKYwLYVD3+t6n9NGH70Er6BQNn9CewVXcuC79xXTCHbq+EpwRtFynJnAABb+
 Udmnfdc3hKWQe+U1Bz1e3EefOpEcrWENgi3SzraOMfBwt7ACXA0EXag0R5dnndzUpd0l
 MyHPFG5pARv5QWIDZ2uIIlw0r/9lq0WLQp6vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7KHPbnVlHnkB0EVrXTQL+f9XDuEF911Owwju7ndnO+8=;
 b=habAPCxSVupPY7SS9TGQHEalGJdJlvjn9b4fVMYA1kFmmYAhNMjKrgdyybo/HAnJou
 Qm2mb5LpZgHw+e4REpB5B+nmhvRCknO/OevQU3YmAEcgrZo4krbBX27/db/YFu6alHIK
 KWahmB2nzbld0yufdBrS+P4gJYJdkRZsF8yfj44nC5tei+cRGlWi5Ix7UHfQLB2vtEkG
 YjW1y6HkRRU+QoTG1HxnxMG7bIn32oclBm4A5lSzssVhjyV4sQQF41f0v1FLZukQ77JE
 2JRHcWJ2R80mXTRoFadaFS9EfqcVYRt7kN7gDQG42uQCGEvZXJ3VW85YPRRO/UYzp3Ku
 J5Hw==
X-Gm-Message-State: AJIora8WfPD/m/SCUexE1et93NgQfhIiV/CJ2a+vGC1jLfHwm0UJEGhg
 EbQMKJ6ZWCqRktfQc/2oMj2/X6jM0KTFI1Mr6QEpWA==
X-Google-Smtp-Source: AGRyM1uhIlpWAbcw8cS7wBzEeQ5p5CUBwyJ92Exd/1lBwAueqZGyRgRUnjHMsJ5S9ITyrl2U2VT9T3e8pQbKYfsOYPY=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr3149970oab.193.1656008654604; Thu, 23
 Jun 2022 11:24:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 14:24:13 -0400
MIME-Version: 1.0
In-Reply-To: <20220622173605.1168416-7-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-7-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 23 Jun 2022 14:24:13 -0400
Message-ID: <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
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
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-22 10:34:35)
> From: Pin-Yen Lin <treapking@chromium.org>
>
> ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.

How does it work? From what I can tell from the information I find when
googling this part[1] and looking at the existing binding doc is that
this device is a DPI to DP bridge, and it outputs DP (probably 4 lanes
of it?). Does the 2 type-c port design work by transmitting DP on two
lanes of DP for one type-c port and another two lanes of DP for the
other type-c port?

DP could be one lane, so if this device is able to output one lane on
any output differential pair then I suspect it could support 4 type-c
ports if the hardware engineer connected it that way. Can you confirm my
suspicion?

[1] https://www.ite.com.tw/en/product/view?mid=45
