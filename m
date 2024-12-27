Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B429FDE32
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 10:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667B910E052;
	Sun, 29 Dec 2024 09:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b="qnX7cqKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116EE10E1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 13:18:53 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2efb17478adso8702495a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735305473; x=1735910273;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iAXFsxzlonOLXIwCn7fwLxpEOxOZpKttSBYOZ0M8BhA=;
 b=qnX7cqKckVZ4zHhrOgid+zbz8hql2OIfd0R9+yZT98MhMR6nOYsNZqAYtm5h6m7x13
 zWAvKn/P0ZL5ylLyo/zUChuRVAqODjQFPF/xxxIi0mvR9sKhxDql0aiVfhq4B/tfskhq
 HaQF3G26EJuapFYGB3aYqRrJaS9UjCvDbnbo1VWpCXWmuZSbgW7l6+nKFbM55iIGFawH
 LwEG1/8sqk6MJZ7PbrU6zMhFVVfaWNAAMSS4vfAQVLQOh6rMsv2yfXNbDzUTaeDg4yMH
 xagVRHrD3njCdOrt/LK/S6eBJd/I2UaDg3fuB3T057yuPcgJre7MBLj9SLg6foXUggaq
 Q0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735305473; x=1735910273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iAXFsxzlonOLXIwCn7fwLxpEOxOZpKttSBYOZ0M8BhA=;
 b=GGPYjNbxJ8cAN9umeR6fOdJ8bVKYGShVCOE/WwVUxXWKsAtUtvF6mhMWaY1UTdlcyl
 kZuzPQR6fSOQqyX3lgeEBH9NJEiF9c6aZM5vKCr3YafiMIEW1fEBWbam6ssJLAV4CFt1
 26g8ulQqysIjCdj7HDdMbmpSI6SgK66csD8+Goz2f0/OcOvYrTxctU9O+6pB1JlPQIQE
 ED+NWtWaZHuSHEl62DYop7JYpL2w0jP5mV5SXXElYEx6zeG7NiM39L6JmFDD4Rm9x5b7
 cY2XjBC2/rMB6fVGGT6EOyy+asZAGN6JB/qV0nnimWJJ6Bjslyczt5zwtrgMzHo6AYBw
 38Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaJ/4CmJhSOBq04R2kO+temg3fXooyvu/9DUaTzKsg5NV20jqCbF6qTuaokKJptwmwN+pFVdPBXec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLDcBBoISGTPmM4KYxv6USL+TPqPEDTaROThqizyRHz66UOPdC
 x1WFBSYWafiaq3WjD4KRUsHt5Te++wi+lAHC7IFo83Qk6sx+goMbruZ7LqVsKE8Hb26cJPKeHYf
 qLRCWJ2TT91C1oW6JL1oP8PIC3ZXEk0lCy7Dpnw==
X-Gm-Gg: ASbGncviPWNcd9lrvncRq1KOZQ1DqY5Lym6ydxujDUqPxgF4hAIY4dS8DWNWbzcJQH9
 wolpkixBC7DbC3a5Bz9j231hsJVsdyX4zX0Is
X-Google-Smtp-Source: AGHT+IGJXNWgYAZk4yTpptTSbNQn9IKrdlEA0Qzrr4v2C2qdF2+VE2NVca0nGnqFhl/5SkEJUK38o98Ip0n+fUXbfnQ=
X-Received: by 2002:a17:90a:da8e:b0:2ea:712d:9a82 with SMTP id
 98e67ed59e1d1-2f452ec6fadmr40836147a91.29.1735305472878; Fri, 27 Dec 2024
 05:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 27 Dec 2024 18:47:41 +0530
Message-ID: <CA+VMnFzJumtLmhFxNt8Mjzju7nC6wMWn2zDwpiRg3CEULRzDyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Add PHY node for HDMI1 TX
 port on RK3588
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 29 Dec 2024 09:27:47 +0000
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

On Wed, 11 Dec 2024 at 04:37, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> In preparation to enable the second HDMI output port found on RK3588
> SoC, add the related PHY node.  This requires a GRF, hence add the
> dependent node as well.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Tested-by: Jagan Teki <jagan@edgeble.ai> # edgeble-6tops-modules
