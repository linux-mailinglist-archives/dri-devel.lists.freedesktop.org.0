Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482EAACEF39
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540A10E054;
	Thu,  5 Jun 2025 12:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="LTc0yQax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DBF10E054
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:30:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-476a720e806so7621141cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1749126605; x=1749731405;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
 b=LTc0yQaxrskrbkVQ3oZKzYfXytzNCsqVowlEzM/6oXuwpbhIfjbY9EXWvp+a2bljez
 ljxeK4DvC6zAJdpzEwAEP1iHSPbmq5L0obsIsY0zN02/achjrCFFHWFJZQmh7OfKKDAH
 3Kq7SFs49eveKOKG8hJ8d4DSAtESZydQz1wQUxUDlnK1rhbjiaexR0HPwRow0Qw6477I
 c+Fe4jbBwvsy9mzxMwpFfdj9wzSLwZqWZ3/uRMVv+PNAM7Zph5rJRur5pqbGbimFaV8i
 M5RtCelW/ZAOsgXkRgHz8y48NZkPOJQ62pWOE5iJfZFrvZlEeWZP5v83LwzPbYkV0Cd7
 G0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749126605; x=1749731405;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
 b=aeePpOthee4nwjsRkaOUac3e+3w1rXk4WyuKs31iDg0Gp2MnerSey8+jajXMMFOFxB
 txReoQP+ZemgF/66iOAKUS4d3Azune9zE32mNWnKJhSMJqJgItz1TxZfU/quBXpXwiuM
 /xy4iYPv+eM9MCrhQBn7bexY2sBP3dXovaCuYV0uDmFGwPlswN8BlqHzbvIkLspk6h0U
 mr3QEuFWE4+qVhz7HsLjcboSk0PWqK+YNVMC6WUekQhbSFhxYYCntMELKw60MUOLhYmH
 MKRjaBEESYEQIFt0m7jb4ReYzwLe97HkN6vndTAM97ldzVfm0EKC0v2YArluJ3olPOCB
 QtEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcdDE9qMfB09XjhAtH34L23uEOPYo38JcShGUHozj92ng+YBmzNUuDR6IDUnK6isJs0JFY7B5+Z58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+VAVF84lKUocLCzo+YkWxtRw3bQ8gxnRij5EomIDyBpWPsNs7
 iMjpKZEFSQ9Z5yxGnQCfZsJ8hCOQXUuglXyJ1kfOTSSSyXqzMfCH45k7DnIyfHUYc81c371blqO
 xuJvHPl+ZLisWRK04JW0vfzeRShiwiR2q7a2cZHlAQQ==
X-Gm-Gg: ASbGnctWk7qqX3J9kNiH/xIWfKkvNmHaujnm+b5xBWpZUYjRDlD2eNpEvkEVqZYPtTY
 9oHt3kFtmthrd1IPvVJPUSamG9nAiP39lhBWmarDA7hhYCaJT6Uqp/y9LFYMGKgp4Cr1cjze/W7
 x3tbOHAcSYM24GaOANmCm5fl9YJyz4k4c=
X-Google-Smtp-Source: AGHT+IGJAH4AP5XYgqu4Dz9W2BoN5h6LEeBf/9Q8A7vKd11Zim4MAapYM0SxBDOcqHNIkaF48u81Kw+0gnFTHvWWddM=
X-Received: by 2002:a05:622a:4010:b0:4a5:a5df:a95d with SMTP id
 d75a77b69052e-4a5a685bf82mr117127441cf.4.1749126605571; Thu, 05 Jun 2025
 05:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 13:29:54 +0100
X-Gm-Features: AX0GCFvvNcCeZ1g6JOrd8mRl54fhnHPJ-VauKDXwMUlQ5VUcNOU5PCV9zv8SWHk
Message-ID: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Hey,

On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > Indeed if you're using the IOMMU API directly then you need to do your
> > own address space management either way, so matching bits of process VA
> > space is pretty simple to put on the table.
>
> My impression was that the VM_BIND facility is intended for SVM as in
> OpenCL and maybe Vulkan?
>
> Guess my question is, what would such an accelerator driver win by
> letting userspace manage the address space?

I mean, not a lot gained, but otoh there's also not much to be gained
by using the kernel's range allocator either, and it saves userspace a
roundtrip to discover the VA for a BO it just created/mapped?

Cheers,
Daniel
