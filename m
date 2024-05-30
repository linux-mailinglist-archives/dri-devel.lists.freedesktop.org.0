Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0888D4BFE
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 14:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02910EA0D;
	Thu, 30 May 2024 12:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pTgPSCAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9080A10E459
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 12:49:07 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-df4f05e5901so834921276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717073346; x=1717678146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
 b=pTgPSCACP4QzOGU/xIFLc9UrayQ8ZY8EQ5gcbZVWTs1HTEWxm+hEKdUifjVdWuux/x
 HrVqSH4KjJ+AdQeomsMZ77vhY30WvR3WDM+pxTeJaU43v4yfRoF5h54T9uhs7macOQjR
 AQYS0ovPcXQOjlDvfT4/PfdwkkgVyGZjfIQOSLXeao0jiC2VQRf+d+wv4P22YhPB92TW
 kwvKY2AJ6STnCcpnaGUoS2Hsmb0HOE5m/ny+5eaC1bJp3AYSEWTHj2QIjmNX3I7mIis4
 dabWgilGpf8397WoP3UyRRs6+CEgyPuXqSt0ALJuUx2E1jP8dKLpRTEDllNLGNaFWM/D
 yL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717073346; x=1717678146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
 b=j+IQQjiQ7kOu4xYJGoGLeA3tehgHWy64592kMIrvQzAnnA6JvZ0PLnxhc2N2/RZQ0u
 QkSEgGHjj0V0CWDv8ERkX7EG/PVRDgHGVI4fkfzkFME3erAr9JpzQiZbZr9A3F4kDQbv
 3AABKTstj7+uyckD8AUQyW/EXc31SbR7rVANBjKiPJ6oPl9ptAmrR0imoS/PkyXwVFg6
 2K+xbRNTUJX+8zHz/iqZZ+TkjC71PjYmV0uTdbw3NYhhHKoknYTXuN1HRTunZs29otYv
 +OxTmpidqyYQBiwgKKl/iKCF6wyhhwjwu+uRkaFIdDzQdBxwzp5dkhHmOFoQgNupI0Nr
 l1wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhIBiISl2dWWfAilX4UfDrmGzVY8kIr08a38OX6dcFSfjMsW1kF6lLQuAgg1FSq5FwcXrwjqyei/nyk2iY6S8n/EJogqpBYh9fe2fpOi7b
X-Gm-Message-State: AOJu0YzST5gr28CPQiaNZpxkQrRRDVpSmGMfneFMLBFs/8Q+jdF9ghBC
 Xay74hw8yv56jylptSSiigwaxmW+lvRfB+q7PL8OJVdT1gDLEzm4ZLxan0w10q7KIzeHDOUjN+U
 6oTTzXoLjGafnl69GnRWxyXRIOhDiYISht5olVA==
X-Google-Smtp-Source: AGHT+IH9reN3k9B5alZuQHzGsBX3pJuGAJhOvhCUMJYzD/NF7mywytMlezP/lEAG+hGzVP28iGPYs0J0xalsNECb288=
X-Received: by 2002:a25:ad51:0:b0:dfa:6c83:81d7 with SMTP id
 3f1490d57ef6-dfa6c8382d2mr202060276.38.1717073346405; Thu, 30 May 2024
 05:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
 <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
 <871q5jii2u.fsf@intel.com>
In-Reply-To: <871q5jii2u.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 15:48:55 +0300
Message-ID: <CAA8EJpqoOtoidm3kBWrQ8RzxoWOPVfrvgsmBkyFX6PGQSg00xQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Thu, 30 May 2024 at 15:45, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 20 May 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> >> > Prefer the struct drm_edid based functions for reading the EDID and
> >> > updating the connector.
> >> >
> >> > Simplify the flow by updating the EDID property when the EDID is rea=
d
> >> > instead of at .get_modes.
> >> >
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >
> >> > ---
> >>
> >> The patch looks good to me, I'd like to hear an opinion from Doug (add=
ed
> >> to CC).
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> What is the merge strategy for the series? Do you plan to pick up all
> >> the patches to drm-misc or should we pick up individual patches into
> >> driver trees?
> >
> > I'm not sure I have too much to add here aside from what you guys have
> > already talked about. I'm OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume you'll want to pick this up for msm instead of me merging to
> drm-misc.

Yes, it's on my todo list.

--=20
With best wishes
Dmitry
