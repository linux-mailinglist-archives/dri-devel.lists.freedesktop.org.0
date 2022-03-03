Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDFB4CBF24
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 14:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655DF10E283;
	Thu,  3 Mar 2022 13:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F610E283
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 13:49:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gb39so10815552ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 05:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=oLRKNFgzi6v8pSBlYJj3aLbHvktcI2vMFKk5v9HKS48=;
 b=Ez8CwIC1uvOmmmAdvcoiHiR7hp8bEFEAN7LVNBAqF1ZjrlPj1Wz1UBA/OxDFyIZ1l0
 KvVDwLVV9ZA1ihvx7orZ3zFNBWh+AGJNklSYBmSiOXN7IN27TqfPE08eVtqv9otP9mD+
 63JvuULuwhwRHsCBn7mTlptGrdRdK7Ee8O0XkZiR5hbLEdrHqyApmluuCnKwGzLCvTgx
 GKKPdabRpwg/fuGroLo9G/4klj/XLxF3WXc5RrzgpaQeHvuCyVeRdzEfTeUfpOUzIblv
 avhD02J+hiqlMkS+pOYOuTlXacJOkSAHJSL4jk5rMwTNhbG+W7PZ4DLSvPUReI+fWwCb
 ZjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=oLRKNFgzi6v8pSBlYJj3aLbHvktcI2vMFKk5v9HKS48=;
 b=Ntqa4WYMyBkQ/UzxBGkhYtVK17/B4ylUR/u/Goz4gVaxtdkAG7nSozZyHJuC0TsZTl
 BO+xEnmXBchJFRzuHRakGWhwywzFtUx41yQAbJiOgXthGiAqrrRIH4laGgq5B8bXxe3C
 CkG9RPP+/BPuH4zdhrc2TL5IuKNfCKN6CEdrLTftMS4uE3fNB46ikZN2/x93Eg928bAT
 MOMPR8l/BcWZPrY6m/MBGvKWiGo3OHXzZeT8TmNVn2XmRQ5vQnp+GJmUeftbTPPhkfH7
 Rkqx6yBt3Hsfs3zXFX8Zc/4i6bgSte89uZrIbCuLrztAwtiClKQ2gOOPsaXxTbI/1NL/
 yW6A==
X-Gm-Message-State: AOAM530/dNEJsRkPKAbwYrZ7VXkS6VcpUlEDtL5/8AHkcTk5ut4bG+2h
 nkCOmT420K91J+MxRCLFrdY=
X-Google-Smtp-Source: ABdhPJwJo6fFGHUc9knLGkIiNf4DhwzcFHtedV6ykRq8YZtDOMgX/4/UWQVXWkFOP2Ls47bBFLmQsw==
X-Received: by 2002:a17:907:3e18:b0:6da:7ac5:4ad4 with SMTP id
 hp24-20020a1709073e1800b006da7ac54ad4mr5327791ejc.212.1646315364386; 
 Thu, 03 Mar 2022 05:49:24 -0800 (PST)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a50fc86000000b0040f614e0906sm857725edq.46.2022.03.03.05.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 05:49:23 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------TU4vJckMQANTHttEVyZ1Gp4J"
Message-ID: <ae74a8d6-8a92-ca6b-08bb-bad7510f8cfa@gmail.com>
Date: Thu, 3 Mar 2022 14:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 20/24] dma-buf: add DMA_RESV_USAGE_KERNEL
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-21-christian.koenig@amd.com>
 <YcOhJfy3O7lydic8@phenom.ffwll.local>
 <CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------TU4vJckMQANTHttEVyZ1Gp4J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.03.22 um 19:11 schrieb Jason Ekstrand:
> On Wed, Dec 22, 2021 at 4:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
>     On Tue, Dec 07, 2021 at 01:34:07PM +0100, Christian König wrote:
>     > Add an usage for kernel submissions. Waiting for those
>     > are mandatory for dynamic DMA-bufs.
>     >
>     > Signed-off-by: Christian König <christian.koenig@amd.com>
>
>     Again just skipping to the doc bikeshedding, maybe with more cc others
>     help with some code review too.
>
>     >  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
>     > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>     > index 4f3a6abf43c4..29d799991496 100644
>     > --- a/include/linux/dma-resv.h
>     > +++ b/include/linux/dma-resv.h
>     > @@ -54,8 +54,30 @@ struct dma_resv_list;
>     >   *
>     >   * This enum describes the different use cases for a dma_resv
>     object and
>     >   * controls which fences are returned when queried.
>     > + *
>     > + * An important fact is that there is the order
>     KERNEL<WRITE<READ and
>     > + * when the dma_resv object is asked for fences for one use
>     case the fences
>     > + * for the lower use case are returned as well.
>     > + *
>     > + * For example when asking for WRITE fences then the KERNEL
>     fences are returned
>     > + * as well. Similar when asked for READ fences then both WRITE
>     and KERNEL
>     > + * fences are returned as well.
>     >   */
>     >  enum dma_resv_usage {
>     > +     /**
>     > +      * @DMA_RESV_USAGE_KERNEL: For in kernel memory management
>     only.
>     > +      *
>     > +      * This should only be used for things like copying or
>     clearing memory
>     > +      * with a DMA hardware engine for the purpose of kernel memory
>     > +      * management.
>     > +      *
>     > +         * Drivers *always* need to wait for those fences
>     before accessing the
>
>
> super-nit: Your whitespace is wrong here.

Fixed, thanks.

>     s/need to/must/ to stay with usual RFC wording. It's a hard
>     requirement or
>     there's a security bug somewhere.
>
>
> Yeah, probably.  I like *must* but that's because that's what we use 
> in the VK spec.  Do whatever's usual for kernel docs.

I agree, must sounds better and is already fixed.

>
> Not sure where to put this comment but I feel like the way things are 
> framed is a bit the wrong way around. Specifically, I don't think we 
> should be talking about what fences you must wait on so much as what 
> fences you can safely skip.  In the previous model, the exclusive 
> fence had to be waited on at all times and the shared fences could be 
> skipped unless you were doing something that would result in a new 
> exclusive fence.

Well exactly that's what we unfortunately didn't do, as Daniel explained 
some drivers just ignored the exclusive fence sometimes.

> In this new world of "it's just a bucket of fences", we need to be 
> very sure the waiting is happening on the right things.  It sounds (I 
> could be wrong) like USAGE_KERNEL is the new exclusive fence.  If so, 
> we need to make it virtually impossible to ignore.

Yes, exactly that's the goal here.

>
> Sorry if that's a bit of a ramble.  I think what I'm saying is this:  
> In whatever helpers or iterators we have, be that get_singleton or 
> iter_begin or whatever, we need to be sure we specify things in terms 
> of exclusion and not inclusion.  "Give me everything except implicit 
> sync read fences" rather than "give me implicit sync write fences".

Mhm, exactly that's what I tried to avoid. The basic idea here is that 
the driver and memory management components tells the framework what use 
case it has and the framework returns the appropriate fences for that.

So when the use case is mmap() the buffer on the CPU without any further 
sync (for example) you only get the kernel fences.

When the use case is you want to add a CS which is an implicit read you 
get all kernel fences plus all writers (see function dma_resv_usage_rw).

When the use case is you want to add a CS which is an implicit write you 
get all kernel fences, other writers as well as readers.

And last when you are the memory management which wants to move a buffer 
around you get everything.

>   If having a single, well-ordered enum is sufficient for that, 
> great.  If we think we'll ever end up with something other than a 
> strict ordering, we may need to re-think a bit.

I actually started with a matrix which gives you an indicator when to 
sync with what, but at least for now the well-ordered enum seems to get 
the job done as well and is far less complex.

> Concerning well-ordering... I'm a bit surprised to only see three 
> values here.  I expected 4:
>
>  - kernel exclusive, used for memory moves and the like
>  - kernel shared, used for "I'm using this right now, don't yank it 
> out from under me" which may not have any implicit sync implications 
> whatsoever
>  - implicit sync write
>  - implicit sync read

See the follow up patch which adds DMA_RESV_USAGE_BOOKKEEP. That's the 
4th one you are missing.

> If we had those four, I don't think the strict ordering works 
> anymore.  From the POV of implicit sync, they would look at the 
> implicit sync read/write fences and maybe not even kernel exclusive.  
> From the POV of some doing a BO move, they'd look at all of them.  
> From the POV of holding on to memory while Vulkan is using it, you 
> want to set a kernel shared fence but it doesn't need to interact with 
> implicit sync at all.  Am I missing something obvious here?

Yeah, sounds like you didn't looked at patch 21 :)

My thinking is more or less exactly the same. Only difference is that 
I've put the BOOKKEEP usage after the implicit read and write usages. 
This way you can keep the strict ordering since the implicit submissions 
won't ask for the BOOKKEEP usage.

The order is then KERNEL<WRITE<READ<BOOKKEEP. See the final 
documentation here as well:

  * An important fact is that there is the order 
KERNEL<WRITE<READ<BOOKKEEP and
  * when the dma_resv object is asked for fences for one use case the fences
  * for the lower use case are returned as well.
  *
  * For example when asking for WRITE fences then the KERNEL fences are 
returned
  * as well. Similar when asked for READ fences then both WRITE and KERNEL
  * fences are returned as well.

Regards,
Christian.


>
> --Jason
>
>
>     > +      * resource protected by the dma_resv object. The only
>     exception for
>     > +      * that is when the resource is known to be locked down in
>     place by
>     > +      * pinning it previously.
>
>     Is this true? This sounds more confusing than helpful, because
>     afaik in
>     general our pin interfaces do not block for any kernel fences.
>     dma_buf_pin
>     doesn't do that for sure. And I don't think ttm does that either.
>
>     I think the only safe thing here is to state that it's safe if a) the
>     resource is pinned down and b) the callers has previously waited
>     for the
>     kernel fences.
>
>     I also think we should put that wait for kernel fences into
>     dma_buf_pin(),
>     but that's maybe a later patch.
>     -Daniel
>
>
>
>     > +      */
>     > +     DMA_RESV_USAGE_KERNEL,
>     > +
>     >       /**
>     >        * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
>     >        *
>     > --
>     > 2.25.1
>     >
>
>     -- 
>     Daniel Vetter
>     Software Engineer, Intel Corporation
>     http://blog.ffwll.ch
>

--------------TU4vJckMQANTHttEVyZ1Gp4J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 02.03.22 um 19:11 schrieb Jason Ekstrand:<br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 22, 2021 at 4:05
            PM Daniel Vetter &lt;<a href="mailto:daniel@ffwll.ch"
              moz-do-not-send="true" class="moz-txt-link-freetext">daniel@ffwll.ch</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Tue, Dec 07, 2021 at
            01:34:07PM +0100, Christian König wrote:<br>
            &gt; Add an usage for kernel submissions. Waiting for those<br>
            &gt; are mandatory for dynamic DMA-bufs.<br>
            &gt; <br>
            &gt; Signed-off-by: Christian König &lt;<a
              href="mailto:christian.koenig@amd.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
            <br>
            Again just skipping to the doc bikeshedding, maybe with more
            cc others<br>
            help with some code review too.<br>
            <br>
            &gt;  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);<br>
            &gt; diff --git a/include/linux/dma-resv.h
            b/include/linux/dma-resv.h<br>
            &gt; index 4f3a6abf43c4..29d799991496 100644<br>
            &gt; --- a/include/linux/dma-resv.h<br>
            &gt; +++ b/include/linux/dma-resv.h<br>
            &gt; @@ -54,8 +54,30 @@ struct dma_resv_list;<br>
            &gt;   *<br>
            &gt;   * This enum describes the different use cases for a
            dma_resv object and<br>
            &gt;   * controls which fences are returned when queried.<br>
            &gt; + *<br>
            &gt; + * An important fact is that there is the order
            KERNEL&lt;WRITE&lt;READ and<br>
            &gt; + * when the dma_resv object is asked for fences for
            one use case the fences<br>
            &gt; + * for the lower use case are returned as well.<br>
            &gt; + *<br>
            &gt; + * For example when asking for WRITE fences then the
            KERNEL fences are returned<br>
            &gt; + * as well. Similar when asked for READ fences then
            both WRITE and KERNEL<br>
            &gt; + * fences are returned as well.<br>
            &gt;   */<br>
            &gt;  enum dma_resv_usage {<br>
            &gt; +     /**<br>
            &gt; +      * @DMA_RESV_USAGE_KERNEL: For in kernel memory
            management only.<br>
            &gt; +      *<br>
            &gt; +      * This should only be used for things like
            copying or clearing memory<br>
            &gt; +      * with a DMA hardware engine for the purpose of
            kernel memory<br>
            &gt; +      * management.<br>
            &gt; +      *<br>
            &gt; +         * Drivers *always* need to wait for those
            fences before accessing the<br>
          </blockquote>
          <div><br>
          </div>
          <div>super-nit: Your whitespace is wrong here.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Fixed, thanks.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            s/need to/must/ to stay with usual RFC wording. It's a hard
            requirement or<br>
            there's a security bug somewhere.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Yeah, probably.  I like *must* but that's because that's
            what we use in the VK spec.  Do whatever's usual for kernel
            docs.</div>
        </div>
      </div>
    </blockquote>
    <br>
    I agree, must sounds better and is already fixed.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Not sure where to put this comment but I feel like the
            way things are framed is a bit the wrong way around. 
            Specifically, I don't think we should be talking about what
            fences you must wait on so much as what fences you can
            safely skip.  In the previous model, the exclusive fence had
            to be waited on at all times and the shared fences could be
            skipped unless you were doing something that would result in
            a new exclusive fence.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Well exactly that's what we unfortunately didn't do, as Daniel
    explained some drivers just ignored the exclusive fence sometimes.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>In this new world of "it's just a bucket of fences", we
            need to be very sure the waiting is happening on the right
            things.  It sounds (I could be wrong) like USAGE_KERNEL is
            the new exclusive fence.  If so, we need to make it
            virtually impossible to ignore.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, exactly that's the goal here.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Sorry if that's a bit of a ramble.  I think what I'm
            saying is this:  In whatever helpers or iterators we have,
            be that get_singleton or iter_begin or whatever, we need to
            be sure we specify things in terms of exclusion and not
            inclusion.  "Give me everything except implicit sync read
            fences" rather than "give me implicit sync write fences".</div>
        </div>
      </div>
    </blockquote>
    <br>
    Mhm, exactly that's what I tried to avoid. The basic idea here is
    that the driver and memory management components tells the framework
    what use case it has and the framework returns the appropriate
    fences for that.<br>
    <br>
    So when the use case is mmap() the buffer on the CPU without any
    further sync (for example) you only get the kernel fences.<br>
    <br>
    When the use case is you want to add a CS which is an implicit read
    you get all kernel fences plus all writers (see function
    dma_resv_usage_rw).<br>
    <br>
    When the use case is you want to add a CS which is an implicit write
    you get all kernel fences, other writers as well as readers.<br>
    <br>
    And last when you are the memory management which wants to move a
    buffer around you get everything.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>  If having a single, well-ordered enum is sufficient for
            that, great.  If we think we'll ever end up with something
            other than a strict ordering, we may need to re-think a bit.</div>
        </div>
      </div>
    </blockquote>
    <br>
    I actually started with a matrix which gives you an indicator when
    to sync with what, but at least for now the well-ordered enum seems
    to get the job done as well and is far less complex.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Concerning well-ordering... I'm a bit surprised to only
            see three values here.  I expected 4:</div>
          <div><br>
          </div>
          <div> - kernel exclusive, used for memory moves and the like</div>
          <div> - kernel shared, used for "I'm using this right now,
            don't yank it out from under me" which may not have any
            implicit sync implications whatsoever</div>
          <div> - implicit sync write</div>
          <div>
            <div> - implicit sync read</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    See the follow up patch which adds DMA_RESV_USAGE_BOOKKEEP. That's
    the 4th one you are missing.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>If we had those four, I don't think the strict ordering
            works anymore.  From the POV of implicit sync, they would
            look at the implicit sync read/write fences and maybe not
            even kernel exclusive.  From the POV of some doing a BO
            move, they'd look at all of them.  From the POV of holding
            on to memory while Vulkan is using it, you want to set a
            kernel shared fence but it doesn't need to interact with
            implicit sync at all.  Am I missing something obvious here?</div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah, sounds like you didn't looked at patch 21 :)<br>
    <br>
    My thinking is more or less exactly the same. Only difference is
    that I've put the BOOKKEEP usage after the implicit read and write
    usages. This way you can keep the strict ordering since the implicit
    submissions won't ask for the BOOKKEEP usage.<br>
    <br>
    The order is then KERNEL&lt;WRITE&lt;READ&lt;BOOKKEEP. See the final
    documentation here as well:<br>
    <br>
     * An important fact is that there is the order
    KERNEL&lt;WRITE&lt;READ&lt;BOOKKEEP and<br>
     * when the dma_resv object is asked for fences for one use case the
    fences<br>
     * for the lower use case are returned as well.<br>
     *<br>
     * For example when asking for WRITE fences then the KERNEL fences
    are returned<br>
     * as well. Similar when asked for READ fences then both WRITE and
    KERNEL<br>
     * fences are returned as well.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAOFGe96E9fopQ3ipeQWWdnjc54j_gvhb3rrEQ-cbrHW-My035A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>--Jason</div>
          <div><br>
          </div>
          <div> <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; +      * resource protected by the dma_resv object. The
            only exception for<br>
            &gt; +      * that is when the resource is known to be
            locked down in place by<br>
            &gt; +      * pinning it previously.<br>
            <br>
            Is this true? This sounds more confusing than helpful,
            because afaik in<br>
            general our pin interfaces do not block for any kernel
            fences. dma_buf_pin<br>
            doesn't do that for sure. And I don't think ttm does that
            either.<br>
            <br>
            I think the only safe thing here is to state that it's safe
            if a) the<br>
            resource is pinned down and b) the callers has previously
            waited for the<br>
            kernel fences.<br>
            <br>
            I also think we should put that wait for kernel fences into
            dma_buf_pin(),<br>
            but that's maybe a later patch.<br>
            -Daniel<br>
            <br>
            <br>
            <br>
            &gt; +      */<br>
            &gt; +     DMA_RESV_USAGE_KERNEL,<br>
            &gt; +<br>
            &gt;       /**<br>
            &gt;        * @DMA_RESV_USAGE_WRITE: Implicit write
            synchronization.<br>
            &gt;        *<br>
            &gt; -- <br>
            &gt; 2.25.1<br>
            &gt; <br>
            <br>
            -- <br>
            Daniel Vetter<br>
            Software Engineer, Intel Corporation<br>
            <a href="http://blog.ffwll.ch" rel="noreferrer"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">http://blog.ffwll.ch</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------TU4vJckMQANTHttEVyZ1Gp4J--
