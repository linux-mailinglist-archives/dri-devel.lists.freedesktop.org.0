Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C04B7CFA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11510E5EA;
	Wed, 16 Feb 2022 01:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994AD10E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:58:16 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id b10so251870oie.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
 b=Gnq6jup1l6drogXm5zLIW7T4+UgswiqhIR3xlYF0j4UoHds31D2nKD2iK/rNbQWLs+
 VMtu3Whx3R3PQFSy8kiwNe4oKUR6dYnbXMewIueKhaPmQWYTjvNQVwqbzpKskAseBzij
 uu1rcEj64gkWdlmyr3K8YZGkJ+oXJ8WUZbvOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
 b=I/Aw4yF/BKWMgVbWg2wgGiw0Ki+zUYfWZKMqs51ReOrSnkE1vN5fmpGpeSQu8dP/Xv
 UI761JUQ4FoE5haZDMKuoaUxs1RroTRvgTL3VFJqgogPMspCfIJZlM20s9K1J4QXkFb4
 G/t6PC7+7hV2oa/kE7CO1h9GF+vwEL/dHvmr3VeujQtZSQss7ESmisCld4+ZjO+64jnI
 G8rsKhVA2C1aCypWVNVRMcXZK4fRQ5PEn566klcqsFw8iGnMhkFLwERJ/JGLO/QnZMO/
 e9fNQ7ITXdNKHbKOIMZeQCec4KvPE+qqbaayvk1pWmL60WBCdyFrUt59Py1pnw7jNr8Z
 rsPg==
X-Gm-Message-State: AOAM531M0yjfO0KK2dMIAhIYiXgCEgmh8UnoXGIebHydSM8iVp51331Z
 Lu3+ohWDAJ4k8SD+dhqiBd216zs/u46Nbt4MJo+FNDbOvA8=
X-Google-Smtp-Source: ABdhPJxcoqJNO+Lsx3UUyC+cNI2rE61Ob18NoOX/UKotu6xvKZnjc0qxwowSFVTdTsRRILeuqwVIjl3tDr7oVqHqtyU=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2950770oig.40.1644976695886; Tue, 15
 Feb 2022 17:58:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:58:15 -0800
Message-ID: <CAE-0n53VOf=X9-81TUJ_xWVNmz+RPsURXWNBhXLpPpHKZbMnOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup
 callback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:40)
> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
