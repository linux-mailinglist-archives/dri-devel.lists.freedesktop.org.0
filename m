Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FFB45D86
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B151110EC24;
	Fri,  5 Sep 2025 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XeyHUZgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5383710EC0C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 16:11:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3dcce361897so1573744f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757088679; x=1757693479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
 b=XeyHUZgNUwi3+dD+9VEM6vq+qxLMoQzp2vk6ZD7fzooNsWrKacwKxeaQasDbxh2jWL
 9u1lPe/lFlHs2VSJ52FFErUe8OegtsoAK/tiRGLmQ9I7gUTGMGJB/+zu/idtZYxY2lrQ
 m+TlOzOleqsCdk/qrmz0UFc/3DuZ0eMt1axulvynSdca5gYWDe0K5lqp5QFfvEaxscTI
 49NZa/8t9eIJ1P+WAPvr3XiDfTYq9uVJkwtr8/w1C5IQCIVorPt0Z6r6OlRDuvHlKlu7
 MxOqUYitDy+eoSzOJ2AB1goFKV/2skm15QtB9Spn3ceUzJN3Toy9QtvrlWlma6soQYo7
 4fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757088679; x=1757693479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
 b=CIyy4B2+jpMTaWFuXK7W6Ovkwld86HR3llJmer5Zf1ABxGn/6VyQtSBhLZdcEMky1g
 MT1FJlrAUkoa55rYftle0/BOLToWeo+S6Abmg0GiFUJ+845ode58Kdv3/qP+MTqfoy0b
 wbPKynS4Z0fNvN5uqrylY5B2cJtE5Fo4zC/v+ITwLJvtvTNVBIfHc0HrfHoJqQ1UvDgC
 NuMuPSPC19ff1HkKi6GBrRboPYapqkwYbaYBcH0oMTM2UXNmHwedotUJRnguIpYslAdZ
 kZXxIImSDbLQoY6xG4H+k6RkCtsVUXUIIhgoOMHHxEtcdVxH4lrbwUbZc7X/C8exRfwI
 cuVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV67bdzhbrXl6awDwVYQP5T6FvOktU1X3jVwU/DDvwS1Ub2kCYMtH/jG3eXLFJfYSGnVPEp6dpoQ2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjfMfijboZXBDjRKPPr3pyl2dL833m+UZIe8n/yIFvzHlI+Qrp
 7Rkyd9ajWfWb8RZzZHtUmvm9cqgG8nEvcylGinyDk2oJvishevcnIXkG9rjysVh1LMxvQlhjBuv
 bCZj7Xbs1kYd81USdfI6s3kbv/ZanOpI=
X-Gm-Gg: ASbGncthvVRuFvnwr7IaoA0aCzNA1Mt/eva3Ze/aSyGqWCh4xByuLD7E0us3Imy4ODO
 LiWHhUhl+VC79OsH9VZLv0L36mzZquJ6UA/jxDOeTXvtHUZcyjQ34guJztIhSnhMYznR8Ft1coc
 Eq4q1n71L/Nhovr6Wkh+EdvTY9o2QYaS4ufr39bcrjiSHaNAHOYLcmfX7gllOorT5OOSQrXE9Ms
 0BxcCoiPzPvS5GMOLVPc8+1B7alkA==
X-Google-Smtp-Source: AGHT+IH51v+ciKEEvcas7KruyEl9MpeeesNqdypPE/z9vKPInzfIea4uW80byqjYo8CWqBN/jvW/WkCZ27XkQSvaQPQ=
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8eb with SMTP id
 ffacd0b85a97d-3d4d5820387mr17089464f8f.45.1757088678552; Fri, 05 Sep 2025
 09:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-14-clamor95@gmail.com>
 <20250905180837.35547304@booty>
In-Reply-To: <20250905180837.35547304@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:11:06 +0300
X-Gm-Features: Ac12FXzeydZMbzruj0x2TMb09dNVozbOPlP5vr1tYKJLv-xNj-t8FjVS8o5nQcs
Message-ID: <CAPVz0n2m4U-7G14Jhnsm41qsj0FVo39bdJ=f8kAm=+uxZyM0xw@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW
 revision
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:08 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 19 Aug 2025 15:16:25 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Tegra20, Tegra30 and Tegra114 have VI revision 1.
>
> Why? You should mention the reason in the commit message.
>

Because TRM states that Tegra20, Tegra30 and Tegra114 have VI revision
1, Tegra124 has VI revision 2 and Tegra210 has VI revision 3 (which is
set in tegra210.c btw).

> But I don't see hw_revision used in the series, so unless I missed
> something you should drop this patch.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
