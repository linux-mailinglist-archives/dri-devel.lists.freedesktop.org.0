Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298D26A4DE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 23:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650A910E198;
	Mon, 27 Feb 2023 22:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204010E198;
 Mon, 27 Feb 2023 22:20:17 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id bj30so731140oib.6;
 Mon, 27 Feb 2023 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fA/qOyRGrtjJgq1KbLfxlXxfBq3cHbXAjhOxay1caMo=;
 b=CGheFiCIt49KvHcV1ouDSTJc12bf+Zk61DsACW4P78JdbJk6iqCpMoYmXA+OdzdSAd
 SdWvlg4NFBNATPDl2WqQso1shT1EYWGgbywcXiQ1uNbugA+WetzvOu9AYI0EpQkEM3rq
 BebYSW4+pquRDqk3wo0yz4dvFiqKHtzzCBJPOUe/amSTdq9Of3YmspBa8urULVB1DV/4
 g9iVVeHLlOizF+Esxzo2DNcI9jOTC76t9EFZmGTp845O5yaiykaiVXcucdFafiTiJv54
 oWCkdkbq0zcR8OBf4ak/TSOE5imaeTtmmgO61C4NvyPl9330tj7QWGopllThcaxkPuSi
 heeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fA/qOyRGrtjJgq1KbLfxlXxfBq3cHbXAjhOxay1caMo=;
 b=M7CaR6t71xFV4irHKnhA6qaQv3jxaffsTQP+YWd6RtyIFQSQhVaoMQ31Fwd9iNFrwk
 fAqN3gONeSHnOQdmzp6VNW7HLrZddSiuBA3OlGv2KMI7OTmTy1IC3fQbZ0JUnqPoes2m
 6/HZiv5wmjhTSMfwbAINgq4nUvXHcxB9+oVRWY3dBsacOeA+750I7PaNE9KaiYO9/e+l
 CktaTIK/zrjBnhSzKUIic/mV5tye7I3R/09sVUqL/uqZL3ehzq9+Gp9mW1+ZAmh6EAvd
 sz9j1j5dBXXR7/UUhRBJXYHhsnUWROjoLUjXNWmeOhYvmnP+M081RkqwqerbG34utIOZ
 YLOg==
X-Gm-Message-State: AO0yUKWIpz5ayqToAAmTSWRwHhUMV5dnhXO0pvHSzrdjCGBtzqtzQfPi
 B4oZA2dlp9Loz5/Skl4PhPEzPzsy5u9i80iYJKw=
X-Google-Smtp-Source: AK7set/pvGHGZzhLmd9ucfkRYyan77WyLijpGJTRGJ/oOzN/UqKrNeaF8PpansVPlpIpYew7kJqLm/JALOBuvoUSlvM=
X-Received: by 2002:a05:6808:2a06:b0:384:2615:f63 with SMTP id
 ez6-20020a0568082a0600b0038426150f63mr282223oib.3.1677536416434; Mon, 27 Feb
 2023 14:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
 <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
 <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
 <Y/0iM+ycUozaVbbC@intel.com>
In-Reply-To: <Y/0iM+ycUozaVbbC@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Feb 2023 14:20:04 -0800
Message-ID: <CAF6AEGtXSEyyjELjGtPvnAN7mX+NwzngmB0PbKHsZqjTm-xYsg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 1:36 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> > On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
> > >
> > > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > > >
> > > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > >>
> > > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > >>>>
> > > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > >>>>>>
> > > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >>>>>>>>
> > > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > >>>>>>>>
> > > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > >>>>>>
> > > >>>>>> ...
> > > >>>>>>
> > > >>>>>>>>>> On another matter, if the application uses SET_DEADLINE with one
> > > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
> > > >>>>>>>>>> another timestamp, what should happen?
> > > >>>>>>>>>
> > > >>>>>>>>> The expectation is that many deadline hints can be set on a fence.
> > > >>>>>>>>> The fence signaller should track the soonest deadline.
> > > >>>>>>>>
> > > >>>>>>>> You need to document that as UAPI, since it is observable to userspace.
> > > >>>>>>>> It would be bad if drivers or subsystems would differ in behaviour.
> > > >>>>>>>>
> > > >>>>>>>
> > > >>>>>>> It is in the end a hint.  It is about giving the driver more
> > > >>>>>>> information so that it can make better choices.  But the driver is
> > > >>>>>>> even free to ignore it.  So maybe "expectation" is too strong of a
> > > >>>>>>> word.  Rather, any other behavior doesn't really make sense.  But it
> > > >>>>>>> could end up being dictated by how the hw and/or fw works.
> > > >>>>>>
> > > >>>>>> It will stop being a hint once it has been implemented and used in the
> > > >>>>>> wild long enough. The kernel userspace regression rules make sure of
> > > >>>>>> that.
> > > >>>>>
> > > >>>>> Yeah, tricky and maybe a gray area in this case. I think we eluded
> > > >>>>> elsewhere in the thread that renaming the thing might be an option.
> > > >>>>>
> > > >>>>> So maybe instead of deadline, which is a very strong word, use something
> > > >>>>> along the lines of "present time hint", or "signalled time hint"? Maybe
> > > >>>>> reads clumsy. Just throwing some ideas for a start.
> > > >>>>
> > > >>>> You can try, but I fear that if it ever changes behaviour and
> > > >>>> someone notices that, it's labelled as a kernel regression. I don't
> > > >>>> think documentation has ever been the authoritative definition of UABI
> > > >>>> in Linux, it just guides drivers and userspace towards a common
> > > >>>> understanding and common usage patterns.
> > > >>>>
> > > >>>> So even if the UABI contract is not documented (ugh), you need to be
> > > >>>> prepared to set the UABI contract through kernel implementation.
> > > >>>
> > > >>> To be the devil's advocate it probably wouldn't be an ABI regression but
> > > >>> just an regression. Same way as what nice(2) priorities mean hasn't
> > > >>> always been the same over the years, I don't think there is a strict
> > > >>> contract.
> > > >>>
> > > >>> Having said that, it may be different with latency sensitive stuff such
> > > >>> as UIs though since it is very observable and can be very painful to users.
> > > >>>
> > > >>>> If you do not document the UABI contract, then different drivers are
> > > >>>> likely to implement it differently, leading to differing behaviour.
> > > >>>> Also userspace will invent wild ways to abuse the UABI if there is no
> > > >>>> documentation guiding it on proper use. If userspace or end users
> > > >>>> observe different behaviour, that's bad even if it's not a regression.
> > > >>>>
> > > >>>> I don't like the situation either, but it is what it is. UABI stability
> > > >>>> trumps everything regardless of whether it was documented or not.
> > > >>>>
> > > >>>> I bet userspace is going to use this as a "make it faster, make it
> > > >>>> hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> > > >>>> library that stamps any and all fences with an expired deadline to
> > > >>>> just squeeze out a little more through some weird side-effect.
> > > >>>>
> > > >>>> Well, that's hopefully overboard in scaring, but in the end, I would
> > > >>>> like to see UABI documented so I can have a feeling of what it is for
> > > >>>> and how it was intended to be used. That's all.
> > > >>>
> > > >>> We share the same concern. If you read elsewhere in these threads you
> > > >>> will notice I have been calling this an "arms race". If the ability to
> > > >>> make yourself go faster does not required additional privilege I also
> > > >>> worry everyone will do it at which point it becomes pointless. So yes, I
> > > >>> do share this concern about exposing any of this as an unprivileged uapi.
> > > >>>
> > > >>> Is it possible to limit access to only compositors in some sane way?
> > > >>> Sounds tricky when dma-fence should be disconnected from DRM..
> > > >>
> > > >> Maybe it's not that bad in this particular case, because we are talking
> > > >> only about boosting GPU clocks which benefits everyone (except
> > > >> battery life) and it does not penalize other programs like e.g.
> > > >> job priorities do.
> > > >
> > > > Apart from efficiency that you mentioned, which does not always favor
> > > > higher clocks, sometimes thermal budget is also shared between CPU and
> > > > GPU. So more GPU clocks can mean fewer CPU clocks. It's really hard to
> > > > make optimal choices without the full coordination between both schedulers.
> > > >
> > > > But that is even not the main point, which is that if everyone sets the
> > > > immediate deadline then having the deadline API is a bit pointless. For
> > > > instance there is a reason negative nice needs CAP_SYS_ADMIN.
> > > >
> > > > However Rob has also pointed out the existence of uclamp.min via
> > > > sched_setattr which is unprivileged and can influence frequency
> > > > selection in the CPU world, so I conceded on that point. If CPU world
> > > > has accepted it so can we I guess.
> > > >
> > > > So IMO we are back to whether we can agree defining it is a hint is good
> > > > enough, be in via the name of the ioctl/flag itself or via documentation.
> > > >
> > > >> Drivers are not going to use the deadline for scheduling priorities,
> > > >> right? I don't recall seeing any mention of that.
> > > >>
> > > >> ...right?
> > > >
> > > > I wouldn't have thought it would be beneficial to preclude that, or
> > > > assume what drivers would do with the info to begin with.
> > > >
> > > > For instance in i915 we almost had a deadline based scheduler which was
> > > > much fairer than the current priority sorted fifo and in an ideal world
> > > > we would either revive or re-implement that idea. In which case
> > > > considering the fence deadline would naturally slot in and give true
> > > > integration with compositor deadlines (not just boost clocks and pray it
> > > > helps).
> > > How is user-space to decide whether to use ioctl(SET_DEADLINE) or
> > > poll(POLLPRI)?
> >
> > Implementation of blocking gl/vk/cl APIs, like glFinish() would use
> > poll(POLLPRI).  It could also set an immediate deadline and then call
> > poll() without POLLPRI.
> >
> > Other than compositors which do frame-pacing I expect the main usage
> > of either of these is mesa.
>
> Okay, so it looks like we already agreed that having a way to bump frequency
> from userspace is acceptable. either because there are already other ways
> that you can waste power and because this already acceptable in the CPU
> world.
>
> But why we are doing this in hidden ways then?
>
> Why can't we have this hint per context that is getting executed?
> (either with a boost-context flag or with some low/med/max or '-1' to '1'
> value like the latency priority)?
>
> I don't like the waitboost because this heurisitic fails in some media cases.
> I don't like the global setting because we might be alternating a top-priority
> with low-priority cases...
>
> So, why not something per context in execution?
>

It needs to be finer granularity than per-context, because not all
waits should trigger boosting.  For example, virglrenderer ends up
with a thread polling unsignaled fences to know when to signal an
interrupt to the guest virtgpu.  This alone shouldn't trigger
boosting.  (We also wouldn't want to completely disable boosting for
virglrenderer.)  Or the usermode driver could be waiting on a fence to
know when to do some cleanup.

That is not to say that there isn't room for per-context flags to
disable/enable boosting for fences created by that context, meaning it
could be an AND operation for i915 if it needs to be.

BR,
-R
