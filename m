Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445A3AD2B9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 21:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8F56EA67;
	Fri, 18 Jun 2021 19:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C296EA67
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 19:21:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a11so5267560lfg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUD8G36VdsiWC+n5lUqd4hu3Ex5au9XROzjkjPU2dP8=;
 b=IzJZ3MvKB72AkKG9jjEGQSnFkYIn542CcJXVkiQKpix92CvAx7y/WuuLAv1Xs+C+CX
 N854TOa+OWVSdHnNZ1CZNHPhCnywcx+Fpg6fZqC48LR00A5b/XYGCkqNPxpb07iiVaHC
 BfsKu6rMtqeej80nhcG2/Ff4I6EbShg+h+pamaBMxgpo1lo4ixx6Saw7Sk5XC+WFjle1
 amvUxVVh5mAWyAG2JMnG5qh5wJ0mFbAnc581SR4C2NLaXKMa153JSTw36/rnKVwYnrzO
 bFxt/Mr6ojNYUsHXp/4TkxorH+xHW0dgTh32YafQ5TbTXhznj8KfNdzzoWBoKnPuVhV6
 pXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUD8G36VdsiWC+n5lUqd4hu3Ex5au9XROzjkjPU2dP8=;
 b=OoHvJnQdVD4GrgsrlYEozJmM91/dpiSW2nrlArFep//0AKgEqoOmO9RtoS0PbST7ha
 dcUxa1O0QWrjfbIaKVQcQQ80X/OZQ2U5mrh54yFijYdcvT/wZlLiUp2Y2rgJo4CS0zsU
 3dlNrTVl5RJ9S172fH2Xg+v7b892NdRz8yUAXPN3emeUUHaUVqeDHm1EynhAsgBJ2h39
 vEmCHEJ/lxVCcXw0cI0HvFlOXrQt1gRRvk+ptj98HeIuX6iDYKQ4NTS6gkoIHX+95sxW
 dC5B5DkpXkRU+swX1IRPuVKTFxvLuPwOF9w8dPXU8SL2awHDtW2xjigcDwwY6AUOtkPG
 hxZw==
X-Gm-Message-State: AOAM532lfvXlD6ZzlWawCT6BdEn+bctKLq4/qjLnDkcrjsqDCne++Dnu
 tnqUCdsBsJTCplvKLTNOtZQ9mF6QRh+NSnItXl+QQJef
X-Google-Smtp-Source: ABdhPJyGIKidY1tG/LXuXRUf1mMo5ZxqEZVwQ9e0WaUYsuo2c8MfdNNalTrFIqThoXFLfBcSBo+JcxkC0f9t8j/xwRc=
X-Received: by 2002:a05:6512:3e0b:: with SMTP id
 i11mr4483889lfv.139.1624044068616; 
 Fri, 18 Jun 2021 12:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210618183524.590186-1-colin.king@canonical.com>
In-Reply-To: <20210618183524.590186-1-colin.king@canonical.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 18 Jun 2021 21:20:57 +0200
Message-ID: <CAMeQTsaEO_FVrC-X8GC765xDa=MQxd8Pwn2X1VPndhU5MYw20A@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/oaktrail_lvds: replace continue with break
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 8:35 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently a loop scans through the connector list checking
> for connectors that do not match a specific criteria. The
> use of the continue statement is a little unintuitive and
> can confuse static analysis checking.  Invert the criteria
> matching logic and use a break to terminate the loop once
> the first suitable connector has been found.
>
> Thanks to Patrik Jakobsson for explaining the original
> intent of the code and suggesting this change.

Applied to drm-misc-next

Thanks for the patch!
