Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B032B396D
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 22:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D126E9DA;
	Sun, 15 Nov 2020 21:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2871C6E9DA
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:16:53 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h23so17788338ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ljg0Lh1Ep5cFex2wVS52wkjBHeB32pDeyPYh2JaQMI8=;
 b=ITD8sPq+pOyS9VcfPREEpaUZQyYZUwIzYfJkA76QGgbfFv1muUfH5FQKxhjJA1Gb2W
 4hv0kwwxwDETclJwR5cJ1ofnybf8BQFlFcHUyp/MWrGZMULL47MYTAgR1HNMDiJb0QCz
 T11UUM3DqT44EM7cT0uE+CkZP06CkJYJ5BLNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ljg0Lh1Ep5cFex2wVS52wkjBHeB32pDeyPYh2JaQMI8=;
 b=llw2GXsU54asSVsxBz/ZcpogkLkG6ab13OZNvUMcXxWmfP9bpCnJJ8F/Pcv3MWtJVM
 GrH2eqgDTtyMalUZKrT1u5H8yfUc/FuGHZmeN6+QSedUVb1WZJ2x3NaCSgUOWCQAjnYz
 es9bGJUSbKS7kmAYrHXhJAtTqrlASbP/vmKxUoOGNt8kzj9yb8oOSgLJmFiTqXokypSU
 EV6Xt0bG9wp09tJqsWcokme5N5o3RQRsSjOpN6fX5IuoPEDYlnVFrIFrmIPvKLtKn6OI
 /6+yAfMjxleZpx6u1FkTHCJ7ihrhqKzEBg+0kX6/4Cx4W1kXjie8pVneDWJDPt0pSE0D
 D8cQ==
X-Gm-Message-State: AOAM533T1a/ITnTO3h6Ewd4kKOh385uDs3CVW+Lg0RiihWQX4QeWmb3v
 JfWUrVFDRfzCTlQvbxzj3SMWE/bRoXO8xg==
X-Google-Smtp-Source: ABdhPJyVDWd2iGDl82PeV2FRie1NdAAKqlJZF+MD8eH0RXxuuBfh1gleHj7jDpvsWF7ttZ46CzX+gA==
X-Received: by 2002:a2e:958e:: with SMTP id w14mr5466468ljh.367.1605475011103; 
 Sun, 15 Nov 2020 13:16:51 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id s26sm2491746lji.31.2020.11.15.13.16.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 13:16:49 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id b17so17788302ljf.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:16:49 -0800 (PST)
X-Received: by 2002:a2e:8701:: with SMTP id m1mr4683644lji.314.1605475009199; 
 Sun, 15 Nov 2020 13:16:49 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
In-Reply-To: <CAPM=9ty9cBzR5tr8g2B7LE9+Hcf4NViHcyDcEHJMVgYmSoub1A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Nov 2020 13:16:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whs3Wqg=TCgnX0QC9nz+3Y-FybKNcnuY8JLdW6EC-LkXQ@mail.gmail.com>
Message-ID: <CAHk-=whs3Wqg=TCgnX0QC9nz+3Y-FybKNcnuY8JLdW6EC-LkXQ@mail.gmail.com>
Subject: Re: [git pull] drm nouveau urgent fixes for 5.10-rc4
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 12:41 PM Dave Airlie <airlied@gmail.com> wrote:
>
> As mentioned I did have a fixes pull from Ben from after I'd sent you
> out stuff, it contains the fix for the regression reported in the rc1
> thread along with two others.

Thanks, pulled,

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
