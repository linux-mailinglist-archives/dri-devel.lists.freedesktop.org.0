Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459578D66D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845689496;
	Wed, 30 Aug 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CF0895B9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:15:39 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-571194584e2so3460802eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693404938; x=1694009738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCpeAPS/CibFq665kaK2mvNCIQFGx1fXEcmTzAPISWc=;
 b=TiKhgeqY8ZA81QIykwdNnskDxiJBc10gwVUGXtaCNbiIxQ12ABNVdYTQcdsKpaurWB
 4Zc4T3dYcCWa6Dw98WnJzx1xukAhhHmK6syQ94dj84ntCFjtmOFE4e7NY3n4vVGHg0hW
 S0X8UMveML/xbDl2NDrfUTYPKQuk2iVzfBPTb0wGGJ1dtJFit0z9GHQEphYHTWpJ0uS0
 JAwuLgCZ8tOwxfOLiBsaDD2TOZSNC6Y+hxeqWoKedTlVjurVMqTsP9IP3I0xKHc7O7pg
 JXvIbxWdpIHzgUxopEiDEVHdl7OEg1q4yFIDg8Ln5zMt+J/rKRDY/JFmml8pakvI44i0
 B6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693404938; x=1694009738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCpeAPS/CibFq665kaK2mvNCIQFGx1fXEcmTzAPISWc=;
 b=inAl6cipiU2F58uR/0H9P4j3V6FCj0lj8MOrotn25Ep+kt9CySFWs2PuiJ0uj68aGn
 6wmMMKQAgsSCCzW6JnMSgOdAfccTsl2m+ty5VMeNxeVDHXt04d3siVyBbcqu32kqhOXc
 KrH79baVG5Vfat3JfvIHQOPZyVoCyEzisMx8YoWmw3MlfVkMG2f9Gb0u///+IH8t8tbr
 L3y4U0+hnoFiNagypNQPQ7iCkP96dlLpCfiBLCKsoD7Lf+XXe9oJcufQ9JqowMhFj880
 4oCmMKmNZ+8hPLZJTx8UGjAlUgAz+k8Y/b14/I4qCQuW85N+hRYjnWApjUFHqWQNKKt6
 g9zQ==
X-Gm-Message-State: AOJu0YxQ4J6jZY6Xn3JMuMbXjtMZZ7RaRsn7555XLVanQvCvRYrnSn6+
 Ysrcg9sVIu0zkfMEav43HDyrpPpYXeenY6BBM0U=
X-Google-Smtp-Source: AGHT+IFFDnRR2uY0HMprngD3qnR0QCHLsvwLy0H6o8N6F5irKWos3ZRHDcMLDSu3VnmsJJtI9HCVvtNsuy0h6t1SXXo=
X-Received: by 2002:a4a:9196:0:b0:571:28d5:2c77 with SMTP id
 d22-20020a4a9196000000b0057128d52c77mr2188112ooh.5.1693404938283; Wed, 30 Aug
 2023 07:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
In-Reply-To: <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 17:15:02 +0300
Message-ID: <CAHp75Vc72uuNvFxq4TGO=nXoGhbqVxyqvQ67ioL8ajtZwMUBgA@mail.gmail.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
To: Philipp Stanner <pstanner@redhat.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:

> +       if (unlikely(check_mul_overflow(n, size, &nbytes)))
> +               return ERR_PTR(-EINVAL);

> +       if (unlikely(check_mul_overflow(n, size, &nbytes)))
> +               return ERR_PTR(-EINVAL);

Btw, why not -EOVERFLOW ?

--=20
With Best Regards,
Andy Shevchenko
