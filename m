Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7638896AC98
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 01:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E394710E61F;
	Tue,  3 Sep 2024 23:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j4bzcMNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2410E61F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 23:02:18 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-70f657cc420so2663495a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725404535; x=1726009335;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPd0NJnM5+70BVUX6+yFPjyKwQPFAYAo8osJyqIOz9s=;
 b=j4bzcMNJBej26swvHjlpSIY+shHOltsgOQmsnNuHkAjIB4r8A5tXBElvtpQBI66m3c
 HotinkkdqbWsR8WP1g19RBgVg0gcX7BfjGX9ELFg2B89+1b38xJZJVaPHj+mMvgTacqe
 K2fn25RwsxS2MOcqkCmHe1Bmaq+xDjKSULQnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725404535; x=1726009335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WPd0NJnM5+70BVUX6+yFPjyKwQPFAYAo8osJyqIOz9s=;
 b=GyVTaxY9xs8SIZLp8x9c7WKX7iyznKXmTH0fsbylVQwZvMjSZdwUj29u01wOfstQsX
 bXZvJAWKAPDX/Orkw7e7CbU5ceVOU9PrTtvq2Va+ReHhYTFzyO3QjTBu85/L2S54ed74
 Nw04f68kZntQpSB+nui+GhGdOidkZm+x7d1IiO3dBs7mKOIN4Ae5GoYBJixHNMOXZ5eF
 yA2ryhvTelJ00FFesBnwYBTNkuTNQUSmlmnKKRJl62iIio734CS5w2/72+E2mGSnu2Lb
 aWU3RSeLx4xusx37s6sPnEhMB8iD6H6HUjVu/cKggaRSOISq9GtThL/2zVremHM4PWzM
 d7tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkUkicvNG9obs6Wl8ifudl7O+cit0lF1o+mnMuiHTe//n2TnQXHh3MXaq8uGSaX+s04SEi9W5gGq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2h422UgTBotWlVQr3hvZ63yF1nDkmRE+vrBK22Ti1K0Vuscd7
 k7bAcJlEcGP5p10QXJo/GWd/HvIxqKN2Ijz2x8TTh607XGcq+C1TToOI3OCW2xUAfWk5xs9ZSoA
 =
X-Google-Smtp-Source: AGHT+IHBOJfR0j2X2j58yEGlWRj3RxvOcJu/fET7t+7epX72gHfSde77AFxDb2OKMEgwHp4NwXNeTg==
X-Received: by 2002:a05:6358:5245:b0:1b8:203b:db84 with SMTP id
 e5c5f4694b2df-1b8203bdc7fmr4764955d.4.1725404534580; 
 Tue, 03 Sep 2024 16:02:14 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c370454e0dsm16543156d6.99.2024.09.03.16.02.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 16:02:14 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6bf7ad1ec3aso30569696d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 16:02:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxLB7kitU0YxVPtT99nSUiOzA2nqSCoYYMNgwX4dgGXXeFsBCuMUYfHhpIALFLquYJNTkMDZpQf5M=@lists.freedesktop.org
X-Received: by 2002:a05:6214:4882:b0:6c5:e40:2540 with SMTP id
 6a1803df08f44-6c50e402582mr60072106d6.26.1725404532653; Tue, 03 Sep 2024
 16:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240902071019.351158-1-tejasvipin76@gmail.com>
In-Reply-To: <20240902071019.351158-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Sep 2024 16:01:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-HRHuL=CCVksq_E+2gDP0XMzN2tbcvLqb3-3Tiu49CA@mail.gmail.com>
Message-ID: <CAD=FV=W-HRHuL=CCVksq_E+2gDP0XMzN2tbcvLqb3-3Tiu49CA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6e3fa7: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Mon, Sep 2, 2024 at 12:10=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the samsung-s6e3fa7 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 71 ++++++-------------
>  1 file changed, 21 insertions(+), 50 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
