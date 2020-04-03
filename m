Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E319DCEC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB6C6EC4A;
	Fri,  3 Apr 2020 17:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8CD6EC4B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:39:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h6so1986405lfc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xm3h63S+wy2V6J3PuBOEYKR3SGB7cQ4H+NMzie4gOm4=;
 b=qkEEQ+kOeT094DmrstApTK3urHaRrdg0wPhms+l3dVaC/eDYZvQWQe1zHBoDBxOMus
 ftVEYlnL97EokmBxUexYHwociFTmeZTipSu6NqilDvRdXIS8thhB4MNM3yJ/GD2+e1f8
 b0kX+t0SmOxzzw3eP7WCDje30UCMQxAMcB3NIo1AFQFJYAehUVAd0O2aRH4hTrrE7OvJ
 qdGrML21lLGCx5K5eQ9BsLgEDI/INxdj/b4MjCp/DCdwyHPGyoE3dacIOoR9c2Czkets
 ckKvagdQ1OirTFRqRqs8DJitCdJAqocYLdQtVYyil6lR77W7QLMSNKugxz2f1eju8CIU
 ELxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xm3h63S+wy2V6J3PuBOEYKR3SGB7cQ4H+NMzie4gOm4=;
 b=sdVzhATiwZuJ+wED30eo8iPkwHwV4EqAtvK5MeUnCuVmzSXHTPxpHMIaX05iZwdda2
 noTJJqSewfsXeavSEYL/QRnUcV1AEbCznkKpbHwuvLHgakTxaNSZG/bHwNQd8khRmGQS
 3tvCNyVyiJoZxq9zUjgxbGAIK9FILBwshPOcHBEjaoBA2SFHwdXoCbvBuB97NY+oPyBc
 IPk50uZYL7tzibodUhxVZisZK/RH5j0k9n7kNMVK5j/U7yfPjnMNNp5vsYBnZ5LzIO4a
 UOEcw8QnWfBXYinYzUHIcQAs9slfHvoPR03TnneU3MxtgPwyJdJJ6Q3tDBIwbUJPLFO8
 rfig==
X-Gm-Message-State: AGi0PubzlN9z27Wif4ePTq+XxMGHGwYOtd2NUSUYz6oGV2ANJsp8mHUU
 QN1ZRh5AQiRnMAp+mUO86birNls+bIuEs2eqjUfq7MOj
X-Google-Smtp-Source: APiQypKSOaZnqjlg4pH549zfiq27o1aXKr8aZEVO3PsF7fPCPBNyDg/zyo2MFvpM8lQfNVVf7ATlDSUgvL+8HzLGtcI=
X-Received: by 2002:a19:7615:: with SMTP id c21mr6000023lff.24.1585935570921; 
 Fri, 03 Apr 2020 10:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-12-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-12-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:39:19 -0700
Message-ID: <CADaigPVhiPLYkCAoD8=afH5gr5T=ZJigMEDyjJv6sJCkJizpVA@mail.gmail.com>
Subject: Re: [PATCH 11/44] drm/v3d: Don't set drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 6:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> And switch the helper over to container_of, which is a bunch faster
> than chasing a pointer. Plus allows gcc to see through this maze.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
