Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B852F2EF887
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F286E7D7;
	Fri,  8 Jan 2021 20:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7A46E7D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:07:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id o10so14885479lfl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBXrHhQsMSZE24lPYHC5hE8Tvxsqc5QvSO99Uer2dqY=;
 b=CYo7SNrso54Do6MmIyzyVaUhqI0zqvwDsPmdS0hyjsFX370xglzPaYlMY6kZiBp9ls
 KF/PxuGWJq3ceChX36JZgI3NkxfXVej3u525jGJOzYxD2Jn/gc3XAcRVXJR1H0h6Yoh8
 blHEuVnR1bF7GYFV9sFozA9x9FezyzC9pX9aM0P694SJraxLzn0O/7SDeoGdvWxPHNhF
 q5P+3zPj1yFjIhgO2Wfd7rwR9v9+75JBP4H2NJgPM0OQilzktY5z+phOzC2p2FgI5w+H
 THvaKX7lDUI3l4cRQsw4mPZTVtlZhpFnB7pWzfBg4/ALhW7w1wSKWtYgZxY0uxJoTW7D
 GJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBXrHhQsMSZE24lPYHC5hE8Tvxsqc5QvSO99Uer2dqY=;
 b=E6q2nhvW4dO268fp89cyh2Z9yCMH5Pg9+V5H0nBDLTizGBW3Zf/YYfnTFOqhwG+hlf
 IXHWajVpXWJUDbo9ZVAcxfGU4C3o3XbCwVoY0VajGt1KGqW76KuHDeEDVGq5s4vPClhz
 qGJ6XBOQGhjsyqDdCIxH6UrRSXTZ6W11eeU/zUTFWzqSQWCLZDhYnXBT68WxnS5d6TY3
 YUtV1U0ULokzkg+WEaDXOBiLGBGvUAElWW2FZ6aLAq8PNY6kEKdtBcy+ycxc10eQbBf2
 piYeKbt14QYGkK9NayIPLC2yhMRy9dQIcIirFi0IX36vhezQkF7JeEhOygR1FQ85CWh4
 hGXA==
X-Gm-Message-State: AOAM5308TdTTUtBSN2SRhFJC4rQi0K2rZ9wwjhBzodXvWqh+jOjDzkVh
 8msKuEpbHkgyIoiWm1jp9gZas2G3s/4GB8HdnkG2PQ==
X-Google-Smtp-Source: ABdhPJxJV8oC668VXcRm1+eI+UwseO9jyPGPM0WN+OvhmO/TzjibXRm7ZB6GKJkJHknJN/pO0gCe6n16FRaa/LRVp/4=
X-Received: by 2002:a05:651c:2105:: with SMTP id
 a5mr2055232ljq.170.1610136429775; 
 Fri, 08 Jan 2021 12:07:09 -0800 (PST)
MIME-Version: 1.0
References: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
 <1609962554-13872-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1609962554-13872-2-git-send-email-veeras@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 8 Jan 2021 12:06:58 -0800
Message-ID: <CALAqxLUwg+zu8QqFimozkOM3jFk-K24syaAiGkD+5rf-FrKBBA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
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

On Thu, Jan 7, 2021 at 12:54 AM Veera Sundaram Sankaran
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

Thanks for sending this out! One small note:

> @@ -775,6 +775,49 @@ void drm_event_cancel_free(struct drm_device *dev,
>  EXPORT_SYMBOL(drm_event_cancel_free);
>
>  /**
> + * drm_send_event_timestamp_locked - send DRM event to file descriptor
> + * @dev: DRM device
> + * @e: DRM event to deliver
> + * @timestamp: timestamp to set for the fence event
> + *
> + * This function sends the event @e, initialized with drm_event_reserve_init(),
> + * to its associated userspace DRM file. Callers must already hold
> + * &drm_device.event_lock, see drm_send_event() for the unlocked version.
> + *
> + * Note that the core will take care of unlinking and disarming events when the
> + * corresponding DRM file is closed. Drivers need not worry about whether the
> + * DRM file for this event still exists and can call this function upon
> + * completion of the asynchronous work unconditionally.
> + */
> +void drm_send_event_timestamp_locked(struct drm_device *dev,
> +                       struct drm_pending_event *e, ktime_t timestamp)
> +{
> +       assert_spin_locked(&dev->event_lock);
> +
> +       if (e->completion) {
> +               complete_all(e->completion);
> +               e->completion_release(e->completion);
> +               e->completion = NULL;
> +       }
> +
> +       if (e->fence) {
> +               dma_fence_signal_timestamp(e->fence, timestamp);
> +               dma_fence_put(e->fence);
> +       }
> +
> +       if (!e->file_priv) {
> +               kfree(e);
> +               return;
> +       }
> +
> +       list_del(&e->pending_link);
> +       list_add_tail(&e->link,
> +                     &e->file_priv->event_list);
> +       wake_up_interruptible(&e->file_priv->event_wait);
> +}
> +EXPORT_SYMBOL(drm_send_event_timestamp_locked);

This seems to duplicate much of drm_send_event_locked().  Should a
common backend function be used between them?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
