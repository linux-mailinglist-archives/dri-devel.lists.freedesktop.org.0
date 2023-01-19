Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C9673ED1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DA910E9B4;
	Thu, 19 Jan 2023 16:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE0210E9AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:29:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9D06B825FC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A7DC433F2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674145746;
 bh=Y5UiC66tqjbPnVN0nMB0hJCiOc1aq8w1rujscyAbAOc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pBEWI2cZxBjwWoG76BSiadQrL5rjRWkcrWf+0CgygDYfm1QuBPzaVVfdmo+xoN+W2
 8KJCTBBG+25CHcDO+7Dc/PZ9UQnxvagbdyUyPVP2eXMICKzNAsTPWg2MAyrDaG/4qI
 o7AolPMH3wfdckZancCh1UwUVs3zBuJfDABJ0Q+0viKdCtSAGY1QqG4LflyFK96C5N
 Eylb3IvU8AGHTvcqjlfJMC1u9CrcxIOb0c3KU+VrQrnNFNk3xffavpy7AZ9yXglLbx
 cqmNkMaznpvv6ByiO99+g8ljW1W9Mq2Digz3bQu0dTWWD9YNmUPc0zxTcliC1ms4gH
 nP3Ek6GR2iJiA==
Received: by mail-yb1-f179.google.com with SMTP id x4so1474861ybp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:29:06 -0800 (PST)
X-Gm-Message-State: AFqh2koDU+i5L7jiAEIUP6B4fzPPG+ri4IAxdDByMyVPYuyMa7yozjhp
 P1Py4U1Vm0IF5ujrmUOlOrYtA2yFBtFADi1Yhl4=
X-Google-Smtp-Source: AMrXdXtaiaQPjHwUwKJVxb9BtKPFxfA/UNiZ4AIsS8iQjR5R8XxfhbuY1rB1EJe1OUu9UVA4FmofH0FqpMv0XKKEgJo=
X-Received: by 2002:a25:e407:0:b0:754:e501:8b51 with SMTP id
 b7-20020a25e407000000b00754e5018b51mr1433625ybh.197.1674145745379; Thu, 19
 Jan 2023 08:29:05 -0800 (PST)
MIME-Version: 1.0
References: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>
In-Reply-To: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 19 Jan 2023 18:28:38 +0200
X-Gmail-Original-Message-ID: <CAFCwf13SAQMu1ssTtDHru5KSRMb2g_x-K_GBJn5bSG21_QYXdg@mail.gmail.com>
Message-ID: <CAFCwf13SAQMu1ssTtDHru5KSRMb2g_x-K_GBJn5bSG21_QYXdg@mail.gmail.com>
Subject: Re: [PATCH] docs: accel: Fix debugfs path
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 6:26 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> The device specific directory in debugfs does not have "accel".  For
> example, the documentation says device 0 should have a debugfs entry as
> /sys/kernel/debug/accel/accel0/ but in reality the entry is
> /sys/kernel/debug/accel/0/
>
> Fix the documentation to match the implementation.
>
> Fixes: 8c5577a5ccc6 ("doc: add documentation for accel subsystem")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/introduction.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
> index 6f31af1..11cade5 100644
> --- a/Documentation/accel/introduction.rst
> +++ b/Documentation/accel/introduction.rst
> @@ -69,7 +69,7 @@ The accelerator devices will be exposed to the user space with the dedicated
>
>  - device char files - /dev/accel/accel*
>  - sysfs             - /sys/class/accel/accel*/
> -- debugfs           - /sys/kernel/debug/accel/accel*/
> +- debugfs           - /sys/kernel/debug/accel/*/
>
>  Getting Started
>  ===============
> --
> 2.7.4
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks,
Oded
