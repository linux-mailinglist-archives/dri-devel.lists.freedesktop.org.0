Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMhVHJs5gGmn4wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 06:43:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA30C85B3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 06:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF4B10E0FD;
	Mon,  2 Feb 2026 05:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Gdq29vuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E4310E0FD;
 Mon,  2 Feb 2026 05:43:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------BFwfWzW7wgNI1JJQBKWrLIAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1770011023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N97wOwEAbbJCrf21efEQKpbTJGy5t4zfNwXrfTbc0Vo=;
 b=Gdq29vuBY4cmqNxfLjPD0z5eKjyeGcqIBrAqDQjILht5zX8s1OpT7Pju7Eb26hVbVSlcn/
 896CX4z+Avdubqefb8t+P1ZQX6zNqpZdP/+N8A4scq3nO7ua/VUUbYP3onOdnFTC2M6RmZ
 QnBV/zebhTPVCD+jESTXloMtEQLW7eM=
Message-ID: <4f54e88e-7881-1072-1eea-99ae30a998a1@linux.dev>
Date: Mon, 2 Feb 2026 13:42:45 +0800
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
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
 <aXxqrD3ZzK_dTAmb@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: sunliming <sunliming@linux.dev>
In-Reply-To: <aXxqrD3ZzK_dTAmb@stanley.mountain>
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sunliming@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kylinos.cn:email,linux.dev:email,linux.dev:dkim,linux.dev:mid,intel.com:email]
X-Rspamd-Queue-Id: 0FA30C85B3
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------BFwfWzW7wgNI1JJQBKWrLIAJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/1/30 16:24, Dan Carpenter wrote:
> On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
>> On 2026/1/29 15:07, Dan Carpenter wrote:
>>> On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev   wrote:
>>>> From: sunliming<sunliming@kylinos.cn>
>>>>
>>>> Fix below smatch warnings:
>>>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
>>>> warn: variable dereferenced before check 'ctx' (see line 159)
>>>>
>>>> Reported-by: kernel test robot<lkp@intel.com>
>>>> Reported-by: Dan Carpenter<error27@gmail.com>
>>>> Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
>>>> Signed-off-by: sunliming<sunliming@kylinos.cn>
>>>> ---
>> Previously, a maintainer suggested that the name should match the email
>> address,
>>
> Yes.  But normally people change their email address instead of their
> name.
>
>> but community patches have consistently used the name "sunliming" since
>> then.
>>
> Consistency is less important than being correct...  It's just a weird
> thing to say.  Are there other non-community patches with a different
> name?  It's fine if that's your legal name and we have made exceptions
> for people who aren't able to share their real name because of stalking
> or whatever...

I have no non-community patches using any other name, and the accounts in

other systems at my employer also use this name. Thanks.

> regards,
> dan carpenter
>
--------------BFwfWzW7wgNI1JJQBKWrLIAJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026/1/30 16:24, Dan Carpenter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aXxqrD3ZzK_dTAmb@stanley.mountain">
      <pre class="moz-quote-pre" wrap="">On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2026/1/29 15:07, Dan Carpenter wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Jan 29, 2026 at 10:49:19AM +0800,<a class="moz-txt-link-abbreviated" href="mailto:sunliming@linux.dev">sunliming@linux.dev</a>  wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: sunliming<a class="moz-txt-link-rfc2396E" href="mailto:sunliming@kylinos.cn">&lt;sunliming@kylinos.cn&gt;</a>

Fix below smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
warn: variable dereferenced before check 'ctx' (see line 159)

Reported-by: kernel test robot<a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>
Reported-by: Dan Carpenter<a class="moz-txt-link-rfc2396E" href="mailto:error27@gmail.com">&lt;error27@gmail.com&gt;</a>
Closes:<a class="moz-txt-link-freetext" href="https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/">https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/</a>
Signed-off-by: sunliming<a class="moz-txt-link-rfc2396E" href="mailto:sunliming@kylinos.cn">&lt;sunliming@kylinos.cn&gt;</a>
---
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Previously, a maintainer suggested that the name should match the email
address,

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.  But normally people change their email address instead of their
name.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">but community patches have consistently used the name "sunliming" since
then.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Consistency is less important than being correct...  It's just a weird
thing to say.  Are there other non-community patches with a different
name?  It's fine if that's your legal name and we have made exceptions
for people who aren't able to share their real name because of stalking
or whatever...
</pre>
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
        !important; float: none;">I have no non-community patches using
        any other name, and the accounts in <br>
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
        !important; float: none;">other systems at my employer also use
        this name. Thanks.<br>
      </span></p>
    <blockquote type="cite" cite="mid:aXxqrD3ZzK_dTAmb@stanley.mountain">
      <pre class="moz-quote-pre" wrap="">
regards,
dan carpenter

</pre>
    </blockquote>
  </body>
</html>

--------------BFwfWzW7wgNI1JJQBKWrLIAJ--
