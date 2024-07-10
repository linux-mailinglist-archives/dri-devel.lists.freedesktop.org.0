Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06B92D556
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 17:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9844E10E1D2;
	Wed, 10 Jul 2024 15:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ch7oaU+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2C110E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 15:50:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42666b89057so73905e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720626630; x=1721231430;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWZUqKVzg7P6u5MGavsKXGRW26DyCY05W0UIIBlog9I=;
 b=ch7oaU+CeySlHlAxNJlbBgPaige43vvz1iOrbe4ntiXdCh322aNS/wiK8CRTUym55n
 WrU42wXc32U4XYapq/ka8QtmK77Q/5gXHrkTADnAcAqwa88ZBKiw+3iGix/M0M4DbUVR
 o5FlRzF2t8TJZzu5Wf8w5f5Hf3Xf6I5IOpJ82bBWgwTQSIob+wvgxq99t3EIR/6eAV93
 rGgcpAMRDcnFk8mCeckgprJjl0wkVK2Kw6LZRWLnmMw/D5rHIItav0GwhRmf/doffKOH
 mTFRMgG2A8UDHRd5zRbNp3zhwMfoBxmCoEJfK5eMhjuCE32/7eLJP6kuZwswqjgR0LyC
 MBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720626630; x=1721231430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWZUqKVzg7P6u5MGavsKXGRW26DyCY05W0UIIBlog9I=;
 b=NI+yvKm7IqU2GlM42I8NMRfbbzzFGuVoX4fovRaIdHUqjU5nE26xBgdVi4RKRDovQn
 IDcQNNKu9eFodiLweFYPWcHbDGKZaealb3Cl87OE1DpYbPPU8CMgu4bKC/z1pUBFMkbv
 RhzVQbkgaEMfRwtee01KJUc41c8a8dDuyS09V8oKICP5jYtXrjAW7ttvsiYmw4OTvnxf
 wa3XKFLJAiyLpm2sXcGNTgqkpIHmgiuLGBrnS3TS8897seh1dkMWFUgLpRmIHHgg5W6G
 Dvcnojo23pGfdppXUE84OtUR516NhZC9cFQotu8W6WncMgm8dwlOcUNbeTiU9CI4GRLp
 oWBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAnx2mhnMzV3ByzyMA8Zyj+eMnn5CyegTEhRrRGcPnrYpWzQgsGNn6JBJyUbbXwWAJwUR0xjDwpUVlqIkoC4WKIteUqKDAU52Pcsj6SCbW
X-Gm-Message-State: AOJu0YwfvvC1j+9C+wzFaOCAf9ot3tKB7MEVY1Jp9pVmnFp+SQUCrdUv
 VkwYnLUN+cz7J4s4p1iZJmYPuDYP/kAr6LULtaP7BgZ9wqM+mGk4GCxOLhf/QGEQ3ZiH2hVeNON
 /hzusdUWtcBYkXtZxPhnywyoO6lUdPcZygOyu
X-Google-Smtp-Source: AGHT+IFo76W0cPpP3VpSRtWR1YzUtFerX+Iej1bNsoOgXR2VdbT/Y86UlDjWq8i3WE9bDJY/MtS/YOS5s5OndIv9OFA=
X-Received: by 2002:a05:600c:5718:b0:426:68ce:c97a with SMTP id
 5b1f17b1804b1-42794253b39mr1516875e9.7.1720626629870; Wed, 10 Jul 2024
 08:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240704085555.11204-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704085555.11204-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240704085555.11204-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 10 Jul 2024 08:50:12 -0700
Message-ID: <CAD=FV=XD=B5Mb36UxxaxCdhEhgXMFKmUjf_gnKda7hgq0-YYaA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] HID: i2c-hid: elan: Add elan-ekth6a12nay timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
 linus.walleij@linaro.org, hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 4, 2024 at 1:56=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Elan-ekth6a12nay requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 300ms,
> so the post_gpio_reset_on_delay_ms is set to 300.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
