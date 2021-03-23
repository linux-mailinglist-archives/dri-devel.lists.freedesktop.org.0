Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D385F346928
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8A6E955;
	Tue, 23 Mar 2021 19:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EF86E954
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:34:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u9so29020365ejj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ctyMQXwW8Si4WKssAD3WLrmn8iThPGDJpH0JtXzOq+Q=;
 b=TA45xphbVIhblUSgyWClKP/2SRmzExH5faiKm04FJahhGcg9DJbnH5TYR0uyMtrTLQ
 U1xabMP/dTtd1cQsI5aq8Pews9dFvmFOFobmRHN7u8qTHCltP3NuC2/zvPipxtsxwYK7
 IdrKi0N6zpvUXeakMwv9fxzX51k5MyAwuhh0QhUFJrfF/qnELyCe5W8aRCGpUVIv/PC/
 8SuPvohq4+RteYiJq16diOuKnGAnys6gbO8INVsSL6wrmQnPNS1uV/DRld/vLnbBGKKO
 qbxsZveA07D0WlLFNxnvxE0kC7MC6hi8hYxedlfFcTw/l/dpbSoZDBusk/0yZD8PPxbi
 El6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctyMQXwW8Si4WKssAD3WLrmn8iThPGDJpH0JtXzOq+Q=;
 b=SxN2ct0VPE0i+C9Ho/0lFpE5Mfyv/HTRvopPxYEhv5VqXBTUKBxApmzpBWkebRMET1
 PmtiOfbjo640XwngFUGcLsLAMzRWetb3olQhGTTf2vbakJ9Fae4FL6onxFt/HeLtrR2H
 H1Fy3dxzE8kJFx659U5PE4CQLYIU1pAhSqEx9eBRnd+XlO20gOaP4YEYrLMsGncKpqKp
 3raQLxCX+xQtWzb2I5Ff4ly2v64gRsfjf9gLUEUqh6WxcfMt94s32f90ARHY0k4t/Kz+
 hj9TAywqdK+1hhMQNhf30MjyUztbvaMybe1Ny6/C/wVJ2xPv93k3IQEq6E0n25VmdDMT
 ymkA==
X-Gm-Message-State: AOAM5313m9h6g7x+c4Ah7ZqttDFSa51Vjdh5btllLEr5ZjmTbFBmcTkb
 KWxo0Ba3Swvsr/q5cXBWwwNIyLQ33H+xVkiKeKh82+tMyFo=
X-Google-Smtp-Source: ABdhPJysxXviH9ICs5WBv3CpWFtQzmZPvPvo/ftk9aWeFJ+Avw7ttZQJ0Pr93fNLP/+erwmwruAI0LbREP2FyDvStEI=
X-Received: by 2002:a17:906:23e9:: with SMTP id
 j9mr6239218ejg.78.1616528088882; 
 Tue, 23 Mar 2021 12:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-4-jason@jlekstrand.net>
 <CAOFGe96L3Bc-hZbh+mH8Hz8EEbxDKMO+6xmX5EU3H5-auP8_wA@mail.gmail.com>
 <hyCtqDEpMZuIrQY210jTEgTokrX7YaWPrBpDPfL2vewIa_7sU7k0gNte9qmLcrLyHgTKD7nuXlnH9uCJc9jy9JqdxksgZVA-Vt6GldA1yPM=@emersion.fr>
In-Reply-To: <hyCtqDEpMZuIrQY210jTEgTokrX7YaWPrBpDPfL2vewIa_7sU7k0gNte9qmLcrLyHgTKD7nuXlnH9uCJc9jy9JqdxksgZVA-Vt6GldA1yPM=@emersion.fr>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 14:34:37 -0500
Message-ID: <CAOFGe96Nyq_6B_4i1wNPNX2HrPpezV4joB3Zbvkkzn-NutdWTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dma-buf: Add an API for exporting sync files (v8)
To: Simon Ser <contact@emersion.fr>
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
Cc: ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 2:06 PM Simon Ser <contact@emersion.fr> wrote:
>
> From a user-space point-of-view, this looks super useful! The uAPI sounds
> good to me.
>
> Acked-by: Simon Ser <contact@emersion.fr>
>
> Would be nice to have some short docs as well. Here's an example of a
> patch adding some docs for an ioctl [1], if you aren't familiar with
> that. I think just some basic stuff (description, which parameters are
> in/out, what the flags are) would be great.

Good call.  v9 will have docs.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
