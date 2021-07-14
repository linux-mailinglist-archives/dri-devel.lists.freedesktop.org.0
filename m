Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E295E3C9224
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8181C6E507;
	Wed, 14 Jul 2021 20:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FFA6E4FE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626294751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OxicdESZtSsE1XlutUm+MWeszqFKD6QeBINVHmWH91o=;
 b=KaGZJH5pIM8Bub4oSCA2/dx6IunEAiSSXTVmWFEeSVzg0eA9NIdLbsZX6edGpGe9l18GD6
 UgCs/Xm1JHSSPsK5067LOBc0JXKYIlmV9h1Hdg8+v8/1LLtJaKDnzr7khVIaQBic1lcO4I
 6a4xja+En1R80C9/7bjh4nyvC6LkdNo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-OnEpWxN7O368QS9UzB8o2Q-1; Wed, 14 Jul 2021 16:32:28 -0400
X-MC-Unique: OnEpWxN7O368QS9UzB8o2Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so2162079qkl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 13:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=OxicdESZtSsE1XlutUm+MWeszqFKD6QeBINVHmWH91o=;
 b=ndZwae1/sq4EFO4UnOCuXiBrCtXwGe5/YikKpyTMZtZLfgW9xhqIprG6v9w+PxkKwo
 VCGBR07QixKxnQFEriHWIJWA5Yg3b4oaB2RYLER0jZdT9qKU7/DLh38NdNPnknRk11zW
 c906Fs0uPhk/Qa5I/4yWZ548qIO6WWhX6HDkJbXZwbbV+tilMPi6GUG3s+XFJw5abc4K
 cxqsxDI1yTThQOjR6h1FroJYcnouidINxFjiFIl3XhPzjrNhY4tWFdwODhwSXT5owBhs
 XoyPB8rMkTPaRglEsF4HM+nRo2J1YZe6gWSxEP50rxexb1vJboyxhDGek+MKDz/mCgU0
 cQ1w==
X-Gm-Message-State: AOAM533lCcGz7kiJKjM0uLY8BjKbyMLPWgJhM5RCjRtLDrLi5rlFDVha
 S+yYP9b4t04Y9QDyuy24n9kXW302gHhiTVlaP/Vnrgsx5vwifVVPCUTfM7fSzB3kowUW77TqI5l
 wBzuCEsB4oBa2CF/My4qJYyqTr0Hb
X-Received: by 2002:a05:6214:242f:: with SMTP id
 gy15mr12535324qvb.0.1626294747593; 
 Wed, 14 Jul 2021 13:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFtQ14FbsB0BEAiFsPKb8Om98zdCR57hgqcLo3xfvVsS2QWW/f3fRfEiclgHf8PetYds9m0Q==
X-Received: by 2002:a05:6214:242f:: with SMTP id
 gy15mr12535306qvb.0.1626294747375; 
 Wed, 14 Jul 2021 13:32:27 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x9sm1196113qtf.76.2021.07.14.13.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:32:27 -0700 (PDT)
Message-ID: <5a2b5d77c100a21b3d9e4eb0048c36a94cd1e4ea.camel@redhat.com>
Subject: Help needed for EVoC/GSoC/Outreachy
From: Lyude Paul <lyude@redhat.com>
To: Xorg Members List <members@x.org>, "mesa-dev@lists.freedesktop.org"
 <mesa-dev@lists.freedesktop.org>, xorg-devel <xorg-devel@lists.x.org>, 
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, nouveau
 <nouveau@lists.freedesktop.org>,  dri-devel
 <dri-devel@lists.freedesktop.org>, IGT development
 <igt-dev@lists.freedesktop.org>,  amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Date: Wed, 14 Jul 2021 16:32:24 -0400
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: board@x.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! As some of you might already be aware, after helping out X.org
project the previous years with regards to student outreach, Trevor
decided to retire from this position in hopes that someone else will be
able to step up and take on these responsibilities. As such, we're
trying to find people who would be willing to volunteer their time to
help out with getting us involved once again in student outreach
programs.

In the past, X.org has been active in the GSoC program, occasionally
Outreachy, and our own EVoC program. As of 2021 though, GSoC decided to
shorten the amount of time allocated for a student to work on their
project. This unfortunately posed some problems for
X.org/freedesktop.org as a lot of the potential work that would have
been good for us to have students working on wouldn't really fit within
the new GSoC timeframe. While it's certainly possible that there will be
projects that come up in the future which do fit into this new timeline,
we think it'd be a good idea to step up our involvement again with
Outreachy where the program is a good bit more flexible then GSoC. We've
also had pretty good experience working with the Outreachy candidates
we've had in the past.

The other main topic of discussion is around the fact that our own
program, EVoC, hasn't really had anyone available to volunteer to help
run it for a while now. For those who aren't aware, EVoC is a program
similar to Google Summer of Code that X.org started running with much
more relaxed requirements then GSoC/Outreachy in order to help fill the
gaps for any exceptional cases with students who would otherwise be left
out by the requirements for GSoC/Outreachy. Typically though, EVoC is
usually considered the last resort after a student has tried getting
into GSoC/Outreachy.

So, the two biggest things that we need are:
* Admin volunteer(s)
* Mentors, mentors, mentors! We really need these the most.

So, what responsibilities would being an admin for this entail?

* Fielding questions from potential GSoC/EVoC/Outreachy participants.
  Most of these students are just looking for simple details of how
  these programs work and are looking for project ideas. Responding to
  these inquiries is mostly just a matter of pointing students to
  various pages on our wiki or replying with form/stock replies. Most of
  the students at this phase expect to be handed a project and a mentor,
  and therefore end up learning that they will need to come up with
  their own project and mentor.
* For the small handful of students that make it to the next phase and
  figure out a project idea, they then need to find a mentor. Usually
  the admin will help out by taking a look at who proposed the project
  idea, and/or looking through commit messages and mailing list history
  to try to find someone who would be a good fit and willing to mentor
  the student. Sometimes this happens quickly, and sometimes it requires
  poking a lot of people - and occasionally, there might not always be a
  mentor to be found.
* If we have a student, project, and mentor then the next step is having
  the student write up a proposal. Many students start out with
  over-simplified proposals, so a lot of this work is just gently
  nudging students and getting them to refine their work items into a
  week-by-week synopsis. There's usually a good bit of back and forth
  with the student's proposal, and occasionally the mentor may be
  involved with this step.
* The admin then works with the student to come up with a timeline for
  their work, taking into account any vacation time the student may
  have, along with coordinating the frequency/type of meetings that
  will happen between the student and the mentor. If the mentor is
  unable to attend all of these meetings, it's usually up to the admin
  to check in with the student to see how they are progressing and
  potentially provide them tips if they get stuck.

As for being a mentor, it's pretty much as simple as it sounds: you work
with students who have projects to help familiarize them with the
project at hand, help them out wherever needed, check in on their
progress, and guide them along the way towards reaching their project
goal along with grading their work.

Please help spread the word on this, and contact anyone you know who
might be involved with this! We'll be happy to provide more information
on how you can get started. Remember, folks like myself wouldn't be in
this community without projects like GSoC :).

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

