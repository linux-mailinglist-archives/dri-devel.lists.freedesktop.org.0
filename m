Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89696AEA441
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 19:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6406310E2E8;
	Thu, 26 Jun 2025 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="g3+VYalZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3F10E2E8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 17:15:48 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso2436815a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750958146;
 x=1751562946; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLfECuoQMvCucla3U1r6BxHigyx1+JYThDNzS9jd4eQ=;
 b=g3+VYalZqk5vzGIDiLjy5OnaWTOrsAJlc8fXTyg+gQyqlZdu4J3ysCqchCgm8nW479
 8Hfmu/tcTH3RV5WxM/1S0ek0G1Oth1gqAoVUEGd3eZX2UOWubZgkVOgxPu5sTueYVXsa
 QH3DSupeI8KkJEs6ZA2OZEyt3Nzsr7Qxt8QvuRoWmk26Ed/Z07+Vu3b6n1+F7UcEwQU0
 I1jRMI4B+p35DdzxIuXN2Y2Gky0Z/kQ1VlYRm583rXkxnUVtjMUE5o21g/tklyBxmVcN
 5/rte5G8fTecS/pCzrDybnXze5yyRb5b2DBGwOD5LYGkxst8PzXgC/K0xzKUHTP/bQuM
 GZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750958146; x=1751562946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLfECuoQMvCucla3U1r6BxHigyx1+JYThDNzS9jd4eQ=;
 b=JGdB/qND2g1goIlIj5sS5FHeMR8yMYfxyn7R6hMQByXQEF4vaahQihBmddR6zjmQNk
 j/O2zT7a8T4+JZHdylnWBnkvHBron9p2l12LjOXcNEATiWX18FzSoWVbL0q+olKP27FL
 TTdxNGghM1H2d7+E5jhD7/TfCQHOx0yc04u1QTlkYkGfbKv7GZnd0JCO4beV3aTF3lvu
 uLHaALFni//JDncZuuHjqUR0A6nT4NZDPMeeWkTDF8V6LVrjZYxqGIYZWM6DHv/RAiA/
 igyIghtoQEjSNSUFcGzrVsSZM74uapKNiRKUscd952CirROhchLWw3O2QKlBbgb9XtJG
 P1mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV04185joWfgbQsR8klFQPazQGkM8L8bsHG8mlJ13uZ2ad/lJ7SRnaTou+G8Bej6pv1yNDsxZnS/G4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ8hiwWbaOkxS0V5SmBgpBHwj5aUUO71kpNaIV2u/naQHM9ar9
 PAHgRtgIDhucxVFP4UNBLOxNFejhsbkJ1yUKnBz/u9tWZR2AWHNG7pQPhi8HCg92zQjcnYu/O+g
 ixtl86Z1PSJz6KJQ5gSTg+SqQgdHNzETokqVT9ufzRg==
X-Gm-Gg: ASbGnctP+nKNt6jvCDgQ4RBLRumt/KjLxXTsZN1oBtEa0J0i0vzbOKeo9SYktGLDR+T
 OC13rXMhOqu2IfmRRDNCIs2PMRnA3A2A7onuPrcH9tAQ/7EcyDxngaFANPo4j2wCm5GOdQZ3jDO
 FbBtWVDj0z2unAE157Zz20R0Mdep4fRJZsRgeA4SYbww==
X-Google-Smtp-Source: AGHT+IGVNUkUCO0nah2E3WODdUj5zdLVLo1Sh/MdDqZ7TtgD3xcSUxlLdntTQWNRNqZlDdb3DykRhw851y+PW6YdKUM=
X-Received: by 2002:a05:6402:13ca:b0:608:176f:9b5c with SMTP id
 4fb4d7f45d1cf-60c66992674mr4246427a12.20.1750958145370; Thu, 26 Jun 2025
 10:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
In-Reply-To: <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 26 Jun 2025 13:15:17 -0400
X-Gm-Features: Ac12FXw88kvHArfNZhyMBY-_xqtKscFpUyd2DhdR2y-j-0Cyv-ChhaFAQ7MagNs
Message-ID: <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: Timur Tabi <ttabi@nvidia.com>
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "martin.peres@free.fr" <martin.peres@free.fr>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
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

On Tue, Jun 24, 2025 at 3:13=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
> You have a good point, but I think your change, in effect, necessitates m=
y request.  Previously, the
> default was no GSP-RM unless needed.  Now it's yes GSP-RM, and the concep=
t of "need" has been
> removed.  So there's no indication any more that some GPUs need GSP-RM an=
d some do not.
>
> So to address that, I think it makes sense to add a warning if someone tr=
ies disable GSP-RM on a GPU
> that is not supported in that configuration.
>
> Now, whether or not we should ignore NvGspRm=3D0 on Ada+ is up for debate=
.  If I understand the code
> correctly, today (and still with your patches), Ada+ would fail to boot. =
 I can't say whether or not
> that's a good idea.  But I think a warning should be printed either way.

This patch behaves exactly the same as DRM_NOUVEAU_GSP_DEFAULT=3Dy
kernels already behave.

That being said, I'm not against the additional error checking here
and can add it to the next version of this series.
