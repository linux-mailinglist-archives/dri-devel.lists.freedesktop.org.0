Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBD227A6E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD64189CB3;
	Tue, 21 Jul 2020 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4366E2ED
 for <dri-devel@freedesktop.org>; Mon, 20 Jul 2020 10:01:55 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x72so8816766pfc.6
 for <dri-devel@freedesktop.org>; Mon, 20 Jul 2020 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
 b=uEn13EOKkQKFmK34APcGHbkL6i0Bc78BZn67EQvfn41Fc9a/MMheX8xL7adrdOlRhe
 hA2C2jqTAw/OZQy5HoNYNIepnDobJJplfM9mycMWrip+JIS2XLNFGzIzAkuRh7ZUhaG8
 y3q1VEXw7Cn2jnWMWlkYLFIpb7vCyn0pJ33WI7EQYk3hsxdmVtgX94P5euF9A6tqDoUy
 fwdDQqX4/TzfjC/i4+SRlySFWwVcW1jE+qt8KCTytCVjIiEMnvJzZtfSBYFKDvA8QMk1
 h9tKOxaoLTZRumfefxVu+hY8zE/HdKWaHTcyuBxVMhuwcc6fx/+CCeheDEyf3gKcMOxQ
 qvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
 b=C1Qqh/ZwDTYe2DqwdqVeh9RP/W/o+8asYL+1V8joi8M6mY1rnGMq68Bw7uVXkE0vAT
 oQsYvYU1m/oIHn1VUTKcwsonE4jV7DH25WfmdTswvFz5SiKz5+lMoNA+uPFt4dmC1g/P
 Ox2OSNShUgMaTO8Wy1HluzJ1UQJesd7Pw0nF/X0vgF1SC3KAfWk9GKhN1h8Vh7N4ET9N
 8OKoTzFdJtk5VCNzUSKrsN4I/gVwcQNzPo7wYsdbqUNa0z7xvbhFgc1AjXAPOXeIKLzU
 hdm4sqk9G6PiMigwlZlQb/3EnZrHc03k0mJuiQjOUpRqYWotrtTJJkk0Mleq28FC904v
 Lp4g==
X-Gm-Message-State: AOAM531EKmViWktWB9lz98hWVCiqrMNJc8nQ7It0Pnw9F4o6hHQPIp8M
 h8VqFdMFTrJ/J+3hGWZUm0VXrA==
X-Google-Smtp-Source: ABdhPJzhEikt8tP6/CpS6b+B437wPhrsq9S5Jz+w2SuVdMMdAy5NITpEubsktWnoJlAezd0lmVwv8A==
X-Received: by 2002:a62:cd89:: with SMTP id
 o131mr18638388pfg.195.1595239314908; 
 Mon, 20 Jul 2020 03:01:54 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id g8sm14821824pgr.70.2020.07.20.03.01.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 03:01:53 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:31:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15-07-20, 08:36, Rob Clark wrote:
> I can take the first two into msm-next, the 3rd will need to wait
> until dev_pm_opp_set_bw() lands

You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
it anymore.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
