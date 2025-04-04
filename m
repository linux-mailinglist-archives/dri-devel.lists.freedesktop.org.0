Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF49A7BDAC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1052210EBAD;
	Fri,  4 Apr 2025 13:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XJLPcInR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0E10EBAD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:24:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so1566202f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743773083; x=1744377883; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
 b=XJLPcInRRZyk3IENbrhabCH2MS43zHzJjju1HS245ybvzooZoPHAVWsvqIi7wcznNj
 jUVojOzvmu8qkXvS41AMFNPZ5JcpHNGnIXT0iXG7Ut5exGwXUtIGrjTxwyX469apKYYX
 FRdgJbNAeEg+vf0UORKS6XzO57nd7RuXYx1tNdSSCmM1m6C4/FRgoHKn8b6MDj9oln4+
 953LS4vAeA+3X87alSBFPLp3Eg+fklDLjQyCHQEu19TJ51/pDW3v+GIGKaAOKhen1w62
 xJibyg8Yix8ewlC7UXjv/eMz/niNVE91tMV6fGYsO1mBc2GElyutAZCAAt1iIU3W2KbS
 pAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743773083; x=1744377883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
 b=gUcSS3ciesqvWMJFmhLBelyvvLKcla3AcWDF65QT/iiQ+7bMe1xrhFqWxHG5eNgDp/
 8X5yLsHrhyIZaN7MUpcS2oTL5Otv9jD6ySBQzjjkdi05FYfme4sr1KKaP9WUxsVAEsYH
 xkpHUpuax7ZZPawHKYWpu0DWJf6/3bKB4NjwbSWwo5qDAz4bkaQgmYy4beN4/+swEgSX
 Vb8YX04KAuQaR88EuIaxdeCSG86Z9S72lGUIrLig+wKLMk30+8iIf52u2nCk6OUopgpP
 C/5Viperd5Y0m6KxBDLEFkrj9RcXwXY2ONEVWmaqrplzj8dZS+LY4g3EfzqcQ/dTmNkG
 D1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6UIHOTCqvxsUUDAsXu+fbiRWKefx0npGGo2iY0SsTjUnQN/uMOKr2/RnrDgU6S50nEdPNpiEXYyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7pMwfftyv9B0+jzEdr/p3ZnB5mIEemlrkC2q1gSbL85N/l+Kr
 hTWVU6bpCLL/tK628qmpUjUBhdD69NLW8earayx45N3jOIciSvLO86vkxA7TMINWP7MmkTTFlL6
 +qEnfIsB0d4qiB/7e8U1W7VdRFojEjZeGlgPzgA==
X-Gm-Gg: ASbGncvqj0/hiM9w7dXW6eQnvbKqisBULzkpYtWcZS3m9TJS1nE54aydUEzhMki2TU6
 cM+mBL3v+LICr5YU3JKg9D1w1q47zxOfkVo8ZzNFiuzD8C78eB1uvPwXyAt3W/TBNyMr26qshDu
 m9YHdV2HJcF9NxNV4qIci9TO7D9o5uQyg+cFTZ/PsJwzbRafZLgSGlEq+SFno=
X-Google-Smtp-Source: AGHT+IH+MryZk670LI+vb8g6AGQzjTKgC/A+Ysy8cvkGHq9W3yQmNkcMxSeio1SQx6Re2aTqU+InOAD5FiP0RNumBkQ=
X-Received: by 2002:a5d:584c:0:b0:39a:ca59:a61d with SMTP id
 ffacd0b85a97d-39cba93712amr2831530f8f.47.1743773083319; Fri, 04 Apr 2025
 06:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
In-Reply-To: <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 4 Apr 2025 14:24:32 +0100
X-Gm-Features: ATxdqUGnTvLH_MOTicwPOTsv0Kyq_s2vv3HxYqY2Tmgfq0NrzRxurscl_9sCHeU
Message-ID: <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
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

Johan,

On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>
> > > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >       }
> > > >
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     /*
> > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > +      * correct brightness scaling on compliant eDP panels.
> > > > +      */
> > > > +     pn = clamp(pn, pn_min, pn_max);
> > >
> > > You never make sure that pn_min <= pn_max so you could end up with
> > > pn < pn_min on broken hardware here. Not sure if it's something you need
> > > to worry about at this point.
> >
> > I am honestly not sure. I would hope that devices follow the spec and
> > there is no need to be too paranoid, but then again we do live in the
> > real world where things are... not so simple ;-).
> > I will wait for further feedback from someone who has more experience
> > with eDP panels than I have.
>
> There's always going to be buggy devices and input should always be
> sanitised so I suggest adding that check before calling clamp() (which
> expects min <= max) so that the result here is well-defined.

Makes sense, I will do so in the next revision.


Thanks.

Chris
