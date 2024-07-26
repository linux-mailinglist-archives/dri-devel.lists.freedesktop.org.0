Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6293CECE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA810E939;
	Fri, 26 Jul 2024 07:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="HdGjKRKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C871C10E939
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 07:25:03 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7a1d024f775so28031085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721978702; x=1722583502;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
 b=HdGjKRKfrSBLQWpPRhih6RPeWreVtaJqElA0f5rXiqJrGFaZpzMv+qNpRXnZk7INUr
 xrLMOt8fkQlNMOgJkY/BHu/ka7KrSxd4itPy6ENZy9QflJhknX+OvF3OmOfDDP0Q3Qme
 ThuDC5wvVhiC3QBJcaM986Lcd1BqucPjS3DbKZQ+lsmr4ZwSv9ke0uQmql+1A8BoYOd1
 z91A0tNpItYT0vswubXYCoIzQ13t1oCRCoaUpCGUFYP8SCWbVyK1eHSjZS9wQ9ZsBz1e
 U9eKajE/s5InyNyTc8j98inZVOt9Dz5xs1YKFJyRn2feU8N78nTxZXWxrWxzpBWTG24a
 pkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721978702; x=1722583502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
 b=VH7+shkY1d9aut2JuWEVEHEol0mfd9ZpmXFC6tMyv3s++MuEBdNuiazy/TaqSg5y3v
 LUfhc2SVvMH5mle4Wn1Z7QptJ0k4NQC0z9Xo6cPvT5jp4vXWCCwNFf1fBLSBCSzNhdmg
 GtpUwql8xtiJHObRhkOxfNQAPCWQlQzodC53em0dSYya6UiOvoF0MWX7UMyxjfGcsIEp
 XIdb5sBWMRXjicUr24KagSnFm6d6ZBAxz7pdO1t2uMOqQ/FIPY2Vp+i97xulDillIn26
 Jj4bTMJOJbkZtcAUdRJleCi/lnPTyQCi7UfyBJlLPEK1R+aFEXWJoo1Lbp9SUpdkPM8C
 ultQ==
X-Gm-Message-State: AOJu0Yy/G+aYEU6iq589y1Z1QpogWVdfTx05kfqjLxweoiDHfDLytWi+
 vc/mSYrfpZ8W2EkVbvJiEsfT39geu/g0zahpQLL6qqhhnlwMtEKG3hiFeiALV/W1QOJeX3i8oPy
 yuKgx5KNCATHESJK+DBhzp45pkN464Q+eOz+ggg==
X-Google-Smtp-Source: AGHT+IEQMpCGcCv6MJDs37LwNfhYJ/aHQOmhySiSwOE4b8vVqH4/XnV6OaZWgrzn4PNCU6z/pjfP9qGkBv6/dQosuiY=
X-Received: by 2002:a05:620a:1a15:b0:79f:c9e:6269 with SMTP id
 af79cd13be357-7a1d7e8463cmr446035485a.37.1721978702356; Fri, 26 Jul 2024
 00:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
 <20240724101015.523535-3-vignesh.raman@collabora.com>
In-Reply-To: <20240724101015.523535-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jul 2024 08:24:50 +0100
Message-ID: <CAPj87rMfs+_EMyJT1PoLTXmrosDiqQy_N4VYSA+M3R5q4sit5Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] drm/ci: mediatek: add tests for mediatek display
 driver
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 deborah.brouwer@collabora.com, robdclark@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Vignesh,

On Wed, 24 Jul 2024 at 11:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +dumb_buffer@create-clear,Fail
> +dumb_buffer@create-valid-dumb,Fail
> +dumb_buffer@invalid-bpp,Fail
> +dumb_buffer@map-invalid-size,Fail
> +dumb_buffer@map-uaf,Fail
> +dumb_buffer@map-valid,Fail
> +fbdev@eof,Fail
> +fbdev@read,Fail
> +fbdev@unaligned-read,Fail

Please skip dumb_buffer and fbdev tests for all GPU-only drivers,
because those are testing display functionality.

Cheers,
Daniel
