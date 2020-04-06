Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060C19FE02
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A616E0E6;
	Mon,  6 Apr 2020 19:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD736E0E3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:23:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s15so703134ioj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43HXVgJ+DiEVH1P2f9yVtx9VewU1GvCtyVKXZCcL8NA=;
 b=ZuGdEOTD9N4jwjCU/i8i/+B+2F/G8mHv4MwHgrqiW0IkvfL2kn02yzQrj3bnYjEZUb
 GV7NWiw3nMs/5TcIBCz4ZtD376LyHJ1PyHDIVbslGa2YB2DV0FPLtB+okiDJ1sRpdObM
 7fyIfuCruHRwTccgqyqwgJ7j5uv3luktjo29sp8qpCEwNj6s5RO1IYB5OaYCYYVQp/1/
 4/w/MrCHce1ItSoMdjaZLUPSyaBR2GPoqmEjkXrUl01z4uJepJIi3QrTjfVFRquc9d/b
 O5oGYXIAEtNTCNiLSbuaPt709/RpRkMtcCo8wTIa/liwLUK78tyTKJSvjnoCi62ABqeK
 XbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43HXVgJ+DiEVH1P2f9yVtx9VewU1GvCtyVKXZCcL8NA=;
 b=l1zc7K+WjU70LMdqY3j5G19uT4B/guPJ4w+um1/GgrIsEsFEjza+gDKOtRpGXrTtgV
 qZkPGKlTjIVMXTx3DxGHM5PfB2HqVnDKrVw01PdWguXCRS7kVai3/5U3zeZb72cnZcSj
 df3zax7UKdWrAYnB6rnAuo7v7X0gy3MN52EC1vNVbudR1GF74ZkPZ4ILtxZ879FyZhDo
 QisI0sydB/Q8U109+MTzLOOAHxCjtXyQSPzo6srrw9DHsmfn0m5rU3Pr98WToprY62Fo
 ty8l0TdA0qtbyVWZDNE2NExVGNA/n8WuJqTtCw/zIY+sukjg+FjJTn+CyHbWvpms6CuO
 kuAQ==
X-Gm-Message-State: AGi0PubBukp/S4B17BACuY+WrkPBOSx8usI0XGZcnJacCmkAZ41FJSrX
 tc/tCbvKJBKXK44Cjg1CbNOxqohZoIg4ECqxm4sqlA==
X-Google-Smtp-Source: APiQypKbLX+EYrn5ISXhltuzxMnHhVG/jM5JqBjkhcE0PmL8GJTBlHiWzYMl6zAPAtT4U224p5ZDsjQt38CxSqog/Xc=
X-Received: by 2002:a02:1c07:: with SMTP id c7mr858228jac.19.1586200930891;
 Mon, 06 Apr 2020 12:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200403200757.886443-1-lyude@redhat.com>
 <20200403200757.886443-2-lyude@redhat.com>
In-Reply-To: <20200403200757.886443-2-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 6 Apr 2020 15:21:34 -0400
Message-ID: <CAMavQK+fjw_Odj-nQkUnZVyGXv_62znBXk2MsUVzkZxuQDJC9A@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/dp_mst: Improve kdocs for
 drm_dp_check_act_status()
To: Lyude Paul <lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 4:08 PM Lyude Paul <lyude@redhat.com> wrote:
>
> No functional changes.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Sean Paul <sean@poorly.run>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 10d0315af513..2b9ce965f044 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4462,10 +4462,14 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
>
>
>  /**
> - * drm_dp_check_act_status() - Check ACT handled status.
> + * drm_dp_check_act_status() - Polls for ACT handled status.
>   * @mgr: manager to use
>   *
> - * Check the payload status bits in the DPCD for ACT handled completion.
> + * Tries waiting for the MST hub to finish updating it's payload table by
> + * polling for the ACT handled bit.
> + *
> + * Returns:
> + * 0 if the ACT was handled in time, negative error code on failure.
>   */
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
>  {
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
