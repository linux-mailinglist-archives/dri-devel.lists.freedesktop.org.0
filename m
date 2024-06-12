Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9461905843
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0D310E8C3;
	Wed, 12 Jun 2024 16:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M6anmNki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D19910E8C5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:15:27 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-62cf0f10d2bso307357b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718208927; x=1718813727; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cmFbegrmXFBHS4WW8ziIwGksQiKssUPXoQUtXM6F24=;
 b=M6anmNki1aK37tpzM/KcN23NLsuM87HHGg19c2d2hEyngdvla1n9d9mI5ykGmtF5vO
 BdNeFBh1UlYLgoBjIFMaMSCTMBXgYYkVZU2AXsdlmXRQSkeR2xQxs7Td68bMeAP7zty0
 dpCGTxmXFcq3OnXFGDPxZ10yx+IqGEwPHM5HjOr20yTOw9xEt8l/64P+Xhzqk+O0AyGl
 brNd+MLujXJYNoBtNzdjs+VkiUH2RMeS090DN4v2CMlqTJ+MVb1NCKEd8r5rZ2BVXav3
 jw4ouumbFveFIsjUsZh/lH3quOE+It6z+4FV14Fx0h0oVso02RkqBTSoh6WV4DvoLMH9
 TYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718208927; x=1718813727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5cmFbegrmXFBHS4WW8ziIwGksQiKssUPXoQUtXM6F24=;
 b=WgaxKYZI5l94YXqu6VTjcUSPQ2WSNxMxmQATXeb3sHYQAFRe4cmxpbhzuzNIrBvTGE
 baQBLi4XUsoLJxUllLVrY9agJfIa5XAqrYhxF88/q7D9uMJg5oUy2uDrTXwQV7DWuIz+
 QEo0IhkT9kpV9xN5Qdq7dwOApuZrd62LduisDltO35AvkDvQk5rbslWiIkJ2xGw28lIi
 2/LaijE+CkXgZl5OPNTqPOdqEvbgfTpcLbZ+U1SiQulIdHUTJc0uPyMntZDVkHczjLqh
 kYfwDHxnahX/bsTB8YJZuiJ27eM+ofZiah0b2iWdMjS40BdyPb73pWXvwV6b3h/Ztg1p
 RmSQ==
X-Gm-Message-State: AOJu0YyevXn7bk7pMTOWCcACkteFBR4RTWVyFWjhZDbf3EhzdWXUThvM
 W4YzUSnbOSOvSGz9EbtVx0KijxN9DK/nmg6q2lTA1fuObGtDFy7yNv0KnvCi2lPxk/0zkNkmEHl
 7SavAR38vQUvYD6GzTXq2i9NFKjFU7KhtuhJc9A==
X-Google-Smtp-Source: AGHT+IEyUjk336q5wze0GKQr7UwMqrUsrkoBVG2K5Qz2pv15hllZ/Fn+1uT5B958G0aEQ/a+dPl8Ea9AwDS4xrJVWhE=
X-Received: by 2002:a81:4806:0:b0:61b:f6f:eab with SMTP id
 00721157ae682-630bc30a68cmr838027b3.2.1718208926557; 
 Wed, 12 Jun 2024 09:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
 <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
 <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
 <1cb42d85-2eb6-4544-b4ea-8a75416cd287@web.de>
In-Reply-To: <1cb42d85-2eb6-4544-b4ea-8a75416cd287@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 19:15:15 +0300
Message-ID: <CAA8EJppXQ4sMsm+VXnJdjYa1g_U8_LKwRL_u86DsF6Up4rnaqg@mail.gmail.com>
Subject: Re: [v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
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

On Wed, 12 Jun 2024 at 17:32, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >> Would you become interested to apply a statement like =E2=80=9Cguard(m=
utex)(&hdmi->state_mutex);=E2=80=9D?
> >> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.=
h#L196
> >
> > I am not.
>
> Under which circumstances will development interests grow for scope-based=
 resource management?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h=
#L124

I consider guard() and free() to be counterintuitive, harder to follow
and semantically troublesome.

--=20
With best wishes
Dmitry
