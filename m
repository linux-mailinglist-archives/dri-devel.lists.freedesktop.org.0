Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FCBEDFBF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 09:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14C10E0DB;
	Sun, 19 Oct 2025 07:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E640810E0DB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 07:43:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-57bd482dfd2so3237064e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760859776; x=1761464576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a6iMxdmrYbuGMj6PYzMkKXgm2YkNHUTOljsMub0V7/Q=;
 b=uKh90wEK5jiy1T/PbbWrhMcp13KqXnde1P6Vr37LppotmWC0j5Iuuf3qvCC7tGJR29
 xoRSDwH0DuFXey80hKbQz0Bl+YOLTRApehFDibFJEG43bCMBQ+ifJJCRlWPIZnfFHuRW
 x4n8BBHiio6A/0a9jzsvxAlGx3mNTe+pCBa5nYPYDRTt6qXPNk42OsUiKdjoUg91iC8Z
 4VvuJnoN5HosW5sTYKmIss6Fh/ruSKqa1PzvBsaDdgOevcpNvVwvESeO3LYrWucwEwNH
 kOVAF1/bBI1xmVrF1h9NZdmT/eS5gUZX985UVVWgTepIWKoKuQCf5qtosbOhG9aAJeHn
 OoFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl8/6250TJ0q3RGknc/tbY+1TP3SVNed48K6UT3DvSAei39pvINTsYFqJrpnBCTo2aXGDIGrZF36Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDzLUwpObDVXXgmbgOny0ELUTFU0SalTAxaqkUMWGMm/3F9lCH
 u0yXyXi5w2+cnCDN522saAs223M6e5o8ARfL6VL4pfbVFchh3AkiuV2PA6bG/3Vz
X-Gm-Gg: ASbGncsGB+DMAVtLpu7zK0T8YR1X2EZDnDKyrC8CuZorvnsOMiCWcE97U8YxLer/Rb7
 eK1Y6ucAMQKDx4Tu+vgBocry5h8JNA17rZ55L8rq4FOjKK2QPxa3U2VO0vgLeK/vfs2b/9aF7s4
 feCdW/uLVmMrCH4NNGRYRiUzG0n1VcG/OQMYehy9K6duChXwxxuLUlLuy3Un75GnaAIbfGUYpCf
 Ui+THD2v/PANwflU57B6LOyP7I4ooebtoGzm4m03KZwl6/SK1A55IbPJB+j3mNLwzQV8T79ncKl
 EzooI8WoY2zR/slY/rtBCn3PGKvp4wrlH9wjyNwf5o1qEWuzdLU8vBRZup9W5q9BJJcM8mFwhiL
 8Q4GjpDlPxv495YgwbsF4MLiw1O9yUK1Tny61SpgmaGF1ek1/Xo5yKGqxs6d0PGvNP/RAwhOpYC
 PvcAK07O0G/gk8gnoCKFqqhlJpVcQd
X-Google-Smtp-Source: AGHT+IHBMUQg3Cp4OStlACEr4DgvmeeDyQmidviii23Fxd2eZ6Kc5pnL6Lhxv2M4OEBcQfLesp2ZuA==
X-Received: by 2002:a05:6512:b97:b0:58b:11b:28b9 with SMTP id
 2adb3069b0e04-591d85356femr2569240e87.30.1760859775771; 
 Sun, 19 Oct 2025 00:42:55 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def169fdsm1340356e87.68.2025.10.19.00.42.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-57dfd0b6cd7so3789824e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqGc3iBytzHqzDwE+O8wihS6F9BobgIakZGOM0QB6ktNNvQY8b+BbYiuNNfvrLIOXpmZl/xXUn5w=@lists.freedesktop.org
X-Received: by 2002:a05:651c:1510:b0:336:ae5b:8a12 with SMTP id
 38308e7fff4ca-37797830eb3mr28747941fa.3.1760859774128; Sun, 19 Oct 2025
 00:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-3-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
X-Gm-Features: AS18NWCc9PhOVShnjr54QcL_MXzi6J-9o-zc3G5gD4DZJXqV9MLEpSrxeXlLZX4
Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Those engine versions don't need ccsc argument, since CSC units are
> located on different position and for each layer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
