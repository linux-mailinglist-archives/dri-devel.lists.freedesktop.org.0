Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA45558905
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 21:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836E510E16D;
	Thu, 23 Jun 2022 19:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jun 2022 19:35:00 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68C210E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656012899;
 bh=NLr4QQItGZZpC1mnHq3DuBmIXV4dBUG1F6ixYh6SwcE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PifycxSBXH+fi+iZS1bFuJFuwns9/zH0m/OMvCUgeZOMe0hwm7MjOXKUm+eqK+o+T
 mni4fa5rNbTeLJiojGIO9WbtqOT+38BWSum+BHe9vpd1f4BXo4inBDl3jMypXX9Fe1
 Vvry7E4ksdbPKS+hCScQU0tv3Z1NSsfI4vw9isSU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [174.250.50.2] ([174.250.50.2]) by web-mail.gmx.net
 (3c-app-mailcom-bs02.server.lan [172.19.170.129]) (via HTTP); Thu, 23 Jun
 2022 21:29:54 +0200
MIME-Version: 1.0
Message-ID: <trinity-32be87d2-7993-495f-8970-62f4b01b86c1-1656012594269@3c-app-mailcom-bs02>
From: Kevin Brace <kevinbrace@gmx.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: How do I gather up new code to be converted as patches?
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jun 2022 21:29:54 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAOCk7Npgc+OvvjfdiRORsGo5hB52vTevgLBO=ozREBR9krhuFw@mail.gmail.com>
References: <trinity-356e941b-2ee3-4974-944b-5495ba4d00b8-1655918337996@3c-app-mailcom-bs16>
 <CAOCk7Npgc+OvvjfdiRORsGo5hB52vTevgLBO=ozREBR9krhuFw@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:XXYN+kynGkAK6JjC99ZcZv9gAbF/hyzU2LhDZ0axFYli+0/buwdcpy67XH99A2lIxwbrN
 QspKI0xBxUVuwA690eSArff3woLiw3dXIL23bDcluG/ig9rrPRTw7I8fjMVHkOgVmuHvx93ixqmW
 /flJCr1icSdprp3L3+Ou89Vys+kEU5KJfBW1xLADQSr0ipb8971APHBUw1CwiB/X5VYi/wfIYVVt
 mY13EwsqVwLoubW9CdEkfatV+omKvabyYfflZn2d10IQBZpU947+jwvyOEWdLNnKQq/3J9A9+QR6
 VI=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gl8Sz0xJuFc=:O5/3EoR4K9qRkk6cFrQyXJ
 tYlolqM0Dy+sTsDorGGoCywYFSNF8TksshP2agx5PVlao6UnTl+olwuLcsrn+z51hkWY9wxWj
 K+bImzNPYjagS9KS3Gkyti66+smUdAJ4UsgJURi3lmSpwSfaeGgl2Noyu8lZNjMgK6jmRLuH8
 3OgwOW5WIjb6tDyn8u7pj6nebNTXkmq9pG7Yc7SLZEQ9Yi6kH7YREoqcn822Kp2ZO1ESDvXhW
 l3J1+8OakRrKYNRADN0itb2dFIV8blTfkELCgluPNMXbHTxF7/f35YnCfHaDQy/095pR4oyV1
 yOx2InvJa4X9lcEKCphQmRAGhdHSd4oCRNxOnrtN/fnff+koEBiwngrZAJbjes+wpWxwzi8s5
 GkLCanxJoa4flHAJXGxoIFdf6I1M0epkoWSC1ZW9+L6V8cBRUvX1Q6w0qwqBA25LHLoT4utss
 yae+VsmW0EOl/4I1m0rmZvS0V1T93RSOcz1f/4oCzzqtQ4Co0ui3l57jqby0bLy3PrUvtOH8T
 kEkb9Xhh3TsSFzwMTxmm/ttLiDBpjTAU7LDQ8GLiOleTnbloClHU16tiAJWxd0hgUEiCLVtrN
 NFQjjsSTgayMQgQV1HHDrdJBtT1glapzK4tL3PseozbDiO0xl8dggjvuQ9SwqNTDTUWHr42OE
 gs0UXw9oxOj+gKZ9YVoKv3FQNde7/q+oKA1gXXfAFuMvBtkEdxkD9MwhhBEmTj69uAGTvASf3
 NyWE/Wcin/vkCL9gDXYWeUAX6vex+Vjm2Z0bZrQLNvyNW2ixYcd3Btg8HZQk94eDjGl88nG69
 kzMYoJQ
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffrey,

I did not point to the repository I actively maintain, but since I was abl=
e to do so since 2017, I think I have figured out all of what I consider "=
basic" ways of using git to maintain and keep up with the upstream DRM cod=
e.

https://cgit.freedesktop.org/openchrome/drm-openchrome/

It is just that I am now at a point of posting code on dri-devel mailing l=
ist for the first code review, but I just suddenly realized that git does =
not appear to have a convenient way to do this.
What I am trying to do is to post the code on dri-devel like the previous =
OpenChrome developer, James Simmons, did in 2013.

https://lists.freedesktop.org/archives/dri-devel/2013-June/039594.html

Regards,

Kevin Brace
Brace Computer Laboratory blog
https://bracecomputerlab.com


> Sent: Wednesday, June 22, 2022 at 12:33 PM
> From: "Jeffrey Hugo" <jeffrey.l.hugo@gmail.com>
> To: "Kevin Brace" <kevinbrace@gmx.com>
> Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
> Subject: Re: How do I gather up new code to be converted as patches?
>
> Generating a patch is "git format-patch".  This command operates on
> commits in your local tree.  So you need to commit your changes to
> your local tree.  The command for that is "git commit", and it works
> on staged changes.  To stage changes, you need to "git add" them.
> "git status" can help you visualize unstaged and staged changes.
>
> So, if I had a change in foo.txt, I would likely use "git status" to
> view that unstaged change.  Then I can stage it using "git add
> foo.txt".  "git status" will then show that it is staged.  Finally, I
> will do "git commit", which will ask for a commit text, and commit the
> change to the tree.  I can then verify that the change is committed
> using "git log".
>
> Does that help you out, or did I misunderstand your situation?
>
> -Jeff
>
> On Wed, Jun 22, 2022 at 11:19 AM Kevin Brace <kevinbrace@gmx.com> wrote:
> >
> > Hi,
> >
> > I spent about 2 days trying to figure this out, but I guess not a lot =
of people do this, so I was not able to find a good example somewhere on t=
he Internet.
> > How to I use git to gather up new code to be converted to patches?
> > Specifically, I have 20+ new files in one location (drivers/gpu/drm/vi=
a) and a small change to DRM main make file (drivers/gpu/drm/Makefile).
> > If someone can tell me how to do this, I will post the work on dri-dev=
el.
> >
> > Regards,
> >
> > Kevin Brace
> > Brace Computer Laboratory blog
> > https://bracecomputerlab.com
>
