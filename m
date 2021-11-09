Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079044B52F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 23:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B77F6E7EF;
	Tue,  9 Nov 2021 22:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46936E7EF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 22:12:20 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso861609otv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
 b=dUVV+iZ7gYosXBMozkc7vKB1RNOH5oYuxH+4ETASHmsxotjE4SMaeLcPuNuZo3YgLS
 VKqrYcvpOjHVanfYHo2JDTh9TG9fBjUwC/5YUeev8lYij4oN6Dvhmr9g993TWSjfRQXA
 y/Ob41ctB8Ez3blzsLaMRml0A4mz13rP97ljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
 b=Dv2TmkbIB9yD4VQOHhQIWHG80dmsq8Bv7dEzDfmpFQ+uVZPL/lCHsYIUJn5M0HXYVW
 GzfuBFw+61jJHbs38byvOc0amD1gXzp5M7R/6Q9z+MVv/VoxvIgFn95U6I+q1L6XTgV8
 mnzsTetOX4FTEfBM87KQV91CeHb+S9XSCmYM3FHvHIufxvbDx6PLRkVhu2j6M6bqftfs
 kgL3pd58ml01OfHzMSFEhXKnhFT+nfoxGm71F7gBOWad1KZftBw4qSlyL/Jp8nXQLFt2
 x9j2JCZSZWJ7VXoZgeeRziToAlKBmzN5ZimgbAM6jnCL3/HQXOKamBRqvKSTZQpAZDSo
 k/gw==
X-Gm-Message-State: AOAM530M7Q0emIuDjU9ABEWX3yRzGpSsdzKhoR60wfaPW9NMBHMprIs3
 CuyW6T68Oc5DEOy2RBhtRaw4b48+ADVcnYzep2RdGg==
X-Google-Smtp-Source: ABdhPJzCxZIvzxfRWv/IW1ZG0J6NJo3QJ4ZuZGIuMdYHfvlxdSbDBBsE6NHiPmYbpRrVGi/S+/NGsMIcLCSrzc29ITI=
X-Received: by 2002:a9d:2f42:: with SMTP id h60mr8342701otb.159.1636495940269; 
 Tue, 09 Nov 2021 14:12:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:12:19 +0000
MIME-Version: 1.0
In-Reply-To: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 9 Nov 2021 22:12:19 +0000
Message-ID: <CAE-0n50a5LWpi1JoY=BpwPokpuzYC2c3RXv86Ob_azmdCOkgyw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: use compatible lists to find mdp node
To: Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-11-09 01:47:28)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Use compatible lists instead of duplicate string
>     check (Stephen Boyd)
>
> Changes in v3:
>   - Use match tables to find the mdp node (Stephen Boyd)
> ---

With the export symbol dropped

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
