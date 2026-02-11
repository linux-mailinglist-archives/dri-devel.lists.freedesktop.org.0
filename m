Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OOGKcahjWlh5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894B12BFFE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E633910E713;
	Thu, 12 Feb 2026 09:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="HYmWklKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134E910E09C;
 Wed, 11 Feb 2026 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1770803495; bh=GPEd3AcN6iVzlRw+Kle3fccKCj1fCI9T1lisKAy8J7Q=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=HYmWklKbw/2c3y1kZ6I/wDpVHZifaWclnH/izfbO63F7ye0aU51LQiS2r1JNWAE5V
 DVekasQ2sH7PXFfRHdL/nazOVXBmQBWiK2yX8WcHDd7jZj2H3DhvWczc/kwTDGYogy
 K1wLg1Xmh18XqI7xnAsxMhDRpZPMjNx58LhemBnphPjugcLtXK3vJQFPE/80/wXgG6
 crZlrKT+EWBi5mylwVfmmxRsKq+rIugQiRFODrJJcx4vtB2XmZGdEzsQvFws6VljTU
 mKPvGvTnO6WLtf54SYGS+Ov7DfSLxA3F47Q0bSJJ+Fb7HOPZxim2F3jQGcBcwdRE7k
 su8MyLX2XSULA==
Content-Type: multipart/alternative;
 boundary="------------6FsO4dYxBDEWOF34o0Q0xAlt"
Message-ID: <1aa30dee-dac9-4485-a196-9c9fc5517e66@m1k.cloud>
Date: Wed, 11 Feb 2026 10:51:34 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: add module param to disable immediate
 vblank off
To: Greg KH <gregkh@linuxfoundation.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com,
 Rodrigo.Siqueira@igalia.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 stable@vger.kernel.org
References: <20260211074529.131290-1-sysdadmin@m1k.cloud>
 <2026021146-mockup-pushup-5f47@gregkh>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <2026021146-mockup-pushup-5f47@gregkh>
X-Mailman-Approved-At: Thu, 12 Feb 2026 09:47:42 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[m1k.cloud:+]
X-Rspamd-Queue-Id: 3894B12BFFE
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------6FsO4dYxBDEWOF34o0Q0xAlt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the feedback. The AMD display subsystem developer had agreed 
to this approach as a temporary workaround while the underlying locking 
fix is being developed, but I understand the policy against new module 
parameters. I'll defer to the AMD team to submit the proper fix.

Apologies for the incorrect stable process - first time submitting upstream

On 2/11/26 10:19, Greg KH wrote:
> On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
>> Add amdgpu.no_vblank_immediate parameter to optionally disable the
>> immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
>> a 2-frame offdelay is used instead, matching the behavior used for
>> older hardware and DGPUs.
> Please no more module parameters, this is not the 1990's with only one
> one device in the system.  Please fix this the proper way.
>
> Also, this isn't the correct way to submit patches to stable.
>
> thanks,
>
> greg k-h

--------------6FsO4dYxBDEWOF34o0Q0xAlt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="2" face="Open Sans">Thanks for the feedback. The AMD
      display subsystem developer had agreed to this approach as a
      temporary workaround while the underlying locking fix is being
      developed, but I understand the policy against new module
      parameters. I'll defer to the AMD team to submit the proper fix.<br>
      <br>
      Apologies for the incorrect stable process - first time submitting
      upstream</font><br>
    <br>
    <div class="moz-cite-prefix">On 2/11/26 10:19, Greg KH wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2026021146-mockup-pushup-5f47@gregkh">
      <pre wrap="" class="moz-quote-pre">On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add amdgpu.no_vblank_immediate parameter to optionally disable the
immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
a 2-frame offdelay is used instead, matching the behavior used for
older hardware and DGPUs.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please no more module parameters, this is not the 1990's with only one
one device in the system.  Please fix this the proper way.

Also, this isn't the correct way to submit patches to stable.

thanks,

greg k-h
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------6FsO4dYxBDEWOF34o0Q0xAlt--
