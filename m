Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF285678F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4A10E980;
	Thu, 15 Feb 2024 15:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DZo1boFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6F10E97A;
 Thu, 15 Feb 2024 15:29:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-56394d0ee54so1257356a12.3; 
 Thu, 15 Feb 2024 07:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708010945; x=1708615745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eDYN5/Ne/bAkeG8hRPbK0lvoczmiNehpS0h0H9vcz0=;
 b=DZo1boFpNDr8Avla4seiYh6nUEiUsNNL9hirWfda/cmSpMo7/IVLldxwqz1jbRHlMQ
 jRzDoI+HcjfBcn9zAP0ESJbGXSOC6qQv2fvaiHK4n46rg+fwcyHgTIezE9DDV/92XS5A
 LZgf/AiBMSO/O2uFQvcEHzGDlC8Y/xERot168DddcSQ6OhqSMFBujAKVvO7RmyYgpEri
 llcG+Wcidg0Fdj7RG0oE9gDBqwkh9T8hg/nittLEKz3++ThN53uuciYfwA00Cje+jz0V
 A/huAfg491/1KAJ9WduirvvLAkEVTU+q9tiTJ0Y2L46X79TjQl2rfuFV6aoUzStKwCBJ
 Iehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708010946; x=1708615746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eDYN5/Ne/bAkeG8hRPbK0lvoczmiNehpS0h0H9vcz0=;
 b=s7ypdcTjqUAlLwFfksQMnc+URQoS6LgpQszcO2lsHaFizPCD4wYRYIz04mZvjytXhM
 emkihv7dkfK72lqqS09qXYkGLbysaM6fjtcgXFAwrT531HFeSy2zIWya6KOP58IGLk77
 iOIe/bovPyw1ebceQeecBog2Vun837KEhI0PA52PXCklxogXmquX43dWFRqHCmhun1Sj
 VBpU1F9LOLb2gjJNjC7pxdR89IjDONqWHB/m78v2m6uEAUWKTIexoZfhziUCt+dWSWpp
 oEIcxUXKKCTH0rOQOrxoXJBbuzzHF7BU6INJyghvwFme14z6lJnoLaX7DEJe2NFEpNiL
 4JNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXezKuHBkfVuwCZJFwnkyjf4lTKbb467EoiNIweY6eH4Q0v3geB9XWkRXIwDnq/R9zoOMNC4qZiVLuRKmayFhWTFh51Y91ywPXIw6+1LUr8
X-Gm-Message-State: AOJu0YzGkQAhJIzRO8/3w67+BeQGhGp6XX35fDDgouN4LaJ5lvfSrFTI
 TOjckO+8KsuNkjTQ+4k4eR9XdG4pKOT+UGWZJ8JpzlxePrs8oYVCAgMsyxuwhM0Ge40Ze30+XmJ
 K6RpOyIgJxoXQpCw5XosAZ3w6//0=
X-Google-Smtp-Source: AGHT+IH0wv6QwjXSBFTesR7kxTSlclEtl5Zu4zItum5ccGJ5rgl8x0VQTnJVRcQtudZnbwF7kmf2M8Qe9v3dKnp7o1E=
X-Received: by 2002:a50:ee89:0:b0:561:bcbc:7c96 with SMTP id
 f9-20020a50ee89000000b00561bcbc7c96mr1824864edr.31.1708010945460; Thu, 15 Feb
 2024 07:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20240213172340.228314-1-robdclark@gmail.com>
 <Zc2-qVd0gtErdbKe@hovoldconsulting.com>
In-Reply-To: <Zc2-qVd0gtErdbKe@hovoldconsulting.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 Feb 2024 07:28:53 -0800
Message-ID: <CAF6AEGsPojmqDgMZWrEAm_CoWGZ05euc0jzD5+9aX0cXQha_ew@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Wire up tlb ops
To: Johan Hovold <johan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Robin Murphy <robin.murphy@arm.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Feb 14, 2024 at 11:34=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Tue, Feb 13, 2024 at 09:23:40AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The brute force iommu_flush_iotlb_all() was good enough for unmap, but
> > in some cases a map operation could require removing a table pte entry
> > to replace with a block entry.  This also requires tlb invalidation.
> > Missing this was resulting an obscure iova fault on what should be a
> > valid buffer address.
> >
> > Thanks to Robin Murphy for helping me understand the cause of the fault=
.
> >
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable"=
)
>
> Sounds like you're missing a
>
> Cc: stable@vger.kernel.org
>
> here? Or is there some reason not to backport this fix (to 5.9 and later
> kernels)?

No reason, I just expected the Fixes tag was sufficient

BR,
-R

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Johan
