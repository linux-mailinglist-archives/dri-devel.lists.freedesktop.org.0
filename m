Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD153CC2B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED84113A9C;
	Fri,  3 Jun 2022 15:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF542113A9B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 15:18:10 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c2so10578419edf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/ErmsKgHRGBSbHIqeaw4XfKuXA04q3v6x85oN3ceSE=;
 b=nyfCnV8YZstnNR+xgQCiDZXUcsDanH2/VTv56tmrhsftNpvAv5FD/WtqKiepbFRifh
 kG1DJQ0o2QT8CgDaW0x7B7DsAWiGc4ilx4OC+hd/wDMQ7GP1yNwtBg2jNTpM5RnrnyfJ
 PNUCRLz/c7PtTqPFR3Vm7nLcBzN+AEhiBHGJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/ErmsKgHRGBSbHIqeaw4XfKuXA04q3v6x85oN3ceSE=;
 b=l0TjEb9m9d+NjDgTS5+PkQCl/CAAN/JrMfVXB0GN40edIL6M1n5l+MU6siAE54wmaH
 /dW/EKhun3KIRfpHMUyKeYhcL+83wLgd/Ik3ONCsx7SVHx62+roSApiRkuLB9rm1gVYb
 9LMokVdre0AuXwEH9rgWOr5FYyhdOtM60GEVLJ9dnHaWQ7MsjqCddcudhyicbt2M1tR1
 C0BkCZpTdQLvTO9OjJuvovBuiWKmFhnWL47sduyj+hGXlSOjKdUjVW5/btU90M18nH+m
 TlByKLNzMOfF05OA/ej9koSGUT2lfb+Sgwi78BwIzq5TVHFh2qhmo+Zcwp0ZXM9ynsnd
 ak6A==
X-Gm-Message-State: AOAM532G8oGkB+5DNcyZj+8DTnhnwFZLIKKBhBn5LQeOKHCuQcWaZUJU
 xP/u2WnDYQUyZAEr8K9AdPIcY2KOOWrhXJldNtU=
X-Google-Smtp-Source: ABdhPJx2WC3jiPQRVqRAi60eydfY6vW2OaR2E+dOKfYeDHHI/UR50fw9+pGHAzYMANfWL6Ve9zKmeQ==
X-Received: by 2002:a50:fc10:0:b0:42d:cbd2:4477 with SMTP id
 i16-20020a50fc10000000b0042dcbd24477mr11168395edr.363.1654269489201; 
 Fri, 03 Jun 2022 08:18:09 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 d10-20020a1709063cea00b006f3ef214e5bsm2932192ejh.193.2022.06.03.08.18.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 08:18:08 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id n185so4258259wmn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 08:18:07 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:397:4730:ee7a with SMTP id
 q19-20020a05600c2e5300b003974730ee7amr37868828wmf.118.1654269487107; Fri, 03
 Jun 2022 08:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220228202532.869740-1-briannorris@chromium.org>
 <CA+ASDXNSThy7usMKkN22VBq2iyej7sCJ8CAmgnNvxDgZiMbukA@mail.gmail.com>
 <CA+ASDXMW14GqJUAogQ0=dVdamhTTGDzcMRv-8Cx-TaXShHxj+A@mail.gmail.com>
 <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
In-Reply-To: <CAOw6vb+myB0gB1kPvwuL+T1Ka10gDN5rGS2hW+UG+-+K2NGz_w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Jun 2022 08:17:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1F61nDcoQz4w1pJX_=Zzt6sLH8bcsGrxxTpGs6=yZ4w@mail.gmail.com>
Message-ID: <CAD=FV=X1F61nDcoQz4w1pJX_=Zzt6sLH8bcsGrxxTpGs6=yZ4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: analogix_dp: Self-refresh state
 machine fixes
To: Sean Paul <seanpaul@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 3, 2022 at 8:11 AM Sean Paul <seanpaul@chromium.org> wrote:
>
> On Mon, May 23, 2022 at 5:51 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > On Thu, Mar 10, 2022 at 3:50 PM Brian Norris <briannorris@chromium.org> wrote:
> > > On Mon, Feb 28, 2022 at 12:25 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > > Ping for review? Sean, perhaps? (You already reviewed this on the
> > > Chromium tracker.)
> >
> > Ping
>
> Apologies for the delay. Please in future ping on irc/chat if you're
> waiting for review from me, my inbox is often neglected.
>
> The set still looks good to me,
>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>

Unless someone yells, I'll plan to apply both patches to
drm-misc-fixes early next week, possibly Monday. Seems like if someone
was going to object to these they've had plenty of time up until now.

-Doug
