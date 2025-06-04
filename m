Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08023ACDDC8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F4810E846;
	Wed,  4 Jun 2025 12:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="gPjZEk+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6514C10E846
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:21:44 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4a43cbc1ab0so77950381cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1749039703; x=1749644503;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
 b=gPjZEk+Gy94q5+k2lLqzJp+CXQJ0mZ/evN7qA682y+cfNKUrYfHdU+73xscmsEJLKT
 i9FV74eBtGysCK3hDtTObaBUVXHnB0KGNiKVSw8IezitDgIWk3x++BEOQoZUcdb7vict
 q9wkmYq8aHpUCgmaxLSdOYIA4GenGBZIdgefnJop57tnAuXPqzb+0Btisz+Dcam3K0yn
 /7rmYMU6EMItlpmC2QyhXRf/Ps2pYlt+HDEJpacpAaEKBpGB+YJq3HDB/x/z8zTDGKiO
 h2dRNYRj17lr+JrDv9tgYsRLXIjfcueGMgKWAG0ZEijSTXOG70EKJ8hhHt7kKbg/3j4f
 KyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749039703; x=1749644503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaZTpWyg0hpKHYyjrUj3+OP2gwR0EFDPrHBmPT8RlVM=;
 b=JS9W1xuyFv9vq+LeCsxVfQXe8Eyuwsessv7EV/jv7fRtBOlFcDvX6FKAurYtKeM1We
 +7o0aBTXOSg4tCy4rd0VmNyHPwS6iHBuY7fzJVmF7u/t+FB/Dr95ZehiNc38k6YADb86
 PwwnKTdaWQbW6Xoyh9NGtEwLtvr1PX4Cysij3DlP2ouElhCEvQ/IZY0i7diOym/OvtGM
 IC183rPbkxg7y+s8lXfViH9Vw366VfZvZ+Q5VEjGSoW3n3dNRsJgtiAY4Y78V1qPDdl1
 EL093jyNOuoihZzyT49hS0rXIpRj88rLBqeiB1jANKr42y3xRTi7wkgoL/uK+Tqp5eLP
 V8oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk90UV4Xlcq2eFfsbrhWiXm0B5Cz33tKdUHHtvtor6c7dvVtmJKDL7FWXMVVy/3FeCaGpJXW94KfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6cls852+2jS9T9ySOZ3iH91BN6zuFUSu5h2Q9hYrMR/VH0x2a
 WAxKIykwmhUhBDFQhJgOUJhgmGHC06QGI/ugFt3nr9SB67ltLeTtvhPAIEdm20f3qj2OYgmKo7D
 kXHSaKXBRhcEl1npuFbchf0f3xHEdi4wQCiaL598Jpw==
X-Gm-Gg: ASbGncvQJdU0/RkF5F9fFisksmsew4PIfY39sapTV+L7NORKZtZePMWI94K/ETd2XDE
 jPP24dDfLN8OlQak+KuMaiY53/Qe4/yNvoBM5X0SB1BS/BvMlnTDbrbgjXz4c84fCuKPwCaENhA
 0NJqSsl94KqWmc+z8D0b2/ZghOETr95Q==
X-Google-Smtp-Source: AGHT+IGBhb9oN9Dnm4FiGYp7zAjk8KUthNG2jfK6LDnEP2PSQ1B7bbxENdlAigbtFAXPzwkkLJkzP6CGB7NZEJFpiUw=
X-Received: by 2002:a05:622a:5806:b0:4a4:2fad:7cdd with SMTP id
 d75a77b69052e-4a5a585f07cmr36560661cf.24.1749039703440; Wed, 04 Jun 2025
 05:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250604090054.7070-1-mail@etehtsea.me>
In-Reply-To: <20250604090054.7070-1-mail@etehtsea.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Jun 2025 13:21:31 +0100
X-Gm-Features: AX0GCFuX5NY6Hf5wXDs-Pk8QnTYrnxwjGyh7lfIG_jr6I0hdBynp5Y1APmOGjzA
Message-ID: <CAPj87rMU9qcdEmAVuH7E7ENkHCn5zveKA-Sk2bvCB=6BwxR4Ug@mail.gmail.com>
Subject: Re: [PATCH V5 RESEND] drm/rockchip: Reject AFBC for res >2560 on
 rk3399
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 Jun 2025 at 10:01, Konstantin Shabanov <mail@etehtsea.me> wrote:
> As it isn't supported by rk3399. From the datasheet[1]
> ("1.2.10 Video IN/OUT", "Display Interface", p. 17):
>
>   Support AFBC function co-operation with GPU
>     * support 2560x1600 UI
>
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> Reported-by: Dan Callaghan <djc@djc.id.au>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
