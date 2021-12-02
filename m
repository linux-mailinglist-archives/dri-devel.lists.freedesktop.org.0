Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F346618E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722266F459;
	Thu,  2 Dec 2021 10:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE45A6F459
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 10:37:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x15so113927057edv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vN2AAkedmLiXmzlwdSTnIyWilcMSm9pwVsygK2i+Gxc=;
 b=oufe8Rc/CotXUJEXbHxoxXgUvwrKScMu8jBpMNRIviNJDH4KVY6A88yxmsJiGDddAh
 TQMYIgpebLtOLwCJfVwDe/jT03SXCTeHlKe5CsrWsEIveSCvEDP7H0cn0EELq+XJ1h2x
 UDGPwn/EEKFZS50zrAIgYHqAxfE+V0vpmzvbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vN2AAkedmLiXmzlwdSTnIyWilcMSm9pwVsygK2i+Gxc=;
 b=Pnvo6QUDks6tj6bQ5ggUbHiOKTyAZEij2RtA38gYGE/ZGvhFtWaBxgBktiR26Cqoln
 7Eqo3i66/hiXE7eL3lhHreXGZtU7gDIo++gxLEzXVleSmvKg4hQQURLHVrrqkvONkTDF
 Ny66tSGqIOy1ufpRHrkq6qvOqL3H1paPB8eFuD0Kzuv0nEBW7R4mqsfbRqAR9tkwddXC
 Vpb4kls/boX/K9m5B44r9VEtAmYU2k7pXsbaEFNmD398T3UMRMTG/nhfBKw6q7bg/dDD
 dOWhqWKvGUFTYnzG5hs4NGYcFVJ28ZkQrfslOnfREXyJCDkiIbQ6wNiIXFHrr5fbaCwT
 f4Iw==
X-Gm-Message-State: AOAM530RHXOGD6seNP1gcjE8InSsPJc5mHnE0m9U9EZxk3Xbc9bRKbAx
 /OHibt2JiSqOZE9zZZ2AzXhPqmNJevlEC+4Z/yQlyIL4ihilOw==
X-Google-Smtp-Source: ABdhPJyCIM02ie1Bt+ERCeCMFFlxoiLkm4B+q6qF4Dhe4T7555e+J5rSdlnef3PlqEim6Lqybn00N0N5C5c8Nt8xYqk=
X-Received: by 2002:a17:907:6d28:: with SMTP id
 sa40mr14177388ejc.201.1638441421248; 
 Thu, 02 Dec 2021 02:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com>
 <20211201215729.2138-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211201215729.2138-1-laurent.pinchart+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Dec 2021 16:06:50 +0530
Message-ID: <CAMty3ZBcUg8bf6MTP4QNFjDB_bx1K-Q5C2_th3M=DoKGRv0ZpA@mail.gmail.com>
Subject: Re: [PATCH v3.1 2/2] drm: rcar-du: Add R-Car DSI driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 2, 2021 at 3:28 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
> SoC. It currently supports DSI mode only.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v3:
>
> - Use bridge atomic ops
>
> Changes since v2:
>
> - Support probing of child DSI devices
> - Use devm_drm_of_get_bridge() helper
>
> Changes since v1:
>
> - Use U suffix for unsigned constants
> - Fix indentation in Makefile
> - Select DRM_MIPI_DSI
> - Report correct fout frequency in debug message
> - Move dsi_setup_info.err to local variable
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
