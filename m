Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955783189B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 12:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB7910E782;
	Thu, 18 Jan 2024 11:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922710E197;
 Thu, 18 Jan 2024 11:45:01 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so12388566e87.2; 
 Thu, 18 Jan 2024 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705578240; x=1706183040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGxN8H5cKdZFoYgwZBOkxu+K9a5y0CIqWCEk76K2YtU=;
 b=Up3pRfRgiymEQPUNcsvseSxlfY3RRelN+ba8lDKJmazmMC1EZH8Tkr/Uou4Jhbpcxo
 eSDEe2mBYhsJZAcULLnfhgQ5Wr8gMyqBbi/Oz0ddgBCSdvLzJG10huEq5IlsDzYPzns7
 mV2XFvh+KIdOeRZEz0z5pS7BLKRVoJz8MPEjC6j8H4k7pztf2fRrkRIxrwIOhUqQsL4z
 scUU5pWX5MdaZdP85Q4qpSWiV7r27aUBeD3TwHb4X/YtWSkftTbyjuBeohGgxOfc+GLz
 j/SOSzTVFgNP8cufJm7ZjG1FLyNcLgACpeOlr+eSEgkmbOJy2H1D6KSnHmlmzfrW/i8m
 Bf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705578240; x=1706183040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGxN8H5cKdZFoYgwZBOkxu+K9a5y0CIqWCEk76K2YtU=;
 b=GQeR5ABByy8429k8WafrXxv3y4YRrbGUV0C+SfOHPfMUhCC8upi2C6/JHRb8JyoIXz
 cPMeTbIeY6gDZPaUQCQyofdJUEzv1+QJdfW+gyPDzR5vENU1kTTDQmg3dY1zPVYW0Dpd
 NuE6iIFAw68tTOhTYYEjuWehu72in0BUN6JLNUdMvn2ivnI/dYS+mIqEJbKWL5SkrpGm
 gKzM81iu+07pBFvK4fkKRXnV/o+FU/hoybnwdxiw7Zvd9z5Df/5mrSksJbN56WkxxiPJ
 C0qNTm/zfM8J2hfh2eH+UW6Qsciod7bKUCMxXJzxqav4Jh9g0RFH2iHupWwuXQaPMZd2
 GbZg==
X-Gm-Message-State: AOJu0Yxk8FGl/gD1u3yiKg/1i9gY/eJ+dJcwcZefyTDCQ5UpIfB/+UYq
 JM+sHDxKy2pj+afF3P1+sJUMenUsZYc99CbLKOTzgvuzEBJuWGx917Ga1b/dO6K3622aV+9bq/0
 365wknUBiE++iuCpzdTZdL09kHTnzdpUzSiE=
X-Google-Smtp-Source: AGHT+IH+ku94Iew2GTbP3stiXOc4w7Pc+iHFIUmBJ2FGRnxG5gnWdGIYhd8LU0pn1ChNo6tCtTMDSIOET/zL8wuPIlM=
X-Received: by 2002:ac2:5939:0:b0:50e:7fd9:7 with SMTP id
 v25-20020ac25939000000b0050e7fd90007mr395694lfi.59.1705578240018; 
 Thu, 18 Jan 2024 03:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-4-nunes.erico@gmail.com>
 <CAKGbVbt_1SUmTftqA5H27keCeH+u2ibrevy=cW8KsJSHu8YRdw@mail.gmail.com>
In-Reply-To: <CAKGbVbt_1SUmTftqA5H27keCeH+u2ibrevy=cW8KsJSHu8YRdw@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 18 Jan 2024 12:43:48 +0100
Message-ID: <CAK4VdL3umA8KZizPAqO2GGZu5RTtvgkFq9Y0rSYSwZZNsVkjDQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] drm/lima: set bus_stop bit before hard reset
To: Qiang Yu <yuq825@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 3:01=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> Do we need same for GP?

I don't have an issue reproducer for gp so far, but the hardware does
have the same bit and the mali driver does it for both gp and pp, so I
think we can also add it to gp.
