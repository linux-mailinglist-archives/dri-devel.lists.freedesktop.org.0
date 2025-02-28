Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDCA497D1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B029E10EC5F;
	Fri, 28 Feb 2025 10:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CZp5p7qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909410EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:53:02 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso13734235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740739981; x=1741344781; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fGKkYkU92AKIEtoBhTzOtqV6Umxi/0b1IQGfdOiR18=;
 b=CZp5p7qsEzmJEW2NV+xhkBz+r/cenFXX0/Egzbj6hVJitbhngfcrlUHHYXrKK4xZNv
 SNby5CaRRpOLgYu2iXQxos9FpXRFmf/n0pYklUU4BD4lh7KqLXfB8bx8COzOoQlmJ5zo
 G/AJuFyVQk50CO8jEdnxhF1gglDPG562q1ZDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740739981; x=1741344781;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6fGKkYkU92AKIEtoBhTzOtqV6Umxi/0b1IQGfdOiR18=;
 b=mkYfHO8Tau0nJJ8JWIGIOQxTPuXwb2YemS4Sbpqf8WHxspGOM6XVKbHtullwfyjplz
 HoDzOIY/9+3UiApU27Jt6PDBytVyC/+ObuPBbjyoiaScht4p6HdtJ4zf14uec9t69VyK
 FYeynwX69R/TSvCWP58AbLXu2RWrm4jsQOZwPN3gVpl0vDXyp5NzdV7q6uvP4Jt6S4qs
 FdTIMBcVGZrNycY3pAGTYd6zGmtEhtxwAaQTU3gTmZFbYaqu0fKioNJ/Fpbw27ztp/0B
 SqZgYwdzIq+l67NnUpx3e8T7uXNJ8WDpaG5JFFzfViW8G8jF/xgzgfT6p67Yyqs8R9lw
 LAuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL8ad2ONxWzB3UViknGWdQ4I099cPH4Rbm2C5JrfE7s/aVVgs1luukAVnJB8zseS3EXAgFgW5suQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSJX9MaaYKzvPwP/5y6V99ITI1Qjmzd8eoT8t+Eflq2xzKpeB0
 VO3rka9VHaV49S8dE7IAPwwRHigRAIQxKi4y4Zp6kCYHj/K4STWJqOUG2XzGnmo=
X-Gm-Gg: ASbGncu16FuKRJhcK5HqLCwAD8szXHhl7GOeEeMhj62Zg6lUW72Pk/ULKYwuKpFe4bB
 7SFRP0pLlO9XNYjjMBltkfcS+FWA/YPYAWkeyDVrYFMB/bRh8EbvY+IiZc6rkNn1dxSsLjOHaSy
 SHGKRda8gVp1URqb/mFlolKsuHL1BSUfpKklT/eZ4ET8A9C1qh21ALmyG/6XpQJUttFjc7N2Lac
 n9ol1tuoAh+XGLWQsJ0odxTvR++dWul7Tz3YssYZHbYbrqyfWc7JhzlVMLnHZcFNqnwV1aH7Y65
 m4e7Hx4Rfu/g3cpaoxwpwtMN9iEVnF897hZYDw==
X-Google-Smtp-Source: AGHT+IGzMK22OAqSxJRJToDbcyGmm49ADbSw6MIeJDyMnFgiltwXHFIghIXm6aj4rubMHLy1CtzTYg==
X-Received: by 2002:a05:600c:468e:b0:439:8e3e:b0d6 with SMTP id
 5b1f17b1804b1-43ba67045femr23509435e9.13.1740739980068; 
 Fri, 28 Feb 2025 02:53:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5393e5sm83131255e9.20.2025.02.28.02.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:52:59 -0800 (PST)
Date: Fri, 28 Feb 2025 11:52:57 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2025 at 05:34:01PM -0800, John Hubbard wrote:
> On Wed Feb 26, 2025 at 5:02 PM PST, Greg KH wrote:
> > On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> >> The way misc device works you can't unload the module until all the
> >> FDs are closed and the misc code directly handles races with opening
> >> new FDs while modules are unloading. It is quite a different scheme
> >> than discussed in this thread.
> >
> > And I would argue that is it the _right_ scheme to be following overall
> > here.  Removing modules with in-flight devices/drivers is to me is odd,
> > and only good for developers doing work, not for real systems, right?
> 
> Right...I think. I'm not experienced with misc, but I do know that the
> "run driver code after driver release" is very, very concerning.
> 
> I'm quite new to drivers/gpu/drm, so this is the first time I've learned
> about this DRM behavior...

It's really, really complicated, and not well documented. Probably should
fix that. The issue is that you have at least 4 different lifetimes
involved here, and people mix them up all the time and get confused. I
discuss 3 of those here:

https://lists.freedesktop.org/archives/intel-xe/2024-April/034195.html

The 4th is the lifetime of the module .text section, for which we need
try_module_get. Now the issue with that is that developers much prefer
convenience over correctness on this, and routinely complain _very_ loudly
about "unnecessary" module references. They're not, but to break the cycle
that Jason points out a bit earlier you need 2 steps:

- Nuke the driver binding manually through sysfs with the unbind files.
- Nuke all userspace that might beholding files and other resources open.
- At this point the module refcount should be zero and you can unload it.

Except developers really don't like the manual unbind step, and so we're
missing try_module_get() in a bunch of places where it really should be.

Now wrt why you can't just solve this all at the subsystem level and
guarantee that after drm_dev_unplug no code is running in driver callbacks
anymore:

In really, really simple subsystems like backlight this is doable. In drm
with arbitrary ioctl this isn't, and you get to make a choice:

- You wait until all driver code finishes, which could be never if there's
  ioctl that wait for render to complete and don't handle hotunplug
  correctly. This is a deadlock.

  In my experience this is theorically possible, practically no one gets
  this right and defacto means that actual hotunplug under load has a good
  chance of just hanging forever. Which is why drm doesn't do this.

- You make the revoceable critical sections as small as possible, which
  makes hotunplug much, much less likely do deadlock. But means that after
  revoking hw access you still have arbitrary driver code running in
  callbacks, and you need to deal with.

  This is why I like the rust Revocable so much, because it's a normal rcu
  section, so disallows all sleeping. You might still deadlock on a busy
  loop waiting for hw without having a timeout. But that's generally
  fairly easy to spot, and good drivers have macros/helpers for this so
  that there is always a timeout.

  drm_dev_unplug uses sleepable rcu for practicality reasons and so has a
  much, much higher chance of deadlocks. Note that strictly speaking
  drm_device should hold a module reference on the driver, but see above
  for why we don't have that - developers prefer convenience over
  correctness in this area.

> > Yes, networking did add that functionality to allow modules to be
> > unloaded with network connections open, and I'm guessing RDMA followed
> > that, but really, why?
> >
> > What is the requirement that means that you have to do this for function
> > pointers?  I can understand the disconnect issue between devices and
> > drivers and open file handles (or sockets), as that is a normal thing,
> > but not removing code from the system, that is not normal.
> >
> 
> I really hope that this "run after release" is something that Rust for
> Linux drivers, and in particular, the gpu/nova*, gpu/drm/nova* drivers,
> can *leave behind*.
> 
> DRM may have had ${reasons} for this approach, but this nova effort is
> rebuilding from the ground up. So we should avoid just blindly following
> this aspect of the original DRM design.

We can and should definitely try to make this much better. I think we can
get to full correctness wrt the first 3 lifetime things in rust. I'm not
sure whether handling module unload/.text lifetime is worth the bother,
it's probably only going to upset developers if we try. At least that's
been my experience.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
