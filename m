Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE974A61CD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB7E10E5F6;
	Tue,  1 Feb 2022 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D652110E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:02:25 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so4295416ook.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmNulzN3mmZQBCDB7sQ8CSdfD8G2urW4bUypyx2Sf+U=;
 b=d+5cIITflXarmSYidQYqGy/SPlpwJFPzUwzgnzx7YR24olDgujJq7qHiWnlN+fcRjp
 RmfyDMRjnZa+nNfcr3P4npSe9RXP+06rXO/fW8PoG09XRA1YqP8nxpkt4MzDwjpsicV7
 ZyFcVV7wa1gfKWy64DDrp7h3j9EB30ErvuCRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmNulzN3mmZQBCDB7sQ8CSdfD8G2urW4bUypyx2Sf+U=;
 b=D4oFsUTxOyZXhIA7/F36oVe6+c2oc78+ZbLUFHWAKRXtap3XO2ksRJPZvcQbrf2wYy
 GmPgz+CTkpSTxhOjb1nYkFOxMHKvHt6nMBLEWoZyLZ+EwwIJ8HKn5OxrHjN1VOjKrsVP
 T3F67evGvxutLVqskazLAtEMvWfeJFGq0nbizNIDGk/DGYZjeBv4Th3x2aQ/KhGuYzaH
 Ibl861t1Ohuitv4HZWme0qWGOHXZW0ZpZ3+yJ1Nkx8fUk3ye8T+G7qOhixjx9rDAhMaO
 1oRT7XgJDkd7WGeSICrYR3fhf8u99d9xF+DHUKSY/v3QQ2354HI1ics3AgHcqwtz7LCS
 4g9A==
X-Gm-Message-State: AOAM533WChfRiVLWzSGtsdfV5OJfqxnNrm+xCE3tcli9wabEnZ/rtUpE
 +OhcCWKgFtbL23sESXlg+49rnQCDbPTGCRTRJBP0FA==
X-Google-Smtp-Source: ABdhPJwWXljKvKuGvpSaNGrCDpGDZgSOOvLzRo52D5dqbZIgiKxNCAjoHk0BJnO9f2e73wAgllo3zYa4Ve3UnhJBSrA=
X-Received: by 2002:a4a:8891:: with SMTP id j17mr13060858ooa.12.1643734945153; 
 Tue, 01 Feb 2022 09:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
 <e89dbc7b-b3ae-c334-b704-f5633725c29f@redhat.com>
 <CAD=FV=U8VGnRXv8MgofKzZF22_x0_X3M+AMfyPQ1u=yTXnFBQA@mail.gmail.com>
 <6fdcfbcf-0546-6b4f-b50f-cf2382ad746f@redhat.com>
 <CAD=FV=U3YHt=+cr8c39zMxFWMeo4Pr=R3BBPMKanpySPhsYh9w@mail.gmail.com>
In-Reply-To: <CAD=FV=U3YHt=+cr8c39zMxFWMeo4Pr=R3BBPMKanpySPhsYh9w@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 1 Feb 2022 18:02:13 +0100
Message-ID: <CAKMK7uEiUxPJ7F+F33YVdq6d9WxzxTKzoxTyiZnvceM2CHEkVw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
To: Doug Anderson <dianders@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jjsu@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 5:42 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jan 26, 2022 at 12:25 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > On 1/26/22 00:25, Doug Anderson wrote:
> > > On Tue, Jan 25, 2022 at 2:55 PM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> >
> > [snip]
> >
> > >> Should this new sysfs entry be documented in Documentation/ABI/ ?
> > >
> > > I'm not sure what the policy is here. I actually don't know that I'm
> > > too worried about this being an ABI. For the purposes of our tests
> > > then if something about this file changed (path changed or something
> > > like that) it wouldn't be a huge deal. Presumably the test itself
> > > would just "fail" in this case and that would clue us in that the ABI
> > > changed and we could adapt to whatever new way was needed to discover
> > > this.
> > >
> > > That being said, if the policy is that everything in sysfs is supposed
> > > to be ABI then I can add documentation for this...
> > >
> >
> > I also don't know the policy, hence the question. But in any case, I
> > think that it could even be done as a follow-up if is needed.
>
> Sounds good. Since it's been pretty silent and I had your review I
> pushed this to drm-misc-next. If there are comments or someone has an
> opinion documenting this as a stable ABI then please yell.
>
> 363c4c3811db drm/panel-edp: Allow querying the detected panel via sysfs

Generally stuff for tests should be put into debugfs. We print
everything there in various files.

sysfs is uapi, and so come with the full baggage of you need open
userspace (which for some sysfs stuff might just be a script), and
explicitly not for tests (because that just opens the door to merge
anything binary blobs might want and just slide it all in). So please
retcon at least some plausible deniability here :-)

But if it's really only for a test then maybe dumping this into a
debugfs file (we do have connector directories already) would be much
better. That doable?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
