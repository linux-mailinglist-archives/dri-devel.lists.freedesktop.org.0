Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489DB33B3F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 11:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917B110E362;
	Mon, 25 Aug 2025 09:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGR/q8D5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39E510E362;
 Mon, 25 Aug 2025 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756114718; x=1787650718;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=9sqntHVgKVUiqoLrmQFTfaTHpDlYCnY6dmjYlHnWwU8=;
 b=mGR/q8D5oBzSbEdAq98uqBYM7L2+p4Z/hP7djYtJwSFLB3CCwblvKaDy
 yfHdhCFbKHKu/4hgrhkelR3uovzHIKCjAFL7rVemKf4hmeTjP8TySsFAg
 SvczpX8Uvqp18i9gTxjNjNeEvolMSNTJ3LJFe6RJ3FLsPPLwRVpjjxcwW
 2H7Sa3p61G8tAbddev1y6SBq8VtwBuUF/orntOoVX+Y7vC8mm75PZ4u8C
 20CTUzMHAplbENzRR+6vzFroV1p9OYirP/t61029kmX9tnTt6RBr8NqbS
 sa93QpWX5+gKBu8Oj9pz0K+97pmeiLj/pGVigDDhSlh2JWwrpGODLxksg g==;
X-CSE-ConnectionGUID: +4blEptgSKiBJywsp8LNIQ==
X-CSE-MsgGUID: v0cJkQ9yQG+Up62e7hpiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75918930"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="75918930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:38:37 -0700
X-CSE-ConnectionGUID: 9GFYt7SsQt+O8wij9n0+3w==
X-CSE-MsgGUID: /uAJH7wmT++ZWW+jxh7i4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
 d="scan'208,217";a="206419585"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.233.114])
 ([10.247.233.114])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:38:33 -0700
Content-Type: multipart/alternative;
 boundary="------------rb531RoTw5PjgCelrrq1O90Z"
Message-ID: <08d8482e-d86b-45a5-8931-39556188cbeb@linux.intel.com>
Date: Mon, 25 Aug 2025 15:08:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across
 drm subsystem
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <aJzzr-ZuJCrd8r7x@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aJzzr-ZuJCrd8r7x@intel.com>
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

This is a multi-part message in MIME format.
--------------rb531RoTw5PjgCelrrq1O90Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 14-08-2025 01:51, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
>> Revisiting this patch series to address pending feedback and help move
>> the discussion towards a conclusion. This revision includes updates
>> based on previous comments[1] and aims to clarify outstanding concerns.
>> Specifically added command to facility reporting errors from IP blocks
>> to support AMDGPU driver model of RAS.
>> [1]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
>>
>> I sincerely appreciate everyones patience and thoughtful reviews so
>> far, and I hope this refreshed series facilitates the final evaluation
>> and acceptance.
>>
>> Please feel free to share any further suggestions or questions.
>>
>> Thank you for your continued consideration.
>> ----------------------------------------------------------------------
>>
>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>> reporting the errors to the host, which the KMD processes and exposes a
>> set of error counters which can be used by observability tools to take 
>> corrective actions or repairs. Traditionally there were being exposed 
>> via PMU (for relative counters) and sysfs interface (for absolute 
>> value) in our internal branch. But, due to the limitations in this 
>> approach to use two interfaces and also not able to have an event based 
>> reporting or configurability, an alternative approach to try netlink 
>> was suggested by community for drm subsystem wide UAPI for RAS and 
>> telemetry as discussed in [2]. 
>>
>> This [2] is the inspiration to this series. It uses the generic
>> netlink(genl) family subsystem and exposes a set of commands that can
>> be used by every drm driver, the framework provides a means to have
>> custom commands too. Each drm driver instance in this example xe driver
>> instance registers a family and operations to the genl subsystem through
>> which it enumerates and reports the error counters. An event based
>> notification is also supported to which userpace can subscribe to and
>> be notified when any error occurs and read the error counter this avoids
>> continuous polling on error counter. This can also be extended to
>> threshold based notification.
>>
>> [2]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> I'm bringing some thoughts below and I'd like to get inputs from folks involved
> in the original discussions here please.
> Any thought is welcomed so we can move faster towards a real GPU standard RAS
> solution.
>
>> This series is on top [3] series which introduces error counting infra in Xe
>> driver.
>> [3]: https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/
>>
>> V5:
>> Add support to read error corresponding to an IP BLOCK
> I honestly don't believe that this version solves all the concerns raised by
> AMD folks in the previous reviews. It is true that this is bringing ways of
> reading errors per IP block, but if I understood them correctly, they would
> like better (and separate) ways to declare and handle the errors coming from
> different IP block, rather than simply reading/querying for them filtered out.
>
> So, I have som grouping ideas below.

As per the comment from Lijo,
https://lore.kernel.org/all/aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com/

the errors are grouped per bitmask, they are not expecting a separation
at netlink level.

<31:24> = Block Id
<23:16> subblock id
<15:8> - interested instance
<7:0> - error_type

The interface should  support errors per IP block and instance, which
the current series support via DRM_RAS_CMD_READ_BLOCK.
when driver receives the command DRM_RAS_CMD_READ_BLOCK it is supposed
to decipher the bits based on the above bitsmask.
The query command is expected to list the blocks and instances
available, the counters of which will be read via DRM_RAS_CMD_READ_BLOCK.
>
>> v4:
>> 1. Rebase
>> 2. rename drm_genl_send to drm_genl_reply
> But before going to the ideas below I'd like to also raise the naming issue
> that I see with this proposal.
>
> I was recently running some experiments to devlink with this and similar
> cases. I don't believe that devlink is a good fit for our drm-ras. It is
> way too much centric on network devices and any addition there to our
> GPU RAS would be a heavy lift. But, there are some good things from there
> that we could perhaps get inspiration from.
>
> Starting from the name. devlink is the name of the tool and the name
> of the framework. It uses netlink on the back, but totally abstracting
> that. Here in this version we can see:
> drm_ras: the tool
> drm_netlink: the abstraction
> drm_genl_*: the wrapper?
>
> So, I believe that as devlink we should have a single name for everything
> and avoid wrappers but providing the real module registration, with
> groups, and functions. Entirely abstracting the netlink and focusing
> on the RAS functionalities.
sounds interesting and I feel it looks clean too. But that does mean we
completely handle
the netlink framework inside the drm layer and not at the driver and
expose callback ops to
drm drivers.

Thanks,
Aravind.

--------------rb531RoTw5PjgCelrrq1O90Z
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
    <div class="moz-cite-prefix">On 14-08-2025 01:51, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aJzzr-ZuJCrd8r7x@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, Jul 30, 2025 at 12:19:51PM +0530, Aravind Iddamsetty wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Revisiting this patch series to address pending feedback and help move
the discussion towards a conclusion. This revision includes updates
based on previous comments[1] and aims to clarify outstanding concerns.
Specifically added command to facility reporting errors from IP blocks
to support AMDGPU driver model of RAS.
[1]: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/">https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/</a>

I sincerely appreciate everyones patience and thoughtful reviews so
far, and I hope this refreshed series facilitates the final evaluation
and acceptance.

Please feel free to share any further suggestions or questions.

Thank you for your continued consideration.
----------------------------------------------------------------------

Our hardware supports RAS(Reliability, Availability, Serviceability) by
reporting the errors to the host, which the KMD processes and exposes a
set of error counters which can be used by observability tools to take 
corrective actions or repairs. Traditionally there were being exposed 
via PMU (for relative counters) and sysfs interface (for absolute 
value) in our internal branch. But, due to the limitations in this 
approach to use two interfaces and also not able to have an event based 
reporting or configurability, an alternative approach to try netlink 
was suggested by community for drm subsystem wide UAPI for RAS and 
telemetry as discussed in [2]. 

This [2] is the inspiration to this series. It uses the generic
netlink(genl) family subsystem and exposes a set of commands that can
be used by every drm driver, the framework provides a means to have
custom commands too. Each drm driver instance in this example xe driver
instance registers a family and operations to the genl subsystem through
which it enumerates and reports the error counters. An event based
notification is also supported to which userpace can subscribe to and
be notified when any error occurs and read the error counter this avoids
continuous polling on error counter. This can also be extended to
threshold based notification.

[2]: <a class="moz-txt-link-freetext" href="https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html">https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm bringing some thoughts below and I'd like to get inputs from folks involved
in the original discussions here please.
Any thought is welcomed so we can move faster towards a real GPU standard RAS
solution.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
This series is on top [3] series which introduces error counting infra in Xe
driver.
[3]: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/">https://lore.kernel.org/all/20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com/</a>

V5:
Add support to read error corresponding to an IP BLOCK
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I honestly don't believe that this version solves all the concerns raised by
AMD folks in the previous reviews. It is true that this is bringing ways of
reading errors per IP block, but if I understood them correctly, they would
like better (and separate) ways to declare and handle the errors coming from
different IP block, rather than simply reading/querying for them filtered out.

So, I have som grouping ideas below.</pre>
    </blockquote>
    <p>As per the comment from Lijo,
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com/">https://lore.kernel.org/all/aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com/</a></p>
    <p>the errors are grouped per bitmask, they are not expecting a
      separation at netlink level.</p>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&lt;31:24&gt; = Block Id
&lt;23:16&gt; subblock id
&lt;15:8&gt; - interested instance
&lt;7:0&gt; - error_type</pre>
    The interface should  support errors per IP block and instance,
    which the current series support via DRM_RAS_CMD_READ_BLOCK.<br>
    when driver receives the command DRM_RAS_CMD_READ_BLOCK it is
    supposed to decipher the bits based on the above bitsmask.<br>
    The query command is expected to list the blocks and instances
    available, the counters of which will be read via
    DRM_RAS_CMD_READ_BLOCK.
    <blockquote type="cite" cite="mid:aJzzr-ZuJCrd8r7x@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
v4:
1. Rebase
2. rename drm_genl_send to drm_genl_reply
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But before going to the ideas below I'd like to also raise the naming issue
that I see with this proposal.

I was recently running some experiments to devlink with this and similar
cases. I don't believe that devlink is a good fit for our drm-ras. It is
way too much centric on network devices and any addition there to our
GPU RAS would be a heavy lift. But, there are some good things from there
that we could perhaps get inspiration from.

Starting from the name. devlink is the name of the tool and the name
of the framework. It uses netlink on the back, but totally abstracting
that. Here in this version we can see:
drm_ras: the tool
drm_netlink: the abstraction
drm_genl_*: the wrapper?</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:aJzzr-ZuJCrd8r7x@intel.com">
      <pre wrap="" class="moz-quote-pre">

So, I believe that as devlink we should have a single name for everything
and avoid wrappers but providing the real module registration, with
groups, and functions. Entirely abstracting the netlink and focusing
on the RAS functionalities.</pre>
    </blockquote>
    sounds interesting and I feel it looks clean too. But that does mean
    we completely handle<br>
    the netlink framework inside the drm layer and not at the driver and
    expose callback ops to<br>
    drm drivers.<br>
    <br>
    Thanks,<br>
    Aravind.<br>
    <br>
  </body>
</html>

--------------rb531RoTw5PjgCelrrq1O90Z--
