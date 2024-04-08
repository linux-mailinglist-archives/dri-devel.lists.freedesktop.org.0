Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5589CA6F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2601128B9;
	Mon,  8 Apr 2024 17:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bgvFfnN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE031128CE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:10:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4154d38ce9dso5455e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 10:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712596203; x=1713201003;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBWbPMlJ/Wvzu60cl4CASmNzGCgdWYVGEx3Wm8d/QPw=;
 b=bgvFfnN1DHG514C3d2Rz6Uqb1jFfDVmNpqA6wABTfcIY0QwUoPypEZOitYeJPC6Crv
 MOb1hspDhQwU8TG9LR5GyU5mk4hpc/4uQiiudUYODs6PS4hJeIobEwYVi9Q01dxPVXQp
 tLPnN8ZsqrEmC9qr/YWsLHmIE/34wWIVzU9AOBgeh6gChB6eBJHMDeCAOsP0ej15+onR
 PPvZC+Ovn7lKrXXO+yDLyQpzIcTipjd011Fdezv+LBHvxLeYSpr9PsA75mC2cLxa5mw/
 u/PPBanr8DVc8LXtfmChtpfq8JIe+1YXW3lUBAN7pWVLXbuD/2UbKhVluj0llE/KqXyD
 yRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712596203; x=1713201003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vBWbPMlJ/Wvzu60cl4CASmNzGCgdWYVGEx3Wm8d/QPw=;
 b=Z3CbOwzVYbfQ7KJBefnygiXj3W5ezOIilWdcqNwZSmyge1z+Q//wL84nzV8IC1bBTO
 P8suRUUZ0LB2y6wqgaBis48fD4UVNIS3V2vuiM3RwVnsOQ/gac7L00o5weSYBPMzMEl0
 eWEFk0QAxFWpD4JneCXoLzhD+ERRKaY+GG5jkJk+5qufOkJsxH9Jk6olKTzkzv8C51G7
 JSN1wBwLzWsEPvmea1+RDUUG25pCls+JyqBMgfQ6ARwmUZKAydHSPL4iVf6QAtXECg2p
 70iB//7RK/MsAMJo7Aie4VVHX36mC9vMI/v37s5qbahEAx0JQAweT2PwqtUsyOU5ey+y
 KCtw==
X-Gm-Message-State: AOJu0Yw+LVNY1DGBIVkipXO9rzO+NO9Cn8WlcLATkFhKinty/eLAtklG
 +NikqyBFMx+MbHzPOLWkxksbPOojlTDwwk439VHh37UN3Gts/KT0Jfb5hL8FRcZ9l7mSQc4tVCH
 uu8A4oz6QLsj+XQq7MCx9g+EcLE8bweweKDk=
X-Google-Smtp-Source: AGHT+IGhdrGtmyRjqgRWadiA/NngqrBWxKVXcHv0nfhb/lCbkcE5jto1BfWxV9iF37CbGbpPKWSdCOgSljisPgj7j3Y=
X-Received: by 2002:a05:600c:1d19:b0:416:3014:63f8 with SMTP id
 l25-20020a05600c1d1900b00416301463f8mr600wms.0.1712596202837; Mon, 08 Apr
 2024 10:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-11-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-11-ville.syrjala@linux.intel.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 8 Apr 2024 10:09:51 -0700
Message-ID: <CANDhNCoYB73zL9LseDpCnuxQLAZj9pOThPdxc_GEpRiQocL7Ag@mail.gmail.com>
Subject: Re: [PATCH 10/21] drm/hisilicon/kirin: Fix MASK(32) on 32bit
 architectures
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
> BIT(32) is illegal when sizeof(long)=3D=3D4. Use BIT_ULL(32)
> instead.
>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: John Stultz <jstultz@google.com>
