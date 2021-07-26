Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E923D68B3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 23:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BB36EA00;
	Mon, 26 Jul 2021 21:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5EB73001
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 21:31:12 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so11360671oth.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
 b=gQGAGt9eEIgv8OU25omKBzR8PLkHSLWDrPryqtU60qn5PueYnFkrrRF5sZmw8zvbW8
 VNvqSxzJKU4JHj3qQjp0n6PyQtHvjicciYGeODKdQPIQW3jy2u5oycvxVco1k8n0Ln2x
 voLvNquo5k+uiomYEnvZohtgMYMykoPKM0dHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
 b=gt3eXJBVTPHQMjcz1pB0a5mKv2s4ixvazjM5AsYinS3sdscBEvhlvOHvFd0w8/cbCj
 6lXDP66SDlJThOqpU/Mog72+/WAsCxsGAYgSlBAKq6fwda+QEs2UqolI79GYpSBm1fYJ
 9muvV2Q7Nwrez0Ye6y52ESk3CKLr6+qUwNh1FLZzFMmZNb2v/OgFNRBfVjm04ETrUXWi
 xRgtIJWesrtSfYDXQ72XIumh2h4u9RsjKaFYbj2cmeUIAE7IUWgd2p4hShNu2tyCMOFC
 nWL35F1bdLvvGyjwiYpoFj1Msh4/ZHGOmWudxm4doia8hsUqnXTHGyLGusXw0RbhDPBg
 v8VQ==
X-Gm-Message-State: AOAM531r8XkBA5ipwk9hL4Vb4S3tgHcKXKsDoabzWo8tgRlHjaW3ZnH+
 4bbs8k8ZJ6v2cXmJNCT8WhA0Ht2TdMlW9x+tP4mhT+6eJlU=
X-Google-Smtp-Source: ABdhPJxwnRHClL4PJXQ2kAmJVcUKbc5TCfHvRyXzHShrdN8UAJDxajrWEr88V72kZPeMp9GmmNEQVKgYIcGEH0FLNgQ=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13316575otl.233.1627335071314; 
 Mon, 26 Jul 2021 14:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:31:10 -0400
MIME-Version: 1.0
In-Reply-To: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 17:31:10 -0400
Message-ID: <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: add logs across DP driver for ease of
 debugging
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-26 10:36:26)
> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>                 DRM_ERROR("invalid dev\n");
>                 return -EINVAL;
>         }
> +       DRM_DEBUG_DP("sink_request: %d\n", sink_request);

This one is bad. sink_request isn't assigned yet.

>
>         dp = container_of(g_dp_display,
>                         struct dp_display_private, dp_display);
> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         rc = dp_link_process_request(dp->link);
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", dp->hpd_state, sink_request);

Should that say sink_request?

>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>                         rc = dp_display_handle_port_ststus_changed(dp);
>                 else
