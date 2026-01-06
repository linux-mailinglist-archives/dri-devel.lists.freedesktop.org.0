Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EF6CF9277
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 16:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099B10E515;
	Tue,  6 Jan 2026 15:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Np9ZRZdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CC210E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 15:48:28 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-34c3259da34so1074653a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767714508; x=1768319308; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDeWwtGZZ/R+RJWyYvHftoXDDl+9pCPFMRNPnjt8G1g=;
 b=Np9ZRZddjWyMrQQ2/T8243/3HEE2wxTSTlR26c9PxQZycctgQRJ6sF8FzDFxMnyyM6
 LeAdAQJ4wS4rHlFlBcIqkTZNya5wLDpetf+jFYXL4vUv+JK082kCtnP0g/RSovzFYRFX
 VbnMDPqtcwJRXw8EO8gbeLIZYGZtze18zvcWrMzf5mEzA1WWG75ywg+golCEK+Ts+2wG
 uWh3L5ONcgn98pwMABZPu17nbuwYed1F5+ar59WoKOPvHTlsli1PPmMCkts2c5NPATOq
 mTickHwjTHTbHYICF5M1XF2+UiW3SXWVuRT29CnyZxIPULLZqdSVJMJ0jeshJm0LfP9F
 eoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767714508; x=1768319308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDeWwtGZZ/R+RJWyYvHftoXDDl+9pCPFMRNPnjt8G1g=;
 b=gyMau3GQJxBj247+pMsJnzelIbAZIo4XEOfx81odWOcegtt4jr0VZNb1Cq4iDDzrWB
 EJwfl3F6edvk/8Bt6CmCUt/eirtVq+V8Ff0Mcu6pChAvoLhZp5Oy/xb6wsCpl/U5SydT
 gKF+v/wGGr0wCEM9eC+Ueyd6iWQ+HJZ2Yx9x9IM2tbuEaOXk0jxVHlJu6jPkVvff8WrX
 PxK6RpEqwH1x0DiT8BfBidbOnKPhfMz2KcIQ/sBUuFEWE45BPHYxRzCG8+VoYiqp0KE0
 L12uyHjngTWYVq1PENyVOhrCXTjyHhQSsqhwJ9EcVh/dFNFa1aRLn0Zz4trWBDW/nt6G
 Rwrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK8XB00j1BHh9Cg9NLpSx1qv3c9z7vOYmktEdFA0MohyHblbKwi+7V3YQ0JqMMxObeIyTrunNllTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLG5eK6xqP8KP+Oiy7S4694jKKaquAf11socCsiM+8jPL57kyd
 vEqWlri2AhPoFkGyk0IiHg7UxnKmeSfzY1RAfQh2vQ68TMB+HjpG00cuZcy1Kbcj/kn0QxM5iW3
 iZBopJUjp6n6bU8Ks3BElc0zMYJ9Rm/g=
X-Gm-Gg: AY/fxX4g6z321uhgwCkavbEIXX38Mb+F00VmqOhWWSHyW3fPB9yRp5DvbdPvAa+4D3P
 o+7nghFL+aILj8/EaE0QL4AlJk++XZNAyNhe693RyCNLQ/iohYHRc7Oq6w4G6npXegw5Gmx5CaY
 goplc8EY4nR3jst2r4J9oAyKSHrNr7gwppH+Q2awbQ2zpR34f+rBcaQZ6rR3veym7RKdKszrSkj
 2vyuHDkMC9BiSZk3jIR8q2iDvxjVOWwBvatgFZFcQxph5eX+qBh1Z94GQq4DjRZpGk4UFLO
X-Google-Smtp-Source: AGHT+IHiaPPGyj/cnpDj8m4HDXquR3Pl7oUuHN0aY5yL41pxEhlepn4C73GOB3o+YxsZXbMciPqziYoixcHsf8WCV5s=
X-Received: by 2002:a17:90b:3e87:b0:34c:ed28:a279 with SMTP id
 98e67ed59e1d1-34f5f291108mr2735224a91.11.1767714508280; Tue, 06 Jan 2026
 07:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
 <b307fa5c-ccce-4f4b-bc38-a69c6b9d6095@mailbox.org>
In-Reply-To: <b307fa5c-ccce-4f4b-bc38-a69c6b9d6095@mailbox.org>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 6 Jan 2026 16:48:16 +0100
X-Gm-Features: AQt7F2pXEHeKvFj3Y75tqV0CU6vcwn_KI1rYKFkw609zpE7T3WzeoCdHLYofjGY
Message-ID: <CAH9NwWfZ7VU=2A5oVbN_Qakd3aHmK0kdPyC9PpOZhVCY5DCdJA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] drm/etnaviv: Add support for running a PPU flop
 reset
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: gert.wollny@collabora.com, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel <kernel@dh-electronics.com>
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

>
> On 11/19/25 5:45 PM, gert.wollny@collabora.com wrote:
>
> Hello Gert,
>
> > this is the fifth version of the series to add PPU flop reset.
> >
> > Changes w.r.t. the previous version are:
> >
> >    * Apply all changes suggested by Christian Gmeiner:
> >     - fix a memory leak that would occure when PPU data
> >       initialization fails
> >     - remove unneeded includes
> >     - move includes to the files where they are actuall needed
> >     - fix include style for "linux" headers
> >     - fix typo in error message
> >
> >    * add Reviewed-by tags to the according commits
> For the whole series:
>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org> # STM32MP255C DHCOS DHSBC
>
> Thank you !

Applied to drm-misc-next.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
