Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85855B046FD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 19:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A610E29E;
	Mon, 14 Jul 2025 17:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TImpkLcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157CE10E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 17:59:23 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b26f5f47ba1so3669388a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752515957; x=1753120757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OG3AY/r+5jGyweejzWZqU76oacNUXzplqvD2s/v/W0c=;
 b=TImpkLcUoF3ZaQK0n6Ik4CF54hs1MV3LfbvPV+j6pNSmQ+f88wcvGGcm5w7lQHXEk9
 RlJE5VlFC8UcPecg1fXLKg5JhhUuWzsrMfK477N7NZWEczButrfL3TktopUm0Ps2JwjU
 VeC0cEu5akmezv1qd3q4Oe5ILqlcJ/691r1fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752515957; x=1753120757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OG3AY/r+5jGyweejzWZqU76oacNUXzplqvD2s/v/W0c=;
 b=wPHcMihGvRTSZEJ/0w1Cvhu5i/oZflwfbMlYeARLZ97kUlQNW+hfPFa1Pm2RSZwSu0
 BsTZniGygZIqMTQXRm6rPmfVAdF/UzmyUgX2bvm+5Ry9IpYysv/h1Q7mA4cmdceBC5Ho
 c0VOh6tA5ySBDPzR+Yi+Pw35fkV40MD/u6L6HqDYQCmUPpLItQ9kkMJ4jtubWFmvdyzO
 A7d9/TNFwdt2FaPCzfWfcWbCZjixEcMiifUIDi3ASqW9R8Hc4Y5mI7YHCQMDPFSG4sij
 hRSw7hpTb4PWf/jj3IeV8lBTA/70cmpxrnkDCA1gAJV46STk2EVgCecQGSsW9gIvxI8J
 Nl6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBqUgSZwz9O8n5bbN/JR3v6jszUwDuyOvPuKs9haDxyQzyQEF08cX15dNNiR6KP/yGHLEL1DulBZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT8Qtv7c/OaUn8BH+LW8SNC2DcfGj5q9Fp4Yh8Z1hbe2KdBR2U
 /yWeuBFfHRidvfoXAyLiydBvWcPuZ72XvR55IsTIrWvfPPRWzoHCldv85FgpD5fuwCybbKSioE7
 Jlos=
X-Gm-Gg: ASbGnctSqujB2aW/TJlZUP1Rtxsr4wT2E9PrE2CYYPSLJ4VsfO22dqXtSVUj5bJaokg
 JdqVams+rrdQb7KBGAKbaSQ+BPOaoUWI6x9U14jR82Y6FMZWEElLCP920bDfp23P6pwflfAQ94X
 DsE8I0hLYjBmYOa51HU+ulJyNoIrUnc4ZZEr0AxoIEIUlCxbaOmSrmy2L5dLmK1BnRMFUoJyC+6
 Y72KQzfiEpG710OP0n+sHPb0zoN3/plHQ2r1q8h1kXVioaiZRIrIQjQnFYpTT+mQBNEouNm3Pus
 Lng78LdQ0nk/vJcxXN2Mcb2ayDcsAWaUpVSARacbUZjLIhSzn6bqSgmf2iYz98Jsu4uV0+Q6ztP
 E0j79jrv6Z8OjH5SFDYBJN6Urhie/5QxzyFha1Y0F6Lear/qHVzNhWCeWahJvnw==
X-Google-Smtp-Source: AGHT+IFZ8s+hBGowAsNjiWMdt8PNoJUGB57zC+ttuExN00cOB5L6rzlyPR85aw9/iikm/HYVvO+SjA==
X-Received: by 2002:a17:90b:4c0b:b0:313:2e69:8002 with SMTP id
 98e67ed59e1d1-31c4ccdb25amr20390528a91.20.1752515957377; 
 Mon, 14 Jul 2025 10:59:17 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe587070sm10582052a12.29.2025.07.14.10.59.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 10:59:15 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-313a001d781so3622803a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:59:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSvLHM58CW/I+RDtbCcj46Yrr8LtgHN+Am/N0J3uKEEgK2HTSpJJfOglR1TjqgIg9G/Z6nVIv588k=@lists.freedesktop.org
X-Received: by 2002:a17:90b:6cb:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31c4ccdd5c0mr20464043a91.21.1752515950671; Mon, 14 Jul 2025
 10:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250706205723.9790-2-val@packett.cool>
 <20250706205723.9790-7-val@packett.cool>
In-Reply-To: <20250706205723.9790-7-val@packett.cool>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 10:58:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7HckYJn6Lrh8deipcX=_T3s_B=oXeVSQuxt1a01dwEg@mail.gmail.com>
X-Gm-Features: Ac12FXw7OXhFtZwKbLQwLc4HMDijZPxZ1TH2maNwjg4oUlQ_nk5JprebZ5XShwY
Message-ID: <CAD=FV=V7HckYJn6Lrh8deipcX=_T3s_B=oXeVSQuxt1a01dwEg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] drm/panel-edp: Add BOE NE14QDM panel for Dell
 Latitude 7455
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Sun, Jul 6, 2025 at 1:59=E2=80=AFPM Val Packett <val@packett.cool> wrote=
:
>
> Cannot confirm which variant exactly it is, as the EDID alphanumeric data
> contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
> touch.
>
> I do not have access to datasheets for these panels, so the timing is
> a guess that was tested to work fine on this laptop.
>
> Raw EDID dump:
>
> 00 ff ff ff ff ff ff 00 09 e5 1e 0b 00 00 00 00
> 10 20 01 04 a5 1e 13 78 07 fd 85 a7 53 4c 9b 25
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 a7 6d 00 a0 a0 40 78 60 30 20
> 36 00 2e bc 10 00 00 1a b9 57 00 a0 a0 40 78 60
> 30 20 36 00 2e bc 10 00 00 1a 00 00 00 fe 00 30
> 52 47 4e 52 80 4e 45 31 34 51 44 4d 00 00 00 00
> 00 02 41 31 a8 00 01 00 00 1a 41 0a 20 20 00 8f
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[5/5] drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455
      commit: 1a304a2f8f7dbe25f555721f502227f9197145ed
