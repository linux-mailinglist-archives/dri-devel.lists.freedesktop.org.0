Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF3555274
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC08113638;
	Wed, 22 Jun 2022 17:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5DA113638
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:33:14 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id b5so5391062vkp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmKHsZdPRGiaOboKuY/mo4XkvpE2D23JqAa330q0xWo=;
 b=NrTXiOAeCTvo4YBf1yI0NzjCi+nFT5Z6+7jspzfBDbBOQ6VW850aveHQwQ0m91gbPd
 7aa9cci3ZLZHellJNJsvvz45oBX9S1TqmoEKQv9pGDCOJSwLnFjNfa9htDpk+9rq+KQy
 GFU0EVwEFvIhJwtEMa05LzF/4HLoFe1BuEl/Un8josqC7bA5/GKDSPSspvUgqtZbHP7N
 LELW9MDpgo4IZ7u2sci+u8vhfguw5VeOCICri057zqQKQKJiRjZ+6ujkPov6kVmVpNPe
 uFW5akCo7ORvwwZkHTQAbuBcM9ZQPxvM9i9KZgeDIruhHQorP27xDa9341/utkLsOKNN
 S/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmKHsZdPRGiaOboKuY/mo4XkvpE2D23JqAa330q0xWo=;
 b=28bm4x7K5UwoNI259hn4miXgEXp4ml7jKVFKrDkHg/hhNBtN1bVhZpYXSqaIeLyZQ3
 dcVtGS20prMHMBME9W7kN7MV42KX8em3ujjKYHjb2QbrGAcyEOyEH4DnLBARYejxEsA+
 Xk2IeDUM90BMAWCREdPTMFmRXiKE5Qlo4i+CPPosx4msTR0zj6FJIg9Qz+hup4IrDa8/
 TqHQsO9jbjnW1rykFeC7maQKn1EuaUY8wPEHsAXJtmRLbsYwjwXOpClYst/0qNKu7B00
 3WEHkGCVKePy0+5XWhcdkMk6YHqFt/CSXIZxqbkPiBTkpHe98Dvh8AZqBnnvVd8tB9JE
 xHAQ==
X-Gm-Message-State: AJIora+cUm+XgXJLVdRtikvFhbUviiF2+0842KQaQvODd76vLWNGeSpx
 byIAxMrswgvbRzWE1aiaOaXPUASPNubUGHD1cMo=
X-Google-Smtp-Source: AGRyM1ukVdqxMk1wBcZ4Wd3LHOMQP8pJgTQZXp6+TgI7k7qLGoNvT+UfibfYyLnyTiD0yOtsNrWkDMTsYT71QSKo4JQ=
X-Received: by 2002:a05:6122:846:b0:36c:a68b:d3c4 with SMTP id
 6-20020a056122084600b0036ca68bd3c4mr930517vkk.24.1655919193537; Wed, 22 Jun
 2022 10:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
In-Reply-To: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 22 Jun 2022 11:33:02 -0600
Message-ID: <CAOCk7Npgc+OvvjfdiRORsGo5hB52vTevgLBO=ozREBR9krhuFw@mail.gmail.com>
Subject: Re: How do I gather up new code to be converted as patches?
To: Kevin Brace <kevinbrace@gmx.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generating a patch is "git format-patch".  This command operates on
commits in your local tree.  So you need to commit your changes to
your local tree.  The command for that is "git commit", and it works
on staged changes.  To stage changes, you need to "git add" them.
"git status" can help you visualize unstaged and staged changes.

So, if I had a change in foo.txt, I would likely use "git status" to
view that unstaged change.  Then I can stage it using "git add
foo.txt".  "git status" will then show that it is staged.  Finally, I
will do "git commit", which will ask for a commit text, and commit the
change to the tree.  I can then verify that the change is committed
using "git log".

Does that help you out, or did I misunderstand your situation?

-Jeff

On Wed, Jun 22, 2022 at 11:19 AM Kevin Brace <kevinbrace@gmx.com> wrote:
>
> Hi,
>
> I spent about 2 days trying to figure this out, but I guess not a lot of people do this, so I was not able to find a good example somewhere on the Internet.
> How to I use git to gather up new code to be converted to patches?
> Specifically, I have 20+ new files in one location (drivers/gpu/drm/via) and a small change to DRM main make file (drivers/gpu/drm/Makefile).
> If someone can tell me how to do this, I will post the work on dri-devel.
>
> Regards,
>
> Kevin Brace
> Brace Computer Laboratory blog
> https://bracecomputerlab.com
