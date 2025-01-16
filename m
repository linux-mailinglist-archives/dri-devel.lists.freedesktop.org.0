Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6275A133A1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB6A10E8BE;
	Thu, 16 Jan 2025 07:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fXfes0TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657F10E8BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:16:09 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e3983426f80so946709276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737011709; x=1737616509; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pwkwQnM0YTqjaNWS8T/XdTd7CxDB5+nrVli3aUMx8Pg=;
 b=fXfes0THO2Hto8alFAArbEMIfc3gaQcCnL2mRpdqUFswj7ds5kQvcgGBVK3vPAvtqr
 oDzEt9426jHR2I3mc9FMVgdypOMHeL8StVR0q6+3eBSQh+Or5RbwCumaPehVvZHMpIrQ
 U4GUoA0LCRxDJ9Vq+/HhOFYXL6hIuuxEExdzU8aTx3S5VY3oBpzduqxkqt399PUCM97M
 TD0HCBM3fXJlCa9CuM2kEtjxahPwqhpr0UUHtuN7r+x6OVZBDYbCbzEIVnef+NqhO+or
 xyZOLx6TGtEcB5Wj+oKTV93GHyRPr51xHes5nFqXvPItyqdLyzRMoBLMHiczGWBtQA77
 DcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737011709; x=1737616509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwkwQnM0YTqjaNWS8T/XdTd7CxDB5+nrVli3aUMx8Pg=;
 b=a9oyAAwpvZvzSzzai578fxKIVeaTToEKqMqcDHHGFXmp6TcQBDPz2G6yCNK8G6cNyi
 +I3Dnj88E+srCGxayfgFNP0imeik9p2Z1LA8xn3jzgMqLFzW31EYpAHYf1F+A2Fkc4Hc
 krIjTUuDW5gJ+BGRw9pv+UYrPypz6XHi2iYIirhD0YmLvfQLRZ50h324MhzEYuIGX/wY
 bjJIRCnhGVv5AocYoBC2dPdd8XGbikgdY/a1F/5/RohlOxj+hLdlOS/sSYcMqWwMlk2a
 RxvVs0veJRvhvwVruuzzD2/8yVfBovpU3+rzbySVysllGl3wLMb2zf8lF6RwUOr30U8R
 7vEQ==
X-Gm-Message-State: AOJu0YyRc6l2h4xk2CDQpbp/6mg+ItdcnoAIepSEwA0TTAXHox6VS+cx
 b+uF2njT1M5SzCHs45mGbVkWA1CYPI5ar70rDF55V4aRHjbGY7Bt6jf/V6tFE6FaFrn4xXGdg2l
 4h2y0mLMWGLpK/4QgcR9dQUlsB9ltVE63Daf0SQ==
X-Gm-Gg: ASbGnctg6mxAM8fBiOmtaDFIFhnYQWUGxFonr9E4uBRiyLIWWrc91hQrzZznK6TJR3n
 QQUkTKVNPigIYoOCa46QIIQSZ6/jXHmIGMMrknpsbxo+sJ/W+YdLN
X-Google-Smtp-Source: AGHT+IFvuKyX63fcWoQCks5WRvnKN9bcuUvw9s+TvH0HAJPqgriBP0YIXeth6q/7ESlN1T/FPIHWH1Uh/nHWLeGI8ow=
X-Received: by 2002:a25:6a87:0:b0:e38:b6be:1d58 with SMTP id
 3f1490d57ef6-e54ee13bab1mr18370760276.21.1737011708863; Wed, 15 Jan 2025
 23:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-7-605cb0271162@intel.com>
 <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
 <IA0PR11MB73078232EED1B5A1B6EF0C66BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73078232EED1B5A1B6EF0C66BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Jan 2025 09:14:57 +0200
X-Gm-Features: AbW1kvYz63jUwuBTNUZxDxoNqqMBSKpT1f7b2ksPz_C_wl9FknGsCWwjDM3rRnE
Message-ID: <CAA8EJprKwgmpO0xJ4ib-1TUVkqwJw1K=Qe6Uyybnd9XBWjPmEQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
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

On Thu, 16 Jan 2025 at 09:09, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
>
> > On Fri, Jan 10, 2025 at 01:15:35AM +0530, Arun R Murthy wrote:
> > > Histogram added as part of i915/display driver. Adding the same for xe
> > > as well.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > Is building of the Xe driver broken between the previous commit and this one?
> > In such a case, it needs to be squashed into the previous commit.
> >
> No!
> New file for histogram is added and compilation of this file for Xe builds is
> added in this patch. In the previous patch it was done for i915 builds.

Ack


-- 
With best wishes
Dmitry
