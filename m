Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8AF95D1BF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561410EC4E;
	Fri, 23 Aug 2024 15:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jK/CLqdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA3710EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:40:47 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5334c018913so1971615e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724427645; x=1725032445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwzRr4x14GDGGx/Wa/l1KFYgNdRnrpk92o9I32BcD1M=;
 b=jK/CLqdliq6JD0HiXix1v7SJxNhay59PgU+ENGGzIUpqIVmUChi3LB6xKKlEecVGXt
 G9EU4CFGpxn9Zgy14sGIPIYrf1096DhEgUW4P/Hh4ztGmUrMIOMzB27olEc+dAbZwPGI
 n8ex1k7zyc4Tp18uiwTXm5IrWnt5huTKY0rg4El6AT+CmflavoUj25vG9V81oTU2Dy+q
 9MhPAKiyaIq4syLeDlIajRhfbEWKBaiKxZ1+7F76rqXnP10bGisa66nJm5smgIZrYnKs
 Ql/EE3yw58ksAwb7Mbatkns8WgidziLdzwQIb22VF5WAi/k6pblLVI9gVcpGL3oBj5fn
 hB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724427645; x=1725032445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwzRr4x14GDGGx/Wa/l1KFYgNdRnrpk92o9I32BcD1M=;
 b=iNEBcHRNdbBzEwd+Is8mfUZAsfSHe/AZUHLCYXQW3aF8h1oTb2K01F57DaBL2SodSn
 ITswq58KmhDUfYgTbwYCXK6cqvd5zqTQC1E4XnqiJrjbekDhAegQbo+VV672mxC+qZyd
 PpK//q2UBgvh5+KzjFA1+fZzYMlxw52tOwO/oq7EiGOEHcteI1fNuP7370bhJOEFGWbG
 Rar8cSM3CE9ZaWV7y8DQgxtstCP2D028AnD2ve9a/GyywsmND01m56VjM8d6vd0FFpSW
 sS92eBlRKviNS2++dGBzqU4BQbiaB0SqH6fdHoJo4TfHJXnRgLnli16gqbWFtq0llqL7
 RMiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjoTlHxwt6/Me258cOyXG5389FsTaV+5PjWVj1pJT0yZiGiKhEHgTNJURm29F3YvVHsNpZj2WPBWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO+fHGPLy7fQ2c4iFLByZil7Oo7oAUUbPqpVedWy/1ZoPJJMHB
 IHFlwglYVY/xFAxO36mR9lvfXb3i2eMDYExfkD3KvX1O8T768f9xB4miXAyY3qNqkR9K+4N6VcQ
 dOH6aFWnC++IqoP7mLE6IslD4iwqf6jCZzFW0qw==
X-Google-Smtp-Source: AGHT+IEuHaxZyQVY8GiHyyz26//af2rggIRdx0JBwtmCQ2Md+VVAhtl7TbQoqqnfxbLsaA2wMwGIyh7yHw85tqG1pcI=
X-Received: by 2002:a05:6512:3a8d:b0:52e:76e8:e18e with SMTP id
 2adb3069b0e04-5343882e2f7mr1898837e87.7.1724427645064; Fri, 23 Aug 2024
 08:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-4-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-4-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:40:34 +0200
Message-ID: <CACRpkdbOPGxBFq4FCOPLMfvaEJZiNHCocWQGZwC6fis+FOxjTg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/panel: panel-novatak-nt35510: Use backlight power
 constants
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
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

On Wed, Jul 31, 2024 at 2:23=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality or semantics.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
