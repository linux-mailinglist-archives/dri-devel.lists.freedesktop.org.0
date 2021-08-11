Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C43E8E63
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331C6E113;
	Wed, 11 Aug 2021 10:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2A16E113
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:19:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so2381270wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:references:in-reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=fWiOtp65j6ssZNxHyD2igKvxSIm1NT5hchkrDwQldjo=;
 b=O96KAHcNxTNxd5swvaYJFYgecRRmnkg1ErfKmZqvKytunrfC2SUlgDrX97TMX0KZFX
 QL+sjio9725fd5T055qVmuFLirlfbZUfoCOEDtPSmBiBw6msyIDDFQB0rw2lDXHBlcAT
 D1LmtS1Nmi8sRrzyOQiq8KanXZ9MGvlThbqDqOj5pv0eziNYQPNcFmP5kN2H58NBkEZ1
 dZyxtgVu1avxZsF1ipmb+E83uVKemFG7aCgMx7ISPO5jdf8FMQ/eVcySNU82rH1GIMIO
 ZvfQDXBZSUFqK9VV8t36pIbsyA/V0xop3fM9KGa3AbnpT7ZvSc+wWXahNr+wtB8VsubZ
 wn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:references
 :in-reply-to:user-agent:mime-version:content-transfer-encoding;
 bh=fWiOtp65j6ssZNxHyD2igKvxSIm1NT5hchkrDwQldjo=;
 b=CbEcqTy2KCU/iZakKv6VIGayd76FYF03quBgP1+4NDKjBsLxQnDqzXzGKiGEcMJb4A
 kzNUU2cRUXCcMA/vUsXo9AZHJ/bPYihjYJh5kLfMzSLHSo1U8ig5q7aUpXqk0lovMCxI
 kqJcVpt6E9E1xRYNQosnMPKRkU4wz5g4/JK6SqtQrWxDA9BEz7js2m7HZh5Q2mHB4U9i
 tyghlfS5O/hNdwDr3y5O2KCIVQdMsy1L3h0AWowCQ8a0G8RbNB9utleCPV5g1ecZBBoo
 brG7P4wuipaLCmt7W/DslwcEQ3d/UdTJFxQKH4/wq/wAR1qKguOQVmmRDbSDihEJKO/E
 hvIA==
X-Gm-Message-State: AOAM530zWh5xfFuClX+f5oG5GOaVrAwhg7kTe3u2WFrTbv3f5sqIOS8Q
 AVAUzEpz7aQ7rdwRM+Ljm9y9Rb7tNPCUcb1F
X-Google-Smtp-Source: ABdhPJzeiR8sGjDHAuhvI3N7c5gptKM/yGdTbXCyFvWPcrdFVRJxvHYHSpdi19Xuox06yYPJn1E22A==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr36122855wri.75.1628677196831; 
 Wed, 11 Aug 2021 03:19:56 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id c15sm26654619wrw.93.2021.08.11.03.19.56
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Wed, 11 Aug 2021 03:19:56 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Date: Wed, 11 Aug 2021 11:19:56 +0100
Message-ID: <1j87hgl0vgbns96eooqsmnqg0jar5b7hr6@4ax.com>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
In-Reply-To: <YRObs1/iDhgCbMo8@phenom.ffwll.local>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>On Tue, Aug 10, 2021 at 05:57:31PM +0100, John Cox wrote:
>> Hi all
>>=20
>> I am on a Raspberry Pi, I want to display fullscreen video and have a
>> couple of overlay planes to display controls / subtitles etc. The h/w
>> can certainly do this.  I need to be able to do this from a starting
>> point where X is running.
>>=20
>> I can successfully find X's output & crtc and grab that using
>> xcb_randr_create_lease and use that handle to display video. So far so
>> good.  But I also want to have overlay planes for subtitles etc.  The
>> handle I've got from the lease only seems to have a PRIMARY & a CURSOR
>> plane attached so I can't get anything there.
>
>I think X just gives you a legacy lease for the crtc, and the kernel
>automatically adds the primary plane and cursor plane (if they exist) to
>that lease. Unless X is patched to enable plane support and add those =
all
>explicitly to the lease I don't think there's a way for that.

Bother. So near and yet so far. Thanks for the info.

>For wayland this is still in the works, so might be good if you check
>there that your use-case is properly supported. Protocol MR is here:
>
>https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_request=
s/67

In overall protocol terms that doesn't seem so different from what X
does and I am far too inexperienced in Wayland / DRM to understand the
subtleties.  That MR seems to be done so is probably an inappropriate
place to ask - where would you recommend as an appropriate forum?

Many thanks

John Cox

>> How should I be going about getting some more planes to use for
>> overlays? Pointers to documentation / examples gratefully received - =
so
>> far my google-foo has failed to find anything that works.
>>=20
>> I'm sorry if this is the wrong place to ask, but if there is a better
>> place please say and I'll go there.
>>=20
>> Many thanks
>>=20
>> John Cox
