Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34CB9EAE5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D8610E156;
	Tue, 10 Dec 2024 10:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VWCoqoea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C619F10E156
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:47:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30037784fceso32782631fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733827651; x=1734432451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQDk0aXlh4sHYVGoJtmtywLEY715ubkw6Pu7A3p8NKk=;
 b=VWCoqoearA+IMDMhDsdiVcKWF4Ohy6CBK+XdTsg2fAtdDA7iVkDiU/1xDG2wb204V/
 pBHw7uW+/CR5OMyvom7vvpC0PF0ODfiW13prna9zlk2KOOnTRCiOtRt16x1IkCabdUQl
 ZiEWNoyMeEstLKyYuU0rj791Db2UyEI330hc3XHRNlNUiSDcGLf9W3cI85NICJicYCju
 rP1wBvQSPtEDbd8XriFRtwzDvf0c/wGbV9hGa/YpAtWCSMW59QWOzb/CUG/ZkfuPsupt
 kcGoziK7yzrDHEtxafkFbPeBnuM4RrFj5tRs2Q0gDz5okpwNHFhL4mo4bXaojOICcStM
 8q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733827651; x=1734432451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQDk0aXlh4sHYVGoJtmtywLEY715ubkw6Pu7A3p8NKk=;
 b=p9j550BzelCVvEwxS3ZMkr7a0wSe8QxU+yuwDPOvQ+i3ZRpgJ6NlNvj/YgXOhM8fy8
 0+DPWXEZgpWOoJX7+u/aFWXUY6Pxw/0tE4nBAQzzUC3uxDe4FQI9pSp5UP5qxbqe+Kud
 1fMRdMxbcgiEvk8yxPJh+nNEn2YHXqpGyGDcfqv+uy+j4+k9YAZ53U+U4VjhWjNOYbpa
 RAsuqI6ZROdRZqrrNyqbB8b75B7wMhcdTFGHzGn6Vtb3vQ3/08ZzTuqTLebRRnypsT9l
 /kxXMPGini7vyZBQ2Cq5lIeOGJWcmPNDvcTNj47JMHYMf3CnljebhLrOwsjEtcrXScsN
 w3zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAfp2GKtumdQxuEQOu0j5PojOxOmJW12RC25teGX+4UiHCDzzJSDDNCL1W2lCQDXoQattUmKCIdQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZbMX9Ql+tTXMoE/dvCvNZi1YWeTGcXectQtQbGDIkCitHF5VZ
 Jkeb1ZoAHXYBfoToCzvQ8LmhtJ1ma7JLU/Zcn/JLW90A6mUS7TiDgWBnH0lXFug=
X-Gm-Gg: ASbGncsNR1JqoKb+fQwePJQxFdrjfE0myLkFdJhZmALiQzVBqCpywVxc0+qasz1TU7K
 6CdP9RXzAMWSP8j3MaBkisA+RcAKv+mjefV2a3U8CRLlSYWNm7o1Rh4OA2BvSHhTxfFxboXK9ee
 qMBbEDWjMmxFix0dI7iEeTJ+SyIitIkuTiTC7HsolivKX6MaO1Jbn9LiKE5NJDFqoWkej+e6/B+
 V3atcYONR0aMSxXLRBlbuoI+PWaSnAFYRzCQ7RO//nA5hW3M9S/WyH/cd8NTTVKhnqph1kffJwi
 StgQkHKZZurOV860YugzPw==
X-Google-Smtp-Source: AGHT+IGF344Ued8JrzMd5L5Ep4dJci9pWWxlvAO7/v42icTHNWYLEYvoA1QE8P0FlmPmE+R6xjI7Qg==
X-Received: by 2002:a05:651c:154a:b0:302:264e:29e9 with SMTP id
 38308e7fff4ca-302264e2d96mr25784281fa.37.1733827650857; 
 Tue, 10 Dec 2024 02:47:30 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3021cbf8d0esm7343141fa.55.2024.12.10.02.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 02:47:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Date: Tue, 10 Dec 2024 12:47:26 +0200
Message-ID: <173382759311.2854279.4096374868344930210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 05 Dec 2024 09:02:10 +0100, tomm.merciai@gmail.com wrote:
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA-24 and VESA-24 input formats.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: ite-it6263: Support VESA-24 input format
      commit: 919b1458ccfd33ead891fa4ad1e1d06016f5a20c

Best regards,
-- 
With best wishes
Dmitry

