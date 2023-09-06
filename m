Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD2794579
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0063710E72B;
	Wed,  6 Sep 2023 21:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA4F10E72B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:54:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-500913779f5so428177e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037292; x=1694642092;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
 b=kNPA0PRGG6Jk3aNuvgVX4Y+2onGnW7Tka69uYa6Tviv5BoeinUDGePWl/h5vfBVdi5
 N71Gs4mzppdkqh0oBcZjvF1Zr+i176bdHiMtAhA7fkdi0MyzSTdCJCc8/6Ni0injqBiT
 n+aJeK5+6Vd50Qf4RNib6VdblLS83QnJqrgx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037292; x=1694642092;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
 b=QcnGgW79q7ay6+1+fNbBJDOHZIawZ0c7vE3TywGD5EGXDH+Vf3UhIMlqXTzq4KSeX8
 AQ5oohaxrEs8D00yJ6bKEKTJ/0jH7ChDbbnNX1AAAC8aOO0JuOOlnLCWor3tAsa7gXtX
 S5mAFJNwTL9/ZsEecEUBp75vy+JjnXNLW/Q1sAhFzdzMki24cpD3I0yv1PDZIystJqU5
 UY2ONET2+tZchVSP+JP9PeZj7Zxc1MWak35myQ8m2y+Lw5SvPlmO4epofz2zn4vPADch
 UuI7HJcZo0rdS0GroZVXVRVtmsBMtw7yd2I/e38yAH3zjYXNtEkH2O0VxYMW5W9ZU/A7
 1i7w==
X-Gm-Message-State: AOJu0YzXcdOEWMfc3ueiip+Rcqo7AT55cCVh6+F8cdwHTfnpBsvAgfNY
 pYdru+MzjDFFrc4bRCyFxQ+t2+Q6Mg12j6Gc/ATxCZkC2IqVcdCw
X-Google-Smtp-Source: AGHT+IFaSO4E/UjLX8wEpGO6s8aIiIGvV3rajeXxbn36XQd+d1XBBlsCEK0E9MFFtjh00AsmBN5wr+6S5yv+y1DrN4U=
X-Received: by 2002:a19:5e17:0:b0:500:d4d9:25b5 with SMTP id
 s23-20020a195e17000000b00500d4d925b5mr3321799lfb.56.1694037292435; Wed, 06
 Sep 2023 14:54:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:52 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:54:52 -0500
Message-ID: <CAE-0n51Wrh8J2eH3uEnOW2e78TW=BGpS+UGtEdfjOqnHjXGjHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:49)
> The DPU_PINGPONG_TE flag became unused, we can drop it now.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
