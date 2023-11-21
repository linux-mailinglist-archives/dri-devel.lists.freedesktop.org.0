Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12207F3A6B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D9210E5AB;
	Tue, 21 Nov 2023 23:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DC910E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 23:45:20 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5c9ea2ec8deso31534097b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700610320; x=1701215120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55K9D/0MaAgBoqzbzMgJvDDB+4XxRw/Ra3ccE8iLF8s=;
 b=LRGDMxIO2vqbVTXwH8/jOShXb2/RldmDD4wtgeg78m5X+6rxYGsfpiX16oO9TAAlC5
 sHJ6MZ6iCoX/K9Kp0WW+9cCIk84J58StMiJ4LlQz645T3qOHlzmaOG6x5/mT44GeCmdB
 j9C4B/dIn795pn+iOLtbokv8ZTluhE8QWqcvv/5tW54KxwrvGqj4xlN/MeeGCddz2lpz
 lIZp0j05NXqpjl9b0moHYQtOL5kOtsKk3S728KUCTh8YCKa1j7ixxTKfB9xdJUtOkCoz
 6dUx98E688db3oyHHrpW5eFr0FydSU5iTk9u6Q2ixGAdLwjleuLYEAaSIIuLQLQ3VVSD
 JKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700610320; x=1701215120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55K9D/0MaAgBoqzbzMgJvDDB+4XxRw/Ra3ccE8iLF8s=;
 b=mJLXJADwYEW8EFxYJlIVeyFjLOd9XdNx09yhIp2lpa9cQHkOqWfULuDyrPDZ3vFpGb
 q314gbv0PvcLOfTRIjx4dz3s6q2IVh6fT+gnCCyf/OlAkFK9r2WJUzeQbSMsPZCYxnoL
 sEsKkaPD3lE09AQqbS3l16u61vbLBHUaempcmb4JBwuEy+5KUjbQiWGd/cyNhj/VjMkA
 6Acb0hWEhlQU65rlUB0xMfxRmQwlamw7xAkRY/jA8SQj02KtFJY76Nnt35B5nb4u4KTM
 U2pLgivcrQNplcX5y2flBR1F6JrK+ZutA1Mq+/QMHk8IL8y3Qw8ZdxZeUv5HzeDTn3Vx
 uamw==
X-Gm-Message-State: AOJu0Yz87bNe+mG9wFpTK6piaLbULqJ+diaogN0N8qT+v6/MsWukaN2D
 cIsBJ0HvNrdeAdoXWtdAuqUkthNKWfbSUr2iuyk=
X-Google-Smtp-Source: AGHT+IExOIvrkdEeHN5EO51l15UvLMRCLWuz9q+Qe0ufPwB8PWVqs/YBcBB6FL/ACBb+l2u1y5fH+9hzr8+d9eug8TM=
X-Received: by 2002:a81:7206:0:b0:5c1:4f00:6472 with SMTP id
 n6-20020a817206000000b005c14f006472mr461427ywc.49.1700610319892; Tue, 21 Nov
 2023 15:45:19 -0800 (PST)
MIME-Version: 1.0
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-9-tzimmermann@suse.de>
In-Reply-To: <20231115102954.7102-9-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Nov 2023 00:45:08 +0100
Message-ID: <CANiq72kD=zw5e_hq17zQ_3hzgZFbup7vOvvYWtJ_J22wyAbSNA@mail.gmail.com>
Subject: Re: [PATCH 08/32] auxdisplay/cfag12864bfb: Initialize fb_ops with
 fbdev macros
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 11:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
