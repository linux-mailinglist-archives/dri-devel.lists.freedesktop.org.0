Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92C957045
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7256489D56;
	Mon, 19 Aug 2024 16:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H6KAeKGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB589D56
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:30:06 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso616609866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724085003; x=1724689803;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmHJCtcZ30o0V7jSxKUFqXXdgkHP4PwVCzNRud2qkuQ=;
 b=H6KAeKGcI8JiitpcWcqipp0i3wQnLAIOpM5KxTL/WfHx3WecEBkEgkjkaYoI2zNb2z
 hhIumjsqbpL23ICHgo+z0Di1OjgNwXff/frIKOqGPyiy2K/FUlfTVeRJE+0RHD7+1G7N
 St96kU1s9UIk7PTTXLWrbqMDLgZDH+w+Mz420=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085003; x=1724689803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmHJCtcZ30o0V7jSxKUFqXXdgkHP4PwVCzNRud2qkuQ=;
 b=aOLcGtIKXOl/uhsMhNnIgHtBEwK1iEJX/8Ur6Ftc0sqbPMWZy2eHnk5JQxVc3xLJcM
 JWzXdXgF1dD1R7VHpP5BwaHS/8dv1eTjaqqOtKsASSn3esL4ENUGYx9U7YpS5p+W2Qev
 PhwXwSGoHksolpD5xrXRn37DiUYCL9T5pSzjD8T2Dk6KGc6JPTT6zi9lLFuJG1HiZ0A0
 Fy7/ouVQvYWrVXUMF83HW93NyyBvm0QvoqzXlDkTr5RiQayIyCyI1RB0M9EFPCPLrVY/
 4kv8Ocdb9j4qp0IxrArPa7V06KVBjVhd+ROm48kKEm4bMoWBcOJgy1EJ6ymlb0ZiTATf
 OSMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXbJk3aLaLr7gF/d5Rq/mO7Ns+yjnFMuqxAHvgBdK9kFQmAf0bGSMYqRA1qirftokXIkCuaEzPQ161pZxQHFGK8o0vpvL4jxaNWaHyhLa9
X-Gm-Message-State: AOJu0YwLDt3c+sx6AjbRUTXD3Mpy687RDoPQvAoKzhYOKfReFQp7f/BG
 JZYW5dHfdvfUbl0D/gMPcjPPuMkacQHv7ujysuLyUOrYRaYcgBDAP5FV7H08/u4sGzYNoTj3Ars
 vmQ==
X-Google-Smtp-Source: AGHT+IH/AkTNqViM3x+wc6NmVjq7qq0Q8PqJ1ncxPzot0t+Py3XuoLSDm9mVBV1MRk0NT22/jt/aGA==
X-Received: by 2002:a17:907:f769:b0:a6f:ddb3:bf2b with SMTP id
 a640c23a62f3a-a8392954086mr880317466b.41.1724085003160; 
 Mon, 19 Aug 2024 09:30:03 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cefafsm646594766b.49.2024.08.19.09.30.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:30:02 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so2133650f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:30:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ZSX41wSvqweNy3eQQQmk2kLYObcXZ3VJLzZ2o560a1nk8RdtM68o6S0ielyFxUpg4m4XV4yaPfKekRQ+Kv6rbjCaeYq/2JD/kMrAEtmp
X-Received: by 2002:a05:6000:1365:b0:36d:2941:d534 with SMTP id
 ffacd0b85a97d-37194641714mr7416013f8f.36.1724085001389; Mon, 19 Aug 2024
 09:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240818072356.870465-1-tejasvipin76@gmail.com>
In-Reply-To: <20240818072356.870465-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Aug 2024 09:29:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W3OB5BUT=Dp5datGEin735+Bhhd+SiKazqdC-uW0ag6g@mail.gmail.com>
Message-ID: <CAD=FV=W3OB5BUT=Dp5datGEin735+Bhhd+SiKazqdC-uW0ag6g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: agx@sigxcpu.org, kernel@puri.sm, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sun, Aug 18, 2024 at 12:24=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the mantix-mlaf057we51 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
>  1 file changed, 27 insertions(+), 52 deletions(-)

I'll leave it up to Neil if he wants you to respin with the
upper/lowercase done in a separate patch. Given that Neil is tagged as
"DRM PANEL DRIVERS" maintainer, the paint color he wants for the
bikeshed [1] trumps the paint color that Dmitry wants. ;-) With, or
without the upper/lowercase patch split out, feel free to add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://en.wiktionary.org/wiki/bikeshedding
