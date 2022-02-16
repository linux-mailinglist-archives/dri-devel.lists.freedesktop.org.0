Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F4C4B7D0E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B19D10E601;
	Wed, 16 Feb 2022 02:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637510E5FE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:13:21 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id d84so546932qke.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
 b=BEvAvpEadNVOU5zOf00p/LinV3MSMuiM6l0UehZ9p+CNJL8x7K6yQqJ/31uRU1Cdmq
 17WNOMoRi+hfJxPakD9yzDPTugdFwTe1V1LOyDgdzLMse+0kDW029LqlSscEmx+64zVo
 B9kakBW/1KCZjyrmSR1opd3USKqpyHCiwbFFqtyq4YZJF8WIGqsXWjr7P+OoFd/Uq/o1
 fbP/lLuPSDxsOybncInpkMIq5KGdIPRV9sxACT2IC9/8Mz1Dy7xQMlTGNVzuov+uQfC3
 CcHGD25AiunUjezvz19Wzv6RbF9pW9s2+PyCIe9GUuXYgPJ1hHx6qV4rkGo/HwZV9rTs
 lTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=633/kcGFp+Bu8soejxxfIa5w0BAskL4NcDa75DnlBvg=;
 b=TYFtpJWOsY6PAnHJMyoxc/utZvXPTzqKIES5igDImeC6HGOb0sY3SFiQ02fMPXYXhL
 CEszIuSoEqu60tREB372lTF4GnOUqYwdT7Z0+K5hBEQjbnTwHXOYF2Z4IYkKp58C9ws8
 +n0KowbY64iSwYzqlStcbY76iYEF/N82O1tOmvVnIwLaJZwb5Raxk0w4YjwoKYfcHflK
 2K36o56HQm71IcYymaiJPSRkBQsS0VGdiqZOyyeufwcl1l4IpNjdcGltK8WS3WR8o/Q6
 4R2hxzSGJk6Plvh1JPl436YagFXcp0+3MZwJQHB5GrwvtjxY3c8UzbO2ArkXmA7wVOCA
 2+6g==
X-Gm-Message-State: AOAM532S9wvDLEM7OKiFBWM44HYMLYkPvavNLkN8RIcKJ2+dZKOnyg5y
 ul9OAIjdFqucvp5WpAGYa27lylz/UxUDzaNP5TPr3A==
X-Google-Smtp-Source: ABdhPJyqPMY2nDAAkDpO1ed3x3bQ7KaH2mUKTwigY6Tx+GyBLn0C1HYHEfNIVOQinK3Hzemaf3EI3DW3XKw4M4VSrow=
X-Received: by 2002:ae9:c10e:0:b0:474:c146:32a7 with SMTP id
 z14-20020ae9c10e000000b00474c14632a7mr353330qki.203.1644977600496; Tue, 15
 Feb 2022 18:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
 <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
In-Reply-To: <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Feb 2022 05:13:09 +0300
Message-ID: <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys
 to dpu_encoder_virt
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022 at 05:00, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> > All physical encoders used by virtual encoder share the same connector,
> > so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> > structure.
>
> What is the benefit? Less code? Clearer association?

Clearer association. Otherwise code suggests that different phys_encs
can have different connectors.

-- 
With best wishes
Dmitry
