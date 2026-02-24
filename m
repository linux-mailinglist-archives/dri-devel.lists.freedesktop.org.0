Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NzINErjnWnpSQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:43:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED818AABC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522B10E05E;
	Tue, 24 Feb 2026 17:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="l4yxiPae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Tue, 24 Feb 2026 17:43:33 UTC
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61F810E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 17:43:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------VR442ovFt0MtQDevC9RfwYgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1771954657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RNYbZj/MTFoFxEdmZSV4g0iF3Br28611TKAFPPQpNtQ=;
 b=l4yxiPaeFjCl16WpF5vsABKndlbbRW1tufCBBLhqwSRQAv+r/v03WnzeLinJAfvZayTt/W
 jiuT7xHv25ZmTpbIXGxL6jG+t2UeCb6w0KnADKZ1DVTzzKljL4fqzIYr8hAtD6m+HhAvF1
 VFvJQdwto7C+YILI2repZIVtThRO7pk=
Message-ID: <a5f18c7c-dbde-4316-8444-bb198d890262@linux.dev>
Date: Tue, 24 Feb 2026 09:37:27 -0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
References: <20211122110817.33319-1-mie@igel.co.jp>
 <7b4d9e08-122b-4c4b-868e-d48ec0f59dce@linux.dev>
 <CANXvt5pcCsTegAkHkgvUnOkQ+eya0zHZh_KE=eUpXEubpyymRw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <CANXvt5pcCsTegAkHkgvUnOkQ+eya0zHZh_KE=eUpXEubpyymRw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mie@igel.co.jp,m:zyjzyj2000@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:daniel.vetter@ffwll.ch,m:dledford@redhat.com,m:jgg@ziepe.ca,m:jianxin.xiong@intel.com,m:leon@kernel.org,m:maorg@nvidia.com,m:sean.hefty@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:dhobsong@igel.co.jp,m:taki@igel.co.jp,m:etom@igel.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,ffwll.ch,redhat.com,ziepe.ca,intel.com,kernel.org,nvidia.com,linaro.org,lists.freedesktop.org,lists.linaro.org,vger.kernel.org,igel.co.jp];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[yanjun.zhu@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_SPAM(0.00)[0.828];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanjun.zhu@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:email]
X-Rspamd-Queue-Id: 13ED818AABC
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------VR442ovFt0MtQDevC9RfwYgL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/24/26 1:17 AM, Shunsuke Mie wrote:
> Hi Zhu Yanjun,
>
> Thank you for reaching out and revisiting my 2021 proposal.
>
> Regarding the current status, I haven't been able to make much 
> progress recently as other tasks have taken higher priority. However, 
> I still believe this integration is important.
>
> From a technical perspective, as pointed out during the previous 
> reviews, there were indeed issues with how dma_buf_map was being used. 
> To address this in today's context, I believe we should transition to 
> using iosys_map.
>
> I am still interested in this direction. While my current bandwidth is 
> limited, I would welcome any collaboration—especially regarding the 
> implementation of iosys_map support within rxe or the RDMA core.

Sorry. In the previous mail, there is a HTML part. It can not reach. As 
such, I resend it.

DMABUF has become increasingly popular and is widely adopted across 
various subsystems.

If we could also implement DMABUF support in rxe, it would significantly 
enhance rxe’s usability and overall value.  

Given your previous involvement in this area, it would be great to move 
this forward in rxe.

I believe your expertise would be particularly helpful in driving the 
implementation.

I’m happy to review and collaborate on the design and patches as needed.

Zhu Yanjun


>
> I'd be happy to discuss the technical details of this transition if 
> you'd like to dive deeper.
>
> Best,
> Shunsuke Mie
>
>
> 2026年2月19日(木) 13:43 Zhu Yanjun <yanjun.zhu@linux.dev>:
>
>     在 2021/11/22 3:08, Shunsuke Mie 写道:
>     > This patch series add a dma-buf support for rxe driver.
>     >
>     > A dma-buf based memory registering has beed introduced to use
>     the memory
>     > region that lack of associated page structures (e.g. device
>     memory and CMA
>     > managed memory) [1]. However, to use the dma-buf based memory,
>     each rdma
>     > device drivers require add some implementation. The rxe driver
>     has not
>     > support yet.
>     >
>     > [1] https://www.spinics.net/lists/linux-rdma/msg98592.html
>     >
>     > To enable to use the dma-buf memory in rxe rdma device, add some
>     changes
>     > and implementation in this patch series.
>     >
>     > This series consists of two patches. The first patch changes the
>     IB core
>     > to support for rdma drivers that has not dma device. The secound
>     patch adds
>     > the dma-buf support to rxe driver.
>     >
>     Hi, Shunsuke Mie
>
>     I was revisiting your 2021 proposal around dma-buf integration
>     with RDMA
>     and the related discussions at the time.
>
>     As you know, dma-buf usage in RDMA-related workflows has gained more
>     traction recently, and we are seeing increasing interest in
>     heterogeneous memory and cross-device buffer sharing. Given the
>     changes
>     in the ecosystem since then, I’m wondering whether you think the
>     original direction might be worth reconsidering.
>
>     Do you have any interest in continuing that line of work, or updating
>     the design based on today’s context? If not, I’d still appreciate
>     your
>     perspective on what you see as the main blockers from the previous
>     discussions, and whether you think the landscape has changed
>     enough to
>     justify another attempt.
>
>     Depending on the direction, we may consider exploring dma-buf
>     support in
>     rxe or at the core level, but I’d prefer to first understand your
>     view
>     before moving forward.
>
>     Zhu Yanjun
>
>     > Related user space RDMA library changes are provided as a
>     separate patch.
>     >
>     > v4:
>     > * Fix warnings, unused variable and casting
>     > v3: https://www.spinics.net/lists/linux-rdma/msg106776.html
>     > * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
>     > * Fix to use dma-buf-map helpers
>     > v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
>     > * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
>     > * Instead of using a dummy dma_device to attach dma-buf, just store
>     >    dma-buf to use software RDMA driver
>     > * Use dma-buf vmap() interface
>     > * Check to pass tests of rdma-core
>     > v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
>     > * The initial patch set
>     > * Use ib_device as dma_device.
>     > * Use dma-buf dynamic attach interface
>     > * Add dma-buf support to rxe device
>     >
>     > Shunsuke Mie (2):
>     >    RDMA/umem: Change for rdma devices has not dma device
>     >    RDMA/rxe: Add dma-buf support
>     >
>     >   drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
>     >   drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
>     >   drivers/infiniband/sw/rxe/rxe_mr.c    | 113
>     ++++++++++++++++++++++++++
>     >   drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
>     >   include/rdma/ib_umem.h                |   1 +
>     >   5 files changed, 166 insertions(+), 4 deletions(-)
>     >
>
--------------VR442ovFt0MtQDevC9RfwYgL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/24/26 1:17 AM, Shunsuke Mie wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANXvt5pcCsTegAkHkgvUnOkQ+eya0zHZh_KE=eUpXEubpyymRw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Zhu Yanjun,
        <div><br>
        </div>
        <div>Thank you for reaching out and revisiting my 2021 proposal.<br>
          <br>
          Regarding the current status, I haven't been able to make much
          progress recently as other tasks have taken higher priority.
          However, I still believe this integration is important.<br>
          <br>
          From a technical perspective, as pointed out during the
          previous reviews, there were indeed issues with how
          dma_buf_map was being used. To address this in today's
          context, I believe we should transition to using iosys_map. </div>
        <div><br>
        </div>
        <div>I am still interested in this direction. While my current
          bandwidth is limited, I would welcome any
          collaboration—especially regarding the implementation of
          iosys_map support within rxe or the RDMA core.<br>
        </div>
      </div>
    </blockquote>
    <p>Sorry. In the previous mail, there is a HTML part. It can not
      reach. As such, I resend it.</p>
    <p>DMABUF has become increasingly popular and is widely adopted
      across various subsystems. </p>
    <p>If we could also implement DMABUF support in rxe, it would
      significantly enhance rxe’s usability and overall value.  </p>
    <p>Given your previous involvement in this area, it would be great
      to move this forward in rxe. </p>
    <p>I believe your expertise would be particularly helpful in driving
      the implementation. </p>
    <p>I’m happy to review and collaborate on the design and patches as
      needed.</p>
    Zhu Yanjun
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANXvt5pcCsTegAkHkgvUnOkQ+eya0zHZh_KE=eUpXEubpyymRw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
          I'd be happy to discuss the technical details of this
          transition if you'd like to dive deeper.<br>
          <br>
          Best,</div>
        <div>Shunsuke Mie<br>
          <br>
        </div>
      </div>
      <br>
      <div class="gmail_quote gmail_quote_container">
        <div dir="ltr" class="gmail_attr">2026年2月19日(木) 13:43 Zhu Yanjun
          &lt;<a href="mailto:yanjun.zhu@linux.dev"
            moz-do-not-send="true" class="moz-txt-link-freetext">yanjun.zhu@linux.dev</a>&gt;:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">在
          2021/11/22 3:08, Shunsuke Mie 写道:<br>
          &gt; This patch series add a dma-buf support for rxe driver.<br>
          &gt; <br>
          &gt; A dma-buf based memory registering has beed introduced to
          use the memory<br>
          &gt; region that lack of associated page structures (e.g.
          device memory and CMA<br>
          &gt; managed memory) [1]. However, to use the dma-buf based
          memory, each rdma<br>
          &gt; device drivers require add some implementation. The rxe
          driver has not<br>
          &gt; support yet.<br>
          &gt; <br>
          &gt; [1] <a
href="https://www.spinics.net/lists/linux-rdma/msg98592.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://www.spinics.net/lists/linux-rdma/msg98592.html</a><br>
          &gt; <br>
          &gt; To enable to use the dma-buf memory in rxe rdma device,
          add some changes<br>
          &gt; and implementation in this patch series.<br>
          &gt; <br>
          &gt; This series consists of two patches. The first patch
          changes the IB core<br>
          &gt; to support for rdma drivers that has not dma device. The
          secound patch adds<br>
          &gt; the dma-buf support to rxe driver.<br>
          &gt; <br>
          Hi, Shunsuke Mie<br>
          <br>
          I was revisiting your 2021 proposal around dma-buf integration
          with RDMA <br>
          and the related discussions at the time.<br>
          <br>
          As you know, dma-buf usage in RDMA-related workflows has
          gained more <br>
          traction recently, and we are seeing increasing interest in <br>
          heterogeneous memory and cross-device buffer sharing. Given
          the changes <br>
          in the ecosystem since then, I’m wondering whether you think
          the <br>
          original direction might be worth reconsidering.<br>
          <br>
          Do you have any interest in continuing that line of work, or
          updating <br>
          the design based on today’s context? If not, I’d still
          appreciate your <br>
          perspective on what you see as the main blockers from the
          previous <br>
          discussions, and whether you think the landscape has changed
          enough to <br>
          justify another attempt.<br>
          <br>
          Depending on the direction, we may consider exploring dma-buf
          support in <br>
          rxe or at the core level, but I’d prefer to first understand
          your view <br>
          before moving forward.<br>
          <br>
          Zhu Yanjun<br>
          <br>
          &gt; Related user space RDMA library changes are provided as a
          separate patch.<br>
          &gt; <br>
          &gt; v4:<br>
          &gt; * Fix warnings, unused variable and casting<br>
          &gt; v3: <a
href="https://www.spinics.net/lists/linux-rdma/msg106776.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://www.spinics.net/lists/linux-rdma/msg106776.html</a><br>
          &gt; * Rebase to the latest linux-rdma 'for-next' branch
          (5.15.0-rc6+)<br>
          &gt; * Fix to use dma-buf-map helpers<br>
          &gt; v2: <a
href="https://www.spinics.net/lists/linux-rdma/msg105928.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://www.spinics.net/lists/linux-rdma/msg105928.html</a><br>
          &gt; * Rebase to the latest linux-rdma 'for-next' branch
          (5.15.0-rc1+)<br>
          &gt; * Instead of using a dummy dma_device to attach dma-buf,
          just store<br>
          &gt;    dma-buf to use software RDMA driver<br>
          &gt; * Use dma-buf vmap() interface<br>
          &gt; * Check to pass tests of rdma-core<br>
          &gt; v1: <a
href="https://www.spinics.net/lists/linux-rdma/msg105376.html"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://www.spinics.net/lists/linux-rdma/msg105376.html</a><br>
          &gt; * The initial patch set<br>
          &gt; * Use ib_device as dma_device.<br>
          &gt; * Use dma-buf dynamic attach interface<br>
          &gt; * Add dma-buf support to rxe device<br>
          &gt; <br>
          &gt; Shunsuke Mie (2):<br>
          &gt;    RDMA/umem: Change for rdma devices has not dma device<br>
          &gt;    RDMA/rxe: Add dma-buf support<br>
          &gt; <br>
          &gt;   drivers/infiniband/core/umem_dmabuf.c |  20 ++++-<br>
          &gt;   drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +<br>
          &gt;   drivers/infiniband/sw/rxe/rxe_mr.c    | 113
          ++++++++++++++++++++++++++<br>
          &gt;   drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++<br>
          &gt;   include/rdma/ib_umem.h                |   1 +<br>
          &gt;   5 files changed, 166 insertions(+), 4 deletions(-)<br>
          &gt; <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------VR442ovFt0MtQDevC9RfwYgL--
