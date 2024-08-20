Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF9958FA2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 23:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F421210E49C;
	Tue, 20 Aug 2024 21:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OLGU7lGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AFA89919
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 21:25:31 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-690e9001e01so57756977b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724189128; x=1724793928;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtZ2sSwFiBCzqCGNkFlK38jZ9U/su0wXHP9hhJhttMY=;
 b=OLGU7lGjbqdQuehj9qaryWG3ZEpv1/xzgXkfVc2MBY/TRYCC2lqKkImiUNh6YYo/8v
 hbGRDLHOB4yAwjbIOSflf7+nfbF9Qy3f1AeTtlpZnLqxkfcyYYVdGXNxJGmCJNMV2/aU
 PcKwy34+5X2fv0cuDa8MR7/+/LVAyv98iHJg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724189128; x=1724793928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtZ2sSwFiBCzqCGNkFlK38jZ9U/su0wXHP9hhJhttMY=;
 b=P4UnLa4jmNvkrnOPaAaG0//3HOYD3grpVNwdZGJsTKS8cqZFM+W5nGrwkDdh2CMRKA
 hZ+sGu/HlmoX0IcQPAqZgenJ2cLwf7B6Irfp6rj/SGzQnlKU7S9oDMRR1CP36ttPyPOf
 M67K69KFo3wPUvK8DPpzcO10smkjd2yNmXFm4yFoKZQfg4gAs8gynOut3OirnHumEcPe
 1yqJ1BUTGzTzEMuwniromz1Dvg2+SdN5mJczz0ANo/kPiuGJcYuaRr9X7zBs9teOFzrR
 GZzwe8QZD4e6zie9cw8coVzoQCgVkmIqEaSWqeNDB+b5jWjkzs/AYTuhX5IPNI5APiKI
 oMrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoO0wtANhdOYbSGNq3ClmbCjxIb7fI9zQZ0Rn3KSkZYvGqrdHHioM9AakZKiQBErQhUP7MroqWHlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgnMm7UzmqrYuqLI738hzFG7X4DQgjVo8LYU3ReKlshLSxPANl
 vMyPV59fr7TYMnQggacNX+CgEs5fYYBJ8plpFBnhyVTAaFIiEDJyFWPiTOdpPPFfv5wMJI000Bp
 bHA==
X-Google-Smtp-Source: AGHT+IGnh/ycFTgy0G+QWQUgSw8K0NjBJ+dly2W1lI70x2h0kk8TDo1d0t9mHaD15qJmHRR7F6ldUQ==
X-Received: by 2002:a05:690c:6588:b0:6ad:b725:4418 with SMTP id
 00721157ae682-6c0a12a8109mr6810887b3.41.1724189128545; 
 Tue, 20 Aug 2024 14:25:28 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6be29470e37sm3660677b3.19.2024.08.20.14.25.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 14:25:25 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-690e9001e01so57755827b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSliMCfNZlJwnVQVwWYLFwqzFSt6XNmdvK1s3YuLRJOWwOYC6LnJ0/KlKzwLQguCAY1Tpmr6RrYV8=@lists.freedesktop.org
X-Received: by 2002:a05:690c:3409:b0:64a:ce78:4f7b with SMTP id
 00721157ae682-6c09cd4ef19mr5958917b3.12.1724189124246; Tue, 20 Aug 2024
 14:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240818060816.848784-1-tejasvipin76@gmail.com>
 <20240818060816.848784-3-tejasvipin76@gmail.com>
In-Reply-To: <20240818060816.848784-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Aug 2024 14:25:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V80ZfFL3Q_iqJsTW8x7hxupEqb7WjWE=gvGdOjERggSA@mail.gmail.com>
Message-ID: <CAD=FV=V80ZfFL3Q_iqJsTW8x7hxupEqb7WjWE=gvGdOjERggSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Sat, Aug 17, 2024 at 11:08=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the jdi-fhd-r63452 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 149 ++++++-------------
>  1 file changed, 48 insertions(+), 101 deletions(-)

Pushed to drm-misc-next.

[2/2] drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions
      commit: 04b5b362bc2a36f1dfe5cad52c83b1ea9d25b87c
