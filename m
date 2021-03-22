Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E04343DDA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 11:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1874889E26;
	Mon, 22 Mar 2021 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7089E26
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:29:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h13so18627122eds.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWnMXVoQRmHW9unHMINxWSWflwkHqDEbX/KH42wQ/b4=;
 b=LpMSiaOlGl1lK89C+7KfYX3AeenMAoV1TZ+jJGN7Z5bir35JwiSkiM8nDJBsIiXDxm
 /A7hvlSNTDNgacNg7ABbk4PIKReH7pcUYyl5AGJynJIbkImqpKPG52ZLHXO2IrmJHOr8
 6IfUIKNcc4o84juyMjtEcAyS18bW40k8ttp9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWnMXVoQRmHW9unHMINxWSWflwkHqDEbX/KH42wQ/b4=;
 b=Vx3cV+cbLNXCgLiZtNa+o3gHEKn7AqqL/Ap4gyuJrarrWmeXsR8ZkkZ4QUEngp3u95
 UcwrZG+/T+u86iS08W4ttLSKQtMl/1xin3cINjVPVgrW/gd4oJV35+nujfJXj5gTgAfw
 4PgxkuogS6gfy6cjwz/0YldQPSYOpVYoKpGR2PDra++fw2pJyH7Hp1NOoD9uDta6TCqS
 ZjANHAyeOF3+8gmt53LrVmN0k0/sJUjqt0AFKhaTw0PYT9PGgybGbXe4EZm60jBQ90wL
 lmM0iwN37IM7JYshVc0T3K4IpFSeBqWT1oIB6LW6js1ntcsEBi/63ye4mwx3jwRbAIBE
 Noww==
X-Gm-Message-State: AOAM533O5jc2yqz3Qc8otA+wob7O1TebnDvHd/1xJnBjjq5Qlc36T2nb
 /H8NNsFiSgVDRKTbAZXvaadYUOVEVxDJCbl7xmsJqA==
X-Google-Smtp-Source: ABdhPJw0TY8k6mLGDQKSpiTSydOSR3jb/VCtnFZ+EhA+xcwCeVMFa9ULPgzf8ayJZ7IWBMzjDkVyc8tdukz3VJj7DG4=
X-Received: by 2002:aa7:d296:: with SMTP id w22mr25748187edq.150.1616408970070; 
 Mon, 22 Mar 2021 03:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Mar 2021 15:59:18 +0530
Message-ID: <CAMty3ZAZ8yXPzCzpi5Oubd7XH+ckKPhw_-Ceh=1a_PdNF8xFCg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO
 optional
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 8:32 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The enable signal may not be controllable by the kernel. Make it
> optional.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
