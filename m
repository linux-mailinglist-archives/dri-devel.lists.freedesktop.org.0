Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49042D013
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 03:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57986E140;
	Thu, 14 Oct 2021 01:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C966E133;
 Thu, 14 Oct 2021 01:50:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id a25so17797509edx.8;
 Wed, 13 Oct 2021 18:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RvGlhpBdoSGJY07qYcoxstqzyNYso35hmP1TDGV1z4g=;
 b=qW7ab3idrM55I9OTL3GrIElKPjaIhew6Sc2swiQ6z3GGZKZ4sKwc2EqCtfffUBIuP2
 lu+mEDP7PGOk4oRy+JqxFefJ2QzgDXSAIjVXwWwi9acizduRC1ULUfqzHa/jDrFxXnjY
 HaJ21105BgM5/bbpbpSpfx8WE9oUIbivL6aCQN1cr3929S68TjS7GCrpoHkSbxOWvwLi
 iCOWUpMpzqFS7+BQmcbssEO+A55PCO/zYSWnkiTRNWSfCtHL4s4f7DkFgudaVkZmKWa3
 X1f5wAoIUR7UHNOX1YVW2fIu1Fj01rl/wZM7/Ywxy7jVzCgfrKBY5a0ByGRFhv4ki5RM
 MuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RvGlhpBdoSGJY07qYcoxstqzyNYso35hmP1TDGV1z4g=;
 b=56gI2AAErcGQB27ZKJvTKrjNvn0+cSx7h40zYoU05WWvz+R5+TPVXdsB+/zo2HkfHB
 lkFJ5wm+sIkpXCCrDGrNiVQFhEzQy9JAtr7xAeF7DXMKo0LNlm0m7mAhBZLMwF4jmXEG
 kYe7f2ZM1KTQu1WT1dnf/jETILbJqIgGwILuWp8TBE/R6ds9sbmYV56GL8pjpoG9ql9x
 fmh81vsDjJZ/OBJ1FRdknBWN4I5N+Aa1ELdA4t7JBV2+iFUo6klQ2OApemHH7TmwcJlr
 xo8jYskNatwqCW62LyAmILOKsiJF8CaVpquMxK8Hczx52VmxWzXJvs5uYe1Y3I1Ad+p6
 8DPA==
X-Gm-Message-State: AOAM531k7z41hdzr56ctN3ZXeQs+Rywo4H2vPfS8anxsNLRGibo4IQYB
 /YcAzWaIwKDXtjm/F2U6IrcZqh34gvstHclgSqg=
X-Google-Smtp-Source: ABdhPJwi11719SRkCOiPMN/Zte43zfyvEqn21jnxMF2BYaxtGXJQ0gXaDA9Di8A1LyGOWtBSYOvYWwqvz7DYVGycrOA=
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr4491032edx.371.1634176228758; 
 Wed, 13 Oct 2021 18:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 14 Oct 2021 11:50:17 +1000
Message-ID: <CAPM=9tzt3wr5=ZdDGqH6TTOpKqp_-Wbxw+LBMK=f3Nm=og_14Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/i915: Failsafe migration blits
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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

On Fri, 8 Oct 2021 at 23:36, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> This patch series introduces failsafe migration blits.
> The reason for this seemingly strange concept is that if the initial
> clearing or readback of LMEM fails for some reason, and we then set up
> either GPU- or CPU ptes to the allocated LMEM, we can expose old
> contents from other clients.

Can we enumerate "for some reason" here?

This feels like "security" with no defined threat model. Maybe if the
cover letter contains more details on the threat model it would make
more sense.

Dave.
