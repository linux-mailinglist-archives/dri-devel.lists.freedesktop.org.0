Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FF199901
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625B6E840;
	Tue, 31 Mar 2020 14:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E16E840;
 Tue, 31 Mar 2020 14:54:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h15so26333637wrx.9;
 Tue, 31 Mar 2020 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HO6TrY5vHW3xCtXAgehmLHCRS7dfehnjLhFx26xMDoQ=;
 b=U1G7c6dIUiJdJNDBHMSSRHwSZ62lP7+ual3LVgEwKhursW1dC+ZfNBC4rLJVBTgXzp
 gGb+09depK86K4VS+NBP5cVoROKTuIr6D0JxZQjPKT0meNE/Gv/M7W9BhTjpZJvxqqGk
 DVJz/ZducLCzcG7pk/vZI1twZC/jkuVPFy8oMKFocfrF/rCp446+WKSK0EGa/NNaR8Yu
 /jGCXzmhszph91/K3p39NswbYsyy4SN8Wumcmbo09q0jdZUPVjHKn9dZDDKt0CIlqXPt
 3O79or2gzduI/i6BKYXP75mWMd3TvIgfLVY2aSkLTCMjm9puCJRj/ZHaBjbI3ezsi9m9
 NHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HO6TrY5vHW3xCtXAgehmLHCRS7dfehnjLhFx26xMDoQ=;
 b=jNKNokf600XbCAkqrxo5Gve/jnJ2ODlEDqbTsj6ed5KYlPFtEzrwxZzEkdbI+bJQif
 Xyn9is/Afwa8Aw+bkP/goFOyf4QQRh77nQfQKFZmypf0qP5xo7kdIR21n7vGiYe77yYq
 b4q1y+2NhTIY/V8nHlg0gkkt6CjsPz2vxPkvik/1bFZEKDNt1HZxNPwyfnAghRZFnHJX
 fajbZzzAy+2i8xmY3YLT4pWB5i8PLYjl5i0FFe+kF/FPdyQ7ToJ1Oce3jSS4MktCFBng
 JZKlUXbe0w+1q8hlVH0FC2ImlIp4solQ+j64cGpzJtQAO2YhjvnNWlzqJYWTxVZX22W/
 244w==
X-Gm-Message-State: ANhLgQ2r6QGRHndjOS9ghl9GVweScMfpQYYxOffxQRTK4QbY2sQQFXmY
 UYVdqoXPIFwzL2hzUQwBReCbtWj0rNR0xA6MYho=
X-Google-Smtp-Source: ADFU+vvPHEvkU5ZhiAKv+8P2j3np9aLNguMy5XOtTBfPRjaV1VagZhSS1Sw2OCRqF/o9dlJ3e5prEKanaJn5pIAVwEc=
X-Received: by 2002:adf:b35e:: with SMTP id k30mr20406573wrd.362.1585666454267; 
 Tue, 31 Mar 2020 07:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585651869.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1585651869.git.melissa.srw@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Mar 2020 10:54:03 -0400
Message-ID: <CADnq5_MBKBKFLFQBXHzLYGdY_d8rbiEcWQaEQi70tJHTGTcXqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amd/display: more code cleanup in the dc_link file
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Leo Li <sunpeng.li@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 6:55 AM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> These patches address many code style issues on dc_link for readability
> and cleaning up warnings. Change suggested by checkpatch.pl.
> Some issues remain and need some minor code refactoring for proper handling.
>
> Melissa Wen (4):
>   drm/amd/display: cleanup codestyle type BLOCK_COMMENT_STYLE on dc_link
>   drm/amd/display: codestyle cleanup on dc_link file until detect_dp
>     func
>   drm/amd/display: code cleanup on dc_link from is_same_edid to
>     get_ddc_line
>   drm/amd/display: code cleanup of dc_link file on func
>     dc_link_construct
>

Applied.  Thanks!

Alex

>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 358 +++++++++---------
>  1 file changed, 176 insertions(+), 182 deletions(-)
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
