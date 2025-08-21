Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40AFB2FCD9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1551410E9AD;
	Thu, 21 Aug 2025 14:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mzY/5oPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71C810E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:36:27 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b47174c3b3fso616218a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755786987; x=1756391787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8cmv9czLeVlg58F3GSNDuhb/BDPEleBjhB2Fb2fPFo=;
 b=mzY/5oPlB3hmxridoAl0B+5zqrZHBRIFg6ShqUMXGcC2yoxdh0+sv2NfplF9ybg2uP
 eBncvoDlEgCrqt3TN2x5m2jGx4xfAKxx2R1xVURIZ/6GOFuwlFcNS9yamW32MoEoAXdT
 hH2qGzJjOuY2GUf8d+GXLMfMQc5dz50Q7O+fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755786987; x=1756391787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8cmv9czLeVlg58F3GSNDuhb/BDPEleBjhB2Fb2fPFo=;
 b=R6Sjqwuds/yS/UAdU9VHnfu9EKm1o7RpTGKy73ObPgDvNeGVjt/mYrRvkwBQBODZYp
 ZJqaxW07DaxnhDX9/DT1bZDCet3SrjNVo17+FkUOIqLhXtYT35yVcy+gwEW0Gfd23DFb
 VhY6gNCL2AkCIuiLNT7SbuGWrvZmJ+0Yme6zvqVUAB6yTtQ+n4qscPFWxe4m2UauoXZX
 xBzj/1EZi01OOfAB98ttPvaT1pmL9KPqGBi2Id9EK4zYJFxiI9NhG08iJKbvDSh1GQqP
 oLOsyEVKAm297fdy7mmEHrZA139ZVdk3A75UIeDFOZKz7dReWon/WT4q+pEIWn0i9u68
 d3SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr+GefFP4iAlLVej+iiyYAknp5EXwcaiX/wzRyYpY/sLLLUHaxHp8JOoEsGhzh90XfpgoDu+bLV7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4LUqR23hkP7gCAMhs7pUEMj5e2BxEMldwWAqAP6SdAxbLtkwH
 fy9L0kprA3f25pDOe84+d9gNHSD2QrzlWIVwynVxh7TnLWH1WoWNl8cFWcePkqzH8GQ/zCuXRxQ
 JuQSzWQ==
X-Gm-Gg: ASbGnculVyawxCN0aWA7R/uEWPa9+R+eXT+zFWESwISVEQwPoudznoTfbiW21jZNW16
 NcEE0+3qev/beQf/httJcbPIx6mUzPhgakJZtFXWyLV48ldDb5wLXtzQy1Cd2Za/Wk0HclcqERq
 DbfU1O7MbnHU/SBCFQn/GKNOBt+qZGJ25ZILhbURj3DLcPhgLPNYllPQWsTWoXa12wLZdjISSxQ
 s2NV82P9Z2cgh2piqz7wnVu41gbSCf2FjWx6bS65i9MOV26wEAwDyDuAipytKpHSdpZMAfEjuCZ
 EzCVRneOFDoLK6xDDKnl0a+Op6TtuxZqpeaiK/AO9x7BSUtk5MUMESpq/GffJW6+OwN4T7cmRWw
 mw9eOgQZ8hrNvIjTfbe/hE1mQwGwbQsZQX7kvVW+HPzuExvIOv84Huxqk2spHh6tWzA==
X-Google-Smtp-Source: AGHT+IHbfg5gll8voPXhKVX/Bg1P1EjTGA7zSoc9i/PFc4JwJb6UF90Zs1QoMl4M51XnA/JW1y4cTA==
X-Received: by 2002:a17:903:41d2:b0:23f:f6ca:6a3 with SMTP id
 d9443c01a7336-245fedcda97mr45759255ad.43.1755786987277; 
 Thu, 21 Aug 2025 07:36:27 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com.
 [209.85.214.171]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4cdb8csm57807805ad.97.2025.08.21.07.36.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 07:36:27 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-245fd2b63f8so10705615ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:36:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkCGGa+OV2hPC+H94ILb3OiU/SYtkDbeoQiNiz4a0w2rwjy761ZTR8a6b/nKbCItLdbDUxi8M6gJg=@lists.freedesktop.org
X-Received: by 2002:a17:902:e552:b0:23f:d8e4:ded2 with SMTP id
 d9443c01a7336-245ff874a23mr34912575ad.53.1755786986016; Thu, 21 Aug 2025
 07:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250821122341.1257286-1-mwalle@kernel.org>
In-Reply-To: <20250821122341.1257286-1-mwalle@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Aug 2025 07:36:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
X-Gm-Features: Ac12FXz0PEJ45hqfCs9LuKR4ewCkPpjYJIMIE3QF_A72fNR8_xEf-0dzYkP_9Kw
Message-ID: <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jayesh Choudhary <j-choudhary@ti.com>, Devarsh Thakkar <devarsht@ti.com>
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

On Thu, Aug 21, 2025 at 5:23=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> The bridge has three bootstrap pins which are sampled to determine the
> frequency of the external reference clock. The driver will also
> (over)write that setting. But it seems this is racy after the bridge is
> enabled. It was observed that although the driver write the correct
> value (by sniffing on the I2C bus), the register has the wrong value.
> The datasheet states that the GPIO lines have to be stable for at least
> 5us after asserting the EN signal. Thus, there seems to be some logic
> which samples the GPIO lines and this logic appears to overwrite the
> register value which was set by the driver. Waiting 20us after
> asserting the EN line resolves this issue.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

nit: officially you're supposed to move your Signed-off-by all the way
at the bottom of all the other tags any time you post a patch. I don't
think it's important enough to re-send, though.

In any case, thanks for re-posting. I guess it kinda stagnated. I'll
give this another week on the list and then plan to apply to
drm-misc-fixes unless there are any other comments.

-Doug
