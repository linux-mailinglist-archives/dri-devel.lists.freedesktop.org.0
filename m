Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04C253E6E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7076EB5B;
	Thu, 27 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0846EB1E;
 Thu, 27 Aug 2020 01:37:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id z22so3313620oid.1;
 Wed, 26 Aug 2020 18:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rsb5LLd+wEYl5+11BE05ItDTZCXQhjeMW019xM5KW9w=;
 b=I80xaBRJ50n8a6fI5zGd+zDFXBJzdkM/CYwdFxWUUjYU3c+2p64n4BZ92Q57vwyNvT
 WA9AXEE5mkmSWs9RicapGSPmYl7SBg2jYYPKSa/nI/+15pdR7K1Y4Cu0DHfnjPwN8yXR
 icr8tNGeIcQL3s2nHPbJyB6yfauHJDS+gWazTyaRFZfsu6K/xYzwtyDy670Ye8cnRtyg
 TR/hJM9qLFyVWX5fPwsxGxi/JNo/PLB2M5jflTu50Xv+DnpTnsNDIefohCCH/iR6ipaV
 nyjrEne62FM9W1doljqrO4mZtREkO1PUraYtOXDLLpGubpcLL1+FWyQrEJDylKkUrU3D
 wKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rsb5LLd+wEYl5+11BE05ItDTZCXQhjeMW019xM5KW9w=;
 b=KlvsA7Shlx1OyAv0jhD8jEmcnXf2VNgMsTFddEcoW+9h/yHpxGUqFczuXH4wIU0evy
 MdqtACQe+IMz/0uzWMLXnQPbjkjCkjMJYCTxeXQZpvmcYe0+YqZDT86/MnPWFjQKQg0r
 px/iwNglayttpiqAs7bej19sKBy/NIV7UqkspakZP5bQN4I0Z4P+QcmpqBvuxJp6IzjY
 M7GOlHlfNXKNgpT6R5hpSKYrP6pifngK6beVypiJEFhkbftoP8Ca0TLRYynrOfM34Wnk
 +NXDEK2Id1Mn2kAKsMZgwzPxiYYtCzu+gbSc9N8YlSCfOhqe4W+lx4mAgNL9Uf+e6/Kq
 vWsw==
X-Gm-Message-State: AOAM533ZH3+/hfjQ1kl8Gz+UK5rYCAmDdp1RfQgIL/dK+cGAf9gbcLw4
 DT8WHwVKPeURAxexTSeO0DxpGtCt7ctdBQTJwUU=
X-Google-Smtp-Source: ABdhPJwhCHTUyQeL6NO7VZ9TErlPHSPJaUSJlRG8on4DJcl3XVowSsSaDNvfXk39W2OiRUOfnXZzLQickeYXItlZbbE=
X-Received: by 2002:aca:ec95:: with SMTP id k143mr5299041oih.76.1598492278869; 
 Wed, 26 Aug 2020 18:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
 <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
 <1597849185.3875.7.camel@HansenPartnership.com>
 <CAOMdWSJRR0BhjJK1FxD7UKxNd5sk4ycmEX6TYtJjRNR6UFAj6Q@mail.gmail.com>
 <1597873172.4030.2.camel@HansenPartnership.com>
 <CAEogwTCH8qqjAnSpT0GDn+NuAps8dNbfcPVQ9h8kfOWNbzrD0w@mail.gmail.com>
 <20200826095528.GX1793@kadam> <202008260811.1CE425B5C2@keescook>
In-Reply-To: <202008260811.1CE425B5C2@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 27 Aug 2020 07:07:47 +0530
Message-ID: <CAOMdWSLyacdeoqnZBuLu6z1B6cY-WbtUJQm6+8=WHyE49tVaEg@mail.gmail.com>
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Kees Cook <keescook@chromium.org>
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:37 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-atm-general@lists.sourceforge.net, s.hauer@pengutronix.de,
 manohar.vanga@gmail.com, airlied@linux.ie, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux1394-devel@lists.sourceforge.net, anton.ivanov@cambridgegreys.com,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, mporter@kernel.crashing.org,
 jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>, oakad@yahoo.com,
 intel-gfx@lists.freedesktop.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org, sre@kernel.org,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, stefanr@s5r6.in-berlin.de,
 linux-ntb@googlegroups.com, Romain Perier <romain.perier@gmail.com>,
 shawnguo@kernel.org, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 8:43 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Aug 26, 2020 at 12:55:28PM +0300, Dan Carpenter wrote:
> > On Wed, Aug 26, 2020 at 07:21:35AM +0530, Allen Pais wrote:
> > > On Thu, Aug 20, 2020 at 3:09 AM James Bottomley
> > > <James.Bottomley@hansenpartnership.com> wrote:
> > > >
> > > > On Wed, 2020-08-19 at 21:54 +0530, Allen wrote:
> > > > > > [...]
> > > > > > > > Since both threads seem to have petered out, let me suggest in
> > > > > > > > kernel.h:
> > > > > > > >
> > > > > > > > #define cast_out(ptr, container, member) \
> > > > > > > >     container_of(ptr, typeof(*container), member)
> > > > > > > >
> > > > > > > > It does what you want, the argument order is the same as
> > > > > > > > container_of with the only difference being you name the
> > > > > > > > containing structure instead of having to specify its type.
> > > > > > >
> > > > > > > Not to incessantly bike shed on the naming, but I don't like
> > > > > > > cast_out, it's not very descriptive. And it has connotations of
> > > > > > > getting rid of something, which isn't really true.
> > > > > >
> > > > > > Um, I thought it was exactly descriptive: you're casting to the
> > > > > > outer container.  I thought about following the C++ dynamic casting
> > > > > > style, so out_cast(), but that seemed a bit pejorative.  What about
> > > > > > outer_cast()?
> > > > > >
> > > > > > > FWIW, I like the from_ part of the original naming, as it has
> > > > > > > some clues as to what is being done here. Why not just
> > > > > > > from_container()? That should immediately tell people what it
> > > > > > > does without having to look up the implementation, even before
> > > > > > > this becomes a part of the accepted coding norm.
> > > > > >
> > > > > > I'm not opposed to container_from() but it seems a little less
> > > > > > descriptive than outer_cast() but I don't really care.  I always
> > > > > > have to look up container_of() when I'm using it so this would just
> > > > > > be another macro of that type ...
> > > > > >
> > > > >
> > > > >  So far we have a few which have been suggested as replacement
> > > > > for from_tasklet()
> > > > >
> > > > > - out_cast() or outer_cast()
> > > > > - from_member().
> > > > > - container_from() or from_container()
> > > > >
> > > > > from_container() sounds fine, would trimming it a bit work? like
> > > > > from_cont().
> > > >
> > > > I'm fine with container_from().  It's the same form as container_of()
> > > > and I think we need urgent agreement to not stall everything else so
> > > > the most innocuous name is likely to get the widest acceptance.
> > >
> > > Kees,
> > >
> > >   Will you be  sending the newly proposed API to Linus? I have V2
> > > which uses container_from()
> > > ready to be sent out.
> >
> > I liked that James swapped the first two arguments so that it matches
> > container_of().  Plus it's nice that when you have:
> >
> >       struct whatever *foo = container_from(ptr, foo, member);
> >
> > Then it means that "ptr == &foo->member".
>
> I'm a bit stalled right now -- the merge window was keeping me busy, and
> this week is the Linux Plumbers Conference. This is on my list, but I
> haven't gotten back around to it. If you want, feel free to send the
> container_from() patch; you might be able to unblock this faster than me
> right now. :)
>

Sure, Thanks.



-- 
       - Allen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
