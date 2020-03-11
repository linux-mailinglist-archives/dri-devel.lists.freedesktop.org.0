Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4F180FD4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 06:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA886E8F9;
	Wed, 11 Mar 2020 05:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E766E8F9;
 Wed, 11 Mar 2020 05:24:22 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n18so1320409edw.9;
 Tue, 10 Mar 2020 22:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZutBpd9PX/nAiXGCm2HtvoZ3q8rNB4BigBmi3PRqsDY=;
 b=Nc3gi0xA1eree3EDoqU/5To0sMI3lYne34BeDUfDV8uovge8Fw6aK4H9UbngJq4Cwj
 kZ6qMuMaioPOKpreZaIOt/XNQ38qBdV96nFS184AcB7PCzmL6fSegDe06cvg3UvF4X5J
 7aDnfJzo/SxPR7TZcox75eOOx64yT9I+vMht7k9JZDQVLe4UNa74+Yrt4ErYB8Pnqqbb
 4VETv317qblo3//78NYwp8jFz8YR6SNDK7Pji7BMt/eyi3k0v61LwhVykJG5/nUx5ZqH
 A4U6JWtCQy2lRNyTUR6yTu8cQ+pyvBzNfl2o+JGXrVd5VhQjvIcsZM+HbDwIOIMcM2Z1
 wPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZutBpd9PX/nAiXGCm2HtvoZ3q8rNB4BigBmi3PRqsDY=;
 b=KvuRgMFjhpfsdSbhnUBUO9Mk3YRSWlGu2TJWokB8l+DzNkdg5bZWfIma6pOP9eO9JT
 4Qyk8M+91S34rZRAd9Dawn+FMCrFa6Y5Y+XG6e0QwxJd4eOsVnh55ffbPvz6HfH/K7zx
 PCz4AWYvf3bpr2uUqdLz9AtvZPWgnEEvf/0dCV8OaRJfMXmcZcKwdGj22dq69vTZXA5F
 +AApN55Y77gkJJYOxTyjiT48LsWQANN4bBipaCSKf+4BhJeFJbLDNjRENmttFQ6o1wtM
 ufp8A0+n3w/oovm+ulfziI6x53Gww1Bu7r2joEYWNVIfzAiYriA6i8vmwmyVTx8r8HB/
 j47Q==
X-Gm-Message-State: ANhLgQ15lskWO0vaZabQ2t826RWpXel7/0cBPRFI52iydWt2kZBLzSij
 S1HhpPc9DRWXl5qjrzvkUIwtjmO8DegbCOWyt09y2+49
X-Google-Smtp-Source: ADFU+vv04IZ6IebxQ7aRUv8qA2Rq0DtuH5UX+tXbLdDQurmE8CbnsqREFj8uzojp0K70RPW22RyOY5qZ3Ky5zCmEz6o=
X-Received: by 2002:aa7:de85:: with SMTP id j5mr1079081edv.193.1583904260765; 
 Tue, 10 Mar 2020 22:24:20 -0700 (PDT)
MIME-Version: 1.0
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 11 Mar 2020 01:24:09 -0400
Message-ID: <CAHUNapR2bqOenz6kEbLNMh7M-L8im4z_9zcOPT2+uu5wb5w8Hw@mail.gmail.com>
Subject: X.Org GSoC 2020 - call for project ideas and mentors
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 wayland <wayland-devel@lists.freedesktop.org>, 
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, 
 "X.Org Devel List" <xorg-devel@lists.x.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

Once again X.Org has been fortunate to have been chosen to be part of GSoC!

Starting March 16 (this Monday) students will be able to register and
submit their applications for GSoC.

If you can spare a moment, please take a look at our current "idea"
page which help students to start thinking about potential project
ideas: https://www.x.org/wiki/SummerOfCodeIdeas/

If you have any project ideas that might suit a post-secondary
student, please add them to the list, or email me the details and I'll
be happy to update the list on your behalf. Conversely, if there are
projects on that list that are no longer relevant, please let me know
and I'll take them down.

Also, if you are considering being a mentor, please get in touch so I
can add you to the list.

If you have any thoughts or questions, please don't hesitate to get in touch.

Best regards,
    Trevor
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
