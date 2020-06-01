Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C154E1EAFD3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 21:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D516E0E2;
	Mon,  1 Jun 2020 19:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A956E0E2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 19:52:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id d128so752395wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icz4DhroSxIw3ZHRX8bsgvBYuYqjnqk13CNpHuTP/iI=;
 b=HuVVQ++9Jw8LLRVlKIcT0kpd9NzPIAdPYSOgD+DJ2mwEX2L/4o1J0wcMtRcDWvUGm2
 D+S8ASsKBcVOo+rODwuq0QpTDG0ttwX3UDm7Rx1dwWtrzav6p50j/rciQwwF7uOH6sHU
 zJp49ckzece4pJfhTOkp27OKgMU4YJftM0MIerp0N4s/u+ayK/Tfcgy5Wh2DCKfske60
 wzqZbs50OojjPVVPKSplZXmL4OhHg2FVVWEy9w9EHU0WjWsUzTZPzgtRqJBanYK9qYTH
 5IAluYNBYRZyZ4q11bKW1NITzfsFH0K4dgM9yVk9Vu20uTJsL1Cs0oAux9o3VLpIYPG1
 F5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icz4DhroSxIw3ZHRX8bsgvBYuYqjnqk13CNpHuTP/iI=;
 b=irFpTxQe/R0xl3MU27xsN4MToLXqJJ9aG+jMbkTYkqwukIRGCFeqoVm0bMzLjTToW3
 Fm/nBpqW3JjPTTG95o1xD3GU+ogdZHL721qoeSoMZ47MYpvHIkEInwrutZX+K83/Lv3e
 vsdAx5ZRaqLzBZx7kZzyDjdyh6ILIZL3aqwrCLJBaeCY3lxLHBIAx5Pu9AeURXrdTXK+
 ZwsLxRfkRGFcII935ES+TIIppCfEQfPi/4OzmR+bpH5b933f6zbtWs4AqqUIovZ97jRH
 vYEesh1jCmVP9Sma1VcOf19q2FXuDNiJHXb0SLS7HDeuAEjypy68F/xC0t1uYJnenkJR
 cO3g==
X-Gm-Message-State: AOAM533CNxLda1ZX4lLxGACEh0jyFgj4xc9yVqHCCAgJrxcuYbSP9g3I
 M4wgknuZapQnt6s6WHpczzsettQ2rt3a3X4n84F2lQ==
X-Google-Smtp-Source: ABdhPJywe13c/SqOc97cm/sQDL3iMchdL6G/rendVjxorutyhA71zdTKkQPVVo7yquYvUk1Yx3rbAyJ08nr8o9kk/mw=
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr788164wmp.73.1591041124878; 
 Mon, 01 Jun 2020 12:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200601114925.GA1626@freedom>
In-Reply-To: <20200601114925.GA1626@freedom>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jun 2020 15:51:53 -0400
Message-ID: <CADnq5_OwF7PRqCrPmAYJzxLG-Hv80z4Jv0JaDPMqS3mxqra5FQ@mail.gmail.com>
Subject: Re: [BUG][AMD tahiti xt][amdgpu] broken dpm
To: Sylvain Bertrand <sylvain.bertrand@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 1, 2020 at 7:49 AM <sylvain.bertrand@gmail.com> wrote:
>
> Hi,
>
> updated my amd-staging-drm-next branch yesterday: the GPU fans do not reduce
> their rpm anymore. I checked the kernel log (attached) and I noticed:
>
> [drm:0xffffffffa036d50d] *ERROR* si_set_sw_state failed
>
> Is the fix already known or shall I start to bisect? (no rebase on linux master:
> should not be hell)

Bisect please.  I don't think anyone has touched the SI code in ages.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
