Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAC3ACE5CE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06CD10E7DE;
	Wed,  4 Jun 2025 20:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ybfbtgko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C6610E7B5;
 Wed,  4 Jun 2025 20:37:44 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3dc6f653152so1307145ab.3; 
 Wed, 04 Jun 2025 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749069463; x=1749674263; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XFwt8jx0g/c+CABPRMM8ZkkvfXfeIDPzYoKjG59j/ew=;
 b=Ybfbtgko9y4ZZYuNyKc+1lganOlSrrYF/tNU36RtOvTn+aXfafRX19+n9HSmIxRhPI
 sU4cbVlgCIygsapD2HIxgh/afYdgYj81ZjTIqeVPiQHuWGb1GZTTvPBEf8LbwmouDzys
 QgMBmSC1Q0KyYEmMT7ydYkB4x65HeqOzHlMGxoDm7nBPdyItABdOpM89DmJE/17TBWmv
 W8aZ5XuBQZ8zN0nJdwZcPqOsfQo/Z7H12YVquhHECLBna2QNihsyF372jv24uPgML/qB
 IyCUWSJv7tG3x3/5klT8BrvOAmQ4MZ7Sml7EyQl+p12z3o6ZEtCuT5WJqnMbhvDlAnFL
 PABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749069463; x=1749674263;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XFwt8jx0g/c+CABPRMM8ZkkvfXfeIDPzYoKjG59j/ew=;
 b=r5lUdR2Ds+JADpRfsgtqBDt+QJ7nJ7rI60n0fjR1HrlBmQrGMbgf3or6KxSV8owMGm
 fKWfw2AWEFQSPaD79hGMtR5snBu8Gp9p5uzwzZz4p5H3UdFz7sXEx9NV3MD2Jdy0Taxb
 pftro+iVXxO9lFXg+R8fQnpJ2vg5h8aI73pq5eW9RPdemJKCqeA76sLmFBP41sToN39B
 IBuL5yKRjIrOBVseA98zz/IWPZq8QPQbGOWvEoJ8S8d/P+uqxhDy9gSMasDtlToj0RV9
 mroyczeXvkdk8eqtlw9yVJ53XZAeQyC43N14g/lIAaA/pg8ab3kjNQsQTVyJAi6XWTaK
 e89Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAc/FYS2qxjhMMrdynbst2GnXQk7qLqhKdqNXRm8mgEJCnOMgdOJ/+Tv93KkeQP4obaVXbKeJEj4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywpa2bajYVZUsgQAcQs39ogxOiNiCa6u8GDKsvDeGXK+VoKNND
 VnEnvz+26us9LFsoEm1UgMyEzSvSPLrLt3IAJB5U7OhoGmx43aLtLHSlRteF6iCR9BouA5GHpnN
 P0RJ3PVCg0CPk9cWnutIL0rVuX0qi4g8=
X-Gm-Gg: ASbGncsJWwIpFb7vYGfEG7n9eXQsNVWLvaXRvjOcJ0fM2Etxkm0zHwSvoftIAwmJrc2
 qY6CNMh1KxJj8uMDY/qCh912M245YDiN+w9pYWkxn0YksM5M2b/Iz0focdvbtDgVX/8B9GRbrgX
 W4pvHvzkRyS97kghW0xtehyoZdrHzoHhqM0dvxWvjj8Gb+vBHQkI/evqHmZTv1wl9Z
X-Google-Smtp-Source: AGHT+IEkEn+Ys6yp8GhjuhLo+PHMDiCMbG10n36RLxCtVWagLr2ATCucAOGms2ilLGEuUYqFxod590RMviUUeMvmCio=
X-Received: by 2002:a05:6e02:32c3:b0:3dc:868e:dae7 with SMTP id
 e9e14a558f8ab-3ddbedd26e1mr52052875ab.15.1749069463257; Wed, 04 Jun 2025
 13:37:43 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Jun 2025 13:37:31 -0700
X-Gm-Features: AX0GCFtZPDMs3-fiKOKQL4sBwvvhTHcy7kFG4Zeir1ucFEyfE5oK_zHqGpJR7UA
Message-ID: <CAF6AEGuW1kpUijxzLCc4TKph72-PfXvHTttNu214_1GB-R8qwg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-06-04 for v6.16,
 the mailmap addition
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
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

Hi Dave, Simona,

Some mailmap/MAINTAINER "fixes", as there have been some recent email
address changes and shufflings for drm/msm :-)

The following changes since commit fc5c669c902c3039aa41731b6c58c0960d0b1bbf:

  dt-bindings: display: msm: correct example in SM8350 MDSS schema
(2025-05-13 21:53:34 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-06-04

for you to fetch changes up to ee11d953fd230b4e1c28388913826ca832ae8444:

  MAINTAINERS: .mailmap: update Rob Clark's email address (2025-06-04
13:26:41 -0700)

----------------------------------------------------------------
Just some mailmap/MAINTAINER email address updates

----------------------------------------------------------------
Abhinav Kumar (2):
      MAINTAINERS: drop myself as maintainer
      MAINTAINERS: update my email address

Akhil P Oommen (1):
      mailmap: Update entry for Akhil P Oommen

Rob Clark (1):
      MAINTAINERS: .mailmap: update Rob Clark's email address

 .mailmap    |  5 ++++-
 MAINTAINERS | 11 ++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)
