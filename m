Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39028064A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 20:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB436E210;
	Thu,  1 Oct 2020 18:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1F16E210
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601575874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Jym8Eza3KIHQaaOI/V8IBSOkqWCi/qHMXKuK4RG3Ck=;
 b=QhG5/zcoJDnbPJB01iKhnrROl1RSwDAOtcdSa6YMkOvgKf8rQRWLpKsGQw1P/9k0NxHurB
 9ONeNgTiFamPYDq1IJPXL9biEBfcRtoaCSEneU6hwcb3gjYxSul8C/dzL0xW3TuO/EBQ3x
 9A/jrLr6JJpHrKHBnRCw+zLs092MQDI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-COZjmNdUPV6x0xj_E8Ye7Q-1; Thu, 01 Oct 2020 14:10:57 -0400
X-MC-Unique: COZjmNdUPV6x0xj_E8Ye7Q-1
Received: by mail-qt1-f200.google.com with SMTP id w10so3354474qtt.23
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 11:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Jym8Eza3KIHQaaOI/V8IBSOkqWCi/qHMXKuK4RG3Ck=;
 b=T/8FlcLcl7f+iB/cccsOalfyet5bP7Jk3/8SXK+vy7gAMJvkzOzQoGWj/5Ks6rVCB7
 DXFuDOBHgSmsBqY9HLTg/Uunwnkcv6t514qTwsyxP0ntAlr/kelHFa25yVtIQPwE7007
 SxnJmZ75TWyd8HvnN0l1EJODRw33qDCXRCBiGz2bVuwOXmbedoL58ii6LtYlq6SSQrJu
 sIc+eWu5YlklLmVWXgZ4ClQZM0b1f7ProM2AGbUCR4Ok/Sr0bcfDcD/45ReA9nogS8Il
 KFfUuyPDBS++jb6prmreOTYI4Jib/tv5kVUvZHHbgMitms82FnFRGlmWKKVO97i9kJjC
 Pw5g==
X-Gm-Message-State: AOAM530WiIqBOtoaekcC59LTng5w+wbmuUV1WoD4euli1t63xBVJrVTG
 vTSQblH+GE6wtSOeSn9j/mhX0z1geI89V2gtjTzZ+YsqGgeRInrZ4erHACWXBd26z3UjF4uhbpE
 d0yEkJj+e6fSl7NtDuyYynLiNdXUpq/mP0dx5h2mBbhv8
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr8893836qkd.381.1601575857229; 
 Thu, 01 Oct 2020 11:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJAVsRkcuUDqaRE3xnTfpJO/ELYRVzrAgllVzep6Xa2nU5Z84q7LMrvP+FACMORWBpeaQV5JX7lrif/8UT7Jg=
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr8893816qkd.381.1601575856950; 
 Thu, 01 Oct 2020 11:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
 <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
 <20201001175257.GA188932@ravnborg.org>
In-Reply-To: <20201001175257.GA188932@ravnborg.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Oct 2020 20:10:46 +0200
Message-ID: <CACO55ttPBijaKCv1QxLHN-mAdkazDikV_wprn8R-wJx4F4oaWQ@mail.gmail.com>
Subject: Re: Nouveau wiki migration
To: Sam Ravnborg <sam@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 7:53 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Karol.
>
> On Thu, Oct 01, 2020 at 01:36:52PM +0200, Karol Herbst wrote:
> > On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > Hi everybody,
> > >
> > > I think it's time to finally move our wiki from the old infrastructure
> > > over to gitlab pages.
> > >
> > > This comes with several benefits:
> > > * full control through git over the ikiwiki pipeline (setup files,
> > > plugins, system packages, ...)
> > > * random users are able to create MRs against the wiki as long as they
> > > are willing to create a gitlab account.
> > > * possible to migrate over to a different wiki generator or mix and
> > > match or whatever.
> > > * no CGI stuff on the wiki as we don't use ikiwiki for the git
> > > operations anymore
> > >
> > > To view the migrate wiki visit this URL:
> > > https://nouveau.pages.freedesktop.org/wiki/
>
> I poked around a little - almost all of it looked good.
>
> The FAQ points back to some pages on https://nouveau.freedesktop.org -
> like https://nouveau.freedesktop.org/wiki/XvMC/
> I guess this is a bug.
>

The migration includes using the old subdomain with gitlab pages and
most of the links are auto-generated anyway, so this should just work
after migration. I just have to prepare accordingly.

> But in general looks good.
>
> > I did some further changes, like ensuring backwards compatibility to
> > existing links and already started to clean up some bits, like
> > removing the google translate stuff.
> >
> > Now I'd like to get the subdomain changed of the current wiki over to
> > the gitlab stuff and wanted to ask for acks/nacks on this
>
> No ack/nack here - as I really do not know what to ack/nack.
> But maybe the above counts like an ack???
>
> But looks good and I hope that others find it simple to help
> with the pages from the gitlab repo.
>
>         Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
