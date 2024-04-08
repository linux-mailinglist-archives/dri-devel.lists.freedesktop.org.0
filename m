Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B589CA6C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9157A1128C9;
	Mon,  8 Apr 2024 17:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gzyAu6bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FB11128C9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:09:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4154d38ce9dso5375e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712596173; x=1713200973;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWv+MCKJaEsQPXdoYfTnJgUSPnngM6E5fFgeUlDzwNk=;
 b=gzyAu6bSWfMbiWtrch6+BT0Ap/O6WYR3FM07eIa4cUrc9ofKTCY15nvM9eiJKnloAk
 McxyBd57dnSwIygl3G2F/MrYxvU26oA9oDFVCD57Ron92qwzIwNwcxW4VkTmpfMropaj
 2+aoSC+eTSqIVyJ+q2WFAFWiBxBqIwF6OLYHhhZW0StTWgI/PIGnnczExjQnegrwqM8m
 B1L8vz9a/5X4Amc9QRBC/RmOkOd7LRLIQMfR0DkQPTgswuOdjWJMr5emYXdnmSaNRvXF
 pfy+/UbuKGv7/idfB42ZerCh/IXZm2nYxHFmSdgl0r9cSN/WcG+fg9K0i9kmBkZc9oVD
 N6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712596173; x=1713200973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWv+MCKJaEsQPXdoYfTnJgUSPnngM6E5fFgeUlDzwNk=;
 b=TRsf8zJ1ZbgfWRfToRDw6nqx5AM5RV2s/bgA8knsPFkxxtDW0h8pAP0q63P/SyjqZO
 RNEcbTY5bMJA55IHDRNGXbh9S3dmEkWTKn0fSskLEvFu7Jk2UY/C7F/Cifc0KNGQXN6H
 K1BMpEWotMxso1huLgrAuVsC0wRXrgyzej2tBxvbprmiEvt2XYTtAQXYNpbk5Bq3IDfz
 2q0eU/t/cxL2M+dQVYTBIz2XQSZa3p4/tRzAO4o0MDWjPSuzmjO5UTgN/Dq6wbWJuh15
 c/GmFZjNAo88oVEHXFtw/wRBeEuB21KicDD+FPqwA8M8PeV661RzvtL7aRtWSdQYLIUC
 v9Cg==
X-Gm-Message-State: AOJu0YypCTJBSB5FNLaI108RevUxM/xYAkGr5XbykkKHHSQjlM/jbK2B
 8HPGSxXWiSwPNQsZqHr+JTyajsoPdE5BwAaboCo5hwCeaNpsHR4C9+sEZl38tkc+9AeUhxXtv52
 lNc89AKbQiwJbT9SQuWgpDI+bO2FfqVLIFrI=
X-Google-Smtp-Source: AGHT+IF/VrvSUScZ/4fURRHeGc4buwQblZbM3N55hSeESb2oYCAzE94/xFMcB+jjxSJjqNngGD6U4Sxu+AH0+vPFLU8=
X-Received: by 2002:a05:600c:1d19:b0:416:3014:63f8 with SMTP id
 l25-20020a05600c1d1900b00416301463f8mr402wms.0.1712596173222; Mon, 08 Apr
 2024 10:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-10-ville.syrjala@linux.intel.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 8 Apr 2024 10:09:22 -0700
Message-ID: <CANDhNCo6ja_AB304utx6LvWbH2J_xa3HSfKWxigZe4qdRfOkyg@mail.gmail.com>
Subject: Re: [PATCH 09/21] drm/hisilicon/kirin: Fix 64bit divisions
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>
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

On Mon, Apr 8, 2024 at 10:05=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use the appropriate 64bit division helpers to make the code
> build on 32bit architectures.
>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: John Stultz <jstultz@google.com>
