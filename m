Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE0E97C8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C946ECA9;
	Wed, 30 Oct 2019 08:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C936E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 01:19:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j5so2865930lfh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 18:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WWAk8nl162OD2/T/WUNvI1nq5SwZ+OMJP+DEu+AWVM=;
 b=T6QIoCRZHbWQeT3qCo2o7t1sg0TPboB6saXezUzSG5q4KLpEFrCGH+lRqQjTiOae2P
 kuGi0OxGsMR+XqnBIMeqnQ1x9Raezs9FmgoSWZRjoRTcM6iFrGPir0cqjeuBQUZ9OmbY
 m9oL97kZ23xeC3LVoAuXPR3wCZHjeafNJEs/+vsq0LNaR4p6UjONGc2fK3lkPxwV3tzI
 EqJXESpxC7Edil3uS1fCYsRJaZfgGoUI6qveuvs5uQ+cArq3yqLK9tn3boi8mC8356va
 Jg/Y1X6pA/qbBmnQHm+DN3sDEKJmKYdrvTWE4L46LGcTcN6yCOuRguoH5qLS3260OYed
 1xRA==
X-Gm-Message-State: APjAAAUbr6VD1VqZc6QJE4pkH7TNf1t/izvCXCMp0OoFwzc9jiMVwwaK
 7vGSMqCXhg6it1vyTmHN16Pax0EZ9+4C4K8G8rIC
X-Google-Smtp-Source: APXvYqyOizLeNLWCcQoX3gIp96frXfYZiUZghzESjobmVXUaEot+54fYt1N8R/E81OO1YUjRuThhydjn9vDrzk2UWIM=
X-Received: by 2002:a19:6d19:: with SMTP id i25mr399784lfc.178.1572311991380; 
 Mon, 28 Oct 2019 18:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
In-Reply-To: <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Mon, 28 Oct 2019 18:19:40 -0700
Message-ID: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
To: Jerome Glisse <jglisse@redhat.com>
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7WWAk8nl162OD2/T/WUNvI1nq5SwZ+OMJP+DEu+AWVM=;
 b=Cp9P6cgRUGpt+jKALHrJBzQs8mpkUeU7HBt8eGeS+jfhpO/p7LL2vYoI2WgWYNNOmF
 wcdOmenqWGR9Ph0O3J7USCC6kCXcNgY3MKIxaL/rTEI4x91NQDcoJ/Rj6iiMcR73uklc
 2c5lNw1312cwOF2K6xIn46J9lzTashrKjupIsombb6gwb6OD+AB5h9F1cVc6B11CmMe8
 LXPXuJp7kRFtH+1ssFD+MgfuG9B1hhES3iwOR0K1+uOIkizOGP6uSJg+dtCDh9IZTxEU
 6zhbW1aLn1qnH5+WNOKXENjITltNLw2iGMTp26bJfSfSMOysJzl+eXHA8amVB8CbHpxx
 h7aA==
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
Cc: Alistair Delva <adelva@google.com>, dri-devel@lists.freedesktop.org,
 Prahlad Kilambi <prahladk@google.com>, Sean Paul <seanpaul@chromium.org>,
 kraxel@redhat.com, Chris Forbes <chrisforbes@google.com>,
 kernel-team@android.com
Content-Type: multipart/mixed; boundary="===============0725760628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0725760628==
Content-Type: multipart/alternative; boundary="000000000000b956780596026906"

--000000000000b956780596026906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome and all folks,

In addition to my last reply, I just wanna get some more information
regarding this on the upstream side.

1. Do you think this(standardize a way to report GPU private allocations)
is going to be a useful thing on the upstream as well? It grants a lot
benefits for Android, but I'd like to get an idea for the non-Android world=
.

2. There might be some worries that upstream kernel driver has no idea
regarding the API. However, to achieve good fidelity around memory
reporting, we'd have to pass down certain metadata which is known only by
the userland. Consider this use case: on the upstream side, freedreno for
example, some memory buffer object(BO) during its own lifecycle could
represent totally different things, and kmd is not aware of that. When we'd
like to take memory snapshots at certain granularity, we have to know what
that buffer represents so that the snapshot can be meaningful and useful.

If we just keep this Android specific, I'd worry some day the upstream has
standardized a way to report this and Android vendors have to take extra
efforts to migrate over. This is one of the main reasons we'd like to do
this on the upstream side.

Timeline wise, Android has explicit deadlines for the next release and we
have to push hard towards those. Any prompt responses are very much
appreciated!

Best regards,
Yiwei

On Mon, Oct 28, 2019 at 11:33 AM Yiwei Zhang <zzyiwei@google.com> wrote:

> On Mon, Oct 28, 2019 at 8:26 AM Jerome Glisse <jglisse@redhat.com> wrote:
>
>> On Fri, Oct 25, 2019 at 11:35:32AM -0700, Yiwei Zhang wrote:
>> > Hi folks,
>> >
>> > This is the plain text version of the previous email in case that was
>> > considered as spam.
>> >
>> > --- Background ---
>> > On the downstream Android, vendors used to report GPU private memory
>> > allocations with debugfs nodes in their own formats. However, debugfs
>> nodes
>> > are getting deprecated in the next Android release.
>>
>> Maybe explain why it is useful first ?
>>
>
> Memory is precious on Android mobile platforms. Apps using a large amount
> of
> memory, games, tend to maintain a table for the memory on different
> devices with
> different prediction models. Private gpu memory allocations is
> currently semi-blind
> to the apps and the platform as well.
>
> By having the data, the platform can do:
> (1) GPU memory profiling as part of the huge Android profiler in progress=
.
> (2) Android system health team can enrich the performance test coverage.
> (3) We can collect filed metrics to detect any regression on the gpu
> private memory
> allocations in the production population.
> (4) Shell user can easily dump the allocations in a uniform way across
> vendors.
> (5) Platform can feed the data to the apps so that apps can do memory
> allocations
> in a more predictable way.
>
>
>> >
>> > --- Proposal ---
>> > We are taking the chance to unify all the vendors to migrate their
>> existing
>> > debugfs nodes into a standardized sysfs node structure. Then the
>> platform
>> > is able to do a bunch of useful things: memory profiling, system healt=
h
>> > coverage, field metrics, local shell dump, in-app api, etc. This
>> proposal
>> > is better served upstream as all GPU vendors can standardize a gpu
>> memory
>> > structure and reduce fragmentation across Android and Linux that clien=
ts
>> > can rely on.
>> >
>> > --- Detailed design ---
>> > The sysfs node structure looks like below:
>> > /sys/devices/<ro.gfx.sysfs.0>/<pid>/<type_name>
>> > e.g. "/sys/devices/mali0/gpu_mem/606/gl_buffer" and the gl_buffer is a
>> node
>> > having the comma separated size values: "4096,81920,...,4096".
>>
>> How does kernel knows what API the allocation is use for ? With the
>> open source driver you never specify what API is creating a gem object
>> (opengl, vulkan, ...) nor what purpose (transient, shader, ...).
>>
>
> Oh, is this a hard requirement for the open source drivers to not bookkee=
p
> any
> data from userland? I think the API is just some additional metadata
> passed down.
>
>
>>
>> > For the top level root, vendors can choose their own names based on th=
e
>> > value of ro.gfx.sysfs.0 the vendors set. (1) For the multiple gpu driv=
er
>> > cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the 2nd and 3rd
>> KMDs.
>> > (2) It's also allowed to put some sub-dir for example "kgsl/gpu_mem" o=
r
>> > "mali0/gpu_mem" in the ro.gfx.sysfs.<channel> property if the root nam=
e
>> > under /sys/devices/ is already created and used for other purposes.
>>
>> On one side you want to standardize on the other you want to give
>> complete freedom on the top level naming scheme. I would rather see a
>> consistent naming scheme (ie something more restraint and with little
>> place for interpration by individual driver)
>>
>
> Thanks for commenting on this. We definitely need some suggestions on the
> root
> directory. In the multi-gpu case on desktop, is there some existing
> consumer to
> query "some data" from all the GPUs? How does the tool find all GPUs and
> differentiate between them? Is this already standardized?
>
> > For the 2nd level "pid", there are usually just a couple of them per
>> > snapshot, since we only takes snapshot for the active ones.
>>
>> ? Do not understand here, you can have any number of applications with
>> GPU objects ? And thus there is no bound on the number of PID. Please
>> consider desktop too, i do not know what kind of limitation android
>> impose.
>>
>
> We are only interested in tracking *active* GPU private allocations. So
> yes, any
> application currently holding an active GPU context will probably has a
> node here.
> Since we want to do profiling for specific apps, the data has to be per
> application
> based. I don't get your concerns here. If it's about the tracking
> overhead, it's rare
> to see tons of application doing private gpu allocations at the same time=
.
> Could
> you help elaborate a bit?
>
> > For the 3rd level "type_name", the type name will be one of the GPU
>> memory
>> > object types in lower case, and the value will be a comma separated
>> > sequence of size values for all the allocations under that specific
>> type.
>> >
>> > We especially would like some comments on this part. For the GPU memor=
y
>> > object types, we defined 9 different types for Android:
>> > (1) UNKNOWN // not accounted for in any other category
>> > (2) SHADER // shader binaries
>> > (3) COMMAND // allocations which have a lifetime similar to a
>> > VkCommandBuffer
>> > (4) VULKAN // backing for VkDeviceMemory
>> > (5) GL_TEXTURE // GL Texture and RenderBuffer
>> > (6) GL_BUFFER // GL Buffer
>> > (7) QUERY // backing for query
>> > (8) DESCRIPTOR // allocations which have a lifetime similar to a
>> > VkDescriptorSet
>> > (9) TRANSIENT // random transient things that the driver needs
>> >
>> > We are wondering if those type enumerations make sense to the upstream
>> side
>> > as well, or maybe we just deal with our own different type sets. Cuz o=
n
>> the
>> > Android side, we'll just read those nodes named after the types we
>> defined
>> > in the sysfs node structure.
>>
>> See my above point of open source driver and kernel being unaware
>> of the allocation purpose and use.
>>
>> Cheers,
>> J=C3=A9r=C3=B4me
>>
>>
> Many thanks for the reply!
> Yiwei
>

--000000000000b956780596026906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Jerome and all folks,<div><br></div><div>In additi=
on to my last reply, I just wanna get some more information regarding this =
on the upstream side.</div><div><br></div><div>1. Do you think this(standar=
dize a way to report GPU private allocations) is going to be a useful thing=
 on the upstream as well? It grants a lot benefits for Android, but I&#39;d=
 like to get an idea for the non-Android world.</div><div><br></div><div>2.=
 There might be some worries that upstream kernel driver has no idea regard=
ing the API. However, to achieve good fidelity around memory reporting, we&=
#39;d have to pass down certain metadata which is known only by the=C2=A0us=
erland. Consider this use case: on the upstream side, freedreno for example=
, some memory buffer object(BO) during its own lifecycle could represent to=
tally different=C2=A0things, and kmd is not aware of that. When we&#39;d li=
ke to take memory snapshots at certain granularity, we have to know what th=
at buffer represents so that the snapshot can be meaningful and useful.</di=
v><div><br></div><div>If we just keep this Android specific, I&#39;d worry =
some day the upstream has standardized a way to report this and Android ven=
dors have to take extra efforts to migrate over. This is one of the main re=
asons we&#39;d like to do this on the upstream side.=C2=A0</div><div><br></=
div><div>Timeline wise, Android has explicit deadlines for the next release=
 and we have to push hard towards those. Any prompt responses are very much=
 appreciated!</div><div><br></div><div>Best regards,</div><div>Yiwei</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Oct 28, 2019 at 11:33 AM Yiwei Zhang &lt;<a href=3D"mailto:zzyiwei@g=
oogle.com">zzyiwei@google.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct =
28, 2019 at 8:26 AM Jerome Glisse &lt;<a href=3D"mailto:jglisse@redhat.com"=
 target=3D"_blank">jglisse@redhat.com</a>&gt; wrote:<br></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct=
 25, 2019 at 11:35:32AM -0700, Yiwei Zhang wrote:<br>
&gt; Hi folks,<br>
&gt; <br>
&gt; This is the plain text version of the previous email in case that was<=
br>
&gt; considered as spam.<br>
&gt; <br>
&gt; --- Background ---<br>
&gt; On the downstream Android, vendors used to report GPU private memory<b=
r>
&gt; allocations with debugfs nodes in their own formats. However, debugfs =
nodes<br>
&gt; are getting deprecated in the next Android release.<br>
<br>
Maybe explain why it is useful first ?<br></blockquote><div><br></div><div>=
Memory is precious on Android mobile platforms. Apps using a large amount o=
f</div><div>memory, games, tend to maintain a table for the memory on diffe=
rent devices with</div><div>different prediction models. Private gpu memory=
 allocations is currently=C2=A0semi-blind</div><div>to the apps and the pla=
tform as well.</div><div><br></div><div>By having the data, the platform ca=
n do:</div><div>(1) GPU memory profiling as part of the huge Android profil=
er in progress.</div><div>(2) Android system health team can enrich the per=
formance test coverage.</div><div>(3) We can collect filed metrics to detec=
t any regression on the gpu private memory</div><div>allocations in the pro=
duction population.</div><div>(4) Shell user can easily dump the allocation=
s in a uniform way across vendors.</div><div>(5) Platform can feed the data=
 to the apps so that apps can do memory allocations</div><div>in a more pre=
dictable way.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; --- Proposal ---<br>
&gt; We are taking the chance to unify all the vendors to migrate their exi=
sting<br>
&gt; debugfs nodes into a standardized sysfs node structure. Then the platf=
orm<br>
&gt; is able to do a bunch of useful things: memory profiling, system healt=
h<br>
&gt; coverage, field metrics, local shell dump, in-app api, etc. This propo=
sal<br>
&gt; is better served upstream as all GPU vendors can standardize a gpu mem=
ory<br>
&gt; structure and reduce fragmentation across Android and Linux that clien=
ts<br>
&gt; can rely on.<br>
&gt; <br>
&gt; --- Detailed design ---<br>
&gt; The sysfs node structure looks like below:<br>
&gt; /sys/devices/&lt;ro.gfx.sysfs.0&gt;/&lt;pid&gt;/&lt;type_name&gt;<br>
&gt; e.g. &quot;/sys/devices/mali0/gpu_mem/606/gl_buffer&quot; and the gl_b=
uffer is a node<br>
&gt; having the comma separated size values: &quot;4096,81920,...,4096&quot=
;.<br>
<br>
How does kernel knows what API the allocation is use for ? With the<br>
open source driver you never specify what API is creating a gem object<br>
(opengl, vulkan, ...) nor what purpose (transient, shader, ...).<br></block=
quote><div><br></div><div>Oh, is this a hard requirement for the open sourc=
e drivers to not bookkeep any</div><div>data from userland? I think the API=
 is just some additional metadata passed down.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; For the top level root, vendors can choose their own names based on th=
e<br>
&gt; value of ro.gfx.sysfs.0 the vendors set. (1) For the multiple gpu driv=
er<br>
&gt; cases, we can use ro.gfx.sysfs.1, ro.gfx.sysfs.2 for the 2nd and 3rd K=
MDs.<br>
&gt; (2) It&#39;s also allowed to put some sub-dir for example &quot;kgsl/g=
pu_mem&quot; or<br>
&gt; &quot;mali0/gpu_mem&quot; in the ro.gfx.sysfs.&lt;channel&gt; property=
 if the root name<br>
&gt; under /sys/devices/ is already created and used for other purposes.<br=
>
<br>
On one side you want to standardize on the other you want to give<br>
complete freedom on the top level naming scheme. I would rather see a<br>
consistent naming scheme (ie something more restraint and with little<br>
place for interpration by individual driver)<br></blockquote><div><br></div=
><div>Thanks for commenting on this. We definitely need some suggestions on=
 the root</div><div>directory. In the multi-gpu case on desktop, is there s=
ome existing consumer to</div><div>query &quot;some data&quot; from all the=
 GPUs? How does the tool find all GPUs and</div><div>differentiate between =
them? Is this already standardized?<br><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt; For the 2nd level &quot;pid&quot;, there are usually just a couple of =
them per<br>
&gt; snapshot, since we only takes snapshot for the active ones.<br>
<br>
? Do not understand here, you can have any number of applications with<br>
GPU objects ? And thus there is no bound on the number of PID. Please<br>
consider desktop too, i do not know what kind of limitation android<br>
impose.<br></blockquote><div><br></div><div>We are only interested in track=
ing *active* GPU private allocations. So yes, any</div><div>application cur=
rently holding an active GPU context will probably has a node here.</div><d=
iv>Since we want to do profiling for specific apps, the data has to be per =
application</div><div>based. I don&#39;t=C2=A0get your concerns here. If it=
&#39;s about the tracking overhead, it&#39;s rare</div><div>to see tons of =
application doing private gpu allocations at the same time. Could</div><div=
>you help elaborate=C2=A0a bit?</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; For the 3rd level &quot;type_name&quot;, the type name will be one of =
the GPU memory<br>
&gt; object types in lower case, and the value will be a comma separated<br=
>
&gt; sequence of size values for all the allocations under that specific ty=
pe.<br>
&gt; <br>
&gt; We especially would like some comments on this part. For the GPU memor=
y<br>
&gt; object types, we defined 9 different types for Android:<br>
&gt; (1) UNKNOWN // not accounted for in any other category<br>
&gt; (2) SHADER // shader binaries<br>
&gt; (3) COMMAND // allocations which have a lifetime similar to a<br>
&gt; VkCommandBuffer<br>
&gt; (4) VULKAN // backing for VkDeviceMemory<br>
&gt; (5) GL_TEXTURE // GL Texture and RenderBuffer<br>
&gt; (6) GL_BUFFER // GL Buffer<br>
&gt; (7) QUERY // backing for query<br>
&gt; (8) DESCRIPTOR // allocations which have a lifetime similar to a<br>
&gt; VkDescriptorSet<br>
&gt; (9) TRANSIENT // random transient things that the driver needs<br>
&gt;<br>
&gt; We are wondering if those type enumerations make sense to the upstream=
 side<br>
&gt; as well, or maybe we just deal with our own different type sets. Cuz o=
n the<br>
&gt; Android side, we&#39;ll just read those nodes named after the types we=
 defined<br>
&gt; in the sysfs node structure.<br>
<br>
See my above point of open source driver and kernel being unaware<br>
of the allocation purpose and use.<br>
<br>
Cheers,<br>
J=C3=A9r=C3=B4me<br>
<br></blockquote><div><br></div><div>Many thanks for the reply!</div><div>Y=
iwei</div></div></div>
</blockquote></div>

--000000000000b956780596026906--

--===============0725760628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0725760628==--
