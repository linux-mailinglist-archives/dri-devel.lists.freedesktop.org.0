Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF718AFE5D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97010E613;
	Wed, 24 Apr 2024 02:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QAU1KWEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23510E613
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 02:28:21 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5dbd519bde6so4490246a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 19:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713925701; x=1714530501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ze4k+50kKLUhtdOJ+MVcWkC0g+gDNT54b6uo5ytHs5E=;
 b=QAU1KWEJx4TeZkiuu6LAJROT4HSgKT3K96RecnVHowrIu+ZARkbYrML2XrNV8VNsWW
 7GK7YSP8LtoM47ADRKXpRx1pmz4LhkHPb2BAQFZMzB3OrLYJGxNDaXREb6Tb2Hl+vz+t
 svUyL4WjEW4isASyVGHDLFA5pq2llCn2zXF11uhtKsMjO/iWiL23ybpxDkg7PJwAcwR9
 QjAjdNIUvMFYE09Od5l/Ue9N+wGVeqjNAMgcttA3iKi5DY4sKpqmdLlCGR5UZmSXkc+i
 OmHKzUBD3rz22FQagu93iZpGf0RNQGZD3rGA73PrhpOzT9eZ2Nj4G4VTUoJhvpyaEN7n
 FXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713925701; x=1714530501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ze4k+50kKLUhtdOJ+MVcWkC0g+gDNT54b6uo5ytHs5E=;
 b=RuTXyogFTqui0Inps7VNukQqYzGINwFlc8E1wlQGRktJIYv4zLmzCFNj/Uf7DnJ3CC
 XoeUhJSu/T6C5A/+lYj/ZSnJ4fKVgahi7XtNNwUR0Ec7CJpQiWmkZSuW8RqxY2ff/9hK
 q5B7lST9M+KS5oYAwZd81KVklopsR2bPoak6RUYdGrNpDZ/1519v4+QJ782Tnsu0jwpO
 B27B5YMXzbvEpnKOrF8iKhnJ/FEuVjjdCsWdGMcE/ke8rML+RrBq+4pQOq/nVDhF6HRs
 EXXOvBWjXgvPuUtutRvFvmOZVu29i57wzc82tx8nOQUSFAMzaoKlthvyppwKKJOKOEpf
 qQ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcwmjMvvYaJN2ziTj9XGjj3Hb6oUmB02cl/NM2QhvCPJSTtEyE6cVCooZ9wAvwqz1b47rnZ88W0TEztstIm7elaX3o21PA4se3JqOs+KTg
X-Gm-Message-State: AOJu0YwcsMrnFL8X7A7ivEINnWYh/dLgtdoNxs10VkfSWThen79iYfPd
 0XuSeWQnBCmgEihn0TzbHcvSc/3I0quRfpY1BXkj7p5rOO1oouqYFCYxPH9sV2FqflXKthkB1O+
 zeREwGpm2yOXwbbnTW20mn1ni/VKHrBcGtOxhaA==
X-Google-Smtp-Source: AGHT+IFBTLfPuGp9/IC945aJ33zSnp5IS3lA1sZQ97BsGnQxgo+apMlCKbEsg2kkINqPxswPBgsDmG5f6quE3YJGhno=
X-Received: by 2002:a17:90b:3448:b0:2a4:ca45:ded1 with SMTP id
 lj8-20020a17090b344800b002a4ca45ded1mr979782pjb.28.1713925700834; Tue, 23 Apr
 2024 19:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com>
 <20240422151607.GA1277508-robh@kernel.org>
In-Reply-To: <20240422151607.GA1277508-robh@kernel.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Wed, 24 Apr 2024 10:28:09 +0800
Message-ID: <CAHwB_N+M3Le2L=mECVMX1Ha2g+G=jog6zdfZCzJ-HSdkngHGvA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: display: panel: Add compatible for
 BOE nv110wum-l60
To: Rob Herring <robh@kernel.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, linus.walleij@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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
  Thanks for review.

Rob Herring <robh@kernel.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8822=E6=97=A5=
=E5=91=A8=E4=B8=80 23:16=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Apr 22, 2024 at 05:03:07PM +0800, Cong Yang wrote:
> > The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nice=
ly
> > with the existing himax-hx83102 driver.
>
> From a h/w perspective, the reason to share the binding is the same
> underlying controller, himax hx83102, is used, not that it is the same
> driver.

Got it, will update commit message in V3. Thanks.

>
> Rob
