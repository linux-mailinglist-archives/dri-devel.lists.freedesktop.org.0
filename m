Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153C769CF0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA8210E2CE;
	Mon, 31 Jul 2023 16:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBFB10E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:40:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5222bc916acso6172000a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690821603; x=1691426403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eaA5ZM7YmQZbGm4ybIj4vIWLy+z0rMIf3OT6ejTe1I0=;
 b=Cf3/B2r+2GJc0kWZVCB8+hMNIl+J/77ZvGogoSfii/kcTJdHMa4G6qo4406JFiWonk
 cMQudC/0SydkAKPZuYg1CIxfhQSwIRpJK6aW9MYU/4hZ7d2auHPfP63noCb3k7e8OMPs
 Kwf4r6HGpDgaKUwVvq/dwioY9FnK3rrJkRjjrsVwfd34GUOmxRekWs3GMm24oyM0qE2e
 KAawe78u+0h5HXamDLi6fhTFIC2636lXxNDSsAgbfI4O8VkehY8pyUD5Uu8tHN2IvYzF
 UJGwWmgK1zSJ/rrarFo1z6NNoWezTY6EajzKncJeWBvxIegQ4BecNa7iXQSczR+HgQZP
 EBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690821603; x=1691426403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaA5ZM7YmQZbGm4ybIj4vIWLy+z0rMIf3OT6ejTe1I0=;
 b=g56BiM2JEN5UBwiNdBnPMqccgw3B16c+LgFEIg9RrYhem7Tq3ZkUuaEUswaOE54Q6+
 HamrK1NxgOMQUmQIdJ/b8LRNZM7DC8wxXU8K7GpusFu2HwLoZDOWnBIe09n6toT8iBVF
 deCJ4UwHVvNIghRwIP+m43j7fTEZTC1qwO9WCOGnewPYm1OHQj6AUgEjNaD+1ytHllNP
 nU88XxlP4twHn+z02NY2roa9oqGcUSUg8JZXZVQIuDy55A6K+CamsyJ34mo4H13PAVmh
 xQckFr9y+Hu5DW3NJdySvO70LKcn0PlxeWVHZ6g1HOSeitNthrZbT2SP8M2Q6WpQxwxn
 FsUA==
X-Gm-Message-State: ABy/qLYqEtdQIzkv5EypuH5YJu2SbB+QaiVI+0cOCZQI1lCZYXAjMAfg
 40Y6MQp1B01ik9kDrZNDcwH1AuYnAwd8qN/KlxLe+A==
X-Google-Smtp-Source: APBJJlEqqaLz6hJIqsxycCY46ra+wCPIxF+KldeWg0bAmVxCgnZp0VuJkU4C5tcQrhSrYtYxOUAqW6SwrwAvyTjBOnE=
X-Received: by 2002:aa7:db53:0:b0:522:2af3:4997 with SMTP id
 n19-20020aa7db53000000b005222af34997mr331435edt.15.1690821603472; Mon, 31 Jul
 2023 09:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
 <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
 <75c86224-6183-07fe-da04-6a2101615a50@redhat.com>
 <21ea63fe-33d7-a075-7291-35dd1b2a9b64@redhat.com>
 <CAOFGe949K6iiQDqdxDPkJ2Zxr=iJ5ad-qLEGb=f1iQcvES+H5A@mail.gmail.com>
In-Reply-To: <CAOFGe949K6iiQDqdxDPkJ2Zxr=iJ5ad-qLEGb=f1iQcvES+H5A@mail.gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 31 Jul 2023 11:39:51 -0500
Message-ID: <CAOFGe97RJnYD9Z6i=PKEsDxpOcPsobTFSVPztdfjTJWhPWU3FA@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000dd1050601cb1559"
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000dd1050601cb1559
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2023 at 10:30=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.ne=
t> wrote:

>
> On Tue, Jul 25, 2023 at 5:48=E2=80=AFPM Danilo Krummrich <dakr@redhat.com=
> wrote:
>
>> On 7/25/23 18:43, Danilo Krummrich wrote:
>> > On 7/25/23 18:16, Faith Ekstrand wrote:
>> >> Thanks for the detailed write-up! That would definitely explain it. I=
f
>> >> I remember, I'll try to do a single-threaded run or two. If your
>> >> theory is correct, there should be no real perf difference when
>> >> running single-threaded. Those runs will take a long time, though, so
>> >> I'll have to run them over night. I'll let you know in a few days onc=
e
>> >> I have the results.
>> >
>> > I can also push a separate branch where I just print out a warning
>> > whenever we run into such a condition including the time we were
>> waiting
>> > for things to complete. I can probably push something later today.
>>
>>
>> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next=
-track-stalls
>>
>> It prints out the duration of every wait as well as the total wait time
>> since boot.
>>
>> - Danilo
>>
>> >
>> >>
>> >> If this theory holds, then I'm not concerned about the performance of
>> >> the API itself. It would still be good to see if we can find a way to
>> >> reduce the cross-process drag in the implementation but that's a perf
>> >> optimization we can do later.
>> >
>> >  From the kernel side I think the only thing we could really do is to
>> > temporarily run a secondary drm_gpu_scheduler instance, one for
>> VM_BINDs
>> > and one for EXECs until we got the new page table handling in place.
>> >
>> > However, the UMD could avoid such conditions more effectively, since i=
t
>> > controls the address space. Namely, avoid re-using the same region of
>> > the address space right away in certain cases. For instance, instead o=
f
>> > replacing a sparse region A[0x0, 0x4000000] with a larger sparse regio=
n
>> > B[0x0, 0x8000000], replace it with B'[0x4000000, 0xC000000] if possibl=
e.
>> >
>> > However, just mentioning this for completeness. The UMD surely
>> shouldn't
>> > probably even temporarily work around such a kernel limitation.
>> >
>> > Anyway, before doing any of those, let's see if the theory holds and
>> > we're actually running into such cases.
>> >
>> >>
>> >> Does it actually matter? Yes, it kinda does. No, it probably doesn't
>> >> matter for games because you're typically only running one game at a
>> >> time. From a development PoV, however, if it makes CI take longer the=
n
>> >> that slows down development and that's not good for the users, either=
.
>>
>
> I've run a bunch of tests over the weekend and It's starting to look like
> the added CTS time might be from the newly enabled synchronization tests
> themselves.  We enabled timeline semaphores as well as semaphore and fenc=
e
> sharing along with the new uAPI and I did not expect those to be nearly
> that heavy-weight so I didn't think of that as a likely factor. I'm doing=
 a
> couple more runs to confirm but what I'm seeing right now seems to indica=
te
> that the new API with the old feature set has about the same run time now
> that the submit overhead issue has been fixed.
>

My last two runs have come back and confirmed this theory. With the BO
fixes, all remaining slow-downs are coming from newly added tests which
turn out to be very slow tests.

~Faith


> I think this means that we can proceed under the assumption that there ar=
e
> no more serious perf issues with the new API.  I'm happy to RB/ACK the ne=
xt
> version of the API and implementation patches, as long as it has the new
> NO_SHARE BO create flag and properly rejects exports of NO_SHARE BOs, eve=
n
> if not all of the dma_resv plumbing is fully baked.
>
> ~Faith
>

--0000000000000dd1050601cb1559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Jul 30, 2023 at 10:30=E2=80=AFPM Faith Ekstrand &lt;<a href=
=3D"mailto:faith@gfxstrand.net">faith@gfxstrand.net</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2=
5, 2023 at 5:48=E2=80=AFPM Danilo Krummrich &lt;<a href=3D"mailto:dakr@redh=
at.com" target=3D"_blank">dakr@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 7/25/23 18:43, Danilo Krummrich=
 wrote:<br>
&gt; On 7/25/23 18:16, Faith Ekstrand wrote:<br>
&gt;&gt; Thanks for the detailed write-up! That would definitely explain it=
. If <br>
&gt;&gt; I remember, I&#39;ll try to do a single-threaded run or two. If yo=
ur <br>
&gt;&gt; theory is correct, there should be no real perf difference when <b=
r>
&gt;&gt; running single-threaded. Those runs will take a long time, though,=
 so <br>
&gt;&gt; I&#39;ll have to run them over night. I&#39;ll let you know in a f=
ew days once <br>
&gt;&gt; I have the results.<br>
&gt; <br>
&gt; I can also push a separate branch where I just print out a warning <br=
>
&gt; whenever we run into such a condition including the time we were waiti=
ng <br>
&gt; for things to complete. I can probably push something later today.<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-=
drm-next-track-stalls" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-track-stalls</a><=
br>
<br>
It prints out the duration of every wait as well as the total wait time <br=
>
since boot.<br>
<br>
- Danilo<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; If this theory holds, then I&#39;m not concerned about the perform=
ance of <br>
&gt;&gt; the API itself. It would still be good to see if we can find a way=
 to <br>
&gt;&gt; reduce the cross-process drag in the implementation but that&#39;s=
 a perf <br>
&gt;&gt; optimization we can do later.<br>
&gt; <br>
&gt;=C2=A0 From the kernel side I think the only thing we could really do i=
s to <br>
&gt; temporarily run a secondary drm_gpu_scheduler instance, one for VM_BIN=
Ds <br>
&gt; and one for EXECs until we got the new page table handling in place.<b=
r>
&gt; <br>
&gt; However, the UMD could avoid such conditions more effectively, since i=
t <br>
&gt; controls the address space. Namely, avoid re-using the same region of =
<br>
&gt; the address space right away in certain cases. For instance, instead o=
f <br>
&gt; replacing a sparse region A[0x0, 0x4000000] with a larger sparse regio=
n <br>
&gt; B[0x0, 0x8000000], replace it with B&#39;[0x4000000, 0xC000000] if pos=
sible.<br>
&gt; <br>
&gt; However, just mentioning this for completeness. The UMD surely shouldn=
&#39;t <br>
&gt; probably even temporarily work around such a kernel limitation.<br>
&gt; <br>
&gt; Anyway, before doing any of those, let&#39;s see if the theory holds a=
nd <br>
&gt; we&#39;re actually running into such cases.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Does it actually matter? Yes, it kinda does. No, it probably doesn=
&#39;t <br>
&gt;&gt; matter for games because you&#39;re typically only running one gam=
e at a <br>
&gt;&gt; time. From a development PoV, however, if it makes CI take longer =
then <br>
&gt;&gt; that slows down development and that&#39;s not good for the users,=
 either.<br></blockquote><div><br></div><div>I&#39;ve run a bunch of tests =
over the weekend and It&#39;s starting to look like the added CTS time migh=
t be from the newly enabled synchronization tests themselves.=C2=A0 We enab=
led timeline semaphores as well as semaphore and fence sharing along with t=
he new uAPI and I did not expect those to be nearly that heavy-weight so I =
didn&#39;t think of that as a likely factor. I&#39;m doing a couple more ru=
ns to confirm but what I&#39;m seeing right now seems to indicate that the =
new API with the old feature set has about the same run time now that the s=
ubmit overhead issue has been fixed.</div></div></div></blockquote><div><br=
></div><div>My last two runs have come back and confirmed this theory. With=
 the BO fixes, all remaining slow-downs are coming from newly added tests w=
hich turn out to be very slow tests.</div><div><br></div><div>~Faith<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div>I think this means that we can =
proceed under the assumption that there are no more serious perf issues wit=
h the new API.=C2=A0 I&#39;m happy to RB/ACK the next version of the API an=
d implementation patches, as long as it has the new NO_SHARE BO create flag=
 and properly rejects exports of NO_SHARE BOs, even if not all of the dma_r=
esv plumbing is fully baked.</div><div><br></div><div>~Faith<br></div></div=
></div>
</blockquote></div></div>

--0000000000000dd1050601cb1559--
