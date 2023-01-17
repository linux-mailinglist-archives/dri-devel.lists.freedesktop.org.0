Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD466E3D4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C110E2EC;
	Tue, 17 Jan 2023 16:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E40F10E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:41:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id vw16so13567804ejc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+R+JxyO1aeyP9UIcWUVYDO2PkFd86y9+Q/RMd9odxaU=;
 b=0HEFqrRd8RZEqwGvtZO4h0a134+uV7feWTbCj0vDez8lC6w4gZ7hCvAv7TqT7LXV0g
 2Sm24Bxul5vIeMTzeu2Ayw4wSLeFeIHkrLzcI82DjrfErL2uYikuYdHq3Uhp9YjFkEyC
 9vKan8SdeS35Vo2erhgkcTS7bRrMZB3z7BDbpfZIys4IAxK20iBphHTddB3Bay78Gbgl
 iMXveWMYFwq4tKO2zkvOF2TXQAtitJupejS6IF9ws2OcsBNU+jgWLJF+DhgJSuEnnXsp
 j9boyYghnBrQtTBUG8lQIf66+BJBRYoryMc849e+t3Uqgl7QtFlJEhD6ga5U+tfFpiw4
 TeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+R+JxyO1aeyP9UIcWUVYDO2PkFd86y9+Q/RMd9odxaU=;
 b=dJlOBuReVN0I5fTCdDv5j0pG/yevrrwn7ONvH7JZIPH71pNcQsT9Db480AyEM9fU3l
 qirQpZYbVn5XcO1ZDgSHctdCkJFnT8em24k291WdLF1yFUbuV1cA5GHzOaQ8FTPy+W1D
 ulXfyC8+OUUjXD9eNpdBp5QttJYhVqa46dY/8EZUfyG4+0akA+Dp3DF5ZILnYOgaErIT
 3etDDC0cKpvIBM9b/x7elO5zs+tInM5+OZW/Mb6n5efLM8S7zXKJZgO/2YWsp6pybefO
 59tKZ+Sw2OL2+MmtAPwVxClyVcl/fxtQWc1yJjaaKLiNtxkpRagGxIyyGk33UA2xQz4p
 gkhQ==
X-Gm-Message-State: AFqh2kriObLhZL+g6mF+cnG2lOVHe/i2p8YUAVWl+ZTJ8FQlaNu1safk
 RTlgcg/eXiJuWFKaKL3K4TLS3lBqwRVuwLa76RwldmftpVP4U490
X-Google-Smtp-Source: AMrXdXvQ4QxA1+hZ4+baCIFMLvOJHS3L3tZlGSBLuBmOD1F3qpglmCC0haQO39Xdkj/7EtpGmFZ0W1qV0VEVDi9B+g8=
X-Received: by 2002:a17:907:c243:b0:7c0:e391:c548 with SMTP id
 tj3-20020a170907c24300b007c0e391c548mr451276ejc.18.1673973667784; Tue, 17 Jan
 2023 08:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
 <Y7dA3cfSfKDuGkXZ@DUT025-TGLU.fm.intel.com>
 <20230112095425.77a3jhyoipvqtc3o@ldmartin-desk2>
 <Y8A/EI/23Ng+MCaC@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Y8A/EI/23Ng+MCaC@DUT025-TGLU.fm.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Jan 2023 10:40:55 -0600
Message-ID: <CAOFGe95-g4fswTee7HW2sFcxicVeiBZgFRb5OH7=zahjK-0CQg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="000000000000d503bf05f2785dad"
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d503bf05f2785dad
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 11:17 AM Matthew Brost <matthew.brost@intel.com>
wrote:

> On Thu, Jan 12, 2023 at 10:54:25AM +0100, Lucas De Marchi wrote:
> > On Thu, Jan 05, 2023 at 09:27:57PM +0000, Matthew Brost wrote:
> > > On Tue, Jan 03, 2023 at 12:21:08PM +0000, Tvrtko Ursulin wrote:
> > > >
> > > > On 22/12/2022 22:21, Matthew Brost wrote:
> > > > > Hello,
> > > > >
> > > > > This is a submission for Xe, a new driver for Intel GPUs that
> supports both
> > > > > integrated and discrete platforms starting with Tiger Lake (first
> platform with
> > > > > Intel Xe Architecture). The intention of this new driver is to
> have a fresh base
> > > > > to work from that is unencumbered by older platforms, whilst also
> taking the
> > > > > opportunity to rearchitect our driver to increase sharing across
> the drm
> > > > > subsystem, both leveraging and allowing us to contribute more
> towards other
> > > > > shared components like TTM and drm/scheduler. The memory model is
> based on VM
> > > > > bind which is similar to the i915 implementation. Likewise the
> execbuf
> > > > > implementation for Xe is very similar to execbuf3 in the i915 [1].
> > > > >
> > > > > The code is at a stage where it is already functional and has
> experimental
> > > > > support for multiple platforms starting from Tiger Lake, with
> initial support
> > > > > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan
> drivers), as well
> > > > > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2]
> and NEO
> > > > > implementation will be released publicly early next year. We also
> have a suite
> > > > > of IGTs for XE that will appear on the IGT list shortly.
> > > > >
> > > > > It has been built with the assumption of supporting multiple
> architectures from
> > > > > the get-go, right now with tests running both on X86 and ARM
> hosts. And we
> > > > > intend to continue working on it and improving on it as part of
> the kernel
> > > > > community upstream.
> > > > >
> > > > > The new Xe driver leverages a lot from i915 and work on i915
> continues as we
> > > > > ready Xe for production throughout 2023.
> > > > >
> > > > > As for display, the intent is to share the display code with the
> i915 driver so
> > > > > that there is maximum reuse there. Currently this is being done by
> compiling the
> > > > > display code twice, but alternatives to that are under
> consideration and we want
> > > > > to have more discussion on what the best final solution will look
> like over the
> > > > > next few months. Right now, work is ongoing in refactoring the
> display codebase
> > > > > to remove as much as possible any unnecessary dependencies on i915
> specific data
> > > > > structures there..
> > > > >
> > > > > We currently have 2 submission backends, execlists and GuC. The
> execlist is
> > > > > meant mostly for testing and is not fully functional while GuC
> backend is fully
> > > > > functional. As with the i915 and GuC submission, in Xe the GuC
> firmware is
> > > > > required and should be placed in /lib/firmware/xe.
> > > >
> > > > What is the plan going forward for the execlists backend? I think it
> would
> > > > be preferable to not upstream something semi-functional and so to
> carry
> > > > technical debt in the brand new code base, from the very start. If
> it is for
> > > > Tigerlake, which is the starting platform for Xe, could it be made
> GuC only
> > > > Tigerlake for instance?
> > > >
> > >
> > > A little background here. In the original PoC written by Jason and
> Dave,
> > > the execlist backend was the only one present and it was in
> semi-working
> > > state. As soon as myself and a few others started working on Xe we went
> > > full in a on the GuC backend. We left the execlist backend basically in
> > > the state it was in. We left it in place for 2 reasons.
> > >
> > > 1. Having 2 backends from the start ensured we layered our code
> > > correctly. The layer was a complete disaster in the i915 so we really
> > > wanted to avoid that.
> > > 2. The thought was it might be needed for early product bring up one
> > > day.
> > >
> > > As I think about this a bit more, we likely just delete execlist
> backend
> > > before merging this upstream and perhaps just carry 1 large patch
> > > internally with this implementation that we can use as needed. Final
> > > decession TDB though.
> >
> > but that might regress after some time on "let's keep 2 backends so we
> > layer the code correctly". Leaving the additional backend behind
> > CONFIG_BROKEN or XE_EXPERIMENTAL, or something like that, not
> > enabled by distros, but enabled in CI would be a good idea IMO.
> >
> > Carrying a large patch out of tree would make things harder for new
> > platforms. A perfect backend split would make it possible, but like I
> > said, we are likely not to have it if we delete the second backend.
> >
>
> Good points here Lucas. One thing that we absolutely have wrong is
> falling back to execlists if GuC firmware is missing. We def should not
> be doing that as it creates confusion.
>

Yeah, we certainly shouldn't be falling back on it silently. That's a
recipe for disaster. If it stays, it should be behind a config option
that's clearly labeled as broken or not intended for production use. If
someone is a zero-firmware purist and wants to enable it and accept the
brokenness, that's their choice.

I'm not especially attached to the execlist back-end so I'm not going to
insist on anything here RE keeping it.

There is more to me starting with execlists than avoiding GuC, though. One
of the reasons I did it was to prove that the same core Xe scheduling model
[3] doesn't depend on firmware. As long as your hardware has some ability
to juggle independent per-context rings, you can get the same separation
and it makes everything cleaner. If this is the direction things are headed
(and I really think it is; I need to blog about it), being able to do the
Xe model on more primitive hardware which lacks competent firmware-based
submission is important. I wanted to prototype that to show that it could
be done.

I also kinda wanted to prove that execlists didn't have to be horrible like
in i915. You know, for funzies....

--Jason

[3]:
https://lists.freedesktop.org/archives/dri-devel/2023-January/386381.html



> I kinda like the idea hiding it behind a config option + module
> parameter to use the backend so you really, really need to try to be
> able to use it + with this in the code it make us disciplined in our
> layering. At some point we will likely another supported backend and at
> that point we may decide to delete this backend.
>
> Matt
>
> > Lucas De Marchi
> >
> > >
> > > Matt
> > >
> > > > Regards,
> > > >
> > > > Tvrtko
>

--000000000000d503bf05f2785dad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jan 12, 2023 at 11:17 AM Matthew Brost &lt;<a href=3D"mailto=
:matthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 12, 2023 at 10=
:54:25AM +0100, Lucas De Marchi wrote:<br>
&gt; On Thu, Jan 05, 2023 at 09:27:57PM +0000, Matthew Brost wrote:<br>
&gt; &gt; On Tue, Jan 03, 2023 at 12:21:08PM +0000, Tvrtko Ursulin wrote:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 22/12/2022 22:21, Matthew Brost wrote:<br>
&gt; &gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is a submission for Xe, a new driver for Intel GPU=
s that supports both<br>
&gt; &gt; &gt; &gt; integrated and discrete platforms starting with Tiger L=
ake (first platform with<br>
&gt; &gt; &gt; &gt; Intel Xe Architecture). The intention of this new drive=
r is to have a fresh base<br>
&gt; &gt; &gt; &gt; to work from that is unencumbered by older platforms, w=
hilst also taking the<br>
&gt; &gt; &gt; &gt; opportunity to rearchitect our driver to increase shari=
ng across the drm<br>
&gt; &gt; &gt; &gt; subsystem, both leveraging and allowing us to contribut=
e more towards other<br>
&gt; &gt; &gt; &gt; shared components like TTM and drm/scheduler. The memor=
y model is based on VM<br>
&gt; &gt; &gt; &gt; bind which is similar to the i915 implementation. Likew=
ise the execbuf<br>
&gt; &gt; &gt; &gt; implementation for Xe is very similar to execbuf3 in th=
e i915 [1].<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The code is at a stage where it is already functional a=
nd has experimental<br>
&gt; &gt; &gt; &gt; support for multiple platforms starting from Tiger Lake=
, with initial support<br>
&gt; &gt; &gt; &gt; implemented in Mesa (for Iris and Anv, our OpenGL and V=
ulkan drivers), as well<br>
&gt; &gt; &gt; &gt; as in NEO (for OpenCL and Level0). A Mesa MR has been p=
osted [2] and NEO<br>
&gt; &gt; &gt; &gt; implementation will be released publicly early next yea=
r. We also have a suite<br>
&gt; &gt; &gt; &gt; of IGTs for XE that will appear on the IGT list shortly=
.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It has been built with the assumption of supporting mul=
tiple architectures from<br>
&gt; &gt; &gt; &gt; the get-go, right now with tests running both on X86 an=
d ARM hosts. And we<br>
&gt; &gt; &gt; &gt; intend to continue working on it and improving on it as=
 part of the kernel<br>
&gt; &gt; &gt; &gt; community upstream.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The new Xe driver leverages a lot from i915 and work on=
 i915 continues as we<br>
&gt; &gt; &gt; &gt; ready Xe for production throughout 2023.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; As for display, the intent is to share the display code=
 with the i915 driver so<br>
&gt; &gt; &gt; &gt; that there is maximum reuse there. Currently this is be=
ing done by compiling the<br>
&gt; &gt; &gt; &gt; display code twice, but alternatives to that are under =
consideration and we want<br>
&gt; &gt; &gt; &gt; to have more discussion on what the best final solution=
 will look like over the<br>
&gt; &gt; &gt; &gt; next few months. Right now, work is ongoing in refactor=
ing the display codebase<br>
&gt; &gt; &gt; &gt; to remove as much as possible any unnecessary dependenc=
ies on i915 specific data<br>
&gt; &gt; &gt; &gt; structures there..<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We currently have 2 submission backends, execlists and =
GuC. The execlist is<br>
&gt; &gt; &gt; &gt; meant mostly for testing and is not fully functional wh=
ile GuC backend is fully<br>
&gt; &gt; &gt; &gt; functional. As with the i915 and GuC submission, in Xe =
the GuC firmware is<br>
&gt; &gt; &gt; &gt; required and should be placed in /lib/firmware/xe.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; What is the plan going forward for the execlists backend? I =
think it would<br>
&gt; &gt; &gt; be preferable to not upstream something semi-functional and =
so to carry<br>
&gt; &gt; &gt; technical debt in the brand new code base, from the very sta=
rt. If it is for<br>
&gt; &gt; &gt; Tigerlake, which is the starting platform for Xe, could it b=
e made GuC only<br>
&gt; &gt; &gt; Tigerlake for instance?<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; A little background here. In the original PoC written by Jason an=
d Dave,<br>
&gt; &gt; the execlist backend was the only one present and it was in semi-=
working<br>
&gt; &gt; state. As soon as myself and a few others started working on Xe w=
e went<br>
&gt; &gt; full in a on the GuC backend. We left the execlist backend basica=
lly in<br>
&gt; &gt; the state it was in. We left it in place for 2 reasons.<br>
&gt; &gt; <br>
&gt; &gt; 1. Having 2 backends from the start ensured we layered our code<b=
r>
&gt; &gt; correctly. The layer was a complete disaster in the i915 so we re=
ally<br>
&gt; &gt; wanted to avoid that.<br>
&gt; &gt; 2. The thought was it might be needed for early product bring up =
one<br>
&gt; &gt; day.<br>
&gt; &gt; <br>
&gt; &gt; As I think about this a bit more, we likely just delete execlist =
backend<br>
&gt; &gt; before merging this upstream and perhaps just carry 1 large patch=
<br>
&gt; &gt; internally with this implementation that we can use as needed. Fi=
nal<br>
&gt; &gt; decession TDB though.<br>
&gt; <br>
&gt; but that might regress after some time on &quot;let&#39;s keep 2 backe=
nds so we<br>
&gt; layer the code correctly&quot;. Leaving the additional backend behind<=
br>
&gt; CONFIG_BROKEN or XE_EXPERIMENTAL, or something like that, not<br>
&gt; enabled by distros, but enabled in CI would be a good idea IMO.<br>
&gt; <br>
&gt; Carrying a large patch out of tree would make things harder for new<br=
>
&gt; platforms. A perfect backend split would make it possible, but like I<=
br>
&gt; said, we are likely not to have it if we delete the second backend.<br=
>
&gt; <br>
<br>
Good points here Lucas. One thing that we absolutely have wrong is<br>
falling back to execlists if GuC firmware is missing. We def should not<br>
be doing that as it creates confusion.<br></blockquote><div><br></div><div>=
Yeah, we certainly shouldn&#39;t be falling back on it silently. That&#39;s=
 a recipe for disaster. If it stays, it should be behind a config option th=
at&#39;s clearly labeled as broken or not intended for production use. If s=
omeone is a zero-firmware purist and wants to enable it and accept the brok=
enness, that&#39;s their choice.</div><div><br></div><div>I&#39;m not espec=
ially attached to the execlist back-end so I&#39;m not going to insist on a=
nything here RE keeping it.</div><div><br></div><div>There is more to me st=
arting with execlists than avoiding GuC, though. One of the reasons I did i=
t was to prove that the same core Xe scheduling model [3] doesn&#39;t depen=
d on firmware. As long as your hardware has some ability to juggle independ=
ent per-context rings, you can get the same separation and it makes everyth=
ing cleaner. If this is the direction things are headed (and I really think=
 it is; I need to blog about it), being able to do the Xe model on more pri=
mitive hardware which lacks competent firmware-based submission is importan=
t. I wanted to prototype that to show that it could be done.</div><div><br>=
</div><div>I also kinda wanted to prove that execlists didn&#39;t have to b=
e horrible like in i915. You know, for funzies....</div><div><br></div><div=
>--Jason</div><div><br></div><div>[3]: <a href=3D"https://lists.freedesktop=
.org/archives/dri-devel/2023-January/386381.html">https://lists.freedesktop=
.org/archives/dri-devel/2023-January/386381.html</a></div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I kinda like the idea hiding it behind a config option + module<br>
parameter to use the backend so you really, really need to try to be<br>
able to use it + with this in the code it make us disciplined in our<br>
layering. At some point we will likely another supported backend and at<br>
that point we may decide to delete this backend.<br>
<br>
Matt<br>
<br>
&gt; Lucas De Marchi<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Matt<br>
&gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Tvrtko<br>
</blockquote></div></div>

--000000000000d503bf05f2785dad--
