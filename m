Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9B8C1147
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 16:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90B210E188;
	Thu,  9 May 2024 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DqayfhCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8F110E188
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 14:35:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41e79ec20a6so64925e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715265320; x=1715870120;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJeFE0WuwLySQ0WLtZlpt2n7k4kefS+JJOJPYozhu9Q=;
 b=DqayfhCOR0f9/Ue39x3ezFoWsWFuKaglMF+NOcugzyjZTS8fDQ4cj6Sy1PUUyubZDg
 xYfwOPYcAaq9yCeuQ4cfhrvQHPbnGbx3ZCX4pIWG0jxSfpZDBUBjl8ky1vl00ZUal3Sa
 wG9n3TCRwnKdpkMavFHytLgHS4ng7wApKKX79PtlOuii73pOMoAIoBiy4txlr2FcBbcg
 +/RrhGNuQBPgFRMP6MPGdp0lt2MOQe1cPvB7M9pkquTDumGbxZbzMixiAcPMVuZ4yWSU
 dkfq6WzAV8Fv7aERwldaqihhEEoas+4aM+SxSt0XHspU+RK/1BYn29NTtjEnkupQpZfn
 oR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715265320; x=1715870120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJeFE0WuwLySQ0WLtZlpt2n7k4kefS+JJOJPYozhu9Q=;
 b=U77qlsSpicQb+QbDVzlZJI0zv5tIdY1F/MyZxJLmhnevxG79IZbRIOMbeV4yCoa/oi
 SoMIQg6jTs0T0odXIU8ioheYqUr4UwyDmhUSQDLpgzldMQr5E+MogFf/Up7HmWD1kdMI
 7FqLN/H+1tfG2aCbs/Yp36eQwdhHX6++6NFIvKnK1e/4HxsRTsO8K8VloJFDT9Z9iOO9
 JCnQ74/6t9FrklZsI6n2iY29EyJRQbwavRVUb7jTMyWkzMIdDvp3Fn4LgzQGl5mRiv8e
 Kuho1880evDL+kMHCu3AnhNHeRPwPVEQ+TJD2ynes5l4iJCcHcP+ukvRmvzJb4DJUJVt
 XlsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrQtUznWWRKi3g8ok7zmVx5Dy/wta9dAStRk07TG9oZmu58JGY4UTG+tTalMk8EEnMbwKMCsYampp/U7zIodv5DzOijrWvs8nF6z0JPWCM
X-Gm-Message-State: AOJu0Yzot4k8TAU5WMNz1MDJGRZxes1nqNeIkxytQQJhhsUHtAVNKxW1
 D9Ty/HX4w+A5zKIQHmYtdp5lXcp6iwef3WID2kEX3Y/5X0LeUU5agiCIqxyj3v5cWggyCpC8pyL
 nI5JkvI304aAOHhLV2v8q6rEaNJZMEgiSxn9H
X-Google-Smtp-Source: AGHT+IFrxb8EZwM8awOjCJtuIkTKILys6t3R7G703AmTYA7D4K8O26Itepd9/edJho95LxphvCI4NfYSMfrG1KjL+Yc=
X-Received: by 2002:a7b:c8c9:0:b0:419:fa3c:fb46 with SMTP id
 5b1f17b1804b1-41fcc211f99mr1451285e9.5.1715265313018; Thu, 09 May 2024
 07:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240509064336.9803-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240509064336.9803-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240509064336.9803-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 9 May 2024 07:34:56 -0700
Message-ID: <CAD=FV=Ugm+-ziY+8f93KOChvmkbf_MdxEOoyJP5WJq70m-aOGQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] HID: i2c-hid: elan: Add ili2900 timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Wed, May 8, 2024 at 11:43=E2=80=AFPM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> From: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
>
> ILI2900 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 100ms,
> so the post_gpio_reset_on_delay_ms is set to 100.
>
> Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

You silently ignored pretty much all of the feedback from the previous
version [1], so I'm not planning to review this version.

[1] https://lore.kernel.org/r/CAD=3DFV=3DX5tk0tCcDa+vLnu0aoas1TDWuqvkMzM-27=
8dOCX8K1gw@mail.gmail.com
