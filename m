Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2047C8EB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 22:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979EF10E123;
	Tue, 21 Dec 2021 21:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C096910E123
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 21:56:34 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x15so685240edv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 13:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qWTA94Np+UAHIHJzUybgOK8ypxF1knoni2jNiTa8kPA=;
 b=Xwql8p7Ec2pXSICewdY+d/SvJVm/1fEyxYETSauEwK2gFOqh5QSGp+2QmE9WvurNZ1
 h+3MtxNOHa2TTnBUDq0lnMxW16A4cdykV1PO+TtWEhWSUPMxJvypOWSTlSu5j7oCsw9J
 KBYU4o5K1mhH+T5GXyGVnrYDXdUBdHhihbYJn4Qq1gVvPUHzLZu8ljS8Am8qs0cCGuSc
 +qL9BQYnhUJQNkxJf249kXF6C+ET8FRQArH3mPvxEtk5Evd/H3dDlEbN7fZe8iH95leV
 HwJgTYCjyTWHJnEfxYqRSWstdU1FbJ3hjbOjnTsu1oBh77Mf+WYf7Tz42LyOlFrc6M5E
 iLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qWTA94Np+UAHIHJzUybgOK8ypxF1knoni2jNiTa8kPA=;
 b=SxSMIRpHOtUbNc4oQF4Jn7EvUC7uwr7FbpY/8+wZOEnc4yp/LFi8whQZDfGrdqZGnH
 38qq3VQHQFDwEOd9VCcRt0T4wbNl8vo6RLUJZltKQ6VEDqZ7KuU+QJdbmYgwKB36iKgM
 t+EscCb9U5TT8UL2PzGorONaj8vVb2rhRmbzQp60j6bPpMaoDGhpAxI235d8udk1Oeqg
 UwW6ikKJ9oE3BS74FZKFJL99cRoir3r25TMw4j2nGdsdsk8KndVgkpab6J8szzmYuWkp
 xcuVcaPEhE0EAg0PvHYpJfd6W4h/uZFS/MUkg9b4CyH6n8KXjzzox1V3ImTB5vbUeeoH
 Prsw==
X-Gm-Message-State: AOAM531MnIE54/VmTig+AT5DBBlynw3Wcqd8bTWZX7RPNqja/sJ+MaUv
 QOuEojLjNkqjk/kXnptLo4Rh8QXFtLVazBeXO7ylowth
X-Google-Smtp-Source: ABdhPJxHwpJfh/3BHKRB70DIZ7buc6pi8NyYS27+nx91AL4SxPy7hyLfPXf2pw/0OP0MlufXIS5tPRUqFr+baSqmuyY=
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr237818ejc.66.1640123793252; 
 Tue, 21 Dec 2021 13:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
 <b24ec0fd-9010-ef6c-ea86-c4455f86a977@suse.de>
In-Reply-To: <b24ec0fd-9010-ef6c-ea86-c4455f86a977@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 22 Dec 2021 07:56:22 +1000
Message-ID: <CAPM=9tymNcdq+midqxNJL3Tfhb_yKrE2sa65hZ1zWSnmhWnGVA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Egbert Eich <eich@suse.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 Dave Airlie <airlied@redhat.com>, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Nov 2020 at 17:57, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 30.10.20 um 08:42 schrieb KuoHsiang Chou:
> > [New] Create the setting for 1600x900 @60Hz refresh rate
> >       by 108MHz pixel-clock.
> >
> > Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> I'll add your patch to drm-misc-next.
>
> As Sam mentioned, you should use scripts/get_maintainers.pl to retrieve
> the relevant people. These include those in MAINTAINERS, but also
> developers that have previously worked on the code.

We are seeing a possible report of a regression on an ast2600 server
with this patch.

I haven't ascertained that reverting it fixes it for the customer yet,
but this is a heads up in case anyone else has seen issues.

Dave.
