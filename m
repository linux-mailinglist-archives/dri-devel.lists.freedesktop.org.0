Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B11B7EB0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 21:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268D76EB0E;
	Fri, 24 Apr 2020 19:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA1B6EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 19:16:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so11843991wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8C+l34ylQ/fd4X7uZblckP7QFtPAfaKyL9kDot/4z4=;
 b=hfOZcWCALviq/FPpDxJ2lRmuzD2k7d7BdrAIZwQNcD7ZpG6rqG6beBNBN419L9LgHv
 qWjU1pqWXZMldct5Op1Mhn56WkPAnuYF8iYsZp1LvlJoAtnoR2IX23+YFb4QHUZQySXu
 Tun26rsYLpcFezcxPqxzfXbSLofJAa4rioAzb3z7A90I9bDLzeN+dvso/uNDAWd+VjYM
 HRjr0RMi5xnR/T8UmG9WG58ZA0169rBq20xYx13B4msc5HFIBd+4PsZTOzqNP1siOtH6
 4++h0v99wy+7hTEm4DrOPbpy9+BPYqg+ZR3W7N72cnOWqgIVBmHxh32mbCDWUHPN6N44
 hYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8C+l34ylQ/fd4X7uZblckP7QFtPAfaKyL9kDot/4z4=;
 b=FOZH9KjJ2QBZhrEYiXfu6Vaxtz/iyFiSwm6Vz8oPLY5LOv07hchlN2+qavhkm+V3Og
 2vIVlBePJwcAU97JP9oZAqgxTi1hJ7vpAoj/LDQYGEo/mgK8XOFmjRbaHMiloCJOp/Lj
 vqATS03L9a7faK34YfcDU+GhBamHGTw8FBCyNkEC5aNA5muNVRG3JUo0bMLwY5yWvm/F
 8OLpoZEvRewud888/+7ltap+GAOAA08VLg2lJo7l/o3h8ruPXu8vOmD7ZjE7DU/dbWK2
 FqKP6QQdbqA0EVrtKuaXT4R+4bPhYWlu6nrwL9wBEp2jRfvs6UC0/sUgnwYBJmeXeN7w
 bVdg==
X-Gm-Message-State: AGi0PubU0u8jFv6EVfmzsEu+bEYp7dE9DjOW2QC2G3kX1BhlZyTjI8Iy
 h5H7ejZIyjOJIXNiGQ1gC7eJnBUyEx57E184R8k=
X-Google-Smtp-Source: APiQypI9iWjkNlysuw5QaKuCzf9HmzjnV2ROy4i4+cCk9La240gYY1Dav76tBMmZFXyjCeHhhtFoiPI8C2aIGFxIVXY=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr12074171wme.79.1587755787069; 
 Fri, 24 Apr 2020 12:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200424190722.775284-1-lyude@redhat.com>
In-Reply-To: <20200424190722.775284-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2020 15:16:15 -0400
Message-ID: <CADnq5_OhwMgkUNNE1gXJqSKxBMUkWU11oiOidE+SahUgatBzZA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_send_dpcd_write() return code
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 3:07 PM Lyude Paul <lyude@redhat.com> wrote:
>
> drm_dp_mst_wait_tx_reply() returns > 1 if time elapsed in
> wait_event_timeout() before check_txmsg_state(mgr, txmsg) evaluated to
> true. However, we make the mistake of returning this time from
> drm_dp_send_dpcd_write() on success instead of returning the number of
> bytes written - causing spontaneous failures during link probing:
>
> [drm:drm_dp_send_link_address [drm_kms_helper]] *ERROR* GUID check on
> 10:01 failed: 3975
>
> Yikes! So, fix this by returning the number of bytes written on success
> instead.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=1 warnings")
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Sean Paul <sean@poorly.run>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 03a1496f6120..21dc78cb4ba6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3436,8 +3436,12 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
>         drm_dp_queue_down_tx(mgr, txmsg);
>
>         ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
> -       if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
> -               ret = -EIO;
> +       if (ret > 0) {
> +               if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
> +                       ret = -EIO;
> +               else
> +                       ret = size;
> +       }
>
>         kfree(txmsg);
>  fail_put:
> --
> 2.25.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
