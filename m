Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FAF89CA81
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1A1128E0;
	Mon,  8 Apr 2024 17:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FgJ8BcJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A98E1128DC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:11:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41687826509so3005e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712596317; x=1713201117;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZO6clXaO1hNCYP3oo0zaifY/rEezEg75y3W9xYPPEAQ=;
 b=FgJ8BcJO954HZk3bISze07/zWLhsFon2KJDty9x3IWQb1IsulyJO9GkYHT/DsqpXbU
 1o4PcyY196KZU6vp/bqtGbEwTF8tzuqNHuMInStV/8Pi2Zt7oX2M7fKwFgWwT0aqy8ZK
 uMJjgNreksECZ/4OtJDfqLOeDCqXNzH69GOeioR1QZ3CgQgqn1jg+kiXVP0M0T3be8uE
 bO7idNrItXjJ/V2CXwymjGJe+dZKvEMVA6X+jQRxqQuAyczcolMVfrsxZbvkfQgn9k0q
 CK5DEAXL+sHkMuF2W7w/QaJmFaS2x/Kx4Tz2x8FhxaoD/uO1mKplVgJ/n/zQAwjom294
 +qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712596317; x=1713201117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZO6clXaO1hNCYP3oo0zaifY/rEezEg75y3W9xYPPEAQ=;
 b=dexwqnBymeqI0LyahTnY34EdkOh98BoAkQ9e2/oDAjED6JXN/UQPbGk5osaF7uuZ3Y
 dn+LyMMYQBKqvberIzaN42mhyfxfNER/vFb53sVe5Ql0TT19Wv8/qNFC+RY6w3vPvGOB
 X/FN4B3J5JXA5WwVE+K88YHvMWg+83/uwqO5nL2pHX/rtUkJ10waqRjXb4tVfuMUkeAp
 p9iDx/bcMKUKSeves3dx8mWZrqIlPyKPyy4v5/SGvFHxKteSz4C7PmtnC7dAF0Ha31vt
 saG7Mv+5khEfLr8cQHB4mJTdLExq0xxOXsp7v63H6DiO0yA7CSwZK1hNIlT78BYW2Lbd
 6Fow==
X-Gm-Message-State: AOJu0Ywj2G0Qupb8Q4dm9qjyQFbxZ/pZ0GLLvj+/pGouhkS5Irc2TdwC
 f40AzUyUXzTQZNCOZBWfbp3GWbf1IJIxG6zEOSLL1tMs1szjMClpv7dtgSG+moOn00bt9HEIA1v
 Kx8/g1wn4nCp2DCAebn6cB6QfAeQZX3CTeXA=
X-Google-Smtp-Source: AGHT+IEhQX+c36AoXjkaA/7lO4vlXvia/QncPVDzbG0dUoQhkRBHugSSxvpcgHNl5FrWVSY4mVa26s47UU4sREAcZwE=
X-Received: by 2002:a05:600c:3c97:b0:416:2b7f:211c with SMTP id
 bg23-20020a05600c3c9700b004162b7f211cmr394110wmb.5.1712596317561; Mon, 08 Apr
 2024 10:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-12-ville.syrjala@linux.intel.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 8 Apr 2024 10:11:46 -0700
Message-ID: <CANDhNCqWcDgdKfv1OY+som4nYQMWqiTArfP-044G3F58RDqmHA@mail.gmail.com>
Subject: Re: [PATCH 11/21] drm/hisilicon/kirin: Allow build with COMPILE_TEST=y
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
> Allow kirin to be built with COMPILE_TEST=3Dy for greater
> coverage. Builds fine on x86/x86_64 at least.
>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: John Stultz <jstultz@google.com>
