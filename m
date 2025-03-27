Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24874A74017
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 22:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FD610E947;
	Thu, 27 Mar 2025 21:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XyP/X8iB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586CE10E947
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 21:16:16 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso284839366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743110174; x=1743714974;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8R+j26INxHnTb7Mwq8fGCf9msi9SXZiuekCSpd0mnI=;
 b=XyP/X8iBkvNGldDzjW9kVM96P5i/q02llgZw7h9zqk3hMCdpnFzJ/YwT9svEgSLStV
 F4P8kzMjQcOVY/1tzsCMCXWfC+vjaDPQvOns3nm1fc0jy2H3HB6uvd/t8251KefxBsY+
 OdRker293LNsoRy2lHK8TkPJLWzQmoWlcZI6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743110174; x=1743714974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8R+j26INxHnTb7Mwq8fGCf9msi9SXZiuekCSpd0mnI=;
 b=g+5cNxAfjifEBLZSKnEw7ZbZy4nht21QZfdrmCLrXby8GLfpDxNO07aKm0HKBu3yUC
 VxtKsDUxbPT876KWiVPTdJ7uoCsz6dIN2ygvuilk+b0vNwc4rx6NneWTzIAdVSMmQs4P
 dTkL+1gR84Svund8x5lShImrk6zVMpN/H1amB8kw6ieaspo+Z3zPLnAncgPce+aSIHv6
 vk08dmypkT6+ThDy89P4rDJW+F/nQ+Uam4DmUu474ZjFeQunJN3dkqX3vXcJ4CQ3Wy90
 IQt13Yo7/Fau1dn+97RK0cdH00gWngSgsUYgKS7XsXHTry9HV0ZzIZCctemYdh0ZGqSz
 N1AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWedojvdA/npqxImytLQC0/hzeKkDPLX1sjtfg5RJtRPQVz2fBHA4YEDgrLWUPdTbzitmq85AQHDJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFifQhQT9NBGAh4LkYq06QTS3P2HblBc65J2lwTpKe45YjLlCg
 s3ZI88nYHLsoMB4emPjNZNLDjrMApgwVcgrNM3nLHslkI6C3SF+/uX+AyoSe+Mz3YJabMEz5x7f
 9MLGn
X-Gm-Gg: ASbGncvY72dzCNqauR+Y9rb8MTN1cKlCsd48zX/KOKxtWYVr04PvLoI/4aShd512mWS
 br/cytv3Rr+DyC46EcSSnyTwVjkrG4yVSjUQmKMfK2yvk3jDSI5DkK9eHISgVmrqUlRM47XFxWs
 3BMFUuK2LOqJo2aynex2AwRvyTdlubg3UyenHRt5cBMWs2+wx7qxgnYFannPqcT05YCKL5TqgcF
 vCu7hnNapZ62Q6KZC0XqO1XaCQBZkuD6vdlBMSuCiljuiXuH6trS2IixgmZMh1KMPZij0xOxg/e
 GkskM9fXBMIPl9kQoSJQ8QV5Tj57j1x6lzxCX6xCmFRP06vIj1zrHdyzPmnVdVVfY45/XFTMPtK
 oRssyAJ21WGoDrrX0Ou0=
X-Google-Smtp-Source: AGHT+IHI+U14m9ZyW9JLT15D0q6qhDG5ZbO+TrjZgFLqGJ5t/A4MXAH6GDQJCjwR3dfIoaXSmi+3sA==
X-Received: by 2002:a17:907:7d94:b0:ac3:8d24:a7e with SMTP id
 a640c23a62f3a-ac6faf0ea58mr477474966b.26.1743110174187; 
 Thu, 27 Mar 2025 14:16:14 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac719278674sm53216066b.40.2025.03.27.14.16.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 14:16:14 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so249613466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:16:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIqqqZe8m3d2GRsdkSzt8dQLF7WZl/p6vAI5kGZGvVRkzy8vrIY1E5cA2w/NjKzJhwep8LgLDwqYU=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1fa6:b0:399:6af3:7a77 with SMTP id
 ffacd0b85a97d-39ad1749e17mr4689238f8f.19.1743109786837; Thu, 27 Mar 2025
 14:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250312090132.1624445-1-nichen@iscas.ac.cn>
In-Reply-To: <20250312090132.1624445-1-nichen@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 14:09:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XA0q9KjkM0M9rL6ADi=umRYbACj+Sb7M5yyxSXVT_scg@mail.gmail.com>
X-Gm-Features: AQ5f1Jplbd6tKLgHVVNpR-o-b1u7nON_NY4Ow89vJm0zuAh4ZO6OMWeppRLf-CY
Message-ID: <CAD=FV=XA0q9KjkM0M9rL6ADi=umRYbACj+Sb7M5yyxSXVT_scg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Remove redundant 'flush_workqueue()'
 calls
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, yuanhsinte@chromium.org, 
 jani.nikula@intel.com, xji@analogixsemi.com, robh@kernel.org, 
 sui.jingfeng@linux.dev, dri-devel@lists.freedesktop.org, 
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

On Wed, Mar 12, 2025 at 2:02=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> - flush_workqueue(E);
>   destroy_workqueue(E);
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)

I guess nobody else is going to land this, so I went ahead and did it.
;-) Pushed to drm-misc-next:

[1/1] drm/bridge: anx7625: Remove redundant 'flush_workqueue()' calls
      commit: c1031442d384eea6d53a1d1ec6791a2782afcdbc
