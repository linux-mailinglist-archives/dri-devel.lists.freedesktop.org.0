Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF009817DD8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 00:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6FD10E0B9;
	Mon, 18 Dec 2023 23:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86810E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 23:05:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40d20831f21so16265e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 15:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702940740; x=1703545540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SN12il5ik6cWNDdw9fL8yyeZEss9E6x81jqC6dArM4=;
 b=DKtDo3NnHhnlSJBZTb4k6DeskvO41lCfNaxWoEKu56hQ7b7n4p4PbDcxnqdXNviqZ+
 PXXFoK9a3R8IiKeETDNkWgRLUxz8H5cS5Xp6MElqefzX3OGJkD1axGFzgbu72ExwIOlf
 tL/7s0w+lh6Zssl9qc5xN14jLI0p4PoDGf2BNRm6NjXS5ocyYYt4FysWKEEaqmAZFwH9
 mOtp9YCdZAZdJSc9uwxWcuiyWTT1Bt9Fssvt7h5mfUEeXRezEvNo1f/hN8W5sjJNaP5V
 L1aiKp8kqJ9oyPYbjNLfqCjOuFtiYRsUY75nDEeQxf/O4e//u9yeYHoYyStlCv9Ky2I8
 /LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702940740; x=1703545540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SN12il5ik6cWNDdw9fL8yyeZEss9E6x81jqC6dArM4=;
 b=kf4GF9ncfXfCG8Xz3ZafPhYkR8Khtzf0QLMeWC0SONZL1U2Gxkbr4qj/HhgjziVHqa
 a0ZFhtDuu5nXs5YbbuCJNcEdJtV6rEwWqWXimKfaTc+ktvc9H6jjX7RwWWkOtNuYP0FM
 f1xC0YmQ8Fw48G0vMzBAUHXESVGXmIPkWPc1XKOPKR21c/ZUemI6JFMTPntKOp+VpV6M
 S7+LTrdvPbGWzLH5EffVBZ5oW+ioRzk64bVmmnow+PpEY7Xrt1Sm535LnDk4hcx0eQbp
 sblCrxBBV6hPNnR8rCRO5Opxs56zXZSqlGxbzWENic8vMJmY+fRLEoxqTRzQvE1fbL6A
 KXug==
X-Gm-Message-State: AOJu0YyXHKzvoNUO9M/sJVyJhGQiuLRXD4FA3i1o4DqNKl+BjfBiC42v
 OAMaBNZMM/npoY+CANLEuOTZH8nYn6Da2tHWnVzlWSt+7VqV
X-Google-Smtp-Source: AGHT+IGMOM3LPYj6duqgFMQpU/sRxW2c92eaacVQ5j02hlMrJxsQiJ5p6r8R1iKWvqGXXa2WKsmd/d4YW/xB4awXn9U=
X-Received: by 2002:a1c:7406:0:b0:40c:4ed3:8d1f with SMTP id
 p6-20020a1c7406000000b0040c4ed38d1fmr26310wmc.7.1702940740206; Mon, 18 Dec
 2023 15:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20231218095933.2487360-1-xuxinxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20231218095933.2487360-1-xuxinxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 18 Dec 2023 15:05:27 -0800
Message-ID: <CAD=FV=XE+k3PTXMY7gU789HnGKVQdJMwJt8gqowxT6x0zj-A4w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several generic edp panels
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 18, 2023 at 1:59=E2=80=AFAM Xuxin Xiong
<xuxinxiong@huaqin.corp-partner.google.com> wrote:
>
> Add support for the following 3 panels:
> 1. BOE NV116WHM-N49 V8.0
> 2. BOE NV122WUM-N41
> 3. CSO MNC207QS1-1
>
> Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

0547692ac146 drm/panel-edp: Add several generic edp panels
