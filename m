Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A646A7EB451
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20B10E458;
	Tue, 14 Nov 2023 16:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCA710E458
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:01:32 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a8ee23f043so66281017b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699977692; x=1700582492; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E5Y3JJ8/zmgF2HGbnU5W0hdais0P+aEYIFnT/ibx64Q=;
 b=uQbuSTNUgrZjvelVfJTTU54Noe/0vPUBx/iBAZyWMMi01PIIcE3HWUvRXApnpKFvaG
 IADQMvURHr4tqnZIVnJpKRn2d0bArKSFqv7KhHYTyvWjefE6qc8SFSUa7X6B8v5C762B
 5/2xUJtlU5wv/Z02QUEcgfoip/4Rgw7MT61LDYo/3rW33rvfXhS7UtNAmtK31E6vLqCC
 l2SikzTG1FbiP9YHXI9ErGA5WJaippgYGAyQdJ++Dv87ZkOYeUC1zmY2gekgYb41+a82
 0dDjvBvylu9qie7+yHYhPa/uQD//9JrJOInvASzYUK6d00CTDWM1gzrEdflzx2R6jxZq
 8TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977692; x=1700582492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5Y3JJ8/zmgF2HGbnU5W0hdais0P+aEYIFnT/ibx64Q=;
 b=XA+28YUKhGQPq6AiVnxUxGm3EcihwSxCrOWOoff1EVLJihxmILuS+35Mg6umUCsFA8
 2beSJcQJ5nPq409pOeM9r4VsZzFQUMShv4Y1dX9J9YCfn+0BeaJuglF+7g86uYvYOm06
 d2II7BVH4IFsxlrvu89jZ3P9hUsTfKS3Evo9QdXq3RWNmicvAyrw0fWmiMZABKTdo9lL
 sSJ605QExj1hrPuxPQ/9Mv1wZVLOY8F0ZBKlXdlMXO6Mvy8KFF0E8Hm++9Fnv2BXhqz/
 vadpEV4T86xARRFkMtRckXJr48hc+Cs8MX4Cb/mdn0hh4XgVx26gfjWEmnWIt/KoKdma
 K5HA==
X-Gm-Message-State: AOJu0YxVOHl78Bdix6Me2nC635aBw0JzRlcbFyT9nBlkva75ZlQioBbn
 wttsEKY1EGCHbhtspptz6kgINRoGTkiuqzo+EBwQv0Rv7NStowhD
X-Google-Smtp-Source: AGHT+IHecxpVaiCQOmZM3KI+lhjutqNiQPYA65+zdEHbDVt0erEWM9yCXirM4emtKI0DNiHmNydMTMvGrpBG/gB7buE=
X-Received: by 2002:a81:9c06:0:b0:5a7:fbd5:8c1 with SMTP id
 m6-20020a819c06000000b005a7fbd508c1mr10003170ywa.17.1699977691841; Tue, 14
 Nov 2023 08:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-2-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-2-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 18:01:20 +0200
Message-ID: <CAA8EJppE+xpb6oSP5VrCq7J0Z879j8OaRdhyQGUdAnLQqGZFFQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/bridge: it66121: Use dev replace ctx->dev in the
 it66121_probe()
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> As the value of 'ctx->dev' has already been cached to the local variable
> 'dev', so keep the usage consistent. Just trivial cleanup, no functional
> change.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
