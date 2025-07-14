Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8240B0481D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 21:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A3810E07D;
	Mon, 14 Jul 2025 19:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cqkrHKAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662810E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:56:28 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so5550273a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752522985; x=1753127785;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
 b=cqkrHKAS72jqQHG5T+s+LRKcm0ki4qK2O+rPf/pt6RTo+97a3PimjKUbM0EU3RV84X
 ObgtQTFx1iP/m1EKIga8H4//iMRgLzLxAo2ceKShKR6/aE5d3MajF+xZn/JzrllL5c5F
 iIFZhcLJfgySf7MB1NWY+zMLjOZxHdCMOlY2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522985; x=1753127785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
 b=qgVNIOrmV8CYBvPpG6KSS3rthwpD2XVu5psrEa7jUUq1zKqeThStOkWoTS40WpkwA/
 OnhzAOKIlSXK5i7F32sZk5AhAFmqxDcpd6PWoAW5G2C4DRbwMIyQ4f49sM7xSwwEdh1v
 q0LMPFN9t3M12uwi1ArLFkMQ7K7PSIhz+ERLCWfxdpSbrmitRiQOr8hK72R4e1lZf8l/
 yxc7ZrO+KSiTwquS/tWvtETKBxr8kY325HgwMfX8TVYgcOKMaSZgY8LDLKLzbFIfZhNq
 CXemQOxW/BoyYuSpwJIoylpaOK5slMs2JOm+DWI9/CniBV1nPuzCf+LPCfYAc92X7/0p
 fyjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs3UKowd1Oi6z8SaHfEYsQIPWC0uoATm6raJWZn3bBJxcnshO6XS9p1VDcAXKyd89xr6E/csgkrRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNTczBNMQhxHBg7CEMotz0+0GcNjpgvjXIzdV/9N65f1dLCTEF
 KOfxebLfmS7I54ZYP/eV4IgXmHvGgmQqVANTg27WAn++/3+OddeIqLaCr67N91UC7siCYxGFgqE
 UM/I=
X-Gm-Gg: ASbGnct3jzdjbuXSeXCCmB/24ejuiPWoIuIU86Ovs+BgVbTGxM+0s4+KvcAhao+7t8u
 Am9o7HtJ7MfueUVcW2kUw5yFIvqN6iytRZXmoy6BElGkTZ5YPKN6fymtnBjrXyxYGSFdt/NWWDW
 80t0jEmhY5jY2KHkPPdiDtbZAVWG7QXvta6rx3PyTXLnp074nuUkuJxvTxP1n6qgZYW+si5H+Dr
 k2nfkSRgFVKmbjT/sUSzCBhPgPdpjsGKAjFxHeWUE2JphOBzRZ+Hi6L+DQP94gMd+A1m/i9wJwr
 yejwhxXL3oK1AUCfLbK/ygZDNzKw2+l+EKdizccWvUzmGDjmiBOB0Q1zTd5wcj8Ub9gcBA/x9mZ
 pKVHa5n64njcVumxtmAGQaY0fU4vwrRIkEA68hSYa2V8dH8Er1oKHbpVi9JJ5klZL9g==
X-Google-Smtp-Source: AGHT+IHE6xK5EXQWM3Il+QzeXcvChJjR71VYK3NtW2M5DTMd56Z84+DeGsMx5DN7NvIlSt11DfGm6w==
X-Received: by 2002:a05:6a20:7343:b0:21f:bdd5:d71b with SMTP id
 adf61e73a8af0-2311d53309cmr26330865637.2.1752522985240; 
 Mon, 14 Jul 2025 12:56:25 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f49cf7sm11017409b3a.118.2025.07.14.12.56.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 12:56:21 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso5469766a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtrbUImOWiLROPdnXUU8v7hmvYPwyuj3SO0sGZN9Njl4yuF6YRLAe2BiNPicELpV80pxUxwdzLRWg=@lists.freedesktop.org
X-Received: by 2002:a17:90b:1b0c:b0:312:f88d:260b with SMTP id
 98e67ed59e1d1-31c4ca8484dmr22759292a91.14.1752522980950; Mon, 14 Jul 2025
 12:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
 <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
In-Reply-To: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 12:56:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
X-Gm-Features: Ac12FXxRHKFdz1WEnIQ737ze8ocdQTtdcG6dsifTSijome0hozAkI0iK1xwhErU
Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
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

Hi,

On Mon, Jun 30, 2025 at 9:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> >
> >
> > On 30-Jun-25 15:46, Rob Clark wrote:
> >> On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
> >> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>
> >>>
> >>>
> >>> On 29-Jun-25 15:58, Rob Clark wrote:
> >>>> These runners are no more.  So remove the jobs.
> >>>>
> >>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> Do we have anyone using cheza at all anymore then?
> >>
> >> Probably not
> >
> > Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> > get rid of it upstream, as it never made it to the outside-outside
> > world..
> >
> > Konrad
>
> I am not aware of anyone using Cheza boards within Qcom. So it is fine
> with me if you plan to remove the DT bits.

As far as I'm aware, anyone at Google who had a cheza gave it to Rob
to put in his lab. If Rob says nobody is using it then I'm 99.9%
certain that nobody at Google is using it anymore. There were a very
small number of external developers who were given a cheza prototype
but I can't quite imagine any of them still using it.

-Doug
