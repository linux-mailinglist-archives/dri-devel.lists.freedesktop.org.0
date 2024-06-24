Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996D9154A2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13A10E4F7;
	Mon, 24 Jun 2024 16:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4LUaQg7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B8010E4F7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:46:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4405dffca81so757301cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719247575; x=1719852375;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMSaelTgm9+gZJLzvg/KOZGEZUTdUOqVskLSww0Rudo=;
 b=4LUaQg7ZXJ51oqvCwVfjuxwJ+PyVpZjmZB4RW27dt1mQKuF3yWdmrwsrYwwRjJNcBe
 IiQT+4+TiR03YjkDy4C+qVaFAYT/BPh/SO1ooZNk/+9Uu6qbyoa5+awr2gagTJU0H74a
 aBRx+HGvCjJ5q07MuY029XIogzhLDBmqU8xAgYGxBKRpsfJDXOX27yIG5XG+KygVD5ME
 flC+CpP/D6mNaTAzNzhZUp32mcXkBOUDIOXA3yb3RTnR0L4qXZ0uF4iraFoD3CLNy2ro
 y8CGcEGFt4CsVYfTLxaZEmV7tKBI6Kcpe69wCr5duHWw3ITTtsRgD50+EK92FANOW6QQ
 SnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247575; x=1719852375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMSaelTgm9+gZJLzvg/KOZGEZUTdUOqVskLSww0Rudo=;
 b=mBAL/LwiYQALVD6fxkgHlQpcEQMpxR3v8XWJsAy658IkkHYQ7Tsq6l+JSluHxZtMN5
 DO4FiKWvmKyjWh8sJjHwcQo3gchot/WObWrcQizn5b3ul0vwVkWgwHclCHBvERz0c6YJ
 L6K4Ss2Twmt9nXgpBznA+bE9Uzq3nw1LdTCQk8XVX0dGsg8ZXRgQQds488+BcBHrfNZO
 GqvLdTRsk6BpiaawAq1UTYEtJf1H5MC/AaX3Kx8c/GwqtZjThzCcw9wHnIi3SA8a5AC6
 3TbhkWQI7ocwDGbM5+cSI0IbaMHO8wTAj83slVUe6wTxCVBEFrgTggrSlIgbkSpbW44K
 IOcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfucR100W1YdOV89AKaBMI8dJOJVaaEQnLFuYjPo3iH5LcwwmzZ3+0ooFls345f7Glq8mj2xf6+64bbKPMs6TVD+WPhdewkF6hNvB+MZ/c
X-Gm-Message-State: AOJu0YzAFnowSaIfR5BhWVy91GCR69UC/lyQfRXbzB0jsV9MldyYrW/G
 g70Jh3vIj3XYH+XnPxwYkFp5nzjYunQhMfgEkZMXSoe1wANQVMtjZfYdaVsHUt3JkQ9w3iSEgg+
 NaNESzDTtLpMP768Yl07SkUlYnSLkMr79y9kk
X-Google-Smtp-Source: AGHT+IFjApab6MaKv6PsrlmopTYXcXjrUWTT++GwSbVbvFdm1I8gzP3WA9e+zP+3yfQBYNCgLHo0PSNfLdJekbpatUs=
X-Received: by 2002:a05:622a:83:b0:441:54bb:50eb with SMTP id
 d75a77b69052e-444ce39fd5dmr5217641cf.28.1719247574572; Mon, 24 Jun 2024
 09:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-6-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240624141926.5250-6-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 24 Jun 2024 09:46:03 -0700
Message-ID: <CAD=FV=XsRrB_Y=_rTTDhvzQPwxr+_LuY-YUjfm5H7mY8YgxG0w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/panel: jd9365da: Add the function of adjusting
 orientation
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, jagan@edgeble.ai, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Jun 24, 2024 at 7:21=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> This driver does not have the function to adjust the orientation,
> so this function is added.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V5 and V4:
> - 1. Change dev_err() to dev_err_probe().
>
> V4:https://lore.kernel.org/all/20240620080509.18504-5-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> Changes between V4 and V3:
> - No changes.
>
> ---
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
