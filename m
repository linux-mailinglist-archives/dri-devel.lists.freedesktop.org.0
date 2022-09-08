Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E905B23CF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A892810EB63;
	Thu,  8 Sep 2022 16:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3107F10EB63
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:44:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gh9so17513282ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=I55acvKkYz3DOyOmmK+2+SP9JvKG4Jm+wWUWvY/NBUo=;
 b=EstMal6xg8rfG+Oj8gHgvLHf7wMAJlp+hZEAIMPt0PcV0t921QIrL/XuzStVWe8DCx
 qjI2Wo9A8F/ftwfsWbzW3H1v2NfnqcCXb3isEWCsoxl7X+T7t2iVbsmhnbr7B7WIuVei
 WV1jJtpooiNmIOlouAt8gxORvEd9Es5o0Co5ytfBhumDc660lsGxADudGsMdryXwyyJc
 wY/wg0wCpBZmUZfzldMXQXmL1AHrvojE1AuCzjPRpIGrul8p77wVaciZ+cMBypwfrpLn
 u9mgOI4fBBVc8Hp+2l4k7GBhg/5uf+7fAtVBQ4vNCYt4K5wBEaqFLPDI12KjP13vRo4M
 IauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I55acvKkYz3DOyOmmK+2+SP9JvKG4Jm+wWUWvY/NBUo=;
 b=6nlKy8/66gvyq4QZ/2wQZ8LDq/Xf7gslUwKnG3xaJLBUEYxAt3V7QT44ZTfYDtsAG0
 Xydub/dis7l6c/eMqERCf2y5DjWFTQNT+10no3Sy0QY33VfQ4ZW2Q29CwMKtxRrz1eY3
 Q3pUr3cnM3NDgCf8Q8h5+6DJbBepog1VS+WMvqOcq7+zRi97OEBPUhOGLQDXnQY4xYpq
 rdsTyxvFGV1U3s1uu4/ks+uH0vAdlkGI6es7oaHQjyWa5t4uNX+eqHXz3lLsJFD1Zy3H
 JwISEUXDQOjrlpr8gj+oOUVSGIWxuvHfPWg8JquXEPNsY9OIhUaBlWlGRJzOVXG/gV5k
 beng==
X-Gm-Message-State: ACgBeo34+9w4BWWLy2nedZavRNxXNbwVEuUk7a/ck7VCx0RB6JH1AfAD
 jl0ZdT92yo3XnXFsZzgucgO62HyTpkn7Q4anxsXOXt4WxeM=
X-Google-Smtp-Source: AA6agR5Mdh099Ytk4i1jONnr3q+bKGnzi87e7tJZcX8i7LMnmdcHRZvxABmpB0KInX5wXNGgF8IgvM3g81g7xSmKMHg=
X-Received: by 2002:a17:906:845b:b0:770:86da:9702 with SMTP id
 e27-20020a170906845b00b0077086da9702mr5612971ejy.244.1662655485519; Thu, 08
 Sep 2022 09:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <7e047ee0-0243-d9d4-f0bc-7ed19ed33c19@quicinc.com>
In-Reply-To: <7e047ee0-0243-d9d4-f0bc-7ed19ed33c19@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 8 Sep 2022 09:44:34 -0700
Message-ID: <CABdmKX2sGw-TwRYnHWuyaWYrxX7wgcK4gFSb5hGAwk0ztZxbcA@mail.gmail.com>
Subject: Re: GPU device resource reservations with cgroups?
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, Carl Vanderlip <quic_carlv@quicinc.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 1:39 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote=
:
>
> Hello cgroup experts,
>
> I have a GPU device [1] that supports organizing its resources for the
> purposes of supporting containers.  I am attempting to determine how to
> represent this in the upstream kernel, and I wonder if it fits in cgroups=
.
>
> The device itself has a number of resource types =E2=80=93 compute cores,
> memory, bus replicators, semaphores, and dma channels.  Any particular
> workload may consume some set of these resources.  For example, a
> workload may consume two compute cores, 1GB of memory, one dma channel,
> but no semaphores and no bus replicators.
>
> By default all of the resources are in a global pool.  This global pool
> is managed by the device firmware.  Linux makes a request to the
> firmware to load a workload.  The firmware reads the resource
> requirements from the workload itself, and then checks the global pool.
> If the global pool contains sufficient resources to satisfy the needs of
> the workload, the firmware assigns the required resources from the
> global pool to the workload.  If there are insufficient resources, the
> workload request from Linux is rejected.
>
> Some users may want to share the device between multiple containers, but
> provide device level isolation between those containers.  For example, a
> user may have 4 workloads to run, one per container, and each workload
> takes 1/4th of the set of compute cores.  The user would like to reserve
> sets of compute cores for each container so that container X always has
> the expected set of resources available, and if container Y
> malfunctions, it cannot =E2=80=9Csteal=E2=80=9D resources from container =
X.
>
> To support this, the firmware supports a concept of partitioning.  A
> partition is a pool of resources which are removed from the global pool,
> and pre-assigned to the partition=E2=80=99s pool.  A workload can then be=
 run
> from within a partition, and it consumes resources from that partition=E2=
=80=99s
> pool instead of from the global pool.  The firmware manages creating
> partitions and assigning resources to them.
>
> Partitions do not nest.
>
Do partitions have any significance in hardware, or are they just a
logical concept? Does it matter which compute core / bus replicator /
dma channel a user gets, or are they interchangeable between uses?

> In the above user example, the user can create 4 partitions, and divide
> up the compute cores among them.  Then the user can assign each
> individual container their own individual partition.  Each container
> would be limited to the resources within it=E2=80=99s assigned partition,=
 but
> also that container would have exclusive access to those resources.
> This essentially provides isolation, and some Quality of Service (QoS).
>
> How this is currently implemented (in downstream), is perhaps not ideal.
>   A privileged daemon process reads a configuration file which defines
> the number of partitions, and the set of resources assigned to each.
> That daemon makes requests to the firmware to create the partitions, and
> gets a unique ID for each.  Then the daemon makes a request to the
> driver to create a =E2=80=9Cshadow device=E2=80=9D, which is a child dev =
node.  The
> driver verifies with the firmware that the partition ID is valid, and
> then creates the dev node.  Internally the driver associates this shadow
> device with the partition ID so that each request to the firmware is
> tagged with the partition ID by the driver.  This tagging allows the
> firmware to determine that a request is targeted for a specific
> partition.  Finally, the shadow device is passed into the container,
> instead of the normal dev node.  The userspace within the container
> operates the shadow device normally.
>
> One concern with the current implementation is that it is possible to
> create a large number of partitions.  Since each partition is
> represented by a shadow device dev node, this can create a large number
> of dev nodes and exhaust the minor number space.
>
> I wonder if this functionality is better represented by a cgroup.
> Instead of creating a dev node for the partition, we can just run the
> container process within the cgroup.  However it doesn=E2=80=99t look lik=
e
> cgroups have a concept of resource reservation.  It is just a limit.  If
> that impression is accurate, then I struggle to see how to provide the
> desired isolation as some entity not under the cgroup could consume all
> of the device resources, leaving the containers unable to perform their
> tasks.

Given the top-down resource distribution policy for cgroups, I think
you'd have to have a cgroup subtree where limits for these resources
are exclusively passed to, and maintain the placement of processes in
the appropriate cgroup under this subtree (one per partition +
global). The limit for these resources in all other subtrees under the
root would need to be 0. The only trick would be to maintain the
limit(s) on the global pool based on the sum of the limits for the
partitions to ensure that the global pool cannot exhaust resources
"reserved" for the partitions. If partitions don't come and go at
runtime then that seems pretty straightforward, otherwise I could see
the maintenance/adjustment of those limits as a source of frustration.



>
> So, cgroup experts, does this sound like something that should be
> represented by a cgroup, or is cgroup the wrong mechanism for this usecas=
e?
>
> [1] -
> https://lore.kernel.org/all/1660588956-24027-1-git-send-email-quic_jhugo@=
quicinc.com/
