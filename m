Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E4962D70
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6751E10E582;
	Wed, 28 Aug 2024 16:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gJjZRNEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5938A10E55E;
 Wed, 28 Aug 2024 16:15:08 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-70936124421so415883a34.0; 
 Wed, 28 Aug 2024 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724861707; x=1725466507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CuEwGIpDkqfIpxW0bgF/RVPt4IxIPFyBx9pLhSVN2JI=;
 b=gJjZRNEbcY3XtAGCKQVA6kj13ZWulv7rxJwHN6ME+lF1Z+o/Om3DuZpyO3fKqlt2dV
 M8mjyrI/p29p2ye/e3PN+HuPQ50iAOVJaHCsU9r1RzndpKgdXVwM16H/1W/fKcryYXBG
 Yapl3wgkjIfQwuhK2f8HdY/4BQZhBskcSs32C3oX35ndKzxZYiQIyz8wa83bXb8uS0xf
 5zkjDzn/xksSWbKFdtxDEnfG7Z+vqwsuMTP7xzKEGcSiO4NtSGqP/8WNh+1dceYtfbAz
 gbLho7q5pZ8FrOgLoAiRrF8TlXm+YefguQn0Ho6R5gP+pj3EG/np4bRoYjALicK6DSdZ
 qtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861707; x=1725466507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CuEwGIpDkqfIpxW0bgF/RVPt4IxIPFyBx9pLhSVN2JI=;
 b=puGnX0QexXg4xwKYKCiKc2NdIdWq1I+wFWUwJ9bBvCXjjAbfvdT8rka+lUVKw1x5x2
 PkJ+EBBJ+U2m8CvTgpKf78Qs0d5qB/wCWoFTcvbsamHOKDyX1wyi5OyWQug+Bem8ed4w
 MMfog2lNbgEt77sGHhcP4tPUMycV1evLyBICsDK4XZ5McYYUzxMSLxUt2M4Fl5O2l4kX
 JT4nbICd/iazqnoPDmJ5tJfxL+LIVfmzRY8wfqm+sAhsQqFYX/cypl95EjcE3hMQ+oT4
 JUspuT7uudbpmR84AjY5Wft+aT2KffAtrHm5yO7PKjRKnpjbfm2kwC0m2ysZ5RZNCiP2
 5BYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwURLPBHQ3rAip9H29K2DGT3TJBlpr20qMkMAcFuH12+Xln8NVP/3H43xdsnkffLKUXU3i2mr4ivGv@lists.freedesktop.org,
 AJvYcCWAHh0Zn1PGhVkzqIGpV4+iJjZWpnx7j4KS1+KL3u4JgH6IZGhL+N0Ryk6KTWad5zF5Yy+prq4H@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9XV9lxuPR+SLOTmqxPyHlV8XMvttD1a67YnGBLdNVf71BRULJ
 LR7GEWY855qN5gvwJRwt+40UPkWuyyL6RCVE0PwKOH4zLjrBFxPTUSg+R2CfjpttdiPvaQ4v5Qs
 lehjxuBQovbWJB/CUVCs9sW65RV4NPw==
X-Google-Smtp-Source: AGHT+IEKPm0X049OLCCWte/lKWA1onDQZDte91zJigx88Na7YtcnnIcK4NXUHhl/qlfnTtpRZbsgkb9gE5ObhgepknQ=
X-Received: by 2002:a54:4405:0:b0:3db:291e:2467 with SMTP id
 5614622812f47-3de2a8a90a3mr8754550b6e.7.1724861706964; Wed, 28 Aug 2024
 09:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
 <CADnq5_P42A81D_VufAdSkwVwC08ZRiT=6XAS3oHmSH325ygbow@mail.gmail.com>
 <D25D5E6FB683DA94+808c82a3-546f-4289-b531-fa24d7278879@uniontech.com>
In-Reply-To: <D25D5E6FB683DA94+808c82a3-546f-4289-b531-fa24d7278879@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2024 12:14:55 -0400
Message-ID: <CADnq5_MJTTX0koP7am-D0RoZro=0_e38ic5BoJuKhbyM6y-99g@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: WangYuli <wangyuli@uniontech.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com, 
 mario.limonciello@amd.com, le.ma@amd.com, Jun.Ma2@amd.com, 
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com, zhanjun@uniontech.com
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

On Wed, Aug 28, 2024 at 11:47=E2=80=AFAM WangYuli <wangyuli@uniontech.com> =
wrote:
>
>
> On 2024/8/28 23:30, Alex Deucher wrote:
> > On Wed, Aug 28, 2024 at 7:28=E2=80=AFAM WangYuli <wangyuli@uniontech.co=
m> wrote:
> >
> > This will disable dpm on all devices that you might install on this
> > platform.  If this is specific to a particular platform and board
> > combination, it might be better to check the platform in the
> > dpm_init() code for the specific chip that is problematic.
> > Additionally, disabling dpm will result in boot clocks which means
> > performance will be very low.
> >
> > Alex
>
> This motherboard model doesn't have combinations with different
> platforms or chipsets now.Their model numbers are unique,so it seems
> unnecessary to add extra judgment.

The error message looks to be from an SI board which is a dGPU.  Is
that dGPU integrated into the motherboard?  Does the motherboard have
PCIe slots?  If there are PCIe slots you could presumably put any GPU
into it and if you did, dpm would be disabled by default.

Alex
