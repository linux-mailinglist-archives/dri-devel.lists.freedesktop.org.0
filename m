Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8091536B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D2A10E4E3;
	Mon, 24 Jun 2024 16:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="osYujEue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A0810E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:22:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-424997177bbso15085e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719246144; x=1719850944;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4u6SiEhFuSy6jcmUYrf41+JClfPB+b5LepiIbjPkSA0=;
 b=osYujEueuSaeIq0W1cfl/ce+071YDSXxlLyB/c3h3x7R39pRs+rHWZyAOYxNSBOFGe
 xU/q1LoGqH+RaO3GjZhnaS7KLmxtHSyq6RQpJ6OYjc7bCBF8viQLMIOV4cA56BlYIIrX
 ljiMhGC7pkInREOcnH0TKVxWPgnRiZ5OAt9EM/kYuMtJt8SY/01XwlUEP4/mcYhubJal
 yaRaa+1RT8XeGet8Vb6qVR2l4ZawxuXRgPJlIOYZF9a+gZk6kEzJAanPgfC1YLw/rJ5o
 v/xs6dW0hX+fwTylrG2as9UD5M/ziKoVA3z4PQBvJ6NJPvWt3nrZnPxV6V40yxbth3P2
 DGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719246144; x=1719850944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4u6SiEhFuSy6jcmUYrf41+JClfPB+b5LepiIbjPkSA0=;
 b=OajvQD4cG5TVWWdwSvFFuvHjTmJ00fVCliq8XNefCR+iYf4cFPswLPkPf1EvyTsOrH
 eZRya+sS/4avPQStEKAnTTJuimAu/+uwZtib/1pWI60Sbn9GGqfIR4fZ4fGOA5bBpnvR
 +SEE/+0U5tuxb4BgoezdfcPm7hfoa2g9hBPo7jNXyYZpRROeZ7VNyXkcTmIqXK6thEu+
 6j2a8ANnRcnTMym0YJr2KuU61F2dkDWNQAvFTNMZWdJyJnGVAxOcGypzzjsmKudZ5MCV
 y308xAU4fSqIFO8j4Le/pv9jv2SSXfMoRJIBnZv1A8sAMuXNLHK0Jmn9y4jE3Fz+9LHu
 B9iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7FWM6FWuQH3/85myP+n/hiJiNUAgYUHlrzSU85/QAWmcbtGng8rst5mQO5g4GtbsFwgz/Qwx77xMV/C2FhCmGu3KWkYF2SkOr5twcBxrU
X-Gm-Message-State: AOJu0YwD4pz90//7lHxGTospoooM4SgEBKeAif/iFXVVqgtdVIXmR9xz
 eprokQOvOk6+9ZFJykmwumlsN665BsDlQ6D7Slq5E7498VwWkMoCx5Zyb0P6xTdSfJ01QjwzdcA
 CvvTrXuWGTnxWbqdDdOP92A7PFCDzpjjgWodW
X-Google-Smtp-Source: AGHT+IHogQz4eUKMZsSsvl1Vf44Jf33vWLaEI/UK8wH094SAzpa/D/EwJD+G+KtjuutUQ7ZhDA/Mhudd0ZIzzaCL3Ks=
X-Received: by 2002:a05:600c:384f:b0:424:9638:8453 with SMTP id
 5b1f17b1804b1-42496388483mr1337045e9.0.1719246142805; Mon, 24 Jun 2024
 09:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 24 Jun 2024 09:22:05 -0700
Message-ID: <CAD=FV=UXXRH3PR31Rmyx-OFomQe2Q9ZF4FwmrSdyNMma8XQP2g@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] drm/panel: jd9365da: Modify the method of sending
 commands
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, jagan@edgeble.ai, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 24, 2024 at 7:20=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Currently, the init_code of the jd9365da driver is placed
> in the enable() function and sent, but this seems to take
> a long time. It takes 17ms to send each instruction (an init
> code consists of about 200 instructions), so it takes
> about 3.5s to send the init_code. So we moved the sending
> of the inti_code to the prepare() function, and each
> instruction seemed to take only 25=CE=BCs.
>
> We checked the DSI host and found that the difference in
> command sending time is caused by the different modes of
> the DSI host in prepare() and enable() functions.
> Our DSI Host only supports sending cmd in LP mode, The
> prepare() function can directly send init_code (LP->cmd)
> in LP mode, but the enable() function is in HS mode and
> needs to switch to LP mode before sending init code
> (HS->LP->cmd->HS). Therefore, it takes longer to send
> the command.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V5 and V4:
> - 1. No changes.
>
> V4:https://lore.kernel.org/all/20240620080509.18504-2-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> Changes between V4 and V3:
> - 1. Only move mipi_dsi_dcs_write_buffer from enable() function to prepar=
e() function,
> -    and no longer use mipi_dsi_dcs_write_seq_multi.
>
> V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++----------
>  1 file changed, 11 insertions(+), 13 deletions(-)

As mentioned in v4, it would be good if someone with more MIPI history
confirmed that this looks like a reasonable thing to do. However, the
code looks fine so I'll give:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
