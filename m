Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE31CB6B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 20:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483FD6EB48;
	Fri,  8 May 2020 18:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453826EB4A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 18:07:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 19so9183674oiy.8
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DO07odX6T/41RlIX1UXYogzzXrVyJtZvblNwJ0YHq4k=;
 b=RlWIbY0s1Mnw9nUJ5ZemTA3FHJJAnrV7VLsiIvVMsgvVuqu6iOsQb4Vw21gX+ZgRPx
 0FixID5NH1iYNVfsFUojI0xrzBJd51/nl5FVO/2zHUB0tyTZbiPXpf+T4jqEPCaheThk
 nQ5BXA9d16dQ5HcXNPAxpwnCqUx9WhweJJxrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DO07odX6T/41RlIX1UXYogzzXrVyJtZvblNwJ0YHq4k=;
 b=S9SSbPLikbySqFjitd1OW2hxD7KYuZDPpmnxTRAhMN4dNjkrym5JpDROS0sbAhDNr4
 3IwEgKUh9yuZhI0lF6rqsqQBxTEAE/CP+utEURafTj3Boc1JqX7Lse1lFGYVcdKT5DHe
 NmNtE9MwmsiHf7jThrcqKk0do8UyCHuUA1WydhqztvhZVBozH0qv5cRIpxbhry+FRYtd
 wR/AorXMaPoTDjqdvQGw+RetYaAwZBLnDwo2m5nS6qCB4gqwOpE7J6BQaztvajRN8iOc
 DJoonKbBUp6qJ0Gu2f97McfalSxYhZhy1IPaB2K8q/zSBndgWBCBUO74FZNl78jpHjar
 RkXQ==
X-Gm-Message-State: AGi0PubKvqE9LyPkH2obpER2q77ggf3uuhKuR5AnGx6kT5fqJ8Xz+oK2
 Z+LcefQ7z0ygGEMfEYXRo2UvqX8uTgRBuzNa7icqew==
X-Google-Smtp-Source: APiQypL4xRnGb2sQh556eDt0wxjRoS0CEgWkJq6ujjD01srQ/OJ04lvFPfxZz4aK00Z45Bcd4BpSCw9gT/gX4LAoQ9Q=
X-Received: by 2002:aca:52d5:: with SMTP id g204mr11365635oib.14.1588961272474; 
 Fri, 08 May 2020 11:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
 <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
 <20200428140842.GL3456981@phenom.ffwll.local>
 <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3894B40C6D71435D3E759A34A1A20@CH2PR12MB3894.namprd12.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 8 May 2020 20:07:41 +0200
Message-ID: <CAKMK7uFRt14m24ajYygdRZz=fUMhA9u6=590R2jjhXGq=VtwNA@mail.gmail.com>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 3:56 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Daniel,
>
> > > Looking at this patch series, feels a bit like hand-rolling of bridge
> > > code, badly. We should get away from that.
> > >
> > > Once you have that I think the end result is tiny enough that it can
> > > stay, bridges intergrate quite well into simple display pipe drivers.
> > >
> > > > BTW should I pull that series in my tree and send you a pull-request
> > > > or that kind of change needs to go through another tree?
> > > >
> > > > Also I'd like to test the change we discuss here to make sure stuff
> > > > still works. Once we do that I'll send an update. Any hint on
> > > > when that change needs to be acked/nacked?
> > >
> > > Simplest is if this can all land through drm-misc, is arc not
> > > maintained in there? And there's plenty of time for testing, I'm just
> > > slowly crawling through the tree to get everything polished and
> > > cleaned up in this area.
> >
> > Any updates on testing this pile here? First patch landed now, and I've
> > started to push driver patches. So would be good to get this sorted out
> > too.
>
> Sorry we're in the middle of 2 long weekends so missed this one.
> I guess we'll be able to test it in a week or two from now.
>
> Is that OK?

This aren't high-priority, so totally ok. As long as you don't land a
driver rewrite and I have to rebase everything :-)
-Daniel

>
> -Alexey
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
