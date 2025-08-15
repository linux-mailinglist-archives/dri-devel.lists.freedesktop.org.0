Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47FB27EEE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 13:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857BA10E00D;
	Fri, 15 Aug 2025 11:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="D3SfyGRJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AE110E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 11:15:48 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e8704c52b3so213020185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755256547; x=1755861347;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T/aoVi6AF3aVJ/uqRpoLaF29+CuY9MSd7NGZ1/77wPA=;
 b=D3SfyGRJxkvcssJopSV3dT7KgbUVaN6QSXaEE5gbg9XVrqzdqYQggP5DTu4rMzCzwC
 mDQIZKHNADflFDFH7dZwAVIoFWAnlZyCstwOMqAmuWGOW4siOlQFSRZFgWUOr5IdfMXS
 je3z1P3Q+J3fNVjfaYzpWHslnNJlmIuQDliY54bW9hakO8YCdRLfb9dc9DMxCJPV+zmp
 ZByJLdFlS+iTUD4BVbvot25VGc5345DGEi6OWCafeTHcY9crP91GYPgddN5kPNeGDdYs
 jybum/wPppuWQUfSW6/OA/mvFaw27EAFo7wSRDBxEpM2ARAL5LLl86/O8GZ1Hn2bmKo9
 nwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755256547; x=1755861347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/aoVi6AF3aVJ/uqRpoLaF29+CuY9MSd7NGZ1/77wPA=;
 b=N7Qx2yLu7vY/KcaDNE7WawWkMzDavDdxS5fXCPY5ehik8DKyUptqMhLEOAVV3KUF3e
 yqU1wxa02/q+vxlvLAESNLEr8D3UJ+f34LGy2EpgV6eXBkSA+px15Xngbomy+++ynFrw
 MtRl1lbCjREnKzhY8uoNHNaIkMPa8+0rNisemNL3HjVzhaV41Q3oWmynnRPAHVDQpjdT
 8xWPByeM2wJQGoCApB9hXZC8zEHLPs63rR4i4vLBUXXF+wSEL69VMeT8zxK61y0mSH+Q
 DbZlwejM68ln5349OpNty0GCU17HBU1cPJmzTdv7Lq16YZ8pfH1nNasrg78LMIziZ/Ar
 k3ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrxeg0JKUekDJtjHKKOPnO9Tm1agUG/UM8m/ff9JfvH9ylEwf//mhq8olgCdtIimJBPKvog9naSWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrvAzAh53/SAqKkXPWgW2Wzcdh0xwL7tqJ/rfSaSxYOob7nRVk
 GXMrWCmghdVB+4uJNXSMs+0zcqa6vAOOtlYOD9JkOR9KluIqQtKegTibc1/rzk0iuvX5hZ/n/8A
 3aozM6jcPUfC6iz93NyPi4kPtdhmiviG4SE5n0TsCEA==
X-Gm-Gg: ASbGncvdZp/M3j7+0ojsdTMzMqulwYFUgJjaB5ILhj1/Cy/4c1KVt/EdQamW1zE7BR7
 vp7jtS1H1MFWDTvtCVkUrV+GvwiWrDDxAkv7y3sbKZB4z3K2AdpYZzTu5k+qrELjPBStq0ob4E6
 6vnEv5V1w+BXw8Ef14LGuc+kBUTGk4vDkITOCjdetBoZOKc2GVJ3fsnVPYSqyw+rqUGyACwg5xt
 B2BBNs=
X-Google-Smtp-Source: AGHT+IEEYrgrzZzFQH7gJARNv39C5+Wwbco9I1459+Dntaj16EsMUXS27AwHprK/yA0fuMnmrf2M26jY7o7J1U606dI=
X-Received: by 2002:a05:620a:7006:b0:7e6:391c:41ae with SMTP id
 af79cd13be357-7e87e0c7484mr195050185a.58.1755256547086; Fri, 15 Aug 2025
 04:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
 <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
 <20250814161718.GA3117411-robh@kernel.org>
In-Reply-To: <20250814161718.GA3117411-robh@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 15 Aug 2025 12:15:35 +0100
X-Gm-Features: Ac12FXyQS213pP_GudOiU8lJOx9k9Gscd8v3FBcgxsevLgT7o4PDTPSWp9SpRP4
Message-ID: <CAPj87rN=Hod6GyA72x07yTvxL5X2q4UyUmPg-hyjjFA5KJvYGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

Hi Rob,

On Thu, 14 Aug 2025 at 17:17, Rob Herring <robh@kernel.org> wrote:
> On Thu, Aug 14, 2025 at 11:51:44AM +0100, Daniel Stone wrote:
> > This is the main security issue, since it would allow writes a
> > cmdstream BO which has been created but is not _the_ cmdstream BO for
> > this job. Fixing that is pretty straightforward, but given that
> > someone will almost certainly try to add dmabuf support to this
> > driver, it's also probably worth a comment in the driver flags telling
> > anyone who tries to add DRIVER_PRIME that they need to disallow export
> > of cmdbuf BOs.
>
> What would be the usecase for exporting BOs here?
>
> I suppose if one wants to feed in camera data and we need to do the
> allocation in the ethos driver since it likely has more constraints
> (i.e. must be contiguous). (Whatever happened on the universal allocator
> or constraint solver? I haven't been paying attention for a while...)

Yeah, I guess it's just reasonably natural to allow export if you're
allowing import as well.

> Here's the reworked (but not yet tested) code which I think should solve
> all of the above issues. There was also an issue with the cleanup path
> that we wouldn't do a put on the last BO if there was a size error. We
> just need to set ejob->region_bo[ejob->region_cnt] and increment
> region_cnt before any checks.

Nice, thanks! That all looks good to me.

Using unchecked add/mul when calculating the sizes also made me raise
an eyebrow - it might be provably safe but perhaps it's better to use
all the helpers just to make sure undetected overflow can't occur.

Cheers,
Daniel
