Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D1EBEF9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8326F75F;
	Fri,  1 Nov 2019 08:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089B36F3B2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 16:59:32 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x9so2587112lji.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 09:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EK9PWFKvdQMF2HNDCSi2Uqniejur2W+8883VhsQew70=;
 b=KwtrAE03oxotdZ0tRQbfgWfm0KxSYCG+URWeIXwgpIeD2Mo056Zlm05f/SMArt4uZG
 bk7GEgip43FVV2eocyfWW0IwrmcFHuY7TwYl45hIbQkP3y75/B0CxCb0+9c9dPL28M2g
 mrYgLFPQEEfRr2ARA8iltIkYNiWXwIMRwFOESACHLz8l7dkOTA6pEhMFQg4wrIGXqt2M
 Uy5a6IBmE0lxsd+w8z9sxwO7015acmmQeaLxK3LBvdR1KTY8w7DnluyKhv1Qj/Ok/qrV
 5w+uF0SPVQJ8WkXHbag27EFxNbs9ZBsneLPSw49R4TwdhQUiTabFtMPR0jFUemkJNBnK
 Mq2w==
X-Gm-Message-State: APjAAAXIh08gwv+kFfcPJMACiPd4mFuFI2WLdy5aAMDoAl7OVPeCySgP
 /2XcSY9rRL1qRvGzTksKv6xNzOYPzHdjB+8CB2m13vU=
X-Google-Smtp-Source: APXvYqyVfhY8TknUp7D3l86bL6jfjYPoefCmlzRmhAYLV/z+KVbRTnlYcqX71pzKx4zDU9+pru5OCjVxLMsTljdPbOQ=
X-Received: by 2002:a2e:8959:: with SMTP id b25mr5122844ljk.240.1572541169842; 
 Thu, 31 Oct 2019 09:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
 <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
In-Reply-To: <CAOWid-c_5+Z438kHpgn-h9KGt12kzoSD43nRfg0-v10NUKa+tw@mail.gmail.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Thu, 31 Oct 2019 09:59:18 -0700
Message-ID: <CAKT=dD=Jyqn25hrZycQu96pwqcEWepjJFy2yVMyAp2RL42b+Hw@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Kenny Ho <y2kenny@gmail.com>
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EK9PWFKvdQMF2HNDCSi2Uqniejur2W+8883VhsQew70=;
 b=UgLSrkwKuFxpsyzIp7S5NHwnMesZmeoRQ9rK1++xuOs7O4wklA3CrWmUSATqBpP99M
 jpO1gM3tUPswWSvBQeyz7ePt/pm5t2FlOVtWyi4qnqNNckxFJbojtfSwQi1ZGO5EC68Y
 hP/4N2CxsmpNhyD1e3nZNq7mz0zPmdxDLGiXriDShZ3Fk4HbB4RM2DuW36abdZaxScRX
 FZUVpWrNvtM+auDh4MMfRjPlbznUmmz54pfqhVf3AE2NU6Z6K+6KiaNlu9NXEv7DrsZB
 Y7emXVjjsvV+o7k4R9ns3hA87ftIlx4z1BTPMXA3KWdvHYukKD4gJtvVBO8iwLT7vjDI
 O2sg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 kraxel@redhat.com, Chris Forbes <chrisforbes@google.com>,
 kernel-team@android.com
Content-Type: multipart/mixed; boundary="===============1547981709=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1547981709==
Content-Type: multipart/alternative; boundary="000000000000d30311059637c528"

--000000000000d30311059637c528
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kenny,

Thanks for the info. Do you mind forwarding the existing discussion to me
or have me cc'ed in that thread?

Best,
Yiwei

On Wed, Oct 30, 2019 at 10:23 PM Kenny Ho <y2kenny@gmail.com> wrote:

> Hi Yiwei,
>
> I am not sure if you are aware, there is an ongoing RFC on adding drm
> support in cgroup for the purpose of resource tracking.  One of the
> resource is GPU memory.  It's not exactly the same as what you are
> proposing (it doesn't track API usage, but it tracks the type of GPU
> memory from kmd perspective) but perhaps it would be of interest to
> you.  There are no consensus on it at this point.
>
> (sorry for being late to the discussion.  I only noticed this thread
> when one of the email got lucky and escape the spam folder.)
>
> Regards,
> Kenny
>
> On Wed, Oct 30, 2019 at 4:14 AM Yiwei Zhang <zzyiwei@google.com> wrote:
> >
> > Hi Jerome and all folks,
> >
> > In addition to my last reply, I just wanna get some more information
> regarding this on the upstream side.
> >
> > 1. Do you think this(standardize a way to report GPU private
> allocations) is going to be a useful thing on the upstream as well? It
> grants a lot benefits for Android, but I'd like to get an idea for the
> non-Android world.
> >
> > 2. There might be some worries that upstream kernel driver has no idea
> regarding the API. However, to achieve good fidelity around memory
> reporting, we'd have to pass down certain metadata which is known only by
> the userland. Consider this use case: on the upstream side, freedreno for
> example, some memory buffer object(BO) during its own lifecycle could
> represent totally different things, and kmd is not aware of that. When we=
'd
> like to take memory snapshots at certain granularity, we have to know wha=
t
> that buffer represents so that the snapshot can be meaningful and useful.
> >
> > If we just keep this Android specific, I'd worry some day the upstream
> has standardized a way to report this and Android vendors have to take
> extra efforts to migrate over. This is one of the main reasons we'd like =
to
> do this on the upstream side.
> >
> > Timeline wise, Android has explicit deadlines for the next release and
> we have to push hard towards those. Any prompt responses are very much
> appreciated!
> >
> > Best regards,
> > Yiwei
> >
> > On Mon, Oct 28, 2019 at 11:33 AM Yiwei Zhang <zzyiwei@google.com> wrote=
:
> >>
> >> On Mon, Oct 28, 2019 at 8:26 AM Jerome Glisse <jglisse@redhat.com>
> wrote:
> >>>
> >>> On Fri, Oct 25, 2019 at 11:35:32AM -0700, Yiwei Zhang wrote:
> >>> > Hi folks,
> >>> >
> >>> > This is the plain text version of the previous email in case that w=
as
> >>> > considered as spam.
> >>> >
> >>> > --- Background ---
> >>> > On the downstream Android, vendors used to report GPU private memor=
y
> >>> > allocations with debugfs nodes in their own formats. However,
> debugfs nodes
> >>> > are getting deprecated in the next Android release.
> >>>
> >>> Maybe explain why it is useful first ?
> >>
> >>
> >> Memory is precious on Android mobile platforms. Apps using a large
> amount of
> >> memory, games, tend to maintain a table for the memory on different
> devices with
> >> different prediction models. Private gpu memory allocations is
> currently semi-blind
> >> to the apps and the platform as well.
> >>
> >> By having the data, the platform can do:
> >> (1) GPU memory profiling as part of the huge Android profiler in
> progress.
> >> (2) Android system health team can enrich the performance test coverag=
e.
> >> (3) We can collect filed metrics to detect any regression on the gpu
> private memory
> >> allocations in the production population.
> >> (4) Shell user can easily dump the allocations in a uniform way across
> vendors.
> >> (5) Platform can feed the data to the apps so that apps can do memory
> allocations
> >> in a more predictable way.
> >>
> >>>
> >>> >
> >>> > --- Proposal ---
> >>> > We are taking the chance to unify all the vendors to migrate their
> existing
> >>> > debugfs nodes into a standardized sysfs node structure. Then the
> platform
> >>> > is able to do a bunch of useful things: memory profiling, system
> health
> >>> > coverage, field metrics, local shell dump, in-app api, etc. This
> proposal
> >>> > is better served upstream as all GPU vendors can standardize a gpu
> memory
> >>> > structure and reduce fragmentation across Android and Linux that
> clients
> >>> > can rely on.
> >>> >
> >>> > --- Detailed design ---
> >>> > The sysfs node structure looks like below:
> >>> > /sys/devices/<ro.gfx.sysfs.0>/<pid>/<type_name>
> >>> > e.g. "/sys/devices/mali0/gpu_mem/606/gl_buffer" and the gl_buffer i=
s
> a node
> >>> > having the comma separated size values: "4096,81920,...,4096".
> >>>
> >>> How does kernel knows what API the allocation is use for ? With the
> >>> open source driver you never specify what API is creating a gem objec=
t
> >>> (opengl, vulkan, ...) nor what purpose (transient, shader, ...).
> >>
> >>
> >> Oh, is this a hard requirement for the open source drivers to not
> bookkeep any
> >> data from userland? I think the API is just some additional metadata
> passed down.
> >>
> >>>
> >>>
> >>> > For the top level root, vendors can choose their own names based on
> the
> >>> > value of ro.gfx.sysfs.0 the vendors set. (1) For the multiple gpu
> driver
> >>> > cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the 2nd and 3r=
d
> KMDs.
> >>> > (2) It's also allowed to put some sub-dir for example "kgsl/gpu_mem=
"
> or
> >>> > "mali0/gpu_mem" in the ro.gfx.sysfs.<channel> property if the root
> name
> >>> > under /sys/devices/ is already created and used for other purposes.
> >>>
> >>> On one side you want to standardize on the other you want to give
> >>> complete freedom on the top level naming scheme. I would rather see a
> >>> consistent naming scheme (ie something more restraint and with little
> >>> place for interpration by individual driver)
> >>
> >>
> >> Thanks for commenting on this. We definitely need some suggestions on
> the root
> >> directory. In the multi-gpu case on desktop, is there some existing
> consumer to
> >> query "some data" from all the GPUs? How does the tool find all GPUs a=
nd
> >> differentiate between them? Is this already standardized?
> >>
> >>> > For the 2nd level "pid", there are usually just a couple of them pe=
r
> >>> > snapshot, since we only takes snapshot for the active ones.
> >>>
> >>> ? Do not understand here, you can have any number of applications wit=
h
> >>> GPU objects ? And thus there is no bound on the number of PID. Please
> >>> consider desktop too, i do not know what kind of limitation android
> >>> impose.
> >>
> >>
> >> We are only interested in tracking *active* GPU private allocations. S=
o
> yes, any
> >> application currently holding an active GPU context will probably has =
a
> node here.
> >> Since we want to do profiling for specific apps, the data has to be pe=
r
> application
> >> based. I don't get your concerns here. If it's about the tracking
> overhead, it's rare
> >> to see tons of application doing private gpu allocations at the same
> time. Could
> >> you help elaborate a bit?
> >>
> >>> > For the 3rd level "type_name", the type name will be one of the GPU
> memory
> >>> > object types in lower case, and the value will be a comma separated
> >>> > sequence of size values for all the allocations under that specific
> type.
> >>> >
> >>> > We especially would like some comments on this part. For the GPU
> memory
> >>> > object types, we defined 9 different types for Android:
> >>> > (1) UNKNOWN // not accounted for in any other category
> >>> > (2) SHADER // shader binaries
> >>> > (3) COMMAND // allocations which have a lifetime similar to a
> >>> > VkCommandBuffer
> >>> > (4) VULKAN // backing for VkDeviceMemory
> >>> > (5) GL_TEXTURE // GL Texture and RenderBuffer
> >>> > (6) GL_BUFFER // GL Buffer
> >>> > (7) QUERY // backing for query
> >>> > (8) DESCRIPTOR // allocations which have a lifetime similar to a
> >>> > VkDescriptorSet
> >>> > (9) TRANSIENT // random transient things that the driver needs
> >>> >
> >>> > We are wondering if those type enumerations make sense to the
> upstream side
> >>> > as well, or maybe we just deal with our own different type sets. Cu=
z
> on the
> >>> > Android side, we'll just read those nodes named after the types we
> defined
> >>> > in the sysfs node structure.
> >>>
> >>> See my above point of open source driver and kernel being unaware
> >>> of the allocation purpose and use.
> >>>
> >>> Cheers,
> >>> J=C3=A9r=C3=B4me
> >>>
> >>
> >> Many thanks for the reply!
> >> Yiwei
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000d30311059637c528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Kenny,<div><br></div><div>Thanks for the info. Do =
you mind forwarding the existing discussion to me or have me cc&#39;ed in t=
hat thread?</div><div><br></div><div>Best,</div><div>Yiwei</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct=
 30, 2019 at 10:23 PM Kenny Ho &lt;<a href=3D"mailto:y2kenny@gmail.com">y2k=
enny@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Yiwei,<br>
<br>
I am not sure if you are aware, there is an ongoing RFC on adding drm<br>
support in cgroup for the purpose of resource tracking.=C2=A0 One of the<br=
>
resource is GPU memory.=C2=A0 It&#39;s not exactly the same as what you are=
<br>
proposing (it doesn&#39;t track API usage, but it tracks the type of GPU<br=
>
memory from kmd perspective) but perhaps it would be of interest to<br>
you.=C2=A0 There are no consensus on it at this point.<br>
<br>
(sorry for being late to the discussion.=C2=A0 I only noticed this thread<b=
r>
when one of the email got lucky and escape the spam folder.)<br>
<br>
Regards,<br>
Kenny<br>
<br>
On Wed, Oct 30, 2019 at 4:14 AM Yiwei Zhang &lt;<a href=3D"mailto:zzyiwei@g=
oogle.com" target=3D"_blank">zzyiwei@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Jerome and all folks,<br>
&gt;<br>
&gt; In addition to my last reply, I just wanna get some more information r=
egarding this on the upstream side.<br>
&gt;<br>
&gt; 1. Do you think this(standardize a way to report GPU private allocatio=
ns) is going to be a useful thing on the upstream as well? It grants a lot =
benefits for Android, but I&#39;d like to get an idea for the non-Android w=
orld.<br>
&gt;<br>
&gt; 2. There might be some worries that upstream kernel driver has no idea=
 regarding the API. However, to achieve good fidelity around memory reporti=
ng, we&#39;d have to pass down certain metadata which is known only by the =
userland. Consider this use case: on the upstream side, freedreno for examp=
le, some memory buffer object(BO) during its own lifecycle could represent =
totally different things, and kmd is not aware of that. When we&#39;d like =
to take memory snapshots at certain granularity, we have to know what that =
buffer represents so that the snapshot can be meaningful and useful.<br>
&gt;<br>
&gt; If we just keep this Android specific, I&#39;d worry some day the upst=
ream has standardized a way to report this and Android vendors have to take=
 extra efforts to migrate over. This is one of the main reasons we&#39;d li=
ke to do this on the upstream side.<br>
&gt;<br>
&gt; Timeline wise, Android has explicit deadlines for the next release and=
 we have to push hard towards those. Any prompt responses are very much app=
reciated!<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Yiwei<br>
&gt;<br>
&gt; On Mon, Oct 28, 2019 at 11:33 AM Yiwei Zhang &lt;<a href=3D"mailto:zzy=
iwei@google.com" target=3D"_blank">zzyiwei@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Oct 28, 2019 at 8:26 AM Jerome Glisse &lt;<a href=3D"mailt=
o:jglisse@redhat.com" target=3D"_blank">jglisse@redhat.com</a>&gt; wrote:<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Oct 25, 2019 at 11:35:32AM -0700, Yiwei Zhang wrote:<b=
r>
&gt;&gt;&gt; &gt; Hi folks,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; This is the plain text version of the previous email in c=
ase that was<br>
&gt;&gt;&gt; &gt; considered as spam.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; --- Background ---<br>
&gt;&gt;&gt; &gt; On the downstream Android, vendors used to report GPU pri=
vate memory<br>
&gt;&gt;&gt; &gt; allocations with debugfs nodes in their own formats. Howe=
ver, debugfs nodes<br>
&gt;&gt;&gt; &gt; are getting deprecated in the next Android release.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Maybe explain why it is useful first ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Memory is precious on Android mobile platforms. Apps using a large=
 amount of<br>
&gt;&gt; memory, games, tend to maintain a table for the memory on differen=
t devices with<br>
&gt;&gt; different prediction models. Private gpu memory allocations is cur=
rently semi-blind<br>
&gt;&gt; to the apps and the platform as well.<br>
&gt;&gt;<br>
&gt;&gt; By having the data, the platform can do:<br>
&gt;&gt; (1) GPU memory profiling as part of the huge Android profiler in p=
rogress.<br>
&gt;&gt; (2) Android system health team can enrich the performance test cov=
erage.<br>
&gt;&gt; (3) We can collect filed metrics to detect any regression on the g=
pu private memory<br>
&gt;&gt; allocations in the production population.<br>
&gt;&gt; (4) Shell user can easily dump the allocations in a uniform way ac=
ross vendors.<br>
&gt;&gt; (5) Platform can feed the data to the apps so that apps can do mem=
ory allocations<br>
&gt;&gt; in a more predictable way.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; --- Proposal ---<br>
&gt;&gt;&gt; &gt; We are taking the chance to unify all the vendors to migr=
ate their existing<br>
&gt;&gt;&gt; &gt; debugfs nodes into a standardized sysfs node structure. T=
hen the platform<br>
&gt;&gt;&gt; &gt; is able to do a bunch of useful things: memory profiling,=
 system health<br>
&gt;&gt;&gt; &gt; coverage, field metrics, local shell dump, in-app api, et=
c. This proposal<br>
&gt;&gt;&gt; &gt; is better served upstream as all GPU vendors can standard=
ize a gpu memory<br>
&gt;&gt;&gt; &gt; structure and reduce fragmentation across Android and Lin=
ux that clients<br>
&gt;&gt;&gt; &gt; can rely on.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; --- Detailed design ---<br>
&gt;&gt;&gt; &gt; The sysfs node structure looks like below:<br>
&gt;&gt;&gt; &gt; /sys/devices/&lt;ro.gfx.sysfs.0&gt;/&lt;pid&gt;/&lt;type_=
name&gt;<br>
&gt;&gt;&gt; &gt; e.g. &quot;/sys/devices/mali0/gpu_mem/606/gl_buffer&quot;=
 and the gl_buffer is a node<br>
&gt;&gt;&gt; &gt; having the comma separated size values: &quot;4096,81920,=
...,4096&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; How does kernel knows what API the allocation is use for ? Wit=
h the<br>
&gt;&gt;&gt; open source driver you never specify what API is creating a ge=
m object<br>
&gt;&gt;&gt; (opengl, vulkan, ...) nor what purpose (transient, shader, ...=
).<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Oh, is this a hard requirement for the open source drivers to not =
bookkeep any<br>
&gt;&gt; data from userland? I think the API is just some additional metada=
ta passed down.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; For the top level root, vendors can choose their own name=
s based on the<br>
&gt;&gt;&gt; &gt; value of ro.gfx.sysfs.0 the vendors set. (1) For the mult=
iple gpu driver<br>
&gt;&gt;&gt; &gt; cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the =
2nd and 3rd KMDs.<br>
&gt;&gt;&gt; &gt; (2) It&#39;s also allowed to put some sub-dir for example=
 &quot;kgsl/gpu_mem&quot; or<br>
&gt;&gt;&gt; &gt; &quot;mali0/gpu_mem&quot; in the ro.gfx.sysfs.&lt;channel=
&gt; property if the root name<br>
&gt;&gt;&gt; &gt; under /sys/devices/ is already created and used for other=
 purposes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On one side you want to standardize on the other you want to g=
ive<br>
&gt;&gt;&gt; complete freedom on the top level naming scheme. I would rathe=
r see a<br>
&gt;&gt;&gt; consistent naming scheme (ie something more restraint and with=
 little<br>
&gt;&gt;&gt; place for interpration by individual driver)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks for commenting on this. We definitely need some suggestions=
 on the root<br>
&gt;&gt; directory. In the multi-gpu case on desktop, is there some existin=
g consumer to<br>
&gt;&gt; query &quot;some data&quot; from all the GPUs? How does the tool f=
ind all GPUs and<br>
&gt;&gt; differentiate between them? Is this already standardized?<br>
&gt;&gt;<br>
&gt;&gt;&gt; &gt; For the 2nd level &quot;pid&quot;, there are usually just=
 a couple of them per<br>
&gt;&gt;&gt; &gt; snapshot, since we only takes snapshot for the active one=
s.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ? Do not understand here, you can have any number of applicati=
ons with<br>
&gt;&gt;&gt; GPU objects ? And thus there is no bound on the number of PID.=
 Please<br>
&gt;&gt;&gt; consider desktop too, i do not know what kind of limitation an=
droid<br>
&gt;&gt;&gt; impose.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; We are only interested in tracking *active* GPU private allocation=
s. So yes, any<br>
&gt;&gt; application currently holding an active GPU context will probably =
has a node here.<br>
&gt;&gt; Since we want to do profiling for specific apps, the data has to b=
e per application<br>
&gt;&gt; based. I don&#39;t get your concerns here. If it&#39;s about the t=
racking overhead, it&#39;s rare<br>
&gt;&gt; to see tons of application doing private gpu allocations at the sa=
me time. Could<br>
&gt;&gt; you help elaborate a bit?<br>
&gt;&gt;<br>
&gt;&gt;&gt; &gt; For the 3rd level &quot;type_name&quot;, the type name wi=
ll be one of the GPU memory<br>
&gt;&gt;&gt; &gt; object types in lower case, and the value will be a comma=
 separated<br>
&gt;&gt;&gt; &gt; sequence of size values for all the allocations under tha=
t specific type.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; We especially would like some comments on this part. For =
the GPU memory<br>
&gt;&gt;&gt; &gt; object types, we defined 9 different types for Android:<b=
r>
&gt;&gt;&gt; &gt; (1) UNKNOWN // not accounted for in any other category<br=
>
&gt;&gt;&gt; &gt; (2) SHADER // shader binaries<br>
&gt;&gt;&gt; &gt; (3) COMMAND // allocations which have a lifetime similar =
to a<br>
&gt;&gt;&gt; &gt; VkCommandBuffer<br>
&gt;&gt;&gt; &gt; (4) VULKAN // backing for VkDeviceMemory<br>
&gt;&gt;&gt; &gt; (5) GL_TEXTURE // GL Texture and RenderBuffer<br>
&gt;&gt;&gt; &gt; (6) GL_BUFFER // GL Buffer<br>
&gt;&gt;&gt; &gt; (7) QUERY // backing for query<br>
&gt;&gt;&gt; &gt; (8) DESCRIPTOR // allocations which have a lifetime simil=
ar to a<br>
&gt;&gt;&gt; &gt; VkDescriptorSet<br>
&gt;&gt;&gt; &gt; (9) TRANSIENT // random transient things that the driver =
needs<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; We are wondering if those type enumerations make sense to=
 the upstream side<br>
&gt;&gt;&gt; &gt; as well, or maybe we just deal with our own different typ=
e sets. Cuz on the<br>
&gt;&gt;&gt; &gt; Android side, we&#39;ll just read those nodes named after=
 the types we defined<br>
&gt;&gt;&gt; &gt; in the sysfs node structure.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; See my above point of open source driver and kernel being unaw=
are<br>
&gt;&gt;&gt; of the allocation purpose and use.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt; J=C3=A9r=C3=B4me<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Many thanks for the reply!<br>
&gt;&gt; Yiwei<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div>

--000000000000d30311059637c528--

--===============1547981709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1547981709==--
