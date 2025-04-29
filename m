Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58151AA1183
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7010E4FA;
	Tue, 29 Apr 2025 16:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GfL77pZh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED0110E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:27:07 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-30828fc17adso6244729a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745944025; x=1746548825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ID3Zt/kcyvy5TQaBJIv/XJ2QG5FvCfrPnhdLxnIVAHE=;
 b=GfL77pZh4vH9GfBjRRbyZSBennOcMQ+//AV8loLtFgh0FasgYu976xghS+yrApVPqm
 brceClKU1VYufs0H/Z8j+sxPxejz1fyu7NjXxbBWRpM8mQT5rXi0LsKHd41bO/gmGiiC
 XF10/30zTu4SvEAbvSk2Drjii2he6vi5kzl5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745944025; x=1746548825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ID3Zt/kcyvy5TQaBJIv/XJ2QG5FvCfrPnhdLxnIVAHE=;
 b=LEum+KJ4oyTg1xzL+K80wwfj41eqNPg4mqotsjXK1yYkp/e2RDBhpzNEiLBZqC8vvo
 NH2Gj4wjOsoaIK1FrRFv1ZIYrtEU/7Lv4PQOmyTzLV7x8FpEDy972c10bMkeAH0m93qz
 Gw4IzJ300TMYz1VFuIdQszFQytHWN8hCYlblp8dvSs+zZhiBIx1zZjCJyRJYAvCMTZb2
 wAMRrl3IZW4x7CmS2b0wSXRxpiWu3aXtjQfiqQmNJSXC581fmq3o02lyzTJmmWDI2wd/
 zcw78GnjhXIAVARhrjynguV1tak47HwBerhfoRCXvoewq/QQDf1Umn3SZLkP6ae7s0b0
 1HiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKY+cMkaz1gEkyJS4z6TVvj3vlQMwPsZZPYK1QocJ2qVntAI3gxewx0nAD5mbx/iFVTanNvHbImRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGr8Wv6HAWtlaiBTpPcrzqEac1D/E6LOLjrJVfbXyswSHeOx5u
 xKDmjVGDOADpJD7Lxu1oCVk3WNeW9/XrmqxnTOWPor3yayZm8f4whHMvt7aHi5So+3TpBSFY7Os
 =
X-Gm-Gg: ASbGncucoynTxEiExC5d51PTrR+xjOSgf1d2VipA/+andiKXjiY0D0bQK/pPg/m8ZPW
 TLnIvvQhhnY3VN7SI7yuTj1/iVPJfIcMTawW/L8zqLOrqdLJ5Dt49f2HYTb1pB7kg0Y8Xqc1+6y
 qKpJW2J/bt1z1KP5PXuFZUMO/eGETypRFHTk7p2MRrw9c2jxuFYCtasLZMLxMi4tPQOaZlYp6mW
 ri8SpCJnWG6clNyJyuqmcEKhcggaVo+aGJ7oi5eZuk6k1F89+ztIY18DKIcXN7jFzfk/u7e0Yj3
 WeojgfMtZN22kamEnrnzhQeBXmXSolJMdXu6SmFI15esSt+OrfQ7QbhGF0O/QRx9ztnCANf8YP/
 JTGkE/2Gq
X-Google-Smtp-Source: AGHT+IHr6JE7sAbllx+8dtmu5R1MzuGPljy20/hPv6A4X02d2+0Hm3i/DZjNqE4XLfIL3p3WyR6f8g==
X-Received: by 2002:a17:90b:4b4e:b0:301:1d03:93cd with SMTP id
 98e67ed59e1d1-30a013988efmr21174964a91.24.1745944025292; 
 Tue, 29 Apr 2025 09:27:05 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f7850f87sm9579796a91.46.2025.04.29.09.27.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:27:04 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-af50f56b862so4298612a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRpWXyAv17QzlVt0933T7GIIFGxDbxjWi2JhDS1+/Jnj725px0jkS3c5bnYRVTMVBPUOSZanhwLiA=@lists.freedesktop.org
X-Received: by 2002:a17:90a:8c15:b0:30a:255c:9d10 with SMTP id
 98e67ed59e1d1-30a255ca186mr3202709a91.8.1745944023558; Tue, 29 Apr 2025
 09:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:26:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtRYCM=tzfyfLD8Yv015U2U=tuRMTsSLtxNSm9zAia8g@mail.gmail.com>
X-Gm-Features: ATxdqUG2rAf0BoOyLmWMpcSnfq6hQrouHip_k1QAJOJNtZxAX5VK0S8UBRBj9Mk
Message-ID: <CAD=FV=WtRYCM=tzfyfLD8Yv015U2U=tuRMTsSLtxNSm9zAia8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S
 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> BOE NE140WUM-N6S EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
> 32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
> 99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
> 45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45
>
> 70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
> 2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
> 1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
      commit: 800c2180705a87829f7833df3d9e73b548bf65ff
