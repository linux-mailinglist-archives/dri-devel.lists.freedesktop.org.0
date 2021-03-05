Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A8932F635
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7096E3FC;
	Fri,  5 Mar 2021 22:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173D6E3FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:59:09 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id q17so868404vkd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4GG9P7Gv4wEkE5Uf+mXbbM7VCo3Or+dEnI7LfJvA2vc=;
 b=ZnpjFQJydtDpBBOvSh7VHo3uuFRqyQhJ1XDRoWgx1qBB3NT2hFJOhTh4HEXRq0gznZ
 cUqwW7AnritWXiVvnSjrf1qbsmRtogCW+srDa1eR3pkmH069vDUe4njBEnMZCXEKnjkd
 SzEVURftI9kdPNzorherrUItOBR2jEADx/nu29rYQxt1IqkwxNjwsNbzV6Br7HeTRtte
 /XFqmdN2RfNUTvYgUtFDIf2Bu7yseUiFoSLgy/5X+IWZTZfkFDUQ7Pc8f4OazOSkNQGu
 E8NrM0gqMe2Zp5AJuLBgG0Z+VOijd2q3zIQU2sqLWO+nztTERgr5gbNjLI4IrHdgWNyW
 hjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GG9P7Gv4wEkE5Uf+mXbbM7VCo3Or+dEnI7LfJvA2vc=;
 b=Q4fA1Y544W2VZuT9jah1lsmeBEwCeMCgPLQ3+Z/p0leOywZH5hcCXJ8f9E5CAPFIrs
 OJZGRzNQGLjiCxRWccQzmsSeYaFPjZh6xVSp9xQoPFbtNyQ5vDBHgXwOjzUpRyNhKRLa
 S1bsz4QNWN46GyJ99VS0VanjJaY3ICCvQf12M6Xn4jiQKvo5/dtY341dq4zeyeCyzJlY
 lchtSSqhYIOYtX2dAOI3d6W8XSAZDJLe9ynchDqB7L65eUiG2ENMraIKaC22pvieKCFN
 MZFWCD08AAwaEsZJ7KKu0Nqos21wmJGs/KQ4fRDGzFuT4RM6J+IE7lBO/quxtvrMN8X8
 cemA==
X-Gm-Message-State: AOAM530CNZ9JJdC77rInX11IgrSqbxIfPLntDBJ2dimvSaernizCcK79
 dtZOGgzPEza3v0mOTWElEA9y/9Pjo+ZozGXFOP23qkTrRlk=
X-Google-Smtp-Source: ABdhPJzIn98Nti4nDp50jc/Wfi3uXYuPG0T96JWubQa8fmDmcuFBq2GpMsQnJJmprY2ft4vnv5lmYnVJ5GJbGyCaHbo=
X-Received: by 2002:a1f:a916:: with SMTP id s22mr8012376vke.17.1614985148875; 
 Fri, 05 Mar 2021 14:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Mar 2021 22:58:57 +0000
Message-ID: <CACvgo53RRZW4Ow34ghqoQPQhV-pmKJtkS_g68+1LkhFV9PjvKg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Microship SAMA5D4 VPU support et al
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: kernel@collabora.com, Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems like I messed up the to line and this ended in the wrong list.

Apologies for the noise o/
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
