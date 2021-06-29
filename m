Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1F3B7384
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 15:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA546E827;
	Tue, 29 Jun 2021 13:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98326E827
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 13:52:50 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so20946556otk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsXocT5Hmatf7Da+fyMEMecXeiCOHIu5BhHB2xJ6T+Q=;
 b=lKLw/E9X9rVaq3C01Dan+til4OCXHN2BJK5+sWgx6uyBCqIndafmPwoNq3NxTDGXlI
 xtKeDhFVxMEpt4BEDvZW6/i85ss//9s3y2zfgNPgdE4aELnKweI4Wb/P0SKjae2G1Rlz
 olfuGmnLqmYUFMYoD1X1tShSyrGVagSr7f1Q5DCQbTd/kju3enXn+lRYaMtvHncziHLH
 3pidI5ooTJGI91jmHpX6N5g3vq6z17KWR9KJ66F/06u9qJVodhCxFEgjHX6vh21g5z2T
 ijDALyT3j6sLVn1WY0DJNnDSIHHKqsCDYMmXxKB9URfkoGZlSGrskAZwp/gYP/WOrsZU
 GDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsXocT5Hmatf7Da+fyMEMecXeiCOHIu5BhHB2xJ6T+Q=;
 b=sE96Nf9OVphbLF42Xv/Kw/TVKhVCic+5nIeerK1dlUjpvVJbGcQm4iEHgEmWnWcTpH
 vBlvI1FnvZnhbdifTz1JVqdBfvHo+ubPZbSBn9+Lp2gIS1pNVjQyOYcpl4qscdW6hLEf
 a18304F1xIub6Q5erVZ68piolmuoYa7s4MrXy0G1kN0cFOY/1mD7YIw2FKTxpnpBSY+c
 aYMB9ru9gayxsnVOUB5NeY0mNCLOiWxveI8cx8KTbQXOcNwjQojyrNjWu1MK619AqSQm
 uAu8WAti799Vt+bL+TCOewDUvysm7a66ZOpce8pQj5XE8eVM8QMXrIpW+2jBF2fdxZPL
 TPGg==
X-Gm-Message-State: AOAM530e+xPLrVOVUgPknLVjrZ9V64CBBf2PduTUtlLne3ZDmzJsYAnQ
 ApjgxDvl+ui+TxpRJUCe9XEh9A2bg8LX+BW6nSw=
X-Google-Smtp-Source: ABdhPJzG20iclvGuf0398RpUEN6Q6s4ThStAupIlz773rV0DXwrnKSbf0+aH9j/oXNEFssyHd3r3mmWbnPFSTyldkM0=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr4484375otr.23.1624974770259; 
 Tue, 29 Jun 2021 06:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsV3ysM+p_HAq+LgOe4db09e+zRtvELHUQzCjF8FVE2UF+3Ow@mail.gmail.com>
In-Reply-To: <CAGsV3ysM+p_HAq+LgOe4db09e+zRtvELHUQzCjF8FVE2UF+3Ow@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Jun 2021 09:52:39 -0400
Message-ID: <CADnq5_NxVN6FNMEJ7ctAVyvR3iEasx+FrTk+=--EwyN86kxnhg@mail.gmail.com>
Subject: Re:
To: shashank singh <shashanksingh819@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, please see this page for more information:
https://www.x.org/wiki/XorgEVoC/

Alex

On Mon, Jun 21, 2021 at 2:26 PM shashank singh
<shashanksingh819@gmail.com> wrote:
>
> Hello everyone, my name is Shashank Singh. I hope this is the right platform to reach out to the 'X.org' community. I was curious about the X.org Endless Vacation of Code. Is this program still active?
>
>
