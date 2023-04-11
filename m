Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A26A6DD80B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3C610E0B0;
	Tue, 11 Apr 2023 10:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6310E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:36:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2ef1e98d6bfso382643f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681209385; x=1683801385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iSQvnYG8c9OxHw/e20PtXdprFdX0XrEjSsyRYld3AH4=;
 b=CqJVgB7MCCi6zHeQIK3lAFJnLKmX6LHFQKfCjF1h0JB8WzBsrDPGfB2QjKwfFnqXjf
 Ouj6D4D651bAHYelfOfzSIj5jb4pVAY57cZAlUUBKbYAT/vY0+5TzaYqO9aEV77kft+i
 pr+Usk1eRPkhKe2QnXNdyTIGbz/I1k0cX2YYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209385; x=1683801385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSQvnYG8c9OxHw/e20PtXdprFdX0XrEjSsyRYld3AH4=;
 b=bK3w24zIdS0zgbmiY9VlcxCRQzZhqsvB09x8zszfvV2hPWYcdsVhjov/J+IyogXn6j
 vPC7tVuyQ2y+aFOaajRj5S9xDt3dlTI5qA94EwXBQxaSQLWY1gLao6hGVOFXTAbjt07o
 4WzexIxlmnIuw7yvcEaNgw2JqvWdVzRzedr3U/eV4lozjdbf0buce5MPOcr7UpAtNPlO
 wL1DaaELPHHYZ+jmSkY9Xc56zCCzdzONud1+luiq/hRcK1oS7QzWvllzUCcBQt51wU2A
 8Db+e9fgGEVuR9W0+bJf2juZofkpW3TpZZbjF/1Sdl0qoiE3KCADzPqsGECU6aQtuB/H
 Mg/Q==
X-Gm-Message-State: AAQBX9fIP4maLj/tx7q9stQtoVzisv0EmijRnWXXv4qvUCx83CeqWxfS
 On6m4XScHaT0kguzrqqeCaPJ2Q==
X-Google-Smtp-Source: AKy350YfHKqHbVjC//SSw/0EqTDC0aeGqVId/ZWL2WEvNHV/PRcRdp29cnnrt+B83qvQKTBc0VvNKQ==
X-Received: by 2002:a5d:4d4d:0:b0:2d3:b1fa:302c with SMTP id
 a13-20020a5d4d4d000000b002d3b1fa302cmr5362482wru.5.1681209385256; 
 Tue, 11 Apr 2023 03:36:25 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k1-20020adfe3c1000000b002f01e181c4asm6532427wrm.5.2023.04.11.03.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:36:24 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:36:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/vkms: add module parameter to set background color
Message-ID: <ZDU4JkdZSXGXcxAt@phenom.ffwll.local>
References: <20230410125435.128689-1-mcanal@igalia.com>
 <gY5DtUoeqVhT1HdJU8yjHSqwe9gTIbV6Q2yVDYRyI_JGHS6Lo73Ivjs2G8d_5T_qL2q7pOhjC6O_aPk2Pnn3npdhzh2Y-_nrD98r3ONMrWc=@emersion.fr>
 <20230410175036.tqjbwrd4ldcnnqlf@mail.igalia.com>
 <86KSXjLyx61ozmy_5grAFQ5XGxnysnSnGRCD6FQsgzrUc2xnXQpv06rcPu9FWkXNo7PLu7dEMTmsX9uWVvEMSKYW62ELEjloEfHGCZUqob8=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86KSXjLyx61ozmy_5grAFQ5XGxnysnSnGRCD6FQsgzrUc2xnXQpv06rcPu9FWkXNo7PLu7dEMTmsX9uWVvEMSKYW62ELEjloEfHGCZUqob8=@emersion.fr>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 08:58:16AM +0000, Simon Ser wrote:
> Hi,
> 
> On Monday, April 10th, 2023 at 19:50, Melissa Wen <mwen@igalia.com> wrote:
> 
> > On 04/10, Simon Ser wrote:
> > 
> > > I think this should be a KMS property instead of a module parameter.
> > > Is there a reason why this patch uses a module parameter? It breaks
> > > user-space expectations.
> > 
> > a KMS property is what we have on vkms TODO [1] and the module parameter
> > was Maíra's first step to open a discussion for this property [2].
> > AFAIK, we would need to create the KMS property first, but it seems
> > there isn't an userspace case/need to support this API change.
> > Do you know any valid use cases to support a bkg color property?
> 
> There have been previous attempts for msm [1] and i915 [2].
> 
> From user-space PoV, a KMS property would be useful, for instance to
> render single color background images. I can type some user-space code
> if that helps.

Yeah the hold-up thus far was that no one ever came up with an actually
useful use in a compositor for this. Everyone seems happy with black, but
maybe with proper color rendering this is changing :-)

> If this is a module parameter instead of a KMS property, what purpose
> does this achieve? What is the use-case? Just trying to understand the
> motivation here.

Just a step to get things going, occasionally that's needed ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
