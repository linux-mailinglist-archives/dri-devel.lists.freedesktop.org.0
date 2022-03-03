Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88084CBBC6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603210E280;
	Thu,  3 Mar 2022 10:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348C410E280;
 Thu,  3 Mar 2022 10:54:10 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id t21so3556710qkg.6;
 Thu, 03 Mar 2022 02:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bIefTN+GemVOVXkSfBDQV0l1OlBF1itqeVJSos9zGnI=;
 b=YKtddxe0PfExEg+BiPTVdLq9D28WqcBtufOi+nKN4E/QQJgX5KRMkbf7x6EG4rOSQn
 9X0jYXUB+/FQ+AJt8n4Ak9xEPi1XBjG9+OF8WcSQ/KrDQRM1a38GAg096jpVHodTiFvq
 aci53REgCZIU7TSI3D5TwRnK9hdpEWvQaSQqmCUEg4Qv4uSJiyYw0mu/2co247lpAslK
 uBhHtRaggKJ2+/HTePm6qL6DItGHXGA3/cJBxcARAohCEWVrmdVv3UFS+eK81fH01lPr
 heuBhMDTHiCIuVE41EOvc2OavosXrINkXR14S7S6h4ScKEHppJam8Zoaypp2XzVfOJxn
 aHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIefTN+GemVOVXkSfBDQV0l1OlBF1itqeVJSos9zGnI=;
 b=JtPeDInXc6aVjeDJYH4kG4WiNZXEmj2epsECjju0wYkP+UxUZlIKSuuoqtoGCLZVTm
 gf3u6uUWk+7CuhCn720KhsbMyRx4zlAaG5cw85asvDnWkDA/kV0ppRvwzG0DWJgLHuTR
 0SmX2UxvTTP0GtePJ6xYOxm3UiGLslyoMIEHMIHeVwVWrVnwVAN7o/pPKQt+rx5PssYG
 hRKKPhkcdYVNfxjlpOGEG9i5Wj0SH4O6KsQgP/5KNLMZQ5kHLNtxF51UWljBSqs7eIPS
 in6bGpTM7XaVvTV0gtXk8t4SxKZ3h5tGSda4ND/ZTgj56Vh9EN3dJjEycfoUMZe7k4+2
 bXeQ==
X-Gm-Message-State: AOAM530auJVrkaoIT8Dw0c3XG7pyNkzdkTgujjWKVrcimNuZ3p2bNEsk
 S9k9enUipqsagpYh7LFwnapA8MumPj5rYyROrmbFUorUGzs=
X-Google-Smtp-Source: ABdhPJzuHpHWvVPwgfmz8pJX2uSoMtMpldkb14GicavfxYn+pQMAbEF3+eDap1cU1alYRlUk1Py4rqeNIBY2Y3IefFA=
X-Received: by 2002:a05:620a:170f:b0:663:406e:e03a with SMTP id
 az15-20020a05620a170f00b00663406ee03amr5915535qkb.593.1646304849211; Thu, 03
 Mar 2022 02:54:09 -0800 (PST)
MIME-Version: 1.0
References: <tencent_7E4716854F78B812C4FF16C83573486E1806@qq.com>
In-Reply-To: <tencent_7E4716854F78B812C4FF16C83573486E1806@qq.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Mar 2022 10:53:42 +0000
Message-ID: <CAM0jSHO=yudjZeWbVCwdVnaJ1kJ7k34unQVvyCBxTji=u3WnWQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: check the return value of
 kstrdup()
To: xkernel.wang@foxmail.com
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Feb 2022 at 13:32, <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kstrdup() is a memory allocation function which can return NULL when
> some internaly memory errors happen. It is better to check the return
> value of it to prevent further wrong memory access.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
