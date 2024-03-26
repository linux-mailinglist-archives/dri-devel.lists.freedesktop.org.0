Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080388D015
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83B810F367;
	Tue, 26 Mar 2024 21:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iEOKRYYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324B710F364;
 Tue, 26 Mar 2024 21:31:25 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-29f6f8614c8so4305175a91.0; 
 Tue, 26 Mar 2024 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711488684; x=1712093484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiGUvrXT9lLzrsrKPCPoTMei8/8USegfYO7EBaP7sv0=;
 b=iEOKRYYceZZzOhNbNRnVjAewLAAmRV2dajL2+G91NUytRxtyxv4Dyw+dGFZfPHsCip
 N3ZdhHxTIVdfX42rS3NH5qDmOs5SWnUy3kHYun0+k6dXUEGbgWDf2zFiEpUzTJxPKq70
 tgAjePKULgsuHKYSmwz/3pilXN6kMBQ+2LmO5OKTHrKtrrQeW3kNb//txvXzi+GqRG7F
 SvTZ3GMZKgsNblLrGuStJU60B+cTzI7j+a83arNMD8lOWABN2cIU5hgy6E0E6kxYh/Yj
 L4iE+aHDzQxxArKH8AsM9aubYv6aDw/g04S77LowNefpzWfZyYwwv9Oiwt8PsW8F5dj2
 jl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711488684; x=1712093484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiGUvrXT9lLzrsrKPCPoTMei8/8USegfYO7EBaP7sv0=;
 b=RpU32/eax/SKZx3jqOqvg2tpTtyWA5BE5LgUij0/lRbxPktjR2NN+sY81Kb2hPQhek
 6cZsGG/PmlCx1B3pOY1zN7NEZBuxcZ1VEt+aeY6QtPqoAPe+a0Xpg/cxv7eNQd4g8vir
 +nejvMPgfJo663OSFMxB4metP4X2J3G+lNACCzKUUmDCIDlsxGXuPKRKzJu6MRu+/SzJ
 VCxiyzedaJqG7vfsxSUhdWrYORAfn3pjvf9BcIFSUbSxZh7FoSoCf89W7evLjbCZwRUA
 pG9igf+cZSsiSWP4mYFrO1FdAXlw/NRyFIWk1BMLEjwOsWNb8qM2ImxDSxE73gkWCvqX
 nJqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZY3sAQ6Wnr7CW+kziOmo0geg5OfgxnmQ6GXxPRgA1Xyo0/hQwViNUDveY4FxFtajKHowLOLCbzPkB9sfpQ+AcOeUo2dHZE8aPDMgSTb/M3kwKGO91/Bb8L4enyqNXotlIGxid2E9zGJGOGcDO5kNJ
X-Gm-Message-State: AOJu0YxRF1MYhRY5DkPGcteKpbTWzq/HQul9rQrvJk0Z435TxALA7TqU
 M6fpmpeUfdDyRmUAsHtcs0+/E5u0BSwpRLHT1f8MTXxnpOcJpFi9OAzkTNhcqqE3fzoeLB+roK0
 G3uqqt0zq/U/o0qQUSMWZbx6MkG9VI/eX5thrUw==
X-Google-Smtp-Source: AGHT+IENOACbX5Muhn3hNLP+uwrnNmzoaIn5nRqBxQrlvY5RyvzULA69EFRihpg6ANmhZEBWdyMhfxe4vy25DunBJIU=
X-Received: by 2002:a17:90b:4017:b0:2a0:3fe1:2e1 with SMTP id
 ie23-20020a17090b401700b002a03fe102e1mr8867114pjb.6.1711488684568; Tue, 26
 Mar 2024 14:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com>
 <CAA8EJprTNFgKJ_3cdZz4f_LCkYFghi-cfaj3bZmYh3oA63my6A@mail.gmail.com>
 <85204b78-7b24-61cd-4bae-3e7abc6e4fd3@quicinc.com>
 <CAA8EJppqrF10J1qExM=gopiF4GPDt7v4TB6LrQxx5OGyAL9hSg@mail.gmail.com>
 <671d2662-df4e-4350-0084-476eb1671cc1@quicinc.com>
 <CAA8EJpppre8ibYqN7gZObyvzR08yVbTevC6hDEDCKQVf8gRVRg@mail.gmail.com>
 <0280fa9a-cdb0-5bf7-7940-3c2cda1da829@quicinc.com>
In-Reply-To: <0280fa9a-cdb0-5bf7-7940-3c2cda1da829@quicinc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 Mar 2024 22:30:56 +0100
Message-ID: <CANiq72m05v8iYtkHOzmZSmyBx2OvEOzS09Fu7F8N1a2SeboBeA@mail.gmail.com>
Subject: Re: drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
 variable 'out' set but not used
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Mar 26, 2024 at 8:56=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
> Alright, in that case, Miguel can you please repost this with the Fixes
> tags and in a patch form.

Done at https://lore.kernel.org/lkml/20240326212324.185832-1-ojeda@kernel.o=
rg/

Thanks all!

Cheers,
Miguel
