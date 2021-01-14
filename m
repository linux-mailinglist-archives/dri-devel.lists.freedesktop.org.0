Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C062F55CA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 02:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581D08919E;
	Thu, 14 Jan 2021 01:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564D88919E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:30:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id o17so5698558lfg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aQdUb0QePLnuFrfCeP/LOSw2Xg60qZ7zBQYZnqDVCzg=;
 b=mWx0FFv6l0JQEO1gJrEOwbGnx+hbJgKUmeb0WjXIVBUODVuFVn6OojgGXSemTSNTCn
 D1Lit8Dd4ucMJEWkDfEY7SngrwQDPsOR2gQvkaN05+XporpavkAB/UWVcTI81Bwv5ElL
 3XA9ZWlsZ3GNpBjo+JgkctZzIpRXj+fP0+bGpEpSPSq/XBKb2QlzG6iYBomECFktpCY7
 xXd3+TxqCypkaa8arbh13weAO/j6MuXEjVl3qBX98x7sF4RP4he09Bh7WRR8Tm/Cc3Eb
 EvyvfteSqkCtwivupQoV3CHU/bEqSrzss0oo+wikFWPk71NaxvP0gH76ggNETQ4E7HTG
 GCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQdUb0QePLnuFrfCeP/LOSw2Xg60qZ7zBQYZnqDVCzg=;
 b=jK7RO12BwT48w72mphggEhUyr4yiLPDJ9F3h3KQ0ZLvB3yZkUBVzjRL+sDMgOWo/CO
 WSVqYdTVrU8Fq61+h6iNe5pon0bQUnu4J53XnFkFehV19EJjc/WBbLQKz3xxiKyG6Puy
 AW0OVoQNmlWRuiB7TddbeAIJhCb9SyuN3TTVcgAUNPG+WtmpHaw+atXCJnddtQgAoGPG
 uTiRVe7Q3Jd5VNkM2BmnqCEx8p4IRQleNF1uEcKSKfn8kJSJoNn4feE+JK8ZpYMVjjsp
 +THDfyQH8+Aln9+X5VndEgMqwduc8W22syqk0pHLVtI2+2b+jqbGy+2eKRXGnL8V9DqD
 kitw==
X-Gm-Message-State: AOAM53142admWANlCsLOiOOBEjhHxGigPqNJ07Sj+XinC42oSjypZfN9
 hSELWcV46xN2cEvuUEbSnJUPlJ8VOdZCiDPlK5jRaQ==
X-Google-Smtp-Source: ABdhPJxClhSkXf89Ld5gScQwsma53h5el9CVUO54i38kiNii8q8c6ZsOOz3HeDiLty1kK9qqh+4pz2hkNTwNaDn654k=
X-Received: by 2002:a19:8357:: with SMTP id f84mr2034699lfd.567.1610587804819; 
 Wed, 13 Jan 2021 17:30:04 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
 <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 13 Jan 2021 17:29:53 -0800
Message-ID: <CALAqxLXtXcxwpBDiGfmaWpFONaRc7AtX-GCdRqTd6Ynz9pRTng@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, pdhaval@codeaurora.org,
 abhinavk@codeaurora.org, Sean Paul <sean@poorly.run>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework [1] uses the
> retire-fences as an alternative to vblank when frame-updates are in
> progress. Set the fence timestamp during send vblank event using a new
> drm_send_event_timestamp_locked variant to avoid discrepancies.
>
> [1] https://android.googlesource.com/platform/frameworks/native/+/master/
> services/surfaceflinger/Scheduler/Scheduler.cpp#397
>
> Changes in v2:
> - Use drm_send_event_timestamp_locked to update fence timestamp
> - add more information to commit text
>
> Changes in v3:
> - use same backend helper function for variants of drm_send_event to
> avoid code duplications
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

Looks good. I appreciate you addressing my earlier comments and
sending this out again!

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
