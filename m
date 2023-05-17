Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F2707BC3
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621810E0A8;
	Thu, 18 May 2023 08:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BA910E122
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:04:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ac7de2b72fso7233381fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684328678; x=1686920678;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=RXTNzq4gj2DUSkJyMltIversR9A5IgG2YoQBaj5QOI4=;
 b=F3mdyJ0H05m0mG6Ij3Gl3+HDT89YBI6PdRTY5+N7j3g62sivDD6f7o8AROyQXynSb4
 kVy2pWUHXkhce2WlOaKVLjemkkiDEmM+/EJoY3tOGzC5PaFqmvjvoYZcpFWZcBUTpNCK
 SJS2YN1mRy/AP8KlBZG9cSLU7ncmj0LlBZvzcxvVMmzzzZj9dz4hpGWKY7+jl0xfZcP1
 gil+7EJT/tj07+4n09esOqDqKGwHkcrLgjXPD+Vfz/JEu+nCml32KQ9prR0mHHm0v2tT
 vuf7LW+8wdmThpWBHh26vjXPpxY+kjcOkRbRdoPcfpN9wnh33jF8Pn3VD/uc6D1zoRPH
 fw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684328678; x=1686920678;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RXTNzq4gj2DUSkJyMltIversR9A5IgG2YoQBaj5QOI4=;
 b=KRSZNlRWKCibjBd3tVCnV+korkfPuk86oIo6Ydu3gaq2RbC1K8KvhJo2/HHMAalosD
 P4+erlwogXovOcDMva1BqepNvUI+0rZyheZ0xyGiJOVye7861OOLTmT8iFIt8AshFeEF
 8XTnNFKWguGp/wmUVCwdoklH6Hf5ocOiTqYrELuWbGY1vQ4oJcTtClKF08aAXZ2lDCoU
 3d9Nhuawd8SMw8QKUmBOIFO1Mbhw2LHeK9KgRB6iVJKUapJDcuzCIIg+K4JxQS5zUaPS
 WujqcMPMK+qWmnebmxDxCZkVLIDlhw5GxtOfP/atpKBibwMPreEY8+GeKszXQUvfCary
 de4A==
X-Gm-Message-State: AC+VfDwTtCQrIvUl8geHcMlPGuGQdDo/5PMcvqc4JdzsIBHDYIygGVmV
 cRGUhJ7cbgX98KN3Cf5ABME=
X-Google-Smtp-Source: ACHHUZ6gsVowCQgHci05MdbfSLlrwisfgvOTvW0R83NzJYmlUD0JwDW5Bhvdw2NzRR6rLa2bXBsp/w==
X-Received: by 2002:ac2:538a:0:b0:4f3:983b:cc47 with SMTP id
 g10-20020ac2538a000000b004f3983bcc47mr164495lfh.66.1684328677916; 
 Wed, 17 May 2023 06:04:37 -0700 (PDT)
Received: from [10.8.28.198] ([89.201.166.50])
 by smtp.gmail.com with ESMTPSA id
 q29-20020ac2515d000000b004f392625952sm385402lfd.26.2023.05.17.06.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:04:37 -0700 (PDT)
Date: Wed, 17 May 2023 15:04:29 +0200
From: Paulo <pavacic.p@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Jagan Teki <jagan@amarulasolutions.com>
Message-Id: <HB0TUR.1IPEEV2C5LMB1@gmail.com>
In-Reply-To: <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Thu, 18 May 2023 08:20:23 +0000
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17 2023 at 05:50:22 PM +0530, Jagan Teki
<jagan@amarulasolutions.com> wrote:
 > Just to add a few pieces of information for you to understand better
 > on the context of dsi panels. DSI panels can be part of 
panel-simple.c
 > or panel-<vendor-part>.c DSI panels whose init and exit sequence is
 > generic are suitable to add it in panel-simple and have bindings on
 > panel-simple.yml.

This panel doesn't fit that well into panel-simple.c since it has
initialization sequence. For that reason it would fit more into
panel-sortofsimple.c which didn't exist so I have created new driver
and called it panel-mipi-dsi-bringup.c.

 > Some DSI panels have specific init and exit
 > sequences in terms of power, reset and DCS then those have separate
 > drivers to handle and whose driver name must be panel-<vendor-part>.c
 > or similar and bindings also follow a similar naming convention.

I have made a driver exactly for that purpose. Driver that allows
adding new panels which have specific init sequences (and of course 
timings and other stuff). fannal,c3004 can be seen as a working example.

Here is code snippet from the driver:
```
static const struct brup_panel_info brup_fannal_c3004_panel_info = {
 .display_mode = &brup_fannal_c3004_display_mode,
 .num_of_dsi_lanes = 2, //how many wires are connected to the panel
 .video_mode = BRUP_VIDEO_MODES[BRUP_SYNC_PULSE],
 .mipi_dsi_format = MIPI_DSI_FMT_RGB888,
 .mipi_dsi_mode_flags =
  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH |
  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET,
 .bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 .panel_enable_function = &brup_panel_fannal_c3004_enable_function
};
```
where enable function is function with init sequence and other values 
are values that might be different for different displays.

All the inputs are appreciated as this is my first time submitting 
patch. If you see anything that is odd to you please reach out to me.
All in all I believe I now understand how should device tree look and 
the reasons/ideology behind it.

Best regards,
Paulo



