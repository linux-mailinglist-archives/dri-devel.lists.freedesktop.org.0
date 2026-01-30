Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAPtMz5CfGltLgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:31:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26446B7522
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 06:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15F10E0A8;
	Fri, 30 Jan 2026 05:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="weB45yk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9A710E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 05:31:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------oq8eV9guKMS4ahLz4wiNoGjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1769751092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kgcMP96ORjuUDoof7NRU6R5gUZCWfu368gPBoEpEbU=;
 b=weB45yk79BRQpTg7hEi9tZ2dK14lKXRQYp0ZHadVi+13IT1GjQSBamiaRmevrR+IhGkTUR
 xywW3fdw/mLbdD4ZUoBvo0GqJ2Zt+6s/TD8A4GFBbukdlF1vpotxqcv7zEmYid58Z8931G
 2NMCRRPZeNqZni5XN7UPMrlzPON0uak=
Message-ID: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
Date: Fri, 30 Jan 2026 13:30:35 +0800
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: sunliming <sunliming@linux.dev>
In-Reply-To: <aXsHSTHHP0eyI-Pk@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sunliming@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunliming@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 26446B7522
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------oq8eV9guKMS4ahLz4wiNoGjd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/1/29 15:07, Dan Carpenter wrote:
> On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
>> From: sunliming<sunliming@kylinos.cn>
>>
>> Fix below smatch warnings:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
>> warn: variable dereferenced before check 'ctx' (see line 159)
>>
>> Reported-by: kernel test robot<lkp@intel.com>
>> Reported-by: Dan Carpenter<error27@gmail.com>
>> Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
>> Signed-off-by: sunliming<sunliming@kylinos.cn>
>> ---

Previously, a maintainer suggested that the name should match the email 
address,

but community patches have consistently used the name "sunliming" since 
then.

>> Could you capitalize your name?  It's supposed to be a bit formal like
>> signing a legal document.
>>
>> This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
>> your email so now you have to send the exact same email again.
>>
>> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
Get it. thanks.
>> regards,
>> dan carpenter
>>
--------------oq8eV9guKMS4ahLz4wiNoGjd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026/1/29 15:07, Dan Carpenter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aXsHSTHHP0eyI-Pk@stanley.mountain">
      <pre class="moz-quote-pre" wrap="">On Thu, Jan 29, 2026 at 10:49:19AM +0800, <a class="moz-txt-link-abbreviated" href="mailto:sunliming@linux.dev">sunliming@linux.dev</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: sunliming <a class="moz-txt-link-rfc2396E" href="mailto:sunliming@kylinos.cn">&lt;sunliming@kylinos.cn&gt;</a>

Fix below smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
warn: variable dereferenced before check 'ctx' (see line 159)

Reported-by: kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>
Reported-by: Dan Carpenter <a class="moz-txt-link-rfc2396E" href="mailto:error27@gmail.com">&lt;error27@gmail.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/">https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/</a>
Signed-off-by: sunliming <a class="moz-txt-link-rfc2396E" href="mailto:sunliming@kylinos.cn">&lt;sunliming@kylinos.cn&gt;</a>
---
</pre>
      </blockquote>
    </blockquote>
    <p><span style="color: rgb(15, 17, 21); font-family:
        quote-cjk-patch, Inter, system-ui, -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen,
        Ubuntu, Cantarell, &quot;Open Sans&quot;, &quot;Helvetica
        Neue&quot;, sans-serif; font-size: 16px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Previously, a maintainer suggested
        that the name should match the email address, <br>
      </span></p>
    <p><span style="color: rgb(15, 17, 21); font-family:
        quote-cjk-patch, Inter, system-ui, -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen,
        Ubuntu, Cantarell, &quot;Open Sans&quot;, &quot;Helvetica
        Neue&quot;, sans-serif; font-size: 16px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">but community patches have
        consistently used the name "sunliming" since then.</span></p>
    <blockquote type="cite" cite="mid:aXsHSTHHP0eyI-Pk@stanley.mountain">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Could you capitalize your name?  It's supposed to be a bit formal like
signing a legal document.

This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
your email so now you have to send the exact same email again.

<a class="moz-txt-link-freetext" href="https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/">https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/</a></pre>
      </blockquote>
    </blockquote>
    Get it. thanks.<br>
    <blockquote type="cite" cite="mid:aXsHSTHHP0eyI-Pk@stanley.mountain">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
regards,
dan carpenter

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------oq8eV9guKMS4ahLz4wiNoGjd--
