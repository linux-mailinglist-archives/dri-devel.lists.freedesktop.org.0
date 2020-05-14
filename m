Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A01D2BA5
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 11:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB876E2ED;
	Thu, 14 May 2020 09:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA126E2ED
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:42:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j5so3047680wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZiEC2K23zLMT8KRL68tkPRKohIVJ9CsA9MsK8lB52g=;
 b=zSA3ckhFAgCkmUWtR8IF6mxcg60OeB44Ll1Lfl7HPoMWw0SUrWBxgSpx4Aa/TYl+VC
 YTR20HmdXw/o3OLip2YP1HC+nrEmPsyVpcmzVf9Rflp+dHh6LuTSUM1PEKWLvDAg1p2A
 M0ajz1+vO4tN04PqOTphFUxbpxDLULAoYF9aDAiKsKBxageAX2w1IACsojl0AXHAIe6U
 w5zttAzUqgAnWvHCNe1ZP8qnGrhZhtKHlkNXVOscC0xUhSRZUNKEoV6TxGHQM8BxOwgZ
 T1QM564xos56MUtsQqbp5LnoRgdwURADaD4NxQ4UM5YiNRFQ3fgdu4huZoVziiF9uklq
 LdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZiEC2K23zLMT8KRL68tkPRKohIVJ9CsA9MsK8lB52g=;
 b=TA930bjxViIVZC9QRXmqAITi3hy5DI39LvwtYekX/tzL9lqVKdNmRhYIuPypnUGUhV
 bmfyunOe6RBQvnejhp4QAkvAES1Irn4N1OOTMcCTFEdJ6o9WQrD3Y/3RHQg5DhRHrbIk
 Lq/cCOHVTRryUalHsUTcFkJrjwvKe+160hWA+vuYWjNm8n4p2TTZpLWLdty4I+Qdc3sQ
 mQeemuuMonUvkBsaR2GcI3tPmWay8Ve1yXp+GuUXB49H8yv3zLeGwq3yyrboMtxj5roZ
 CzO+puovcDiA1YBGTBPPTTe4nMpwo6RIYesGRneE3eNSr+CIhncZcez4Mi39NPg9NsW4
 dUgg==
X-Gm-Message-State: AOAM532eSDwCAG0TOeOqKspSq5H8YQqdzxOVBmpg1s7GBrytUn86dDEa
 n+eRmfouz9Ke242Ef7mjei3sRNGeU8nLgwvj0HVZGQ==
X-Google-Smtp-Source: ABdhPJyQU4+w/M7rlpEiA7nQy/vxeqxavGw8m8A1PsvMhf0bO07lAqD1CJUFd5k5voUwLVhi67zXnfMz7vyVSA2y6HI=
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr4399816wrw.256.1589449339465; 
 Thu, 14 May 2020 02:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200430212951.3902-1-alexander.deucher@amd.com>
In-Reply-To: <20200430212951.3902-1-alexander.deucher@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 May 2020 10:40:41 +0100
Message-ID: <CAPj87rM6nvr-pspfz9PaPiV9kkSM+=rh_YMaPXqaBZv37Yc-Yw@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.8
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Thu, 30 Apr 2020 at 22:30, Alex Deucher <alexdeucher@gmail.com> wrote:
> UAPI:
> - Add amdgpu UAPI for encrypted GPU memory
>   Used by: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4401

Did this ever go through uAPI review? It's been pushed to the kernel
before Mesa review was complete. Even then, Mesa only uses it when
behind a magic environment variable, rather than through the EGL
extensions which have been specifically designed for protected content
(EGL_EXT_protected_content, protected_surface, etc). The winsys
usecase was based on a Wayland system which seems like it will only
work when composition bypass is available - not using any of the
Wayland protected-content extensions, and it's completely unclear what
will happen if composition bypass can't actually be achieved.

I don't think this should be landing before all those open questions
have been answered. We're trying to come up with a good and coherent
story for handling protected content, and I'd rather not see AMD
landing its own uAPI which might completely contradict that.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
