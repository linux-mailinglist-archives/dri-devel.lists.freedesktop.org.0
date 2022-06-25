Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2755A5A1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C37E10EC9B;
	Sat, 25 Jun 2022 00:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB15110EC9B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:47:10 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id u124so3013564qkb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKczyqyJVXbwPP+eN8sAth8R0lhAg6AZnihqaYYUBRA=;
 b=RugWSFqunQ09plkfj1ThuMovNx8NR85FBmWxOQnjmCKgfHgQEmmnP60305jkJsdndI
 HkQI9u8W895QQbso6DdkTclFUERlmrT83EaiqnV94vasxjcMmdiac4GwL2yZwViAwk/v
 HHz26Gq5Fqu8G+Tp5CIMzXBJmJPAWeiIPA1YpFSp77gMOprozrILol5W4VVxRViw/4Ii
 rGTOquoPSkEyt4kt7G6LtMGCAPuu+TqpBwT7F/P57CcEiAgx18H6Lpr6WCAxL4mDoBUd
 qO7qFUx8434SYKqXEUZpRkUGH1RSozh8tFSqUoGIt1EMveGd1LBmyKsFaviNWvosUsid
 VqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKczyqyJVXbwPP+eN8sAth8R0lhAg6AZnihqaYYUBRA=;
 b=C2YXOowTu1zFfMZcNlM/Q76wrrxqVcmh8tqSs9HPhhyLjXYFVr2uwlyVBYPv8rQao5
 /+VDOwRm92K2451nWnmNNf9Wuj+V+x5Mq6gTKlqPq0OyFWk7dkh+Y78Ase6cNWbl4iID
 Vj7VDC0gE/YvS0bmtL3C/7y9dI4Ylh/dtSXl9zDcYGOtmraT1OiUTqYeroMW+1NKv1e3
 DrNo2jjUHYm1FXmIN069Ekyw+d9V9uJpYLN62mv1ntj8yFZHSnBNihmYNRXZNwaB8C8y
 BQi2RZ9xg59x+76Q1X6cMQltqkcERW/D2bYUdNbaMsMiDVSrjUohQC1qdAJVxARNnsrJ
 9v1g==
X-Gm-Message-State: AJIora82mHJmyUrzYmspv8dYyJq1H379GwirgsUhAd+r8g8GLcklm7ql
 t1kf9ST9k2nEuqiCIwSe/0td9GU1KNEdoXT5oYdiuQ==
X-Google-Smtp-Source: AGRyM1vQ1vDDBzdPJoGeWwsffL+nmSpD3bXYcuiqaJJ3hxzqY/MRBObekDuzlqII+ZoMkbx+3P9PZsnLsBcCxWn/v34=
X-Received: by 2002:ae9:ed56:0:b0:6ae:f7cf:7f5c with SMTP id
 c83-20020ae9ed56000000b006aef7cf7f5cmr1475378qkg.59.1656118030003; Fri, 24
 Jun 2022 17:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
 <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
 <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
In-Reply-To: <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:46:58 +0300
Message-ID: <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
> > > On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >> How can I have eDP call dpu_encoder_init() before DP calls with
> > >> _dpu_kms_initialize_displayport()?
> > > Why do you want to do it? They are two different encoders.
> >
> > eDP is primary display which in normal case should be bring up first if
> > DP is also presented.
>
> I do not like the concept of primary display. It is the user, who must
> decide which display is primary to him. I have seen people using just
> external monitors and ignoring built-in eDP completely.
>
> Also, why does the bring up order matters here? What do you gain by
> bringing up eDP before the DP?

I should probably rephrase my question to be more clear. How does
changing the order of DP vs eDP bringup help you 'to fix screen
corruption'.

-- 
With best wishes
Dmitry
