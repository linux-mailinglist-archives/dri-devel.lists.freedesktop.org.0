Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64239B676
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 20:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252916ED1E;
	Fri, 23 Aug 2019 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0016ED1E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 18:53:33 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t50so14938079edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 11:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BDXfIviE1lKAmy2BKZxi7Elg0Dvg2SzlySQMk9aK4Sk=;
 b=qas00JXxhHTNWix05TskmNlG1cHju5Ym1w2NGiNR8EsU5bGLXhGojl7sXA47JRvKUH
 FgVLmFmfOs8Y9MwewaVqpvNLmBaUitWUtXfUP5bt9HffjPELD+1Rl3yOleB9JeIpEXeW
 Z3PmH+EptbmTtFqtKrYR82UZKtN9LtDF0ebCUwS0bMP5r5oSSLIXszrlNHWmYDhyk5fG
 wIzTrFUPFgXQrOK0ZoejvW5u/6mlJezWPCmzLTyhPwSfDR6Pem0UkkHZpZE+55fdTZJW
 CPXvGWnRLgNRv5D/2DAonuzi9rJ5gK8IfYxli0JwZkWDmCNky13OYaQHghrqgLqkQn2U
 oZ0w==
X-Gm-Message-State: APjAAAVPdnrYcfAsHWZUoignzKvHZ2TlK5HF2Py/P5LByFu8Nz+SW1m+
 hcGFD95tESfEa26DqOJhTOcrJM/8lBo3ZCUFVDFPKQ==
X-Google-Smtp-Source: APXvYqw5V4aaxDkhILAom5GnSw4POgUrCCXo4QZxJFAPKEdsmuM0DjTozjf6mBY5gliEvaUaQe6hARRAfzuk8nzFRAI=
X-Received: by 2002:a17:906:79d8:: with SMTP id
 m24mr5608133ejo.289.1566586412277; 
 Fri, 23 Aug 2019 11:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190822145503.24630-1-lionel.g.landwerlin@intel.com>
 <CAOFGe96fLwPhmpuh8v2E7rcsrubxW6CA_sbU6yZOVdOQKSw9wQ@mail.gmail.com>
 <dc853f51-0800-17f8-ee56-3ff0d292d0bc@intel.com>
In-Reply-To: <dc853f51-0800-17f8-ee56-3ff0d292d0bc@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Aug 2019 13:53:20 -0500
Message-ID: <CAOFGe94BnYysnRRpfy4RovPrbQCaef7zw3Sd8kqTwLQiZWUREw@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Add documentation for timeline syncobj
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BDXfIviE1lKAmy2BKZxi7Elg0Dvg2SzlySQMk9aK4Sk=;
 b=KINJ9s74OWyEPQ3GhcEI/pWU+bP3STFLKDbuwGtRUtX6hh8qosc95mHA1gydlwcxb0
 5ATTiu+/NaG2odTx+lcnraTotb5gIi2IIp0bYdAwiKL9oJDoC8v7Owu+emCgceNFRDuP
 ip6R3LEHofDMTykf3EdgK550uZb6axLmN8N+7RSZ6Xj9iUDZF7kpwG52wTvYxAO03y+x
 DPs4LecllMS/tDYmKnfBIm+3srUpzXNu+ImLllz2V6o4Pf1eBW8tl0nqeAii4gcNQX5H
 8qCihJGci3ROZ96K6edIATQbZTup7DQUkVcBGPxTCIvPOD+LoD3YVfRh8CjKyQY9J+So
 NLXQ==
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0300099368=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0300099368==
Content-Type: multipart/alternative; boundary="0000000000009d3bb80590cd522f"

--0000000000009d3bb80590cd522f
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 22, 2019 at 5:28 PM Lionel Landwerlin <
lionel.g.landwerlin@intel.com> wrote:

> On 22/08/2019 21:24, Jason Ekstrand wrote:
>
> On Thu, Aug 22, 2019 at 9:55 AM Lionel Landwerlin <
> lionel.g.landwerlin@intel.com> wrote:
>
>> We've added a set of new APIs to manipulate syncobjs holding timelines
>> of dma_fence. This adds a bit of documentation about how this works.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Christian Koenig <Christian.Koenig@amd.com>
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 87 +++++++++++++++++++++++++++++------
>>  1 file changed, 74 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index b5ad73330a48..32ffded6d2c0 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -43,27 +43,66 @@
>>   *  - Signal a syncobj (set a trivially signaled fence)
>>   *  - Wait for a syncobj's fence to appear and be signaled
>>   *
>> + * The syncobj userspace API also provides operations to manipulate a
>> syncobj
>> + * in terms of a timeline of struct &dma_fence rather than a single
>> struct
>> + * &dma_fence, through the following operations:
>> + *
>> + *   - Signal a given point on the timeline
>> + *   - Wait for a given point to appear and/or be signaled
>> + *   - Import and export from/to a given point of a timeline
>> + *
>>   * At it's core, a syncobj is simply a wrapper around a pointer to a
>> struct
>>   * &dma_fence which may be NULL.
>>   * When a syncobj is first created, its pointer is either NULL or a
>> pointer
>>   * to an already signaled fence depending on whether the
>>   * &DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to
>>   * &DRM_IOCTL_SYNCOBJ_CREATE.
>> - * When GPU work which signals a syncobj is enqueued in a DRM driver,
>> - * the syncobj fence is replaced with a fence which will be signaled by
>> the
>> - * completion of that work.
>> - * When GPU work which waits on a syncobj is enqueued in a DRM driver,
>> the
>> - * driver retrieves syncobj's current fence at the time the work is
>> enqueued
>> - * waits on that fence before submitting the work to hardware.
>> - * If the syncobj's fence is NULL, the enqueue operation is expected to
>> fail.
>> - * All manipulation of the syncobjs's fence happens in terms of the
>> current
>> - * fence at the time the ioctl is called by userspace regardless of
>> whether
>> - * that operation is an immediate host-side operation (signal or reset)
>> or
>> - * or an operation which is enqueued in some driver queue.
>> - * &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be used to
>> - * manipulate a syncobj from the host by resetting its pointer to NULL or
>> + *
>> + * If the syncobj is considered as a binary (signal/unsignaled)
>> primitive,
>>
>
> What does "considered as a binary" mean?  Is it an inherent property of
> the syncobj given at create time?  Is it a state the syncobj can be in?  Or
> is it a property of how the submit ioctl in the DRM driver references it?
> I'm really hoping it's either 1 or 3....
>
>
> 3: you either use it binary/legacy apis, or timeline apis. timeline apis
> also provide some binary compatibility with the point 0 (in particular for
> wait).
>

Right.  Maybe we should say something like  "When GPU work is enqueued
which signals a non-zero time point" or something like that?  I guess that
implies a certain unification across drivers that maybe we don't want....


>
>
>> + * when GPU work is enqueued in a DRM driver to signal the syncobj, the
>> fence
>> + * is replaced with a fence which will be signaled by the completion of
>> that
>> + * work.
>> + * If the syncobj is considered as a timeline primitive, when GPU work is
>> + * enqueued in a DRM driver to signal the a given point of the syncobj,
>> a new
>> + * struct &dma_fence_chain pointing to the DRM driver's fence and also
>> + * pointing to the previous fence that was in the syncobj. The new struct
>> + * &dma_fence_chain fence put into the syncobj will be signaled by
>> completion
>> + * of the DRM driver's work and also any work associated with the fence
>> + * previously in the syncobj.
>> + *
>> + * When GPU work which waits on a syncobj is enqueued in a DRM driver,
>> at the
>> + * time the work is enqueued, it waits on the fence coming from the
>> syncobj
>> + * before submitting the work to hardware. That fence is either :
>> + *
>> + *    - The syncobj's current fence if the syncobj is considered as a
>> binary
>> + *      primitive.
>> + *    - The struct &dma_fence associated with a given point if the
>> syncobj is
>> + *      considered as a timeline primitive.
>> + *
>> + * If the syncobj's fence is NULL or not present in the syncobj's
>> timeline,
>> + * the enqueue operation is expected to fail.
>> + *
>> + * With binary syncobj, all manipulation of the syncobjs's fence happens
>> in
>> + * terms of the current fence at the time the ioctl is called by
>> userspace
>> + * regardless of whether that operation is an immediate host-side
>> operation
>> + * (signal or reset) or or an operation which is enqueued in some driver
>> + * queue. &DRM_IOCTL_SYNCOBJ_RESET and &DRM_IOCTL_SYNCOBJ_SIGNAL can be
>> used
>> + * to manipulate a syncobj from the host by resetting its pointer to
>> NULL or
>>   * setting its pointer to a fence which is already signaled.
>>   *
>> + * With timeline syncobj, all manipulation of the timeline fences
>> happens in
>> + * terms of the fence referred to in the timeline. See
>> + * dma_fence_chain_find_seqno() to see how a given point is found in the
>> + * timeline.
>> + *
>> + * Note that applications should be careful to always use timeline set of
>> + * ioctl() when dealing with syncobj considered as timeline. Using a
>> binary
>> + * set of ioctl() with a syncobj considered as timeline could result
>> incorrect
>> + * synchronization. The use of binary syncobj is supported through the
>> + * timeline set of ioctl() by using a point value of 0, this will
>> reproduce
>> + * the behavior of the binary set of ioctl() (for example replace the
>> + * syncobj's fence when signaling).
>>
>
> I know I've asked this before but I feel compelled to ask it again.  Why
> do we allow them to mix and match?  Why not just have a create flag and
> enforce meaningful behavior?  I'm a bit concerned that userspace is going
> to start relying on the subtlties of the interaction between timeline and
> binary syncobjs which are neither documented nor properly tested in IGT.
>
>
> For one, you might have to mix both types of syncobjs in a given
> wait/signal operation. So 0 ensures we can do that.
>

Right, that sounds like a useful feature.


> Second, drm-syncobj is a container and its payload is an interface
> (dma_fence) which has several implementations.
>
> The kernel primitive is just less restrictive than the Vulkan API here.
>
> I guess we could add a flag at creation to ensure the replacement of the
> fence in a timeline syncobj cannot happen.
>

I would be in favor of that but I'd be interested to hear what Christian or
David think.


> I haven't thought of all the implications that might have though... Should
> we allow reset on a timeline syncobj?
>

Good question.  I'm inclined to say "yes" because it's pretty well-defined
what such a reset means.  However, it's not really needed.


> -Lionel
>
>
>
> + *
>>   *
>>   * Host-side wait on syncobjs
>>   * --------------------------
>> @@ -87,6 +126,16 @@
>>   * synchronize between the two.
>>   * This requirement is inherited from the Vulkan fence API.
>>   *
>> + * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
>> + * handles as well as an array of u64 points and does a host-side wait
>> on all
>> + * of syncobj fences at the given points simultaneously.
>> + *
>> + * &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the ability to wait for a
>> given
>> + * fence to materialize on the timeline without waiting for the fence to
>> be
>> + * signaled by using the &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag.
>> This
>> + * requirement is inherited from the wait-before-signal behavior
>> required by
>> + * the Vulkan timeline semaphore API.
>> + *
>>   *
>>   * Import/export of syncobjs
>>   * -------------------------
>> @@ -120,6 +169,18 @@
>>   * Because sync files are immutable, resetting or signaling the syncobj
>>   * will not affect any sync files whose fences have been imported into
>> the
>>   * syncobj.
>> + *
>> + *
>> + * Import/export of timeline points in timeline syncobjs
>> + * -----------------------------------------------------
>> + *
>> + * &DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to transfer a struct
>> + * &dma_fence of at a given point from a timeline syncobj to another
>> point
>> + * into another timeline syncobj.
>> + *
>> + * Note that if you want to transfer a struct &dma_fence from a given
>> point on
>> + * a timeline syncobj from/into a binary syncobj, you can use the point
>> 0 to
>> + * mean take/replace the fence in the syncobj.
>>   */
>>
>>  #include <linux/anon_inodes.h>
>> --
>> 2.23.0
>>
>>
>

--0000000000009d3bb80590cd522f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22, 2019 at =
5:28 PM Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.landwerlin@intel.c=
om" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <div class=3D"gmail-m_-5272467495377520358gmail-m_-1548110483521490893m=
oz-cite-prefix">On 22/08/2019 21:24, Jason Ekstrand
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22, 2019 at 9:5=
5
            AM Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.landwerlin@=
intel.com" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We&#39;ve added=
 a set of new
            APIs to manipulate syncobjs holding timelines<br>
            of dma_fence. This adds a bit of documentation about how
            this works.<br>
            <br>
            Signed-off-by: Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g=
.landwerlin@intel.com" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&=
gt;<br>
            Cc: Christian Koenig &lt;<a href=3D"mailto:Christian.Koenig@amd=
.com" target=3D"_blank">Christian.Koenig@amd.com</a>&gt;<br>
            Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" =
target=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
            Cc: David(ChunMing) Zhou &lt;<a href=3D"mailto:David1.Zhou@amd.=
com" target=3D"_blank">David1.Zhou@amd.com</a>&gt;<br>
            ---<br>
            =C2=A0drivers/gpu/drm/drm_syncobj.c | 87
            +++++++++++++++++++++++++++++------<br>
            =C2=A01 file changed, 74 insertions(+), 13 deletions(-)<br>
            <br>
            diff --git a/drivers/gpu/drm/drm_syncobj.c
            b/drivers/gpu/drm/drm_syncobj.c<br>
            index b5ad73330a48..32ffded6d2c0 100644<br>
            --- a/drivers/gpu/drm/drm_syncobj.c<br>
            +++ b/drivers/gpu/drm/drm_syncobj.c<br>
            @@ -43,27 +43,66 @@<br>
            =C2=A0 *=C2=A0 - Signal a syncobj (set a trivially signaled fen=
ce)<br>
            =C2=A0 *=C2=A0 - Wait for a syncobj&#39;s fence to appear and b=
e signaled<br>
            =C2=A0 *<br>
            + * The syncobj userspace API also provides operations to
            manipulate a syncobj<br>
            + * in terms of a timeline of struct &amp;dma_fence rather
            than a single struct<br>
            + * &amp;dma_fence, through the following operations:<br>
            + *<br>
            + *=C2=A0 =C2=A0- Signal a given point on the timeline<br>
            + *=C2=A0 =C2=A0- Wait for a given point to appear and/or be si=
gnaled<br>
            + *=C2=A0 =C2=A0- Import and export from/to a given point of a
            timeline<br>
            + *<br>
            =C2=A0 * At it&#39;s core, a syncobj is simply a wrapper around=
 a
            pointer to a struct<br>
            =C2=A0 * &amp;dma_fence which may be NULL.<br>
            =C2=A0 * When a syncobj is first created, its pointer is either
            NULL or a pointer<br>
            =C2=A0 * to an already signaled fence depending on whether the<=
br>
            =C2=A0 * &amp;DRM_SYNCOBJ_CREATE_SIGNALED flag is passed to<br>
            =C2=A0 * &amp;DRM_IOCTL_SYNCOBJ_CREATE.<br>
            - * When GPU work which signals a syncobj is enqueued in a
            DRM driver,<br>
            - * the syncobj fence is replaced with a fence which will be
            signaled by the<br>
            - * completion of that work.<br>
            - * When GPU work which waits on a syncobj is enqueued in a
            DRM driver, the<br>
            - * driver retrieves syncobj&#39;s current fence at the time th=
e
            work is enqueued<br>
            - * waits on that fence before submitting the work to
            hardware.<br>
            - * If the syncobj&#39;s fence is NULL, the enqueue operation i=
s
            expected to fail.<br>
            - * All manipulation of the syncobjs&#39;s fence happens in
            terms of the current<br>
            - * fence at the time the ioctl is called by userspace
            regardless of whether<br>
            - * that operation is an immediate host-side operation
            (signal or reset) or<br>
            - * or an operation which is enqueued in some driver queue.<br>
            - * &amp;DRM_IOCTL_SYNCOBJ_RESET and
            &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be used to<br>
            - * manipulate a syncobj from the host by resetting its
            pointer to NULL or<br>
            + *<br>
            + * If the syncobj is considered as a binary
            (signal/unsignaled) primitive,<br>
          </blockquote>
          <div><br>
          </div>
          <div>What does &quot;considered as a binary&quot; mean?=C2=A0 Is =
it an
            inherent property of the syncobj given at create time?=C2=A0 Is
            it a state the syncobj can be in?=C2=A0 Or is it a property of
            how the submit ioctl in the DRM driver references it?=C2=A0 I&#=
39;m
            really hoping it&#39;s either 1 or 3....<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>3: you either use it binary/legacy apis, or timeline apis.
      timeline apis also provide some binary compatibility with the
      point 0 (in particular for wait).<br>
    </p>
    </div></blockquote><div><br></div><div>Right.=C2=A0 Maybe we should say=
 something like=C2=A0 &quot;When GPU work is enqueued which signals a non-z=
ero time point&quot; or something like that?=C2=A0 I guess that implies a c=
ertain unification across drivers that maybe we don&#39;t want....<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div bg=
color=3D"#FFFFFF">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            + * when GPU work is enqueued in a DRM driver to signal the
            syncobj, the fence<br>
            + * is replaced with a fence which will be signaled by the
            completion of that<br>
            + * work.<br>
            + * If the syncobj is considered as a timeline primitive,
            when GPU work is<br>
            + * enqueued in a DRM driver to signal the a given point of
            the syncobj, a new<br>
            + * struct &amp;dma_fence_chain pointing to the DRM driver&#39;=
s
            fence and also<br>
            + * pointing to the previous fence that was in the syncobj.
            The new struct<br>
            + * &amp;dma_fence_chain fence put into the syncobj will be
            signaled by completion<br>
            + * of the DRM driver&#39;s work and also any work associated
            with the fence<br>
            + * previously in the syncobj.<br>
            + *<br>
            + * When GPU work which waits on a syncobj is enqueued in a
            DRM driver, at the<br>
            + * time the work is enqueued, it waits on the fence coming
            from the syncobj<br>
            + * before submitting the work to hardware. That fence is
            either :<br>
            + *<br>
            + *=C2=A0 =C2=A0 - The syncobj&#39;s current fence if the synco=
bj is
            considered as a binary<br>
            + *=C2=A0 =C2=A0 =C2=A0 primitive.<br>
            + *=C2=A0 =C2=A0 - The struct &amp;dma_fence associated with a =
given
            point if the syncobj is<br>
            + *=C2=A0 =C2=A0 =C2=A0 considered as a timeline primitive.<br>
            + *<br>
            + * If the syncobj&#39;s fence is NULL or not present in the
            syncobj&#39;s timeline,<br>
            + * the enqueue operation is expected to fail.<br>
            + *<br>
            + * With binary syncobj, all manipulation of the syncobjs&#39;s
            fence happens in<br>
            + * terms of the current fence at the time the ioctl is
            called by userspace<br>
            + * regardless of whether that operation is an immediate
            host-side operation<br>
            + * (signal or reset) or or an operation which is enqueued
            in some driver<br>
            + * queue. &amp;DRM_IOCTL_SYNCOBJ_RESET and
            &amp;DRM_IOCTL_SYNCOBJ_SIGNAL can be used<br>
            + * to manipulate a syncobj from the host by resetting its
            pointer to NULL or<br>
            =C2=A0 * setting its pointer to a fence which is already
            signaled.<br>
            =C2=A0 *<br>
            + * With timeline syncobj, all manipulation of the timeline
            fences happens in<br>
            + * terms of the fence referred to in the timeline. See<br>
            + * dma_fence_chain_find_seqno() to see how a given point is
            found in the<br>
            + * timeline.<br>
            + *<br>
            + * Note that applications should be careful to always use
            timeline set of<br>
            + * ioctl() when dealing with syncobj considered as
            timeline. Using a binary<br>
            + * set of ioctl() with a syncobj considered as timeline
            could result incorrect<br>
            + * synchronization. The use of binary syncobj is supported
            through the<br>
            + * timeline set of ioctl() by using a point value of 0,
            this will reproduce<br>
            + * the behavior of the binary set of ioctl() (for example
            replace the<br>
            + * syncobj&#39;s fence when signaling).<br>
          </blockquote>
          <div>=C2=A0</div>
          <div>I know I&#39;ve asked this before but I feel compelled to as=
k
            it again.=C2=A0 Why do we allow them to mix and match?=C2=A0 Wh=
y not
            just have a create flag and enforce meaningful behavior?=C2=A0
            I&#39;m a bit concerned that userspace is going to start relyin=
g
            on the subtlties of the interaction between timeline and
            binary syncobjs which are neither documented nor properly
            tested in IGT.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>For one, you might have to mix both types of syncobjs in a given
      wait/signal operation. So 0 ensures we can do that.</p></div></blockq=
uote><div><br></div><div>Right, that sounds like a useful feature.<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div bg=
color=3D"#FFFFFF"><p>Second, drm-syncobj is a container and its payload is =
an
      interface (dma_fence) which has several implementations.</p>
    <p>The kernel primitive is just less restrictive than the Vulkan API
      here.<br>
    </p>
    <p>I guess we could add a flag at creation to ensure the replacement
      of the fence in a timeline syncobj cannot happen.</p></div></blockquo=
te><div><br></div><div>I would be in favor of that but I&#39;d be intereste=
d to hear what Christian or David think.<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p>I haven&#39;t thought of all the implications that might have
      though... Should we allow reset on a timeline syncobj?</p></div></blo=
ckquote><div><br></div><div>Good question.=C2=A0 I&#39;m inclined to say &q=
uot;yes&quot; because it&#39;s pretty well-defined what such a reset means.=
=C2=A0 However, it&#39;s not really needed.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><p>-L=
ionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div> <br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            + *<br>
            =C2=A0 *<br>
            =C2=A0 * Host-side wait on syncobjs<br>
            =C2=A0 * --------------------------<br>
            @@ -87,6 +126,16 @@<br>
            =C2=A0 * synchronize between the two.<br>
            =C2=A0 * This requirement is inherited from the Vulkan fence AP=
I.<br>
            =C2=A0 *<br>
            + * Similarly, &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an
            array of syncobj<br>
            + * handles as well as an array of u64 points and does a
            host-side wait on all<br>
            + * of syncobj fences at the given points simultaneously.<br>
            + *<br>
            + * &amp;DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT also adds the
            ability to wait for a given<br>
            + * fence to materialize on the timeline without waiting for
            the fence to be<br>
            + * signaled by using the
            &amp;DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag. This<br>
            + * requirement is inherited from the wait-before-signal
            behavior required by<br>
            + * the Vulkan timeline semaphore API.<br>
            + *<br>
            =C2=A0 *<br>
            =C2=A0 * Import/export of syncobjs<br>
            =C2=A0 * -------------------------<br>
            @@ -120,6 +169,18 @@<br>
            =C2=A0 * Because sync files are immutable, resetting or signali=
ng
            the syncobj<br>
            =C2=A0 * will not affect any sync files whose fences have been
            imported into the<br>
            =C2=A0 * syncobj.<br>
            + *<br>
            + *<br>
            + * Import/export of timeline points in timeline syncobjs<br>
            + * -----------------------------------------------------<br>
            + *<br>
            + * &amp;DRM_IOCTL_SYNCOBJ_TRANSFER provides a mechanism to
            transfer a struct<br>
            + * &amp;dma_fence of at a given point from a timeline
            syncobj to another point<br>
            + * into another timeline syncobj.<br>
            + *<br>
            + * Note that if you want to transfer a struct
            &amp;dma_fence from a given point on<br>
            + * a timeline syncobj from/into a binary syncobj, you can
            use the point 0 to<br>
            + * mean take/replace the fence in the syncobj.<br>
            =C2=A0 */<br>
            <br>
            =C2=A0#include &lt;linux/anon_inodes.h&gt;<br>
            -- <br>
            2.23.0<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div></div>
</div>

--0000000000009d3bb80590cd522f--

--===============0300099368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0300099368==--
