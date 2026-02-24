Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMrjI5C7nWklRgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:54:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB9188B5F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759CF10E0D4;
	Tue, 24 Feb 2026 14:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ddfmtwxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2776D10E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GgcHX1cOIqb58qRUaa6Q0LmLzgjQD+yRE6C4ZlpIOE0=; b=DdfmtwxhJwHi7k9snx5Tz8DEyl
 vOAvmVlMfqQEZ3w5rI1o3LIPFHxkOb+u8w2IsQwHmF/u9PB/GEz/Sin6wO4u93tEclgZ0T++RvTDH
 YQ3JuVrhQV2hZVMebIXZx1hPxCT4PuufDeRuP6wsZ0oCxJFm//6v/2jKS5g0gpfAn7ZzBZHH8ySQK
 no35tMsikk9jBtru9mhaP5fLJG4ENLFfmJmYRihpF9ycMEaa7hK8PmVWqqZ/YwpSGfQGpYr/4zYKw
 6dxjOzNS+ozSRFXhz3FRNtzzzKmC2SlOXGEql+O9yVkYMgPZTZqKwByyMy/+7eiKnyNbWuUa9uZPJ
 Jl+IWtDw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vutnS-004o3y-Dn; Tue, 24 Feb 2026 15:53:58 +0100
Message-ID: <9c6710a6-e286-4480-8aa1-17b9a6fc8bd8@igalia.com>
Date: Tue, 24 Feb 2026 14:53:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On kernel interfaces for a GPU top
To: "Francis, David" <David.Francis@amd.com>,
 list DRI developers Maling <dri-devel@lists.freedesktop.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Airlie Dave <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SA1PR12MB8144E40D472D0255813AF4B8EF77A@SA1PR12MB8144.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <SA1PR12MB8144E40D472D0255813AF4B8EF77A@SA1PR12MB8144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:David.Francis@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDBB9188B5F
X-Rspamd-Action: no action


On 23/02/2026 19:19, Francis, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> We would like to have a GPU equivalent of top; some program that can 
> efficiently get a list of processes using the GPU (or other drm driver) 
> and some basic usage statistics for those processes.
> We would like this program to be usable by processes with no particular 
> privileges, in particular processes without ptrace permissions on the 
> other processes using the GPU (which are needed for fdinfo).
> There are two main problems
> 1: There's no way for an unprivileged process to get this kind of data. 
> There's fdinfo and debugfs, which can contain process-specific data, but 
> aren't accessible without privileges. There's drm sysfs, which can be 
> accessed by anyone (at least parially) but can't contain process- 
> specific data.

Just my 2c.

I think a fair number of interested parties wants this but so far no one 
proposed exactly what and where to put it. It would be interesting to 
hear what proposal you have in mind.

> 2: There's no efficient way for any process to easily get a list of 
> which processes are using the GPU. This information is available by 
> looking through the fdinfo entries for every process, but that's slow. 
> drm drivers can track which process created a fd on the device file, and 

Lets call this 2a). Yep, this too is a long standing issue. It would be 
nice to tie 1+2a) into a solution.

> which process last called an ioctl on an fd, but the process that 
> actually holds the fd might be neither of those. (e.g. X server opens a 
> drm driver, starts some queues, then forks, handing the fd to a child 
> process that then submits to the queues but never does any more ioctls)

This is 2b) right?

What do you mean by "actually _holds_"? The actual most recent ioctl 
user? This is already tracked in the DRM core. See drm_file_update_pid() 
and it's caller. Used from debugfs, error logging, error capture from at 
least some drivers. So those one will already have the "real" fd user 
info displayed correctly.

How to tie that with the new 1+2a) interface is the question.

Regards,

Tvrtko

> As a solution for problem 1, we have as a possible idea making some 
> fdinfo entries accessible without ptrace priviliges; I would like to 
> know if there are any immediate objections to that.
> 
> As for problem 2, I really don't know what kind of interface would be 
> accessible and am open to ideas.
> 
> Thanks,
> David Francis

