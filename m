Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DEC9D538E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 20:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E508310E1FD;
	Thu, 21 Nov 2024 19:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UaJVkKSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84FB10E196;
 Thu, 21 Nov 2024 19:48:41 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-83ab21c26f1so49702439f.2; 
 Thu, 21 Nov 2024 11:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732218521; x=1732823321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mmxw9K5UaQSpBQU/eNyl68TYy8cqH/wCI4bKyVA72c=;
 b=UaJVkKSinpdqExt8r16+WVYvHpOfCCvsv4nUj+ikd6oFIulRR1yM27aGI792oXZDFF
 xITwx+Un6P3RIZgi6NHtCpfYxeBPt5QJtKwGCsy4geNRSAIKfKNDAFjnsqVtEWvv4sPH
 7IwC0btKmTJ8HCNLVJYboiAyKp8T/+/A8JeAGkSVWnlcfgsjPOI2xF07zoOY6nf7tFPK
 9I02EGB5HA8NgUXEIUtEbEQcSlE62UHw7+HQBb4b8KIoVKLJJKNw0W4oHXuh7cwz6VEC
 DRnuNA1WHPbyDaXA3ZoA3YQqu48lSK8WnYzoDW5DSBxj+m0deSobk+zM3MzbuDPNxcSb
 qPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732218521; x=1732823321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mmxw9K5UaQSpBQU/eNyl68TYy8cqH/wCI4bKyVA72c=;
 b=i4ilEY7v/kSCOLUkvp6y6bwzbeTdL1VrSlBe2ptYzVAFgQp+tYBwy0zYp2V5kN5Eca
 dDryR7oR62DE2HnFWXGdHoJHQLgJcP+ef8qeHhEhHyzI0t91UtGARfbFwVTcztzY1Qab
 BA+8lBvV0hW+OxCZ9TjWpdEBqyeEZqAh8FlGmLDzKyC4YP+Hs4r81PoIEzZ1yWhSV4hY
 nptoqbsN3sCR6DrmUoItc6o3y7GVjPLGwOHzE9kIGlCTWFd9a9mtYriyQ30iuhWy7qEN
 7qqpVYqeV4E+UeVjvvSkDNQcxDeF1CYf8pP4UfYYgagXE0OE5qmzl8NeMieCDKhryaHZ
 KJgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ8cknLnC2mkGReMWVKxa0kCaKglAWLA7ZtNyYH6NgXZr3pnFNjoUE7BX/fTZ76yUNzVEuQdXrIlc=@lists.freedesktop.org,
 AJvYcCXHVwiFjfSgNyo9w79H8At11Twn/K/p9atDmeJaoZ/NYtiJHOsuAAuKifWFu1BcLQmcWKgZ9Xtz5k31@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6EZ1v8jFM9FbRopBdhy6HXseSvuOT2obEsFv+j1MB7Ecx3csg
 FxTnR4ar6slSlTXS+BqbbGBs8JtKNOvYFJHd/6yYq04AirLarduMZk0NRFhVaquxuT/CTsyA1Xq
 RXYegCtWWeMIBbtO1glV0Ze92fTk=
X-Gm-Gg: ASbGncvv8naqZPbrTa3KSxIO59Zv1gNyRmmUdeq6nIMh/X1ijwbORpMzQ/C6k7Klqyp
 UCFbh2lvlSxzioNZ0owhVuG2KssKa93/cDpTCuRLIo0WT9GZtESF4j5zFlXpBKg==
X-Google-Smtp-Source: AGHT+IHdcAeKJTnbBs+MjzCxYbF1H9xK69rOeH8X0oOXQybp3afVqWQjay99oVRaX9L75eLDJV9epy2kOJM1zrHXieY=
X-Received: by 2002:a05:6602:154d:b0:83a:872f:4b98 with SMTP id
 ca18e2360f4ac-83ecdc44f29mr19701639f.2.1732218521051; Thu, 21 Nov 2024
 11:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
 <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
 <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
 <dtt6d427u5yep3i3b3zxxef7uh572aeu3vtatmjvpbqfpjbvjc@epkkr7oumncn>
In-Reply-To: <dtt6d427u5yep3i3b3zxxef7uh572aeu3vtatmjvpbqfpjbvjc@epkkr7oumncn>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 21 Nov 2024 11:48:28 -0800
Message-ID: <CAF6AEGsr2WoOdytWzDU_TJJh4myPj3B943LMisxisnA45rLFKA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Thu, Nov 21, 2024 at 10:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Nov 20, 2024 at 10:54:24AM -0800, Rob Clark wrote:
> > On Wed, Nov 20, 2024 at 3:18=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> > > > Now the features defines have the right name, introduce a features
> > > > bitfield and move the features defines in it, fixing all code check=
ing
> > > > for them.
> > > >
> > > > No functional changes intended.
> > >
> > > I think it might be better to squahs this patch into the previous one=
,
> > > it would simplify checking that we use .quirks for ADRENO_QUIRK_foo a=
nd
> > > .features for ADRENO_FEAT_bar.
> > >
> >
> > IMHO better to keep this separated
>
> If they are separated, it is easy to overlook presense of a statement
> checking .quirks against ADRENO_FEAT_bar.

Maybe just drop this patch.. we don't really have so many
quirks+features so a single bitmask is fine and avoids this
wrong-bitmask-problem in the first place.

BR,
-R

> >
> > But we don't have _that_ many features/quirks so I don't find
> > combining them all that problematic
> >
>
> --
> With best wishes
> Dmitry
