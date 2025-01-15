Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E3A12A0E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 18:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B7410E097;
	Wed, 15 Jan 2025 17:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iGf2wGTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8983910E097
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:41:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540254357c8so41120e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736962917; x=1737567717;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+T2CnUEMVV122guf70dd32dApSY+nI+zOtwtB/HpR38=;
 b=iGf2wGTr4H5LAolpPkDQOtmcDzw8ABm2KygS3maZM1B7+sSjGN34JWOPjSeyjTHXat
 OyLtvKEMFjLJMnlNG7WJPAfbQ5Q9+S9u/o6bSn5stmBAOKNCxxNqluGYirygUizuCZfU
 eeSjx/oBrNeko1cuB7b9LvixRN5i63r9wY3dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736962917; x=1737567717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+T2CnUEMVV122guf70dd32dApSY+nI+zOtwtB/HpR38=;
 b=UR/zf7sG+CsieCFfR8+g5LbD2cQPBhxULWk46tk4K3jtq1bpOSDpdGTbehahMAssWB
 rK+DsT0l7UzLf0SsotyjDXutuJETCjNlZHkhKVm2wyf7pCXYVwdhD5DkO7vtvN5DVpPS
 vETE+KByA5QGC0h1VM9sPheZSY1HNShW4VHbjY7p5u/VXQRpVz8TZb+dpgd/DLqvXbz0
 pNH9PeZvIwo0Kf97KNqg4tT8QTPywNAeFSLN/RP3nbGBvUni8p17atOwmI7EuqNTakp3
 P40pW29qkNrfsYLp2MKCBUatAfPCjJTYzTrUQ+tOSENokr2tZDpRGq2OYpRqpF9JYOY3
 nIAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrIlmhlNRj+ETyF5D2HzLRUiuaKa+dgrl/NWhGlskft5ufFYOWNWQdmaBqNWR+sxVxoRVeydwnem8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymcXh7fCvE/VGi5XI7wEPjxPI2egZQ/ymGMUBx+8OyehvrTR1s
 OseXVSRtAfl81nxFSdlpnftyKVLbIiolkqzSUXOXsqXmMyPONDWSwwQLyxBW9ynyL3lBPyklZU8
 Muw==
X-Gm-Gg: ASbGncsAgWI48FafdWkgZErXAo9bGMcrriK0BSGlBmEpG993wHpQVBUmWF1V9y+2K3a
 wps1e1IjAjXEsYHV+FsjnOrYNgrD3rB9qdQVlVXbZEsZhsf0d7/H8Y93K4skjVvW2Ad07j9CKKG
 Bepx+Gi4NejHJri2kXY/B9DrqMx00R9fFJ6Tlq/1gH6AdN4+0Qun+TZrrW99dUnc65/avBUbnRV
 C9foGL9Ew+DdGzLoR4NFwOKWqRrIq9ZdbTxMG/KXw7zHD3ae61P7rzXbrmT02XuumipalqETzIx
 cyJWr/TKuIYWFRvtQHnjrtIO
X-Google-Smtp-Source: AGHT+IHiKFuj/7my9KzuDgGkXks9TsqsK3QBV4Rjqp1xWIsTCgX6wnMZnfT4pP5/2CBiuu0HlskDlQ==
X-Received: by 2002:a05:6512:10cc:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54284560039mr10531335e87.34.1736962916706; 
 Wed, 15 Jan 2025 09:41:56 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec2100sm2047209e87.212.2025.01.15.09.41.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 09:41:55 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3003e203acaso482531fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXl8R7SFWv3wyXNckn4Dlatc4tuFx+ciYaNj7luj1DBb9qTE+hGZPD3a8dWPh6bb2+6n8DBX4kT6o=@lists.freedesktop.org
X-Received: by 2002:a05:651c:505:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-305f459ae63mr109436791fa.1.1736962914632; Wed, 15 Jan 2025
 09:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
 <CAD=FV=VdtA+4AsdoKeig4hheS0CX9d9wk7+ksi0_TC-R6px2UQ@mail.gmail.com>
 <fcc31ba7-a514-4bfa-9590-8a8c2fe538e7@suse.de>
In-Reply-To: <fcc31ba7-a514-4bfa-9590-8a8c2fe538e7@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Jan 2025 09:41:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VsyLFQL33i-Xus_rGqJE=bp0LrkghtBiOYhF_DU7xF_A@mail.gmail.com>
X-Gm-Features: AbW1kvZy-K5HUrNEcsqiF_1tnGA9RyLBeL25P1ys2bd0a-bSYP30_XBszMnZGAw
Message-ID: <CAD=FV=VsyLFQL33i-Xus_rGqJE=bp0LrkghtBiOYhF_DU7xF_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Yan <andyshrk@163.com>, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
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

On Wed, Jan 15, 2025 at 1:55=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
>
> Am 14.01.25 um 17:44 schrieb Doug Anderson:
> >
> > FWIW it's good that Thomas replied to your patch, since that was the
> > only thing that showed up in my inbox. Your initial patch showed up as
> > spam for me. :( Not sure why, though...
>
> FTR, my R-b was for the code itself. I did not verify if the values are
> meaningful/correct.

Yeah, no worries there! I appreciate you taking the time to review
patches and was thankful that your reply meant the thread wasn't stuck
in my spam folder.

I've spent lots of time looking at eDP panels, so I usually try to see
if the timing makes sense based on what I know, but agreed that it's
often impossible to know for sure. ;-)

-Doug
