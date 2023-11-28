Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFDD7FBBDB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A310E533;
	Tue, 28 Nov 2023 13:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB4810E533
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:51:53 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c87acba73bso73449591fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701179511; x=1701784311; darn=lists.freedesktop.org;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5RP4kTNeZL9/ihWdolwURP2YWvwCR1X7zqbmbW0d9rI=;
 b=i+gTSximXX1vWsnWKzrPNOnCqCHW3q9+m5VUtXtmk8BLsbCNGs/BWDe0IYk6poWRNZ
 /NrzFiKqoUI/9FtUsjrXhCZiDimGtJW7xCh8dwveAWEj2B4rJh2DkmJkKYFyKD54kS58
 oW5Ng1oAwu1QQ9KGj0gEPUjZ8unGhBLnKSHfijyvLUFcgycJBTSuKdqcnckqdZuzl4Dz
 /eoY+6smfZPyvT9IodF6I6XxqZ5fsNiNv6REqexlobsUvBoIeWXRIieRmD3SRyXJwhwh
 IZTPWAsx+iOsEKkWMpTpRtl+dZ+bcRVsO6H5FoJR3HLmtAmderEOolyWGs73vujgD2Pd
 zPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701179511; x=1701784311;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5RP4kTNeZL9/ihWdolwURP2YWvwCR1X7zqbmbW0d9rI=;
 b=Qh8Nij3ixriMFcW4i50vMD2Oa5b0ISfJ5N0p0jQcpj2Yk+zcGYHp1O0Dfk5lEvRHFP
 ZCn8qhtWWWo43kStF7LIg7M8dgenlF0H8555mUlAmu6qOtDn5QVC1+Ci9fH7RegUi1KG
 V3YEK4orAbUX0ee2WigJVrsTshoK3/OzoUX630o5Ys5Plfy806uXW1IYaI1EChA4gY7/
 IGfbtSUNbeZoaMQvmAvhmxBsKhpjlm2K7aLBqqhsOLSC/rZszNZxOLW9pcLT4vpV7p+6
 AqBZ5VShWwEilS1WPQkOLaWgrp0MVrpj0O1TAbE3bK/SZukHa1K6+7gne5z3UHE2JnAe
 JxfA==
X-Gm-Message-State: AOJu0Ywmft64qkjafASaiwM9K/fvpZmk16fKOLQbiTsF8Kor8MET4Ovg
 7+InluSml233cbJWY8slq1I=
X-Google-Smtp-Source: AGHT+IEK+jPZamsVBmlgzrz0CRw1l1pIr2uQtSPQcmwpuco3eUQ9Z1daBCtM4wklf6kGadoWeHHfKw==
X-Received: by 2002:a2e:b707:0:b0:2c8:8b7c:c77a with SMTP id
 j7-20020a2eb707000000b002c88b7cc77amr9686888ljo.24.1701179511189; 
 Tue, 28 Nov 2023 05:51:51 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b0040b349c91acsm18290414wmq.16.2023.11.28.05.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:51:50 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------CvPwMZXt5GpnNO0xFkzxMuvn"
Message-ID: <fdd6d197-2985-4f08-8293-4fddfe48833f@gmail.com>
Date: Tue, 28 Nov 2023 14:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/scheduler: improve GPU scheduler documentation v2
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, ltuikov89@gmail.com, daniel@ffwll.ch
References: <20231116141547.206695-1-christian.koenig@amd.com>
 <ZVaWVH+mX+PXKqfD@pollux>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZVaWVH+mX+PXKqfD@pollux>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------CvPwMZXt5GpnNO0xFkzxMuvn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.11.23 um 23:23 schrieb Danilo Krummrich:
> [SNIP]
>> + *
>> + * The lifetime of the scheduler is managed by the driver using it. Before
>> + * destroying the scheduler the driver must ensure that all hardware processing
>> + * involving this scheduler object has finished by calling for example
>> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
>> + * since this doesn't guarantee that all callback processing has finished.
> This is the part I'm most concerned about, since I feel like we leave drivers
> "up in the air" entirely. Hence, I think here we need to be more verbose and
> detailed about the options drivers have to ensure that.
>
> For instance, let's assume we have the single-entity-per-scheduler topology
> because the driver only uses the GPU scheduler to feed a firmware scheduler with
> dynamically allocated ring buffers.
>
> In this case the entity, scheduler and ring buffer are bound to the lifetime of
> a userspace process.
>
> What do we expect the driver to do if the userspace process is killed? As you
> mentioned, only waiting for the ring to be idle (which implies all HW fences
> are signalled) is not enough. This doesn't guarantee all the free_job()
> callbacks have been called yet and hence stopping the scheduler before the
> pending_list is actually empty would leak the memory of the jobs on the
> pending_list waiting to be freed.
>
> I already brought this up when we were discussing Matt's Xe inspired scheduler
> patch series and it seems there was no interest to provide drivers with some
> common mechanism that gurantees that the pending_list is empty. Hence, I really
> think we should at least give recommendations how drivers should deal with that.

I put this work on hold to have time looking deeper into this and trying 
to find alternative ways for the handling.

I think this is another good reason why the scheduler should really not 
be involved in freeing jobs, but let's first discuss another issue with 
this.

It goes far down into the underlying dma_fence mechanism which gives you 
guarantees that hardware operations have finished, but not that the 
associated software callbacks are done.

So what happens is that components like the scheduler can't just wait 
for dma_fences to be sure that a registered callback are not executed on 
another CPU.

See this patch here for another example where this totally bites us in 
drivers, completely independent of the GPU scheduler:

commit 7c703a7d3f2b50a6187267420a4d3d7e62fa3206
Author: xinhui pan <xinhui.pan@amd.com>
Date:   Tue Apr 12 19:52:16 2022 +0800

     drm/amdgpu: Fix one use-after-free of VM

Basically the solution amdgpu came up with is to take and drop the 
spinlock of the underlying dma_fence context:

/* Make sure that all fence callbacks have completed */
spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);

But this is just a hack only works because amdgpu knows the internals of 
his own dma_fence implementation.

For the scheduler this is not applicable. I've mentioned this problem to 
Daniel before, but at least at this time he thought that this is a 
complete driver problem.

Ideas?

Regards,
Christian.

--------------CvPwMZXt5GpnNO0xFkzxMuvn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 16.11.23 um 23:23 schrieb Danilo Krummrich:<br>
    <blockquote type="cite" cite="mid:ZVaWVH+mX+PXKqfD@pollux">[SNIP]<span
      style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ *
+ * The lifetime of the scheduler is managed by the driver using it. Before
+ * destroying the scheduler the driver must ensure that all hardware processing
+ * involving this scheduler object has finished by calling for example
+ * disable_irq(). It is *not* sufficient to wait for the hardware fence here
+ * since this doesn't guarantee that all callback processing has finished.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is the part I'm most concerned about, since I feel like we leave drivers
"up in the air" entirely. Hence, I think here we need to be more verbose and
detailed about the options drivers have to ensure that.

For instance, let's assume we have the single-entity-per-scheduler topology
because the driver only uses the GPU scheduler to feed a firmware scheduler with
dynamically allocated ring buffers.

In this case the entity, scheduler and ring buffer are bound to the lifetime of
a userspace process.

What do we expect the driver to do if the userspace process is killed? As you
mentioned, only waiting for the ring to be idle (which implies all HW fences
are signalled) is not enough. This doesn't guarantee all the free_job()
callbacks have been called yet and hence stopping the scheduler before the
pending_list is actually empty would leak the memory of the jobs on the
pending_list waiting to be freed.

I already brought this up when we were discussing Matt's Xe inspired scheduler
patch series and it seems there was no interest to provide drivers with some
common mechanism that gurantees that the pending_list is empty. Hence, I really
think we should at least give recommendations how drivers should deal with that.
</pre>
    </blockquote>
    <br>
    I put this work on hold to have time looking deeper into this and
    trying to find alternative ways for the handling.<br>
    <br>
    I think this is another good reason why the scheduler should really
    not be involved in freeing jobs, but let's first discuss another
    issue with this.<br>
    <br>
    It goes far down into the underlying dma_fence mechanism which gives
    you guarantees that hardware operations have finished, but not that
    the associated software callbacks are done.<br>
    <br>
    So what happens is that components like the scheduler can't just
    wait for dma_fences to be sure that a registered callback are not
    executed on another CPU.<br>
    <br>
    See this patch here for another example where this totally bites us
    in drivers, completely independent of the GPU scheduler:<br>
    <br>
    commit 7c703a7d3f2b50a6187267420a4d3d7e62fa3206<br>
    Author: xinhui pan <a class="moz-txt-link-rfc2396E" href="mailto:xinhui.pan@amd.com">&lt;xinhui.pan@amd.com&gt;</a><br>
    Date:   Tue Apr 12 19:52:16 2022 +0800<br>
    <br>
        drm/amdgpu: Fix one use-after-free of VM<br>
    <br>
    Basically the solution amdgpu came up with is to take and drop the
    spinlock of the underlying dma_fence context:<br>
    <br>
    /* Make sure that all fence callbacks have completed */<br>
    spin_lock_irqsave(vm-&gt;last_tlb_flush-&gt;lock, flags);<br>
    spin_unlock_irqrestore(vm-&gt;last_tlb_flush-&gt;lock, flags);<br>
    <br>
    But this is just a hack only works because amdgpu knows the
    internals of his own dma_fence implementation.<br>
    <br>
    For the scheduler this is not applicable. I've mentioned this
    problem to Daniel before, but at least at this time he thought that
    this is a complete driver problem.<br>
    <br>
    Ideas?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
  </body>
</html>

--------------CvPwMZXt5GpnNO0xFkzxMuvn--
