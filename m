Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B5CB1EF1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 06:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120F10E65E;
	Wed, 10 Dec 2025 05:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="hs7siBor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA6B10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 05:01:36 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so11290514a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 21:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1765342895;
 x=1765947695; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXxD719dy2hjGMO3wbw17ffA0XyC2Fpi8GIIpwbBhBM=;
 b=hs7siBortN8yk7Ytg/TQeFg/u9dsBt/2+A76QBkSof4IDbFZjd1hhu3BLwgsBj9xpa
 dXkyVZD1mQpn/7NY3NpWUEQzI4BoxrHRnSeiZBMa/NKqYPWigbHczTNW6sHJwO6+QyKH
 rkRt/gjJWpAMoMhJDvK3DKKNo9rJptJl3hY9/A39RO7wuQvL0hnfEf3iP3by+G75rs6M
 VcuDX4EKKwdlpQwqkS14pLAaw7Z9ZA8RUOmmR+7iiTynSOFZC59mMfr2W/1EePajAU4y
 RnSXHzXwLQ4NlYOYCRdqyKAnFJmidStaCVaSUjRwHc/gYjnKyUHdqXBIzTx/SYQ/NukJ
 XMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765342895; x=1765947695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WXxD719dy2hjGMO3wbw17ffA0XyC2Fpi8GIIpwbBhBM=;
 b=mJDgHbFdKHHb2dIKBQUzgn9coMTvNoglWidDzY/PmoaXg8PH4VQtnNYBvJqCMBPWr1
 3Z1bq7ZqB/+OOYeB/qUCbzdFrOKEw0tOuieVyvxip2bSW3ZJQUokMc7rOTPNgW7vjMLu
 ZNgmxr0AYZY7UQEHZhTeEKX4ntbnhTJ2HG+LLzng/PzA2VAnXhvJgk82hT8MPJhw3bLY
 Qh7IE7O2gzCVqdtcDRok8b/RGsJq7d/lYVosL3HEVN+ngPwI8x//cWQhsccnet0TV1nZ
 3PHzOyUIb7XO7BvVEFFuaFz8r76wYiUR1h55C7weP7imRf6ShJRgVzyqcRQrT2H/jrGo
 E3Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsvUnjnY8ng0+mPcvzwmFkls1S1bW5YJRM7Avsfe0j0jKijJPTzb0zKjnnNfAdLFGrnpfK2RjWlWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9eLKxQ+uh9KdPjuTlpjwgrGq5G5moG7AaRHDn/BIDMGqswR7q
 WLCoG1pjlYbxE1RFlZN2f9Vav7InrbXeJxBqvMcFxYCT1h1kVr9U0/qbjQXH8zDsR7ZgUy8S/+N
 bOJaYvLpi/XMns/ckt8N0KNO77g3NttDv7bh9jetjzA==
X-Gm-Gg: AY/fxX5CXoLPJ0d89s3eKSoriwW8gLToqjPGqTykHHDEUUzcOdlNRd8/TygkangM/nQ
 QjEMuQko9tQEYw4NK50sRVqJ20cdyuU5vCIGX4LFjZ4b0+pH8iQjqfQ5N3ustLqsPqetdlaF9Eh
 ujvhHpX+xoJuYnKVbj0bAx90fCGWL5Mdqgdm23WmukhEybd9p99C1Kj9TnwthxRVMh1jkGCzMu9
 jwH7bY/wJA0D1D2ZzObOUjCzyOgUsoYr1clbMMY4nqyjzehuNz3CUhUEbNMQNeQ0DniLY4UB8Hi
 LYBqxg==
X-Google-Smtp-Source: AGHT+IEonKudisdXsoUX6nwqgYRT7I8OYV2s5URNsD7bwkXAsmrKaErN0y2xgAY1HKoxTGOxIyLbu4hZobhy/CLJrZw=
X-Received: by 2002:a05:6402:350c:b0:641:4b82:10c9 with SMTP id
 4fb4d7f45d1cf-6496d5d0fcfmr1132873a12.27.1765342894506; Tue, 09 Dec 2025
 21:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20251205213156.2847867-1-lyude@redhat.com>
 <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
In-Reply-To: <CAPM=9txpeYNrGEd=KbHe0mLbrG+vucwdQYRMfmcXcXwWoeCkWA@mail.gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Wed, 10 Dec 2025 00:01:08 -0500
X-Gm-Features: AQt7F2qfGPcnwhJI4UUlXnZS397JFiGDANTdLTmA6Amc3DZHfva7fmE76SbOb6Q
Message-ID: <CAAgWFh1DDq4BdGUTR7RGpWZzi3ky0GoAoof7Z21XA6uVNNWvfw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dispnv50: Don't call
 drm_atomic_get_crtc_state() in prepare_fb
To: Dave Airlie <airlied@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, James Jones <jajones@nvidia.com>
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

On Tue, Dec 9, 2025 at 7:40=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:
> get_new_crtc_state only returns NULL not an error.

In case anyone other than me gets a sense of d=C3=A9j=C3=A0 vu while readin=
g
this: https://lists.freedesktop.org/archives/nouveau/2025-December/050813.h=
tml
