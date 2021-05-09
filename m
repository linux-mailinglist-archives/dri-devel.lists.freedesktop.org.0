Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85CC377923
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 01:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C2E6E827;
	Sun,  9 May 2021 23:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8F46E826
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 23:09:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h4so20675095lfv.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HryItA4coMkjpOZKlKo3aOfyK4XROBbdrwaFRct8Luk=;
 b=r5niu2bTbgHYtMgqm/CjDWcSF7uyQ2N3qNb1HASF4DB6QN9VcF508C5kqOULt9xX/a
 3qc0c56Lf3djrMUiwRXXsoiWyFx9jaGwmXcWRqOjCcoCvriDZUjFXBMB59aBp2Jzx7oe
 X05iiinLS7MalFdbXTUSq8j7IaoNxdnGQoycxX5wPI38auwuevue/NdfNoJnudPMQhA8
 oX5+B8EBFumMPhT4pwC9dSBos4GwADHa77T9xVbQp97ZhkTh1m69zvHv8+1O15keUaZD
 Poj68g2covuFTLmJ55htas23Q3Bx1L/X2s+bph0Gub/xuJ2blp00OUouR/WG05I64b5U
 TDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HryItA4coMkjpOZKlKo3aOfyK4XROBbdrwaFRct8Luk=;
 b=hnoLrk0EG5HEiVvLgaSiTNkm1c25Nia+Gv1B3+LvW+lW7SSJevitpYSiYzGhwSqNXe
 0StuJd4NpUekbrDaV7vmSHTpnHm07p70dOMRchB+YkNbDJCPXK1aQQBXNkbMxXb/7msz
 h9jes4utn5RPEYl5pCj59YoRzMdkv5PprkHJY9oxYO8KbVyPzIvYx41ekrXxqSkwBBVR
 mG/zBDKW8e92VStUqKCPK4CAlonPTnKINOZWhPoOFjr2bVEDpCp+pDcEtMDPiIOXyt72
 0u7flSdKcZvrJURuHfLaXcTxzSJ9JrVu+D2Efi6ixuXTy1zjIBcDw3tLioP320oV3xAA
 gaNg==
X-Gm-Message-State: AOAM5327pfUtoAi/OpMmNURn7vZcdltcuycGnpGmcRIEPo1SydpjaoEC
 AUT0mbYhk2pYk0RI+qnwoKAamD76p/rMUgwr2KTNuA==
X-Google-Smtp-Source: ABdhPJxCgvtXHdB87e+oHbNT6MEV3dvIxpJhyGPOZCG48HThIgo2B7szXe7E1QESBgv4BnnqRxRiFVPlnq4hTEl3aOg=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr14579686lfn.465.1620601778288; 
 Sun, 09 May 2021 16:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210313230913.4108256-1-linus.walleij@linaro.org>
In-Reply-To: <20210313230913.4108256-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 May 2021 01:09:27 +0200
Message-ID: <CACRpkdapqaiTNENz-s5bGB-6JLb7MzZR6ffVOso9Ds5_qwh+5g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: s6e63m0: Depromote debug prints
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 14, 2021 at 12:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> The dev_info():s in the DSI driver are very talkative,
> depromote these to dev_dbg().
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Could someone show mercy on this patch and apply
it? Pretty please. Patch reviews offered in return.

Yours,
Linus Walleij
