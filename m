Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE383232A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 02:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B610E838;
	Fri, 19 Jan 2024 01:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91BC10E838;
 Fri, 19 Jan 2024 01:51:57 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-559d95f1e69so245480a12.2; 
 Thu, 18 Jan 2024 17:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705629054; x=1706233854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38huTxU0pXTsIWTOQp4P0tI0mktk6V47LUM1nr2Z7hc=;
 b=VI8biKFSv8lPGAYbwmgkp4yxrPnfeDe1kOdNez7J3z8zcpVPpZ/+D6abVNey5xjphB
 wDNWeNp5wzhV3crXh4TQa6OX/Pn3Ur92KKOEQHGkTNakg66l2UBpFrSgCLyOhP+S51Tp
 Qg2ixZINJC/2sYoxQN5DfZNYQ8Q+C84R2lsQg+gi2+PJYuHpeH6TMecwUawaPTjmJ7/9
 1tlIrjUq9y9+26sLIhRBafrqJtXl72/4CY6ipefaQ2abQ86upqf1JqRL29vh4R9bFIdj
 McMjRPvL1oWDWIbUbR+mJS14WbIyTJWljLP+GmvKD50FU3ZHn+drEsJSmDkHrg/+u+BX
 Xs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705629054; x=1706233854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38huTxU0pXTsIWTOQp4P0tI0mktk6V47LUM1nr2Z7hc=;
 b=e8HvDGeA4r6L7gKvBgTNj41IjbesqLSQwJdCZl62BWEJ7xQ1sxM49PYaLZxekuZXQZ
 4r4XJwmdmQKvR6u1ofJYKjAZEuU4Meh/cg5K+3DnaDi5/G0gPkY3MWmEhRK2ZFm20rZi
 8nZ3+PNSBhg8fbvF0V0vV10UZAqzTFEiySkTEhf8bnFZg4xwLy9mV/mdiXRlSX2wSMET
 xN7EJrcxmtY9gJMcjgkkKfa8z/qaRYYL39sCGdksGtT581v9KEMGgNIQLxh73HLNSTfc
 j27kh1QD43ag7yRE9XQOQlhmYp6d+cL9XSk8a0GDnSdw+NcobJSzEoNQseyXvDWhcLGj
 fx7g==
X-Gm-Message-State: AOJu0YyJLed8JCmUr3SeB5+M21F/VRmgxpKbmI0Cklsgk2iS00Z3skr4
 pYZQy5WuR5DZlHIzJhLOg7BqaokVt1HwfktlLkXWLLxZx6pOFgekCeao8+S21MTxCr2Vl6q3Fi+
 D++uOyz7SDkIkDHMgAQdhgwo7tLc=
X-Google-Smtp-Source: AGHT+IHwbTFcn66Vs6N9m1zO2oQ7Y90pxTA6pv2kCP0lCxfAYuG+Gn/uItpKxpiZf3L4CwRFmNgtehqNnZBm5PF/Hs8=
X-Received: by 2002:a05:6402:d43:b0:557:188b:eccb with SMTP id
 ec3-20020a0564020d4300b00557188beccbmr957829edb.84.1705629054596; Thu, 18 Jan
 2024 17:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
 <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
 <CAK4VdL2PnWTZ+M2eQqF22+VuF-YGKb_WjG=168BcuBDqD8+9kA@mail.gmail.com>
In-Reply-To: <CAK4VdL2PnWTZ+M2eQqF22+VuF-YGKb_WjG=168BcuBDqD8+9kA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 19 Jan 2024 09:50:42 +0800
Message-ID: <CAKGbVbvWAM64T+a6_VRL99araN_2dubu4vO=mqzCoC1p2m_X-g@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 7:14=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> On Thu, Jan 18, 2024 at 2:36=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote=
:
> >
> > So this is caused by same job trigger both done and timeout handling?
> > I think a better way to solve this is to make sure only one handler
> > (done or timeout) process the job instead of just making lima_pm_idle()
> > unique.
>
> It's not very clear to me how to best ensure that, with the drm_sched
> software timeout and the irq happening potentially at the same time.
This could be done by stopping scheduler run more job and disable
GP/PP interrupt. Then after sync irq, there should be no more new
irq gets in when we handling timeout.

> I think patch 4 in this series describes and covers the most common
> case that this would be hit. So maybe now this patch could be dropped
> in favour of just that one.
Yes.

> But since this was a bit hard to reproduce and I'm not sure the issue
> is entirely covered by that, I just decided to keep this small change
> as it prevented all the stack trace reproducers I was able to come up
> with.
>
> Erico
